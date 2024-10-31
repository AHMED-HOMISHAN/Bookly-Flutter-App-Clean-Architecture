import 'package:bookly/Features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewseddBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewseddBooks() {
    // TODO: implement fetchNewseddBooks
    throw UnimplementedError();
  }
}