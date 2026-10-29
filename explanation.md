# Explanation

## 1. Ən çətin hesab etdiyiniz SQL sorğusu hansı oldu?

Mənim üçün ən çətini 3.15(a) oldu. Burada Brooklyn-dakı bütün filiallarda hesabı olan müştəriləri tapmaq lazım idi. SQL-də "hamısı" sözünü birbaşa yazmaq olmur. Ona görə məsələni tərsinə düşündüm. Əvvəl Brooklyn-dakı filialları götürdüm, sonra EXCEPT ilə müştərinin hesabı olan filialları onlardan çıxdım. Əgər heç nə qalmırsa, deməli müştərinin hamısında hesabı var. Bunu NOT EXISTS ilə yoxladım.

## 2. Hansı sorğu üçün alt sorğu (subquery) istifadə etdiniz?

3.25-də alt sorğu istifadə etdim. Əvvəl içəridəki sorğu Philosophy departamentinin büdcəsini tapır. Sonra xaricdəki sorğu büdcəsi bundan çox olan departamentləri seçir və ORDER BY ilə əlifba sırasına düzür. 3.11(d)-də isə FROM hissəsində alt sorğu var. İçəridə hər departamentin maksimum maaşını tapdım, xaricdə MIN ilə onların ən kiçiyini götürdüm. 3.11(b)-də NOT IN ilə, 3.15(c)-də isə SOME ilə alt sorğu işlətdim.

## 3. JOIN istifadə etdiyiniz bir nümunəni izah edin.

3.24-də üç cədvəli JOIN ilə birləşdirdim: student, advisor və instructor. Əvvəl student cədvəlini advisor ilə tələbənin ID-si üzrə birləşdirdim. Sonra advisor cədvəlini instructor ilə müəllimin ID-si üzrə birləşdirdim. Beləliklə hər tələbənin yanında onun məsləhətçisinin departamenti də göründü. Sonda WHERE ilə tələbənin departamenti Accounting, müəllimin departamenti Physics olan sətirləri saxladım.

## 4. SQL sorğularını yazarkən qarşılaşdığınız bir problemi və onun həllini izah edin.

3.11(a)-da student, takes və course cədvəllərini birləşdirəndə eyni tələbənin adı bir neçə dəfə çıxdı. Səbəb o idi ki, bir tələbə bir neçə Comp. Sci. kursu götürüb və hər kurs üçün ayrı sətir yaranır. Tapşırıqda isə təkrar ad olmamalı idi. Problemi SELECT-dən sonra DISTINCT yazmaqla həll etdim və hər tələbə bir dəfə göründü.

Başqa bir problem 3.15(c)-də oldu. Əvvəl SOME əvəzinə ALL yazdım. Bu halda sorğu Brooklyn-dakı bütün filiallardan çox aktivi olan filialları tapırdı. Tapşırıqda isə "ən azı bir filialdan" yazılıb. Ona görə ALL-u SOME ilə əvəz etdim və nəticə düzəldi.
