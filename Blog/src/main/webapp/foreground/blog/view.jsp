
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!--百度编辑器的语法高亮  start -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/ueditor/third-party/SyntaxHighlighter/shCore.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/ueditor/third-party/SyntaxHighlighter/shCoreDefault.css">
<script type="text/javascript">
	SyntaxHighlighter.all();

	function showOtherComment() {
		$(".otherComment").show();
	}

	function loadimage() {
		document.getElementById("randImage").src = "${pageContext.request.contextPath}/image.jsp?"
				+ Math.random();
	}
	function submitData() {
		var content=$("#content").val();
		var imageCode=$("#imageCode").val();
		if(content==null || content==""){
			alert("请填写评论内容！");
		}else if(imageCode==null || imageCode==""){
			alert("请填写验证码！");
		}else{
			$.post("${pageContext.request.contextPath}/comment/save.do",{"content":content,"imageCode":imageCode,"blog.id":'${blog.id}'},function(result){
				if (result.success) {
					window.location.reload();
					alert("评论已经提交成功，等待审核通过后显示！");
				}else{
					alert("后台更新评论失败！");
				}
			},"json");
		}
		
	}
	
	
	
</script>

<div class="data_list">
	<div class="data_list_title">
		<img
			src="${pageContext.request.contextPath}/static/images/blog_show_icon.png" />
		博客内容
	</div>
	<div>
		<div class="blog_title" align="center">
			<h3>
				<strong>${blog.title }</strong>
			</h3>
		</div>
		<div class="blog_share">
			<div class="bshare-custom">
				<a title="分享到QQ空间" class="bshare-qzone"></a><a title="分享到新浪微博"
					class="bshare-sinaminiblog"></a><a title="分享到人人网"
					class="bshare-renren"></a><a title="分享到腾讯微博" class="bshare-qqmb"></a><a
					title="分享到网易微博" class="bshare-neteasemb"></a><a title="更多平台"
					class="bshare-more bshare-more-icon more-style-addthis"></a><span
					class="BSHARE_COUNT bshare-share-count">0</span>
			</div>
			<script type="text/javascript" charset="utf-8"
				src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script>
			<script type="text/javascript" charset="utf-8"
				src="http://static.bshare.cn/b/bshareC0.js"></script>
		</div>


		<div class="blog_info" align="center">
			发布时间：『
			<fmt:formatDate value="${blog.releaseDate }" type="date"
				pattern="yyyy-MM-dd HH:mm" />
			』&nbsp;&nbsp; 博客类别：${blog.blogType.typeName }&nbsp;&nbsp;阅读(${blog.clickHit })&nbsp;&nbsp;评论(${blog.replyHit })
		</div>
		<div class="blog_content">${blog.content }</div>

		<div class="blog_keyWord">
			<font><strong>关键字:</strong></font>
			<c:choose>
				<c:when test="${keyWord==null }">&nbsp;&nbsp;&nbsp;无</c:when>
				<c:otherwise>
					<c:forEach items="${keyWord }" var="word">
						&nbsp;&nbsp;<font size="4px"><a href="${pageContext.request.contextPath}/blog/q.html?q=${keyWord}" target="_blank">${word }</a></font>&nbsp;&nbsp;
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="blog_lastAndNextPage" style="padding-top: 20px;">
			${pageCode }</div>
	</div>
</div>
<div class="data_list">
	<div class="data_list_title">
		<img
			src="${pageContext.request.contextPath}/static/images/comment_icon.png" />
		评论
		<c:if test="${commentList.size()>10 }">
			<a href="javascript:showOtherComment()"
				style="float: right; padding-right: 40px;">显示所有评论</a>
		</c:if>
	</div>
	<div class="commentDatas">
		<c:choose>
			<c:when test="${commentList.size()==0 }">暂无评论！</c:when>
			<c:otherwise>
				<c:forEach items="${commentList }" var="comment" varStatus="status">
					<c:choose>
						<c:when test="${status.index<10 }">
							<div class="comment">
								<span><font>${status.index+1 }楼&nbsp;&nbsp;&nbsp;&nbsp;${comment.userIp }：</font>${comment.content }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[&nbsp;<fmt:formatDate
										value="${comment.commentDate }" type="date"
										pattern="yyyy-MM-dd HH:mm" />&nbsp;]</span>
							</div>
						</c:when>
						<c:otherwise>
							<div class="otherComment">
								<span><font>${status.index+1 }楼&nbsp;&nbsp;&nbsp;&nbsp;${comment.userIp }：</font>${comment.content }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[&nbsp;<fmt:formatDate
										value="${comment.commentDate }" type="date"
										pattern="yyyy-MM-dd HH:mm" />&nbsp;]</span>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:otherwise>
		</c:choose>

	</div>
</div>

<div class="data_list">
	<div class="data_list_title">
		<img src="/static/images/publish_comment_icon.png" /> 发表评论
	</div>
	<div class="publish_comment">
		<div>
			<textarea style="width: 100%" rows="3" id="content" name="content"
				placeholder="来说两句吧..."></textarea>
		</div>
		<div class="verCode">
			验证码：<input type="text" value="" name="imageCode" id="imageCode"
				size="10" onkeydown="if(event.keyCode==13)form1.submit()" />&nbsp;<img
				onclick="javascript:loadimage();" title="换一张试试" name="randImage"
				id="randImage" src="/image.jsp" width="60" height="20" border="1"
				align="absmiddle">
		</div>
		<div class="publishButton">
			<button class="btn btn-primary" type="button" onclick="submitData()">发表评论</button>
		</div>
	</div>
</div>





