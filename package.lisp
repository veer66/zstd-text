;;;; package.lisp

(defpackage #:zstd-text
  (:use #:cl #:utf8-input-stream)
  (:export #:with-open-zstd-utf8-file))
