;; -*- coding: utf-8 -*-
;; 报error: Could not create connection to raw.github.com:443这个错，
;; 大爷的，原来是GitHub被封导致，参考网址http://www.newsmth.net/nForum/#!article/Python/100570解决GitHub被封问题
;; el-get参考网址https://github.com/dimitri/el-get


;; Basic Setup
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(el-get 'sync)
