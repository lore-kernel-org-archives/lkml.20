Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CDC37F002
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 15:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521932; cv=none; b=gjJdPEOiWcm2pw/rnLwqr0nOPNZtDHSHry2fWSOEtTxHDhIdo3QGx3vseJKnIrb0zKzSNRjE5onwriZiBA8k+Z3RJbH9zzvdcs7wIbAPYdPrNoHa/2f4T+wcoWZDeqHvmTpaeUqWSY9xf1CJfd4AoTHU9QTJ502bRsHdbwnX+4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521932; c=relaxed/simple;
	bh=96ftkQ5iFQxw5QZ9xU7GhEsTXdenW99uAU0uo70hPRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ccb0qaHIxt0trinld/mvieLznglarMeC6uwFF5a/9lVOQ0liBlgUg/ppdQRNH4EEdmYumidx/8z3eXAha/yQGwLNKHHeFj1RnMWl9eDLfLFdu8QzCN6seDWaVzfE1aXr9Z1EgSiDsJI+Wgw17bzt0QqU4XfTZl88rZi/vTG6pBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+10zngu; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+10zngu"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48884b0219bso775299f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521929; x=1791126729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rs4mPvhdimrxqSm9i6pYQocUZNbH6k7UKi/I3AiX7uM=;
        b=C+10zngupgJRPawUWP6hk1l2BugPzDBBk9XslUX8nk97WlQZsPBXDS21c7T3uPFINJ
         ybE2GKx9qHT8yCq6e23YJJRd/OCb9JmFOB6WTnrgzu2QhCDoMM0FoXPWuwR5hulDy8Ji
         KSwvNEVGo0nLRrQoQImnDm5AYs57Y3fzZHHkREqbCLv7hwIeVsXAvER7VT28nGhJ3nh/
         9fnOTroN1smfnk1MBQMW/3HhLqfIfCJNRbEeK++2tHC3m4lyyaNf/aLjKoiP4Ttj24OO
         bJRtarMmt0h9BCud0uTkESJDgoBnoFZicB+q5YFTQAlMNTBDIFmCXYcmLOIZL5y0P1Wn
         ehww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521929; x=1791126729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rs4mPvhdimrxqSm9i6pYQocUZNbH6k7UKi/I3AiX7uM=;
        b=tR3Av3OswGc61PjaHKCk05sg+WMPjAYbhAi6GA458j2ZjqF5WhQsDPrGwPOeCntNbb
         ASfiL0Y1jVjCCG9ECE7LM3Ws80qmhNAJ8LePwGmAG+u8MRqIe906gyQH8tgz36HdsLeS
         6CsIpoKzAfMAR9BuN3pALc79gLyyAu9hg9lGMLDMblT9KzVOSgW4cIIDFljIib7FH7ja
         HZYPI6I7DS4wz3npL4MTLKh1HpjXGhlonOEyzpgPsF9l7kztJe0Oiwypv2X/HQCE2dcm
         Dr5a0Lz1TV1hgMXkbQ+/qwykdbDrSivZKAH24JTo6qWMzrUkrNLGfVIm11zrmHdmtCge
         BpSg==
X-Forwarded-Encrypted: i=1; AKwUvBytoRlKVJjdBx2Hcz/W5GbKjVFhiXg5f10q0RY+PCZUMlg776cVjEQiHGLt3+88e2pvlZAMtJx6ztETYSg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHfULa4fb9ltnMHiSfaLjjWugyFRqpaEH3MYhaaJtKWuidC95s
	+f34FpE/O3I0RRiLX4O5dxa7n237hVpGa50y3ESNx3Ju+tXpaHoGhe6H
X-Gm-Gg: AYBFou1ADZstpFHceYnv5/fNZyipmL/biXsi3XVjOa6rQ8Qn2rs1+gO0oB6aylzkQjt
	zOvXWsOZs3h+GJWPskqtKoDsDob3aAqCdGG8cWA17VvDcbAPsEI0/1Jl8BMUFiGoAs63Ho82m28
	A0yj0qkciRjK0w907aMfmapDVJpd+m/JTJXTgEtmQ5KS7J7cJGTXH/g/nrjx+iQeLCgBJM4kVlh
	nZJzzYhu7s9n85pjpDEa+NvLJBdspQeLMMumhUkELbCHh6m+G1ozdo9wA3Or/TyeaGcsAQ1hdYy
	u/9REkTXKeT/PcU7sxDvTyKkbOz8dwbCiLFq6n87TTBEvCZeP1A34/XcMh8jvzSjIUPcBdS3g1A
	Wg+zHEZfYiWmQG8Pv3WIoKn0Q1MgZEG3hiD+iDuTsuM3vL8utbqE1XhheExGGkm68+aIHF5+Bw2
	br3rrQN3/0BqVhG9CV0f1xVjApGnTi4Nx1xb/71C2/pju4zKhVhwBkiRSYxEaURDnGQ3Dc/7x07
	OR1S/ZKSh027+eFUZ43pNK++ainIKGS
X-Received: by 2002:a05:6000:4692:b0:488:6ed9:b11d with SMTP id ffacd0b85a97d-48884e0d903mr5840808f8f.52.1790521929459;
        Sun, 27 Sep 2026 08:12:09 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:12:08 -0700 (PDT)
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
Subject: [PATCH v2 04/11] pinctrl: sunxi: add Allwinner B288 pin controller driver
Date: Sun, 27 Sep 2026 16:10:09 +0100
Message-ID: <20260927151016.186493-5-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927151016.186493-1-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
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
 drivers/pinctrl/sunxi/Kconfig              | 10 ++++
 drivers/pinctrl/sunxi/Makefile             |  1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c | 53 ++++++++++++++++++++++
 3 files changed, 64 insertions(+)
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
index 000000000000..98dd4ead4c32
--- /dev/null
+++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
@@ -0,0 +1,53 @@
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
+/* Port C has no external interrupts. */
+static const unsigned int b288_irq_bank_map[] = { 1, 3, 5, 6 };
+
+static const u8 b288_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PA  PB  PC  PD  PE  PF  PG */
+	{  0,  6,  0,  6,  0,  6,  6 };
+
+static struct sunxi_pinctrl_desc b288_pinctrl_data = {
+	.irq_banks	= ARRAY_SIZE(b288_irq_bank_map),
+	.irq_bank_map	= b288_irq_bank_map,
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
2.53.0

