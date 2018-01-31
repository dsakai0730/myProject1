<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" type="text/css" href="./css/style.css">
<title>FavBooks | User's Info</title>
</head>
<body>
	<header>
		<div id="main-title"><a href='<s:url action="GoHomeAction" />'>FavBooks</a></div>
		<div id="sub-title">好きな本でつながる</div>
		<div id="top-list">
		<ul>
			<li><s:property value="session.userName" />さん</li>
			<li><a href = '<s:url action = "GoHomeAction" />' >ホーム</a></li>
			<li><a href = '<s:url action = "MyPageAction" />' >マイページ</a></li>
			<li><a href = '<s:url action = "FriendPageAction" />' >フォロー</a></li>
			<li><a href = '<s:url action = "LogoutAction" />' >ログアウト</a></li>
		</ul>
		</div>
	</header>
	<div id="main">
		<div id="content">
			<p><s:property value="session.searchFriendName" />さんのページ</p>
		</div>
		<div id="content-btn">
			<a href='<s:url action="FriendPageAction" />' id="check-btn" >Back</a>
			<s:if test="session.followCheck == 'off'">
				<a id="follow-btn" href = '<s:url action = "FollowAction" />' >フォローする</a>
			</s:if>
			<s:if test="session.followCheck != 'off' ">
				<a id="follow-off-btn" href = '<s:url action = "FollowOffAction" />' >フォロー解除</a>
			</s:if>
		</div>
		<br>
		<p id="sub-content"><span><s:property value="session.searchFriendName" />&nbsp;さんのFavorite！リスト</span></p>
		
		<s:iterator value="session.friendReadDTOList" status="sta">
			<s:form action="MyCheckAction">
						<table id="book">
							<tbody>
							<tr>
								<td id="book-img">
									<img src="<s:property value="img" />" width="128">
								</td>
								<td id="book-info">
									<p id="book-title">タイトル:&nbsp;<s:property value="title"/></p>
											<p>著者:&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;<s:iterator value="author">
												<s:property />
											</s:iterator></p>
											<p>発刊日:&nbsp;&nbsp;<s:property value="publishedDate" /></p>
											説明:<div id="des"><s:property value="description"/></div>
									<br>
									<a id="check-btn" href='<s:url action="FrCheckAction"><s:param name="frCheckNum" value="#sta.index" /></s:url>' >check!</a>
								</td>
							</tr>
							</tbody>
						</table>
			</s:form>
		</s:iterator>
		<footer>copyright daichi sakai</footer>
	</div>
</body>
</html>