import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListVieww3D extends StatefulWidget {
  const ListVieww3D({Key? key}) : super(key: key);

  @override
  State<ListVieww3D> createState() => _ListVieww3DState();
}

class _ListVieww3DState extends State<ListVieww3D> {
  late FixedExtentScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = FixedExtentScrollController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("3D ListView Wheel Scroll"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            final nextIndex = controller.selectedItem + 1;
            controller.animateToItem(nextIndex,
                duration: const Duration(seconds: 1), curve: Curves.easeInOut);
          },
          child: const Icon(Icons.arrow_forward)),
      body: ListWheelScrollView.useDelegate(
        // Squeeze Value Is By Default 1
        squeeze: 0.8,
        controller: controller,
        itemExtent: 200,
        physics: const FixedExtentScrollPhysics(),
        // Perspective Value Should Be Between 0 => 0.1.
        perspective: 0.005,
        // Diameter Ratio Value Is By Default 2. But You Can Add It Even Higher Than This
        diameterRatio: 0.8,
        onSelectedItemChanged: (index) => Fluttertoast.showToast(
          msg: "Selected Item: ${index}",
          fontSize: 15,
        ),
        childDelegate: ListWheelChildBuilderDelegate(
            childCount: 50,
            builder: ((context, index) => Container(
                  color: Colors.blue,
                  child: Center(child: Text('Item Number $index')),
                ))),
      ),
    );
  }
}
