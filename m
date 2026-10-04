Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFE940244D
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 04:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791087211; cv=none; b=NByGWnotY4LCXg5UXqR/UH7MZ2zF/tRXmra3hKA2AeGTIevhhvLtn7+m+REdceJ2VylYGIRkIPvnb6xM5lL5tToBxfLdXGNom+KCk3qVYQmPra85sb7d8qTQegyLnLNKeGGlweOUVMH+dsKBQp93eXlPShkiU4RpT4bzebzE9No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791087211; c=relaxed/simple;
	bh=tWTj7sa3HSz20eoE7iU48Ov4FXB/O8yPqTq5z9H7G1k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nSFrJt6jDM/I+8m1BZ7rll17Hlkl2mmZfItLx0tkJ0gBlieQiLo/iIAAni4ZJ6Da82RJEFkYZnOyld6OBLC6PnGeKuh2yzEfvQ6OUeW8XxCpGW2zTP+maUtVXLKvh8Scy7CNBSQGa3bYnHsa/4cdx0dw39rZGIZ+v5uqxgG1oNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ReZajIVL; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ReZajIVL"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3510b42f4e3so704918eec.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 21:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791087207; x=1791692007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=miahjqq1TAdqXeL2Jl7n/7P9i8eCMUOcl23EpJEiCcg=;
        b=ReZajIVL4l9uPmbbYySvWADbstSCqqZxqnVEUiMxZBIYjT7Lwr6S4N9iEemaieuoRI
         egy8aI4bIr9NZNXjGdQ8iUmpCP2gWsW30Kce8IL7X0z46hNn0r/KXtbSuZ5hhRbMckDz
         8NzavNM9vde1j0dGd6G1rlXtufFGjf7koMAlSVTL0VFvky27GxdxhAQqQypDvgbSCoEq
         XmDJ/+zb5OQTG3g1qr3zpv2hRtMhmqEOm5cK/3ht1EfjaiJhu7CkZJ/UjxEs5Hl8F4tk
         VqZ+Bx2cKz8gIAvNx2otUXw8oIF7wosiuF339H5CUADh/nqauuVRdhv8ZUklnH5sGjGs
         3j8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791087207; x=1791692007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=miahjqq1TAdqXeL2Jl7n/7P9i8eCMUOcl23EpJEiCcg=;
        b=sUj/hFjGPCY2q/ozF2Ll1CNnd/Zt7nX6WFPljMImDxovKcXqnamTMKF6YzFejyy+91
         n5SaAgvyvJxbP3zyNyqdvFi1C9eiVzSzvebYZd/zUM7URyVIlmmLXiCI7B9IuOjkggzY
         mN6F/gRVbrxzTWTJJMak6tiM/vR9sSVw9FJVdfAzWfxASSMYGd1b8IVA+5ACoELcT2/K
         37dMSQLnQNJtMJy6pvYSvp8tZm6xubh5zGAwfauWb3+iTrW9IBoA3zgK4w9kZ9Ry61nr
         y32S1LX2+EhD1qIsxEXnUJJLxihK39yEZFUb38swRrMqEc+e/wQTVJCfU2qVBedNaO1w
         GUKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYIBlRHDAqMEOupTI8TdEdiP6P1V/ZYKzXOqdtKwW0k94yvd/fFsCvc4OWm6TGPiL1T3WWzRbuoXFDOD0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3pLgX0jWltq3MA0+4D1Movq7cCMMJjE1DxJnfI6NX0BhTRBLc
	IG/XS+7Yui1/6LOs/XcYb+kUBZv6/8Tv8J4DQ26sv/enfRQRlzSn5K9H
X-Gm-Gg: AYBFou3wXVqLD7dfCh8LGoQbEmBB9Apo9cpzWD4KcZ3pAARWl63m2fgdwU8xzmz3ais
	wTm1Ekc3zKOXm1qixpvazfAr+imJXbiYDF7gbxBU4jmu6RsjlRaEGTSGIrNHldooVosKKRqpXCj
	hwV7cqjfizRC3OWO6Nodqw93ONn2ecs3WTZ5eu/qAFDUTiPjCLhEx5IJCTshKMnl0jvBBI+/4Nt
	be6JLp//1NO+Xd76zVfQIvtu4f04puntyep+dkTgYdhjQw0KLxybf9j2WhgYPE8LnBGo/ugCxq8
	ua8PjV7LkDEcNg/yWkalMh9a5v5oHoHoNgcAKZ/IlGZ9SicztI31yCq934W/6wEpTLIXUMMkuA8
	6xznInw80PJ7p4SH6GrEJQiYJUeTpa1uM/a+VTsE4jAXWbC8Nes6uWWTFMBQWQFnSV46ivgapJM
	tqrhJVIUDp11NtYelGiU1tAWHaEpikDfuhd+UUdKNnQPEqVq6EUq3nIVG6bH1ceheOc66yXdtf4
	2wFeZ4=
X-Received: by 2002:a05:693c:20cd:10b0:34c:e77c:f92f with SMTP id 5a478bee46e88-34f21985e41mr8176034eec.37.1791087206582;
        Sat, 03 Oct 2026 21:13:26 -0700 (PDT)
Received: from vscode-11-19.w453y.xyz ([59.164.88.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35127021d1esm1475493eec.4.2026.10.03.21.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 21:13:26 -0700 (PDT)
From: Abdul Wasey <w453y.me@gmail.com>
To: netdev@vger.kernel.org
Cc: razor@blackwall.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	horatiu.vultur@microchip.com,
	bridge@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: bridge: cfm: notify userspace on CFM config changes
Date: Sun,  4 Oct 2026 04:13:20 +0000
Message-ID: <20261004041320.2684045-1-w453y.me@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CFM status changes are sent to userspace by br_cfm_notify(), but config
changes are not. br_afspec() calls br_cfm_parse() without the "changed"
pointer, so creating a MEP, adding a peer or starting CCM transmission
never sends an RTM_NEWLINK. Today the only way to see these changes is
to poll RTM_GETLINK with RTEXT_FILTER_CFM_CONFIG.

Send one RTM_NEWLINK with RTEXT_FILTER_CFM_CONFIG from br_cfm_parse()
once any group in the request has been applied. If a later group in the
same request fails, still send it, since the earlier groups already
changed the config.

br_ifinfo_notify() is not used because it asks for
RTEXT_FILTER_BRVLAN_COMPRESSED, so the message would not carry the CFM
attributes. This calls br_info_notify() the same way br_cfm_notify()
does for status.

Signed-off-by: Abdul Wasey <w453y.me@gmail.com>
---
 net/bridge/br_cfm_netlink.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/net/bridge/br_cfm_netlink.c b/net/bridge/br_cfm_netlink.c
index 91b9922dc..56309e6f4 100644
--- a/net/bridge/br_cfm_netlink.c
+++ b/net/bridge/br_cfm_netlink.c
@@ -382,6 +382,7 @@ int br_cfm_parse(struct net_bridge *br, struct net_bridge_port *p,
 		 struct nlattr *attr, int cmd, struct netlink_ext_ack *extack)
 {
 	struct nlattr *tb[IFLA_BRIDGE_CFM_MAX + 1];
+	bool changed = false;
 	int err;
 
 	/* When this function is called for a port then the br pointer is
@@ -399,59 +400,72 @@ int br_cfm_parse(struct net_bridge *br, struct net_bridge_port *p,
 		err = br_mep_create_parse(br, tb[IFLA_BRIDGE_CFM_MEP_CREATE],
 					  extack);
 		if (err)
-			return err;
+			goto out;
+		changed = true;
 	}
 
 	if (tb[IFLA_BRIDGE_CFM_MEP_DELETE]) {
 		err = br_mep_delete_parse(br, tb[IFLA_BRIDGE_CFM_MEP_DELETE],
 					  extack);
 		if (err)
-			return err;
+			goto out;
+		changed = true;
 	}
 
 	if (tb[IFLA_BRIDGE_CFM_MEP_CONFIG]) {
 		err = br_mep_config_parse(br, tb[IFLA_BRIDGE_CFM_MEP_CONFIG],
 					  extack);
 		if (err)
-			return err;
+			goto out;
+		changed = true;
 	}
 
 	if (tb[IFLA_BRIDGE_CFM_CC_CONFIG]) {
 		err = br_cc_config_parse(br, tb[IFLA_BRIDGE_CFM_CC_CONFIG],
 					 extack);
 		if (err)
-			return err;
+			goto out;
+		changed = true;
 	}
 
 	if (tb[IFLA_BRIDGE_CFM_CC_PEER_MEP_ADD]) {
 		err = br_cc_peer_mep_add_parse(br, tb[IFLA_BRIDGE_CFM_CC_PEER_MEP_ADD],
 					       extack);
 		if (err)
-			return err;
+			goto out;
+		changed = true;
 	}
 
 	if (tb[IFLA_BRIDGE_CFM_CC_PEER_MEP_REMOVE]) {
 		err = br_cc_peer_mep_remove_parse(br, tb[IFLA_BRIDGE_CFM_CC_PEER_MEP_REMOVE],
 						  extack);
 		if (err)
-			return err;
+			goto out;
+		changed = true;
 	}
 
 	if (tb[IFLA_BRIDGE_CFM_CC_RDI]) {
 		err = br_cc_rdi_parse(br, tb[IFLA_BRIDGE_CFM_CC_RDI],
 				      extack);
 		if (err)
-			return err;
+			goto out;
+		changed = true;
 	}
 
 	if (tb[IFLA_BRIDGE_CFM_CC_CCM_TX]) {
 		err = br_cc_ccm_tx_parse(br, tb[IFLA_BRIDGE_CFM_CC_CCM_TX],
 					 extack);
 		if (err)
-			return err;
+			goto out;
+		changed = true;
 	}
 
-	return 0;
+out:
+	/* Earlier groups may have been applied even if a later one failed */
+	if (changed)
+		br_info_notify(RTM_NEWLINK, br, NULL, RTEXT_FILTER_CFM_CONFIG);
+
+	return err;
 }
 
 int br_cfm_config_fill_info(struct sk_buff *skb, struct net_bridge *br)
-- 
2.53.0

