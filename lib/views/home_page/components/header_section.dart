import 'package:flutter/material.dart';
import '../../../constants/assets.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(MyAssets.instagramLogo, width: 112,),
          SizedBox(
            child: Row(
              children: [
                Image.asset(MyAssets.addIcon, width: 24,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset(MyAssets.heartIcon, width: 24,),
                ),
                Image.asset(MyAssets.messageIcon, width: 24,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
