Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576298;
	b=WX74sTKA/jRTDFOmiDJVjEQ99mGAq+Z7mbj0KrmErqZz27D42xh0HBZHsuIUpnpqHNQp
	 icAvWfcbTCYUrzTevlDZi5V0nSbYfnAWAe0rmYQVRSnOKcii5bI9ln2tJvBe2E2nJlXoN
	 jQ8zfslsGjkqGIUKxxkgENOU37c5jvsCiha2A6OkiFSoJf94TMWEXQ158Z3TleEkEjMEa
	 28a12MEG0YbGao5s8TTWApGNkTgeecTgyZHpnHh7Mc2S6pVjhB6ziqo6R79L+++oFGVpE
	 Q++mB3wsuiJbv4DQsSwSuiYnTdvz5BJcWdrfILWWcHyuo04QFFXnmAuGBUVHOV4QrOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6BwyZXaVSatDJOrT+DlVGlFui1bbW5cnZJSxQxMX77g=;
	b=WpmnCXADlJG9YJL7wguXLEv5IHpDFDGr/w3sbPdqM5q4QfCHmizkXY/5KcFkR/qowE9S
	 pFU4NSFUMLzQaihOWQq8xQSLSaYb+FUMzWU+kzItwRhDwX0gMyG50yGoNMcp2rgEHC2Bw
	 loI92OLqJBnTaopK6zUb+s4LN0X1wPEJLF7eVF220+KCUIglWxZc/i9xkRTX/TUDgXTiK
	 MntNzu1stzBaCj+/U4mqNa+xRMUoO/kFnC1D2aYWrb/gD5YGwp3JQIl4IFlWNkfDMiokg
	 YbvTMkNLpR7fB+5D0vyahivlT/hWcvKsD//rN60BhrOb8QsEiImo77mqdE70b89mGuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZUxX97yu;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF79C606B569
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF79C606B569
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZUxX97yu
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-49465892f7bso1012949f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794576296; x=1795181096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6BwyZXaVSatDJOrT+DlVGlFui1bbW5cnZJSxQxMX77g=;
        b=ZUxX97yuSpUty+9W3qiJFCDoHj6G6dandGd3P8qa4TSrcJevnOaoaxawYbRrg2+iXP
         aScHQGOTOlJOFvo00czYB4b09PPDOb+T+V9RSbLZxaa0fjVIagK0IgUT69jkgKNJhTbx
         6/cfm6FSiQB5F7ONn2/y15fQ5KsAVz+zl3jxVnn3R/7rP6clqpXV+1M8WBbgutweJHVh
         d7MouLfvm92/px0Ab9Q4lwgmtVDcb6Wd56bfSULmKO0phfc8r9GgD96GBpgHOYiUaCBO
         kv7PT8HyK/s+iXW1YSfBrHwAGlWV7/SyDcSKWoJLVwP6HYRb8H6xcPmis4pswF6WqOci
         hTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576296; x=1795181096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6BwyZXaVSatDJOrT+DlVGlFui1bbW5cnZJSxQxMX77g=;
        b=YCXBS8YLdVi8Z78ZCxi6kMrNL1YI49+67ECQoM6M2su196GuLDTKL5d+xobRIpKix7
         F1dBTGNnxmnAt0jnonKOTcT/7M4hi3XKjvwISueKHEi6q8Ue6D0nSpjFeHnhXMl8YfLM
         1qbI1jFQnUG24Q2pv8O3uv4sLD7Zn2PHiNznL1G9H7No7yPIbVkTjMMR+1aWG0rnxtNT
         Gqu19CAPd4N+DIcPOFBmp2Fiy4nM/4LOZiaWFZ+myjeu7t7npZgNH5/D23mc3tDbcD9l
         QhuLGHw0hUiWtoUZ8SV+FI5S6z00VfzLJPJNs6KYE3TYQH2FveKyU07Z3HwwfUza5Jet
         Fi+A==
X-Forwarded-Encrypted: i=1; AL+hErG+TE3k1/dpEDf3G3mamofusnIcwXNoAUHiFq1obEZ27oowPPeKxdDUC+PrcrBgRIJcCfFjpVpICa2CqTA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mM64qyWx3HxBzm/fOnj/XMoB6AesfUj00iCxP9PrdG0tiTo/j
	xnpuEp7r+l4zAl5JtK+zadhxCHsvRWSwNzb1H3AfuXXc2fhDX9XVgo3V
X-Gm-Gg: AYBFou2gCDmeeH5ZaUOxnkWT69xxFy8+zs/9FVDEanxbTp7r/W2ROaDmVo9Zr0kzVQS
	ufYgv5BGNyMsuVAD0jk6GZRPNlG4/ZH/lXmCo1rwrp5YAT3/6FrZMppd1VpqK94bEc1P7Kl6KHF
	6eIg0KnsBhDIsx77A4GbojvD+qzLCKxrXj+EtZSRmuo6LwycT9Za6zu9VHX+UWK71dfrX5vcPcj
	VSFelNSK5zceomiTHaJpYNjZ3+roj4lNRqCqlvGDYz+o9kePJ77RA8mX2wGOxhr5Sn5BHr9k071
	YxTLshSilgEot+NBPXuLfO4IsAnEYOdZKM03UnWcDhfVpHEwnQxO2NhXadmlu29tsi9pKLO07+6
	rVVgzqov77CZEKyqJf9X23g8rermFlcNluCe1lBNxeV+PfCL+dLjiI7c0IekvqdpROpwFhNADK/
	kLlYz7ytipHrAbAD43Bgbu1s0fyM1l4G5LHYt0GFK3QpkCO8Lvqv+6nt7m7J/cpOvBNswgwsUcw
	8Avt5MbgiaBV2TGo5+9rjZypoP6jLbVq54Z0Iq09AQD3FnXQSqbETUx7ZjIMbCNwK2yaew0IjYl
	c4Deut0xxSfrtsNLLZdDimsg68ekAZ5VAr3P2EQjfGxydazKjEt8DRaZyo+NABVCZYwetH5pZ2Z
	QsBGtc4w=
X-Received: by 2002:a05:6000:4a08:b0:48c:49bd:62df with SMTP id ffacd0b85a97d-49c6d63fbc3mr5457891f8f.1.1794576295782;
        Fri, 13 Nov 2026 05:24:55 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm4680211f8f.57.2026.11.13.05.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:24:55 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 13 Nov 2026 17:24:41 +0400
Subject: [PATCH v7 2/4] clocksource/drivers/timer-vt8500: Prepare for
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
Message-Id: <20261113-vt8500-timer-updates-v7-2-a1dcc4031b12@gmail.com>
References: <20261113-vt8500-timer-updates-v7-0-a1dcc4031b12@gmail.com>
In-Reply-To: <20261113-vt8500-timer-updates-v7-0-a1dcc4031b12@gmail.com>
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
 h=from:subject:message-id; bh=5DdTPTv9ZzwJsaVqiqLCcCVuOHUAj1GkaRC43w/zm68=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9518w8+i5yqfT+vsvGOxOjP3yoefKld097NoCp64fX
 /SyvuViaMcEFgYxLgZLMUWWud+W2E414pu1y8PjK8wcViaQIdIiDQxAwMLAl5uYV2qkY6Rnqm2o
 Z2ikY6xjxMDFKQBTvVqB4Z91368/oReCvGIV/9rbBG+svrLCp7T3xYzd/95a9f3St7Bg+DH3lN1
 T4R6L8vf5cWqHdtyuPflUap4Np2DvHbmJXJ1mTAA=
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
index 7070cf5dbfe9..e8c2b1101b68 100644
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

