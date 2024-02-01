import 'package:flutter/material.dart';

enum Gender { male, female }

class BmiCalculatorMaterialPage extends StatefulWidget {
  const BmiCalculatorMaterialPage({super.key});

  @override
  State<BmiCalculatorMaterialPage> createState() =>
      _BmiCalculatorMaterialPageState();
}

class _BmiCalculatorMaterialPageState extends State<BmiCalculatorMaterialPage> {
  final TextEditingController textEditingControllerInputHeightInCms =
      TextEditingController();
  final TextEditingController textEditingControllerInputWeightInKgs =
      TextEditingController();
  Gender? selectedGender;
  double calculatedBmiValue = 0;

  final Color maleColor = Colors.blue;
  final Color femaleColor = Colors.pinkAccent;

  // build function must be short as much as possible because when a state gets change the build function gets triggered

  void computerBmiValue() {
    double? height =
        double.tryParse(textEditingControllerInputHeightInCms.text);
    double? weight =
        double.tryParse(textEditingControllerInputWeightInKgs.text);
    if (height != null && weight != null && height > 0 && weight > 0) {
      setState(
        () {
          calculatedBmiValue = weight / (height / 100 * height / 100);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "BMI Calculator",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    style: TextButton.styleFrom(
                      elevation: 10,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(30),
                      backgroundColor: selectedGender == Gender.male
                          ? maleColor
                          : Colors.black38,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.male_rounded,
                          size: 50,
                          color: Colors.white,
                        ),
                        Text(
                          Gender.male
                              .toString()
                              .split('.')
                              .last
                              .capitaliseFirstLetter(),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    style: TextButton.styleFrom(
                      elevation: 10,
                      padding: const EdgeInsets.all(30),
                      backgroundColor: selectedGender == Gender.female
                          ? femaleColor
                          : Colors.black38,
                      shape: const CircleBorder(),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.female_rounded,
                            size: 50, color: Colors.white),
                        Text(
                          Gender.female
                              .toString()
                              .split('.')
                              .last
                              .capitaliseFirstLetter(),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              TextField(
                controller: textEditingControllerInputHeightInCms,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: "Please Enter your height (cm)",
                  hintStyle: const TextStyle(
                    color: Colors.black38,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardAppearance: Brightness.dark,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: textEditingControllerInputWeightInKgs,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: "Please Enter your weight (kg)",
                  hintStyle: const TextStyle(
                    color: Colors.black38,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                calculatedBmiValue != 0
                    ? calculatedBmiValue.toStringAsFixed(2)
                    : calculatedBmiValue.toStringAsFixed(0),
                style: const TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: computerBmiValue,
                style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Colors.black38,
                    minimumSize: const Size(double.infinity, 35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    )),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension CapitaliseFirstLetter on String {
  String capitaliseFirstLetter() => this[0].toUpperCase() + substring(1);
}

// todo: todays task is to show the variation in bmi based on the gender that the user chosen
