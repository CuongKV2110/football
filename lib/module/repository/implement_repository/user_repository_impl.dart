import '../../../service/api/user_service.dart';
import '../../models/dto/course_dto.dart';
import '../../models/dto/menu_item_dto.dart';
import '../../models/dto/post_dto.dart';
import '../abstract_repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final userService = UserService();

  @override
  Future<List<PostDto>> getListUser() {
    return userService.getListUser();
  }

  @override
  Future<List<MenuItemDto>> getListMenu() {
    return userService.getListMenu();
  }

  @override
  Future<List<CourseDto>> getListCourse() {
    return userService.getListCourse();
  }

  @override
  Future<CourseDto> getDetailCourse(String id) {
    return userService.getDetailCourse(id);
  }

  @override
  Future<bool> updateCourse(CourseDto courseUpdate) {
    return userService.updateCourse(courseUpdate);
  }

  @override
  Future<bool> deleteCourse(String id) {
    return userService.deleteCourse(id);
  }

  @override
  Future<bool> createCourse(
      String name, String type, String price, String description) {
    return userService.createCourse(name, type, price, description);
  }
}
