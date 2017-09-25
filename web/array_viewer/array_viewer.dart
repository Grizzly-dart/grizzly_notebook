// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:math';
import 'package:angular/angular.dart';
import 'package:grizzly_notebook/tabled_viewers/iterable_viewer/iterable_table.dart';
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
  <iterable-table heading="Log" [data]="data">
  </iterable-table>
  ''',
  directives: const [IterableViewComponent],
  providers: const [],
)
class AppComponent {
  final DoubleArray data =
      new DoubleArray.from(new List.generate(1000, (i) => log(i) / LN10));
}

void main() {
  bootstrap(AppComponent);
}
