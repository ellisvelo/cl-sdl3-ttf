(in-package :sdl3-ffi)

(autowrap:c-include '(sdl3-ttf autowrap-spec "SDL3_ttf.h")
                    :function-package :sdl3-ffi.functions
                    :spec-path '(sdl3-ttf autowrap-spec)
                    :exclude-sources ("/usr/include/"
				      ".*/SDL3/SDL_.*.h")
                    :include-sources ("sys/stddef.h"
				      "SDL3_ttf.h")
		    :sysincludes (uiop:split-string (uiop:getenv "EXTRA_INCLUDES") :separator " ")
                    :symbol-exceptions (("SDL_RWops" . "SDL-RWOPS"))
                    :exclude-constants ("^+__")
		    :exclude-definitions ("_inline$"
					  "^_mm_"
					  "^__"
					  "va_list"
					  "_gnuc_va_list")
                    ;;We're mostly dealing with SDL-surface which contains accessors in the main cl-sdl3 library
                    :no-accessors cl:t
		    :release-p cl:t)
