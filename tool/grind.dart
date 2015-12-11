import 'package:grinder/grinder.dart';

void main(List<String> args) {
  grind(args);
}

@DefaultTask()
void prepush() {
  analyze();
  test();
  format();
}

@Task()
void travis() {
  analyze();
  test();
  testdartfmt();
}

@Task()
void analyze() {
  new PubApp.global('tuneup')..run(['check']);
}

@Task()
void test() {
  new TestRunner().test();
}

@Task('Apply dartfmt to all Dart source files')
void format() {
  DartFmt.format(existingSourceDirs);
}

@Task('Apply dartfmt to all Dart source files')
void testdartfmt() {
  if (DartFmt.dryRun(existingSourceDirs)) {
    throw "dartfmt failure";
  }
}
