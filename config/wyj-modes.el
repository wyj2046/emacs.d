;; -*- coding: utf-8 -*-

(require 'cl)

(loop for file in (directory-files "~/.emacs.d/config/modes" t "\\.el$")
      do (load file nil nil t))


;;ido
(when (require 'ido "ido" t)
  (ido-mode t)
  (setq ido-enable-flex-matching t)
  (setq ido-use-virtual-buffers t))


;;ispell
(autoload 'ispell-buffer "ispell" "spell check the current buffer" t)
(when wyj/os:windowsp
  (wyj/prepend-to-exec-path "~/.emacs.d/extra-bin/aspell/bin")
  (setq ispell-program-name "aspell"))
(setq ispell-dictionary "british")


;; linum
(require 'linum)
(setq linum-format "%4d|")

(custom-set-faces
 '(linum ((t :foreground "CadetBlue" :inherit (shadow default))))) 

(setq linum-mode-inhibit-modes-list
      '(fundamental-mode
        speedbar-mode
        help-mode
        Info-mode
        eshell-mode
        shell-mode
        erc-mode
        jabber-roster-mode
        jabber-chat-mode
        gnus-group-mode
        gnus-summary-mode
        gnus-article-mode))

(defadvice linum-on (around linum-on-inhibit-for-modes)
  "stop the load of linum mode for some major mode"
  (unless (member major-mode linum-mode-inhibit-modes-list)
    ad-do-it))

(ad-activate 'linum-on)

(global-linum-mode 1) 


;; whitespace 参考Meteor的配置
(setq whitespace-style '(face trailing lines-tail newline empty tab-mark))
(when window-system
  (setq whitespace-style (append whitespace-style '(tabs newline-mark))))
;(global-whitespace-mode t)

;; 边框提供特殊符号 Meteor帮助
(setq-default indicate-buffer-boundaries (quote left))

(provide 'wyj-modes)
