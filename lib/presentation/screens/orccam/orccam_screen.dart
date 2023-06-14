import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../widgets/shared/appBarMenu.dart';


class OrcCamScreen extends StatefulWidget {
  const OrcCamScreen({super.key});

  @override
  State<OrcCamScreen> createState() => _OrcCamScreenState();
}

class _OrcCamScreenState extends State<OrcCamScreen>{
  bool isPermissionGranted = false;

  late final Future<void> _future;

  @override
  void initState(){
    super.initState();

    _future = requestCameraPermission();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBarMenu(context),
          body: Center(
            child: Container(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Text(
                isPermissionGranted
                  // PERMISSION GRANTED
                  ? 'Permiso de cámara aceptado'

                  // PERMISSION DENIED
                  : 'Permiso de cámara negado',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
    
  }



//CAMERA PERMISSION
  Future<void> requestCameraPermission() async{
    final status = await Permission.camera.request();
    isPermissionGranted = status == PermissionStatus.granted;
  }

}