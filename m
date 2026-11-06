Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987769;
	b=timt2wJxv+kd4tQyIjoUU9eI6L0V9CnpmQCyk1CXoPzgajE51X42sj6kA9ZRYfaS6WMI
	 4XeVcPXIxxVm4/fGdREX6kcdXomBDGBr04Q1OyuRMM5xgmUn190m0mHVjXPfq82f7eyiJ
	 wwp7LFJiL+4O2U2Xz+PhVBz5cZNmafDqvc4jzN/HEu4YObhW1pyqgpbr4G0vj8WU7j/fS
	 kBH0JwS/ypCjdgjU1RP6S/0nb/m24nFc1M6EogK3NeN3sN6ayV5LYz1qp055ObASZyP3y
	 0k9GjaxQHH1k7DSM46k/GuxdVbTe8AFWTmQclhYH2uTSkNrNGxOOuKrcOeit4W5W94Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1zT7aSJ2M38Uw1Gcc1Z0Zo/eSTUxpSMY4peVA3eWLQE=;
	b=FVuUFaOJ+HrDi4ZoiAsFB1LJPjw68xRri3tJKYTkE01yzdl5NCYsfiIWCCc5jg0RdHRL
	 /vTejbqS5ijd+BZoDql/uYpjBPXhE/L9gVcpTc7vV9F0bjhJhKFV7yGH+XbJP0Xwv5iAz
	 H6GZdZYbp9AyR76laMzYxVTCyd/NlmmDPhvUs2iXed6X2DmFRAyu1KWpfDwfMpkVTsQlL
	 hUjJLRafzVXf2NikCoWn4jPtnY2YQQaso1svS5DZMixRAOvBPb56DVnSFF5DdfftzKWdB
	 lMusNogMTa/qOKUVJb8R2MEcJKJ5E2b1vgFALTr+QELhL64VPyaZjXdpGmsPpdbErEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEKrPO9H;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63955606A331
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63955606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEKrPO9H
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-492f0a1b685so526932f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793987768; x=1794592568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1zT7aSJ2M38Uw1Gcc1Z0Zo/eSTUxpSMY4peVA3eWLQE=;
        b=sEKrPO9HtkRxQI6W7wvwIXMrRoXPZhloBD4+DDHCZM3aSx5Cnt15BmVvn019WMvjJY
         3EPwvom0B5E2gR4tSqj9Oho11pFytZLbexkjVZkCcqKoe48csPRPqOcU5kGILWPOkkk8
         iQZVpfS4xxmE4klQQ9HDSTayePABLyuzKrfAdPXWD7fD1WE1a/S29eceq9N0SoLY46sn
         R0Yo9MEHcO2byLhxM1kL8ROkycjExpgWhYtUG8/33sDPc+FVgGhKxOrm6UbvkLBpBclg
         Ti8hdMKuI2B2waD6grK3rnozrfs/GKG6Sfv+5SA0fRa06NINS6rb0V+K8DoxaEAIKV+v
         H58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987768; x=1794592568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1zT7aSJ2M38Uw1Gcc1Z0Zo/eSTUxpSMY4peVA3eWLQE=;
        b=Z3z0f73x5LmhGmpnj5kHKD/F2HHXiLES0vy1Pi/EHs3FVqzu7qHg21Q8VrGTMgKcs7
         jAY4CwrCFJqXpukzfSmzXlnPOCNSBUahYdTu7uKuVsl+O+3T79UjMqNqyCMAvQisIxH8
         w/KJDfmg6y0s2xDp9F/DyBGvaVT3IFsAO259pErq90sSgpmmx5o6V2n953W0zjDmbQOp
         aP2XQLIF3Ao6fG1UmlQh0JHkecUIer8raPrZBcN16EmjqRyT38BaNWIlEkflydeVwzxr
         wgAMJWug0AU0nhxuVMra+nYVcwXQ7MZjz7TmfNStkTCEWkX+toYaKjlWWQI/TlVSwCYo
         Zsug==
X-Forwarded-Encrypted: i=1; AL+hErGQmIbqDTH5M2ypddlx1Ko0eOvgmZ4N3LJ2gE2r4JonWLgtahDiRQNGbRPkVUy8pgN+DRzBxj2t+2mlY2A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nLc7dAYwpvRmoBqASgmxsT3Lfa8AkL1oa36iwK2aQYNM8l0jd
	LtuTBkKkLCVGFFOQGvFb3jBEo1pgeBMjjaAona2wGwpWlFOkrD0qkpD1
X-Gm-Gg: AYBFou3U8HJSct4kGlY4BjGM7Jd+wJSPtFQ9y0nrbDw/nH6lpecB2c+MUg/UTwwYtfE
	eHwqv7JP/y/ZGcBTEMedud93M5cnHHVpQ5xinefpYKSjiNadDGavgyEbRUbtTQU+lMHUXUs0Iij
	R/DaMpCnU51OcrFukG3Xyp2OxDUzsw4L/2oZ+0jb79AXnsO5EuggPL4sDrnpOIa5XO610doH2hs
	gvFMTaxeaO/ftXrREmGVpx9tw2qkimtkpV8Wy9hEGhn1CIxSqjZZ6J1ym1puNmsfkFXpbi/U5y/
	LhPFpgJm06mAp6BNx1M/EgfXJ82UJ9nLIechVK+09ODQc5BBWiDCeTnBypy1AV6awRBIVNA6oq/
	dB+0KR/j3pGv5JeRb6kd1inZOJGZmLEakhRO0VUMsoEtvXsGIm7tSCWNnpO8UEOm/28XUWrw/lb
	JnzPCyvwPFH16+DWWFHk0mFavp0ud3vTN/ZeCSRo9rTjmmV74J824JMiqhkzKCCfc+Es5nmi0CS
	4Sy59ImcfOLQjWJ2oALaSPjqZhpfM6DShCdj4/1ZysRB8Q3kMz26Ibi2gYHhqMWNFHfW1iAyG9m
	2gBq7CNZr/VClgJT9+bAAoUIhVxArnQ=
X-Received: by 2002:a5d:5d0e:0:b0:491:d224:aa78 with SMTP id ffacd0b85a97d-49276698499mr5099731f8f.26.1793987767575;
        Fri, 06 Nov 2026 09:56:07 -0800 (PST)
Received: from hp-z640.fritz.box ([64.43.161.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723283dsm4649612f8f.23.2026.11.06.09.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:56:06 -0800 (PST)
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
	Conor Dooley <conor@kernel.org>
Subject: [PATCH 2/3] rtc: Add StarFive JH7110 RTC driver
Date: Fri,  6 Nov 2026 17:55:59 +0000
Message-ID: <20261106175600.3877614-3-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106175600.3877614-1-oo.hehir@gmail.com>
References: <20261106175600.3877614-1-oo.hehir@gmail.com>
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
 drivers/rtc/rtc-jh7110.c | 324 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 336 insertions(+)
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
index 000000000..f7129b7ac
--- /dev/null
+++ b/drivers/rtc/rtc-jh7110.c
@@ -0,0 +1,324 @@
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
+#include <linux/mod_devicetable.h>
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

