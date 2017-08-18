<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html>
	<body>
<div class="container dropdown-menu" role="menu" id="chat-tot" style="left:-400px; bottom: -16px;">
    <div class="row chat-window" id="chat_window_1" >
        <div class="col-xs-12 col-md-12">
        	<div class="panel panel-default">
                <div class="panel-heading top-bar">
                    <div class="col-md-8 col-xs-8">
                        <h3 class="panel-title"><span class="glyphicon glyphicon-comment"></span> Javarajob- 채팅방<span id="userCnt"></span></h3>
                    </div>
                    <div class="col-md-4 col-xs-4" style="text-align: right;">
                        <a><span id="minim_chat_window" class="glyphicon glyphicon-minus icon_minim"></span></a>
                        <a><span class="glyphicon glyphicon-remove icon_close" data-id="chat_window_1"></span></a>
                    </div>
                </div>
                <div class="panel-body msg_container_base">
                </div>
                <div class="panel-footer">
                    <div class="input-group">
                        <input id="btn-input" type="text" class="form-control input-sm chat_input" placeholder="Write your message here..." />
                        <span class="input-group-btn">
                        <button class="btn btn-primary btn-sm" id="btn-chat" style="font-size: 12px;">Send</button>
                        </span>
                    </div>
                </div>
    		</div>
        </div>
    </div>
</div>
<script type="text/javascript">
var wsocket;
var msgArrived=0;
function connect() {
	wsocket = new WebSocket("ws://192.168.0.141:7080/${path}/chat-ws.do");
	wsocket.onopen = onOpen;
	wsocket.onmessage = onMessage;
	wsocket.onclose = onClose;
}
function disconnect() {
	wsocket.close();
}
function onOpen(evt) {
	console.log("연결되었습니다.");
}
function onMessage(evt) {
	var data = evt.data;
	console.log(data);
	var msg=data.substring(0, 4);
	var msgId=data.substring(4).split("/",1);
	if (data.substring(0, 4) == "msg:") {
		if(msgId!="${sessionScope.id}") {
			appendMessage(data.split("/")[1], msgId);
			$("#msg-arrived").text(++msgArrived);
		}
		else {
		appendMyMessage(data.split("/")[1],"${sessionScope.id}");
		}
	}else{
		var userCnt= data.split("/")[0];
		console.log(userCnt);
		$("#userCnt").text("("+userCnt+")");
		
	}
}
function onClose(evt) {
	appendMessage("연결을 끊었습니다.");
}

function send() {
	var msg = $("#btn-input").val();
	wsocket.send("msg:${sessionScope.id}/"+ msg);
	$("#btn-input").val("");
}
/* 자신의 message 내용을 msg_container에 append한다. 말풍선의 방향이 다르기 때문에 따로 함수를 두었음.  */
function appendMyMessage(msg, myId) {
	msg= msg.replace(/(<([^>]+)>)/gi, "");
	console.log(msg);
	$(".msg_container_base").append('<div class="row msg_container base_sent">'
            +'<div class="col-md-10 col-xs-10">'
            +'<div class="messages msg_sent">'
                +'<p>'+msg+'</p>'
                +'<time datetime="2009-11-13T20:00">${sessionScope.id} • '+moment().format("HH:mm")+'</time>'
            +'</div>'
        +'</div>'
        +'<div class="col-md-2 col-xs-2 avatar">'
            +'<img src="upload/${sessionScope.id}/profile/'+myId+'_profile.jpg?ver='+moment().format("HH:mm")+'" class=" img-responsive ">'
        +'</div>'
    +'</div>');
	var msgRow=$(".msg_container_base:last-child");
	var chatAreaHeight = msgRow.height();
	var maxScroll =$(".msg_container_base").height()-chatAreaHeight;
	console.log(maxScroll);
	$(".msg_container_base").scrollTop(maxScroll);
}	
/* 다른 user로부터 온 message를 msg_container에 append한다. */ 
function appendMessage(msg, msgId) {
	msg= msg.replace(/(<([^>]+)>)/gi, "");
	console.log(msg);
	$(".msg_container_base").append('<div class="row msg_container base_receive">'
            +'<div class="col-md-2 col-xs-2 avatar">'
            +'<img src="upload/'+msgId+'/profile/'+msgId+'_profile.jpg?ver='+moment().format("HH:mm")+'" class="img-responsive">'
        +'</div>'
        +'<div class="col-md-10 col-xs-10">'
            +'<div class="messages msg_receive">'
                +'<p>'+msg+'</p>'
                +'<time datetime="2009-11-13T20:00">'+msgId+'• '+moment().format("HH:mm")+'</time>'
            +'</div>'
        +'</div>'
    +'</div>');
	var chatAreaHeight = $(".msg_container_base").height();
	var maxScroll = chatAreaHeight - $(".msg_container_base").height()  ;
	$(".msg_container_base").scrollTop(maxScroll);
}	

$(document).ready(function(){
	$('#btn-input').keypress(function(event){
		var keycode = (event.keyCode ? event.keyCode : event.which);
		/* enter 버튼 keyPress */
		if(keycode == '13'){
			send();	
		}
		/* event 전파 방지 */
		event.stopPropagation();
	});
	$('#btn-chat').click(
			function() { send(); }
			);
	$(document).ready(function() { connect(); });
	$('#exitBtn').click(function() { disconnect(); });
});
/* 채팅창 최소화 */
$(document).on('click', '.panel-heading span.icon_minim', function (e) {
    var $this = $(this);
    /* 이미 접힌 상태인 경우 다시 화면을 복구함 */
    if (!$this.hasClass('panel-collapsed')) {
        $this.parents('.panel').find('.panel-body').slideUp();
        $this.addClass('panel-collapsed');
        $this.removeClass('glyphicon-minus').addClass('glyphicon-plus');
    } else {
    	/* 이미 열린 상태인 경우 화면을 최소화함 */
        $this.parents('.panel').find('.panel-body').slideDown();
        $this.removeClass('panel-collapsed');
        $this.removeClass('glyphicon-plus').addClass('glyphicon-minus');
    }
});

$(document).on('focus', '.panel-footer input.chat_input', function (e) {
    var $this = $(this);
    if ($('#minim_chat_window').hasClass('panel-collapsed')) {
        $this.parents('.panel').find('.panel-body').slideDown();
        $('#minim_chat_window').removeClass('panel-collapsed');
        $('#minim_chat_window').removeClass('glyphicon-plus').addClass('glyphicon-minus');
    }
});

$(document).on('click', '.icon_close', function (e) {
    //$(this).parent().parent().parent().parent().remove();
    $( "#chat_window_1" ).parents('.dropup').removeClass('open');
    $("#chatBtn").css("display","block");
});

$(document).on('click','#chatBtn',function(e){
	msgArrived=0;
	$("#msg-arrived").text(msgArrived);
})



</script>
	</body>
</html>