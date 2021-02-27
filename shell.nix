{ pkgs, jdk, sbt }:
with pkgs;
mkShell {
  name = "bench-env";

  buildInputs = [ sbt jdk ];

  shellHook = ''
    export JAVA_HOME=${jdk.home}
    export JAVA_INCLUDE_PATH=${jdk.home}/include
    export JNI_INCLUDE_DIRS=${jdk.home}/include

    export SBT_OPTS="-Xmx16g -Xms8g -Xss16M -XX:MaxMetaspaceSize=4G -server -XX:+UnlockExperimentalVMOptions -XX:+EnableJVMCI -XX:+UseJVMCICompiler"
  '';
}
