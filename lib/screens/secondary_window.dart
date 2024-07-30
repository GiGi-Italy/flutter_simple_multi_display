import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_multi_display/providers/product_provider.dart';

class SecondaryWindow extends ConsumerStatefulWidget {
  const SecondaryWindow({super.key});

  @override
  ConsumerState<SecondaryWindow> createState() => _SecondaryWindowState();
}

class _SecondaryWindowState extends ConsumerState<SecondaryWindow> {
  @override
  void initState() {
    super.initState();
    DesktopMultiWindow.setMethodHandler((call, fromWindowId) async {
      debugPrint('${call.method} ${call.arguments} $fromWindowId');
      ref.read(productProvider.notifier).setProduct(call.arguments);
      return "result";
    });
  }

  @override
  Widget build(BuildContext context) {
    String? incomingData = ref.watch(productProvider);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Secondary Window',
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Text(
            '$incomingData',
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
