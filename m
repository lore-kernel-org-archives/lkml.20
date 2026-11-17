Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.16.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908772;
	b=p2ZCyhGqqe5zu6clI+71u6rIQI7gSl6DlO5x6TAF5PbkQolvbQIevO8cke8WCjcs/9gn
	 lroFIKgqxsGQ0v2zAFkVVLasPZiQo1r0c3KNxiGq8VplRv9qtGiCn5YXjAS9+z8ibB3R9
	 bfR6e7qWUzGgSW3c9+p0sH7Z70jrJi80Kv/TndJ/6PNwggYf6ZSnkFA/6Wbwf0IJp0ctZ
	 K+PLDwrkePlWs5wZJvh3pefsNmuIBA/CT6ylvwRrYWJHqaTMxHiLc6SDJc5wqHylPnhOE
	 /KagbBtzip13r53LdFwoH5qhLDanyEXsOK+ekdVIDsTjdWBgEiG12MmRqX3ocKy3x2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908772;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=dVMnRE3gjgxd8+mv89BUPY3iTdBUG3ETm7RX+bMdK4I=;
	b=hQZ7qkqdAauhXEqO0Ua6Tx0wLck81xMWTBmNfMC2kzDOscex6GB8fmQ4DNaXgWEv75Bm
	 rzIKhjiqdML0ZkdhfhGB1SlSicHgmXYeVnXM0Tbx0UcPNuIcbY1bblViYTlvrWJG1kGVY
	 e+m7xgiERK2DitwmPKPqKdOFZiy/uwxVljwX9L7d1TXOFOsawWvJHUo7ZJ8Xa/1lhsX0z
	 0j4FCuZdf7VKnclFr0rBbx+EWxP8fFSPP0xRy8IKX3qoB8CNb3FiFIVMF8fETJiUU/tWg
	 IabQ0GeOkdox3xlOsxnAlBdMois33udMdkoYMQaBUeLQvYVBft5otln/q2w0SRdHLGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=hDcvaPOh;
	arc=none smtp.remote-ip=54.206.16.166
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A39606A332;
	Tue, 17 Nov 2026 09:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3A39606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=hDcvaPOh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794908724;
	bh=dVMnRE3gjgxd8+mv89BUPY3iTdBUG3ETm7RX+bMdK4I=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=hDcvaPOhTcsY5xyg9eKTUnq4f+znV55B3q/31sKqRnenq9mxlrmXJ0tyLJ/kSx4+s
	 Bm1/Zp1UasIOjePPpEKVwkKbM5SFYJnnO/m+6B7+Dj0krsF/JnJvYBLnV+v0fpPgzC
	 HscWkB1bUAtHUA/4SOKPKfKp/fURuKLxrIa+zGio=
X-QQ-mid: esmtpgz14t1794908723t8076a1ac
X-QQ-Originating-IP: oLkmVX+YBjwsVB82Slms8w5ETe72mNCFx19yrPLmEhw=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 17:45:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18125820488395608816
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 17 Nov 2026 09:45:10 +0000
Subject: [PATCH v2 2/5] clocksource/drivers/spacemit: Add K1 timer support
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
Message-Id: <20261117-spacemit-soc-timer-v2-2-9264d0ea7755@linux.spacemit.com>
References: <20261117-spacemit-soc-timer-v2-0-9264d0ea7755@linux.spacemit.com>
In-Reply-To: <20261117-spacemit-soc-timer-v2-0-9264d0ea7755@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12046;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=EpiPUuS0qNEERTcWrEcoeUD4vnfcFBm1vs38Ef/Vne4=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFl/lNQkzou4s2xN2Tfh+KGmNSZ7F85d3qUtE65lFFS6e
 PO9nVI3OkpZGMS4GGTFFFm6H/BsK/CJsi0QKPSFmcPKBDKEgYtTACbydT4jw3EJWcFNIeV7FT/V
 sF968zMq+tpukbf+B/u8MwKM1MT/mTEyPN5jUd51fc+Se2xCfl6rkmLmJn/3y2P/pROW/y/1WIQ
 4IwA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OfARS1tHiMjem1mxFXIpreCRc9K7Nsfu42wMhuy6HDXV+yk3ZQQsFkM1
	gRAhXpo1ZA6BqyOfMnAEMbc92kjO3bEs5ENhQzmE4C2IChtz4ceoKbm3M8MaximgfD2BHmQ
	0Ww+BOlc8K52hdLe2amohPIzujS+hL9MMtmJldF6JkB+dMmzxci1p5TXvBdYTt9Wh6iYyFK
	2DE1rtXqEWN0vERihK1yEekRtGSKMyAEYLbiS+B4sbokIiCEubMUXugBsbZvKYbjfNq9TTw
	lXe2ElmcPRasfvrUA9xj+6uJVV5JYsYJci89I6UMfwqz33+hBHw7h4Nch+Rw46XhutDYvvi
	ufy8n2QZ84BfeukWR+tKTZVYQoDCPpNFx2jRIb5D+3SyicDFjPMhhTep1WMmCx8ZceFL2U3
	k2ec6eva+IaqnNMSJYIOCEyL4bxvuiv9sXmzehGgao51hwYeuDr4Nx8re9s9W377BYimMnu
	dy/R0bsK43+sQPo4nZ8R82G0EJpz4WD7lHAjGpx5i63EidcuSKNa5GEOD74xQeKRZ08/ADD
	yxs/0nfo+P3IolyDf7fs2KlMoIntbrjFXhqd57RsrslY5r3Y5N2PVQttj2JFkLC1ipFi+CS
	vT+oHGlTs2+V2IW+WaKBsqNbVAgw2Zlp/eg44ZeznZ7xkLjtKrLlLtfqdxXJN3Xv0Q6JT3i
	S3Z+ahbdZsCrHQMo4fppMAWRdY0op0xdR0SdHjZZxBwxhyRUHu/mhGgqqhKV0HAIhNieQ7s
	X/ZgAYmrkOyx7yQjfWcrM3NFfyH+UvDNTF9RYjSK2P+99Sc4u9P+0PbhdP0Fy1Ga+o8TSA/
	IccXT1YyVM93kcqiU+a9E5xrEJQt2vToeSwTTEbii89J8BKafUio+45LSkpx+TlxsbNPwJg
	7+EdLyRGaJMJUOdaFWRkCQcyPAlg2qGl9fbfR7W0jGZF4u0YbZbNPW5axPkFXyItVy41uVX
	FZfurDZXYFgcdSsq49HlGRdwVfs7plgdmw32nLLSlr5GponrPzChRwHC+b82AhdZguhSJCu
	z3C/2r0dnqxXwy0f4wOZrCaoiQdCHChzpLGan2wKQ82pzDSjYMWW1kmgCIpPKlF8+GeWx8m
	XxLkwxRUe6XVtHPjzMcAjKniF/UaqBC6ggkQkL2T5/gHpGs5zUp380=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
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
 drivers/clocksource/timer-spacemit.c | 317 +++++++++++++++++++++++++++++++++++
 3 files changed, 329 insertions(+)

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
index 000000000000..e0f24b133a21
--- /dev/null
+++ b/drivers/clocksource/timer-spacemit.c
@@ -0,0 +1,317 @@
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
+/* COUNT reaches the APB domain up to three counter clocks late. */
+#define TMR_SYNC_CYCLES		3
+/* The slowest counter clock is the 32.768 kHz clock. */
+#define TMR_MIN_RATE		32768
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
+	 * APB with a latency of TMR_SYNC_CYCLES. Wait for a stable count
+	 * before changing the match or preload registers.
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
+	/* The clockevent core takes the rate as a u32. */
+	rate = clk_get_rate(func);
+	if (rate < TMR_MIN_RATE || rate > U32_MAX)
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
+	timer->sync_us = DIV_ROUND_UP(TMR_SYNC_CYCLES * USEC_PER_SEC, rate);
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

