class CardData {
  final String title;
  final String duration;
  final List<String> tags;
  final String imagePath;
  final String imageModerator;
  final String nameModerator;
  final String positionModerator;

  CardData({
    required this.title,
    required this.duration,
    required this.tags,
    required this.imagePath,
    this.imageModerator = "",
    this.nameModerator = "",
    this.positionModerator = "",
  });
}

final List<CardData> cardDataList = [
  CardData(
    title: "UI/UX Design Basics",
    duration: "4h 10m",
    tags: ["UI/UX", "Design", "Beginner"],
    imagePath: "assets/images/Base Background.png",
    imageModerator: "assets/person/person (11).jpg",
    nameModerator: "Najla Putri",
    positionModerator: "UI/UX Designer",
  ),
  CardData(
    title: "Flutter Development",
    duration: "6h 45m",
    tags: ["Coding", "Flutter", "Intermediate"],
    imagePath: "assets/images/bg (2).png",
    imageModerator: "assets/person/person (12).jpg",
    nameModerator: "Budi Santoso",
    positionModerator: "Flutter Developer",
  ),
  CardData(
    title: "SEO Marketing",
    duration: "3h 20m",
    tags: ["Marketing", "SEO", "Advanced"],
    imagePath: "assets/images/bg (3).png",
    imageModerator: "assets/person/person (13).jpg",
    nameModerator: "Sari Wulandari",
    positionModerator: "Digital Marketing Specialist",
  ),
  CardData(
    title: "Business Strategy",
    duration: "5h 00m",
    tags: ["Business", "Strategy", "Pro"],
    imagePath: "assets/images/bg (4).png",
    imageModerator: "assets/person/person (14).jpg",
    nameModerator: "Agus Prasetyo",
    positionModerator: "Business Analyst",
  ),
  CardData(
    title: "Photography Mastery",
    duration: "2h 50m",
    tags: ["Photography", "Editing", "Basic"],
    imagePath: "assets/images/bg (5).png",
    imageModerator: "assets/person/person (15).jpg",
    nameModerator: "Putri Ayuningtyas",
    positionModerator: "Professional Photographer",
  ),
  CardData(
    title: "Copywriting Tips",
    duration: "3h 15m",
    tags: ["Writing", "Copywriting", "Expert"],
    imagePath: "assets/images/bg (6).png",
    imageModerator: "assets/person/person (16).jpg",
    nameModerator: "Rizki Hartono",
    positionModerator: "Senior Copywriter",
  ),
  CardData(
    title: "Music Production",
    duration: "4h 30m",
    tags: ["Music", "Production", "Starter"],
    imagePath: "assets/images/bg (7).png",
    imageModerator: "assets/person/person (17).jpg",
    nameModerator: "Dian Prasetya",
    positionModerator: "Music Producer",
  ),
  CardData(
    title: "Healthy Lifestyle",
    duration: "2h 40m",
    tags: ["Health", "Fitness", "Coach"],
    imagePath: "assets/images/bg (8).png",
    imageModerator: "assets/person/person (18).jpg",
    nameModerator: "Eka Susanti",
    positionModerator: "Fitness Coach",
  ),
  CardData(
    title: "Smart Investment",
    duration: "5h 20m",
    tags: ["Finance", "Investment", "Guru"],
    imagePath: "assets/images/bg (9).png",
    imageModerator: "assets/person/person (19).jpg",
    nameModerator: "Fajar Nugroho",
    positionModerator: "Investment Advisor",
  ),
];
