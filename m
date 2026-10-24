Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792883643;
	b=trLTWYsegdxglxuNer8JQY9kKue2qMg0IlV3Si+MF3pCnZp1lUyYYDKTfQVJuwmsT141
	 nmZUnJYXNaOp/v7NQ3fgOX9UFAEwEKRdzgbh3d9wCf4Vqunsz1M4u03urAvbBcVUDYa6O
	 /5d5HQSopvJ1PBEEftLg2OaZdkA3JzqBfaLykRG25igMblxriFu6LSFr+dsZmKQPRMWiz
	 RygkBFrrf7O7IM+wKiLc9nMMq/MNsuKpkQMEc4v7blmv8NRyA6tvoMva2J0UrtcsVWlx1
	 VYGO6QihBLwNdyAWFw/yydNRXhkEl5qgOwg128Y7fvxVwU2dEmxNssfRxVGi/aoPYcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792883643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OAcjQCo+g6uBEN35OC1YYKF9/0jjAxVnRxeRLMhxH9Q=;
	b=N9ZOyMO5WFqhhGD/6w31U0Udx8R59Egqa1b2H4of+Nxy/VQi071wJSUmHDGnPl8btvTR
	 YxQGEhf3TmdTgmklSkY6wrgnuJAdiIE3FhlpTHLW76cV67gBgwDPPAPOzJh8GmBcN53Gr
	 yQ9sz5paHrbqZmAKcKD17MmuFqDTbKJvkS4XybWB6L04ZWzYg8Vv2sqoN4/HY6pd3fDLk
	 TXnv/CFN/wxQha/l5wkzyLuisWZKqRAK3HTqf3Lc1l+hkeizhsYTPPiGJ5eQMHcyqNo5K
	 K0xMExgmLmy8CNCa99aKp7uQBgB/WX0J/mVct2NwqvgksoYnGbSbtltE+8EO/CO3etA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Pwh4jSLt;
	arc=none smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BC0606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 23:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65BC0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Pwh4jSLt
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eaf169fe3dso586535e0c.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 16:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792883642; x=1793488442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OAcjQCo+g6uBEN35OC1YYKF9/0jjAxVnRxeRLMhxH9Q=;
        b=Pwh4jSLt3O11sPdVVhLbiDDuYm20/NLKOWQGtmRTMVT3mKPMPV7B0GYpjiyVJDqBiO
         PmWLRdTgRkguoonVR1oSzCUAiH4j0YForKVeKqx3/VN61R/kdClTgpQlaXpYpr04+KZo
         LAus8ld9Qnl+OWIFzCGWmQid1Wu72RJnSoqdXT74neuHiYB56Fp+dUJxTSOiarqB5cH5
         iPuVePgVb3S75pN3nvtdDzwGgTanRTC5RRR7jnE2/vHVwnBco9KM0znh9yPzWUZctQBt
         PYYqjZgIZaZOkzF/VJHhxWFFFVaA5kp1MBayh5uNvcYxDxJOvduYS+QZH5f/h7PAdQ7u
         025w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792883642; x=1793488442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OAcjQCo+g6uBEN35OC1YYKF9/0jjAxVnRxeRLMhxH9Q=;
        b=L7bIwDza7N30BV0llbo6IqDsdX5NuVLR4NzhFyPLsuIcAfI9TVhamyX4bqGwNITO4P
         GTDo9D62au6K0HSVGma/ev4t9OtiGN+64DgcxwoGw2pVH9YnGdI3L+pzExI6b6XzzkcC
         gNqc4SWu/ux+k0oG45Pw/pCtgyC1xELitoci3UEy31b7eTsaKhjYsbPo/h+TFmVRlEvI
         FubtiZHrEovvHYVw5+7s6puSlYjo+yCsFcr8/aIxc9TMSZlicISb4c81nEB1H8EmaFKL
         0sXho9MPileIXprk1VmDsySdRSCFC/gwBKxZPF6BFA3xYlRNzrhpnoQq68oBjbCTJ3Np
         9+Jw==
X-Forwarded-Encrypted: i=1; AKwUvBwoB/6pkc40/qX8Iw4up8tzfxWpY1EeVsi/fnorqCdNujPXBzlRRQ4eGGTQXO8iCqfj2lZXqfCfFspYHEw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBvah4Da6fEJD9RBbbPlCZEEvo2WTlFAONBft3k47LB5ifKfot
	zcGL1Ol71c50UsMt2Sr655lAsphhVEW4+OKw12ySFbNHTAx9ChePtmG2
X-Gm-Gg: AYBFou3ExOBb1v+qRKguLu504zpDsuit9ZQZoJKN9hEvcGX155ktcS21nVXyWerZcwE
	Z8KN+u0bWcSP5m1iclRcPC65+1686495Bqp5F2rk6YPh2xMIZ08Hol+CEol+xc5RT2iMMYkLSgh
	szO7mYDGAAnng0WMqtxPl8bB/Q9H0A/RvWoXx5DQT0t61qi+FENcN9BfyfU3enXRavlc8Wr4LOR
	r/bjlDMmfIneTENVcw2UQ6f0y/79pVSFnXms5Dc6Yrs/JHiYJ1ws4lOg+6Oa4iLXJRM8z0PJMbp
	urHM40Ye297+lKm5MNUaCi3+0sxFC96DhGrVrX1IqftcIG3ZgJXsVoRNYMMeOip0xGtJqBoQ256
	/5KEs/le0GHeTwx+zOhNIZ7ESKDgOO3oO6CgnTCQO+yo7J7kmvdh9rD9dQDYlCMI0agoOZwsnag
	7XWEMrs8NcvHAeFeT84UrZVklunSlEkqz4fd4u9aSpU+M+eNNkDmzU5mgFWNa5vVcuAKf4sblSP
	M4syM2WVous9+9dM+LTyvRD1kCl2bmafhOUrPzgWQT2X3SmHYrjTjv+jFhQ8Lc3zfRvJx/MRMpe
	vxUb
X-Received: by 2002:a05:6102:149a:b0:7cc:21cd:9b46 with SMTP id ada2fe7eead31-7ce5ce27334mr735045137.33.1792883642249;
        Sat, 24 Oct 2026 16:14:02 -0700 (PDT)
Received: from stephan-Inspiron-15-3520.. ([2804:5d20:6009:6701:efc9:520c:e99d:e5ce])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9910e7b8f0csm3775406241.5.2026.10.24.16.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 16:14:01 -0700 (PDT)
From: Stephan Costa Barros <stephanbrrs8@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] iio: adc: ti-ads1298: fix power-up and clock handling
Date: Sat, 24 Oct 2026 20:13:31 -0300
Message-ID: <20261024231335.280955-3-stephanbrrs8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024231335.280955-1-stephanbrrs8@gmail.com>
References: <20261024231335.280955-1-stephanbrrs8@gmail.com>
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

Fix three issues with the power-up sequence and the device clock:

- The datasheet powers up the supplies first, then the clock, then
  waits t_POR = 2^18 clock cycles (128 ms at 2.048 MHz) before the
  reset. The driver enabled an external clock and the vref supply
  before AVDD, reset right away, and did not wait for the 150 ms
  start-up of the internal reference. Follow the datasheet. Probe takes
  about 280 ms longer.

- The binding describes one optional clock and no clock-names, but the
  driver asked for the clock named "clk". With a device tree that
  follows the binding, the lookup fails, the optional getter returns
  NULL, and a clock given in the device tree is never enabled, while the
  sampling frequency is computed from the nominal 2.048 MHz. Ask for the
  first clock of the node; a device tree with clock-names = "clk" still
  gets the same clock.

- A command takes 4 cycles of the device clock to decode, the minimum
  reset pulse is 2 cycles, and the reset takes 18 more. These were
  converted with the nominal 2.048 MHz, so a command ends after a fixed
  2 us, short of 4 cycles with an external clock below 2 MHz, which the
  ADS129x allows down to 1.94 MHz. Convert them with the rate of the
  clock in use. At 2.048 MHz the delays do not change.

The clock lookup was seen to fail on a Raspberry Pi 4, with a
fixed-clock in the device tree. The power-up order was found by review
and reproduced on an emulated device only. The decode time was found
with an emulated device; it is not seen on hardware running at
2.048 MHz.

Fixes: 00ef7708fa60 ("iio: adc: ti-ads1298: Add driver")
Signed-off-by: Stephan Costa Barros <stephanbrrs8@gmail.com>
---
 drivers/iio/adc/ti-ads1298.c | 73 +++++++++++++++++++++++++-----------
 1 file changed, 51 insertions(+), 22 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1298.c b/drivers/iio/adc/ti-ads1298.c
index 1d32b1f47..f5965b994 100644
--- a/drivers/iio/adc/ti-ads1298.c
+++ b/drivers/iio/adc/ti-ads1298.c
@@ -84,8 +84,12 @@
 #define ADS1298_MAX_CHANNELS	8
 #define ADS1298_BITS_PER_SAMPLE	24
 #define ADS1298_CLK_RATE_HZ	2048000
-#define ADS1298_CLOCKS_TO_USECS(x) \
-		(DIV_ROUND_UP((x) * MICROHZ_PER_HZ, ADS1298_CLK_RATE_HZ))
+/* A command takes 4 clock cycles to decode, before the next one may start */
+#define ADS1298_DECODE_CLOCKS	4
+/* Power-on reset: wait 2^18 clock cycles before the reset */
+#define ADS1298_TPOR_CLOCKS	BIT(18)
+/* Start-up time of the internal reference */
+#define ADS1298_REF_START_UP_MS	150
 /*
  * Read/write register commands require 4 clocks to decode, for speeds above
  * 2x the clock rate, this would require extra time between the command byte and
@@ -106,6 +110,7 @@ struct ads1298_private {
 	struct regulator *reg_avdd;
 	struct regulator *reg_vref;
 	struct clk *clk;
+	unsigned long clk_rate;
 	struct regmap *regmap;
 	struct completion completion;
 	struct iio_trigger *trig;
@@ -180,6 +185,12 @@ static const struct iio_chan_spec ads1298_channels[] = {
 	ADS1298_CHAN(7),
 };
 
+static unsigned int ads1298_clocks_to_usecs(struct ads1298_private *priv,
+					    unsigned int clocks)
+{
+	return DIV_ROUND_UP(clocks * USEC_PER_SEC, priv->clk_rate);
+}
+
 static int ads1298_write_cmd(struct ads1298_private *priv, u8 command)
 {
 	struct spi_transfer xfer = {
@@ -188,7 +199,7 @@ static int ads1298_write_cmd(struct ads1298_private *priv, u8 command)
 		.len = 1,
 		.speed_hz = ADS1298_SPI_BUS_SPEED_SLOW,
 		.delay = {
-			.value = 2,
+			.value = ads1298_clocks_to_usecs(priv, ADS1298_DECODE_CLOCKS),
 			.unit = SPI_DELAY_UNIT_USECS,
 		},
 	};
@@ -433,7 +444,7 @@ static int ads1298_reg_write(void *context, unsigned int reg, unsigned int val)
 		.len = 3,
 		.speed_hz = ADS1298_SPI_BUS_SPEED_SLOW,
 		.delay = {
-			.value = 2,
+			.value = ads1298_clocks_to_usecs(priv, ADS1298_DECODE_CLOCKS),
 			.unit = SPI_DELAY_UNIT_USECS,
 		},
 	};
@@ -454,7 +465,7 @@ static int ads1298_reg_read(void *context, unsigned int reg, unsigned int *val)
 		.len = 3,
 		.speed_hz = ADS1298_SPI_BUS_SPEED_SLOW,
 		.delay = {
-			.value = 2,
+			.value = ads1298_clocks_to_usecs(priv, ADS1298_DECODE_CLOCKS),
 			.unit = SPI_DELAY_UNIT_USECS,
 		},
 	};
@@ -730,7 +741,14 @@ static int ads1298_init(struct iio_dev *indio_dev)
 		if (regulator_get_voltage(priv->reg_avdd) >= 4400000)
 			val |= ADS1298_MASK_CONFIG3_VREF_4V;
 	}
-	return regmap_write(priv->regmap, ADS1298_REG_CONFIG3, val);
+	ret = regmap_write(priv->regmap, ADS1298_REG_CONFIG3, val);
+	if (ret)
+		return ret;
+
+	if (!priv->reg_vref)
+		msleep(ADS1298_REF_START_UP_MS);
+
+	return 0;
 }
 
 static int ads1298_probe(struct spi_device *spi)
@@ -739,6 +757,7 @@ static int ads1298_probe(struct spi_device *spi)
 	struct iio_dev *indio_dev;
 	struct device *dev = &spi->dev;
 	struct gpio_desc *reset_gpio;
+	unsigned long clk_rate;
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*priv));
@@ -753,6 +772,19 @@ static int ads1298_probe(struct spi_device *spi)
 		return dev_err_probe(dev, PTR_ERR(reset_gpio),
 				     "Cannot get reset GPIO\n");
 
+	priv->reg_avdd = devm_regulator_get(dev, "avdd");
+	if (IS_ERR(priv->reg_avdd))
+		return dev_err_probe(dev, PTR_ERR(priv->reg_avdd),
+				     "Failed to get avdd regulator\n");
+
+	ret = regulator_enable(priv->reg_avdd);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable avdd regulator\n");
+
+	ret = devm_add_action_or_reset(dev, ads1298_reg_disable, priv->reg_avdd);
+	if (ret)
+		return ret;
+
 	/* VREF can be supplied externally, otherwise use internal reference */
 	priv->reg_vref = devm_regulator_get_optional(dev, "vref");
 	if (IS_ERR(priv->reg_vref)) {
@@ -771,22 +803,15 @@ static int ads1298_probe(struct spi_device *spi)
 			return ret;
 	}
 
-	priv->clk = devm_clk_get_optional_enabled(dev, "clk");
+	/* The clock follows the supplies */
+	priv->clk = devm_clk_get_optional_enabled(dev, NULL);
 	if (IS_ERR(priv->clk))
 		return dev_err_probe(dev, PTR_ERR(priv->clk), "Failed to get clk\n");
 
-	priv->reg_avdd = devm_regulator_get(dev, "avdd");
-	if (IS_ERR(priv->reg_avdd))
-		return dev_err_probe(dev, PTR_ERR(priv->reg_avdd),
-				     "Failed to get avdd regulator\n");
-
-	ret = regulator_enable(priv->reg_avdd);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to enable avdd regulator\n");
-
-	ret = devm_add_action_or_reset(dev, ads1298_reg_disable, priv->reg_avdd);
-	if (ret)
-		return ret;
+	clk_rate = priv->clk ? clk_get_rate(priv->clk) : 0;
+	if (!clk_rate)
+		clk_rate = ADS1298_CLK_RATE_HZ;
+	priv->clk_rate = clk_rate;
 
 	priv->spi = spi;
 	init_completion(&priv->completion);
@@ -800,12 +825,15 @@ static int ads1298_probe(struct spi_device *spi)
 	indio_dev->channels = ads1298_channels;
 	indio_dev->info = &ads1298_info;
 
+	/* Power-on reset time, counted from when the clock is valid */
+	msleep(DIV_ROUND_UP(ADS1298_TPOR_CLOCKS * MILLI, clk_rate));
+
 	if (reset_gpio) {
 		/*
 		 * Deassert reset now that clock and power are active.
 		 * Minimum reset pulsewidth is 2 clock cycles.
 		 */
-		fsleep(ADS1298_CLOCKS_TO_USECS(2));
+		fsleep(ads1298_clocks_to_usecs(priv, 2));
 		gpiod_set_value_cansleep(reset_gpio, 0);
 	} else {
 		ret = ads1298_write_cmd(priv, ADS1298_CMD_RESET);
@@ -813,7 +841,7 @@ static int ads1298_probe(struct spi_device *spi)
 			return dev_err_probe(dev, ret, "RESET failed\n");
 	}
 	/* Wait 18 clock cycles for reset command to complete */
-	fsleep(ADS1298_CLOCKS_TO_USECS(18));
+	fsleep(ads1298_clocks_to_usecs(priv, 18));
 
 	ret = ads1298_init(indio_dev);
 	if (ret)
@@ -824,7 +852,8 @@ static int ads1298_probe(struct spi_device *spi)
 	priv->rdata_xfer.rx_buf = priv->rx_buffer;
 	priv->rdata_xfer.len = ADS1298_SPI_RDATA_BUFFER_SIZE(indio_dev->num_channels);
 	/* Must keep CS low for 4 clocks */
-	priv->rdata_xfer.delay.value = 2;
+	priv->rdata_xfer.delay.value = ads1298_clocks_to_usecs(priv,
+							       ADS1298_DECODE_CLOCKS);
 	priv->rdata_xfer.delay.unit = SPI_DELAY_UNIT_USECS;
 	spi_message_init_with_transfers(&priv->rdata_msg, &priv->rdata_xfer, 1);
 	priv->rdata_msg.complete = &ads1298_rdata_complete;
-- 
2.43.0

