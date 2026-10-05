Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810B34E56EB
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232103; cv=none; b=HjtrQJIZoVLTHRcF0vz6WLH/zpcNizjIVk6Y70lF8glWehCPnIacHzEiCGijuMsm9e37IloxiAqycYkkkQAg7hDx5ZW/B6wvJfns41SUnApr5NO5G2vF4gOkjkIxCPZLS9/2CJ+PiK6YURpxwW/ew3+M7mpEujz5ZlCLml3iFyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232103; c=relaxed/simple;
	bh=AcDqqpUvQPtp2r2+5XU1PHfYoNql0A6LEGqhcq1OH+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nfmhmxpi5y+uhhKKTxvs52zbWD5ktAaN2pxqrYuoXsr8NAg18kMQ+vBg6EcdNdkbJUgLPusRx5ESZ2a79fddh2uZ+cd+fP5tjB5DYq+GuohDbscDO12Sl3kpBt1WZX0HdoIlF1aZco6+nmSObnpg0EpV0LEzFaaf6bLswG40Rx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJVqpM4l; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJVqpM4l"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so2874765a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232092; x=1791836892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YNojFJwmE0oVprdqqjx/OIelZ/6m6PVyF1/QNYvXH3o=;
        b=MJVqpM4lpBZTT+Emfo8NYLGESI4OIF2BPB9sHpfUDK1Ci6egwvCJLZEMd/Uc355pCL
         kbflHTwk2eqKevIcvAyGb+gzsThxIcIYR8c0oV3z4f/EsZFaK5AOflc42/KQvKaXQHDH
         0JU3VHhHCpUztcE7UdO5LeoygifYMPCvaW44hTGAn0WL1n3ogi7xiNAryqYTeJar2qOM
         0uYsJzPRIhFfRn2dHZ/nOT9SHJLu+w+Cgzw/vw4cwtJ7Vqaq4gOHY+QKvAlxf597ZkMW
         4zjYyIR7lcXyPKa6OVUkz5EkaIGUjD4oBrWOKc0/HlXHjLEbidUDhMIO5NDy9rr74jz2
         1l7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232092; x=1791836892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YNojFJwmE0oVprdqqjx/OIelZ/6m6PVyF1/QNYvXH3o=;
        b=Uknl/oywKkkpdlPVCw8MhKbUc9UHKyh/BqYlund5XxzdxPXq9d5k3JCiKyh1oRRTml
         GC/3JDweUDTnnAXJRWHUdQw6j3XxWBdHYTJUHfb/fW7orp9huPq5h69WgqQiwVFckQ6E
         4hogq8VlinaIMyubwKk8N5zBRs6K1m4hYWgolaKKlY3lnJPbCkS+6QDinYbaj2ReT7+j
         H9hmn00+s4TMnyBkGsNSyrM52c8ZlOEeZLax/UhG4fR6KvRh2OQpQq82dzf/V79cpK9S
         /0j4b5exyFVwGqkpUfgJi49i/P0Np21f8Gy7a7OSGcPFkumTRJxY37/zPfBz+mHv+7zk
         1HUQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3uCMS4fpH+kpW5WGGM/rkzA0agx+uQoJpjv9lybXRJVz+9wpoFpJg2xZW6HTqn3aCTClLA0Gum0Tgt4o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFCtnKmB5/r4hXc0y+LJIrRkz0d0iTQVpkP3lT+EUGG2Ua1hEA
	VgLNaI+5RIJnoktslHCxkL1WnZymqPoTHVrydh2lQHpb0WwISnk5cQMM
X-Gm-Gg: AYBFou1WcSud8z6N5OubGBRj4IYk6/PW/ZgeXuPE9MApYtenWg0nVrHQMTlESOmbB67
	LiDTlPpjgbsi5LFtGXVV5xd75pWtA8535INABEUq+dQbs+Rs4m7ehYlvzhZjPcUhxSzVrmm7N0x
	jAsAlWMX31auHKDmtII7gcCTAAlOWLAcnfuAY23My2/qsvYR2cCWQhpz0RiCmee1juy26yA2fqj
	QtAU4D1lS6ms3HFhTTSX5aDwrQ4UrGF0YqJoX4L7Or1pSGfVXSQS2TRdUpR6THTxzgt6nDwmqSC
	69Dnz73/Fj7R9ysVqz24H0hfC3K4v5v7rfe2SCPyjVkLqwkPaiLLVrd1jNAn+5UZ9VlDHW3dikL
	jZvMaEqTpbwkvrnOLuJj2/DpI6/JzNfqMXEpJbTfxohwApzkYB7xlEIHhU/slWFd0iwByYtHWHu
	nhfkTMI/oHHisddEzfb9JevdS3CpO31UdrQ1VvIY4CVSj/U7HCviAc4ZIHlM0I8/cPgYfwHA5SG
	DYUCC0ddV1W2FIBtWFtzJ+BdAi4zjg9
X-Received: by 2002:a05:6402:274c:b0:6ab:8067:6a8a with SMTP id 4fb4d7f45d1cf-6afada12e14mr7642825a12.32.1791232092260;
        Mon, 05 Oct 2026 13:28:12 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:28:10 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 04/11] pinctrl: sunxi: add Allwinner B288 pin controller driver
Date: Mon,  5 Oct 2026 21:27:24 +0100
Message-ID: <20261005202731.153971-5-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005202731.153971-1-pmazzini@gmail.com>
References: <20261005202731.153971-1-pmazzini@gmail.com>
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

