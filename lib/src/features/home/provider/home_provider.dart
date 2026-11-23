import 'package:flutter/material.dart';
import 'package:gadgets_store_admin/src/features/home/repository/home_repository.dart';

enum HomeStatus { loading, success, error }

class HomeProvider extends ChangeNotifier {
  HomeStatus status = HomeStatus.loading;
  List data = [];
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
}
