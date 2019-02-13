
(defun laratools/start-laravel-buffer ()
  (interactive)
  (let* ((project-root (if-let ((proot (projectile-project-root)))
                           proot
                         default-directory))
         (artisan (concat project-root "artisan"))
         (tinker-buffer        (make-comint-in-buffer "tinker" "app-lpsignals-tinker" "php" nil artisan "tinker")))
    (set-buffer tinker-buffer)))
(defun laratools/eval-function ()
   (interactive)
   (mark-defun)
   (copy-region-as-kill (region-beginning) (region-end))
   (with-current-buffer "app-lpsignals-tinker"
     (yank)))
(defun laratools/eval-file ())
(defun laratools/eval-expr ())
(defun laratools/eval-buffer ()
  (mark-whole-buffer)
  (copy-region-as-kill (region-beginning) (region-end))
  (with-current-buffer "app-lpsignals-tinker"
    (yank)))
(defun foobar ()
  (interactive)
  (save-excursion
    (call-interactively 'move-end-of-line)
    (search-backward-regexp "^\\s-*\\(?:\\(?:abstract\\|final\\)\\s-+\\)?class\\s-+\\(\\(?:\\sw\\|\\\\\\|\\s_\\)+\\)")
    (let ((ret (match-string 1)))
      (message ret)
      ret)))

;;(defgroup laratools/popup )
;;(magit-worktree-status)
;;(defface laratools/popup-key
;;  '((t :inherit font-lock-builtin-face))
;;  :group 'laratools/popup-faces)
(require 'cl-lib)
(cl-defun laratools/invoke-popup (&key switches options (title ""))
  (interactive)
  (let ((popup-buffer (get-buffer-create (concat "*laratools-" title "-popup*"))))
    (with-current-buffer popup-buffer
      (insert "Switches\n  -c Create migration for specific table (--create)\n3\n4\n5\n\nOptions\n  =c Create migration for specific table (--create=)\n\nCommands\n m Migrate")
      (beginning-of-buffer))
    (split-window-below)
    (other-window 1)
    (set-window-buffer nil popup-buffer)
    (fit-window-to-buffer)))
;;(magit-invoke-popup)

