(in-package :sdl3-ttf)

(require 'sdl3)

(defvar *fonts* (list) "List of weak refs to fonts.")

(defun init ()
  "Initialize the sdl trutype font API. Does not require a call to sdl-init prior to calling this function. Returns 0 if succesful -1 otherwise"
  (check-rc (ttf-init)))

(defun version ()
  "Get the version of SDL_ttf that is linked against your program and return the
 major, minor, and micro version."
  (let* ((version (ttf-version))
	 (major (floor (/ version 1000000)))
	 (minor (floor (mod (/ version 1000) 1000)))
	 (micro (mod version 1000)))
    (values major minor micro)))

(defun was-init ()
  "Returns 1 if initialized zero otherwise."
  (ttf-was-init))

(defun quit ()
  (dolist (pointer *fonts*)
    (let ((ttf-font-struct (tg:weak-pointer-value pointer)))
      (when ttf-font-struct (close-font ttf-font-struct))))
  (ttf-quit))

(defun open-font (path-to-font point-size)
  "Open a font specified by the path specifier path-to-font sized to integer
point-size (based on 72DPI). Returns a ttf-font struct and null on errors"
  (let ((font (autocollect (ptr)
                           (check-null (ttf-open-font (namestring path-to-font) point-size))
                (ttf-close-font ptr))))
    (push (tg:make-weak-pointer font) *fonts*)
    font))

(defun close-font (ttf-font-struct)
  "Frees the memory used by the ttf-font-struct"
  (tg:cancel-finalization ttf-font-struct)
  (setf *fonts*
        (remove ttf-font-struct *fonts*
                :key #'tg:weak-pointer-value
                :test #'(lambda (l r)
                          (cffi:pointer-eq (autowrap:ptr l) (autowrap:ptr r)))))
  (ttf-close-font ttf-font-struct)
  (autowrap:invalidate ttf-font-struct))
