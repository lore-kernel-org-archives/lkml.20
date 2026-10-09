Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EC34C754C
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791544327; cv=none; b=n70i16zEZHJvxNtmLRLZq3NEZCcnWzbOHgcC9cfw2xM/+3LS5OHqz3uErpA4v6DB8rJ9z6FhOeZ3+8ri6/ZY7iTaalbJFQXU7nWOKk0+nPH9YoC92UMcHx8Fu5JIFq9v/s/4coCSjO6Cxinqg0F1W7iVgi16F5cr1dlk0LTOvUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791544327; c=relaxed/simple;
	bh=6RFQ88waLnY/Bpu2cL3BDqD5uUezWvE9DEE2Q6Et8DM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=unPThErmakzNxjRunO4Y+fxoa3IxxDOPFBDgP3YC3gXhXESvDjZBv0nkCm29Dp+8EKfbnyMDFPIMaVTJQV2BhmN538l0h1uOPTmTnNsPGUZh5yMQuTDDM/9xuncnNVQL0j3YCfAH01CgnD3Lukh5qwlCe1RkETs4OFUN/Jqyky4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a25EA/fO; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a25EA/fO"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e4a341d177so36642825ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791544314; x=1792149114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ToVjaLw2QkDyxt21XUlKuHYlfWlGfRLzYFmO7NKSmk=;
        b=a25EA/fO8o3k6x7QoHnbF4t4GpjdukrrlbfkpH7SiNuidp0i1psqxMx+KMjhAH2O0p
         lGGXG2IrFbYpgMf2qlIk1dZiimOv1DvDk4vQ2DIJ6ABb8P8KVXn5M0Crxm8/NqMIoKQt
         keWCycX++QRnIDFHyrTsO2yoqzm0eK+Sxiqg0V1EVN0b9CLfHrTkDMqYbo5L32HuQYrX
         BoWlXuIgb4sAfcchADSOF4/4FmkNxNg8tro/TALe0HHGQ/7YS4seYDnNtVCilGjgvixa
         njnKKvIc/hmpG77ChRarACR9WPUhpN2ZOHYZayHrIRHOsI5bnZE1nD+EiaIHNb1sNQaK
         /rCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791544314; x=1792149114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ToVjaLw2QkDyxt21XUlKuHYlfWlGfRLzYFmO7NKSmk=;
        b=u2VlBTw7TlMZ2Eu3mqUrPmaHUBVIYPReIVLT8+osZeN48V3WhprmW/q2/zQuBaFz2X
         FKPJKzP69K0KVQt1sFPjtIEvGs0i4rEceAm6z4TiUwf//zbncST3C7fNgauu0je8oxHb
         HOEZFE39GiW+yx/Q/nUl5Rg2/LP1evL7uua6etKdfZpU8eba+/8xXfjFtEX04a6rgXJG
         VUw3Vi5QBhdrKMxg/3fWmPB7xXFQc0DjuQqy60bg6eDMCnzONh2gXlVaFHo3lYipeG9u
         wbqznuvcu8DOVZxXiiwLy6aiA7qp15AQcOFtj/bkD5CzJWaqDG82+A8Oxp99i/JEIP6m
         LIIA==
X-Forwarded-Encrypted: i=1; AKwUvBzkOWSDfo+baGBxugpZwg77aTtDNqPvgX1zBZb9WputLfKxRlBWa+ldda2Tpj5DvfgdHv3ruhQNFcSd/Hc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBUrOsRFpR2c6MLIf4BBEBQnW7dLNWtltr0bIg/JR3rWnJhBAm
	oXwH6JjDnNP26azjl4E8wwpJcwrpDdq3kT46wrhy4KFDUeajF9lbsmXb
X-Gm-Gg: AYBFou0kHA8QN1t1Gelg7m838vXxvVg91xv3bPf/ugw4epcMHGGR0rPt+1QW6CQufpH
	CQ37XaZOwtSZy4DdSnczfN3mNLivvV8HP52JCOZ9nepF6Qy2h5U50j/VfXoB3XJ4qlUakhQ8jqI
	lThcmq42pPE/uRBc0ZhDnsa9zdCAT+52/DSwQKt1kjvr3lBmHsMBnmFMnsmxPlTFmuXwZzpDK5Y
	YuBtDtLpUmrLMfS5ezQBbl7kAiLYzmrRTbBE+4s33ptdSCkEdHwtO2HzbP7NBtxpfr/TH55kvI/
	0+S6Uc7N90gnQf0e4JgaFMhZdBVFwiI+Q0yoUkAZjWTLuznAQWwmdvDxwJ8Btb658vSdlQujIQn
	bq+xW02qU8IcVZwyMA7HZNFXJlfiB3gCJ2rjDucQ+SOuVoVCHufhxdnOrS8Cj49L9jTMdvf57ss
	PdLjKJ9iIST38kc2ZMny5Yy1Wv6oDsrXXXyK8SaX6s8yIQXeQJL1u/ExbVsGqHPZ9XaEVPenWfx
	thsfjwsDTeb
X-Received: by 2002:a17:903:1905:b0:2dd:8e5:28d with SMTP id d9443c01a7336-2e84280a518mr12154275ad.8.1791544313701;
        Fri, 09 Oct 2026 04:11:53 -0700 (PDT)
Received: from online.mioffice.cn ([2408:8607:1b00:8:13b6:ac86:6bdd:a8cf])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e4ebfsm6823245ad.78.2026.10.09.04.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:11:52 -0700 (PDT)
From: Pengfei Zhang <zhangfeionline@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
	zhangpengfei16@xiaomi.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: stmmac: fix RX coalesce frames counter
Date: Fri,  9 Oct 2026 19:11:37 +0800
Message-ID: <20261009111138.320089-1-zhangfeionline@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RX refill path should set the IC bit once every rx_coal_frames
descriptors and leave the rest to the RX watchdog (RIWT), as done by
commit d429b66e2ebc ("net: stmmac: Implement RX Coalesce Frames
setting").

Since commit 6fa9d691b91a ("net: stmmac: Prevent divide-by-zero") the
counter is increased by N+1 for each descriptor and then compared
against N, so it is always reset to 0. With a non-zero rx-frames, IC is
therefore set on every descriptor and every frame raises an interrupt.

Fix this by counting one descriptor at a time in a helper used by both
stmmac_rx_refill() and stmmac_rx_refill_zc(). Platforms without RIWT
(IC on every descriptor) are unaffected.

Fixes: 6fa9d691b91a ("net: stmmac: Prevent divide-by-zero")
Signed-off-by: Pengfei Zhang <zhangfeionline@gmail.com>
---
The default rx-frames is 0 (watchdog only) since commit da2024510031
("net: stmmac: Tune-up default coalesce settings"), so this is only hit
when rx-frames is set explicitly.

Verified with "ethtool -C eth0 rx-frames 16" under UDP load: without
this patch almost every received frame raised an RX interrupt, about
twice as many interrupts as with rx-frames 0.

 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 36 +++++++++----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b837e8e27..72678760e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5071,6 +5071,22 @@ static void stmmac_rx_vlan(struct net_device *dev, struct sk_buff *skb)
 	}
 }
 
+static bool stmmac_rx_need_ic(struct stmmac_priv *priv,
+			      struct stmmac_rx_queue *rx_q, u32 queue)
+{
+	u32 frames = priv->rx_coal_frames[queue];
+
+	/* without the RX watchdog every descriptor needs IC */
+	if (!priv->use_riwt)
+		return true;
+
+	if (!frames || ++rx_q->rx_count_frames < frames)
+		return false;
+
+	rx_q->rx_count_frames = 0;
+	return true;
+}
+
 /**
  * stmmac_rx_refill - refill used skb preallocated buffers
  * @priv: driver private structure
@@ -5116,15 +5132,7 @@ static inline void stmmac_rx_refill(struct stmmac_priv *priv, u32 queue)
 					 stmmac_rx_check_buf2_cap(priv));
 		stmmac_refill_desc3(priv, rx_q, p);
 
-		rx_q->rx_count_frames++;
-		rx_q->rx_count_frames += priv->rx_coal_frames[queue];
-		if (rx_q->rx_count_frames > priv->rx_coal_frames[queue])
-			rx_q->rx_count_frames = 0;
-
-		use_rx_wd = !priv->rx_coal_frames[queue];
-		use_rx_wd |= rx_q->rx_count_frames > 0;
-		if (!priv->use_riwt)
-			use_rx_wd = false;
+		use_rx_wd = !stmmac_rx_need_ic(priv, rx_q, queue);
 
 		dma_wmb();
 		stmmac_set_rx_owner(priv, p, use_rx_wd);
@@ -5492,15 +5500,7 @@ static bool stmmac_rx_refill_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 		stmmac_set_desc_sec_addr(priv, rx_desc, 0, false);
 		stmmac_refill_desc3(priv, rx_q, rx_desc);
 
-		rx_q->rx_count_frames++;
-		rx_q->rx_count_frames += priv->rx_coal_frames[queue];
-		if (rx_q->rx_count_frames > priv->rx_coal_frames[queue])
-			rx_q->rx_count_frames = 0;
-
-		use_rx_wd = !priv->rx_coal_frames[queue];
-		use_rx_wd |= rx_q->rx_count_frames > 0;
-		if (!priv->use_riwt)
-			use_rx_wd = false;
+		use_rx_wd = !stmmac_rx_need_ic(priv, rx_q, queue);
 
 		dma_wmb();
 		stmmac_set_rx_owner(priv, rx_desc, use_rx_wd);
-- 
2.54.0

