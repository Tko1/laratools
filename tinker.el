
(defun laratools/start-laravel-buffer ()
  (interactive)
  (let* ((project-root (if-let ((proot (projectile-project-root)))
                           proot
                         default-directory))
         (artisan (concat project-root "artisan"))
         (tinker-buffer        (make-comint-in-buffer "tinker" "app-lpsignals-tinker" "php" nil artisan "tinker")))
    (set-buffer tinker-buffer)))
(defun laratools/send-function ()
   (interactive)
   (mark-defun)
   (copy-region-as-kill (region-beginning) (region-end))
   (with-current-buffer "app-lpsignals-tinker"
     (yank)))

