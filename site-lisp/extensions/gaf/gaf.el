;;; gaf.el --- Graphics application framework

;; Filename: gaf.el
;; Description: Graphics application framework
;; Author: Andy Stewart <lazycat.manatee@gmail.com>
;; Maintainer: Andy Stewart <lazycat.manatee@gmail.com>
;; Copyright (C) 2016, Andy Stewart, all rights reserved.
;; Created: 2016-09-15 16:52:19
;; Version: 0.1
;; Last-Updated: 2016-09-15 16:52:19
;;           By: Andy Stewart
;; URL: http://www.emacswiki.org/emacs/download/gaf.el
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
;; Graphics application framework
;;

;;; Installation:
;;
;; Put gaf.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'gaf)
;;
;; No need more.

;;; Customize:
;;
;;
;;
;; All of the above can customize by:
;;      M-x customize-group RET gaf RET
;;

;;; Change log:
;;
;; 2016/09/15
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

;;; Code:

(random t)

(defun gaf-generate-id ()
  (format "%04x%04x-%04x-%04x-%04x-%06x%06x"
          (random (expt 16 4))
          (random (expt 16 4))
          (random (expt 16 4))
          (random (expt 16 4))
          (random (expt 16 4))
          (random (expt 16 6))
          (random (expt 16 6)) ))

(defun gaf-get-window-allocation (&optional window)
  (let* ((window-edges (window-inside-pixel-edges window))
         (x (nth 0 window-edges))
         (y (nth 1 window-edges))
         (w (- (nth 2 window-edges) x))
         (h (- (nth 3 window-edges) y))
         )
    (list x y w h)))

(defun gaf-get-emacs-xid ()
  (frame-parameter nil 'window-id))

(provide 'gaf)

;;; gaf.el ends here
