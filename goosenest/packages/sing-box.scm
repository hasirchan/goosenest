(define-module (goosenest packages sing-box)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:))

(define-public sing-box-amd64
  (package
    (name "sing-box-amd64")
    (version "1.13.21")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/SagerNet/sing-box/releases/download/v"
             version "/sing-box-" version "-linux-amd64-musl.tar.gz"))
       (sha256
        (base32 "1rw0p57yfy4mqxd7f3gg1nl49ylwqy1m3hm88m240sranyrsnr48"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("sing-box" "bin/sing-box"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Universal proxy platform (amd64 binary)")
    (description
     "sing-box is a universal proxy platform supporting a variety of
protocols including VLESS, VMess, Shadowsocks, Trojan, NaiveProxy,
Hysteria, WireGuard, and more.")
    (home-page "https://github.com/SagerNet/sing-box")
    (license license:gpl3+)
    (properties '((upstream-name . "sing-box")))))

(define-public sing-box-arm64
  (package
    (inherit sing-box-amd64)
    (name "sing-box-arm64")
    (version "1.13.21")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/SagerNet/sing-box/releases/download/v"
             version "/sing-box-" version "-linux-arm64-musl.tar.gz"))
       (sha256
        (base32 "1hd9dwhhglz16fy3ll0y5h73ifvx2f5bppm0mlh6y6hh45yxgx2w"))))
    (supported-systems '("aarch64-linux"))
    (synopsis "Universal proxy platform (arm64 binary)")))
