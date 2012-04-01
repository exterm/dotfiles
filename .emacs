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
(require 'erlang-start)
(require 'erlang-flymake)
;(erlang-flymake-only-on-save)

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
(add-to-list 'load-path "/usr/share/ghc-mod-1.10.12/")
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

;; coffeescript-mode
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

;; placing backup files in system's temp directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; delete selection when typing
(delete-selection-mode 1)

;; dont show *GNU Emacs* buffer on startup with specific file
(setq inhibit-startup-message t)
;; clear initial text on scratch buffer
(setq initial-scratch-message nil)

;; show the scroll bar on the right side
;(setq scroll-bar-mode-explicit t)
(set-scroll-bar-mode 'right)

;; record and execute keyboard macros
(global-set-key [f5] 'start-kbd-macro)
(global-set-key [f6] 'end-kbd-macro)
(global-set-key [f7] 'call-last-kbd-macro)

;; automatically set variables
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(rails-ws:default-server-type "webrick")
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(indent-tabs-mode nil)
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