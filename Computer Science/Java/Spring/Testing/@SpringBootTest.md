---
tags:
  - java/spring/testing
---
# Description
Это аннотация [[Spring Boot|спринг бута]] которую можно поставить над тестом, чтобы вкючить магию спринг бута.

Есть 2 сценария использования.

## 🚩Сценарий 1
***Не*** передавать `@SpringBootTest` ***никакую*** конфигурацию либо передать ей какую-то `@TestConfiguration` 
### 🔥Эффект
1) Если была передана `@TestConfiguration`, то спринг создаст из нее бины
2) Спринг пойдет сканировать пакеты ***вверх*** до тех пор, пока не найдет класс помеченный аннотацией [@SpringBootConfiguration](https://docs.spring.io/spring-boot/docs/current/api/org/springframework/boot/SpringBootConfiguration.html), ***не обращая внимания*** ни на какие [[@Configuration]] и [[@TestConfiguration]], найденные по пути.
3) Доходит до класса, помеченного `@SpringBootConfiguration` - как вариант, этим классом в том числе может являтся и главный класс приложения, который помечен `@SpringBootApplication`. ❗Если такого класса нет, либо несколько в одном пакете - все упадет❗
4) Начинает делать все, что висит над этим классом. Например [[@SpringBootApplication]] содержит в себе [[@EnableAutoConfiguration]]  и [[@ComponentScan]] - т.е. спринг пойдет обратно вниз по всем пакетам и будет создавать все бины, конфигурации и т.д. (на `@TestConfiguration` ему пофиг)
Из всего этого следует, что чтобы останвить процесс сканирования вверх, можно создать класс-стопер, помеченный `@SpringBootConfiguration` - спринг на него наткнется и дальше вверх не пойдет. Но в таком случае скорее всего в принципе не нужно использовать `@SpringBootTest`


## 🚩Сценарий 2
Передать в `@SpringBootTest` конфигурацию, помеченную аннотацией `@Configuration`
### 🔥Эффект
Логика такая - спринг считает, что ты ему дал ***хорошую, настоящую*** конфигурацию, он создаст из нее контекст и больше ниче делать не будет


# Useful Links
- [documentation](https://docs.spring.io/spring-boot/docs/current/api/org/springframework/boot/test/context/SpringBootTest.html)
- [tutorial](https://www.baeldung.com/spring-boot-testing)
- [проклятие Sprint Test](https://www.youtube.com/watch?v=7mZqJShu_3c)

# Related Topics
- [[Test]]
- [[Component Test]]
- [[Microservice Test]]