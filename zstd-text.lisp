;;;; zstd-text.lisp

(in-package #:zstd-text)

(defmacro with-open-zstd-utf8-file ((stream pathname &key direction) &body body) 
  (if (not (eq direction :OUTPUT))
    (let ((fi (gensym "WITH-OPEN-ZSTD-UTF8-FILE"))
          (zstd-in (gensym "WITH-OPEN-ZSTD-UTF8-FILE")))
      `(with-open-file (,fi ,pathname
                            :direction :input
                            :element-type '(unsigned-byte 8))
         (zstd:with-decompressing-stream (,zstd-in ,fi)
           (let ((,stream (make-utf8-input-stream ,zstd-in)))
             ,@body))))
    (let ((fo (gensym "WITH-OPEN-ZSTD-UTF8-FILE"))
          (zstd-out (gensym "WITH-OPEN-ZSTD-UTF8-FILE")))
      `(with-open-file (,fo ,pathname
                            :direction :output
                            :element-type '(unsigned-byte 8)
                            :if-exists :supersede
                            :if-does-not-exist :create)
         (zstd:with-compressing-stream (,zstd-out ,fo)
           (let ((,stream (flexi-streams:make-flexi-stream
                           ,zstd-out
                           :external-format (flexi-streams:make-external-format :UTF-8))))
             ,@body))))))
