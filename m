Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C7542122C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353112; cv=none; b=jqF24UYSzDtO8RdX1zc3+QDskstr2d+nw+fDqJU+IDAJzhFehSKdRHiNnb0QM3Ztslr5SNIJa6uJ45P9FX+u2Z2ifgGzQyVNWIdKxz/eR11d39+dLEbVTRh9vZBbkNCGmMxzOs/JYC6TwMbvCFzgOhcuEkqg2tKpZMqdVHgE37A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353112; c=relaxed/simple;
	bh=+LFgRnQTADiSYCpirlT+tRiqMVfmNDxRj28PNerEFBA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FK8RPHv9x2cOLG3R1Sd5+X9fl+Ldvn9mxZQgr33+lhtKPIQmaXW6wHyd7N0R3TqP1EB/iTbRjH158K7u0o9BsqnadEIutVWVsq8+9yd3ln6Vfabpm3cWRwHppcehykHQDNdEpD7t6gtHU3Jrg7fFM+l+9VvdvTWrztiBtx2h/yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSDC8m12; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSDC8m12"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so1767052a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788353108; x=1788957908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r+fl62c+7a/KmTZMY3u5f1V3qn7MFMDtJlPmBr6BkOo=;
        b=KSDC8m12uTcXpSJafwbBBW44ZcDzNbl33RaM2dS6CCu9y4N2N/7lZ7N9GE0fl2BDuU
         9pc74euVniDEvsMSxkLW6G8lrrVQSTsi2TL6JWOsrDm46BohpOPdfxl25q7rOnRfeLUE
         DI963qF1IFcQkKhyLItlP4KVzM8L+UjeUap4WRFU1eCW/2KiU/PZcfntq1KZJInKCvrp
         zMrvGBwiuJwPBJ8bIDFTnsjw7TTq/YVtC5oGcBM48fhYmwcbCKJpalMz61ZvZ4y2cNsF
         +odaShJl+xKobTlGYFfsMDTZlIZ8ZKOtxO6XcfitNZ4IZlx8cg7LuWpu4v/BLE6A5WZr
         KULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353108; x=1788957908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r+fl62c+7a/KmTZMY3u5f1V3qn7MFMDtJlPmBr6BkOo=;
        b=LxjxIwRt3CMpHtSmT8ABahV9StNkH/upoBy9xpo7utcqvO4ZndwRPCpYwiKuZfHqU5
         LrvzdKRnUIxjdbVEjjR+mM74haN7pxmfmPcqHcrrZ8WVFVR8Grj8IMHxg2eSL3dMR07V
         htODpVM4uezWm71/6sI/l+nPREe8plTLWOFG+P2E2r3j4wqdPfSiMXsgW6biDCYTdJkX
         BbZX0VvyiYcsN40yo4yB7OCb4QckPFe7lqmymxJ8me5zEc076TaDWctCleVpguzcjxq3
         zv9ompFq7/v6TQLO3c3dTPqlA98UQJF8ZVH5BmcbzkQtZgotZamKk4wTXLYE7b9F7eyA
         411g==
X-Forwarded-Encrypted: i=1; AKwUvBxYOfvER+PWWkhiY3Y2uSQc/ChhEv2HiuGnSsZ587imLMsm73gXQn58EbIHYrdt6U7N9zKxgsQj2UxXidg=@vger.kernel.org
X-Gm-Message-State: AFuF++lQ7/pZNuHkY1bd16MoYetij4rSNeI1ennBKCabV3BjYWmAHlGk
	B232JFwfRiGXeIr0FhFVM/W+QgXo3oLhfid1ab3LPSHc0xHMu9jeJhzL
X-Gm-Gg: AYBFou35XPdEFZEtUkhX+XOZidAhIhSWpmsnjHR1Tiocqh7F640waGXeD3jrkwg+Sps
	EhZoFoy+AH1Sn8VJdaBHl7hl4EntP4mRbpwkBgtiZmdrVbNjc+3He8xmU9WjjsABIWD9ZBJhD+D
	g/twIrMHu6rapLDG6FO8ZvzpSuuCVBYvFtyRRVbTdRiEBPfqFrLv2QoD/COGGUaUm1nDk1W6dsi
	CKh0/lnKOsN6tToCupcliED9ckqKVNcumQ2gfvA8ERJARe1BPOeNwHIHE5EFP1tTyItJX64qiZU
	z7Dx+DB696Pmv7tKINAQG8thzCWZSg6QdJPQCKSLhLb40AvQfK2/xi6OJIsDrcwQ2MGkrFgxgmG
	p9ZwyProGDRK1rrDdUj2j2/mQrEoW9i5874kknDQCoy0uaTjTsuhbKSYfIZiAtigmuCsmjMIlqU
	G2EAiCc20aBjWUkY3S0lA2PPxPFoOfM6zPwmSE53GQ8hLLMllX82Tlx87wYGiBeCJsSALB7ZAzA
	rsDILYUtrk=
X-Received: by 2002:a05:6402:21d1:b0:6a5:f474:e8f3 with SMTP id 4fb4d7f45d1cf-6a6828a10d8mr2976552a12.16.1788353107584;
        Wed, 02 Sep 2026 05:45:07 -0700 (PDT)
Received: from localhost (78-3-72-185.adsl.net.t-com.hr. [78.3.72.185])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f95f557sm1019369a12.31.2026.09.02.05.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:45:06 -0700 (PDT)
From: Dmitry Sinyavin <sinyavin@gmail.com>
To: Stephan Gerhold <stephan@gerhold.net>
Cc: Dmitry Sinyavin <sinyavin@gmail.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3] net: wwan: qcom_bam_dmux: account network packets
Date: Wed,  2 Sep 2026 14:45:06 +0200
Message-ID: <20260902124506.363174-1-sinyavin@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The BAM-DMUX data path does not update the network device packet and byte
counters. As a result, userspace sees zero traffic even while packets are
being transferred.

Use the standard per-CPU software statistics helpers. Account transmitted
packets after their DMA completion and received packets after removing the
BAM-DMUX header and padding.

Fixes: 21a0ffd9b38c ("net: wwan: Add Qualcomm BAM-DMUX WWAN network driver")
Signed-off-by: Dmitry Sinyavin <sinyavin@gmail.com>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
v3:
- Count packets discarded by the transmit error path.

v2:
- Read the TX payload length after unmapping the DMA buffer and combine the
  network-device checks.

v2: https://lore.kernel.org/netdev/20260831181006.1382372-1-sinyavin@gmail.com/
v1: https://lore.kernel.org/netdev/20260830085400.2542956-1-sinyavin@gmail.com/

Build-tested for ARM with Clang and W=1 using allmodconfig and allyesconfig.
Hardware-tested on an MDM9607-based device: three 32-byte ICMP probes completed
without loss, and the RX and TX counters each advanced by three packets and
180 bytes.

 drivers/net/wwan/qcom_bam_dmux.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
index cc6ace8d6437..ef3356200b3e 100644
--- a/drivers/net/wwan/qcom_bam_dmux.c
+++ b/drivers/net/wwan/qcom_bam_dmux.c
@@ -177,8 +177,12 @@ static void bam_dmux_tx_callback(void *data)
 {
 	struct bam_dmux_skb_dma *skb_dma = data;
 	struct sk_buff *skb = skb_dma->skb;
+	struct net_device *netdev = skb->dev;
 
 	bam_dmux_tx_done(skb_dma);
+	if (netdev)
+		dev_sw_netstats_tx_add(netdev, 1,
+				       ((struct bam_dmux_hdr *)skb->data)->len);
 	dev_consume_skb_any(skb);
 }
 
@@ -368,6 +372,7 @@ static netdev_tx_t bam_dmux_netdev_start_xmit(struct sk_buff *skb,
 
 drop:
 	bam_dmux_tx_done(skb_dma);
+	dev_core_stats_tx_dropped_inc(netdev);
 	dev_kfree_skb_any(skb);
 	return NETDEV_TX_OK;
 }
@@ -402,6 +407,7 @@ static const struct net_device_ops bam_dmux_ops = {
 	.ndo_open	= bam_dmux_netdev_open,
 	.ndo_stop	= bam_dmux_netdev_stop,
 	.ndo_start_xmit	= bam_dmux_netdev_start_xmit,
+	.ndo_get_stats64	= dev_get_tstats64,
 };
 
 static const struct device_type wwan_type = {
@@ -421,6 +427,7 @@ static void bam_dmux_netdev_setup(struct net_device *dev)
 	dev->needed_headroom = sizeof(struct bam_dmux_hdr);
 	dev->needed_tailroom = sizeof(u32); /* word-aligned */
 	dev->tx_queue_len = DEFAULT_TX_QUEUE_LEN;
+	dev->pcpu_stat_type = NETDEV_PCPU_STAT_TSTATS;
 
 	/* This perm addr will be used as interface identifier by IPv6 */
 	dev->addr_assign_type = NET_ADDR_RANDOM;
@@ -533,6 +540,7 @@ static void bam_dmux_cmd_data(struct bam_dmux_skb_dma *skb_dma)
 		break;
 	}
 
+	dev_sw_netstats_rx_add(netdev, skb->len);
 	netif_receive_skb(skb);
 }
 

base-commit: 2188569e7e1b0bc3f3b557dc97ab7a02befc11c8
-- 
2.53.0
