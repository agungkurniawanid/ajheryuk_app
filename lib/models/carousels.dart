class CardData {
  final String title;
  final String duration;
  final List<String> tags;
  final String imagePath;

  CardData({
    required this.title,
    required this.duration,
    required this.tags,
    required this.imagePath,
  });
}

final List<CardData> cardDataList = [
  CardData(
    title: "UI/UX Design Basics",
    duration: "4h 10m",
    tags: ["UI/UX", "Design", "Beginner"],
    imagePath: "assets/images/Base Background.png",
  ),
  CardData(
    title: "Flutter Development",
    duration: "6h 45m",
    tags: ["Coding", "Flutter", "Intermediate"],
    imagePath: "assets/images/bg (2).png",
  ),
  CardData(
    title: "Advanced Training in SEO Marketing",
    duration: "3h 20m",
    tags: ["Marketing", "SEO", "Advanced"],
    imagePath: "assets/images/bg (3).png",
  ),
  CardData(
    title: "Business Strategy",
    duration: "5h 00m",
    tags: ["Business", "Strategy", "Pro"],
    imagePath: "assets/images/bg (4).png",
  ),
  CardData(
    title: "Photography Mastery",
    duration: "2h 50m",
    tags: ["Photography", "Editing", "Basic"],
    imagePath: "assets/images/bg (5).png",
  ),
  CardData(
    title: "Copywriting Tips",
    duration: "3h 15m",
    tags: ["Writing", "Copywriting", "Expert"],
    imagePath: "assets/images/bg (6).png",
  ),
  CardData(
    title: "Music Production",
    duration: "4h 30m",
    tags: ["Music", "Production", "Starter"],
    imagePath: "assets/images/bg (7).png",
  ),
  CardData(
    title: "Healthy Lifestyle",
    duration: "2h 40m",
    tags: ["Health", "Fitness", "Coach"],
    imagePath: "assets/images/bg (8).png",
  ),
  CardData(
    title: "Smart Investment",
    duration: "5h 20m",
    tags: ["Finance", "Investment", "Guru"],
    imagePath: "assets/images/bg (9).png",
  ),
];
