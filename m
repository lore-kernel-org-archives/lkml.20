Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B8842F6E2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125482; cv=none; b=LDsy9qufME8zsTPiP4vuoPxS1e2o5bfzoOZzCG970VRrBoWpr8XkvGZZG7qqbYBPcucYvqWDqhtzV8GsULZzKKTDWU4nxBI8UvJZNgZx0XgvG8ONy7LLoAJ/IZ0R9rUK6HGdMEUOxFLdU2nvxSDcm1lOXFWl+HyhMDZVsBdxEyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125482; c=relaxed/simple;
	bh=M0s5qNvm6lgULK2n8QPcCEFSAsT+ro/ADdWPoCKHveU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H6eg+9xy/hQE658RwtQVMVmMBExFGclDaHIGJefSg/Ko2qXxUeLGWmyxCDuZYbVZB4Ad9BeuzdwMz8LV647xAsTqum2/8eqaqVHAklUwx9dcDJ8pY7xa2afTKU40O4m72HxeKyd/oOvFciXB44Ad28FDEcO41BWjbosPjTgD3Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AarCKnUS; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AarCKnUS"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-482ea739de2so509951f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789125469; x=1789730269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p4YPgDFVhAPV2YkfLlZc7dMgt04j5FYtenK3LnM0C1E=;
        b=AarCKnUSfJOClWAvJ+OrAx55BwAHtyhCbm3WDAcb40MVl5HiPbrLCCFgrSQMH0XEK2
         vUiE2Wn5KPH9bJS97Qz4Ou3U69Iku/Hvu7GHdDjjmmDba1ebtEvqEpq1r4vksdiPUptU
         XxQvdxixVZtcBO0g1y3SUXpm3g+tWMaTnreQ1P5STqXxYtm1tdmzDzDlaMlRgi+q0j68
         Lpba6uJiY/LU6YvWgElL+n09DAAyyLqdJfOujv5FOv0KoU81rHircYuppQ2d7gfEJ1Wm
         zu9hZGlV2h8lVEbuy1DuFGM2fTqVnZQHywjF0a3TjWQmUpxoEiuWJzk1Nr8OBJUxsyeW
         a7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789125469; x=1789730269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p4YPgDFVhAPV2YkfLlZc7dMgt04j5FYtenK3LnM0C1E=;
        b=T8olVmq6DavN/OUfcvlWbvhz24oC/SioydAoLRZ65LxEIpYZbypmEqWP0VSqxdtjWb
         BoWBNstZTtGv6RDjrCUrv1ifQTVGiI2BTmlCo4yPHoC9iA8BByaJFqM7cwMEo1O/G6ZA
         qLQ2+p1hK9e7YtBdYFjPGMaVH0YGH30gzUUGgb9M/tqMcm5Ogw19/FZpgTRL9JzhLkc7
         GzdbELdIan8oPtncRaBGSxEu46/aEVR8iU4jNxruEgen75Qw2HoTxN+ozHtrJdptx9ZF
         GiH6luMI+Ki139EzDaY0h9/PSPhXMv8ZMo9Y3A2ea4wfJS2TxBwXEqK3U3Qfm9Anfinv
         UL5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwfM4RilkxNKPyZEc/1fDAJvrHfjL/JFrfmFt0Eb4rvrjQUXHKfTYyzXzv1kR8n4WGxcjxEJWISaxKBaiY=@vger.kernel.org
X-Gm-Message-State: AFuF++kolhSbpjT72RoP/2NOVfV29e9BtXsmeyGEo6Yesu08LpscIDZF
	110Da1Ytl/upLQ9woiS1Q0gNyV8IBipT1hUacu+Fp0tReYw4jX7Wbheg
X-Gm-Gg: AYBFou3SCvVlhaD6WZcGoIJ16hvk6F8GBUs7tKMWn01Leg9AKaH53Oe9Uo6IsEAK9CG
	1EKE1A9QR82KoTyOKxNYNIhsK/zJDnmN0FNEhtu+ZGALniEcrCf7gT05MI+qDAX4YDFRrtVmqs2
	R3jdfI05WOHUTWlk6Zg8lBF+AxqyGTTXnrrjPWxV1hO9J5P8okGzqIUQL2nG1XQ6UG3bny5OU4b
	OCXJhQMNYB+BXpMO4/7Fmjq+YFT2WDMM1OQZExqOybiYbP0nf1nWNw3RQz2kge8dGpHsuRrPD8/
	vXXANf5hPAf72XZp26+4dQgXk8qF6dETnFq7fBU/6AHqvvpOgvxFPa5Kxa3uI5rMCfJhRbLOcg8
	+xs3l9ekIQPmRRJyKVBJ+f+B10UxfFe5XjMNX/AgF0RGMVmn1+sVQRIyG0ZvpJSuekh+F0jWsKX
	3I8VUHcoiKh9z7DoMC5P3gzDV0jpgZEcjtCJY6Qun5bQMsGViz2pxA8THcujgi7X7emLYhSG7Cb
	Tzy8bcFbu7RsrA5xSdzWE9IX4uEU2Ke5yDaTpgTCiOfX5kSYVepXtMQRLZuL7TS8W4U5rGanMCT
	EehMiKVh7ZdmkZACbYOlwxL6NPtvHg==
X-Received: by 2002:adf:f2c9:0:b0:482:e22f:a2b2 with SMTP id ffacd0b85a97d-486eb303657mr3242321f8f.20.1789125468686;
        Fri, 11 Sep 2026 04:17:48 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3de1:9f21:e874:3931])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf23sm5438182f8f.5.2026.09.11.04.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:17:48 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 5/8] watchdog: rzv2h: Convert WDTDCR handling to regmap
Date: Fri, 11 Sep 2026 12:17:28 +0100
Message-ID: <20260911111731.3404308-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Convert the WDTDCR register access from raw readl/writel variants over to
the regmap framework using devm_regmap_init_mmio().

This conversion serves as a preparatory refactoring step. It allows the
driver to subsequently support syscon-based system controllers natively
by passing along alternative regmap handles without forcing messy
architectural branching at runtime.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- Handled the regmap locking in the driver and introduced nolock
  version to be used in the restart path.

v2->v3:
- Dropped unwinding changes to patch#1.
- Set use_raw_spinlock to true in regmap config as certain watchdog operations
  runs in an atomic panic context.
---
 drivers/watchdog/rzv2h_wdt.c | 54 ++++++++++++++++++++++++++----------
 1 file changed, 39 insertions(+), 15 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 4a5a856060e9..550112446db4 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -4,6 +4,7 @@
  *
  * Copyright (C) 2024 Renesas Electronics Corporation.
  */
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
@@ -12,7 +13,9 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
+#include <linux/spinlock.h>
 #include <linux/units.h>
 #include <linux/watchdog.h>
 
@@ -65,7 +68,8 @@ struct rzv2h_of_data {
 
 struct rzv2h_wdt_priv {
 	void __iomem *base;
-	void __iomem *wdtdcr;
+	struct regmap *wdtdcr_regmap;
+	spinlock_t regmap_lock; /* Protects access to the wdtdcr_regmap */
 	struct clk *pclk;
 	struct clk *oscclk;
 	struct reset_control *rstc;
@@ -89,20 +93,19 @@ static int rzv2h_wdt_ping(struct watchdog_device *wdev)
 
 static int rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
 {
-	u32 reg = readl(priv->wdtdcr + WDTDCR);
+	guard(spinlock_irqsave)(&priv->regmap_lock);
+	return regmap_set_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTSTOPCTRL);
+}
 
-	writel(reg | WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
-
-	return 0;
+static inline int rzt2h_wdt_wdtdcr_count_start_nolock(struct rzv2h_wdt_priv *priv)
+{
+	return regmap_clear_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTSTOPCTRL);
 }
 
 static int rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
 {
-	u32 reg = readl(priv->wdtdcr + WDTDCR);
-
-	writel(reg & ~WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
-
-	return 0;
+	guard(spinlock_irqsave)(&priv->regmap_lock);
+	return rzt2h_wdt_wdtdcr_count_start_nolock(priv);
 }
 
 static void rzv2h_wdt_setup(struct watchdog_device *wdev, u16 wdtcr)
@@ -235,8 +238,11 @@ static int rzv2h_wdt_restart(struct watchdog_device *wdev,
 			WDTCR_RPES_75 | WDTCR_TOPS_1024);
 
 	if (priv->of_data->wdtdcr) {
-		/* best effort, ignore ret */
-		rzt2h_wdt_wdtdcr_count_start(priv);
+		/*
+		 * Best effort, ignore return value and use the unlocked
+		 * variant of the function to avoid potential deadlocks.
+		 */
+		rzt2h_wdt_wdtdcr_count_start_nolock(priv);
 	}
 
 	rzv2h_wdt_ping(wdev);
@@ -255,14 +261,32 @@ static const struct watchdog_ops rzv2h_wdt_ops = {
 	.restart = rzv2h_wdt_restart,
 };
 
+static const struct regmap_config rzv2h_wdtdcr_regmap_config = {
+	.name = "wdtdcr",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = WDTDCR,
+	.max_register_is_0 = true,
+	.disable_locking = true,
+};
+
 static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
 				 struct rzv2h_wdt_priv *priv)
 {
+	void __iomem *wdtdcr;
 	int ret;
 
-	priv->wdtdcr = devm_platform_ioremap_resource(pdev, 1);
-	if (IS_ERR(priv->wdtdcr))
-		return PTR_ERR(priv->wdtdcr);
+	wdtdcr = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(wdtdcr))
+		return PTR_ERR(wdtdcr);
+
+	spin_lock_init(&priv->regmap_lock);
+
+	priv->wdtdcr_regmap = devm_regmap_init_mmio(&pdev->dev, wdtdcr,
+						    &rzv2h_wdtdcr_regmap_config);
+	if (IS_ERR(priv->wdtdcr_regmap))
+		return PTR_ERR(priv->wdtdcr_regmap);
 
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret)
-- 
2.55.0

