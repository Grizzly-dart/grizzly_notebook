// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:math';
import 'package:angular/angular.dart';
import 'package:grizzly_notebook/grizzly_notebook.dart';
import 'package:grizzly_series/grizzly_series.dart';

@Component(
  selector: 'my-app',
  styles: const [
    '''
    :host {
      width: 100%;
      height: 100%;
    }
    ''',
  ],
  template: '''
  <dataframe-table [cell]="data"></dataframe-table>
  ''',
  directives: const [DataFrameViewComponent],
)
class AppComponent implements AfterContentInit {
  DataFrameCell<String, String> data;

  @override
  ngAfterContentInit() {
    /* TODO
    final cell = new DataFrameCell<String, String>(
        new DataFrame<String, String>(
            {'x': new List<int>.generate(1000, (i) => i)},
            labels: new List<String>.generate(1000, (i) => i.toString())));
     */
    final cell =
        new DataFrameCell<String, String>(new DataFrame<String, String>({}));
    cell.data['x'] = new IntSeries<String>(
        new List<int>.generate(1000, (i) => i),
        labels: new List<String>.generate(1000, (i) => i.toString()));
    cell.data['log (x)'] = (cell.data['x'] as IntSeries<String>).log();
    data = cell;
    print(cell);
  }
}

void main() {
  bootstrap(AppComponent);
}
