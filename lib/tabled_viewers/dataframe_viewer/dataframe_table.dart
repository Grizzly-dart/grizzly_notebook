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
  DataFrameCell _cell;

  @Input()
  set cell(DataFrameCell v) {
    _cell = v;
    update();
  }

  Iterable get names => _data != null ? _data.columns : [];

  int get numRows => _cell.numRows;

  DataFrame get _data => _cell.data;

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

  int get _dataLen => _data.length;

  int get maxPages => (_dataLen / numRows).ceil();

  int get startRow => (page - 1) * numRows;

  int get endRow => (page == maxPages ? _dataLen : page * numRows) - 1;

  int get maxPageDigits =>
      maxPages != 0 ? (math.log(maxPages) / math.LN10).ceil() : 1;

  int get totalRowsDigits =>
      _dataLen != 0 ? (math.log(_dataLen) / math.LN10).ceil() : 1;

  void update() {
    if (_data == null || _dataLen == 0) {
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

  List<Pair> _viewData = <Pair>[];

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
