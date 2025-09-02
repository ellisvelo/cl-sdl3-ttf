(in-package :sdl3-ttf-examples)

(require 'sdl3-ttf)

(defun basic ()
  (with-init (:everything)
    ;;Technically speaking sdl3-ttf can be initialized without sdl3
    (sdl3-ttf:init)
    (with-window (the-window :title "Basic Font Example" :w 300 :h 300)
      (with-renderer (my-renderer the-window)
        (let* ((font (sdl3-ttf:open-font (asdf:system-relative-pathname 'sdl3-ttf-examples "examples/PROBE_10PX_OTF.otf") 10.0))
               (hello-text (let* ((surface (sdl3-ttf:render-text-solid font
                                                                      "hello world"
								      0
                                                                      255
                                                                      255
                                                                      255
                                                                      0))
                                  (texture (create-texture-from-surface my-renderer
                                                                        surface)))
                             (destroy-surface surface)
                             texture))
               (destination-rect (make-f-rect (- 150 (/ (texture-width hello-text) 2.0))
                                              (- 150 (/ (texture-height hello-text) 2.0))
                                              (texture-width hello-text)
                                              (texture-height hello-text))))
          (flet ((text-renderer (renderer)
                   (render-texture renderer
                                   hello-text
                                   :source-f-rect (cffi:null-pointer)
                                   :dest-f-rect destination-rect))
                 (clear-renderer (renderer)
                   (set-render-draw-color renderer 0 0 0 255)
                   (render-clear renderer)))
            (with-event-loop (:method :poll)
              (:idle ()
                     (clear-renderer my-renderer)
                     (text-renderer my-renderer)
                     (render-present my-renderer))
              (:quit ()
                     (when (> (sdl3-ttf:was-init) 0)
                       (sdl3-ttf:close-font font)
                       (destroy-texture hello-text)
                       (sdl3-ttf:quit))
                     t))))))))
