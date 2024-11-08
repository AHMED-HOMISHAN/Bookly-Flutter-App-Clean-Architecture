import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:meta/meta.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.fetchNewestBooksUseCase) : super(NewsetBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewstBooks() async {
    emit(NewsetBooksInitial());
    var result = await fetchNewestBooksUseCase.call();
    result.fold((failure) {
      emit(NewsetBooksFailure(failure.message));
    }, (data) {
      emit(NewsetBooksSuccess(books: data));
    });
  }
}
