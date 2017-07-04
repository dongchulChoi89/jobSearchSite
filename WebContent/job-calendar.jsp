<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Theme Region">
   	<meta name="description" content="">

    <title>Jobs | Job Portal / Job Board HTML Template</title>
     <!-- CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" >
    <link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/icofont.css"> 
    <link rel="stylesheet" href="css/slidr.css">     
    <link rel="stylesheet" href="css/main.css?ver=1">  
	<link id="preset" rel="stylesheet" href="css/presets/preset1.css">	    
    <link rel="stylesheet" href="css/responsive.css">
    <link rel="stylesheet" href="css/table_kdb.css">
    <link rel='stylesheet' href='css/fullcalendar.css?ver=5' />
	
	<!-- font -->
	<link href='https://fonts.googleapis.com/css?family=Ubuntu:400,500,700,300' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Signika+Negative:400,300,600,700' rel='stylesheet' type='text/css'>

	<!-- icons -->
	<link rel="icon" href="images/ico/favicon.ico">	
    <link rel="apple-touch-icon" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon" sizes="57x57" href="images/ico/apple-touch-icon-57-precomposed.png">
    <!-- icons -->

	
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- Template Developed By ThemeRegion -->
  <style type="text/css"> 
  	html, body { height:100%; overflow:hidden } 
  </style>

    
	</head>
	<body>
		<!-- header 11-->
		<jsp:include page="navHeader.jsp"/>
	<!-- header -->
	<div class="modal fade" id="modal-detail" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-fullsize" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">상세 정보</h4>
                </div>
                <div class="modal-body" id="ajax-modal-detail">
            <!-- breadcrumb -->
            <!-- job-details -->
        </div>
        <!-- container -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
    
	<section class="job-bg page job-list-page">
		<div class="container-fluid">
			<div id="target">
	</div>
			<div class="breadcrumb-section">
				<!-- breadcrumb -->
				<h2 class="title">Calendar</h2>
			</div>
			<div class="container-fluid section job-list-item">	
			<div class="row">
			<!--  TODO: filter 추가  -->
			</div>
					<div class="calendar-left hidden-xs">
						<div id="calendar-mini"></div>
					</div>
					<div class="calendar-right container-fluid">
            			<div id="calendar" style="height:500px"></div>
            		</div>
		</div><!-- container -->
		<form action="${path }/calendar.do?method=init" method="post">
		<input type="hidden" name="month" value="hi" />
		</form>
		</div>
	</section><!-- main -->
	
	
	<!--/Preset Style Chooser--> 
	<div class="style-chooser">
		<div class="style-chooser-inner">
			<a href="#" class="toggler"><i class="fa fa-cog fa-spin"></i></a>
			<h4>Presets</h4>
			<ul class="preset-list clearfix">
				<li class="preset1 active" data-preset="1"><a href="#" data-color="preset1"></a></li>
				<li class="preset2" data-preset="2"><a href="#" data-color="preset2"></a></li>
				<li class="preset3" data-preset="3"><a href="#" data-color="preset3"></a></li>
				<li class="preset4" data-preset="4"><a href="#" data-color="preset4"></a></li>
			</ul>
		</div>
	</div>
	<!--/End:Preset Style Chooser-->
	
    <!-- JS -->
    <script src='js/jquery.min.js'></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/price-range.js"></script>   
    <script src="js/main.js"></script>
	<script src="js/switcher.js"></script>
	<script src='js/moment.min.js'></script>
	<script src='js/locale/ko.js'></script>
	<script src='js/fullcalendar.js?ver=2'></script>
	<script src='js/calendar.js?ver=2'></script>
	<script type="text/javascript">
	// popover 동적 element setting
	var popOverSettings = {
		    placement: 'right',
		    container: 'body',
		    selector: '.unselected[data-toggle="popover"]',
		    content: function () {
		        return "북마크가 추가되었습니다.";
		    }
		}
		$("#calendar").popover(popOverSettings);
		$("#calendar").on('shown.bs.popover','[data-toggle="popover"]', function () {
    	var popObj=$(this);
    	setTimeout(function(){
    		popObj.popover('hide');	
    		},2000)
    		})
    // ajax modal window 종료 시 callback
	$("#modal-detail").on("hidden.bs.modal",function(e){
		$("#ajax-modal-detail").html("");
		location.reload();
	})
	
	// bookmark 추가, 제거를 위한 ajax call 함수
	function callAjax(method,target,index,selector){
        	var img1=selector.find("img:first");
        	var img2=selector.find("img:last");
            $.ajax({
                type:"POST",
                url:"careerlist.do?"+"target="+target+"&method="+method+"&index="+index,
                success:function(data){
                	if(method=="bookmark"){
                		img1.css("display","none")
                		img2.css("display","block");
                		selector.addClass("selected").removeClass("unselected");
                	}
                	else if(method=="rmBookmark"){
                		img1.css("display","block")
                        img2.css("display","none");
                		selector.addClass("unselected").removeClass("selected");
                	}
                	
                }
        })
        }
	
	
	$('#calendar').fullCalendar({
		header : {
			left : 'today',
			center : 'prev title next',
			right : ''
		},
		titleFormat:'YYYY.MM',
		editable : false,
		locale: 'ko',
		eventRender: function (event, element) {
			var tags="<a data-toggle='popover' class='bookmark company "+(event.bookmarked? "selected" : "unselected")+
			"' style='float:right;'><input type='hidden' value='"+event.companyid+"'/><img class='item-bookmark unselected' src='images/icon/bookmark-unselected.png' "+
			"style='display:"+(event.bookmarked ? "none" : "block")+"'/>"+
			"<img class='item-bookmark selected' src='images/icon/bookmark-selected.png' "+
			"style='display:"+(event.bookmarked ? "block" : "none")+"'/>"+
			"</a>";
		    element.find('.fc-content').append(tags);
		},
	    events: function(start, end, timezone, callback) {
	        $.ajax({
	            url: 'calendar.do?method=companylist',
	            dataType: 'json',
	            data: "date="+moment($("#calendar").fullCalendar('getDate')).format('YYYY-MM'),
	            success: function(doc) {
	                var events = [];
	                var companys= doc.companys;
	                $.each(companys,function() {
	                    events.push({
	                        title: "시작: "+$(this).attr('companyname'),
	                        start: $(this).attr('firstpostdate'), // will be parsed
	                        end: $(this).attr('firstpostdate'),
	                        companyid:$(this).attr('companyid'),
	                        bookmarked:$(this).attr('bookmarked')
	                    });
	                    events.push({
	                        title: "끝: "+$(this).attr('companyname'),
	                        start: $(this).attr('lastenddate'), // will be parsed
	                        end: $(this).attr('lastenddate'),
	                        companyid:$(this).attr('companyid'),
	                        bookmarked:$(this).attr('bookmarked')
	                    });
	                });
	                callback(events);
	            }
	        });
	    },
	    eventClick:function(calEvent,jsEvent,view){
	    	var $element=$(jsEvent.target);
	    	if($element.hasClass("item-bookmark")){
	    		// bookmark 클릭 시, ajax 호출을 하지 않는다
	    	}
	    	else{
	    		var params="companyid="+calEvent.companyid;
	            $.ajax({
	                type:"POST",
	                url:"careerlist.do?method=job-detail",
	                data:params,
	                success:function(args){
	                    var body = '<div id="body-mock">' + args.replace(/^[\s\S]*<body.*?>|<\/body>[\s\S]*$/ig, '') + '</div>';
	                    var $body = $(body);
	                    console.log($body)
	                    $("#ajax-modal-detail").html(args);
	                    $("#modal-detail").modal("show");
	                    }
	                }) 
	    	}
        	
        },
        aspectRatio:1.8,
        displayEventTime:false
	});
	$("#calendar").on("click",".bookmark",function(event){
		var index=$(this).find("input[type=hidden]").val();
    	var method;
    	var target;
    	if($(this).hasClass("selected")){
    		method="rmBookmark";
    	}else if($(this).hasClass("unselected")){
    		method="bookmark";
    	}
    	if($(this).hasClass("career")){
    		target="career";
    	} else if($(this).hasClass("company")){
    		target="company";
    	}
    	callAjax(method,target,index,$(this));
    	event.stopPropagation();
	})
	</script>	
  </body>
</html>