<%@page import="bena.Person"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
	<!-- url 标签库  -->
	<c:url value="image/1.gif"></c:url>
	<form action="<c:url value='/AServlet'/>" method="post">
		<input type="submit" value="访问" />
	</form>
	<form action="/JSTL/AServlet" method="post">
		<input type="submit" value="访问" />
	</form>
	<br>

	<c:forEach var="num" begin="2" step="2" end="50">
		<font>${num }</font>
	</c:forEach>

	<%
		for (int num = 2; num < 50; num = num + 2) {
			response.getWriter().print(num + "  ");

		}

		List<Person> list = new ArrayList<Person>();

		Person person = new Person();
		person.setName("耿帅佳");
		list.add(person);

		Person person1 = new Person();
		person1.setName("贾谭克");
		list.add(person1);

		Person person2 = new Person();
		person2.setName("王玉龙");
		list.add(person2);

		Person person3 = new Person();
		person3.setName("毛新疆");
		list.add(person3);

		Person person4 = new Person();
		person4.setName("周震");
		list.add(person4);

		request.setAttribute("list1", list);
		request.setAttribute("Person", person);

		for (Person p : list) {
			response.getWriter().print(p.getName());

		}

		Map<Person, Integer> map = new HashMap<Person, Integer>();
		map.put(person, 1);
		map.put(person1, 2);

		request.setAttribute("map", map);

		int num = 2;
		request.setAttribute("num", num);

		Map<String, Integer> map1 = new HashMap<String, Integer>();
		map1.put("key1", 5);

		request.setAttribute("map1", map1);
	%>
	forEach遍历List 集合<br>
	<c:forEach items="${ list1 }" var="c">
		<tr>
			<td>${c.name}</td>
		</tr>
	</c:forEach>
	forEach遍历Map 集合<br>
	<c:forEach items="${map}" var="c">
		<tr>
			<td>${c.key.name}</td>
			<td>${c.value}</td>
		</tr>
	</c:forEach>
	forEach使用varStatus的属性<br>
	<table>
		<tr>
			<td>姓名</td>
			<td>序号</td>
		</tr>
		<c:forEach items="${list1 }" varStatus="vs" var="v">
			<tr bgcolor="${vs.index % 2 == 1 ? '#EE3B3B' :'#B3EE3A' }">
				<td>${vs.current.name}</td>
				<td>${vs.count}</td>
			</tr>
		</c:forEach>
		
	if标签的使用：<br>
	</table>
	<br>
	<c:if test="${ num == 2 }">该判断结果为 true</c:if>
	<br>
	<c:if test="num == 2">该判断结果不会返回true</c:if>
	<br>
	<c:if test="true">字符串true 能返回出来true</c:if>
	<br>
	<c:if test="${num == 1}">该判断结果为 false 不能返回出来false</c:if>
	<br>
	choose when otherwise标签的使用：<br>
	<c:set value="11" var="test1"></c:set>
	<c:choose>
		<c:when test="${test1>15 }">
		执行外层 when 
		</c:when>
		<c:otherwise>
		执行外层 otherwise 
			<c:choose>
				<c:when test="${test1 + 5 <15 }">
				执行 内层第一个when 
				</c:when>
				<c:when test="${test1 - 4 >0 }">
				执行 内层第二个when 
				</c:when>
				<c:otherwise>
				执行 内层otherwise 
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
	set标签<br>
	<br>
	<c:set value="${totalCount+1 }" var="totalCount" scope="application"></c:set>
	<c:set value="${1 }" var="totalCount" scope="session"></c:set>
	<c:set value="${cont+1 }" var="count" scope="session"></c:set>
	本网站总访问人次：${ totalCount }
	<br> 您访问的次数：${count }
	
	<br>
	<c:set var="test2" value="我在value中产生"></c:set>
	<br>
	<c:set var="test3">我在标签内产生</c:set>
	在哪里产生：test2${test2 }
	<br> test3${test3 }
	<br>
	<c:set target="${Person }" property="name" value="张三"></c:set>
	设置Person的name${Person.name }
	<c:set target="${map1}" property="key" value="5">
	</c:set>
	设置Map1 的value为${map1.key }
	<br>
	catch 标签：<br>
	<c:catch var="e">
		<c:set target="${m}" property="key1" value="5">
		</c:set>
	设置Map1 的value为${m.key1}
	
	</c:catch>
	<c:if test="${e !=null }">
		程序抛出了异常${e.message }
	</c:if>


</body>
</html>
