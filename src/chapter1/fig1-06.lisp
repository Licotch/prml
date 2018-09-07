(in-package :prml.chapter1)

(defun fig1-6 ()
  (let* ((sin-x (vgplot:range 0 101/100 1/100))
         (sin-y (map 'vector (lambda (x) (sin (* 2 pi x))) sin-x))
         (estimated-x sin-x))
    (labels ((subplot (subplot-n n)
               (let* ((x (vgplot:range 0 (/ n (1- n)) (/ 1 (1- n))))
                      (y (map 'vector (lambda (x) (+ (alexandria:gaussian-random -0.55 0.55)
                                                     (sin (* 2 pi x))))
                              x)))
                 (vgplot:subplot 1 2 subplot-n)
                 (vgplot:plot sin-x sin-y "g;"
                              x y "ob;"
                              estimated-x (estimated-y estimated-x (minimized-w x y 9)) "r;")
                 (vgplot:text 0.8 1 (format nil "N = ~a" n) :tag 1)
                 (vgplot:grid nil))))
      (vgplot:subplot 1 2 0)
      (vgplot:format-plot nil "set xtics 1")
      (vgplot:format-plot nil "set ytics 1")
      (vgplot:axis '(-0.1 1.1 -1.5 1.5))
      (vgplot:xlabel "x")
      (vgplot:ylabel "y")

      (subplot 0 15)
      (subplot 1 100))))