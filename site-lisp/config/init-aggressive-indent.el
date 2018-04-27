;;; init-aggressive-indent.el --- Init for aggressive indent mode

;; Filename: init-aggressive-indent.el
;; Description: Init for aggressive indent mode
;; Author: Andy Stewart <lazycat.manatee@gmail.com>
;; Maintainer: Andy Stewart <lazycat.manatee@gmail.com>
;; Copyright (C) 2017, Andy Stewart, all rights reserved.
;; Created: 2017-10-16 22:46:53
;; Version: 0.1
;; Last-Updated: 2017-10-16 22:46:53
;;           By: Andy Stewart
;; URL: http://www.emacswiki.org/emacs/download/init-aggressive-indent.el
;; Keywords:
;; Compatibility: GNU Emacs 27.0.50
;;
;; Features that might be required by this library:
;;
;; `aggressive-indent'
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
;; Init for aggressive indent mode
;;

;;; Installation:
;;
;; Put init-aggressive-indent.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'init-aggressive-indent)
;;
;; No need more.

;;; Customize:
;;
;;
;;
;; All of the above can customize by:
;;      M-x customize-group RET init-aggressive-indent RET
;;

;;; Change log:
;;
;; 2017/10/16
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
(require 'aggressive-indent)

;;; Code:
(dolist (hook (list
               'c-mode-common-hook
               'c-mode-hook
               'emacs-lisp-mode-hook
               'lisp-interaction-mode-hook
               'lisp-mode-hook
               'emms-playlist-mode-hook
               'java-mode-hook
               'asm-mode-hook
               'haskell-mode-hook
               'rcirc-mode-hook
               'emms-lyrics-mode-hook
               'erc-mode-hook
               'sh-mode-hook
               'makefile-gmake-mode-hook
               'python-mode-hook
               'js2-mode-hook
               'js-mode-hook
               'html-mode-hook
               'css-mode-hook
               'apt-utils-mode-hook
               'tuareg-mode-hook
               'go-mode-hook
               'coffee-mode-hook
               'qml-mode-hook
               'markdown-mode-hook
               'slime-repl-mode-hook
               'package-menu-mode-hook
               'cmake-mode-hook
               'php-mode-hook
               'web-mode-hook
               'coffee-mode-hook
               'sws-mode-hook
               'jade-mode-hook
               'vala-mode-hook
               'rust-mode-hook
               ))
  (add-hook hook (lambda () (aggressive-indent-mode 1))))


(provide 'init-aggressive-indent)

;;; init-aggressive-indent.el ends here
