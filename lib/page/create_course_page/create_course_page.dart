import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../module/blocs/create_course_bloc/create_course_bloc.dart';
import '../../widget/app_button.dart';
import '../../widget/app_input.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/keyboard_dismiss.dart';
import '../root_page/root_page.dart';

class CreateCoursePage extends StatefulWidget {
  const CreateCoursePage({Key? key}) : super(key: key);

  @override
  State<CreateCoursePage> createState() => _CreateCoursePageState();
}

class _CreateCoursePageState extends State<CreateCoursePage> {
  final CreateCourseBloc _bloc = CreateCourseBloc();
  final _formKey = GlobalKey<FormState>();
  final nameTextController = TextEditingController();
  final typeTextController = TextEditingController();
  final priceTextController = TextEditingController();
  final detailTextController = TextEditingController();
  final nameKey = GlobalKey();
  final typeKey = GlobalKey();
  final priceKey = GlobalKey();
  final detailKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorGrayd2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBarWidget(
            title: "Create Course",
            leadingWidget: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: backAppBarIcon,
            ),
          ),
          body: WKeyboardDismiss(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AppInput(
                        title: "Tên khóa học",
                        controller: nameTextController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Empty text";
                          }
                          return null;
                        },
                      ),
                      hSpaceItem2,
                      AppInput(
                        title: "Thể loại",
                        controller: typeTextController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Empty text";
                          }
                          return null;
                        },
                      ),
                      hSpaceItem2,
                      AppInput(
                        title: "Giá tiền",
                        controller: priceTextController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Empty text";
                          }
                          return null;
                        },
                      ),
                      hSpaceItem2,
                      AppInput(
                        title: "Mô tả khóa học",
                        controller: detailTextController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Empty text";
                          }
                          return null;
                        },
                      ),
                      hSpaceItem2,
                      Center(
                        child: SizedBox(
                          width: 120,
                          child: AppButton(
                            backgroundColor: Colors.blue,
                            title: 'Thêm khóa học',
                            onTap: () {
                              if (_formKey.currentState?.validate() == true) {
                                onSubmit();
                              } else {
                                if (nameTextController.text.isEmpty) {
                                  Scrollable.ensureVisible(
                                      nameKey.currentContext!);
                                }
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  onSubmit() async {
    final nameCourse = nameTextController.text;
    final typeCourse = typeTextController.text;
    final priceCourse = priceTextController.text;
    final detailCourse = detailTextController.text;
    try {
      await _bloc.createCourse(
          nameCourse, typeCourse, priceCourse, detailCourse);

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => RootPage()),
          (route) => false);
    } catch (e) {
      print("Error");
    }
  }
}
