import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetCategory extends ConsumerStatefulWidget {
  const WidgetCategory({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WidgetCategoryState();
}

class _WidgetCategoryState extends ConsumerState<WidgetCategory> {
  final List<String> categories = [
    'All',
    'UI/UX',
    'Illustration',
    '3D Animation',
    'Mobile Design',
    'Branding',
    'Motion',
    'Graphic',
    'Product',
    'Web Design',
  ];

  int selectedIndex = 0; // index yang terpilih, default 0

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: List.generate(categories.length, (index) {
              final isSelected = index == selectedIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: categoryItem(categories[index], isSelected),
              );
            }),
          ),
        ),
      ),
    );
  }
}

Widget categoryItem(String text, bool isSelected) => Padding(
  padding: const EdgeInsets.only(right: 8.0),
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
    decoration: BoxDecoration(
      color: isSelected
          ? const Color(0xFFEC5F5F)
          : const Color.fromARGB(255, 223, 225, 229),
      borderRadius: BorderRadius.circular(8),
      boxShadow: isSelected
          ? [
              BoxShadow(
                color: const Color(0xFFEC5F5F).withOpacity(0.6),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ]
          : null,
    ),
    child: Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 18,
        color: isSelected
            ? Colors.white
            : const Color.fromARGB(255, 98, 100, 100),
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
);
