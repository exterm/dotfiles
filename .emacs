;; rails-mode
(require 'rails)

;; haml-mode
(require 'haml-mode)
;; remove tabs from HAML files on save
(add-hook 'haml-mode-hook
  '(lambda () (add-hook 'local-write-file-hooks
    '(lambda () (save-excursion (untabify (point-min) (point-max)))))))

;; yaml-mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; erlang-mode
(setq erlang-root-dir "/usr/lib/erlang")
(setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
(require 'erlang-flymake)
;(erlang-flymake-only-on-save)
(require 'erlang-start)

;; slime
;(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")
;(require 'slime)
;(slime-setup '(slime-repl))

;; clojure-mode
;(add-to-list 'load-path "/usr/share/emacs/site-lisp/clojure-mode")
;(require 'clojure-mode)

;; swank-clojure
;(add-to-list 'load-path "/usr/share/emacs/site-lisp/swank-clojure")
;(require 'swank-clojure)

;; paredit-mode
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)

;; pkgbuild-mode
(autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t)
(setq auto-mode-alist (append '(("/PKGBUILD$" . pkgbuild-mode)) auto-mode-alist))

;; auctex
(autoload 'auctex "auctex.el" nil t)
(autoload 'preview-latex "preview-latex.el" nil t)

;; windmove
(if (fboundp 'windmove-default-keybindings)
(windmove-default-keybindings))

;; haskell-mode
(load "/usr/share/emacs/site-lisp/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
(add-to-list 'load-path "/usr/share/ghc-mod-0.6.2/")
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))

;; markdown
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\.md" . markdown-mode) auto-mode-alist))

;; python-mode
(autoload 'python-mode "python-mode.el" "Python mode." t)
(setq auto-mode-alist (append '(("/*.\.py$" . python-mode)) auto-mode-alist))

;; placing backup files in system's temp directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; dont show *GNU Emacs* buffer on startup with specific file
(setq inhibit-startup-message t)
;; clear initial text on scratch buffer
(setq initial-scratch-message nil)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(rails-ws:default-server-type "webrick")
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(transient-mark-mode (quote (only . t))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

;; nicer scrolling
(setq
  scroll-margin 5
  scroll-conservatively 100000
  scroll-preserve-screen-position 1)