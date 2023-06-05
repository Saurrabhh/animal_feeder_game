import 'dart:io';

import 'package:animal_feeder_game/services/animal_service.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/corner_border.dart';
import '../constants/assets.dart';
import '../services/camera_service.dart';

class ClickMeal extends StatefulWidget {
  const ClickMeal({Key? key}) : super(key: key);

  @override
  State<ClickMeal> createState() => _ClickMealState();
}

class _ClickMealState extends State<ClickMeal> {
  late final CameraController cameraController;
  late final AnimalService animalService;
  late Future<void> future;

  File? clickedImage;

  Future<void> initialiseCameraController() async {
    cameraController =
        CameraController(CameraService.cameras[0], ResolutionPreset.max);
    await cameraController.initialize();
    await cameraController.setFlashMode(FlashMode.off);
  }

  final List<Widget> corners = [
    const CornerBorder(top: 0, right: 0),
    const CornerBorder(top: 0, left: 0),
    const CornerBorder(bottom: 0, left: 0),
    const CornerBorder(bottom: 0, right: 0),
  ];

  clickImage() async {
    if (!cameraController.value.isInitialized) return;
    clickedImage = File((await cameraController.takePicture()).path);
    setState(() {});
  }

  clearImage() {
    setState(() {
      clickedImage = null;
    });
  }

  addExp() async {
    animalService.addExp(100);
    await showDialog(
        context: context,
        builder: (_) {
          Future.delayed(
              const Duration(seconds: 3), () => Navigator.pop(context));
          return Scaffold(
            body: Center(
              child: Text(
                "GOOD JOB",
                style: GoogleFonts.lilitaOne(
                    textStyle: Theme.of(context).textTheme.bodyLarge),
              ),
            ),
          );
        });
    if (context.mounted) Navigator.pop(context);
  }

  @override
  void initState() {
    future = initialiseCameraController();
    animalService = Provider.of<AnimalService>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 244, 244, 244),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        children: [_buildPlate(), _buildTextMenu(context), _buildButtons()],
      ),
    );
  }

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        clickedImage != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: IconButton(
                    onPressed: clearImage,
                    icon: const Icon(
                      Icons.cancel_outlined,
                      color: Colors.white,
                      size: 40,
                    )),
              )
            : const SizedBox(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: IconButton(
              onPressed: clickedImage == null ? clickImage : addExp,
              icon: Icon(
                clickedImage == null ? Icons.camera_alt : Icons.done,
                color: Colors.white,
                size: 40,
              )),
        ),
      ],
    );
  }

  Widget _buildTextMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        clickedImage == null ? "Click your meal" : "Will you eat this?",
        style: GoogleFonts.andika(
            textStyle: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }

  Widget _buildPlate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        clickedImage == null
            ? SvgPicture.asset(MyAssets.forkImg)
            : const SizedBox(),
        _buildCamera(),
        clickedImage == null
            ? SvgPicture.asset(MyAssets.spoonImg)
            : const SizedBox(),
      ],
    );
  }

  Widget _buildCamera() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (clickedImage == null) ...corners,
            FutureBuilder<void>(
                future: future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SvgPicture.asset(MyAssets.plateImg);
                  }
                  return Container(
                    width: 200.0,
                    height: 200.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: ClipOval(
                        child: clickedImage == null
                            ? CameraPreview(cameraController)
                            : Image.file(
                                clickedImage!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              )),
                  );
                })
          ],
        ),
      );
  }
}
