;; Tell emacs where is your personal elisp lib dir
;; this is default dir for extra packages
(add-to-list 'load-path "~/.emacs.d/")

(setq auto-mode-alist  (cons '("Rakefile$" . ruby-mode) auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))

;; dart-mode
(autoload 'dart-mode "dart-mode" "Edit Dart code." t)
(add-to-list 'auto-mode-alist '("\.dart$" . dart-mode))

;; haml-mode
(require 'haml-mode)

;; sass-mode
(require 'sass-mode)

;; yaml-mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\.yml$'" . yaml-mode))

;; erlang-mode
(setq erlang-root-dir "/usr/lib/erlang")
(setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
(require 'erlang-start)
(require 'erlang-flymake)
;(erlang-flymake-only-on-save)

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
(add-to-list 'load-path "/usr/share/emacs/site-lisp/haskell-mode/")
(require 'haskell-mode-autoloads)
(add-to-list 'Info-default-directory-list "/usr/share/emacs/site-lisp/haskell-mode/")
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
(add-to-list 'load-path "/usr/share/ghc-mod-2.0.3/")
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

;; delete selection when typing
(delete-selection-mode 1)

;; dont show *GNU Emacs* buffer on startup with specific file
(setq inhibit-startup-message t)
;; clear initial text on scratch buffer
(setq initial-scratch-message nil)

;; show the scroll bar on the right side
;(setq scroll-bar-mode-explicit t)
(set-scroll-bar-mode 'right)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; global key bindings
;; resize window
(global-set-key (kbd "S-C-<left>")  'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<up>")    'shrink-window)
(global-set-key (kbd "S-C-<down>")  'enlarge-window)

;; show/hide whitespaces
(global-set-key [f4] 'whitespace-mode)

;; record and execute keyboard macros
(global-set-key [f5] 'start-kbd-macro)
(global-set-key [f6] 'end-kbd-macro)
(global-set-key [f7] 'call-last-kbd-macro)

;; hide/show mode: toggle block hiding
(global-set-key [f8] 'hs-toggle-hiding)

;; case sensitive replace-string
(global-set-key (kbd "C-h")
                (lambda ()
                  (interactive)
                  (let ((case-fold-search nil))
                    (call-interactively 'replace-string))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; whitespace mode settings
(setq whitespace-style
      '(face tabs spaces trailing lines-tail space-before-tab newline
        indentation empty space-after-tab space-mark tab-mark newline-mark)
)
;(global-whitespace-mode 1)

;; automatically set variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(indent-tabs-mode nil)
 '(js-indent-level 2)
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
