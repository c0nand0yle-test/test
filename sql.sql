BEGIN
   EXECUTE IMMEDIATE ('SET ROLE  ASR_OPER  IDENTIFIED BY "024065123052000052024011242123"');
END;


select a.DFSTREAMREC, a.dfdogovor,a.dfservice,b.dfsumma,b.DFONYMA_NAME
from uninew.tstreamrec a, uninew.tonenach b
where DFSTREAMFILE=847222000054157
and a.DFOWNER=b.DFonenach
and DFDATEINBEGIN>to_date('03.03.2019','dd.mm.yyyy') 

^^^^^^^^^^^
select * from uninew.tdebetor_new where dfdogovor=865650010705473
^^^^^^^^^^^

:::::::::::
select * from audit_kurs.tservice
where dfservice=187800000007148

select * from tservice@auditdb.south.rt.ru
where DFservice=187800000007148
:::::::::::

^^^^^^^^^^^
update uninew.tservice set dfdocbegin=''
where dfservice=186700000006132 
^^^^^^^^^^^
************
select
'222' "таблица",
replace(a.dfnamerep,Chr( 13 ) || Chr( 10 ),'') "Краткое название", --удаление Enter
--replace(a.dfnamerep,Chr( 32 ),'') "Краткое название", --удаление пробелов
--trim(a.dfnamerep),
a.dfservice "ID услуги", 
--a.dfdateinbegin "Дата последнего изменения", 
a.dfdocbegin "Актуальность",
--a.dfservgroup,
b.dfname "Папка" 

from 
uninew.tservice a,
uninew.tservgroup b

where 1=1
and b.dfservgroup=a.dfservgroup
and a.dfname like '%aspersky%' 
and a.dfservice=184400000005899
and a.dfdateinbegin > to_date('01.01.2019','dd.mm.yyyy')
--and a.dfname like '%Для интернета%'
    --or a.dfnamerep like '%Пакет телеканалов "Viasat Премиум%'  ---!1435,1691,2226,3997!----(АСТ, ОСТ, КБР, ДАГ, ИНГ, КМ, СТВ, КЧР)
    --or a.dfnamerep like '%Пакет телеканалов "Amedia Premium%' ---!1729,2208!----(АСТ, ОСТ, КБР, ДАГ, ИНГ, КМ, СТВ
    --or a.dfnamerep like '%Пакет телеканалов "Amedia+Viasat Premium%' ---!2131!----(АСТ, ОСТ, КБР, ДАГ, ИНГ, КМ, СТВ, КЧР)
    --or a.dfnamerep like '%Пакет телеканалов "Шант Премиум%'  ---!2979!----
    --or a.dfnamerep like '%Пакет телеканалов "Весь Футбол%'  ---!3032!----
************

select * from uninew.tservgroup t

--where t.dfservgroup=186501193146512   ----!!!!!!!!!!!! поиск услуг по разделам

              CONNECT BY PRIOR t.DFSERVGROUPMASTEr = t.DFSERVGROUP

              START WITH t.DFSERVGROUP =(select dfservgroup from uninew.tservice

              where dfservice='186600000004558')   

              
              
select  dfnamerep, dfname, dfservice, dfdocbegin, 
(select dfname from uninew.tservgroup where dfservgroup=a.dfservgroup) Папка
from uninew.tservice a 
where dfservice in 
(187700000003631,
187700000002848,
187700000003632,
187700000002216,
187700000003633)
,187700000004957),186700000004630)
select * from uninew.tservgroup where  dfservgroup='-1'
uninew.tservice.dfname!='Доступ к СПД (xPON)'


---------------------
select 
dfnumber Учетное_имя,
dfservconst Сервконст_КоммУслуги, 
dfdogovor Договор_КуРС,
(select DFCONNECTION_ID from argus_gate.tsc_spd_link where DFSERVCONST_SPD=Z.dfservconstmaster) ID_Onyma,
dfservconstmaster Сервконст_ШПД,
(select DFHOUSENUMBER from uninew.torpon_house where DFGLOBALID=Z.DFORPON_HOUSE and dfdate_end is null ) Дом_ОРПОН,
dfhouse Дом_КуРс,
dfdevice, 
(select dfname from uninew.tdevice where dfdevice=Z.dfdevice) Тип,
(select dfname from uninew.tservice where dfservice=Z.dfservice and dfname not like '%Доступ к СПД%' ) Услуга
from  uninew.tservconst Z
where 
dfdevice in (1101) 
and dfdatebegin is not null 
and dfdateend is null
------------------- 

&&&&&&&&&&&&&
select DFCONNECTION_ID,DFSC_SPD_DATEEND,DFSERVCONST_SPD,b.dfnumber,DFSERVCONST_OTA 
from argus_gate.tsc_spd_link a, uninew.tservconst b
where DFSERVCONST_SPD=844241000780667
and a.DFSERVCONST_SPD=b.dfservconst 

select DFCONNECTION_ID,DFSC_SPD_DATEEND,DFSERVCONST_SPD,b.dfnumber,DFSERVCONST_OTA,
(select DFDOGOVOR from uninew.tservconst where a.DFSERVCONST_SPD=dfservconst) Договор_КуРС 
from argus_gate.tsc_spd_link a, uninew.tservconst b
where DFCONNECTION_ID=51446198	
and a.DFSERVCONST_SPD=b.dfservconst 
&&&&&&&&&&&&&


~~~~~~~~~~~~~~~~~~~
select * from argus_gate.tsc_spd_link where DFDOGOVOR_ONIMA=1310503296
~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~
select b.SVC_FULLADDR,b.dfservconst,b.dfhouse,b.DFKORPUS, a.DFHOUSENUMBER Дом_ОРПОН,a.DFGLOBALID
from uninew.TORPON_HOUSE_KURS  a, uninew.VSERVCONSTFULL b
where 1=1
and a.DFSTREETUNIKEY = b.DFSTREETUNIKEY
and b.dfservconst=867222002064320
AND NVL(a.dfnot_use,'F') <> 'T'
and a.DFHOUSENUMBER=b.dfhouse
and nvl(a.DFCORPUS,'+')=nvl(b.DFKORPUS,'+')
and a.DFCITYUNIKEY=b.DFCITYUNIKEY 
and dforpon_house is not null
~~~~~~~~~~~~~~~~~~~

}}}}}}}}}}}}}}}}}}
select * from argus_gate.tsc_spd_link Q
right join uninew.tservconst S on Q.DFSERVCONST_SPD = S.DFSERVCONST
where Q.DFSERVCONST_SPD like '199500000171014'
union all
select * from argus_gate.tsc_spd_link Q
left join uninew.tservconst S on Q.DFSERVCONST_SPD = S.DFSERVCONST
where Q.DFSERVCONST_SPD like '199500000171010'
}}}}}}}}}}}}}}}}}}


select * from argus_gate.tsc_spd_link order by  DFCONNECTION_ID ASC and order by  ASC
select * from uninew.torpon_house
select * from uninew.tdevice
select * from uninew.tservice
select * from uninew.tservconst WHERE dfcity=98000000084 and DFSERVCONST=862203007238991
select * from uninew.tcity where dfnameADDR like '%ГОЛОВИНКА%' 6204354
select * from uninew.tstreet where dfstreet=6204354
select DFHOUSENUMBER from uninew.torpon_house Y, uninew.tservconst Z where Y.DFGLOBALID=Z.DFORPON_HOUSE and Z.dfservconst=199500000171325 

select a.dfservconst,a.dfhouse Дом_КуРс,b.DFHOUSENUMBER Дом_ОРПОН
from uninew.tservconst a , uninew.tORPON_HOUSE b
where dfservconst=199500000171325
and a.DFORPON_HOUSE=b.DFGLOBALID(+) 


select dforpon_house from uninew.tservconst
where dfservconst=199500000171325 


where dfnumber like ''
------------------------

select * from uninew.tdevice

,(select DFCONNECTION_ID from argus_gate.tsc_spd_link where Y.DFSERVCONST_SPD=Z.dfservconst) ID_Onyma 

select DFCONNECTION_ID,DFSERVCONST_SPD,b.dfnumber,DFSERVCONST_OTA 
from argus_gate.tsc_spd_link a, uninew.tservconst b
where DFSERVCONST_SPD=844241000780667
and a.DFSERVCONST_SPD=b.dfservconst 

select DFCONNECTION_ID,DFSERVCONST_SPD,b.dfnumber,DFSERVCONST_OTA 
from argus_gate.tsc_spd_link a, uninew.tservconst b
where DFCONNECTION_ID=64051509
and a.DFSERVCONST_SPD=b.dfservconst


select *  from uninew.tservice where DFSERVGROUP=878222000016162

select * from uninew.tservice where dfservice = '199500000002456'


select dfservice, dfnamerep, dfservice||' -----> '||dfnamerep as POLE from uninew.tservice
where dfservice like '%186500000001036%'




---Проверить
select n.dfdogovor, u.dfnamerep, n.dfsumma
from uninew.tservnach n,

     (select dfservice, dfnamerep from uninew.tservice where upper(dfnamerep) like ('%АКЦИЯ "ГОД КИНО"%')) u,

     (select dfperiod from uninew.tperiod where dfnpp='207') p
where 1=1
and n.dfperiod=p.dfperiod
and n.dfservice=u.dfservice
