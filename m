Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48B65208A6
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793570; cv=none; b=nSb3vPzIHn+wcTRwW4EFn4WSYqWDsYm2VNNfE0dm9AdgXpud8WVyIENO7DHQ7yrj+d46/ff/eNIW3FFctn1dHPoF9kzFkrxRnfIg1n4AkEvlru7fFIV4YZRFWOfotifs11sl/40eEX2/7nr/GuOF2GeZ7AUYuaC/BfmCjkD1KAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793570; c=relaxed/simple;
	bh=k+CqVpScWbP1p48LTH2kXVwo5Ssi8+hZEw2CjOqf9vo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lNBBcVGAo9KYHRf2wFYim6aQj1VpqijbXUSV9jwfRfEx26R10O/hk5gOlOpzpbuOYZYGjCW+v3xMUCiqGcFigV6xwynGM5gj4FwL1f4wk7XdLQTLNTcVZgDBdpGrjiAxN4Z3LvuespuTm4xACr2UUc5rF7hnzME5mjTyYLAzWGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Voo+srXv; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Voo+srXv"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba40cb7246so704277e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790793567; x=1791398367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aeNCYFzb8b2KgrRiXXEFlWiBLqGLegK23GWQ11tnNlM=;
        b=Voo+srXv2/y9+/yOp/VeMtIKl/SkIPAxxf8TmQ5DYTefTD+6ZgBEg5iuHsjOIkpmD8
         voOJhIGsNlUxnjodRKxNHA8qKbYhy6xNkHoD+GgzEp1BBZlu2ZlhnYzIDhRsQ7vatS2f
         5Ok2vVIzl/q9Auf1hxUf8Fiv9qE6P1gQTiMs5pyvprT7KTrRDvWfB327tEd888Rs9Qw0
         z7JjozJZba2xoIFAEkjpAhdjLmceAaMxdysPaJ9KVoONMbNMcNBJ3pyGAnZLCcxoeSYT
         nasoug/r6ZUBku5NcvCpzm2AQUjv47G3Of7D7SGMPxq6NlgqgMsuKDnS9mNsfgTBLpn1
         eYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790793567; x=1791398367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aeNCYFzb8b2KgrRiXXEFlWiBLqGLegK23GWQ11tnNlM=;
        b=voTIzf1BW+uwxpadX64Q2s6E+0FlIGiG2j0/k/+xdpq3n3poghR9sipgttlnpXMYGt
         /lpKix6X1/eJ+MXaFb5RPLyuk3ZtqRUSpvkSFgl+0F7/KWVeGzODaZLDcGS63+PBuH62
         7oEXoi0lpW+wK3Y7evcCYMB2HSLDTFqRlAxolrCwB/KLnPFhRV4Mpm1LO1f8VXV+CAWB
         U9QM6wQ6ExubzYxuOOvwgKAPbJHJduMolj8a/KoBrN0QoPivlku0WTJxSsu1THjrWWKu
         ra8sKs4wL2ySgF7CPE6/devzEudHNWDSE/KJAR/5MjQOhp6kW58Mpl+YzJGKUYNhepeH
         sIVA==
X-Forwarded-Encrypted: i=1; AKwUvBwxX6AtTQ8TOIuefZJRu50aCpiLLIoTMVyq6T+TM0tCqViwddpL4TQs5p1ZTnPQ8xMWIJl+LlcSc/aKflQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgzsbmr1b7mfxh0Yov4fcSy8jUliJlTaTq4V/BVuquXvdOO0Eh
	dkrTSG5EuLdbtvQiL/lJHDxXJMH7pAJi6IazOUr8bSZ8p8Wo4iZPeVAE
X-Gm-Gg: AYBFou2nkPA7wscIuT7UQm8do/dfRW9hjvfrODHcqVz2yQP7d0QMrpHppAlSH+/Cc2F
	GkBwQu8mgydJgL0mPfI3ZlBTLMnwtEddaOgFzrOZRH3P4wibdRkKPXeReZXwLHKyKke8g+DqTaI
	twvkMzkLYcpeAr8EXp+2K5nqvSw20v+48KiUrYpMfv1VSW4Azcvr0E9F29wrfJLpO9n5sI7tWtS
	PSoGpXprrewTDpmtbbfX1GRG/dCVYSnPvwvIK8PhDslwaPwqwSMEC3/jvQXqeV/91dEsGnC0tQ4
	VWm5jylTEbO7Z0gkR/Xsi3axI7ddO2RYumn3bv+2lkd7UfF2U90Lh1/yQh5gbci8VKIl0yNsuTR
	TLCmK/tF4M+sQF7AlegB0Qfw4f6rl0AzQd8eIcNyMmiahPRu3U9iPMTDaxn5ni+E4NYebBYtYqO
	SB/oK9X0PmFEsw4NHSzz3uZ7zkrTYCMJAeK1JUKTlRIeDLpuRdk4hyWtUQlQ3LoFa8Op4zFvPpW
	uN6lMeGj8GWV3dRlE0ceTDx4p2xnTXJiJwoXWu/DOPV
X-Received: by 2002:a05:6512:ad6:b0:5b0:82d:e90e with SMTP id 2adb3069b0e04-5ba405f506emr805350e87.19.1790793566821;
        Wed, 30 Sep 2026 11:39:26 -0700 (PDT)
Received: from dau-home-pc.. ([212.35.169.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fbb999sm156593e87.62.2026.09.30.11.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:39:26 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v5 03/14] vxlan: report the drop reason of __iptunnel_pull_header()
Date: Wed, 30 Sep 2026 21:38:59 +0300
Message-ID: <20260930183910.3151873-4-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260930183910.3151873-1-littlesmilingcloud@gmail.com>
References: <20260930183910.3151873-1-littlesmilingcloud@gmail.com>
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

