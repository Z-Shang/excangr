(in-package #:excangr-web)

(restas:define-route login ("login")
  (excangr-web-view:login-page
    (list :favicon (restas:genurl 'favicon.png)
          :bootstrap (restas:genurl 'bootstrap.min.css)
          :login (restas:genurl 'signin.css)
          )
    ))

(restas:define-route main ("")
  (excangr-web-view:home-page
    (list :favicon (restas:genurl 'favicon.png)
          :bootstrap (restas:genurl 'bootstrap.min.css)
          :bootstrapjs (restas:genurl 'bootstrap.min.js)
          :offcanvas (restas:genurl 'offcanvas.css)
          :offcanvasjs (restas:genurl 'offcanvas.js))))

(restas:start '#:excangr-web :port 8888)

(restas:stop-all)
