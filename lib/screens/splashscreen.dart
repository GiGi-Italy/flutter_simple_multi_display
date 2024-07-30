import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:simple_multi_display/providers/product_provider.dart';
import 'package:simple_multi_display/screens/primary_windows.dart';

class Splashscreen extends ConsumerWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        openNewWindow('Secondary Windows');
        //initialize product to 1
        ref.read(productProvider.notifier).setProduct('1');
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const PrimaryWindow()),
        );
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo_blur.png',
                width: 200,
              ),
            ),
            const Text('Tap on the image to start'),
          ],
        ),
      ),
    );
  }

  void openNewWindow(String title) async {
    final window = await DesktopMultiWindow.createWindow('sub_windows');
    window
      ..setFrame(const Offset(0, 0) & const Size(1280, 720))
      ..center()
      ..setTitle(title)
      ..show();
  }
}
