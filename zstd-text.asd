;;;; zstd-text.asd

(asdf:defsystem #:zstd-text
  :description "A macro for reading/writing UTF-8 text for Zstd stream"
  :author "Vee Satayamas"
  :license  "GPL-3"
  :version "0.0.1"
  :serial t
  :depends-on (#:zstd #:flexi-streams #:utf8-input-stream)
  :components ((:file "package")
               (:file "zstd-text")))
