part of mvc_example.controllers;

@Controller('/examples')
class ExamplesController {
  ExamplesServices exampleServices;

  ExamplesController(this.exampleServices);

  @DefaultGetView(viewSubPath: '/index')
  Future<List<Example>> index() async {
    var examples =  await exampleServices.allExamples();
    return examples;
  }

  @GetView('/new')
  Future<Example> newExampleForm() async {
    return new Example();
  }

  @Post('/new')
  Future createNewExample(@DecodeForm Example example) async {
    example = await exampleServices.newExample(example);
    return redirect('/examples/${example.exampleId}');
  }

  @GetView('/:exampleId', viewLocalPath: '/view')
  Future<Example> getExample(String exampleId) async {
    return exampleServices.getExample(exampleId);
  }

  @GetView('/:exampleId/edit', viewLocalPath: '/edit')
  editExample(String exampleId) {
    return exampleServices.getExample(exampleId);
  }

  @Post('/:exampleId/edit', viewLocalPath: '/edit')
  saveExample(String exampleId, @DecodeAny Example example) async {
    print(example);
    print(request.body);
    await exampleServices.updateExample(exampleId, example);
    return redirect('/examples/$exampleId');
  }
}
