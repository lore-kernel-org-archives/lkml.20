Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7424526A1AC;
	Sat, 10 Oct 2026 01:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596278; cv=none; b=RXL55dO548rkGhQ/dKbxLHLJc/4bleKrD46vCL76NUDa73p0fTkD+Vwdvd9gcw7nbDzlRkOPrCGRGNRkY5wnYfItycLRjdHBOKyme2sTUUy+YTUGUVNzxRicHQCwWqMsOeZ+lp0dp8a7/s+bBcohmtU1Q6JCpYo+GINv/SGMIp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596278; c=relaxed/simple;
	bh=KpIWCwsltQQMw5KpQgzg1L+nCdWsKvgfgwoJ+9uwvv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j9d2+LnOaBWjszSJbSYBkfnn9BKCTqqOVJ0ZfmyuqrJ5y0HPyPEhTuq+DLX5lrnscyunWJy9+EnEUVxcveQMVkH8DSg5yzvWCjpbTsfOU4V3CRoX42hTgQQOhw0SlpzoVteREkMC4CZdVXc6BQS8/sDsYKqRuHE8fgtqzxRhDjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZexH+pCs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZexH+pCs"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 254EAC2BCFC;
	Sat, 10 Oct 2026 01:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791596278;
	bh=KpIWCwsltQQMw5KpQgzg1L+nCdWsKvgfgwoJ+9uwvv8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZexH+pCsBk62rmTGcXzadvODJWk+HVGbLG6BXonR0pNVANlCv4t9w1hiMp6mm/wKB
	 jzLGYSvvuBsuK3wFq/Y1OqDJXpkYbbXqjazeYx054pEUoftlUdmjokfD78EjL/kSpJ
	 BCWnR52A+Y2vrkVZQzGu8s53oUtOJdlGJegn5MeufNBvoR9byi14ugBrlOvH1wqMZr
	 0KR9HzFZBVzhTSVFfwa9SnSOjCob1YG38CDodJbfNiR+MLIuTqBYtqnIZ843aizcQ5
	 2Cuz5nOMSPtFrfMQEYkX2uskLLmDb/hqOm1hbfCo5X7KkpwY2K+Q+AhZWnjhVhK+VM
	 SSnUwFJpyDqDQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C44CA9EBB;
	Sat, 10 Oct 2026 01:37:58 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Sat, 10 Oct 2026 01:37:38 +0000
Subject: [PATCH v2 2/2] usb: typec: tcpm: Allow configuring tSenderResponse
 via fwnode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-tcpm-sender-response-time-v2-2-67ea364a21d7@google.com>
References: <20261010-tcpm-sender-response-time-v2-0-67ea364a21d7@google.com>
In-Reply-To: <20261010-tcpm-sender-response-time-v2-0-67ea364a21d7@google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, RD Babiera <rdbabiera@google.com>, 
 Kyle Tso <kyletso@google.com>, Amit Sunil Dhamne <amitsd@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791596277; l=6747;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=J+IIiMdzld+kdjQZhEZSnJlXVF3ZcB7U6ACRMnwPORw=;
 b=IuSRKea65JXEzUAlXIU1VZFLnkQZ/1okaHqkZrJ0E1/NIIKSDWvqNcmWuGaSkL9GMig9W1SZS
 57aI9S7lW7FBruEqaUuFXHL+nU5yOCxDG059ZqCkiKGmEoz7oHNI8LM
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
Reply-To: amitsd@google.com

From: Amit Sunil Dhamne <amitsd@google.com>

The USB PD specification defines a range of values for tSenderResponse.
TCPM currently uses a fixed, relaxed value of 60 ms
(PD_T_SENDER_RESPONSE), which may not suit all platforms.

Allow platforms to specify their own tSenderResponse deadline through
the "sender-response-time-ms" fwnode property. Platforms that do not
set the property keep the existing 60 ms default.

Assisted-by: LLM
Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 2d6b14aa20856..9f98c87957b1d 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -399,12 +399,14 @@ struct pd_revision_info {
  * @sink_wait_cap_time: Deadline (in ms) for tTypeCSinkWaitCap timer
  * @ps_src_wait_off_time: Deadline (in ms) for tPSSourceOff timer
  * @cc_debounce_time: Deadline (in ms) for tCCDebounce timer
+ * @sender_response_time: Deadline (in ms) for tSenderResponse timer
  */
 struct pd_timings {
 	u32 sink_wait_cap_time;
 	u32 ps_src_off_time;
 	u32 cc_debounce_time;
 	u32 snk_bc12_cmpletion_time;
+	u32 sender_response_time;
 };
 
 /* Convert microwatt to watt */
@@ -4316,7 +4318,7 @@ static bool tcpm_send_queued_message(struct tcpm_port *port)
 			} else if (port->pwr_role == TYPEC_SOURCE) {
 				tcpm_ams_finish(port);
 				tcpm_set_state(port, HARD_RESET_SEND,
-					       PD_T_SENDER_RESPONSE);
+					       port->timings.sender_response_time);
 			} else {
 				tcpm_ams_finish(port);
 			}
@@ -5549,7 +5551,7 @@ static void run_state_machine(struct tcpm_port *port)
 			port->caps_count = 0;
 			port->pd_capable = true;
 			tcpm_set_state_cond(port, SRC_SEND_CAPABILITIES_TIMEOUT,
-					    PD_T_SENDER_RESPONSE);
+					    port->timings.sender_response_time);
 		}
 		break;
 	case SRC_SEND_CAPABILITIES_TIMEOUT:
@@ -5896,7 +5898,7 @@ static void run_state_machine(struct tcpm_port *port)
 			tcpm_set_state(port, SNK_WAIT_CAPABILITIES, 0);
 		} else {
 			tcpm_set_state_cond(port, hard_reset_state(port),
-					    PD_T_SENDER_RESPONSE);
+					    port->timings.sender_response_time);
 		}
 		break;
 	case SNK_NEGOTIATE_PPS_CAPABILITIES:
@@ -5921,7 +5923,7 @@ static void run_state_machine(struct tcpm_port *port)
 				tcpm_set_state(port, SNK_READY, 0);
 		} else {
 			tcpm_set_state_cond(port, hard_reset_state(port),
-					    PD_T_SENDER_RESPONSE);
+					    port->timings.sender_response_time);
 		}
 		break;
 	case SNK_TRANSITION_SINK:
@@ -6208,7 +6210,8 @@ static void run_state_machine(struct tcpm_port *port)
 			port->message_id_prime = 0;
 			port->rx_msgid_prime = -1;
 			tcpm_pd_send_control(port, PD_CTRL_SOFT_RESET, TCPC_TX_SOP_PRIME);
-			tcpm_set_state_cond(port, ready_state(port), PD_T_SENDER_RESPONSE);
+			tcpm_set_state_cond(port, ready_state(port),
+					    port->timings.sender_response_time);
 		} else {
 			port->message_id = 0;
 			port->rx_msgid = -1;
@@ -6218,7 +6221,7 @@ static void run_state_machine(struct tcpm_port *port)
 				tcpm_set_state_cond(port, hard_reset_state(port), 0);
 			else
 				tcpm_set_state_cond(port, hard_reset_state(port),
-						    PD_T_SENDER_RESPONSE);
+						    port->timings.sender_response_time);
 		}
 		break;
 
@@ -6226,7 +6229,7 @@ static void run_state_machine(struct tcpm_port *port)
 	case DR_SWAP_SEND:
 		tcpm_pd_send_control(port, PD_CTRL_DR_SWAP, TCPC_TX_SOP);
 		tcpm_set_state_cond(port, DR_SWAP_SEND_TIMEOUT,
-				    PD_T_SENDER_RESPONSE);
+				    port->timings.sender_response_time);
 		break;
 	case DR_SWAP_ACCEPT:
 		tcpm_pd_send_control(port, PD_CTRL_ACCEPT, TCPC_TX_SOP);
@@ -6256,7 +6259,7 @@ static void run_state_machine(struct tcpm_port *port)
 			tcpm_set_state(port, ERROR_RECOVERY, 0);
 			break;
 		}
-		tcpm_set_state_cond(port, FR_SWAP_SEND_TIMEOUT, PD_T_SENDER_RESPONSE);
+		tcpm_set_state_cond(port, FR_SWAP_SEND_TIMEOUT, port->timings.sender_response_time);
 		break;
 	case FR_SWAP_SEND_TIMEOUT:
 		tcpm_set_state(port, ERROR_RECOVERY, 0);
@@ -6288,7 +6291,7 @@ static void run_state_machine(struct tcpm_port *port)
 	case PR_SWAP_SEND:
 		tcpm_pd_send_control(port, PD_CTRL_PR_SWAP, TCPC_TX_SOP);
 		tcpm_set_state_cond(port, PR_SWAP_SEND_TIMEOUT,
-				    PD_T_SENDER_RESPONSE);
+				    port->timings.sender_response_time);
 		break;
 	case PR_SWAP_SEND_TIMEOUT:
 		tcpm_swap_complete(port, -ETIMEDOUT);
@@ -6385,7 +6388,7 @@ static void run_state_machine(struct tcpm_port *port)
 	case VCONN_SWAP_SEND:
 		tcpm_pd_send_control(port, PD_CTRL_VCONN_SWAP, TCPC_TX_SOP);
 		tcpm_set_state(port, VCONN_SWAP_SEND_TIMEOUT,
-			       PD_T_SENDER_RESPONSE);
+			       port->timings.sender_response_time);
 		break;
 	case VCONN_SWAP_SEND_TIMEOUT:
 		tcpm_swap_complete(port, -ETIMEDOUT);
@@ -6467,7 +6470,7 @@ static void run_state_machine(struct tcpm_port *port)
 	case GET_STATUS_SEND:
 		tcpm_pd_send_control(port, PD_CTRL_GET_STATUS, TCPC_TX_SOP);
 		tcpm_set_state(port, GET_STATUS_SEND_TIMEOUT,
-			       PD_T_SENDER_RESPONSE);
+			       port->timings.sender_response_time);
 		break;
 	case GET_STATUS_SEND_TIMEOUT:
 		tcpm_set_state(port, ready_state(port), 0);
@@ -6475,14 +6478,14 @@ static void run_state_machine(struct tcpm_port *port)
 	case GET_PPS_STATUS_SEND:
 		tcpm_pd_send_control(port, PD_CTRL_GET_PPS_STATUS, TCPC_TX_SOP);
 		tcpm_set_state(port, GET_PPS_STATUS_SEND_TIMEOUT,
-			       PD_T_SENDER_RESPONSE);
+			       port->timings.sender_response_time);
 		break;
 	case GET_PPS_STATUS_SEND_TIMEOUT:
 		tcpm_set_state(port, ready_state(port), 0);
 		break;
 	case GET_SINK_CAP:
 		tcpm_pd_send_control(port, PD_CTRL_GET_SINK_CAP, TCPC_TX_SOP);
-		tcpm_set_state(port, GET_SINK_CAP_TIMEOUT, PD_T_SENDER_RESPONSE);
+		tcpm_set_state(port, GET_SINK_CAP_TIMEOUT, port->timings.sender_response_time);
 		break;
 	case GET_SINK_CAP_TIMEOUT:
 		port->sink_cap_done = true;
@@ -8160,6 +8163,12 @@ static void tcpm_fw_get_timings(struct tcpm_port *port, struct fwnode_handle *fw
 	ret = fwnode_property_read_u32(fwnode, "sink-bc12-completion-time-ms", &val);
 	if (!ret)
 		port->timings.snk_bc12_cmpletion_time = val;
+
+	ret = fwnode_property_read_u32(fwnode, "sender-response-time-ms", &val);
+	if (!ret)
+		port->timings.sender_response_time = val;
+	else
+		port->timings.sender_response_time = PD_T_SENDER_RESPONSE;
 }
 
 static void tcpm_fw_get_pd_ident(struct tcpm_port *port)

-- 
2.56.0.385.gd3acb90ef8-goog


