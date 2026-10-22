Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792705959;
	b=ZJ9Jk/yDkWWyhkhdzx9jB7ZaiSamR1HweYCMPhtRIPInx4buLErFWIAwEq8MyzSRmeFM
	 5lQnJ3WQ1pAchUXH2TeUNTn136cfSEKXnsYcMzGyVWsw0UQs/eavfshECrtqG/GPqfsYa
	 hAduX5ixflb4To1TwrzU3rVxryFqtz/7yJQz6w4BYtbwMOWZH7qRqliOL7dzqfdGMGKfm
	 K9Pw9tRCYJQZh1ksCLtUyRx+Gn6Dn4mgipjPzIzsonkTrW5dT+X/ec4z9hSpTwDWFnmuw
	 C/Pq6q7zFn83wuH5Qo5Ypm+3kMtOu0dQ+aqK4OGOvOSOphoL9dhTIPkvsOn638wbcng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792705959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kAZzQudwd0odx3okt+/7lzQEQ+9EG04goXUtaLpNBlg=;
	b=MG54y5MNoTLdCqOtPJQEdmhBIYP5xlRfUC3aBEk+o1qfgevTiuewhRBrKmAJYShtuSI6
	 VdXBT38nmT/hoM3TmxBd6Zs2GQ9Dk0je+hYFSfwBv8gOzTPdxRoEYaVhUyZg5p9rqaL67
	 lVElwkCEkn+FrBYcO83WnRSEeh/XiSzBabwzTztr4Ubo14QzgUodPB2gHKy6O0klEePvr
	 kwXzi63kMVvAsMyMi5Sj2kCd4U1uG0UBi5opQyXj1Y0XbQGShcHhudQp0Vos0dZNhEjAS
	 Qk4kvdZZzkaGTVXeNOq9FsnHNmO0zv8B+IkF3lIIeHkKjy7d23VECP3pgcr5yCEBljQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ot48Ldaw;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647FC606A320
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:52:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 647FC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ot48Ldaw
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso1163615ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792705958; x=1793310758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kAZzQudwd0odx3okt+/7lzQEQ+9EG04goXUtaLpNBlg=;
        b=ot48Ldaw8MX/m9Dl6m7ceKmUgfdjnnPh0EEIj7F2gdw8sbBzQemOH47vdVXumJOyH2
         s0bf38upKJe8SXGuyxycYLSdE3BfvLXifG6ORSJMNObjh4o5OHXznmQ+jRuvW8KA5soL
         iqTo2LVOZl1TAgAUmvDmog2mmzlRKUn59ZKOR2vaeJigRs9M2FW85yhQgGRXXQzKqtBF
         2vkAtICRpxhXXDBvduy7uJVE/6KhmnZ4s4cgaVHzpPXH+oSz5ciFE7HYUi237LkasF1N
         Le8pHc/qQFUeFwRHJSu6xTBaVQ379P6jyqlY1SVwTt0VW/LQet5CtqNSVl/7UHtl6ckh
         BtbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792705958; x=1793310758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kAZzQudwd0odx3okt+/7lzQEQ+9EG04goXUtaLpNBlg=;
        b=V1K7qZNJd0Ihe1PfOVyMwvEycBogT3AwVmTY7dCvguFJFxPVE2VeRP0Fj2BjvmvQLs
         Q4RFVNI2tc/TUypkr/L6N0rmzktfbXjxcN6w2FERsViiS3iBoSvzhjV6gpo+mHGmKWUs
         0GAtnK8JLnEtCCYojKtK2fH0G/EEMHAnXkPHW0wVbrr7QKQC7yXeg2P6CKpBAOtVtAnT
         ptCTs8lh36n2YcN86nkEBWMCsuBHWGNCukoa3C4pyc7m+N+Mk0UdNUpuc7ED67JzKtNz
         hxye3zOccJGo2z9JM+CcaMvA3qRKBU0ldUozqDUXmFBe5paxtDXWqzWz/3pFTY1RrGXX
         llZQ==
X-Forwarded-Encrypted: i=1; AKwUvBymYhzwdiVhDLbiYkxsXULmbLZp02UO1YoX29RD4OiAC7jOFuJDOjatxiaxAM3Dh7G9Kd2MSD6uBPlOunc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKW6nXa6myjYRvJO7UHMoU0nAPNvixlIemAwk1nt2a9DyG6foA/
	c415jSMjHdqGxk6hSmv6/QzLkn3IXrQlLR34uftblb+oGJ5+sPspgjLQ
X-Gm-Gg: AYBFou3KGE4Jo2rRtb8tRtPwETDIzDcZWW4erm4KdmxaiaO3tdLfiSNQWExabgNCAOd
	iNuFO98nMuMcw83jInaO3xdlyzS8gvMX2LsYj+0TbXVVe1JHU4UqA401rfy6dOa9Pp+PzFa8oNR
	8csDX6Km8a/lbcoRkVXmQYAg53HB5WjyRE0ve4CNCgH063V9k2pfo5vABF67ksn5qel21Oh37Z+
	PsBCosMsrZrTw+vvVAHXnXMTouTW3DxLzWzRDta5lChT14koBHf6U1J9ZCpOIpQywkKhFttHJgh
	4i5YoHMalwqqGmJrteGwzEOJFLOZxmc97GnELacdz7ba1DKqnf39nbpFITgoiZuL9/S6alt4zbc
	GL/SXNQVavEFavxQoHJel3LTTkz+8c8QqFrzJRG1jjzn8KHvdqPmL5Jr7I9Ow8UsMbEVAphEosG
	hfduANQ5+xRwC+QPcMOU2VMLU7JZwt/pW7f6U6SR01t2XUBXHeVe5xggCE7pig1G7oXlaUB5Oam
	f6KJ3BlEkijhIVkrL5Gh8Mq0UgM3zxDxpFk0evRmidV/rda71klBJL7pVXGDWzchUVyzMr/MX9/
	MXqnvsSWD5ByphotzCaJgEj9/H9RKq+He3rcHH5BUzImokvtNI2QjJ58AO2wGBHeMiI6ZQ/TOmJ
	BmljgTSuLUvRSWC+h4szLnjA=
X-Received: by 2002:a17:903:384d:b0:2df:8f19:5db8 with SMTP id d9443c01a7336-2ea7d1669c2mr4002555ad.59.1792705957657;
        Thu, 22 Oct 2026 14:52:37 -0700 (PDT)
Received: from ryzen ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b3b01a6sm3090325ad.44.2026.10.22.14.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:52:37 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@openwrt.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v3] net: bgmac: fix TX DMA unmapping and slot cleanup
Date: Thu, 22 Oct 2026 14:52:35 -0700
Message-ID: <20261022215235.3692083-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

When mapping a fragment fails, bgmac_dma_tx_add() unwinds with the
wrong slots. It passes the failed fragment's slot->dma_addr, which
holds the mapping error, to dma_unmap_single() for the head. The
fragment loop indexes from ring->end instead of ring->end + 1, so it
unmaps the head a second time as a page and leaves the last mapped
fragment mapped. None of the affected slots get their dma_addr cleared
either, which includes the head slot when mapping the head fails.

bgmac_dma_tx_ring_free() unmaps every slot with a non-zero dma_addr,
so tearing down the ring unmaps these addresses again. It also frees
the skbs of pending TX slots but leaves slot->skb and slot->dma_addr
set. The slots survive a down/up cycle, and bgmac_dma_tx_add() only
sets slot->skb on the last slot of a packet. If a slot with a stale
pointer is later used for the head or a fragment of a scatter/gather
packet, bgmac_dma_tx_free() frees the old skb a second time when that
slot completes.

bgmac_dma_tx_ring_free() also picks dma_unmap_single() or
dma_unmap_page() by looking at slot->skb, which is set on the last slot
of a packet, while the head was mapped with dma_map_single() and the
fragments with skb_frag_dma_map().

In the error path, unmap the head and each mapped fragment from their
own slots, and clear dma_addr on every slot the failed packet touched.
In bgmac_dma_tx_ring_free(), choose the unmap function by the SOF flag
of the descriptor like bgmac_dma_tx_free() does, unmap before freeing,
and clear both fields.

This was found through code inspection by an LLM while hitting other
bugs on an Asus RT-N16. It did not hit these ones specifically.

Fixes: 9cde94506eac ("bgmac: implement scatter/gather support")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: clarify how this was found
 v2: merge two patches into one
 drivers/net/ethernet/broadcom/bgmac.c | 41 ++++++++++++++++-----------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
index e66856337d33..55d126c7d35c 100644
--- a/drivers/net/ethernet/broadcom/bgmac.c
+++ b/drivers/net/ethernet/broadcom/bgmac.c
@@ -205,19 +205,24 @@ static netdev_tx_t bgmac_dma_tx_add(struct bgmac *bgmac,
 	return NETDEV_TX_OK;
 
 err_dma:
-	dma_unmap_single(dma_dev, slot->dma_addr, skb_headlen(skb),
-			 DMA_TO_DEVICE);
+	slot->dma_addr = 0;
 
 	while (i-- > 0) {
-		int index = (ring->end + i) % BGMAC_TX_RING_SLOTS;
-		struct bgmac_slot_info *slot = &ring->slots[index];
-		u32 ctl1 = le32_to_cpu(ring->cpu_base[index].ctl1);
-		int len = ctl1 & BGMAC_DESC_CTL1_LEN;
-
-		dma_unmap_page(dma_dev, slot->dma_addr, len, DMA_TO_DEVICE);
+		index = (ring->end + 1 + i) % BGMAC_TX_RING_SLOTS;
+		slot = &ring->slots[index];
+		dma_unmap_page(dma_dev, slot->dma_addr,
+			       skb_frag_size(&skb_shinfo(skb)->frags[i]),
+			       DMA_TO_DEVICE);
+		slot->dma_addr = 0;
 	}
 
+	slot = &ring->slots[ring->end % BGMAC_TX_RING_SLOTS];
+	dma_unmap_single(dma_dev, slot->dma_addr, skb_headlen(skb),
+			 DMA_TO_DEVICE);
+
 err_dma_head:
+	slot->dma_addr = 0;
+
 	netdev_err(bgmac->net_dev, "Mapping error of skb on ring 0x%X\n",
 		   ring->mmio_base);
 
@@ -535,17 +540,19 @@ static void bgmac_dma_tx_ring_free(struct bgmac *bgmac,
 		unsigned int len = ctl1 & BGMAC_DESC_CTL1_LEN;
 
 		slot = &ring->slots[i];
-		dev_kfree_skb(slot->skb);
 
-		if (!slot->dma_addr)
-			continue;
+		if (slot->dma_addr) {
+			if (le32_to_cpu(dma_desc[i].ctl0) & BGMAC_DESC_CTL0_SOF)
+				dma_unmap_single(dma_dev, slot->dma_addr,
+						 len, DMA_TO_DEVICE);
+			else
+				dma_unmap_page(dma_dev, slot->dma_addr,
+					       len, DMA_TO_DEVICE);
+			slot->dma_addr = 0;
+		}
 
-		if (slot->skb)
-			dma_unmap_single(dma_dev, slot->dma_addr,
-					 len, DMA_TO_DEVICE);
-		else
-			dma_unmap_page(dma_dev, slot->dma_addr,
-				       len, DMA_TO_DEVICE);
+		dev_kfree_skb(slot->skb);
+		slot->skb = NULL;
 	}
 }
 
-- 
2.56.0

