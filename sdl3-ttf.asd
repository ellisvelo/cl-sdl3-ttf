(defpackage :sdl3-ttf.asdf
  (:use #:cl #:asdf))

(in-package :sdl3-ttf.asdf)

(defsystem :sdl3-ttf
    :description "Bindings for sdl3_ttf using autowrap"
    :author "Bryan Baraoidan"
    :license "MIT"
    :version "1.0"
    :depends-on (:alexandria :defpackage-plus :cl-autowrap :sdl3 :cffi-libffi :trivial-garbage)
    :pathname "src"
    :serial t
    :components ((:file "package")
                 (:file "library")
                 (:file "autowrap")
                 (:file "helpers")
                 (:file "conditions")
                 (:file "render")
                 (:file "size")
                 (:file "general")
                 (:file "style")
                 (:module autowrap-spec
                          :pathname "spec"
                          :components ((:static-file "SDL3_ttf.h")))))
