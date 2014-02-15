(in-package #:excangr)

(defvar *GLOBAL-DB* nil)
(defvar *ENTRY-DB* nil)
(defvar *USERS-DB* nil)

(push *ENTRY-DB* *GLOBAL-DB*)
(push *USERS-DB* *GLOBAL-DB*)

(defvar *ENTRY* 0) ; Counter for entry-id
(defvar *USERS* 0) ; COunter for user-id

(defstruct entry 
; name slot is the name of the item
; owner slot is the name of the owner of the item
; pic-p slot determines wheather this item has picture or not
; pic-url slot is the url to the item picture
; available-p slot determines wheather this item is available or not
; entry-id is the id of an entry
  (name "item" :type string)
  (owner "owner" :type string)
  (pic-p nil :type boolean)
  (pic-url "" :type string)
  (available-p nil :type boolean)
  (entry-id 0 :type integer))

(defstruct person
  (name "user" :type string)
  (contact '()  :type list)
  (item '() :type list)
  (password "" :type string)
  (user-id 0 :type integer))

(defun new-entry (&key name owner pic-p pic-url available-p)
  (push (make-entry 
          :name name
          :owner owner
          :pic-p pic-p
          :pic-url pic-url
          :available-p available-p
          :entry-id (1+ *ENTRY*))
        *ENTRY-DB*)
  (setf *ENTRY* (1+ *ENTRY*)))

(defun new-person (&key name contact password)
  (push (make-person 
          :name name
          :contact contact
          :item '()
          :password password
          :user-id (1+ *USERS*))
        *USERS-DB*)
  (setf *USERS* (1+ *USERS*)))

(defmacro search-* (&key slot value db)                         ;;Returns a list containing all entries match the criteria
  `(remove-if-not #'(lambda (entry)
                     (equal (,slot entry) ,value)) ,db))

(defmacro update-* (&key orig slot value)                       ;;Takes a list of targets to be updated (from search-*)
 `(mapcar #'(lambda (entry)
              (setf (,slot entry) ,value))
          ,orig))

(defmacro delete-* (&key target db)                             ;;Takes a list of targets to be deleted (from search-*)
  `(mapcar #'(lambda (entry) (setf ,db (remove entry ,db)))
           ,target))
