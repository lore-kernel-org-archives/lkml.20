Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF15E439015
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791361593; cv=none; b=RIubPPliFlaiZyx6Y/CDcGQmd4MbRLplE5boaiYKy9+/6NF/BqvHDlNJcMvA1WuO52tVV1pf3dgmT32l3Z7NaHiihZe1ZyDReNJPCf6RMbcJr3BDgmBh+aAhVbuXRjp4UcKHY1af81fTJ2T3n2SsbO2SOgUWzBfaIiIImkIlJB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791361593; c=relaxed/simple;
	bh=vpIj2UvLb9aw8rcNInqkcoO/0+5t9pSXrN9HKJ6PL/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ESUf+p3jJSkyl8BA0vVp2AKfo7m4lgp5BLrAEjAXPD7A9JQblGHrGXPEzj3fPm+avBQ/q0RVUP6S5fpbPXWT6Nt1foGeJldz1SvWNJJvlFfS8U77AbYjRzc1gTVVMMUckhoNYUu15AtahQNdAyGIKMvda97ofKlkSp2OPS9not0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-487049569b6so1114858f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:26:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361590; x=1791966390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qQePSOktcZsNwbFN9JzDoxNSE7kDsX9flymDNSHZKFQ=;
        b=YK1QparV/n1wIY/wd4vykCdD/8kDtILZKMpUh//2NCJFbJ26JGAyCWoFVdArQV5kLL
         ePRYHUl9IHkoZK9MLRblKs4p2vkOoHn2B99fNOUBnhvMSqxM+tIZHD80HcY9q8RnEoeU
         sB4FJ7gaT9F0i2omspgxFu6E2WLYAcsIgi+V+EeZL/sMNVNUMPMWqNCMPUJNK8b02SdD
         b7gW/3RByj5qo6npdZI/5hT7njYaZg2h6tEM9s3UbEgQXqQ/cclDLQhWOLtC2hEc6huK
         6m98vFm+PJtz7JivKhmGe0mThdv7emmQJtRAfAu2CPgt58Ih6x+pELgXh28qTKmkcmA6
         i1Pg==
X-Forwarded-Encrypted: i=1; AKwUvBxlVDSU5iQyz/POy6ee2T/ABy4Y6qwvzHtE6WxEYhEMKH4i0yUE+dbt4uhdTy07lvQR28qBFEs5Ac/PMEM=@vger.kernel.org
X-Gm-Message-State: AFq9FYICzCsG90j2v5RsXGVvpUdnNcvdS80OaCpUNXlwLxnHn/ndE/Mf
	1/xa1OHuuY6v1tH1zLlspyXLy8PazXvDekfdq38zCMw1u5g0HVmIpd9a
X-Gm-Gg: AYBFou3ylPSdmymek1UckAvU74AFd1K7WaxaAlD7soxbhQosy+SysVFcOuj4zEK0dw8
	OMfxNGmEubyjOi4AGtfV1qpkC/GF5dUnezK62DFFLdYVTNptKlahG5+9M0PCn3WlaNgARC1LJ+P
	CJsAUyKTx5474m/I408wl1kqCZySmnLNzEosGdMSaZJHPSA3IEu733U54nYGKZvIXcD1CuJ6zDS
	wT8KEx5pCLgPKEd2xJsSpSHC05erFhURQ48/CQewLClOlTMv3xhuXPFR8T2eQbsUHR8zEK22JU/
	HVXYPNbVIciYixK/FZW+39yIYyjD41f3kGyMfIfBNbDRu/+arApjPqdY4Wzsux8Fnzo9m6QAntv
	cfSa9ub8jCTRgOXRlJYiWSKQSDw47xjy4qTzoO11q75wTP2gc5sGh5Y1g0H+D2b+GVSeFHdhkbL
	HaNwKfhtj0deN6fxD4KBN4r14L4YKRSQOsurVEAECGK18ZOQpJ7A0I7YUM615QHUC1t1rwmDYpP
	LUJUcjm3bxKIg4aqKuy0hnsrikjTOtqBwgf
X-Received: by 2002:a5d:5f92:0:b0:48b:a6:61b0 with SMTP id ffacd0b85a97d-48c7289c820mr3137268f8f.47.1791361589960;
        Wed, 07 Oct 2026 01:26:29 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm4251370f8f.52.2026.10.07.01.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:26:29 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 1/7] net: stmmac: dwmac-meson8b: let the controller apply the RGMII delays
Date: Wed,  7 Oct 2026 09:26:21 +0100
Message-ID: <20261007082627.63807-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007082627.63807-1-tanure@linux.com>
References: <20261007082627.63807-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RGMII needs a delay on each of its two clocks. A board can get it from
the length of its tracks, from the PHY, or from the controller.
"rgmii-id" in the device tree says the delay is added inside the chips
but not which chip adds it, and the generic tx-internal-delay-ps and
rx-internal-delay-ps properties name the controller.

This driver ignored those properties. In the "-id" modes it switched
its own delays off and left the whole job to the PHY, so a board that
asks the controller for one of them does not get it, and a board whose
PHY cannot supply that delay has no usable link at all.

Boards not using those properties behave as before.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 46 ++++++++++++++++++-
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index e4d5c41294f4..d73dfd0ac167 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -92,6 +92,8 @@ struct meson8b_dwmac {
 	struct clk			*rgmii_tx_clk;
 	u32				tx_delay_ns;
 	u32				rx_delay_ps;
+	bool				mac_tx_delay;
+	bool				mac_rx_delay;
 	struct clk			*timing_adj_clk;
 };
 
@@ -299,6 +301,22 @@ static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
 		delay_config = rx_adj_config;
 		break;
 	case PHY_INTERFACE_MODE_RGMII_ID:
+		/*
+		 * "rgmii-id" only says the delays are internal, not which
+		 * side applies them. The *-internal-delay-ps properties say
+		 * it is this controller, so leave ours switched on.
+		 */
+		if (dwmac->mac_tx_delay || dwmac->mac_rx_delay) {
+			delay_config = 0;
+			if (dwmac->mac_tx_delay)
+				delay_config |= tx_dly_config;
+			if (dwmac->mac_rx_delay)
+				delay_config |= rx_adj_config;
+			else
+				cfg_rxclk_dly = 0;
+			break;
+		}
+		fallthrough;
 	case PHY_INTERFACE_MODE_RMII:
 		delay_config = 0;
 		cfg_rxclk_dly = 0;
@@ -384,6 +402,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct meson8b_dwmac *dwmac;
+	u32 tx_delay_ps;
 	int ret;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -409,9 +428,13 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	dwmac->dev = &pdev->dev;
 	dwmac->phy_mode = plat_dat->phy_interface;
 
+	/* the generic property is preferred over the vendor one */
+	if (!of_property_read_u32(pdev->dev.of_node, "tx-internal-delay-ps",
+				  &tx_delay_ps))
+		dwmac->tx_delay_ns = tx_delay_ps / 1000;
 	/* use 2ns as fallback since this value was previously hardcoded */
-	if (of_property_read_u32(pdev->dev.of_node, "amlogic,tx-delay-ns",
-				 &dwmac->tx_delay_ns))
+	else if (of_property_read_u32(pdev->dev.of_node, "amlogic,tx-delay-ns",
+				      &dwmac->tx_delay_ns))
 		dwmac->tx_delay_ns = 2;
 
 	/* RX delay defaults to 0ps since this is what many boards use */
@@ -424,6 +447,25 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 			dwmac->rx_delay_ps *= 1000;
 	}
 
+	/*
+	 * Each property names one clock this controller delays itself. The
+	 * PHY must be asked for whatever is left, or the two would delay the
+	 * same clock and push it past the window.
+	 */
+	dwmac->mac_tx_delay = of_property_present(pdev->dev.of_node,
+						  "tx-internal-delay-ps");
+	dwmac->mac_rx_delay = of_property_present(pdev->dev.of_node,
+						  "rx-internal-delay-ps");
+
+	if (dwmac->phy_mode == PHY_INTERFACE_MODE_RGMII_ID) {
+		if (dwmac->mac_tx_delay && dwmac->mac_rx_delay)
+			plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII;
+		else if (dwmac->mac_tx_delay)
+			plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII_RXID;
+		else if (dwmac->mac_rx_delay)
+			plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII_TXID;
+	}
+
 	if (dwmac->data->has_prg_eth1_rgmii_rx_delay) {
 		if (dwmac->rx_delay_ps > 3000 || dwmac->rx_delay_ps % 200) {
 			dev_err(dwmac->dev,
-- 
2.56.0

