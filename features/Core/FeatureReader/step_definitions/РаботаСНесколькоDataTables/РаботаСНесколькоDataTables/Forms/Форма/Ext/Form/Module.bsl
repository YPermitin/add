﻿//начало текста модуля

///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//пример вызова Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,ОписаниеШага,ТипШага,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯВыполняюШагКоторыйБудетПриниматьТриТаблицыВВидеПараметров(ТабПарам1,ТабПарам2,ТабПарам3)","ЯВыполняюШагКоторыйБудетПриниматьТриТаблицыВВидеПараметров","Когда я выполняю шаг, который будет принимать три таблицы в виде параметров:","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВПеременнойКонтекстБудeтТриПереданныхТаблицы()","ВПеременнойКонтекстБудeтТриПереданныхТаблицы","Тогда в переменной контекст будeт три переданных таблицы","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВТаблицеНомерБудетКолонки(Парам01,Парам02)","ВТаблицеНомерБудетКолонки","И     в таблице номер 1 будет 2 колонки","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВТаблицеНомерБудетСтроки(Парам01,Парам02)","ВТаблицеНомерБудетСтроки","И     в таблице номер 1 будет 2 строки","","");

	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры


&НаКлиенте
Функция ПолучитьКоличествоКолонокТаблицы(Структура)
	Возврат Структура.Количество();
КонецФункции	

///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//Когда я выполняю шаг, который будет принимать три таблицы в виде параметров:
//@ЯВыполняюШагКоторыйБудетПриниматьТриТаблицыВВидеПараметров(ТабПарам1,ТабПарам2,ТабПарам3)
Процедура ЯВыполняюШагКоторыйБудетПриниматьТриТаблицыВВидеПараметров(ТабПарам1,ТабПарам2,ТабПарам3) Экспорт
	Массив = Новый Массив;
	Массив.Добавить(ТабПарам1);
	Массив.Добавить(ТабПарам2);
	Массив.Добавить(ТабПарам3);
	
	Контекст.Вставить("МассивТаблиц",Массив);
КонецПроцедуры

&НаКлиенте
//Тогда в переменной контекст будeт три переданных таблицы
//@ВПеременнойКонтекстБудeтТриПереданныхТаблицы()
Процедура ВПеременнойКонтекстБудeтТриПереданныхТаблицы() Экспорт
	Если Контекст.МассивТаблиц.Количество() <> 3 Тогда
		ВызватьИсключение "Ожидали получить 3 таблицы в массиве. А получили " + Контекст.МассивТаблиц.Количество() + " таблиц.";
	КонецЕсли;	 
КонецПроцедуры

&НаКлиенте
//И     в таблице номер 1 будет 2 колонки
//@ВТаблицеНомерБудетКолонки(Парам01,Парам02)
Процедура ВТаблицеНомерБудетКолонки(НомерТаблицы,КоличествоКолонок) Экспорт
	КоличествоКолонокТаблицы = ПолучитьКоличествоКолонокТаблицы(Контекст.МассивТаблиц[НомерТаблицы-1][0]);
	Если КоличествоКолонокТаблицы <> КоличествоКолонок Тогда
		ВызватьИсключение "Ожидали в таблице №" + НомерТаблицы + " получить " + КоличествоКолонок + " колонок. А получили " + КоличествоКолонокТаблицы;
	КонецЕсли;	 
КонецПроцедуры

//окончание текста модуля

&НаКлиенте
//И     в таблице номер 1 будет 2 строки
//@ВТаблицеНомерБудетСтроки(Парам01,Парам02)
Процедура ВТаблицеНомерБудетСтроки(НомерТаблицы,КоличествоСтрок) Экспорт
	Если Контекст.МассивТаблиц[НомерТаблицы-1].Количество() <> КоличествоСтрок Тогда
		ВызватьИсключение "Ожидали в таблице №" + НомерТаблицы + " получить " + КоличествоСтрок + " строк. А получили " + Контекст.МассивТаблиц[НомерТаблицы-1].Количество();
	КонецЕсли;	 
КонецПроцедуры
