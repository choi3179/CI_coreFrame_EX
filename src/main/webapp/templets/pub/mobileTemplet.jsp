<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.cyber-i.com/coreview/menu" prefix="m"%>
<%@ taglib uri="http://www.cyber-i.com/coreview/layout" prefix="layout"%>

<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"/>
	<layout:elementGroup sequencialTypeNames="css,less,js" >
		<layout:element name="corestock.common" autoDevicePostfix="true"/>
	</layout:elementGroup>
	
	<layout:head></layout:head>
</head>
<body>
	
	<layout:body></layout:body>

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
			beforeShow : function (input, picker) {				
				
				// Dirty hack, but we can't do anything without it (for now, in jQuery UI 1.8.20)
		        setTimeout(function() {
		        	picker.dpDiv.before('<div class="modalbackground"/>');
		        	$('body').bind('touchmove.scroll', function (e) {
		        		e.preventDefault()
		        	});

		            picker.dpDiv.position({
		                my: 'center',
		                at: 'center',
		                of: window
		            });
		        }, 1);

				
				
			},
			onClose : function () {

				$('body').unbind('touchmove.scroll');
				$('.modalbackground').remove();
			}
		});

		$('.datepicker').attr('readonly','readonly');

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