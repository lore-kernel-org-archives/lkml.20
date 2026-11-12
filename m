Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509727;
	b=mpvo0jSZA/CAVCQO8s+eJqcRxS28B8o0hcxy7nj9lCnyxm/nJYw+61GBZ4HhUos+WMGs
	 BwrIEE0MWJ4epFYK/HciL0OD9Al9/g9nbLjVut0bS0NtR/MgfjNdv46R2ATlCqPJpm+pn
	 qRQKr+uQ30HPZ1++X16P4BKG92WYkjGV6mFNy346HjH2h/T/zgJrzZFenzzoCHSQaWkvN
	 OVVLTzwV4XaTmR+11TaIGD3CoTPYz3EEpthFHKSSiKb/1voyjMXv/Qkkwcbdl1dzBbkA4
	 WCLSNTyBAY8H6qRHea7ghsJohpZuPiwA+NVJDTe3NmKXsOWc9p1+umY3oXsedtAoPRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=dY6ypCx6Aqc4mXezTdyvYsWbav3aY7CBv+TwjbEBghk=;
	b=4Q5cvo+Q3V3VC3dNWmUFaMoC0UIdzRtgtW3IxCSPwwCZxJ3qkLwslL09MEAEqK0lm3ER
	 q9OvEOPKwArOIYaenBNg46EM+jwJO7XQV5uR/y/eEGSQWjvRXNjgCUJB8Cz2fJBK61zwD
	 H4jjYta9arFeRqBPUoceSSAgcZK69j21d8YQIaVN1MRG0wNjsmYcupWvfI2H4MfPoqIrC
	 rRG0fot+BIK9mGo/AvgN94iXhrZ/YBQN0R7WgU4vzhZmNQXXrIvPt+IcEy/kVP5aWUpw0
	 SN4KkXV6qnBZ8DC/CE3PO3dMrbj9K4yka+WJPqB8BRgf1mqQwrzRGOLw4n4DyMZaHjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iPT2rCXV;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53496070F59
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B53496070F59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iPT2rCXV
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso1286605e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509725; x=1795114525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dY6ypCx6Aqc4mXezTdyvYsWbav3aY7CBv+TwjbEBghk=;
        b=iPT2rCXVbhmA7ijO/Mv4SoutmSCHx7AV3YFIjskaa2IWbinvEeVODynb6xjOYAucZZ
         LvWRD76co1DGEzZIr0ZJJyp4Rg99vcI64DpSS9mnPzh9uuqF6r5get4IHvx+4klc8v1B
         KXP30HGFOVCweHgRzRD9gu4qM62xM0WY6mHCLISwVipeKCcpJQ/YD3DPdPVG6qrFbdN5
         WoGkD0DRRnKQbTdq+yGumF/32G6sTymjopI9wtS/w6Avk9qIbi2G25pyBaUiS/y9L7Ip
         m27sNDG5OFx+azNz52UjnTaxoD2xckbcxTBtfgUqXbUKSBpp/dxmtPa1AngaS6rShWRK
         GQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509725; x=1795114525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dY6ypCx6Aqc4mXezTdyvYsWbav3aY7CBv+TwjbEBghk=;
        b=vwIApiJSInU0ckMCWDC0mA9DW4shN/zJG42q/EmxDkBZ7kYUlguAc9tltW5Sg3H9jt
         MO5sFpRFdbiOUxXN8KGtEiWE6bd5lCIYSaeiLqJfgwVnjSpnMToCtK8tyRLPqTExa8Bq
         LGUdeJ4+99OWz//nRqRzLUFRoP455v55g3tYt7drmh6m4ykQUHCtk4ZXHA4VHxMsvOWB
         oBNeKyIyJ68KzrZuyQLSJbf0X8pYy1fEr1/TDoItblzlyVZ3ME1hhQcBpF8RU39uMWi9
         C1lYdwITEhM1VBUW9RKMsHPpo/QoThf8JF6XUoVa1cJFcjeXfm3qOOXFSYj++8oBcW6z
         do7w==
X-Forwarded-Encrypted: i=1; AL+hErF2j6EXYBxckwnp4IUlTT6MVIhDhNHdasrwaBdUkgihiJ1dklVsqgyvV0tBtId6sl25LageZVGnuD2k9z8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8V7b1SAtuN94TxOKVvfq4k0weJg3pp2sVpIweSqQztL/5BCxfS
	4SEaS41nBe1PqZSQnsscMybSHHsoAOzAkySFkliACK7pYtGS+kzH8Izh
X-Gm-Gg: AYBFou0s6yZyVlVXt9xmtgoQ5qqE/nXU5leC2dYkLuE66hg/nPKuO38M9YQfOR10AzF
	pbBlxHZEbCNLzYHpmmzc3+hD5BsoZ46UN4jf0IXPpzWGKvz3EG8GWCwK3nlvlDJGQHsXMyw0m3H
	YquHXAMRQzqfAUODQgRAmV+0KgXnw2fcANokKIRHIolAb10OAbQ2kS7jshS7aA3OmuKZwS6AIfk
	QVuDrwBo0edPwL74vKfNEguBHOvgJUx2mMAt+hS6v7YIqe8O9346Df6CaHfFAtsi28/vjWmG4+g
	rMVITwEr/dvbpp9wtbYAn8dOEb/yun5V3Yu2gkl3SZk5pj/K0zmffu8j2b3SmrkG0szyLhfKy+h
	gsvB+WiUjBkKu9StZUYkq5RgzF2dpAA/YkBlVxJiIkH8+8wp7WVFs6ItbeuToUeBBQN1tCZ3X0z
	T66M7CuhAzKUHq9xIrN65ksfEfTZaA4Sd8Gt9cAnF1it6DoVpiXSvFHUO2nE7yCVU2ma/w0BFdO
	1PbE0GsclwK+W08shPJXSea3PVhq54Zlcc3izi8iRhhHm2Fc/foaiAQjdr8sebxxtt5hjFpoS0c
	N5fFzZQaDLK82Mbck7pC8kW+MiN+H+YLt+lHUa5WQ8f1Y1Hr3OHK9ANfUh7oNSmbgTd1JMcEVwA
	G4h8AejQ=
X-Received: by 2002:a05:600c:83ca:b0:4aa:2339:a375 with SMTP id 5b1f17b1804b1-4bb55a4d9b3mr3039565e9.13.1794509725074;
        Thu, 12 Nov 2026 10:55:25 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e28d0b2sm71734755e9.7.2026.11.12.10.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:55:24 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 12 Nov 2026 22:55:09 +0400
Subject: [PATCH v6 2/4] clocksource/drivers/timer-vt8500: Prepare for
 watchdog functionality
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261112-vt8500-timer-updates-v6-2-fd1cea645d1f@gmail.com>
References: <20261112-vt8500-timer-updates-v6-0-fd1cea645d1f@gmail.com>
In-Reply-To: <20261112-vt8500-timer-updates-v6-0-fd1cea645d1f@gmail.com>
To: Alexey Charkov <alchark@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8797; i=alchark@gmail.com;
 h=from:subject:message-id; bh=eTM/WsmEdC1BDL2OwSEVypWxkzCYcnQpKYeJZ89EVmc=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR94566XlXfyt5YU4D3e8shpcjrkyf/4prw28f9l9Ryl
 UePU391dkxkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDV66wY/hf0zfVcPO24hmGOV2tfzS//X7HcHel3ryqpuQtcjXNz2c7IcGNPz4N
 DuicPNZ5o/bKCd4esjsUxg20XOc6b962YrfbbkhcA
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

VIA/WonderMedia system timer can generate a watchdog reset when its
clocksource counter matches the value in the match register 0 and
watchdog function is enabled. For this to work, obviously the clock event
device must use a different match register (1~3) and respective interrupt.

Check if at least two interrupts are provided by the device tree, then use
match register 1 for system clock events and reserve match register 0 for
the watchdog. Keep match register 0 for clock events on device trees that
list a single interrupt, and offer no watchdog there.

Instantiate the watchdog as an auxiliary device of the timer from a
platform driver bound to the timer node, as the timer itself comes up too
early to have a struct device. Share what the watchdog needs through a new
header, include/clocksource/vt8500-timer.h.

Unmap the registers if the timer interrupt is missing, so that no watchdog
gets created on a timer whose counter never started.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 MAINTAINERS                        |   1 +
 drivers/clocksource/Kconfig        |   1 +
 drivers/clocksource/timer-vt8500.c | 127 ++++++++++++++++++++++++++++++++++---
 include/clocksource/vt8500-timer.h |  22 +++++++
 4 files changed, 142 insertions(+), 9 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 27461b2161a7..acc4d2915460 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4010,6 +4010,7 @@ F:	drivers/tty/serial/vt8500_serial.c
 F:	drivers/video/fbdev/vt8500lcdfb.*
 F:	drivers/video/fbdev/wm8505fb*
 F:	drivers/video/fbdev/wmt_ge_rops.*
+F:	include/clocksource/vt8500-timer.h
 
 ARM/ZTE ZX29 SOC SUPPORT
 M:	Stefan Dösinger <stefandoesinger@gmail.com>
diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index da83483296d5..d060863fcc07 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -197,6 +197,7 @@ config TEGRA186_TIMER
 config VT8500_TIMER
 	bool "VT8500 timer driver" if COMPILE_TEST
 	depends on HAS_IOMEM
+	select AUXILIARY_BUS
 	help
 	  Enables support for the VT8500 driver.
 
diff --git a/drivers/clocksource/timer-vt8500.c b/drivers/clocksource/timer-vt8500.c
index c4694cf8bea6..b54ed5d692d7 100644
--- a/drivers/clocksource/timer-vt8500.c
+++ b/drivers/clocksource/timer-vt8500.c
@@ -11,6 +11,7 @@
  * Alexey Charkov. Minor changes have been made for Device Tree Support.
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
@@ -21,9 +22,9 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
+#include <linux/platform_device.h>
 
-#define VT8500_TIMER_OFFSET	0x0100
-#define VT8500_TIMER_HZ		3000000
+#include <clocksource/vt8500-timer.h>
 
 #define TIMER_MATCH_REG(x)	(4 * (x))
 #define TIMER_COUNT_REG		0x0010	 /* clocksource counter */
@@ -53,6 +54,9 @@
 
 static void __iomem *regbase;
 
+/* Which match register to use for the system timer */
+static unsigned int sys_timer_ch;
+
 static u64 vt8500_timer_read(struct clocksource *cs)
 {
 	int loops = msecs_to_loops(10);
@@ -72,21 +76,26 @@ static struct clocksource clocksource = {
 	.flags          = CLOCK_SOURCE_IS_CONTINUOUS,
 };
 
+static u64 vt8500_timer_next(u64 cycles)
+{
+	return clocksource.read(&clocksource) + cycles;
+}
+
 static int vt8500_timer_set_next_event(unsigned long cycles,
 				    struct clock_event_device *evt)
 {
 	int loops = msecs_to_loops(10);
-	u64 alarm = clocksource.read(&clocksource) + cycles;
+	u64 alarm = vt8500_timer_next(cycles);
 
-	while (readl(regbase + TIMER_ACC_STS_REG) & TIMER_ACC_WR_MATCH(0) &&
-	       --loops)
+	while (readl(regbase + TIMER_ACC_STS_REG) &
+	       TIMER_ACC_WR_MATCH(sys_timer_ch) && --loops)
 		cpu_relax();
-	writel((unsigned long)alarm, regbase + TIMER_MATCH_REG(0));
+	writel((unsigned long)alarm, regbase + TIMER_MATCH_REG(sys_timer_ch));
 
 	if ((signed)(alarm - clocksource.read(&clocksource)) <= MIN_OSCR_DELTA)
 		return -ETIME;
 
-	writel(TIMER_INT_EN_MATCH(0), regbase + TIMER_INT_EN_REG);
+	writel(TIMER_INT_EN_MATCH(sys_timer_ch), regbase + TIMER_INT_EN_REG);
 
 	return 0;
 }
@@ -128,16 +137,29 @@ static int __init vt8500_timer_init(struct device_node *np)
 		return -ENXIO;
 	}
 
-	timer_irq = irq_of_parse_and_map(np, 0);
+	/*
+	 * The watchdog function is available on channel 0, but not on other
+	 * channels. So to use it, the clock event device must use a different
+	 * match register (1~3) and respective interrupt.
+	 *
+	 * Check if at least two interrupts are provided by the device tree,
+	 * then use match register 1 for system clock events and reserve match
+	 * register 0 for the watchdog.
+	 */
+	sys_timer_ch = of_irq_count(np) > 1 ? 1 : 0;
+
+	timer_irq = irq_of_parse_and_map(np, sys_timer_ch);
 	if (!timer_irq) {
 		pr_err("%s: Missing irq description in Device Tree\n",
 								__func__);
+		iounmap(regbase);
+		regbase = NULL;
 		return -EINVAL;
 	}
 
 	writel(TIMER_CTRL_ENABLE, regbase + TIMER_CTRL_REG);
 	writel(TIMER_STATUS_CLEARALL, regbase + TIMER_STATUS_REG);
-	writel(~0, regbase + TIMER_MATCH_REG(0));
+	writel(~0, regbase + TIMER_MATCH_REG(sys_timer_ch));
 
 	ret = clocksource_register_hz(&clocksource, VT8500_TIMER_HZ);
 	if (ret) {
@@ -163,4 +185,91 @@ static int __init vt8500_timer_init(struct device_node *np)
 	return 0;
 }
 
+static void vt8500_timer_aux_uninit(void *data)
+{
+	auxiliary_device_uninit(data);
+}
+
+static void vt8500_timer_aux_delete(void *data)
+{
+	auxiliary_device_delete(data);
+}
+
+static void vt8500_timer_aux_release(struct device *dev)
+{
+	struct vt8500_wdt_info *wdt_info;
+	struct auxiliary_device *auxdev;
+
+	auxdev = container_of(dev, struct auxiliary_device, dev);
+	wdt_info = container_of(auxdev, struct vt8500_wdt_info, auxdev);
+	kfree(wdt_info);
+}
+
+/*
+ * This probe gets called after vt8500_timer_init(), which leaves regbase set
+ * only once the clocksource counter is running: that counter and match
+ * register 0 are all the watchdog needs, even if registering the clocksource
+ * or the clock event device failed afterwards. Create the watchdog device as
+ * a child, since the registers are shared.
+ */
+static int vt8500_timer_probe(struct platform_device *pdev)
+{
+	struct vt8500_wdt_info *wdt_info;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	if (!regbase)
+		return dev_err_probe(dev, -ENODEV,
+				     "Timer not initialized, cannot create watchdog\n");
+
+	if (!sys_timer_ch) {
+		dev_info(dev, "Not enabling watchdog: only one irq was given\n");
+		return 0;
+	}
+
+	wdt_info = kzalloc_obj(*wdt_info);
+	if (!wdt_info)
+		return -ENOMEM;
+
+	wdt_info->timer_next = &vt8500_timer_next;
+	wdt_info->regbase = regbase;
+	wdt_info->auxdev.name = "vt8500-wdt";
+	wdt_info->auxdev.dev.parent = dev;
+	wdt_info->auxdev.dev.release = &vt8500_timer_aux_release;
+
+	ret = auxiliary_device_init(&wdt_info->auxdev);
+	if (ret) {
+		kfree(wdt_info);
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(dev, vt8500_timer_aux_uninit,
+				       &wdt_info->auxdev);
+	if (ret)
+		return ret;
+
+	ret = auxiliary_device_add(&wdt_info->auxdev);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, vt8500_timer_aux_delete,
+					&wdt_info->auxdev);
+}
+
+static const struct of_device_id vt8500_timer_of_match[] = {
+	{ .compatible = "via,vt8500-timer", },
+	{},
+};
+
+static struct platform_driver vt8500_timer_driver = {
+	.probe  = vt8500_timer_probe,
+	.driver = {
+		.name = "vt8500-timer",
+		.of_match_table = vt8500_timer_of_match,
+		.suppress_bind_attrs = true,
+	},
+};
+
+builtin_platform_driver(vt8500_timer_driver);
+
 TIMER_OF_DECLARE(vt8500, "via,vt8500-timer", vt8500_timer_init);
diff --git a/include/clocksource/vt8500-timer.h b/include/clocksource/vt8500-timer.h
new file mode 100644
index 000000000000..956863d50d02
--- /dev/null
+++ b/include/clocksource/vt8500-timer.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef CLOCKSOURCE_VT8500_TIMER_H_
+#define CLOCKSOURCE_VT8500_TIMER_H_
+
+#include <linux/auxiliary_bus.h>
+#include <linux/types.h>
+
+#define VT8500_TIMER_HZ		3000000
+
+/**
+ * struct vt8500_wdt_info - timer resources shared with the watchdog
+ * @auxdev: auxiliary device the watchdog driver binds to
+ * @timer_next: returns the clocksource counter value @cycles from now
+ * @regbase: timer register block; the watchdog uses match register 0
+ */
+struct vt8500_wdt_info {
+	struct auxiliary_device auxdev;
+	u64 (*timer_next)(u64 cycles);
+	void __iomem *regbase;
+};
+
+#endif /* CLOCKSOURCE_VT8500_TIMER_H_ */

-- 
2.56.0

