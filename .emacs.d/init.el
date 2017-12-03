(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(let ((package-list '(use-package)))
  (progn
    (unless package-archive-contents
      (package-refresh-contents))

    (dolist (package package-list)
      (unless (package-installed-p package)
        (package-install package)))))

(require 'use-package)
(setq use-package-always-ensure t)
(setq use-package-verbose t)
(setq-default mode-line-default-help-echo nil
              show-help-function nil )

(fset #'yes-or-no-p #'y-or-n-p) ; y/n instead of yes/no

(setq inhibit-startup-message t)


(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(show-paren-mode 1)
(use-package org-plus-contrib
  :init
  (global-set-key "\C-cl" 'org-store-link)
  (global-set-key "\C-ca" 'org-agenda)
  (global-set-key "\C-cc" 'org-capture)
  (global-set-key "\C-cb" 'org-iswitchb)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (C . t)
     (latex . t)
     (ruby . t)
     (python . t)
     )
   )
  (add-hook 'text-mode-hook 'turn-on-visual-line-mode)
  (setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
  (setq org-todo-keywords '((sequence "TODO" "PENDING"  "DONE")))
  (setq org-log-done t)
  )

(use-package diminish)
(use-package eyebrowse)
(use-package persp-mode)
(use-package ox-twbs)
;; breaks creating new buffers
;; (use-package neotree
;;   :ensure t
;;   :init
;;   (setq neo-smart-open t)
;;   (add-hook 'after-init-hook 'neotree-show t)
;;   :config
;;   (global-set-key (kbd "<f8>") 'neotree-toggle)
;;   )

(use-package treemacs
  :bind
  (:map global-map
        ([f8] . treemacs-toggle))
  )

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t)
  ;; (doom-themes-neotree-config)
  ;; (setq doom-neotree-file-icons 'simple)
  )

(use-package all-the-icons
  :ensure doom
  )
(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  )

(use-package tex
  :ensure auctex
  )

(use-package clean-aindent-mode
  :init
  (add-hook 'prog-mode-hook 'clean-aindent-mode)
  )

(use-package ws-butler
  :init
  (add-hook 'c-mode-common-hook 'ws-butler-mode)
  )

(use-package dtrt-indent
  :diminish dtrt-indent-mode
  :init
  (dtrt-indent-mode 1)
  )

(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  )

(use-package spaceline
  :init
  (require 'spaceline-config)
  (spaceline-emacs-theme)
  )

(use-package helm
  :init
    (setq helm-autoresize-max-height 30)
    (setq helm-autoresize-min-height 30)
  :diminish helm-mode
  :demand
  :bind (("M-x" . helm-M-x)
         ("M-y" . helm-show-kill-ring)
         ("C-x b" . helm-mini)
         ("C-x C-b" . helm-buffers-list)
         ("C-x C-f" . helm-find-files)
         ("C-x C-r" . helm-recentf)
         ("C-x c o" . helm-occur))
  :config
  (require 'helm-config)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-t") 'helm-select-action)

  (setq helm-buffers-fuzzy-matching t
	helm-move-to-line-cycle-in-source t
	helm-ff-file-name-history-use-recentf t
    helm-split-window-in-side-p t)

  (helm-autoresize-mode 1)
  (helm-mode 1)
  )

(use-package swiper-helm
  :bind ("C-s" . swiper-helm))

(use-package undo-tree
  :diminish undo-tree-mode Undo
  :config
  (global-undo-tree-mode)
  (setq undo-tree-visualizer-timestamps t)
  (setq undo-tree-visualizer-diff t)
  )

(use-package markdown-mode)

(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))
(global-unset-key (kbd "C-x o"))
(global-unset-key (kbd "C-x C-c"))

(defalias 'ctl-z-keymap (make-sparse-keymap))
(defvar ctl-z-map (symbol-function 'ctl-z-keymap))
(define-key global-map "\C-z" 'ctl-z-keymap)

(use-package ace-window
  :init
  (global-set-key (kbd "C-x o") 'ace-window)
  (add-hook 'after-init-hook 'ace-window-display-mode)
  )

(use-package org-bullets
  :init
  (add-hook 'org-mode-hook
            (lambda ()
              (org-bullets-mode t)
              )
            )
  )

(setq org-hide-leading-stars t)
(use-package magit
  :bind ("M-s s". magit-status))

;disable suspend

(setq backup-directory-alist
      `((".*" . ,"~/.emacs.d/tmp/")))
(setq auto-save-file-name-transforms
      `((".*" ,"~/.emacs.d/tmp/" t)))

(global-set-key (kbd "C-x w") 'webjump)
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium")
(eval-after-load "webjump"
  '(add-to-list 'webjump-sites
		'("Urban Dictionary" .
		  [simple-query
		   "www.urbandictionary.com"
		   "http://www.urbandictionary.com/define.php?term="
		   ""])
  '("Google" .
    [simple-query
     "www.google.com"
     "http://www.google.com/search.php?q="
     ""])))


;goto will show line num
(global-set-key [remap goto-line] 'goto-line-with-feedback)

(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))

;c-return to add line below, c-s-return to add line above
(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)

(defun move-line-down ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines 1))
    (forward-line)
    (move-to-column col)))

(defun move-line-up ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines -1))
    (move-to-column col)))

(global-set-key (kbd "<C-S-down>") 'move-line-down)
(global-set-key (kbd "<C-S-up>") 'move-line-up)

;; see http://stackoverflow.com/a/9697222
(defun comment-dwim-to-nextline ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end))
  (next-line))

(defun comment-dwim-to-prevline ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end))
  (previous-line))

(global-unset-key (kbd "M-;"))
(global-unset-key (kbd "C-;"))
(global-set-key (kbd "C-;") 'comment-dwim-to-nextline)
(global-set-key (kbd "M-;") 'comment-dwim-to-prevline)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-revert-interval 1)
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "6ee6f99dc6219b65f67e04149c79ea316ca4bcd769a9e904030d38908fd7ccf9" "8ed752276957903a270c797c4ab52931199806ccd9f0c3bb77f6f4b9e71b9272" default)))
 '(helm-grep-ag-command
   "rg --color=always --smart-case --no-heading --line-number %s %s %s")
 '(package-selected-packages
   (quote
    (diminish eyebrowse persp-mode htmlize xpm treemacs popwin ox-twbs org-plus-contrib ws-butler drtr-indent company company-mode darkokai darkokai-theme monokai-alt-theme monokai-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;folding
(add-hook 'c-mode-common-hook 'hs-minor-mode)

;;endline + indent
(global-set-key (kbd "RET") 'newline-and-indent)

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

(column-number-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(put 'upcase-region 'disabled nil)
