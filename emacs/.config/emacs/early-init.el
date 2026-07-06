;;; early-init.el --- Early init -*- lexical-binding: t; -*-
;;; Commentary:
;; Loaded before the GUI and package system initialize.
;;; Code:

;; package.el will do its own init via `package-initialize' in init.el,
;; once archives are configured; skip the default early pass.
(setq package-enable-at-startup nil)

;; Avoid the startup flash of toolbar/scrollbar before frame params apply.
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;;; early-init.el ends here
