(module-implements "lt.arvydas.KawaWebTest.service.MandelbrotGen")

(define (make x::float 
			  y::float 
			  width::float 
			  height::float 
			  delta::float 
			  iterations::float)::String
  (let* ((pixels (cart-product (build-range-list x (+ x width) delta)
							   (build-range-list y (+ y height) delta)))
		 (pixels-in-set (filter-pixels pixels iterations 2))
		 (rendered-pixels (map (lambda(px) (render-pixel (car px) (cdr px) delta)) pixels-in-set)))
	(string-append 
	  "<svg width=\"300\"height=\"300\" 
	  	viewBox=\"" (number->string x) " "
					(number->string y) " "
					(number->string width) " "
					(number->string height) " "
					"\">"
	  (apply string-append rendered-pixels)
	  "</svg>")))

(define (contains? x y iterations max-abs)
  (define c (+ x (* y 1i)))
  (let i ((it iterations)
		  (z 0))
	(cond 
	  ((> (abs z) max-abs) #f)
	  ((<= it 0) #t)
	  (else (i (- it 1) (+ (* z z) c))))))

(define (build-range-list from to delta)
  (let i ((result '())
		  (curr from))
	(if (> curr to) 
		result
		(i (cons curr result) (+ curr delta)))))

(define (cart-product ls1 ls2)
  (define lists (map (lambda(el) (cart-product/inner el ls2)) ls1))
  (apply append lists))

(define (cart-product/inner el lst)
  (map (lambda(el2)
		 (cons el el2))
	   lst))

(define (filter-pixels lst iterations max-abs)
  (let i ((good '())
		  (rest lst))
	(cond ((null? rest) good)
		  (else (let ((el (car rest))
					  (rest (cdr rest)))
				  (if (contains? (car el) (cdr el) iterations max-abs)
					  (i (cons el good) rest)
					  (i good rest)))))))

(define (render-pixel x y delta)
  (string-append "<rect x=\"" (number->string x) "\""
				 "y=\"" (number->string y) "\""
				 "width=\"" (number->string delta) "\""
				 "height=\"" (number->string delta) "\"/>"))
