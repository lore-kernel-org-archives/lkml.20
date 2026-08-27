Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F37391E59
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787869428; cv=none; b=fXQNF3aMTFR0RLtGMv+1ClnHIYGCixCWiGMVBEL2sr0U0YOliJc9zNk+yk1zjlAgLWFYGEp8o4RRIZQ/lBU4XZwocmcFLdRKrkgL+39aBzl6N9SH1zWAokKW+2o90u++AZjK7scDS8H4JMoD8Ot1rmbxhlZwbSfNpIvxDgHXuUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787869428; c=relaxed/simple;
	bh=TwIhk0gHwdW74C9n7Lk9ObmxhDawcmqBJgUdPP9yn14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tu8I5LjhSmK/qNj4wL4EKQyZDW6a0w7uIKXel5ckkO1zKJJMCGslhSoVxM4dWFSD15PQFnv9VXlAt4JTRNkNgyvOOEjxgCC3kUz/fMF8Da12oW0c7uuKYR7eAtz0c/Oy/wNsG1DbHZvsPe00exd9anTT1fo5g0djPCcJ0k3N0io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NCA+oCyR; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NCA+oCyR"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-448b0ff4a57so772775fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787869415; x=1788474215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hl/XEo5fNZ0wthCiWH8FBPhlGjw4oj7mSGF4lVQ3i5k=;
        b=NCA+oCyRTH/aCnGQnSCLfBrWHc5ElmYjgeM0oerqaIeISDJEDdrkuPi+dPdjGg7FA2
         E7xIqR4aRRnksp9hhvJVNs8yGnrwwfRvKj6An+pn1KLeoIMun9kZzit2rQPT++vi8Z1d
         Yz4L/5JQrkpXmSFyzI7l27XfdkvsanZuONCdmqtDIF4yf9y9DqZrI63QLrRe3sK8/UUx
         JVnXOM69RWUNh5sjbqyNuvlj9ut766qMKOtODPeV6zfXwc8Nvl0s3rHSrwyBWKxzSY0W
         DGyX07WKEq/Q0h0QP4loG3I/XraWK1e8kHN8lJzhVH2Zr8mrXfpjz9sp7cZ/ExFGZR4f
         RLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787869415; x=1788474215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hl/XEo5fNZ0wthCiWH8FBPhlGjw4oj7mSGF4lVQ3i5k=;
        b=tRP1G6M93QQnLy6UO+xgkf6OlSPSxjQTa6slCQpfd3BqMUDEN+xBxuDe1QsWZc+WZ/
         U3chAHUQQg6Ff+Q2jGzuJkkmQvD3v9h5i5qPX0yAL26fLHQyGr0QjBK0l2//XZEMuqIn
         JbGwDhHnHzggeeg0jWrgmolda1RKOM4T8i7NGNxcsK5d+OH+3V0MiT9qU0Jlni0Q+h+3
         +NhVLtbvuKi84t1enm1SWIcepwEwBmFbf1MQ1PfCWj/9d9YSU7Zd+XV+em19j/6/G5zv
         8fBRFJT0VDNtnm2NWWgPoYQWyhc435N1tdldU+EkYwou2mAYNRMGEvZFmRXmNLicwa70
         rgEg==
X-Forwarded-Encrypted: i=1; AHgh+Rrtfi2wna1t6oNf7cdGdWgjIL/JOxH+ay2ddOtMZhnOmhZzDgw7H+IbMudWLpMs4T/g1XhWY2aW6MhreA8=@vger.kernel.org
X-Gm-Message-State: AFuF++kfp5ufU1wD7+KsZZ1ydvke9uwsxxAtiF0eeKp6PDXjm5Bl7QOl
	NTYLSArFmLPfJN2GOZd2akr+uV1QxQwmTi/pqRPILpAX88lLygeFGNRFKl41DGPsm4Y=
X-Gm-Gg: AR+sD10sa6PC8wLP6dOhZswoYf1telA1e0XVnULDGeQRYZk/EZS1pGoxO6u+bUiQ9Q/
	pt2UYJH053dOVp0zmwrqbVVgssAbXI8C19YvMeVSVUjwL4HIeg4qjbWpa3Jvpmdyn6b530iwyFs
	5knT2B/hrMkTuLN66Ua/mu0fboOyD1qDX1A7BZlzyAwrR5kv9PPk04ZWUlY/z8BXdNTLBwFXh76
	l8ccSgemAdfuCV6Q+d2Q9/ueKYOQLkrL9fxGO+2ey7EhE84/Sge4hmGBhRZY1JEzz0u6YYvgyQN
	OvM/S+mIeMcs2Yk0f73WaPwKo2WtZ7nGxZnZjrXnEAh9ELfdICB3D/a+9WloSazJEkEyKWRQtpD
	0Gp1PlZ2IhZzepb/Ulq16vNMQl6878OsOkxCJnk87sIacyb8lflAuj2G3qOZvjVdu1+CQyAyRuM
	sdG9P2FEdToxyDFmZnu2y+9uVtErMRow7LFSxbPmVTYbLS/ie7E4eszb4honyzCrrZVQ==
X-Received: by 2002:a05:6820:708c:20b0:6b1:4cfe:ea6 with SMTP id 006d021491bc7-6b1c672778emr1621661eaf.32.1787869414852;
        Thu, 27 Aug 2026 15:23:34 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:d288:6f77:e285:6925])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46736445d6csm3176880fac.2.2026.08.27.15.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 15:23:33 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Date: Thu, 27 Aug 2026 17:22:55 -0500
Subject: [PATCH v4 3/3] iio: adc: ti-ads112c14: add continuous mode support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-iio-adc-ti-ads112c14-continuous-mode-v4-3-1e51a6e20a69@baylibre.com>
References: <20260827-iio-adc-ti-ads112c14-continuous-mode-v4-0-1e51a6e20a69@baylibre.com>
In-Reply-To: <20260827-iio-adc-ti-ads112c14-continuous-mode-v4-0-1e51a6e20a69@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Chris Hall <c-hall@ti.com>, Patrick Edwards <pedwards@ti.com>, 
 Kurt Borja <kuurtb@gmail.com>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "David Lechner (TI)" <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7065; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=TwIhk0gHwdW74C9n7Lk9ObmxhDawcmqBJgUdPP9yn14=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqkLjYvaFd8ahyjKFx5Etej4HhFqXGgX/mXsDzg
 QeewpL8h2yJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCapC42AAKCRDCzCAB/wGP
 wHygB/4nhIIc01sxoqHqrN9oeeyKm1kdRc/CbA6KyejQdrouRaFLzVKJunc/idzj0Cd42Nf45QV
 APSty9oihjNhbBDvn/R4/+I18+UIdy48W1lUV4X73g76W+maVFeRRjuRrpvoAYHsA3IvEIlK+Ml
 PJEArJ39qwSn482uYaEdKoMPoZzecOYMhQ4iSXblV0U3a7F9OsMlwnQ6oIFfbw/OEgUTYVZ7iUy
 +YIkQQzq2SSYblvb4TcsJO7CIvx+hZYXrLGNOTT98MLpjfBPTGAu6iGRMBouxNEFBJ20aqIN/1v
 8RlCKAIvoMyXUs80iI0vSvctWnZ0cvVoijYXP6waVY9WLQlh
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add support for continuous mode in the TI ADS112C14 ADC driver. In this
mode the ADC itself is starting each conversion, so we add a trigger
based on the DRDY interrupt to read each sample. This mode is also
limited in that only one channel can be enabled at a time since the
chip does not have a sequencer or simultaneous sampling capability.
Continuous mode will only be used when this new trigger is the current
trigger.

Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
 drivers/iio/adc/ti-ads112c14.c | 143 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 141 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ti-ads112c14.c b/drivers/iio/adc/ti-ads112c14.c
index 23f15be303fb..878764deffc5 100644
--- a/drivers/iio/adc/ti-ads112c14.c
+++ b/drivers/iio/adc/ti-ads112c14.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bitmap.h>
 #include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/crc8.h>
@@ -18,6 +19,7 @@
 #include <linux/i2c.h>
 #include <linux/iio/buffer.h>
 #include <linux/iio/iio.h>
+#include <linux/iio/trigger.h>
 #include <linux/iio/trigger_consumer.h>
 #include <linux/iio/triggered_buffer.h>
 #include <linux/interrupt.h>
@@ -257,6 +259,7 @@ struct ads112c14_measurement {
 struct ads112c14_data {
 	const struct ads112c14_chip_info *chip_info;
 	struct regmap *regmap;
+	struct iio_trigger *drdy_trig;
 	/* Synchronizes access to register value fields. */
 	struct mutex lock;
 	int drdy_irq;
@@ -280,11 +283,18 @@ static irqreturn_t ads112c14_drdy_irq_handler(int irq, void *private)
 	struct iio_dev *indio_dev = private;
 	struct ads112c14_data *data = iio_priv(indio_dev);
 
-	complete(&data->drdy_completion);
+	if (indio_dev->trig && iio_trigger_using_own(indio_dev))
+		iio_trigger_poll(data->drdy_trig);
+	else
+		complete(&data->drdy_completion);
 
 	return IRQ_HANDLED;
 }
 
+static const struct iio_trigger_ops ads112c14_trigger_ops = {
+	.validate_device = iio_trigger_validate_own_device,
+};
+
 static bool ads112c14_writeable_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -952,6 +962,19 @@ static int ads112c14_read_label(struct iio_dev *indio_dev,
 	return sysfs_emit(label, "%s\n", label_source);
 }
 
+static const struct iio_chan_spec *
+ads112c14_first_active_channel(struct iio_dev *indio_dev)
+{
+	unsigned int scan_mask_len = iio_get_masklength(indio_dev);
+	unsigned int i;
+
+	i = find_first_bit(indio_dev->active_scan_mask, scan_mask_len);
+	if (i == scan_mask_len)
+		return NULL;
+
+	return &indio_dev->channels[i];
+}
+
 static irqreturn_t ads112c14_trigger_handler(int irq, void *private)
 {
 	struct iio_poll_func *pf = private;
@@ -961,6 +984,26 @@ static irqreturn_t ads112c14_trigger_handler(int irq, void *private)
 	u32 i;
 	int ret;
 
+	if (iio_trigger_using_own(indio_dev)) {
+		const struct iio_chan_spec *chan;
+
+		chan = ads112c14_first_active_channel(indio_dev);
+		if (!chan)
+			goto out;
+
+		ret = ads112c14_scan_read(data, (u8 *)&data->scan[0]);
+		if (ret) {
+			dev_err_once(indio_dev->dev.parent,
+				     "failed to read channel %d: %pe; additional errors will be suppressed\n",
+				     chan->channel, ERR_PTR(ret));
+			goto out;
+		}
+
+		iio_push_to_buffers_with_ts(indio_dev, data->scan,
+					    sizeof(data->scan), pf->timestamp);
+		goto out;
+	}
+
 	iio_for_each_active_channel(indio_dev, i) {
 		const struct iio_chan_spec *chan = &indio_dev->channels[i];
 
@@ -992,6 +1035,88 @@ static const struct iio_info ads112c14_info = {
 	.read_label = ads112c14_read_label,
 };
 
+static bool ads112c14_using_drdy_trigger(struct iio_dev *indio_dev)
+{
+	struct ads112c14_data *data = iio_priv(indio_dev);
+
+	return data->drdy_trig && indio_dev->trig == data->drdy_trig;
+}
+
+static bool ads112c14_validate_scan_mask(struct iio_dev *indio_dev,
+					 const unsigned long *mask)
+{
+	if (!ads112c14_using_drdy_trigger(indio_dev))
+		return true;
+
+	return iio_validate_scan_mask_onehot(indio_dev, mask);
+}
+
+static int ads112c14_buffer_postenable(struct iio_dev *indio_dev)
+{
+	struct ads112c14_data *data = iio_priv(indio_dev);
+	const struct iio_chan_spec *chan;
+	int ret;
+
+	if (!ads112c14_using_drdy_trigger(indio_dev))
+		return 0;
+
+	chan = ads112c14_first_active_channel(indio_dev);
+	if (!chan)
+		return -EINVAL;
+
+	guard(mutex)(&data->lock);
+
+	ret = ads112c14_prepare_channel(data, chan);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(data->regmap, ADS112C14_REG_DEVICE_CFG,
+				 ADS112C14_DEVICE_CFG_CONV_MODE,
+				 FIELD_PREP(ADS112C14_DEVICE_CFG_CONV_MODE,
+					    ADS112C14_DEVICE_CFG_CONV_MODE_CONTINUOUS));
+	if (ret)
+		return ret;
+
+	ret = regmap_write(data->regmap, ADS112C14_REG_CONVERSION_CTRL,
+			   ADS112C14_CONVERSION_CTRL_START);
+	if (ret) {
+		regmap_update_bits(data->regmap, ADS112C14_REG_DEVICE_CFG,
+				   ADS112C14_DEVICE_CFG_CONV_MODE,
+				   FIELD_PREP(ADS112C14_DEVICE_CFG_CONV_MODE,
+					      ADS112C14_DEVICE_CFG_CONV_MODE_SINGLE_SHOT));
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ads112c14_buffer_predisable(struct iio_dev *indio_dev)
+{
+	struct ads112c14_data *data = iio_priv(indio_dev);
+	int ret;
+
+	if (!ads112c14_using_drdy_trigger(indio_dev))
+		return 0;
+
+	guard(mutex)(&data->lock);
+
+	ret = regmap_write(data->regmap, ADS112C14_REG_CONVERSION_CTRL,
+			   ADS112C14_CONVERSION_CTRL_STOP);
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(data->regmap, ADS112C14_REG_DEVICE_CFG,
+				  ADS112C14_DEVICE_CFG_CONV_MODE,
+				  FIELD_PREP(ADS112C14_DEVICE_CFG_CONV_MODE,
+					     ADS112C14_DEVICE_CFG_CONV_MODE_SINGLE_SHOT));
+}
+
+static const struct iio_buffer_setup_ops ads112c14_buffer_setup_ops = {
+	.postenable = ads112c14_buffer_postenable,
+	.predisable = ads112c14_buffer_predisable,
+	.validate_scan_mask = ads112c14_validate_scan_mask,
+};
+
 static int ads112c14_populate_idac_mag(u32 current_nA, u8 *idac_mag)
 {
 	u32 current_uA = current_nA / (NANO / MICRO);
@@ -1480,6 +1605,19 @@ static int ads112c14_probe(struct i2c_client *client)
 				       0, dev_name(dev), indio_dev);
 		if (ret)
 			return ret;
+
+		data->drdy_trig = devm_iio_trigger_alloc(dev, "%s-dev%d-drdy",
+							 info->name,
+							 iio_device_id(indio_dev));
+		if (!data->drdy_trig)
+			return -ENOMEM;
+
+		data->drdy_trig->ops = &ads112c14_trigger_ops;
+		iio_trigger_set_drvdata(data->drdy_trig, indio_dev);
+
+		ret = devm_iio_trigger_register(dev, data->drdy_trig);
+		if (ret)
+			return ret;
 	}
 
 	ads112c14_populate_tables(data);
@@ -1490,7 +1628,8 @@ static int ads112c14_probe(struct i2c_client *client)
 
 	ret = devm_iio_triggered_buffer_setup(dev, indio_dev,
 					      iio_pollfunc_store_time,
-					      ads112c14_trigger_handler, NULL);
+					      ads112c14_trigger_handler,
+					      &ads112c14_buffer_setup_ops);
 	if (ret)
 		return ret;
 

-- 
2.43.0

