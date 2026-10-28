Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206122;
	b=BInu24vJMlB01dOmf+adlSLNDnMiJpbOu4+xnXg18mzTFyIw0RmlzJHKPSE9XXKDcgx8
	 4j3nlfvOdIZ1N8DOxAJz0tFaRQE2xwuWMxBbud5cDSlnzc6aolwtn+ilfOIIA5KV5VOK6
	 c3zQdYEKt1X6ad+Vu6HiCGV5qMKw10d5qqcELmQYfEn0rJxLTbMbLB2ucL8DC9UZ8FCJf
	 EaxBn0ToT5wDw4ZhhLZeyt8vW4BWfdf9yqIl4Y4j80UeAEX8LFeN1zzxcqUWRYoAa+pPE
	 nc+goQceClSDZextUdCTodiC72TZh6Fro1zeALUEmnrJfQYHyhNo58CxjmPphrUlEtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uTKv7o5wEeIa2ZcrNPf0G5eMIzWNUCOefzs9lJn1fNI=;
	b=5g9HAn1kZDEi1rPlqPyP9YiyYWNVTnrEBHSb5nD7rUJPaFlbspYl8Fu0+Egjh62sJutu
	 3UKWUXJ0WiR4FjiMvJSdFq/pw7h8+T2uW4wX10QjS8SycWbKgt6KEIfccxGXK69wykKzM
	 Hj1nZSg5mS/gXIitlWnOI+MJruJ30I+pQzhgRsxP0h9Qu8wwp0aA7cduu4XTVbSIp2Xuh
	 wmHEkmaHwExgkYPph0JH5IDHhIbtD3EOcBLa78eGnXGofUbfvcXYsarps8CKLOhgarnyy
	 DZ/XGIGJxU3omVOcuFrSKbJlFAmYqdgVv4TP5ZkygVyCgRSHCbV32APR6FdPYHQkafg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="sqb65/3P";
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634FE606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 634FE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sqb65/3P
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3adf5f6833cso746249a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793206122; x=1793810922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uTKv7o5wEeIa2ZcrNPf0G5eMIzWNUCOefzs9lJn1fNI=;
        b=sqb65/3PGxEYqSWxl9LZMOMAkCPsM3gPBXL8xRaQcFyKfbh0pzxOAJR3a0E2el2jg6
         1WB64NXzF7pJykW4myL/kTii1qrJoVmaVfEL2OngzTwqzH4EyN2LmQcPtc1Breb2xM2+
         q1kx+ZMEPxdpr2MftdFg4n5phYcx5KN+JzTbytf1nWB4n3isP+UV8Hmlj2bC8CefW+RG
         FgtN9PhMSUMY4EjyMcT4n6Jq6OUiURbEk6UUFppGPeE7D0GOERGQQWkjHCCEidQhy0cr
         AP2QYiyy4rhNLHcM0Wq2KyTAGJMnl/lLhK4QqxH/VAixXBIxfaL45IJ8Z24DP8/Ezxeo
         0VQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206122; x=1793810922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uTKv7o5wEeIa2ZcrNPf0G5eMIzWNUCOefzs9lJn1fNI=;
        b=wS9sCxVrh3MxmmCz9JetaeaKTO1q2E68p/NiYlvnvS2sOEhAe4SNBWoIZVuuaXJrlz
         Z6hVDDI0zqxEtM82bTK3fcnZRTLHNk8WMLSiZVp1tz1hF/Yupt59dxoHVMwxGtJz5uJk
         /sgK/7L7NRaWoQhNmeNHQeGqx8SgFruJjTtpsm+OLtfE7Z4XF4TwwYlTiAfi/qsfQB8C
         5JymQWKsi6bw5CSRLoFSgNuhOHUimIF99Rmbh/hAz0rN4eJM7b7YWReB2oChLMc32/25
         luByTpHxvqEntsbm95PC8UBeIty0Pg21UXjtFX/QP5e/WPpLiqGb3UoHnakTG3/fiYrY
         UYMA==
X-Forwarded-Encrypted: i=1; AKwUvByHyQEnQjn7KLsiTrFZwmscfA8BqHiA665Uo2ujQw4LdpMqjemWX+42nAIphXmIsXw9FRwaucTmiQDaj70=@vger.kernel.org
X-Gm-Message-State: AFq9FYITAIHzXkMhZg5MIS/gZE3ASnVBlVK1H5ySLQZtsUpZNS4UIh/3
	NgNmQaKfgTNPhhyprD9YzP3ADV3hLRyx8Bm2IAFdFn3CAWxe7+3B+XpA
X-Gm-Gg: AYBFou2GjjiIwy3y9LloQDqNWQoZFL1+84jAdRUczKslH28JIW7NhoW7Y2UqD9SKpTe
	HVw5rj6IXDZjkE/BiN0q5ljFG6kPVNM8jQsQmzAAzYD3jC/FdpnHNDNHD3Am7JA5sWee5cuRxiA
	wjc9MwesJN6tnNZyp93U+8KHJv9AFvvxDwPTmT91OQLDWGcSnVhbwvsC20e4hGw3x11L85ndDql
	n/3D8q1Y1Uy+HJNVdFPoz4v5U7hc3JpZFxmwQRLy53MfnUtU/FE1b4YPg0qTb4NsE4e8zuC76oT
	BXSwUAufHKR55TFTysYUwZ/JkpvZSWSrXt415OKnoiqmRRRVYvK6kKuu+Z1VNk4SLRrbnBeM0sm
	0/Wd/59Gu+5ez5LG2N8if60lbVlAiy9p+mj78k5bPQRUYsRrrbIM8y5cJ83z2Lv5DEhcw8b4niA
	D3Er5xhW7JW1K8aEpswrmibkrktI0x4X4D+86mQPxPFMSe1v86CfONXTG8PLH7Y82+jbem/M+hP
	2YLgy1DxN4PBpY4tP+SdMQHy/C87n3tBsibq+1oARlM/xt6E4bSzEK2tJO5RLBJ7g0VoxPEENFf
	UMUYnk+LviPfJ9o2Z6k+GVd/yIbEEilAllZynElTBqUwt9aSuqZhCYqw1TQJ/j+Zu1+HxXj57H/
	JZxZXXTfJcTdkzqI1XN3lJpOYqNuqLtFCdB69udct5EqJVTzx4brHLeLWi7tv/wJ7KXX3olfc2q
	DQ10rcHI6fkCR6wBIWLL232IPP
X-Received: by 2002:a17:90b:4cd2:b0:3ab:884b:659e with SMTP id 98e67ed59e1d1-3ae57f96d53mr1819418a91.9.1793206121579;
        Wed, 28 Oct 2026 09:48:41 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83a4f1sm291388a91.12.2026.10.28.09.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:48:40 -0700 (PDT)
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
Subject: [PATCH v4] net: bgmac: fix TX DMA unmapping and slot cleanup
Date: Wed, 28 Oct 2026 09:48:39 -0700
Message-ID: <20261028164839.28605-1-rosenp@gmail.com>
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
of the descriptor like bgmac_dma_tx_free() does, unmap every slot
before freeing any skb, since a packet can wrap around the end of the
ring with its skb on the last slot, and clear both fields.

This was found through code inspection by an LLM while hitting other
bugs on an Asus RT-N16. It did not hit these ones specifically.

Fixes: 9cde94506eac ("bgmac: implement scatter/gather support")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v4: free skb properly
 v3: clarify how this was found
 v2: merge two patches into one
 drivers/net/ethernet/broadcom/bgmac.c | 47 +++++++++++++++++----------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
index b3a92ae95de3..669eb7ce7d40 100644
--- a/drivers/net/ethernet/broadcom/bgmac.c
+++ b/drivers/net/ethernet/broadcom/bgmac.c
@@ -208,19 +208,24 @@ static netdev_tx_t bgmac_dma_tx_add(struct bgmac *bgmac,
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
 
@@ -537,17 +542,25 @@ static void bgmac_dma_tx_ring_free(struct bgmac *bgmac,
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
+	}
 
-		if (slot->skb)
-			dma_unmap_single(dma_dev, slot->dma_addr,
-					 len, DMA_TO_DEVICE);
-		else
-			dma_unmap_page(dma_dev, slot->dma_addr,
-				       len, DMA_TO_DEVICE);
+	/* A packet can wrap around the end of the ring with its skb on the
+	 * last slot, so free the skbs only once every slot is unmapped.
+	 */
+	for (i = 0; i < BGMAC_TX_RING_SLOTS; i++) {
+		slot = &ring->slots[i];
+		dev_kfree_skb(slot->skb);
+		slot->skb = NULL;
 	}
 }
 
-- 
2.56.0

