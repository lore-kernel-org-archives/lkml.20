Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C4D442B23
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 22:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788559883; cv=none; b=TwZV0tUL+zWtF1y9ljsaYDnILHDuYJQX6NTiL37/g1lXqmzOfFhMM824Y7wXme60A/2a0UU+gl2Z5g8J4kgVkcMkp6u1G7nRy+koVT7xeqG0vBg010vwRPDPvVcX1/3tCCLggE+U6HbC/0dTnoqy9v0069axVZp1sB94mHsufMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788559883; c=relaxed/simple;
	bh=l9Q45b3Na0r37AULknN0n4Ws7BStWk9ckJ7bJVedIH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g3XrFUOyFIxN4QfGp9YQu2UI6sSSU/mMz7Vv+v8bAi5B/SNDYzTM6+DdH+NL0ac0UYrWDAWkbT3RB+pCe9ncHn3xUIPwVJv1MTyGSZgeu+NK1MwP15/SralN/EvaC6wu09NGspu3lf0nFBVvwRgc1trzU9Uxa/JajxaRH71Yu6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Syj9XQ6B; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Syj9XQ6B"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4b38ea4c63aso1369708b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 15:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788559878; x=1789164678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CkINITabsJkMFaMz+O6WBQXk3MjQkP9P7TfGAk4KvJ8=;
        b=Syj9XQ6BWdfoRjyTE7cLtF8Wi1O4tzV3XsrcbeeY2BnlDff7B8BV1J91N+4FKJe0Q6
         pEqxgITOvNWnrgWEP7L8kOH+vCk4pflcH7o88+7xsjC4+a/RSaXcBEU/XngSR2Z4AJvV
         K9Ui+8inkcsqqD5bc7VftMC5Zw9NC99g59pKuIbisgTGo+oOy30g9tyOCXysoXa6/JNW
         ceRV/Ft1yn6nCNr85AFtjyogLaLIlY5dz1sb1QgbpcbUI7pgiFk6JLtsZYUT+RGTpZcR
         2vGLPdxTAkoHddq/GrzTkOrWRqZLZOdULcsnu7FJF//6ZG8Jy3hfl6wkmsb2RAw1zINw
         u6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788559878; x=1789164678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CkINITabsJkMFaMz+O6WBQXk3MjQkP9P7TfGAk4KvJ8=;
        b=aJ0BJgTPcbeVK/5dxlFpP5EDWr4jTQWUkoAIPbdL7NaH3rvG2JixMecCcRu1OzRpaG
         Cm8tacS+27ij6lGb5IMW2G7odawzepy6fW1mUnNzEf8l07mwGi/+KUyIxhRQUKv5dTO7
         tHvO8i+p75ZUFwhcjFiKTV0K3ioNb2fPpMOcoDeh8DU2BAcFqX/GvDa5JEgTG+MS6aOJ
         /M3EhsAyCJ5l6w82iNY0DCaIwXTiDD8lj39ZICPWvi9vxzJwR1NMNhdVPr24Hv4h9fy/
         +NDBanaoZjst4dcbSps2A6zbZtUgaa3Na94B3MidnxHbIioU/cEIIyRfVVzNQyjMLoSW
         y4rg==
X-Forwarded-Encrypted: i=1; AKwUvByZY3Sb94j+W8EN0A0tBDBOnzZnxnERz305/MLdSDOrULjnf8/5aO225VyGiXXt4SfViA3AJqWN0AnEGf8=@vger.kernel.org
X-Gm-Message-State: AFuF++k2T07lpDKQS0DtB8bts2qPtd4dwB/GuHmaBBVrsaCRQto9D9yx
	y54/1bxEOV9s7QtCXl7mI6/0awnySSArKk8cDUF3Zmc+prLMYJ+djO5gidaHRxku6S8=
X-Gm-Gg: AYBFou1d7+9rjyQmxLEwnPtn8GMWwOglVZ9oH5HNgyl9ZG+63IS/nxHaCHGmkCVwkRk
	CCKL+9ysMNG6vZfPsdZQPv3hI4ZGmaTCjlyuvaRqgmzYjr6kQmMTpQFZbA92fDEMQVymvRBtthN
	190pjIqQWO6QCl4Kg4DiQaUIIWkkx8IACbnp6ZKDApmMiO9GM5wfmGfy744QntgZ1u+zanVanZa
	iVL7TSQbSO8bOefdSwEbilXS11YibuvfXwU2zX9BpPD/l2rC/Ts04GRLnDt+WeHaFe+wa+pqpAx
	GufgBy7zCtWVZEh8JWEjJjod6Y1y4kNxI06I6RlCyZrYOrT1I6q+NGkyoFNvYI9yJWodlOyekXZ
	5U9MxAiAvMIk5CBMUuVOOKEHMEaO8Pykn8Io33JQVGocOL7WxMN9wt5eZXWIy0tcsNPWoXBGNLs
	RyuOhwc0t0HoP18ABZHv+Ns1TPgW5H/aJ1j08u0z3YNDIzPY1PNSDlTtdgkCfdKb1/rw==
X-Received: by 2002:a05:6808:5187:b0:4a3:ff0a:e407 with SMTP id 5614622812f47-4b962843ed4mr8194737b6e.15.1788559876969;
        Fri, 04 Sep 2026 15:11:16 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:4324:3ccf:e2bf:d545])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b970d1ff95sm3187113b6e.6.2026.09.04.15.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 15:11:15 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Date: Fri, 04 Sep 2026 17:09:48 -0500
Subject: [PATCH v2 03/10] iio: adc: ti-ads112c14: add continuous mode
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-iio-adc-ti-ads112c14-filter-support-v2-3-f86592360658@baylibre.com>
References: <20260904-iio-adc-ti-ads112c14-filter-support-v2-0-f86592360658@baylibre.com>
In-Reply-To: <20260904-iio-adc-ti-ads112c14-filter-support-v2-0-f86592360658@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Chris Hall <c-hall@ti.com>, Patrick Edwards <pedwards@ti.com>, 
 Kurt Borja <kuurtb@gmail.com>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "David Lechner (TI)" <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8104; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=l9Q45b3Na0r37AULknN0n4Ws7BStWk9ckJ7bJVedIH4=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqm0HFhPBkrZGiL8eDZSYH9sOM3kV6Jtt6VYxUt
 SpsuISDTzaJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaptBxQAKCRDCzCAB/wGP
 wAAEB/90rNcsdeuJothe1lQBEeHTKsF6AiNZ8tIZUEkvPH8U0HVCUF0ITlJWqji+/DSngK14sdI
 NscwVCgbWWznZBY4ewVghWtVEAvR53bj8JRz39uRQ6yD8ZBDrEnkL+EGmin7U3qnyjehIG5C9Sj
 KxYoyqhZsF/RdzJvrcvx6RfWLIZZXEoc8y7b+fBluRL4lNQSPcryqwDfEWg3UZHR9xC/JGoVVBM
 Iu5J+Ms6HwpyFJkxWz+/VcNzeOvojnScnTsRmrROt+E4OAQlr8x4Ww1niFjQQu6+bX8zKTnkXTL
 UdVxazEEPAxEK0C24TICzwtAylA44ZF0Yp8G+WwkEjy5/vA1
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
 drivers/iio/adc/ti-ads112c14.c | 153 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 151 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ti-ads112c14.c b/drivers/iio/adc/ti-ads112c14.c
index 23f15be303fb..06b962fbde5e 100644
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
@@ -257,10 +259,12 @@ struct ads112c14_measurement {
 struct ads112c14_data {
 	const struct ads112c14_chip_info *chip_info;
 	struct regmap *regmap;
+	struct iio_trigger *drdy_trig;
 	/* Synchronizes access to register value fields. */
 	struct mutex lock;
 	int drdy_irq;
 	struct completion drdy_completion;
+	bool continuous_mode;
 	bool i2c_crc_enabled;
 	u32 avdd_uV;
 	u32 ext_ref_uV;
@@ -280,11 +284,18 @@ static irqreturn_t ads112c14_drdy_irq_handler(int irq, void *private)
 	struct iio_dev *indio_dev = private;
 	struct ads112c14_data *data = iio_priv(indio_dev);
 
-	complete(&data->drdy_completion);
+	if (READ_ONCE(data->continuous_mode))
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
@@ -695,6 +706,13 @@ static int ads112c14_single_conversion(struct ads112c14_data *data,
 					data->i2c_crc_enabled);
 }
 
+static bool ads112c14_using_drdy_trigger(struct iio_dev *indio_dev)
+{
+	struct ads112c14_data *data = iio_priv(indio_dev);
+
+	return data->drdy_trig && indio_dev->trig == data->drdy_trig;
+}
+
 static int ads112c14_read_raw(struct iio_dev *indio_dev,
 			      struct iio_chan_spec const *chan,
 			      int *val, int *val2, long mask)
@@ -898,6 +916,19 @@ static int ads112c14_write_raw_get_fmt(struct iio_dev *indio_dev,
 	}
 }
 
+static int ads112c14_update_scan_mode(struct iio_dev *indio_dev,
+				      const unsigned long *scan_mask)
+{
+	/* Only continuous mode is limited to a single channel. */
+	if (!ads112c14_using_drdy_trigger(indio_dev))
+		return 0;
+
+	if (!iio_validate_scan_mask_onehot(indio_dev, scan_mask))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int ads112c14_debugfs_reg_access(struct iio_dev *indio_dev,
 					unsigned int reg,
 					unsigned int writeval,
@@ -952,6 +983,19 @@ static int ads112c14_read_label(struct iio_dev *indio_dev,
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
@@ -961,6 +1005,26 @@ static irqreturn_t ads112c14_trigger_handler(int irq, void *private)
 	u32 i;
 	int ret;
 
+	if (ads112c14_using_drdy_trigger(indio_dev)) {
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
 
@@ -988,10 +1052,81 @@ static const struct iio_info ads112c14_info = {
 	.read_avail = ads112c14_read_avail,
 	.write_raw = ads112c14_write_raw,
 	.write_raw_get_fmt = ads112c14_write_raw_get_fmt,
+	.update_scan_mode = ads112c14_update_scan_mode,
 	.debugfs_reg_access = ads112c14_debugfs_reg_access,
 	.read_label = ads112c14_read_label,
 };
 
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
+	WRITE_ONCE(data->continuous_mode, true);
+
+	ret = regmap_write(data->regmap, ADS112C14_REG_CONVERSION_CTRL,
+			   ADS112C14_CONVERSION_CTRL_START);
+	if (ret) {
+		WRITE_ONCE(data->continuous_mode, false);
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
+	WRITE_ONCE(data->continuous_mode, false);
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
+};
+
 static int ads112c14_populate_idac_mag(u32 current_nA, u8 *idac_mag)
 {
 	u32 current_uA = current_nA / (NANO / MICRO);
@@ -1480,6 +1615,19 @@ static int ads112c14_probe(struct i2c_client *client)
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
@@ -1490,7 +1638,8 @@ static int ads112c14_probe(struct i2c_client *client)
 
 	ret = devm_iio_triggered_buffer_setup(dev, indio_dev,
 					      iio_pollfunc_store_time,
-					      ads112c14_trigger_handler, NULL);
+					      ads112c14_trigger_handler,
+					      &ads112c14_buffer_setup_ops);
 	if (ret)
 		return ret;
 

-- 
2.43.0

