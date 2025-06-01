import 'dart:ui';
import 'package:ajheryuk/models/carousels.dart';
import 'package:ajheryuk/screens/detail_card_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetCardCourse extends ConsumerStatefulWidget {
  const WidgetCardCourse({super.key});

  @override
  ConsumerState<WidgetCardCourse> createState() => _WidgetCardCourseState();
}

class _WidgetCardCourseState extends ConsumerState<WidgetCardCourse> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        padding: EdgeInsets.all(20.0),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: _CardWithEffect(
                index: index,
                scrollController: _scrollController,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CardWithEffect extends StatefulWidget {
  final int index;
  final ScrollController scrollController;

  const _CardWithEffect({required this.index, required this.scrollController});

  @override
  State<_CardWithEffect> createState() => _CardWithEffectState();
}

class _CardWithEffectState extends State<_CardWithEffect> {
  double _opacity = 1.0;
  double _scale = 1.0;
  bool _isBlurred = false;

  void _updateEffect() {
    if (!mounted) return;
    final screenWidth = MediaQuery.of(context).size.width;
    const itemWidth = 320.0;
    final offset = widget.scrollController.offset;
    final itemPosition = widget.index * itemWidth;
    final centerOffset =
        itemPosition - offset - screenWidth / 2 + itemWidth / 2;
    final difference = centerOffset.abs();
    final percent = (difference / screenWidth).clamp(0.0, 1.0);

    setState(() {
      _scale = 1.0 - (percent * 0.15);
      _opacity = 1.0 - (percent * 0.4);
      _isBlurred = percent > 0.2;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateEffect());
    widget.scrollController.addListener(_updateEffect);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_updateEffect);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final card = _cardCourseItems(context, widget.index);

    return Opacity(
      opacity: _opacity,
      child: Transform.scale(
        scale: _scale,
        child: Stack(
          children: [
            card,
            if (_isBlurred)
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                child: Container(
                  width: 320,
                  height: 400,
                  color: Colors.white.withOpacity(0.03),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

Widget _cardCourseItems(BuildContext context, int cardIndex) {
  final List<Color> badgeColors = [
    Color(0xFF4DC9D1),
    Color(0xFF0082CD),
    Color(0xFF8D5EF2),
  ];

  final data = cardIndex < cardDataList.length
      ? cardDataList[cardIndex]
      : cardDataList[0];

  return InkWell(
    onTap: () => {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailCardCarousel()),
      ),
    },
    child: Container(
      width: 320,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.20),
            blurRadius: 14,
            spreadRadius: 0,
            offset: Offset(4, 8),
          ),
        ],
        image: DecorationImage(
          image: AssetImage(data.imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color(0xFFFCCC75),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                "Free E-Book",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Spacer(),
            Text(
              data.title,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
            ),
            Row(
              children: [
                Icon(Icons.timer_outlined, color: Colors.white),
                Text(
                  " ${data.duration}",
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.tags.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: badgeColors[index % badgeColors.length],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      data.tags[index],
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(data.imageModerator),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.nameModerator,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        data.positionModerator,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
