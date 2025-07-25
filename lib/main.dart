import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Desi Ölçer AR',
      home: ARView(),
    );
  }
}

class ARView extends StatefulWidget {
  const ARView({super.key});

  @override
  State<ARView> createState() => _ARViewState();
}

class _ARViewState extends State<ARView> {
  late ARKitController arkitController;

  @override
  void dispose() {
    arkitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Desi Ölçer AR')),
      body: ARKitSceneView(
        onARKitViewCreated: onARKitViewCreated,
        planeDetection: ARPlaneDetection.horizontal,
      ),
    );
  }

  void onARKitViewCreated(ARKitController controller) {
    arkitController = controller;

    final box = ARKitBox(
      width: 0.2,
      height: 0.2,
      length: 0.2,
      materials: [
        ARKitMaterial(
          diffuse: ARKitMaterialProperty.color(Colors.blue),
        ),
      ],
    );

    final node = ARKitNode(
      geometry: box,
      position: Vector3(0, 0, -0.5),
    );

    arkitController.add(node);
  }
}

