(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

;; live erlang compiler warnings & errors
(require 'erlang-flymake)

;; really nice interface to git grep
(global-set-key (kbd "C-c g") 'helm-git-grep)
;; Invoke `helm-git-grep' from isearch.
(define-key isearch-mode-map (kbd "C-c g") 'helm-git-grep-from-isearch)
;; Invoke `helm-git-grep' from other helm.
(eval-after-load 'helm
  '(define-key helm-map (kbd "C-c g") 'helm-git-grep-from-helm))

;; Tell emacs where is your personal elisp lib dir
;; this is default dir for extra packages
(add-to-list 'load-path "~/.emacs.d/")

(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(setq auto-mode-alist  (cons '("Rakefile$" . enh-ruby-mode) auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))

;; dart-mode
(autoload 'dart-mode "dart-mode" "Edit Dart code." t)
(add-to-list 'auto-mode-alist '("\.dart$" . dart-mode))

;; windmove
(if (fboundp 'windmove-default-keybindings)
(windmove-default-keybindings))

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

;; nicer scrolling
(setq
  scroll-margin 5
  scroll-conservatively 100000
  scroll-preserve-screen-position 1)

;; deactivate toolbar
(tool-bar-mode -1)

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

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(indent-tabs-mode nil)
 '(show-paren-mode t)
 '(frame-background-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
'(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))
