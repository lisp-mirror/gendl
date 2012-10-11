;;
;; Copyright 2002-2011 Genworks International 
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

(in-package :surf)


(define-object approximated-curve (curve)
  
  :documentation (:description "This primitive accepts a NURBS curve and 
computes a new NURBS curve with presumably fewer control points, and claims
to hold it to within a certain tolerance of the original curve. 

The point at the start parameter and the end parameter in the result 
curve will be fixed to be identical to the original curve. 

You can use the pinned-parameters input-slot to specify additional parameter
values where the new curve will be pinned to be identical with the original curve."
                  
                  :examples "
<pre>

 (define-object approximated-curve-test (base-object)
  
   :input-slots 
   ((sample-b-spline-data
    '((#(-7.773502691896258 10.0 0.0)
  #(-7.76304131662674 10.0 0.0035356993309923)
  #(-7.746775287947699 10.0 0.0067001904580447)
  #(-7.7253289934578415 10.0 0.0091817670732663)
  #(-7.709372706886673 10.0 0.0109178383762297)
  #(-7.693497618275636 10.0 0.0129741578942581)
  #(-7.676981089448407 10.0 0.0152725944452429)
  #(-7.660626985913543 10.0 0.0176076438762828)
  #(-7.644400043044812 10.0 0.0198301741704749)
  #(-7.628572854579257 10.0 0.0218811393098875)
  #(-7.612456095337886 10.0 0.023892087537815)
  #(-7.596123157036033 10.0 0.025876731740358)
  #(-7.5797886014351645 10.0 0.0278392394943197)
  #(-7.563598247718005 10.0 0.0297977372116626)
  #(-7.54734474235553 10.0 0.0317827355165938)
  #(-7.530817428296935 10.0 0.0338094455691551)
  #(-7.514499984995836 10.0 0.0358111584598995)
  #(-7.498530032892328 10.0 0.037762615650263)
  #(-7.482560694806967 10.0 0.0396996233035483)
  #(-7.466938587271525 10.0 0.0415717500361984)
  #(-7.45613073401155 10.0 0.0428492028474684)
  #(-7.445702016561547 10.0 0.04407409984323)
  #(-7.439862498458236 10.0 0.0447555129227675)
  #(-7.429535001467346 10.0 0.0459531655261334)
  #(-7.423946015929491 10.0 0.0465975377728551)
  #(-7.413554192167366 10.0 0.0477892161812883)
  #(-7.407595596706495 10.0 0.0484686195293404)
  #(-7.396934499325897 10.0 0.049677834187285)
  #(-7.391025013196135 10.0 0.0503446277462212)
  #(-7.380668397266659 10.0 0.0515077909624895)
  #(-7.374959869886305 10.0 0.0521461185088044)
  #(-7.36464849713204 10.0 0.05329441651439)
  #(-7.3587350147730115 10.0 0.0539501551169936)
  #(-7.348489965069932 10.0 0.0550810605426388)
  #(-7.342793963594458 10.0 0.0557070781305422)
  #(-7.332490622079339 10.0 0.0568343892437064)
  #(-7.3264770440672065 10.0 0.0574891649794912)
  #(-7.316219293859572 10.0 0.0586004349229853)
  #(-7.310517864890045 10.0 0.0592151399809975)
  #(-7.300540086253307 10.0 0.0602855343476251)
  #(-7.294748391590457 10.0 0.0609037603868834)
  #(-7.284555892216601 10.0 0.061985955452512)
  #(-7.278577998313509 10.0 0.062617198511794)
  #(-7.268114585011737 10.0 0.0637157114288265)
  #(-7.261986919319522 10.0 0.0643552477004073)
  #(-7.2514547970306005 10.0 0.0654480650996109)
  #(-7.245363578736502 10.0 0.066076354340049)
  #(-7.235168395459871 10.0 0.0671217900147562)
  #(-7.2293285386923625 10.0 0.0677172614089348)
  #(-7.219456797793601 10.0 0.0687181850892115)
  #(-7.21363748676987 10.0 0.0693049508093313)
  #(-7.203721331045569 10.0 0.0702991235190865)
  #(-7.197774951476638 10.0 0.0708918760373581)
  #(-7.18753366922008 10.0 0.071906820780931)
  #(-7.181328324859931 10.0 0.0725180648535886)
  #(-7.170908624453838 10.0 0.0735382495023682)
  #(-7.164741045570452 10.0 0.0741384240225961)
  #(-7.154470299979475 10.0 0.0751317627718068)
  #(-7.1483716586933825 10.0 0.0757179834474372)
  #(-7.138406833936611 10.0 0.0766699111117332)
  #(-7.132501722803377 10.0 0.0772306457809111)
  #(-7.12244815794467 10.0 0.0781794021319588)
  #(-7.116194798062766 10.0 0.0787657100109435)
  #(-7.105880729941813 10.0 0.0797262397246034)
  #(-7.099656569353997 10.0 0.0803020171513102)
  #(-7.089330480447966 10.0 0.0812507479304588)
  #(-7.083006810743995 10.0 0.0818277014224611)
  #(-7.0730076945596645 10.0 0.0827335903150743)
  #(-7.067069212658176 10.0 0.0832680013237252)
  #(-7.057382524393892 10.0 0.0841338221164179)
  #(-7.0513228782074515 10.0 0.0846717275930971)
  #(-7.041364101581027 10.0 0.0855495109968372)
  #(-7.035106540724323 10.0 0.0860970019877134)
  #(-7.024857742651612 10.0 0.0869868797241497)
  #(-7.018438815809276 10.0 0.087539916228507)
  #(-7.008168401811841 10.0 0.0884178150543803)
  #(-7.00184087536049 10.0 0.0889544270356334)
  #(-6.9919619641004545 10.0 0.0897854973995385)
  #(-6.985881827579846 10.0 0.0902930555610231)
  #(-6.976281029598491 10.0 0.0910882693796495)
  #(-6.970184675056803 10.0 0.091589260852436)
  #(-6.960320705968006 10.0 0.0923932980242485)
  #(-6.953917746465384 10.0 0.0929107533519837)
  #(-6.943757762558306 10.0 0.0937245181023455)
  #(-6.937303992646001 10.0 0.0942367919470313)
  #(-6.9271520790382235 10.0 0.0950351703452132)
  #(-6.920707811824021 10.0 0.0955372165209965)
  #(-6.910885266876965 10.0 0.0962951353561948)
  #(-6.904716963255798 10.0 0.096766697374172)
  #(-6.895200295978004 10.0 0.0974873900684733)
  #(-6.889018398304428 10.0 0.0979511004533426)
  #(-6.8792396786986085 10.0 0.0986773910779738)
  #(-6.8727507213 10.0 0.0991543261574633)
  #(-6.86267690754424 10.0 0.0998867125969024)
  #(-6.856136640740504 10.0 0.100356993136921)
  #(-6.846050345447107 10.0 0.1010740145138523)
  #(-6.839489198598122 10.0 0.1015350665777411)
  #(-6.829441747557248 10.0 0.1022327061061873)
  #(-6.82289308331905 10.0 0.1026819075455008)
  #(-6.813152437915218 10.0 0.1033417487088309)
  #(-6.806847948189532 10.0 0.103763701703458)
  #(-6.7971454958195565 10.0 0.1044050485135838)
  #(-6.790595307231813 10.0 0.10483231339683)
  #(-6.780922064334754 10.0 0.1054546472054939)
  #(-6.77458575320461 10.0 0.1058569326392236)
  #(-6.7649029807976975 10.0 0.1064632879605449)
  #(-6.758284636701557 10.0 0.1068717205935851)
  #(-6.748340665523174 10.0 0.1074760046701189)
  #(-6.741671570163981 10.0 0.1078750063466806)
  #(-6.731717886166939 10.0 0.1084609002957398)
  #(-6.7250260196879 10.0 0.1088483306291875)
  #(-6.715132250830737 10.0 0.1094113701746257)
  #(-6.708479289674014 10.0 0.1097833660497434)
  #(-6.698863733855831 10.0 0.1103113585573882)
  #(-6.692407555733223 10.0 0.1106596095578191)
  #(-6.683112518678094 10.0 0.1111518410008553)
  #(-6.67673768062156 10.0 0.1114832653763077)
  #(-6.667240402771452 10.0 0.1119675047371582)
  #(-6.660514775321519 10.0 0.1123033129775543)
  #(-6.650681029972996 10.0 0.1127835983503758)
  #(-6.643918945899163 10.0 0.1131064056804846)
  #(-6.63405272844892 10.0 0.1135663439198465)
  #(-6.627254408957563 10.0 0.1138754999668116)
  #(-6.617707456082231 10.0 0.1142985673023449)
  #(-6.611225484562257 10.0 0.1145786891314138)
  #(-6.60204805594244 10.0 0.1149649311892426)
  #(-6.595561879720703 10.0 0.1152306714612809)
  #(-6.586146787784009 10.0 0.1156055153436167)
  #(-6.579359503332465 10.0 0.1158674765410608)
  #(-6.569607126249581 10.0 0.1162316741844863)
  #(-6.562716518300558 10.0 0.1164802471836087)
  #(-6.552941578381875 10.0 0.1168201535727847)
  #(-6.546090216293524 10.0 0.1170494074887217)
  #(-6.536674084104508 10.0 0.117351835565929)
  #(-6.530101252192292 10.0 0.1175545076386553)
  #(-6.521003931182706 10.0 0.1178230920419217)
  #(-6.514431925615438 10.0 0.1180084927017307)
  #(-6.505237782335364 10.0 0.1182554027074824)
  #(-6.498513444650254 10.0 0.1184266239748961)
  #(-6.488983008492481 10.0 0.1186555956582973)
  #(-6.48200268637703 10.0 0.1188128917257091)
  #(-6.472326149681036 10.0 0.119016053562057)
  #(-6.465389207391072 10.0 0.1191511200864016)
  #(-6.455601236135456 10.0 0.1193262289159263)
  #(-6.448443729690395 10.0 0.1194424780868816)
  #(-6.438958198675441 10.0 0.1195804860871952)
  #(-6.432273317606395 10.0 0.1196673012040853)
  #(-6.422976238615972 10.0 0.1197731501514096)
  #(-6.4159621089377605 10.0 0.1198409999468651)
  #(-6.4067002169151355 10.0 0.1199142428159179)
  #(-6.399997171744239 10.0 0.119956098103827)
  #(-6.390775586474153 10.0 0.1199979664750528)
  #(-6.383766014520722 10.0 0.1200169608096984)
  #(-6.374398451275458 10.0 0.1200248790095977)
  #(-6.367508232676765 10.0 0.1200180617465295)
  #(-6.358204641636406 10.0 0.1199913666687163)
  #(-6.351212499117087 10.0 0.1199579262946732)
  #(-6.34179811653411 10.0 0.1198940830107079)
  #(-6.334722008984675 10.0 0.1198318598583616)
  #(-6.325243506895607 10.0 0.1197286664953724)
  #(-6.3181038668924225 10.0 0.1196359024164523)
  #(-6.3086233644061815 10.0 0.1194922029896446)
  #(-6.301482992162023 10.0 0.1193683670372235)
  #(-6.2919924776063425 10.0 0.1191825584163038)
  #(-6.284793044978927 10.0 0.1190252258627906)
  #(-6.2753314970647045 10.0 0.1187965753264672)
  #(-6.26821135846841 10.0 0.1186078391724031)
  #(-6.259162952769228 10.0 0.1183465300397597)
  #(-6.252357920075809 10.0 0.1181346604145395)
  #(-6.243732250120057 10.0 0.1178464349390531)
  #(-6.237024615970206 10.0 0.117607149463944)
  #(-6.22847504378218 10.0 0.1172819358381489)
  #(-6.221661738722191 10.0 0.1170066698163893)
  #(-6.212734929396275 10.0 0.1166237921552943)
  #(-6.205560407960056 10.0 0.1162969301785835)
  #(-6.196251975857688 10.0 0.1158468244886666)
  #(-6.188964185271005 10.0 0.1154735323164374)
  #(-6.179555494737541 10.0 0.1149639153426461)
  #(-6.172229381962318 10.0 0.1145450494936365)
  #(-6.162856146944508 10.0 0.113980051461802)
  #(-6.155565515353094 10.0 0.1135177665315744)
  #(-6.146209923750142 10.0 0.1128942970314755)
  #(-6.138855137820279 10.0 0.112380030061237)
  #(-6.129655628386858 10.0 0.1117056172410459)
  #(-6.122486612998066 10.0 0.111156182233171)
  #(-6.11363265472315 10.0 0.110447376638818)
  #(-6.10657159410418 10.0 0.1098584591558712)
  #(-6.097764739903218 10.0 0.1090932742430056)
  #(-6.0906136679603495 10.0 0.1084460244904774)
  #(-6.081792237411942 10.0 0.1076133101575569)
  #(-6.074656622637572 10.0 0.106911620109585)
  #(-6.065558573551578 10.0 0.1059791445416934)
  #(-6.058094902257685 10.0 0.105180297224725)
  #(-6.04902211746673 10.0 0.1041654080838163)
  #(-6.041837834442202 10.0 0.1033285781165379)
  #(-6.032806538284214 10.0 0.102232676388748)
  #(-6.025326943718607 10.0 0.1012858590168515)
  #(-6.016324551464302 10.0 0.1000962619743535)
  #(-6.009099370537937 10.0 0.0991026392362128)
  #(-6.000144802087108 10.0 0.0978213410260762)
  #(-5.992672802847265 10.0 0.0967077356358815)
  #(-5.983682684099936 10.0 0.095311303764513)
  #(-5.976390894901862 10.0 0.0941327969909632)
  #(-5.967597701948485 10.0 0.092651171023629)
  #(-5.960300625393035 10.0 0.091369004729541)
  #(-5.951819042895475 10.0 0.0898129037222759)
  #(-5.944827122197059 10.0 0.0884764825079818)
  #(-5.9364937900430546 10.0 0.086815333082949)
  #(-5.929316123058646 10.0 0.0853215712223041)
  #(-5.920853977349434 10.0 0.0834809963775036)
  #(-5.913697488126982 10.0 0.081855290446912)
  #(-5.905045875020715 10.0 0.0797946852900259)
  #(-5.897633195865675 10.0 0.077937627548088)
  #(-5.888869222952547 10.0 0.0756214894583634)
  #(-5.881576422780188 10.0 0.0735895003825018)
  #(-5.8730488606276685 10.0 0.071078664456186)
  #(-5.865886603820401 10.0 0.0688505661471062)
  #(-5.857659076163453 10.0 0.0661282191187038)
  #(-5.8506956581380045 10.0 0.0636758008622684)
  #(-5.8427993520796395 10.0 0.0607060179365281)
  #(-5.836006841543422 10.0 0.0579805075953104)
  #(-5.828141782273885 10.0 0.0545732138995477)
  #(-5.821264105869612 10.0 0.0513305536611062)
  #(-5.813396489418997 10.0 0.0472425696093425)
  #(-5.806736741014998 10.0 0.0434068855227238)
  #(-5.799296800365852 10.0 0.0385347465920627)
  #(-5.793149838865298 10.0 0.0339017049050897)
  #(-5.786639267262249 10.0 0.02799360148602)
  #(-5.781555952133565 10.0 0.0222871988704581)
  #(-5.77690049447455 10.0 0.0149171833984971)
  #(-5.774143850809992 10.0 0.0076254582681704)
  #(-5.773504871989952 10.0 0.0021812762824132)
  #(-5.77350372489622 10.0 -5.432357e-10))
 (1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0
  1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0
  1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0
  1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0
  1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0
  1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0
  1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0
  1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0
  1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0
  1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0
  1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0
  1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0
  1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0
  1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0)
 (0.0 0.0 0.0 0.0 0.0160453781542143 0.0241470160269717
  0.0317935799490915 0.0398053040025856 0.0478086834801164
  0.0560582201696031 0.0639202701209087 0.0718503545073776
  0.0797433850046513 0.087981750276748 0.0960087041824917
  0.1039831218391125 0.112029495827222 0.1201752268087684
  0.1282605498138822 0.136005192477863 0.1438242190390603
  0.1519870644337011 0.1593306835295498 0.1598487740853562
  0.1674658650196929 0.1680104087509454 0.175157710986505
  0.1757272662987668 0.1833705173786548 0.183966778279312
  0.1915177150798282 0.1921404682290536 0.1993060375256694
  0.1999541159685396 0.2074081735084615 0.2080825976726782
  0.2151502427534925 0.2158498418097879 0.2234099696672682
  0.2241364268834526 0.2312069092585329 0.2319587197887401
  0.2390267110021689 0.239803949187276 0.2470314540979864
  0.2478347213119199 0.2551668057971311 0.2559965267399797
  0.2633214412146924 0.2641776785913368 0.2711080693997827
  0.271989626560843 0.2788004837617649 0.2797070543520855
  0.2865857660092436 0.2875176520073938 0.294691617040477
  0.2956498608401993 0.3028107414290341 0.303795386191314
  0.3108677223812281 0.3118785660342093 0.3186289517157898
  0.3196650325637266 0.3267875123448071 0.3278501223901527
  0.3348376542335923 0.3359264409310518 0.343017473844114
  0.3441328588668275 0.3507020846059745 0.3518424576829762
  0.3585158400916831 0.3596816211629636 0.366600003006972
  0.3677920713565625 0.3748151183901361 0.3760338998362696
  0.3829150808161275 0.3841602009158513 0.3906373023990221
  0.3919075328521676 0.3983652317385465 0.3996605911050301
  0.406480133489536 0.4078018800878236 0.4145992363495962
  0.4159473838404371 0.4227235238201337 0.4240980890623294
  0.4304686564547328 0.4318684065502333 0.4382164439562757
  0.4396413875379139 0.4463489290384909 0.4478003170276637
  0.4544823491094193 0.4559601845464303 0.4626166004905004
  0.4641208860785213 0.470751784887656 0.4722825236605759
  0.4785036764886068 0.4800596220929673 0.486633503837215
  0.4882158852069559 0.4943709597308301 0.4959785009914117
  0.502479159396033 0.5041130660952415 0.5105726294674962
  0.512232853709101 0.5186483892971976 0.5203348734927932
  0.5267087790327916 0.5284214732034318 0.5344904142923997
  0.5362284120119565 0.5421342182310729 0.5438970713133418
  0.5502033260482438 0.5519924174541494 0.5583120642198542
  0.5601275228154484 0.5665206241752909 0.5683627745511391
  0.5742736086012711 0.5761409693620999 0.5819524448520371
  0.5838447748901722 0.5899961210140513 0.591914606679692
  0.5981367389758905 0.6000816954947563 0.6062612328823314
  0.6082326078238199 0.6139891743550618 0.6159856782493418
  0.6217020223331746 0.623723606100719 0.6295913193586837
  0.6316385567589856 0.6377653030384736 0.6398391197873293
  0.6458190701143912 0.6479190753033844 0.6541566170946882
  0.6562837334911363 0.6618008400206912 0.6639528131422728
  0.6699223065860094 0.6721006882862063 0.6775449581602477
  0.6797481264419983 0.6856437214610128 0.6878732244971574
  0.6935814940177247 0.695836808314546 0.7016366241440788
  0.7039181313132697 0.709705856689687 0.7120136025880942
  0.7177645246694223 0.7200984749442396 0.7258142875643973
  0.7281744132589539 0.7339554983783031 0.7363420968538624
  0.7420859180388898 0.7444989542058508 0.7497996761741695
  0.7522377951739535 0.7574084721926538 0.7598713327198711
  0.7650117024519579 0.7674992864084252 0.7730174533892418
  0.7755310696517345 0.7811075108508807 0.7836474335589837
  0.7892724115280283 0.7918388840494792 0.7974138106069117
  0.8000067565215466 0.8056169748708625 0.8082365950205777
  0.8135658669535445 0.816211334521307 0.8213255105466555
  0.8239962101530169 0.829242574214828 0.8319390177427586
  0.8370829503324179 0.8398048884169548 0.8454152884202761
  0.8481643207745085 0.8532523057058028 0.856026821694725
  0.8614897782714848 0.8642910800558162 0.8693003110837616
  0.8721270103832023 0.8774885682570619 0.8803418933181856
  0.8854532218703798 0.8883324456013311 0.8934528695387036
  0.8963581057296763 0.9010534532900417 0.9039834043046125
  0.9089319065807004 0.9118874759674483 0.9167609857678787
  0.9197420129769963 0.9249624084248843 0.9279701042058975
  0.9330316439657489 0.9360655784857183 0.9410404196288085
  0.9441003962903061 0.9488799412961575 0.9519654097358451
  0.9565785237508843 0.9596890256766235 0.9645868244983244
  0.9677233670213087 0.9726644785371455 0.9758272871735215
  0.9807483303509975 0.9839374252540747 0.9887471809818733
  0.9919622857532446 0.996778435740851 1.0 1.0 1.0 1.0)
 3)))
  
   :objects ((profile :type 'b-spline-curve
                      :control-points (first (the sample-b-spline-data))
                      :weights (second (the sample-b-spline-data))
                      :knot-vector (third (the sample-b-spline-data))
                      :degree (fourth (the sample-b-spline-data)))

            
             (approximate :type 'approximated-curve
                          :display-controls (list :color :red)
                          :tolerance 0.01
                          :pinned-parameters (list 0.1 0.5 0.7 0.9)
                          :match-parameterization? t
                          :curve-in (the profile))))

 (generate-sample-drawing :object-roots (make-object 'approximated-curve-test)
                          :projection-direction (getf *standard-views* :front)
                          :page-width 1000)

</pre>
"
                  
                  
                  
                  )
  
  :input-slots
  ("GDL Curve object. The curve to be approximated with this curve." 
   curve-in
   
   ("Number. The maximum distance deviation from the curve-in to this curve. 
Defaults to 1.0e-5 times the diagonal of the bounding box of the input curve." 
    tolerance (* 1.0e-5 (apply #'3d-distance (the curve-in bounding-box))))
   
   ("List of numbers. These are parameter values from the original curve 
where the approximated curve will be forced to be identical to the original 
curve. Defaults to nil."
    pinned-parameters nil)
   
   ("Boolean. Indicates whether the new-curve should contain matching parameterization between breakpoints. If nil, the 
parameterization can slip a little, but not very much. Allowing the parameterization between breakpoints to slip
results in somewhat fewer control points. Use non-nil only if a parameter-to-parameter match is important to your application. 
The default is nil." match-parameterization? nil))

  
  
  :computed-slots
  ((results (make-approximated-curve 
             *geometry-kernel*
             :curve (the curve-in native-curve-iw)
             :tolerance (to-double-float (the tolerance))
             :match-parameterization? (the match-parameterization?)
             :pinned-parameters (sort 
                                 (mapcar #'to-double-float 
                                         (the pinned-parameters))
                                 #'<)))
   
   (native-curve-iw (first (the results)))
   
   ("Number. This should reflect the actual tolerance achieved with the approximation. 
In the case of smlib, it is not clear exactly what this value is supposed to mean --
from examples we have seen so far, the value appears to range between 0.0 and 1.0, and 
it appears that values close to 1.0 indicate a close approximation, and values 
close to 0.0 indicate a loose approximation.. " 
    achieved-tolerance (second (the results)))))




