;;; flycheck-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "flycheck" "flycheck.el" (0 0 0 0))
;;; Generated autoloads from flycheck.el

(autoload 'flycheck-manual "flycheck" "\
Open the Flycheck manual.\n\n(fn)" t nil)

(autoload 'flycheck-mode "flycheck" "\
Minor mode for on-the-fly syntax checking.\n\nWhen called interactively, toggle `flycheck-mode'.  With prefix\nARG, enable `flycheck-mode' if ARG is positive, otherwise disable\nit.\n\nWhen called from Lisp, enable `flycheck-mode' if ARG is omitted,\nnil or positive.  If ARG is `toggle', toggle `flycheck-mode'.\nOtherwise behave as if called interactively.\n\nIn `flycheck-mode' the buffer is automatically syntax-checked\nusing the first suitable syntax checker from `flycheck-checkers'.\nUse `flycheck-select-checker' to select a checker for the current\nbuffer manually.\n\n\\{flycheck-mode-map}\n\n(fn &optional ARG)" t nil)

(defvar global-flycheck-mode nil "\
Non-nil if Global Flycheck mode is enabled.\nSee the `global-flycheck-mode' command\nfor a description of this minor mode.\nSetting this variable directly does not take effect;\neither customize it (see the info node `Easy Customization')\nor call the function `global-flycheck-mode'.")

(custom-autoload 'global-flycheck-mode "flycheck" nil)

(autoload 'global-flycheck-mode "flycheck" "\
Toggle Flycheck mode in all buffers.\nWith prefix ARG, enable Global Flycheck mode if ARG is positive;\notherwise, disable it.  If called from Lisp, enable the mode if\nARG is omitted or nil.\n\nFlycheck mode is enabled in all buffers where\n`flycheck-mode-on-safe' would do it.\nSee `flycheck-mode' for more information on Flycheck mode.\n\n(fn &optional ARG)" t nil)

(autoload 'flycheck-define-error-level "flycheck" "\
Define a new error LEVEL with PROPERTIES.\n\nThe following PROPERTIES constitute an error level:\n\n`:severity SEVERITY'\n     A number denoting the severity of this level.  The higher\n     the number, the more severe is this level compared to other\n     levels.  Defaults to 0.\n\n     The severity is used by `flycheck-error-level-<' to\n     determine the ordering of errors according to their levels.\n\n`:compilation-level LEVEL'\n\n     A number indicating the broad class of messages that errors\n     at this level belong to: one of 0 (info), 1 (warning), or\n     2 or nil (error).  Defaults to nil.\n\n     This is used by `flycheck-checker-pattern-to-error-regexp'\n     to map error levels into `compilation-mode''s hierarchy and\n     to get proper highlighting of errors in `compilation-mode'.\n\n`:overlay-category CATEGORY'\n     A symbol denoting the overlay category to use for error\n     highlight overlays for this level.  See Info\n     node `(elisp)Overlay Properties' for more information about\n     overlay categories.\n\n     A category for an error level overlay should at least define\n     the `face' property, for error highlighting.  Another useful\n     property for error level categories is `priority', to\n     influence the stacking of multiple error level overlays.\n\n`:fringe-bitmap BITMAP'\n     A fringe bitmap symbol denoting the bitmap to use for fringe\n     indicators for this level.  See Info node `(elisp)Fringe\n     Bitmaps' for more information about fringe bitmaps,\n     including a list of built-in fringe bitmaps.\n\n`:fringe-face FACE'\n     A face symbol denoting the face to use for fringe indicators\n     for this level.\n\n`:error-list-face FACE'\n     A face symbol denoting the face to use for messages of this\n     level in the error list.  See `flycheck-list-errors'.\n\n(fn LEVEL &rest PROPERTIES)" nil nil)

(function-put 'flycheck-define-error-level 'lisp-indent-function '1)

(autoload 'flycheck-define-command-checker "flycheck" "\
Define SYMBOL as syntax checker to run a command.\n\nDefine SYMBOL as generic syntax checker via\n`flycheck-define-generic-checker', which uses an external command\nto check the buffer.  SYMBOL and DOCSTRING are the same as for\n`flycheck-define-generic-checker'.\n\nIn addition to the properties understood by\n`flycheck-define-generic-checker', the following PROPERTIES\nconstitute a command syntax checker.  Unless otherwise noted, all\nproperties are mandatory.  Note that the default `:error-filter'\nof command checkers is `flycheck-sanitize-errors'.\n\n`:command COMMAND'\n     The command to run for syntax checking.\n\n     COMMAND is a list of the form `(EXECUTABLE [ARG ...])'.\n\n     EXECUTABLE is a string with the executable of this syntax\n     checker.  It can be overridden with the variable\n     `flycheck-SYMBOL-executable'.  Note that this variable is\n     NOT implicitly defined by this function.  Use\n     `flycheck-def-executable-var' to define this variable.\n\n     Each ARG is an argument to the executable, either as string,\n     or as special symbol or form for\n     `flycheck-substitute-argument', which see.\n\n`:error-patterns PATTERNS'\n     A list of patterns to parse the output of the `:command'.\n\n     Each ITEM in PATTERNS is a list `(LEVEL SEXP ...)', where\n     LEVEL is a Flycheck error level (see\n     `flycheck-define-error-level'), followed by one or more RX\n     `SEXP's which parse an error of that level and extract line,\n     column, file name and the message.\n\n     See `rx' for general information about RX, and\n     `flycheck-rx-to-string' for some special RX forms provided\n     by Flycheck.\n\n     All patterns are applied in the order of declaration to the\n     whole output of the syntax checker.  Output already matched\n     by a pattern will not be matched by subsequent patterns.  In\n     other words, the first pattern wins.\n\n     This property is optional.  If omitted, however, an\n     `:error-parser' is mandatory.\n\n`:error-parser FUNCTION'\n     A function to parse errors with.\n\n     The function shall accept three arguments OUTPUT CHECKER\n     BUFFER.  OUTPUT is the syntax checker output as string,\n     CHECKER the syntax checker that was used, and BUFFER a\n     buffer object representing the checked buffer.  The function\n     must return a list of `flycheck-error' objects parsed from\n     OUTPUT.\n\n     This property is optional.  If omitted, it defaults to\n     `flycheck-parse-with-patterns'.  In this case,\n     `:error-patterns' is mandatory.\n\n`:standard-input t'\n     Whether to send the buffer contents on standard input.\n\n     If this property is given and has a non-nil value, send the\n     contents of the buffer on standard input.\n\n     Defaults to nil.\n\nNote that you may not give `:start', `:interrupt', and\n`:print-doc' for a command checker.  You can give a custom\n`:verify' function, though, whose results will be appended to the\ndefault `:verify' function of command checkers.\n\n(fn SYMBOL DOCSTRING &rest PROPERTIES)" nil nil)

(function-put 'flycheck-define-command-checker 'lisp-indent-function '1)

(function-put 'flycheck-define-command-checker 'doc-string-elt '2)

(autoload 'flycheck-def-config-file-var "flycheck" "\
Define SYMBOL as config file variable for CHECKER, with default FILE-NAME.\n\nSYMBOL is declared as customizable variable using `defcustom', to\nprovide a configuration file for the given syntax CHECKER.\nCUSTOM-ARGS are forwarded to `defcustom'.\n\nFILE-NAME is the initial value of the new variable.  If omitted,\nthe default value is nil.\n\nUse this together with the `config-file' form in the `:command'\nargument to `flycheck-define-checker'.\n\n(fn SYMBOL CHECKER &optional FILE-NAME &rest CUSTOM-ARGS)" nil t)

(function-put 'flycheck-def-config-file-var 'lisp-indent-function '3)

(autoload 'flycheck-def-option-var "flycheck" "\
Define SYMBOL as option variable with INIT-VALUE for CHECKER.\n\nSYMBOL is declared as customizable variable using `defcustom', to\nprovide an option for the given syntax CHECKERS (a checker or a\nlist of checkers).  INIT-VALUE is the initial value of the\nvariable, and DOCSTRING is its docstring.  CUSTOM-ARGS are\nforwarded to `defcustom'.\n\nUse this together with the `option', `option-list' and\n`option-flag' forms in the `:command' argument to\n`flycheck-define-checker'.\n\n(fn SYMBOL INIT-VALUE CHECKERS DOCSTRING &rest CUSTOM-ARGS)" nil t)

(function-put 'flycheck-def-option-var 'lisp-indent-function '3)

(function-put 'flycheck-def-option-var 'doc-string-elt '4)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "flycheck" '("flycheck-" "list-flycheck-errors" "locate-rebar3-project-root" "contains-rebar-config" "help-flycheck-checker-d" "read-flycheck-")))

;;;***

;;;### (autoloads nil "flycheck-buttercup" "flycheck-buttercup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from flycheck-buttercup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "flycheck-buttercup" '("flycheck-buttercup-format-error-list")))

;;;***

;;;### (autoloads nil "flycheck-ert" "flycheck-ert.el" (0 0 0 0))
;;; Generated autoloads from flycheck-ert.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "flycheck-ert" '("flycheck-ert-")))

;;;***

;;;### (autoloads nil nil ("flycheck-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; flycheck-autoloads.el ends here
