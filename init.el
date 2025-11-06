;;; init.el --- IDE-like Emacs config for C/C++ without external packages
;;; Commentary:
;; IDE-like features for C/C++: compile/run, header/source switch,
;; project navigation, Org-Babel tangling, built-in dark theme.

;;; Code:

;; --------------------
;; Basic Settings
;; --------------------
(setq inhibit-startup-message t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq column-number-mode t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq ring-bell-function 'ignore)
(global-display-line-numbers-mode t)
(show-paren-mode 1)
(global-visual-line-mode 1)
(global-font-lock-mode 1)
(setq default-directory "~/")
(setq select-enable-clipboard t)

;; --------------------
;; Built-in Dark Theme
;; --------------------
(load-theme 'wombat t)

;; --------------------
;; C / C++ Setup
;; --------------------
(setq c-default-style "linux"
      c-basic-offset 4)

;; Enable code folding
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)

;; --------------------
;; Compile & Run
;; --------------------
(defun compile-current-cpp-file ()
  "Compile current C/C++ file and store executable next to source."
  (interactive)
  (save-buffer)
  (let* ((file (buffer-file-name))
         (ext (file-name-extension file))
         (exe (concat (file-name-sans-extension file) ".out"))
         (compile-cmd
          (cond
           ((string-equal ext "c") (concat "gcc -Wall -o " exe " " file))
           ((string-equal ext "cpp") (concat "g++ -Wall -o " exe " " file))
           (t (error "Not a C or C++ file")))))
    (compile compile-cmd)))

(defun run-current-cpp-file ()
  "Run the compiled C/C++ executable."
  (interactive)
  (let* ((file (buffer-file-name))
         (exe (concat (file-name-sans-extension file) ".out")))
    (if (file-exists-p exe)
        (compile (concat "./" exe))
      (message "Executable not found. Compile first with F6"))))

(global-set-key (kbd "<f6>") 'compile-current-cpp-file)
(global-set-key (kbd "<f5>") 'run-current-cpp-file)

;; Compile on save automatically
(defun auto-compile-on-save ()
  "Automatically compile C/C++ file when saving."
  (when (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
    (compile-current-cpp-file)))

(add-hook 'after-save-hook 'auto-compile-on-save)

;; --------------------
;; Quick Switch Header/Source
;; --------------------
(defun switch-between-header-source ()
  "Switch between C/C++ header and source files."
  (interactive)
  (let* ((file (buffer-file-name))
         (ext (file-name-extension file))
         (base (file-name-sans-extension file))
         (candidates (cond
                      ((string-equal ext "c") (list (concat base ".h")))
                      ((string-equal ext "cpp") (list (concat base ".h") (concat base ".hpp")))
                      ((or (string-equal ext "h") (string-equal ext "hpp"))
                       (list (concat base ".c") (concat base ".cpp")))
                      (t nil)))
         (found (seq-find 'file-exists-p candidates)))
    (if found
        (find-file found)
      (message "No corresponding header/source found."))))

(global-set-key (kbd "C-c o") 'switch-between-header-source)

;; --------------------
;; Project Navigation
;; --------------------
(defun project-root ()
  "Find project root using .git or default-directory."
  (or (locate-dominating-file default-directory ".git")
      default-directory))

(defun project-find-file ()
  "Open file from project root."
  (interactive)
  (let ((default-directory (project-root)))
    (call-interactively 'find-file)))

(global-set-key (kbd "C-c p f") 'project-find-file)

;; --------------------
;; Org-mode & Tangling
;; --------------------
(setq org-directory "~/org")
(unless (file-directory-p org-directory)
  (make-directory org-directory t))
(setq org-agenda-files (list (concat org-directory "/agenda.org")))
(setq org-log-done 'time)
(setq org-src-fontify-natively t)
(global-set-key (kbd "C-c a") 'org-agenda)

;; Enable code block evaluation for C
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (shell . t)
   (C . t)))

;; Function to tangle C/C++ code from org file automatically
(defun org-tangle-current-file ()
  "Tangle current Org file."
  (interactive)
  (when (eq major-mode 'org-mode)
    (org-babel-tangle)
    (message "Org file tangled!")))

(global-set-key (kbd "C-c t") 'org-tangle-current-file)

;; --------------------
;; Undo & Performance
;; --------------------
(setq undo-tree-mode-lighter "")
(global-undo-tree-mode 1)
(setq gc-cons-threshold (* 50 1000 1000))
(setq read-process-output-max (* 1024 1024)) ;; 1MB

;;; Provide the configuration
(provide 'init)
;;; init.el ends here

