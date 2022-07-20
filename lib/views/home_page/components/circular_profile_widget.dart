import 'package:flutter/material.dart';

class CircularProfileWidget extends StatefulWidget {
  const CircularProfileWidget(
      {Key? key,
      required this.asset,
      required this.name,
      this.isMyProfile = false,
      this.isPost = false})
      : super(key: key);
  final String asset;
  final String name;
  final bool isMyProfile;
  final bool isPost;

  @override
  State<CircularProfileWidget> createState() => _CircularProfileWidgetState();
}

class _CircularProfileWidgetState extends State<CircularProfileWidget> {
  late String asset;
  late String name;
  bool isMyProfile = false;

  @override
  void initState() {
    asset = widget.asset;
    name = widget.name;
    isMyProfile = widget.isMyProfile;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [
                Color(0xFFFFDD55),
                Color(0xFFFFDD55),
                Color(0xFFFF543E),
                Color(0xFFC837AB)
              ], begin: Alignment.bottomLeft)),
          child: Padding(
            padding: EdgeInsets.all(widget.isPost ? 1.0 : 2.0),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Colors.white, width: widget.isPost ? 2.5 : 0)),
              child: Image.asset(
                asset,
                width: widget.isPost ? 32 : 60,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        !widget.isPost
            ? Column(
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    name,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              )
            : const SizedBox()
      ],
    );
  }
}
