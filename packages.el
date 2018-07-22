;;; packages.el --- logview Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq logview-packages '(logview))

(defun logview/init-logview ()
  (use-package logview
    :init
    (progn
      (spacemacs|define-transient-state logview-movement-transient-state
        :title "logview-mode Transient State"
        :columns 4
        :foreign-keys run
        :evil-leader-for-mode (logview-mode . ".")
        :bindings
        ("n"   logview-next-entry "next-entry")
        ("p"   logview-previous-entry "previous-entry")
        ("N"   logview-next-as-important-entry "next-as-important-entry")
        ("P"   logview-previous-as-important-entry "previous-as-important-entry")
        ("M-n" logview-next-navigation-view-entry "next-navigation-view-entry")
        ("M-p" logview-previous-navigation-view-entry "previous-navigation-view-entry")
        ("<"   logview-first-entry "first-entry")
        (">"   logview-last-entry "last-entry")
        ("q" nil "quit" :exit t)
        ("<escape>" nil nil :exit t))

      (spacemacs/declare-prefix-for-mode 'logview-mode "ml" "filter by entry level")
      (spacemacs/declare-prefix-for-mode 'logview-mode "mL" "Always show entries of certain levels")
      (spacemacs/declare-prefix-for-mode 'logview-mode "mw" "widen")
      (spacemacs/declare-prefix-for-mode 'logview-mode "mn" "narrow")
      (spacemacs/declare-prefix-for-mode 'logview-mode "mv" "yank")
      (spacemacs/set-leader-keys-for-major-mode 'logview-mode

        ;; Narrowing/widening commands.
        "nf"   'logview-narrow-from-this-entry
        "nu"   'logview-narrow-up-to-this-entry
        ;; "ww"   'widen
        "wu"   'logview-widen-upwards
        "wd"   'logview-widen-downwards
        ;; Filtering by level commands.
        "le" 'logview-show-only-errors
        "lw" 'logview-show-errors-and-warnings
        "li" 'logview-show-errors-warnings-and-information
        "ld" 'logview-show-errors-warnings-information-and-debug
        "la" 'logview-show-all-levels
        "l+" 'logview-show-only-as-important
        "Le" 'logview-always-show-errors
        "Lw" 'logview-always-show-errors-and-warnings
        "Li" 'logview-always-show-errors-warnings-and-information
        "Ld" 'logview-always-show-errors-warnings-information-and-debug
        "LL" 'logview-disable-unconditional-show
        ;; ;; Filtering by name/thread/message commands.
        ;; ("f"   logview-edit-filters)
        ;; ("a"   logview-add-include-name-filter)
        ;; ("A"   logview-add-exclude-name-filter)
        ;; ("t"   logview-add-include-thread-filter)
        ;; ("T"   logview-add-exclude-thread-filter)
        ;; ("m"   logview-add-include-message-filter)
        ;; ("M"   logview-add-exclude-message-filter)
        ;; ;; Filter resetting commands.
        ;; ("r l" logview-reset-level-filters)
        ;; ("r a" logview-reset-name-filters)
        ;; ("r t" logview-reset-thread-filters)
        ;; ("r m" logview-reset-message-filters)
        ;; ("R"   logview-reset-all-filters)
        ;; ("r e" logview-reset-all-filters-restrictions-and-hidings)
        ;; ;; View commands.
        ;; ("v"   logview-switch-to-view)
        ;; ("V n" logview-set-navigation-view)
        ;; ("V h" logview-highlight-view-entries)
        ;; ("V u" logview-unhighlight-view-entries)
        ;; ("V s" logview-save-filters-as-view-for-submode)
        ;; ("V S" logview-save-filters-as-global-view)
        ;; ("V e" logview-edit-submode-views)
        ;; ("V E" logview-edit-all-views)
        ;; ("V d" logview-delete-view)
        ;; ;; Explicit entry hiding/showing commands.
        ;; ("h"   logview-hide-entry)
        ;; ("H"   logview-hide-region-entries)
        ;; ("s"   logview-show-entries)
        ;; ("S"   logview-show-region-entries)
        ;; ("r h" logview-reset-manual-entry-hiding)
        ;; ;; Showing/hiding entry details commands.
        ;; ("d"   logview-toggle-entry-details)
        ;; ("D"   logview-toggle-region-entry-details)
        ;; ("e"   logview-toggle-details-globally)
        ;; ("r d" logview-reset-manual-details-hiding)
        ;; ;; Option changing commands.
        ;; ("o r" auto-revert-mode)
        ;; ("o t" auto-revert-tail-mode)
        ;; ("o v" logview-toggle-copy-visible-text-only)
        ;; ("o m" logview-toggle-search-only-in-messages)
        ;; ("o e" logview-toggle-show-ellipses)
        ;; ("o s" logview-choose-submode)
        ;; ("o S" logview-customize-submode-options)
        ;; ;; For compatibility with the inactive keymap.
        ;; ("C-c C-c" logview-choose-submode)
        ;; ("C-c C-s" logview-customize-submode-options)
        ;; ;; Miscellaneous commands.
        ;; ("SPC" logview-pulse-current-entry)
        ;; ("?"   logview-mode-help)
        ;; ("g"   logview-refresh-buffer-as-needed)
        ;; ("x"   logview-append-log-file-tail)
        ;; ("X"   logview-revert-buffer)
        ;; ("q"   bury-buffer)
        ;; ;; Simplified universal argument command
        ;; ;; rebindings.  Digits and minus are set up by
        ;; ;; 'suppress-keymap' already.
        ;; ("u"   universal-argument)
        ))))
