Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793330129;
	b=xUtz2GO5umWIz437Gu9nkZi7sX1ATS0RPHBFcOc44dZktgNqIACzFV2TtjWB/BR8TVl5
	 muMOdyPT5zMISwAfY8xQJL79eSeYiqr/EDpi5I1S82m1ivpp9BpowXQMRFJZ1qbWSIcOV
	 RDPtajzcSeY64o6zPLJjCVMn+OJbWZ72T5DtK7HjnW/svYczUAyFTrEwKKy3qwcddlMws
	 qE2SbPcs7ycK/8bYAJWlZnHfYYjeYcTjBnb+FBfj7bS+N53VdGQIQY1vtGWSZ8j/arX9I
	 llyLgqkSslb4dvaE2lGfa99az+z/cGOIXIQEfTvpyaNU40Rh2IRgtg0fU2XWhsQBVFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793330129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DBKO3UIY39zZUQ4CA38/YGH1Nzkfo+0rcJ8P4w8cKV8=;
	b=umQ/+MKOFrR3JY1qJHV1kvGS7Hu5Ghg2V+SzKDTk/hI0wso5AuvZxbbxAV6kaXwjx8kZ
	 h8eqtFVajUet58FcVzk3XhZwbU7ascR3zZB7ssZQAXH8vt/gwuKzh+x1UnoPVhIbxn7Ch
	 sGUvuEnWB/KUrprHsb5Z4CyViaT6TXiE67AStZC/WlD9eJWnobREjC5jDqQvdY9u7W69H
	 5TEaXQfL7GhxjnEFjw4I2Akgl4Uu6EauxkkzRoNRJApNMm29L6RaQS8yfwdH3YM1BlC4j
	 L/uypMthDVAlBfPsRQ6p28zppUxMZ6KH7fEaq1cCoc3Gf9LjOl7Erao61dCBQh7T7ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iXL16kpL;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1256606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1256606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iXL16kpL
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso69776a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793330127; x=1793934927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DBKO3UIY39zZUQ4CA38/YGH1Nzkfo+0rcJ8P4w8cKV8=;
        b=iXL16kpLm4pL9wpTUatBhZy6kJVudEx8r05vJLT+8z/4YO5UHGKetqBrZO7663J0gk
         49Mm4VrqyXIkQzkZ1HD0tmRt375r8ahfXmrAVVwARi1miPZM78Re23ShvcZVdx9uTAyp
         +Ne84gcr+5xquDm21snJEPaigh4XVQrv0K99rEvSC2TdA+farBHT3rgMbStgG+Ej31YH
         f4AYaD+xs6WRF3XD3hOtfghJwna8zRcUx2OyXR57wigTIm0MB2LAH69X9Il61c+VEoK5
         hE3sQArDMurFR74pVDZk5iQucxA+t+sJsT3gsDzs8AxCWuJxOnzXl8iLGWQnyAGQ8x7W
         x1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793330127; x=1793934927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DBKO3UIY39zZUQ4CA38/YGH1Nzkfo+0rcJ8P4w8cKV8=;
        b=0ndcvAFc34trPRFHg9kyr8cNKUogUp240olkz9MbVzwXzmTW9s0mcCKW0ND5m7sZDP
         tUFCiDNAlaMmZ1+lFw61bMDMykwkXrkb1H0wZnNl1i1nw2hvZfkm7MyaXIwBdkmaQR/k
         2Z33WLM2QY/pvk05IPknnFV4cJTHlbLWEGnUS19bilfLPq5yzQ2puP06jP1xaHJNDTsL
         JsT2SdehwYyJjGVfHp5U661Pbm0E3zbroOcl+S9aZkbMzLJhdw9zl6JBFSQzmU4VvNfn
         nDMoq7AQaDgVERFR7RytBNDbDmGNHgh8TiKHcd7P1l9WfSNdg7sQN3vKVRc1JohjJy0H
         4JSw==
X-Forwarded-Encrypted: i=1; AKwUvBxsC/vV5mW70AGYwrXXrvimHntvMVfG5VMMT/u6CCMmlTlSpJEVTeIJptAXUPQDBnMLnRmyblDICmEzWRU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJARmhdisRUVWbmYaqep1Idm02LjLmYVIbOFXOPyL8K/X0K8Esm
	I5ROOGMeo6yG3X3HJWINvUrER1FYG/fUpAvBlsKNCO00KoBAn5XMEhHe
X-Gm-Gg: AYBFou2MPFnQhP0F7SbZhdXwgCe9rAtmkCGJOcl6u0JRYZ1BWnYb5QXmitrhhGUuaOV
	RQH93udNlhQkP9qTuZlfmkqyJSzIQ3AR/ahiEt/ycQHXD0zscieYL1aCsyJMxQi2d0KYQgscPwL
	kNywQp6l/n/0vRjf+HpakJwZbmZb0oPdOxXmqYQsMqSTSZGdU7uLgatsAielsLCFlDQDAEeQuQc
	O9XXhOHmjw1dumHKblyOk7VTJdvdro+Fq8Umi3cIv/BzaOlnIYQ+1KPD7uIu/2P43tn+zyCr43C
	dZ1BDDvuNlg965UXCqK4emXS821AOAgNoHHwl9Q9FSjOdDI/FxStU65BN3RcHaLXT9SaZSoG1cX
	2SDy7SUSGsMbzbc0wVb0gvbpEVvOAUiNQRcowyyy5N6b0LXHx7iB3LJsgKUdWmfr7n/Arfyih7J
	ZEUdjMA27zouyKbgtmxFuEaGIsI0Evc7MFrwKTnqxjUtIOP6IQRBK6Z0zmafVQuD97hU5jMwPiD
	AYBu9Dz4Gpmmg2Ht5Y6+75iQNAKP1PWfepoQvMVsHzA1SHwJDY7J1R+vBrkx4bdXvpOnCOu1q7n
	JKXB8gDiiQqflGlv21tmjJuw1Tem6R/GE//mjfGI4Wayql6vKo7OQ6cw8cFqlstTbgDIF/VQzM3
	AFwQE7Tj0Lvo4VtA=
X-Received: by 2002:a17:90b:55c6:b0:3ac:9f00:3bc8 with SMTP id 98e67ed59e1d1-3ae8976f2f0mr736574a91.36.1793330126752;
        Thu, 29 Oct 2026 20:15:26 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a703esm6590630a91.0.2026.10.29.20.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 20:15:26 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v3 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
Date: Fri, 30 Oct 2026 11:15:01 +0800
Message-Id: <20261030031501.130290-3-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261030031501.130290-1-cwweng.linux@gmail.com>
References: <20261030031501.130290-1-cwweng.linux@gmail.com>
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

Add an IIO driver for the Enhanced Analog-to-Digital Converter (EADC)
found on Nuvoton MA35D1 SoCs.

The driver supports direct conversion and externally triggered buffered
capture using sample module 0. Both single-ended inputs and the four
fixed differential input pairs are supported.

Use the internal 1.6 V reference when no external reference supply is
provided, and report the reference voltage through the IIO scale
interface.

Use ADINT0 for conversion completion. Configure the interrupt source
and end-of-conversion position explicitly, and recover from conversion
timeouts by resetting the EADC control circuits, synchronizing the IRQ
and clearing stale conversion state before another conversion is
started.

Reset the EADC control circuits during hardware initialization and
sanitize interrupt, compare and sample-module trigger configuration so
the driver does not depend on state left by firmware when the external
reset control is unavailable.

Provide firmware-node channel translation so DT IIO consumers select
channels by the logical channel index described by the channel node's
reg property rather than by the position of the channel in the driver's
channel array.

Add clock, optional reset and system sleep handling, and restore the
controller configuration after resume.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 drivers/iio/adc/Kconfig       |  14 +
 drivers/iio/adc/Makefile      |   1 +
 drivers/iio/adc/ma35d1_eadc.c | 849 ++++++++++++++++++++++++++++++++++
 3 files changed, 864 insertions(+)
 create mode 100644 drivers/iio/adc/ma35d1_eadc.c

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index a802d8ee4dd9..6868b67d852f 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1032,6 +1032,20 @@ config LTC2497
 	  To compile this driver as a module, choose M here: the module will be
 	  called ltc2497.
 
+config MA35D1_EADC
+	tristate "Nuvoton MA35D1 EADC driver"
+	depends on ARCH_MA35 || COMPILE_TEST
+	depends on HAS_IOMEM
+	select IIO_BUFFER
+	select IIO_TRIGGERED_BUFFER
+	select REGMAP_MMIO
+	help
+	  Say yes here to build support for the Nuvoton MA35D1
+	  Enhanced Analog to Digital Converter.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called ma35d1_eadc.
+
 config MAX1027
 	tristate "Maxim max1027 ADC driver"
 	depends on SPI
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index 9e82c21dbd37..a478fef5d0b7 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -88,6 +88,7 @@ obj-$(CONFIG_LTC2471) += ltc2471.o
 obj-$(CONFIG_LTC2485) += ltc2485.o
 obj-$(CONFIG_LTC2496) += ltc2496.o ltc2497-core.o
 obj-$(CONFIG_LTC2497) += ltc2497.o ltc2497-core.o
+obj-$(CONFIG_MA35D1_EADC) += ma35d1_eadc.o
 obj-$(CONFIG_MAX1027) += max1027.o
 obj-$(CONFIG_MAX11100) += max11100.o
 obj-$(CONFIG_MAX1118) += max1118.o
diff --git a/drivers/iio/adc/ma35d1_eadc.c b/drivers/iio/adc/ma35d1_eadc.c
new file mode 100644
index 000000000000..9b6c38a66a66
--- /dev/null
+++ b/drivers/iio/adc/ma35d1_eadc.c
@@ -0,0 +1,849 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton MA35D1 EADC driver
+ *
+ * Copyright (c) 2026 Nuvoton Technology Corp.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitmap.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/overflow.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/reset.h>
+#include <linux/time.h>
+#include <linux/types.h>
+#include <linux/units.h>
+
+#include <linux/iio/buffer.h>
+#include <linux/iio/iio.h>
+#include <linux/iio/trigger.h>
+#include <linux/iio/trigger_consumer.h>
+#include <linux/iio/triggered_buffer.h>
+
+#define MA35D1_EADC_DAT(n)		(0x000 + (n) * 0x004)
+#define MA35D1_EADC_CTL			0x050
+#define MA35D1_EADC_SWTRG		0x054
+#define MA35D1_EADC_SCTL(n)		(0x080 + (n) * 0x004)
+#define MA35D1_EADC_INTSRC0		0x0d0
+#define MA35D1_EADC_CMP(n)		(0x0e0 + (n) * 0x004)
+#define MA35D1_EADC_STATUS2		0x0f8
+#define MA35D1_EADC_SELSMP0		0x140
+#define MA35D1_EADC_REFADJCTL		0x150
+
+#define MA35D1_EADC_CTL_ADCEN		BIT(0)
+#define MA35D1_EADC_CTL_EADCRST		BIT(1)
+#define MA35D1_EADC_CTL_ADCIEN0		BIT(2)
+#define MA35D1_EADC_CTL_ADCIEN_MASK	GENMASK(5, 2)
+#define MA35D1_EADC_CTL_DIFFEN		BIT(8)
+#define MA35D1_EADC_CTL_DMOF		BIT(9)
+#define MA35D1_EADC_CTL_VREFSEL_MASK	GENMASK(11, 10)
+#define MA35D1_EADC_CTL_VREFSEL_1V6	FIELD_PREP(MA35D1_EADC_CTL_VREFSEL_MASK, 0)
+
+#define MA35D1_EADC_SCTL_CHSEL_MASK	GENMASK(3, 0)
+#define MA35D1_EADC_SCTL_TRGSEL_MASK	GENMASK(21, 16)
+#define MA35D1_EADC_SCTL_INTPOS		BIT(22)
+
+#define MA35D1_EADC_DAT_RESULT_MASK	GENMASK(15, 0)
+#define MA35D1_EADC_DAT_RESULT_12BIT	GENMASK(11, 0)
+#define MA35D1_EADC_DAT_OV		BIT(16)
+#define MA35D1_EADC_DAT_VALID		BIT(17)
+
+#define MA35D1_EADC_INTSRC0_MASK		GENMASK(8, 0)
+#define MA35D1_EADC_INTSRC0_SPLIEN0	BIT(0)
+#define MA35D1_EADC_STATUS2_ADIF0	BIT(0)
+#define MA35D1_EADC_CMP_EADCMPIE	BIT(1)
+#define MA35D1_EADC_REFADJCTL_PDREF	BIT(0)
+#define MA35D1_EADC_SELSMP0_SMPT0_MASK	GENMASK(1, 0)
+#define MA35D1_EADC_SELSMP_LONG		FIELD_PREP(MA35D1_EADC_SELSMP0_SMPT0_MASK, 3)
+
+#define MA35D1_EADC_MAX_EXT_CHANNELS	8
+#define MA35D1_EADC_NUM_SAMPLE_MODULES	9
+#define MA35D1_EADC_NUM_CMP		4
+#define MA35D1_EADC_INTERNAL_VREF_mV	1600
+#define MA35D1_EADC_TIMEOUT		msecs_to_jiffies(1000)
+#define MA35D1_EADC_RESET_DELAY_US	10
+#define MA35D1_EADC_REF_STABLE_US	(1 * USEC_PER_MSEC)
+
+struct ma35d1_adc {
+	struct regmap *regmap;
+	struct clk *clk;
+	struct reset_control *rst;
+	struct regulator *vref;
+	struct completion completion;
+	/* Protect conversion state and register accesses from PM transitions. */
+	struct mutex lock;
+	const struct iio_chan_spec *scan_chan;
+	unsigned int vref_mV;
+	int irq;
+	bool suspended;
+};
+
+static const struct regmap_config ma35d1_adc_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = MA35D1_EADC_REFADJCTL,
+	.cache_type = REGCACHE_NONE,
+};
+
+static int ma35d1_adc_disable_irq(struct ma35d1_adc *adc)
+{
+	return regmap_clear_bits(adc->regmap, MA35D1_EADC_CTL, MA35D1_EADC_CTL_ADCIEN0);
+}
+
+static int ma35d1_adc_setup_reference(struct ma35d1_adc *adc)
+{
+	struct regmap *map = adc->regmap;
+	int ret;
+
+	/*
+	 * MA35D1 TRM EADC reference control: PDREF selects the external VREF
+	 * pin. With the internal reference selected, VREFSEL = 0 selects 1.6 V.
+	 */
+	if (adc->vref) {
+		ret = regmap_set_bits(map, MA35D1_EADC_REFADJCTL,
+				      MA35D1_EADC_REFADJCTL_PDREF);
+		if (ret)
+			return ret;
+	} else {
+		ret = regmap_clear_bits(map, MA35D1_EADC_REFADJCTL,
+					MA35D1_EADC_REFADJCTL_PDREF);
+		if (ret)
+			return ret;
+
+		ret = regmap_update_bits(map, MA35D1_EADC_CTL,
+					 MA35D1_EADC_CTL_VREFSEL_MASK,
+					 MA35D1_EADC_CTL_VREFSEL_1V6);
+		if (ret)
+			return ret;
+	}
+
+	fsleep(MA35D1_EADC_REF_STABLE_US);
+
+	return 0;
+}
+
+static int ma35d1_adc_reset_control(struct ma35d1_adc *adc)
+{
+	struct regmap *map = adc->regmap;
+	unsigned int val;
+	int ret;
+
+	ret = regmap_set_bits(map, MA35D1_EADC_CTL, MA35D1_EADC_CTL_EADCRST);
+	if (ret)
+		return ret;
+
+	return regmap_read_poll_timeout(map, MA35D1_EADC_CTL, val,
+					!(val & MA35D1_EADC_CTL_EADCRST),
+					1, USEC_PER_MSEC);
+}
+
+static int ma35d1_adc_hw_init(struct ma35d1_adc *adc)
+{
+	struct regmap *map = adc->regmap;
+	unsigned int i;
+	int ret;
+
+	/*
+	 * EADCRST resets the control circuits but preserves register values.
+	 * Quiesce interrupt sources first so firmware configuration cannot
+	 * generate an interrupt while Linux takes ownership of the block.
+	 */
+	ret = regmap_clear_bits(map, MA35D1_EADC_CTL,
+				MA35D1_EADC_CTL_ADCIEN_MASK);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < MA35D1_EADC_NUM_CMP; i++) {
+		ret = regmap_clear_bits(map, MA35D1_EADC_CMP(i),
+					MA35D1_EADC_CMP_EADCMPIE);
+		if (ret)
+			return ret;
+	}
+
+	ret = ma35d1_adc_reset_control(adc);
+	if (ret)
+		return ret;
+
+	/* Drop trigger and interrupt routing inherited from firmware. */
+	ret = regmap_update_bits(map, MA35D1_EADC_INTSRC0,
+				 MA35D1_EADC_INTSRC0_MASK, 0);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < MA35D1_EADC_NUM_SAMPLE_MODULES; i++) {
+		ret = regmap_clear_bits(map, MA35D1_EADC_SCTL(i),
+					MA35D1_EADC_SCTL_TRGSEL_MASK);
+		if (ret)
+			return ret;
+	}
+
+	ret = ma35d1_adc_setup_reference(adc);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(map, MA35D1_EADC_SELSMP0,
+				 MA35D1_EADC_SELSMP0_SMPT0_MASK,
+				 MA35D1_EADC_SELSMP_LONG);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(map, MA35D1_EADC_STATUS2, MA35D1_EADC_STATUS2_ADIF0);
+	if (ret)
+		return ret;
+
+	return regmap_set_bits(map, MA35D1_EADC_CTL, MA35D1_EADC_CTL_ADCEN);
+}
+
+static int ma35d1_adc_hw_disable(struct ma35d1_adc *adc)
+{
+	struct regmap *map = adc->regmap;
+	int ret;
+
+	ret = ma35d1_adc_disable_irq(adc);
+	if (ret)
+		return ret;
+
+	return regmap_clear_bits(map, MA35D1_EADC_CTL, MA35D1_EADC_CTL_ADCEN);
+}
+
+static void ma35d1_adc_hw_disable_action(void *data)
+{
+	ma35d1_adc_hw_disable(data);
+}
+
+static void ma35d1_adc_vref_disable(void *data)
+{
+	regulator_disable(data);
+}
+
+static int ma35d1_adc_reset(struct ma35d1_adc *adc)
+{
+	int ret;
+
+	if (!adc->rst)
+		return 0;
+
+	ret = reset_control_assert(adc->rst);
+	if (ret)
+		return ret;
+
+	fsleep(MA35D1_EADC_RESET_DELAY_US);
+
+	return reset_control_deassert(adc->rst);
+}
+
+static int ma35d1_adc_config_channel(struct ma35d1_adc *adc,
+				     const struct iio_chan_spec *chan)
+{
+	struct regmap *map = adc->regmap;
+	unsigned int mask;
+	int ret;
+
+	mask = MA35D1_EADC_CTL_DIFFEN | MA35D1_EADC_CTL_DMOF;
+	ret = regmap_assign_bits(map, MA35D1_EADC_CTL, mask, chan->differential);
+	if (ret)
+		return ret;
+
+	/*
+	 * INTPOS = 0 generates ADIF0 at end of conversion. TRGSEL = 0 disables
+	 * the hardware trigger; conversions are started through SWTRG0.
+	 */
+	mask = MA35D1_EADC_SCTL_CHSEL_MASK |
+	       MA35D1_EADC_SCTL_TRGSEL_MASK |
+	       MA35D1_EADC_SCTL_INTPOS;
+	ret = regmap_update_bits(map, MA35D1_EADC_SCTL(0), mask,
+				 FIELD_PREP(MA35D1_EADC_SCTL_CHSEL_MASK,
+					    chan->address));
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(map, MA35D1_EADC_INTSRC0,
+				  MA35D1_EADC_INTSRC0_MASK,
+				  MA35D1_EADC_INTSRC0_SPLIEN0);
+}
+
+static int ma35d1_adc_abort_conversion(struct ma35d1_adc *adc)
+{
+	struct regmap *map = adc->regmap;
+	int ret;
+	int err;
+
+	ret = ma35d1_adc_disable_irq(adc);
+
+	/*
+	 * Reset the EADC control circuits to terminate a conversion which may
+	 * still be in progress. EADCRST is cleared automatically by hardware
+	 * when the reset completes and the EADC register values are preserved.
+	 */
+	err = ma35d1_adc_reset_control(adc);
+	if (!ret)
+		ret = err;
+
+	/* Drain an interrupt which may already have been latched by the GIC. */
+	synchronize_irq(adc->irq);
+
+	err = regmap_write(map, MA35D1_EADC_STATUS2,
+			   MA35D1_EADC_STATUS2_ADIF0);
+	if (!ret)
+		ret = err;
+
+	reinit_completion(&adc->completion);
+
+	return ret;
+}
+
+static int ma35d1_adc_read_conversion(struct ma35d1_adc *adc,
+				      const struct iio_chan_spec *chan, u16 *raw)
+{
+	struct regmap *map = adc->regmap;
+	unsigned int val;
+	long timeout;
+	int ret;
+
+	reinit_completion(&adc->completion);
+
+	ret = regmap_write(map, MA35D1_EADC_STATUS2, MA35D1_EADC_STATUS2_ADIF0);
+	if (ret)
+		return ret;
+
+	ret = ma35d1_adc_config_channel(adc, chan);
+	if (ret)
+		return ret;
+
+	ret = regmap_set_bits(map, MA35D1_EADC_CTL, MA35D1_EADC_CTL_ADCIEN0);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(map, MA35D1_EADC_SWTRG, BIT(0));
+	if (ret)
+		goto disable_irq;
+
+	timeout = wait_for_completion_timeout(&adc->completion,
+					      MA35D1_EADC_TIMEOUT);
+	if (!timeout) {
+		ret = ma35d1_adc_abort_conversion(adc);
+		return ret ?: -ETIMEDOUT;
+	}
+
+	ret = ma35d1_adc_disable_irq(adc);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(map, MA35D1_EADC_DAT(0), &val);
+	if (ret)
+		return ret;
+
+	if (!(val & MA35D1_EADC_DAT_VALID))
+		return -EIO;
+
+	if (val & MA35D1_EADC_DAT_OV)
+		return -EOVERFLOW;
+
+	*raw = FIELD_GET(MA35D1_EADC_DAT_RESULT_MASK, val);
+
+	return 0;
+
+disable_irq:
+	ma35d1_adc_disable_irq(adc);
+
+	return ret;
+}
+
+static irqreturn_t ma35d1_adc_isr(int irq, void *data)
+{
+	struct iio_dev *indio_dev = data;
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	unsigned int status;
+	int ret;
+
+	ret = regmap_read(adc->regmap, MA35D1_EADC_STATUS2, &status);
+	if (ret || !(status & MA35D1_EADC_STATUS2_ADIF0))
+		return IRQ_NONE;
+
+	regmap_write(adc->regmap, MA35D1_EADC_STATUS2,
+		     MA35D1_EADC_STATUS2_ADIF0);
+	complete(&adc->completion);
+
+	return IRQ_HANDLED;
+}
+
+static int ma35d1_adc_sign_extend(u16 raw)
+{
+	return sign_extend32(raw & MA35D1_EADC_DAT_RESULT_12BIT, 11);
+}
+
+static int ma35d1_adc_read_raw(struct iio_dev *indio_dev,
+			       const struct iio_chan_spec *chan,
+			       int *val, int *val2, long mask)
+{
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	u16 raw;
+	int ret;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW: {
+		IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
+
+		if (IIO_DEV_ACQUIRE_FAILED(claim))
+			return -EBUSY;
+
+		guard(mutex)(&adc->lock);
+		if (adc->suspended)
+			return -EBUSY;
+
+		ret = ma35d1_adc_read_conversion(adc, chan, &raw);
+		if (ret)
+			return ret;
+
+		if (chan->differential)
+			*val = ma35d1_adc_sign_extend(raw);
+		else
+			*val = raw & MA35D1_EADC_DAT_RESULT_12BIT;
+
+		return IIO_VAL_INT;
+	}
+	case IIO_CHAN_INFO_SCALE:
+		*val = adc->vref_mV;
+		/* Differential mode has a VREF / 2048 LSB; single-ended uses /4096. */
+		*val2 = chan->differential ? 11 : 12;
+		return IIO_VAL_FRACTIONAL_LOG2;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int ma35d1_adc_update_scan_mode(struct iio_dev *indio_dev,
+				       const unsigned long *scan_mask)
+{
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	const struct iio_chan_spec *scan_chan = NULL;
+	unsigned long bit;
+
+	for_each_set_bit(bit, scan_mask, iio_get_masklength(indio_dev)) {
+		const struct iio_chan_spec *chan = &indio_dev->channels[bit];
+
+		if (chan->type == IIO_TIMESTAMP)
+			continue;
+
+		if (chan->type != IIO_VOLTAGE || scan_chan)
+			return -EINVAL;
+
+		scan_chan = chan;
+	}
+
+	if (!scan_chan)
+		return -EINVAL;
+
+	adc->scan_chan = scan_chan;
+
+	return 0;
+}
+
+static int ma35d1_adc_buffer_postenable(struct iio_dev *indio_dev)
+{
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+
+	guard(mutex)(&adc->lock);
+
+	if (adc->suspended)
+		return -EBUSY;
+
+	return adc->scan_chan ? 0 : -EINVAL;
+}
+
+static int ma35d1_adc_buffer_predisable(struct iio_dev *indio_dev)
+{
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	int ret;
+
+	guard(mutex)(&adc->lock);
+
+	ret = ma35d1_adc_disable_irq(adc);
+	if (ret)
+		return ret;
+
+	synchronize_irq(adc->irq);
+
+	return regmap_write(adc->regmap, MA35D1_EADC_STATUS2,
+			    MA35D1_EADC_STATUS2_ADIF0);
+}
+
+static irqreturn_t ma35d1_adc_trigger_handler(int irq, void *p)
+{
+	struct iio_poll_func *pf = p;
+	struct iio_dev *indio_dev = pf->indio_dev;
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	IIO_DECLARE_BUFFER_WITH_TS(u16, scan, 1) = { };
+	u16 raw;
+	int ret;
+
+	mutex_lock(&adc->lock);
+
+	if (!adc->suspended && adc->scan_chan) {
+		ret = ma35d1_adc_read_conversion(adc, adc->scan_chan, &raw);
+		if (!ret) {
+			scan[0] = raw & MA35D1_EADC_DAT_RESULT_12BIT;
+			iio_push_to_buffers_with_ts(indio_dev, scan, sizeof(scan),
+						    pf->timestamp);
+		}
+	}
+
+	mutex_unlock(&adc->lock);
+
+	iio_trigger_notify_done(indio_dev->trig);
+
+	return IRQ_HANDLED;
+}
+
+static const struct iio_buffer_setup_ops ma35d1_adc_buffer_ops = {
+	.postenable = ma35d1_adc_buffer_postenable,
+	.predisable = ma35d1_adc_buffer_predisable,
+};
+
+static int ma35d1_adc_fwnode_xlate(struct iio_dev *indio_dev,
+				   const struct fwnode_reference_args *iiospec)
+{
+	unsigned int i;
+
+	if (iiospec->nargs != 1)
+		return -EINVAL;
+
+	for (i = 0; i < indio_dev->num_channels; i++) {
+		const struct iio_chan_spec *chan = &indio_dev->channels[i];
+
+		if (chan->type == IIO_VOLTAGE &&
+		    chan->channel == iiospec->args[0])
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+static const struct iio_info ma35d1_adc_info = {
+	.read_raw = ma35d1_adc_read_raw,
+	.update_scan_mode = ma35d1_adc_update_scan_mode,
+	.fwnode_xlate = ma35d1_adc_fwnode_xlate,
+};
+
+static void ma35d1_adc_init_channel(struct iio_chan_spec *chan, u32 index,
+				    u32 vinp, u32 vinn,
+				    unsigned int scan_index,
+				    bool differential)
+{
+	chan->type = IIO_VOLTAGE;
+	chan->indexed = 1;
+	chan->channel = index;
+	chan->address = vinp;
+	chan->scan_index = scan_index;
+	chan->info_mask_separate =
+		BIT(IIO_CHAN_INFO_RAW) | BIT(IIO_CHAN_INFO_SCALE);
+	chan->scan_type.format = differential ? IIO_SCAN_FORMAT_SIGNED_INT :
+					      IIO_SCAN_FORMAT_UNSIGNED_INT;
+	chan->scan_type.realbits = 12;
+	chan->scan_type.storagebits = 16;
+	chan->scan_type.endianness = IIO_CPU;
+
+	if (differential) {
+		chan->differential = 1;
+		chan->channel2 = vinn;
+	}
+}
+
+static int ma35d1_adc_parse_channels(struct iio_dev *indio_dev,
+				     struct device *dev)
+{
+	DECLARE_BITMAP(used_regs, MA35D1_EADC_MAX_EXT_CHANNELS);
+	struct iio_chan_spec *channels;
+	unsigned int scan_index;
+	int num_channels;
+	int ret;
+
+	bitmap_zero(used_regs, MA35D1_EADC_MAX_EXT_CHANNELS);
+
+	num_channels = device_get_child_node_count(dev);
+	if (!num_channels)
+		return dev_err_probe(dev, -ENOENT, "no ADC channels configured\n");
+
+	if (num_channels > MA35D1_EADC_MAX_EXT_CHANNELS)
+		return dev_err_probe(dev, -EINVAL, "too many ADC channels\n");
+
+	channels = devm_kcalloc(dev, size_add(num_channels, 1),
+				sizeof(*channels), GFP_KERNEL);
+	if (!channels)
+		return -ENOMEM;
+
+	scan_index = 0;
+	device_for_each_child_node_scoped(dev, child) {
+		bool differential;
+		u32 reg;
+		u32 vinp;
+		u32 vinn;
+
+		ret = fwnode_property_read_u32(child, "reg", &reg);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "missing channel reg property\n");
+
+		if (reg >= MA35D1_EADC_MAX_EXT_CHANNELS)
+			return dev_err_probe(dev, -EINVAL,
+					     "invalid ADC channel index %u\n", reg);
+
+		if (test_and_set_bit(reg, used_regs))
+			return dev_err_probe(dev, -EINVAL,
+					     "duplicate ADC channel index %u\n", reg);
+
+		if (fwnode_property_present(child, "single-channel")) {
+			ret = fwnode_property_read_u32(child, "single-channel",
+						       &vinp);
+			if (ret)
+				return dev_err_probe(dev, ret,
+						     "invalid single-channel for index %u\n",
+						     reg);
+
+			if (vinp >= MA35D1_EADC_MAX_EXT_CHANNELS)
+				return dev_err_probe(dev, -EINVAL,
+						     "invalid ADC input %u\n", vinp);
+
+			vinn = 0;
+			differential = false;
+		} else {
+			if (reg >= 4)
+				return dev_err_probe(dev, -EINVAL,
+						     "invalid differential pair %u\n", reg);
+
+			vinp = reg;
+			vinn = reg + 4;
+			differential = true;
+		}
+
+		ma35d1_adc_init_channel(&channels[scan_index], reg, vinp, vinn,
+					scan_index, differential);
+		scan_index++;
+	}
+
+	channels[scan_index] = IIO_CHAN_SOFT_TIMESTAMP(scan_index);
+
+	indio_dev->channels = channels;
+	indio_dev->num_channels = scan_index + 1;
+
+	return 0;
+}
+
+static int ma35d1_adc_init_vref(struct ma35d1_adc *adc, struct device *dev)
+{
+	int ret;
+
+	adc->vref = devm_regulator_get_optional(dev, "vref");
+	ret = PTR_ERR_OR_ZERO(adc->vref);
+	if (ret == -ENODEV) {
+		adc->vref = NULL;
+		adc->vref_mV = MA35D1_EADC_INTERNAL_VREF_mV;
+		return 0;
+	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get VREF supply\n");
+
+	ret = regulator_enable(adc->vref);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable VREF supply\n");
+
+	ret = devm_add_action_or_reset(dev, ma35d1_adc_vref_disable, adc->vref);
+	if (ret)
+		return ret;
+
+	ret = regulator_get_voltage(adc->vref);
+	if (ret <= 0)
+		return dev_err_probe(dev, ret ?: -EINVAL,
+				     "failed to get VREF voltage\n");
+
+	adc->vref_mV = ret / (MICRO / MILLI);
+
+	return 0;
+}
+
+static int ma35d1_adc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct iio_dev *indio_dev;
+	struct ma35d1_adc *adc;
+	void __iomem *regs;
+	int ret;
+
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*adc));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	adc = iio_priv(indio_dev);
+	init_completion(&adc->completion);
+
+	ret = devm_mutex_init(dev, &adc->lock);
+	if (ret)
+		return ret;
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return dev_err_probe(dev, PTR_ERR(regs),
+				     "failed to map registers\n");
+
+	adc->regmap = devm_regmap_init_mmio(dev, regs, &ma35d1_adc_regmap_config);
+	if (IS_ERR(adc->regmap))
+		return dev_err_probe(dev, PTR_ERR(adc->regmap),
+				     "failed to initialize regmap\n");
+
+	adc->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(adc->clk))
+		return dev_err_probe(dev, PTR_ERR(adc->clk),
+				     "failed to get and enable ADC clock\n");
+
+	adc->rst = devm_reset_control_get_optional_exclusive(dev, NULL);
+	if (IS_ERR(adc->rst))
+		return dev_err_probe(dev, PTR_ERR(adc->rst),
+				     "failed to get reset control\n");
+
+	ret = ma35d1_adc_reset(adc);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to reset ADC\n");
+
+	ret = ma35d1_adc_init_vref(adc, dev);
+	if (ret)
+		return ret;
+
+	indio_dev->name = "ma35d1-eadc";
+	indio_dev->modes = INDIO_DIRECT_MODE;
+	indio_dev->info = &ma35d1_adc_info;
+
+	ret = ma35d1_adc_parse_channels(indio_dev, dev);
+	if (ret)
+		return ret;
+
+	ret = ma35d1_adc_hw_init(adc);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to initialize ADC\n");
+
+	ret = devm_add_action_or_reset(dev, ma35d1_adc_hw_disable_action, adc);
+	if (ret)
+		return ret;
+
+	adc->irq = platform_get_irq_byname(pdev, "adint0");
+	if (adc->irq < 0)
+		return adc->irq;
+
+	ret = devm_request_irq(dev, adc->irq, ma35d1_adc_isr, 0,
+			       dev_name(dev), indio_dev);
+	if (ret)
+		return ret;
+
+	ret = devm_iio_triggered_buffer_setup(dev, indio_dev,
+					      iio_pollfunc_store_time,
+					      ma35d1_adc_trigger_handler,
+					      &ma35d1_adc_buffer_ops);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, indio_dev);
+
+	return devm_iio_device_register(dev, indio_dev);
+}
+
+static int ma35d1_adc_suspend(struct device *dev)
+{
+	struct iio_dev *indio_dev = dev_get_drvdata(dev);
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	int ret;
+
+	ret = iio_device_suspend_triggering(indio_dev);
+	if (ret)
+		return ret;
+
+	mutex_lock(&adc->lock);
+
+	ret = ma35d1_adc_disable_irq(adc);
+	if (ret)
+		goto resume_triggering;
+
+	synchronize_irq(adc->irq);
+
+	ret = regmap_clear_bits(adc->regmap, MA35D1_EADC_CTL,
+				MA35D1_EADC_CTL_ADCEN);
+	if (ret)
+		goto resume_triggering;
+
+	adc->suspended = true;
+	clk_disable_unprepare(adc->clk);
+	mutex_unlock(&adc->lock);
+
+	return 0;
+
+resume_triggering:
+	mutex_unlock(&adc->lock);
+	iio_device_resume_triggering(indio_dev);
+
+	return ret;
+}
+
+static int ma35d1_adc_resume(struct device *dev)
+{
+	struct iio_dev *indio_dev = dev_get_drvdata(dev);
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	int ret;
+
+	mutex_lock(&adc->lock);
+
+	ret = clk_prepare_enable(adc->clk);
+	if (ret)
+		goto unlock;
+
+	ret = ma35d1_adc_hw_init(adc);
+	if (ret) {
+		clk_disable_unprepare(adc->clk);
+		goto unlock;
+	}
+
+	adc->suspended = false;
+	mutex_unlock(&adc->lock);
+
+	return iio_device_resume_triggering(indio_dev);
+
+unlock:
+	mutex_unlock(&adc->lock);
+
+	return ret;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(ma35d1_adc_pm_ops,
+				ma35d1_adc_suspend, ma35d1_adc_resume);
+
+static const struct of_device_id ma35d1_adc_of_match[] = {
+	{ .compatible = "nuvoton,ma35d1-eadc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ma35d1_adc_of_match);
+
+static struct platform_driver ma35d1_adc_driver = {
+	.probe = ma35d1_adc_probe,
+	.driver = {
+		.name = "ma35d1-eadc",
+		.of_match_table = ma35d1_adc_of_match,
+		.pm = pm_sleep_ptr(&ma35d1_adc_pm_ops),
+	},
+};
+module_platform_driver(ma35d1_adc_driver);
+
+MODULE_AUTHOR("Chi-Wen Weng <cwweng@nuvoton.com>");
+MODULE_DESCRIPTION("Nuvoton MA35D1 EADC driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

