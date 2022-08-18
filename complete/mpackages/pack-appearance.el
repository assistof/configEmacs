;;; pack-appearance.el --- Appearance package. Make emacs look good
;;
;;; Assis Tiago ---  https://git.sr.ht/~eduardofreitas/emacs.d
;;
;;; Comments:

;; is this the best way to do this?
(custom-set-variables
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (wombat)))
 '(column-number-mode t)
 '(global-hl-line-mode t)
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(safe-local-variable-values (quote ((whitespace-style))))
 '(show-paren-mode t)
 '(fill-column 80)
 '(tool-bar-mode nil))

(set-face-attribute 'default nil
                    :family "Source Code Pro" ; You must install this in your OS
                    :foundry "ADBO"
                    :height 130
                    :slant 'normal
                    :weight 'regular
                    :width 'normal)

(use-package all-the-icons)

(use-package doom-modeline
  :config
  (doom-modeline-mode 1))

;; (use-package doom-themes
;;   :config
;;   (setq doom-themes-treemacs-theme "doom-colors")
;;   (setq doom-themes-treemacs-enable-variable-pitch nil)
;;   (load-theme 'doom-vibrant t)
;;   (doom-themes-org-config)
;;   (doom-themes-treemacs-config))

(use-package hide-mode-line
  :hook
  ((treemacs-mode shell-mode) . hide-mode-line-mode))

(use-package display-line-numbers
  :hook
  (prog-mode . display-line-numbers-mode))

(use-package centaur-tabs
  :hook
  ((dired-mode
    shell-mode
    org-agenda-mode
    dashboard-mode
    messages-buffer-mode)
   . centaur-tabs-local-mode)
  (after-init . centaur-tabs-mode)
  :config
  (setq centaur-tabs-style "bar")
  (setq centaur-tabs-height 25)
  (setq centaur-tabs-set-icons t)
  (setq centaur-tabs-set-bar 'over)
  (setq centaur-tabs-cycle-scope 'tabs)
  :bind
  ("C-s-b" . centaur-tabs-backward)
  ("C-s-f" . centaur-tabs-forward))

;; highlight trailing also tabs that are not spaces
(setq whitespace-style '(face tabs tab-mark lines-tail trailing empty)
      whitespace-display-mappings '((tab-mark 9 [126 9])))
(global-whitespace-mode)

(provide 'pack-appearance)
