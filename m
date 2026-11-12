Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461655;
	b=zBO+Tq+Cj3S0c1zWMYWEbMdO6W9iFuWdchXfSapvuXVFhQct780m5BvI38H0utcAe1Ds
	 Clx+cUfyqpkdpx5AHw6NLS68DmQ/T2rU6HAJIs5B0xM/8vvvIWEIdbuB9l3Lxa5ElhpN5
	 ePLDnRDQP8dOQQadoQLgWcUVd49bWNOjeuUhYqC7JGSFTOFNMY4tnpSskEIjaFrLbJmoy
	 H2z8brxI7aFO3LwL81/PJmn/p4IkajvI75LtvzE/2PPym2u5KlQ0nSUPhI9lC0T8o2E7S
	 nO1T7l04meAVuVYOpuiW6T5krKrSFu48NqkgrDrWuFpRlMttNW9oNYjmAU5TWMzcOKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=c252PVeNh2PrNdJdZI7UG6jqVLttaOqimaOV3eONzbI=;
	b=IqPKPk+IeErw0Xorf3SK+gc3z5Km47Mu6l6/NerHeNcB31fYg85guSF/AhNP5ZminZ4l
	 6+SpPqSOcln3zxebmFGY3UrszJ8X3m4BJv6Q1huX6KOG6Bn6N9fb8Q3y0sx5Ag6O038ns
	 wN5EZuITfNyZEaOxjYG+LS6INOnGZXFXXMwQ2BY6OySvXXcWlquDYxVJL3DzGBE4TqR1I
	 VKxSt6L1o27+f1xeAAFEpBz2Tfos6higJ6/AOCr+yXsTgPCN6F2YJ+9aSEZpY6rkFcQh9
	 11DgMeWW0nuJrwlTJ1SS6mQU/7tNkCIURmDfaDXRruxkR/dZ+1sYIzboh8RViaTSFIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SkK7WIKg;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD04606A338
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DD04606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SkK7WIKg
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e9ae391a05so3150355ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461654; x=1795066454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c252PVeNh2PrNdJdZI7UG6jqVLttaOqimaOV3eONzbI=;
        b=SkK7WIKg1xCe+1YxBJKV9WxzN2Yi4fyx7xmt1QBIJrMaP7itFv9wk+rXHYgjnLDZaw
         jicciXmHzfy4wSEXQiCRAfeHQrg5ckKPlNsVFaQAZlpXiPCpuyVTGUhFWuswDi5WMrc6
         pA0gwcwD1vuyEI4EKo/2A8hwl6YYzs4oqsqU26y5CthKAu1Mwomigaxedqe61GU9KXcP
         VkVDxWKl89Bsd42H0dGv5A48AE7znFThst+s4/LR3XM+bNllvYdmJ6wxeo3TCUOuu9MG
         WIdkD3RbbCsZOUiZNPXEDQv5U9+OnlDUXAGGXiCI0bCZ+EmHTbqg3uRYaSmw1HJ5mSNP
         XLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461654; x=1795066454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c252PVeNh2PrNdJdZI7UG6jqVLttaOqimaOV3eONzbI=;
        b=r4BDwBGGLvll0HX5eoeC5ruV6hSN4JZHhYUwBt12OLF9vMEVbwN5/uDvCc5yv5CweN
         3sEPibvcVd8PX/cL6RPchEFUVO+U5eTwkriZoTdLMlKuzgI+8/xQzG42H98Z3rKDTUH6
         X0f6fx2L4tkGPC1CpTUGaPfvvcPDZ2TLz8KQZx5EE7tj2SO4pPIGVm5v21JjcZjENJ+4
         r53nZxQmbsMYlaJwzdl0XW/T30iQtHkLwdxVBMFJQaDpjsaWnRrI3kX0AxjP+i78NIDJ
         krx0sJ87jpl6nu61cponZubZuKm2OLlsfvYo52e0F+SsQBje7P2d8Si171zthad9tj3x
         iThg==
X-Forwarded-Encrypted: i=1; AL+hErET2rJ7598/WUAKUS3JNDh3WA1/C6IWoX1BCkzExKGlrqH6dTvsVaP6clDdiQ6paSkt8bN7cVKL14kMUso=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SACfoT7/gqVC7EeoztV5KekqDkQ++tuDhxIP3WiSWQ1LBZW5a
	JiKOGREzzX9Kms6JBlDAZdFVV9Hx/a4jiv9vmXbSH+GduM9xfgbgVQnO
X-Gm-Gg: AYBFou2pUWMVLKoGgxrkc3PV94ZQv1cgVeWV3QsrFJsTjLBKHGhhMXZlvzvxZu/Q47m
	9WuU1JK144rTv95ReWliAtNkaHfApJXmAL4fjHFSzv+YLLTgV9zCA5qvllwJyTni0Z2xl2LdknY
	4CMjM+Uzg8qHsW9hnSNSIb13iVYqW8/tSsFE3qlNwL5u9jcH3y0A/DMlDdCLFid2iRQRBXVZhAF
	Gclcqq787Bd/KnbNZnldbTbAEFD8bYoDcsG2wEscIe6VdM12iBEdb4pOlStQcZVB9Htv7cLdW7I
	JfvOFLctwmAJVIXe22QMI44chBzt4EtWStJZtMH1PJlxz4z6qkfKCkMcxdvKqnmHwhrShIka21b
	rTbqToBarjB11p1ffwmzFyPI3uY5nocv4Xogyd6swImydjImfF0+tMlavKoYUOPnlA0ra871BX8
	LD6kBn2tP1DMDqiIyHlzZ/fwOrnAYCA8ER6/wkgb+tQSQkT2RCJBZ9lDnma1JrnPR4WVHq/VgAb
	iJV9TiGc3wj6ONiZyRYL0qNuLnt5F2RZzFkAIuRsIwZeg4f4BbDkFUhOE8SqoDv0NaARiD52dzC
	TGztVQFTq5xwEkRc7gL8D+s0//P2QG/Hg4CowROXXs+oU3K2gQ==
X-Received: by 2002:a17:903:904:b0:2ed:1fba:e5eb with SMTP id d9443c01a7336-2edf1717c66mr12328345ad.27.1794461653827;
        Wed, 11 Nov 2026 21:34:13 -0800 (PST)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ede2847f1fsm12557275ad.54.2026.11.11.21.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:34:13 -0800 (PST)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rmk+kernel@armlinux.org.uk,
	Zxyan Zhu <zxyan0222@gmail.com>
Subject: [PATCH net-next v2] net: stmmac: program the FSM timeout timer
Date: Thu, 12 Nov 2026 13:33:21 +0800
Message-Id: <20261112053321.1103678-1-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
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

stmmac enables the FSM timeout checker (TMOUTEN) but never programs the
MAC_FSM_ACT_Timer register.  Per the databook the checker only fires once
NTMRMD is programmed with a non-zero duration; NTMRMD == 0 disables the
timer, so with TMOUTEN set but the timer left at reset a stuck FSM is
never reported and the advertised timeout protection is ineffective.

Program MAC_FSM_ACT_Timer right after TMOUTEN is enabled, deriving the
TMR field (CSR clocks per 1us tic) from the CSR clock rate and defaulting
to a 1s timeout.  A platform can override the default through the new
ntmrmd field in stmmac_safety_feature_cfg.

The issue was hit in testing on dwmac4 and dwxgmac, where a stuck FSM was
not reported through the safety interrupt despite TMOUTEN being set.

Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
v1: https://lore.kernel.org/netdev/20261111143322.2234321-1-zxyan0222@gmail.com/
v2:
- Rebased onto net-next.
- Dropped the Fixes: tags (this never worked, so it's feature completion,
  not a regression fix).
- Specified the tested hardware (dwmac4 and dwxgmac).

 drivers/net/ethernet/stmicro/stmmac/dwmac5.c  | 20 ++++++++++++++++++-
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |  6 +++++-
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  3 +++
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 20 ++++++++++++++++++-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  3 ++-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  8 +++++++-
 include/linux/stmmac.h                        | 17 ++++++++++++++++
 7 files changed, 72 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
index f1bb981cab7c..4ab7a3df98c6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2017 Synopsys, Inc. and/or its affiliates.
 // stmmac Support for 5.xx Ethernet QoS cores

+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/iopoll.h>
 #include "common.h"
@@ -184,7 +185,8 @@ static void dwmac5_handle_dma_err(struct net_device *ndev,
 }

 int dwmac5_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
-			      struct stmmac_safety_feature_cfg *safety_feat_cfg)
+			      struct stmmac_safety_feature_cfg *safety_feat_cfg,
+			      unsigned int csr_clk_mhz)
 {
 	struct stmmac_safety_feature_cfg all_safety_feats = {
 		.tsoee = 1,
@@ -245,6 +247,22 @@ int dwmac5_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
 		value |= TMOUTEN; /* FSM Timeout Feature */
 	writel(value, ioaddr + MAC_FSM_CONTROL);

+	/* Program the FSM active timer so the timeout checker actually fires.
+	 * TMR is the number of CSR clocks per 1us tic, i.e. csr_clk in MHz.
+	 * Default to a 1s timeout when the platform did not select one.
+	 */
+	if (safety_feat_cfg->tmouten && csr_clk_mhz) {
+		u32 ntmrmd = safety_feat_cfg->ntmrmd;
+
+		ntmrmd = (ntmrmd >= STMMAC_NTMRMD_1US &&
+			  ntmrmd <= STMMAC_NTMRMD_64SEC) ?
+			 ntmrmd : STMMAC_NTMRMD_1SEC;
+
+		writel(FIELD_PREP(MAC_FSM_ACT_TIMER_NTMRMD, ntmrmd) |
+		       FIELD_PREP(MAC_FSM_ACT_TIMER_TMR, csr_clk_mhz),
+		       ioaddr + MAC_FSM_ACT_TIMER);
+	}
+
 	/* 4. Enable Data Parity Protection */
 	value = readl(ioaddr + MTL_DPP_CONTROL);
 	if (safety_feat_cfg->edpp)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.h b/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
index 00b151b3b688..734e7630f28d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
@@ -8,8 +8,11 @@
 #define MAC_DPP_FSM_INT_STATUS		0x00000140
 #define MAC_AXI_SLV_DPE_ADDR_STATUS	0x00000144
 #define MAC_FSM_CONTROL			0x00000148
+#define MAC_FSM_ACT_TIMER		0x0000014C
 #define PRTYEN				BIT(1)
 #define TMOUTEN				BIT(0)
+#define MAC_FSM_ACT_TIMER_TMR		GENMASK(9, 0)
+#define MAC_FSM_ACT_TIMER_NTMRMD	GENMASK(19, 16)

 #define MAC_PPS_CONTROL			0x00000b70
 #define PPS_MAXIDX(x)			((((x) + 1) * 8) - 1)
@@ -82,7 +85,8 @@
 #define GMAC_INT_FPE_EN			BIT(17)

 int dwmac5_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
-			      struct stmmac_safety_feature_cfg *safety_cfg);
+			      struct stmmac_safety_feature_cfg *safety_cfg,
+			      unsigned int csr_clk_mhz);
 int dwmac5_safety_feat_irq_status(struct net_device *ndev,
 		void __iomem *ioaddr, unsigned int asp,
 		struct stmmac_safety_stats *stats);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index f8ab347f7b5b..1fd501728b18 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -169,8 +169,11 @@
 #define XGMAC_HWFEAT_PCSEL		GENMASK(1, 0)
 #define XGMAC_MAC_DPP_FSM_INT_STATUS	0x00000150
 #define XGMAC_MAC_FSM_CONTROL		0x00000158
+#define XGMAC_MAC_FSM_ACT_TIMER		0x0000015C
 #define XGMAC_PRTYEN			BIT(1)
 #define XGMAC_TMOUTEN			BIT(0)
+#define XGMAC_MAC_FSM_ACT_TIMER_TMR		GENMASK(9, 0)
+#define XGMAC_MAC_FSM_ACT_TIMER_NTMRMD		GENMASK(19, 16)
 #define XGMAC_MDIO_ADDR			0x00000200
 #define XGMAC_MDIO_DATA			0x00000204
 #define XGMAC_MDIO_C22P			0x00000220
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 7ad08651675e..dac85431e740 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -4,6 +4,7 @@
  * stmmac XGMAC support.
  */

+#include <linux/bitfield.h>
 #include <linux/bitrev.h>
 #include <linux/crc32.h>
 #include <linux/iopoll.h>
@@ -837,7 +838,8 @@ static void dwxgmac3_handle_dma_err(struct net_device *ndev,

 static int
 dwxgmac3_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
-			    struct stmmac_safety_feature_cfg *safety_cfg)
+			    struct stmmac_safety_feature_cfg *safety_cfg,
+			    unsigned int csr_clk_mhz)
 {
 	u32 value;

@@ -873,6 +875,22 @@ dwxgmac3_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
 	value |= XGMAC_TMOUTEN; /* FSM Timeout Feature */
 	writel(value, ioaddr + XGMAC_MAC_FSM_CONTROL);

+	/* Program the FSM active timer so the timeout checker actually fires.
+	 * TMR is the number of CSR clocks per 1us tic, i.e. csr_clk in MHz.
+	 * Default to a 1s timeout when the platform did not select one.
+	 */
+	if (safety_cfg && safety_cfg->tmouten && csr_clk_mhz) {
+		u32 ntmrmd = safety_cfg->ntmrmd;
+
+		ntmrmd = (ntmrmd >= STMMAC_NTMRMD_1US &&
+			  ntmrmd <= STMMAC_NTMRMD_64SEC) ?
+			 ntmrmd : STMMAC_NTMRMD_1SEC;
+
+		writel(FIELD_PREP(XGMAC_MAC_FSM_ACT_TIMER_NTMRMD, ntmrmd) |
+		       FIELD_PREP(XGMAC_MAC_FSM_ACT_TIMER_TMR, csr_clk_mhz),
+		       ioaddr + XGMAC_MAC_FSM_ACT_TIMER);
+	}
+
 	/* 5. Enable Data Path Parity Protection */
 	value = readl(ioaddr + XGMAC_MTL_DPP_CONTROL);
 	/* already enabled by default, explicit enable it again */
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 8ae95e91a36a..395655b01ea8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -378,7 +378,8 @@ struct stmmac_ops {
 			     bool srgmi_ral);
 	/* Safety Features */
 	int (*safety_feat_config)(void __iomem *ioaddr, unsigned int asp,
-				  struct stmmac_safety_feature_cfg *safety_cfg);
+				  struct stmmac_safety_feature_cfg *safety_cfg,
+				  unsigned int csr_clk_mhz);
 	int (*safety_feat_irq_status)(struct net_device *ndev,
 			void __iomem *ioaddr, unsigned int asp,
 			struct stmmac_safety_stats *stats);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 552840d29668..1b3dd30db6dc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3691,10 +3691,16 @@ static void stmmac_mtl_configuration(struct stmmac_priv *priv)

 static void stmmac_safety_feat_configuration(struct stmmac_priv *priv)
 {
+	unsigned int csr_clk_mhz = 0;
+
 	if (priv->dma_cap.asp) {
 		netdev_info(priv->dev, "Enabling Safety Features\n");
+		if (priv->plat->stmmac_clk)
+			csr_clk_mhz = clk_get_rate(priv->plat->stmmac_clk) /
+				      1000000;
 		stmmac_safety_feat_config(priv, priv->ioaddr, priv->dma_cap.asp,
-					  priv->plat->safety_feat_cfg);
+					  priv->plat->safety_feat_cfg,
+					  csr_clk_mhz);
 	} else {
 		netdev_info(priv->dev, "No Safety Features support found\n");
 	}
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 00be2df63d22..cb470a153bf8 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -168,8 +168,25 @@ struct stmmac_safety_feature_cfg {
 	u32 edpp;
 	u32 prtyen;
 	u32 tmouten;
+	/* FSM normal-mode timeout value (MAC_FSM_ACT_Timer.NTMRMD). The TMR
+	 * field (CSR clocks per 1us) is derived from the CSR clock by stmmac.
+	 * 0 selects the default 1s timeout.
+	 */
+	u32 ntmrmd;
 };

+/* MAC_FSM_ACT_Timer.NTMRMD timeout durations */
+#define STMMAC_NTMRMD_1US		0x1
+#define STMMAC_NTMRMD_4MS		0x2
+#define STMMAC_NTMRMD_16MS		0x3
+#define STMMAC_NTMRMD_64MS		0x4
+#define STMMAC_NTMRMD_256MS		0x5
+#define STMMAC_NTMRMD_1SEC		0x6
+#define STMMAC_NTMRMD_4SEC		0x7
+#define STMMAC_NTMRMD_16SEC		0x8
+#define STMMAC_NTMRMD_32SEC		0x9
+#define STMMAC_NTMRMD_64SEC		0xa
+
 /* Addresses that may be customized by a platform */
 struct dwmac4_addrs {
 	u32 dma_chan;
--
2.34.1
