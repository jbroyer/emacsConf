;;--------------------------------------------------------------------
;; GENERAL

;load el files
(add-to-list 'load-path "~/elisp3")
(add-to-list 'load-path "~/.emacs.d")

; --------------------------------------------------------------------
;; YAML-MODE

(require  'yaml-mode)

(add-hook 'yaml-mode-hook
		  (lambda ()
			(define-key yaml-mode-map "\C-m" 'newline-and-indent)))

; --------------------------------------------------------------------
;; MEL-MODE

(require  'mel-mode)

; --------------------------------------------------------------------
;; MAYA COMMAND PORT

(add-hook
 'python-mode-hook
 (lambda ()
   (require 'etom)
   (setq etom-default-host "localhost")
   (setq etom-default-port 2222)
   (local-set-key (kbd "C-c C-r") 'etom-send-region)
   (local-set-key (kbd "C-c C-c") 'etom-send-buffer)
   (local-set-key (kbd "C-c C-l") 'etom-send-buffer)
   (local-set-key (kbd "C-c C-z") 'etom-show-buffer)))


; --------------------------------------------------------------------
;; PYTHON IDE
;; (load-file "/homes/jbro/elisp/gabrielelanaro-emacs-for-python-1cfe7c5/epy-init.el")

; --------------------------------------------------------------------
;; AUTO-COMPLETE

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/homes/jbro/.emacs.d//ac-dict")
(ac-config-default)


; --------------------------------------------------------------------
;; COULEURS

(require 'color-theme)
(setq color-theme-is-global t)
(color-theme-charcoal-black)


; couleurs dans le texte
(global-font-lock-mode t)

; maximum de couleur
(setq font-lock-maximum-decoration t)

; region selectionne surbrillance
(transient-mark-mode t)


; --------------------------------------------------------------------
;; FONTSIZE

(defun fontify-frame (frame)
  (set-frame-parameter frame 'font "Misc-Misc Fixed-normal-normal-normal-\*-13-\*-\*-\*-c-70-iso10646-1"))


; --------------------------------------------------------------------
;; Line numbers

(require 'line-num)
(turn-on-line-numbers-display t)


; --------------------------------------------------------------------
;; Complete tag binding

(global-set-key "\M-," 'complete-tag) 

;(defun my-etags-shortcuts ()
;  (cond ((eq major-mode 'mel-mode)
;		 (global-set-key (kbd "M-RET") 'complete-tag))))
;(add-hook 'c-mode-hook 'my-etags-shortcuts)


; ----------------------------------------------------------------------
;; AUTO-FILL MODE

(add-hook 'text-mode-hook 
          (lambda ()
            (auto-fill-mode t)
            (setq default-justification 'full))
          )

; ---------------------------------------------------------------------
;; For editing C files in OpenGL minor mode

(add-hook 'c-mode-hook
 	  '(lambda ()
 	     (cond ((string-match "/\\([Oo]pen\\)?[Gg][Ll]/"
 				  (buffer-file-name))
 		    (require 'OpenGL)
		    (OpenGL-minor-mode 1)
		    (OpenGL-setup-keys)))))

; -----------------------------------------------------------------------
;; MOLETTE DE LA SOURIS

(when window-system
(mwheel-install))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(case-fold-search t)
 '(current-language-environment "UTF-8")
 '(default-input-method "rfc1345")
 '(delete-selection-mode nil)
 '(global-font-lock-mode t nil (font-lock))
 '(inhibit-startup-screen t)
 '(mark-even-if-inactive t)
 '(ps-printer-name-option "-P lp")
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t nil (paren))
 '(transient-mark-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

; -----------------------------------------------------------------------
;; MISC

; Afficher la 'parenthÃ¨se correspondante'
(require 'paren)
(show-paren-mode 1)

;force les tabulation a 4
(setq-default tab-width 4)

; numero colonnes
(column-number-mode t)

; Pour avoir l'heure dans la barre d'etat
(display-time)

; Format 24 heures
(setq display-time-24hr-format t)

; dictionnaire francais par defaut
(setq ispell-dictionary "francais")

; enleve la barre d outils
(tool-bar-mode 0)
(menu-bar-mode 0)

; Les 'beep' deviennent visibles (et non plus audibles)
(setq visible-bell t)
