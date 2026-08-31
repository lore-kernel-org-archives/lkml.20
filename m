Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1201F39D6E9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199811; cv=none; b=m3OQdBxavFFLIlxQRzmd0rJQ470Dh0Tmq828QIR0Kmz8Q3d6xMiP1jXQRWsVoEJFEMeeCgXCaaMUiCpMbmbZ6ZTsKv6IjPxJNMhskUu/n4hN/dkfTPgwEd72r+Ev2PgWdLP1nm2j2WWz4LIlZBVnsmcntpd+J6U5EZfhTnxoK0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199811; c=relaxed/simple;
	bh=fAzFXr7QclcpE0D6XBc41/1tf7GsPHZBgP6i4rwO7jQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OKQvsAmxra8sqq6dyiGX/zmY4DmcqSgBc2qaDMeoItbpBNN+G1o+VVLyKrI0hrUxWzD50cCKdXayJm71Km3oaqKPlBl9YJoC80JpkM4jJbaHbH61vBgceRNL1xTX6lYA8edUkPj22jrk4Pz94i/5nj1kC7EFyXUov9/ZVugfg5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KYSloIK0; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYSloIK0"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c1600d040e4so30053366b.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199808; x=1788804608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ab3N2XZDk+KVNr1QDSMytkdAxt1gkHtn2AyrmPIO2uo=;
        b=KYSloIK0DR+tyA1ZN74oYbVTbdHrxGvNnjWLCZwqC8x9BlzS3GZZheW+wccIHChOKr
         HUUP3AsiHzVLYPXHeiv+tln5rN6qrCyx7LPxivrihXHPMVueh5h1KUUgNlYBBd6NJxL4
         zilYyxlJav8+y0cUDeD6raTroIMcFdLClqyUCDwmGuL9puaut4568lfh515rjqWeOfaz
         XAy/HWOLK4JjgeN+C4YXqoIgG+lBE0HWLs5tS0gu6AdoHe5Py8JCmT2SFHFozjRxHE6o
         YALY1LE3Y002QUGCNUPGR9Iw0c2cth2REMNcm2PQJRqiIUfxHx5Flti6iTyZRcQBcWGt
         OtlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199808; x=1788804608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ab3N2XZDk+KVNr1QDSMytkdAxt1gkHtn2AyrmPIO2uo=;
        b=MwqC0CPus8zyWxhMmP1tz/EjsaklI5dt1isThFO5OGAJfEoW1wqqdcQ1dN6Z0Zxziv
         dLIo2tEpHkWMMF8N4GFbkotFRGfJwRcn27pc09on7QlDaaMogfkGz/Q7CUkaScN/E60b
         gCPKLUQvg12DEcCf6PqKUGgVeSb2pjO9KifX1iaSsvUnXlVt1xEZNgH3V2IbMNehspCn
         NdzXVVJRsCLVk6TSHzPS5CRKXfEoMV60adLLhpRppxPYChSRv1Tbg/uthlVAfYmyUztP
         2SWTRmwqr1WCGwi2oraACccP7JGbZSyT+ocaGhEG6NeUT4+mg2QJamjQIupWPfOQjlYt
         xUIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYt8qQSxYeCs1BXHKFLydiQBFgcDpvwJm6jMW538UOkCHodXo47hOCkS7hssuRylPeZl98GE4RFsQEDDI=@vger.kernel.org
X-Gm-Message-State: AFuF++mR0cOPn/JXbOIMwrfDZ7b0uVdOLcfC2ckA4lc4FbF+YuDMmzvO
	b0g2JGdJ+sgJtLdjT1kqUpXmrW1a4iFRx6Imu2E9Ny/rB6LDQw5B3KdW
X-Gm-Gg: AR+sD12jp5g4zo4fzHqcG7SmeOxAF/BETlMlJIuyP0mSHNqESZStY8RyJoRkR5bJCuJ
	wnNT+tA6oZ1V1Tok4cRa3Zb7Fz+03+aCYSWaPDq/pankXJHWNjYyggrsViHgy5LgUafef4xJWOv
	oUm7n0Dmgdq9YK4EE2MBcmcX9TiVvcBWAcUjDp2S2k756eKecUxaFhQd4a6UXldFGgRPdJLk6xr
	oV60cD9YY5CsTsfgZfdpavoa03/MeyBxo54eziqYgy7+pe+WiBiIDpNtgfl3oyzbHPjoX8F+QMd
	ouApm3vQyf9BtxZHdDlYRcVi0xJptJi7XJw49RF5U7I0tRqcbq59u4I2kzNUCXKep1wH3NXIZoG
	p69JbXDusF0W/+3FsJhwb6gDRylfatBDg+4M21nPh5Nx2zSg+uZR5ILBiMqsBhXp1DLXib9qKT0
	zH+kNikQAqqKoQYs1gLHdBiIpuYpIo/f7ZsuwwQ3lC0ON3VykB5dc8IXkcsGtK6Y8PJPD5PeSFv
	2nFjxEE3IfIKrU=
X-Received: by 2002:a17:907:6d0b:b0:c25:4ca3:dfd8 with SMTP id a640c23a62f3a-c25b90d496fmr5311966b.2.1788199807884;
        Mon, 31 Aug 2026 11:10:07 -0700 (PDT)
Received: from localhost (83-131-188-88.adsl.net.t-com.hr. [83.131.188.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee2872dsm484759766b.15.2026.08.31.11.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:10:07 -0700 (PDT)
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
Subject: [PATCH net v2] net: wwan: qcom_bam_dmux: account network packets
Date: Mon, 31 Aug 2026 20:10:06 +0200
Message-ID: <20260831181006.1382372-1-sinyavin@gmail.com>
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
---
v2:
- Read the TX payload length after unmapping the DMA buffer and combine the
  network-device checks.

v1: https://lore.kernel.org/netdev/20260830085400.2542956-1-sinyavin@gmail.com/

Build-tested for ARM with Clang and W=1 using allmodconfig and allyesconfig.
Hardware-tested on Qualcomm MDM9607: three 32-byte IPv4 probes completed
without loss and added three packets and 180 bytes in each direction.

 drivers/net/wwan/qcom_bam_dmux.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
index cc6ace8d6437..5bcac2ccaabd 100644
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
 
@@ -402,6 +406,7 @@ static const struct net_device_ops bam_dmux_ops = {
 	.ndo_open	= bam_dmux_netdev_open,
 	.ndo_stop	= bam_dmux_netdev_stop,
 	.ndo_start_xmit	= bam_dmux_netdev_start_xmit,
+	.ndo_get_stats64	= dev_get_tstats64,
 };
 
 static const struct device_type wwan_type = {
@@ -421,6 +426,7 @@ static void bam_dmux_netdev_setup(struct net_device *dev)
 	dev->needed_headroom = sizeof(struct bam_dmux_hdr);
 	dev->needed_tailroom = sizeof(u32); /* word-aligned */
 	dev->tx_queue_len = DEFAULT_TX_QUEUE_LEN;
+	dev->pcpu_stat_type = NETDEV_PCPU_STAT_TSTATS;
 
 	/* This perm addr will be used as interface identifier by IPv6 */
 	dev->addr_assign_type = NET_ADDR_RANDOM;
@@ -533,6 +539,7 @@ static void bam_dmux_cmd_data(struct bam_dmux_skb_dma *skb_dma)
 		break;
 	}
 
+	dev_sw_netstats_rx_add(netdev, skb->len);
 	netif_receive_skb(skb);
 }
 

base-commit: 2188569e7e1b0bc3f3b557dc97ab7a02befc11c8
-- 
2.53.0
