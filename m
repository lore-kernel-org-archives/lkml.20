Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D0D4C14F3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792009265; cv=none; b=Zk5XrPLu8mOmXmjuJ15v4/sgrAMzQOPbo2B2TuA4pKaECWvuFD4gSaawmPzCvMAY1jutv8UgGSEJa8IrMV1vgqwVxzMwt7PlMgoEp/lSZTek8naCfwO85cgeOOQGG9Li5tMWIrUeQsi/RI3f/FeUoLfP+GBKFeP2vAip9729Wss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792009265; c=relaxed/simple;
	bh=3rRSdkV+Fy6RqJxOQKWPdOxihiTy8HRbK9xkfz5lBWA=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=GVY+u0eYCqTDkeS5oOU9UD5Hf8sFf3p0fxoOJvCQmjl41tO/0i2PYTgnajBnUZriM0G+Cz8aURz1bxfYvhfIPUSAHTjbtdoqtA0v0NSPbi6nJIdTcPioNHy0zsBbri0MNtEJLgJH1MTFjT8MiWCEF7+hlE3q1gETNIU6Oc/GYe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4TYUPapa; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KD8K5uRa; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4TYUPapa";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KD8K5uRa"
Date: Wed, 14 Oct 2026 20:20:58 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792009259;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=snZWqvkOj5qmH+fSo+fPL24S9mRsYWWAR8nI2+/vKEE=;
	b=4TYUPapaprW+tuZeIsmB7ftG720ko24SHHrccdayc99oas55I/UQBbsukvAqVHdAibtznd
	pvG3SoxNYfC+Vqi3AKlTVg43VufULtdoibBJ1i2+9OcBS9eN+77E3VIj/+BmC349GXUl1M
	xcuk9qHBKONbhrpuM+tD39xqc/PmpYt+d+cs9Q9x9idTcHdcXVa7T4DArd1MAuOUYAuYBN
	8GLQFhoUaecNjt9d3Apt/Aq67SPyYaTH8/3LfPzfEmcTcN07MPM5ZmGemg/UdeJ/rkmkr9
	uXvvWRO8JWSQG6jQ8aW1D0Exbu9bTbRjD3MwWEcWbpPbXSR8w6v1WHmpiNL5ZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792009259;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=snZWqvkOj5qmH+fSo+fPL24S9mRsYWWAR8nI2+/vKEE=;
	b=KD8K5uRaiTQ8Jr5PiEGOSfBO/XkyeTaHNz4qxOVbM3ZmDkn1mao5G4hunYyKYXFtPhmdkN
	vB18yoX6t+7+3dDA==
From: "clocksource-bot for Herve Codina (Schneider Electric)"
 <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-kernel@vger.kernel.org
Subject: [clocksource: timers/drivers/next] clocksource/drivers: Add support
 for the Renesas RZ/N1 timers
Cc: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 daniel.lezcano@oss.qualcomm.com
In-Reply-To: <20261001082225.125956-3-herve.codina@bootlin.com>
References: <20261001082225.125956-3-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179200925825.2666337.12044398783079677468.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/drivers/next branch of c=
locksource:

Commit-ID:     435167b4f30191aa7368de68870117bc7218ee8f
Gitweb:        https://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano=
/linux.git//435167b4f30191aa7368de68870117bc7218ee8f
Author:        Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
AuthorDate:    Thu, 01 Oct 2026 10:22:22 +02:00
Committer:     Daniel Lezcano <daniel.lezcano@kernel.org>
CommitterDate: Fri, 02 Oct 2026 11:42:40 +02:00

clocksource/drivers: Add support for the Renesas RZ/N1 timers

The Renesas RZ/N1 timer block controller is the controller in charge of
timers available in the Renesas RZ/N1 SoCs family.

This controller handles 8 timers:
  - 6 16-bit timers
  - 2 32-bit timers

Each timer has its own interrupt, its own prescaler that can be used to
divide the clock by 25 and all of them can work in either one-shot or
periodic mode.

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@kernel.org>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Link: https://patch.msgid.link/20261001082225.125956-3-herve.codina@bootlin.c=
om
---
 drivers/clocksource/Kconfig      |  11 +-
 drivers/clocksource/Makefile     |   1 +-
 drivers/clocksource/timer-rzn1.c | 483 ++++++++++++++++++++++++++++++-
 3 files changed, 495 insertions(+)
 create mode 100644 drivers/clocksource/timer-rzn1.c

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index d9c76dd..da83483 100644
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
index b46376a..464ec66 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -96,3 +96,4 @@ obj-$(CONFIG_EP93XX_TIMER)		+=3D timer-ep93xx.o
 obj-$(CONFIG_RALINK_TIMER)		+=3D timer-ralink.o
 obj-$(CONFIG_NXP_STM_TIMER)		+=3D timer-nxp-stm.o
 obj-$(CONFIG_RTK_SYSTIMER)		+=3D timer-realtek.o
+obj-$(CONFIG_RZN1_TIMER)		+=3D timer-rzn1.o
diff --git a/drivers/clocksource/timer-rzn1.c b/drivers/clocksource/timer-rzn=
1.c
new file mode 100644
index 0000000..25ebebf
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
