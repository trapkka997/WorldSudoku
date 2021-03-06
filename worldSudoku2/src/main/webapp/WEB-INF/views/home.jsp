<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sudoku</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="apple-touch-icon.png">


<link rel="stylesheet" href="./resources/css/fonticons.css">
<link rel="stylesheet" href="./resources/css/slider-pro.css">
<link rel="stylesheet" href="./resources/css/stylesheet.css">
<link rel="stylesheet" href="./resources/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">


<!--For Plugins external css-->
<link rel="stylesheet" href="./resources/css/plugins.css" />

<!--Theme custom css -->
<link rel="stylesheet" href="./resources/css/style.css">

<!--Theme Responsive css-->
<link rel="stylesheet" href="./resources/css/responsive.css" />

<script src="./resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>



<!--  해야되는게 1. 스도쿠 시간표 2. 다른거 못누르게ㅇㅇ -->
<style>
table {
	width: 600px;
	height: 600px;
	margin: auto;
	border-color: 2px solid red;
	empty-cells: show;
}

th {
	text-align: center justify;
	empty-cells: show;
	table-layout: fixed;
}

td {
	text-align: center justify;
	empty-cells: show;
	table-layout: fixed;
}

.col_4, .col_7, .col_1 {
	border-top: 1px solid red;
}

.col_9 {
	border-bottom: 1px solid red;
}

.cell_3, .cell_6, .cell_9, .cell_12, .cell_15, .cell_18, .cell_21,
	.cell_24, .cell_27, .cell_30, .cell_33, .cell_36, .cell_39, .cell_42,
	.cell_45, .cell_48, .cell_51, .cell_54, .cell_57, .cell_60, .cell_63,
	.cell_66, .cell_69, .cell_72, .cell_75, .cell_78, .cell_81 {
	border-right: 1px solid red;
}

.cell_1, .cell_10, .cell_19, .cell_28, .cell_37, .cell_46, .cell_55,
	.cell_64, .cell_73 {
	border-left: 1px solid red;
}

textarea:focus {
	outline: none;
}
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
var seconds = 0, 
	minutes = 0, 
 	hours = 0,
	t;
var difficulty = 0;
	var selectedCell = $('.table tr td');
	var anwserList =[
		[0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0]
	];
	var sudokuList = [
		[0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0]
	];
	var currList =[
		[0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0]
	];

	window.onload = function() {
		
		for(var i =0; i<9; i++){
			for(var j=0; j<9; j++){
				if(sudokuList[i][j] == 0){
					/* $('.cell_'+((9*i)+(j+1))).html('<input type=text>'); */
					$('.cell_'+((9*i)+(j+1))).html();
				}else{
					$('.cell_'+((9*i)+(j+1))).html(sudokuList[i][j]);
				}
			}
		}
		
		$("table tr td").click(function(){
			if($(this).html().match('strong') != null){
				
			}else{
				selectedCell.css('background-color','white');
				var txt = $(this).text();
				selectedCell = $(this);
				$(this).css('background-color', 'red');
			}
			
		});
		
		$("#oneBtn").click(function() {
			selectedCell.html('<span style="color:#DAA520">1</span>');
		});
		$("#twoBtn").click(function() {
			selectedCell.html('<span style="color:#DAA520">2</span>');
		});
		$("#thrBtn").click(function() {
			selectedCell.html('<span style="color:#DAA520">3</span>');
		});
		$("#fouBtn").click(function() {
			selectedCell.html('<span style="color:#DAA520">4</span>');
		});
		$("#fivBtn").click(function() {
			selectedCell.html('<span style="color:#DAA520">5</span>');
		});
		$("#sixBtn").click(function() {
			selectedCell.html('<span style="color:#DAA520">6</span>');
		});
		$("#sevBtn").click(function() {
			selectedCell.html('<span style="color:#DAA520">7</span>');
		});
		$("#eigBtn").click(function() {
			selectedCell.html('<span style="color:#DAA520">8</span>');
		});
		$("#ninBtn").click(function() {
			selectedCell.html('<span style="color:#DAA520">9</span>');
		});
		$("#cleanBtn").click(function() {
			selectedCell.html('');
		});
		
		
		//  쉬움 난이도
		$("#easy").on('click',function(){
			var h1 = document.getElementById('timer');
		    h1.textContent = "00:00:00";
		    seconds = 0; minutes = 0; hours = 0;
		    clearTimeout(t);
		    difficulty = 1;
			$.ajax({
			    url: 'easy',
			    type: 'GET',
			    success: function(data, status) {
			    	sudokuList = data[0];
			    	
			    	for(var i =0; i<9; i++){
						for(var j=0; j<9; j++){
							if(sudokuList[i][j] == 0){
								/* $('.cell_'+((9*i)+(j+1))).html('<input type=text>'); */
								$('.cell_'+((9*i)+(j+1))).html('');
							}else{
								$('.cell_'+((9*i)+(j+1))).html('<strong>'+sudokuList[i][j]+'</strong>'
										);
							}
						}
					}
			    	anwserList = data[1];
			    	console.log(anwserList);
			    	$('.sudoku_c tr').each(function(index) {
						var customerId = $(this).find("td").html(); 
					    console.log(customerId);
					});
			    	timer();
			    },
			    error: function(data, e1, e2) {
			    }
			})
		});
		
		// 보통 난이도
		$("#medium").on('click',function(){
			var h1 = document.getElementById('timer');
		    h1.textContent = "00:00:00";
		    seconds = 0; minutes = 0; hours = 0;
		    clearTimeout(t);
		    difficulty = 2;
			$.ajax({
			    url: 'medium',
			    type: 'GET',
			    success: function(data, status) {
			    	sudokuList = data[0];
			    	
			    	for(var i =0; i<9; i++){
						for(var j=0; j<9; j++){
							if(sudokuList[i][j] == 0){
								/* $('.cell_'+((9*i)+(j+1))).html('<input type=text>'); */
								$('.cell_'+((9*i)+(j+1))).html('');
							}else{
								$('.cell_'+((9*i)+(j+1))).html('<strong>'+sudokuList[i][j]+'</strong>'
										);
							}
						}
					}
			    	anwserList = data[1];
			    	console.log(anwserList);
			    	$('.sudoku_c tr').each(function(index) {
						var customerId = $(this).find("td").html(); 
					    console.log(customerId);
					});
			    	timer();
			    },
			    error: function(data, e1, e2) {
			    }
			})
		});
		
		//어려움 난이도
		$("#difficult").on('click',function(){
			var h1 = document.getElementById('timer');
		    h1.textContent = "00:00:00";
		    seconds = 0; minutes = 0; hours = 0;
		    clearTimeout(t);
		    difficulty = 3;
			$.ajax({
			    url: 'difficult',
			    type: 'GET',
			    success: function(data, status) {
			    	sudokuList = data[0];
			    	
			    	for(var i =0; i<9; i++){
						for(var j=0; j<9; j++){
							if(sudokuList[i][j] == 0){
								/* $('.cell_'+((9*i)+(j+1))).html('<input type=text>'); */
								$('.cell_'+((9*i)+(j+1))).html('');
							}else{
								$('.cell_'+((9*i)+(j+1))).html('<strong>'+sudokuList[i][j]+'</strong>'
										);
							}
						}
					}
			    	anwserList = data[1];
			    	console.log(anwserList);
			    	$('.sudoku_c tr').each(function(index) {
						var customerId = $(this).find("td").html(); 
					    console.log(customerId);
					});
			    	timer();
			    },
			    error: function(data, e1, e2) {
			    }
			})
		});
		
		// 난이도별 묶음 
		
		$('#answerBtn').on('click',function(){
			for(var i =0; i<9; i++){
				for(var j=0; j<9; j++){
					if(!$('.cell_'+((9*i)+(j+1))).text()){
						alert('빈 칸을 모두 채워주세요');
						return;
					}
					currList[i][j] = Number($('.cell_'+((9*i)+(j+1))).text());
				}
			}
			if(isEqual(anwserList, currList)){
				console.log(currList);
				console.log(anwserList);
				clearTimeout(t);
				alert('맞았습니다!!!!!  기록 : ' + $('#timer').text());
				$.ajax({
					method: 'post',
					url: 'succSudoku',
					data: {
						difficulty : difficulty,
						userRecord : $('#timer').text()
					},
					dataType: 'json',
					success: function(resp) {
						if(resp === 1){
						}else{
							alert('세션이 만료되었습니다!');
						}
					},
					error: function() {
						
					}
				});
				
			}else{
				console.log(currList);
				console.log(anwserList);
				alert('틀렸습니다...');
			}
		});
		
	}
	
	$(document.body).delegate('.sudoku_c', 'click', function() {
		 console.log("ddddd");
	});
	

	function isEqual(arr1, arr2)
	{
		for(var i=0; i<arr1.length; i++){
			for(var j =0; j<arr1.length; j++){
				if(arr1[i][j] != arr2[i][j]) return false;
			}
		}
		return true;
	}
	
	function add() {
		var h1 = document.getElementById('timer');
	    seconds++;
	    if (seconds >= 60) {
	        seconds = 0;
	        minutes++;
	        if (minutes >= 60) {
	            minutes = 0;
	            hours++;
	        }
	    }
	    
	    h1.textContent = (hours ? (hours > 9 ? hours : "0" + hours) : "00") + ":" + (minutes ? (minutes > 9 ? minutes : "0" + minutes) : "00") + ":" + (seconds > 9 ? seconds : "0" + seconds);

	    timer();
	}
	function timer() {
	    t = setTimeout(add, 1000);
	}
	
</script>


<script type="text/javascript">
	function loginBtn() {
		location.href = "loginForm";
	}

	function signupBtn() {
		location.href = "signupForm";
	}
	function userInfoBtn() {
		location.href = "userInfoForm";
	}
	function sudokuBtn() {
		location.href = "/sudoku/";
	}
	function rank() {
		location.href = "rankForm";
	}
	
	function leagueForm(){
		location.href = "leagueForm";
	}
</script>




</head>
<body data-spy="scroll" data-target=".navbar-collapse">
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

	<header id="main_menu" class="header navbar-fixed-top">
	<div class="main_menu_bg">
		<div class="container">
			<div class="row">
				<div class="nave_menu">
					<nav class="navbar navbar-default" id="navmenu">
					<div class="container-fluid">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1"
								aria-expanded="false">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<a class="navbar-brand" href="/sudoku/"> <img
								src="./resources/images/logo.png" />
							</a>
						</div>

						<!-- Collect the nav links, forms, and other content for toggling -->




						<c:if test="${not empty sessionScope.userId}">
							<div class="collapse navbar-collapse"
								id="bs-example-navbar-collapse-1">
								<ul class="nav navbar-nav navbar-right">
									<li><a onclick="userInfoBtn()">개인정보</a></li>
									<li><a href="logout">로그아웃</a></li>
									<li><a onclick="sudokuBtn()">스도쿠퍼즐하기</a></li>
									<li><a onclick="rank()">랭킹보기</a></li>
									<li><a onclick="leagueForm()">대회</a></li>
								</ul>
							</div>
						</c:if>

						<c:if test="${empty sessionScope.userId}">
							<div class="collapse navbar-collapse"
								id="bs-example-navbar-collapse-1">
								<ul class="nav navbar-nav navbar-right">
									<li><a onclick="loginBtn()">로그인</a></li>
									<li><a onclick="signupBtn()">회원가입</a></li>
								</ul>
							</div>
						</c:if>

					</div>
					</nav>
				</div>
			</div>

		</div>

	</div>
	</header>
	<!--End of header -->


	<!-- Team Section -->
	<section id="team" class="team colorsbg sections">
	<div class="container">
		<div class="row">
			<div class="main_team_area">
				<div class="head_title text-center">
					<h1>best team</h1>
				</div>
				<!-- End of head title -->

				<div class="main_team text-center" style="align-content:">

					<a href="/sudoku"><h2>스도쿠퍼즐 만들기</h2></a>
					<div class="main_contact sections" style="align-items: center;">
						<table class="sudoku_c" border="1">
							<tbody style="background: white;">
								<tr class="col_1">
									<td class="cell_1"></td>
									<td class="cell_2"></td>
									<td class="cell_3"></td>
									<td class="cell_4"></td>
									<td class="cell_5"></td>
									<td class="cell_6"></td>
									<td class="cell_7"></td>
									<td class="cell_8"></td>
									<td class="cell_9"></td>
								</tr>
								<tr class="col_2">
									<td class="cell_10"></td>
									<td class="cell_11"></td>
									<td class="cell_12"></td>
									<td class="cell_13"></td>
									<td class="cell_14"></td>
									<td class="cell_15"></td>
									<td class="cell_16"></td>
									<td class="cell_17"></td>
									<td class="cell_18"></td>
								</tr>
								<tr class="col_3">
									<td class="cell_19"></td>
									<td class="cell_20"></td>
									<td class="cell_21"></td>
									<td class="cell_22"></td>
									<td class="cell_23"></td>
									<td class="cell_24"></td>
									<td class="cell_25"></td>
									<td class="cell_26"></td>
									<td class="cell_27"></td>
								</tr>
								<tr class="col_4">
									<td class="cell_28"></td>
									<td class="cell_29"></td>
									<td class="cell_30"></td>
									<td class="cell_31"></td>
									<td class="cell_32"></td>
									<td class="cell_33"></td>
									<td class="cell_34"></td>
									<td class="cell_35"></td>
									<td class="cell_36"></td>
								</tr>
								<tr class="col_5">
									<td class="cell_37"></td>
									<td class="cell_38"></td>
									<td class="cell_39"></td>
									<td class="cell_40"></td>
									<td class="cell_41"></td>
									<td class="cell_42"></td>
									<td class="cell_43"></td>
									<td class="cell_44"></td>
									<td class="cell_45"></td>
								</tr>
								<tr class="col_6">
									<td class="cell_46"></td>
									<td class="cell_47"></td>
									<td class="cell_48"></td>
									<td class="cell_49"></td>
									<td class="cell_50"></td>
									<td class="cell_51"></td>
									<td class="cell_52"></td>
									<td class="cell_53"></td>
									<td class="cell_54"></td>
								</tr>
								<tr class="col_7">
									<td class="cell_55"></td>
									<td class="cell_56"></td>
									<td class="cell_57"></td>
									<td class="cell_58"></td>
									<td class="cell_59"></td>
									<td class="cell_60"></td>
									<td class="cell_61"></td>
									<td class="cell_62"></td>
									<td class="cell_63"></td>
								</tr>
								<tr class="col_8">
									<td class="cell_64"></td>
									<td class="cell_65"></td>
									<td class="cell_66"></td>
									<td class="cell_67"></td>
									<td class="cell_68"></td>
									<td class="cell_69"></td>
									<td class="cell_70"></td>
									<td class="cell_71"></td>
									<td class="cell_72"></td>
								</tr>
								<tr class="col_9">
									<td class="cell_73"></td>
									<td class="cell_74"></td>
									<td class="cell_75"></td>
									<td class="cell_76"></td>
									<td class="cell_77"></td>
									<td class="cell_78"></td>
									<td class="cell_79"></td>
									<td class="cell_80"></td>
									<td class="cell_81"></td>
								</tr>
							</tbody>

						</table>
					</div>

					<div>
						<input type="button" id="oneBtn" value="1"> <input
							type="button" id="twoBtn" value="2"> <input type="button"
							id="thrBtn" value="3"> <input type="button" id="fouBtn"
							value="4"> <input type="button" id="fivBtn" value="5">
						<input type="button" id="sixBtn" value="6"> <input
							type="button" id="sevBtn" value="7"> <input type="button"
							id="eigBtn" value="8"> <input type="button" id="ninBtn"
							value="9"> <input type="button" id="cleanBtn"
							value="clean">
					</div>
					<div>
						<input type="button" id="easy" value="쉬움"> <input
							type="button" id="medium" value="일반"> <input
							type="button" id="difficult" value="어려움">
					</div>
					<div>
						<input type="button" value="정답체크" id="answerBtn">
						<h1 id="timer">
							<time>00:00:00</time>
						</h1>
					</div>
				</div>
			</div>
		</div>
		<!-- End of row -->
	</div>
	<!-- End of Contaier --> </section>
	<!-- End of portfolio Section -->




	<!-- footer Section -->
	<footer id="footer" class="footer">
	<div class="container">
		<div class="main_footer">
			<div class="row">
				<div class="col-sm-12">
					<div class="copyright_text text-center">
						<p class=" wow fadeInRight" data-wow-duration="1s">
							made by hangyutae, trapkka997@gmail.com </a>2018. All Rights Reserved
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End of container --> </footer>
	<!-- End of footer -->



	<!-- START SCROLL TO TOP  -->

	<div class="scrollup">
		<a href="#"><i class="fa fa-chevron-up"></i></a>
	</div>

	<script src="assets/js/vendor/jquery-1.11.2.min.js"></script>
	<script src="assets/js/vendor/bootstrap.min.js"></script>

	<script src="assets/js/jquery.easing.1.3.js"></script>
	<script src="assets/js/masonry/masonry.min.js"></script>
	<script type="text/javascript">
            $('.mixcontent').masonry();
        </script>

	<script src="assets/js/jquery.sliderPro.min.js"></script>
	<script type="text/javascript">
            $(document).ready(function ($) {
                $('#example3').sliderPro({
                    width: 960,
                    height: 200,
                    fade: true,
                    arrows: false,
                    buttons: true,
                    fullScreen: false,
                    shuffle: true,
                    smallSize: 500,
                    mediumSize: 1000,
                    largeSize: 3000,
                    thumbnailArrows: true,
                    autoplay: false,
                    thumbnailsContainerSize: 960

                });
            });
        </script>
	<script src="./resources/js/plugins.js"></script>
	<script src="./resources/js/main.js"></script>

</body>
</html>
