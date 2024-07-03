import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import '../../constants/constants.dart';
import '../../module/blocs/Home_bloc/Home_bloc.dart';
import '../../module/blocs/Home_bloc/home_state.dart';
import '../../module/models/dto/course_dto.dart';
import '../../widget/app_input.dart';
import '../../widget/app_loading_overlay.dart';
import '../../widget/appbar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appBackground,
        body: SingleChildScrollView(
          primary: true,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.8,
              child: Column(
                children: [
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome!",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "KieuVanCuong",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Icon(Ionicons.notifications_outline)
                    ],
                  ),
                  hSpaceItem1,
                  const AppInput(
                    borderRadius: 10,
                    hintText: "Seach",
                    leadingIcon: Icon(Ionicons.search_outline),
                    trailingIcon: Icon(Ionicons.ellipsis_vertical_outline),
                  ),
                  hSpaceItem2,
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CachedNetworkImage(
                        height: 150,
                        imageUrl:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdrI4WIdmWIh49aeQl6pjQMlyqCQC6r6ZJbQ&usqp=CAU',
                        fit: BoxFit.fitHeight,
                      )),
                  hSpaceItem1,
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Main Categories",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("See all"),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return _categoryItem();
                      },
                      separatorBuilder: (context, index) {
                        return wSpaceItem2;
                      },
                      itemCount: 10,
                    ),
                  ),
                  hSpaceItem1,
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Popular Demands",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("See all"),
                    ],
                  ),
                  hSpaceItem1,
                  Expanded(
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            2, // Adjust the number of columns as needed
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: 2, // Replace with the number of items you want
                      itemBuilder: (BuildContext context, int index) {
                        return _courseItem();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _courseItem() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: colorYellow00,
      ),
    );
  }

  _categoryItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: colorYellow00,
        ),
      ),
    );
  }
}
