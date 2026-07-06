;;; init.el --- Personal Emacs configuration -*- lexical-binding: t; -*-
;;; Commentary:
;; Vanilla Emacs, built up incrementally. Add features here as needed.
;;; Code:

;; --- package.el ---------------------------------------------------------
(require 'package)
;; Set this ourselves (matching no-littering's convention) so packages land
;; in var/elpa from the very first run, before no-littering itself exists to
;; relocate it.
(setq package-user-dir (expand-file-name "var/elpa/" user-emacs-directory))
(setq package-gnupghome-dir (expand-file-name "gnupg" package-user-dir))
(setq package-archives '(("gnu"    . "https://elpa.gnu.org/packages/")
                          ("melpa"  . "https://melpa.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; --- no-littering: keep this directory clean of generated files ---------
(use-package no-littering
  :config
  (setq custom-file (no-littering-expand-etc-file-name "custom.el"))
  (when (file-exists-p custom-file)
    (load custom-file)))

;; --- evil: vim keybindings -------------------------------------------------
(use-package evil
  :init
  (setq evil-want-integration t
        evil-want-keybinding nil
        evil-undo-system 'undo-redo)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; --- sane defaults --------------------------------------------------------
(setq inhibit-startup-screen t
      initial-scratch-message nil
      ring-bell-function #'ignore
      make-backup-files nil)
(fset 'yes-or-no-p 'y-or-n-p)
(global-auto-revert-mode 1)

;;; init.el ends here
