(in-package :www.genworks.com)

(define-object assembly (base-site-sheet)
  

  :computed-slots
  ((title "Genworks International - Welcome")
   
   (lang (the language choice value))
   
   (right-section-inner-html (the current-right-section right-section-inner-html))

   (link-title "Home")
   
   (pages (the children)))
  
  :trickle-down-slots (pages lang)

  :hidden-objects
  ((news :type 'news)
   
   (robot :type 'robot:assembly))

  :objects
  ((index-html :type 'index-html
	       :respondent self)
   (products :type 'products
	     :respondent self)
   ;;(services :type 'services)
   (demos :type 'demos
	  :respondent self)
   (people :type 'people
	   :respondent self)
   (contact-us :type 'contact-us
	       :respondent self)
   
   (language :type 'language
	     :respondent self)
   ))