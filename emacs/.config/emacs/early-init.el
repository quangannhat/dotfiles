;;; early-init.el --- Loaded before init.el and GUI setup -*- lexical-binding: t; -*-

;; Speed up startup by raising the GC threshold during init; reset later.
(setq gc-cons-threshold most-positive-fixnum)

;; Don't let package.el initialize before init.el runs.
(setq package-enable-at-startup nil)

;; Strip chrome early so it never flashes on screen.
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;;; early-init.el ends here
