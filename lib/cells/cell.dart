import 'package:grizzly_series/grizzly_series.dart';

/// Encloses the information needed to display [Iterable]
class IterableCell<T> {
  /// Number of rows that should be displayed in a page
  ///
  /// Defaults to 10
  final int numRows;

  /// Data to display
  final Iterable<T> data;

  final String dataName;

  IterableCell(this.data, {this.numRows: 10, this.dataName});
}

/// Encloses the information needed to display [Series]
class SeriesCell<IT, VT> {
  /// Number of rows that should be displayed in a page
  ///
  /// Defaults to 10
  int numRows = 10;

  /// Data to display
  Series<IT, VT> data;

  SeriesCell(this.data, {this.numRows: 10});
}
