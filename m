Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.59.177.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695091;
	b=MYpOunExHS+KbSa7KAhO9c/85bXSkfYFYaj6WSaK8i0g0nmxtaxyDwItJ9TW9TImWUyZ
	 UfGYL5QDWwL8lcdPHzzigxHSJbSR4bmCCc+wi0RZdlH4dt3ja7yu1DOKkiK5qQRX+cTWh
	 syw4EdAAm8YqBFp27KZZ+sd8AJhnQ29dAqsn/eXt6WvIl/hKZVjWSoHvf6DOlcW5deUV4
	 dIV8gQZ7RyX4QyhIZLWNn+RdVQfDOPbDMDBYrncdR/0nj73b2rSXsYOjnoqgyTbg5aSWx
	 c1eZx2xBPmygpHMuTI6J1AiOcEZ4f6x23pNo0p/mwL0hyJlK3WIePo/7Px7Seya0i5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695091;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=fK5hnJ6BVqxeNj5wYeJjy9oobrQUjih9RVGS2P2BCgc=;
	b=2gNB2MdJrj8q0JNa0YGfHcakQyhEf49uwdUt9DNXXK2bTE+PV4vuhsrmrRUsw3lvnt1s
	 nI7hoLFUW7l2vmd38jrNxS5gvOOZ0arXwRdvnaaDX7KaTbwqAwVfl23wfOqL/n8X3kdwM
	 jFPaEhgIPcTSpjHRV52j4f0/i3gGwdDOKRm+Va8mnu0D2q0+Un0WOrcH58lWRqX4gV6ob
	 977ojFKGsbYp83HIwQEobMbqiaY9kYy/886drepapBVyT03YpOqogMbDqxNI8yAiKBWiy
	 fTqZakr44HaIi04ouUSvmlX32ohjayZRwgLdfdwnytR5Uba29fztLB87IGiY7jl5lQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=xc3CX8K7;
	arc=none smtp.remote-ip=52.59.177.22
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099F7606A950;
	Tue,  3 Nov 2026 08:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 099F7606A950
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=xc3CX8K7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793695029;
	bh=fK5hnJ6BVqxeNj5wYeJjy9oobrQUjih9RVGS2P2BCgc=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=xc3CX8K7pQ8i3O+FvlH7cpc6KiOU6Y+9uwi7VEk4JibH8PfCPuXQUSbU3a70aYilP
	 PCAfb/EsBuvDs/6z9BccmtKrttZ1Cg6GcdSaWYvLnMwWqV6UW0sKYP75tNAAWhTnRx
	 xx7pbfeEH7gKt0QdAqSaqKY5L0CDHAKitXYOCv5E=
X-QQ-mid: zesmtpgz8t1793695028t804917f1
X-QQ-Originating-IP: 5KnT2PT2st3GKf4Xg4+NSJgvHyJJ/qvaemaf1dces5I=
Received: from = ( [58.254.69.131])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 03 Nov 2026 16:37:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10217501547226745816
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 03 Nov 2026 08:36:47 +0000
Subject: [PATCH 2/5] clocksource/drivers/spacemit: Add K1 timer support
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-spacemit-soc-timer-v1-2-36722421db6e@linux.spacemit.com>
References: <20261103-spacemit-soc-timer-v1-0-36722421db6e@linux.spacemit.com>
In-Reply-To: <20261103-spacemit-soc-timer-v1-0-36722421db6e@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11793;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=/ryJf6XsNw0O+L75Np/TEcymyq1bfjPiZHi6TJAaEoM=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkv5yopdgo9MZa1r1hp7rSNJfOKt8ZUvdUXLQ9kHmR56
 XFpUXB1RykLgxgXg6yYIkv3A55tBT5RtgUChb4wc1iZQIYwcHEKwETmeTAyHP6/XYLxbcbUKfE2
 OiW7xX/e5svu5dPaXqz88qz7/Uv/ihgZdqnJyk17mdipa7n57eZ/+4V2Xgz6ETRVLuaO44vNG06
 c4AcA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NpoapEztA32ClbZYX1Mj24FsVDqWJjhOx+lDxev5Xiu0GB+4MEF2qZ0S
	Y9kMccYq3bjKlpVswFjxmbrUpynlpHFLgiNQQpHKmA+At7S2TrgjYwCwa31X+Fi3AgyQIx6
	iGxsyBXYPBg6xVkPTxtzyCRjYWDqQ3pl7Y0vFMwaWWCxkUTZHBeUo5BPEwhZjfhX7YHmuey
	zISNZHTHeRdXVhKHKuBknJGpCvF3fGyKDfZqGBAcA8fwyPQ5WBt5c57bvXuUQfKnQfm5Pyr
	X1jzWElvdHkuLItWyJU8NP8QQIvJVYr4yg6VEZMR3gyUVZVw5C8a7IbCODvvMht6FoIiAQo
	Q2/Ss2HShOYlNcST7HldIygRJ1eaaz627B+zH2sHe+p0wFN3P9yGQtK2DlAIpVf2eYpAmO0
	lpjUMz2Nr5TSgUWktljrSd0nO48glUKKxaBLg4PRYopSDoSAKFQFFKQSwNEUVOrw9J8rxER
	GH2Z4M8PP0pXDs+aQ1JSDHzW1EuV3Lf0jjgSl44bsdltecjhYQDut/lzcKIhYDqPaP1RFOS
	CySOKCMDy4L3K9843OHYTzTjOFMoOLcRhfEt1g9MeS2pJDqrGPGYoYMTgabpY7UsB+VIUtI
	uv8ELSCwFIwYxfsYomuWgPRsNu3TQFhwHuJzloIBKPS38ROvNct4f9wbs8ENHEo0Y/CFHY5
	Vr6nAQcxf2q1JTVlblpnDxGZXCEWyTvMQYovfL2hQcUHrKyZOESufd2MvAhZiQ41sHKvbm5
	kDrJ2CgkaGczjq5ZfOTlgFoSMnoJiOg+0VRFlHl/+8N+UWDj4dNd5ACwI22TieZi9rOpnpS
	bF/CmvErDxJZDYRa29165meIvPJtu/q5kix4Toa0t6asyJtDnpB2MPCGsCrA5n2H2tUhQwf
	pDb3Dd4r7KDSlT0lLfHsnEBDOyGh03IBnosQQXTnQVKvfhTC5eTT9cT5l2f6TNbZwT677K1
	riqkluhhSJhsw39OmGsy3bHA9q55KYkEnbrrDV9+zylMwXVyUEjK8TZENKqLnYgLAAPUP9y
	7COBEmcKJFUbc12HK7WuT++fj5qkCPLCUKp/RRIEyRX09nIzHpsjJybnyUPOEGCkgzYTjVZ
	Ho9I8vgx2EybJOzvaC2kpPFf+TFK4afs9UrGv2nyVmwH7GJAC5bj1E7QpNdrS8YXWDGJ5B6
	9j9eTD1jtnPIiBs=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

SpacemiT K1 and K3 have APB timers that can provide a shared clockevent
alongside the per-CPU RISC-V timer. Use counter 0 and its first match
comparator as a oneshot device available to the tick broadcast framework.

Counter enable changes cross clock domains. Wait for the synchronized
counter value to stop changing before reprogramming the match register,
and check interrupt acknowledgment through the status register rather
than reading the write-only clear register. Bound all synchronization
waits and propagate programming failures to the clockevent core.

Obtain the counter rate from the functional clock and protect it against
rate changes. Keep the clocks enabled for the clockevent lifetime and
restore counter configuration through the tick resume callback without
sleeping clock operations. Use a platform driver so clock and reset
providers can probe before the timer is registered.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/clocksource/Kconfig          |  11 ++
 drivers/clocksource/Makefile         |   1 +
 drivers/clocksource/timer-spacemit.c | 312 +++++++++++++++++++++++++++++++++++
 3 files changed, 324 insertions(+)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index da83483296d5..3e7dd5d628cd 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -163,6 +163,17 @@ config RZN1_TIMER
 	    - 2 32-bit timers
 	  Two timers blocks are available in RZ/N1 SoCs.
 
+config SPACEMIT_TIMER
+	bool "SpacemiT K1/K3 timer"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on OF && COMMON_CLK && RESET_CONTROLLER && HAS_IOMEM
+	default y if ARCH_SPACEMIT
+	help
+	  Enable the SoC timer clockevent device on SpacemiT K1 and K3.
+	  It provides a shared oneshot timer for tick broadcast, alongside
+	  the per-CPU RISC-V timer. The RISC-V clocksource continues to
+	  provide timekeeping.
+
 config SUN4I_TIMER
 	bool "Sun4i timer driver" if COMPILE_TEST
 	depends on HAS_IOMEM
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index 464ec6690ab6..dadf9bc77dee 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -33,6 +33,7 @@ obj-$(CONFIG_BCM2835_TIMER)	+= bcm2835_timer.o
 obj-$(CONFIG_CLPS711X_TIMER)	+= clps711x-timer.o
 obj-$(CONFIG_MXS_TIMER)		+= mxs_timer.o
 obj-$(CONFIG_CLKSRC_PXA)	+= timer-pxa.o
+obj-$(CONFIG_SPACEMIT_TIMER)	+= timer-spacemit.o
 obj-$(CONFIG_SUN4I_TIMER)	+= timer-sun4i.o
 obj-$(CONFIG_SUN5I_HSTIMER)	+= timer-sun5i.o
 obj-$(CONFIG_MESON6_TIMER)	+= timer-meson6.o
diff --git a/drivers/clocksource/timer-spacemit.c b/drivers/clocksource/timer-spacemit.c
new file mode 100644
index 000000000000..70076c17b503
--- /dev/null
+++ b/drivers/clocksource/timer-spacemit.c
@@ -0,0 +1,312 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SpacemiT K1/K3 timer clockevent driver
+ *
+ * Copyright (C) 2026 SpacemiT
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/clockchips.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/limits.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+/* Use counter 0 and its first match comparator. */
+#define TMR_CER			0x00
+#define TMR_CMR			0x04
+#define TMR_CCR			0x0c
+#define TMR_MATCH		0x10
+#define TMR_PRELOAD		0x40
+#define TMR_PRELOAD_CTRL		0x50
+#define TMR_IER			0x60
+#define TMR_ICR			0x70
+#define TMR_SR			0x80
+#define TMR_COUNT		0x90
+
+#define TMR_COUNTER_EN		BIT(0)
+#define TMR_FREE_RUNNING		BIT(0)
+#define TMR_CLOCK_MASK		GENMASK(1, 0)
+#define TMR_MATCH0		BIT(0)
+#define TMR_MATCH_MASK		GENMASK(2, 0)
+/* Leave room for match and enable synchronization. */
+#define TMR_MIN_DELTA		16
+
+struct spacemit_timer {
+	void __iomem *base;
+	struct device *dev;
+	struct clock_event_device clkevt;
+	raw_spinlock_t lock;
+	unsigned int sync_us;
+};
+
+static struct spacemit_timer *to_spacemit_timer(struct clock_event_device *evt)
+{
+	return container_of(evt, struct spacemit_timer, clkevt);
+}
+
+static int spacemit_timer_write(struct spacemit_timer *timer, u32 reg, u32 val,
+				u32 mask)
+{
+	u32 tmp;
+
+	writel(val, timer->base + reg);
+	return readl_poll_timeout_atomic(timer->base + reg, tmp,
+					(tmp & mask) == (val & mask), 1,
+					10 * timer->sync_us);
+}
+
+static int spacemit_timer_stop(struct spacemit_timer *timer)
+{
+	u32 val, prev;
+	int ret, i;
+
+	val = readl(timer->base + TMR_CER) & ~TMR_COUNTER_EN;
+	ret = spacemit_timer_write(timer, TMR_CER, val, TMR_COUNTER_EN);
+	if (ret)
+		return ret;
+
+	/*
+	 * CER crosses into the counter clock domain. Its readback alone does
+	 * not show that counting has stopped. COUNT is synchronized back to
+	 * APB, with up to three counter clocks of latency. Wait for a stable
+	 * count before changing the match or preload registers.
+	 */
+	prev = readl(timer->base + TMR_COUNT);
+	for (i = 0; i < 10; i++) {
+		udelay(timer->sync_us);
+		val = readl(timer->base + TMR_COUNT);
+		if (val == prev)
+			return 0;
+		prev = val;
+	}
+
+	return -ETIMEDOUT;
+}
+
+static int spacemit_timer_clear(struct spacemit_timer *timer)
+{
+	u32 val;
+
+	/* ICR is write-only; completion is observed through SR. */
+	writel(TMR_MATCH_MASK, timer->base + TMR_ICR);
+	return readl_poll_timeout_atomic(timer->base + TMR_SR, val,
+					!(val & TMR_MATCH_MASK), 1,
+					10 * timer->sync_us);
+}
+
+static int spacemit_timer_quiesce(struct spacemit_timer *timer)
+{
+	int ret, err;
+
+	ret = spacemit_timer_write(timer, TMR_IER, 0, TMR_MATCH_MASK);
+	/* Still try to stop and acknowledge the timer after a failed write. */
+	err = spacemit_timer_stop(timer);
+	if (!ret)
+		ret = err;
+	err = spacemit_timer_clear(timer);
+
+	return ret ?: err;
+}
+
+static int spacemit_timer_shutdown(struct clock_event_device *evt)
+{
+	struct spacemit_timer *timer = to_spacemit_timer(evt);
+	unsigned long flags;
+	int ret;
+
+	raw_spin_lock_irqsave(&timer->lock, flags);
+	ret = spacemit_timer_quiesce(timer);
+	raw_spin_unlock_irqrestore(&timer->lock, flags);
+
+	return ret;
+}
+
+static int spacemit_timer_next_event(unsigned long delta,
+				     struct clock_event_device *evt)
+{
+	struct spacemit_timer *timer = to_spacemit_timer(evt);
+	unsigned long flags;
+	u32 val;
+	int ret;
+
+	raw_spin_lock_irqsave(&timer->lock, flags);
+
+	ret = spacemit_timer_quiesce(timer);
+	if (ret)
+		goto out;
+
+	ret = spacemit_timer_write(timer, TMR_MATCH, delta - 1, U32_MAX);
+	if (ret)
+		goto out;
+
+	ret = spacemit_timer_write(timer, TMR_IER, TMR_MATCH0, TMR_MATCH_MASK);
+	if (ret)
+		goto out;
+
+	/* Enabling the counter reloads the zero preload value. */
+	val = readl(timer->base + TMR_CER) | TMR_COUNTER_EN;
+	ret = spacemit_timer_write(timer, TMR_CER, val, TMR_COUNTER_EN);
+out:
+	if (ret) {
+		/* Leave a failed programming attempt with interrupts masked. */
+		writel(0, timer->base + TMR_IER);
+		val = readl(timer->base + TMR_CER) & ~TMR_COUNTER_EN;
+		writel(val, timer->base + TMR_CER);
+	}
+	raw_spin_unlock_irqrestore(&timer->lock, flags);
+
+	return ret;
+}
+
+static irqreturn_t spacemit_timer_interrupt(int irq, void *data)
+{
+	struct spacemit_timer *timer = data;
+	unsigned long flags;
+	int ret;
+
+	raw_spin_lock_irqsave(&timer->lock, flags);
+	if (!(readl(timer->base + TMR_SR) & TMR_MATCH0)) {
+		raw_spin_unlock_irqrestore(&timer->lock, flags);
+		return IRQ_NONE;
+	}
+
+	ret = spacemit_timer_quiesce(timer);
+	raw_spin_unlock_irqrestore(&timer->lock, flags);
+	if (ret)
+		dev_err_ratelimited(timer->dev, "Failed to acknowledge timer: %d\n", ret);
+
+	timer->clkevt.event_handler(&timer->clkevt);
+	return IRQ_HANDLED;
+}
+
+static int spacemit_timer_resume(struct clock_event_device *evt)
+{
+	struct spacemit_timer *timer = to_spacemit_timer(evt);
+	unsigned long flags;
+	u32 val;
+	int ret;
+
+	raw_spin_lock_irqsave(&timer->lock, flags);
+	ret = spacemit_timer_quiesce(timer);
+	if (ret)
+		goto out;
+
+	/* Select the functional clock and disable automatic match reload. */
+	val = readl(timer->base + TMR_CCR) & ~TMR_CLOCK_MASK;
+	ret = spacemit_timer_write(timer, TMR_CCR, val, TMR_CLOCK_MASK);
+	if (ret)
+		goto out;
+
+	val = readl(timer->base + TMR_CMR) | TMR_FREE_RUNNING;
+	ret = spacemit_timer_write(timer, TMR_CMR, val, TMR_FREE_RUNNING);
+	if (ret)
+		goto out;
+
+	ret = spacemit_timer_write(timer, TMR_PRELOAD_CTRL, 0, GENMASK(2, 0));
+	if (ret)
+		goto out;
+
+	ret = spacemit_timer_write(timer, TMR_PRELOAD, 0, U32_MAX);
+out:
+	raw_spin_unlock_irqrestore(&timer->lock, flags);
+	return ret;
+}
+
+static int spacemit_timer_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct reset_control *reset;
+	struct spacemit_timer *timer;
+	struct clk *func, *bus;
+	unsigned long rate;
+	int irq, ret;
+
+	timer = devm_kzalloc(dev, sizeof(*timer), GFP_KERNEL);
+	if (!timer)
+		return -ENOMEM;
+
+	timer->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(timer->base))
+		return PTR_ERR(timer->base);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	/* Keep both clocks enabled for the lifetime of the clockevent. */
+	bus = devm_clk_get_enabled(dev, "bus");
+	if (IS_ERR(bus))
+		return dev_err_probe(dev, PTR_ERR(bus), "Failed to enable bus clock\n");
+
+	func = devm_clk_get_enabled(dev, "func");
+	if (IS_ERR(func))
+		return dev_err_probe(dev, PTR_ERR(func), "Failed to enable functional clock\n");
+
+	ret = devm_clk_rate_exclusive_get(dev, func);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to protect timer rate\n");
+
+	rate = clk_get_rate(func);
+	if (rate < 32768 || rate > U32_MAX)
+		return dev_err_probe(dev, -EINVAL, "Invalid timer rate: %lu\n", rate);
+
+	reset = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(reset))
+		return dev_err_probe(dev, PTR_ERR(reset), "Failed to get reset\n");
+
+	ret = reset_control_assert(reset);
+	if (ret)
+		return ret;
+	ret = reset_control_deassert(reset);
+	if (ret)
+		return ret;
+
+	timer->dev = dev;
+	timer->sync_us = DIV_ROUND_UP(3 * USEC_PER_SEC, rate);
+	raw_spin_lock_init(&timer->lock);
+	timer->clkevt.name = dev_name(dev);
+	timer->clkevt.rating = 200;
+	timer->clkevt.features = CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_DYNIRQ;
+	timer->clkevt.cpumask = cpu_possible_mask;
+	timer->clkevt.irq = irq;
+	timer->clkevt.set_next_event = spacemit_timer_next_event;
+	timer->clkevt.set_state_shutdown = spacemit_timer_shutdown;
+	timer->clkevt.set_state_oneshot = spacemit_timer_shutdown;
+	timer->clkevt.tick_resume = spacemit_timer_resume;
+
+	ret = spacemit_timer_resume(&timer->clkevt);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to initialize timer\n");
+
+	ret = devm_request_irq(dev, irq, spacemit_timer_interrupt, IRQF_TIMER,
+			       dev_name(dev), timer);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request timer interrupt\n");
+
+	clockevents_config_and_register(&timer->clkevt, rate, TMR_MIN_DELTA,
+					U32_MAX - 1);
+	return 0;
+}
+
+static const struct of_device_id spacemit_timer_match[] = {
+	{ .compatible = "spacemit,k1-timer" },
+	{ }
+};
+
+static struct platform_driver spacemit_timer_driver = {
+	.probe = spacemit_timer_probe,
+	.driver = {
+		.name = "spacemit-timer",
+		.of_match_table = spacemit_timer_match,
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver(spacemit_timer_driver);

-- 
2.56.0

