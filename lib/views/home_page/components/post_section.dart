import 'package:flutter/material.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/views/home_page/components/circular_profile_widget.dart';

import '../../../constants/assets.dart';

class PostSection extends StatefulWidget {
  const PostSection({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  State<PostSection> createState() => _PostSectionState();
}

class _PostSectionState extends State<PostSection> {
  late Post post;
  int selectedPostIndex = 0;
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) mathFunc = (Match match) => '${match[1]},';

  @override
  void initState() {
    post = widget.post;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border:
              Border(top: BorderSide(color: Colors.black.withOpacity(0.1)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.5, vertical: 8),
            child: Row(
              children: [
                CircularProfileWidget(
                  asset: post.profilePicture,
                  name: post.username,
                  isPost: true,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(post.username),
                const Spacer(),
                Image.asset(
                  MyAssets.moreIcon,
                  width: 24,
                )
              ],
            ),
          ),
          SizedBox(
            height: 470,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  selectedPostIndex = index;
                });
              },
              itemCount: post.posts.length,
              itemBuilder: (context, index) {
                return Image.asset(post.posts[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              children: [
                Image.asset(
                  MyAssets.heartIcon,
                  width: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Image.asset(
                    MyAssets.commentIcon,
                    width: 24,
                  ),
                ),
                Image.asset(
                  MyAssets.messageIcon,
                  width: 24,
                ),
                const SizedBox(
                  width: 29,
                ),
                Row(
                  children: List.generate(
                      post.posts.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: Container(
                              width: selectedPostIndex == index ? 6 : 4,
                              height: selectedPostIndex == index ? 6 : 4,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(selectedPostIndex == index
                                      ? 0xFF5792E7
                                      : 0xFFC4C4C4)),
                            ),
                          )),
                ),
                const Spacer(),
                Image.asset(
                  MyAssets.saveIcon,
                  width: 24,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.5),
            child: Text(
              "${post.likes.toString().replaceAllMapped(reg, mathFunc)} likes",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.5),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: "${post.username} ",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 14),
                ),
                TextSpan(
                    text: post.caption.substring(0, 100),
                    style: const TextStyle(color: Colors.black)),
                TextSpan(
                    text: "...more",
                    style: TextStyle(color: Colors.black.withOpacity(0.4)))
              ]),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.5),
            child: Text(
              "View all ${post.comments.toString().replaceAllMapped(reg, mathFunc)} comments",
              style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w500,
                  fontSize: 13),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  MyAssets.storyPersons[0],
                  width: 28,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "Add a comment...",
                  style: TextStyle(
                      fontSize: 13, color: Colors.black.withOpacity(0.5)),
                ),
                const Spacer(),
                const Text("❤"),
                const SizedBox(
                  width: 12,
                ),
                const Text("🙌")
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.5),
            child: Text(
              "1 day ago",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  color: Colors.black.withOpacity(0.5)),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
