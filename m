Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C605E4825C4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160078; cv=none; b=GxOg9J/5WnsmSDLxyZdbFK4UUeQtU6jlXMAA0qma/KpjsQ1c2vnvzYBlnT0V0QRvdzU9onMXS7W1Qn9FpfCJnZRty/+1t2+zFXk0YvveTtgbhww9rIauHtkqY8ViJI4gEU7mzPuov7TwMOLJCE0UrhcUQfhdNqi6eJscsICAXy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160078; c=relaxed/simple;
	bh=d013R1cdFBAeWBFuyjbnr1PqsqBM+SjiYpEWoVpIAMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L7U6cxiTBUzoOBFUFeOESxciAJM0m0aQYRaw376gBLI5tKf9RoiECeyReAlhQnQhJQWdhL1qcKDVy8gwX3rOFS6f6TGjSf8zh5iW3bNHBtLooD+mmBenog/qxQn5Nmt9h5L5vmwOwxhe37V+xqX1zGrx3iP2jBx/0r0vtEyJcx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WuBy2/Vp; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WuBy2/Vp"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so4324265e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160064; x=1790764864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7TJjWfJKLA0M2sdvfWYgX9IABTK6WiZZcNEAl74v/1c=;
        b=WuBy2/Vp9kkU8uyRkVDRsVq1p35N4QgrYsc2XUNdWEo9ut+6lxdmjXNAaM3/n73QKZ
         eq8UXI94Rj//3qIn1yFg1MCqPiraT7ZKXtIP44lj8yw3yNB/Y9is2B4ae2FtEEt2ajbK
         aqjLvxCpX4xiv5OraJukCoFVI1IWGiPAfyeMpZJNNhZbK7HrKMTso5JqY2MzlRkNagDU
         AuBqzGHWeCN0vJNHKGctXpMp+CXygF/tbqEPpwEGTRuejyss6onD21ZtD9mpMOThqBqq
         eWLvHd+sMXm+vRU5ZrtpkVBdCwpl4JDUIH5DPNgQx6OTzlMNadaMW9a4zYS2Bh1df6I/
         +BFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160064; x=1790764864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7TJjWfJKLA0M2sdvfWYgX9IABTK6WiZZcNEAl74v/1c=;
        b=YWbIleUj+UAdczceJlcCPg8qY7sKy79kf0YQJKGbzHoJZJ+uK7oaa6EHOPkqwT04vu
         owOoz9WcrIGV0MQwsMLkpqPqYPBZeoa30wyWNzHjcgu789+22rC2fPyEpekofzi4C9Mm
         Ob2d101nn0fzzPtOpypwKLoWuT++PuNq2AL+K1x5ZIYRTSgBapKMObiuJTfSVR9x+7Jf
         bi0BCIv3eHmgG3ONPGTD3hbH4/yT/pX985j5H1U7RqVWtPyCwGKUzL7j0wGKOV0kaYpg
         v4jRV/ypHaDZR018YXHlLGLINS4jRXQqKRnhNs3fHkgg1KdpbcGu9/ir0JpdYiUKv+19
         X/fw==
X-Forwarded-Encrypted: i=1; AKwUvBy6KkkyXxHDj2ohOLeVBhYBnB3AdVMAtMsLqu3vcUbqABEVz9tcPqptcDvi7JowRjtr0RmD4uFt/JD+dN0=@vger.kernel.org
X-Gm-Message-State: AFuF++kIEhauaULiX6SiNqqBe2KBEdLnZn5KqhS8i4v7olnegBxgXsf5
	GpSDMonJ2gT2SLQnTsDV5+4bv97wirmvm3sDxJOhzeMVUJqaPbo4PWR2
X-Gm-Gg: AYBFou38R63/1J8MBwmYtJU4KZvhBLMRipBBnpTHArJ4Xkz3ayuG2fKqWBtDUzYZAAa
	xyuID6AtCQ36oneev6W9aTwnz1iRRtxub9/5lExOOgcTr4stZmgcxRFFRAKR7bvJFbVuuF9R3sV
	BePP8vjRCAhUMmcyZb+PfoIF9VKLB+8d7Y9YIfQqFQVCiv+B39SeRYJhmZkMtaPvG42hj8Rvkfl
	3s/PqOTgAXXr0NGIQnvJ2q5oIXoF0VJWFGZ4JqVma0bK0X6S7WvDeoXH+BuiS0hy7AxN/eQt11G
	edpldcDtwrGM/O5zUpmMqoBKDXsJ/JpUt9pYKbs8H9WDH5x6TtTLgyClEl47HQZUp/+DswmC+Ry
	4bqZcBz5ix/SOsl2AHdCJFxGHUViKlxG5EZmSz+Zhj7Jlt9W1OcsPV2nst7AG81L3sdvkorL7SV
	FNjvrYT6bjk+6sNhvjDU2yaMeuUQXPO24Lwcn2fiGWfDt5ViTbMNbd+u4bxYseq9zZkeKGBY2hA
	EP8MLcMG0B7FRcxRtm39PZooNA9+ECJfJZxcNd2+hJrXknqeALk/E3ucuIPsw3Hn69eKNGjKuyp
	CFbBTRAhGm8xQGIXboY=
X-Received: by 2002:a05:600c:8b21:b0:49c:f512:2361 with SMTP id 5b1f17b1804b1-49fdf1087edmr28745455e9.14.1790160063762;
        Wed, 23 Sep 2026 03:41:03 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:885e:6ade:cc5e:a35e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1acb91sm65170415e9.15.2026.09.23.03.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:03 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 6/8] watchdog: rzv2h: Add syscon support for WDTDCR
Date: Wed, 23 Sep 2026 11:40:52 +0100
Message-ID: <20260923104054.3324830-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On RZ/T2H and RZ/N2H SoCs, the WDTDCR (WDT Debug Control Register) resides
in the second register region of the CPG/MSSR block. Since this
multi-function block is shared with other peripherals, it is exposed via a
syscon regmap interface.

Look up the SYSC regmap using the optional "renesas,sysc" property and
derive the WDTDCR offset from the watchdog instance index.

Retain the existing MMIO-based access method when the "renesas,sysc"
property is absent to preserve compatibility with existing DT's.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v5->v6:
- No change

v4->v5:
- Code changes due to regmap_lock introduction.

v3->v4:
- No change

v2->v3:
- Made use of the new "renesas,sysc" phandle-array property to access the
  WDTDCR register via the CPG/MSSR syscon node.
- Updated commit message

v1->v2:
- No change.
---
 drivers/watchdog/Kconfig     |  1 +
 drivers/watchdog/rzv2h_wdt.c | 64 +++++++++++++++++++++++++++---------
 2 files changed, 50 insertions(+), 15 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index f7d0a0c2c0ef..3c4fc9916d8c 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1046,6 +1046,7 @@ config RENESAS_RZV2HWDT
 	depends on ARCH_RENESAS || COMPILE_TEST
 	depends on PM || COMPILE_TEST
 	select WATCHDOG_CORE
+	select MFD_SYSCON
 	help
 	  This driver adds watchdog support for the integrated watchdogs in the
 	  Renesas RZ/{G3E,V2H(P)} SoCs. These watchdogs can be used to reset a
diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index bf46e239751c..9d00e54b823e 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -9,6 +9,7 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -46,6 +47,11 @@
 
 #define WDT_DEFAULT_TIMEOUT	60U
 
+#define RZT2H_WDT_MAX_INSTANCES	6
+
+#define RZT2H_SYS_BLOCK1(n)	(BIT(16) | (0x5100 + (n) * 4))
+#define RZT2H_WDTDCR_OFFSET(n)	RZT2H_SYS_BLOCK1(n)
+
 static bool nowayout = WATCHDOG_NOWAYOUT;
 module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
@@ -66,15 +72,20 @@ struct rzv2h_of_data {
 	bool wdtdcr;
 };
 
+struct rzv2h_sysc_wdtdcr {
+	struct regmap *regmap;
+	spinlock_t regmap_lock; /* Protects access to the regmap */
+	unsigned int offset;
+};
+
 struct rzv2h_wdt_priv {
 	void __iomem *base;
-	struct regmap *wdtdcr_regmap;
-	spinlock_t regmap_lock; /* Protects access to the wdtdcr_regmap */
 	struct clk *pclk;
 	struct clk *oscclk;
 	struct reset_control *rstc;
 	struct watchdog_device wdev;
 	const struct rzv2h_of_data *of_data;
+	struct rzv2h_sysc_wdtdcr sysc;
 };
 
 static int rzv2h_wdt_ping(struct watchdog_device *wdev)
@@ -93,18 +104,22 @@ static int rzv2h_wdt_ping(struct watchdog_device *wdev)
 
 static int rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
 {
-	guard(spinlock_irqsave)(&priv->regmap_lock);
-	return regmap_set_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTSTOPCTRL);
+	struct rzv2h_sysc_wdtdcr *sysc = &priv->sysc;
+
+	guard(spinlock_irqsave)(&sysc->regmap_lock);
+	return regmap_set_bits(sysc->regmap, sysc->offset, WDTDCR_WDTSTOPCTRL);
 }
 
 static inline int rzt2h_wdt_wdtdcr_count_start_nolock(struct rzv2h_wdt_priv *priv)
 {
-	return regmap_clear_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTSTOPCTRL);
+	struct rzv2h_sysc_wdtdcr *sysc = &priv->sysc;
+
+	return regmap_clear_bits(sysc->regmap, sysc->offset, WDTDCR_WDTSTOPCTRL);
 }
 
 static int rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
 {
-	guard(spinlock_irqsave)(&priv->regmap_lock);
+	guard(spinlock_irqsave)(&priv->sysc.regmap_lock);
 	return rzt2h_wdt_wdtdcr_count_start_nolock(priv);
 }
 
@@ -274,19 +289,38 @@ static const struct regmap_config rzv2h_wdtdcr_regmap_config = {
 static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
 				 struct rzv2h_wdt_priv *priv)
 {
-	void __iomem *wdtdcr;
+	struct device_node *np = pdev->dev.of_node;
+	bool syscon_present = of_property_present(np, "renesas,sysc");
+	struct rzv2h_sysc_wdtdcr *sysc = &priv->sysc;
 	int ret;
 
-	wdtdcr = devm_platform_ioremap_resource(pdev, 1);
-	if (IS_ERR(wdtdcr))
-		return PTR_ERR(wdtdcr);
+	spin_lock_init(&sysc->regmap_lock);
 
-	spin_lock_init(&priv->regmap_lock);
+	if (syscon_present) {
+		unsigned int wdt_index;
 
-	priv->wdtdcr_regmap = devm_regmap_init_mmio(&pdev->dev, wdtdcr,
-						    &rzv2h_wdtdcr_regmap_config);
-	if (IS_ERR(priv->wdtdcr_regmap))
-		return PTR_ERR(priv->wdtdcr_regmap);
+		sysc->regmap = syscon_regmap_lookup_by_phandle_args(np, "renesas,sysc",
+								    1, &wdt_index);
+		if (IS_ERR(sysc->regmap))
+			return PTR_ERR(sysc->regmap);
+
+		if (wdt_index >= RZT2H_WDT_MAX_INSTANCES)
+			return -EINVAL;
+
+		sysc->offset = RZT2H_WDTDCR_OFFSET(wdt_index);
+	} else {
+		void __iomem *wdtdcr;
+
+		wdtdcr = devm_platform_ioremap_resource(pdev, 1);
+		if (IS_ERR(wdtdcr))
+			return PTR_ERR(wdtdcr);
+
+		sysc->regmap = devm_regmap_init_mmio(&pdev->dev, wdtdcr,
+						     &rzv2h_wdtdcr_regmap_config);
+		if (IS_ERR(sysc->regmap))
+			return PTR_ERR(sysc->regmap);
+		sysc->offset = WDTDCR;
+	}
 
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret)
-- 
2.55.0

