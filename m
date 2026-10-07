Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3525D44C4FC
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791361599; cv=none; b=hwj5JKd6SQwLdWInUZxDq+FOa2D18sfl//m/gmpIhGCrXs0nJZiMJxLgLi5aKBAg7G3uQbnEev6aJrmi+f7BsosRwmYsOeXVKX8gjGSc2dKGSxXtMUAmDWpUjD3osbgGlHaKynlrNybEh7oeJGxzgOuPgFKhJoQH2YTOx5pKtKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791361599; c=relaxed/simple;
	bh=xd2G7R66hpaAeW/MdfLjffNu2Gc+gWu0LmsCFDuAJjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fleShexHJ/R+GGRYBqOe9kcqgG1Bh16oRguucil9glL6N46jbDogGfB7iQm0EQq8jS58ICkdHvUO7+YEYJPG+LwH/2by2bl6kEAfzorgoTZc/NRHD6DMrUmagi9w6yYaoHtd8G8/VJyzKYEye1xZeiDiwh8a3hvYY50NlhoLN4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4d870d54so1015161f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361592; x=1791966392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMznkgAU7RcKCyo2f/X40iNVhoTQVjtCnARNVdFftYk=;
        b=0JIDJBHEB6niIvWFjnWU6/2B+GdPVbydMEFDaB2Tw36QvqBPE6vLFuR1XWWUBt5BfC
         2CdOJVBRnRsb/6WpPR36L8ht820oUG+SzhO7THcqevlyGw1Bh6z9GFhvjS8GdB3UQJn3
         RKobweLkWWM5v4dikgTEtiUXzfHXNDUYniepcuPPzRX2sa0/W2bDekTRXm/+DXwCfgE4
         gENDHUhMPEmuxDYqekFZrWD6meBRSNRHK1uJMXiIt2nsVNUlAE0sMHQ2hjoYftLMimMt
         FnHlludAA6H8QZeK+ADRJ38QHocUfR5ZJEV6FjNWkJt64lWD7z70YKHhfvWVpgX6XGcn
         wB3w==
X-Forwarded-Encrypted: i=1; AKwUvBxXUf2ZFPgW3W4mnLYf9irORRChTA0BUcRlziu+Smc9IljKLIv7tFbzKNjIxiOzE+OgQzY3DPrwcfJkHM4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4ISfpEsRXn/cPUfG+HgcMIWoRxWeC82YSUwnQ5Ebq1UkmdiPv
	2kASfBu74XMqvPHz0NvxtmKSU377mrkryd5V5tHYjXkFd/u2pMjprW9C
X-Gm-Gg: AYBFou03C5omJ4REfjNIv2ZWA9khmzBi3zhdNTsdYIZpEMEl6nVcy4+WyvL3T0wGfy1
	nR4gUp4kKNVRfy8EbkQPMYVy9I3hHNrmijkSuXqJcHTTFT1V5+5M4P02dH7ZkB5WNKe0oYV5YSI
	3ZqPPa3tPbvicj97Hj63jD97lQ1R00mPsVW5Q7Mp+wpKkxMoXVxUqd5EHGRMZfUZAQfXxOm4nr5
	7aUf3G+JRX/7mX/9GYZ95qzNlBKVIYzTSdQiBitBZbHtbPY1b+rM2qUvwCU0jhYh1coaN68FMCV
	3Q8tECMw2BL7yucHEhHkzQOOqBpht+Q7nraqSLCA+Ii4mrfke0bNyxZnWujgVMC2U51gGMqjcw+
	kEdLA26Yvz1rbjSeXv7Qj5hB1MDivp/qc9LkcDaHjZgf3WZwfIWqSNHyq8DxoD9YZnbG6uSIYtg
	QEgo+e0emXbJJiXf+Q2d96YYbK5ouXMWdAIP9MokahWYQBOOBF8z2tM2l4E1g/t5ITK8+X0LHZH
	aYmdn+FWhe+LafZ6c9eeI82HtWJwSTlUsw=
X-Received: by 2002:a05:6000:4819:b0:488:80d0:873a with SMTP id ffacd0b85a97d-48c726f19d8mr2561452f8f.5.1791361592372;
        Wed, 07 Oct 2026 01:26:32 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm4251370f8f.52.2026.10.07.01.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:26:31 -0700 (PDT)
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
Subject: [RFC PATCH v2 4/7] net: stmmac: dwmac-meson8b: add support for the Amlogic T7
Date: Wed,  7 Oct 2026 09:26:24 +0100
Message-ID: <20261007082627.63807-5-tanure@linux.com>
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
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index d73dfd0ac167..dd10d719ab84 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -81,6 +81,7 @@ struct meson8b_dwmac;
 struct meson8b_dwmac_data {
 	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
 	bool has_prg_eth1_rgmii_rx_delay;
+	bool has_pipeline_clk;
 };
 
 struct meson8b_dwmac {
@@ -402,6 +403,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct meson8b_dwmac *dwmac;
+	struct clk *pipeline_clk;
 	u32 tx_delay_ps;
 	int ret;
 
@@ -485,6 +487,13 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
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
@@ -521,6 +530,12 @@ static const struct meson8b_dwmac_data meson_g12a_dwmac_data = {
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
@@ -542,6 +557,10 @@ static const struct of_device_id meson8b_dwmac_match[] = {
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

