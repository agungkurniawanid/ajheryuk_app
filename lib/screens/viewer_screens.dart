import 'package:ajheryuk/providers/general_provider.dart';
import 'package:ajheryuk/screens/dashboard.dart';
import 'package:ajheryuk/screens/discovery.dart';
import 'package:ajheryuk/screens/messages.dart';
import 'package:ajheryuk/screens/profile.dart';
import 'package:ajheryuk/widgets/widget_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewerScreens extends ConsumerStatefulWidget {
  const ViewerScreens({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ViewerScreensState();
}

class _ViewerScreensState extends ConsumerState<ViewerScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: const MainViewer()),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class MainViewer extends ConsumerWidget {
  const MainViewer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = ref.watch(pageControllerProvider);

    final pages = [
      const Center(child: Dashboard()),
      const Center(child: Messages()),
      const Center(child: Discovery()),
      const Center(child: Profile()),
    ];

    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        ref.read(selectedIndexProvider.notifier).state = index;
      },
      children: pages,
    );
  }
}
