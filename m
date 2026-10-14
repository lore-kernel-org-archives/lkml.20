Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE29480356
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962581; cv=none; b=aTYgSnN46hSBmPsdev9dBAaQDkeAS82vS9dZ5xPhA53m9Yhe+EnEyKsjQOlcoDjtyP01BymrItFYUxmiEBCURNQFhUZIJC1+vODnFhrG/Y/J2H/Uti7UwYeAKIh0J0I/xsdRwMlsXZrA1BStRNhBcTatoPWt9/BzMhUCUevDelQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962581; c=relaxed/simple;
	bh=Xhkihqud2og6LCnFWmfpnSfcWOi9tGcC+z2Q80GxKSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e+VjSfhREIXgKDFJVNZDBFmxSIqSLgoRd7AxMLa8rFm/w0xdGGqmAOgtpSX5C9/JozfQkFJM0NN4fwWUCxRgsW7e7pLZH71I34FID7IROOtF9uqfhiap1AukvmD8t3JtZq8bgC9tI3+L7zrPhzhbET8erIB8PiIKtNUt69OHlMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=orzbg4D7; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="orzbg4D7"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c4be28b82so176909f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962573; x=1792567373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mpMUcZsIGQVL/iLIKTF7miuHUmKyHgqyxoFn6S/brv8=;
        b=orzbg4D7vHrEjkVuHw4aUqiKH25lrgzLeKQicQ5Qxa0BCqxMVYn8kIymEvEB0ubR1K
         zsiW0w163W+/RdhYOvR/72fi+5515QMbVi1Dr1qlFDHonMhvnpgleBBdNLgOjIY/dMDS
         ZAUgOp+f9flwDua9/VJKZK7E5ODJGhj9Nfj0bFfojOT5i8msaoyxfCpYZdTJx9SblBkB
         msPOUNZ2fRqUwkoa7MbjmaVaQNBpxH9Wge0BRpOhpBtPL+fiMfumV+R8/jsLwbmPSjq0
         g6LIotkFaT/vYfSp5dpPvk/CgqILs75Ud6h2TqRZTfAnTWrs9f6dxk7jT6S0L7vOcGwA
         jmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962573; x=1792567373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mpMUcZsIGQVL/iLIKTF7miuHUmKyHgqyxoFn6S/brv8=;
        b=sfUilk/VS6Xo1tgsYxiGrlquzew7th++XkM6p1DU+h+4eUuDzt8vhZA2ePbogeqcF3
         PHFwEFzaZ67fo2UEX2gDyWMKWxbGiEg/y8HexTLASVALrnJmgc0ijeOImsMJaZINhec6
         di0Ju3a8KE0StceKsuJphcAwSpXqcQTwhc+cmw2bpRBAirqFMo8cFoFHHiAnGRWbb7B7
         9+A0jdcYhaexVKhzpoFQb6wh14x5dimpAO7rDmBbiS/R4wCaxEJqBV58FLt3iBiYL15W
         5H+ph/6gBzRLCR6/p1mGmOqMiRMkpm2IRR49xzjp0uSI5xixQVuMK6LklCFHIc4cuiDB
         Y2ng==
X-Forwarded-Encrypted: i=1; AKwUvByuu0M7zjetSalhruv3REpKiKzzArJ8n6AskYx1UhEkaEh2KUQH8ozKu4M3ccQ7a5eMKP30inDoJHtY094=@vger.kernel.org
X-Gm-Message-State: AFq9FYLncpKVub9yKuJTfmwEnBFMc92RfPtAugIn8b8x6aPxfFOEgiIh
	ky00frdqaVUzmcNVkjgCoWHYC31VvQZgvPeBXdyZuaxOPSYcYKCSomwW
X-Gm-Gg: AYBFou1nPo6I6QMxelhz5fKV6j+bKPKIp8RzxnA1R9f16TjKFTvHUFaL8PfMaW7eiE9
	2YfH9QHVf/KkFmUwKIpz9xvvlLzdLYZqc7gpzVy2+kLSPxxIXevQWd5PVcTmubi6NSSn9dz7P9l
	B3PiMoa9OJbBQZOgVPfYZoZw08Jgd4lubs89gzv89Ihl9aYv1bm2qSAMcRTp1jL/1oa48ks5vFa
	xf4GiVfihsRz2CfAX6zM7gaYTzEoJXV6pW7fMEObAhY7r2/5+bRRiJQk2nhmVUDHcfqZQ70/4RE
	LEgIsCZAzzYGog3jaWZ5dWcfdYiXZjtdm4/lroWPzvKLqZujux1Hes58bsP0TcbaqzNtoyXemWY
	KA5d0LoMoDzdBOo8t3Jzo/RmXzOhvyOSI+zj9R0iJpk8wmYwhY+OLTcDhv1lNDY/wlJn/k42+/V
	OhKpQrrbngrGzSLPNjGBv5lipuxC08+mNRvn9n+LNEf9YQbdAZZBLIsmvAbZuS1i4z0p6QZUnd4
	ltPROfPCuzwmNv0h8Mfq+BxJAQ252q5fYr+CNYPc2sw1ScL3XcJ/ZDJljHUOuChK2eHflFbLiS2
	dmyOMx9qzSctJ+g1CJJzPDzWmI1U9VGnXZsqSIOsEruwRJZju/E4+HoV8Nks6w==
X-Received: by 2002:a5d:5d0e:0:b0:48d:eec6:308b with SMTP id ffacd0b85a97d-48deec631ebmr235007f8f.21.1791962572592;
        Wed, 14 Oct 2026 00:22:52 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:22:52 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/24] ARM: zte: Add ZX279128S platform and CPU hotplug support
Date: Wed, 14 Oct 2026 08:20:43 +0100
Message-ID: <20261014072109.1759502-4-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support the dual Cortex-A9 platform, second-CPU startup through
bootloader SRAM and CPU hotplug. Keep existing ZX297520V3 support
intact.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 arch/arm/mach-zte/Kconfig             |  16 +++
 arch/arm/mach-zte/Makefile            |   4 +
 arch/arm/mach-zte/platsmp-zx279128s.c | 173 ++++++++++++++++++++++++++
 arch/arm/mach-zte/zx279128s.c         |  19 +++
 4 files changed, 212 insertions(+)
 create mode 100644 arch/arm/mach-zte/platsmp-zx279128s.c
 create mode 100644 arch/arm/mach-zte/zx279128s.c

diff --git a/arch/arm/mach-zte/Kconfig b/arch/arm/mach-zte/Kconfig
index d3b404ca48..032079c958 100644
--- a/arch/arm/mach-zte/Kconfig
+++ b/arch/arm/mach-zte/Kconfig
@@ -26,4 +26,20 @@ config SOC_ZX297520V3
 	  Please read Documentation/arch/arm/zte/zx297520v3.rst on how to boot
 	  the kernel.
 
+config SOC_ZX279128S
+	bool "zx279128s SoC"
+	default y
+	select ARM_AMBA
+	select ARM_GIC
+	select ARM_GLOBAL_TIMER
+	select CACHE_L2X0
+	select CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK
+	select HAVE_ARM_SCU if SMP
+	select HAVE_ARM_TWD if SMP
+	help
+	  Support for the ZTE (Sanechips) zx279128s SoC, a dual-core
+	  Cortex-A9 with an L2C-310 cache controller, used in home gateways
+	  such as the ZTE ZXHN H3600. The second core is started through
+	  the on-chip SRAM, where the boot loader keeps it waiting.
+
 endif
diff --git a/arch/arm/mach-zte/Makefile b/arch/arm/mach-zte/Makefile
index 1bfe4fddd6..72f518632e 100644
--- a/arch/arm/mach-zte/Makefile
+++ b/arch/arm/mach-zte/Makefile
@@ -1,2 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_SOC_ZX297520V3) += zx297520v3.o
+obj-$(CONFIG_SOC_ZX279128S) += zx279128s.o
+ifdef CONFIG_SMP
+obj-$(CONFIG_SOC_ZX279128S) += platsmp-zx279128s.o
+endif
diff --git a/arch/arm/mach-zte/platsmp-zx279128s.c b/arch/arm/mach-zte/platsmp-zx279128s.c
new file mode 100644
index 0000000000..8285b8fb10
--- /dev/null
+++ b/arch/arm/mach-zte/platsmp-zx279128s.c
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
+ *
+ * The boot loader runs from on-chip SRAM.  Its reset code sends every
+ * core but CPU0 into a loop: wait for an event (WFE), then jump to the
+ * start of the SRAM, where the boot loader's reset vector leads back to
+ * the WFE.  To start the second core, replace that vector with a jump to
+ * secondary_startup and send an event.
+ *
+ * To take the second core offline again (CPU hotplug, and kexec, which needs
+ * it), the core puts the boot loader's vector back and returns to the boot
+ * loader's loop with the MMU and caches off. That loop is outside the
+ * kernel's memory, so the core survives the kernel being replaced, and the
+ * next start works the same way as the first.
+ */
+
+#include <linux/cacheflush.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/smp.h>
+
+#include <asm/cp15.h>
+#include <asm/idmap.h>
+#include <asm/proc-fns.h>
+#include <asm/smp_scu.h>
+#include <asm/tlbflush.h>
+
+/* ldr pc, [pc, #-4]: jump to the address stored in the next word */
+#define ZX279128S_JUMP_INSN	0xe51ff004
+
+static void __iomem *zx279128s_smp_sram;
+static phys_addr_t zx279128s_smp_sram_phys;
+/* the boot loader's vector, as found at boot */
+static u32 zx279128s_boot_vector[2];
+
+static int zx279128s_boot_secondary(unsigned int cpu, struct task_struct *idle)
+{
+	if (!zx279128s_smp_sram)
+		return -ENODEV;
+
+	/*
+	 * Store the address before the instruction: a core that wakes up
+	 * in between still runs the boot loader's vector and goes back to
+	 * sleep instead of jumping to a stale address.
+	 */
+	writel(__pa_symbol(secondary_startup), zx279128s_smp_sram + 4);
+	writel(ZX279128S_JUMP_INSN, zx279128s_smp_sram);
+
+	/* Complete both writes, then wake the core */
+	dsb_sev();
+
+	return 0;
+}
+
+static void __init zx279128s_smp_prepare_cpus(unsigned int max_cpus)
+{
+	struct device_node *np;
+	struct resource res;
+	void __iomem *scu;
+
+	np = of_find_compatible_node(NULL, NULL, "arm,cortex-a9-scu");
+	if (!np) {
+		pr_err("zx279128s: no SCU node\n");
+		return;
+	}
+	scu = of_iomap(np, 0);
+	of_node_put(np);
+	if (!scu) {
+		pr_err("zx279128s: cannot map the SCU\n");
+		return;
+	}
+	scu_enable(scu);
+	iounmap(scu);
+
+	np = of_find_compatible_node(NULL, NULL, "zte,zx279128s-smp-sram");
+	if (!np) {
+		pr_err("zx279128s: no SMP SRAM node\n");
+		return;
+	}
+	if (of_address_to_resource(np, 0, &res)) {
+		of_node_put(np);
+		pr_err("zx279128s: no SMP SRAM address\n");
+		return;
+	}
+	zx279128s_smp_sram = of_iomap(np, 0);
+	of_node_put(np);
+	if (!zx279128s_smp_sram) {
+		pr_err("zx279128s: cannot map the SMP SRAM\n");
+		return;
+	}
+	zx279128s_smp_sram_phys = res.start;
+	zx279128s_boot_vector[0] = readl(zx279128s_smp_sram);
+	zx279128s_boot_vector[1] = readl(zx279128s_smp_sram + 4);
+
+	/* zx279128s_cpu_die() reads these with its data cache off */
+	sync_cache_w(&zx279128s_smp_sram);
+	sync_cache_w(&zx279128s_smp_sram_phys);
+	sync_cache_w(&zx279128s_boot_vector);
+}
+
+#ifdef CONFIG_HOTPLUG_CPU
+typedef void (*phys_reset_t)(unsigned long addr, bool hvc);
+
+/*
+ * If the vector already holds a jump, an earlier kernel started the core
+ * and did not put the boot loader's vector back: the original is unknown,
+ * so the core cannot be parked safely.
+ */
+static bool zx279128s_cpu_can_disable(unsigned int cpu)
+{
+	return zx279128s_smp_sram &&
+	       zx279128s_boot_vector[0] != ZX279128S_JUMP_INSN;
+}
+
+static void zx279128s_cpu_die(unsigned int cpu)
+{
+	phys_reset_t phys_reset;
+
+	/* Take out a flat mapping, which keeps the kernel mappings too */
+	setup_mm_for_reboot();
+
+	/*
+	 * The boot loader's loop executes the vector, which
+	 * zx279128s_boot_secondary() changes with data writes. Stop caching
+	 * and predicting instructions, as at power-on, so that the parked
+	 * core sees the change.
+	 */
+	set_cr(get_cr() & ~(CR_I | CR_Z));
+	__flush_icache_all();
+	local_flush_bp_all();
+
+	/* Clean the caches and leave coherency with the other core */
+	v7_exit_coherency_flush(louis);
+
+	/*
+	 * Put the boot loader's vector back, instruction word last: the core
+	 * then wakes up into the boot loader's loop, and zx279128s_cpu_kill()
+	 * sees that it is about to leave the kernel.
+	 */
+	writel_relaxed(zx279128s_boot_vector[1], zx279128s_smp_sram + 4);
+	writel_relaxed(zx279128s_boot_vector[0], zx279128s_smp_sram);
+	dsb();
+
+	/* Turn the MMU off and continue at the boot loader's vector */
+	phys_reset = (phys_reset_t)virt_to_idmap(cpu_reset);
+	phys_reset(zx279128s_smp_sram_phys, false);
+}
+
+static int zx279128s_cpu_kill(unsigned int cpu)
+{
+	u32 val;
+
+	/* Wait until the dying core has put the vector back */
+	return !readl_poll_timeout(zx279128s_smp_sram, val,
+				   val == zx279128s_boot_vector[0], 1000,
+				   100 * USEC_PER_MSEC);
+}
+#endif
+
+static const struct smp_operations zx279128s_smp_ops __initconst = {
+	.smp_prepare_cpus	= zx279128s_smp_prepare_cpus,
+	.smp_boot_secondary	= zx279128s_boot_secondary,
+#ifdef CONFIG_HOTPLUG_CPU
+	.cpu_can_disable	= zx279128s_cpu_can_disable,
+	.cpu_die		= zx279128s_cpu_die,
+	.cpu_kill		= zx279128s_cpu_kill,
+#endif
+};
+
+CPU_METHOD_OF_DECLARE(zx279128s_smp, "zte,zx279128s-smp", &zx279128s_smp_ops);
diff --git a/arch/arm/mach-zte/zx279128s.c b/arch/arm/mach-zte/zx279128s.c
new file mode 100644
index 0000000000..064c76f8ad
--- /dev/null
+++ b/arch/arm/mach-zte/zx279128s.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
+ */
+
+#include <asm/mach/arch.h>
+#include <linux/init.h>
+
+static const char *const zx279128s_dt_compat[] __initconst = {
+	"zte,zx279128s",
+	NULL,
+};
+
+DT_MACHINE_START(ZX279128S, "ZTE zx279128s (Device Tree)")
+	.dt_compat	= zx279128s_dt_compat,
+	/* Keep the L2 cache setup of the boot loader and the device tree */
+	.l2c_aux_val	= 0,
+	.l2c_aux_mask	= ~0,
+MACHINE_END
-- 
2.55.0

