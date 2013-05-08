;;;; -*- encoding: utf-8; -*-

(asdf:defsystem #:training :description
 "The Gendl™ training Subsystem" :author
 "Dave Cooper and Genworks International" :license
 "Gnu Affero General Public License (please see http://www.gnu.org/licenses/)"
 :serial t :version "20130506" :depends-on (:smlib)
 #+asdf-encoding :encoding #+asdf-encoding :utf-8
 :components
 ((:file "slide-show/source/package")
  (:gendl "slide-show/source/assembly")
  (:file "slide-show/source/publish") (:file "g101/source/package")
  (:file "g101/source/publish")
  (:file "g101/examples/source/file-io")
  (:file "g101/examples/source/solutions")
  (:file "g101/slides/source/assembly")
  (:file "g101/slides/source/conclusion")
  (:file "g101/slides/source/control")
  (:file "g101/slides/source/data-structures")
  (:file "g101/slides/source/functions")
  (:file "g101/slides/source/input-output")
  (:file "g101/slides/source/introduction")
  (:file "g101/slides/source/lists")
  (:file "g101/slides/source/macros")
  (:file "g101/slides/source/numbers")
  (:file "g101/slides/source/symbols")
  (:file "g101/slides/source/welcome") (:file "g102/source/package")
  (:file "g102/source/publish")
  (:file "g102/examples/ackermann/source/package")
  (:file "g102/examples/ackermann/source/ackermann-assembly")
  (:file "g102/examples/ackermann/source/simple-linkage")
  (:file "g102/examples/ackermann/source/tie-rod-arm")
  (:file "g102/examples/city/source/package")
  (:file "g102/examples/city/source/rules")
  (:file "g102/examples/city/source/assembly")
  (:file "g102/examples/city/source/building")
  (:file "g102/examples/city/source/grid-section")
  (:file "g102/examples/solids/source/primitives")
  (:file "g102/examples/solids/source/web-page")
  (:file "g102/examples/source/fuselage-example")
  (:file "g102/examples/source/g102-exercises")
  (:file "g102/examples/source/hairy")
  (:file "g102/examples/source/section-2-examples")
  (:file "g102/examples/source/tower-example")
  (:file "g102/examples/table/source/t-support")
  (:file "g102/examples/table/source/table")
  (:file "g102/slides/source/assembly")
  (:file "g102/slides/source/debugging")
  (:file "g102/slides/source/fuselage-example")
  (:file "g102/slides/source/future")
  (:file "g102/slides/source/geometry")
  (:file "g102/slides/source/outside-world")
  (:file "g102/slides/source/session-01")
  (:file "g102/slides/source/session-02")
  (:file "g102/slides/source/session-03")
  (:file "g102/slides/source/session-04")
  (:file "g102/slides/source/session-05")
  (:file "g102/slides/source/session-06")
  (:file "g102/slides/source/session-07")
  (:file "g102/slides/source/tower-example")
  (:file "g102/slides/source/user-interface")
  (:file "g102/solutions/ackermann/source/package")
  (:file "g102/solutions/ackermann/source/ackermann-assembly")
  (:file "g102/solutions/ackermann/source/simple-linkage")
  (:file "g102/solutions/ackermann/source/tie-rod-arm")
  (:file "g102/solutions/city/source/package")
  (:file "g102/solutions/city/source/rules")
  (:file "g102/solutions/city/source/assembly")
  (:file "g102/solutions/city/source/building")
  (:file "g102/solutions/city/source/grid-section")
  (:file "g102-tud/source/package") (:file "g102-tud/source/publish")
  (:file "g102-tud/slides/source/ch2")
  (:file "g102-tud/slides/source/ch3") (:file "g105/source/package")
  (:file "g105/source/publish")
  (:file "g105/examples/source/drilled-block")
  (:file "g105/slides/source/assembly")
  (:file "g105/slides/source/session-01")
  (:file "g105/slides/source/session-02")
  (:file "g108/source/package") (:file "g108/source/publish")
  (:file "g108/examples/source/examples")
  (:file "g108/slides/source/ajax-sections")
  (:file "g108/slides/source/assembly")
  (:file "g108/slides/source/basic-sheet")))
