Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05E139B94F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792378904; cv=none; b=QfGNsLYY0/RDuiMYSvcFd3h82/EH7/IkTqN7DsRg1iYpMbmNXOO+V33cfcvyAfMmuAYWi23VYnhMh6p6OLJTlwdFPnOMZDjSBmRJK6gWt5VbEqHsawkqRzSzmL10R2VIfAHY1XaOKuhXslu4pv+ohsSUWs++JOo2+MbcBvkNdy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792378904; c=relaxed/simple;
	bh=KUzDfA55VWCYv71Z2RlGmJ55hfO3CvJRsnX0M0VB284=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F2PMYSWwjU4ei0RexkKqQYjJXozbUJl6EpYRIkPCUeVxzimds9l942mL4D1VIgYP7L2R6Ca1NQLpgczWoFvWXI2awTcZP0RYIuM6gbruH+yA8//oFqWsn50xoVACjlZq0pED6cB956Y+Wdm+hxvQ/mbkO8PGiPSIqXoaXbVgTlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=vYXQOgsU; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="vYXQOgsU"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93f2b8cf037so124946685a.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792378901; x=1792983701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kvw4syNS+titZXjd+BAVQh8BZuoN5qywIcBOPbcEmbk=;
        b=vYXQOgsUFDsETREu1vRdeFWfTTg8rLfPS7m7M8AaJw9Z4WSz9R4I2LLVJhjE2INXsT
         XAHiImTM2zYgTFsZb98gzfK8synF40Fcs+NZ1aOlXlyLQEQu2usUIUJd7wX2VqnMQ1dx
         njo8vmUgzGWu5CL4LcI9jYSkNIGSDEP7tKU0SkPFAmejG5IOE5KATi24OaUv9KnTZWLZ
         bRNt5X+HVU82qkGDUdWsR1rZN37+BIb8B7wkjt8nUozkoULGdyWS7TO4UKgqsZB7i+fU
         LZFY0xLd5uIjL/QkZlCs+qmGpyKIZ35yOFOVTPzaWXrd9p+gb/wTe+FedUxCNHkVPjvg
         ARGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792378901; x=1792983701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kvw4syNS+titZXjd+BAVQh8BZuoN5qywIcBOPbcEmbk=;
        b=rCEtdAkF4fvnUZYRh/KE4ezjhnpUHPfFxA05lB3LdBbBR8LFD6IUZ5uRqP4ogiXM/0
         9VEA2B0rO8H7CjY0vMge85si2BU8jLjKmi+RbmoxuMNBOQwqSRHb9Ibqd5e8Qj1SaS7x
         vIs6drtCdv1BUizyLOql5o7/1Md3XrYw/Os/tTSX4HhTRjcnB+YtRLiQmgQINNOo6WS6
         cL/xhqasHAx2fq1iwKckiHBKfBUDDQOH77X31kWruLjUFnCupkNlNjgYqJl+w59332oG
         BOsmEwmRl6D8B4pIFBs9n0vEGli5zoPKlnZbG4PkzROwwZPF+Xnhst2e5bWn4K7WM2Lo
         oh9w==
X-Forwarded-Encrypted: i=1; AKwUvBxglZDeAj5R1dz1BIduIUkgZLtHHfCrUuzRjhNLkPnFFBQnpmCY7HGn+Jgnsojr0mCgrtENIpqf4sg36Kk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNGwKbwvjagB85ALf2hGbtOSkhb6qDKA5lcG4mT2ATxOwwQqLK
	rYC1BQo0OZPWwrBGZMX4d0U3VO997EcMSnhQsLNuoZVfm5c9eJJ+i87KmVoDFuJlcMg=
X-Gm-Gg: AYBFou1Rf0iUmuav5fdm3R0i8Qe0naJQV4JQe4DsnOm2pwBcN5AxCJC01nnc/CrIhfu
	qJ7e6mngwfWxAjf/80unPxGTL8eVH0ol6StPNTr6kK9ueTaov72GJ5MHq8SvL6xULXoy25jVp5T
	qQBhLDCtDrVkDSJbvx43scRT60/feFTsJACFsYguWXUW9rW1c5wCRY9aZG9D+9O2nqDmjapxXN4
	+Nc29rUqsaVU/Rp9gfPApLgb8GTTRF59+O4iGJRpDrQogHdA34XWGFglekeCczy8eAVN6T7fuy7
	S6i934RcCNEeSkJvpMeiGP35VnVROv2rI9aV1Wb8v+BrbBOJAaK1C1DK4F1t82Km7BS8BbHknSE
	ASZLJVGsQDZqc3yKMSHs5wUx+qYCHpA7xueJ55aO6xcS2aomgvPTM+oEuX/XfCmNu7PFyncNx1v
	EpKGuPOD8Nq//GKwqEOxX/5GqYNvYUkJoi6aJMkNEijJrLE/IOzmQ386EATA8KkvaKmx2S8+HYi
	Xbm
X-Received: by 2002:a05:620a:394c:b0:93e:c12c:4416 with SMTP id af79cd13be357-93f29df8910mr1058004285a.82.1792378900653;
        Sun, 18 Oct 2026 20:01:40 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f3c61c440sm216840185a.10.2026.10.18.20.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 20:01:40 -0700 (PDT)
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
Subject: [PATCH net-next 4/5] net: stmmac: dwxgmac2: export symbols for XGMAC 3.01a DMA
Date: Sun, 18 Oct 2026 22:01:27 -0500
Message-ID: <20261019030129.1470307-5-elder@riscstar.com>
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

Toshiba TC9564 is an Ethernet-AVB/TSN bridge and is essentially a
small and highly-specialised SoC. Ethernet on this chip is provided
by a DesignWare XGMAC.

One consequence of the SoC-like design is that the internal AXI bus
(used by the XGMAC for DMA) maps the PCI DMA space with a non-zero base
address. This requires a translation step (happily just simple addition)
to convert the PCI DMA address to the hardware DMA address.

This is pretty funky so rather than push that translation logic into
the core driver we intend to keep that logic inside the TC9564
platform code. In order to do that we need to export a few symbols
to allow us to override some of the DMA and descriptor op tables.

FWIW this approach to overriding the ops tables is similar to the
mechanism currently found in dwmac-loongson.c (with the exception
that we have also exported a couple of functions so we don't
have to replicate their content in the TC9564 platform code).

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Co-developed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h |  7 +++++++
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c    |  1 +
 .../ethernet/stmicro/stmmac/dwxgmac2_descs.c   |  1 +
 .../net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 18 ++++++++++--------
 4 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 0fe86e9942334..1b32d14c37440 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -470,4 +470,11 @@ extern const struct stmmac_dma_ops dwxgmac210_dma_ops;
 extern const struct stmmac_dma_ops dwxgmac301_dma_ops;
 extern const struct stmmac_desc_ops dwxgmac210_desc_ops;
 
+void dwxgmac2_dma_init_rx_chan(struct stmmac_priv *priv, void __iomem *ioaddr,
+			       struct stmmac_dma_cfg *dma_cfg, dma_addr_t phy,
+			       u32 chan);
+void dwxgmac2_dma_init_tx_chan(struct stmmac_priv *priv, void __iomem *ioaddr,
+			       struct stmmac_dma_cfg *dma_cfg, dma_addr_t phy,
+			       u32 chan);
+
 #endif /* __STMMAC_DWXGMAC2_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 1a88cbaed70ca..0effdd6969d65 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -1542,6 +1542,7 @@ int dwxgmac2_setup(struct stmmac_priv *priv)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dwxgmac2_setup);
 
 int dwxlgmac2_setup(struct stmmac_priv *priv)
 {
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index 6719ac6e395bc..f0e7b8ee48ac7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -374,3 +374,4 @@ const struct stmmac_desc_ops dwxgmac210_desc_ops = {
 	.set_vlan = dwxgmac2_set_vlan,
 	.set_tbs = dwxgmac2_set_tbs,
 };
+EXPORT_SYMBOL_GPL(dwxgmac210_desc_ops);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index f9a77d641eb65..2f9334d7cb922 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -63,10 +63,10 @@ static void dwxgmac2_dma_init_chan(struct stmmac_priv *priv,
 	writel(XGMAC_DMA_INT_DEFAULT_EN, ioaddr + XGMAC_DMA_CH_INT_EN(chan));
 }
 
-static void dwxgmac2_dma_init_rx_chan(struct stmmac_priv *priv,
-				      void __iomem *ioaddr,
-				      struct stmmac_dma_cfg *dma_cfg,
-				      dma_addr_t phy, u32 chan)
+void dwxgmac2_dma_init_rx_chan(struct stmmac_priv *priv,
+			       void __iomem *ioaddr,
+			       struct stmmac_dma_cfg *dma_cfg,
+			       dma_addr_t phy, u32 chan)
 {
 	u32 rxpbl = dma_cfg->rxpbl ?: dma_cfg->pbl;
 	u32 value;
@@ -78,11 +78,11 @@ static void dwxgmac2_dma_init_rx_chan(struct stmmac_priv *priv,
 	writel(upper_32_bits(phy), ioaddr + XGMAC_DMA_CH_RxDESC_HADDR(chan));
 	writel(lower_32_bits(phy), ioaddr + XGMAC_DMA_CH_RxDESC_LADDR(chan));
 }
+EXPORT_SYMBOL_GPL(dwxgmac2_dma_init_rx_chan);
 
-static void dwxgmac2_dma_init_tx_chan(struct stmmac_priv *priv,
-				      void __iomem *ioaddr,
-				      struct stmmac_dma_cfg *dma_cfg,
-				      dma_addr_t phy, u32 chan)
+void dwxgmac2_dma_init_tx_chan(struct stmmac_priv *priv, void __iomem *ioaddr,
+			       struct stmmac_dma_cfg *dma_cfg, dma_addr_t phy,
+			       u32 chan)
 {
 	u32 txpbl = dma_cfg->txpbl ?: dma_cfg->pbl;
 	u32 value;
@@ -94,6 +94,7 @@ static void dwxgmac2_dma_init_tx_chan(struct stmmac_priv *priv,
 	writel(upper_32_bits(phy), ioaddr + XGMAC_DMA_CH_TxDESC_HADDR(chan));
 	writel(lower_32_bits(phy), ioaddr + XGMAC_DMA_CH_TxDESC_LADDR(chan));
 }
+EXPORT_SYMBOL_GPL(dwxgmac2_dma_init_tx_chan);
 
 static void dwxgmac2_dma_axi(void __iomem *ioaddr, struct stmmac_axi *axi)
 {
@@ -673,3 +674,4 @@ const struct stmmac_dma_ops dwxgmac301_dma_ops = {
 	.enable_sph = dwxgmac2_enable_sph,
 	.enable_tbs = dwxgmac2_enable_tbs,
 };
+EXPORT_SYMBOL_GPL(dwxgmac301_dma_ops);
-- 
2.53.0

