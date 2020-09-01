<%--
- menu.jsp
-
- Copyright (c) 2019 Rafael Corchuelo.
-
- In keeping with the traditional purpose of furthering education and research, it is
- the policy of the copyright owner to permit non-commercial use and redistribution of
- this software. It has been tested carefully, but it is not guaranteed for any particular
- purposes.  The copyright owner does not offer any warranties or representations, nor do
- they accept any liabilities with respect to them.
--%>

<%@page language="java" import="acme.framework.helpers.PrincipalHelper,acme.entities.roles.Provider,acme.entities.roles.Consumer"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<acme:menu-bar code="master.menu.home">
	<acme:menu-left>
		<acme:menu-option code="master.menu.anonymous" access="isAnonymous()">
			<acme:menu-suboption code="master.menu.anonymous.favourite-link" action="http://www.example.com/"/>
			<acme:menu-suboption code="master.menu.anonymous.pablo-favourite-link" action="http://www.youtube.com/"/>
			<acme:menu-suboption code="master.menu.anonymous.notice" action="/anonymous/notice/list" />
			<acme:menu-suboption code="master.menu.anonymous.technologyRecordStars" action="/anonymous/technology-record/liststars" />
			<acme:menu-suboption code="master.menu.anonymous.technologyRecordSector" action="/anonymous/technology-record/listsector" />
			<acme:menu-suboption code="master.menu.anonymous.toolrecordStars" action="/anonymous/tool-record/liststars" />
			<acme:menu-suboption code="master.menu.anonymous.toolrecordSector" action="/anonymous/tool-record/listsector" />
		</acme:menu-option>

		<acme:menu-option code="master.menu.administrator" access="hasRole('Administrator')">
			<acme:menu-suboption code="master.menu.administrator.user-accounts" action="/administrator/user-account/list"/>
			<acme:menu-separator/>
			<acme:menu-suboption code="master.menu.administrator.shutdown" action="/master/shutdown"/>
		</acme:menu-option>
		
		<acme:menu-option code="master.menu.administrator.features" access="hasRole('Administrator')">
		<acme:menu-suboption code="master.menu.administrator.features.notice" action="/administrator/notice/list" />
		</acme:menu-option>
		

		<acme:menu-option code="master.menu.provider" access="hasRole('Provider')">
			<acme:menu-suboption code="master.menu.provider.favourite-link" action="http://www.example.com/"/>
		</acme:menu-option>

		<acme:menu-option code="master.menu.consumer" access="hasRole('Consumer')">
			<acme:menu-suboption code="master.menu.consumer.favourite-link" action="http://www.example.com/"/>
		</acme:menu-option>
	</acme:menu-left>

	<acme:menu-right>
		<acme:menu-option code="master.menu.sign-up" action="/anonymous/user-account/create" access="isAnonymous()"/>
		<acme:menu-option code="master.menu.sign-in" action="/master/sign-in" access="isAnonymous()"/>

		<acme:menu-option code="master.menu.user-account" access="isAuthenticated()">
			<acme:menu-suboption code="master.menu.user-account.general-data" action="/authenticated/user-account/update"/>
			<acme:menu-suboption code="master.menu.user-account.become-provider" action="/authenticated/provider/create" access="!hasRole('Provider')"/>
			<acme:menu-suboption code="master.menu.user-account.provider" action="/authenticated/provider/update" access="hasRole('Provider')"/>
			<acme:menu-suboption code="master.menu.user-account.become-consumer" action="/authenticated/consumer/create" access="!hasRole('Consumer')"/>
			<acme:menu-suboption code="master.menu.user-account.consumer" action="/authenticated/consumer/update" access="hasRole('Consumer')"/>
		</acme:menu-option>
		
		<acme:menu-option code="master.menu.authenticated" access="isAuthenticated()">
		
			<acme:menu-suboption code="master.menu.authenticated.notice" action="/authenticated/notice/list" />
			<acme:menu-suboption code="master.menu.authenticated.technologyRecordStars" action="/authenticated/technology-record/liststars" />
			<acme:menu-suboption code="master.menu.authenticated.technologyRecordSector" action="/authenticated/technology-record/listsector" />
			<acme:menu-suboption code="master.menu.authenticated.toolrecordStars" action="/authenticated/tool-record/liststars" />
			<acme:menu-suboption code="master.menu.authenticated.toolrecordSector" action="/authenticated/tool-record/listsector" />
			<acme:menu-suboption code="master.menu.authenticated.inquiry" action="/authenticated/inquiry/list" />
			<acme:menu-suboption code="master.menu.authenticated.overture" action="/authenticated/overture/list" />
			<acme:menu-suboption code="master.menu.authenticated.challenge" action="/authenticated/challenge/list" />
		</acme:menu-option>
		

		<acme:menu-option code="master.menu.sign-out" action="/master/sign-out" access="isAuthenticated()"/>
	</acme:menu-right>
</acme:menu-bar>
