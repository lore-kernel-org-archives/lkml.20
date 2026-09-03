Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293DD4A5C55
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439015; cv=none; b=SrmcMyaNP3FveEeF8jNeDIDU+kRJGmx1cMfyayIcqDwolU3iE3HHR/ZoTm7RBT6VBt1IXV/bSjputbL3LscsnBaf1cjuFX5rJJs2pEQnPxm8h0edLN1gK8YNg/UZaeaxHK4AhSgQ6rn5ZuPy+yOZO04PnWigYSWj8TAPcDFYhGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439015; c=relaxed/simple;
	bh=UdM39EdVhmCvcLCzYaws6S0npt3YrWE2CPDWtOZTBJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N/uL1+f40WayPkkXXINtY6n2UvotfBYYuTfU5bgxQjwh7RzjQXIwCntmwAzaNbNRyVuxpkTS9HtsLoIpcfkVd3V3VY+OjNf07opJp7082V9jWnpjMnmAY7b6pKc9esI5YPhu3ozVYEsFu4sK6ljASGN1uo4yXNWtu7IWoOTUjjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=Fxa4XnHI; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="Fxa4XnHI"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49557167508so23255425e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788439011; x=1789043811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SwtI08RZDEkJ98ihmiAAaqdPKBHI1mrBR8jqovEMLw=;
        b=Fxa4XnHIFILjCwZubgaCiIsOE32P0dlNHiVJ8KAJW58T84F2Jpr+NLTqnYJe6B33pB
         8Hp1gHYKV4yVVzRjUVG/8kvTrAtO+OiA5S4ehoUoYk7FmQiDDH+8zLg3Qaf/d1Jrl457
         LULTLp/W8hK5G+tTso4fzxXwmZQoWcg3rJF5esN4yR6zFHgg7VBfnxxssXjIyvuOv1QE
         7knMxWG0huSWDT3TOyUmfDXokYg8ODCE9xeN2iiAS4RryRIWeADDyw0+CaV8mD64rrN1
         /cnzPG7pj0FO0p2kHOy5i8gumHKwxK9AQaFLJgiPA1ZSKYXQcueN9omdMCdmbb4fD0Zj
         x03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439011; x=1789043811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0SwtI08RZDEkJ98ihmiAAaqdPKBHI1mrBR8jqovEMLw=;
        b=UKeuFGGEiGRwJjvgBs7HwJ/Qj/54wG0uAEJl0iLihEJOD74W5/iCOcc6pY9JU5D03J
         7SVCp2iQdDxRAT8fhMtayAZHpo+8FWXBFyle4OMKimf4+mlTy9IafjlNcEnDwZiQp9UF
         hBuBVeTeeaARPxVr+K51VIGyPevf1dy+Zsj0aVh5exx8CKYinUs9Gpv0qihLL0vjB44y
         20Pi8Prd8hM/slcpECVczAlWUAzpzHKvMuTEAA1LxpWaxdcmnJGTuIPu3UB90WID5dHP
         RigHmlza/ulwQSW24WjfVjyae2OhDwBYb6hS+AVh5gBZq74PepDYIT8EVzx69EDPuB39
         NL3w==
X-Forwarded-Encrypted: i=1; AKwUvBzs6Ivdq/8QDce7Hmrub8ZY6/uJMCoLbaIqpxcff/NQuHtzQUDmLYKtXTWBjL74TWEH/+KsCoeji2NSsJ0=@vger.kernel.org
X-Gm-Message-State: AFuF++mSBQZdsulIjvBAp8Y1SjomW13ONyMa0rf80V6DHPqrBGtsU8PF
	EztHIaArJ2Nz0l3MmFAxrToIGU+TXynGirhA8SYlYdOjn9xQct1pIYE35gEGdUaKNDw=
X-Gm-Gg: AYBFou0H0g/kvhk5DrgSXQdHQtVq0NdwNciMKmFDgZHgnRPSgaovox7jo2sfL3V1Ieh
	6xt510LkIRHrg960/jR4fog9qcOs6zYxi3I75H2uP0fORTh4AQpjuuF6eVGazI8axyQNI2j+O4p
	MiMMYBUqfZ/gLz6mLAuRlYE/bKQ6oTIgHBB40qC//Bt3hPMcyIagutMn6AqkU5OIMNjGtODt1o1
	Dv9KgtFkgUDrFh8/RwCVd+/OZITNUp3ZAmPPy2je92AtKqA1pHMpAWN4+3L1GGJGWa1zdgKXGJv
	M/0JihwZOhdNATbMJBuvEOnpa8ACqDU0eKlasirPbhNyp8/gwvR5UliOm4HUe6+gAgs5IjVJIUd
	VX9qs+xEA6O5l504vgSYcR5be7YkDRYeGKj6KrqBm5yUP+0JOLL3dZfFDzBpOauJ5JNo2xRDMfI
	Cguia6gLafl9BPuZ0FHcGuWUIfcX3sBOIq0YZhzrY=
X-Received: by 2002:a05:600c:8b05:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49ce5817bfemr260421475e9.6.1788439010332;
        Thu, 03 Sep 2026 05:36:50 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72d2asm12828927f8f.8.2026.09.03.05.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:36:50 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	nbd@nbd.name,
	lorenzo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org
Cc: linux@armlinux.org.uk,
	dqfext@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net v5 2/2] net: ethernet: mtk_eth_soc: populate lpi_interfaces to fix EEE support
Date: Thu,  3 Sep 2026 12:36:44 +0000
Message-ID: <20260903123644.23800-3-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903123644.23800-1-f@lex.la>
References: <20260903123644.23800-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

phylink_create() decides once and for all that a MAC supports managed
EEE, and it requires the tx_lpi ops plus non-empty lpi_capabilities and
lpi_interfaces. mtk_add_mac() leaves lpi_interfaces empty.

So ever since EEE support was added, ethtool has answered "Not
supported" on every MAC that uses mtk_phylink_ops, and
phy_disable_eee() has locked userspace out of turning EEE on. MT7628
is unaffected, as rt5350_phylink_ops has no tx_lpi methods.

Leave 2.5 Gbps out of both bitmaps, and the xGMII modes that
mtk_mac_enable_tx_lpi() already refuses. MAC_MCR folds SPEED_2500 onto
MAC_MCR_SPEED_1000, so MAC_MCR_EEE1G would govern LPI on such a link,
and that is unvalidated rather than known unsupported: MediaTek's SDK
driver sets the EEE force bits for 100 Mbps and 1 Gbps only, and the
unit of the wakeup timers is undocumented with the port clock at
2.5 times the rate.

mtk_mac_enable_tx_lpi() programs wake-up times taken from MT7531's
reset values, and the SoC's own field has no reset value to fall
back on. Only MT7981 has been seen to exit LPI cleanly with them, so
the LPI interfaces sit behind a new MTK_GMAC_EEE capability that only
MT7981 sets; every other SoC keeps the current behaviour until it has
been confirmed.

LPI stays off until userspace enables it, but the EEE advertisement of
a PHY that advertises it out of reset comes back, since phylink stops
force-clearing it.

Fixes: 952d7325362f ("net: ethernet: mediatek: add EEE support")
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
On the netsys v3 switch MAC the xGMII filter would empty lpi_interfaces
outright, as PHY_INTERFACE_MODE_INTERNAL is the only interface it
supports. MT7988 does not carry MTK_GMAC_EEE, so this is moot for now.

mtk_mac_enable_tx_lpi() programs MT7531's reset wakeup times (17 for
1 Gbps, 36 for 100 Mbps) whenever it runs, as its own comment says. The
capability gate exists because of that: MT7981 has been measured with
them (see the cover), the other SoCs have not, so they keep EEE
unreachable from userspace as before.

v2, with the full argument for leaving 2.5 Gbps out:
https://lore.kernel.org/netdev/20260824024117.46154-3-f@lex.la/

v4: the MTK_GMAC_EEE gate (Paolo Abeni).

v5: comments cut to one line (Maxime Chevallier); no code change.

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 18 +++++++++++++++---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  4 +++-
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index be3bd025c41a..fd7a49ae88d0 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -4828,7 +4828,7 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 	phy_interface_t phy_mode;
 	struct phylink *phylink;
 	struct mtk_mac *mac;
-	int id, err;
+	int id, err, i;
 	int txqs = 1;
 	u32 val;
 
@@ -4907,8 +4907,8 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 	mac->phylink_config.type = PHYLINK_NETDEV;
 	mac->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
 		MAC_10 | MAC_100 | MAC_1000 | MAC_2500FD;
-	mac->phylink_config.lpi_capabilities = MAC_100FD | MAC_1000FD |
-		MAC_2500FD;
+	/* LPI above 1 Gbps is not supported */
+	mac->phylink_config.lpi_capabilities = MAC_100FD | MAC_1000FD;
 	mac->phylink_config.lpi_timer_default = 1000;
 
 	/* MT7623 gmac0 is now missing its speed-specific PLL configuration
@@ -4966,6 +4966,18 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
 			  mac->phylink_config.supported_interfaces);
 
+	/* LPI wake-up timing is only verified on MTK_GMAC_EEE SoCs */
+	if (MTK_HAS_CAPS(eth->soc->caps, MTK_GMAC_EEE)) {
+		phy_interface_copy(mac->phylink_config.lpi_interfaces,
+				   mac->phylink_config.supported_interfaces);
+		__clear_bit(PHY_INTERFACE_MODE_2500BASEX,
+			    mac->phylink_config.lpi_interfaces);
+		for (i = 0; i < PHY_INTERFACE_MODE_MAX; i++)
+			if (mtk_interface_mode_is_xgmii(eth, i))
+				__clear_bit(i,
+					    mac->phylink_config.lpi_interfaces);
+	}
+
 	phylink = phylink_create(&mac->phylink_config,
 				 of_fwnode_handle(mac->of_node),
 				 phy_mode, mac_ops);
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 0168e2fbc619..88a9b3b23bea 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -994,6 +994,7 @@ enum mkt_eth_capabilities {
 	MTK_U3_COPHY_V2_BIT,
 	MTK_SRAM_BIT,
 	MTK_36BIT_DMA_BIT,
+	MTK_GMAC_EEE_BIT,
 
 	/* MUX BITS*/
 	MTK_ETH_MUX_GDM1_TO_GMAC1_ESW_BIT,
@@ -1034,6 +1035,7 @@ enum mkt_eth_capabilities {
 #define MTK_U3_COPHY_V2		BIT_ULL(MTK_U3_COPHY_V2_BIT)
 #define MTK_SRAM		BIT_ULL(MTK_SRAM_BIT)
 #define MTK_36BIT_DMA	BIT_ULL(MTK_36BIT_DMA_BIT)
+#define MTK_GMAC_EEE		BIT_ULL(MTK_GMAC_EEE_BIT)
 
 #define MTK_ETH_MUX_GDM1_TO_GMAC1_ESW		\
 	BIT_ULL(MTK_ETH_MUX_GDM1_TO_GMAC1_ESW_BIT)
@@ -1117,7 +1119,7 @@ enum mkt_eth_capabilities {
 #define MT7981_CAPS  (MTK_GMAC1_SGMII | MTK_GMAC2_SGMII | MTK_GMAC2_GEPHY | \
 		      MTK_MUX_GMAC12_TO_GEPHY_SGMII | MTK_QDMA | \
 		      MTK_MUX_U3_GMAC2_TO_QPHY | MTK_U3_COPHY_V2 | \
-		      MTK_RSTCTRL_PPE1 | MTK_SRAM)
+		      MTK_RSTCTRL_PPE1 | MTK_SRAM | MTK_GMAC_EEE)
 
 #define MT7986_CAPS  (MTK_GMAC1_SGMII | MTK_GMAC2_SGMII | \
 		      MTK_MUX_GMAC12_TO_GEPHY_SGMII | MTK_QDMA | \
-- 
2.53.0

