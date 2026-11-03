Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699768;
	b=V3S2o0XJVZSnNTTQP0B0ZrfEF6uR5jS8eDSeYTYKgloxFr3UtNcRpMvG5vdOt3qevDtN
	 W5zngNR+CGvzJgo+5yR9fpuZgQ/0QM1nJSa4xReKNuQQWmp+o0kyydNtH7xGKKFXxQUnA
	 DMVZnPupmhgyAsaUVovdMnMVwIlHMjhx9rYFYdIkP+LaOpo6kyikZxfug3KUnerN+Hcdt
	 iYnJr84Bi/GNhGt/sN8i3CmlLPQyGMuPHb9sRRiFuPMaM2oqF+d2G6+LXSAS4d/SWzVjE
	 SmvzdkplZaht5mr1WezqHzJMtWBe9JJx0LJciZ+PE/775jSpu6bzBVY14qBGKnOUQbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cAxZRQj15e+Ddsf3pHEBABxNpSu5LqFIC50y6T2NozQ=;
	b=C/h+g3bldmSMVZjOZ8wwUimwKVvr+6LF7EshZ4cMKNX0Q/bXp4934K1aEzzLddI1/e5B
	 x5Y2M6vlExjUKsAQIsDfgIhWiV33rnjtVsjakLusZt61dphG+LQ17xLP+0P0d1HTIYBRW
	 wymVa+jGh2ImSclIhDx8rm4PVqF2B4WpITKXO9Qyig1aYXSH+CdIBeyZhwfDjBVeKXL8l
	 TyQ82omMObtqHhhXTKZIIf4MCzldhL71yR7dmu8OPP3dmn/Cs+9Hn2VZ7Tf1bbE0VeUhm
	 rxpVD/OOWP8FtfZvEqL0tNGa5DanVbMtmqbaHcXEQIgob2WG6oJb/xsHAH+tsDOIYgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=conFkMNu;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B1C606A80E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87B1C606A80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=conFkMNu
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso1434886a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793699768; x=1794304568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cAxZRQj15e+Ddsf3pHEBABxNpSu5LqFIC50y6T2NozQ=;
        b=conFkMNuHqkU6jrU0uS4UY5JImCHRooi2u5Vu1S/6BIL0htgv25CittZSSTVXLFwcV
         5mTp90kQ5eagz3pH9rhYu7rXRaNP8O+GzAadSc4RIbkal7vggZ0IvbCQa9R0jpEJ+8yk
         CAX8wBlYyN1bTXwvQiJlFQQzXvhRkKbtGiKb9CBxNf4IFEzznWXR4+LH7u/PERl4yX33
         5h5/pn6DPOy3rJMi5hZR08UOTAoqSbV0ZR1e5HH6ttMaqWPSDU9Q8tm0s8tAI34HBxc+
         /KdH6x5x1ZzMZWWg+Mql5325K3jLx727449qEW5kVyg2QBd45NiZ3wTAgitbDUmPzTck
         Pb2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699768; x=1794304568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cAxZRQj15e+Ddsf3pHEBABxNpSu5LqFIC50y6T2NozQ=;
        b=rNTwFSdXFWM153E5Z489R6Qc7kCiBmR4+GMIy09z5nrnvX/4sGer7eUbaHKv+dDaxE
         udwzVLgi2nMRz6Nhl5zOIgCswyPKv6sLC/gb9iCv+Vrs1hiBoOIM3sfDFc3M7kHVg8WD
         Wy5GnyB7KfU/G3JZWiK98u8PNbiDYPlWZ6EzQUrU38/r/JXILr0dX8PpBywUy4UdXl7P
         IBQP2oK1dAZugZ6Eh5T/GFc02Y9ckPYYUtlCpuRhMFYt426v567kNonNaA8ZeZuErmWn
         uJ9g8vV/9lljIxnQrJZw38f0kZ2rzLpeR/srPMDAYdsVloEQI7rNewyApZw9dHnOGF7w
         qoVw==
X-Forwarded-Encrypted: i=1; AKwUvBwhXHkMFjW5joTp3lL8DlOXI8NigdpCD9HBNwYyScNGH2BtvumW7tdDpS73+8yxIT/0qagJxMSwOZPMifc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9y4o0nFE99MfTkuc/wwBNT7AQCqiEmxP5yKN1aIygJAiCgNBM0
	Ap+i+GkAj1mVbdjSdNRUG+CKSUk/4JX2ysZu4VMNWcuGZWLeNEZOyIot
X-Gm-Gg: AYBFou1RUjmzVIq1zRwGgKH4WZB2HLerIkSI67585ZDZoaqXlXMNfNWfrTQKDd7BboX
	kguJ1x2CfPJ3Es9epIIZ/CjZtdjORKhC/r2tMtBw3NY9KcYzxiaJL8dktp59Ey6hqjbng/AGin6
	nmIDxo8QaNTYQMRSGO6lhkS8g3U2aJAOgSFZqHXIX/UpY5rfSvv4IDII3Tui7HzGJJESDdBpS4h
	Uw/rfE/9iyQa/vk36CYPe00lIeSYfOYT2ZCEte5k3oP84tBERif5OPyT5T7TfhwkPlnBZxgL/uU
	SrfHpstfP1N/uYyd9dVMJDSL1mqW1DyEGir/uzU3Babwiv6twbgd9eFY48BELyMd5pftfaOE//D
	ja5ovxVXio3KjX+9Iso6gCb2TyD0S9Xq2eR3H80tdbkPN5e/HUvaQhbVMJspoPwgd/0hRHOF56A
	kfFlJ7dUTs2pTUlVJrpmAVdgqNDXRRIJ3bNY9dVsa+mgGsiP+txBlP15sUI6Bh0LMBcFYRswv34
	+TSIjfMjBg6Q/R720I3HpB98b+RE02n1Zw6Il6kKUrAvQlU9SsA8qZlW+4QCZl5a/Lqut2bG7ap
	gnwYEEbAw2I7u1Pj6VYXZVts0I4sR3BXI46E0AahbhgRJmJPPSFK
X-Received: by 2002:a17:90b:52cd:b0:3ab:b764:826c with SMTP id 98e67ed59e1d1-3ae897ccacemr9405709a91.12.1793699767640;
        Tue, 03 Nov 2026 01:56:07 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c666cdcsm3488954a91.11.2026.11.03.01.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:56:07 -0800 (PST)
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
Subject: [PATCH net v2 2/3] net: dsa: motorcomm: Resolve the flower action list to one ACL verdict
Date: Tue,  3 Nov 2026 17:55:09 +0800
Message-ID: <20261103095514.338700-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103095514.338700-1-mmyangfl@gmail.com>
References: <20261103095514.338700-1-mmyangfl@gmail.com>
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

Resolve the list against its first terminal action. Consecutive
redirects merge into the destination port mask, since a flow action
entry carries no mirred control verdict to tell whether software would
have continued; an action asking for a second decision is rejected when
skip_sw is set and left to the software path otherwise.

Fixes: 8eb9e7520b17 ("net: dsa: yt921x: Add ACL support")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/tc.c | 72 +++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 35 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/tc.c b/drivers/net/dsa/motorcomm/tc.c
index 8835907366bf..5d2db04f3385 100644
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
 	const char *reason = NULL;
 	bool seen_police = false;
+	bool terminal = false;
+	bool redir = false;
 	unsigned int i;
 	int res;
 
 	memset(action, 0, 3 * sizeof(*action));
-	flow_action_for_each(i, act, flow_action)
+	flow_action_for_each(i, act, flow_action) {
+		/* Only another redirect, or a drop, can follow a redirect: a
+		 * drop is an empty destination set, so the software verdict is
+		 * the same whichever control the redirect carries.
+		 */
+		if (redir && act->id != FLOW_ACTION_REDIRECT &&
+		    act->id != FLOW_ACTION_DROP) {
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

