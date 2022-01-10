// ignore_for_file: prefer_const_constructors, unused_element, unnecessary_new, avoid_print, sized_box_for_whitespace

import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:object_box_ex/objectbox.g.dart';

import 'models/contact.dart';
import 'models/qr_code.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Object Box demo app',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<MyQrCode> qrList = [];
  List<Contact> contactList = [];

  Store? store;
  Box<MyQrCode>? qrCodeBox;
  Box<Contact>? contactBox;
  late int qrCount;
  late int ctCount;

  void addQrCode(MyQrCode qrCode) {
    qrCodeBox?.put(qrCode);
    reloadQr();
  }

  void addContact(Contact contact) {
    contactBox?.put(contact);
    reloadCt();
  }

  void removeQrCode(MyQrCode qrCode) {
    qrCodeBox?.remove(qrCode.id);
    reloadQr();
  }

  void removeContact(Contact contact) {
    contactBox?.remove(contact.id);
    reloadCt();
  }

  void reloadQr() {
    setState(() {
      qrList.clear();
      qrList.addAll([...?qrCodeBox?.getAll()]);
      qrCount = qrList.length;
    });
  }

  void reloadCt() {
    setState(() {
      contactList.clear();
      contactList.addAll([...?contactBox?.getAll()]);
      ctCount = contactList.length;
    });
  }

  @override
  void initState() {
    super.initState();
    openStore().then((Store store) {
      store = store;
      qrCodeBox = store.box<MyQrCode>();
      contactBox = store.box<Contact>();
      reloadCt();
      reloadQr();
      qrCount = qrList.length;
      ctCount = contactList.length;
    });
  }

  @override
  void dispose() {
    super.dispose();
    store?.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ObjectBox Test App'),
      ),
      body: Column(children: [
        SizedBox(
          height: 200,
          child: ListView.builder(
              itemCount: qrList.length,
              itemBuilder: (context, index) =>
                  Center(child: Text(qrList[index].content ?? 'nothing'))),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  addQrCode(MyQrCode(id: 0, content: 'QrCode n $qrCount'));
                },
                child: Text('Add QrCode')),
            ElevatedButton(
                onPressed: () {
                  if (qrList.isNotEmpty) {
                    removeQrCode(qrList[qrList.length - 1]);
                  }
                },
                child: Text('Remove QrCode'))
          ],
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
              itemCount: contactList.length,
              itemBuilder: (context, index) =>
                  Center(child: Text(contactList[index].udid ?? 'nothing'))),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  addContact(Contact(id: 0, udid: 'Contact n $ctCount'));
                },
                child: Text('Add Contact')),
            ElevatedButton(
                onPressed: () {
                  if (contactList.isNotEmpty) {
                    removeContact(contactList[contactList.length - 1]);
                  }
                },
                child: Text('Remove Contact'))
          ],
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
