class Message {
  final String senderName;
  final String lastMessage;
  final String time;
  final String avatar;
  final int unreadCount;

  Message({
    required this.senderName,
    required this.lastMessage,
    required this.time,
    required this.avatar,
    required this.unreadCount,
  });
}

final List<Message> dummyMessages = [
  Message(
    senderName: "Farhan Kebab",
    lastMessage: "Bro, lu lagi apa? Nongki yuk besok, gw traktir kopi!",
    time: "10:30 AM",
    avatar: 'assets/person/person (12).jpg',
    unreadCount: 3,
  ),
  Message(
    senderName: "Siti Mukbang",
    lastMessage: "Deadline projectnya diundur minggu depan cuy! Lega kan?",
    time: "9:15 AM",
    avatar: 'assets/person/person (13).jpg',
    unreadCount: 0,
  ),
  Message(
    senderName: "Budi Tiba-tiba",
    lastMessage: "File yang kemaren kita bahas bisa lu kirim ga? Penting nih!",
    time: "Yesterday",
    avatar: 'assets/person/person (14).jpg',
    unreadCount: 1,
  ),
  Message(
    senderName: "Maya Duit",
    lastMessage: "Makasih ya udah bantu presentasinya! Lu the best!",
    time: "Yesterday",
    avatar: 'assets/person/person (15).jpg',
    unreadCount: 0,
  ),
  Message(
    senderName: "Agus Kepleset",
    lastMessage: "Kabarin gw kalo lu free, perlu telepon bentar nih!",
    time: "8/9/23",
    avatar: 'assets/person/person (16).jpg',
    unreadCount: 2,
  ),
  Message(
    senderName: "Dewi Gemoy",
    lastMessage: "Ruangan meeting pindah ke ruang 402 ya ges ya",
    time: "8/8/23",
    avatar: 'assets/person/person (17).jpg',
    unreadCount: 0,
  ),
  Message(
    senderName: "Joko Garing",
    lastMessage: "Laporan udah selesai, gw email sekarang ya! Santuy...",
    time: "8/7/23",
    avatar: 'assets/person/person (18).jpg',
    unreadCount: 0,
  ),
  Message(
    senderName: "Putri Cilok",
    lastMessage: "Met ultah brooo! 🎉 Weekend kita celebrate yuk!",
    time: "8/5/23",
    avatar: 'assets/person/person (19).jpg',
    unreadCount: 5,
  ),
  Message(
    senderName: "Rian Gabut",
    lastMessage: "Meetingnya geser jam 3 boleh ga? Gw lagi ada urusan dadakan",
    time: "8/4/23",
    avatar: 'assets/person/person (20).jpg',
    unreadCount: 0,
  ),
  Message(
    senderName: "Lala Galau",
    lastMessage: "Clientnya suka banget sama proposal kita! Gaskeun team!",
    time: "8/3/23",
    avatar: 'assets/person/person (21).jpg',
    unreadCount: 0,
  ),
  Message(
    senderName: "Aldi Mager",
    lastMessage: "Jangan lupa lunch team besok ya! Ada menu spesial!",
    time: "8/2/23",
    avatar: 'assets/person/person (22).jpg',
    unreadCount: 0,
  ),
];
