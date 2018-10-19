
<% 
if (request.getSession() != null)
{
	HttpSession ses = request.getSession();
	if (ses.getAttribute("userRole").toString().compareTo("admin") == 0)
	{ %>
	<%@ include file="../translation.jsp" %>
	<li>
	 	<a id="adminList" href="javascript:;"><div class='menuButton'><fmt:message key="generic.text.admin" /></div></a>
		<ul id="theAdminList" style="display: none;">
			<li>
				<a id="configurationList" href="javascript:;"><fmt:message key="generic.text.configuration" /></a>
				<ul id="theConfigurationList" style="display: none;">
					<li><a id="aboutShepherdLink" href="javascript:;"><fmt:message key="generic.text.aboutSecShep" /></a></li>
					<li><a id="cheatSheetLink" href="javascript:;"><fmt:message key="index.link.admin.cheatSheet.manage" /></a></li>
					<li><a id="configureFeedbackLink" href="javascript:;"><fmt:message key="index.link.admin.config.feedback" /></a></li>
					<li><a id="registrationLink" href="javascript:;"><fmt:message key="index.link.admin.config.openClose" /></a></li>
					<li><a id="scoreboardLink" href="javascript:;"><fmt:message key="index.link.admin.config.scoreboard" /></a></li>
					<li><a id="setCoreDatabaseLink" href="javascript:;"><fmt:message key="index.link.admin.config.coreDb" /></a></li>
				</ul>
			</li>
			<li>
				<a id="moduleManagementList" href="javascript:;"><fmt:message key="index.link.admin.moduleManage" /></a>
				<ul id="theModuleManagementList" style="display: none;">
					<li><a id="levelLayoutLink" href="javascript:;"><fmt:message key="index.link.admin.config.change" /></a></li>
					<li><a id="moduleBlockLink" href="javascript:;"><fmt:message key="index.link.admin.moduleManage.block" /></a></li>
					<li><a id="setModuleStatusLink" href="javascript:;"><fmt:message key="index.link.admin.moduleManage.openClose" /></a></li>
					<li><a id="openCloseByCategory" href="javascript:;"><fmt:message key="index.link.admin.moduleManage.openCloseCategory" /></a></li>
					<li><a id="feedbackLink" href="javascript:;"><fmt:message key="index.link.admin.moduleManage.feedback" /></a></li>
					<li><a id="progressLink" href="javascript:;"><fmt:message key="index.link.admin.moduleManage.progress" /></a></li>
				</ul>
			</li>
			<li>
				<a id="userManagementList" href="javascript:;"><fmt:message key="index.link.admin.userMange" /></a>
				<ul id="theUserManagementList" style="display: none;">
					<li><a id="addPlayersLink" href="javascript:;"><fmt:message key="index.link.admin.userMange.addPlayer" /></a></li>
					<li><a id="deletePlayersLink" href="javascript:;"><fmt:message key="index.link.admin.userMange.deletePlayer" /></a></li>
					<li><a id="updatePlayerScoreLink" href="javascript:;"><fmt:message key="index.link.admin.userMange.addPoints" /></a></li>
					<li><a id="assignPlayersLink" href="javascript:;"><fmt:message key="index.link.admin.userMange.assignPlayer" /></a></li>
					<li><a id="createNewClassLink" href="javascript:;"><fmt:message key="index.link.admin.userMange.createClass" /></a></li>
					<li><a id="createNewAdminLink" href="javascript:;"><fmt:message key="index.link.admin.userMange.createAdmin" /></a></li>
					<li><a id="changePlayerPasswordLink" href="javascript:;"><fmt:message key="index.link.admin.userMange.resetPass" /></a></li>
					<li><a id="setDefaultClassForRegistrationLink" href="javascript:;"><fmt:message key="index.link.admin.userMange.setDefaultPlayerClass" /></a></li>
					<li><a id="suspendPlayerLink" href="javascript:;"><fmt:message key="index.link.admin.userMange.suspendPlayer" /></a></li>
					<li><a id="unSuspendPlayerLink" href="javascript:;"><fmt:message key="index.link.admin.userMange.unsuspendPlayer" /></a></li>
					<li><a id="upgradePlayersLink" href="javascript:;"><fmt:message key="index.link.admin.userMange.upgradeToAdmin" /></a></li>
					<li><a id="downgradeAdminLink" href="javascript:;"><fmt:message key="index.link.admin.userMange.downgradeToPlayer" /></a></li>
				</ul>
			</li>
		</ul>
	</li>
	<script src="js/adminToggle.js"></script>
	<script>
	function getCookie(name) {
		  var value = "; " + document.cookie;
		  var parts = value.split("; " + name + "=");
		  if (parts.length == 2) return parts.pop().split(";").shift();
		}
	
	var csrfJsToken = getCookie('token');
	console.log("Building Admin Menu with token: " + csrfJsToken);

	$("#updatePlayerScoreLink").click(function(){
		$("#submitResult").slideUp("fast", function(){
			$("#contentDiv").hide("fast", function(){
				$("#contentDiv").load("admin/userManagement/givePoints.jsp?csrfToken=" + csrfJsToken, function(response, status, xhr) {
				  if (status == "error") {
					var msg = "<fmt:message key="generic.text.sorryError" />: ";
					$("#contentDiv").html("<p>" + msg + xhr.status + " " + xhr.statusText + "</p>");
				  }
				  $("#contentDiv").show("fast");
				});
			});	
		});
	});

	$("#suspendPlayerLink").click(function(){
		$("#submitResult").slideUp("fast", function(){
			$("#contentDiv").hide("fast", function(){
				$("#contentDiv").load("admin/userManagement/suspendUser.jsp?csrfToken=" + csrfJsToken, function(response, status, xhr) {
				  if (status == "error") {
					var msg = "<fmt:message key="generic.text.sorryError" />: ";
					$("#contentDiv").html("<p>" + msg + xhr.status + " " + xhr.statusText + "</p>");
				  }
				  $("#contentDiv").show("fast");
				});
			});	
		});
	});

	$("#unSuspendPlayerLink").click(function(){
		$("#submitResult").slideUp("fast", function(){
			$("#contentDiv").hide("fast", function(){
				$("#contentDiv").load("admin/userManagement/unSuspendUser.jsp?csrfToken=" + csrfJsToken, function(response, status, xhr) {
				  if (status == "error") {
					var msg = "<fmt:message key="generic.text.sorryError" />: ";
					$("#contentDiv").html("<p>" + msg + xhr.status + " " + xhr.statusText + "</p>");
				  }
				  $("#contentDiv").show("fast");
				});
			});	
		});
	});

	$("#changePlayerPasswordLink").click(function(){
		$("#submitResult").slideUp("fast", function(){
			$("#contentDiv").hide("fast", function(){
				$("#contentDiv").load("admin/userManagement/changeUserPassword.jsp?csrfToken=" + csrfJsToken, function(response, status, xhr) {
				  if (status == "error") {
					var msg = "<fmt:message key="generic.text.sorryError" />: ";
					$("#contentDiv").html("<p>" + msg + xhr.status + " " + xhr.statusText + "</p>");
				  }
				  $("#contentDiv").show("fast");
				});
			});	
		});
	});

	$("#createNewAdminLink").click(function(){
		$("#submitResult").slideUp("fast", function(){
			$("#contentDiv").hide("fast", function(){
				$("#contentDiv").load("admin/userManagement/createNewAdmin.jsp?csrfToken=" + csrfJsToken, function(response, status, xhr) {
				  if (status == "error") {
					var msg = "<fmt:message key="generic.text.sorryError" />: ";
					$("#contentDiv").html("<p>" + msg + xhr.status + " " + xhr.statusText + "</p>");
				  }
				  $("#contentDiv").show("fast");
				});
			});	
		});
	});

	$("#createNewClassLink").click(function(){
		$("#submitResult").slideUp("fast", function(){
			$("#contentDiv").hide("fast", function(){
				$("#contentDiv").load("admin/userManagement/createNewClass.jsp?csrfToken=" + csrfJsToken, function(response, status, xhr) {
				  if (status == "error") {
					var msg = "<fmt:message key="generic.text.sorryError" />: ";
					$("#contentDiv").html("<p>" + msg + xhr.status + " " + xhr.statusText + "</p>");
				  }
				  $("#contentDiv").show("fast");
				});
			});	
		});
	});

	$("#addPlayersLink").click(function(){
		$("#submitResult").slideUp("fast", function(){
			$("#contentDiv").hide("fast", function(){
				$("#contentDiv").load("admin/userManagement/addPlayers.jsp?csrfToken=" + csrfJsToken, function(response, status, xhr) {
				  if (status == "error") {
					var msg = "<fmt:message key="generic.text.sorryError" />: ";
					$("#contentDiv").html("<p>" + msg + xhr.status + " " + xhr.statusText + "</p>");
				  }
				  $("#contentDiv").show("fast");
				});
			});	
		});
	});
	
	$("#deletePlayersLink").click(function(){
	   $("#submitResult").slideUp("fast", function(){
	       $("#contentDiv").hide("fast", function(){
	           $("#contentDiv").load("admin/userManagement/deletePlayers.jsp?csrfToken=" + csrfJsToken, function(response, status, xhr) {
	             if (status == "error") {
	                   var msg = "<fmt:message key="generic.text.sorryError" />: ";
	                   $("#contentDiv").html("<p" + msg + xhr.status + " " + xhr.statusText + "</p");
	             }
	             $("#contentDiv").show("fast");
	           });
	       });
	   });
	});

	$("#assignPlayersLink").click(function(){
		$("#submitResult").slideUp("fast", function(){
			$("#contentDiv").hide("fast", function(){
				$("#contentDiv").load("admin/userManagement/assignPlayers.jsp?csrfToken=" + csrfJsToken, function(response, status, xhr) {
				  if (status == "error") {
					var msg = "<fmt:message key="generic.text.sorryError" />: ";
					$("#contentDiv").html("<p>" + msg + xhr.status + " " + xhr.statusText + "</p>");
				  }
				  $("#contentDiv").show("fast");
				});
			});	
		});
	});

	$("#setDefaultClassForRegistrationLink").click(function(){
		$("#submitResult").slideUp("fast", function(){
			$("#contentDiv").hide("fast", function(){
				$("#contentDiv").load("admin/userManagement/setDefaultClassForRegistration.jsp?csrfToken=" + csrfJsToken, function(response, status, xhr) {
				  if (status == "error") {
					var msg = "<fmt:message key="generic.text.sorryError" />: ";
					$("#contentDiv").html("<p>" + msg + xhr.status + " " + xhr.statusText + "</p>");
				  }
				  $("#contentDiv").show("fast");
				});
			});	
		});
	});

	$("#upgradePlayersLink").click(function(){
		$("#submitResult").slideUp("fast", function(){
			$("#contentDiv").hide("fast", function(){
				$("#contentDiv").load("admin/userManagement/upgradePlayers.jsp?csrfToken=" + csrfJsToken, function(response, status, xhr) {
				  if (status == "error") {
					var msg = "<fmt:message key="generic.text.sorryError" />: ";
					$("#contentDiv").html("<p>" + msg + xhr.status + " " + xhr.statusText + "</p>");
				  }
				  $("#contentDiv").show("fast");
				});
			});	
		});
	});
	
	$("#downgradeAdminLink").click(function(){
		$("#submitResult").slideUp("fast", function(){
			$("#contentDiv").hide("fast", function(){
				$("#contentDiv").load("admin/userManagement/downgradeAdmins.jsp?csrfToken=" + csrfJsToken, function(response, status, xhr) {
				  if (status == "error") {
					var msg = "<fmt:message key="generic.text.sorryError" />: ";
					$("#contentDiv").html("<p>" + msg + xhr.status + " " + xhr.statusText + "</p>");
				  }
				  $("#contentDiv").show("fast");
				});
			});	
		});
	});			

	$("#feedbackLink").click(function(){
		$("#submitResult").slideUp("fast", function(){
			$("#contentDiv").hide("fast", function(){
				$("#contentDiv").load("admin/moduleManagement/feedback.jsp?csrfToken=" + csrfJsToken, function(response, status, xhr) {
				  if (status == "error") {
					var msg = "<fmt:message key="generic.text.sorryError" />: ";
					$("#contentDiv").html("<p>" + msg + xhr.status + " " + xhr.statusText + "</p>");
				  }
				  $("#contentDiv").show("fast");
				});
			});	
		});
	});

	$("#setModuleStatusLink").click(function(){
		$("#submitResult").slideUp("fast", function(){
			$("#contentDiv").hide("fast", function(){
				$("#contentDiv").load("admin/moduleManagement/setStatus.jsp?csrfToken=" + csrfJsToken, function(response, status, xhr) {
				  if (status == "error") {
					var msg = "<fmt:message key="generic.text.sorryError" />: ";
					$("#contentDiv").html("<p>" + msg + xhr.status + " " + xhr.statusText + "</p>");
				  }
				  $("#contentDiv").show("fast");
				});
			});	
		});
	});

	$("#openCloseByCategory").click(function(){
		$("#submitResult").slideUp("fast", function(){
			$("#contentDiv").hide("fast", function(){
				$("#contentDiv").load("admin/moduleManagement/openCloseByCategory.jsp?csrfToken=" + csrfJsToken, function(response, status, xhr) {
				  if (status == "error") {
					var msg = "<fmt:message key="generic.text.sorryError" />: ";
					$("#contentDiv").html("<p>" + msg + xhr.status + " " + xhr.statusText + "</p>");
				  }
				  $("#contentDiv").show("fast");
				});
			});
		});	
	});

	$("#registrationLink").click(function(){
		$("#submitResult").slideUp("fast", function(){
			$("#contentDiv").hide("fast", function(){
				$("#contentDiv").load("admin/config/updateRegistration.jsp?csrfToken=" + csrfJsToken, function(response, status, xhr) {
				  if (status == "error") {
					var msg = "<fmt:message key="generic.text.sorryError" />: ";
					$("#contentDiv").html("<p>" + msg + xhr.status + " " + xhr.statusText + "</p>");
				  }
				  $("#contentDiv").show("fast");
				});
			});	
		});
	});

	$("#progressLink").click(function(){
		$("#submitResult").slideUp("fast", function(){
			$("#contentDiv").hide("fast", function(){
				$("#contentDiv").load("admin/moduleManagement/classProgress.jsp?csrfToken=" + csrfJsToken, function(response, status, xhr) {
				  if (status == "error") {
					var msg = "<fmt:message key="generic.text.sorryError" />: ";
					$("#contentDiv").html("<p>" + msg + xhr.status + " " + xhr.statusText + "</p>");
				  }
				  $("#contentDiv").show("fast");
				});
			});	
		});
	});

	$("#scoreboardLink").click(function(){
		$("#submitResult").slideUp("fast", function(){
			$("#contentDiv").hide("fast", function(){
				$("#contentDiv").load("admin/config/scoreboard.jsp?csrfToken=" + csrfJsToken, function(response, status, xhr) {
				  if (status == "error") {
					var msg = "<fmt:message key="generic.text.sorryError" />: ";
					$("#contentDiv").html("<p>" + msg + xhr.status + " " + xhr.statusText + "</p>");
				  }
				  $("#contentDiv").show("fast");
				});
			});	
		});
	});

	$("#moduleBlockLink").click(function(){
		$("#submitResult").slideUp("fast", function(){
			$("#contentDiv").hide("fast", function(){
				$("#contentDiv").load("admin/moduleManagement/moduleBlock.jsp?csrfToken=" + csrfJsToken, function(response, status, xhr) {
				  if (status == "error") {
					var msg = "<fmt:message key="generic.text.sorryError" />: ";
					$("#contentDiv").html("<p>" + msg + xhr.status + " " + xhr.statusText + "</p>");
				  }
				  $("#contentDiv").show("fast");
				});
			});	
		});
	});

	$("#setCoreDatabaseLink").click(function(){
		$("#submitResult").slideUp("fast", function(){
			$("#contentDiv").hide("fast", function(){
				$("#contentDiv").load("admin/config/setCoreDatabase.jsp?csrfToken=" + csrfJsToken, function(response, status, xhr) {
				  if (status == "error") {
					var msg = "<fmt:message key="generic.text.sorryError" />: ";
					$("#contentDiv").html("<p>" + msg + xhr.status + " " + xhr.statusText + "</p>");
				  }
				  $("#contentDiv").show("fast");
				});
			});	
		});
	});

	$("#configureFeedbackLink").click(function(){
			$("#submitResult").slideUp("fast", function(){
			$("#contentDiv").hide("fast", function(){
				$("#contentDiv").load("admin/config/configFeedback.jsp?csrfToken=" + csrfJsToken, function(response, status, xhr) {
				  if (status == "error") {
					var msg = "<fmt:message key="generic.text.sorryError" />: ";
					$("#contentDiv").html("<p>" + msg + xhr.status + " " + xhr.statusText + "</p>");
				  }
				  $("#contentDiv").show("fast");
				});
			});
		});	
	});
	
	$("#aboutShepherdLink").click(function(){
		$("#submitResult").slideUp("fast", function(){
			$("#contentDiv").hide("fast", function(){
				$("#contentDiv").load("admin/config/aboutShepherd.jsp?csrfToken=" + csrfJsToken, function(response, status, xhr) {
				  if (status == "error") {
					var msg = "<fmt:message key="generic.text.sorryError" />: ";
					$("#contentDiv").html("<p>" + msg + xhr.status + " " + xhr.statusText + "</p>");
				  }
				  $("#contentDiv").show("fast");
				});
			});
		});	
	});
	
	$("#cheatSheetLink").click(function(){
		$("#submitResult").slideUp("fast", function(){
			$("#contentDiv").hide("fast", function(){
				$("#contentDiv").load("admin/config/configCheats.jsp?csrfToken=" + csrfJsToken, function(response, status, xhr) {
				  if (status == "error") {
					var msg = "<fmt:message key="generic.text.sorryError" />: ";
					$("#contentDiv").html("<p>" + msg + xhr.status + " " + xhr.statusText + "</p>");
				  }
				  $("#contentDiv").show("fast");
				});
			});
		});	
	});
	
	$("#levelLayoutLink").click(function(){
		$("#submitResult").slideUp("fast", function(){
			$("#contentDiv").hide("fast", function(){
				$("#contentDiv").load("admin/moduleManagement/changeLevelLayout.jsp?csrfToken=" + csrfJsToken, function(response, status, xhr) {
				  if (status == "error") {
					var msg = "<fmt:message key="generic.text.sorryError" />: ";
					$("#contentDiv").html("<p>" + msg + xhr.status + " " + xhr.statusText + "</p>");
				  }
				  $("#contentDiv").show("fast");
				});
			});
		});	
	});
	</script>
<% } 
}
%>