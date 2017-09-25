// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:math';
import 'package:angular/angular.dart';
import 'package:grizzly_notebook/tabled_viewers/series_viewer/series_table.dart';
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
  <series-table [data]="data">
  </series-table>
  ''',
  directives: const [SeriesViewComponent],
  providers: const [],
)
class AppComponent {
  final DoubleSeries<String> data =
      new DoubleSeries<String>(new List.generate(1000, (i) => log(i)),
          labels: new List.generate(1000, (i) => i.toString()));
}

void main() {
  bootstrap(AppComponent);
}
