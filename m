Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794614346;
	b=L5pUJR8eVn+SAyq8fq6OHfAVjX/RYPGMCurb6TbtonL9mB3AOzeiga5fX3DLt5V02v+N
	 pYdjyXseWZkQSDRHyrOHiFruKBI/UdEqt9YjS3p5Hg00fEnl5hrn0MwomKxvEmd3FAyMH
	 0jYRYCfBxYTBIeV3gKqYpUYa32RsqQhCjGF2Ptw7y/Bg6wUjH2RQKXALdA+HmNQXuzpXJ
	 gKCTeigYf6zo/PXhkPetpLLlgfMgkq1CBmbF2IJwOPNcL8htxwaB5ZQlQgi57Rj5C0EhP
	 49CKF9mtZfd1tAl3kV46BocFojBmOPyLeMIKI+IJjVTZDxVaPp16cjLWjXcYadC1qVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794614346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=03cfRwW20HnLIQ4dPEfEnQV9npGpZQBZ+HSNkuXkdps=;
	b=tqR6HT4wMAyy2XnPXByIBjoDcMpUxm5p4wgHaoezHyR7+z9UjeEdegGLTGYbewMkpSgZ
	 rmEIa/FQMtqF4CFjuQQw8WnSST6VRtm9SioRXEZ8QB71Ahp7+fxX91bbfvafl35jXWtns
	 RXftXE/C7LTzxbTJQt0gqhp9ntvGdky244baX/cmUXhsytdjR5sx9uNNoQDI2y1olvqWh
	 /RR5X5JGUJ8LckqeQE/aSudFXpodvx2Qp598PrpXKRFl3Zjp2fJkBHtVgkfzgrguhL/gQ
	 dXFsu4UzlxGF/4Lqk+wTUzuTvWqRspOFBw1UUl2Z45yPBaWV670fnVggSO2LAnkjUwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xx+r7Da0;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A692F606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A692F606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xx+r7Da0
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4697404c2bso256795266b.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794614337; x=1795219137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=03cfRwW20HnLIQ4dPEfEnQV9npGpZQBZ+HSNkuXkdps=;
        b=Xx+r7Da0fTyvLK1Xbu14XQZMcmFDLgsAHCf5n+TPmyVa+EGiAC68h1pmwxiGt6rfG4
         ncjx5LwWrGAuQXeD6m9cwI3NbmgLy/BPkKPi7LsmPmJtfJQfpvn0UFU5r5zYGtidvjSG
         bAwrSPoKOsP03MeoSEDy42r+EUf94CNr/hLianDfGWmGYJdQlxU9utsLS/auSQ72HGqJ
         1b0WZsmW1MH2EJCyYKMVSyWu91b0TtXUoAax20ojiNCx9SawzhXyoSWxtFQ+p+b7vwKK
         zz2ZxQRHSwA3H7Mo6dU9PRMgAaANkPYKQm6egKhrtHZKkZ7ODge2svrVSi6gc59/LQe3
         Eirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794614337; x=1795219137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=03cfRwW20HnLIQ4dPEfEnQV9npGpZQBZ+HSNkuXkdps=;
        b=Cyv8ehiKCzKmcXnHGzjhSgjC9uEIwqljmCYn4624BJixuU797U9MBhXQ7XTibhF45J
         AlJw9wVZt2ci4vCfEBtSmOuvC5vx2twV6zKXW3hfZD2703TrK3KkwtxiJBEayHSa8Sas
         HuZiSmcm0rxg97rafPYAbaJMiKcAIHt92zkGTgFbMq0Il2tDjWnMSTKkw3cdNrc8wcTq
         FKpwlk2WGUY7eSjDoCYNnFBIeZn+4hOdJk+2UG6r3btbZENRGXryQtNFyQbYDW/OE5oF
         xpQFbjRB0W4i12g4NkJ79/VUvRHF0sHTzZiHveJXhHVvToWvMngaIGmi5OjB39Xpp+0l
         On3w==
X-Forwarded-Encrypted: i=1; AL+hErF2LHXsh+8UWLtwfZt98eQ6R9T/49QKU3detxZkWkrEhH/ZpXMSMk86DFwjTaXQwHK7jc9ahaKbXjj9fjQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wvXQ9dkVk5lcXPi3nhTu2HWJvyHagmUiFNM2YiP7pfU5Y/niJ
	MfIBtDg3YltRKirQ/AUDM7N8hJ6+7WmuE+cDR11cVHUuDc9Hj09eqbNl
X-Gm-Gg: AYBFou2iZ/wUg8xy156jxCRx3ShrjwItl0zA9IeIjWP1CD/3DPuGVkfl2dctyAz/JK0
	Qu+Rw2hpkWVSgs8mpTJndxgAAIbkCGTbIrr1nlDfJt6jF2miHlk4xWlVq6X2xJEATWr0Cr48Iuy
	Zd8hnmJAgIgGsuLv31GkqWqULEKzk3VRxUShgCwdFYfv5IA/1X56Wh3U3kEOq7FTIL49m3RElnl
	87LY8TEV1dHLuRM713rBHfupoKbemCztyYY23H20ajblmy7bqluCV72fyIYGf02I9tgFQYb62G2
	ER8aSK6WS+gpYC1ylA6LAzzZ8tW/d0IWg8TM7tCnO/ikKhx17o3A4oE/plbu8QddQCT/MJqm79S
	QwpZMMyw6FiOE7+tIx6P14e7NQ6k5HZIQ38FnTTO2I0nxWgevH0kkWdZndu1ALIp+ZhNhwg7wPj
	vDpOe08DJ++7rfZWEYhF64g0pR3zgbBei/ugR5JC5YDxe63wvn8jqLgbJiQeVIvc1FC9BaMH6A0
	pDPEBig87yvJRszkO9xDU+aDUIAW1lgszmJLjsOVCwDsP/O6hTOFI+GpdwPq+Gvtj5LmqRfdNu3
	+dCxSg+aj85mlbARZB/MiYPR6Yqrw2YH1vqTHv/0
X-Received: by 2002:a17:907:2d9e:b0:c31:e9b7:f10b with SMTP id a640c23a62f3a-c509664589fmr345497666b.42.1794614336882;
        Fri, 13 Nov 2026 15:58:56 -0800 (PST)
Received: from kordpc.lan ([2a13:e746:396c:c600::8f9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b3dbaesm153454266b.32.2026.11.13.15.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 15:58:56 -0800 (PST)
From: Kordian Chmielewski <kudzo51@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	bcm-kernel-feedback-list@broadcom.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 2/7] net: bcm4908_enet: drop a TX frame whose DMA mapping failed
Date: Sat, 14 Nov 2026 00:58:42 +0100
Message-ID: <20261113235847.517308-3-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113235847.517308-1-kudzo51@gmail.com>
References: <20261113235847.517308-1-kudzo51@gmail.com>
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

When dma_map_single() fails, start_xmit() returns NETDEV_TX_BUSY with
the queue still running, after it has already stored the skb in the
slot. Documentation/networking/driver.rst treats NETDEV_TX_BUSY under
normal circumstances as a hard error, and a driver that returns it must
not keep any reference to the skb. Here the stack requeues the frame
and retries it while the slot still points at it. Drop the frame
instead: free the skb, count it as dropped and return NETDEV_TX_OK.
Map the buffer before the slot is touched.

Found by reading the code.

Fixes: 4feffeadbcb2 ("net: broadcom: bcm4908enet: add BCM4908 controller driver")
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Kordian Chmielewski <kudzo51@gmail.com>
---
 drivers/net/ethernet/broadcom/bcm4908_enet.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bcm4908_enet.c b/drivers/net/ethernet/broadcom/bcm4908_enet.c
index 60f711e8c..b1738d954 100644
--- a/drivers/net/ethernet/broadcom/bcm4908_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm4908_enet.c
@@ -537,6 +537,7 @@ static netdev_tx_t bcm4908_enet_start_xmit(struct sk_buff *skb, struct net_devic
 	struct bcm4908_enet_dma_ring_slot *slot;
 	struct device *dev = enet->dev;
 	struct bcm4908_enet_dma_ring_bd *buf_desc;
+	dma_addr_t dma_addr;
 	u32 tmp;
 
 	/* Free transmitted skbs */
@@ -555,12 +556,17 @@ static netdev_tx_t bcm4908_enet_start_xmit(struct sk_buff *skb, struct net_devic
 		return NETDEV_TX_BUSY;
 	}
 
+	dma_addr = dma_map_single(dev, skb->data, skb->len, DMA_TO_DEVICE);
+	if (unlikely(dma_mapping_error(dev, dma_addr))) {
+		dev_kfree_skb_any(skb);
+		netdev->stats.tx_dropped++;
+		return NETDEV_TX_OK;
+	}
+
 	slot = &ring->slots[ring->write_idx];
 	slot->skb = skb;
 	slot->len = skb->len;
-	slot->dma_addr = dma_map_single(dev, skb->data, skb->len, DMA_TO_DEVICE);
-	if (unlikely(dma_mapping_error(dev, slot->dma_addr)))
-		return NETDEV_TX_BUSY;
+	slot->dma_addr = dma_addr;
 
 	tmp = skb->len << DMA_CTL_LEN_DESC_BUFLENGTH_SHIFT;
 	tmp |= DMA_CTL_STATUS_OWN;
-- 
2.56.1

