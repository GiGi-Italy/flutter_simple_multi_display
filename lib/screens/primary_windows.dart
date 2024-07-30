import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_multi_display/providers/product_provider.dart';

class PrimaryWindow extends ConsumerStatefulWidget {
  const PrimaryWindow({super.key});

  @override
  ConsumerState<PrimaryWindow> createState() => _PrimaryWindowState();
}

class _PrimaryWindowState extends ConsumerState<PrimaryWindow> {
  @override
  Widget build(BuildContext context) {
    String? idSelectedProduct = ref.watch(productProvider);
    int nextProduct = int.parse(idSelectedProduct!) + 1;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Actual Product = $idSelectedProduct',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 229, 180),
                shadowColor: const Color.fromARGB(255, 180, 169, 148),
              ),
              child: Text(
                'Tap to select the product number $nextProduct',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                ref.read(productProvider.notifier).setProduct('$nextProduct');
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 229, 180),
                shadowColor: const Color.fromARGB(255, 180, 169, 148),
              ),
              child: const Text(
                'Tap to send product to the secondary window',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onPressed: () async {
                DesktopMultiWindow.invokeMethod(
                    1, "ProductId", idSelectedProduct);
              },
            ),
          ],
        ),
      ),
    );
  }
}
