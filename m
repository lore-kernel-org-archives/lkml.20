Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723843;
	b=W/5k+rdLl2gQtp0jHeaTEaXk1g9Q7vrQp7IhbOH9f4DE7NbImj3m4N0k88rCg9sbQ9cC
	 w2dYj6CA2rsk8Ouofw/MWN7yTGxiruD8DJd/zuOLBT4TT7CsmA+vcSAimyKxu0MNniEEO
	 ncT6MGroUO+M8gOLg0arRa8JgY7AtWvKfuwRK6y/z7wky/y4p7ua8L1HASL+E39mnLpbj
	 8LQKGGE98OoWZnGDfUHI1fpnrTNwe2S9rL/9d9DcAm6rH0chn07uYgbgC4X4hQbvHbGks
	 tro6Z0FtQZkd5ufzqVeygZS6aCJBC0HKSC+XrqW1l3IEW34eld+RtO05Zf7TKcq6nGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723843;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=b7yfUIavlqkZvjW0hdKuc7GNLhU6uDD+OhW8RPwrMQg=;
	b=fQIXYstOuE2wmpoN74nRV7hCX6aQ9Io9QBVzpRoZpvIcr9NUg9go7PB65ZWsDRjEW+aJ
	 n1cWzDHQAJiWjCs4Cxa8F0E5TR0ek1xogd8gnzWAndg4oQQZwT4dKfpAKUFoa0s1jhT/u
	 1M0zeUDx5jgj3KgRdST8T9oNI4BNOiq5cLEjUPUQuJv6BbGZPi8wifrLyavzA+4JKE9eS
	 GLXyUEWGZTj6UhV8CDWrhp4cgjxyEJ7VNTnIGG3O5LIsAmqulhRRwAm2o7NqNc9CfG0nz
	 HqHF8PPRXx6VPd482N0ouHeegADhF3JjLseOXOUTFt4Z7f8CHGfvKycWPnaczWhFrQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FA7606EE96
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2FA7606EE96
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afbd2c386so2616341f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:37:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723841; x=1794328641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b7yfUIavlqkZvjW0hdKuc7GNLhU6uDD+OhW8RPwrMQg=;
        b=ABZKvHM6v0RZ1BiR/oJuGVpXHprOMizAenNwWKmS/iJaNI00Xm4IGrmlejiB0z7BmH
         OQcFLQVcMicsSHQurikufBPIOmKwDM6vqCruQm8H32H3/bdOMxw5GLd16V7E/IciJqLm
         UgrwI2uEzl3qqwtJpolJ8jdhtezo8xBT6TSf4gRxm3dQRwjEkWBODiHJoBcSJlCqPFpL
         QpgAY37pQnhJTdYrruwCl0HYd5YgGpnaJphAaZpY6oRasV2YxnSPEFDVwUM6ySHPqZAP
         sMwHd7V/i/yHXJEd8I5z/KBz9eyvU5sYx/BwY2NHaDxxXIIdJ6i3ST1VHUOiBDDkzDKg
         deZA==
X-Forwarded-Encrypted: i=1; AKwUvBz3pff1tSCpfc9MhjlokytKgwoBZxcyRfIIRYA6xJTvX7zVV30OSEFao4K7kVB4kl3e0OaDmw4XpGVRne8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Xn6Jp7gipVNgbp13WMZjo25WXpMbCtcVAGksca7owm9q3/fQ2
	G+WnvQUb6LrcwvrmfNIqg5KRcZZCRXEKWKMe5KounNoNL6ZQoVdQv4qT
X-Gm-Gg: AYBFou1uuUsBheTNObS/S2Z2TblDiIF3Qtrar9fXPfAFexQ+jdjXyO5gWLPWOU/NJ3F
	orvvJdjFn8HH1VIHSqO3W6+sTLSSnQF4PmtmJ5qhX8OnAfTy7bWjx47zJGQUcVN9KnBqhD8FIMZ
	EiFYXF0Fjyn5aWYo2C8SFmopN73KJ1Nwl+vlOlRkVfjoCjy36cAZqM/3TG28jgfWI9cvdw8SktV
	axAPdUysgoqaOUuLCQJNMQDB6GUhQP1xyAkDsq+McsRzO5j1jzQwXGpdP69qvyd7OnVFD3ynauP
	ltz0bDJk3g3peVZkYkvyH1gIrPeqRb0n7WWEd55NTvYGuH4c7ELYrqbxXY+Bvx2X9WTn6mfHa1I
	hZcuf7t/eW6ThmM+JwIFUv/68VoSxX3fnyW1TxFW6Q5bEzSURmfD6oNtq4wGfd8+8j95+jUAyvA
	pEyvEEY45Dni/wlSHc1bFxaPfnJjoalmLiP2pnNEYxWSiwfNhL7IQUXtqQ0bQCnHuAFNPcK4jXs
	aF+y0W79FAfaTF2kpRj/U/6xB4YJgP0i1Mt4a7In+ZkLgIGHHnkQN/JrbFmdw6Z6l2B4Tea1jQH
	jYNR1eP3A27ix44CiEaWFiI25BWTkc23q3I21CkV+kxvk6GdEEf2iRDqqA7vdFDvw6ZQvay5iv9
	DXv91o3xX6nB/H7aeNQ+UpfqRQQ==
X-Received: by 2002:a05:6000:41c8:b0:48d:faa6:cedf with SMTP id ffacd0b85a97d-48e6e50645dmr30646945f8f.56.1793723841371;
        Tue, 03 Nov 2026 08:37:21 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm29044772f8f.6.2026.11.03.08.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:37:20 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
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
Subject: [PATCH v5 4/7] net: stmmac: dwmac-meson8b: follow the generic RGMII delay rules on the T7
Date: Tue,  3 Nov 2026 16:37:12 +0000
Message-ID: <20261103163715.385394-5-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103163715.385394-1-tanure@linux.com>
References: <20261103163715.385394-1-tanure@linux.com>
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

The delay code reads phy-mode as the list of delays this glue has to
add, falls back to a 2ns transmit delay when no property asks for one,
and takes the vendor delay properties. ethernet-controller.yaml says
the opposite: the PHY adds the 2ns delays, and the MAC properties only
hold small fine tuning added on top. Every board in the tree depends on
the old reading, so it stays as it is.

No T7 board uses this glue yet, so the T7 gets a path of its own that
follows the generic rules: the receive delay line is fine tuning in
200ps steps, and the transmit side, a quarter-period phase step, offers
none, so the transmit property is refused.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 42 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 450f7b4b29a6..c8bd15b6780b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -80,6 +80,7 @@ struct meson8b_dwmac;
 
 struct meson8b_dwmac_data {
 	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
+	int (*init_delays)(struct meson8b_dwmac *dwmac);
 	bool has_prg_eth1_rgmii_rx_delay;
 	bool has_pipeline_clk;
 };
@@ -338,6 +339,41 @@ static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
 	return 0;
 }
 
+/*
+ * The T7 follows ethernet-controller.yaml: the PHY adds the 2ns RGMII
+ * delays and this glue only fine tunes the RX clock on top of what
+ * phy-mode describes. Its TX clock has no fine tuning, the only step is
+ * a quarter of the clock period, so the TX property is refused, and so
+ * are the vendor properties of the older SoCs.
+ */
+static int meson_t7_init_delays(struct meson8b_dwmac *dwmac)
+{
+	struct device_node *np = dwmac->dev->of_node;
+	u32 cfg_rxclk_dly = 0;
+
+	if (of_property_present(np, "tx-internal-delay-ps") ||
+	    of_property_present(np, "amlogic,tx-delay-ns") ||
+	    of_property_present(np, "amlogic,rx-delay-ns"))
+		return dev_err_probe(dwmac->dev, -EINVAL,
+				     "only rx-internal-delay-ps is supported, the PHY adds the RGMII delays\n");
+
+	if (phy_interface_mode_is_rgmii(dwmac->phy_mode))
+		cfg_rxclk_dly = FIELD_PREP(PRG_ETH1_CFG_RXCLK_DLY,
+					   dwmac->rx_delay_ps / 200);
+	else if (dwmac->rx_delay_ps)
+		return dev_err_probe(dwmac->dev, -EINVAL,
+				     "rx-internal-delay-ps needs an RGMII phy-mode\n");
+
+	meson8b_dwmac_mask_bits(dwmac, PRG_ETH0, PRG_ETH0_TXDLY_MASK |
+				PRG_ETH0_ADJ_ENABLE | PRG_ETH0_ADJ_SETUP |
+				PRG_ETH0_ADJ_DELAY | PRG_ETH0_ADJ_SKEW, 0);
+
+	meson8b_dwmac_mask_bits(dwmac, PRG_ETH1, PRG_ETH1_CFG_RXCLK_DLY,
+				cfg_rxclk_dly);
+
+	return 0;
+}
+
 static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
 {
 	int ret;
@@ -452,7 +488,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 					     "missing pipeline clock\n");
 	}
 
-	ret = meson8b_init_rgmii_delays(dwmac);
+	ret = dwmac->data->init_delays(dwmac);
 	if (ret)
 		return ret;
 
@@ -475,21 +511,25 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 
 static const struct meson8b_dwmac_data meson8b_dwmac_data = {
 	.set_phy_mode = meson8b_set_phy_mode,
+	.init_delays = meson8b_init_rgmii_delays,
 	.has_prg_eth1_rgmii_rx_delay = false,
 };
 
 static const struct meson8b_dwmac_data meson_axg_dwmac_data = {
 	.set_phy_mode = meson_axg_set_phy_mode,
+	.init_delays = meson8b_init_rgmii_delays,
 	.has_prg_eth1_rgmii_rx_delay = false,
 };
 
 static const struct meson8b_dwmac_data meson_g12a_dwmac_data = {
 	.set_phy_mode = meson_axg_set_phy_mode,
+	.init_delays = meson8b_init_rgmii_delays,
 	.has_prg_eth1_rgmii_rx_delay = true,
 };
 
 static const struct meson8b_dwmac_data meson_t7_dwmac_data = {
 	.set_phy_mode = meson_axg_set_phy_mode,
+	.init_delays = meson_t7_init_delays,
 	.has_prg_eth1_rgmii_rx_delay = true,
 	.has_pipeline_clk = true,
 };
-- 
2.56.0

