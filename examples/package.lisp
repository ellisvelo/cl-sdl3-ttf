(in-package :cl-user)

(defpackage :sdl3-ttf-examples
  (:use #:cl
        #:alexandria
        #:tg
        #:cffi
        #:sdl3)
  (:export :basic
           :gl-example))
