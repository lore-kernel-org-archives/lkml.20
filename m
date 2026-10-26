Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003871;
	b=PIdz6j/L2BTPN1QF7gM8xaysBaPodxQFHzw6z4rDI6azQc2gAzQBWVxikw+7viMwwHoQ
	 Q0SRk1luNlY60ClZO1pdLYeayhzI4nRInYqrUe6JrPPGSqbR5LYKznKfjwtheAKvuNb1e
	 wNHzogFNqEVSwvADqByoZk1vqJ/kmLf2D7C371KZhIqLEyFFSI8yYFJhp7hWlOHZcRnqS
	 FK1D96qjqOxmxS288Hmu0aGH+kXh1/ddPPbLuoaH36SkFWmM/x/reUitc71oVmYkYP6SH
	 CwCfRYO0HAcGTeiRRXgMWmww+xiPI1XRXmcw3lBlvz9sUrF//4Kk0hyiyZNhYJ0+hNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1dMHnoYrpOJCUZtQtYBzlne3i7Y4za0lPIBg+FoEuVQ=;
	b=SIpWw7MrN7NC83jSFlDLJeJ4Qq1jkuvHSOhyF4bAptRNzpbind4uLIL0yETF4VM6p2V2
	 g3sLifo8AveCbRhVBpWnUkKSBCSAQftB+3HqfeLy+t9YHUls/yYhOapTUDyN3kv6A5JOR
	 k+WIHCmwy+0NLS/Ikdpo1QT1apYU2xOHD15HL1Qo3dyKiDSKJG6e/4Dkfp1tgXHbkfSV4
	 i/vCzMxwuZo72EOZtc6q55gBW5QhLDnroRLX7Lq8ecKpAh4lLPh8RIBDUmLiEuIsQ/MZM
	 Uyv0gysCL+zeeHZfUYVN1/ArbeYmtMPsqvosPp7r7A5Wc5g0adG9BavmFw2dWo3gI5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=w1kfDYim;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5B3606A32E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F5B3606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=w1kfDYim
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1548812f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1793003869; x=1793608669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1dMHnoYrpOJCUZtQtYBzlne3i7Y4za0lPIBg+FoEuVQ=;
        b=w1kfDYimc7sMSghhxkHm1OeEZL2QG7FhBuxclUXvly7XL4GYwywLPooosdVaEMLtNA
         +ug2r54beaS//VtbNfIUpDd0/o7m1DX3Xb26bQZ4eiz11L6KEJ+kmNBgdkpDfNnb0C/F
         21HMrdXKHJcp0INKMaEGiUE+OTFNgHqYrAloNYKLk7aUMGKkicekN8eTYELWmbQsapqt
         LKWxDBbIyldAK31/LLYWj+WjPknLhskb6mQqsbK7mzCEoqGNb2jkCy8lDmFUXoUO1QaV
         pqxouAFy80ryVxSgDHRdNmzZuQMMQayIp8dGn06diEKAd3+RAFwx2CKJI7sehVEbQseM
         T3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003869; x=1793608669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1dMHnoYrpOJCUZtQtYBzlne3i7Y4za0lPIBg+FoEuVQ=;
        b=g2D/y+iyR1V9SkmZTENvjvF8g8bQ+xAhUkiPREfwF2xHjBoQp8ITa1UOn0GCSEg7tf
         d45/sNMLdp9utbDpS2oEDfRZBOY/HC6yRp04yYHiiTF6IyyhIX3RNcaNx+k3FFKeAFrq
         Ej9CebhbtOP2N8HWCYKrE25VqAjMPDExE5EJ7Z4obHkwFl8dxp0FZYKKOErBU/ot7z09
         Y95SGhTCm5Hr5sbPA+CeGBm3RDHmMhpFmbruyLKY0mEEcItrGwvmw2n19zONx5g9dtgh
         oyVWYzmn4LUOaneSswKLNxcbh0nexIgkMoY30sBipxphzi00QIcgce/Oc/I7uDxfbeKM
         B+mg==
X-Forwarded-Encrypted: i=1; AKwUvBwAC5lQDfz3nmcsNe1VSH/sIkLyX/Xuw9XuE2p04jxCXSJ5PXm8H9rXSdZIIBpujeY3J5eru01CiSfMe7s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzj1AJdzDeR/Ug4DoreJcARieAnWgoATaJ3awE+TntB+2o20Ld
	9f+cOq+sBlGBRvA1v32cHw3qNusz26kjSV7r93f3ifg9L9Wb40t5Pm9h0lWVbWCchjY=
X-Gm-Gg: AYBFou2WQZcXcG1vaBX8ywdLD6g6K/y48M3H4qkL4kUy5LSz9c2PZxiuGNJyIPLOeKG
	dAhRv0JuaEpwAjdb901tu1cHsB/p9tlMkzOcBzrH1SAyefjj/Y3MpY2fcKbOiVLhe1i8sYGqQG9
	+WHWFQ9exB9kaToBVO3ACOjtPXqrmHHp1Vqr+YiRxwmylOMAS413FqPFoz6tF6kgiuSyLecNgc3
	wTZANh661If9w/KXbBOYwSZmWGeCn2B0r4aqSDlgfaVzs77c2/bIUA/yu7x8vhXuRKE7rL61Vz6
	xjcNcyY/DTDTgWfLKuU+NQSDfkJC7BmzLocHlB8KtyQXwDH54jMsVgdpg5MR2SXSkGnDCKYSqtQ
	T54qvN7NqG+OuaR18QSyvAygKpeB+4c5VERSF0HEDfkPaCdu8ZPAYOq6npVXNmEa3c0On2630d9
	N8qpBj7A9mRx7Ffeuh+N788txXN+dw6nxODIK4PLihX1ErOhgCkj/YmDksRHuvd3VtoJ5Yfmr16
	cJSqg7/Bcdre988P8qK6Jc5RsHVlZ9xni43tEjPw+t15VwaO3gWo3HByqL41+Fwo6iCrEhm4H7Y
	Ey3yLomzH39hhA==
X-Received: by 2002:adf:e014:0:10b0:48e:740:c945 with SMTP id ffacd0b85a97d-48e3eb8afb8mr7036350f8f.32.1793003869476;
        Mon, 26 Oct 2026 01:37:49 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8dcfsm15091889f8f.50.2026.10.26.01.37.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 01:37:49 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v3 2/2] iio: adc: Add a driver for the Ingenic X1600 ADC
Date: Mon, 26 Oct 2026 09:36:31 +0100
Message-ID: <20261026083631.48406-3-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261026083631.48406-1-olivier@mgcrea.io>
References: <20261026083631.48406-1-olivier@mgcrea.io>
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

The registers are in chapter 19 of the X1600 programming manual. The
ADC clock divider is even, as the manual has it (an odd value divides
by one less); the vendor kernel writes the divider minus one, which
gives a slightly faster clock than it asks for.

Tested on a HiBy R1, whose play/pause and volume keys sit on channel 0
behind adc-keys: all three read and report correctly.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 MAINTAINERS                         |   1 +
 drivers/iio/adc/Kconfig             |  10 ++
 drivers/iio/adc/Makefile            |   1 +
 drivers/iio/adc/ingenic-x1600-adc.c | 242 ++++++++++++++++++++++++++++
 4 files changed, 254 insertions(+)
 create mode 100644 drivers/iio/adc/ingenic-x1600-adc.c

diff --git a/MAINTAINERS b/MAINTAINERS
index fd4bb5c6bf16..d1472b569fc0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12929,6 +12929,7 @@ INGENIC X1600 ADC DRIVER
 M:	Olivier Louvignes <olivier@mgcrea.io>
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
+F:	drivers/iio/adc/ingenic-x1600-adc.c
 
 INJOINIC IP5xxx POWER BANK IC DRIVER
 M:	Samuel Holland <samuel@sholland.org>
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
index 000000000000..236161cfedde
--- /dev/null
+++ b/drivers/iio/adc/ingenic-x1600-adc.c
@@ -0,0 +1,242 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ADC driver for the Ingenic X1600 SoC
+ *
+ * Copyright (c) 2026 Olivier Louvignes <olivier@mgcrea.io>
+ *
+ * The X1600's SAR ADC has four auxiliary channels, each with its own start
+ * bit, interrupt and 12-bit result (X1600 programming manual, chapter 19).
+ */
+
+#include <linux/array_size.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/iio/iio.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/jiffies.h>
+#include <linux/math.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/time.h>
+#include <linux/types.h>
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
+/* CLKDIV: an even divider from the device clock; US and MS: for repeats. */
+#define X1600_ADC_CLKDIV_CLKDIV		GENMASK(7, 0)
+#define X1600_ADC_CLKDIV_US		GENMASK(15, 8)
+#define X1600_ADC_CLKDIV_MS		GENMASK(31, 16)
+#define X1600_ADC_STABLE_TIME		GENMASK(15, 0)
+
+#define X1600_ADC_NUM_CHANNELS		4
+#define X1600_ADC_VREF_mV		3300
+#define X1600_ADC_BITS			12
+/* The ADC clock the vendor kernel runs at. */
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
+	u32 status;
+
+	status = readl(adc->base + X1600_ADC_REG_STATUS) & X1600_ADC_CHANNELS_MASK;
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
+	int ret = 0;
+	u32 data;
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
+	*val = field_get(X1600_ADC_DATA_MASK(ch), data);
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
+		if (ret)
+			return ret;
+
+		return IIO_VAL_INT;
+	case IIO_CHAN_INFO_SCALE:
+		*val = X1600_ADC_VREF_mV;
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
+#define X1600_ADC_CHANNEL(_ch) {				\
+	.type = IIO_VOLTAGE,					\
+	.indexed = 1,						\
+	.channel = (_ch),					\
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
+	u32 div, reg;
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
+	div = clamp(round_up(DIV_ROUND_UP(rate, X1600_ADC_CLK_RATE), 2), 2UL, 254UL);
+	/* US and MS at their reset values: single conversions don't use them. */
+	writel(FIELD_PREP(X1600_ADC_CLKDIV_CLKDIV, div) |
+	       FIELD_PREP(X1600_ADC_CLKDIV_US, 16) |
+	       FIELD_PREP(X1600_ADC_CLKDIV_MS, 4),
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
+		return ret;
+
+	/*
+	 * Left powered up: a typical use, such as buttons read through adc-keys,
+	 * polls every few tens of milliseconds, and powering up takes 2 ms.
+	 */
+	writel(0, adc->base + X1600_ADC_REG_ENABLE);
+	fsleep(2 * USEC_PER_MSEC);
+	writel(0, adc->base + X1600_ADC_REG_CTRL);
+
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
+MODULE_AUTHOR("Olivier Louvignes <olivier@mgcrea.io>");
+MODULE_DESCRIPTION("ADC driver for the Ingenic X1600 SoC");
+MODULE_LICENSE("GPL");
-- 
2.39.5

