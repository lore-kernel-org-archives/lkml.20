Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873011;
	b=ATVHvV5vuajAxCiHAxSQkR7MoX9+wt51ESnRIczQurzUUSIKLEjHByM+Y4L073EX1TXm
	 HlioFYLaIebxY1semj/xwJRSisrqg3ey5/Loc7c/5Va88FaUNVNmHwak3/loewJBEj+lA
	 SC4FuGfhdksR2EKeSmzuB2khIsrwlUfkDvJljxR/08W+j1EEONt2EF9r3wvJ9H3TgWjHm
	 YVOOfIc4tFK7q05TIXe/I/WR1ZdAo1inrtl59WLxpnRCtKp5vnTZTTErBkLFvaCLKFpwm
	 SylJImpw25mh3OYV0IbM5f85GhysFgfn+J5/Li3Dn034iHv7b7xTWsGt9cjXuSSg/4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873011;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=puIm5drKvsAtTzpQuwSkW9RuuhHt2CPtr5r817ZaEWU=;
	b=Uc2DGx8D3KTp8QRy7WqaVSeVuGbzMO2bFnGqy8utS8AByizikW5A/JTpZTQNylXWfOOF
	 tduyGf42RCLq4lPtuCiaksy+NSduBuPGlkNHK5aZ+yrHDgYU/ldmgfTmkVmOPdCOax5Tv
	 Cdo7TmPi6W5QNPmDb3CvP6gU++djBZqvndxyxLobfMXjVKSXiN6UY5cgrsOkcZLECrUXR
	 AQT/neHxGnauGAfpTQEDWwi1djcd+S1bcX+/plqpn9YV5aMp1CCktLilXzaAunGAHD0wl
	 /gkzyZoStrMppERL3PJjRSkD78edgAfJ59h08LDzNVlEBfNI9sa98V1q2j/deKfixVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277EE606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 277EE606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a208d93758so18663655e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:03:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873010; x=1794477810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=puIm5drKvsAtTzpQuwSkW9RuuhHt2CPtr5r817ZaEWU=;
        b=rY5eO1EfhPqtCr09CbnV+RtMLqHnYijl63ChSKew1r2JUG4NHlyVkfg1/WBGOckJ5W
         5Z4NGdCia3vKymmNGBIQOSfXg1TJt0SF35pF6VRVZHzjF/GC+yFAZOB/0RGYttcxcfcq
         Wk11jF4CDMmCo0cXM9ZzWwigwcvyNwQlROX6BXh5YbO5w+cavY0X8i9pRELcmRS7e+cR
         lzwVG4fmYjmXoLOAKvk2gSBLId6WVEVfQ/b2NLpCGy8CNDPZ9PKzmY3MOnrgAURdVA3C
         91281q0PGdxQyA3THr1d37eqVHbGoSbzFZieouxRS3HqpEzOV2BT4rjratOP5jTXbTQ6
         Nibg==
X-Forwarded-Encrypted: i=1; AKwUvBy8Y8+0ivY9clhFnNN3eb/PO4OXZvq4H+YNsaEi4y3R626efYcG03K4oFz8GPbuIQu8+bUZwo5HUcEggWs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CObHodDld/E4vwfvBhpr0vRO+FWMZo/gRtuWiCPMS9thcjeXy
	n8jTP6Nk/JOGUlJc5JZNlspv89PAKWwpyQoHAOXLieWUKvWpto+vFWe5
X-Gm-Gg: AYBFou09Uq5Vh1Z7YwCldo/aDjib6slSE2wDeDPgyhMpJmrlOW+fLeJelJQzREXoQ0U
	keW9h/DErU6WlL1Vbwjc7X7z3B7Hbgbvw3cnzM4tfbLXAoJte3ULTWTkee3uEN74VkcGlSqNFXE
	kj2Izw35kkChBv9Hx9Stm7Em3MrXOV0UjDujZrITihqMAvcW0/vhyFu/mi9si1WuXXb9AI362qk
	k66/UyRS5dQEKvcPbPYS1C7tJSsou4m/Q6IbQfn9c69F4LLv4VGWPiFd45StK51jXpYlDjQOt4+
	KvcJyp7Dgt5JSArnDOYmmn6aVTQm47ut3NCLdgl6yaSpodip02TV6oemitm1j9J6ZkiAuGjLKBn
	P6q0eR4RZbeg7awdxw/ThukPGlICY5ajLeXEUTtW8mhxpJ9KOPfDL+4NIIQrws82VVT7yQTksrY
	2grtJqI77iqo7p9QVN6UgsKlP8FIvea9VDBGGCkRa4pFYZ+NlM1q5UPYRaFYk+58oTp3S5rF4XR
	5cujXsdXtzMTwCxseaoCr2rfivZrBN/LGQFJskAlqIo2zy30XU0rhQD+ERq4GUWZaNWReSI3X6/
	z87Artb6/WNENn3dKuRLzmM9+XrTrckYGg2JnrWX4l63jI7bVVQi4C23UAMmzPB84cIb9vwM+eo
	sjDSD3e4RvlQu89SfdvsyiwVcmw==
X-Received: by 2002:a05:600c:34d4:b0:4a2:d7e:5ccb with SMTP id 5b1f17b1804b1-4ac182dca99mr455243555e9.15.1793873009584;
        Thu, 05 Nov 2026 02:03:29 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43342773esm53455775e9.4.2026.11.05.02.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:03:28 -0800 (PST)
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
Subject: [PATCH v6 3/7] net: stmmac: dwmac-meson8b: add support for the Amlogic T7
Date: Thu,  5 Nov 2026 10:03:18 +0000
Message-ID: <20261105100322.37816-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105100322.37816-1-tanure@linux.com>
References: <20261105100322.37816-1-tanure@linux.com>
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

The glue registers on the T7 are laid out exactly as the G12A ones, RX
delay field included, so the T7 can reuse the G12A settings.

What it does not share is how the controller reaches memory. That path
runs through a pipeline stage with a gate of its own, and no other
device has any use for that gate. Nothing claims it, so it is switched
off as unused and a transfer that has started can never finish.

Without that gate the controller cannot do DMA at all, so it is
required rather than optional: a clear probe failure beats an
undiagnosable hang later.

Assisted-by: LLM
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index e4d5c41294f4..450f7b4b29a6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -81,6 +81,7 @@ struct meson8b_dwmac;
 struct meson8b_dwmac_data {
 	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
 	bool has_prg_eth1_rgmii_rx_delay;
+	bool has_pipeline_clk;
 };
 
 struct meson8b_dwmac {
@@ -384,6 +385,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct meson8b_dwmac *dwmac;
+	struct clk *pipeline_clk;
 	int ret;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -443,6 +445,13 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	if (IS_ERR(dwmac->timing_adj_clk))
 		return PTR_ERR(dwmac->timing_adj_clk);
 
+	if (dwmac->data->has_pipeline_clk) {
+		pipeline_clk = devm_clk_get_enabled(dwmac->dev, "pipeline");
+		if (IS_ERR(pipeline_clk))
+			return dev_err_probe(dwmac->dev, PTR_ERR(pipeline_clk),
+					     "missing pipeline clock\n");
+	}
+
 	ret = meson8b_init_rgmii_delays(dwmac);
 	if (ret)
 		return ret;
@@ -479,6 +488,12 @@ static const struct meson8b_dwmac_data meson_g12a_dwmac_data = {
 	.has_prg_eth1_rgmii_rx_delay = true,
 };
 
+static const struct meson8b_dwmac_data meson_t7_dwmac_data = {
+	.set_phy_mode = meson_axg_set_phy_mode,
+	.has_prg_eth1_rgmii_rx_delay = true,
+	.has_pipeline_clk = true,
+};
+
 static const struct of_device_id meson8b_dwmac_match[] = {
 	{
 		.compatible = "amlogic,meson8b-dwmac",
@@ -500,6 +515,10 @@ static const struct of_device_id meson8b_dwmac_match[] = {
 		.compatible = "amlogic,meson-g12a-dwmac",
 		.data = &meson_g12a_dwmac_data,
 	},
+	{
+		.compatible = "amlogic,t7-dwmac",
+		.data = &meson_t7_dwmac_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, meson8b_dwmac_match);
-- 
2.56.0

