import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentStep = 0;

  List<Step> mySteps = [
    Step(title: Text("Step 1"), content: Text("Hello Step 01"), isActive: true),
    Step(title: Text("Step 2"), content: Text("Hello Step 02"), isActive: true),
    Step(title: Text("Step 3"), content: Text("Hello Step 03"), isActive: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Wizard App"),
      ),
      body: Container(
        child: Stepper(
          steps: mySteps,
          currentStep: this.currentStep,
          type: StepperType.vertical,
          onStepTapped: (step) {
            setState(() {
              currentStep = step;
            });
            print(step);
          },
          onStepCancel: () {
            if (currentStep > 0) {
              setState(() {
                currentStep -= 1;
              });
            }
            else{
              currentStep = 0;
            }
            print("On Step Cancel "+ currentStep.toString());
          },
          onStepContinue: (){
            setState(() {
              if(currentStep < mySteps.length - 1){
                currentStep = currentStep + 1;
              }
              else{
                currentStep = 0;
              }
            });
            print("onStepContinue "+ currentStep.toString());
          },
        ),
      ),
    );
  }
}
