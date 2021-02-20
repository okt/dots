;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!
(setq comp-async-env-modifier-form "")

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Evan Fiddes"
      user-mail-address "web@evanfiddes.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "SFMono Nerd Font" :size 18 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "SF Pro Display" :size 18))
(setq emojify-display-style 'unicode)

(setq doom-theme `srcery)
(setq confirm-kill-emacs nil)
;; (set-window-margins (selected-window) 8 8)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has load
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq doom-themes-enable-bold t)
(setq doom-themes-enable-italic t)

(setq doom-themes-treemacs-theme "doom-colors")
(setq doom-themes-treemacs-enable-variable-pitch nil)
;; (custom-set-faces!
;;   '(treemacs-root-face :family "SF Pro Display" :height 120)
;;   '(treemacs-git-unmodified-face :family "SF Pro Display" :height 120)
;;   '(treemacs-git-modified-face :family "SF Pro Display" :height 120)
;;   '(treemacs-git-renamed-face :family "SF Pro Display" :height 120)
;;   '(treemacs-git-ignored-face :family "SF Pro Display" :height 120)
;;   '(treemacs-git-untracked-face :family "SF Pro Display" :height 120)
;;   '(treemacs-git-added-face :family "SF Pro Display" :height 120)
;;   '(treemacs-git-conflict-face :family "SF Pro Display" :height 120)
;;   '(treemacs-directory-face :family "SF Pro Display" :height 120)
;;   '(treemacs-directory-collapsed-face :family "SF Pro Display" :height 120)
;;   '(treemacs-file-face :family "SF Pro Display" :height 120)
;;   '(treemacs-tags-face :family "SF Pro Display" :height 120)
;;   )

(defun my/treemacs-setup-title ()
  (let ((bg (face-attribute 'default :background))
        (fg (face-attribute 'default :foreground)))
    (face-remap-add-relative 'header-line
                             :family "SF Pro Display"
                             :height 120
                             :background bg :foreground fg
                             :box `(:line-width ,(/ (line-pixel-height) 2) :color ,bg)))
  (setq header-line-format
        '((:eval
           (let* ((text "File Explorer")
                  (extra-align (+ (/ (length text) 2) 1))
                  (width (- (/ (window-width) 2) extra-align)))
             (concat (make-string width ?\s) text))))))

(add-hook 'treemacs-mode-hook #'my/treemacs-setup-title)
(setq display-line-numbers-type 'relative)
(setq-default
 indent-tabs-mode nil
 tab-width 2
 evil-shift-width 2
 standard-indent 2
 line-spacing 2
 )
(after! highlight-indent-guides
  (setq highlight-indent-guides-method 'column
        highlight-indent-guides-responsive t))

(setq doom-modeline-enable-word-count nil)
(setq doom-modeline-height 42)
(setq posframe-gtk-resize-child-frames 'resize-mode)
;; (setq fast-but-imprecise-scrolling t)
(add-hook 'prog-mode-hook 'pixel-scroll-mode)
(add-hook 'text-mode-hook 'pixel-scroll-mode)
(setq pixel-dead-time 0)
(setq pixel-resolution-fine-flag t)
(remove-hook! doom-first-buffer #'global-hl-line-mode)

;; (use-package! centaur-tabs
;;   :hook (doom-first-file . centaur-tabs-mode)
;;   :init
;;   (setq centaur-tabs-set-icons t)
;;   (setq centaur-tabs-gray-out-icons 'buffer)
;;   (setq centaur-tabs-style "chamfer")
;;   (setq centaur-tabs-set-bar 'under)
;;   (setq centaur-tabs-set-modified-marker t)
;;   (setq centaur-tabs-modified-marker "•")
;;   (setq centaur-tabs-close-button "✕")
;;   (setq centaur-tabs-cycle-scope 'tabs)
;;   :config
;;   (add-hook '+doom-dashboard-mode-hook #'centaur-tabs-local-mode)
;;   (add-hook '+popup-buffer-mode-hook #'centaur-tabs-local-mode)
;;   (centaur-tabs-change-fonts "SF Pro Display" 120)
;;   (centaur-tabs-group-by-projectile-project)
;;   (setq centaur-tabs-set-icons t)
;;   (setq centaur-tabs-set-modified-marker t)
;;   (setq centaur-tabs-set-bar 'under)
;;   (setq centaur-tabs-height 32)
;;   (setq centaur-tabs-left-edge-margin "     ")
;;   (setq centaur-tabs-right-edge-margin "     ")
;;   (centaur-tabs-mode t)
;;   :bind
;;   (:map evil-normal-state-map
;;    ("g t" . centaur-tabs-forward)
;;    ("g T" . centaur-tabs-backward))
;;   )

;; Company completion
(after! company
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (setq company-show-numbers nil)
  )
(set-company-backend! '(c-mode
                        c++-mode
                        haskell-mode
                        lisp-mode
                        sh-mode
                        css-mode
                        web-mode
                        js-mode
                        python-mode
                        rust-mode
                        org-mode
                        nix-mode)
  '(:separate company-files))


;; LSP language server
(after! lsp-mode
  (add-to-list 'lsp-language-id-configuration '(nix-mode . "nix"))
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("rnix-lsp"))
                    :major-modes '(nix-mode)
                    :server-id 'nix))
  (setq lsp-modeline-diagnostics-enable nil)
  (setq lsp-ui-sideline-enable nil)
  )

(setq-default
 history-length 1000
 prescient-history-length 1000
 )

(add-hook 'text-mode-hook 'rainbow-mode)
(add-hook 'prog-mode-hook 'rainbow-mode)

(setq org-directory "~/org/")
(setq org-startup-folded t)
(setq org-startup-with-inline-images t)
(use-package! mixed-pitch
  :hook
  (org-mode . mixed-pitch-mode))

(setq org-hide-emphasis-markers t)
(with-eval-after-load 'org
  (set-face-attribute 'org-level-1 nil :height 1.5)
  (set-face-attribute 'org-level-2 nil :height 1.25)
  (set-face-attribute 'org-level-3 nil :height 1.0)
  (set-face-attribute 'org-level-4 nil :height 1.0)
  (set-face-attribute 'org-level-5 nil :height 1.0)
  )
(setq org-ellipsis "")
(defun my-set-margins ()
  (setq left-margin-width 2)
  (setq right-margin-width 2))
(add-hook 'org-mode-hook 'my-set-margins)
(after! evil-escape (evil-escape-mode -1))
(after! evil (setq evil-ex-substitute-global t))
(setq auto-save-default t)
(setq-default delete-by-moving-to-trash t)
(setq-default x-stretch-cursor t)

(after! twittering-mode
  (setq twittering-icon-mode t))

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-center-content t)
  ;; (setq dashboard-startup-banner 'logo)
  (setq dashboard-startup-banner "~/pics/ui/doom.png")
  ;; (setq dashboard-set-heading-icons t)
  ;; (setq dashboard-set-file-icons t)
  (setq dashboard-set-init-info t)
  (setq dashboard-set-footer nil)
  (setq dashboard-week-agenda t)
  (dashboard-setup-startup-hook))

(setq window-divider-default-right-width 3)
(setq window-divider-default-places 'right-only)
(window-divider-mode)
