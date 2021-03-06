;;--------------------------------------------------------------------
;; GENERAL

;; Load el files
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
;; YASNIPPET
(add-to-list 'load-path
	     "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"
	"~/.emacs.d/plugins/yasnippet/snippets"))
(yas-global-mode 1)
(setq yas-triggers-in-field nil)

; --------------------------------------------------------------------
;; POPUP (FOR AUTO-COMPLETE)
(add-to-list 'load-path
	     "~/.emacs.d/plugins/popup")
(require 'popup)

; --------------------------------------------------------------------
;; AUTO-COMPLETE
(add-to-list 'load-path
	     "~/.emacs.d/plugins/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
	     "~/.emacs.d/plugins/auto-complete/dict")
(ac-config-default)

; --------------------------------------------------------------------
;; DEFERRED (FOR EPC)
(add-to-list 'load-path
	     "~/.emacs.d/plugins/emacs-deferred")
(require 'deferred)
(require 'concurrent)

; --------------------------------------------------------------------
;; CTABLE (FOR EPC)
(add-to-list 'load-path
	     "~/.emacs.d/plugins/emacs-ctable")
(require 'ctable)

; --------------------------------------------------------------------
;; EPC (FOR JEDI)
(add-to-list 'load-path
	     "~/.emacs.d/plugins/emacs-epc")
(require 'epc)

; --------------------------------------------------------------------
;; PYTHON-ENVIRONMENT (FOR JEDI)
(add-to-list 'load-path
	     "~/.emacs.d/plugins/emacs-python-environment")
(require 'python-environment)

; --------------------------------------------------------------------
;; JEDI
(add-to-list 'load-path
	     "~/.emacs.d/plugins/emacs-jedi")
(require 'jedi)
;$PYTHONPATH=~/.emacs.d/plugins/jedi/:~/.emacs.d/plugins/python-epc/:~/.emacs.d/plugins/sexpdata/
(setq jedi:server-command '("~/.emacs.d/plugins/emacs-jedi/jediepcserver.py"))
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

; --------------------------------------------------------------------
;; MAYA COMMAND PORT
;; (add-hook
;;  'python-mode-hook
;;  (lambda ()
;;    (require 'etom)
;;    (setq etom-default-host "localhost")
;;    (setq etom-default-port 2222)
;;    (local-set-key (kbd "C-c C-r") 'etom-send-region)
;;    (local-set-key (kbd "C-c C-c") 'etom-send-buffer)
;;    (local-set-key (kbd "C-c C-l") 'etom-send-buffer)
;;    (local-set-key (kbd "C-c C-z") 'etom-show-buffer)))

; --------------------------------------------------------------------
;; COULEURS
(add-to-list 'load-path
	     "~/.emacs.d/plugins/color-theme-6.6.0")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-charcoal-black)))
(setq color-theme-is-global t)

; Couleurs dans le texte
(global-font-lock-mode t)

; Maximum de couleur
(setq font-lock-maximum-decoration t)

; Region selectionne surbrillance
(transient-mark-mode t)


; --------------------------------------------------------------------
;; FONTSIZE

(defun fontify-frame (frame)
  (set-frame-parameter frame 'font "Misc-Misc Fixed-normal-normal-normal-\*-13-\*-\*-\*-c-70-iso10646-1"))


; --------------------------------------------------------------------
;; Line numbers

;; (require 'line-num)
;; (turn-on-line-numbers-display t)


; --------------------------------------------------------------------
;; Complete tag binding

;; (global-set-key "\M-," 'complete-tag) 

;(defun my-etags-shortcuts ()
;  (cond ((eq major-mode 'mel-mode)
;		 (global-set-key (kbd "M-RET") 'complete-tag))))
;(add-hook 'c-mode-hook 'my-etags-shortcuts)


; ----------------------------------------------------------------------
;; AUTO-FILL MODE

;; (add-hook 'text-mode-hook 
;;           (lambda ()
;;             (auto-fill-mode t)
;;             (setq default-justification 'full))
;;           )


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

; Afficher la 'parenthese correspondante'
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
