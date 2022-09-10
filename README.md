# zstd-text
### _Vee Satayamas <vsatayamas@gmail.com>_

A macro for reading/writing UTF-8 text for Zstd stream 

## License

GPL-3

## Example

```Lisp
(defpackage :example
  (:use :cl :zstd-text))

(in-package :example)

(with-open-zstd-utf8-file (in #P"x1.zst" :direction :input)
  (with-open-zstd-utf8-file (out #P"x2.zst" :direction :output)
    (loop for line = (read-line in nil :EOF)
          until (eq line :EOF)
          do
            (let* ((n (read-from-string line))
                   (n* (+ n 100)))
               (format out "n* = ~A~%" n*)))))
```
