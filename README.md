# Run

```
nix develop -c sbt 'jmh:run -i 5 -wi 5 -f1 -t1 -prof gc .*CaseClassInitBench.*'
```

# Result

## Zing 64-Bit Tiered VM, 15.0.2-zing_99.99.99.99.dev-b3392-product-linux-X86_64
```
[info] Benchmark                                                           Mode  Cnt       Score      Error   Units
[info] CaseClassInitBench.macrosTest                                      thrpt    5     214.986 ±    4.224  ops/ms
[info] CaseClassInitBench.macrosTest:·gc.alloc.rate                       thrpt    5    5998.122 ±  117.793  MB/sec
[info] CaseClassInitBench.macrosTest:·gc.alloc.rate.norm                  thrpt    5   30720.000 ±    0.001    B/op
[info] CaseClassInitBench.macrosTest:·gc.churn.CodeCache                  thrpt    5      ≈ 10⁻⁴             MB/sec
[info] CaseClassInitBench.macrosTest:·gc.churn.CodeCache.norm             thrpt    5       0.001 ±    0.009    B/op
[info] CaseClassInitBench.macrosTest:·gc.churn.GenPauseless_New_Gen       thrpt    5    5918.886 ±  304.549  MB/sec
[info] CaseClassInitBench.macrosTest:·gc.churn.GenPauseless_New_Gen.norm  thrpt    5   30313.285 ± 1031.467    B/op
[info] CaseClassInitBench.macrosTest:·gc.churn.GenPauseless_Old_Gen       thrpt    5       1.867 ±   16.071  MB/sec
[info] CaseClassInitBench.macrosTest:·gc.churn.GenPauseless_Old_Gen.norm  thrpt    5       9.505 ±   81.838    B/op
[info] CaseClassInitBench.macrosTest:·gc.count                            thrpt    5     574.000             counts
[info] CaseClassInitBench.macrosTest:·gc.time                             thrpt    5    2579.000                 ms
[info] CaseClassInitBench.plainTest                                       thrpt    5     985.200 ±   10.663  ops/ms
[info] CaseClassInitBench.plainTest:·gc.alloc.rate                        thrpt    5    5497.429 ±   59.622  MB/sec
[info] CaseClassInitBench.plainTest:·gc.alloc.rate.norm                   thrpt    5    6144.000 ±    0.001    B/op
[info] CaseClassInitBench.plainTest:·gc.churn.CodeCache                   thrpt    5      ≈ 10⁻⁴             MB/sec
[info] CaseClassInitBench.plainTest:·gc.churn.CodeCache.norm              thrpt    5      ≈ 10⁻⁴               B/op
[info] CaseClassInitBench.plainTest:·gc.churn.GenPauseless_New_Gen        thrpt    5    5458.883 ±   71.486  MB/sec
[info] CaseClassInitBench.plainTest:·gc.churn.GenPauseless_New_Gen.norm   thrpt    5    6100.934 ±   71.122    B/op
[info] CaseClassInitBench.plainTest:·gc.churn.GenPauseless_Old_Gen        thrpt    5       1.981 ±   17.055  MB/sec
[info] CaseClassInitBench.plainTest:·gc.churn.GenPauseless_Old_Gen.norm   thrpt    5       2.217 ±   19.092    B/op
[info] CaseClassInitBench.plainTest:·gc.count                             thrpt    5     511.000             counts
[info] CaseClassInitBench.plainTest:·gc.time                              thrpt    5    2249.000                 ms
[info] CaseClassInitBench.macrosTest                                         ss    5       0.416 ±    0.312   ms/op
[info] CaseClassInitBench.macrosTest:·gc.alloc.rate                          ss    5       0.350 ±    0.001  MB/sec
[info] CaseClassInitBench.macrosTest:·gc.alloc.rate.norm                     ss    5  183976.000 ±    0.001    B/op
[info] CaseClassInitBench.macrosTest:·gc.count                               ss    5         ≈ 0             counts
[info] CaseClassInitBench.plainTest                                          ss    5       0.345 ±    1.335   ms/op
[info] CaseClassInitBench.plainTest:·gc.alloc.rate                           ss    5       0.075 ±    0.001  MB/sec
[info] CaseClassInitBench.plainTest:·gc.alloc.rate.norm                      ss    5   39464.000 ±    0.001    B/op
[info] CaseClassInitBench.plainTest:·gc.count                                ss    5         ≈ 0             counts
```

## OpenJDK 64-Bit Server VM, 15.0.1+0-adhoc..jdk15u-jdk-15.0.1-ga
```
[info] Benchmark                                                        Mode  Cnt        Score         Error   Units
[info] CaseClassInitBench.macrosTest                                   thrpt    5       51.350 ±       1.831  ops/ms
[info] CaseClassInitBench.macrosTest:·gc.alloc.rate                    thrpt    5     5740.421 ±     203.102  MB/sec
[info] CaseClassInitBench.macrosTest:·gc.alloc.rate.norm               thrpt    5   123088.043 ±      91.886    B/op
[info] CaseClassInitBench.macrosTest:·gc.churn.PS_Eden_Space           thrpt    5     5740.823 ±     208.960  MB/sec
[info] CaseClassInitBench.macrosTest:·gc.churn.PS_Eden_Space.norm      thrpt    5   123096.519 ±     693.198    B/op
[info] CaseClassInitBench.macrosTest:·gc.churn.PS_Survivor_Space       thrpt    5        0.783 ±       0.179  MB/sec
[info] CaseClassInitBench.macrosTest:·gc.churn.PS_Survivor_Space.norm  thrpt    5       16.797 ±       3.955    B/op
[info] CaseClassInitBench.macrosTest:·gc.count                         thrpt    5     2105.000                counts
[info] CaseClassInitBench.macrosTest:·gc.time                          thrpt    5      461.000                    ms
[info] CaseClassInitBench.plainTest                                    thrpt    5      256.087 ±       5.424  ops/ms
[info] CaseClassInitBench.plainTest:·gc.alloc.rate                     thrpt    5     5725.477 ±     119.470  MB/sec
[info] CaseClassInitBench.plainTest:·gc.alloc.rate.norm                thrpt    5    24617.276 ±      16.009    B/op
[info] CaseClassInitBench.plainTest:·gc.churn.PS_Eden_Space            thrpt    5     5727.639 ±     115.782  MB/sec
[info] CaseClassInitBench.plainTest:·gc.churn.PS_Eden_Space.norm       thrpt    5    24626.596 ±      98.131    B/op
[info] CaseClassInitBench.plainTest:·gc.churn.PS_Survivor_Space        thrpt    5        0.402 ±       0.119  MB/sec
[info] CaseClassInitBench.plainTest:·gc.churn.PS_Survivor_Space.norm   thrpt    5        1.730 ±       0.511    B/op
[info] CaseClassInitBench.plainTest:·gc.count                          thrpt    5     2139.000                counts
[info] CaseClassInitBench.plainTest:·gc.time                           thrpt    5      458.000                    ms
[info] CaseClassInitBench.macrosTest                                      ss    5        0.136 ±       0.201   ms/op
[info] CaseClassInitBench.macrosTest:·gc.alloc.rate                       ss    5        2.236 ±       7.092  MB/sec
[info] CaseClassInitBench.macrosTest:·gc.alloc.rate.norm                  ss    5  1173737.600 ± 3722991.991    B/op
[info] CaseClassInitBench.macrosTest:·gc.count                            ss    5          ≈ 0                counts
[info] CaseClassInitBench.plainTest                                       ss    5        0.089 ±       0.051   ms/op
[info] CaseClassInitBench.plainTest:·gc.alloc.rate                        ss    5        0.431 ±       2.373  MB/sec
[info] CaseClassInitBench.plainTest:·gc.alloc.rate.norm                   ss    5   226112.000 ± 1245704.900    B/op
[info] CaseClassInitBench.plainTest:·gc.count                             ss    5          ≈ 0                counts
```
