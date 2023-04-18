import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/slider.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  @override
  Widget build(BuildContext context) {
    print('Slider');

    return Scaffold(
      appBar: AppBar(title: const Text('Multi Provider')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<SliderProvider>(builder: (context, value, child) {
            return Slider(
                min: 0,
                max: 1,
                value: value.slidervalue,
                onChanged: (val) {
                  value.setValue(val);
                });
          }),
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(value.slidervalue)),
                      child: const Center(child: Text('Container - 1')),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(value.slidervalue)),
                      child: const Center(child: Text('Container - 2')),
                    ),
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
