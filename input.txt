;; This is a comment in Lisp
;; The following code demonstrates basic symbols, strings, and operations.

;; Demonstration of strings with escape characters and special symbols

(defparameter \ss?*e
  "This is a string with a newline:
And a tab:	(Done!) the  newline:
and a tab")

(defparameter *quote-in-string* "He said, \"Lisp is amazing!\"")
(defparameter *backslash-string* "This path contains a backslash: C:\\Users\\Lisp")


;; Displaying strings with special content
(defun display-special-strings ()
  "Displays various strings with escape characters and special content."
  (format t "~%Escaped String: ~a~%" *escaped-string*)
  (format t "Quote in String: ~a~%" *quote-in-string*)
  (format t "Backslash String: ~a~%" *backslash-string*)
)

;; Testing
(display-special-strings)

;; Original examples with other features retained
(defun greet (name)
  "Greets the user with a customized message."
  (format t "~a ~a!~%" *escaped-string* name))

(defun check-eligibility (age citizenship)
  "Checks if a person is eligible based on age and citizenship."
  (if (and (>= age 18) (equal citizenship "Yes"))
      (format t "You are eligible.~%")
      (format t "You are not eligible.~%")))

(defparameter add (lambda (x y) (+ x y))) ; Global lambda for addition
(defparameter multiply (lambda (x y) (* x y))) ; Global lambda for multiplication

(defun apply-lambda (func x y)
  "Applies a lambda function to two arguments."
  (funcall func x y))

(defun factorial (n)
  "Calculates the factorial of a number recursively."
  (if (<= n 1)
      1
      (* n (factorial (- n 1)))))

(greet "Student")
(check-eligibility 20 "Yes")
(check-eligibility 16 "No")
(format t "Add: ~a~%" (apply-lambda add 5 3))
(format t "Multiply: ~a~%" (apply-lambda multiply 5 3))
(format t "Factorial of 5: ~a~%" (factorial 5))



;; Display strings
(defun display-special-strings ()
  "Displays strings with various escape characters."
  (format t "~%Escaped String: ~a~%" *escaped-string*)
  (format t "Quote in String: ~a~%" *quote-in-string*)
  (format t "Backslash String: ~a~%" *backslash-string*))

;; Test string display
(display-special-strings)

;; End of file

