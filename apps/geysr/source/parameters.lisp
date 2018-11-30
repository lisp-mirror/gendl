;;
;; Copyright 2002, 2009 Genworks International and Genworks BV 
;;
;; This source file is part of the General-purpose Declarative
;; Language project (GDL).
;;
;; This source file contains free software: you can redistribute it
;; and/or modify it under the terms of the GNU Affero General Public
;; License as published by the Free Software Foundation, either
;; version 3 of the License, or (at your option) any later version.
;; 
;; This source file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; Affero General Public License for more details.
;; 
;; You should have received a copy of the GNU Affero General Public
;; License along with this source file.  If not, see
;; <http://www.gnu.org/licenses/>.
;; 

(in-package :geysr)

(defparameter *these-features* (list :geysr))
(defparameter *settings* nil)


(defparameter *internal-keywords*
  (list :query-plist :aggregate :all-mixins :background-color 
        :base64-encoded-root-path :bashee :beziers :bounding-bbox
        :check-sanity? :color-decimal :color-hex :color-palette :cookies-received
        :cookies-to-send :dash-pattern :dom-id :fill-color-decimal
        :fixed-url-prefix :header-plist :home-page :instance-id 
        :last-visited-root-path :left-handed? ;;:local-bbox :local-box
        :local-center :local-left-handed? :local-orientation :inner-html
        :obliqueness :parent-tree :plain-url? :possible-nils 
        :quantify-box :query-toplevel :refresh-toggle :remote-id :respondent 
        :return-object :root-path-string :target :time-instantiated 
        :time-last-touched :transitory-slots :tree-root 
        :url-encoded-root-path :use-local-box? :viewable-slots 
        :viewpoints :visible-children :vrml-center))

(defparameter *suppress-%%-messages?* t "Boolean. Set to nil if you want to see messages starting and ending with %% in tasty inspector. Defaults to t.")

(defparameter *suppress-$$-messages?* t "Boolean. Set to nil if you want to see messages starting with $$ in tasty inspector. Defaults to t.")

(defun one-line (string)
  (glisp:replace-regexp (glisp:replace-regexp string (format nil "~%") " ") "'" "\\'" ))
