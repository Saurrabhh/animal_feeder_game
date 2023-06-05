import 'package:animal_feeder_game/services/notification_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
class FireBaseStorageService{
  static final FirebaseStorage _storage = FirebaseStorage.instance;


  static Future<void> uploadImage(File file) async {
    try {
      await _storage.ref(file.path.split('/').last).putFile(file);
      NotificationService.instantNotification("Uploaded");
    } on FirebaseException catch (e) {
      NotificationService.instantNotification("Failed to upload");
    }
  }
}