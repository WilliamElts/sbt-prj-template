name := "sample-project"

version := "1.0-SNAPSHOT"

scalaVersion := "2.10.4"

libraryDependencies ++= Seq(
)

resolvers ++= Seq(
  Resolver.mavenLocal
)

mainClass in assembly := Some("Main")

test in assembly := {}

assemblyMergeStrategy in assembly := {
  case x =>
    val oldStrategy = (assemblyMergeStrategy in assembly).value
    oldStrategy(x)
}
