;;; pack-tools.el --- Tools package
;;
;;; Assis Tiago ---  https://git.sr.ht/~eduardofreitas/emacs.d
;;
;;; Comments: this holds all tools that I use that are not appearance related.

(use-package multiple-cursors)

(use-package magit
  :config
  (setq magit-diff-refine-hunk t))

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner 'logo
        dashboard-center-content t
        dashboard-set-heading-icons t
        dashboard-set-file-icons t
        dashboard-week-agenda nil
        dashboard-items '((bookmarks . 5)
                          (recents   . 5)
                          (projects  . 5))))

(use-package dired
  :config
  (put 'dired-find-alternate-file 'disabled nil)
  :bind
  ;; dired wont open a buffer for each directory
  (:map dired-mode-map
        ("RET" . dired-find-alternate-file)))

(use-package treemacs
  :config
  (setq treemacs-width 28))

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)

(use-package auctex
  :init
  (add-hook 'TeX-after-compilation-finished-functions
            #'TeX-revert-document-buffer)
  (setq TeX-source-correlate-mode t
        TeX-source-correlate-start-server t)
  (setq font-latex-fontify-script nil)
  (setq TeX-parse-self t)
  (setq TeX-auto-save t)
  (setq TeX-auto-local ".auto")
  (setq TeX-command-force "LaTeX")
  (setq-default TeX-master "../main")
  (setq reftex-plug-into-AUCTeX t)
  (setq LaTeX-clean-intermediate-suffixes '("\\.aux" "\\.bbl" "\\.blg" "\\.brf"
  "\\.fot" "\\.glo" "\\.gls" "\\.idx" "\\.ilg" "\\.ind" "\\.lof" "\\.log"
  "\\.lot" "\\.nav" "\\.out" "\\.snm" "\\.toc" "\\.url" "\\.synctex\\.gz"
  "\\.bcf" "\\.run\\.xml" "\\.fls" "-blx\\.bib" "\\.acn" "\\.acr" "\\.alg"
  "\\.glg" "\\.ist" "\\.lol" "\\.loq" "\\.spl" "\\.glsdefs"))
  :hook
  (LaTeX-mode . LaTeX-math-mode)
  (LaTeX-mode . display-line-numbers-mode)
  (LaTeX-mode . turn-on-reftex))

(use-package pdf-tools
  :if window-system
  :demand
  :config
  (pdf-loader-install)
  (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
        TeX-source-correlate-start-server t)
  (setq pdf-view-midnight-colors '("#c4ccdb" . "#282c34" )))

;; Dumb-jump requires `ag'
;; (use-package dumb-jump
;;   :config
;;   (dumb-jump-mode))

(use-package projectile
  :config
  (projectile-mode +1))

(use-package company
  :hook
  (after-init . global-company-mode)
  :config
  (company-quickhelp-mode))

(use-package lsp-mode
  :hook
  (c-mode     . lsp-deferred)
  (c++-mode   . lsp-deferred)
  :commands
  (lsp lsp-deferred))

(use-package lsp-ui
  :commands
  (lsp-ui-peek-mode)
  :config
  (setq lsp-ui-doc-enable nil)
  :bind
  ("M-." . lsp-ui-peek-find-definitions)
  ("M-?" . lsp-ui-peek-find-references))

(use-package hl-todo
  :config
  (global-hl-todo-mode)
  (setq hl-todo-highlight-punctuation ":")
  (setq hl-todo-keyword-faces
        '(("TODO" . "#FF4500")
          ("FIX"  . "#FF3333")
          ("NOTE" . "#A020F0"))))

(use-package exec-path-from-shell
  :if window-system
  :demand
  :config
  (exec-path-from-shell-initialize))

(require 'yasnippet)
(yas-reload-all)
(add-hook 'c-mode-hook #'yas-minor-mode)
(add-hook 'LaTeX-mode-hook #'yas-minor-mode)
(add-hook 'sh-mode-hook #'yas-minor-mode)
(add-hook 'org-mode-hook #'yas-minor-mode)


(provide 'pack-tools)
