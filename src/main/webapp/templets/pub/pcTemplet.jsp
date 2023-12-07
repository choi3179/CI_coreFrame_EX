<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.cyber-i.com/coreview/menu" prefix="m"%>
<%@ taglib uri="http://www.cyber-i.com/coreview/layout" prefix="layout"%>

<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8" />
	
	<layout:elementGroup sequencialTypeNames="css,less,js" >
		<layout:element name="corestock.common" autoDevicePostfix="true"/>
	</layout:elementGroup>
	
	<layout:head></layout:head>
</head>
<body>
	
	<div id="wrap">
		<div id="header">
			<div id="companyLogo">
				<h1><a href="">LOGO</a></h1>
			</div>
			
			<ul id="quickMenu">
				<li>
					<a href="">주식종합</a>
				</li>
				<li>
					<a href="">회사소개</a>
				</li>
				<li>
					<a href="">사이트맵</a>
				</li>
			</ul>

			<ul id="utilMenu">
				<li>
					<a href="">로그인</a>
				</li>
				<li>
					<a href="">ID등록</a>
				</li>
				<li>
					<a href="">공인인증센터</a>
				</li>
				<li>
					<form action="" id="globalSearch">
						<input type="text" name="query" id="globalSearchInput">
						<input type="submit" value="검색">
					</form>
				</li>
				<li>
					<input type="button" value="전체메뉴">
				</li>
			</ul>

			<div class="clear"></div>

			<ul id="globalMenu">
				
			<m:list depth="1">
		
				<li>
					<a href="<m:param attr="url"/>"><m:param attr="name"/></a>
				</li>
				
			</m:list>
		
			</ul>

			<div class="clear"></div>
		</div>
		
		<div id="contentWrap">
			<m:when test="{menu.submain}!=Y">
			<div id="leftMenu">
			<m:list depth="2">
				<ul>
					<li>
						<a href="<m:param attr="url"/>"><m:param attr="name"/></a>
					</li>
				</ul>
			</m:list>
			</div>
			</m:when>

			<div id="content" <m:when test="{menu.submain}==Y">class="submain"</m:when>>
				<layout:body></layout:body>
			</div>
			<div class="clear"></div>
		</div>

		<div class="clear"></div>
		
		<div id="rightMenu">
			<h4>QUICK MENU</h4>
			<ul>
				<li>
					<a href="">인터넷뱅킹</a>
				</li>
				<li>
					<a href="">국내펀드</a>
				</li>
				<li>
					<a href="">해외펀드</a>
				</li>
			</ul>
			<h4>최근본 상품</h4>
			<ul>
				<li>
					<a href="">펀드상품1</a>
				</li>
				<li>
					<a href="">펀드상품2</a>
				</li>
				<li>
					<a href="">펀드상품3</a>
				</li>
			</ul>
		</div>
		
		<div class="clear"></div>
		
		<div id="footer">
			<h4 id="footerLogo">
				<a href="">FOOTER LOGO</a>
			</h4>
			<ul id="footerMenu">
				<li>
					<a href="">영업점안내</a>
				</li>
				<li>
					<a href="">개인정보취급방침</a>
				</li>
				<li>
					<a href="">투자유권대행인</a>
				</li>
				<li>
					<a href="">다운로드</a>
				</li>
				<li>
					<a href="">고객지원센터</a>
				</li>
			</ul>
			<div class="clear"></div>
			<p class="copyright">
				Copyright 2013 CyberImagination CO.,LTD. All Right Reserved.
			</p>
			<a href="" class="multibrowsermark">멀티브라우저지원 상세보기</a>
			<div class="familysite">
				<label for="familysite">Family Site</label>
				<select name="familysite" id="familysite">
					<option value="site1">Family site 1</option>
					<option value="site2">Family site 2</option>
					<option value="site3">Family site 3</option>
					<option value="site4">Family site 4</option>
					<option value="site5">Family site 5</option>
					<option value="site6">Family site 6</option>
					<option value="site7">Family site 7</option>
				</select>
				<input type="button" value="이동">
			</div>
			<div class="clear"></div>
		</div>
	</div>

	<script type="text/javascript">
		$('.datepicker').datepicker({
			showAnim: "",
			showOn : 'button',
			buttonText: '달력',
			dateFormat : 'yy-mm-dd',
			showButtonPanel : true,
			closeText: '닫기',
			prevText: '이전',
			nextText: '다음',
			currentText: '오늘',
			dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
			monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
			yearSuffix: '년',
			showMonthAfterYear: true,
			onClose : function (date, picker) {
				picker.trigger.focus();
			}
		});

		$('.datepickerbtn').on('click', function () {
			var $el = $(this);
			$el.prev().focus();
		});

		(function() {
			$(document).ready(function () {
				$('.tab').on('click', ' li > a', function(e) {
					var li = $(this.parentNode); 
					li.addClass('active').siblings('.active').removeClass('active');
					e.preventDefault();
				});
			});
		})();
	</script>
	
</body>
</html>