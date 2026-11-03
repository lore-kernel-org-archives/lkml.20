Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667459;
	b=f71fO3KQpU6whvzGw/50S+QX/5aJVq6T58IladlU3bACIRSwqMrKYPilWAGxKTq32Q4I
	 CWUMAFiqR8ey3xox13jFT8hKR/8RvTERQ/BROIZFuboIN/PeuG6ONJSsM/gU/4rwcFp8j
	 x9gi/1B5hnd8VkBos4vn5bNem+qSLswJQXupD0eVHFS8zKkotgSkMMxJhCb5W1lgmOh+h
	 EXPGqlFUB6OVncTM176BXlTITjBZDxvT7SPKa0ZFiRbYQnH5bMfohmSJzAeOwwPuvTMTk
	 7Xnb6WzUJ1fMjS2SxyU64Ro8X/VkloJOeCzbCFmKJh1I2dUO2EREBA+ObUxZ1DCW+2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+2UKtwt9x18VdYCAR8wQw2Q9Kvi9rO1UD6jFCQWD72A=;
	b=puNN5hdIoui7h4KUQFvAGjA8/gnNVRoFOa1l0aGW5V8HhpxAlfNF7lD0VHt5XXum3PX7
	 M4ymhs7gCAxRmC9fxpHl0bknMgvuLi573nh8PNsQJxLbES6kyLP5o9AfMOOgu0U+ET9P8
	 BS9rIgOpiQr1T5jC3SD4Ya7zV0EugW6+yoGRstorMBT3G/1S9C9D47cEzWuGElAEqY7f5
	 lvClSXumn6ol9kX3yWDSuTmL8zGTNuHbPJxPkhMWI7vmXv8RDrNdCKC9SX0mgHXHuhKQN
	 8kJSGwCfhF3+CxtrzqLR7lIwjWpmNyDeIMqjKdOTetCw1H0r4eq8cY0VtQib8UMvmAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XsjO+6aX;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C276C606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C276C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XsjO+6aX
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso22186235ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793667458; x=1794272258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+2UKtwt9x18VdYCAR8wQw2Q9Kvi9rO1UD6jFCQWD72A=;
        b=XsjO+6aXkaIaFVChcZh88jLO5eIUKPLFIacVr+396eDBXm8EUjvI8v5UG1G1j9Xqg+
         B46l6ECyTDjY2Icx0PqjmIdSBZRCDTw5MfmNZfIUjBf3GTpODMnH3vbQFObHDa1TmX7f
         rMYldfyvF1fyWJZ26l7gxmL7G5TGuNI8XZK4/4DsjaTOIO7UFpy1c8RpXeiku5WwPiuE
         WsVjSU8LnXzAdP1ZHLf9YgD1mHCAUE7g+AfdFhUoqkVZNOvLk5EuCxtEMgeORxQN8Hjs
         Ov3uawyyjtWAFE3E2YIghd6fp6vLoETL1M/Hkps8bxfgoezKfa/Ljnq+rPEnMfddcnfw
         HAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793667458; x=1794272258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2UKtwt9x18VdYCAR8wQw2Q9Kvi9rO1UD6jFCQWD72A=;
        b=xKD4Ue+Bz0QBwr8j2mo+3v5x4mix4FRzlqlrAZZa+UiggX6ioLv3qbst8CRbO59/jd
         Nz3DK2g1FFVUlhR/isdNh6UcL0p2c46bbxRbh69vyeIkuakihLg/eXJP5EtC2cFSK50a
         UHmI7flTJVyxvzSNppsNDAmJZVWEHplxc1iZFw1vybUNQuLl2PIwMjhuqRhVq9gERF6U
         fClP9tQo45vld2PU9c2Lt4Nmkdzhs/25cwjnaluoRM+awnJrhzsMf9VrycuskHMXrzFO
         8lVlpIDCM5NoWovA9/GjYp/JNQPV9ZkRcJj8GcQ0mA0apUpKLl0iOGmMbCDJz7l3w+Ec
         Pcvg==
X-Forwarded-Encrypted: i=1; AKwUvBy5YSKU1mOUsBeENq6WSsveOZ5+rR1fgHARck816Vy3ZBrpfGUEEbEYqNeLfHQaurL5hcAGawscC4hyvAo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9B+hlYdLi15o39aw+BND14uNeDKFSb1cTe20HTXfTXUNVQR4mM
	z/A8JmtTbwSBlhV+gJJYVc8te69PeRWp/2M/qPAouriB23YK7XQ97nLOsAQ0wLkj
X-Gm-Gg: AYBFou1hMRiCbwE7HwaGPwXflYaMQfOCmJPoQhshTjmpawMyKaiR5ooTD/XXx1An39j
	pdw4h1ao8fxCJ97St2tK+ZdqOMee7W2C8ZpcAEKPOUH6c93yS5RjL0BVanFy1EETHqwgBxt0oYA
	mNPr+Ldyexf4CmZkjK2Cw2hlj4AsFRfqKw9Oj/LiaFE8EOgwMaEF3N2iuOiEbRFljyAaV06aP0z
	G8S4IZKa9gLYuQRNXGoS7HczYYtkOwkM6eFtKiCYso7vWBPMDz7fXz5qzYVqQUMbJbs0FszAv3D
	dVBmeTiu1QchQn6NH7e6MN0O7F9yotguVCjrPZgYHkj3jA+ew0JzzmwgO8cfgxQ/veM6671RYDF
	nnihwugTooAHIf7cOzCXDRfIj1EUveYBhfwq0xdT99bU/fQLftT02/Lt5mHctHLL34hsi9lWL7I
	dAHp+wKIK1QQaNYOmhcAi3MY//5elAA47NUnp70sILsN77XgBGnsQB4ZTsef3CtyagDqN014NdH
	IgT/chrDFWlMVvK43hcLdqIH4a/Q1E7EyiEvmi2jHYWGuZ7UCnHyWEPCoA8j0gFh3VmhTrYmuiy
	eXoKkOkqpnFKo7/K6RoEMy173s59B8OyzCSiohpj2DEw56FX1CX08cFBrr/599fFqFFe2xFijdz
	qbA1ZTImDiw==
X-Received: by 2002:a17:903:1251:b0:2df:9497:3c89 with SMTP id d9443c01a7336-2eb36526a09mr98398335ad.59.1793667458033;
        Mon, 02 Nov 2026 16:57:38 -0800 (PST)
Received: from fedora.lan (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39267b8asm32654855ad.44.2026.11.02.16.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 16:57:37 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: ysato@users.sourceforge.jp,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de,
	linux-sh@vger.kernel.org
Cc: geert+renesas@glider.be,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v3] sh: sh7305: add TMU0 clock support
Date: Mon,  2 Nov 2026 18:56:45 -0600
Message-ID: <20261103005645.101643-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Register the SH7305 master, peripheral, bus and CPU clocks using
the SuperH clock framework. Add the TMU0 module clock gate using
MSTPCR0 bit 15.

Keeping SH7305 clock initialization independent of the legacy CPG
initialization framework, which relies on arch_init_clk_ops().
Disable SH_CLK_CPG_LEGACY for SH7305.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/sh/Kconfig                        |  2 +-
 arch/sh/kernel/cpu/sh4a/clock-sh7305.c | 78 +++++++++++++++++++-------
 2 files changed, 59 insertions(+), 21 deletions(-)

diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 5ce7df11c3ec..c5cc486eb1a3 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -536,7 +536,7 @@ config SH_CLK_CPG_LEGACY
 	def_bool y if !CPU_SUBTYPE_SH7785 && !ARCH_SHMOBILE && \
 		      !CPU_SHX3 && !CPU_SUBTYPE_SH7757 && \
 		      !CPU_SUBTYPE_SH7734 && !CPU_SUBTYPE_SH7264 && \
-		      !CPU_SUBTYPE_SH7269
+		      !CPU_SUBTYPE_SH7269 && !CPU_SUBTYPE_SH7305
 
 endmenu
 
diff --git a/arch/sh/kernel/cpu/sh4a/clock-sh7305.c b/arch/sh/kernel/cpu/sh4a/clock-sh7305.c
index 0e683dd6de11..03d4b5f987dd 100644
--- a/arch/sh/kernel/cpu/sh4a/clock-sh7305.c
+++ b/arch/sh/kernel/cpu/sh4a/clock-sh7305.c
@@ -7,6 +7,8 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/io.h>
+#include <linux/clk.h>
+#include <linux/clkdev.h>
 #include <linux/sh_clk.h>
 
 #include <asm/clock.h>
@@ -84,13 +86,13 @@ static unsigned int sh7305_divisor(unsigned int shift)
 /*
  * master_clk is the clock before the B/I/P divider stages.
  */
-static void master_clk_init(struct clk *clk)
+static unsigned long master_clk_recalc(struct clk *clk)
 {
-	clk->rate = sh7305_base_rate();
+	return sh7305_base_rate();
 }
 
 static struct sh_clk_ops sh7305_master_clk_ops = {
-	.init = master_clk_init,
+	.recalc = master_clk_recalc,
 };
 
 
@@ -140,27 +142,63 @@ static struct sh_clk_ops sh7305_cpu_clk_ops = {
 
 
 /*
- * Ordering must match arch/sh/kernel/cpu/clock-cpg.c:
- *
- *   0 master
- *   1 peripheral
- *   2 bus
- *   3 cpu
+ * SH7305 main clocks.
  */
-static struct sh_clk_ops *sh7305_clk_ops[] = {
-	&sh7305_master_clk_ops,
-	&sh7305_peripheral_clk_ops,
-	&sh7305_bus_clk_ops,
-	&sh7305_cpu_clk_ops,
+static struct clk master_clk = {
+	.ops		= &sh7305_master_clk_ops,
+	.flags		= CLK_ENABLE_ON_INIT,
 };
 
-void __init arch_init_clk_ops(struct sh_clk_ops **ops, int idx)
-{
-	if (idx < ARRAY_SIZE(sh7305_clk_ops))
-		*ops = sh7305_clk_ops[idx];
-}
+static struct clk peripheral_clk = {
+	.ops		= &sh7305_peripheral_clk_ops,
+	.parent		= &master_clk,
+	.flags		= CLK_ENABLE_ON_INIT,
+};
+
+static struct clk bus_clk = {
+	.ops		= &sh7305_bus_clk_ops,
+	.parent		= &master_clk,
+	.flags		= CLK_ENABLE_ON_INIT,
+};
+
+static struct clk cpu_clk = {
+	.ops		= &sh7305_cpu_clk_ops,
+	.parent		= &master_clk,
+	.flags		= CLK_ENABLE_ON_INIT,
+};
+
+static struct clk *main_clks[] = {
+	&master_clk,
+	&peripheral_clk,
+	&bus_clk,
+	&cpu_clk,
+};
+
+#define MSTPCR0		0xa4150030
+
+static struct clk mstp_clks[] = {
+	SH_CLK_MSTP32(&peripheral_clk, MSTPCR0, 15, 0),
+};
+
+static struct clk_lookup lookups[] = {
+	CLKDEV_CON_ID("master_clk", &master_clk),
+	CLKDEV_CON_ID("peripheral_clk", &peripheral_clk),
+	CLKDEV_CON_ID("bus_clk", &bus_clk),
+	CLKDEV_CON_ID("cpu_clk", &cpu_clk),
+	CLKDEV_ICK_ID("fck", "sh-tmu.0", &mstp_clks[0]),
+};
 
 int __init arch_clk_init(void)
 {
-	return cpg_clk_init();
+	int i, ret = 0;
+
+	for (i = 0; !ret && i < ARRAY_SIZE(main_clks); i++)
+		ret = clk_register(main_clks[i]);
+
+	if (ret)
+		return ret;
+
+	clkdev_add_table(lookups, ARRAY_SIZE(lookups));
+
+	return sh_clk_mstp_register(mstp_clks, ARRAY_SIZE(mstp_clks));
 }
-- 
2.56.0

