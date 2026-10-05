Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541A74DEC3D
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791231270; cv=none; b=kiMCV+j1fdvPWKol3RWQoq+vRBTMoA8zBjWSq7Md4eyo++meKvshw+zzPcKyltj43W3XgcrnSytZ/hz5CfQvxHqovBzKKtGn/Z69+J312/+WRfNiGWESj4mcOVEyiRwxTt6X6A3VD7TLO2iwmlC/s54XWP7eHvoK3CXb5fXHSSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791231270; c=relaxed/simple;
	bh=k+CqVpScWbP1p48LTH2kXVwo5Ssi8+hZEw2CjOqf9vo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pN78RqdpQNYhfLInq5k+dei2v5kI8sGZRXGlk+mHF4rf3JT2V0jutrrI4bUQkuQhKyo2w5zIz2TTSdabxl1BLSMomW7FVTDnKujBTdz5TKf8/lP0pQ42QhWE4QpKyIGAjdj+Sbt49AoemhVRGaPP8jmmgUQjm2GHLE2RKb8jsy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rduv9rMk; arc=none smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rduv9rMk"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a7756096e7so21216511fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791231267; x=1791836067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aeNCYFzb8b2KgrRiXXEFlWiBLqGLegK23GWQ11tnNlM=;
        b=rduv9rMkdVqt4blvyIOqQnLVRweW9UeN+3NUfMepxp8DhX+ftL8n8fDPD4q8Q+L+dr
         hOsnk/EyAsvxp8eGHWPBiIOR4VlQfleAezzdyR9a8psOpYPO2HYt5G3HsD0Zs1t6sgbn
         haiifvd7MtZCShUe7YClp9G59/oV02tVAO7d279zhp0W4Sw9nrBi5D4ExghsIEx5X/pc
         KAiSh1EEB9Bk5m/uPTpAxhj0K/z2jq0nCa7XHUWrIJXPpySJiZzvtr4tzqiueIJaEp1d
         zV7TpR+qMIWeAf9+ZhmbAtPJqDr/ujbpRNLvM/15twVzNswMVW0N97DBaLLauctxtBdt
         iL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791231267; x=1791836067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aeNCYFzb8b2KgrRiXXEFlWiBLqGLegK23GWQ11tnNlM=;
        b=Z9hC52jaUyMASjFsZJmCq65IWSJqNaPVmYyy/esj30JSHtI/4gMTGB4rGUnKlRZoAu
         dyVFUBZmqcf5FojgMP72rTmJkCRc8E1zmzTKSc7h2lmrpMYxMRiC27qOVgpcM+M56xIR
         LE+uTpNmXWddTcIFFaQE2yNFpEel8/MHBT4CgsPrvxcelFs2pK1U1kHKg5Bp8okOx1hX
         ap8FfFoiLZY4k3wAyu0SXOAS3EiKr4/YEF0zqrCLxOgwbql1b++eGELQgB/6c9rjhUmH
         RSbi02+gNk03mbX3909QSJ+MhZuxbQmpq96013VjwERgEld30r0djReXa3DWZLXHmI0C
         evIA==
X-Forwarded-Encrypted: i=1; AKwUvBz63vDrOFBptbIb61SNUcZkcDqby9kkXeKaItVj8aZoMtGLAQQa7qASmY5PhFsySg3Z3dGJ9A5ysKOAYPk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2K9vAcRXvU42IPcFRSincJGJ/+C4s8BiHOKOueBq1+xIJVlJT
	XhKIg2kJCRaa5OH8JIfur65ITcLxSy84R60exSikpvJwl63DgXfdX8eh
X-Gm-Gg: AYBFou2abCKMR/QLMyt+jlt/iXCufVMNIDCpI0eaVw76zzYvvkdu9bHxSLwCsJly2Tl
	txGd9qVQSaHBFqEM1+FQO65varXV6oy5oQRiZdehHf4wGjhAoY9PwVBwSQCUq0YAjWlwRYFnaWl
	Jz5cPzXrax2NsLEJWZpjj8xPpgavOaB4Ggjem6VRTPlfv2dCRQSW9OE1iVAJzyFRJV74ppvEQ/d
	hkrqh5NMukvoVi/jdwEkRg2Ora0R3p7UPm2lA4aSEciKkk6N3uoK0ObVjOIGWe+jUOm+oPztKW+
	dutwRpYzW48Ds/myuD5bvNtpCLa5LwzlD3JR9jjdrErvSoaK/7vavwDZKpoRhL72bVzeHFD5uWR
	BkPrtawfqMny4D+q/KNFUoc3Ld/Ap8FhY40Ur5MYPY7b0c1XD2qcxbBRlSHx6XmlXmij7fqwj0Q
	NHfGSaf6HZiSJ/zxwjC/jIKxuiC47W2MiRgEdw94ZijmA9udXTfF8x9652+DeSAqyggXgxV4RHu
	ygFbOeVbF/9p0jVrncSPfDh3yeE7BZVw96aJHudBA==
X-Received: by 2002:a2e:a58a:0:b0:3a7:8058:9e45 with SMTP id 38308e7fff4ca-3a887678bbfmr28808481fa.7.1791231267213;
        Mon, 05 Oct 2026 13:14:27 -0700 (PDT)
Received: from dau-home-pc.. ([212.35.161.1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e303889sm43114681fa.20.2026.10.05.13.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:14:26 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 3/4] vxlan: report the drop reason of __iptunnel_pull_header()
Date: Mon,  5 Oct 2026 23:14:16 +0300
Message-ID: <20261005201417.906344-4-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005201417.906344-1-littlesmilingcloud@gmail.com>
References: <20261005201417.906344-1-littlesmilingcloud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vxlan_rcv() reports SKB_DROP_REASON_NOMEM whenever
__iptunnel_pull_header() fails, as the helper used to return -ENOMEM
for any failure. The VXLAN header is already in the linear area at this
point, but the inner Ethernet header of a packet without GPE may not
be, so a packet whose inner frame is shorter than an Ethernet header is
reported as an out of memory condition.

Report the reason __iptunnel_pull_header() now returns instead:
PKT_TOO_SMALL for such a packet, NOMEM when an allocation fails.

Suggested-by: Ido Schimmel <idosch@nvidia.com>
Assisted-by: LLM
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 drivers/net/vxlan/vxlan_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
index 35a47cc27200..0d98e29e2d72 100644
--- a/drivers/net/vxlan/vxlan_core.c
+++ b/drivers/net/vxlan/vxlan_core.c
@@ -1743,11 +1743,11 @@ static int vxlan_rcv(struct sock *sk, struct sk_buff *skb)
 		raw_proto = true;
 	}
 
-	if (__iptunnel_pull_header(skb, VXLAN_HLEN, protocol, raw_proto,
-				   !net_eq(vxlan->net, dev_net(vxlan->dev)))) {
-		reason = SKB_DROP_REASON_NOMEM;
+	reason = __iptunnel_pull_header(skb, VXLAN_HLEN, protocol, raw_proto,
+					!net_eq(vxlan->net,
+						dev_net(vxlan->dev)));
+	if (reason)
 		goto drop;
-	}
 
 	if (cfg->flags & VXLAN_F_REMCSUM_RX) {
 		reason = vxlan_remcsum(skb, cfg->flags);
-- 
2.47.3

