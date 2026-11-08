Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794153503;
	b=c2FDBNVqDUuis6sKCBfSaVVQ/u0iMBwu9H7AT0xUEw55V6xMW1vjxb6CQfGWSGUITb3q
	 69p+VENKjq+hMLWXEsKOqCJp2jGY5cmwYP0SITuwv5RHF97rA6OHQ9vKUOSGCkIxmmwkf
	 fKQnI0I3oDwnjBC7x9VqG3RnuJwEiiOQHMz0DckM8JPjACHHwGX3j1xmyviO2SEdCAdU5
	 78/U5k1kS4xcaEWKO5IGX03YmZV4Di247n3z3Ji3blaf3G/S/70KxxBZMWpE+2u3/ebAO
	 rI4WJ8ioqg2zFEbE4doS3XQeaYkq4Aw9nofYxyDvsSNFEo4CKxxUXdinrEkqVEloIUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794153503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZA/5FYnzqdS+nW2OO/uAeStvUW/+ooZY9jKEedX3LrE=;
	b=QlEm0ta8niruWtWGAq/tZbkDuyf7ftpl/s6g04+mpwJukZk32zVs1PnADVq5ryEx9lmF
	 pWklp+YeJrumm7Q4x5tvcN4rk9yCsYWceYZTMHBXRfk4Edo4vvbz/BYYSw86VwCDsFHJM
	 8w2omFQGEiEXvGQR4D8+omjxeTw2BKEwkDPdxAgOyPEz0DliBl7GqP1h8APKmolrwL6Jg
	 cotaqnMAV6VNfnlWHqglM+acF2IxI0Rd5WRGnGnWMK/UJF/F17OnGbSLY01HWRfh/02uv
	 YW8qkeJ3FPhkrwS9CFh3o0jPzEYsv0JMc7f7yZCaHJRZukjYtzsEJFfXYL9ZzTF1SBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X0fIwqPC;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794E1606A336
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 15:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 794E1606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X0fIwqPC
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-491971ac844so127731f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 07:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794153501; x=1794758301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZA/5FYnzqdS+nW2OO/uAeStvUW/+ooZY9jKEedX3LrE=;
        b=X0fIwqPCpCC4ghjJVnHC93OSFEVJOSbFN3wM3Ljjul/IUdnO/o4zk1mEbrnfes0LZ9
         sx0WC1Vmm3+De/t5ZEXCNiNDFbgXtIRlPl63n8TZCTejYsLgXRgEGhe9Ush6aUlazqgq
         U4yY/F7YlKVX/mnD1NtzyunUmA3sLkPs6Thzou50A6ZJpYh3LeRbM1a1nDWT7fuLeRi8
         vU1Y4Yf61W0aKcU7+oMDZUG2DhBiHjTkTZQ3UnDeyvzc7vKRxn6RpktMEFqqx7OR7oBd
         WNFBoSIBBdnN8DmWPtCRlCFuisJvTmzLDNKTQ3pdwi5uyHApzUULscJIxm9ppLxh2BpP
         lEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794153501; x=1794758301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZA/5FYnzqdS+nW2OO/uAeStvUW/+ooZY9jKEedX3LrE=;
        b=sRoeWnNRaC4kcvZJh7Rvp7yz9O2rhCOt4lH0Jq7/5xloxw/6TQDrd7LlAHYrvnRSrY
         7mStLiXBPF06iwYkfufVTOlXpnUPuDu93L3BgPCHviiMGih1ExlXv0ukJrrINXGXLkie
         QDwdgq0ZjixpU0+IIDptyfODF1p75MzJBUhxoNMQJApattvJBjsSDFn/H3OeAQ5fCZbW
         qjoXN4oJhtjvwqrTVFXKzOl0ReOs2UpjMo6hdpHmWExbuDXeWDV5cTukuP+GtdWZebnD
         rkN40SVKnwknC0d7GuReenLgwMGL/6dFcwzwnFPLB5U6esbr7QvypySrJ0qLcGAzuUbF
         Ix4w==
X-Forwarded-Encrypted: i=1; AL+hErFj2r6ClCusi6S5rjZWo+PXFvGo/TJ4XaU2qG7WZqUaVyrawYGDCZo1UQRml9bDqmBB6iW4Mbb+k1GmnpU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RC5zCNAqxx8+OwbBdT4Lgswka6t1cnacNwZVhXKzVVCP1QTII
	SC4zRhpoSWsWh9Lrzz9T8Bisc+6IqXNioLKUZOxTMVnDWsPtDL/nfVZM
X-Gm-Gg: AYBFou1KyJCAvMntrZBXhhttKZmvOSYrbwYxn7AYNjfX7qCMOm+p9BlBkcCjbYsBZ9E
	gmXqlInxtmpFfwr6Cr5XsuCJ65T22LAEDbPTvpBqnhZ5mQE+e8zDw5whvZMC3wo2fOocNyCg/g1
	EZKsiZx0U4NwEo+nPuZXLPdTpZuAHkr0b+KiVnfFAG9tySvVGOxi0kMddPwQ3hUDs/M0ZJcsPqX
	QYUQ0nKCkahTnhyC87BJjIjfV8cWN2p4wKIYB3vRNXGTbB/UCiI5dAvtGUiBsmGv3o8EwK/pekh
	JzS0ClMk59/VhGc5mfV6b9Gs+AKZY789vxIX7yrsKC8tFdME8oEtKGYsJZeQhNme2WJbiMhDycD
	gu9DKbCtONGn6Gae3ZyEJzGRM7lh91ILaI9EW9PNeanxqUq4cTvet6HtOCqJ46uGvViX5hA7gpl
	YuDjJBYRiBUDlsZQg0sL9oUEZG54WzOWkJsBn65INcBNL0/mcsV9ieiPLX3Wint0Ng0fZZlC+sJ
	jpZeGfNm3dwjz9A++aouXuLpi7bbGkwDgAfLbCoWnp3N30Rm7WcPKypvKNkEI9+ByqBFlgIDeHC
	IWw82GfdC2ZOwiWoqqPP4nZrFBc9bnsnLmu/Lzfwtr6SoZPKYLm5Pq26VHutGv0=
X-Received: by 2002:a05:6000:26ca:b0:491:895b:4c02 with SMTP id ffacd0b85a97d-495844a33a2mr4117355f8f.23.1794153500777;
        Sun, 08 Nov 2026 07:58:20 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495966f316esm4753282f8f.17.2026.11.08.07.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:58:20 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 3/3] clk: sunxi-ng: add Allwinner B288 CCU driver
Date: Sun,  8 Nov 2026 15:57:01 +0000
Message-ID: <20261108155702.361022-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108155702.361022-1-pmazzini@gmail.com>
References: <20261108155702.361022-1-pmazzini@gmail.com>
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

Covers the PLLs, the CPU/AHB/APB tree, the module clocks and the bus
gates and resets, described as a table.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/clk/sunxi-ng/Kconfig          |   5 +
 drivers/clk/sunxi-ng/Makefile         |   1 +
 drivers/clk/sunxi-ng/ccu-sun8i-b288.c | 212 ++++++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-b288.h |  11 ++
 4 files changed, 229 insertions(+)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.h

diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
index 6af2d020e03e..5bdfb8574794 100644
--- a/drivers/clk/sunxi-ng/Kconfig
+++ b/drivers/clk/sunxi-ng/Kconfig
@@ -88,6 +88,11 @@ config SUN6I_RTC_CCU
 	default ARCH_SUNXI
 	depends on MACH_SUN8I || ARM64 || RISCV || COMPILE_TEST
 
+config SUN8I_B288_CCU
+	tristate "Support for the Allwinner B288 CCU"
+	default ARCH_SUNXI
+	depends on MACH_SUN8I || COMPILE_TEST
+
 config SUN8I_A23_CCU
 	tristate "Support for the Allwinner A23 CCU"
 	default ARCH_SUNXI
diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefile
index 796f443f4d76..debae396555f 100644
--- a/drivers/clk/sunxi-ng/Makefile
+++ b/drivers/clk/sunxi-ng/Makefile
@@ -41,6 +41,7 @@ obj-$(CONFIG_SUN4I_A10_CCU)	+= sun4i-a10-ccu.o
 obj-$(CONFIG_SUN5I_CCU)		+= sun5i-ccu.o
 obj-$(CONFIG_SUN6I_A31_CCU)	+= sun6i-a31-ccu.o
 obj-$(CONFIG_SUN6I_RTC_CCU)	+= sun6i-rtc-ccu.o
+obj-$(CONFIG_SUN8I_B288_CCU)	+= ccu-sun8i-b288.o
 obj-$(CONFIG_SUN8I_A23_CCU)	+= sun8i-a23-ccu.o
 obj-$(CONFIG_SUN8I_A33_CCU)	+= sun8i-a33-ccu.o
 obj-$(CONFIG_SUN8I_A83T_CCU)	+= sun8i-a83t-ccu.o
diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-b288.c b/drivers/clk/sunxi-ng/ccu-sun8i-b288.c
new file mode 100644
index 000000000000..6e12ed8248f2
--- /dev/null
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-b288.c
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Clock Control Unit driver for the Allwinner B288 (sun8iw10p1).
+ *
+ * Closely related to the A64; most of its PLLs are bit-identical.
+ * Transcribed from the BSP clk-sun8iw10.{c,h} and cross-checked against
+ * ccu-sun50i-a64.c; divergences are called out inline.
+ *
+ * The audio clock tree (i2s/spdif/dsd/dmic/adda) is not implemented.
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "ccu_table.h"
+
+#include "ccu-sun8i-b288.h"
+
+/*
+ * APB2 mux index 2 selects PLL_24M here rather than PLL_PERIPH0_2X as on
+ * the H3.
+ */
+CCU_TBL_PARENTS(cpux_parents, CCU_TBL_LOSC, CCU_TBL_HOSC, CLK_PLL_CPUX,
+		CLK_PLL_CPUX);
+CCU_TBL_PARENTS(ahb1_parents, CCU_TBL_LOSC, CCU_TBL_HOSC, CLK_AXI,
+		CLK_PLL_PERIPH0);
+CCU_TBL_PARENTS(apb2_parents, CCU_TBL_LOSC, CCU_TBL_HOSC, CLK_PLL_24M,
+		CLK_PLL_PERIPH0_2X);
+CCU_TBL_PARENTS(mod0_parents, CCU_TBL_HOSC, CLK_PLL_PERIPH0_2X,
+		CLK_PLL_PERIPH1_2X);
+CCU_TBL_PARENTS(de_parents, CLK_PLL_PERIPH0_2X, CLK_PLL_DE);
+CCU_TBL_PARENTS(tcon0_parents, CLK_PLL_VIDEO0, CLK_PLL_VIDEO1);
+CCU_TBL_PARENTS(mbus_parents, CCU_TBL_HOSC, CLK_PLL_PERIPH0_2X, CLK_PLL_DDR0,
+		CLK_PLL_DDR1);
+CCU_TBL_PARENTS(dram_parents, CLK_PLL_DDR0, CLK_PLL_DDR1, CLK_PLL_PERIPH0_2X);
+
+#define CRIT		CLK_IS_CRITICAL
+#define UNGATE		CLK_SET_RATE_UNGATE
+#define RATE_PARENT	CLK_SET_RATE_PARENT
+
+static const struct ccu_tbl_clk sun8i_b288_clks[CLK_NUMBER] = {
+	/*
+	 * PLL_24M @ 0x034 -- B288 only. It feeds the PLLs 24 MHz whatever
+	 * the crystal: it converts a 26 MHz one and is bypassed with a
+	 * 24 MHz one.
+	 */
+	CCU_TBL_FIXED_RATE(CLK_PLL_24M, "pll-24m", CCU_TBL_HOSC, 24000000),
+
+	CCU_TBL_STD1(CLK_PLL_CPUX, "pll-cpux", PLL_CPU, CLK_PLL_24M, UNGATE),
+	CCU_TBL_STD1(CLK_PLL_AUDIO_BASE, "pll-audio-base", PLL_AUDIO,
+		     CLK_PLL_24M, UNGATE),
+	CCU_TBL_STD_AT(CLK_PLL_VIDEO0, "pll-video0", PLL_VIDEO, 0x010,
+		       CLK_PLL_24M, UNGATE),
+	CCU_TBL_STD_AT(CLK_PLL_VIDEO1, "pll-video1", PLL_VIDEO, 0x030,
+		       CLK_PLL_24M, UNGATE),
+	CCU_TBL_STD_AT(CLK_PLL_DE, "pll-de", PLL_VIDEO, 0x048,
+		       CLK_PLL_24M, UNGATE),
+	/* PLL_DDR0 @ 0x020 -- unlike the A64 there is no K, and N is 7 bits */
+	CCU_TBL_PLL_NM(CLK_PLL_DDR0, "pll-ddr0", CLK_PLL_24M, 0x020,
+		       8, 7, 0, 2, UNGATE),
+	/* PLL_DDR1 @ 0x04c -- B288 only, same layout; this one feeds DRAM */
+	CCU_TBL_PLL_NM(CLK_PLL_DDR1, "pll-ddr1", CLK_PLL_24M, 0x04c,
+		       8, 7, 0, 2, UNGATE),
+	/* PLL_PERIPH{0,1} -- as on the A64, post-div 2: 2x is the raw output */
+	CCU_TBL_PLL_NK(CLK_PLL_PERIPH0, "pll-periph0", CLK_PLL_24M, 0x028,
+		       8, 5, 4, 2, 2, 2, 0),
+	CCU_TBL_PLL_NK(CLK_PLL_PERIPH1, "pll-periph1", CLK_PLL_24M, 0x044,
+		       8, 5, 4, 2, 2, 2, 0),
+	CCU_TBL_FIXED_FACTOR(CLK_PLL_PERIPH0_2X, "pll-periph0-2x",
+			     CLK_PLL_PERIPH0, 2, 1),
+	CCU_TBL_FIXED_FACTOR(CLK_PLL_PERIPH1_2X, "pll-periph1-2x",
+			     CLK_PLL_PERIPH1, 2, 1),
+
+	CCU_TBL_STD(CLK_CPUX, "cpux", CPUX, cpux_parents, CRIT | RATE_PARENT),
+	CCU_TBL_STD1(CLK_AXI, "axi", AXI, CLK_CPUX, 0),
+	/* CPU_CFG @ 0x050 -- CPUAPB divider [9:8] */
+	CCU_TBL_DIV(CLK_CPUAPB, "cpuapb", CLK_CPUX, 0x050, 8, 2, 0),
+	CCU_TBL_STD(CLK_AHB1, "ahb1", AHB1, ahb1_parents, 0),
+	CCU_TBL_STD1(CLK_APB1, "apb1", APB1, CLK_AHB1, 0),
+	CCU_TBL_STD(CLK_APB2, "apb2", APB2, apb2_parents, 0),
+
+	CCU_TBL_MOD(CLK_NAND, "nand", mod0_parents, 0x080, 0),
+	/* mmc0/mmc1 use the old timing mode and need the phase clocks */
+	CCU_TBL_MOD(CLK_MMC0, "mmc0", mod0_parents, 0x088, 0),
+	CCU_TBL_PHASE(CLK_MMC0_SAMPLE, "mmc0_sample", CLK_MMC0, 0x088, 20, 3),
+	CCU_TBL_PHASE(CLK_MMC0_OUTPUT, "mmc0_output", CLK_MMC0, 0x088, 8, 3),
+	CCU_TBL_MOD(CLK_MMC1, "mmc1", mod0_parents, 0x08c, 0),
+	CCU_TBL_PHASE(CLK_MMC1_SAMPLE, "mmc1_sample", CLK_MMC1, 0x08c, 20, 3),
+	CCU_TBL_PHASE(CLK_MMC1_OUTPUT, "mmc1_output", CLK_MMC1, 0x08c, 8, 3),
+	/* mmc2/mmc3 halve the clock internally */
+	CCU_TBL_MOD_POSTDIV(CLK_MMC2, "mmc2", mod0_parents, 0x090, 2, 0),
+	CCU_TBL_MOD_POSTDIV(CLK_MMC3, "mmc3", mod0_parents, 0x094, 2, 0),
+	CCU_TBL_MOD(CLK_SPI0, "spi0", mod0_parents, 0x0a0, 0),
+	CCU_TBL_MOD(CLK_SPI1, "spi1", mod0_parents, 0x0a4, 0),
+	CCU_TBL_MOD(CLK_SPI2, "spi2", mod0_parents, 0x0a8, 0),
+
+	/* DRAM_CFG @ 0x0f4 -- M[1:0] mux[21:20] gate 31 */
+	CCU_TBL_DIV_MUX_GATE(CLK_DRAM, "dram", dram_parents, 0x0f4,
+			     0, 2, 20, 2, BIT(31), CRIT),
+	/* DE_CFG @ 0x104, EE_CFG @ 0x108, EDMA_CFG @ 0x10c -- M[3:0] mux[26:24] */
+	CCU_TBL_DIV_MUX_GATE(CLK_DE, "de", de_parents, 0x104,
+			     0, 4, 24, 3, BIT(31), RATE_PARENT),
+	CCU_TBL_DIV_MUX_GATE(CLK_EE, "ee", de_parents, 0x108,
+			     0, 4, 24, 3, BIT(31), RATE_PARENT),
+	CCU_TBL_DIV_MUX_GATE(CLK_EDMA, "edma", de_parents, 0x10c,
+			     0, 4, 24, 3, BIT(31), RATE_PARENT),
+	/* TCON_CFG @ 0x118 -- mux[26:24] gate 31, no divider */
+	CCU_TBL_MUX_GATE(CLK_TCON0, "tcon0", tcon0_parents, 0x118, 24, 3,
+			 BIT(31), RATE_PARENT),
+	/* MBUS_CFG @ 0x15c -- M[2:0] mux[25:24] gate 31 */
+	CCU_TBL_DIV_MUX_GATE(CLK_MBUS, "mbus", mbus_parents, 0x15c,
+			     0, 3, 24, 2, BIT(31), CRIT),
+
+	/* Bus gates; each reset is the same bit of the paired reset register */
+	CCU_TBL_GATE(CLK_BUS_DMA, "bus-dma", CLK_AHB1, 0x060, 6, RST_BUS_DMA),
+	CCU_TBL_GATE(CLK_BUS_SDMMC0_BUS, "bus-sdmmc0-bus", CLK_AHB1, 0x060, 8,
+		     RST_BUS_MMC0),
+	CCU_TBL_GATE(CLK_BUS_SDMMC1_BUS, "bus-sdmmc1-bus", CLK_AHB1, 0x060, 9,
+		     RST_BUS_MMC1),
+	CCU_TBL_GATE(CLK_BUS_SDMMC2_BUS, "bus-sdmmc2-bus", CLK_AHB1, 0x060, 10,
+		     RST_BUS_MMC2),
+	CCU_TBL_GATE(CLK_BUS_SDMMC3_BUS, "bus-sdmmc3-bus", CLK_AHB1, 0x060, 11,
+		     RST_BUS_MMC3),
+	CCU_TBL_GATE(CLK_BUS_NAND, "bus-nand", CLK_AHB1, 0x060, 13,
+		     RST_BUS_NAND),
+	CCU_TBL_GATE(CLK_BUS_SDRAM, "bus-sdram", CLK_AHB1, 0x060, 14,
+		     RST_BUS_DRAM),
+	CCU_TBL_GATE(CLK_BUS_PSRAM, "bus-psram", CLK_AHB1, 0x060, 15,
+		     RST_BUS_PSRAM),
+	CCU_TBL_GATE(CLK_BUS_SPI0, "bus-spi0", CLK_AHB1, 0x060, 20, RST_BUS_SPI0),
+	CCU_TBL_GATE(CLK_BUS_SPI1, "bus-spi1", CLK_AHB1, 0x060, 21, RST_BUS_SPI1),
+	CCU_TBL_GATE(CLK_BUS_SPI2, "bus-spi2", CLK_AHB1, 0x060, 22, RST_BUS_SPI2),
+	CCU_TBL_GATE(CLK_BUS_USBOTG, "bus-usbotg", CLK_AHB1, 0x060, 24,
+		     RST_BUS_OTG),
+	CCU_TBL_GATE(CLK_BUS_USBEHCI0, "bus-usbehci0", CLK_AHB1, 0x060, 26,
+		     RST_BUS_EHCI0),
+	CCU_TBL_GATE(CLK_BUS_USBOHCI0, "bus-usbohci0", CLK_AHB1, 0x060, 29,
+		     RST_BUS_OHCI0),
+	CCU_TBL_GATE(CLK_BUS_TCON0, "bus-tcon0", CLK_AHB1, 0x064, 4,
+		     RST_BUS_TCON0),
+	/* csi_s, csi_m and csi_misc share one bus gate, as on the A64. */
+	CCU_TBL_GATE(CLK_BUS_CSI, "bus-csi", CLK_AHB1, 0x064, 8, RST_BUS_CSI),
+	CCU_TBL_GATE(CLK_BUS_DE, "bus-de", CLK_AHB1, 0x064, 12, RST_BUS_DE),
+	CCU_TBL_GATE(CLK_BUS_EE, "bus-ee", CLK_AHB1, 0x064, 13, RST_BUS_EE),
+	CCU_TBL_GATE(CLK_BUS_ADDA, "bus-adda", CLK_APB1, 0x068, 0, RST_BUS_ADDA),
+	CCU_TBL_GATE(CLK_BUS_SPDIF, "bus-spdif", CLK_APB1, 0x068, 1,
+		     RST_BUS_SPDIF),
+	CCU_TBL_GATE(CLK_BUS_DSD, "bus-dsd", CLK_APB1, 0x068, 2, RST_BUS_DSD),
+	CCU_TBL_GATE(CLK_BUS_DMIC, "bus-dmic", CLK_APB1, 0x068, 3, RST_BUS_DMIC),
+	CCU_TBL_GATE(CLK_BUS_PIO, "bus-pio", CLK_APB1, 0x068, 5, CCU_TBL_NO_RST),
+	CCU_TBL_GATE(CLK_BUS_THS, "bus-ths", CLK_APB1, 0x068, 8, RST_BUS_THS),
+	CCU_TBL_GATE(CLK_BUS_KEYADC, "bus-keyadc", CLK_APB1, 0x068, 9,
+		     RST_BUS_KEYADC),
+	CCU_TBL_GATE(CLK_BUS_GPADC, "bus-gpadc", CLK_APB1, 0x068, 10,
+		     RST_BUS_GPADC),
+	CCU_TBL_GATE(CLK_BUS_I2S0, "bus-i2s0", CLK_APB1, 0x068, 12, RST_BUS_I2S0),
+	CCU_TBL_GATE(CLK_BUS_I2S1, "bus-i2s1", CLK_APB1, 0x068, 13, RST_BUS_I2S1),
+	CCU_TBL_GATE(CLK_BUS_TWI0, "bus-twi0", CLK_APB2, 0x06c, 0, RST_BUS_I2C0),
+	CCU_TBL_GATE(CLK_BUS_TWI1, "bus-twi1", CLK_APB2, 0x06c, 1, RST_BUS_I2C1),
+	CCU_TBL_GATE(CLK_BUS_TWI2, "bus-twi2", CLK_APB2, 0x06c, 2, RST_BUS_I2C2),
+	CCU_TBL_GATE(CLK_BUS_UART0, "bus-uart0", CLK_APB2, 0x06c, 16,
+		     RST_BUS_UART0),
+	CCU_TBL_GATE(CLK_BUS_UART1, "bus-uart1", CLK_APB2, 0x06c, 17,
+		     RST_BUS_UART1),
+	CCU_TBL_GATE(CLK_BUS_UART2, "bus-uart2", CLK_APB2, 0x06c, 18,
+		     RST_BUS_UART2),
+	CCU_TBL_GATE(CLK_BUS_UART3, "bus-uart3", CLK_APB2, 0x06c, 19,
+		     RST_BUS_UART3),
+	CCU_TBL_GATE(CLK_BUS_UART4, "bus-uart4", CLK_APB2, 0x06c, 20,
+		     RST_BUS_UART4),
+	CCU_TBL_GATE(CLK_BUS_UART5, "bus-uart5", CLK_APB2, 0x06c, 21,
+		     RST_BUS_UART5),
+	/* losc_out is the RTC's osc32k-out */
+};
+
+/* Resets without a bus gate */
+static const struct ccu_reset_map sun8i_b288_resets[RST_NUMBER] = {
+	[RST_USBPHY0]	= { 0x0cc, BIT(0) },
+	[RST_MBUS]	= { 0x0fc, BIT(31) },
+	[RST_BUS_WLAN]	= { 0x2c4, BIT(1) },
+};
+
+static const struct sunxi_ccu_table sun8i_b288_ccu_table = {
+	.gen		= &ccu_tbl_gen_a31,
+	.clks		= sun8i_b288_clks,
+	.num_clks	= CLK_NUMBER,
+	.resets		= sun8i_b288_resets,
+	.num_resets	= RST_NUMBER,
+};
+
+static const struct of_device_id sun8i_b288_ccu_ids[] = {
+	{
+		.compatible	= "allwinner,sun8i-b288-ccu",
+		.data		= &sun8i_b288_ccu_table,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sun8i_b288_ccu_ids);
+
+static struct platform_driver sun8i_b288_ccu_driver = {
+	.probe	= sunxi_ccu_table_platform_probe,
+	.driver	= {
+		.name			= "sun8i-b288-ccu",
+		.suppress_bind_attrs	= true,
+		.of_match_table		= sun8i_b288_ccu_ids,
+	},
+};
+module_platform_driver(sun8i_b288_ccu_driver);
+
+MODULE_IMPORT_NS("SUNXI_CCU");
+MODULE_DESCRIPTION("Allwinner B288 (sun8iw10p1) CCU driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-b288.h b/drivers/clk/sunxi-ng/ccu-sun8i-b288.h
new file mode 100644
index 000000000000..976e205f4d95
--- /dev/null
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-b288.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _CCU_SUN8I_B288_H_
+#define _CCU_SUN8I_B288_H_
+
+#include <dt-bindings/clock/sun8i-b288-ccu.h>
+#include <dt-bindings/reset/sun8i-b288-ccu.h>
+
+#define CLK_NUMBER		(CLK_MMC1_OUTPUT + 1)
+#define RST_NUMBER		(RST_BUS_KEYADC + 1)
+
+#endif /* _CCU_SUN8I_B288_H_ */
-- 
2.52.0

