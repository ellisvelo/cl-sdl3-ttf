(defpackage :sdl3-ttf-examples.asdf
  (:use #:cl
        #:asdf))

(in-package :sdl3-ttf-examples.asdf)

(defsystem :sdl3-ttf-examples
  :description "A few examples"
  :author "Bryan Baraoidan"
  :license "MIT"
  :version "1.0"
  :depends-on (:alexandria :sdl3 :sdl3-ttf :cl-opengl :mathkit)
  :pathname "examples"
  :components ((:file "package")
               (:file "basic" :depends-on ("package"))
               (:file "gl-example" :depends-on ("package"))))
