import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);

final pageControllerProvider = Provider<PageController>((ref) {
  final controller = PageController(
    initialPage: ref.read(selectedIndexProvider),
  );
  ref.onDispose(() {
    controller.dispose();
  });
  return controller;
});

final obscurePasswordProvider = StateProvider<bool>((ref) => true);
