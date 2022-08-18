;;; pack-tweaks.el --- Simple tweaks
;;
;;; Eduardo Freitas ---  https://git.sr.ht/~eduardofreitas/emacs.d
;;
;;; Comments:

;; disable backup
(setq backup-inhibited t)

;; disable auto save
(setq auto-save-default nil)

;; scrolling line by line
(setq scroll-conservatively 1)

;; automatically brakes lines on 80th column
(setq-default auto-fill-function 'do-auto-fill)

;; no startup
(setq inhibit-startup-screen t)

;; Undo limit is 1MB
(setq undo-limit 1048576)

;; Rainbow delimiters
(add-hook 'c-mode-hook #'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook #'rainbow-delimiters-mode)
(add-hook 'sh-mode-hook #'rainbow-delimiters-mode)

;; tabs are evil
(setq-default indent-tabs-mode nil)

;; default coding style
(setq c-default-style "k&r"
      c-basic-offset 4)

;; fckng python tabs
(add-hook 'python-mode-hook
          (lambda ()
            (setq indent-tabs-mode t)
            (setq tab-width 4)
            (setq python-indent-offset 4)))

(provide 'pack-tweaks)
