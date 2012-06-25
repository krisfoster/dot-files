
(setenv "PATH" (concat "~/bin/:" (getenv "PATH")))

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . 
               "http://marmalade-repo.org/packages/") t)
(package-initialize)

(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-bindings
                                   starter-kit-eshell zenburn-theme
                                   clojure-mode clojure-test-mode
                                   clojurescript-mode
				   markdown-mode yaml-mode
				   marmalade))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
