library grizzly.notebook.tabled_viewers.dataframe_viewer;

import 'dart:math' as math;
import 'package:grizzly_series/grizzly_series.dart';
import 'package:angular/angular.dart';
import 'package:grizzly_notebook/grizzly_notebook.dart';

// TODO add horizontal scroll bars

@Component(
  selector: 'dataframe-table',
  styleUrls: const ['dataframe_table.css'],
  templateUrl: 'dataframe_table.html',
  directives: const [
    CORE_DIRECTIVES,
  ],
  providers: const [],
)
class DataFrameViewComponent {
  SeriesCell _cell;

  @Input()
  set cell(SeriesCell v) {
    _cell = v;
    _dataLen = _data == null ? 0 : _data.length;
    update();
  }

  int get numRows => _cell.numRows;

  dynamic get name => _data?.name;

  Series get _data => _cell.data;

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

  void setPageNumAsString(String v) {
    page = int.parse(v, onError: (_) => 1);
  }

  int _dataLen = 0;

  int get maxPages => (_dataLen / numRows).ceil();

  int get startRow => (page - 1) * numRows;

  int get endRow => (page == maxPages ? _dataLen : page * numRows) - 1;

  int get maxPageDigits => (math.log(maxPages) / math.LN10).ceil();

  int get totalRowsDigits => (math.log(_dataLen) / math.LN10).ceil();

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

    final int len = page == maxPages ? _dataLen - startRow : numRows;
    _viewData = _data.enumerateSliced(startRow, startRow + len - 1).toList();
  }

  List<Pair> _viewData;

  List<Pair> get viewData => _viewData;

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
