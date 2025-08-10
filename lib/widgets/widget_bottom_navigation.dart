import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ajheryuk/providers/general_provider.dart';

class CustomBottomNavigationBar extends ConsumerWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);
    final pageController = ref.watch(pageControllerProvider);

    return SizedBox(
      child: Container(
        padding: EdgeInsets.all(10.0),
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              'assets/bottomnavigation/menu',
              0,
              selectedIndex,
              ref,
              pageController,
            ),
            _buildNavItem(
              'assets/bottomnavigation/discovery',
              1,
              selectedIndex,
              ref,
              pageController,
            ),
            _buildMessageNavItem(
              'assets/bottomnavigation/message',
              2,
              selectedIndex,
              ref,
              pageController,
            ),
            _buildNavItem(
              'assets/bottomnavigation/profile',
              3,
              selectedIndex,
              ref,
              pageController,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    String iconBasePath,
    int index,
    int selectedIndex,
    WidgetRef ref,
    PageController pageController,
  ) {
    final isSelected = selectedIndex == index;
    final iconPath = isSelected
        ? '$iconBasePath-fill.png'
        : '$iconBasePath-outline.png';

    return InkWell(
      onTap: () {
        pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      borderRadius: BorderRadius.circular(10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 60,
        height: 60,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, width: 28, height: 28),
            const SizedBox(height: 10),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 3,
              width: 20,
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFFEC5F5F)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageNavItem(
    String iconBasePath,
    int index,
    int selectedIndex,
    WidgetRef ref,
    PageController pageController,
  ) {
    final isSelected = selectedIndex == index;
    final iconPath = isSelected
        ? '$iconBasePath-fill.png'
        : '$iconBasePath-outline.png';

    return InkWell(
      onTap: () {
        pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      borderRadius: BorderRadius.circular(10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 60,
        height: 60,
        color: Colors.transparent,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Kolom untuk icon dan indicator
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(iconPath, width: 28, height: 28),
                const SizedBox(height: 10),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 3,
                  width: 20,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFFEC5F5F)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
            // Badge count (ditempatkan di atas icon)
            if (index == 2)
              Positioned(
                right: 10,
                top: -5,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 20,
                    minHeight: 20,
                  ),
                  child: const Center(
                    child: Text(
                      '9',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
