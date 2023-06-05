import 'package:animal_feeder_game/constants/theme.dart';
import 'package:animal_feeder_game/firebase_options.dart';
import 'package:animal_feeder_game/screens/main_dashboard.dart';
import 'package:animal_feeder_game/services/animal_service.dart';
import 'package:animal_feeder_game/services/camera_service.dart';
import 'package:animal_feeder_game/services/notification_service.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  NotificationService.initialize();
  CameraService.cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AnimalService()),
      ],
      child : MaterialApp(
        title: 'Flutter Demo',
        theme: MyTheme.themeData,
        home: const MainDashboard(),
      ),
    );
  }
}

