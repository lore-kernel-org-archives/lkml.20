Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2253655F5
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791615999; cv=none; b=NUnz4HsLnrt1lfd3XXquOKYeLrWt7IZVlh+ikJbJpvC0DcvvqvYHvuPKB0gos7+seiBj7OLswhks9yyE4VnWSk8L0lpNBGuxVUawe6bIOAUqKB9tVpF8kjh3x5SDDvGWPaRzex0z1z17t24XsxvDXKM3uwnvrRBYsbXrwJ6IjM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791615999; c=relaxed/simple;
	bh=6I0EPpmwpmvUzUOUBPqtUUg6dmVPu3NOT1khsU1IydY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iM0TY7WV7qiqjJlHStQfgNb8TKEwvhTPv9BOd+MiTtNheZWPEvQf+YQ+w2V0wJmGyOQ0N2ty8jtYCcPE7Ypbh8nnKIGyY5REM1NCrv9erl+bvKRAPkFCfsYv9upJsTCe1e72Q08lYGTJmcFxYkpS4G8kahoxwq/X6Q4Ef1RBNZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pjns0fgh; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pjns0fgh"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd1e069cb19so241892a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 00:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791615998; x=1792220798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bbsPZfGBd2rav72sK74P9etUlxxSzGjQ86YpqChNaKk=;
        b=Pjns0fgh/arPzBIJtcbAXrvEXd8AvaZptX0ce3WwJiHrL0tGI9EMdk2jgK+WqpAlvm
         in1kQ2CVLoQ5hstrv57aKu4c+yVCJDuWPD01bq2/1+5D83qRtSQoEwadphe6WV7pr9m3
         QEhQ95G0O+4W38WjeA0Y1ZwiuYC3wK2AHGNjQiu7rdnYj660U76KLpEzOOvkmB+HiU6i
         kVHsN+wyzMNjxT0ZzFucEP1tZ6TsALIUrClnn7+NiS+KM0UGkzA3BavgfP74oWtBJT4f
         hDn6R6D8Dtg3V0qEYAhZH2WtaQ+ssU2I2y8rtGI5jDPP7pOcyMjYRZb25wbPG5SarXPG
         tNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791615998; x=1792220798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbsPZfGBd2rav72sK74P9etUlxxSzGjQ86YpqChNaKk=;
        b=W/K+QlQ7dRZ6az9+XrKzpJ5y0p/BcpTUnAdOMZpF2V+k/eRUYNWHJcXdSEeLCLkEaE
         aC+9rlTcOIETFrmcMHb2Vqzlh46SmXOQgzYx6Eafs1vclydy8QPGVERgNnwLtUZyBfM0
         bXEHeUPf238dHfldlsgddQd8SSF6Znyr40/T/yOwGfPm7ivYxhBQbareXqNVLLKeNv+m
         sRUsNYy1n7dDa472gD5ZAqg7rbgVn7FBLC4WLcdS0/OR7IyMXA34Dn85jtYiEJjvEs+m
         oRA7fOozacJmChmK7EQmxKHy5yUvE8y4KgNSiwkptvsTz1ol+8wh2uMaoDc+OOL61LRb
         1pQA==
X-Forwarded-Encrypted: i=1; AKwUvByOIwpiffHc+Zs0Cwd065c+r15PmzQlHgq96bXQ6AtM/OQTivIbWhzp1KLs4txCjxc46tByhvVaCO0F0Dg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0myElFKRuNr44ewARbs2Jq4ORTsUiNnFay+S7kDQrLI1mKqv+
	zKPFzR8eN8do+4RfJTjTej5AciCqAG1rNDvaAsgQcgaxb71vwi6uEl/kw1Mna+UE
X-Gm-Gg: AYBFou2bmUNs34wZYTeAaMpVt2B6kPg/L2LWKP58JBfLjb9mkaozGxgbPunOcfTqdPk
	GRSzS0F7jxnK8axz7GofxDr5zD0G/RCcH9ATZ6FsOxIF4aqfkNJqXoYqpE6L2oV3Xro09UGNNVN
	iqMZmW6+xeAAJkLrcQNxTcA37cgEIF4hrVfSpStztpezkIyeS611S88xRSLHKCd4W9YI+EJI8DW
	l1rlDRMQCfYj6G+sbTevccWZ4qLnKZ2i0Sx020hQR/vg20Aylu03DE/qoTYnsg6e1kmEMOA0qxQ
	Q4s063GWTvvSDQWn3WShY0eNCs02emhPUvMBdeGOEMLDIC4P6uj+MzQvsbTKbaJ5tFpwq0K6RtW
	CJAhyVSwJRRGdRb0rGMUD2pCRdbV6U6BIsFsVwNSFwwyU6Krk1iwVMg5ZFhsaUbOjbb/7lhUZpg
	15YMBhqM4i/b4UnKqWQhb8Ceo92GDnl6W+sBFGceKF2kcplpCTl6MyMf+oLqECtH6ifLdk1I5BW
	SIlh7d0RuRPCcIQ+58hGy3tS1iXTKZJqNPafdE6lPCOdvzWH3X7kR4tkXrWCQq4T93zmStHuYAn
	iPgXXWwTlAIcd2o1e3ioemuhT2FeEXEg0bZlPAbgHSCyp3fj
X-Received: by 2002:a17:90b:3bc7:b0:3a8:5fb7:669b with SMTP id 98e67ed59e1d1-3ab3a97cd4emr3375779a91.61.1791615998049;
        Sat, 10 Oct 2026 00:06:38 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37163e21sm7955662a91.14.2026.10.10.00.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 00:06:36 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next] net: bgmac: use the NAPI skb cache
Date: Sat, 10 Oct 2026 00:06:35 -0700
Message-ID: <20261010070635.97759-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allocate RX skb heads with napi_build_skb() and free completed TX skbs
with napi_consume_skb(). Both run from the NAPI poll, so the heads are
recycled through the per-CPU NAPI cache and freed in bulk instead of
going through the slab allocator for every packet. The recycled heads
are usually still in the cache, which matters on the small cores bgmac
is found on.

On an Asus RT-N16 (BCM4716, 74Kc at 480 MHz, single TCP stream unless
noted, iperf3 median of 3, A/B in the same boot, two rounds each):

                         before       after     (Mbit/s)
  local rx / tx          242 / 210    251 / 213
  routed down            154          156
  routed, 4 streams      69 / 83      71 / 85

Routed upload and software flow offload were unchanged within noise.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/broadcom/bgmac.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
index f40fde1d6bce..df2f0a87cbfd 100644
--- a/drivers/net/ethernet/broadcom/bgmac.c
+++ b/drivers/net/ethernet/broadcom/bgmac.c
@@ -229,7 +229,8 @@ static netdev_tx_t bgmac_dma_tx_add(struct bgmac *bgmac,
 }
 
 /* Free transmitted packets */
-static void bgmac_dma_tx_free(struct bgmac *bgmac, struct bgmac_dma_ring *ring)
+static void bgmac_dma_tx_free(struct bgmac *bgmac, struct bgmac_dma_ring *ring,
+			      int budget)
 {
 	struct device *dma_dev = bgmac->dma_dev;
 	int empty_slot;
@@ -269,7 +270,7 @@ static void bgmac_dma_tx_free(struct bgmac *bgmac, struct bgmac_dma_ring *ring)
 			pkts_compl++;
 
 			/* Free memory! :) */
-			dev_kfree_skb(slot->skb);
+			napi_consume_skb(slot->skb, budget);
 			slot->skb = NULL;
 		}
 
@@ -465,9 +466,9 @@ static int bgmac_dma_rx_read(struct bgmac *bgmac, struct bgmac_dma_ring *ring,
 			/* Omit CRC. */
 			len -= ETH_FCS_LEN;
 
-			skb = build_skb(buf, BGMAC_RX_ALLOC_SIZE);
+			skb = napi_build_skb(buf, BGMAC_RX_ALLOC_SIZE);
 			if (unlikely(!skb)) {
-				netdev_err(bgmac->net_dev, "build_skb failed\n");
+				netdev_err(bgmac->net_dev, "napi_build_skb failed\n");
 				put_page(virt_to_head_page(buf));
 				bgmac->net_dev->stats.rx_errors++;
 				break;
@@ -1157,7 +1158,7 @@ static int bgmac_poll(struct napi_struct *napi, int weight)
 	/* Ack */
 	bgmac_write(bgmac, BGMAC_INT_STATUS, ~0);
 
-	bgmac_dma_tx_free(bgmac, &bgmac->tx_ring[0]);
+	bgmac_dma_tx_free(bgmac, &bgmac->tx_ring[0], weight);
 	handled += bgmac_dma_rx_read(bgmac, &bgmac->rx_ring[0], weight);
 
 	/* Poll again if more events arrived in the meantime */
-- 
2.56.0

