Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572339;
	b=Y3AegyxAyXDwIipW8QYp78iB1rc8yShdCzv893LTm0oFBTh8mG4wCnItaOZEBp0X/NqH
	 qefgE5Q2YGW/1tpXoAx9A2D2G7dgo23pzGENXhzFB/nuL/EPNOk/XJr20IsZTwhfidTEp
	 3fPKtJKizNjC89tcxootZXlzupV/dvnD72k4+j9Vme2cij9C9cB+WjeZo/X5gWj/oHUuU
	 cfj8WnoEnqYi93TXLryP0h32NjhhgSdrNgYxLfhn7lKWccY2ZDGvSOWDlbOo+00gDRqyK
	 92Uqcoqd8fjKPZ/nMJQ6qMvL8JIdU6+kBwgXof6o2ZXAnFS8HaWe1Z5YrBQFXzytwkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572339;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tO+egXWm6JoZZG/jdjtdaE5a20hm/Ptu/AmJt75eDBE=;
	b=lyoR7tsj0/S7PLCVYtmW9i6hBUoLS1TtlVulSQ0K1S8UK4p+WZF7DnOcPl/AsLSSmMsH
	 vniaiQJ28j08Rk1aBLBAAYCpdt7575JAu/x1aRayJRb+eGPb27aTkDYR2hWr4yHzIPZHG
	 y05RuffTNXVtH2E9m/tsmD1e/g8lAGYmS5RB+mYm92ig//20qlscmj98OusAZXvzQcXdm
	 NG1qYFkAkKndZJs+zHVHZKIn+Yl3NOiobZeXCIyt6RcdHE8vxiDgNfwqEycdF7B/ATyjy
	 yCTq3KQ27zja1NGlxDYKyGZryu+BRv+SkK6/csCXny/TdoSbBeJ7Y6zuT2RAjRrfDNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2482A606A880
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2482A606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso12814485e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:18:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572337; x=1795177137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tO+egXWm6JoZZG/jdjtdaE5a20hm/Ptu/AmJt75eDBE=;
        b=pq+1+AkG9c6wGvGlU5M0HsdZtI7FBhRzQW9tvKe2I88VXhn/FEWioC7e65W7Kc/fNU
         PXC+f/j0G1G0dDu0QCWTfnBGwd2hrAv7p9TgmJ48BHwcxq78ncWVQyf5MQDe9Iejr+4i
         4CxKhkaQhzAuJQK8NBMfV7XMDCM+XF9UPz1nSVfI0e/LVtTcBA9zzW0muPE3ct955WSh
         zHrN7Fj6VaD3eVHB339pU4olsGxKSB19ROhrcRA8Hd5CynJ5yxbzaBAGSGkRh1nmPYLp
         IxBwduP5RajPW5eQQT+WJDr7heCjgfb9lliYjzusMNTH44/shUtdZCSw3f0dOSBk3BJ9
         0Bbg==
X-Forwarded-Encrypted: i=1; AL+hErGKFbEjscdlKbKHDRpaMqBKceBCI92QcTzOz6w3DDKtqeroAZxO+BrwFz5fqwVUQlU+elEu27sZOvhZeBg=@vger.kernel.org
X-Gm-Message-State: APuU4Z99/tOf0D4ud1qaYQf4+jMcaYaSGklJSiUFsk2UsKoH4mpTD06d
	+0V7juoDht2TAPgH9P4uRrpRDKAvtEGenn4njsbl7wZxT6AdF17KEeeN
X-Gm-Gg: AYBFou3ryCKf8dDtsb4cz3/cxfIt1F0BRLs1tpG1xOvVBQzMWibBBNj59/aQvqx5rJ/
	CnTxrGyLR4NEdssk9J0vkc2aE/gn4HVDpYuVnbXPq8/SG3LG/8CzhgZ0Rz1OwwabooBKUU9FC9T
	FuzS+U1KCyUIlD10+mL9YoADkwPEdEQyYJQS6sKIVJUg+wo+HH1JWqtxOrm8RIG2EcZvliSEU8b
	+NClAjmRiHcI4Nc6bv11zLnmIFrzMFp7KPk3dGpMDYucr9SlaGBrIdWlOlFcK68GVYTki9k8BzV
	1pvS1NP53QE9qr93PVzYT14TKoyVXPFM6OM2u1QsZxZeYciY+Uuu2myLn7kffhzubQT3anLXbLj
	oo3jDY7/RuiAyJuxTaTfzMedyhNk/f/yOhO/Am0eiNzfXtS7qQNyuSd0oxXExnqzMJeFqWkvdx0
	DTTn8GY7nfuaJqkQT9y1g3Jzf98jVB/zSsCkZ4Joh2BUjY2vJ4CGxSTlLQhSOvw4Z/OfbF3aKuo
	NVQFszeMDnKYP620gvFGdabm5+9yT8xKjAqrZg+VBEIIt6khzkzvmxZ9I42NJiLpTEDwi/2+9lA
	zjkDIvl6snD5jiOLgeiZ/NxcDgX7gX1DAws3G1+7xJJAUZaHzOXa+rOL6GeuNGlkua5kbLj/gRI
	/uPAUuHmtfsK4cidGDfqVO9lq
X-Received: by 2002:a05:6000:29ce:b0:48f:bb92:c5a7 with SMTP id ffacd0b85a97d-49c70ed9029mr3869206f8f.9.1794572337361;
        Fri, 13 Nov 2026 04:18:57 -0800 (PST)
Received: from threads.localdomain ([84.70.166.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm5167103f8f.40.2026.11.13.04.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:18:56 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v7 4/7] net: stmmac: dwmac-meson8b: follow the generic RGMII delay rules on the T7
Date: Fri, 13 Nov 2026 12:18:49 +0000
Message-ID: <20261113121852.334604-5-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113121852.334604-1-tanure@linux.com>
References: <20261113121852.334604-1-tanure@linux.com>
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

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 42 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index ad30730db57f..d8c23b280b59 100644
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
2.56.1

