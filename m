Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794307794;
	b=zUA0y1d/Ho6DMZdpNuu84LrVtulvXpGVbFotdm6OCMFw1cq+HEUSggAom0f4Qd6lDjVQ
	 hWg3c5LrgkEhNVIdl+cE8w+BVTbtiYfigD0Qlp1zZjs2pI1CcT1QqjuYBIPxLZvzw0sMw
	 Ee6PnqhYQzuxRssTGxCr26JqemaYp91K6XfRfSgmy1U2irOLZlpg/kunUIzIMEpl2coZt
	 SMYgzzUEfdnBLQSf58jSVjKlfOHbxEOfUXR57Cla+ehhXnLGmk9KWNyZSo1S953xFU873
	 hOFd5S4cORVUSYENcPOmOeJYCnke5I89AfUSQX7e4KWmlSL8X9InOa96QLMFzlwkvKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HOuk+lSlUhfEcj8babAxC2dur56U9KiwKgXO7wljHnE=;
	b=sMIN7EU/uIrQ0XfYlEhQFcMyFASzaOb86REGCAdvByMPiB4cJJ7a3gwD+9TpTVzOD+qT
	 lt8fPeWObMAOwp2yjW3KCA5/oD2GBuYl63I4m+3E18+IkMNMFwE4ErHmuGIxafjF+VuoQ
	 zI4QyRc6d7KohU5Z+ST0rDmaO2a+Q6vJkmkyYhALqAoERSoyl+WOifzmUX1wKNfn1YVT2
	 hJZz2Sp175TRY1GAUpve5WJkrpXBWY0oeyk1LGt9SmrG8f6srR8PA9nAk4/owIb1YlyXU
	 h9QBQ7cp+gCnHrxD6IcGMAUuyDBg74NXCTY4+JT+zVWN8DzKiPrrePRDZEj1WIogY5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dWC8ydfN;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA87B60A2622
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA87B60A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dWC8ydfN
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso11822505ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794307793; x=1794912593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HOuk+lSlUhfEcj8babAxC2dur56U9KiwKgXO7wljHnE=;
        b=dWC8ydfNRVnewo00CLKpPQ95TpZa0arMW0P5Z/9bb9yGVg41sfg/D7mMO8daoSwH40
         jxHJ6Ie+cV57ls74L1Z7XKtlR9sLPtH0Rzmukk0uw4mUvDaNEOvjCKPeNBPWawJ3wK9X
         fEJiDTG5OVZc4D781N0W23jdzvtMIJT1O2s6E3a7vV2iScuruip7a//7UKqz+EOa25+u
         84n0+HudGXidbg8c8k6kzcK8Z1MLQrJ/MGfeb7cLsFPfYLmEktqeSG/Iaqd24fY5lIRr
         4RxaAfa5phb7o/7k018INmoU3LIRUxykC09aK/vw3A9/KRCs8sXCxGp1pHdhnHyNFWvt
         TwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794307793; x=1794912593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HOuk+lSlUhfEcj8babAxC2dur56U9KiwKgXO7wljHnE=;
        b=RFBzDNTf0pxzN56v/autqTR8llS7xGKZg9x+hpDC5VFyOd9d/ltCC2r8Kp2JtK0gqA
         2D+Re05+1VlKKdPbEZ0rn8FW4wtMsELnu4Bj3RoYxo8exYYLiOLBdMJ2I6cYxtiZLIre
         nVJZJHV5jXOTrkprjg0tayDhmuiXC4SgeXmDPrYKDNEBucNscZyEV7Xsf7vYzl1m1mG7
         EM8xBiYZ9RP6Td2vVAEdfORfhZQ6H4vYWFTlqHYDyCQt8oAjiypFzW1U/QPWm8Lt7tVt
         x8wWQo+/7LFbIDRA/K3yjb5Mshtcmb8NAjhcdPTerYAtoeM8DE95Kv2cMw0ldIsREz86
         S+Tw==
X-Forwarded-Encrypted: i=1; AL+hErF/t+TQLjUIAtKan++3sUAEnwJAdJTxb8Vq3G33TVyG1tydkJncERRWyExQcf0Q4cRHIbR/1RczU0Vbq/M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/52QI8kcOKDmHBcBm8RywMJ//JeEifsfwq/fwliJhdTZSBh02W
	+cYvO/JTn/EyWKsJ01byky42Z9bTIni66+kvsxVkmATP6vW5zkeb/Uhm
X-Gm-Gg: AYBFou3UFjrjABUpklsq8iEfGBAyuDC7twxw7sJyvxC0qCO+J9XMJGlPLAmiTyi9XE+
	HPnnYjyY/PM/MgOCMb2anfzkW29crY3TCzM/HBHdGqTTz9c3XnG7R569SbbvO7L3HQyAS9WaCeJ
	YAF/j1+0aMSGUCz3yxxstLpoek/fBdYWHL+wDy3TP5jjs9uMNSeLlD5+T3jUUeAKYJkujoMhLqZ
	ShFN6slruUAPLS5XxKeApC1IMC2c1iUCKeFMhyfk94u/d13kpUMC2LA8wSKD89aYl6ZaHRF83KQ
	mANA3vMXVYZFCBVC2JwoIqu3Az8p5X3b2je3cgevl8+LZJNfVob1C2Gh8ZzbNXufDeeC7hRr6Rl
	tGor3PfV3S2IamSKeP0PrYfCQ19sAo3pu8D/ashgP4lp5eAdMi4nlpQZ9KlRe02vXU+U/TVFi0A
	h/GSI2wirjrl+HNiBm1d8eiA9e6SUs1sL4J8V7NpgM6Bs6qMlYA7g/zQSYxkhl6EtHFLQiXMT1w
	xGl9hooZvVzOaXgJSfKcWPx2CX5mOFZzbWv74AkCiO22VH15rJ0SKG1Qxt8DoRG93QtWwOeQ5UU
	fwfmtsdUMYjUVrqeewaXr52NZ5miCatnLVzLfZwWyF+2NTz+yuy/Ei19
X-Received: by 2002:a17:903:4683:b0:2e9:61bf:6587 with SMTP id d9443c01a7336-2edb91a0968mr20228075ad.49.1794307792947;
        Tue, 10 Nov 2026 02:49:52 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6214:1250::1d3:d5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d906e4sm7337815ad.40.2026.11.10.02.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:49:52 -0800 (PST)
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
Subject: [PATCH net v4 2/3] net: dsa: motorcomm: Resolve the flower action list to one ACL verdict
Date: Tue, 10 Nov 2026 18:48:54 +0800
Message-ID: <20261110104930.223598-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110104930.223598-1-mmyangfl@gmail.com>
References: <20261110104930.223598-1-mmyangfl@gmail.com>
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

Resolve the list against its first terminal action, and ask for software
assistance if any action follows the redirect action.

Fixes: 8eb9e7520b17 ("net: dsa: yt921x: Add ACL support")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/tc.c | 72 +++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 35 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/tc.c b/drivers/net/dsa/motorcomm/tc.c
index 90b017a11a1b..429345ad1eda 100644
--- a/drivers/net/dsa/motorcomm/tc.c
+++ b/drivers/net/dsa/motorcomm/tc.c
@@ -1030,55 +1030,54 @@ yt921x_acl_rule_ext_parse_flow_action(struct yt921x_acl_rule_ext *ruleext,
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
+		/* The flow action entry carries no mirred control, so there
+		 * is no way to tell whether software would continue past a
+		 * redirect and apply the actions after it. Leave the list to
+		 * software instead of guessing a hardware verdict.
+		 */
+		if (redir) {
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
@@ -1132,15 +1131,18 @@ yt921x_acl_rule_ext_parse_flow_action(struct yt921x_acl_rule_ext *ruleext,
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

