import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void saveBoxData(String boxName, List<BookEntity> books) {
  var box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}
