
(require 'package)
(add-to-list 'package-archives
	 '("melpa" ."https://melpa.org/packages/") t)


(use-package treemacs
	 :ensure t)

(set-face-attribute 'default nil
                    :family "Inconsolata"
                    :height 120)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(leuven-dark))
 '(package-selected-packages '(auto-complete eat treemacs)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;Autocompletado
(ac-config-default)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(setq make-backup-file nil) ; stop creating ~ files






