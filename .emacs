
(require 'package)
(add-to-list 'package-archives
         '("melpa" ."https://melpa.org/packages/") t)

(use-package treemacs
         :ensure t)


(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)))

(set-face-attribute 'default nil
                    :family "Inconsolata"
                    :height 150)

;;(add-to-list 'load-path "folder-in-which-visual-regexp-files-are-in/") ;; if the files are not already in the load path
;;(require 'visual-regexp)
(define-key global-map (kbd "C-c r") 'vr/replace)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(masked))
 '(custom-safe-themes
   '("76f94e145b5313f14d159051d2b714478f52325a6465fce7ce46f44dffed386c" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "3e200d49451ec4b8baa068c989e7fba2a97646091fd555eca0ee5a1386d56077" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "c3a014b929aef2c83eb372aee093c31889b704039bc5b8acf2aba0e12f141063" "8f5b54bf6a36fe1c138219960dd324aad8ab1f62f543bed73ef5ad60956e36ae" "57a29645c35ae5ce1660d5987d3da5869b048477a7801ce7ab57bfb25ce12d3e" "833ddce3314a4e28411edf3c6efde468f6f2616fc31e17a62587d6a9255f4633" "d89e15a34261019eec9072575d8a924185c27d3da64899905f8548cbd9491a36" "4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3" "00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "4c7228157ba3a48c288ad8ef83c490b94cb29ef01236205e360c2c4db200bb18" "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" "821c37a78c8ddf7d0e70f0a7ca44d96255da54e613aa82ff861fe5942d3f1efc" default))
 '(package-selected-packages
   '(highlight-indent-guides lsp-mode yasnippet lsp-treemacs flycheck company which-key dap-mode php-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
;;(ac-config-default)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(setq make-backup-file nil) ;; stop creating ~files
(setq auto-save-default 0) ;; 
(setq-default buffer-read-only nil)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;;(load-theme 'almost-mono-black t)
(load-theme 'masked t)

(put 'scroll-left 'disabled nil)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(setq package-selected-packages '(lsp-mode yasnippet lsp-treemacs flycheck company which-key dap-mode php-mode))

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

(which-key-mode)
(add-hook 'php-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1)  ;; clangd is fast

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-php)
  (yas-global-mode))

