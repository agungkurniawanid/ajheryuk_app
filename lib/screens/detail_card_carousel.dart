import 'dart:ui';

import 'package:ajheryuk/models/carousels.dart';
import 'package:ajheryuk/providers/general_provider.dart';
import 'package:ajheryuk/providers/time_slot_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailCardCarousel extends ConsumerStatefulWidget {
  const DetailCardCarousel({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DetailCardCarouselState();
}

class _DetailCardCarouselState extends ConsumerState<DetailCardCarousel> {
  final List<Color> badgeColors = [
    Color(0xFF4DC9D1),
    Color(0xFF0082CD),
    Color(0xFF8D5EF2),
  ];

  final data = cardDataList[0];

  final List<Map<String, String>> lessonList = [
    {
      "title": "How to get feedback on their products in just 5 days",
      "duration": "20:45 minutes",
    },
    {"title": "Creating wireframes for beginner", "duration": "15:30 minutes"},
    {
      "title": "Understanding user flow in product design",
      "duration": "18:00 minutes",
    },
    {
      "title": "Setting up a UX research plan & tools",
      "duration": "22:10 minutes",
    },
    {
      "title": "Conducting user interviews in Figma & Notion",
      "duration": "19:25 minutes",
    },
    {
      "title": "Synthesizing findings into design & prototype",
      "duration": "17:45 minutes",
    },
    {
      "title": "Presenting design work to stakeholders",
      "duration": "25:00 minutes",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _detailCourseCardAppBar(context),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _cardCourseItemDetail(context),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            "Step design sprint for beginner",
                            style: GoogleFonts.poppins(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 8,
                          ),
                          child: Row(
                            children: List.generate(data.tags.length, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: _badgeTag(
                                  data.tags[index],
                                  badgeColors[index % badgeColors.length],
                                ),
                              );
                            }),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            "In this course I'll show the step by step, day by day process to build better products, just as Google, Slack, KLM and many others do.",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Color(0xFF9D9FA0),
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        _moderatorCourse(),
                        ...lessonList.asMap().entries.map((entry) {
                          int index = entry.key;
                          var item = entry.value;
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: _listLessonItems(
                              context,
                              title: item["title"]!,
                              duration: item["duration"]!,
                              isEven: index % 2 == 0,
                            ),
                          );
                        }).toList(),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25),
                          ),
                        ),
                        builder: (context) {
                          return Consumer(
                            builder: (context, ref, _) {
                              final selectedIndex = ref.watch(timeSlotProvider);
                              final List<String> timeSlots = [
                                '08:00 AM',
                                '10:00 AM',
                                '12:00 PM',
                                '02:00 PM',
                                '04:00 PM',
                                '06:00 PM',
                                '08:00 PM',
                                '10:00 PM',
                                'Full Day',
                              ];
                              final List<bool> availableSlots = [
                                true,
                                true,
                                true,
                                true,
                                false,
                                true,
                                false,
                                true,
                                true,
                              ];

                              return DraggableScrollableSheet(
                                expand: false,
                                initialChildSize: 0.8,
                                minChildSize: 0.4,
                                maxChildSize: 0.8,
                                builder: (_, controller) => Container(
                                  padding: const EdgeInsets.all(30),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25),
                                    ),
                                  ),
                                  child: SingleChildScrollView(
                                    controller: controller,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 7,
                                          margin: const EdgeInsets.only(
                                            bottom: 20,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[400],
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Available time',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  "Adjust to your schedule",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(18.0),
                                              decoration: BoxDecoration(
                                                color: Color(0xFF9D9FA0),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(
                                                      0xFFEC5F5F,
                                                    ).withOpacity(0.25),
                                                    spreadRadius: 0,
                                                    blurRadius: 14,
                                                    offset: Offset(0, 5),
                                                  ),
                                                ],
                                              ),
                                              child: Icon(
                                                Icons.calendar_month_outlined,
                                                color: Colors.white,
                                                size: 28,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        GridView.builder(
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                crossAxisSpacing: 12,
                                                mainAxisSpacing: 12,
                                                childAspectRatio: 0.9,
                                              ),
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: 9,
                                          itemBuilder: (context, index) {
                                            final isSelected =
                                                selectedIndex == index;
                                            final isAvailable =
                                                availableSlots[index];

                                            return GestureDetector(
                                              onTap: isAvailable
                                                  ? () {
                                                      ref
                                                          .read(
                                                            timeSlotProvider
                                                                .notifier,
                                                          )
                                                          .selectTimeSlot(
                                                            index,
                                                          );
                                                      HapticFeedback.lightImpact();
                                                    }
                                                  : null,
                                              child: AnimatedContainer(
                                                duration: const Duration(
                                                  milliseconds: 200,
                                                ),
                                                curve: Curves.easeInOut,
                                                decoration: BoxDecoration(
                                                  color: isAvailable
                                                      ? isSelected
                                                            ? const Color(
                                                                0xFFEC5F5F,
                                                              )
                                                            : const Color(
                                                                0xFFEC5F5F,
                                                              ).withOpacity(0.2)
                                                      : Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: isSelected
                                                      ? Border.all(
                                                          color: const Color(
                                                            0xFFEC5F5F,
                                                          ),
                                                          width: 2,
                                                        )
                                                      : null,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      isAvailable
                                                          ? Icons.access_time
                                                          : Icons.lock_outline,
                                                      color: isAvailable
                                                          ? isSelected
                                                                ? Colors.white
                                                                : const Color(
                                                                    0xFFEC5F5F,
                                                                  )
                                                          : Colors.grey,
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Text(
                                                      timeSlots[index],
                                                      style: TextStyle(
                                                        color: isAvailable
                                                            ? isSelected
                                                                  ? Colors.white
                                                                  : Colors.black
                                                            : Colors.grey,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Schedule date & time",
                                            style: GoogleFonts.poppins(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Consumer(
                                              builder: (context, ref, _) {
                                                final isChecked = ref.watch(
                                                  checkboxProvider,
                                                );

                                                return Container(
                                                  decoration: BoxDecoration(
                                                    color: isChecked
                                                        ? const Color(
                                                            0xFFEC5F5F,
                                                          ).withOpacity(0.2)
                                                        : Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          6,
                                                        ),
                                                    border: Border.all(
                                                      color: isChecked
                                                          ? const Color(
                                                              0xFFEC5F5F,
                                                            )
                                                          : Colors
                                                                .grey
                                                                .shade400,
                                                      width: 1.5,
                                                    ),
                                                  ),
                                                  width: 24,
                                                  height: 24,
                                                  child: Theme(
                                                    data: Theme.of(context).copyWith(
                                                      checkboxTheme: CheckboxThemeData(
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                4,
                                                              ),
                                                        ),
                                                        fillColor:
                                                            MaterialStateProperty.all(
                                                              const Color(
                                                                0xFFEC5F5F,
                                                              ),
                                                            ),
                                                        checkColor:
                                                            MaterialStateProperty.all(
                                                              Colors.white,
                                                            ),
                                                        overlayColor:
                                                            MaterialStateProperty.all(
                                                              Colors
                                                                  .transparent,
                                                            ),
                                                        visualDensity:
                                                            VisualDensity
                                                                .compact,
                                                      ),
                                                    ),
                                                    child: Transform.scale(
                                                      scale: 0.9,
                                                      child: Checkbox(
                                                        value: isChecked,
                                                        onChanged: (value) {
                                                          ref
                                                                  .read(
                                                                    checkboxProvider
                                                                        .notifier,
                                                                  )
                                                                  .state =
                                                              value!;
                                                        },
                                                        side: BorderSide
                                                            .none, // hilangkan border default
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: Text(
                                                "12 October, 2020 at 09.45 AM",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: const Color(
                                                    0xFF9D9FA0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        _buttonJoinClass(context),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEC5F5F),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          "Follow Class",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
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

Widget _buttonJoinClass(context) {
  return FractionallySizedBox(
    widthFactor: 1.0,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFEC5F5F),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      onPressed: () {},
      child: Text(
        'Join & Save',
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}

Widget _detailCourseCardAppBar(context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xFFF6F7FA),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Color(0xFFEC5F5F),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Text(
          "Course Detail",
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        IconButton(
          icon: const Icon(Icons.favorite_outline, color: Color(0xFFEC5F5F)),
          onPressed: () {},
        ),
      ],
    ),
  );
}

Widget _badgeTag(String text, Color bgColor) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    ),
  );
}

Widget _listLessonItems(
  BuildContext context, {
  required String title,
  required String duration,
  required bool isEven,
}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.symmetric(vertical: 8),
    padding: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: Color(0xFFF6F7FA),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(20.0),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: isEven ? Colors.white : Color(0xFFEC5F5F),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Icon(
              Icons.play_arrow,
              color: isEven ? Color(0xFFEC5F5F) : Colors.white,
              size: 40,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: SizedBox(
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                Text(
                  duration,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF9D9FA0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _moderatorCourse() {
  return Container(
    padding: const EdgeInsets.all(20.0),
    decoration: BoxDecoration(color: Colors.white),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/person/person (11).jpg"),
                  radius: 34,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Najla Putri",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "UI/UX Designer",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF9D9FA0),
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Icon(Icons.timer_outlined, color: Color(0xFF9D9FA0)),
                const SizedBox(width: 8),
                Text(
                  "5h 20m",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF9D9FA0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 6.0,
              ),
              decoration: BoxDecoration(
                color: Color(0xFFFCCC75),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                "Free E-Book",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _cardCourseItemDetail(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.20),
            blurRadius: 14,
            spreadRadius: 0,
            offset: const Offset(4, 8),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: 16 / 12,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/Base Background.png",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            child: ClipOval(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: 80,
                    ),
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
