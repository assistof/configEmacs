;;; init.el --- Emacs initialization file
;;
;;; Assis Tiago --- 
;;
;;; Comments: put this directory as ~/.emacs.d and uncomment the line noted
;;            bellow. Run emacs and wait the packages to be installed. Some
;;            external programs may be necessary, like ag or latex.

;;;; Package Initialization
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq package-selected-packages
      (quote
       (treemacs-magit treemacs-projectile lua-mode projectile ag all-the-icons
                       auctex centaur-tabs company hl-todo company-quickhelp
                       dashboard doom-modeline htmlize doom-themes dumb-jump
                       hide-mode-line lsp-mode lsp-ui markdown-mode magit
                       multiple-cursors treemacs org-bullets origami
                       page-break-lines pdf-tools use-package yasnippet
                       yasnippet-snippets flycheck rainbow-delimiters
                       exec-path-from-shell org-pomodoro writegood-mode
                       visual-fill-column)))

;; NOTE: uncomment line bellow if its the first time launching this config
;; (package-refresh-contents)
;; (package-install-selected-packages)

(eval-when-compile
  (require 'use-package))

(add-to-list 'load-path "~/.emacs.d/mpackages/")
(use-package pack-tools)
(use-package pack-appearance)
(use-package pack-keybindings)
(use-package pack-tweaks)
(use-package pack-org)
;; NOTE: comment the line bellow since this file is not available in the repo
(use-package pack-orgPrivate)
