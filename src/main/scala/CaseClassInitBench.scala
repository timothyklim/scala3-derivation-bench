package bench

import java.util
import java.util.concurrent.TimeUnit.MILLISECONDS

import scala.compiletime.*
import scala.deriving.*
import scala.quoted.*

import org.openjdk.jmh.annotations.{Scope, State, *}

private inline def arrayProduct[A](inline arr: Array[A]): Product = new Product {
  override def canEqual(that: Any) = true
  override def productArity = arr.size
  override def productElement(n: Int) = arr(n)
}

final class State(i: Int):
  private val xs = Array[Any](i, i + 2, i.toString, i.toLong, i.toString)

  def get[T](pos: Int): T = xs(pos).asInstanceOf[T]

final case class A(f1: Int, f2: Int, f3: String, f4: Long, f5: String)

object Macros:
  inline def decode[T](inline state: State)(using m: Mirror.ProductOf[T]): T =
    inline val size = constValue[Tuple.Size[m.MirroredElemTypes]]
    inline if size == 0 then m.fromProduct(EmptyTuple)
    else
      val elems = Array.ofDim[Any](size)
      decodeTuple[m.MirroredElemTypes](state, pos = 0, elems)
      m.fromProduct(arrayProduct(elems))

  private inline def decodeTuple[T <: Tuple](inline state: State, pos: Int, elems: Array[Any]): Array[Any] =
    inline erasedValue[T] match
      case _: (hd *: tl) =>
        elems.update(pos, state.get[hd](pos = pos))
        decodeTuple[tl](state, pos = pos + 1, elems)
      case _: EmptyTuple => elems

class CaseClassInitBench:
  @Benchmark
  @BenchmarkMode(Array(Mode.SingleShotTime, Mode.Throughput))
  @OutputTimeUnit(MILLISECONDS)
  def plainTest(): Unit =
    var i = 0
    while i < 128 do
      val state = new State(i)
      A(f1 = state.get(0), f2 = state.get(1), f3 = state.get(2), f4 = state.get(3), f5 = state.get(4))
      i += 1

  @Benchmark
  @BenchmarkMode(Array(Mode.SingleShotTime, Mode.Throughput))
  @OutputTimeUnit(MILLISECONDS)
  def macrosTest(): Unit =
    var i = 0
    while i < 128 do
      Macros.decode[A](new State(i))
      i += 1
