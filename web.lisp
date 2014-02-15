(in-package #:excangr)

(restas:define-module #:excangr-web
  (:use :cl :restas :closure-template)
  (:export :*res-path*
           :*template-path*
           :*bootstrap-path*
   )
  )

(in-package #:excangr-web)

(defparameter *res-path* 
  #P"Program/Hackathon/res/")

(defparameter *template-path*
  (merge-pathnames "web-template.tmpl"
                   *res-path*
                   ))

(defparameter *bootstrap-path*
  (merge-pathnames "bootstrap/"
                   *res-path*))

(closure-template:compile-template :common-lisp-backend 
                                   *template-path*
                                   )
(restas:define-route favicon.png ("favicon.png")
  (merge-pathnames "favicon.png"
                   *res-path*))

(restas:define-route bootstrap.min.css ("bootstrap.min.css")
  (merge-pathnames "css/bootstrap.min.css"
                   *bootstrap-path*))

(restas:define-route signin.css ("signin.css")
  (merge-pathnames "css/signin.css"
                   *bootstrap-path*))

(restas:define-route offcanvas.css ("offcanvas.css")
  (merge-pathnames "css/offcanvas.css"
                   *bootstrap-path*))

(restas:define-route bootstrap.min.js ("bootstrap.min.js")
  (merge-pathnames "js/bootstrap.min.js"
                   *bootstrap-path*))

(restas:define-route offcanvas.js ("offcanvas.js")
  (merge-pathnames "js/offcanvas.js"
                   *bootstrap-path*))
