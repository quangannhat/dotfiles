;;; init.el --- Personal Emacs configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; A minimal vanilla starting point. Build it up from here.

;;; Code:

;; ---------------------------------------------------------------------------
;; Package management: package.el + use-package
;; ---------------------------------------------------------------------------
(require 'package)
(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)   ; auto-install declared packages

;; ---------------------------------------------------------------------------
;; Sane defaults
;; ---------------------------------------------------------------------------
(setq inhibit-startup-screen t
      initial-scratch-message nil
      ring-bell-function 'ignore
      use-short-answers t              ; y/n instead of yes/no
      create-lockfiles nil)

;; Keep the working tree clean: stash backups/autosaves out of the way.
(setq backup-directory-alist `((".*" . ,(expand-file-name "backups/" user-emacs-directory)))
      auto-save-file-name-transforms `((".*" ,(expand-file-name "auto-saves/" user-emacs-directory) t)))

(setq-default indent-tabs-mode nil    ; spaces, not tabs
              tab-width 4)

(global-display-line-numbers-mode 1)
(column-number-mode 1)
(save-place-mode 1)                    ; remember point per file
(recentf-mode 1)
(savehist-mode 1)
(electric-pair-mode 1)                 ; auto-close brackets
(global-auto-revert-mode 1)           ; reload files changed on disk

;; ---------------------------------------------------------------------------
;; Vim keybindings: evil + evil-collection
;; ---------------------------------------------------------------------------
(use-package evil
  :init
  ;; Must be set BEFORE evil loads.
  (setq evil-want-integration t        ; integrate with other modes
        evil-want-keybinding nil       ; required by evil-collection
        evil-want-C-u-scroll t         ; C-u scrolls like vim (not universal-arg)
        evil-undo-system 'undo-redo)   ; use Emacs 28+ native undo/redo
  :config
  (evil-mode 1))

;; Extend vim keys to built-in buffers (dired, help, etc.).
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; ---------------------------------------------------------------------------
;; Keep customize out of init.el
;; ---------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; ---------------------------------------------------------------------------
;; Reset GC to a sane runtime value (early-init raised it for startup).
;; ---------------------------------------------------------------------------
(setq gc-cons-threshold (* 16 1024 1024))

;;; init.el ends here
