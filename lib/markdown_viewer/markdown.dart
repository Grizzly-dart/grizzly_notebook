library grizzly.notebook.markdown_viewer;

import 'package:markd/markdown.dart';
import 'package:angular/angular.dart';
import 'package:grizzly_notebook/grizzly_notebook.dart';

@Component(
  selector: 'markdown-viewer',
  styleUrls: const ['markdown.css'],
  templateUrl: 'markdown.html',
  directives: const [
    CORE_DIRECTIVES,
  ],
  providers: const [],
)
class MarkdownComponent implements AfterViewInit {
  @override
  ngAfterViewInit() {
    container.nativeElement.innerHtml = markdownToHtml(_content ?? '');
  }

  String _content;

  String get content => _content;

  @Input()
  set content(String v) {
    _content = v;

    if (container != null) {
      container.nativeElement.innerHtml = markdownToHtml(_content ?? '');
    }
  }

  @ViewChild('container')
  ElementRef container;
}
