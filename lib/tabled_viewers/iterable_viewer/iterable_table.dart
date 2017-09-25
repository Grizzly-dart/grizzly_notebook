library grizzly.notebook.tabled_viewers.iterable_viewer;

import 'dart:math' as math;
import 'package:angular/angular.dart';

@Component(
  selector: 'iterable-table',
  styleUrls: const ['iterable_table.css'],
  templateUrl: 'iterable_table.html',
  directives: const [
    CORE_DIRECTIVES,
  ],
  providers: const [],
)
class IterableViewComponent {
  /// Number of rows per page
  @Input()
  int numRows = 10;

  Iterable<dynamic> _data;

  /// Data to display
  @Input()
  set data(Iterable<dynamic> v) {
    _data = v;
    _dataLen = _data == null ? 0 : _data.length;
    update();
  }

  int _page = 1;

  int get page => _page;

  /// Current page
  @Input()
  set page(int v) {
    if (v <= 0 || v == null)
      v = 1;
    else if (v > maxPages) v = maxPages;
    _page = v;
    update();
  }

  @Input()
  String heading;

  void setPageNumAsString(String v) {
    page = int.parse(v, onError: (_) => 1);
  }

  int _dataLen = 0;

  int get maxPages => (_dataLen / numRows).ceil();

  int get startRow => (page - 1) * numRows;

  int get endRow => (page == maxPages ? _dataLen : page * numRows) - 1;

  int get maxPageDigits => (math.log(maxPages)/math.LN10).ceil();

  int get totalRowsDigits => (math.log(_dataLen)/math.LN10).ceil();

  void update() {
    if (_data == null) {
      _viewData.clear();
      return;
    }

    final int mp = maxPages;
    if (page > mp) {
      _page = mp;
    } else if (page <= 0) {
      _page = 1;
    }

    final Iterator<dynamic> iterator = _data.skip(startRow).iterator;
    iterator.moveNext();
    final int len = page == maxPages ? _dataLen - startRow : numRows;
    _viewData = new List(len);

    for (int i = 0; i < len; i++) {
      _viewData[i] = iterator.current;
      iterator.moveNext();
    }
  }

  List<dynamic> _viewData;

  List<dynamic> get viewData => _viewData;

  void first() {
    page = 1;
  }

  void last() {
    page = maxPages;
  }

  void previous() {
    page--;
  }

  void next() {
    page++;
  }
}
