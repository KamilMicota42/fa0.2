import 'package:fanastic_assistant/logic/snackbar/show_snack_bar.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton<ShowSnackBar>(() => ShowSnackBar());
}
