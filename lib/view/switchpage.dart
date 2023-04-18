import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/switch_provider.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({super.key});

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

bool on = true;

class _SwitchPageState extends State<SwitchPage> {
  @override
  Widget build(BuildContext context) {
    final isSwitched = Provider.of<SwitchProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<SwitchProvider>(
              builder: (context, value, child) {
                return Switch(
                  value: on,
                  onChanged: (value) {
                    isSwitched.toogleSwitch(!on);
                  },
                  activeColor: Colors.green,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
