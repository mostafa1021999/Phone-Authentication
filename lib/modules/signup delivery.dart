import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../componants/componants.dart';

class delivery extends StatefulWidget {
  const delivery({super.key});

  @override
  State<delivery> createState() => _deliveryState();
}

class _deliveryState extends State<delivery> {
  Uint8List? _image;
  File? selectedIMage;
  String ?birthDateInString;
  DateTime ?birthDate;
  bool dateSelected=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(children: [
            buildTextField(Icons.account_box_outlined, "Frist Name",
                false, TextInputType.name),
            buildTextField(Icons.account_box_outlined, "Last Name",
                false, TextInputType.name),
            GestureDetector(
                child: dateSelected?
                date("${birthDate!.month}/${birthDate!.day}/${birthDate!.year}",true):date('mm/dd/yy',false),
                onTap: ()async{
                  final datePick= await showDatePicker(
                      context: context,
                      initialDate: new DateTime.now(),
                      firstDate: new DateTime(1900),
                      lastDate: new DateTime.now(),
                  );
                  if(datePick!=null && datePick!=birthDate){
                    setState(() {
                      dateSelected=true;
                      birthDate=datePick;
                      // put it here
                      birthDateInString = "${birthDate!.month}/${birthDate!.day}/${birthDate!.year}"; // 08/14/2019
                    });
                  }
                }
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: bottom('Upload ID iamge',(){
                showImagePickerOption(context);
              }),
            ),
            _image != null
                ? CircleAvatar(
                radius: 100, backgroundImage: MemoryImage(_image!))
                : const CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(
                  "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
            ),
          ],),
        ),
      ),
    );
  }
  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.orange[250],
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 70,
                              color: Colors.white,
                            ),
                            Text("Gallery")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromCamera();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 70,
                              color: Colors.white,
                            ),
                            Text("Camera")
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

//Gallery
  Future _pickImageFromGallery() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop(); //close the model sheet
  }

//Camera
  Future _pickImageFromCamera() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}
