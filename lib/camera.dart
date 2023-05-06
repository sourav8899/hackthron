import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';

class LiveObjectDetection extends StatefulWidget {
  const LiveObjectDetection({Key? key}) : super(key: key);

  @override
  _LiveObjectDetectionState createState() => _LiveObjectDetectionState();
}

class _LiveObjectDetectionState extends State<LiveObjectDetection> {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  bool _isDetecting = false;
  String _recognizedObject = '';

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _initializeModel();
  }

  void _initializeCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras![0], ResolutionPreset.medium);
    await _cameraController!.initialize();
    _cameraController!.startImageStream((image) {
      if (_isDetecting) return;
      _isDetecting = true;
      _processImage(image);
    });
  }

  void _initializeModel() async {
    await Tflite.loadModel(
      model: 'assets/teachable.tflite',
      labels: 'assets/labels.txt',
    );
  }

  void _processImage(CameraImage image) async {
    final recognition = await Tflite.runModelOnFrame(
      bytesList: image.planes.map((plane) {
        return plane.bytes;
      }).toList(),
      imageHeight: image.height,
      imageWidth: image.width,
      numResults: 1,
    );
    if (recognition != null && recognition.isNotEmpty) {
      setState(() {
        _recognizedObject = recognition[0]['label'];
      });
    }
    _isDetecting = false;
  }

  @override
  Future<void> dispose() async {
    _cameraController?.dispose();
    await Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_cameras == null ||
        _cameraController == null ||
        !_cameraController!.value.isInitialized) {
      return Container();
    }
    return WillPopScope(
      onWillPop: () async {
        await _cameraController?.dispose();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Live Object Detection'),
        ),
        body: Column(
          children: [
            AspectRatio(
              aspectRatio: _cameraController!.value.aspectRatio,
              child: CameraPreview(_cameraController!),
            ),
            Text(
              'Recognized Object: $_recognizedObject',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
