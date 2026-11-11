Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794359239;
	b=ZOxVM8OAMlKn1YICmUyg0GnOEBsDIqIw/B9PG59dUq7FwL2kU/1T0J6dNtiV/mshsulX
	 55iLFjGu8EO/EY/5vkGYn6Kv/k2kGvIsHy43UI4F2LXlHj8kEzto7qgOZa+nfYP40tfJU
	 gVDXhEps5XjDui2CWiRz1pwJFGhmwWGbnJL8mlLjsD5In9OKskFNvp2lQDP2uhkKWcSnS
	 Gyj55fDvWHQW4VJ5mI6A0aZD1mt9+b6f1fdUO8HQC9AxCpllHGCgy0+xMdH/LDqvNGq5W
	 S3c3ZrURDAM61avfiRpS27WrEpfKEIr6cijt17jNC7kwKNnrrLpPbq/7EgaEC1sRw/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794359239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ToK+iR8w3wDaa5NXwZCWSs8d2l9SzJJLzelf57++HEI=;
	b=TTcffC2zCf3kh90P6pBz3ZoeEBjKNufz/0L1yGus1klaK/+s9W6e1frdDqVZWVbYTg4w
	 1aaxCiLNJ7tZ/0tRal9lS8vl4D593sTpvhh6u1scS/HBc99VxAgkREtuDm2PsmPtMEHMn
	 FbjF98GsMLuP6XA18VJAWrgniXy4LMR3l/AGm0EripPVzdT4KAeKYIIwPF6G1EwcruTDS
	 HUqfgg3O3wE36ydXbM8C1XjNCW9uxpt133k2AUWXSQRjQWWRZDeGiCmDypwy7VfBy9M8T
	 Xm5SqCjLV5uT2HzQg/C7gNYYJsu9yKkkR6VWB2i+4I2QXYD/YiIMwTj6bu7hVOZND/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GKmrTV/a";
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C27606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62C27606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GKmrTV/a
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdd4dafdce9so1087160a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794359239; x=1794964039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ToK+iR8w3wDaa5NXwZCWSs8d2l9SzJJLzelf57++HEI=;
        b=GKmrTV/aBoY3AgozSvxPrGMJWFyVuri9g1qzqqHoIOgBIajOClz9w+BtF1Eb6W4i2j
         QuLxGWloT0KXsv5Bz+g+v1zJ9gu3X5lmd7gi+ORzExtfNyJpBjEvuj2aIkwgp3DXLzxf
         sKgHmbH8Nu/keEmfKgNUgeEyTHUwJUltr8wSsw02nbCRJb/sLctBBgCy/JsNpnoOYe9v
         MzQ0+EMsJ82wzUBLs0YEfqCecfKktJwJH+jaB+J4zC/tfxI9gp+7F0lRtF1Yq29x5f3W
         LUyLupX9pnRgOdPqsrkm3sWu12qF3tDV02FhmveL+dzM7Om6P6m6B5sHsAYpSyO5V+L0
         IhbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794359239; x=1794964039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ToK+iR8w3wDaa5NXwZCWSs8d2l9SzJJLzelf57++HEI=;
        b=qton8udabKgsKWlaDG37UPbJlOEMF4hOTdD0FujlqumKBSCcm/Lv/2TW/pPBs4o5FK
         uky9URiZ8IMpmR3ZnkX/mTE+SvuODAVOJNbubU4pS1sKpB+V1Y60I7WNY8t76rp6HQGT
         x44EzDL+4inElSVO896uFpQNqZ3C8jg3bTo4vaMfzGW2lIV+MDGg1yLV4fv8m5UPwdrh
         ztzVZqNw94CpN1bl+KpnqzjpkqjJEqGV2pT6FwssMktcWt9jC1qBZSGQuW1HdLHECJMC
         kFFpm7MhnuSXBjYFoZHzxKNdzecrSBG5cHR1crWch/CjeYvSi/LMPN+2Kj/w5fqu1Oa6
         cfdg==
X-Forwarded-Encrypted: i=1; AL+hErHs/6/PZ53uFmiOVskeXcFi5Rk9FyuLt5tc9oSK7G/wZ/jDx+0xWyWgC3JMzyprithhg167LmTZnVMB+IU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RnQYdGwJZD5Mftp7nie9v1yK5Tq630+oIi/wGCLJ+iK7Y91xS
	EsEiVGy3716gsvNTWUyYJPbgiyWVW6VFcU7D+borTcc3lGp0ybpbCB0u
X-Gm-Gg: AYBFou2i3lLeCJKNTASZL24IVBpDL68KcM4ToXzPwAq1ZAgXlmZdo/Tkcjvh7tGaRyI
	2MK6Q9VbeXeKbpZy9jFhiVTWG5kD9kqyAjSAJx37MbIZzQW5rS29APRZE9VSKxO+5tym4/vYu1d
	SoWlCRgv5Wc7+kOpionQb0OzlFJCYe8S+xhWridRq//d28W3VO99FqNTDjBgAYq9CNk2JSkUEPS
	is+FRs1gVuq4Z/7abDPlZ50hi1yROVI5ImG9Y+RrAQurc9hjn6lmq3SWW8e747tirpAyY137+4E
	XDIKn4MGSMQOjsUXCdLVq+prxUXtqTVLmqw5MMPdzy5ffLq5D0XuD8Xdwgf1O/YcXi+4eyN582p
	JOA8cA3ewOyzFgbH0pWyAeGNoJUyK7jiG5h9JaR66VEkRVOAtIht7vtz6xoyiRt7wsy/BNRG7H5
	HD/OI3GQc8Ik1CsaJO80RZAU5HLiJntn3Ghw0sURwBmfebiTZmk8csTDAG1oRgRkFCsfCjaIgAw
	QSR+ixJlatKZcd9UdIFuynFccnS16mfNNuEjmEwsoJLciI6gH6MYkTZrVZgXb+J8f9K/N2DekT+
	VskKxhVGsbxQwJLfH4k3ibzPGYSgjxUflzX0J9ILkqgABLXXasChTNYZWKswkvKuIsHSjGqaj3W
	sWHXySUO/RQ==
X-Received: by 2002:a17:90a:dfd0:b0:3a8:a98c:ea07 with SMTP id 98e67ed59e1d1-3b182e6a121mr545395a91.13.1794359238511;
        Tue, 10 Nov 2026 17:07:18 -0800 (PST)
Received: from fedora.lan (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm701711a91.1.2026.11.10.17.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 17:07:18 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: ysato@users.sourceforge.jp,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de,
	geert+renesas@glider.be
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v4 1/2] sh: sh7305: add TMU0 clock support
Date: Tue, 10 Nov 2026 19:07:13 -0600
Message-ID: <20261111010714.227429-2-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111010714.227429-1-artem122novak@gmail.com>
References: <20261111010714.227429-1-artem122novak@gmail.com>
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

Convert the SH7305 clock implementation to the Common Clock
Framework.

Register the master clock and the CPU, bus and peripheral
divider clocks, and add the TMU0 module clock gate.

Provide a clkdev mapping for the TMU0 functional clock so
the TMU driver can acquire it through its existing clock
lookup.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/sh/include/asm/clock-sh7305.h     |  11 ++
 arch/sh/kernel/cpu/sh4a/clock-sh7305.c | 262 +++++++++++++++++--------
 2 files changed, 195 insertions(+), 78 deletions(-)
 create mode 100644 arch/sh/include/asm/clock-sh7305.h

diff --git a/arch/sh/include/asm/clock-sh7305.h b/arch/sh/include/asm/clock-sh7305.h
new file mode 100644
index 000000000000..2ef73845eacc
--- /dev/null
+++ b/arch/sh/include/asm/clock-sh7305.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_SH_CLOCK_SH7305_H
+#define __ASM_SH_CLOCK_SH7305_H
+
+#include <linux/init.h>
+
+int __init sh7305_clk_init(void);
+
+void __init sh7305_of_setup(char **cmdline_p);
+
+#endif /* __ASM_SH_CLOCK_SH7305_H */
diff --git a/arch/sh/kernel/cpu/sh4a/clock-sh7305.c b/arch/sh/kernel/cpu/sh4a/clock-sh7305.c
index 0e683dd6de11..fc941524c268 100644
--- a/arch/sh/kernel/cpu/sh4a/clock-sh7305.c
+++ b/arch/sh/kernel/cpu/sh4a/clock-sh7305.c
@@ -4,12 +4,15 @@
  * Renesas SH7305 clock framework support
  */
 
+#include <linux/clk-provider.h>
+#include <linux/clkdev.h>
+#include <linux/err.h>
 #include <linux/init.h>
-#include <linux/kernel.h>
 #include <linux/io.h>
-#include <linux/sh_clk.h>
+#include <linux/kernel.h>
+#include <linux/spinlock.h>
 
-#include <asm/clock.h>
+#include <asm/clock-sh7305.h>
 
 /*
  * SH7305 Clock Pulse Generator
@@ -17,6 +20,7 @@
 #define SH7305_FRQCR		0xa4150000
 #define SH7305_PLLCR		0xa4150024
 #define SH7305_FLLFRQ		0xa4150050
+#define SH7305_MSTPCR0		0xa4150030
 
 /*
  * FRQCR:
@@ -34,34 +38,28 @@
  *   FLF   bits 10..0
  */
 
+static void __iomem *sh7305_cpg_base;
+
 static unsigned long sh7305_base_rate(void)
 {
-	u32 frqcr  = __raw_readl(SH7305_FRQCR);
-	u32 pllcr  = __raw_readl(SH7305_PLLCR);
-	u32 fllfrq = __raw_readl(SH7305_FLLFRQ);
-
-	unsigned int pll;
-	unsigned int fll;
+	u32 frqcr = __raw_readl(sh7305_cpg_base);
+	u32 pllcr = __raw_readl(sh7305_cpg_base + (SH7305_PLLCR - SH7305_FRQCR));
+	u32 fllfrq = __raw_readl(sh7305_cpg_base + (SH7305_FLLFRQ - SH7305_FRQCR));
+	unsigned int pll, fll;
 	unsigned long rate = 32768;
 
-	/*
-	 * SH7305 PLL ratio is STC + 1.
-	 * Unlike SH7724 it must NOT be doubled.
-	 */
+	/* SH7305 PLL ratio is STC + 1; it is not doubled. */
 	pll = ((frqcr >> 24) & 0x3f) + 1;
 
-	/*
-	 * FLL ratio is FLF, halved when SELXM == 1.
-	 */
+	/* FLL ratio is FLF, halved when SELXM == 1. */
 	fll = fllfrq & 0x7ff;
-
 	if (((fllfrq >> 14) & 0x3) == 1)
 		fll >>= 1;
 
-	if (pllcr & (1 << 12))
+	if (pllcr & BIT(12))
 		rate *= fll;
 
-	if (pllcr & (1 << 14))
+	if (pllcr & BIT(14))
 		rate *= pll;
 
 	return rate;
@@ -69,98 +67,206 @@ static unsigned long sh7305_base_rate(void)
 
 static unsigned int sh7305_divisor(unsigned int shift)
 {
-	u32 frqcr = __raw_readl(SH7305_FRQCR);
+	u32 frqcr = __raw_readl(sh7305_cpg_base);
 	unsigned int field = (frqcr >> shift) & 0xf;
 
-	/*
-	 * SH7305 divider:
-	 *
-	 *     divisor = 2^(field + 1)
-	 */
 	return 1U << (field + 1);
 }
 
-
 /*
- * master_clk is the clock before the B/I/P divider stages.
+ * Master clock: the clock before the B/I/P divider stages.
  */
-static void master_clk_init(struct clk *clk)
+static unsigned long sh7305_master_recalc_rate(struct clk_hw *hw,
+					       unsigned long parent_rate)
 {
-	clk->rate = sh7305_base_rate();
+	return sh7305_base_rate();
 }
 
-static struct sh_clk_ops sh7305_master_clk_ops = {
-	.init = master_clk_init,
+static const struct clk_ops sh7305_master_clk_ops = {
+	.recalc_rate = sh7305_master_recalc_rate,
 };
 
+static const struct clk_init_data sh7305_master_clk_init = {
+	.name = "master_clk",
+	.ops = &sh7305_master_clk_ops,
+};
+
+static struct clk_hw sh7305_master_clk = {
+	.init = &sh7305_master_clk_init,
+};
 
 /*
- * Pphi - peripheral clock.
- *
- * P1FC occupies FRQCR bits 3..0.
+ * Peripheral, bus and CPU clocks share the master clock as parent.
  */
-static unsigned long peripheral_clk_recalc(struct clk *clk)
+struct sh7305_divider {
+	struct clk_hw hw;
+	unsigned int shift;
+};
+
+static unsigned long sh7305_divider_recalc_rate(struct clk_hw *hw,
+						unsigned long parent_rate)
 {
-	return clk->parent->rate / sh7305_divisor(0);
+	struct sh7305_divider *divider =
+		container_of(hw, struct sh7305_divider, hw);
+
+	return parent_rate / sh7305_divisor(divider->shift);
 }
 
-static struct sh_clk_ops sh7305_peripheral_clk_ops = {
-	.recalc = peripheral_clk_recalc,
+static const struct clk_ops sh7305_divider_clk_ops = {
+	.recalc_rate = sh7305_divider_recalc_rate,
 };
 
+static const char * const sh7305_parent_names[] = {
+	"master_clk",
+};
 
-/*
- * Bphi - bus clock.
- *
- * BFC occupies FRQCR bits 11..8.
- */
-static unsigned long bus_clk_recalc(struct clk *clk)
-{
-	return clk->parent->rate / sh7305_divisor(8);
-}
+static const struct clk_init_data sh7305_peripheral_clk_init = {
+	.name = "peripheral_clk",
+	.ops = &sh7305_divider_clk_ops,
+	.parent_names = sh7305_parent_names,
+	.num_parents = ARRAY_SIZE(sh7305_parent_names),
+};
 
-static struct sh_clk_ops sh7305_bus_clk_ops = {
-	.recalc = bus_clk_recalc,
+static struct sh7305_divider sh7305_peripheral_clk = {
+	.hw.init = &sh7305_peripheral_clk_init,
+	.shift = 0,
 };
 
+static const struct clk_init_data sh7305_bus_clk_init = {
+	.name = "bus_clk",
+	.ops = &sh7305_divider_clk_ops,
+	.parent_names = sh7305_parent_names,
+	.num_parents = ARRAY_SIZE(sh7305_parent_names),
+};
 
-/*
- * Iphi - CPU/internal clock.
- *
- * IFC occupies FRQCR bits 23..20.
- */
-static unsigned long cpu_clk_recalc(struct clk *clk)
-{
-	return clk->parent->rate / sh7305_divisor(20);
-}
+static struct sh7305_divider sh7305_bus_clk = {
+	.hw.init = &sh7305_bus_clk_init,
+	.shift = 8,
+};
 
-static struct sh_clk_ops sh7305_cpu_clk_ops = {
-	.recalc = cpu_clk_recalc,
+static const struct clk_init_data sh7305_cpu_clk_init = {
+	.name = "cpu_clk",
+	.ops = &sh7305_divider_clk_ops,
+	.parent_names = sh7305_parent_names,
+	.num_parents = ARRAY_SIZE(sh7305_parent_names),
 };
 
+static struct sh7305_divider sh7305_cpu_clk = {
+	.hw.init = &sh7305_cpu_clk_init,
+	.shift = 20,
+};
 
-/*
- * Ordering must match arch/sh/kernel/cpu/clock-cpg.c:
- *
- *   0 master
- *   1 peripheral
- *   2 bus
- *   3 cpu
- */
-static struct sh_clk_ops *sh7305_clk_ops[] = {
-	&sh7305_master_clk_ops,
-	&sh7305_peripheral_clk_ops,
-	&sh7305_bus_clk_ops,
-	&sh7305_cpu_clk_ops,
+static struct clk_hw *sh7305_main_clks[] = {
+	&sh7305_master_clk,
+	&sh7305_peripheral_clk.hw,
+	&sh7305_bus_clk.hw,
+	&sh7305_cpu_clk.hw,
 };
 
-void __init arch_init_clk_ops(struct sh_clk_ops **ops, int idx)
+static const struct {
+	struct clk_hw *hw;
+	const char *con_id;
+} sh7305_clk_lookups[] = {
+	{ &sh7305_master_clk, "master_clk" },
+	{ &sh7305_peripheral_clk.hw, "peripheral_clk" },
+	{ &sh7305_bus_clk.hw, "bus_clk" },
+	{ &sh7305_cpu_clk.hw, "cpu_clk" },
+};
+
+#define SH7305_MAIN_CLK_COUNT	ARRAY_SIZE(sh7305_main_clks)
+#define SH7305_LOOKUP_COUNT	(SH7305_MAIN_CLK_COUNT + 1)
+
+static struct clk_lookup *sh7305_lookups[SH7305_LOOKUP_COUNT];
+static struct clk_hw *sh7305_tmu0_clk;
+
+static DEFINE_SPINLOCK(sh7305_mstp_lock);
+
+static void sh7305_clk_unregister_lookups(void)
 {
-	if (idx < ARRAY_SIZE(sh7305_clk_ops))
-		*ops = sh7305_clk_ops[idx];
+	int i;
+
+	for (i = SH7305_LOOKUP_COUNT - 1; i >= 0; i--) {
+		if (sh7305_lookups[i]) {
+			clkdev_drop(sh7305_lookups[i]);
+			sh7305_lookups[i] = NULL;
+		}
+	}
 }
 
-int __init arch_clk_init(void)
+static void sh7305_clk_unregister_all(unsigned int registered)
 {
-	return cpg_clk_init();
+	/* Remove clkdev references before unregistering their clocks. */
+	sh7305_clk_unregister_lookups();
+
+	if (sh7305_tmu0_clk) {
+		clk_hw_unregister_gate(sh7305_tmu0_clk);
+		sh7305_tmu0_clk = NULL;
+	}
+
+	while (registered--)
+		clk_hw_unregister(sh7305_main_clks[registered]);
+
+	if (sh7305_cpg_base) {
+		iounmap(sh7305_cpg_base);
+		sh7305_cpg_base = NULL;
+	}
+}
+
+int __init sh7305_clk_init(void)
+{
+	unsigned int i, registered = 0;
+	int ret;
+
+	sh7305_cpg_base = ioremap(SH7305_FRQCR,
+				  SH7305_FLLFRQ - SH7305_FRQCR + sizeof(u32));
+	if (!sh7305_cpg_base)
+		return -ENOMEM;
+
+	for (i = 0; i < SH7305_MAIN_CLK_COUNT; i++) {
+		ret = clk_hw_register(NULL, sh7305_main_clks[i]);
+		if (ret)
+			goto err_unregister;
+
+		registered++;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(sh7305_clk_lookups); i++) {
+		sh7305_lookups[i] =
+			clkdev_hw_create(sh7305_clk_lookups[i].hw,
+					 sh7305_clk_lookups[i].con_id, NULL);
+		if (!sh7305_lookups[i]) {
+			ret = -ENOMEM;
+			goto err_unregister;
+		}
+	}
+
+	/*
+	 * MSTPCR0 bit 15 is active-high stop control.
+	 * CLK_GATE_SET_TO_DISABLE describes this polarity without
+	 * changing the hardware state during registration.
+	 */
+	sh7305_tmu0_clk =
+		clk_hw_register_gate(NULL, "tmu0_fck", "peripheral_clk", 0,
+				     sh7305_cpg_base +
+				     (SH7305_MSTPCR0 - SH7305_FRQCR),
+				     15, CLK_GATE_SET_TO_DISABLE,
+				     &sh7305_mstp_lock);
+	if (IS_ERR(sh7305_tmu0_clk)) {
+		ret = PTR_ERR(sh7305_tmu0_clk);
+		sh7305_tmu0_clk = NULL;
+		goto err_unregister;
+	}
+
+	sh7305_lookups[SH7305_MAIN_CLK_COUNT] =
+		clkdev_hw_create(sh7305_tmu0_clk, "fck", "sh-tmu.0");
+	if (!sh7305_lookups[SH7305_MAIN_CLK_COUNT]) {
+		ret = -ENOMEM;
+		goto err_unregister;
+	}
+
+	return 0;
+
+err_unregister:
+	sh7305_clk_unregister_all(registered);
+	return ret;
 }
-- 
2.56.0

