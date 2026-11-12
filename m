Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509730;
	b=lO30tTFtPN20vbbwJPNvN+4Hy65HwEoeh1plNc4rAqWyPrVGr2ccrMepU1GbZ9/9+aUn
	 5BAuzV5PydPdM0MNTThBs/OUHs9bzZkK74N0PKm/dyuUVbiFRhTbqjYkcKuUPTDTSHiWF
	 dVBiKSZ34+3ud0t1Mp8Jgy0kq+bNojqU76HNeD5y0yX0mVKh1L0ePkeopzCFHl04Kzhe7
	 9IMGA3cYQYpalcMcVFr/+UjBpGwESEEeWvLdS/6TxvSsqELrHxHbqCbmeWeoJ4Q04/8eA
	 hA+DoFQo94sVpJL0Uv2SVG6ECPdix6CRP5KQmJUow4fPXDvUtRzCIpzSOlrgkvL7Xbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0y1qYoq7NoViWaxpRI0L9NF8oo0LErcNzMW4ST3VRQI=;
	b=b9WcG1xT1ydoPtjDjjoLXcAWUEIcmTEfxNuaNVfY563v58DOO/6d/JOY/Rcu+FEVCqWZ
	 Nsp95i78R9faeGKi36zc//L0hJCK9/UMu5/Uf7rrTIZnAciYIyUfXNMObxsp10tw3X7L7
	 ry99J/ETaYAKEqpwX9Yr4GhWfwya1xptqZKXUtgDz57J4AzlWgQYe9+ICdX0mkDiqegIL
	 9gKNNjtmbu2CW8WDxIMFGxUk2tWgXTIkE6BwiEYo4Id/Rv/En+mna3qkU9MuzfJjR1E8y
	 N3BfIWJGQtNcb90QR6uQdpHDxSWg4RSNafcocu8crusY88SQtaMcsZsjfXpB+8EC/MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BKj5mvPH;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB0A60A3827
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEB0A60A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BKj5mvPH
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so1040595e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509728; x=1795114528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0y1qYoq7NoViWaxpRI0L9NF8oo0LErcNzMW4ST3VRQI=;
        b=BKj5mvPHlU/G79fJPoXxyusFYo/GtGFce69r3VmdiEr3f2UfXUExRmB7BLnSyZMVA8
         3exIffQ/in5Dq6uUBJx4beSZO0QP9BjSvdOxu5mJJWdsqMhV6Q/a+Q3LJ26z0+IxnT20
         cGzzPe2kKuRFOd7Ck0MwJ2auiPIGHi92GwBQpR/MEZNg2w0KCzMrDTXSjCFBp6ubBYCs
         nWMUw7ILLvPgRxbdvLVh7q7jO3eeTrCDVpxHofHapy/3rF6r4gfDwocWsaIMP7gmrg2v
         oAu5kOyYK3it9dFY4O/NNsocGylnjUOyBgtFGGq30dJYvw7zUPkdlTOdKn3kJeg0nOGY
         VGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509728; x=1795114528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0y1qYoq7NoViWaxpRI0L9NF8oo0LErcNzMW4ST3VRQI=;
        b=lh+wbZlkVii6tjVSUCyYmLA6bWHSXGhx6pGODiOwIYxiVhwvf9yQbLG47V8Qw3p6iD
         1aFPpMUaV1SvTfZjnUpGEUVzpBbH2cBPWGS3Q8gkhGs23C5AdzHhB7iTrEO032rduTEA
         oZrfeEswtabnLXhJdl85Ht48E6ob7l/RwuN+R+4wS3aLKo7tpM/aAODc6c80ohhmmhIK
         FMxCXZQcQOZhVKr2qZCisyXTrTYuniTLm/dMWwqqXu0P8+YBOJXNmiqWZhq8GSTMbXsX
         +bFwt5rEDhvq3JqE2sB124nIcTbUxH3XwIZ5ytVFAI4oMkv+cmZQQ/JmoDIn9BRd4HNX
         M2Fw==
X-Forwarded-Encrypted: i=1; AL+hErFX4V+/n6Tw+DnS05WV01JTLC3cSz+eSp35/Zm+I67LAew35Cwacwa0OiD+HXAJDyesXKptxybkaWD0gAU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9M0eQaEr3UfuMZ7z9vHQdAjAoEkfwIaROqPaT5+oOCcxUeIlTr
	n9OS/gxnC/4TbYRgnZI1076FSlT9oTCItFwureAz2GBGgw2GPtSg1Q7Y
X-Gm-Gg: AYBFou36cSBQUoO5q19uivUihtQXBvCOGs8J35gl1OIui0jbl9nV3aBS9tFe9mzpJb4
	/r00gtZCxEHr6D73x5oBonNEMQcdhVLaGN6XjxK32JzhhZB71rPI/1nYYrWgxAm5JIlPFI0Jt/p
	l3aaIUTfNu5h+KNvRM/MJIESs+5eML91cmRiiuEMX3cZeTEnyXTBEeIn0TjocunsvbMXjkC4S4k
	v3mX5yaDIDvz2sE9OUoyGU5TlwynMeN8AOo5CC7IHFHw4qtZxmfgOkGQ1JdNU9mB7DdQCJQICgo
	oDL0sEJgxfU0Or+VseZ9PD7vW5KUk5DPwfzlDMdncXIHueIhYF7BKu0GAoeB3j4G/NuRG1EIX7q
	ccxWenGV4jcsbwoFqYe+nfNzmiaBmfiajpX6cKULkRINE23tsDtNnqhshpKhVWKg8JgZBiHpNSq
	Ore9SkYWVexf5YWPXO11ztNAL3mC01c4+jsjNe/TjBGb/xZJrYH3HWslsgfMFPYYnOaecYF1saF
	+/p7PS47pjIMtugFqyiKtCx9It8LutOw6BOofpi3nCQ5CA58uS4huqf2IcVp2hV/N0od8f+Fh/h
	wMAAi2n+de4kHcxo4cOpaNUFdh37M0Y58WeYoAPDC+UBMP5VMMlSdyrHb765Qw+XMaBhjdUeI/n
	/rgpxnNtvyxOc0ORm/+ydDMc0s8MP
X-Received: by 2002:a05:600c:1d0e:b0:4a1:d459:db4b with SMTP id 5b1f17b1804b1-4bb55abaef4mr1766655e9.24.1794509728021;
        Thu, 12 Nov 2026 10:55:28 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e28d0b2sm71734755e9.7.2026.11.12.10.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:55:26 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 12 Nov 2026 22:55:10 +0400
Subject: [PATCH v6 3/4] watchdog: Add support for VIA/WonderMedia SoC
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-vt8500-timer-updates-v6-3-fd1cea645d1f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7950; i=alchark@gmail.com;
 h=from:subject:message-id; bh=TKbNAsM+ZSZcFRoALRRcTOU4cJIrVJEa/4qOimCrMHk=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9456aYbiuQlt4Zs1EN36TD5cMnrXz8DWwmkkdsCp7u
 fdswTy/joksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKb62G2G/1W+zZfv/vGWu3vQ/KzhfUvXkE1JFwMNT59tVv8kt0mB0Yfhf0hPetD
 T+j+p638oPl6mcHODinrtrrMsOe9+GiuqaiTOYQAA
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

VIA/WonderMedia SoCs can use their system timer's first channel as a
watchdog device which will reset the system if the clocksource counter
matches the value given in its match register 0 and if the watchdog
function is enabled.

Since the watchdog function is tightly coupled to the timer itself, it
is implemented as an auxiliary device of the timer device. Build it in
rather than as a module, as the timer it depends on is always built in
and the driver is tiny.

Report a watchdog found running at probe, as one armed before a kexec
would be, so that the core keeps it fed until userspace takes over.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 Documentation/watchdog/watchdog-parameters.rst |   7 ++
 MAINTAINERS                                    |   1 +
 drivers/watchdog/Kconfig                       |  12 +++
 drivers/watchdog/Makefile                      |   1 +
 drivers/watchdog/vt8500-wdt.c                  | 132 +++++++++++++++++++++++++
 5 files changed, 153 insertions(+)

diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
index 348229ffcb43..27453b659545 100644
--- a/Documentation/watchdog/watchdog-parameters.rst
+++ b/Documentation/watchdog/watchdog-parameters.rst
@@ -637,6 +637,13 @@ uniphier_wdt:
 
 -------------------------------------------------
 
+vt8500_wdt:
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
 w83627hf_wdt:
     wdt_io:
 	w83627hf/thf WDT io port (default 0x2E)
diff --git a/MAINTAINERS b/MAINTAINERS
index acc4d2915460..80aefe2f5481 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4010,6 +4010,7 @@ F:	drivers/tty/serial/vt8500_serial.c
 F:	drivers/video/fbdev/vt8500lcdfb.*
 F:	drivers/video/fbdev/wm8505fb*
 F:	drivers/video/fbdev/wmt_ge_rops.*
+F:	drivers/watchdog/vt8500-wdt.c
 F:	include/clocksource/vt8500-timer.h
 
 ARM/ZTE ZX29 SOC SUPPORT
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index c884f86be4e3..a252f9c9c2c8 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1183,6 +1183,18 @@ config SUNPLUS_WATCHDOG
 	  To compile this driver as a module, choose M here: the
 	  module will be called sunplus_wdt.
 
+config VT8500_WATCHDOG
+	bool "VIA/WonderMedia VT8500 watchdog support"
+	depends on ARCH_VT8500 || COMPILE_TEST
+	select WATCHDOG_CORE
+	select AUXILIARY_BUS
+	help
+	  VIA/WonderMedia SoCs can use their system timer as a hardware
+	  watchdog, as long as the first timer channel is free from other
+	  uses and respective function is enabled in its registers. To
+	  make use of it, say Y here and ensure that the device tree
+	  lists at least two interrupts for the VT8500 timer device.
+
 # X86 (i386 + ia64 + x86_64) Architecture
 
 config ACQUIRE_WDT
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 19cb25f51624..5a5a111b4815 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -106,6 +106,7 @@ obj-$(CONFIG_SUNPLUS_WATCHDOG) += sunplus_wdt.o
 obj-$(CONFIG_MARVELL_GTI_WDT) += marvell_gti_wdt.o
 obj-$(CONFIG_GUNYAH_WATCHDOG) += gunyah_wdt.o
 obj-$(CONFIG_MA35D1_WDT) += ma35d1_wdt.o
+obj-$(CONFIG_VT8500_WATCHDOG) += vt8500-wdt.o
 
 # X86 (i386 + ia64 + x86_64) Architecture
 obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
diff --git a/drivers/watchdog/vt8500-wdt.c b/drivers/watchdog/vt8500-wdt.c
new file mode 100644
index 000000000000..e0f838fd1d50
--- /dev/null
+++ b/drivers/watchdog/vt8500-wdt.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: 2026 Alexey Charkov <alchark@gmail.com>
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bits.h>
+#include <linux/container_of.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/limits.h>
+#include <linux/minmax.h>
+#include <linux/moduleparam.h>
+#include <linux/stringify.h>
+#include <linux/types.h>
+#include <linux/watchdog.h>
+
+#include <clocksource/vt8500-timer.h>
+
+/* Offsets within the timer register block */
+#define VT8500_WDT_MATCH_REG	0x0000	/* timer match register 0 */
+#define VT8500_WDT_EN_REG	0x0018
+#define VT8500_WDT_EN		BIT(0)
+#define VT8500_WDT_ACC_STS_REG	0x0024	/* timer access status */
+#define VT8500_WDT_ACC_WR_MATCH	BIT(0)	/* match register 0 write pending */
+
+#define VT8500_WDT_DEFAULT_TIMEOUT	30	/* seconds */
+
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
+		 __stringify(WATCHDOG_NOWAYOUT) ")");
+
+/* Arm the watchdog to reset the SoC @cycles counter ticks from now */
+static int vt8500_watchdog_arm(struct vt8500_wdt_info *info, u64 cycles)
+{
+	u32 deadline, sts;
+	int ret;
+
+	/* Let a previous match write settle, as the timer driver does */
+	ret = readl_poll_timeout_atomic(info->regbase + VT8500_WDT_ACC_STS_REG,
+					sts, !(sts & VT8500_WDT_ACC_WR_MATCH),
+					1, 10000);
+	if (ret)
+		return ret;
+
+	/*
+	 * The deadline is matched against the hardware clocksource counter,
+	 * which is a u32 value incrementing at VT8500_TIMER_HZ and continuing
+	 * past wraparound. When the return value of timer_next is greater than
+	 * U32_MAX then the match should occur after the hardware counter wraps
+	 * around, thus we take only the lower 32 bits of timer_next return val
+	 */
+	deadline = info->timer_next(cycles);
+	writel(deadline, info->regbase + VT8500_WDT_MATCH_REG);
+	writel(VT8500_WDT_EN, info->regbase + VT8500_WDT_EN_REG);
+
+	return 0;
+}
+
+static int vt8500_watchdog_start(struct watchdog_device *wdd)
+{
+	struct vt8500_wdt_info *info = watchdog_get_drvdata(wdd);
+	u32 timeout_ms = min(wdd->timeout * 1000, wdd->max_hw_heartbeat_ms);
+
+	return vt8500_watchdog_arm(info,
+				   (u64)timeout_ms * (VT8500_TIMER_HZ / 1000));
+}
+
+static int vt8500_watchdog_stop(struct watchdog_device *wdd)
+{
+	struct vt8500_wdt_info *info = watchdog_get_drvdata(wdd);
+
+	writel(0, info->regbase + VT8500_WDT_EN_REG);
+
+	return 0;
+}
+
+static const struct watchdog_ops vt8500_watchdog_ops = {
+	.start			= vt8500_watchdog_start,
+	.stop			= vt8500_watchdog_stop,
+};
+
+static const struct watchdog_info vt8500_watchdog_info = {
+	.identity		= "VIA VT8500 watchdog",
+	.options		= WDIOF_MAGICCLOSE |
+				  WDIOF_KEEPALIVEPING |
+				  WDIOF_SETTIMEOUT,
+};
+
+static int vt8500_wdt_probe(struct auxiliary_device *auxdev,
+			    const struct auxiliary_device_id *id)
+{
+	struct vt8500_wdt_info *info;
+	struct watchdog_device *wdd;
+
+	wdd = devm_kzalloc_obj(&auxdev->dev, *wdd);
+	if (!wdd)
+		return -ENOMEM;
+
+	wdd->info = &vt8500_watchdog_info;
+	wdd->ops = &vt8500_watchdog_ops;
+	wdd->min_timeout = 1;
+	wdd->timeout = VT8500_WDT_DEFAULT_TIMEOUT;
+	wdd->max_hw_heartbeat_ms = U32_MAX / (VT8500_TIMER_HZ / 1000);
+	wdd->parent = &auxdev->dev;
+
+	info = container_of(auxdev, struct vt8500_wdt_info, auxdev);
+	watchdog_set_drvdata(wdd, info);
+	watchdog_set_nowayout(wdd, nowayout);
+
+	/* Let the core feed a watchdog left running, e.g. across kexec */
+	if (readl(info->regbase + VT8500_WDT_EN_REG) & VT8500_WDT_EN)
+		set_bit(WDOG_HW_RUNNING, &wdd->status);
+
+	return devm_watchdog_register_device(&auxdev->dev, wdd);
+}
+
+static const struct auxiliary_device_id vt8500_wdt_ids[] = {
+	{ .name = "timer_vt8500.vt8500-wdt" },
+	{}
+};
+
+static struct auxiliary_driver vt8500_wdt_driver = {
+	.name =	"vt8500-wdt",
+	.probe = vt8500_wdt_probe,
+	.id_table = vt8500_wdt_ids,
+	.driver = {
+		/* Unbinding would leave the hardware armed with no one to ping */
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_driver(vt8500_wdt_driver, auxiliary_driver_register);

-- 
2.56.0

