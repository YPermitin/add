﻿//начало текста модуля

Перем Ванесса;
 
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//пример вызова Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);


	Возврат ВсеТесты;
КонецФункции


Процедура ПередНачаломСценария() Экспорт

КонецПроцедуры



Процедура ПередОкончаниемСценария() Экспорт
	
	//безусловное закрытие формы если она осталась
	Попытка
	    ОткрытаяФормаVanessaBehavoir = Контекст.ОткрытаяФормаVanessaBehavoir;
		ОткрытаяФормаVanessaBehavoir.Закрыть();
	Исключение
	
	КонецПопытки;
КонецПроцедуры


Функция ПолучитьМакетСервер(ИмяМакета)
	Макет = ПолучитьМакет(ИмяМакета);
	Возврат  Макет;
КонецФункции	

//окончание текста модуля

    