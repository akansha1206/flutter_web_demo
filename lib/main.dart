import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      unknownRoute: GetPage(name: '/notfound', page: () => const ErrorPage()),
      initialRoute: "",
      getPages: [
        GetPage(name: '/', page: () => MyHomePage()),
        GetPage(name: '/second', page: () => Second()),
        GetPage(
            name: '/third', page: () => Third(), transition: Transition.zoom),
      ],
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();

        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("First Page"),
        ),
        body: Center(
            child: ElevatedButton(
          child: const Text("Go to second Page"),
          onPressed: () =>
              navigator!.pushNamed("second/", arguments: 'Get is the best'),
        )),
      ),
    );
  }
}

class Second extends StatelessWidget {
  const Second({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Second Page"),
        ),
        body: Center(
            child: ElevatedButton(
          child: const Text("Go to Third Page"),
          onPressed: () =>
              navigator!.pushNamed("/third", arguments: 'Get is the best'),
        )),
      ),
    );
  }
}

class Third extends StatelessWidget {
  const Third({super.key});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Third Page"),
        ),
        body: Center(
            child: ElevatedButton(
          child: const Text("Go to Home Page"),
          onPressed: () =>
              navigator!.pushNamed("/", arguments: 'Get is the best'),
        )),
      ),
    );
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: Scaffold(
          appBar: AppBar(title: const Text("Error Page")),
          body: const Center(
            child: Text("Page Not Found"),
          )),
    );
  }
}
