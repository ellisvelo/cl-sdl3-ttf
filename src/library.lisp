(in-package :sdl3-ttf)

(cffi:define-foreign-library libsdl3-ttf
  (:darwin (:or (:framework "SDL3_ttf") (:default "libSDL3_ttf")))
  (:unix (:or "libSDL3_ttf.so" "libSDL3_ttf.so.0" "libSDL3_ttf.so.0.2.2"))
  (:windows "SDL3_ttf.dll"))

(cffi:use-foreign-library libsdl3-ttf)
