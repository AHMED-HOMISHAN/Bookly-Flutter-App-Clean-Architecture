part of 'newset_books_cubit.dart';

@immutable
abstract class NewsetBooksState {}

class NewsetBooksInitial extends NewsetBooksState {}

class NewsetBooksLoading extends NewsetBooksState {}

class NewsetBooksSuccess extends NewsetBooksState {
  final List<BookEntity> books;
  NewsetBooksSuccess({
    required this.books,
  });
}

class NewsetBooksFailure extends NewsetBooksState {
  final String message;

  NewsetBooksFailure(this.message);
}
