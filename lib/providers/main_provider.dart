import 'package:booking_app/models/category_model.dart';
import 'package:booking_app/models/device_model.dart';
import 'package:booking_app/models/employee_model.dart';
import 'package:booking_app/models/reserve_device_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';

class MainProvider with ChangeNotifier {
  List<DeviceModel> allDevicesList = [
    // DeviceModel(
    //     id: '1',
    //     name: 'Samsung Note 10',
    //     model: 'Note 10',
    //     os: 'Android Pie',
    //     type: 'ANDROID',
    //     screenSize: '6 inch',
    //     isBooked: true,
    //     battery: '5000 mA',
    //     imageUrl: [
    //       'https://www.mytrendyphone.eu/images/Samsung-Galaxy-Note10-Duos-256GB-Pre-owned-Good-condition-Aura-Black-14042020-01-p.jpg'
    //     ]),
    // DeviceModel(
    //     id: '2',
    //     name: 'Huawei Mate 10',
    //     model: 'Mate 10',
    //     os: 'Android Marshmelo',
    //     type: 'ANDROID',
    //     screenSize: '6 inch',
    //     isBooked: true,
    //     battery: '3330 mA',
    //     imageUrl: [
    //       'https://images-na.ssl-images-amazon.com/images/I/51uAjhBSzOL._AC_SX522_.jpg'
    //     ]),
    // DeviceModel(
    //     id: '3',
    //     name: 'Samsung A50',
    //     model: 'A50',
    //     os: 'Android Pie',
    //     type: 'ANDROID',
    //     isBooked: false,
    //     screenSize: '6 inch',
    //     imageUrl: [
    //       'https://www.mytrendyphone.eu/images/Original-Samsung-Galaxy-A50-Gradation-Cover-EF-AA505CBEGWW-Black-8801643776848-22042019-01-p.jpg'
    //     ],
    //     battery: '5000 mA'),
    // DeviceModel(
    //     id: '4',
    //     name: 'Iphone X',
    //     model: 'X',
    //     os: 'IOS 10',
    //     type: 'IOS',
    //     isBooked: false,
    //     imageUrl: [
    //       'https://www.mytrendyphone.eu/images/iPhone-X-XS-Fake-Camera-Sticker-Black-05122019-01-p.jpg',
    //       'https://www.tjara.com/wp-content/uploads/2021/04/temp1618662955_1903984948.jpg',
    //       'https://cdn.alloallo.media/catalog/product/apple/iphone/iphone-x/iphone-x-space-gray.jpg'
    //     ],
    //     screenSize: '6 inch',
    //     battery: '5000 mA'),
    // DeviceModel(
    //     id: '5',
    //     name: 'Iphone 9',
    //     model: '9',
    //     os: 'IOS 9',
    //     type: 'IOS',
    //     isBooked: false,
    //     screenSize: '6 inch',
    //     imageUrl: [
    //       'https://fdn.gsmarena.com/imgroot/news/20/01/iphone-9-renders/-727/gsmarena_005.jpg'
    //     ],
    //     battery: '5000 mA'),
    // DeviceModel(
    //     id: '6',
    //     name: 'HP 110',
    //     model: '110',
    //     os: 'Windows 10',
    //     type: 'PC',
    //     isBooked: false,
    //     imageUrl: ['https://www.notebookcheck.net/uploads/tx_nbc2/hp110.jpg'],
    //     screenSize: '15 inch',
    //     battery: '5000 mA'),
    // DeviceModel(
    //     id: '7',
    //     name: 'Lenovo 120',
    //     model: '120',
    //     os: 'Windows 10',
    //     type: 'PC',
    //     isBooked: false,
    //     imageUrl: [
    //       'https://www.notebookcheck.net/uploads/tx_nbc2/1204810_10.jpg'
    //     ],
    //     screenSize: '15 inch',
    //     battery: '5000 mA'),
    // DeviceModel(
    //     id: '8',
    //     name: 'Huawei 3G/4G LTE',
    //     model: 'E589u',
    //     os: 'android',
    //     type: 'OTHERS',
    //     isBooked: false,
    //     imageUrl: [
    //       'https://www-konga-com-res.cloudinary.com/w_auto,f_auto,fl_lossy,dpr_auto,q_auto/media/catalog/product/N/a/59917_1516110926.jpg'
    //     ],
    //     screenSize: '3 inch',
    //     battery: '5000 mA'),
  ];

  List<CatergoryModel> categories = [
    // CatergoryModel(
    //     name: 'Android',
    //     imageUrl:
    //         'https://firebasestorage.googleapis.com/v0/b/booking-app-d737d.appspot.com/o/categoriesIcons%2Fandroid96.png?alt=media&token=04dfd03d-2494-48f9-95fe-1f1af390f2c7'),
    // CatergoryModel(
    //     name: 'IOS',
    //     imageUrl:
    //         'https://firebasestorage.googleapis.com/v0/b/booking-app-d737d.appspot.com/o/categoriesIcons%2Fios-96.png?alt=media&token=9fdeb72c-e35e-4d29-a78e-305361fb0b3d'),
    // CatergoryModel(
    //     name: 'PC',
    //     imageUrl:
    //         'https://firebasestorage.googleapis.com/v0/b/booking-app-d737d.appspot.com/o/categoriesIcons%2Fpc-96.png?alt=media&token=30326472-db66-4374-aa8e-153bef4587a7'),
    //CatergoryModel(
    //  name: 'Others',
    //imageUrl:
    //  'https://firebasestorage.googleapis.com/v0/b/booking-app-d737d.appspot.com/o/categoriesIcons%2Fothers-96.png?alt=media&token=b95ea046-d22c-46c5-b782-a17303832320'),
  ];
  List<String> categoryTypeList = [];
  List<EmployeeModel> employeeList = [
    // EmployeeModel(
    //     id: '1',
    //     name: 'Mohamed',
    //     lastName: 'ahmed',
    //     occupationGroup: 'mobile department',
    //     email: 'mourad_ahmed@gmail.com',
    //     imageUrl:
    //         'https://previews.123rf.com/images/yupiramos/yupiramos1607/yupiramos160710209/60039275-young-male-cartoon-profile-vector-illustration-graphic-design-.jpg',
    //     phone: '52693987'),
    // EmployeeModel(
    //     id: '2',
    //     name: 'Amal',
    //     lastName: 'Barka',
    //     occupationGroup: 'mobile department',
    //     email: 'amalbarka@gmail.com',
    //     imageUrl: '',
    //     phone: '54789321'),
    // EmployeeModel(
    //     id: '3',
    //     name: 'toumi',
    //     lastName: 'mousa',
    //     occupationGroup: 'web department',
    //     email: 'toumi_mousa@gmail.com',
    //     imageUrl: '',
    //     phone: '91456987'),
    // EmployeeModel(
    //     id: '4',
    //     name: 'aouni',
    //     lastName: 'wejdi',
    //     occupationGroup: 'test department',
    //     email: 'wejdi09@gmail.com',
    //     imageUrl:
    //         'https://previews.123rf.com/images/yupiramos/yupiramos1607/yupiramos160710209/60039275-young-male-cartoon-profile-vector-illustration-graphic-design-.jpg',
    //     phone: '22548796'),
  ];
  List<dynamic> searchList = [];
  List<DeviceModel> devicesNotBookedList = [];

  List<DeviceModel> androidDevicesList = [];
  List<DeviceModel> iosDevicesList = [];
  List<DeviceModel> pcDevicesList = [];
  List<DeviceModel> othersDevicesList = [];

  List<ReserveDeviceModel> reservedDevicesList = [
    ReserveDeviceModel(
        id: '1',
        deviceName: 'Samsung Note 10',
        userId: '1',
        type: 'ANDROID',
        startDate: '01/07/2021',
        endDate: '20/07/2021'),
    ReserveDeviceModel(
        id: '1',
        deviceName: 'Huawei Mate 10',
        userId: '2',
        type: 'ANDROID',
        startDate: '01/07/2021',
        endDate: '20/07/2021'),
  ];
  List<Asset> selectedImages = <Asset>[];
  String error = 'No Error Detected';
  String? categoryType;
  DateTime? startDateTime;
  DateTime? endDateTime;
  ValueNotifier<bool> loading = ValueNotifier(false);
  void getcategory() {
    FirebaseFirestore.instance.collection("categories").get().then((value) {
      value.docs.forEach((element) {
        categories.add(CatergoryModel.fromMap(element.data()));
        categoryTypeList.add(element.data()["name"]);
        // print(categoryTypeList);
      });
    });
    notifyListeners();
  }

  void getdevices() {
    FirebaseFirestore.instance
        .collection("categories")
        .doc("Android")
        .collection("devices")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        allDevicesList.add(DeviceModel.fromMap(element.data()));
      });
    });
    FirebaseFirestore.instance
        .collection("categories")
        .doc("pc")
        .collection("devices")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        allDevicesList.add(DeviceModel.fromMap(element.data()));
      });
    });
    FirebaseFirestore.instance
        .collection("categories")
        .doc("IOS")
        .collection("devices")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        allDevicesList.add(DeviceModel.fromMap(element.data()));
      });
    });
    notifyListeners();
  }

  void changeStartDateTime(DateTime date) {
    startDateTime = date;
    notifyListeners();
  }

  void changeEndDateTime(DateTime date) {
    endDateTime = date;
    notifyListeners();
  }

  void changeType(String type) {
    categoryType = type;

    notifyListeners();
  }

  Future filterDevices() async {
    //you must change compare to id
    loading.value = true;
    allDevicesList.forEach((device) {
      //filter devices as booked
      if (device.isBooked == false) {
        var isExest = devicesNotBookedList.indexWhere(
          (element) => element.id == device.id,
        );
        if (isExest == -1) {
          devicesNotBookedList.add(device);
        }
      }

      //filter devices ad type
      if (device.type == 'Android' && device.isBooked == false) {
        var isExest = androidDevicesList.indexWhere(
          (element) => element.id == device.id,
        );
        if (isExest == -1) {
          androidDevicesList.add(device);
        }
      } else if (device.type == 'IOS' && device.isBooked == false) {
        var isExest =
            iosDevicesList.indexWhere((element) => element.id == device.id);
        if (isExest == -1) {
          iosDevicesList.add(device);
        }
      } else if (device.type == 'pc' && device.isBooked == false) {
        var isExest =
            pcDevicesList.indexWhere((element) => element.id == device.id);
        if (isExest == -1) {
          pcDevicesList.add(device);
        }
      } else if (device.type == 'OTHERS' && device.isBooked == false) {
        var isExest =
            othersDevicesList.indexWhere((element) => element.id == device.id);
        if (isExest == -1) {
          othersDevicesList.add(device);
        }
      }
    });
    loading.value = false;

    //notifyListeners();
  }

  Future refreshDevices() async {
    await filterDevices();
    notifyListeners();
  }

  DeviceModel findDeviceById(String id) {
    return allDevicesList.firstWhere((element) => element.id == id);
  }

  EmployeeModel findEmployeeById(String id) {
    return employeeList.firstWhere((element) => element.id == id);
  }

  void removeFromSearchList(String id) {
    searchList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  Future addDevice({
    String? deviceName,
    String? modNum,
    String? os,
    String? screenSize,
    String? battery,
  }) async {
    allDevicesList.add(DeviceModel(
        id: "${allDevicesList.length.toString()}  $deviceName",
        name: deviceName!,
        model: modNum!,
        os: os!,
        type: categoryType!,
        isBooked: false,
        screenSize: screenSize!,
        battery: battery!,
        imageUrl: [""]));
    FirebaseFirestore.instance
        .collection("categories")
        .doc(categoryType!)
        .collection("devices")
        .doc(deviceName)
        .set(DeviceModel(
            id: "${allDevicesList.length.toString()}  $deviceName",
            name: deviceName,
            model: modNum,
            os: os,
            type: categoryType!,
            isBooked: false,
            screenSize: screenSize,
            battery: battery,
            imageUrl: [""]).toMap());
    notifyListeners();
    print('add device');
    print(allDevicesList);
    //add to database
    // upload images and then clear list selectedImages
  }

  Future updateDevice(
      {id, deviceName, modNum, os, screenSize, battery, type, name}) async {
    FirebaseFirestore.instance
        .collection("categories")
        .doc(type)
        .collection("devices")
        .where("name", isEqualTo: name)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        element.reference.update({
          "name": deviceName,
          "model": modNum,
          "os": os,
          "screenSize": screenSize,
          "battery": battery,
        });
      });
    });
    allDevicesList.where((element) => element.name == name).forEach((element) {
      element.name = deviceName;
      element.model = modNum;
      element.os = os;
      element.screenSize = screenSize;
      element.battery = battery;
    });
    notifyListeners();
    //update in database
    // upload new images and then clear list selectedImages
  }

  Future deleteDevice(String deviceId, type, name) async {
// must change all this body when link with database
    FirebaseFirestore.instance
        .collection("categories")
        .doc(type)
        .collection("devices")
        .where("name", isEqualTo: name)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        element.reference.delete();
      });
    });

    notifyListeners();
    print('the device is deleted');
    allDevicesList.removeWhere((element) => element.id == deviceId);
    androidDevicesList.removeWhere((element) => element.id == deviceId);
    iosDevicesList.removeWhere((element) => element.id == deviceId);
    pcDevicesList.removeWhere((element) => element.id == deviceId);
    othersDevicesList.removeWhere((element) => element.id == deviceId);
    reservedDevicesList.removeWhere((element) => element.id == deviceId);
    devicesNotBookedList.removeWhere((element) => element.id == deviceId);

    notifyListeners();
  }

  Future deleteEmployee(String id) async {
    print('employee deleted');
    FirebaseFirestore.instance
        .collection("emplyee")
        .where("id", isEqualTo: id)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        element.reference.delete();
      });
    });
    employeeList.removeWhere((element) => element.id == id);
    reservedDevicesList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  Future addCtegory(String name, String imageUrl) async {
    print('the category is added');
    FirebaseFirestore.instance
        .collection("categories")
        .doc(name)
        .set(CatergoryModel(name: name, imageUrl: imageUrl).toMap());

    CatergoryModel catergoryModel =
        CatergoryModel(name: name, imageUrl: imageUrl);
    categories.add(catergoryModel);
    categoryTypeList.add(name.toUpperCase());
    notifyListeners();
  }

  Future deleteCategory() async {}

  Future updateCategory(name, url, index) async {
    print(categories[index].name);
    FirebaseFirestore.instance
        .collection("categories")
        .doc(categories[index].name)
        .update(CatergoryModel(name: name, imageUrl: url).toMap())
        .then((value) {
      categories[index].name = name;
      categories[index].imageUrl = url;
      notifyListeners();
    });
    notifyListeners();
    //must be update catigories list in database
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String _error = 'No Error Detected';
    print('first');
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 3,
        enableCamera: true,
        selectedAssets: selectedImages,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Booked App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
      throw (e);
    }
    //you must saved the list in database
    selectedImages = resultList;
    error = _error;
    notifyListeners();
  }

  Future deleteImage(int index, String id) async {
    print(index);
    print(id);
    var device = allDevicesList.firstWhere((element) => element.id == id);
    if (device.imageUrl.length > 1) {
      //device.imageUrl.removeAt(index);
      //update in database and fetch device

      return 'image has been deleted';
    } else {
      return 'You can not remove all images';
    }
  }

  void getEmplyee() {
    FirebaseFirestore.instance.collection("emplyee").get().then((value) {
      value.docs.forEach((element) {
        employeeList.add(EmployeeModel.fromMap(element.data()));
      });
    });
  }

  Future addEmplyee(
      {name, lastName, occupationGroup, email, password, phone}) async {
    employeeList.add(EmployeeModel(
        id: "${employeeList.length.toString()}  $email",
        name: name,
        lastName: lastName,
        occupationGroup: occupationGroup,
        email: email,
        imageUrl: "",
        phone: phone));
    FirebaseFirestore.instance.collection("emplyee").doc(email).set(
        EmployeeModel(
                id: "${employeeList.length.toString()}  $email",
                name: name,
                lastName: lastName,
                occupationGroup: occupationGroup,
                email: email,
                imageUrl: "",
                phone: phone)
            .toMap());

    notifyListeners();
    print(employeeList.last);
  }

  Future addAddmin({
    String? name,
    String? lastName,
    String? email,
    String? password,
  }) async {
    print('add admin');
  }
}
