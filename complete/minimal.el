;;; minimal.el --- Emacs minimal configuration for terminal use
;;
;;; Assis Tiago --- 
;;
;;; Comments: this is a minimal emacs configuration that I use with
;;            `emacs -nw -Q --load minimal.el' when I want to quickly edit
;;            something in the terminal without having to load all my configs.
;;            Usefull for using in your server too.

(custom-set-variables
 '(custom-enabled-themes (quote (wombat)))
 '(blink-cursor-mode nil)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(set-face-attribute 'default nil
                    :height 105)

;; disable backup
(setq backup-inhibited t)

;; disable auto save
(setq auto-save-default nil)

;; scrolling line by line
(setq scroll-conservatively 1)

;; no startup
(setq inhibit-startup-screen t)

;; fckng python tabs
(add-hook 'python-mode-hook
          (lambda ()
            (setq indent-tabs-mode t)
            (setq tab-width 4)
            (setq python-indent-offset 4)))

;; dired wont open a buffer for each directory
(require 'dired)
(put 'dired-find-alternate-file 'disabled nil)
(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; default coding style
(setq c-default-style "k&r"
      c-basic-offset 4)

;; highlight trailing and tabs that are not spaces
(setq whitespace-style '(face tabs tab-mark lines-tail trailing))
(setq whitespace-display-mappings '((tab-mark 9 [126 9])))
(global-whitespace-mode)

;; moving arround
(defun move-line-up () "Move up the current line" (interactive)
  (transpose-lines 1) (forward-line -2) (indent-according-to-mode))

(defun move-line-down () "Move down the current line" (interactive)
       (forward-line 1) (transpose-lines 1) (forward-line -1)
       (indent-according-to-mode))

(global-set-key (kbd "M-p")     'move-line-up)
(global-set-key (kbd "M-n")     'move-line-down)
(global-set-key (kbd "<C-s-f>") 'next-buffer)
(global-set-key (kbd "<C-s-b>") 'previous-buffer)
