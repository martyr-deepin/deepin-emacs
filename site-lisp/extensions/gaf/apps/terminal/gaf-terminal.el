;;; gaf-terminal.el --- Terminal base on gaf (Graphics Application Framework)

;; Filename: gaf-terminal.el
;; Description: Terminal base on gaf (Graphics Application Framework)
;; Author: Andy Stewart <lazycat.manatee@gmail.com>
;; Maintainer: Andy Stewart <lazycat.manatee@gmail.com>
;; Copyright (C) 2016, Andy Stewart, all rights reserved.
;; Created: 2016-10-05 09:37:04
;; Version: 0.1
;; Last-Updated: 2016-10-05 09:37:04
;;           By: Andy Stewart
;; URL: http://www.emacswiki.org/emacs/download/gaf-terminal.el
;; Keywords:
;; Compatibility: GNU Emacs 25.0.50.1
;;
;; Features that might be required by this library:
;;
;;
;;

;;; This file is NOT part of GNU Emacs

;;; License
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.

;;; Commentary:
;;
;; Terminal base on gaf (Graphics Application Framework)
;;

;;; Installation:
;;
;; Put gaf-terminal.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'gaf-terminal)
;;
;; No need more.

;;; Customize:
;;
;;
;;
;; All of the above can customize by:
;;      M-x customize-group RET gaf-terminal RET
;;

;;; Change log:
;;
;; 2016/10/05
;;      * First released.
;;

;;; Acknowledgements:
;;
;;
;;

;;; TODO
;;
;;
;;

;;; Require
(require 'dbus)
(require 'gaf)

;;; Code:

(defcustom gaf-terminal-mode-hook '()
  "Graphics-application-framework terminal mode hook."
  :type 'hook
  :group 'gaf-terminal-mode)

(defvar gaf-terminal-mode-map
  (let ((map (make-sparse-keymap)))
    map)
  "Keymap used by `gaf-terminal-mode'.")

(define-derived-mode gaf-terminal-mode text-mode "Gaf-Terminal"
  (interactive)
  (kill-all-local-variables)
  (setq major-mode 'gaf-terminal-mode)
  (setq mode-name "Gaf-Terminal")
  (setq buffer-read-only t)
  (set (make-local-variable 'buffer-id) (gaf-generate-id))
  (use-local-map gaf-terminal-mode-map)
  (run-hooks 'gaf-terminal-mode-hook))

(defun gaf-terminal-create-buffer ()
  (let ((gaf-terminal-buffer (generate-new-buffer "Gaf-Terminal")))
    (with-current-buffer gaf-terminal-buffer
      (gaf-terminal-mode)
      )
    gaf-terminal-buffer))

(defun gaf-terminal-open-app ()
  (interactive)
  (let* ((buffer (gaf-terminal-create-buffer)))
    (switch-to-buffer buffer)
    (with-current-buffer buffer
      (let* ((window-allocation (gaf-get-window-allocation))
             (x (nth 0 window-allocation))
             (y (nth 1 window-allocation))
             (w (nth 2 window-allocation))
             (h (nth 3 window-allocation))
             )
        (start-process-shell-command
         "Terminal"
         buffer
         "/space/SourceCode/deepin-emacs/site-lisp/extensions/gaf/apps/terminal/gaf-terminal"
         (format "%s %s %s %s %s" (gaf-get-emacs-xid) x y w h))))
    ))

(provide 'gaf-terminal)

;;; gaf-terminal.el ends here
