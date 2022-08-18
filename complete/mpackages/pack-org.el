;;; pack-org.el --- Org-mode Configuration
;;
;;; Assis Tiago
;;
;;; Comments:

(require 'org)
(require 'ox-md)
(require 'ox-beamer)
(require 'ox-latex)
(require 'org-bullets)

(defun log-todo-creation-property (&rest ignore)
  "Log TODO creation time in the property drawer under the key 'CREATED'.
Inspired by https://emacs.stackexchange.com/a/35776"
  (when (and (org-get-todo-state) (not (org-entry-get nil "CREATED")))
    (org-entry-put nil "CREATED"
                   (format-time-string
                    (cdr '("[%Y-%m-%d %a]" . "[%Y-%m-%d %a %H:%M]"))))))
(advice-add 'org-insert-todo-heading :after #'log-todo-creation-property)

;;;; bullets customization
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-bullets-bullet-list '("◉" "❋" "❖" "◈"))

;; always use flyspell
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'abbrev-mode)
;; resume org-clock
(setq org-clock-persist t)
;; avoid breaking hours into days
(setq org-duration-format 'h:mm)
;; display clock for all time clocked into task today
(setq org-clock-mode-line-total 'today)
;; treat text lists as org head on TAB cycling
(setq org-cycle-include-plain-lists 'integrate)

;; set scale of latex output on org files
(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.7))
(setq org-preview-latex-image-directory "~/.ltx-org-img/")

(setq org-log-reschedule 'time)
(setq org-log-redeadline 'time)

(setq org-pomodoro-overtime-sound-p nil)
(setq org-pomodoro-short-break-sound-p nil)
(setq org-pomodoro-long-break-sound-p nil)

;;;; agenda
(setq org-src-tab-acts-natively t)
(setq org-agenda-start-on-weekday 0)
(setq org-deadline-warning-days 0)
(setq org-log-done t)
(setq org-capture-bookmark nil)
(setq org-agenda-span 'day)
(setq org-todo-keywords
      '((sequence  "NEXT" "WAIT" "INPG" "TODO" "RCSV" "|"
                   "DONE" "CNLD")))

(setq org-fontify-done-headline t)
(setq org-todo-keyword-faces
      (quote
       (("TODO" :foreground "#FF3232" :background "#21242b" :weight bold)
        ("RCSV" :foreground "#FF3232" :background "#21242b" :weight bold)
        ("NEXT" :foreground "#FF3232" :background "#21242b" :weight bold)
        ("INPG" :foreground "#6DBE00" :background "#21242b" :weight bold)
        ("WAIT" :foreground "#E0E200" :background "#21242b" :weight bold))))

(use-package org-pomodoro
  ;; https://redd.it/5ayjjl
  :ensure t
  :commands (org-pomodoro)
  :config
  (setq org-pomodoro-manual-break t)
  (setq org-pomodoro-long-break-length 15)
  (setq alert-user-configuration
        (quote ((((:category . "org-pomodoro")) libnotify nil))))
  (setq org-pomodoro-overtime-sound-p nil)
  (setq org-pomodoro-short-break-sound-p nil)
  (setq org-pomodoro-long-break-sound-p nil)
  (setq org-pomodoro-finished-sound-p nil))

(provide 'pack-org)
