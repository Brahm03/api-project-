import 'package:material_ui/material_ui.dart';
import 'package:gadgets_store_admin/src/features/home/repository/home_repository.dart';

enum HomeStatus { loading, success, error }

class HomeProvider extends ChangeNotifier {
  HomeStatus status = HomeStatus.loading;
  List data = [];
  String deletingID = "";
  Future<void> getLaptops() async {
    try {
      final result = await HomeRepository.getLaptops();
      status = HomeStatus.success;
      data = result;
      notifyListeners();
    } catch (e) {
      status = HomeStatus.error;
      notifyListeners();
    }
  }

  Future<void> qoshish(
    String gpu,
    String image,
    String brand,
    String model,
  ) async {
    isLoading.value = true;
    try {
      await HomeRepository.addLaptop({
        "gpu": gpu,
        "image": image,
        "brand": brand,
        "model": model,
      });
      isLoading.value = false;
      getLaptops();
    } catch (e) {
      isLoading.value = false;
      print('Error keldi');
    }
  }

  Future<void> ochirish(String id) async {
    deletingID = id;
    isDeleting.value = true;
    try {
      await HomeRepository.deleteProduct(id);
      isDeleting.value = false;
      getLaptops();
    } catch (e) {
      print('Error on deleting $e');
      isDeleting.value = false;
    }
  }
}

ValueNotifier<bool> isLoading = ValueNotifier(false);
ValueNotifier<bool> isDeleting = ValueNotifier(false);
