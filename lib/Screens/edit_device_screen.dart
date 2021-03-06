import 'package:flutter/material.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:provider/provider.dart';

import 'package:booking_app/constants.dart';
import 'package:booking_app/models/device_model.dart';
import 'package:booking_app/providers/main_provider.dart';
import 'package:booking_app/widgets_model/custom_add_text_form_field.dart';
import 'package:booking_app/widgets_model/custom_elevated_button.dart';
import 'package:booking_app/widgets_model/custom_text.dart';

class EditDeviceScreen extends StatefulWidget {
  final String deviceId;
  final String devicename;
  final String type;
  EditDeviceScreen(
      {Key? key,
      required this.deviceId,
      required this.devicename,
      required this.type})
      : super(key: key);

  @override
  _EditDeviceScreenState createState() => _EditDeviceScreenState(
      deviceId1: deviceId, type1: type, devicename1: devicename);
}

class _EditDeviceScreenState extends State<EditDeviceScreen> {
  bool isLoading = false;
  final String deviceId1;
  final String devicename1;
  final String type1;
  _EditDeviceScreenState(
      {Key? key,
      required this.deviceId1,
      required this.devicename1,
      required this.type1});

  TextEditingController? nameController = TextEditingController();

  TextEditingController? modelController = TextEditingController();

  TextEditingController? osController = TextEditingController();

  TextEditingController? screenSizeController = TextEditingController();

  TextEditingController? batteryController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey();
  DeviceModel? deviceModel;
  @override
  void initState() {
    deviceModel = Provider.of<MainProvider>(context, listen: false)
        .findDeviceById(widget.deviceId);
    nameController!.text = deviceModel!.name;
    modelController!.text = deviceModel!.model;
    osController!.text = deviceModel!.os;
    screenSizeController!.text = deviceModel!.screenSize;
    batteryController!.text = deviceModel!.battery;

    super.initState();
  }

  void update(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      isLoading = true;
    });
    Provider.of<MainProvider>(context, listen: false)
        .updateDevice(
            deviceName: nameController!.text.trim(),
            modNum: modelController!.text.trim(),
            os: osController!.text.trim(),
            screenSize: screenSizeController!.text.trim(),
            battery: batteryController!.text.trim(),
            type: type1,
            name: devicename1)
        .then((value) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Device updated')));
    });
    nameController!.clear();
    modelController!.clear();
    osController!.clear();
    screenSizeController!.clear();
    batteryController!.clear();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Device"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: CustomText(
                        text: 'Are you sure',
                      ),
                      content: Consumer<MainProvider>(
                        builder: (context, value, child) => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomText(
                              text: ' device delete',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Text('No')),
                                TextButton(
                                    onPressed: () async {
                                      await value
                                          .deleteDevice(deviceModel!.id, type1,
                                              deviceModel!.name)
                                          .then((value) {
                                        Navigator.of(context).pop();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    'The device has been deleted')));
                                      }).then((value) =>
                                              Navigator.of(context).pop());
                                    },
                                    child: Text('Yes')),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.delete_outline)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 150,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Stack(
                              children: [
                                Image.network(
                                  deviceModel!.imageUrl[index],
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: IconButton(
                                      color: Colors.red.shade500,
                                      icon: Icon(
                                        Icons.cancel_outlined,
                                      ),
                                      onPressed: () async {
                                        await Provider.of<MainProvider>(context,
                                                listen: false)
                                            .deleteImage(index, deviceModel!.id)
                                            .then((value) {
                                          return ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(value)));
                                        });
                                      }),
                                )
                              ],
                            ),
                          ),
                      itemCount: deviceModel!.imageUrl.length),
                ),
                SizedBox(height: 15),
                CustomAddTextFormField(
                  controller: nameController,
                  //initialValue: widget.deviceModel.name,
                  label: 'Device Name',
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Enter device name';
                    } else
                      return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomAddTextFormField(
                  controller: modelController,
                  //initialValue: widget.deviceModel.model,
                  label: 'Model Number',
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Enter model number';
                    } else
                      return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomAddTextFormField(
                  controller: osController,
                  //initialValue: widget.deviceModel.os,
                  label: 'Operating System',
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Enter operating system';
                    } else
                      return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomAddTextFormField(
                  controller: screenSizeController,
                  // initialValue: widget.deviceModel.screenSize,
                  label: 'Screen Size',
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Enter screen size';
                    } else
                      return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomAddTextFormField(
                  controller: batteryController,
                  //initialValue: widget.deviceModel.battery,
                  label: 'Battery',
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Enter battery';
                    } else
                      return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 150,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Consumer<MainProvider>(
                    builder: (context, value, child) => Column(
                      children: [
                        TextButton(
                            onPressed: () async {
                              await Provider.of<MainProvider>(context,
                                      listen: false)
                                  .loadAssets();
                            },
                            child: CustomText(
                              text: 'Add Image',
                              color: KPrimaryColor,
                              alignment: Alignment.center,
                            )),
                        Expanded(
                          child: GridView.count(
                            crossAxisCount: 3,
                            children: List.generate(value.selectedImages.length,
                                (index) {
                              Asset asset = value.selectedImages[index];
                              return AssetThumb(
                                asset: asset,
                                width: 300,
                                height: 300,
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                isLoading
                    ? CircularProgressIndicator()
                    : CustomElevatedButton(
                        text: 'Update',
                        onPressed: () => update(context),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
