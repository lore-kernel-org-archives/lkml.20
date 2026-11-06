Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793950735;
	b=FI2hhXDGS01OHCRFpAxTfHqlMyE/wuEgc2/Jjg909VMC9QJmWPjH2AG+HqDsRMnaBBRS
	 ojlvzWSxie1q7B3fqmY4CbD+AOXWaLuxHEbuAH3a1h/0OVkKMgDe1dNxU0+DTYKmS0UZJ
	 ldQ1K5cHD0IB9OHq7o8IJfnBIXEzXfw5IKAYsyVmgVvE63mqi5LubOkUvksvau+7KOJCN
	 BWWNOQre9YvIS8q2/waexMC7W9F3gQsDK909+2KIzWfhZCZ22J150OsazsbwtzWSe4VIV
	 8WiIKx63WbyEBPTPWwMzKWndv6FHycLMUyRnbo5EnjLXtUjh7bSLgeikh+JtoAWhZxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793950735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=45d32jUR4SGIqYEteYzNq9z9Plnu2UNR//Dnq4WK+0g=;
	b=XD+w5xoSntV93Vge9Ka/n2Wcer2s93tYx55ogv9gUjUYOSUHI3K9K5kDg4Y5XSE+p7hX
	 kH05bfGgSm3XigXVPxom0AJe8YU+DMz2JnZDjtnw7h8fi4KhuIJcOWbJrm7pYSAzYnkhI
	 Rw3kHxbjSy+aFp1nwAVsQnwDi+I9NV/jZoCbAUcmiNQd95rjIT7tQePrWZNgi9wqXxG4h
	 jzon0+INIwtrXXs0PQbAfPl+YGZv9F7EjSd6dZafHU+/vJRpzQASw0Hv0M1AFsUjZDk2U
	 +fYCiCCVpRaoWdIZ1BsGDOb/Tl+C/HFnCEzbif7TMeiFLkE3+YWOh1F5nA8/EatW/+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dihod8cw;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD84606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DD84606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dihod8cw
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a07078200fso126539b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793950735; x=1794555535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=45d32jUR4SGIqYEteYzNq9z9Plnu2UNR//Dnq4WK+0g=;
        b=dihod8cwFNzTnuhOXA0JUX/EAIiYARoXqSAiN3GIr2f3Bv6RXnX3y+VT+M9LpJFHLl
         D5mKK8Is2X/h1dkcl/iy5TPtj38oindUDfGpEUWxwKZqolF4w/6NaosItrD7bHtdVld6
         qacfWiUrMOxiHWWzRAY4oLR2azlKk0d4b8oYxE2ZqjnID0jth5iIP7OzWd5B4QQYVkNH
         3kRz6AVkgkReRsgEcayD/NWG1Mnm5BxZipfgNtj3kvqltHSaavf7p8HYWkCclefxYIDL
         kf9yRm8bN9QcPU5Ol+MwLU9rsfvLsfgeglB50wg4mLiojEOlk5J9jekC5T85LCZGycYv
         D7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793950735; x=1794555535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=45d32jUR4SGIqYEteYzNq9z9Plnu2UNR//Dnq4WK+0g=;
        b=k9BBlzvWjpeFtTNZUmeNNxlq2GkfHx3sXtwQoM7HIQo5dhI6Am75/zg/XeWMhxjyE3
         1m1WNl+5j4r+CWETBQl4baynjPb2v2S/pnRltmsnQnkEOGGZwBCfbTHabOY70a8/JpvF
         sIED+LTzneTOd5LERidDxNv3bldIBzP+dqu8OFCHpL1+I7cb02TaqX0vkFIVXt/K02jc
         x0l7ApQD6pt3Lssf7lKX2CnwQYTD86JgMIKr5C+uvHxv4XuLRPQj1071rjB6DkKp+T+E
         Pt3eOxUDArbaEEj7DvdbskvRJBzaYelWY27vqTL7FD6JboKTYlmCDiOWY1mUT4btlfGA
         RXXQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+BySSBshCQ2WIFNckUVlAs4NRSXSxa8ZMxC84S7LyppHUF/1Y7XSVx+O6uYn99b/wQEQsdIuCg/VlN9g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zyfoRRZ7yM/Yz9aVT21aUmWasGUCnlTXlKBP1bCfR5oE1FBXs
	/Lrmkd+6I4zquBuFYIe8Pje1aa62bHs6x1p0Evq/9LY6vJodwD5AfWYN
X-Gm-Gg: AYBFou1By2kxppv1Ymz/IPkOaGVyImCiLotTnPsAl3zkTx8mxUh+VQRzacjPPqf56D3
	qiPhITVPwp32XO4tjataKGG/FJh3vE8BWFhuXVfBLjd7kP3oajeH81N3ORakQuDkPjAXTpygvRJ
	9AcwkvoR0kBAMyNcf3BuLztvqppNYrYfF3tcExTYLNA023nv7AhbxxagqGFuLSwdliYTKkRpkX1
	UBipYchXxjNIVHy0AFPjig9m8DaFU+xFGOyX2eHaZFC/NL0wmipaUh62DINHq3u3/vUrWr7NDD9
	59JN12IGtpdWPeREvqPk8Vs9hhakCtuT0eWR6I5bzZOHx0KflVjlloExiXvhYnHcH9tu+q6+c8c
	gW+yAbqTLfS9ZgvY5qimT9sa7zS40L773a6szLxWyApjzNncbnOdGYZGuA5gWjyEgc9tMtEQSVI
	lrHQouGmDtnULqN2MxEewrqwZocvWgqDTX774EWHDgC5Qkg6Ww0bUxR7JHFRC5GNuZOLrdoc0Ic
	OWZ9B22WLZQwSXA9r/v7KxYu2Lqd8yTWSKgOwNO5gJl7BrV1PyBfV+2VvHYn8EfL5G5eh0NjRsH
	JYw8GfZcH0pr9vOVMV6SiZebR/UO8ReP9CUS0nWTsQqhEZa1A7p6
X-Received: by 2002:a05:6a00:4654:b0:89e:3ff1:920d with SMTP id d2e1a72fcca58-8b37c241144mr1967494b3a.45.1793950734555;
        Thu, 05 Nov 2026 23:38:54 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b3597efd53sm373484b3a.23.2026.11.05.23.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:38:53 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 2/3] net: dsa: motorcomm: Resolve the flower action list to one ACL verdict
Date: Fri,  6 Nov 2026 15:38:01 +0800
Message-ID: <20261106073806.112122-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106073806.112122-1-mmyangfl@gmail.com>
References: <20261106073806.112122-1-mmyangfl@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hardware resolves one forward decision per ACL rule, but the
translation accumulated every action, so a later action silently changed
the verdict of the ones before it: an `action drop action trap` filter
with skip_sw trapped packets to the CPU instead of dropping them.

Resolve the list against its first terminal action. Only a drop can
follow a redirect: a drop is an empty destination set, so the software
verdict is the same whichever control the redirect carries, while a
second redirect would only extend it if software continued past the
first one, and the flow action entry carries no mirred control verdict
to tell that. An action asking for a second decision is rejected when
skip_sw is set and left to the software path otherwise.

Fixes: 8eb9e7520b17 ("net: dsa: yt921x: Add ACL support")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/tc.c | 74 ++++++++++++++++++----------------
 1 file changed, 39 insertions(+), 35 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/tc.c b/drivers/net/dsa/motorcomm/tc.c
index 90b017a11a1b..5c82719e461f 100644
--- a/drivers/net/dsa/motorcomm/tc.c
+++ b/drivers/net/dsa/motorcomm/tc.c
@@ -1030,55 +1030,56 @@ yt921x_acl_rule_ext_parse_flow_action(struct yt921x_acl_rule_ext *ruleext,
 	const struct flow_rule *rule = flow_cls_offload_flow_rule(cls);
 	const struct flow_action *flow_action = &rule->action;
 	struct netlink_ext_ack *extack = cls->common.extack;
-	enum flow_action_id redir_act = NUM_FLOW_ACTIONS;
 	const struct flow_action_entry *act;
 	u32 *action = ruleext->r.action;
 	bool seen_priority = false;
 	bool seen_police = false;
+	bool terminal = false;
+	bool redir = false;
 	const char *reason;
 	unsigned int i;
 	int res;
 
 	memset(action, 0, 3 * sizeof(*action));
-	flow_action_for_each(i, act, flow_action)
+	flow_action_for_each(i, act, flow_action) {
+		/* Only a drop can follow a redirect: a drop is an empty
+		 * destination set, so the software verdict is the same
+		 * whichever control the redirect carries. A second redirect
+		 * would only extend it if software continued past the first
+		 * one, and the flow action entry carries no mirred control
+		 * verdict to tell that.
+		 */
+		if (redir && act->id != FLOW_ACTION_DROP) {
+			reason = "Action after redirect";
+			goto fallback;
+		}
+
 		switch (act->id) {
 		case FLOW_ACTION_ACCEPT:
+			action[2] |= YT921X_ACL_ACTc_FWD_EN |
+				     YT921X_ACL_ACTc_FWD_FWD;
+			terminal = true;
+			break;
 		case FLOW_ACTION_DROP:
-		case FLOW_ACTION_REDIRECT:
-			if (redir_act != NUM_FLOW_ACTIONS &&
-			    redir_act != act->id) {
-				reason = "Different redirect actions";
+			action[2] |= YT921X_ACL_ACTc_FWD_EN |
+				     YT921X_ACL_ACTc_FWD_REDIR;
+			terminal = true;
+			break;
+		case FLOW_ACTION_REDIRECT: {
+			struct dsa_port *to_dp;
+
+			to_dp = dsa_port_from_netdev(act->dev);
+			if (IS_ERR(to_dp) || to_dp->ds != &priv->ds) {
+				reason = "Redirect to non-local port";
 				goto fallback;
 			}
-			redir_act = act->id;
-
-			switch (act->id) {
-			case FLOW_ACTION_ACCEPT:
-				action[2] |= YT921X_ACL_ACTc_FWD_EN |
-					     YT921X_ACL_ACTc_FWD_FWD;
-				break;
-			case FLOW_ACTION_DROP:
-				action[2] |= YT921X_ACL_ACTc_FWD_EN |
-					     YT921X_ACL_ACTc_FWD_REDIR;
-				break;
-			case FLOW_ACTION_REDIRECT: {
-				struct dsa_port *to_dp;
 
-				to_dp = dsa_port_from_netdev(act->dev);
-				if (IS_ERR(to_dp) || to_dp->ds != &priv->ds) {
-					reason = "Redirect to non-local port";
-					goto fallback;
-				}
-
-				action[2] |= YT921X_ACL_ACTc_FWD_EN |
-					     YT921X_ACL_ACTc_FWD_REDIR |
-					     YT921X_ACL_ACTc_FWD_REDIR_DPORTn(to_dp->index);
-				break;
-			}
-			default:
-				break;
-			}
+			action[2] |= YT921X_ACL_ACTc_FWD_EN |
+				     YT921X_ACL_ACTc_FWD_REDIR |
+				     YT921X_ACL_ACTc_FWD_REDIR_DPORTn(to_dp->index);
+			redir = true;
 			break;
+		}
 		case FLOW_ACTION_PRIORITY:
 			if (seen_priority) {
 				action[0] &= ~YT921X_ACL_ACTa_PRIO_EN;
@@ -1132,15 +1133,18 @@ yt921x_acl_rule_ext_parse_flow_action(struct yt921x_acl_rule_ext *ruleext,
 			}
 			fallthrough;
 		case FLOW_ACTION_TRAP:
-			redir_act = FLOW_ACTION_TRAP;
-
 			action[2] &= ~YT921X_ACL_ACTc_FWD_REDIR_DPORTS_M &
 				     ~YT921X_ACL_ACTc_FWD_M;
 			action[2] |= YT921X_ACL_ACTc_FWD_EN |
 				     YT921X_ACL_ACTc_FWD_TRAP;
+			terminal = true;
 			break;
 		}
 
+		if (terminal)
+			break;
+	}
+
 	ruleext->r.sw_assisted = !cls->common.skip_sw;
 	return 0;
 }
-- 
2.53.0

