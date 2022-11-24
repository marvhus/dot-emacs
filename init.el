;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
;(package-initialize)
;(package-refresh-contents)

;;
;; Packages
;;

(add-to-list 'load-path "~/.emacs.d/use-package")
(require 'use-package)

;; auto-complate
;;(ac-config-default)
;;(auto-complete-mode)

;; evil
(require 'evil)
(evil-mode 1)

;; lsp-mode
(setq lsp-keymap-prefix "C-c l")
(require 'lsp-mode)
;(require 'lsp-clients)
(add-hook 'prog-mode-hook #'lsp)

;; company
(add-hook 'after-init-hook 'global-company-mode)

;; helm
(require 'helm)
(require 'helm-cmd-t)
(require 'helm-git-grep)
(require 'helm-ls-git)
(require 'helm-org)

;; ox-hugo
(use-package ox-hugo
  :ensure t   ;Auto-install the package from Melpa
  :pin melpa  ;`package-archives' should already have ("melpa" . "https://melpa.org/packages/")
  :after ox)


;;
;; Settings
;;
(setq org-image-actual-width nil)
(setq calendar-week-start-day 1)
(setq column-number-mode t)
(setq scroll-bar-mode 0)
(setq backup-directory-alist `(("." . "~/.saves")))

;; server
;(load "server")
;(unless (server-running-p) (server-start))

;; Modes dir
(add-to-list 'load-path "~/.emacs.d/modes/")

;; Odin Mode -- https://github.com/mattt-b/odin-mode
(require 'odin-mode)
(add-to-list 'auto-mode-alist '("\\.odin\\'" . odin-mode))

;; Drag Stuff
(add-to-list 'load-path "~/.emacs.d/drag-stuff/")
(require 'drag-stuff)
(drag-stuff-mode t)
(drag-stuff-global-mode 1)
(drag-stuff-define-keys)

;; keys

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c x") 'execute-extended-command)

(global-set-key (kbd "C-c C-m m") 'magit)
(global-set-key (kbd "C-c C-m s") 'magit-status)
(global-set-key (kbd "C-c C-m l") 'magit-log)

(global-set-key (kbd "C-c C-w q") 'kill-buffer-and-window)
(global-set-key (kbd "C-c C-w k") 'kill-buffer)
(global-set-key (kbd "C-c C-w w") 'quit-window)

(global-set-key (kbd "C-c C-h C-g g") 'helm-git-grep)
(global-set-key (kbd "C-c C-h f") 'helm-find)
(global-set-key (kbd "C-c C-h a") 'helm-org-agenda-files-headings)
(global-set-key (kbd "C-c C-h r") 'helm-recentf)

(global-set-key [C-return] 'save-buffer)

(global-set-key (kbd "C-c r") 'recompile)
(global-set-key (kbd "C-c c") 'compile)

(global-set-key [C-w v] 'split-window-right)
(global-set-key [C-w s] 'split-window-below)
(global-set-key [C-w q] 'delete-window)

(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)

(define-key evil-normal-state-map (kbd "u") 'undo-fu-only-undo)
(define-key evil-normal-state-map (kbd "C-r") 'undo-fu-only-redo)
;; zoom in/out like we do everywhere else.

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)

;; Scrolling and tab width
(setq-default tab-width 4)
(setq scroll-margin 20)
(setq scroll-conservatively 101)

;; Hide Tool Bar
(tool-bar-mode -1)

;; set type of line numbering (global variable)
(setq display-line-numbers-type 'relative) 

;; activate line numbering in all buffers/modes
(global-display-line-numbers-mode) 

;; use org-bullets-mode for utf8 symbols as org bullets
(require 'org-bullets)
;; make available "org-bullet-face" such that I can control the font size individually
(setq org-bullets-face-name (quote org-bullet-face))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-bullets-bullet-list '("○" "☉" "◎" "◉" "○" "◌" "◎" "●" "◦" "◯" "⚪" "⚫" "⚬" "❍" "￮" "⊙" "⊚" "⊛" "∙" "∘"))

;; ================================================
;; ================ Theme =========================
;; ================================================


;;;;;;;;;;;;
;; https://github.com/rexim/gruber-darker-theme
(load-theme 'gruber-darker t)
;;;;;;;;;;;

;;;;;;;;;;; Jonathan Blow inspired theme
;(custom-set-faces
; ;; custom-set-faces was added by Custom.
; ;; If you edit it by hand, you could mess it up, so be careful.
; ;; Your init file should contain only one such instance.
; ;; If there is more than one, they won't work right.
; '(default ((t (:foreground "tan" :background "gray16"))))
; '(custom-group-tag-face ((t (:underline t foreground "lightblue"))) t)
; '(custom-variable-tag-face ((t (:underline t foreground "lightblue"))) t)
; '(font-lock-builtin-face ((t nil)))
; '(font-lock-comment-face ((t (:foreground "yellow"))))
; '(font-lock-function-name-face ((((class color) (background dark)) (:foreground "white"))))
; '(font-lock-keyword-face ((t (:foreground "white" background "gray16"))))
; '(font-lock-string-face ((t (:foreground "gray160" :background "gray16"))))
; '(font-lock-variable-name-face ((((class color) (background dark)) (:foreground "white"))))
; '(font-lock-warning-face ((t (:bold t foreground "red"))))
; '(header-line ((t (:foreground "yellow" :backround "gray8"))))
; '(header-line-highlight ((t (:foreground "yellow" :backround "gray32"))))
; '(highlight ((t (:foreground "navy blue" :background "darkseagreen2"))))
; '(line-number-current-line ((t (:inherit line-number :foreground "yellow"))))
; '(mode-line ((t (:inverse-video t))))
; '(region ((t (:background "blue"))))
; '(widget-field-face ((t (:foreground "white" :background "darkgray"))) t)
; '(widget-single-line-field-face ((t (:background "darkgray"))) t))

;(global-font-lock-mode 1)
;(set-cursor-color "lightgreen")
;(set-background-color "gray16")

;;(set-face-font 'modeline "Lucida Console: Regular:14")
;;(set-face-font 'modeline "7x14")
;;(set-default-font "7x14")
;;(set-default-font "-monotype-courier new-medium-r-normal--0-0-0-0-m-0-ascii-0")
;;(set-default-font "-b&h-lucida console-medium-r-semi condensed--0-0-0-0-m-0-ascii-0")
;;(set-default-font "-*-Fixedsys-r-*-*-*-*-*-*-*-*-*-ansi-")
;;(set-face-attribute 'default nil font "Anonymous Pro-14")
;(set-face-attribute 'default nil :font "Consolas-13")

;(set-face-foreground 'font-lock-builtin-face        "lightgreen")
;;(set-face-foreground 'font-lock-constant-face      "darkred")
;;(set-face-foreground 'font-lock-function-name-face "cyan3")
;;(set-face-foreground 'font-lock-string-face        "dodgerblue")
;;(set-face-foreground 'font-lock-type-face          "green3")
;;(set-face-foreground 'font-lock-variable-name-face "coral")

;(hl-line-mode)
;(set-face-attribute 'hl-line nil :inherit nil :background "#404040")
;; ================================================
;; ================================================
;; ================================================

;(Setq c-font-lock-keywords c-font-lock-keywords-2
;      c++-font-lock-keywords c++-font-lock-keywords-2
;      lisp-font-lock-keywords lisp-font-lock-keywords-2)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("ba4ab079778624e2eadbdc5d9345e6ada531dc3febeb24d257e6d31d5ed02577" default))
 '(package-selected-packages
   '(gruber-darker-theme org-bullets use-package ox-hugo helm-org helm-ls-git helm-git-grep helm-cmd-t multiple-cursors smex nim-mode zig-mode magit rust-mode undo-fu undo-tree dap-mode lsp-ivy helm-lsp company lsp-treemacs flycheck lsp-ui lsp-mode auto-complete evil))
 '(warning-suppress-types '((lsp-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
