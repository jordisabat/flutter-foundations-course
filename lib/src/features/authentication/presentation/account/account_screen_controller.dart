import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountSreenController extends StateNotifier<AsyncValue> {
  AccountSreenController({required this.authRepository})
      : super(const AsyncValue.data(null));
  final FakeAuthRepository authRepository;

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => authRepository.signOut());
  }
}

final accountScreenControllerProvider =
    StateNotifierProvider.autoDispose<AccountSreenController, AsyncValue>(
        (ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AccountSreenController(
    authRepository: authRepository,
  );
});
