part of mvc_example.controllers;

@Controller('/api/examples/v1')
class ExamplesServices {

  @GetJson('/:exampleId')
  Future<Example> getExample(String exampleId) async {
    //Do some logic to get a real example
    var example = new Example()
      ..title = "Example"
      ..description = "Some random example"
      ..exampleId = exampleId;

    return example;
  }

  @DefaultPostJson()
  Future<Example> newExample(@DecodeForm Example example) async {
    //Do something with example
    return example..exampleId = '98u4r90ppd';
  }

  @PutJson('/:exampleId')
  Future<Example> updateExample(
      String exampleId, @DecodeAny Example delta) async {
    //Update example with id 'exampleId' using change information
    return delta..exampleId = '98u4r90ppd';
  }

  @DeleteJson('/:exampleId')
  Future deleteExample(String exampleId) async {
    //Do something to delete example
    return "$exampleId deleted";
  }

  @DefaultGetJson()
  Future<List<Example>> allExamples() async {
    var example = new Example()
      ..title = "Example"
      ..description = "Some random example"
      ..exampleId = '98u4r90ppd';

    return [example, example, example];
  }
}
