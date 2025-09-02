(in-package :cl-user)
(uiop:define-package :sdl3-ttf
  (:use #:cl
        #:alexandria
        #:autowrap.minimal
        #:plus-c
        #:sdl3-ffi.functions)
  (:export #:init
           #:version
           #:was-init
           #:quit
           #:open-font
           #:close-font
           #:bold #:italic #:underline #:strike-through
	   #:set-font-outline
	   #:get-font-outline))
