import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_multi_display/screens/secondary_window.dart';
import 'package:simple_multi_display/screens/splashscreen.dart';

Future<void> main(List<String> args) async {
  // for the async main
  WidgetsFlutterBinding.ensureInitialized();

  if (args.firstOrNull == 'multi_window') {
    debugPrint("Not the first run");
    runApp(const ProviderScope(child: SecondaryWindow()));
  } else {
    debugPrint("first run");
    runApp(const ProviderScope(child: SimpleMultiDisplay()));
  }
}

class SimpleMultiDisplay extends StatelessWidget {
  const SimpleMultiDisplay({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Splashscreen(),
    );
  }
}
