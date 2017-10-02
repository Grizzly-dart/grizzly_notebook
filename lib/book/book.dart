library grizzly.notebook.book;

import 'package:angular/angular.dart';
import 'package:grizzly_notebook/grizzly_notebook.dart';
import 'package:grizzly_series/grizzly_series.dart';

@Component(
  selector: 'book',
  styleUrls: const ['book.css'],
  templateUrl: 'book.html',
  directives: const [
    CORE_DIRECTIVES,
    GRIZZLY_COMPONENTS,
  ],
)
class BookComponent {
  List _cells = [];

  List get cells => _cells;

  @Input()
  set cells(List v) {
    _cells = v ?? [];
  }

  void addCell(cell) {
    if (cell is Series) {
      _cells.add(new SeriesCell(cell));
    } else if (cell is Iterable) {
      _cells.add(new IterableCell(cell));
    } else {
      _cells.add(cell);
    }
  }

  void addSeries(Series cell) {
    _cells.add(new SeriesCell(cell));
  }

  void addMarkdown(String cell) {
    _cells.add(cell);
  }

  int getType(cell) {
    if (cell is SeriesCell) {
      return 1;
    } else if (cell is IterableCell) {
      return 2;
    } else if (cell is String) {
      return 3;
    } else {
      return 0;
    }
  }
}
