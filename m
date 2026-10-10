Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BD4411FA4
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791629955; cv=none; b=X3FTDnspf/mJdd+rPGA6GOv4ckOPSuHK0DxKpmc4DA9Oxm3U+fwpQVZor8kCDB2YYlBoTWZ1Txdgoi47F0Iegz5BIed4YFbEvkNjvKAwR0OE0qRE9gi3ssFmG1/mCzfrCEfrX/HFRZS1Le0Oh9zDp5NcLd4qpGc8okwLqDLxLFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791629955; c=relaxed/simple;
	bh=TY/KHVvshmS9MGMPKv7uXGFWW/2ltsbS13wMB6VOhAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cg4tINJbt54FUDWD2lHcDNhwoj9oHrP+YKUNA29T2Qy6Orf6BvBy6L+6G2AYktPwlay3VRS9MtcvrswBlNz+1LK1+26gsg+OGUTaa7quNwubQtfZK4bzu+twg89KAnH4NDX16aHTh3OopDycqJ21GmttIH6sz5Vr0A+koC0RESY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso463662f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:59:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629947; x=1792234747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HlLKyjGQ0AAc4TW5PQo15LeRFFyi9d2wMG56ClxAqWI=;
        b=zxq44jeXoKNIXIDKU9NHPcu+172H3eb6hiZHQSQGrw7XtNSc8ZtWeZm6wX5fiJlFlH
         ngjY02rwxI2xcqGDbEZdmYSBhDiq4p16yqn+06wYTxr+Q4Jx1QmEWM/epwMPEKye54mA
         I4ggsUSm6/U1r/FS3pHAPdbGOhGJkWsHSAu9QnbiD4of8Hm+pQ+GmqJAmtH3+WDCDP/P
         mOTvUOH5fFNrtcacRcVHd8WM4BywcChs3Zf3LgjEdosvNq242jtaN1HXUw4k9cJfQGoW
         RlbJOmgbYxBozSqJi2199FNitp3/0fNzFJy85uUGhpE7tOfIr/VQMeAeKUA65KDc26PB
         ZgDQ==
X-Forwarded-Encrypted: i=1; AKwUvByumCB8ELTeuLGmERFL5Wsb4Yel6kkL55SD59XrwgqDaGs8QBi4HrBFIaCdA7NYe0u9R1BCH0WnVPQB2Xw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQGTUYJn/HIzkBF9Boi7q7X0IHCVxf64ezdvpy+ChXuxADRMsS
	0JYo08wCo3W129wW5sHz3oBS5T2qBnF0DgyMJgfhk7tfMt+saYYfgPg2
X-Gm-Gg: AYBFou3dgNltMR2r0xxbM2NqACw85kX9RwUvN4dkHoRmQ7DsVQZw0j4YJD4OaEFRww5
	Ssfg0zTu37TLP0KSR4b1wSVQhZyxzWeoKQIffJ6l6jxwJWhoRNxC32+rixM/4n95ByUGBF944Fn
	5vKnrvyNxZQJBc+mLe74bgb3QIAbSO5OjmYeSKYz85dk9+CjTVWyVXAt+uEAyW87BMaZ1FqIOPl
	cvZb2DjH4lfvNmu4pmzvbchTRfc1PPd4Rtgy/LJSwYVbKaClOXxNRIbHagc46NwYTSeunh1iap5
	pnXDYQ6t7KN8y3T1Vzl75zdtlGKQKZukySCtC1pNtd43bQoi/iAuc13BtgokQl450HH/hyguXbR
	hlBMHsDJ6r6237KyemgMvZ4iMDcPt5und2Qz637K3YyXF+UKE0Jj2ewDMT9maLGv7waeGiR+/nJ
	6HB1ZFJdaI0HA7TZwelt97vqMkvsfApCKaJilFDF393vX87/geYb3IOuidXAtPbPuqBJjkcfCcE
	1XEGcTs3w2Xwsn0rcvdFStEQMKOwBDaAWQ=
X-Received: by 2002:adf:e004:0:20b0:487:88b:4681 with SMTP id ffacd0b85a97d-48dba9db07cmr6245470f8f.10.1791629947476;
        Sat, 10 Oct 2026 03:59:07 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm8709526f8f.57.2026.10.10.03.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:59:06 -0700 (PDT)
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
Subject: [PATCH v3 4/8] net: stmmac: dwmac-meson8b: apply the RGMII delays the T7 way
Date: Sat, 10 Oct 2026 11:58:56 +0100
Message-ID: <20261010105900.247342-5-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010105900.247342-1-tanure@linux.com>
References: <20261010105900.247342-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RGMII needs a delay on each of its two clocks. phy-mode says whether
the board provides them with longer traces, and the generic
tx-internal-delay-ps and rx-internal-delay-ps properties say this
controller provides them. Whatever is left is the PHY's job.

The existing code reads phy-mode as naming the chip that adds the
delay, which is the opposite, and it ignores both properties. Changing
it would change every board already relying on it, so the T7 gets a
path of its own and the rest stays as it is.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 103 +++++++++++++-----
 1 file changed, 76 insertions(+), 27 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 450f7b4b29a6..1861a0d45b2d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -82,6 +82,7 @@ struct meson8b_dwmac_data {
 	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
 	bool has_prg_eth1_rgmii_rx_delay;
 	bool has_pipeline_clk;
+	bool mac_applies_dt_delays;
 };
 
 struct meson8b_dwmac {
@@ -272,6 +273,49 @@ static int meson8b_devm_clk_prepare_enable(struct meson8b_dwmac *dwmac,
 					meson8b_clk_disable_unprepare, clk);
 }
 
+static int meson_dwmac_init_dt_delays(struct meson8b_dwmac *dwmac,
+				      struct plat_stmmacenet_data *plat_dat)
+{
+	struct device_node *np = dwmac->dev->of_node;
+	u32 tx_delay_ps = 0, rx_delay_ps = 0;
+	phy_interface_t phy_mode;
+	bool mac_tx, mac_rx;
+
+	mac_tx = !of_property_read_u32(np, "tx-internal-delay-ps", &tx_delay_ps);
+	mac_rx = !of_property_read_u32(np, "rx-internal-delay-ps", &rx_delay_ps);
+
+	/* one step is a quarter of the RGMII clock period, 2ns at 1Gbit/s */
+	if (tx_delay_ps > 6000 || tx_delay_ps % 2000)
+		return dev_err_probe(dwmac->dev, -EINVAL,
+				     "The RGMII TX delay must be 0, 2000, 4000 or 6000ps\n");
+
+	/* the RX delay line moves in 200ps steps and reaches 3000ps */
+	if (rx_delay_ps > 3000 || rx_delay_ps % 200)
+		return dev_err_probe(dwmac->dev, -EINVAL,
+				     "The RGMII RX delay range is 0..3000ps in 200ps steps\n");
+
+	phy_mode = phy_fix_phy_mode_for_mac_delays(dwmac->phy_mode, mac_tx,
+						   mac_rx);
+	if (phy_mode == PHY_INTERFACE_MODE_NA)
+		return dev_err_probe(dwmac->dev, -EINVAL,
+				     "Cannot provide the delays %s asks for\n",
+				     phy_modes(dwmac->phy_mode));
+
+	plat_dat->phy_interface = phy_mode;
+
+	meson8b_dwmac_mask_bits(dwmac, PRG_ETH0, PRG_ETH0_TXDLY_MASK |
+				PRG_ETH0_ADJ_ENABLE | PRG_ETH0_ADJ_SETUP |
+				PRG_ETH0_ADJ_DELAY | PRG_ETH0_ADJ_SKEW,
+				FIELD_PREP(PRG_ETH0_TXDLY_MASK,
+					   tx_delay_ps / 2000));
+
+	meson8b_dwmac_mask_bits(dwmac, PRG_ETH1, PRG_ETH1_CFG_RXCLK_DLY,
+				FIELD_PREP(PRG_ETH1_CFG_RXCLK_DLY,
+					   rx_delay_ps / 200));
+
+	return 0;
+}
+
 static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
 {
 	u32 tx_dly_config, rx_adj_config, cfg_rxclk_dly, delay_config;
@@ -411,32 +455,34 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	dwmac->dev = &pdev->dev;
 	dwmac->phy_mode = plat_dat->phy_interface;
 
-	/* use 2ns as fallback since this value was previously hardcoded */
-	if (of_property_read_u32(pdev->dev.of_node, "amlogic,tx-delay-ns",
-				 &dwmac->tx_delay_ns))
-		dwmac->tx_delay_ns = 2;
-
-	/* RX delay defaults to 0ps since this is what many boards use */
-	if (of_property_read_u32(pdev->dev.of_node, "rx-internal-delay-ps",
-				 &dwmac->rx_delay_ps)) {
-		if (!of_property_read_u32(pdev->dev.of_node,
-					  "amlogic,rx-delay-ns",
-					  &dwmac->rx_delay_ps))
-			/* convert ns to ps */
-			dwmac->rx_delay_ps *= 1000;
-	}
-
-	if (dwmac->data->has_prg_eth1_rgmii_rx_delay) {
-		if (dwmac->rx_delay_ps > 3000 || dwmac->rx_delay_ps % 200) {
-			dev_err(dwmac->dev,
-				"The RGMII RX delay range is 0..3000ps in 200ps steps");
-			return -EINVAL;
+	if (!dwmac->data->mac_applies_dt_delays) {
+		/* use 2ns as fallback since this value was previously hardcoded */
+		if (of_property_read_u32(pdev->dev.of_node, "amlogic,tx-delay-ns",
+					 &dwmac->tx_delay_ns))
+			dwmac->tx_delay_ns = 2;
+
+		/* RX delay defaults to 0ps since this is what many boards use */
+		if (of_property_read_u32(pdev->dev.of_node, "rx-internal-delay-ps",
+					 &dwmac->rx_delay_ps)) {
+			if (!of_property_read_u32(pdev->dev.of_node,
+						  "amlogic,rx-delay-ns",
+						  &dwmac->rx_delay_ps))
+				/* convert ns to ps */
+				dwmac->rx_delay_ps *= 1000;
 		}
-	} else {
-		if (dwmac->rx_delay_ps != 0 && dwmac->rx_delay_ps != 2000) {
-			dev_err(dwmac->dev,
-				"The only allowed RGMII RX delays values are: 0ps, 2000ps");
-			return -EINVAL;
+
+		if (dwmac->data->has_prg_eth1_rgmii_rx_delay) {
+			if (dwmac->rx_delay_ps > 3000 || dwmac->rx_delay_ps % 200) {
+				dev_err(dwmac->dev,
+					"The RGMII RX delay range is 0..3000ps in 200ps steps");
+				return -EINVAL;
+			}
+		} else {
+			if (dwmac->rx_delay_ps != 0 && dwmac->rx_delay_ps != 2000) {
+				dev_err(dwmac->dev,
+					"The only allowed RGMII RX delays values are: 0ps, 2000ps");
+				return -EINVAL;
+			}
 		}
 	}
 
@@ -452,7 +498,10 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 					     "missing pipeline clock\n");
 	}
 
-	ret = meson8b_init_rgmii_delays(dwmac);
+	if (dwmac->data->mac_applies_dt_delays)
+		ret = meson_dwmac_init_dt_delays(dwmac, plat_dat);
+	else
+		ret = meson8b_init_rgmii_delays(dwmac);
 	if (ret)
 		return ret;
 
@@ -490,8 +539,8 @@ static const struct meson8b_dwmac_data meson_g12a_dwmac_data = {
 
 static const struct meson8b_dwmac_data meson_t7_dwmac_data = {
 	.set_phy_mode = meson_axg_set_phy_mode,
-	.has_prg_eth1_rgmii_rx_delay = true,
 	.has_pipeline_clk = true,
+	.mac_applies_dt_delays = true,
 };
 
 static const struct of_device_id meson8b_dwmac_match[] = {
-- 
2.56.0

