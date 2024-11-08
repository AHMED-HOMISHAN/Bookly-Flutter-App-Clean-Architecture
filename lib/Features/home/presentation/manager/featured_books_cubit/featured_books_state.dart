part of 'featured_books_cubit.dart';

@immutable
abstract class FeaturedBooksState {}

class FeaturedBooksInital extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}

class FeaturedBooksPaginationLoading extends FeaturedBooksState {}

class FeaturedBooksPaginationFailur extends FeaturedBooksState {
  final String errorMessage;

  FeaturedBooksPaginationFailur({required this.errorMessage});
}

class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> books;

  FeaturedBooksSuccess({required this.books});
}

class FeaturedBooksFailur extends FeaturedBooksState {
  final String errorMessage;

  FeaturedBooksFailur({required this.errorMessage});
}
