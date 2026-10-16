Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541C545D5D2
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141032; cv=none; b=rsd56ufUllwlv5iWL+/aY3jc6c42Tk96AkIvFkOi4z7VIuwaoeSDAs+m59PMxvG4/1ByNGShuZtsmZSYfOhQSTdFYf09TaIhSU5HRgmdJuzTk1DgvhEKgLQPgaQfwRKiwrMb++1o8qblubwCwU6qaP4f8cMDX0Gsxwny8W2CLac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141032; c=relaxed/simple;
	bh=lmQQQHnNl4r4tGiXOJbghuVbF8/OCluaIwoRthxoOuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VGpXUc4q00SJBsIHqZYniPW4m7ahQlDA3gmxa2zHgWQNW7qDS0YqjWubka3jgJfT2ly4hY8tUqoDoYZznVi3BXxfYlP+bKqh+m76dvRFFE+SrCJcywtEfTYwEsC3XFAnmb6QmSEYFEjLi+6Pz06Nl3S/ApYrXu0e9bsJVzXX8xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S65qMR0j; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S65qMR0j"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2df8e3c664cso5255985ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141028; x=1792745828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xv/fzgEaLHwSOTuuR0+7ucwKNcEXz6nX6gNKEqp1/5w=;
        b=S65qMR0jBAoFXb76hO2HI3p9cjSgxQ+I6gZJsLQCWNAby4jW2MrBAvbsvGVfv9ux3a
         4a1JVJR4vYyLO+3l9h2nhUJBHcfy3R3TkzrN7f22VP34aT7lMyOzkpTlvXfwuMr2nKp5
         lQuhtiU8QxWKWhbbwafpD6GIbJx9fwan00dbm31HpgTCBgx1IfCLLOdYNd0rPGkEkN0T
         D9/f1z1RsOK9Ank7kOTHOCWSSIf6awC07IlQk8+R9bFl62c45hjjmsijh1aGEp5UFsDr
         HITCMvyM59rB32c6wCjfdML04tPU6nXIrDggl4lg1J4CrBKzEQMoYuBeDGB39HkXyFxh
         lfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141028; x=1792745828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xv/fzgEaLHwSOTuuR0+7ucwKNcEXz6nX6gNKEqp1/5w=;
        b=oTFftiaujWrVqzv0vFz0DyTcRauze7c3flW5A/jO4nOw+GSFqDHaNuqumOIH+0tPPi
         wWKoWaZniDxLrwC/xjNzkObGOkD2sb3h6OG3Qvtbs3JiUe491xYL5ly2F8K4EjKsqigw
         fSmu3gMg3mae2SJg7JBqoP8uXE5cMQ3OVMlILo4NQkrnEG9uyYjDMucCDzDzGZXG/DEK
         80mm5udq+Ag7EKSSbDDN73rQXXn/8ahYZTHad3zjJJ2HazZfay5l3txysHbxOAnjhTUB
         gJ5obgeiQ3+v5HMKVEKNCmQN05kb82iAaSu0mS0aCmj+jYdBnIwavFPmVsJgVPiot7L/
         W/gQ==
X-Forwarded-Encrypted: i=1; AKwUvBzC49zZamTHA6YKiRBwHzPkcBdlLMXQZeL5PPp1y8pgnEJ9iuSMzJ92L5MDVtW4icLjH6yGjx7qC/R7VOQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLGTYdS9zYTdkFlY8YfVgsqFAzw5Feb3sLIzbbU9o3T5y5qHpO
	reT84W0fCK6biry9+Eh9nKgoopZUhYD7TPTlF/p1WN2MP7lAcatxTWQw
X-Gm-Gg: AYBFou3HBvwbcCac/LsRyoad6psDSwuxYUnPSXGWMQ87SixhE0FcSSogzXxACmUlwBo
	nZ2LKk15YyWkPg7MnV6wD+fTFjOEtCTn3rCjytyOUMMzpFno/N9wjmb6Pnrg2taRgVLzfhekXMk
	PVkUB5HBG2Vs2/arKpwDRpbotBtSQzLZ9C+iSQFmZCCwKCmBJ8GQl5COupTz+B5UhIpH0WshGTv
	JDEMPW6inTDWZixwyLAQ6/QbsTUHzdzGHEveJDSNv5SXs08G31vGCxUWiHM5zkpV9AEclL72amC
	vVj14NRTT8JADhYZTel1S+lK1+65oZbvhrn8HU8n3kpytfsWyNsP7uqhKt9xi4Mdxd77RZ6sjVx
	OmYCZ62aapE0YWt10ErbXucKs2C3gKRzDUoggT8W3Ns02PNZ81MJulWUBuYPmx/MP4CHv2sXLas
	6jFoEaiZyOAXsSLU6Jp+0q3x8QpWbbb5SfiwEwXzMAs5hQB9yDIOql92nY3XFlEiLPyezN7KseG
	XXcseb6dP4QlNXdvh7XoMtMZulDww==
X-Received: by 2002:a17:903:1251:b0:2e9:9263:a58 with SMTP id d9443c01a7336-2e992644a1cmr12846855ad.1.1792141027903;
        Fri, 16 Oct 2026 01:57:07 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e882a20sm6971025ad.62.2026.10.16.01.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:57:07 -0700 (PDT)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 16 Oct 2026 16:56:39 +0800
Subject: [PATCH v5 5/8] phy: rockchip-samsung-dcphy: Add a second PHY for
 the receiver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-dcphy-rx-v1-v5-5-e63b49eabe2d@gmail.com>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
In-Reply-To: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141002; l=4721;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=lmQQQHnNl4r4tGiXOJbghuVbF8/OCluaIwoRthxoOuk=;
 b=o82DbajtlVgj9pfMdMky1HoLutaNEmktGT4Z3sgMNNpl0U5mLIk7MSo2mxqacAFMg1/7Dl30+
 eBrXn2uM4oFB7ck+YG5jMlU87B42qioRn0lkyuEEZnrShidfaV6uW3A
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

Give the receiver a struct phy of its own, with its own phy_ops and its
own samsung_mipi_phy for the state the two do not share.

of_xlate() takes the direction from the second cell and falls back to
the transmitter for a single-cell provider, so existing device trees
keep working. It now rejects an unknown value in either cell, and a mix
of D-PHY and C-PHY consumers, which the TRM does not support [1].

The receiver's callbacks return -EOPNOTSUPP until its bring-up is added
in the next change.

[1] RK3588 TRM: section 22.1 (overview)

Assisted-by: LLM
Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 69 +++++++++++++++++++++--
 1 file changed, 63 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index e4293c8d2b29..316d4c4d49c1 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -296,6 +296,8 @@ struct samsung_mipi_dcphy {
 	struct reset_control *apb_rst;
 	struct reset_control *grf_apb_rst;
 	struct samsung_mipi_phy tx;
+	struct samsung_mipi_phy rx;
+	/* PHY mode, PHY_TYPE_DPHY or PHY_TYPE_CPHY. */
 	u8 type;
 
 	const struct samsung_mipi_dcphy_plat_data *pdata;
@@ -1511,6 +1513,22 @@ static int samsung_mipi_dcphy_exit(struct phy *phy)
 	return 0;
 }
 
+static int samsung_mipi_dcphy_rx_configure(struct phy *phy,
+					   union phy_configure_opts *opts)
+{
+	return -EOPNOTSUPP;
+}
+
+static int samsung_mipi_dcphy_rx_power_on(struct phy *phy)
+{
+	return -EOPNOTSUPP;
+}
+
+static int samsung_mipi_dcphy_rx_power_off(struct phy *phy)
+{
+	return -EOPNOTSUPP;
+}
+
 static const struct phy_ops samsung_mipi_dcphy_tx_ops = {
 	.configure = samsung_mipi_dcphy_tx_configure,
 	.power_on  = samsung_mipi_dcphy_tx_power_on,
@@ -1520,6 +1538,15 @@ static const struct phy_ops samsung_mipi_dcphy_tx_ops = {
 	.owner	   = THIS_MODULE,
 };
 
+static const struct phy_ops samsung_mipi_dcphy_rx_ops = {
+	.configure = samsung_mipi_dcphy_rx_configure,
+	.power_on  = samsung_mipi_dcphy_rx_power_on,
+	.power_off = samsung_mipi_dcphy_rx_power_off,
+	.init = samsung_mipi_dcphy_init,
+	.exit = samsung_mipi_dcphy_exit,
+	.owner	   = THIS_MODULE,
+};
+
 static const struct regmap_config samsung_mipi_dcphy_regmap_config = {
 	.name = "dcphy",
 	.reg_bits = 32,
@@ -1532,19 +1559,42 @@ static struct phy *samsung_mipi_dcphy_xlate(struct device *dev,
 					    const struct of_phandle_args *args)
 {
 	struct samsung_mipi_dcphy *samsung = dev_get_drvdata(dev);
+	/* Device trees without the second cell describe the transmitter. */
+	u32 direction = PHY_DIRECTION_TX;
+	u32 type;
 
-	if (args->args_count != 1) {
+	if (args->args_count < 1 || args->args_count > 2) {
 		dev_err(dev, "invalid number of arguments\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (samsung->type != PHY_NONE && samsung->type != args->args[0])
-		dev_warn(dev, "phy type select %d overwriting type %d\n",
-			 args->args[0], samsung->type);
+	type = args->args[0];
+	if (type != PHY_TYPE_DPHY && type != PHY_TYPE_CPHY) {
+		dev_err(dev, "invalid phy type %u\n", type);
+		return ERR_PTR(-EINVAL);
+	}
 
-	samsung->type = args->args[0];
+	if (args->args_count == 2)
+		direction = args->args[1];
 
-	return samsung->tx.phy;
+	if (direction != PHY_DIRECTION_TX && direction != PHY_DIRECTION_RX) {
+		dev_err(dev, "invalid direction %u\n", direction);
+		return ERR_PTR(-EINVAL);
+	}
+
+	/*
+	 * The TRM (section 22.1) does not support the transmitter and the
+	 * receiver running in different modes, so the mode belongs to the
+	 * block.
+	 */
+	if (samsung->type != PHY_NONE && samsung->type != type) {
+		dev_err(dev, "phy type %u conflicts with type %u already selected\n",
+			type, samsung->type);
+		return ERR_PTR(-EINVAL);
+	}
+	samsung->type = type;
+
+	return direction == PHY_DIRECTION_RX ? samsung->rx.phy : samsung->tx.phy;
 }
 
 static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
@@ -1620,6 +1670,13 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
 
 	phy_set_drvdata(samsung->tx.phy, samsung);
 
+	samsung->rx.phy = devm_phy_create(dev, NULL, &samsung_mipi_dcphy_rx_ops);
+	if (IS_ERR(samsung->rx.phy))
+		return dev_err_probe(dev, PTR_ERR(samsung->rx.phy),
+				     "Failed to create MIPI DC-PHY receiver\n");
+
+	phy_set_drvdata(samsung->rx.phy, samsung);
+
 	phy_provider = devm_of_phy_provider_register(dev, samsung_mipi_dcphy_xlate);
 	if (IS_ERR(phy_provider))
 		return dev_err_probe(dev, PTR_ERR(phy_provider),

-- 
2.43.0

