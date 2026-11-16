Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829775;
	b=TA22Im4F0eCamuH9KEWlC2AYR6M2lekoLWnJuuo3RIqlYem7uORZXQqZFrGHAQWa/N3p
	 OmewyfHifmqkepl3uRGbVdUagcd/UWhNFXXsHqJEXDv0zGVxvKQ78KwNLsdE3hREoHgNf
	 3uBkCBM4kcR6u2iWUVwW5Dweusbh5jvDhcTjISGjlvwlnJBkil766Z8XCNx/OL07M7NRG
	 CWrT9ITLANg8mYnde4kr8anT4UJVYDscs54BPs/o5qoMEIDnUhpW0wW5dgYs5nrEba1uN
	 bndOTiozJWvMkpAYI3e96qNIiNnU19NvDug2CtqvP9xysJR+fBC2zUQck+sWKW6WhVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LMBdytlpAex994Fm8KdBVuGQ2AKXOakRMcjyEKnnq4U=;
	b=k8/+EMwNXqP1YcVvTHL6NoLYo4gl+kAEjFPbOaKbhF67XbmKGWi4fmcttOiiWhf+U/eX
	 peXqs87pk/33R47XkoIiDDPwpMCehIfntSQqGof9wZaALWipsOXccasO8Ljf9hUFIT8Y1
	 eapXLwsYiB77Z6ouRC0HLJCPTkSi6PogW4txjuetrNlQDZSITgsnirDQPz+kQsMPTSB98
	 xhiJLBOd3oj5rRcQpkxbBbDlkjt7+1ehligvkonXsg4187haeZHXSnb/rGPz8Rx+XNnER
	 pjCPz2NEG44QG2krlrS51vFgju2hSPxBHPyxQv6dShryCRBzwofl4AHeGyv5M0jzxgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zbktmsw2;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C89606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1C89606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zbktmsw2
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ea7987517aso23686955ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794829774; x=1795434574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LMBdytlpAex994Fm8KdBVuGQ2AKXOakRMcjyEKnnq4U=;
        b=Zbktmsw2OB7udSvkfGfIAKsIJPIBzUqNBNZVZNrRISIv7UWpb2rcrdITvcRcghO9pa
         MnTtY2IM3b4mKDcJz8yGqNjrMm6aNHMk2oQD1NLH00SPp60VmjY7q2IpsQzvqXKUc1rH
         ire+QK0J+zUSVAm+W2/M472/fbj5GMG5r6s9UOoVMU805UkI4dI+IrXgTlpp1oqQqan9
         X/XuKnrL5iE6T4LUalxrLQUjqgXLjLFc+XHMooLjJtlVEF/Wu53xJ/NdDvwb9i4K6IdA
         LwfmQ+PXycFkDEjofRm12CprmMGCGLMhebJjfS+E2qvqko29oXNW3oPivDJzq/6AxNaB
         fvyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794829774; x=1795434574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LMBdytlpAex994Fm8KdBVuGQ2AKXOakRMcjyEKnnq4U=;
        b=JwoGU7c/wDw5h3b/TkL6oa+PdvlJorbPcc80OxJEQtrLf9W1dhfvTaWzKu+kdrOVzS
         DmJHCZ8ipM9sqh3sowQqEEqJNw7JBx9ICceGGS6AJQmaNVn6SFH50YxDRE7HRGZbxc/C
         tDsGnFn3gmqd9i9+58W4KUWpPeM97EBnPJESg7QYaUkGpt0vHlafII0uzvOVoGU1c2Mm
         WTZCqdCjAXnEMB9uQu3qUDs8o7nt3L1hLB0RyfHdQG2gmK8qdN6L+64Vc4nT15F59KVs
         vXtjv11UYkCCcLOHJKH6M/tRp8Jlu/WOYIoK+U0CdgBnBKKn3vxxeWKD0652PvCbdjnZ
         DCCw==
X-Forwarded-Encrypted: i=1; AL+hErEtRpuyQsm7dvVwQyoXBfnpA95qFBEInVgVo/Qb0te2mGbHDDIrWYoHj9IoRPQ4q/aKlftzZPxJgr2nssI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nXANopRPlT44jbBWDq78a6IVvF/4dwUkEXo6kZT07g2mdofs4
	T1h0iaK8TpkX20da9LUAf3Nxf04EbeGGpxtdEIXVIW6oeYUOX2QcHXgD
X-Gm-Gg: AZFdTZf+fKZBRQOlToH1427Z8WUe96+K1xM9Geh+GEJ9zr+/vQ6y9jH5c1fa5g5ktq3
	1eN/Mc3XAy3a6rYDvG4FlZiZRCwJAouG7J4Zw9BltTIf4BOhv78uT39Pa/+Mwi9j9iuU5umG2ev
	fpRU6jzDRBW7lRkdXyj+ScXDmAfHzfPtmhC2zHbVKju1Zl/RkUsCRywnAGUrYnLFeV3VOy0rJ+c
	jtLyeyisICnRLsf8t9hxZY6Sib3Aw5Al5vCXzfpTprQ7m1+Qz0Y/aKauTtMLcaZwT+XLEjO/3t1
	rNf878cn1UOcWUX5+sh56GkwPIaF8+nUB8X9bSkggLN4AhGfhdKtVvalI72zE8JY6LEuWvb16Un
	wPZ6DHuDDUsahHWBhIoX6hla9LxS2ypCMff6l8mkShCa9H/8BeUOtOACAcljYCKdZmVwfuX7FXk
	/RM0kR1Q/rfodi/2YEi66uVxnI+I2jFPFxTh4Gi1tadYoEGoNo9fNrnLVOBEpkZaN45NNCfFWVP
	iVdyz/BGjuRKnWoAmcyNn1ZQf7bnszaiKDCbCcON5bWmagg1yoFJf53n/ouNzKIjLEDAALvd+OC
	LhEXHTTjfXH7REA52UFdqS2w0YhxlQ==
X-Received: by 2002:a17:902:f683:b0:2e9:776c:d52e with SMTP id d9443c01a7336-2ee0dcc305bmr105282175ad.52.1794829773367;
        Mon, 16 Nov 2026 03:49:33 -0800 (PST)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f80b7f6sm36896515ad.40.2026.11.16.03.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:49:33 -0800 (PST)
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
Subject: [PATCH net-next v3] net: stmmac: program the FSM timeout timer
Date: Mon, 16 Nov 2026 19:49:23 +0800
Message-Id: <20261116114923.1157920-1-zxyan0222@gmail.com>
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

The NTMRMD field holds a power-of-two microsecond timeout per the
databook: 0x0 disables it, and 0x1..0xa encode 1us, 1.024ms (~1ms),
16.384ms (~16ms), 65.536ms (~64ms), 262.144ms (~256ms), 1.048s (~1s),
4.194s (~4s), 16.777s (~16s), 33.554s (~32s), 67.108s (~64s).

The issue was hit in testing on dwmac4 and dwxgmac, where a stuck FSM was
not reported through the safety interrupt despite TMOUTEN being set.

Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
v3:
- Make the MAC_FSM_ACT_Timer write a read-modify-write so the other
  fields (e.g. LTMRMD) are preserved.
- Warn when a valid CSR clock rate cannot be obtained.
- Document the NTMRMD encodings and fix 0x2 to 1ms (was 4ms).

v2: https://lore.kernel.org/netdev/20261112053321.1103678-1-zxyan0222@gmail.com/
v1: https://lore.kernel.org/netdev/20261111143322.2234321-1-zxyan0222@gmail.com/

 drivers/net/ethernet/stmicro/stmmac/dwmac5.c  | 22 +++++++++++++++++-
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |  6 ++++-
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  3 +++
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 23 ++++++++++++++++++-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  3 ++-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 11 ++++++++-
 include/linux/stmmac.h                        | 17 ++++++++++++++
 7 files changed, 80 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
index f1bb981cab7c..c1e3d634f153 100644
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
@@ -245,6 +247,24 @@ int dwmac5_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
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
+		value = readl(ioaddr + MAC_FSM_ACT_TIMER);
+		value &= ~(MAC_FSM_ACT_TIMER_NTMRMD | MAC_FSM_ACT_TIMER_TMR);
+		value |= FIELD_PREP(MAC_FSM_ACT_TIMER_NTMRMD, ntmrmd) |
+			 FIELD_PREP(MAC_FSM_ACT_TIMER_TMR, csr_clk_mhz);
+		writel(value, ioaddr + MAC_FSM_ACT_TIMER);
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
index 7ad08651675e..b3f99a6dfcd7 100644
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
 
@@ -873,6 +875,25 @@ dwxgmac3_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
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
+		value = readl(ioaddr + XGMAC_MAC_FSM_ACT_TIMER);
+		value &= ~(XGMAC_MAC_FSM_ACT_TIMER_NTMRMD |
+			   XGMAC_MAC_FSM_ACT_TIMER_TMR);
+		value |= FIELD_PREP(XGMAC_MAC_FSM_ACT_TIMER_NTMRMD, ntmrmd) |
+			 FIELD_PREP(XGMAC_MAC_FSM_ACT_TIMER_TMR, csr_clk_mhz);
+		writel(value, ioaddr + XGMAC_MAC_FSM_ACT_TIMER);
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
index 552840d29668..949ed3e5bb05 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3691,10 +3691,19 @@ static void stmmac_mtl_configuration(struct stmmac_priv *priv)
 
 static void stmmac_safety_feat_configuration(struct stmmac_priv *priv)
 {
+	unsigned int csr_clk_mhz = 0;
+
 	if (priv->dma_cap.asp) {
 		netdev_info(priv->dev, "Enabling Safety Features\n");
+		if (priv->plat->stmmac_clk)
+			csr_clk_mhz = clk_get_rate(priv->plat->stmmac_clk) /
+				      1000000;
+		if (!csr_clk_mhz)
+			netdev_warn(priv->dev,
+				    "unable to get a valid CSR clock rate\n");
 		stmmac_safety_feat_config(priv, priv->ioaddr, priv->dma_cap.asp,
-					  priv->plat->safety_feat_cfg);
+					  priv->plat->safety_feat_cfg,
+					  csr_clk_mhz);
 	} else {
 		netdev_info(priv->dev, "No Safety Features support found\n");
 	}
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 00be2df63d22..35c39cd6b630 100644
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
+#define STMMAC_NTMRMD_1MS		0x2
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

