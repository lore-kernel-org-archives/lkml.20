Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F73C3A0B31
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799786; cv=none; b=XZLDjs0vuHOAjLKWVsqlkViPyGojKWnAGBaTIoLRMbaPqDZPYPyAXGQ/+Ntc/psu7SKK3lPfEb2wltO9l4/AYeEa/p/V2b56Emgqd/OigCigDrWJZARtvdPbmS6fPITbhNsSzCD+Ufvj2JxLgwcokVmhBJPlDWGh8uTKnaQ+Cgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799786; c=relaxed/simple;
	bh=AcDqqpUvQPtp2r2+5XU1PHfYoNql0A6LEGqhcq1OH+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G+TZjfe3NiPiK0Is/K74otarPMrM4RVNldT94uhkGT5Crjow08O2mk3P3RoJDBe4laej8E+YTGDWaDEXLxux79wztFSc54Nl0BobdganYcrVQD+ufx1cLqjxmu0J5eaqSTS8bJZvH7PrxTA3eXt0WW8nClpwqac9iUSRs9rmOT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DNuMAOC1; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DNuMAOC1"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a16c399641so17499395e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799775; x=1792404575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YNojFJwmE0oVprdqqjx/OIelZ/6m6PVyF1/QNYvXH3o=;
        b=DNuMAOC1qTMR/lvKGfNB75mWxCshSAmxMiflDf7msR5IzrXWXquCOLZEQ7z0Jm9KjE
         rXQuu71M7l6oKp8nYuPVM4pvXv4Y1nNobpJ7x/TSUjuUdhnZ8suyibxwuiprnYauwG9V
         P95nIBjlfVF/nTnNtIUe3IzXJwfn0vzDnruTKE+Pa6TCH5CaJkr/1qOi1FaDbqRFwhyq
         mDTjxfeprZwjmLTiIJtHZpBolUa0bCPB6O0z8hHIGH1qoGbiytlaOo/tX6A7LRgdg2TT
         pZjQa99IjIoqCQZdXOW79x+xvxv19sHsk0OusDEA619bhSOIbKGmpvDgKBpSa/iPnO0+
         ncgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799775; x=1792404575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YNojFJwmE0oVprdqqjx/OIelZ/6m6PVyF1/QNYvXH3o=;
        b=kagMdTgp3qGmCld3kgoWSjknXmbT/Z2X4a8VvxP+1xVV0++RlMZtfncsEw1MAIuuBq
         opgAGJkwjWyQTmxy6SNS2JVcsXekSJH8ekdTYovFpW+qhEh5tHmnS/ZoeKO5melNQuVk
         cfwZLwU4d/890r0UCbJh/FGs19ixgE9gLubxOnldlXGtLd0RgsH64W5mdBJ/6Gj7T8b5
         NFjxxaGUOOcFPExCaSOuxTxaRWL2PTxHjbMz4KwXrCHPgmuX1SzKIENKD/TVqCFXU38I
         cmxl+GACKidX9xeEtV37GdbgEGrFCsdyTcL8ROZrzww62v2TZcx5f4bk/eIIbtEiaYFz
         aCcw==
X-Forwarded-Encrypted: i=1; AKwUvBziwx9biCjU9MbN+x6I7yasR9ziqu+yQqDRzA0Utj3Zcrfsmx/6zxfWcaQS8ahqTeBI9GO0C0z2Rmucv0k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLL4n94sPH1DjNVxqkwEF0nVXwlih8IrwBREmn4yy1FeTVvgISM
	i8BN3s3ApnUYEE0Sduw7M6+HYMby5Gt62jt9rxmofQamUeLXWH8EZsQG
X-Gm-Gg: AYBFou0KydTjVwIXGjPD537YqT4QRlJgbfXBDC9hjGNMrr8ohTj78oc/jV5HZm4rnZo
	YWVpnUyyuL3p6WC1UONFTO9eKvSTEisuLRgKeopJlnIMksYksvYZ/86eCLz2jACC9AuNU0w7iV7
	afE67yJk7bQDG5BO46WAilwproP1HdeNIEeuHlHgYuopkLxqx7ZjU/E2p5hwfiLqvZIGihiBgoK
	Uj2aIA67T6/17Haw7s2Ogxm7IC9FQdhZdaZAEqRW0RvLMpirl+SOY1AbT+iQ2xidZR5ymZ50I+F
	pSft4wAhnTY0z+viZxKMnKbMZFySIYkbN0db5hIN3S+aLgp7VTz9eD9CPZqb6zaJL99zRi07u44
	KJYaWeSfwM/COC4MinWJktlB5kTo9LpFNCymyhClXng5DgO7BCDZz1OsWTkQRhgNsjmZ9rPK3fC
	I/O7PbkVDP40f5JSabaX+HzrBTQ6RGSn0n43JeufHnshznYdrIOXb6eu66hyd4yzd0ghLzK9Iei
	5wq5XpT0RPicHHqF5zTUQNA0oVOlS6k
X-Received: by 2002:a05:600c:3f0c:b0:4a1:85d9:13be with SMTP id 5b1f17b1804b1-4a18e498471mr190194615e9.20.1791799775134;
        Mon, 12 Oct 2026 03:09:35 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:09:34 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 04/11] pinctrl: sunxi: add Allwinner B288 pin controller driver
Date: Mon, 12 Oct 2026 11:08:09 +0100
Message-ID: <20261012100816.331033-5-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

80 pins across ports B, C, D, F and G; the mux values come from the DT.
Port C has no external interrupts. PH0 is BSP FPGA-only and omitted.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/pinctrl/sunxi/Kconfig              | 10 +++++
 drivers/pinctrl/sunxi/Makefile             |  1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c | 49 ++++++++++++++++++++++
 3 files changed, 60 insertions(+)
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c

diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
index dc62eba96348..a08186133090 100644
--- a/drivers/pinctrl/sunxi/Kconfig
+++ b/drivers/pinctrl/sunxi/Kconfig
@@ -56,6 +56,16 @@ config PINCTRL_SUN8I_A23_R
 	default MACH_SUN8I
 	select PINCTRL_SUNXI
 
+config PINCTRL_SUN8I_B288
+	bool "Support for the Allwinner B288 PIO"
+	default MACH_SUN8I
+	select PINCTRL_SUNXI
+	help
+	  Say Y here to enable pin controller and GPIO support for the
+	  Allwinner B288 (sun8iw10p1) SoC, as used in e-book readers such
+	  as the PocketBook Verse. This covers ports B, C, D, F and G,
+	  including the four banks of external interrupt capable pins.
+
 config PINCTRL_SUN8I_H3
 	bool "Support for the Allwinner H3 PIO"
 	default MACH_SUN8I
diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Makefile
index 951b3f1e4b4f..5129c0f19f3e 100644
--- a/drivers/pinctrl/sunxi/Makefile
+++ b/drivers/pinctrl/sunxi/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_PINCTRL_SUN50I_A100)	+= pinctrl-sun50i-a100.o
 obj-$(CONFIG_PINCTRL_SUN50I_A100_R)	+= pinctrl-sun50i-a100-r.o
 obj-$(CONFIG_PINCTRL_SUN8I_A83T)	+= pinctrl-sun8i-a83t.o
 obj-$(CONFIG_PINCTRL_SUN8I_A83T_R)	+= pinctrl-sun8i-a83t-r.o
+obj-$(CONFIG_PINCTRL_SUN8I_B288)	+= pinctrl-sun8i-b288.o
 obj-$(CONFIG_PINCTRL_SUN8I_H3)		+= pinctrl-sun8i-h3.o
 obj-$(CONFIG_PINCTRL_SUN8I_H3_R)	+= pinctrl-sun8i-h3-r.o
 obj-$(CONFIG_PINCTRL_SUN8I_V3S)		+= pinctrl-sun8i-v3s.o
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c b/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
new file mode 100644
index 000000000000..f973c2b3f2eb
--- /dev/null
+++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Allwinner B288 (sun8iw10p1) SoC pinctrl driver.
+ *
+ * Bank sizes and the interrupt mux derived from Allwinner's BSP driver
+ * pinctrl-sun8iw10p1.c, which is:
+ * Copyright (C) 2014 Jackie Hwang <huangshr@allwinnertech.com>
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-sunxi.h"
+
+/* PH0 exists only on the BSP's FPGA platform and is omitted. */
+static const u8 b288_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PA  PB  PC  PD  PE  PF  PG */
+	{  0, 17, 15, 29,  0,  7, 12 };
+
+static const u8 b288_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PA  PB  PC  PD  PE  PF  PG */
+	{  0,  6,  0,  6,  0,  6,  6 };
+
+static struct sunxi_pinctrl_desc b288_pinctrl_data = {
+	.irq_banks	= 4,
+};
+
+static int b288_pinctrl_probe(struct platform_device *pdev)
+{
+	return sunxi_pinctrl_dt_table_init(pdev, b288_nr_bank_pins,
+					   b288_irq_bank_muxes,
+					   &b288_pinctrl_data, 0);
+}
+
+static const struct of_device_id b288_pinctrl_match[] = {
+	{ .compatible = "allwinner,sun8i-b288-pinctrl", },
+	{}
+};
+
+static struct platform_driver b288_pinctrl_driver = {
+	.probe	= b288_pinctrl_probe,
+	.driver	= {
+		.name		= "sun8i-b288-pinctrl",
+		.of_match_table	= b288_pinctrl_match,
+	},
+};
+builtin_platform_driver(b288_pinctrl_driver);
-- 
2.52.0

