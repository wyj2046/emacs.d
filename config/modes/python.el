;; -*- coding: utf-8 -*-

;; 以下配置参考http://pedrokroger.net/2010/07/configuring-emacs-as-a-python-ide-2/ 稍作修改
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

(require 'ipython)

(require 'pretty-lambdada)
(add-hook 'python-mode-hook #'pretty-lambdada 1)

(require 'pep8)
(require 'pylint)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
