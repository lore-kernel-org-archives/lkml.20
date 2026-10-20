Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792523010;
	b=kBgoEcFr9qf79t+MMninv5nMjFLcWfbtwG6CV31SyGJY3Z+KZIOU/2tRhi81lbfgJoWN
	 dCQabfrgXxeJAxEno+pxoajEI2i4lO4VhKBXBOBSlF0P28u/8HQRZndpiSR6SMK4LlxqE
	 m+zt/M+fJOwJcsEVLJp2QNXV+pv9wDx1kJOWr+Kt4TmwlET2JYw6QVnPaWENLH4+Cyzsl
	 n3WYoZcryVNsoZyeSF4xht5AyhXwvdBL5+tlbKbZS4kF0GSD+E67F1Xui+qekZYVuoO8k
	 qz+YvMtkjMNYgG1XEXtXUoQCHZ1niGF8p/b2IcPLJUPj8NsvXvzgoZJ6lcRQSRN012A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792523010;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uC5zYyNDKu5QdLJSVPD/ZbHeH86phuOD6U9spopPKrw=;
	b=oUlErmbZ6Zzn2B37R1v8Zirv3saeOVFj0WtkpljrH0wg81gfTFT+i8ArJbBbfsiNdHJZ
	 fJY8tMAdc8QkWg6yHwq4rzxnf6rugBPTD+ajUzgW+mAw5OaHQ2E/AGAkRh7cYPl/jH/NR
	 kAG2CnHKgsakojYsieQz3UIqfe+3RO0FhuYq5WLeFt32Q6kn9Vho7CsguHWwEwyFrGWBh
	 gC7Pmx1CvQN3AT8r+cWvxNFC4X3X2RFgENABjAIpR0ofobEI4kusFVT7iE8EbvDTI3m0S
	 BeTHd0eWUiGejDvBHfcnzaPPR6UJz8Ycc0D6F5o4ZR79NntNJPV1rdwKWoOHRnKeBZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=grische.xyz;
	spf=pass smtp.mailfrom=grische.xyz;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51D460A260C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D51D460A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grische.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grische.xyz
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso42538225e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792523008; x=1793127808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uC5zYyNDKu5QdLJSVPD/ZbHeH86phuOD6U9spopPKrw=;
        b=0BPa8PgFBtdBU3p77duTci34KOCr9drcmeni+zOvxTo24nMC6lAV6ENIr2m5nXWCJM
         09ARX9UBwR2l3z8fGYWA5nkWg0F36U1bUq/EYy8ryhYpQwbtMuyri6DrDHs+xoy0A3d1
         yK/I11BJs9CeyqBpdu6ijBRKigKdxHGT3Rkfy84GjOj+726o3NdSz68tfttvvyfPQOEE
         BJ/fkcIONCe1SepNz5t3lqWZ0bEqa57TYjCrzySNUIF4ELNEk1mG+w9EUIR/KaX8o2TX
         hQZJCuQeuZb6iH0mstU0uCoCh+wOorTrZwrEVKWkrTb+MpfS1UkRm1qPsJIPW1TNa/cl
         BDMw==
X-Forwarded-Encrypted: i=1; AKwUvBwjRe54qNrMEBmpUWmdR/I+/l/GmOZPPBuFWqFDed9Vg44aq4ZRQemNQmnaIT1/K63c0bbxFqCDKeNznc4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNg2MjCHiJQhbNReuC9LRW6McKwVuhq5GAWz299hivQgpCCZmr
	f2i3H5/Utc2qdPFUVzdYHvcX6ybGbP341jRWW1L9A5YdYK6Kk/x5N9hXsBDC0Ffx1pE=
X-Gm-Gg: AYBFou2XRXg51xz0SdUKNOsrjPjdH52W7XvLu4tKb0mmMGGGMo7NtePP7to97zvxD02
	Z0W7Qcdod7Nn59JNGA025S2c70DN0bCgeOlzN2qaDUc0CipfIDgdYT204w+4UiaiDkBqnxNL/Fr
	G/cj7dS5/fnfFL1/jetQiiy54gJfeOaWN2v6jiXkrFV3wX1LcwAVuXnJwz9khqkFvJ80H+kEEiL
	UrioFALFZj4UI8xBBDSu5nU+93PEMsJKCUiI//WLvnHIkVy9xvPNCon0xcLN+2oB9Z2uVtmeOUK
	+kkAZ/JnZP7lD5SUal156yDqaB+3xN0kVgASiQsVwchBhBTv0+kJMH4O7ZvpbVzPDokwqjRNlnd
	njD9BDIPtKCaFmdjiaTVX7ZDj/udsjR0mah+aATraZ57d+ljnfCHGwzpdn3cvb03flk+Gnlh/kC
	l4MF4pA7huVtZhdY2uCbxsXfYSk4sQGijVpnxJ0/mk3I6qIlxCiXzde7jOC1iRap3A8D0=
X-Received: by 2002:a05:600c:8709:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4a1d75e3eb5mr232302695e9.11.1792523008071;
        Tue, 20 Oct 2026 12:03:28 -0700 (PDT)
Received: from lake ([2a02:810d:d09:1b65:a3ee:29e0:454d:c31e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828cbfsm279157f8f.23.2026.10.20.12.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:03:27 -0700 (PDT)
From: Grische <opensource@grische.xyz>
To: netdev@vger.kernel.org
Cc: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Grische <opensource@grische.xyz>,
	stable@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 3/3] net: stmmac: dwmac1000: stop hardware from dropping checksum-error packets
Date: Tue, 20 Oct 2026 21:03:18 +0200
Message-ID: <20261020190319.884375-4-opensource@grische.xyz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020190319.884375-1-opensource@grische.xyz>
References: <20261020190319.884375-1-opensource@grische.xyz>
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

When the checksum offload engine (CoE) is enabled, the dwmac1000 MAC
silently drops any frame for which the engine detects a checksum error,
before the driver sees it.

This breaks VXLAN over IPv6 with zero UDP checksums, which RFC 6935 and
RFC 6936 allow for tunnels.

Set DMA_CONTROL_DT so that such frames are delivered instead of dropped,
as commit fe4042797651 ("net: stmmac: dwmac4: stop hardware from
dropping checksum-error packets") did for dwmac4. CoE remains enabled,
so the driver still sees the error status and marks the skb
CHECKSUM_NONE for the stack to verify.

Tested on an Aruba AP-325 (ipq806x-gmac-dwmac) with Rx checksum offload
on.

Link: https://lore.kernel.org/all/20250625132117.1b3264e8@kernel.org/
Link: https://github.com/freifunk-gluon/gluon/issues/3783
Fixes: 47dd7a540b8a ("net: add support for STMicroelectronics Ethernet controllers.")
Cc: <stable@vger.kernel.org> # 6.6.x: ee0aace5f844: net: stmmac: Correctly handle Rx checksum offload errors
Cc: <stable@vger.kernel.org> # 6.6.x
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Grische <opensource@grische.xyz>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h     | 1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
index 1de1f929d61c..004e6e30a68b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
@@ -163,6 +163,7 @@ enum rx_tx_priority_ratio {
 
 /* DMA operation mode defines (start/stop tx/rx are placed in common header)*/
 /* Disable Drop TCP/IP csum error */
+#define DMA_CONTROL_DT		0x04000000
 #define DMA_CONTROL_RSF		0x02000000	/* Receive Store and Forward */
 #define DMA_CONTROL_DFF		0x01000000	/* Disaable flushing */
 /* Threshold for Activating the FC */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
index 3ac7a7949529..00c8d4dfb553 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
@@ -129,6 +129,8 @@ static void dwmac1000_dma_operation_mode_rx(struct stmmac_priv *priv,
 {
 	u32 csr6 = readl(ioaddr + DMA_CHAN_CONTROL(channel));
 
+	csr6 |= DMA_CONTROL_DT;
+
 	if (mode == SF_DMA_MODE) {
 		pr_debug("GMAC: enable RX store and forward mode\n");
 		csr6 |= DMA_CONTROL_RSF | DMA_CONTROL_DFF;
-- 
2.54.0

