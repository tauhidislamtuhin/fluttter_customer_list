import 'package:customer_list/models/customer_list.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/customer_api_service.dart';
import '../views/auth/login/login.dart';

class HomeController extends GetxController {
  RxList<Customer> customers = <Customer>[].obs;
  RxBool isLoading = false.obs;

  RxInt currentPage = 0.obs;
  final int pageSize = 20;
  RxInt totalPages = 20.obs;

  final CustomerApiService _apiService = CustomerApiService();

  @override
  void onInit() {
    super.onInit();
    fetchCustomers(page: currentPage.value);
  }

  void fetchCustomers({required int page}) async {
    isLoading.value = true;

    final response = await _apiService.fetchCustomerList(page+1);
    isLoading.value = false;

    if (response != null && response.customerList != null) {
      customers.value = response.customerList!.cast<Customer>();
      totalPages.value = response.pageInfo?.pageCount ?? 1;
      currentPage.value = page;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    Get.snackbar('Logout', 'Logout successful');
    Get.offAll(() => const LoginScreen());
  }
}
