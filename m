Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8FA3546CF
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792378901; cv=none; b=CZXvyE1N5aNx8dXXaGjT+eE1d46/ONsPtH1rsoyaQ8xbx9mrTv58CkqI+ohosqwWrooA9q8QIax0V14WadJcnq77F8G2gogvgvRTx5YOBUnOFiG2qE/hfw42TKmIw4ZLkZZ15y0zVKU1L8TyEvKEgwciUWfuiFq5fZOvnAxncUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792378901; c=relaxed/simple;
	bh=2nsse8R9GATfUlGxxMEeK2++aC0508/mNT9onyhFOYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q1hukKxAzAOtir4xzk8jw3aBRb/ttcoR2DzdS5AccP8uiH30okXtvMnPKZFuqkyZGI5E54NXZx0fesKZFlDUOJM38RhTM2m6wcsoC25btltk8IcYyYdConIAnpZYU0RN5034UjB+/HOgujgqm6Bpl9E+HtiQEFOnAKCgnVFNDeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=eGOeleRj; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="eGOeleRj"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93f20b304c0so159999485a.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792378899; x=1792983699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9D78vrkEaiw/Is5KlQ/iLJagt3SGFDs7ZK10PGJQZuE=;
        b=eGOeleRj8E4KZdoAm371SUKpddekP/Q+3C3qrowDDy6rUx4Qtyl2nlQEnBq7RdWdR+
         VvlJd7Rbs0+tC6kz87kafWRuwxqMtGA66247VGvVYmpXO2RiQB5W+6r3DVn/1L3JhBDK
         3CMAMVvh9GF9b3EdG/O4VGD8xSnjPwB8FwuESIvTPG/5hiCRq2i1dnlkIRKWK7oAVlGc
         cYCmMxRFVnIfLRMBBklJoVS+xLTSs/DIfl/DImtH02FfibM6TYjfHU+bk3/KpGI3ZFY8
         n3NmrG1NngUJgafv7LlL/9GZzHyTk5hDqTQGqseGnTwc1Ceu88r63fE18kr+r2wcCk/4
         bzCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792378899; x=1792983699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9D78vrkEaiw/Is5KlQ/iLJagt3SGFDs7ZK10PGJQZuE=;
        b=MadGVnlAH9kmXuWOx58ZuAytg4ZJOBWzWuw/QjKQ3dbTY8IeOeEPFORnavemJ0+rff
         Wrp1BfIwE6EJrlmsv/0zKJWlxJLJeMqZey2V7RpM5k1DcTtOW8GhJYvmd94YB+qSVL05
         YN4FuPHjQAkazcVousOKYIo3U45WEw9NrT8qeLJyf0oBSAyU+GDWGiKQoL7/g6+n/Ctu
         bv7ZKj87wiO33nLK0wBZN7U+Vf+2BCpPeaLb4igDAKP1j4V7fPU+jQeYEN8ul88Vhg8w
         6hNWYQGJ6xPwMAtx4v0OHdoZV270SSXgjZR+Sferf3z3g96g2DR8RfKzGFR0ZrapuMF1
         5wxA==
X-Forwarded-Encrypted: i=1; AKwUvByvJ7jv8BTenbDFuk6EJJwlNJRIG7egxYFBUydAQGA7zzmTv3y1TBIITqAXXBNM5LI3Qnw1aeOTCuhNbwc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIR9+mjk9zvICOo54iHCoM/1dzz15ZVgBcCsutL7+IHII/0WHZ9
	FDPLh42QNaddgONK/SsK1Ca//lVd1Zz0/ldRu6KslnUCeQEb7vgzRJ0LCHlMllMATok=
X-Gm-Gg: AYBFou3S7M3luXqpnCf1nWAJw8xFP1ipt2TagSuqETCmX9f9MEqXIjdQWPUA/ccgUB8
	2wJWDsmOmbgIeSt4dxoBz+zmYi0lXvEY8fOA3pfq09i5iZI/cQH5YjjFDjbMabzH54PdSVZyjKU
	3BT4Ct3Veh5kwlzoJPJd8ALpbItoYJv8TWTiUqkHysn0EsxRR9zZLSxEWAtevATWWgo1hU5xICb
	uUnf6zlHXn7NrP0HNSGXKtXek22qeJluO4OujjlS+kgRU8s/dg5j7ICPu+q96PTicHgfm9zfVBi
	xRCBEWEZQDE0e4tziMdBQMqgSk9wEdHNskROqg+Of0Z7kME18ZSnkXdaWdVY0C27smnoxOg+gTZ
	woziArHMls0vat9DK8IIbSk+Hva5kQPjrVOqhp7nntrserl6MfNGf8YpIEdBmH1cBl5xEEuhuJ2
	tPgHqRZx1m/I4b3johZvEdPFlLc65xqyiieh/dAVhNpzmAA6RderUloeOwWRXm7UDU3iAZm2R6z
	Iw=
X-Received: by 2002:a05:620a:28c1:b0:93e:7939:acd0 with SMTP id af79cd13be357-93f29d10508mr1118565485a.37.1792378898919;
        Sun, 18 Oct 2026 20:01:38 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f3c61c440sm216840185a.10.2026.10.18.20.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 20:01:38 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: Daniel Thompson <daniel@riscstar.com>,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de,
	peppe.cavallaro@st.com,
	joabreu@synopsys.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 3/5] net: stmmac: dwxgmac2: Add XGMAC 3.01a support
Date: Sun, 18 Oct 2026 22:01:26 -0500
Message-ID: <20261019030129.1470307-4-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019030129.1470307-1-elder@riscstar.com>
References: <20261019030129.1470307-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Thompson <daniel@riscstar.com>

XGMAC 2.x and 3.x are architecturally very similar.  That means that
for everything except one erratum we can simply use the XGMAC 2.x
callback functions in the stmmac_dma_ops structure.

Only the set_rx_ring_len callback is specific to XGMAC 3.01.  It
limits the number of outstanding write requests that can be serviced
per DMA.

The other erratum addressed in this patch is simply a comment to
ensure that a feature that stmmac doesn't currently use is not enabled
without contemplating the errata.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Co-developed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  3 ++
 .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    | 52 +++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index f8ab347f7b5b9..0fe86e9942334 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -374,6 +374,8 @@
 #define XGMAC_DMA_CH_RxDESC_TAIL_LPTR(x)	(0x0000312c + (0x80 * (x)))
 #define XGMAC_DMA_CH_TxDESC_RING_LEN(x)		(0x00003130 + (0x80 * (x)))
 #define XGMAC_DMA_CH_RxDESC_RING_LEN(x)		(0x00003134 + (0x80 * (x)))
+#define XGMAC_OWRQ			GENMASK(25, 24)
+#define XGMAC_RDRL			GENMASK(15, 0)
 #define XGMAC_DMA_CH_INT_EN(x)		(0x00003138 + (0x80 * (x)))
 #define XGMAC_NIE			BIT(15)
 #define XGMAC_AIE			BIT(14)
@@ -465,6 +467,7 @@
 extern const struct stmmac_ops dwxgmac210_ops;
 extern const struct stmmac_ops dwxlgmac2_ops;
 extern const struct stmmac_dma_ops dwxgmac210_dma_ops;
+extern const struct stmmac_dma_ops dwxgmac301_dma_ops;
 extern const struct stmmac_desc_ops dwxgmac210_desc_ops;
 
 #endif /* __STMMAC_DWXGMAC2_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index ff83858ebc1f3..f9a77d641eb65 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -36,6 +36,13 @@ static void dwxgmac2_dma_init(void __iomem *ioaddr,
 	 * Route DMA interrupts to per-channel lines when multi-MSI enabled.
 	 */
 	if (dma_cfg->multi_msi_en) {
+		/*
+		 * A friendly warning to future adventurers. If Descriptor Posted
+		 * Write support, which is off by default, is ever enabled then be sure
+		 * to make it optional. This is required by errata for at least XGMAC
+		 * 3.01A... and the XGMAC 2.x and 3.x are architecturally similar so we
+		 * use dwxgmac2 support for the 3.x family as well.
+		 */
 		value = readl(ioaddr + XGMAC_DMA_MODE);
 		value = u32_replace_bits(value, XGMAC_INTM_MODE1,
 					 XGMAC_INTM_MASK);
@@ -492,6 +499,20 @@ static void dwxgmac2_set_rx_ring_len(struct stmmac_priv *priv,
 	writel(len, ioaddr + XGMAC_DMA_CH_RxDESC_RING_LEN(chan));
 }
 
+static void dwxgmac301_set_rx_ring_len(struct stmmac_priv *priv,
+				       void __iomem *ioaddr, u32 len, u32 chan)
+{
+	u32 val = FIELD_PREP(XGMAC_RDRL, len);
+
+	/*
+	 * Reduce the number of outstanding write requests to 3 (from default
+	 * of 4). This is an errata workaround for XGMAC 3.01a.
+	 */
+	val |= FIELD_PREP(XGMAC_OWRQ, 3);
+
+	writel(val, ioaddr + XGMAC_DMA_CH_RxDESC_RING_LEN(chan));
+}
+
 static void dwxgmac2_set_tx_ring_len(struct stmmac_priv *priv,
 				     void __iomem *ioaddr, u32 len, u32 chan)
 {
@@ -621,3 +642,34 @@ const struct stmmac_dma_ops dwxgmac210_dma_ops = {
 	.enable_sph = dwxgmac2_enable_sph,
 	.enable_tbs = dwxgmac2_enable_tbs,
 };
+
+/* All but one field are the same as dwxgmac210_dma_ops */
+const struct stmmac_dma_ops dwxgmac301_dma_ops = {
+	.reset = dwxgmac2_dma_reset,
+	.init = dwxgmac2_dma_init,
+	.init_chan = dwxgmac2_dma_init_chan,
+	.init_rx_chan = dwxgmac2_dma_init_rx_chan,
+	.init_tx_chan = dwxgmac2_dma_init_tx_chan,
+	.axi = dwxgmac2_dma_axi,
+	.dump_regs = dwxgmac2_dma_dump_regs,
+	.dma_rx_mode = dwxgmac2_dma_rx_mode,
+	.dma_tx_mode = dwxgmac2_dma_tx_mode,
+	.enable_dma_irq = dwxgmac2_enable_dma_irq,
+	.disable_dma_irq = dwxgmac2_disable_dma_irq,
+	.start_tx = dwxgmac2_dma_start_tx,
+	.stop_tx = dwxgmac2_dma_stop_tx,
+	.start_rx = dwxgmac2_dma_start_rx,
+	.stop_rx = dwxgmac2_dma_stop_rx,
+	.dma_interrupt = dwxgmac2_dma_interrupt,
+	.get_hw_feature = dwxgmac2_get_hw_feature,
+	.rx_watchdog = dwxgmac2_rx_watchdog,
+	.set_rx_ring_len = dwxgmac301_set_rx_ring_len,	/* Only 3.01 */
+	.set_tx_ring_len = dwxgmac2_set_tx_ring_len,
+	.set_rx_tail_ptr = dwxgmac2_set_rx_tail_ptr,
+	.set_tx_tail_ptr = dwxgmac2_set_tx_tail_ptr,
+	.enable_tso = dwxgmac2_enable_tso,
+	.qmode = dwxgmac2_qmode,
+	.set_bfsize = dwxgmac2_set_bfsize,
+	.enable_sph = dwxgmac2_enable_sph,
+	.enable_tbs = dwxgmac2_enable_tbs,
+};
-- 
2.53.0

