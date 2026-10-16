Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB1E3EB7F0
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141027; cv=none; b=r4JoXfQVDnndtAr6V4WnXr+iWT2p13nFDRuvodpOrHQk+odMhy5/kxK7Jws9OH7SdglQr5+wlkl7SV5mfoKqfnzWUxKzJt99DHRkjgdiC4/yRuJZGY7SQbgYIo7RUHyIu5eS8utqlM5fZQGWv6lk+mk/IAgPeH2jJpK5vKOyFZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141027; c=relaxed/simple;
	bh=hcQTksvADjtauLj3h0Brp979GtEN7Q5IAa9jWjy/9U0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aJJ9gg+hUpHaT+9GzEe44uGQ8P6fCFeY0bz/stv5dM205+P0N0LI31fkQ+kyp252jN7GFXcMZfC1u7zJ0PJlzh5TNoSzm7mUNiJxT04zVCXAaOXmrW65VOuap6Izl3FMkBXadxUTQdmou0prDCKX8VmeusP05f6DqBrwDpaLJt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tAAJKrBW; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tAAJKrBW"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc785ed8aacso343453a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141024; x=1792745824; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=63nKAXQsey09Ukh5gVrG7zGReaMNS36rUUEykvuvHSQ=;
        b=tAAJKrBW+KxMZTFmE+9drnAZsr1IV5tqRPjWImgdGLNdADivxZxh0A8smiF3UKl2gX
         cmxkiV76mpesJHUY1h6kcmbBn2lqu591kO1Ixu7Hvgh8pbX33YcOHg7Wk4ObiTZFE5a0
         0VAdca/e/rB5WjLTowMgV2V4xN3SylG4aS2kDxDaj676QGKWvM8QVj8xZeRUgp7jwQwU
         gLfjWGOvJMyv7yUeu8FJFbtBviq1vSVGuycR7DCKLPm/g/YnF99pkvtGZ6SPJeurFXR9
         z4MTXiqJ8G9l6v+j+P7UrIch8HYDBeg73nrsMlG6/wq+fhtpKcPprc2aTj6U7EKZugPe
         t6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141024; x=1792745824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63nKAXQsey09Ukh5gVrG7zGReaMNS36rUUEykvuvHSQ=;
        b=Mize/evM7zQtcmKtASZOMjt0huwZpCHdmXYucsHtbuf8kjeQlI9FAUSsNWCvoHec51
         2YNOvG8cs4VkgwezSnzZW2Nn1ViC/d9m+zaQ7idPzmGLqXwWHmLs/kFc8Obhk4Pm4lKo
         pUJwl3gpWxDDB9IwyqllwXNTs7Gf5kXml6uOe3A6GRK5kRmiEZjBzzzlfpUdsbUWc120
         pI+dTz4YP+xC/GYee4CtHDixuSKt4x6RTgiJSazFGq+3DW+pv49HKLi+H44LC11kqDOY
         SxH5U1GnR5D2onQro3fFESq210xXJWL9YkHTvUM57rJkSTkvtgOpYWwAbPSnCoT6fXdL
         u3rA==
X-Forwarded-Encrypted: i=1; AKwUvByeLOYDC1v2LMMtMvaMVYiRsepW7dMpf/WVj0SWFqPfALlmIfFOXOWJxlaDKvAv0NYv2ERbU19HP9hfZkk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVyf2t/idMZUvJ83QzT2m/k/Mw4SQtpIc6CoNOYc8KrwB+D39h
	20YrQnYfHcIGOC7PC8KSdwEYh+z5Z+di9avvqM7yU4J7kpH7Yt48LjQF
X-Gm-Gg: AYBFou163jFu4ogU8FMK1sQRNJa6vZr7ikUWD7XMYzyAmE0woLMEG1UtL9Fpvj0q8Cx
	mvg3KQJkUvioMcN+ODi8yCnWCss+E/0+XiBYnwckgmjX4zPmrD4oPZmwXPmL/3GxR1ROhpW0/da
	uTUxmOZbvAa1HyDcCkBxYmVUUBpluFoXOGOt/6E+HRXmrd+uXdBYrorYVpxPkCNSxbhJV8wQZ3J
	l7rt5+l3180rL3qA6Cdy0QbUncZCI9Cp0zK4e4fh3xoH2w845TgKuHLs278W+xIcX7yvCSCZgmc
	UdMEERV0QIWkak0sl8EzSDWjnHuikwoLqXbmOOpVx8tP3BR6E+VTOI4dXKPisGaM6+ZzYmCLLg+
	vrGpXWUc46imrzm1AxCjMf4v1ZUYrIfFcsiUQqtUWOiFFfttbUZzxVIPB9vsglydtkQWu4yuAwH
	wgcjVy/4xLIXQE6JQ/D2yrTVimaWB6CM7t4MKUB90vrgYVZIWPrg847evlLh5hSR9W66QROUj5O
	h1gT4C0qoEABHWQfzvnreV4zQyClA==
X-Received: by 2002:a17:903:ac8:b0:2e9:5714:607a with SMTP id d9443c01a7336-2e957148b4fmr82121225ad.2.1792141023648;
        Fri, 16 Oct 2026 01:57:03 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e882a20sm6971025ad.62.2026.10.16.01.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:57:02 -0700 (PDT)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 16 Oct 2026 16:56:38 +0800
Subject: [PATCH v5 4/8] phy: rockchip-samsung-dcphy: Name the transmitter
 helpers and ops
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-dcphy-rx-v1-v5-4-e63b49eabe2d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141002; l=8913;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=hcQTksvADjtauLj3h0Brp979GtEN7Q5IAa9jWjy/9U0=;
 b=xX3Avn92xvzDCAsyiULnTYz+WV+dT5EfHK6Q6y54hU6bVR8wren2hfazaS/xuDfmRpaoe9ClJ
 OrPIqxeQPFTB4ZwPH2GsKuIkjY/de5rvipzeBTaxXh9HxrW34VXBG/e
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

The block is a combo PHY: it exposes a transmitter and a receiver, and a
later change registers one struct phy for each. Prepare for that. Give
every helper that programs the master lanes a tx_ prefix, and move the
phy pointer and the lane count, which only the transmitter uses, into a
struct samsung_mipi_phy that the receiver can have one of too.

Name the phy_ops and its callbacks after the transmitter as well, so
that the receiver can bring its own rather than share these.

The BIAS block and the PLL keep their names: the TRM puts both in the
part common to the whole block [1], so neither belongs to one PHY even
though only the transmitter drives the PLL.

No functional change intended.

[1] RK3588 TRM: sections 22.3.1 (bias generator), 22.3.2 (PLL) and
    22.4.1 (address map)

Assisted-by: LLM
Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 67 ++++++++++++-----------
 1 file changed, 36 insertions(+), 31 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index 1471a1563d2a..e4293c8d2b29 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -280,6 +280,11 @@ struct samsung_mipi_dcphy_plat_data {
 	u32 dphy_tx_max_lane_kbps;
 };
 
+struct samsung_mipi_phy {
+	struct phy *phy;
+	unsigned int lanes;
+};
+
 struct samsung_mipi_dcphy {
 	struct device *dev;
 	struct clk *ref_clk;
@@ -290,8 +295,7 @@ struct samsung_mipi_dcphy {
 	struct reset_control *s_phy_rst;
 	struct reset_control *apb_rst;
 	struct reset_control *grf_apb_rst;
-	unsigned int lanes;
-	struct phy *phy;
+	struct samsung_mipi_phy tx;
 	u8 type;
 
 	const struct samsung_mipi_dcphy_plat_data *pdata;
@@ -982,13 +986,13 @@ static void samsung_mipi_dcphy_bias_block_enable(struct samsung_mipi_dcphy *sams
 						 REG_400M_400MV | REG_645M_645MV);
 }
 
-static void samsung_mipi_dphy_lane_enable(struct samsung_mipi_dcphy *samsung)
+static void samsung_mipi_dphy_tx_lane_enable(struct samsung_mipi_dcphy *samsung)
 {
 	regmap_write(samsung->regmap, DPHY_MC_GNR_CON1, T_PHY_READY(0x2000));
 	regmap_update_bits(samsung->regmap, DPHY_MC_GNR_CON0,
 			   PHY_ENABLE, PHY_ENABLE);
 
-	switch (samsung->lanes) {
+	switch (samsung->tx.lanes) {
 	case 4:
 		regmap_write(samsung->regmap, DPHY_MD3_GNR_CON1,
 			     T_PHY_READY(0x2000));
@@ -1017,9 +1021,9 @@ static void samsung_mipi_dphy_lane_enable(struct samsung_mipi_dcphy *samsung)
 	}
 }
 
-static void samsung_mipi_dphy_lane_disable(struct samsung_mipi_dcphy *samsung)
+static void samsung_mipi_dphy_tx_lane_disable(struct samsung_mipi_dcphy *samsung)
 {
-	switch (samsung->lanes) {
+	switch (samsung->tx.lanes) {
 	case 4:
 		regmap_update_bits(samsung->regmap, DPHY_MD3_GNR_CON0,
 				   PHY_ENABLE, 0);
@@ -1094,7 +1098,7 @@ static void samsung_mipi_dcphy_pll_disable(struct samsung_mipi_dcphy *samsung)
 }
 
 static const struct samsung_mipi_dphy_timing *
-samsung_mipi_dphy_get_timing(struct samsung_mipi_dcphy *samsung)
+samsung_mipi_dphy_tx_get_timing(struct samsung_mipi_dcphy *samsung)
 {
 	const struct samsung_mipi_dphy_timing *timings;
 	unsigned int num_timings;
@@ -1201,13 +1205,13 @@ samsung_mipi_dcphy_pll_round_rate(struct samsung_mipi_dcphy *samsung,
 }
 
 static void
-samsung_mipi_dphy_clk_lane_timing_init(struct samsung_mipi_dcphy *samsung)
+samsung_mipi_dphy_tx_clk_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 {
 	const struct samsung_mipi_dphy_timing *timing;
 	unsigned int lane_hs_rate = div64_ul(samsung->pll.rate, USEC_PER_SEC);
 	u32 val, res_up, res_down;
 
-	timing = samsung_mipi_dphy_get_timing(samsung);
+	timing = samsung_mipi_dphy_tx_get_timing(samsung);
 	regmap_write(samsung->regmap, DPHY_MC_GNR_CON0, 0xf000);
 
 	/*
@@ -1256,13 +1260,13 @@ samsung_mipi_dphy_clk_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 }
 
 static void
-samsung_mipi_dphy_data_lane_timing_init(struct samsung_mipi_dcphy *samsung)
+samsung_mipi_dphy_tx_data_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 {
 	const struct samsung_mipi_dphy_timing *timing;
 	unsigned int lane_hs_rate = div64_ul(samsung->pll.rate, USEC_PER_SEC);
 	u32 val, res_up, res_down;
 
-	timing = samsung_mipi_dphy_get_timing(samsung);
+	timing = samsung_mipi_dphy_tx_get_timing(samsung);
 
 	/*
 	 * The Drive-Strength / Voltage-Amplitude is adjusted by adjusting the
@@ -1325,7 +1329,7 @@ samsung_mipi_dphy_data_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 	regmap_write(samsung->regmap, DPHY_MD3_TIME_CON4, 0x1f4);
 }
 
-static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
+static int samsung_mipi_dphy_tx_power_on(struct samsung_mipi_dcphy *samsung)
 {
 	int ret;
 
@@ -1339,13 +1343,13 @@ static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
 			   I_MUX_SEL_MASK, I_MUX_400MV);
 
 	samsung_mipi_dcphy_pll_configure(samsung);
-	samsung_mipi_dphy_clk_lane_timing_init(samsung);
-	samsung_mipi_dphy_data_lane_timing_init(samsung);
+	samsung_mipi_dphy_tx_clk_lane_timing_init(samsung);
+	samsung_mipi_dphy_tx_data_lane_timing_init(samsung);
 	ret = samsung_mipi_dcphy_pll_enable(samsung);
 	if (ret < 0)
 		return ret;
 
-	samsung_mipi_dphy_lane_enable(samsung);
+	samsung_mipi_dphy_tx_lane_enable(samsung);
 
 	reset_control_deassert(samsung->m_phy_rst);
 
@@ -1357,13 +1361,13 @@ static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
 	return 0;
 }
 
-static int samsung_mipi_dcphy_power_on(struct phy *phy)
+static int samsung_mipi_dcphy_tx_power_on(struct phy *phy)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
 
 	switch (samsung->type) {
 	case PHY_TYPE_DPHY:
-		return samsung_mipi_dphy_power_on(samsung);
+		return samsung_mipi_dphy_tx_power_on(samsung);
 	default:
 		/* CPHY part to be implemented later */
 		return -EOPNOTSUPP;
@@ -1372,13 +1376,13 @@ static int samsung_mipi_dcphy_power_on(struct phy *phy)
 	return 0;
 }
 
-static int samsung_mipi_dcphy_power_off(struct phy *phy)
+static int samsung_mipi_dcphy_tx_power_off(struct phy *phy)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
 
 	switch (samsung->type) {
 	case PHY_TYPE_DPHY:
-		samsung_mipi_dphy_lane_disable(samsung);
+		samsung_mipi_dphy_tx_lane_disable(samsung);
 		break;
 	default:
 		/* CPHY part to be implemented later */
@@ -1477,13 +1481,13 @@ samsung_mipi_dcphy_pll_calc_rate(struct samsung_mipi_dcphy *samsung,
 	}
 }
 
-static int samsung_mipi_dcphy_configure(struct phy *phy,
-					union phy_configure_opts *opts)
+static int samsung_mipi_dcphy_tx_configure(struct phy *phy,
+					   union phy_configure_opts *opts)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
 	unsigned long long target_rate = opts->mipi_dphy.hs_clk_rate;
 
-	samsung->lanes = opts->mipi_dphy.lanes > 4 ? 4 : opts->mipi_dphy.lanes;
+	samsung->tx.lanes = opts->mipi_dphy.lanes > 4 ? 4 : opts->mipi_dphy.lanes;
 
 	samsung_mipi_dcphy_pll_calc_rate(samsung, target_rate);
 	opts->mipi_dphy.hs_clk_rate = samsung->pll.rate;
@@ -1507,10 +1511,10 @@ static int samsung_mipi_dcphy_exit(struct phy *phy)
 	return 0;
 }
 
-static const struct phy_ops samsung_mipi_dcphy_ops = {
-	.configure = samsung_mipi_dcphy_configure,
-	.power_on  = samsung_mipi_dcphy_power_on,
-	.power_off = samsung_mipi_dcphy_power_off,
+static const struct phy_ops samsung_mipi_dcphy_tx_ops = {
+	.configure = samsung_mipi_dcphy_tx_configure,
+	.power_on  = samsung_mipi_dcphy_tx_power_on,
+	.power_off = samsung_mipi_dcphy_tx_power_off,
 	.init = samsung_mipi_dcphy_init,
 	.exit = samsung_mipi_dcphy_exit,
 	.owner	   = THIS_MODULE,
@@ -1540,7 +1544,7 @@ static struct phy *samsung_mipi_dcphy_xlate(struct device *dev,
 
 	samsung->type = args->args[0];
 
-	return samsung->phy;
+	return samsung->tx.phy;
 }
 
 static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
@@ -1609,11 +1613,12 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
 
-	samsung->phy = devm_phy_create(dev, NULL, &samsung_mipi_dcphy_ops);
-	if (IS_ERR(samsung->phy))
-		return dev_err_probe(dev, PTR_ERR(samsung->phy), "Failed to create MIPI DC-PHY\n");
+	samsung->tx.phy = devm_phy_create(dev, NULL, &samsung_mipi_dcphy_tx_ops);
+	if (IS_ERR(samsung->tx.phy))
+		return dev_err_probe(dev, PTR_ERR(samsung->tx.phy),
+				     "Failed to create MIPI DC-PHY transmitter\n");
 
-	phy_set_drvdata(samsung->phy, samsung);
+	phy_set_drvdata(samsung->tx.phy, samsung);
 
 	phy_provider = devm_of_phy_provider_register(dev, samsung_mipi_dcphy_xlate);
 	if (IS_ERR(phy_provider))

-- 
2.43.0

