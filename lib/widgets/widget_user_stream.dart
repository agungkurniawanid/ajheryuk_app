import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WidgetUserStream extends ConsumerStatefulWidget {
  const WidgetUserStream({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WidgetUserStreamState();
}

class _WidgetUserStreamState extends ConsumerState<WidgetUserStream> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: List.generate(10, (index) {
            final indexFoto = index + 1;
            return Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: _widgetUserStreamItems(indexFoto),
            );
          }),
        ),
      ),
    );
  }
}

Widget _widgetUserStreamItems(indexFoto) {
  return Stack(
    children: [
      Container(
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: const Color(0xFFEC5F5F),
          borderRadius: BorderRadius.circular(36),
          boxShadow: const [
            BoxShadow(
              color: Color(0x66EC5F5F),
              blurRadius: 10,
              spreadRadius: 1,
              offset: Offset(0, 7),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Image.asset(
              'assets/person/person ($indexFoto).jpg',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF4DC9D1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Image.asset(
                    'assets/images/video.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
