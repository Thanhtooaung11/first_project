import 'package:flutter/material.dart';

class GetDice extends StatelessWidget {
  const GetDice({Key? key, required this.count}) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        ///1, 2, 3
        if (count <= 3) ...[
          SizedBox(
            width: 80,
            height: 80,
            child: Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(count, (index) => buildDot())),
          )
        ] else if (count == 4) ...[
          ///4
          SizedBox(
            width: 80,
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildDot(),
                    buildDot(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildDot(),
                    buildDot(),
                  ],
                ),
              ],
            ),
          ),
        ] else if (count == 5) ...[
          SizedBox(
            width: 80,
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildDot(),
                    buildDot(),
                  ],
                ),
                buildDot(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildDot(),
                    buildDot(),
                  ],
                ),
              ],
            ),
          )
        ] else ...[
          SizedBox(
            width: 80,
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildDot(),
                    buildDot(),
                    buildDot(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildDot(),
                    buildDot(),
                    buildDot(),
                  ],
                ),
              ],
            ),
          )
        ]
      ],
    );
  }

  Widget buildDot() {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 10,
      height: 10,
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
    );
  }
}
