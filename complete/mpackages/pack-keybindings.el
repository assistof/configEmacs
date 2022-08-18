;;; pack-keybindings.el --- My personal keybindings
;;
;;; Assis Tiago ---  https://git.sr.ht/~eduardofreitas/emacs.d
;;
;;; Comments:

(defun move-line-up () "Move up the current line" (interactive)
  (transpose-lines 1) (forward-line -2) (indent-according-to-mode))

(defun move-line-down () "Move down the current line" (interactive)
       (forward-line 1) (transpose-lines 1) (forward-line -1)
       (indent-according-to-mode))

(defun mwriter ()
  "Runs functions when writing text in emacs."
  (interactive)
  (flyspell-mode) (writegood-mode) (ispell-change-dictionary "en_US")
  (abbrev-mode))

(defun pomodoro-sound-on ()
  "Activate sounds for org-pomodoro"
  (interactive)
  (setq org-pomodoro-overtime-sound-p t)
  (setq org-pomodoro-short-break-sound-p t)
  (setq org-pomodoro-long-break-sound-p t))

(defun pomodoro-sound-off ()
  "Deactivate sounds for org-pomodoro"
  (interactive)
  (setq org-pomodoro-overtime-sound-p nil)
  (setq org-pomodoro-short-break-sound-p nil)
  (setq org-pomodoro-long-break-sound-p nil))

(defun visual-wrap ()
  "Activate a good looking and automatic visual line wrap that
doesn't modify the buffer"
  (interactive)
  (visual-line-mode)
  (visual-fill-column-mode))

(defun overleaf-writer ()
  "Make emacs compatible with writing LaTeX files hosted in
overleaf by work groups. Usually they prefer to write paragraphs
without breaking lines at the 80th column (urgh), so this
function makes a visual break and disable whitespace highlight"
  (interactive)
  (whitespace-turn-off)
  (visual-wrap)
  (mwriter))

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x C-g l") 'magit-log-buffer-file)
(global-set-key (kbd "C-c t t") 'treemacs)

;; all of my "personal" keybindings for calling packages start with C-=
;; org
(global-set-key (kbd "C-= C-o a") 'org-agenda)
(global-set-key (kbd "C-= C-o c") 'org-capture)
(global-set-key (kbd "C-= C-o l") 'org-store-link)
(global-set-key (kbd "C-= C-o p") 'org-pomodoro)
(global-set-key (kbd "C-= C-o C-l") 'org-toggle-link-display)
(global-set-key (kbd "C-c C-x C-r") 'org-clock-report)
;; origami (fold)
(global-set-key (kbd "C-= C-f f") 'origami-mode)
(global-set-key (kbd "C-= C-f a") 'origami-close-all-nodes)
(global-set-key (kbd "C-= C-f O") 'origami-open-all-nodes)
(global-set-key (kbd "C-= C-f c") 'origami-close-node-recursively)
(global-set-key (kbd "C-= C-f o") 'origami-open-node-recursively)
(global-set-key (kbd "C-= C-f C-o") 'origami-open-node)
;; whitespace
(global-set-key (kbd "C-= C-w m") 'whitespace-mode)
(global-set-key (kbd "C-= C-w c") 'whitespace-cleanup)
;;
;; flyspell
(global-set-key (kbd "C-= s")     'flyspell-mode)
(global-set-key (kbd "C-= C-s b") 'flyspell-buffer)
;;
(global-set-key (kbd "C-= c")   'company-complete)
(global-set-key (kbd "C-= w")   'mwriter)
(global-set-key (kbd "C-= W")   'overleaf-writer)
(global-set-key (kbd "C-= b")   'visual-wrap)
(global-set-key (kbd "C-= C-c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-= r")   'revert-buffer)
(global-set-key (kbd "C-= d")   'ispell-change-dictionary)
(global-set-key (kbd "C-= t")   'centaur-tabs-local-mode)
(global-set-key (kbd "C-= l")   'TeX-clean)
(global-set-key (kbd "C-= TAB") 'untabify)
(global-set-key (kbd "C-= h")   'highlight-symbol-at-point)
(global-set-key (kbd "C-= H")   'unhighlight-regexp)
(global-set-key (kbd "C-= p")   'pdf-view-midnight-minor-mode)
(global-set-key (kbd "C-= o")   'outline-minor-mode)
(global-set-key (kbd "C-s-<mouse-1>") 'mc/add-cursor-on-click)
(global-set-key (kbd "C-s-p")   'mc/mark-previous-like-this)
(global-set-key (kbd "C-s-n")   'mc/mark-next-like-this)
;; package related
(setq lsp-keymap-prefix "C-= C-l")
(setq flycheck-keymap-prefix (kbd "C-= C-e"))
(setq outline-minor-mode-prefix (kbd "C-<tab>"))
(define-key projectile-mode-map (kbd "C-= C-p") 'projectile-command-map)
(define-key pdf-view-mode-map (kbd "b") 'pdf-view-scroll-down-or-previous-page)
(define-key pdf-view-mode-map (kbd "DEL") 'image-previous-frame)

;; moving arround
(global-set-key (kbd "s-p") 'windmove-up)
(global-set-key (kbd "s-n") 'windmove-down)
(global-set-key (kbd "s-b") 'windmove-left)
(global-set-key (kbd "s-f") 'windmove-right)
(global-set-key (kbd "s-o") 'other-window)
(global-set-key (kbd "<C-s-right>") 'next-buffer)
(global-set-key (kbd "<C-s-left>") 'previous-buffer)
(global-set-key (kbd "M-p") 'move-line-up)
(global-set-key (kbd "M-n") 'move-line-down)
(global-set-key (kbd "M-s-b")
                'centaur-tabs-move-current-tab-to-left)
(global-set-key (kbd "M-s-f")
                'centaur-tabs-move-current-tab-to-right)


(provide 'pack-keybindings)
