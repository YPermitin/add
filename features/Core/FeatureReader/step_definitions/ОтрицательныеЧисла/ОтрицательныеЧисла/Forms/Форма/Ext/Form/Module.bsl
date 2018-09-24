﻿//начало текста модуля
&НаКлиенте
Перем Ванесса;
 
&НаКлиенте
Перем Контекст Экспорт;
 
&НаКлиенте
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//пример вызова Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯПередалВШагЧисловойПараметр(Парам01)","ЯПередалВШагЧисловойПараметр","Когда я передал в шаг числовой параметр -1");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯПередалВШагЧисловойПараметрВСерединеСтроки(Парам01)","ЯПередалВШагЧисловойПараметрВСерединеСтроки","И     я передал в шаг числовой параметр -2 в середине строки");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВПеременнойКонтекстЕстьЗначениеМинус(Парам01)","ВПеременнойКонтекстЕстьЗначениеМинус","Тогда в переменной Контекст есть значение минус 1");

	Возврат ВсеТесты;
КонецФункции

&НаКлиенте
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры


&НаКлиенте
//Я передал в шаг числовой параметр -1
//@КогдаЯПередалВШагЧисловойПараметр(Парам01)
Процедура ЯПередалВШагЧисловойПараметр(ПереданноеЧисло) Экспорт
	Контекст.Вставить("Число" + Контекст.Количество(),ПереданноеЧисло);
КонецПроцедуры

&НаКлиенте
//Я передал в шаг числовой параметр -2 в середине строки
//@ИЯПередалВШагЧисловойПараметрВСерединеСтроки(Парам01)
Процедура ЯПередалВШагЧисловойПараметрВСерединеСтроки(ПереданноеЧисло) Экспорт
	Контекст.Вставить("Число" + Контекст.Количество(),ПереданноеЧисло);
КонецПроцедуры

&НаКлиенте
//В переменной Контекст есть значение минус 1
//@ТогдаВПеременнойКонтекстЕстьЗначениеМинус(Парам01)
Процедура ВПеременнойКонтекстЕстьЗначениеМинус(ПереданноеЧисло) Экспорт
	Нашли = Ложь;
	Для каждого Элем Из Контекст Цикл
		Если Элем.Значение = -ПереданноеЧисло Тогда
			Нашли = Истина;
		КонецЕсли;	 
	КонецЦикла;
	
	Если Не Нашли Тогда
		ВызватьИсключение "Не нашел в контексте параметр -" + ПереданноеЧисло;
	КонецЕсли;	 
КонецПроцедуры

//окончание текста модуля
