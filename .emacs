;;; Bart's .emacs file
;;;

(setq-default indent-tabs-mode nil)
(setq-default fill-column 90)
;; emacs 24 packages!!
(require 'package)
(package-initialize)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)
(define-key global-map (kbd "C-z") 'undo)
;;(define-key global-map "\C-c\C-t" lambda() (load-theme 'oldlace))

(set-keyboard-coding-system nil)
;; nano
(define-key global-map "\C-c\C-w" 'word-count)
(define-key global-map "\C-c\C-r" 'revert-buffer)
;; soft-fold lines beyond 90 or so.
(add-hook 'markdown-mode-hook 'longlines-mode)

;; count words in buffer
(defun word-count () 
        "Count words in buffer" 
        (interactive)
        (shell-command-on-region 
         (point-min) 
         (point-max) 
         "wc -w"))

(setq linum-format "%d ")

;; good theme for terminals
;;(load-theme 'wombat)
;; (load-theme 'oldlace)

; lets try this, it opens buffer menu and moves to that buffer
(global-set-key "\C-x\C-b" 'list-buffers)

; ido
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

; show matching parens
(require 'paren)
(setq show-paren-style 'parenthesis)
;;(setq show-paren-style 'mixed)
(show-paren-mode +1)
(setq show-paren-delay 1)
(setq-default cursor-type 'bar)
(set-face-background 'show-paren-match-face "#333333")
(set-face-attribute 'show-paren-match-face nil 
                    :weight 'bold :underline nil :overline nil :slant 'normal :foreground "#2ac4f6" )


;; Rake files are ruby, too, as are gemspecs, rackup files, and gemfiles.
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))

(setq inhibit-splash-screen t inhibit-startup-echo-area-message t)

;; neotree >> package-install neotree
(global-set-key [f8] 'neotree-toggle)

;; magit-status
;;   s: stage file, u: unstage, c: commit-log
;;   C-c C-c: commit, P: push
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; turn on autofill for text-mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Moved this down here as php-mode was using C-c C-m !!
;; stop using M-x, stop folding thumb under 
(define-key global-map "\C-c\C-m" 'execute-extended-command)
(define-key global-map "\C-x\C-m" 'execute-extended-command)

;; ========== Place Backup Files in Specific Directory ==========
;; Enable backup files.
(setq make-backup-files t)
;; Enable versioning with default values (keep five last versions, I think!)
(setq version-control t)
;; Save all backup file in this directory, instead of leaving tilde files everywhere 
;;(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

