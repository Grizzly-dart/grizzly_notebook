// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:math';
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
  <markdown-viewer [content]="data"></markdown-viewer>
  ''',
  directives: const [MarkdownComponent],
  providers: const [],
)
class AppComponent {
  final String data = '''
# Title 1

## Title 1.1

What ever!

> Block quotes

**Note**: Markdown content!
''';
}

void main() {
  bootstrap(AppComponent);
}
