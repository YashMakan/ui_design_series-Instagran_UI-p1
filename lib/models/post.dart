class Post {
  final String profilePicture;
  final String username;
  final List<String> posts;
  final int likes;
  final String caption;
  final int comments;
  final DateTime dateTime;

  Post(
      {required this.profilePicture,
      required this.username,
      required this.posts,
      required this.likes,
      required this.caption,
      required this.comments,
      required this.dateTime});
}
