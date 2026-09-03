Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7395369D54
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788414521; cv=none; b=GrV1inAPPDpS2dXpV75EAjOTYwOCE1jjMfiiaXHLYYD/U9lAlOJgOxMai2VEvH1XVBgzDg49XjPx2OKmT66uM6tRF3KkuMIOCyL5swcT+xxRrbwoMs2PM0l7INA71scBN2AjDdHPF+1vyauw2nhr1Lm6/qiNu/9REGXngXBLeEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788414521; c=relaxed/simple;
	bh=J6hwIKBIlfwXraFxsAEvKLrG6777CIBkog13CKrWnwo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aZDNd5ODgma+QsgvjaTgDHWDqFG5tfoYgQWv+PtqfdNnruCjMQX7yt9CFJ0I+Tigu7iudtjiMV2Pxu5QzKGnnUbAdzu5YVYN2ZhM16IXTEuGmvIwm/kzNgHwA0KjDBJZRA8Y1xkWB7doE391xOZqKM5yDoTYQoLBUEl5IOc3UIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=tGlHYdtj; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="tGlHYdtj"
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 077053F457
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788414517;
	bh=HSTdOF4JkwWaIEqcAJaXFfNGVdCez5AeJ6hkT0u40HA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=tGlHYdtjZpdr/fi6vuJAKA4CYXo9KURES/RY3/gPNPEqfWMCp16JFC5yuMh/hzYlt
	 QL9oL+w+O/0163PTGqhMOrS6/o3HrLUTazLZnfZ2Tgui35L0OsN+lmRtr+ZRNffrGH
	 v/30cF+6NhMZc6l4TcDHQlzctmiEe8Tvl5SIBY3oiTiH7KNCPMDZYf+lGVv1HrRTRs
	 +rI+I5l90L7gieirqwzJedCNQ48i8q/UvL/2xLtEq842fQO2KgvT4Fdy7Q/GDjkU+1
	 M5EsKT2Ymr2F6QFfYGoPxuO2sxxaG3ilPpFZ67SFddY8wacoCYjiQzi7ER3J4Jaukm
	 yZ5FlmhqDrujRe7u7yGu/2Q+VylyiJGIXO9p1secRk2OWFnHLSLHLkcFDZwtC01PxG
	 jI8gOAj2IPPHg4MLRE9dgQAWbKRQng1fks/BM8m8G4QpD4G+7oX1LhKxwSDtkIgC2o
	 oCUlfP/cbnfZ8RR35GrRUBW+tVWPn6s9l6tcOw/v2nDduenrGCoySuu0zQhTE0Uc34
	 z0DC83sQiMhgSEcnO6E1cW4XxRRGObfns3jZ8WOJfk3ptVW2RWJMJHCzNN1CauEVoJ
	 DZQe2F+9sU4FbXUrBISIzUQgesvKT5JqOXfBktdnqVoIAQrO3W+pt7/3RTg3vmcHbP
	 8YaJiVGiUImoxAu8TnqHHuME=
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-396638f9a18so3432360a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788414515; x=1789019315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HSTdOF4JkwWaIEqcAJaXFfNGVdCez5AeJ6hkT0u40HA=;
        b=qYMtc/8KK0vHIMrFUUoKOfC9SmQlwVANK0DJQreFXsPhrV1eoZU/NRnWCZsJa6jkQZ
         LU6gUWUdHoZsmYwSey00vpkt1OXCJcpKHgdqX4hbQnTp6G04bQwNNLvn8xdNUq0KzPT7
         PSI3UD9cHqU+7m9MjQgEwpr6085WfRM7Z43ZrvMpLdVzh5ur4hOES7axSF2zd7bRUmaK
         7DsFHw1CKY6IWkB7tBnDJvSmyCRE6v1KF4PJ62H8gOoCiZdvI2U+rZeZFs6EhgBsKvtm
         JyJ8GSKTOiW79ugigiEry522D/8oRklHEaePbMVM5/DuL5X/M4LUE5btTyidnD5dK07s
         tchw==
X-Forwarded-Encrypted: i=1; AKwUvBwIHWKMwIZNfwstbqxO3kod5jfIIeHL90YWs+Cuv1gQ8zD830pulloaNQW1J6g6pbyqbdTkdk3CNjT4KEs=@vger.kernel.org
X-Gm-Message-State: AFuF++nWx+o1KaBlzFfCCz7gOuy9ZwZcGJEdxixYHrVOyaCQvu3bHPD9
	dzGW8eOgeslYaVoCbEoI1WD9XXZByN5r2bKjjx2tD9xyTTXHHJpT7NWu8ljRqLlRasaIzmK9KWI
	pNft0HC8Av2B99/Zs8ZLVzAT8ByHqsQ9ie1RRwJ2IYoTY3YVkTEoJJGYukqWHatEbZX9jf+FUQy
	XXJ5Y4bQ==
X-Gm-Gg: AYBFou3qgvQIptGMh4h28lRHpcOdIXXKPN9Trx8izbtEuggI7s2RSZLRci8fNn4W1ov
	Zo9xxzezIfmi5kr40CW+xdEzkTbAh4zTvl4qvM/7M/6VzW/MI804mREFZ5q+kMY83HMyQR3LSSN
	/Q7Z6apWzI94Y+o46kbGPR9iOcDkRkB9ZfQzyRNrCGlhRDKqBFGEiXAOJtPWg9jWQvPNBekM0ng
	W3nTYKcpH9v8ZKWLPcAs8rdtEHUeIORsfJRCRn5N90Ez613R2wEgl2noqLjqL+uv+IuvWl4UcIy
	J9/bNzTBR7vXYAfF3lqfP9v1bRQgFdvNFxkpyEdI2cUJhZ5gMgGVbtq2BDFzwp78hXb0U8BU5CB
	lwQQY/Amng8lDs1IS9qF92J6ZC2X6viqLj8SO5GmN4BX4m9x0ucvKjnCSeU5TCb2DRPSrvXJKgu
	U=
X-Received: by 2002:a17:90b:3949:b0:398:9c00:29ee with SMTP id 98e67ed59e1d1-39aee208a63mr16324666a91.22.1788414515441;
        Wed, 02 Sep 2026 22:48:35 -0700 (PDT)
X-Received: by 2002:a17:90b:3949:b0:398:9c00:29ee with SMTP id 98e67ed59e1d1-39aee208a63mr16324592a91.22.1788414514888;
        Wed, 02 Sep 2026 22:48:34 -0700 (PDT)
Received: from resolute-linux.tail872496.ts.net (124-218-37-86.cm.dynamic.apol.com.tw. [124.218.37.86])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d086adsm3055228a91.15.2026.09.02.22.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:48:34 -0700 (PDT)
From: Aristo Chen <aristo.chen@canonical.com>
To: Vinod Koul <vkoul@kernel.org>,
	linux-phy@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Fabio Estevam <festevam@nabladev.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Adam Ford <aford173@gmail.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	Aristo Chen <aristo.chen@canonical.com>
Subject: [PATCH 1/1] phy: freescale: fsl-samsung-hdmi: initialize default rate
Date: Thu,  3 Sep 2026 05:47:58 +0000
Message-ID: <20260903054811.9720-1-aristo.chen@canonical.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HDMI PHY clock reports 74.25 MHz when cur_cfg is unset, but does
not establish that rate in hardware. The common clock framework caches
the reported rate when registering the clock and skips a first
clk_set_rate(74250000) request because the rate appears unchanged.

Consequently, a display whose initial mode uses a 74.25 MHz pixel clock
can leave the PHY with its bootloader register state and receive no
TMDS signal. Requesting another rate first avoids the issue because the
set_rate callback configures the PHY.

Program the 74.25 MHz table entry with the reference clock enabled
before registering the clock provider. recalc_rate can then report the
configured rate, and a skipped first rate change is safe. Also enable
the reference clock when restoring that configuration on resume.

Fixes: 6ad082bee902 ("phy: freescale: add Samsung HDMI PHY")
Signed-off-by: Aristo Chen <aristo.chen@canonical.com>
---
 drivers/phy/freescale/phy-fsl-samsung-hdmi.c | 59 +++++++++++++++-----
 1 file changed, 44 insertions(+), 15 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
index 0f25d81de61b..41addd4ad414 100644
--- a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
+++ b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
@@ -44,6 +44,8 @@
 #define MHZ	(1000UL * 1000UL)
 #endif
 
+#define PHY_DEFAULT_RATE	74250000
+
 #define PHY_PLL_DIV_REGS_NUM 7
 
 struct phy_config {
@@ -489,17 +491,6 @@ static int fsl_samsung_hdmi_phy_configure(struct fsl_samsung_hdmi_phy *phy,
 	return ret;
 }
 
-static unsigned long phy_clk_recalc_rate(struct clk_hw *hw,
-					 unsigned long parent_rate)
-{
-	struct fsl_samsung_hdmi_phy *phy = to_fsl_samsung_hdmi_phy(hw);
-
-	if (!phy->cur_cfg)
-		return 74250000;
-
-	return phy->cur_cfg->pixclk;
-}
-
 /* Helper function to lookup the available fractional-divider rate */
 static const struct phy_config *fsl_samsung_hdmi_phy_lookup_rate(unsigned long rate)
 {
@@ -520,6 +511,14 @@ static const struct phy_config *fsl_samsung_hdmi_phy_lookup_rate(unsigned long r
 		&phy_pll_cfg[i] : &phy_pll_cfg[i+1]);
 }
 
+static unsigned long phy_clk_recalc_rate(struct clk_hw *hw,
+					 unsigned long parent_rate)
+{
+	struct fsl_samsung_hdmi_phy *phy = to_fsl_samsung_hdmi_phy(hw);
+
+	return phy->cur_cfg->pixclk;
+}
+
 static void fsl_samsung_hdmi_calculate_phy(struct phy_config *cal_phy, unsigned long rate,
 				    u8 p, u16 m, u8 s)
 {
@@ -640,6 +639,7 @@ static int phy_clk_register(struct fsl_samsung_hdmi_phy *phy)
 
 static int fsl_samsung_hdmi_phy_probe(struct platform_device *pdev)
 {
+	const struct phy_config *default_cfg;
 	struct fsl_samsung_hdmi_phy *phy;
 	int ret;
 
@@ -664,6 +664,23 @@ static int fsl_samsung_hdmi_phy_probe(struct platform_device *pdev)
 		return dev_err_probe(phy->dev, PTR_ERR(phy->refclk),
 				     "failed to get ref clk\n");
 
+	/*
+	 * Establish the rate reported by recalc_rate() before registering the
+	 * clock. Otherwise CCF may skip the first set_rate() when it requests
+	 * the assumed default rate, leaving the PHY unconfigured.
+	 */
+	ret = clk_prepare_enable(phy->refclk);
+	if (ret)
+		return dev_err_probe(phy->dev, ret,
+				     "failed to enable ref clk\n");
+
+	default_cfg = fsl_samsung_hdmi_phy_lookup_rate(PHY_DEFAULT_RATE);
+	ret = fsl_samsung_hdmi_phy_configure(phy, default_cfg);
+	clk_disable_unprepare(phy->refclk);
+	if (ret)
+		return dev_err_probe(phy->dev, ret,
+				     "failed to configure default rate\n");
+
 	pm_runtime_get_noresume(phy->dev);
 	pm_runtime_set_active(phy->dev);
 	pm_runtime_enable(phy->dev);
@@ -702,7 +719,7 @@ static int __maybe_unused fsl_samsung_hdmi_phy_suspend(struct device *dev)
 static int __maybe_unused fsl_samsung_hdmi_phy_resume(struct device *dev)
 {
 	struct fsl_samsung_hdmi_phy *phy = dev_get_drvdata(dev);
-	int ret = 0;
+	int ret;
 
 	ret = clk_prepare_enable(phy->apbclk);
 	if (ret) {
@@ -710,11 +727,23 @@ static int __maybe_unused fsl_samsung_hdmi_phy_resume(struct device *dev)
 		return ret;
 	}
 
-	if (phy->cur_cfg)
-		ret = fsl_samsung_hdmi_phy_configure(phy, phy->cur_cfg);
+	if (!phy->cur_cfg)
+		return 0;
 
-	return ret;
+	ret = clk_prepare_enable(phy->refclk);
+	if (ret) {
+		dev_err(phy->dev, "failed to enable ref clk\n");
+		goto disable_apbclk;
+	}
+
+	ret = fsl_samsung_hdmi_phy_configure(phy, phy->cur_cfg);
+	clk_disable_unprepare(phy->refclk);
+	if (!ret)
+		return 0;
 
+disable_apbclk:
+	clk_disable_unprepare(phy->apbclk);
+	return ret;
 }
 
 static DEFINE_RUNTIME_DEV_PM_OPS(fsl_samsung_hdmi_phy_pm_ops,
-- 
2.53.0

