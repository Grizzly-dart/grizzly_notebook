// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular/angular.dart';
import 'package:grizzly_notebook/grizzly_notebook.dart';

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
  <iterable-table [cell]="data"></iterable-table>
  ''',
  directives: const [IterableViewComponent],
  providers: const [],
)
class AppComponent {
  final IterableCell<num> data = new IterableCell<num>(
      new List.generate(45, (n) => n),
      dataName: 'log(x)');
}

void main() {
  bootstrap(AppComponent);
}
