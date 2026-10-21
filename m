Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576270;
	b=WYFDHmqw87C+JQm/ravIeCpc9iFt/c+mHzch2GuqzPpPEz7f0hnDvvhrl6YU7a8Wdj42
	 YQSaqQlTKJJberQXf50ZQF3gWDVryWL3Jdv/u7JKjSfCkWyWBDyX8no+oNmA0hC4FD7Z2
	 mZ7KPv0VmAPVbXBB/Vy8xF2JM2D+b+vb0FfvE4Vz4phA1IA3ugtcid9EowoN67gykIYj3
	 +v1tw4J7C0j5CLvrnbBmjKZleQeTEJW/L0NzESgrF0Hj/K9GEv9bkAhTOdvmZ5Jizj3ut
	 /J9czvIAZH419afyKpmd9bU6fdkBFsTwuuBf2zywlgXAps2hBiX1ewrg1LBx8bkxfyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576270;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:References:
	 Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=z51dyGQmENr/eCL/hqO6oBazougG7M2MjaqKBrJtzis=;
	b=k6YnsqKbg9csUR0n0UJMvrqJvaFJICq9kQbBRhjALeflRKO4wjwjvapsZOrly6fQ0XtU
	 r9MvSPRUIwV9euDBkSDBZ6ILFXLJkAARzkl3UmzP9Sa+kpWEJy8PTr/xu/ieWe2zP3ZQ9
	 1yaEbNDBDc31BvJ1UZperMw0plYu60k8WKO4cJjLXYPH+cG89gAYrhS2aSSNedhgwxpRK
	 QoR4h6hXRcs3/IQS7/233E99p86z6BnOGvfydl2D8xhJwhwypJJM8n0jODgsWswib6Dbm
	 Wb4cSkhy4YJxGpWLnZry2aCf/J1DPvBCaX2qnmE36G02BiyIV3KAEfxXNQPxdxehEJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iRzviMkD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB023606A329
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iRzviMkD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD001F000C9;
	Wed, 21 Oct 2026 09:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792576269;
	bh=z51dyGQmENr/eCL/hqO6oBazougG7M2MjaqKBrJtzis=;
	h=Date:From:To:Cc:Subject:References;
	b=iRzviMkDI3HHwiXZxBrp5Nqih1DDhQf+ggADl55E3nSHmAEz9dvEGh4gqiStE1vX0
	 uXxn161Te9RUn45xy1ed+8R+P6AJbUwgjlszZ50hCbd3jKZUE+G4YKox1+XyUypVT6
	 qQqZ/sqnI67jTmmMS2LZeN/sL3RqHTv9h1ZyUn3NPeBVYF8+tU6TDYnt2i1DWFXc/V
	 R9GdwJvGRMCEsFU/M3vm2nCBKV5ePDyxYSbRXDzE4rid3EwcrW3tXe4PwK8UegCPke
	 Qi8JNB2LXB4oS8Mr1cUpECnKcKMtQ//d95JeMSkYrusp7xNiCLdcVs8KnWgj4VM1p5
	 DKwXaFGzC4nbA==
Date: Wed, 21 Oct 2026 11:51:06 +0200
From: Thomas Gleixner <tglx@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [GIT pull] timers/clocksource for v7.4-rc1
References: <179257622431.804100.15107946105101279363.tglx@fw13>
Message-ID: <179257622675.804100.14134557707707993781.tglx@fw13>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Linus,

please pull the latest timers/clocksource branch from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-clocksour=
ce-2026-10-20

up to:  5bbd49a96e04: Merge tag 'timers-v7.4-rc1' of git://git.kernel.org/pub=
/scm/linux/kernel/git/daniel.lezcano/linux into timers/clocksource

Updates for clocksource and clockevent drivers:

  - Support for the Renesas RZ/N1 timers

  - Rework of the per CPU and per cluster MIPS GIC timers to improve
    performance, sched clock precision and to add VDSO support.

  - The usual assorted pile of small fixes and improvements all over the
    place.

Thanks,

	tglx

------------------>
Beno=C3=AEt Monin (2):
      clocksource/drivers/mips-gic-timer: Simplify gic_next_event() for per-c=
pu timer
      clocksource/drivers/mips-gic-timer: Use local counter on synced multi-c=
luster systems

Herve Codina (Schneider Electric) (3):
      dt-bindings: timer: Add the Renesas RZ/N1 timer
      clocksource/drivers: Add support for the Renesas RZ/N1 timers
      MAINTAINERS: Add the Renesas RZ/N1 timers driver entry

Jiale Yao (1):
      clocksource/drivers/timer-ti-dm: Handle runtime resume failure

Luca Leonardo Scorcia (3):
      clocksource/drivers/timer-mediatek: Fix random crash at boot
      clocksource/drivers/timer-mediatek: Convert to OF probing
      clocksource/drivers/timer-mediatek: Request and enable the bus clock

Markus Schneider-Pargmann (TI) (1):
      clocksource/drivers/timer-ti-dm: Register clocksource/event only for am=
654

Slavin Liu (1):
      clocksource/drivers/dbx500-prcmu: Check timer register mapping

Wentao Liang (3):
      clocksource/drivers/fttmr010: Fix clk reference leak in error paths
      clocksource/drivers/digicolor: Fix clk reference leak on request_irq fa=
ilure
      clocksource/drivers/timer-econet-en751221: Fix clock reference leak


 .../bindings/timer/renesas,rzn1-timer.yaml         |  74 ++++
 MAINTAINERS                                        |   7 +
 drivers/clocksource/Kconfig                        |  11 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/clksrc-dbx500-prcmu.c          |   2 +
 drivers/clocksource/mips-gic-timer.c               | 138 +++++-
 drivers/clocksource/timer-digicolor.c              |   2 +
 drivers/clocksource/timer-econet-en751221.c        |   1 +
 drivers/clocksource/timer-fttmr010.c               |   2 +
 drivers/clocksource/timer-mediatek.c               |  47 +-
 drivers/clocksource/timer-rzn1.c                   | 483 +++++++++++++++++++=
++
 drivers/clocksource/timer-ti-dm.c                  |  10 +-
 include/linux/platform_data/dmtimer-omap.h         |   2 +
 13 files changed, 753 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/renesas,rzn1-time=
r.yaml
 create mode 100644 drivers/clocksource/timer-rzn1.c

diff --git a/Documentation/devicetree/bindings/timer/renesas,rzn1-timer.yaml =
b/Documentation/devicetree/bindings/timer/renesas,rzn1-timer.yaml
new file mode 100644
index 000000000000..7218c0c2671d
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/renesas,rzn1-timer.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/renesas,rzn1-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/N1 timers
+
+maintainers:
+  - Herve Codina <herve.codina@bootlin.com>
+
+description: |
+  The Renesas RZ/N1 SoCs timers block controller is composed of 8 independent
+  timers.
+    - 6 are 16-bit timers
+    - 2 are 32-bit timers
+
+  Each timer has its own interrupt line and can work in either one-shot or
+  periodic mode.
+
+properties:
+  compatible:
+    items:
+      - const: renesas,r9a06g032-timer   # RZ/N1D
+      - const: renesas,rzn1-timer
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: APB internal bus clock
+
+  clock-names:
+    items:
+      - const: pclk
+
+  power-domains:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 8
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/r9a06g032-sysctrl.h>
+
+    timer@51001000 {
+        compatible =3D "renesas,r9a06g032-timer", "renesas,rzn1-timer";
+        reg =3D <0x51001000 0x200>;
+        clocks =3D <&sysctrl R9A06G032_HCLK_TIMER0>;
+        clock-names =3D "pclk";
+        power-domains =3D <&sysctrl>;
+        interrupts =3D <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 72294ddfa5b7..7bdacc8feeed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23295,6 +23295,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
 F:	drivers/rtc/rtc-rzn1.c
=20
+RENESAS RZ/N1 TIMERS DRIVER
+M:	Herve Codina <herve.codina@bootlin.com>
+L:	linux-renesas-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/timer/renesas,rzn1-timer.yaml
+F:	drivers/clocksource/timer-rzn1.c
+
 RENESAS RZ/N1 USBF CONTROLLER DRIVER
 M:	Herve Codina <herve.codina@bootlin.com>
 L:	linux-renesas-soc@vger.kernel.org
diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index d9c76dd443f8..da83483296d5 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -152,6 +152,17 @@ config REALTEK_OTTO_TIMER
 	  RT8391, RTL8392, RTL8393 and RTL8396 and chips of the RTL930x series
 	  such as RTL9301, RTL9302 or RTL9303.
=20
+config RZN1_TIMER
+	bool "Renesas RZ/N1 Timer"
+	depends on HAS_IOMEM && COMMON_CLK
+	depends on ARCH_RZN1 || COMPILE_TEST
+	help
+	  Enables support for RZ/N1 SoC timers.
+	  A timers block in RZ/N1 SoCs is composed of 8 timers
+	    - 6 16-bit timers
+	    - 2 32-bit timers
+	  Two timers blocks are available in RZ/N1 SoCs.
+
 config SUN4I_TIMER
 	bool "Sun4i timer driver" if COMPILE_TEST
 	depends on HAS_IOMEM
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index b46376af6b49..464ec6690ab6 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -96,3 +96,4 @@ obj-$(CONFIG_EP93XX_TIMER)		+=3D timer-ep93xx.o
 obj-$(CONFIG_RALINK_TIMER)		+=3D timer-ralink.o
 obj-$(CONFIG_NXP_STM_TIMER)		+=3D timer-nxp-stm.o
 obj-$(CONFIG_RTK_SYSTIMER)		+=3D timer-realtek.o
+obj-$(CONFIG_RZN1_TIMER)		+=3D timer-rzn1.o
diff --git a/drivers/clocksource/clksrc-dbx500-prcmu.c b/drivers/clocksource/=
clksrc-dbx500-prcmu.c
index 2fc93e46cea3..1af223b0e896 100644
--- a/drivers/clocksource/clksrc-dbx500-prcmu.c
+++ b/drivers/clocksource/clksrc-dbx500-prcmu.c
@@ -52,6 +52,8 @@ static struct clocksource clocksource_dbx500_prcmu =3D {
 static int __init clksrc_dbx500_prcmu_init(struct device_node *node)
 {
 	clksrc_dbx500_timer_base =3D of_iomap(node, 0);
+	if (!clksrc_dbx500_timer_base)
+		return -ENOMEM;
=20
 	/*
 	 * The A9 sub system expects the timer to be configured as
diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-=
gic-timer.c
index 1501c7db9a8e..fc97b31f0adb 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -6,6 +6,7 @@
 #include <linux/clk.h>
 #include <linux/clockchips.h>
 #include <linux/cpu.h>
+#include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/notifier.h>
@@ -21,6 +22,9 @@ static int gic_timer_irq;
 static unsigned int gic_frequency;
 static unsigned int gic_count_width;
 static bool __read_mostly gic_clock_unstable;
+static bool __read_mostly gic_use_local_counter =3D true;
+static unsigned long *gic_synced_cl_map;
+static struct work_struct gic_promote_work;
=20
 static void gic_clocksource_unstable(char *reason);
=20
@@ -52,18 +56,13 @@ static u64 notrace gic_read_count(void)
=20
 static int gic_next_event(unsigned long delta, struct clock_event_device *ev=
t)
 {
-	int cpu =3D cpumask_first(evt->cpumask);
 	u64 cnt;
 	int res;
=20
 	cnt =3D gic_read_count();
 	cnt +=3D (u64)delta;
-	if (cpu =3D=3D raw_smp_processor_id()) {
-		write_gic_vl_compare(cnt);
-	} else {
-		write_gic_vl_other(mips_cm_vp_id(cpu));
-		write_gic_vo_compare(cnt);
-	}
+	write_gic_vl_compare(cnt);
+
 	res =3D ((int)(gic_read_count() - cnt) >=3D 0) ? -ETIME : 0;
 	return res;
 }
@@ -82,6 +81,7 @@ static void gic_clockevent_cpu_init(unsigned int cpu,
 {
 	cd->name		=3D "MIPS GIC";
 	cd->features		=3D CLOCK_EVT_FEAT_ONESHOT |
+				  CLOCK_EVT_FEAT_PERCPU |
 				  CLOCK_EVT_FEAT_C3STOP;
=20
 	cd->rating		=3D 350;
@@ -106,10 +106,71 @@ static void gic_update_frequency(void *data)
 	clockevents_update_freq(this_cpu_ptr(&gic_clockevent_device), rate);
 }
=20
+/* Number of iterations to synchronize the local GIC counter */
+#define GIC_SYNC_ITERATIONS 4
+
+/* Delay in us to check if the local GIC counter is still in sync with clust=
er 0 */
+#define GIC_SYNC_CHECK_DELAY 100
+
+static void gic_sync_counter_64(unsigned int cluster)
+{
+	unsigned int config =3D read_gic_config();
+	u64 t0, t1, t2;
+	s64 offset =3D 0;
+
+	mips_cm_lock_other(0, 0, 0, CM_GCR_Cx_OTHER_BLOCK_GLOBAL);
+
+	for (int i =3D 0; i < GIC_SYNC_ITERATIONS; i++) {
+		write_gic_config(config | GIC_CONFIG_COUNTSTOP);
+		write_gic_counter(read_gic_redir_counter() + offset);
+		write_gic_config(config & ~GIC_CONFIG_COUNTSTOP);
+
+		t0 =3D read_gic_counter();
+		t1 =3D read_gic_redir_counter();
+		t2 =3D read_gic_counter();
+
+		if (time_in_range64(t1, t0, t2))
+			break;
+
+		/*
+		 * Compute the offset to apply to the local counter
+		 * so that (t1 - t0) equals (t2 - t1).
+		 */
+		offset +=3D (s64)(2 * t1 - t0 - t2) / 2;
+	}
+
+	mips_cm_unlock_other();
+
+	if (!time_in_range64(t1, t0, t2))
+		return;
+
+	udelay(GIC_SYNC_CHECK_DELAY);
+
+	mips_cm_lock_other(0, 0, 0, CM_GCR_Cx_OTHER_BLOCK_GLOBAL);
+	t0 =3D read_gic_counter();
+	t1 =3D read_gic_redir_counter();
+	t2 =3D read_gic_counter();
+	mips_cm_unlock_other();
+
+	/* If so, mark the cluster as synchronized */
+	if (time_in_range64(t1, t0, t2) && gic_synced_cl_map)
+		bitmap_set(gic_synced_cl_map, cluster, 1);
+}
+
 static int gic_starting_cpu(unsigned int cpu)
 {
-	/* Ensure the GIC counter is running */
-	clear_gic_config(GIC_CONFIG_COUNTSTOP);
+	unsigned int cluster =3D cpu_cluster(&cpu_data[cpu]);
+
+	if (read_gic_config() & GIC_CONFIG_COUNTSTOP) {
+		clear_gic_config(GIC_CONFIG_COUNTSTOP);
+
+		if (cluster && mips_cm_is64 && !gic_clock_unstable)
+			gic_sync_counter_64(cluster);
+
+		if (gic_synced_cl_map &&
+		    bitmap_full(gic_synced_cl_map, mips_cps_numclusters()))
+			schedule_work(&gic_promote_work);
+	}
=20
 	gic_clockevent_cpu_init(cpu, this_cpu_ptr(&gic_clockevent_device));
 	return 0;
@@ -158,11 +219,6 @@ static int gic_clockevent_init(void)
 	return 0;
 }
=20
-static u64 gic_hpt_read(struct clocksource *cs)
-{
-	return gic_read_count();
-}
-
 static u64 gic_hpt_read_multicluster(struct clocksource *cs)
 {
 	unsigned int hi, hi2, lo;
@@ -194,6 +250,14 @@ static u64 gic_hpt_read_multicluster(struct clocksource =
*cs)
 	return count;
 }
=20
+static u64 gic_hpt_read(struct clocksource *cs)
+{
+	if (unlikely(!READ_ONCE(gic_use_local_counter)))
+		return gic_hpt_read_multicluster(cs);
+
+	return gic_read_count();
+}
+
 static struct clocksource gic_clocksource =3D {
 	.name			=3D "GIC",
 	.read			=3D gic_hpt_read,
@@ -213,8 +277,28 @@ static void gic_clocksource_unstable(char *reason)
 	clocksource_mark_unstable(&gic_clocksource);
 }
=20
+static void gic_clocksource_promote(struct work_struct *work)
+{
+	if (gic_clock_unstable || READ_ONCE(gic_use_local_counter))
+		return;
+
+	WRITE_ONCE(gic_use_local_counter, true);
+
+#ifdef CONFIG_GENERIC_GETTIMEOFDAY
+	gic_clocksource.vdso_clock_mode =3D VDSO_CLOCKMODE_GIC;
+#endif
+
+	if (mips_cm_revision() >=3D CM_REV_CM3 || !IS_ENABLED(CONFIG_CPU_FREQ)) {
+		sched_clock_register(mips_cm_is64 ?
+				     gic_read_count_64 : gic_read_count_2x32,
+				     gic_count_width, gic_frequency);
+	}
+}
+
 static int __init __gic_clocksource_init(void)
 {
+	unsigned int numclusters;
+	bool synced =3D false;
 	int ret;
=20
 	/* Set clocksource mask. */
@@ -226,14 +310,32 @@ static int __init __gic_clocksource_init(void)
=20
 	/* Calculate a somewhat reasonable rating value. */
 	if (mips_cm_revision() >=3D CM_REV_CM3 || !IS_ENABLED(CONFIG_CPU_FREQ))
-		gic_clocksource.rating =3D 300; /* Good when frequecy is stable */
+		gic_clocksource.rating =3D 300; /* Good when frequency is stable */
 	else
 		gic_clocksource.rating =3D 200;
 	gic_clocksource.rating +=3D clamp(gic_frequency / 10000000, 0, 99);
=20
-	if (mips_cps_multicluster_cpus()) {
-		gic_clocksource.read =3D &gic_hpt_read_multicluster;
+	numclusters =3D mips_cps_numclusters();
+	if (numclusters > 1)
+		gic_synced_cl_map =3D bitmap_zalloc(numclusters, GFP_KERNEL);
+
+	/*
+	 * Mark cluster 0 as synchronized (with itself), and all clusters
+	 * without cores since there is no local GIC counter access on those.
+	 */
+	if (gic_synced_cl_map) {
+		bitmap_set(gic_synced_cl_map, 0, 1);
+		for (unsigned int cl =3D 0; cl < numclusters; cl++) {
+			if (!mips_cps_numcores(cl))
+				bitmap_set(gic_synced_cl_map, cl, 1);
+		}
+		synced =3D bitmap_full(gic_synced_cl_map, numclusters);
+	}
+
+	if (numclusters > 1 && !synced) {
+		WRITE_ONCE(gic_use_local_counter, false);
 		gic_clocksource.vdso_clock_mode =3D VDSO_CLOCKMODE_NONE;
+		INIT_WORK(&gic_promote_work, gic_clocksource_promote);
 	}
=20
 	ret =3D clocksource_register_hz(&gic_clocksource, gic_frequency);
@@ -292,7 +394,7 @@ static int __init gic_clocksource_of_init(struct device_n=
ode *node)
 	 * change performed by the CPC core clocks divider.
 	 */
 	if ((mips_cm_revision() >=3D CM_REV_CM3 || !IS_ENABLED(CONFIG_CPU_FREQ)) &&
-	     !mips_cps_multicluster_cpus()) {
+	     READ_ONCE(gic_use_local_counter)) {
 		sched_clock_register(mips_cm_is64 ?
 				     gic_read_count_64 : gic_read_count_2x32,
 				     gic_count_width, gic_frequency);
diff --git a/drivers/clocksource/timer-digicolor.c b/drivers/clocksource/time=
r-digicolor.c
index 559aa96089c3..46e0c329957a 100644
--- a/drivers/clocksource/timer-digicolor.c
+++ b/drivers/clocksource/timer-digicolor.c
@@ -190,6 +190,8 @@ static int __init digicolor_timer_init(struct device_node=
 *node)
 			  &dc_timer_dev.ce);
 	if (ret) {
 		pr_warn("request of timer irq %d failed (%d)\n", irq, ret);
+		clk_disable_unprepare(clk);
+		clk_put(clk);
 		return ret;
 	}
=20
diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksourc=
e/timer-econet-en751221.c
index 4008076b1a21..1859335345b5 100644
--- a/drivers/clocksource/timer-econet-en751221.c
+++ b/drivers/clocksource/timer-econet-en751221.c
@@ -181,6 +181,7 @@ static int __init timer_init(struct device_node *np)
 	}
=20
 	econet_timer.freq_hz =3D clk_get_rate(clk);
+	clk_put(clk);
=20
 	for (int i =3D 0; i < num_blocks; i++) {
 		econet_timer.membase[i] =3D of_iomap(np, i);
diff --git a/drivers/clocksource/timer-fttmr010.c b/drivers/clocksource/timer=
-fttmr010.c
index 308f94bfbaed..c2553851e8d6 100644
--- a/drivers/clocksource/timer-fttmr010.c
+++ b/drivers/clocksource/timer-fttmr010.c
@@ -292,6 +292,7 @@ static int __init fttmr010_common_init(struct device_node=
 *np,
 	ret =3D clk_prepare_enable(clk);
 	if (ret) {
 		pr_err("failed to enable PCLK\n");
+		clk_put(clk);
 		return ret;
 	}
=20
@@ -432,6 +433,7 @@ static int __init fttmr010_common_init(struct device_node=
 *np,
 	kfree(fttmr010);
 out_disable_clock:
 	clk_disable_unprepare(clk);
+	clk_put(clk);
=20
 	return ret;
 }
diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer=
-mediatek.c
index 7bcb4a3f26fb..842d6ee4259e 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -9,10 +9,14 @@
=20
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
=20
+#include <linux/clk.h>
 #include <linux/clockchips.h>
 #include <linux/clocksource.h>
 #include <linux/interrupt.h>
 #include <linux/irqreturn.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/sched_clock.h>
 #include <linux/slab.h>
 #include "timer-of.h"
@@ -215,8 +219,7 @@ static irqreturn_t mtk_gpt_interrupt(int irq, void *dev_i=
d)
 	return IRQ_HANDLED;
 }
=20
-static void
-__init mtk_gpt_setup(struct timer_of *to, u8 timer, u8 option)
+static void mtk_gpt_setup(struct timer_of *to, u8 timer, u8 option)
 {
 	writel(GPT_CTRL_CLEAR | GPT_CTRL_DISABLE,
 	       timer_of_base(to) + GPT_CTRL_REG(timer));
@@ -277,12 +280,13 @@ static struct timer_of to =3D {
 	},
=20
 	.of_irq =3D {
-		.flags =3D IRQF_TIMER | IRQF_IRQPOLL,
+		.flags =3D IRQF_TIMER | IRQF_IRQPOLL | IRQF_NO_AUTOEN,
 	},
 };
=20
-static int __init mtk_syst_init(struct device_node *node)
+static int mtk_syst_init(struct platform_device *pdev)
 {
+	struct device_node *node =3D pdev->dev.of_node;
 	int ret;
=20
 	to.clkevt.features =3D CLOCK_EVT_FEAT_DYNIRQ | CLOCK_EVT_FEAT_ONESHOT;
@@ -298,14 +302,19 @@ static int __init mtk_syst_init(struct device_node *nod=
e)
=20
 	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
 					TIMER_SYNC_TICKS, 0xffffffff);
+	enable_irq(timer_of_irq(&to));
=20
 	return 0;
 }
=20
-static int __init mtk_gpt_init(struct device_node *node)
+static int mtk_gpt_init(struct platform_device *pdev)
 {
+	struct device_node *node =3D pdev->dev.of_node;
+	struct clk *clk_bus;
 	int ret;
=20
+	clk_bus =3D devm_clk_get_optional_enabled(&pdev->dev, "bus");
+
 	to.clkevt.features =3D CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
 	to.clkevt.set_state_shutdown =3D mtk_gpt_clkevt_shutdown;
 	to.clkevt.set_state_periodic =3D mtk_gpt_clkevt_set_periodic;
@@ -334,8 +343,32 @@ static int __init mtk_gpt_init(struct device_node *node)
 					TIMER_SYNC_TICKS, 0xffffffff);
=20
 	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
+	enable_irq(timer_of_irq(&to));
=20
 	return 0;
 }
-TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
-TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer", mtk_syst_init);
+
+static int mtk_timer_probe(struct platform_device *pdev)
+{
+	int (*timer_init)(struct platform_device *pdev);
+
+	timer_init =3D of_device_get_match_data(&pdev->dev);
+	return timer_init(pdev);
+}
+
+static const struct of_device_id mtk_timer_match_table[] =3D {
+	{ .compatible =3D "mediatek,mt6577-timer", .data =3D mtk_gpt_init },
+	{ .compatible =3D "mediatek,mt6765-timer", .data =3D mtk_syst_init },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver mtk_timer_driver =3D {
+	.probe =3D mtk_timer_probe,
+	.driver =3D {
+		.name =3D "mediatek-timer",
+		.of_match_table =3D mtk_timer_match_table,
+	},
+};
+module_platform_driver(mtk_timer_driver);
+
+MODULE_DESCRIPTION("MediaTek Timer driver");
diff --git a/drivers/clocksource/timer-rzn1.c b/drivers/clocksource/timer-rzn=
1.c
new file mode 100644
index 000000000000..25ebebff3c63
--- /dev/null
+++ b/drivers/clocksource/timer-rzn1.c
@@ -0,0 +1,483 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RZ/N1 timers driver
+ *
+ * Copyright (C) 2026 Schneider-Electric
+ *
+ * Author: Herve Codina <herve.codina@bootlin.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/clockchips.h>
+#include <linux/clocksource.h>
+#include <linux/cpuhotplug.h>
+#include <linux/interrupt.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/sched_clock.h>
+
+/* Per-timer register offsets */
+#define RZN1_TIMER_LOAD_COUNT_REG	0x00
+#define RZN1_TIMER_CURRENT_COUNT_REG	0x04
+#define RZN1_TIMER_CONTROL_REG		0x08
+#define   RZN1_TIMER_CONTROL_INT_UNMASK		BIT(3)
+#define   RZN1_TIMER_CONTROL_ENABLE		BIT(2)
+#define   RZN1_TIMER_CONTROL_AUTORELOAD		BIT(1)
+#define   RZN1_TIMER_CONTROL_PRESCALER_DIV25	BIT(0)
+#define RZN1_TIMER_CLEAR_INT_REG	0x0c
+#define RZN1_TIMER_STATUS_INT0_REG	0x10
+#define RZN1_TIMER_STATUS_INT1_REG	0x14
+
+/*
+ * 8 timers are available. Among those 8 timers, the first 6 timers are 16-b=
it
+ * timers and the last two ones are 32-bit timers.
+ */
+#define RZN1_TIMER_BASE_INDEX_16BIT_TIMERS	0
+#define RZN1_TIMER_NB_16BIT_TIMERS		6
+#define RZN1_TIMER_LAST_INDEX_16BIT_TIMERS	(RZN1_TIMER_BASE_INDEX_16BIT_TIME=
RS + \
+						 RZN1_TIMER_NB_16BIT_TIMERS - 1)
+
+#define RZN1_TIMER_BASE_INDEX_32BIT_TIMERS	6
+#define RZN1_TIMER_NB_32BIT_TIMERS		2
+#define RZN1_TIMER_LAST_INDEX_32BIT_TIMERS	(RZN1_TIMER_BASE_INDEX_32BIT_TIME=
RS + \
+						 RZN1_TIMER_NB_32BIT_TIMERS - 1)
+
+#define RZN1_TIMER_IS_16BIT_TIMER(_i) ((_i) < RZN1_TIMER_BASE_INDEX_32BIT_TI=
MERS)
+
+/* Total numbers of timers */
+#define RZN1_TIMER_NB_TIMERS	(RZN1_TIMER_NB_16BIT_TIMERS + \
+				 RZN1_TIMER_NB_32BIT_TIMERS)
+
+/* Offset of registers related to the timer number _i in the timers regs are=
a */
+#define RZN1_TIMER_REGS_OFFSET(_i) (0x20 * (_i))
+
+struct rzn1_timer {
+	void __iomem *base;
+	unsigned int width;
+	unsigned long rate;
+	unsigned long hz_period;
+	struct clock_event_device ced;
+};
+
+static int rzn1_timer_config(struct rzn1_timer *timer, u32 period, bool is_p=
eriodic)
+{
+	u32 ctrl;
+
+	ctrl =3D readl(timer->base + RZN1_TIMER_CONTROL_REG);
+
+	/* Disable the timer */
+	writel(ctrl & ~RZN1_TIMER_CONTROL_ENABLE,
+	       timer->base + RZN1_TIMER_CONTROL_REG);
+
+	/* Set the new period */
+	writel(period, timer->base + RZN1_TIMER_LOAD_COUNT_REG);
+
+	/* Prepare the timer mode */
+	if (is_periodic)
+		ctrl |=3D RZN1_TIMER_CONTROL_AUTORELOAD;
+	else
+		ctrl &=3D ~RZN1_TIMER_CONTROL_AUTORELOAD;
+
+	/*
+	 * Enable the timer.
+	 *
+	 * This automatically resets the CURRENT_COUNT register.
+	 */
+	ctrl |=3D RZN1_TIMER_CONTROL_ENABLE;
+	writel(ctrl, timer->base + RZN1_TIMER_CONTROL_REG);
+
+	return 0;
+}
+
+static void rzn1_timer_disable(struct rzn1_timer *timer)
+{
+	u32 ctrl;
+
+	ctrl =3D readl(timer->base + RZN1_TIMER_CONTROL_REG);
+	ctrl &=3D ~RZN1_TIMER_CONTROL_ENABLE;
+	writel(ctrl, timer->base + RZN1_TIMER_CONTROL_REG);
+}
+
+static void rzn1_timer_int_enable(struct rzn1_timer *timer)
+{
+	u32 ctrl;
+
+	ctrl =3D readl(timer->base + RZN1_TIMER_CONTROL_REG);
+	ctrl |=3D RZN1_TIMER_CONTROL_INT_UNMASK;
+	writel(ctrl, timer->base + RZN1_TIMER_CONTROL_REG);
+}
+
+static irqreturn_t rzn1_timer_interrupt(int irq, void *dev_id)
+{
+	struct rzn1_timer *timer =3D dev_id;
+
+	/* Ack the interrupt */
+	readl(timer->base + RZN1_TIMER_CLEAR_INT_REG);
+
+	if (timer->ced.event_handler)
+		timer->ced.event_handler(&timer->ced);
+
+	return IRQ_HANDLED;
+}
+
+static int rzn1_clkevt_set_next_event(unsigned long cycles,
+				      struct clock_event_device *evt)
+{
+	struct rzn1_timer *timer =3D container_of(evt, struct rzn1_timer, ced);
+
+	return rzn1_timer_config(timer, cycles, false);
+}
+
+static int rzn1_clkevt_shutdown(struct clock_event_device *evt)
+{
+	struct rzn1_timer *timer =3D container_of(evt, struct rzn1_timer, ced);
+
+	rzn1_timer_disable(timer);
+	return 0;
+}
+
+static int rzn1_clkevt_set_periodic(struct clock_event_device *evt)
+{
+	struct rzn1_timer *timer =3D container_of(evt, struct rzn1_timer, ced);
+
+	rzn1_timer_config(timer, timer->hz_period, true);
+	return 0;
+}
+
+/*
+ * This global lock is used to prevent race conditions during global timers
+ * test and set operation in case the driver is using the async probe option.
+ */
+static DEFINE_MUTEX(rzn1_global_timers_lock);
+
+static int rzn1_timer_instance;
+
+/* scheduler and clocksource */
+static struct rzn1_timer *rzn1_sched_clock;
+
+static u64 notrace rzn1_sched_read(void)
+{
+	return readl_relaxed(rzn1_sched_clock->base + RZN1_TIMER_CURRENT_COUNT_REG);
+}
+
+static u64 rzn1_clksrc_read(struct clocksource *cs)
+{
+	return readl_relaxed(rzn1_sched_clock->base + RZN1_TIMER_CURRENT_COUNT_REG);
+}
+
+static struct clocksource rzn1_clocksource =3D {
+	.name =3D "rzn1_timer_clocksource",
+	.rating =3D 200,
+	.flags =3D CLOCK_SOURCE_IS_CONTINUOUS,
+	.read =3D rzn1_clksrc_read,
+};
+
+/* Timers table where 16-bit timers will be assigned per-cpu */
+static struct rzn1_timer *rzn1_tab_timers;
+
+static int rzn1_local_timer_starting_cpu(unsigned int cpu)
+{
+	struct rzn1_timer *timer;
+
+	/* We assign the first and second 16-bit timer as per-cpu timers. */
+	if (cpu >=3D 2)
+		return 0;
+
+	timer =3D &rzn1_tab_timers[cpu + RZN1_TIMER_BASE_INDEX_16BIT_TIMERS];
+
+	timer->ced.cpumask =3D cpumask_of(cpu);
+	irq_force_affinity(timer->ced.irq, cpumask_of(cpu));
+
+	clockevents_config_and_register(&timer->ced, timer->rate, 1,
+					GENMASK(timer->width - 1, 0));
+	/*
+	 * Time to enable the interrupt even if no interrupt can be fired yet.
+	 * Indeed, the timer is still globally disabled.
+	 * It will be enabled when rzn1_timer_config() is called
+	 */
+	enable_irq(timer->ced.irq);
+	return 0;
+}
+
+static int rzn1_local_timer_dying_cpu(unsigned int cpu)
+{
+	struct rzn1_timer *timer;
+
+	if (cpu >=3D 2)
+		return 0;
+
+	timer =3D &rzn1_tab_timers[cpu + RZN1_TIMER_BASE_INDEX_16BIT_TIMERS];
+
+	rzn1_timer_disable(timer);
+	disable_irq_nosync(timer->ced.irq);
+	return 0;
+}
+
+static void rzn1_timer_init(struct rzn1_timer *timer, unsigned int index,
+			    void __iomem *timers_base, unsigned long clock_rate)
+{
+	timer->base =3D timers_base + RZN1_TIMER_REGS_OFFSET(index);
+
+	/* Disable the timer */
+	writel(0, timer->base + RZN1_TIMER_CONTROL_REG);
+
+	/* Clear potential interrupts */
+	readl(timer->base + RZN1_TIMER_CLEAR_INT_REG);
+
+	if (RZN1_TIMER_IS_16BIT_TIMER(index)) {
+		timer->width =3D 16;
+		/*
+		 * Enable pre-scaler for 16-bit timers.
+		 *
+		 * Timers are fed by a 25MHz clock. With this pre-scaler (1/25)
+		 * enabled, the 16-bit timers resolution is 1 microsecond.
+		 */
+		writel(RZN1_TIMER_CONTROL_PRESCALER_DIV25,
+		       timer->base + RZN1_TIMER_CONTROL_REG);
+		timer->rate =3D clock_rate / 25;
+	} else {
+		timer->width =3D 32;
+		timer->rate =3D clock_rate;
+	}
+	timer->hz_period =3D DIV_ROUND_UP(timer->rate, HZ);
+}
+
+static void rzn1_timer_clkevt_init_ced(struct rzn1_timer *timer, const char =
*name,
+				       int irq)
+{
+	timer->ced.features =3D CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
+	timer->ced.set_next_event =3D rzn1_clkevt_set_next_event;
+	timer->ced.set_state_shutdown =3D rzn1_clkevt_shutdown;
+	timer->ced.set_state_periodic =3D rzn1_clkevt_set_periodic;
+	timer->ced.cpumask =3D cpu_possible_mask;
+
+	/*
+	 * 32-bit timers are fed with a 25 MHz clock directly derived from the
+	 * main PLL (1 GHz). The arch timer, ARMv7 CP15 in RZ/N1 SoCs, is fed
+	 * with to a 6.25 MHz clock.
+	 *
+	 * The clock of the RZ/N1 timers block is a stable one and the RZ/N1
+	 * timers have a higher resolution than the ARM CP15 one.
+	 *
+	 * Use a high rating for the 32-bit RZ/N1 timers.
+	 */
+	timer->ced.rating =3D timer->width =3D=3D 16 ? 200 : 460;
+	timer->ced.owner =3D THIS_MODULE;
+	timer->ced.name =3D name;
+	timer->ced.irq =3D irq;
+}
+
+static int rzn1_timer_setup_timers(struct platform_device *pdev,
+				   struct rzn1_timer *tab_timers,
+				   unsigned int first_timer_index,
+				   unsigned int last_timer_index,
+				   void __iomem *base, unsigned long clock_rate)
+{
+	struct device *dev =3D &pdev->dev;
+	struct rzn1_timer *timer;
+	unsigned int i;
+	char *name;
+	int irq;
+	int ret;
+
+	for (i =3D first_timer_index; i <=3D last_timer_index; i++) {
+		timer =3D &tab_timers[i];
+
+		rzn1_timer_init(timer, i, base, clock_rate);
+
+		irq =3D platform_get_irq(pdev, i);
+		if (irq < 0)
+			return irq;
+
+		name =3D devm_kasprintf(dev, GFP_KERNEL, "%s-%u", dev_name(dev), i);
+		if (!name)
+			return -ENOMEM;
+
+		rzn1_timer_clkevt_init_ced(timer, name, irq);
+
+		ret =3D devm_request_irq(dev, timer->ced.irq, rzn1_timer_interrupt,
+				       IRQF_TIMER | IRQF_NO_AUTOEN,
+				       timer->ced.name, timer);
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "timer%u: Failed to request IRQ\n", i);
+
+		rzn1_timer_int_enable(timer);
+	}
+	return 0;
+}
+
+static void rzn1_timer_register_clkevt(struct rzn1_timer *tab_timers,
+				       unsigned int first_timer_index,
+				       unsigned int last_timer_index)
+{
+	struct rzn1_timer *timer;
+	unsigned int i;
+
+	for (i =3D first_timer_index; i <=3D last_timer_index; i++) {
+		timer =3D &tab_timers[i];
+		clockevents_config_and_register(&timer->ced, timer->rate,
+						1, GENMASK(timer->width - 1, 0));
+		/*
+		 * Time to enable the interrupt even if no interrupt can be
+		 * fired yet. Indeed, the timer is still globally disabled.
+		 * It will be enabled when rzn1_timer_config() is called
+		 */
+		enable_irq(timer->ced.irq);
+	}
+}
+
+static int rzn1_timer_probe_first(struct platform_device *pdev,
+				  struct rzn1_timer *tab_timers,
+				  void __iomem *base, unsigned long clock_rate)
+{
+	struct device *dev =3D &pdev->dev;
+	struct rzn1_timer *timer;
+	int ret;
+
+	/*
+	 * Each timer instance has 6 x 16-bit timers and 2 x 32-bit timers.
+	 *
+	 * Probe the first instance. In that case, timers are assigned as
+	 * follow:
+	 *   - First and second 16-bit timers: clock events per CPU
+	 *   - Last (second one) 32-bit timer: clocksource and sched_clock
+	 *   - Other timers: clock events for all possible CPUs
+	 *
+	 * First step, perform all operation that could fail without calling
+	 * clockevents_config_and_register(), sched_clock_register() nor
+	 * cpuhp_setup_state(). Those operation don't have unregister nor
+	 * teardown counterparts and so, once called, we cannot remove the
+	 * related resource.
+	 */
+
+	/* First step for 16-bit timers and the first 32-bit timers. */
+	ret =3D rzn1_timer_setup_timers(pdev, tab_timers,
+				      RZN1_TIMER_BASE_INDEX_16BIT_TIMERS,
+				      RZN1_TIMER_BASE_INDEX_32BIT_TIMERS,
+				      base, clock_rate);
+	if (ret)
+		return ret;
+
+	/*
+	 * Second step, almost all operations that can fail have been called.
+	 * Timers are ready to work. Start with the last operation that can fail,
+	 * installing and invoking hotplug callbacks
+	 */
+	rzn1_tab_timers =3D tab_timers;
+	ret =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+				"clockevents/rzn1/global_timer:starting",
+				rzn1_local_timer_starting_cpu,
+				rzn1_local_timer_dying_cpu);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Setup CPU hotplug state failed\n");
+
+	/*
+	 * At this point, no more operations can fail. Perform remaining
+	 * operations. Starting by handling the last (second one) 32-bit timer
+	 */
+	timer =3D &tab_timers[RZN1_TIMER_LAST_INDEX_32BIT_TIMERS];
+
+	rzn1_timer_init(timer, RZN1_TIMER_LAST_INDEX_32BIT_TIMERS, base, clock_rate=
);
+	rzn1_timer_config(timer, GENMASK(timer->width - 1, 0), true);
+
+	rzn1_sched_clock =3D timer;
+
+	sched_clock_register(rzn1_sched_read, rzn1_sched_clock->width, rzn1_sched_c=
lock->rate);
+
+	rzn1_clocksource.mask =3D CLOCKSOURCE_MASK(rzn1_sched_clock->width);
+	clocksource_register_hz(&rzn1_clocksource, rzn1_sched_clock->rate);
+
+	/*
+	 * Register clockevents for 16-bit timers (except the first and second
+	 * ones) and for the first 32-bit timer. The first and second 16-bit
+	 * timers clockevents are registered by CPU hotplug startup function set
+	 * previously by the cpuhp_setup_state() call.
+	 */
+	rzn1_timer_register_clkevt(tab_timers,
+				   RZN1_TIMER_BASE_INDEX_16BIT_TIMERS + 2,
+				   RZN1_TIMER_BASE_INDEX_32BIT_TIMERS);
+
+	return 0;
+}
+
+static int rzn1_timer_probe_other(struct platform_device *pdev,
+				  struct rzn1_timer *tab_timers,
+				  void __iomem *base, unsigned long clock_rate)
+{
+	int ret;
+
+	/*
+	 * Probe other instance(s), i.e. not the first one. In that case,
+	 * all timers are used as clock events and available for all possible
+	 * CPUs
+	 *
+	 * First step, perform all operation that could fail without calling
+	 * clockevents_config_and_register(). Unregister counterpart does not
+	 * exist and so, once called, we cannot remove the related resource.
+	 */
+	ret =3D rzn1_timer_setup_timers(pdev, tab_timers,
+				      RZN1_TIMER_BASE_INDEX_16BIT_TIMERS,
+				      RZN1_TIMER_LAST_INDEX_32BIT_TIMERS,
+				      base, clock_rate);
+	if (ret)
+		return ret;
+
+	/*
+	 * Second step, all operation that can fail have been called. We can
+	 * register our timers.
+	 */
+	rzn1_timer_register_clkevt(tab_timers,
+				   RZN1_TIMER_BASE_INDEX_16BIT_TIMERS,
+				   RZN1_TIMER_LAST_INDEX_32BIT_TIMERS);
+	return 0;
+}
+
+static int rzn1_timer_probe(struct platform_device *pdev)
+{
+	struct device *dev =3D &pdev->dev;
+	struct rzn1_timer *tab_timers;
+	unsigned long clock_rate;
+	void __iomem *base;
+	struct clk *clk;
+	int ret;
+
+	tab_timers =3D devm_kcalloc(dev, RZN1_TIMER_NB_TIMERS, sizeof(*tab_timers),
+				  GFP_KERNEL);
+	if (!tab_timers)
+		return -ENOMEM;
+
+	base =3D devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	clk =3D devm_clk_get_enabled(dev, "pclk");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "Failed to get pclk\n");
+
+	clock_rate =3D clk_get_rate(clk);
+
+	scoped_guard(mutex, &rzn1_global_timers_lock) {
+		ret =3D !rzn1_timer_instance ?
+			rzn1_timer_probe_first(pdev, tab_timers, base, clock_rate) :
+			rzn1_timer_probe_other(pdev, tab_timers, base, clock_rate);
+		if (!ret)
+			rzn1_timer_instance++;
+	}
+
+	return ret;
+}
+
+static const struct of_device_id rzn1_timer_of_match[] =3D {
+	{ .compatible =3D "renesas,rzn1-timer", },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver rzn1_timer_driver =3D {
+	.driver =3D {
+		.name =3D "rzn1_timer",
+		.of_match_table =3D rzn1_timer_of_match,
+		.suppress_bind_attrs =3D true,
+	},
+};
+builtin_platform_driver_probe(rzn1_timer_driver, rzn1_timer_probe);
diff --git a/drivers/clocksource/timer-ti-dm.c b/drivers/clocksource/timer-ti=
-dm.c
index 6787acac9a43..8012d3f3e1a3 100644
--- a/drivers/clocksource/timer-ti-dm.c
+++ b/drivers/clocksource/timer-ti-dm.c
@@ -1095,6 +1095,7 @@ static int omap_dm_timer_write_counter(struct omap_dm_t=
imer *cookie, unsigned in
 {
 	struct dmtimer *timer;
 	struct device *dev;
+	int ret;
=20
 	timer =3D to_dmtimer(cookie);
 	if (unlikely(!timer)) {
@@ -1104,7 +1105,10 @@ static int omap_dm_timer_write_counter(struct omap_dm_=
timer *cookie, unsigned in
=20
 	dev =3D &timer->pdev->dev;
=20
-	pm_runtime_resume_and_get(dev);
+	ret =3D pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return ret;
+
 	dmtimer_write(timer, OMAP_TIMER_COUNTER_REG, value);
 	pm_runtime_put_sync(dev);
=20
@@ -1475,7 +1479,8 @@ static int omap_dm_timer_probe(struct platform_device *=
pdev)
=20
 	timer->pdev =3D pdev;
=20
-	if (timer->capability & OMAP_TIMER_ALWON && !IS_ERR_OR_NULL(timer->fclk)) {
+	if (pdata->system_timer_capable &&
+	    timer->capability & OMAP_TIMER_ALWON && !IS_ERR_OR_NULL(timer->fclk)) {
 		if (!omap_dm_timer_sched_clock_counter) {
 			ret =3D omap_dm_timer_setup_clocksource(timer);
 			if (ret)
@@ -1585,6 +1590,7 @@ static const struct dmtimer_platform_data omap3plus_pda=
ta =3D {
=20
 static const struct dmtimer_platform_data am6_pdata =3D {
 	.timer_ops =3D &dmtimer_ops,
+	.system_timer_capable =3D true,
 };
=20
 static const struct of_device_id omap_timer_match[] =3D {
diff --git a/include/linux/platform_data/dmtimer-omap.h b/include/linux/platf=
orm_data/dmtimer-omap.h
index 726d89143842..b78ee4676b98 100644
--- a/include/linux/platform_data/dmtimer-omap.h
+++ b/include/linux/platform_data/dmtimer-omap.h
@@ -57,6 +57,8 @@ struct dmtimer_platform_data {
 	u32 timer_errata;
 	int (*get_context_loss_count)(struct device *);
 	const struct omap_dm_timer_ops *timer_ops;
+	/* always-on timers can be used for clocksource/clockevent */
+	bool system_timer_capable;
 };
=20
 #endif /* __PLATFORM_DATA_DMTIMER_OMAP_H__ */

