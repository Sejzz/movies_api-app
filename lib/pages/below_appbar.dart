import 'package:flutter/material.dart';

class below_appbar extends StatelessWidget {
  const below_appbar({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 0),
      height: size.height * 0.1,
      child: Stack(
        children: [
          Container(
            //  padding: EdgeInsets.only(left: 130, bottom: 200, right: 20),
            height: size.height * 0.15 - 70,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(45),
                  bottomRight: Radius.circular(45),
                )),
          ),
          Positioned(
            // top: 10,
            left: 0,
            right: 0,
            bottom: 10,
            child: Container(
                padding: EdgeInsets.only(
                  bottom: 0,
                ),
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                height: 52,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 4.5),
                          blurRadius: 12,
                          color: Colors.grey)
                    ]),
                child: Row(children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(left: 30, bottom: 0),
                        hintText: "Search",
                        hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 30,
                  ),
                  Padding(padding: EdgeInsets.only(right: 18))
                ])),
          ),
        ],
      ),
    );
  }
}
