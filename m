Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792788134;
	b=Hwqdt7/bSHF7iBlThzje6oarb4olZ69ghfwn2yBnhwgzxjOEKqCQftqAdRxCkCuBdSYp
	 HZbI4ZBdjRC9ub0oM6nabgkBPwwB2KbYmWoq9L2lvlnf7rYpqED9Ij6/JWssyyEfYxroG
	 ywYlmqnKXqM9vch5YpNU5OaiMswi9yCk2C/eIF+sRuZ3iGNczcHstrhogbzgPtPj6h//a
	 CgCVu58e8wfIuCpUMzMCAvegRW731en6gM/DCPYS0/PfIzP0n1WeiXOzu/6RyogAGrwkF
	 4HdxgJqO7GKR16x6DZzwgQWUl+1kgUFWw/IVvQD2t1By95leCehI3+074hN6JqXSQEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792788134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pITdMqVGM53TjQ2BXZoI/3VE+gN47ebJK30ImbgbUEg=;
	b=X3BPowgrONjhU9qVh+7osvMC1r1NZuZCMjvivjcg0iNjn0PHR0cSrLb9E9LGPnd4L9CS
	 N+6sVbj4REPCcmI9I5EKkN+9f0HGKtvvcvmoex2LWiqcAuYUWMmMe5APlvrQrUMerCE9w
	 xQxm6mpO7soPFeSlyZyjOU9L2ip9JY7m5VWnUuOoUr/O4U/rmJcPKZFJ7kWCSj/iviiqV
	 1Nr3YTKSbmAEWdfpQIaUsDDr2kMwSNFBhvvWAVz1za/lUPEngWjoT1jMlJhc9OEXfjiPu
	 W0ID8X/CWST/MWW7hwnO+0TUbbOgegY+NInun77732NX/Bf1tCixrdwPBBealSpTVuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Kd0QewIe;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4631860A2606
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4631860A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Kd0QewIe
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e20edd106so1081665f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792788132; x=1793392932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pITdMqVGM53TjQ2BXZoI/3VE+gN47ebJK30ImbgbUEg=;
        b=Kd0QewIegvnOtU1djLiEqfF2WG3+4EcoaKRchjMgy5dbK4aNPf12dJEY0xMmKFycf/
         KD+iDpKeLwAFd+871tWvd4Jpa+EiPrbU+OglC+ZR+ZuEGpxYYmrIJHDDtoWtGnAZhcnA
         S4e42yviFuX6p6Ff/Z4vPujzaQapvi04PXWpDqvXfUhW2C9hEDrmxHz8bfEHFZa0dgmo
         6PGO19P604b8DBcKQiuRQIP1SgMX7KegVpuhnGnDdxVcGffaFpsuROwksgXzRhbOXmf5
         cZLieRBc1dGtHW6PPbMQphd3U3Sw9LssJwxhNN7seDlJ1jYrUUdtJku5y1IEmoSCNfmk
         fgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792788132; x=1793392932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pITdMqVGM53TjQ2BXZoI/3VE+gN47ebJK30ImbgbUEg=;
        b=SPLdJSEWeDcmOaWNgnjsvq4wRoTelAukKz4CwIbUn65lQcSTp5wK7x/LMCFHuST3/S
         hVrCc3JOnksyx8o1A9oRsGzJICGRK0CflN+jzSTawONxEyTli4YgijOg7m4/CB6wK8Dt
         Jqto+LM4mmt4pOm3+Pr/gnou+6Cm1ljgRWF8zwQUHtbzklQyHIPToYVa88n1XLErUZeg
         qLCzWH+aCN5n69zsxlm4r19wAcM3iApWxKeNzGwEtFg2gUDB2CLByDu61gkP7iatykDe
         u6flft2+zQ0GIMO8zhBjmd9GzyTAT1astOa6fDHQCU6FV7FgLf7pdVApHnovyLIPYtS9
         SfiA==
X-Forwarded-Encrypted: i=1; AKwUvBxkUz6Gz5KFI3pN44V5+I+gNhwl8yx4u79LPLZQq1gckjnLM/GQg5mn2CIcAdFXa+7HalEUeRCKSa6GsK8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtg7XPmSp3VBORFeWPiUJTr0H2DQWhYUYZStsntXexazmIJ/5W
	aYmCrpV+gHbxhPwzwtxR+4NQklqi9VrNCp/zbrcFPWTTP2tQSRcLJBUVorHjEJIZWn8=
X-Gm-Gg: AYBFou3jmfCEKPtUNumLqBvj4FoixnozfnGk0KdnGgYKZnZcDgBCZZlOxYQdoZjVpHb
	wyxTHafOdcSY8n7TtKukU2w75dkbVrEFWPHOqoXOpHCKkxF0AUfDiW5mxYe25VF0uDCQ0es8qAx
	NcPC31oEvu62A/gCAXd+sJ1rjpoq1BSEeii4VLPm/6cbGyk7v28jxf2VeDcNI9D25OzcTygXAa5
	s6Ty1J6tlgoXbguSPKLKWfF9RmacMv2s4VQfVXgBdgcrJDUTc1RzqyF2JsCppKboJS2K/Sp1IJB
	qLNG357QzT1vHhwjM5NCHy1PU4cladhE4MxjaW1tuxYOXQj+iz6f+LXVAjGDa9H9zPJAt4Z5qiX
	C11dcRd27gah0GzDX2iVM/FT+rBWd2TjhCGEU33O+R5qv/YokSiEkMYCTJ9iGEnssTr67A5prgE
	vhH9yYy/5iTT6r4REXqJkL731rElulRiRPG+OWTmvUheOAahMhfIP+mvqw7K6yT0I1mhDINeskm
	vlu5tsj4uVpGj0HUcEhGKEoH5ZCTtZyP8OUDKIGkERcTYPKiX8KVuq2kxZj8QCGEKAN0h8Zbnyc
	+H4mGvKqU5FeMLSQaXKJI1pZrAACCf7C
X-Received: by 2002:a5d:5f56:0:b0:48e:f10:ceb8 with SMTP id ffacd0b85a97d-48e3eb759fcmr253753f8f.11.1792788131670;
        Fri, 23 Oct 2026 13:42:11 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4ba7sm200998f8f.33.2026.10.23.13.42.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 13:42:11 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH 2/2] iio: adc: Add a driver for the Ingenic X1600 ADC
Date: Fri, 23 Oct 2026 22:42:09 +0200
Message-ID: <20261023204209.48556-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023204209.48556-1-olivier@mgcrea.io>
References: <20261023204209.48556-1-olivier@mgcrea.io>
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

The X1600's SAR ADC has four auxiliary channels, each with its own start
bit, interrupt flag and 12-bit result, and none of the touchscreen or
battery engines of the JZ47xx ADCs that ingenic-adc drives. Add a small
driver that exposes the four channels as voltages against the 3.3 V
reference.

There is no datasheet here: the register layout and the clock dividers
come from the X1600 driver of the vendor's 4.4 kernel.

Tested on a HiBy R1, whose play/pause and volume keys sit on channel 0
behind adc-keys: all three read and report correctly.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 MAINTAINERS                         |   7 +
 drivers/iio/adc/Kconfig             |  10 ++
 drivers/iio/adc/Makefile            |   1 +
 drivers/iio/adc/ingenic-x1600-adc.c | 227 ++++++++++++++++++++++++++++
 4 files changed, 245 insertions(+)
 create mode 100644 drivers/iio/adc/ingenic-x1600-adc.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ecc22d1149d1..bbb63228e330 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12925,6 +12925,13 @@ F:	include/linux/mfd/ingenic-tcu.h
 F:	sound/soc/codecs/jz47*
 F:	sound/soc/jz4740/
 
+INGENIC X1600 ADC DRIVER
+M:	Olivier Louvignes <olivier@mgcrea.io>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
+F:	drivers/iio/adc/ingenic-x1600-adc.c
+
 INJOINIC IP5xxx POWER BANK IC DRIVER
 M:	Samuel Holland <samuel@sholland.org>
 S:	Maintained
diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index a802d8ee4dd9..7b5c3d3fcfdb 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -881,6 +881,16 @@ config INGENIC_ADC
 	  This driver can also be built as a module. If so, the module will be
 	  called ingenic_adc.
 
+config INGENIC_X1600_ADC
+	tristate "Ingenic X1600 ADC driver"
+	depends on MIPS || COMPILE_TEST
+	help
+	  Say yes here to build support for the SAR ADC of the Ingenic X1600
+	  SoC and its four auxiliary channels.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called ingenic-x1600-adc.
+
 config INTEL_DC_TI_ADC
 	tristate "Intel Bay Trail / Cherry Trail Dollar Cove TI ADC driver"
 	depends on INTEL_SOC_PMIC_CHTDC_TI
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index 9e82c21dbd37..f76e62b0cd04 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -77,6 +77,7 @@ obj-$(CONFIG_IMX8QXP_ADC) += imx8qxp-adc.o
 obj-$(CONFIG_IMX93_ADC) += imx93_adc.o
 obj-$(CONFIG_INA2XX_ADC) += ina2xx-adc.o
 obj-$(CONFIG_INGENIC_ADC) += ingenic-adc.o
+obj-$(CONFIG_INGENIC_X1600_ADC) += ingenic-x1600-adc.o
 obj-$(CONFIG_INTEL_DC_TI_ADC) += intel_dc_ti_adc.o
 obj-$(CONFIG_INTEL_MRFLD_ADC) += intel_mrfld_adc.o
 obj-$(CONFIG_LP8788_ADC) += lp8788_adc.o
diff --git a/drivers/iio/adc/ingenic-x1600-adc.c b/drivers/iio/adc/ingenic-x1600-adc.c
new file mode 100644
index 000000000000..d54f6d7989b6
--- /dev/null
+++ b/drivers/iio/adc/ingenic-x1600-adc.c
@@ -0,0 +1,227 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ADC driver for the Ingenic X1600 SoC
+ *
+ * The X1600's SAR ADC has four auxiliary channels, each with its own start
+ * bit, interrupt and 12-bit result, and none of the touchscreen or battery
+ * engines of the JZ47xx ADCs that ingenic-adc drives. The register layout
+ * and the clock set-up were read from the vendor 4.4 kernel's driver.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/iio/iio.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+
+#define X1600_ADC_REG_ENABLE		0x00
+#define X1600_ADC_REG_CTRL		0x08
+#define X1600_ADC_REG_STATUS		0x0c
+#define X1600_ADC_REG_DATA(ch)		(0x10 + ((ch) / 2) * 4)
+#define X1600_ADC_REG_CLKDIV		0x20
+#define X1600_ADC_REG_STABLE		0x24
+
+/* ENABLE: bits 3..0 start a channel's conversion; bit 15 powers down. */
+#define X1600_ADC_ENABLE_POWER_DOWN	BIT(15)
+/* CTRL: bits 3..0 mask the channels' interrupts. STATUS: write 1 to clear. */
+#define X1600_ADC_CHANNELS_MASK		GENMASK(3, 0)
+#define X1600_ADC_DATA_MASK(ch)		(GENMASK(11, 0) << ((ch) % 2 * 16))
+#define X1600_ADC_CLKDIV_DIV0		GENMASK(7, 0)
+#define X1600_ADC_CLKDIV_DIV1		GENMASK(15, 8)
+#define X1600_ADC_CLKDIV_DIV2		GENMASK(31, 16)
+#define X1600_ADC_STABLE_TIME		GENMASK(15, 0)
+
+#define X1600_ADC_NUM_CHANNELS		4
+#define X1600_ADC_VREF_MV		3300
+#define X1600_ADC_BITS			12
+/* The vendor kernel brings its 140 MHz APB clock down to about this. */
+#define X1600_ADC_CLK_RATE		1166667
+#define X1600_ADC_TIMEOUT_MS		20
+
+struct x1600_adc {
+	void __iomem *base;
+	struct clk *clk;
+	struct completion done;
+	/* Serialises conversions: there is one completion for all channels. */
+	struct mutex lock;
+};
+
+static irqreturn_t x1600_adc_irq(int irq, void *data)
+{
+	struct x1600_adc *adc = data;
+	u32 status = readl(adc->base + X1600_ADC_REG_STATUS) & X1600_ADC_CHANNELS_MASK;
+
+	if (!status)
+		return IRQ_NONE;
+
+	writel(status, adc->base + X1600_ADC_REG_STATUS);
+	complete(&adc->done);
+	return IRQ_HANDLED;
+}
+
+static int x1600_adc_read_raw_channel(struct x1600_adc *adc, unsigned int ch, int *val)
+{
+	u32 data;
+	int ret = 0;
+
+	guard(mutex)(&adc->lock);
+
+	reinit_completion(&adc->done);
+	writel(BIT(ch), adc->base + X1600_ADC_REG_STATUS);
+	writel(readl(adc->base + X1600_ADC_REG_ENABLE) | BIT(ch),
+	       adc->base + X1600_ADC_REG_ENABLE);
+
+	if (!wait_for_completion_timeout(&adc->done,
+					 msecs_to_jiffies(X1600_ADC_TIMEOUT_MS)))
+		ret = -ETIMEDOUT;
+
+	writel(readl(adc->base + X1600_ADC_REG_ENABLE) & ~BIT(ch),
+	       adc->base + X1600_ADC_REG_ENABLE);
+	if (ret)
+		return ret;
+
+	data = readl(adc->base + X1600_ADC_REG_DATA(ch));
+	*val = (data & X1600_ADC_DATA_MASK(ch)) >> (ch % 2 * 16);
+	return 0;
+}
+
+static int x1600_adc_read_raw(struct iio_dev *iio_dev,
+			      struct iio_chan_spec const *chan,
+			      int *val, int *val2, long mask)
+{
+	struct x1600_adc *adc = iio_priv(iio_dev);
+	int ret;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		ret = x1600_adc_read_raw_channel(adc, chan->channel, val);
+		return ret ? ret : IIO_VAL_INT;
+	case IIO_CHAN_INFO_SCALE:
+		*val = X1600_ADC_VREF_MV;
+		*val2 = X1600_ADC_BITS;
+		return IIO_VAL_FRACTIONAL_LOG2;
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct iio_info x1600_adc_info = {
+	.read_raw = x1600_adc_read_raw,
+};
+
+#define X1600_ADC_CHANNEL(ch) {					\
+	.type = IIO_VOLTAGE,					\
+	.indexed = 1,						\
+	.channel = (ch),					\
+	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
+	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
+}
+
+static const struct iio_chan_spec x1600_adc_channels[] = {
+	X1600_ADC_CHANNEL(0),
+	X1600_ADC_CHANNEL(1),
+	X1600_ADC_CHANNEL(2),
+	X1600_ADC_CHANNEL(3),
+};
+
+static void x1600_adc_power_down(void *data)
+{
+	struct x1600_adc *adc = data;
+
+	writel(X1600_ADC_CHANNELS_MASK, adc->base + X1600_ADC_REG_CTRL);
+	writel(X1600_ADC_ENABLE_POWER_DOWN, adc->base + X1600_ADC_REG_ENABLE);
+}
+
+static int x1600_adc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct iio_dev *iio_dev;
+	struct x1600_adc *adc;
+	unsigned long rate;
+	u32 div0, reg;
+	int irq, ret;
+
+	iio_dev = devm_iio_device_alloc(dev, sizeof(*adc));
+	if (!iio_dev)
+		return -ENOMEM;
+
+	adc = iio_priv(iio_dev);
+	init_completion(&adc->done);
+	ret = devm_mutex_init(dev, &adc->lock);
+	if (ret)
+		return ret;
+
+	adc->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(adc->base))
+		return PTR_ERR(adc->base);
+
+	adc->clk = devm_clk_get_enabled(dev, "adc");
+	if (IS_ERR(adc->clk))
+		return dev_err_probe(dev, PTR_ERR(adc->clk), "Unable to get clock\n");
+
+	/* Powered down, interrupts masked and cleared, as the vendor does. */
+	writel(X1600_ADC_ENABLE_POWER_DOWN, adc->base + X1600_ADC_REG_ENABLE);
+	writel(X1600_ADC_CHANNELS_MASK, adc->base + X1600_ADC_REG_CTRL);
+	writel(X1600_ADC_CHANNELS_MASK, adc->base + X1600_ADC_REG_STATUS);
+
+	rate = clk_get_rate(adc->clk);
+	div0 = clamp(DIV_ROUND_UP(rate, X1600_ADC_CLK_RATE), 1UL, 256UL) - 1;
+	/* DIV1 and DIV2 as the vendor kernel sets them. */
+	writel(FIELD_PREP(X1600_ADC_CLKDIV_DIV0, div0) |
+	       FIELD_PREP(X1600_ADC_CLKDIV_DIV1, 1) |
+	       FIELD_PREP(X1600_ADC_CLKDIV_DIV2, 99),
+	       adc->base + X1600_ADC_REG_CLKDIV);
+	reg = readl(adc->base + X1600_ADC_REG_STABLE) & ~X1600_ADC_STABLE_TIME;
+	writel(reg | FIELD_PREP(X1600_ADC_STABLE_TIME, 1),
+	       adc->base + X1600_ADC_REG_STABLE);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_irq(dev, irq, x1600_adc_irq, 0, dev_name(dev), adc);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request irq\n");
+
+	/*
+	 * Powered up for good: the keys poll it every few tens of milliseconds,
+	 * and powering up takes 2 ms.
+	 */
+	writel(0, adc->base + X1600_ADC_REG_ENABLE);
+	usleep_range(2000, 3000);
+	writel(0, adc->base + X1600_ADC_REG_CTRL);
+	ret = devm_add_action_or_reset(dev, x1600_adc_power_down, adc);
+	if (ret)
+		return ret;
+
+	iio_dev->name = "x1600-adc";
+	iio_dev->modes = INDIO_DIRECT_MODE;
+	iio_dev->channels = x1600_adc_channels;
+	iio_dev->num_channels = ARRAY_SIZE(x1600_adc_channels);
+	iio_dev->info = &x1600_adc_info;
+
+	return devm_iio_device_register(dev, iio_dev);
+}
+
+static const struct of_device_id x1600_adc_of_match[] = {
+	{ .compatible = "ingenic,x1600-adc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, x1600_adc_of_match);
+
+static struct platform_driver x1600_adc_driver = {
+	.driver = {
+		.name = "ingenic-x1600-adc",
+		.of_match_table = x1600_adc_of_match,
+	},
+	.probe = x1600_adc_probe,
+};
+module_platform_driver(x1600_adc_driver);
+MODULE_DESCRIPTION("ADC driver for the Ingenic X1600 SoC");
+MODULE_LICENSE("GPL");
-- 
2.39.5

