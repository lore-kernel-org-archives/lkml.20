Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71683457E64
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125497; cv=none; b=umZS6vkuN/0BnYp+2npabfzntYjhI/jI0EQfluIsmnC3ayWGG04KuaSI6x5qMvK/fJRQChlkrUfviMGi8cwkXqZUtmLiqnCfnHVHZtia9s5INCU+/3hEQR0X95D3YT8F6IMLw6eKeFD90/CuZKtCwuBcyc3eSvjFMm0VFuHqbH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125497; c=relaxed/simple;
	bh=7kpJ0HynFt2+Fb9i+/TLOlwncx9aXxoDxSm2N81XzUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qAounvaZ3XcNGvzi6aF9PBk6AsijaLf28g2hPLx312cx4d8dnYZs1Aq2EVTYdR8bkjpRTKK5+fOB3ZKReRsYkTnvSfO7isaggR8eI9YD2sZSDvmWDPAXDtQMzmza0PgK10JXPl7wEfUSQOYk9keN8VtI7/fSO0/e5APtlRh8N70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T36KFw8o; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T36KFw8o"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so1249973a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789125470; x=1789730270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fbBV9me3Y/nkvKnsfG5cg/h1HCFDgWHdjYuS8kLRmRY=;
        b=T36KFw8o8CtHNsvSVpt6A+YN3pK8Ceb9kNsVedh1IZqCHh/IgCkhQo9AVx3oc1nfjV
         4aNgKcs9wTb2eLki1T+phE+ekXA4INuMFb9EEVZBJ/6cqrdUrSEub2ZMoqF6maeRelnA
         bu/fANL9zf60yaTwF6RjvIlhdptaVWtNwxnwiTXaeEl7ebHHNi6DEmi2DBtTBPRaKuRW
         uIK6iEy6siU4tSGjJP8TWX1gnR28w5VbYDAkfFz7Xohlk9lLlbNcdaKH0QY6Hj2Bxvea
         B9TxT7P7KBiyzQKby0ck2Ukupn7P8GV2Zfr1T94B9SED5l7NstHRKZLA9pgiselGwCW3
         PvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789125470; x=1789730270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fbBV9me3Y/nkvKnsfG5cg/h1HCFDgWHdjYuS8kLRmRY=;
        b=kwpVzTHH3FNczAhFXlXsb2ieOWKTanVvNifMpurku2RDotWyzJjn5t/oC1VP8rQO8s
         o1QdFj18371vPeA5t/RBpgbcAjniUKWUVHoLYOPgEXQbk9o2A0eIwBQlM8p4+nPIsiyM
         4jDDk7P9NzbRjFevHw9hOp3Xd95lJB97rEBHP58sI9qxnZ2gjKbfwgVPizHTx0Cjdw8p
         q93CiEaM03imxVJq3d/VjQr1Y5AzQjRnWGjlg8Z/9+fvjZZrQXdaLmyxqSnppu0sd9RD
         1oRkYoKsb1cuPwc0dn2+XF1M1tOQly4PN4HtvR1pnJqcTSLrKhRvC4cePXmtqN+ZcR23
         8JPw==
X-Forwarded-Encrypted: i=1; AKwUvBxijO+nFdZiFRcBjGI1QaO7AIXjMTVR6Ff9WMPZOx5d7j9o9uLsm0MwSLwq2FfTY6++uckkv004XDIzEwU=@vger.kernel.org
X-Gm-Message-State: AFuF++lAg4Pb0YehrIbTUgUJ+/XgW3dRWZ1a9DJNYE7EEekMNlvnGtZd
	NuMsYfas1UQ4Vkmcm4arGOTKWmMXgC0ATmcrSZcMLt+vSA91QpGxtScH
X-Gm-Gg: AYBFou0o3x3+8IZQUEjAmkNgu7jx/GWN3W5ZjEnLuGwlO5VLaj+sVvTxFwG4uuLhV7c
	MZy/jLcwGbggizQrbN2RVYyWO65Csru7ttL65qDIlHMsT75/IT6FK7ja+2ZFOQjvVKDQk06/XB5
	6+mWztxhm5DXIAYDIng1SMHax7RWjOS6GBWjDolnz3K+UsC/y/wqW28/yMPiKjpui5ykAaM+Rjm
	uUtm6BzdaXEwxeQbTnumZBrKg3cj3lz49dG0Do7MWJ+K8haMBsTnCWRkxhJyU7fvJnsXidT5TPx
	zEShNA4AFGCDIijzV1Bks1FRIX9p5+pmbwbA6ZDlAvR2dhSN2tN561qwrVkBMgXBFa+z0Urt1kQ
	1q0qhkDfNy/qmTUK/P2ru1J4sYvV+Krqzy6IxMh3CY6wpao6O03PdCdrmhzYYUt0RS5FlNWYLSe
	6X4APvoxXtO8cZbF2PDRAa39u75GKseOIaXcK8yIN3zX81B1rUkW0NAMAzw7tazwcCo2UFuYCKA
	Ug6GriBaX0VI7AZQr3Fazy4+3fSaeP3ASuAMIcDpMXWaExingrFCuSbhv072KqNqtQkYnx2AfuQ
	6Nbk0FgcsgD4qaD+OZM=
X-Received: by 2002:a05:6402:3907:b0:6a9:92f0:76c7 with SMTP id 4fb4d7f45d1cf-6a9b56ae97amr1630629a12.34.1789125469553;
        Fri, 11 Sep 2026 04:17:49 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3de1:9f21:e874:3931])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf23sm5438182f8f.5.2026.09.11.04.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:17:49 -0700 (PDT)
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
Subject: [PATCH v5 6/8] watchdog: rzv2h: Add syscon support for WDTDCR
Date: Fri, 11 Sep 2026 12:17:29 +0100
Message-ID: <20260911111731.3404308-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index 550112446db4..fcd1ff99c0ed 100644
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

