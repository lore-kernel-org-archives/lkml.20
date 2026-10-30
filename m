Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793401619;
	b=ogUzUuDA132sD2lOm/pPMh1rcojRDbKRxROaijpa/iZIPaJDL1qAGe0KexGCQYyzR/Vt
	 bogxSTCbQqXDZmy72Ypg0fKV+d7OTE+21rO0RJqKc1H+EVJvh3gk+WMYmfap+E4yV+d2M
	 5SnH+LhgG52KjFvP2BcdN6TZmhhk5Q1HehLy8hyLxldFGn5BczyxCewTTZrkQS4pC9aHD
	 SQ1vuYNuVO9n9oHkqDNKg99dN0jEeW6OnX0mWYgLUQw6Knt5ST6k/Dqd18AT6PmMO0aOL
	 cf+cHmAsFhcHGYcfRKuOXw59DqMoZ8FwoFVqrk28FJgEdXtmfriq08XWb9QBNqzcx2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793401619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jkr/MExl/h9Ffvm2Dl+YvUyWJ/qkIg+g22Ak07CjG0w=;
	b=S7/X4DtePsFKUDI//AgjhD1xwt+WfqIovP27B2I9Zo64PxjmYxbxFzrYy5y0moZ5eG1l
	 uBpPY/bZlQYAd1rowl0AhQdXGatZjTwf/gy0dmy0Ri5r9I4xfW3kNi7p3ZgHI+001A7Mj
	 y/bDv8Lqua6Jkx/lZ10bWgX6Ld4rPxh1jT2ucfdI/dfwXcDBj4+tALzOM3IU4h4tNJGjc
	 eqjVI7XQb/9U6TKGzltAw9zWc+5CQXV3VsvciXyCxDdb+U5kT4/5ymqYzpbwAp7Tvnezb
	 yDDBVVeSoH7SUFolyLTwJb/NRKlbWj+TWH/pfmNS1j3yW/K6brzzIcJiBULvPs0yXhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ocjQ8Qvc;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B8C606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 23:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2B8C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ocjQ8Qvc
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so860182a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793401618; x=1794006418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jkr/MExl/h9Ffvm2Dl+YvUyWJ/qkIg+g22Ak07CjG0w=;
        b=ocjQ8QvcY4R3WIfeNPMNfGN0d5jvGeV/U5kWwLjZs4mzmjQuyREQ0bbe5Aw8eBduWQ
         BkmO2bEvGTQI7Wmk0L8uEfOFv2WOgj2kJ9l4xqqQE+XAl13jNPBgADnh41lpWJxZbN+B
         GWWFvl2VfIZaGwgnTKSYLcH3SFAvwMZ3jn4ZYUYa2cyVV5AMfd366C3bNWLH/RVlVaqy
         7igXKWWmmcNl7CxqvdAoq+ZF3jBVTjYO+EJ2RPpDL9NXCvlG/4hj1JtETmwqAsHqoxTb
         dVtYjvF3nYzCTO5B5wNs6jLX2fExKflCdx1pU/o4TgNwJjbUyP0t2qRhyVGp+8aG15ax
         8Ang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793401618; x=1794006418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jkr/MExl/h9Ffvm2Dl+YvUyWJ/qkIg+g22Ak07CjG0w=;
        b=s+1q1ECTPFLcymW6pG0b7StzOYIyLy1ruvzUViTO2qgpYQ/GF5hR6jnzmFDumNeHdw
         NILgCbaB+KR10XyX6s67QbCNLezB46sjDZc9l8BiHcR45aLQqVhOobvndgfa5y+i1SCl
         RObfk4WsbTjrnkeeaxubxz12E9aMpbMwuBJerSxu4OeSo6vIPPXz4kMsDYwzdvKYRmXX
         VutvawXnxPW2bC+SfS9uGKzNsMNU34C+eqmQE8/k3oF4C//4YQ8Xi6vFfdStXOde5DN+
         WnnLFOFC2rsqZzUe/z9rAUo9pv679qsACWs4Ocp5WI1xy7QyN5CtdAeNvtkNjZshiEHX
         ekkQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3Th0tIZB06a7liliGkyREGkAnwJivNYXEyJnmax/WDzWjmxpEIM3qtNBs/YNMH5ZqWyLeuCQ0XO0mw4g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRJDX9u/6hd5KUWiEuoQ0sIMzdPdKppWEdB+7birY9cRlvsMHK
	q8XBPk9eoJhcB0FPu7y+/QOy4jehnGwT5yofmsh8FpwLr2i1R2QxlON4
X-Gm-Gg: AYBFou00hKf0t7iDD69nhc4KX4zTEXgsxyPWGmY7/TpuFfbNYU8+9h1idtwHVv4kIC4
	Sxyr78wL0MS1IT0KzVXjS82BnQarud4QgcrSw67qVeIUHbfqC7bAHbiP0P7Z65ZQ/3MsY+Q5YkG
	sxNJmvwfwFm3rgrAuCpsYfjBK13l6jyg+0+/g5/9AqTvnUy0hf2ivnvxjEQWCUVp4vlXRcD5D3o
	a2ktS7G5tvCGKANtwlAAWkLPwrmteMiO/ONE9ROLF2XN+HZ31lul3UtL+ChQ3pFrGwBLIC2E7Zn
	g0nMLZhbGe7xTrHfZ3YqWmK33En9iBAmFcxWxhS4UMDnYVgCFIGpfkcPgSzWr5e1aM0petfRIFe
	07TEe/YmAbTCAVCCN2EjmEv3N9S1iqx6a6W5QvyqOXLGQO08d89+57xPnnPVmyvJGK86qm8Mtm5
	5nN3Ew/fZf0PerLXnYRMK0A5o/4jhKKfNXqHOUUwpDL3Q9LM57lfVuPJPxG7UeiElKQSYQAoVWX
	ZBZKr4wo0EB7Hav0pHkmBawLTsaZbjvxkUUPmeT75ZnFJO25saDdrE0BJSR31UsVH8XWXzcQB5T
	zBOsDMUJyW7QIapUIqGV0q7UI2DkmAX56E1+/RNl6awL1AKMPJJMN3aRSxvL53igCwVibrMzu6+
	IB7sOSfus
X-Received: by 2002:a17:90b:268d:b0:3a5:147a:3b63 with SMTP id 98e67ed59e1d1-3ae895a5bdemr2863341a91.8.1793401617933;
        Fri, 30 Oct 2026 16:06:57 -0700 (PDT)
Received: from archlinux (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845aa27esm5322736a91.11.2026.10.30.16.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 16:06:57 -0700 (PDT)
From: Artem Novak <artem122novak@gmail.com>
To: glaubitz@physik.fu-berlin.de,
	dalias@libc.org
Cc: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-sh@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v2] sh: sh7305: add TMU0 clock support
Date: Fri, 30 Oct 2026 17:06:46 -0600
Message-ID: <20261030230646.709687-1-artem122novak@gmail.com>
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

update: SH7305 TMU device tree node will use the
renesas,tmu-sh7305 compatible.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/sh/Kconfig                        |  2 +-
 arch/sh/boot/dts/sh7305.dtsi           |  2 +-
 arch/sh/kernel/cpu/sh4a/clock-sh7305.c | 78 +++++++++++++++++++-------
 3 files changed, 60 insertions(+), 22 deletions(-)

diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 5ce7df11c3ec..315a1d6ee452 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -532,7 +532,7 @@ config SH_CLK_CPG
 	def_bool y
 
 config SH_CLK_CPG_LEGACY
-	depends on SH_CLK_CPG
+	depends on SH_CLK_CPG && !CPU_SUBTYPE_SH7305
 	def_bool y if !CPU_SUBTYPE_SH7785 && !ARCH_SHMOBILE && \
 		      !CPU_SHX3 && !CPU_SUBTYPE_SH7757 && \
 		      !CPU_SUBTYPE_SH7734 && !CPU_SUBTYPE_SH7264 && \
diff --git a/arch/sh/boot/dts/sh7305.dtsi b/arch/sh/boot/dts/sh7305.dtsi
index e7dd8b15445d..501b166554b0 100644
--- a/arch/sh/boot/dts/sh7305.dtsi
+++ b/arch/sh/boot/dts/sh7305.dtsi
@@ -30,7 +30,7 @@ intc: interrupt-controller {
 	 * hardware. Clock provider integration is still required.
 	 */
 	tmu0: timer@a4490000 {
-		compatible = "renesas,sh7305-tmu", "renesas,tmu";
+		compatible = "renesas,tmu-sh7305", "renesas,tmu";
 		reg = <0xa4490000 0x2c>;
 		interrupts = <0x400>, <0x420>, <0x440>;
 		interrupt-names = "tuni0", "tuni1", "tuni2";
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

