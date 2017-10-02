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
  <book [cells]="cells"></book>
  ''',
  directives: const [BookComponent],
)
class AppComponent {
  final List cells = [
    '''
# Title 1

## Title 1.1

What ever!

> Block quotes

**Note**: Markdown content!
''',
    new IterableCell<num>(new List.generate(45, (n) => n), dataName: 'log(x)'),
    new SeriesCell(
        new DoubleSeries.fromLabels([1, 2, 3, 4], (int b, _) => b.toDouble())),
  ];
}

void main() {
  bootstrap(AppComponent);
}
