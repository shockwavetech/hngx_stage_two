import 'dart:io';

class DataProvider {
  static Map<String, dynamic> userData = {
    'name': "Marshal Moses",
    'role': "Flutter Developer",
    'phone': "07044759923",
    'email': "marshalmoses7090@gmail.com",
    'slack': "Marshal Moses",
    'github': "shockwavetech",
    'bio': "As a dedicated Flutter developer, I am on a mission to bring innovative mobile app solutions to life. With a strong foundation in software development and a deep love for creating beautiful, user-friendly interfaces, I'm committed to crafting seamless, cross-platform experiences that users adore."
  };
  static bool imageUpdated = false;
  static File? imageFile;
  static int currentIndex = 0;
}