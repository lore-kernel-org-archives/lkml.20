Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793603511;
	b=5CtZIEM3m7Q2H4I2eLOAwv3268IR9qSx5OsH3YbH7A+5djQ65in1p04uzXmMbvelhl34
	 UKWa4F6OwT8a9oZoQTaDB0D83uepQdvH5kSvVrpK9yLL0THZvem/7mVTtXMGu1u91ujjp
	 cmdEEZWCbI7OG591w1MqWX4XdxEOzL3svAGsxtx5AqUImm/I17TQH9qyS/ImfpIptXw/s
	 KLkt7sXlITJJ9LO0+toyrGtWI0wHP/0scUqoR8BN8YZ1R3lUThD3kYYS65LsK/GmOHEYV
	 CmkBWfqP9au/0Cb/qqL/V5O7nbyYO9TQFzSn4fDoQC7p0lv6i9Vg9sbJ0OlLBH0LdDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793603511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aFf1QpqkAsJSo149csH6GOuvsyJZoB8FI+XgGaXyANI=;
	b=fOI1V8BleD0b8Uzj1p3RsY8aID7UAwqJIHMqBvxZ56mWgbiRdv/eQhD+BEkmq4rxBODt
	 YJyvrAhWoixFzEqXvdl1zBMP72OVEkQio1raBSh7Y92t4Pn4p+KDYlAaMu202u04GY98a
	 l+WPi6+Z5NVKFB0CYYtaOanihTOCDsiGrLtttqrJ3X3WWox0vK/FJMy7jfH/NTfaO6NXh
	 otQoyBlXFfrSJgZIxcoJGpz5xHvd8Qr0WgTCWMSWGOS1JKSg/tt9jgzJJZtA+1md6PFjR
	 Nb4HJ7TtyShFx6YYVK5cTA1xIKRpx1ZOPUTtBZaDgDe8lD63Bbf/kqPjsuIubRqCR1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m1GgYHyU;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1990E606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:11:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1990E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m1GgYHyU
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a9f9473029so1806591b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793603509; x=1794208309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aFf1QpqkAsJSo149csH6GOuvsyJZoB8FI+XgGaXyANI=;
        b=m1GgYHyUT7wzZIGMaCyigmBfrx3X8UXav8je8ts7399yhc//UOFZq5BRKyYvGCeE7W
         XVbUSG9LKO+nIJSBB2sh0CSECFeyn8af5EaOQsvum/Zovsj59pOS6AhIgHqfxZWISsZz
         amyCD4wsgCIdu5triHnel8qhD3BMZv5mtfc09NOza+lvF1KZpnAR5CqRvf607FeBU9Ge
         p0fvPeWT+z/DsnEu4u+gl/OHGxLibJu/4enIhM72p9MEmJnb4CoTkxZLW7Kzo9z6ZFYq
         lmyTG7c9hn8b9xpAXusGZKcNjWonOn/ASfm9nMvrU3cJ+tNw73XpLKi6gLZL4gYB7G0/
         1+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793603509; x=1794208309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aFf1QpqkAsJSo149csH6GOuvsyJZoB8FI+XgGaXyANI=;
        b=BBYxHn3jjpyChoxSFwFiRUFQhKuRP/K/iDjiCLv1QLNzKNDNEZI8WI/PJ2QiCxN3Qz
         u6bLxwSdHjjIfu3fY8fFbOJgRSHl4C6AcxuYplm3J32xTJTpuvjXwuU6Yz0mO0o6FOU6
         p85zUmGMNuTj372ER5kiZuyaZAMClyoTAR6xknLbNqclsMEJRkMaznUL3c/VXFVdlgMp
         W+9i44hxkLONTztz7VmktbxQxMxbhflCiPkJ36mqHQXbLy+fwx5t0Lr/tQzVx0nimvke
         BtqBPtN00fhpNk15Gonxb/21LBVsFTkniCekLBzilYI0VogLPimDNZzXpHJFko4cTB00
         E/5w==
X-Forwarded-Encrypted: i=1; AKwUvByatni3GP4wOAxo9eQlTh1y50t3j64bZoPMBY7TSSIb3KjLA11zN2mg0C4tdlxzJI+BY4uz4rxe9XprbbU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kqEQrVEYwOHE/B4BfPJLRaaQv8Ce2mm0a47ctB1hbFJjJrIs8
	HtmM/Nj6A7RWOV/JbmYMYiBL6T101+1hskXW5I1jMKEUQpEPIqIN3hbo/UWuTe2D
X-Gm-Gg: AYBFou3WevCPQExN8lR9YA47TFUjAx24kzToMharhyHYI/RzmofsG6iXg5KegaN8b4n
	/6rscttq+s2eJ5F0dSJzANQ8a5AMxO7x0XMfugJkgo7HgTSPsBcKGzq6ZwzF5Te+LPbE8Dr2MIm
	siEHXniSEvweLZjvSNk3RlhUaMeoR6LZPMsgpSpL7YKGO7Bz2P8O/NIqMv7yORJ4sJ8BRr//MNX
	5l8ibVqsnqnrxovooJe3GN9zkCNIdOO67TDpfKJ1d6deJmHU2a0jyed9F2nxyMR7VCEO36yrp2n
	qZFnpedQ5bieSRKCkpZ2wtlPN2q2Wp9Ti5EhtLijDLXvr5yMseXLstfNzlz71FEweLr/rsYqP8U
	ocMz1Brrnz+A822aFlZBNGMUweHphmSx6IlAdc0ibXs+y4xRJEqrAinh9NV0Ca9sjgV4v+viuy0
	69c7pnQeLnGwcZRR/C3nUvVLWoiL/b5NXr4P5T1YWxjhuth6Fab7b89D6gzfHVRd6FJnBgqWtBs
	RpV4ua6hCGfJS3SJF8oj3em7aeGtnbz/HPNZDyBEMWOpxIMqA/ojn/Tqqk0TyQ1/VGPHenN1L2z
	x9V4dEcrS/kj9JI76Pq3ZQuTbZyEfDcaBPmEnss4YGJLdLk8KdY1
X-Received: by 2002:a05:6a00:22d5:b0:89f:d85a:6c0c with SMTP id d2e1a72fcca58-8a9bf337083mr7415827b3a.43.1793603509425;
        Sun, 01 Nov 2026 23:11:49 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8abab0c6c6esm1140566b3a.48.2026.11.01.23.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:11:49 -0800 (PST)
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
Subject: [PATCH net 3/4] net: dsa: motorcomm: Stop at the first terminal flower action
Date: Mon,  2 Nov 2026 15:11:15 +0800
Message-ID: <20261102071119.3435180-4-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102071119.3435180-1-mmyangfl@gmail.com>
References: <20261102071119.3435180-1-mmyangfl@gmail.com>
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

tc software stops evaluating a flower action list at the first terminal
action; the hardware translation did not, so a later trap or redirect
silently overwrote the verdict of the actions before it: an `action drop
action trap` filter with skip_sw trapped packets to the CPU instead of
dropping them, and repeated redirects to different ports accumulated
every target in hardware while software only honored the first one.

Fix it by resolving only the first terminal action of the list.

Fixes: 8eb9e7520b17 ("net: dsa: yt921x: Add ACL support")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/tc.c | 61 +++++++++++++++-------------------
 1 file changed, 26 insertions(+), 35 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/tc.c b/drivers/net/dsa/motorcomm/tc.c
index 5a4459507582..87c04f0dd736 100644
--- a/drivers/net/dsa/motorcomm/tc.c
+++ b/drivers/net/dsa/motorcomm/tc.c
@@ -1038,55 +1038,43 @@ yt921x_acl_rule_ext_parse_flow_action(struct yt921x_acl_rule_ext *ruleext,
 	const struct flow_rule *rule = flow_cls_offload_flow_rule(cls);
 	const struct flow_action *flow_action = &rule->action;
 	struct netlink_ext_ack *extack = cls->common.extack;
-	enum flow_action_id redir_act = NUM_FLOW_ACTIONS;
 	const struct flow_action_entry *act;
 	u32 *action = ruleext->r.action;
 	bool seen_priority = false;
 	const char *reason = NULL;
 	bool seen_police = false;
+	bool terminal = false;
 	unsigned int i;
 	int res;
 
 	memset(action, 0, 3 * sizeof(*action));
-	flow_action_for_each(i, act, flow_action)
+	flow_action_for_each(i, act, flow_action) {
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
-
-				to_dp = dsa_port_from_netdev(act->dev);
-				if (IS_ERR(to_dp) || to_dp->ds != &priv->ds) {
-					reason = "Redirect to non-local port";
-					goto fallback;
-				}
 
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
+			terminal = true;
 			break;
+		}
 		case FLOW_ACTION_PRIORITY:
 			if (seen_priority) {
 				action[0] &= ~YT921X_ACL_ACTa_PRIO_EN;
@@ -1140,15 +1128,18 @@ yt921x_acl_rule_ext_parse_flow_action(struct yt921x_acl_rule_ext *ruleext,
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

