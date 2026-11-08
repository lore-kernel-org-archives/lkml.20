Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794173317;
	b=PfcOHKILnvX9DmbmX6bZ/lNaA53OMyd+xXfgBG7/KWkpD6A7jG++ug0ecUm4DON8Fzjm
	 i/Bve9kAtfpQD+uXrvOkAj9BTOT5lbtT4jInfyW4ND5TNVW0kjgvaMC7bL0P4NkmjEk3R
	 X+19L/QZfxbI1kPwLST7cm/9kPndX7+TStK9d8xOvegzB7wto+yT0N7yikeiKhyZ7C4cq
	 H8Lx4j2rOcHU8qgNnXSbvZ8gzvDwzjBdTJSNr+dCQkmBvorIXdCKLh5sE3EN2e9T1MZp4
	 U/b1KIXgC3Lj79bPeKPKrHfEGWcYZAGjPvWsEbkt9StMFvgcGwDKh3GJOiEKuQw99uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794173317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9c+0JpSdppPnVjAStrh5Kr2A5OTKsZL2ZVgzfm3fxgE=;
	b=i0ZNyA+bT+ZlJUrugk+y0WvT61BK5o4hOYmVgLuvyeBgod4oFcWgl4k1YdoTKDtibh+u
	 zHzmQXp+lIvAprxVlzBLVmvXLVIJyhFReNvTx6YHJp4XrWp5YxvrIIno5OIog//EHaZaE
	 nn4Hxjv/tQu/uxxdZyJ7Ic91ZiKDZWu0XT5bw7y7vY0S2owRCCEcAkoKO7WiB5hXA+ESf
	 ByZgxgVneBrZHb4wzykoYSPMLJlRIu5VgSopmXvy+5KAYcYvl/dXpSYB5EAP9K1EiQ7f2
	 CwlY1HrZNrwxtdwcgrxMM1iTxneo8nRdNSCoqVLfqnpdKTQJLRdmXTPcf6UCENCMAEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PgpDdVIx;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88DB606A334
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E88DB606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PgpDdVIx
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-491846221ffso182624f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173315; x=1794778115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9c+0JpSdppPnVjAStrh5Kr2A5OTKsZL2ZVgzfm3fxgE=;
        b=PgpDdVIx/mpgGNCCJApF6AZESXgqSEc5qyt0BmoMBWQmKJr4Bx06q7rOs7hNR2/C1h
         bstlpM8zG2xbQ4i4zvS/M+iWQ1SMcxdnGLBh4QwX+g7O+LxJBkF2deRFxribGRFBriWT
         wkpeUtpqvtGTkqq0secG3uxy79ZgdpBZZLXln/jC2wmxehu5i411JiuU4fgMQYzaX9XX
         4pjkBhNlOAEBpqIBZoqGZJl1Rxa4lRcWUdQJBMT+KNk16GeUrKEUHFt0pFmQMgbxEgmx
         32bP1+4youAY47Cd19yCEF/u0ojrv9mVrTczYevdN9+qBvDSJPBXTGmZo70ZX5kh+N0q
         9CPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173315; x=1794778115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9c+0JpSdppPnVjAStrh5Kr2A5OTKsZL2ZVgzfm3fxgE=;
        b=IuhjkXdVgqJHhJLGjJOCC8vSLDeM0PVOs5cFcoEBC/eCZc+G+D1tU3xxHiKJAVrTsF
         TcgOFN6WTBjl7Vgr6affNvLYlubRTk0jtzWZpJTgYPO5+XdiE9Wv7PLvat1O7SkVQuQC
         tI3B5Jn1P4sUyWl2pNkMAkOwY/EXGbBx7f3zhXlbfLv1atMzityzHNUPEmvpt4yByKLj
         OFaJFYemxDBI2VK7XUjYCIhxCfgGUKdZ3BnC3wI4XKVWAHOPjMQ6QiGjlgWTjjlYa+0Q
         C7Oqx4R/JZYdffrShAkavgKeKWN2N91uzXlg7SF+rJIBWn5/CTLzl2jQ0S1xiXW2oWWN
         N4lQ==
X-Forwarded-Encrypted: i=1; AL+hErHf0gQG2Br8FX5whwNLPI2WIzpBYDD/HfjvvgjQXLVg5qsh0PITyIWaF/3jMH+foLMG3DDC3UoDEXj+nQ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rVy54NgQJm20SvzLeWXTEJ3mo3RtWJNtO/L/Ofea2c0ckDyHk
	GZGqPzZsiTNidhdRYCp3D593lXmxnREE5apJAAyohj4fjRXS4awJcTgW
X-Gm-Gg: AYBFou3vU7nMQBvlTN8djKevb0cOLFOIP5AYJsVcMGVFd0hSNbPRtD6y2FHygLWjMgW
	HbHYi2uqZ05puw+q27cfT0Prrevno4/4QB0bZGag8rhaBVJf1Z70bqDlH6bc18sl8/K+bT3dXXK
	WCI3/lQHN3g5DSKhkXfFRcXP+IYq7nxP0Qi2wVqyx63ecuDldv8Sl17Cw5wBwL/IzyZKbsU5RGO
	ZfHXYUgAYefU8HEUDf1Mc/QH6iNgJwdyYmCf4E/Sy4OfRtKR8ODQWc/Mi/oBssrFENb29ElyhRk
	CZFi8Izd8vOrnQnUjRhAL693fOW6pzyGjJ/xsCHYOYIfln4A90SDFKUDNYj/tOGa4XjkQYQi6DR
	tKs3P/5XrUMzm9bVYJUO5+UiQwYD1TPahV6U0SjQzwDuKyANJHqEiX2yglUP+1npm2I0pDVztZa
	j9O4bfnU6b/70inaS5phUdxsPMMmf5HDjtnDpw6DphPpruDSq26eB1KUd+x7ktLUxVEPHkEgtuN
	N1oF6h7iD2B2r4MlAcA5lrykA5boPZTsJyEEBCKMQgaGlvcqqa8qp2PMQqdAzRuLqmZIPK527Rt
	q9sXnUpJh3zcvc/FmZZBc577W5V/pHrfmg==
X-Received: by 2002:a05:6000:2c0b:b0:48f:bcdf:6f7d with SMTP id ffacd0b85a97d-4958b9106c3mr4719669f8f.34.1794173315099;
        Sun, 08 Nov 2026 13:28:35 -0800 (PST)
Received: from hp-z640.fritz.box ([109.76.148.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597091400sm5692050f8f.32.2026.11.08.13.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:28:34 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>,
	Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v2 2/4] rtc: Add StarFive JH7110 RTC driver
Date: Sun,  8 Nov 2026 21:28:24 +0000
Message-ID: <20261108212826.15890-3-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261108212826.15890-1-oo.hehir@gmail.com>
References: <20261108212826.15890-1-oo.hehir@gmail.com>
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

From: "ziv.xu" <ziv.xu@starfivetech.com>

Add a driver for the RTC in the always-on domain of the StarFive JH7110
SoC. It supports time, alarm with wakeup, and the frequency offset.

Signed-off-by: ziv.xu <ziv.xu@starfivetech.com>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
[Owen: rework of the StarFive vendor driver for mainline: drop hardware
 calibration & the default time set in probe, use the generic wake IRQ
 helpers, wait for the update bit in set_time, re-read a time that rolls
 over during the read, round the offset to the nearest step & follow the
 sysfs offset sign, enable the 32k counter clock]
Co-developed-by: Owen O'Hehir <oo.hehir@gmail.com>
Signed-off-by: Owen O'Hehir <oo.hehir@gmail.com>
---
 drivers/rtc/Kconfig      |  11 ++
 drivers/rtc/Makefile     |   1 +
 drivers/rtc/rtc-jh7110.c | 323 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 335 insertions(+)
 create mode 100644 drivers/rtc/rtc-jh7110.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 73ec9230e..332f2e022 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1807,6 +1807,17 @@ config RTC_DRV_MPC5121
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-mpc5121.
 
+config RTC_DRV_JH7110
+	tristate "StarFive JH7110 RTC"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	help
+	  If you say yes here you get support for the RTC in the always-on
+	  domain of StarFive JH7110 SoCs, with alarm and frequency offset
+	  support.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called rtc-jh7110.
+
 config RTC_DRV_JZ4740
 	tristate "Ingenic JZ4740 SoC"
 	depends on MIPS || COMPILE_TEST
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 46f1a0fc2..a5cddb8d8 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -82,6 +82,7 @@ obj-$(CONFIG_RTC_DRV_IMX_BBM_SCMI)	+= rtc-imx-sm-bbm.o
 obj-$(CONFIG_RTC_DRV_ISL12022)	+= rtc-isl12022.o
 obj-$(CONFIG_RTC_DRV_ISL12026)	+= rtc-isl12026.o
 obj-$(CONFIG_RTC_DRV_ISL1208)	+= rtc-isl1208.o
+obj-$(CONFIG_RTC_DRV_JH7110)	+= rtc-jh7110.o
 obj-$(CONFIG_RTC_DRV_JZ4740)	+= rtc-jz4740.o
 obj-$(CONFIG_RTC_DRV_LOONGSON)	+= rtc-loongson.o
 obj-$(CONFIG_RTC_DRV_LP8788)	+= rtc-lp8788.o
diff --git a/drivers/rtc/rtc-jh7110.c b/drivers/rtc/rtc-jh7110.c
new file mode 100644
index 000000000..d2d89cdd4
--- /dev/null
+++ b/drivers/rtc/rtc-jh7110.c
@@ -0,0 +1,323 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RTC driver for the StarFive JH7110 SoC
+ *
+ * Copyright (C) 2021 StarFive Technology Co., Ltd.
+ */
+
+#include <linux/bcd.h>
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_wakeirq.h>
+#include <linux/reset.h>
+#include <linux/rtc.h>
+
+#define JH7110_RTC_CFG			0x00
+#define  JH7110_RTC_CFG_ENABLE		BIT(0)
+#define  JH7110_RTC_CFG_CAL_SEL_HW	BIT(2)
+#define  JH7110_RTC_CFG_HOUR_24H	BIT(3)
+#define JH7110_RTC_SW_CAL_VALUE		0x04
+#define JH7110_RTC_IRQ_EN		0x10
+#define JH7110_RTC_IRQ_EVENT		0x14
+#define  JH7110_RTC_IRQ_ALARM		BIT(4)
+#define  JH7110_RTC_IRQ_ALL		GENMASK(4, 0)
+#define  JH7110_RTC_EVENT_UPDATE	BIT(31)
+#define JH7110_RTC_CAL_VALUE		0x24
+#define JH7110_RTC_CFG_TIME		0x28
+#define JH7110_RTC_CFG_DATE		0x2c
+#define JH7110_RTC_ACT_TIME		0x34
+#define JH7110_RTC_ACT_DATE		0x38
+#define JH7110_RTC_TIME			0x3c
+#define JH7110_RTC_DATE			0x40
+
+#define JH7110_RTC_TIME_SEC		GENMASK(6, 0)
+#define JH7110_RTC_TIME_MIN		GENMASK(13, 7)
+#define JH7110_RTC_TIME_HOUR		GENMASK(20, 14)
+#define JH7110_RTC_DATE_DAY		GENMASK(5, 0)
+#define JH7110_RTC_DATE_MON		GENMASK(10, 6)
+#define JH7110_RTC_DATE_YEAR		GENMASK(18, 11)
+
+#define JH7110_RTC_CAL_MASK		GENMASK(15, 0)
+#define JH7110_RTC_TICKS_PER_SEC	32768
+
+#define JH7110_RTC_SYNC_TIMEOUT_US	1000
+
+struct jh7110_rtc {
+	struct rtc_device *rtc;
+	void __iomem *base;
+};
+
+static void jh7110_rtc_reg2tm(struct rtc_time *tm, u32 time, u32 date)
+{
+	tm->tm_sec = bcd2bin(FIELD_GET(JH7110_RTC_TIME_SEC, time));
+	tm->tm_min = bcd2bin(FIELD_GET(JH7110_RTC_TIME_MIN, time));
+	tm->tm_hour = bcd2bin(FIELD_GET(JH7110_RTC_TIME_HOUR, time));
+	tm->tm_mday = bcd2bin(FIELD_GET(JH7110_RTC_DATE_DAY, date));
+	tm->tm_mon = bcd2bin(FIELD_GET(JH7110_RTC_DATE_MON, date)) - 1;
+	tm->tm_year = bcd2bin(FIELD_GET(JH7110_RTC_DATE_YEAR, date)) + 100;
+}
+
+static u32 jh7110_rtc_tm2time(struct rtc_time *tm)
+{
+	return FIELD_PREP(JH7110_RTC_TIME_SEC, bin2bcd(tm->tm_sec)) |
+	       FIELD_PREP(JH7110_RTC_TIME_MIN, bin2bcd(tm->tm_min)) |
+	       FIELD_PREP(JH7110_RTC_TIME_HOUR, bin2bcd(tm->tm_hour));
+}
+
+static u32 jh7110_rtc_tm2date(struct rtc_time *tm)
+{
+	return FIELD_PREP(JH7110_RTC_DATE_DAY, bin2bcd(tm->tm_mday)) |
+	       FIELD_PREP(JH7110_RTC_DATE_MON, bin2bcd(tm->tm_mon + 1)) |
+	       FIELD_PREP(JH7110_RTC_DATE_YEAR, bin2bcd(tm->tm_year - 100));
+}
+
+static int jh7110_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct jh7110_rtc *jrtc = dev_get_drvdata(dev);
+	u32 time, date;
+
+	/*
+	 * re-read if the time rolled over between reading TIME & DATE, since
+	 * that rollover can also change the date.
+	 */
+	do {
+		time = readl(jrtc->base + JH7110_RTC_TIME);
+		date = readl(jrtc->base + JH7110_RTC_DATE);
+	} while (time != readl(jrtc->base + JH7110_RTC_TIME));
+
+	jh7110_rtc_reg2tm(tm, time, date);
+
+	return 0;
+}
+
+static int jh7110_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct jh7110_rtc *jrtc = dev_get_drvdata(dev);
+	u32 val;
+
+	writel(jh7110_rtc_tm2time(tm), jrtc->base + JH7110_RTC_CFG_TIME);
+	writel(jh7110_rtc_tm2date(tm), jrtc->base + JH7110_RTC_CFG_DATE);
+
+	/*
+	 * The counter loads CFG_TIME & CFG_DATE on this pulse; the bit appears
+	 * to read back as 1 until the load is done.
+	 */
+	writel(JH7110_RTC_EVENT_UPDATE, jrtc->base + JH7110_RTC_IRQ_EVENT);
+
+	return readl_poll_timeout(jrtc->base + JH7110_RTC_IRQ_EVENT, val,
+				  !(val & JH7110_RTC_EVENT_UPDATE), 10,
+				  JH7110_RTC_SYNC_TIMEOUT_US);
+}
+
+static int jh7110_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct jh7110_rtc *jrtc = dev_get_drvdata(dev);
+	u32 val;
+
+	val = readl(jrtc->base + JH7110_RTC_IRQ_EN);
+	if (enabled)
+		val |= JH7110_RTC_IRQ_ALARM;
+	else
+		val &= ~JH7110_RTC_IRQ_ALARM;
+	writel(val, jrtc->base + JH7110_RTC_IRQ_EN);
+
+	return 0;
+}
+
+static int jh7110_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct jh7110_rtc *jrtc = dev_get_drvdata(dev);
+
+	jh7110_rtc_reg2tm(&alrm->time, readl(jrtc->base + JH7110_RTC_ACT_TIME),
+			  readl(jrtc->base + JH7110_RTC_ACT_DATE));
+	alrm->enabled = !!(readl(jrtc->base + JH7110_RTC_IRQ_EN) & JH7110_RTC_IRQ_ALARM);
+
+	return 0;
+}
+
+static int jh7110_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct jh7110_rtc *jrtc = dev_get_drvdata(dev);
+	u32 val;
+	int ret;
+
+	jh7110_rtc_alarm_irq_enable(dev, 0);
+	writel(jh7110_rtc_tm2time(&alrm->time), jrtc->base + JH7110_RTC_ACT_TIME);
+	writel(jh7110_rtc_tm2date(&alrm->time), jrtc->base + JH7110_RTC_ACT_DATE);
+	writel(JH7110_RTC_IRQ_ALARM, jrtc->base + JH7110_RTC_IRQ_EVENT);
+
+	ret = readl_poll_timeout(jrtc->base + JH7110_RTC_IRQ_EVENT, val,
+				 !(val & JH7110_RTC_IRQ_ALARM), 10,
+				 JH7110_RTC_SYNC_TIMEOUT_US);
+	if (ret)
+		return ret;
+
+	return jh7110_rtc_alarm_irq_enable(dev, alrm->enabled);
+}
+
+/*
+ * 1 sec for the RTC = CAL_VALUE + 1 cycles of the 32.768 kHz clock.
+ * Default of 0x7fff = exactly one second.
+ * Each step of CAL_VALUE changes the rate by 1/32768, about 30.5 ppm.
+ */
+static int jh7110_rtc_read_offset(struct device *dev, long *offset)
+{
+	struct jh7110_rtc *jrtc = dev_get_drvdata(dev);
+	s64 ticks;
+
+	ticks = (readl(jrtc->base + JH7110_RTC_CAL_VALUE) & JH7110_RTC_CAL_MASK) + 1;
+	*offset = DIV_S64_ROUND_CLOSEST((ticks - JH7110_RTC_TICKS_PER_SEC) * NSEC_PER_SEC,
+					JH7110_RTC_TICKS_PER_SEC);
+
+	return 0;
+}
+
+static int jh7110_rtc_set_offset(struct device *dev, long offset)
+{
+	struct jh7110_rtc *jrtc = dev_get_drvdata(dev);
+	s64 ticks;
+	u32 val;
+
+	if (offset < -NSEC_PER_SEC || offset > NSEC_PER_SEC)
+		return -ERANGE;
+
+	ticks = JH7110_RTC_TICKS_PER_SEC +
+		DIV_S64_ROUND_CLOSEST((s64)offset * JH7110_RTC_TICKS_PER_SEC, NSEC_PER_SEC);
+	if (ticks < 1 || ticks > JH7110_RTC_CAL_MASK + 1)
+		return -ERANGE;
+
+	writel(ticks - 1, jrtc->base + JH7110_RTC_SW_CAL_VALUE);
+	val = readl(jrtc->base + JH7110_RTC_CFG);
+	writel(val & ~JH7110_RTC_CFG_CAL_SEL_HW, jrtc->base + JH7110_RTC_CFG);
+
+	return 0;
+}
+
+static irqreturn_t jh7110_rtc_irq(int irq, void *data)
+{
+	struct jh7110_rtc *jrtc = data;
+	u32 events, val;
+
+	events = readl(jrtc->base + JH7110_RTC_IRQ_EVENT) &
+		 readl(jrtc->base + JH7110_RTC_IRQ_EN) & JH7110_RTC_IRQ_ALL;
+	if (!events)
+		return IRQ_NONE;
+
+	writel(events, jrtc->base + JH7110_RTC_IRQ_EVENT);
+	if (readl_poll_timeout_atomic(jrtc->base + JH7110_RTC_IRQ_EVENT, val,
+				      !(val & events), 0, JH7110_RTC_SYNC_TIMEOUT_US))
+		dev_warn_ratelimited(&jrtc->rtc->dev, "interrupt events 0x%x not cleared\n",
+				     events);
+
+	if (events & JH7110_RTC_IRQ_ALARM)
+		rtc_update_irq(jrtc->rtc, 1, RTC_AF | RTC_IRQF);
+
+	return IRQ_HANDLED;
+}
+
+static const struct rtc_class_ops jh7110_rtc_ops = {
+	.read_time		= jh7110_rtc_read_time,
+	.set_time		= jh7110_rtc_set_time,
+	.read_alarm		= jh7110_rtc_read_alarm,
+	.set_alarm		= jh7110_rtc_set_alarm,
+	.alarm_irq_enable	= jh7110_rtc_alarm_irq_enable,
+	.read_offset		= jh7110_rtc_read_offset,
+	.set_offset		= jh7110_rtc_set_offset,
+};
+
+static int jh7110_rtc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct reset_control *rst;
+	struct jh7110_rtc *jrtc;
+	struct clk *clk;
+	int irq, ret;
+	u32 val;
+
+	jrtc = devm_kzalloc(dev, sizeof(*jrtc), GFP_KERNEL);
+	if (!jrtc)
+		return -ENOMEM;
+
+	jrtc->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(jrtc->base))
+		return PTR_ERR(jrtc->base);
+
+	clk = devm_clk_get_enabled(dev, "apb");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable apb clock\n");
+
+	clk = devm_clk_get_enabled(dev, "cal");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable cal clock\n");
+
+	clk = devm_clk_get_enabled(dev, "32k");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable 32k clock\n");
+
+	/* Never asserted again, as that would stop the clock & lose the time */
+	rst = devm_reset_control_array_get_exclusive(dev);
+	if (IS_ERR(rst))
+		return dev_err_probe(dev, PTR_ERR(rst), "failed to get resets\n");
+
+	ret = reset_control_deassert(rst);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to deassert resets\n");
+
+	irq = platform_get_irq_byname(pdev, "rtc");
+	if (irq < 0)
+		return irq;
+
+	jrtc->rtc = devm_rtc_allocate_device(dev);
+	if (IS_ERR(jrtc->rtc))
+		return PTR_ERR(jrtc->rtc);
+
+	platform_set_drvdata(pdev, jrtc);
+
+	jrtc->rtc->ops = &jh7110_rtc_ops;
+	jrtc->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	jrtc->rtc->range_max = RTC_TIMESTAMP_END_2099;
+
+	val = readl(jrtc->base + JH7110_RTC_CFG);
+	writel(val | JH7110_RTC_CFG_HOUR_24H | JH7110_RTC_CFG_ENABLE,
+	       jrtc->base + JH7110_RTC_CFG);
+
+	ret = devm_request_irq(dev, irq, jh7110_rtc_irq, 0, dev_name(dev), jrtc);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to request irq\n");
+
+	ret = devm_device_init_wakeup(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to init wakeup\n");
+
+	ret = devm_pm_set_wake_irq(dev, irq);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to set wake irq\n");
+
+	return devm_rtc_register_device(jrtc->rtc);
+}
+
+static const struct of_device_id jh7110_rtc_of_match[] = {
+	{ .compatible = "starfive,jh7110-rtc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, jh7110_rtc_of_match);
+
+static struct platform_driver jh7110_rtc_driver = {
+	.driver = {
+		.name = "jh7110-rtc",
+		.of_match_table = jh7110_rtc_of_match,
+	},
+	.probe = jh7110_rtc_probe,
+};
+module_platform_driver(jh7110_rtc_driver);
+
+MODULE_AUTHOR("Samin Guo <samin.guo@starfivetech.com>");
+MODULE_AUTHOR("Hal Feng <hal.feng@starfivetech.com>");
+MODULE_DESCRIPTION("StarFive JH7110 RTC driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

