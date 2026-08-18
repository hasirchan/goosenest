(define-module (goosenest packages sing-box)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:))

(define-public sing-box-amd64
  (package
    (name "sing-box-amd64")
    (version "1.13.19")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/SagerNet/sing-box/releases/download/v"
             version "/sing-box-" version "-linux-amd64-musl.tar.gz"))
       (sha256
        (base32 "1f6wiwh0xwkqkf8cv0gi3wd6gyr2cj2qvqlxa716z4yg9zwmc10m"))))
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
    (version "1.13.19")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/SagerNet/sing-box/releases/download/v"
             version "/sing-box-" version "-linux-arm64-musl.tar.gz"))
       (sha256
        (base32 "0byd28zsgc7g4whm8887z04vv0aw002gaph83qwa43iihhc1hiji"))))
    (supported-systems '("aarch64-linux"))
    (synopsis "Universal proxy platform (arm64 binary)")))
