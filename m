Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56DA42AF82
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789074891; cv=none; b=EC9YKHVde/iVmAoeGgKDf/YWZ8o2M/TfUTkRMvdvozVDCqQl5xWp5WqUCjRM5xU8f66C8qrso5urXwtHAYNyc9Bw2P4XG9dpFWq7eHtS9APElUryGP4gb8aiDlKhbur8xEYGvXVycU5Kj9Zau9wEgLyE4SiX9128wCJkt1DLyRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789074891; c=relaxed/simple;
	bh=ipRQM+y4GEfK0iLNUB8nAfxP8/yNtQ0sDmoWBJ2tDGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lwqvBo6Xt4VevThgkeC8jb43LcJfV58DLlZT1rtbr2V/n45ETOBuO/2ZZw5rOZG8HSRbH2a/i7gkk/hZ+tDihodx/TcFJIH1TCqyWbeUwgg9k2aRWcN2KRFXu1h+22i91gDUI/xVgK/TV5uZIdEdfwJ5BhZ4F7M47Vb2Xm/T4Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gjEDSmf9; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gjEDSmf9"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4bf948737e1so233598b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789074875; x=1789679675; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wBiJn8Ecvvni6QBRfEghFXWnlQeSyCYHU8s9BH4FLQU=;
        b=gjEDSmf9Cze5DGk7lvDcIWqke3hNey1+qCmc+7vwkBvubBWN6EF3YMAt+7XWx2HQWe
         Ma112U47v4X0Xo3rKvkoUgsQGFzZO/M+8/0UE0z6ngRLmOEvi2OZPOgSVzdrVh6TaYGx
         EqFuNQhlv6G4ZMOICxni/0RAa6ZJX3+9jZJ9/nKOL6nZ8tiuYh8iF/rGTUrvmwLg8k1y
         MefvQ80+6ZZ0owI4MKE8V5YtKOlf9Sa8C+Xkcvk/BvnJ/qPJGUP5jPUJwdPMMe495RTW
         CJpTbhtTw1Cr4JMLptSIgFVLlpMxucuGuu+tOvqOlCUh4ZVz7g3gmVBhBvzMboIN/kvC
         ZIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789074875; x=1789679675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wBiJn8Ecvvni6QBRfEghFXWnlQeSyCYHU8s9BH4FLQU=;
        b=axxF8hAWwAmLNom0KQfPO2kBuND9QNgy5bYHeyG40a6RsrUg0sW2VZzj+2ySKQQ+5X
         E9R75H23+yvnG662U1xhLdDEEJJYJsBJhXqKLcdj8EMj/7mdxIKEU0TBml6U7zAAiis9
         rLi/nrteFvhE9vzsLThI2lru9A2qVFUHvggXr11TEXQnWW2PodUHQnHFZKhVJxY5QiCJ
         NNjC779e9a3QK18Y8x+8ZF5Mz6KKi+yhzLjnLN2tCp5HyfwzUJZtaL+eG/ND6n5/FagE
         lcXanV3iDcX26ysVXaRALbDoUhe0iqP8zltZOE59k0stA/Ra+D7EDFoKt7gYEx+283u/
         H5FA==
X-Forwarded-Encrypted: i=1; AKwUvByy0S3/YCkhWu+oPTNYBSwDPsl63DVe8PERtzJMrJxAJ+yRG9ahcwAxYc/s8+wS2eu4nk2rpZ0/0d81BZ0=@vger.kernel.org
X-Gm-Message-State: AFuF++mzfbFzzwc1iKe3qqd/KzI3NRX6BCppESKjsx7a4Lah3F5pAZJm
	5LvY5jyimvyObD5SJ64KxQjoC5WUZIiGSXsE51ZmvWDG32GJObjll2vzQFVu0PXV/+ndl6N0K1y
	zzBeR
X-Gm-Gg: AYBFou23WcTv30kP0MAaCEIft468zKNZiF6zgk9m2VIvETszWTIZa9BZSD9hWA3cWNc
	h/Ym12LyrK92lBzlI9OBm7QITrgRTty56miA4DPWl+Pi7TU4VziXLnGJcBNZ3Qcabwxl7BcMJdN
	0Q6DOCRMT/A8h2SPxSDXTMsgsqJB7vN5FvfJOZat7bQAcNDPXQ40zA45EzSukqHvsucndrvAyGx
	ddHgXzLMZFAk3AHjtlDXzOVS0UZXcHVFE1HNzLVTspcxG8QgW9sNAbXKOY/vUrJa941o+j3utHV
	dG5DXvEuKDuMcTxdsaOm4yMC6cQmrKYwH8NYicVX4kTBr4KjfJlRKNjCDdApe9vSW+1D4b+IR7L
	6m1mEU0/VfUnMXwvdS0/LMEI+mH/OuhLEBYtITZfhpXsb3XoIlMDlhHtxHgi+4uT2o2hpxBBv+M
	+Y8Kn2xqhtJDjSbLMbqtPGPbsCRkr2Kgwyse2i9E0VTCch+fiXQdsw86uLmCOurh5bmWzmyaIrT
	cTH
X-Received: by 2002:a05:6808:2f0d:b0:4c1:30a9:6dac with SMTP id 5614622812f47-4c31c6263f4mr1346436b6e.19.1789074874957;
        Thu, 10 Sep 2026 14:14:34 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:fbf1:d0da:69e0:11a0])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4c330daa42esm347315b6e.4.2026.09.10.14.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 14:14:33 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Date: Thu, 10 Sep 2026 16:13:02 -0500
Subject: [PATCH v3 03/10] iio: adc: ti-ads112c14: add continuous mode
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-iio-adc-ti-ads112c14-filter-support-v3-3-e5a9b27ddb1a@baylibre.com>
References: <20260910-iio-adc-ti-ads112c14-filter-support-v3-0-e5a9b27ddb1a@baylibre.com>
In-Reply-To: <20260910-iio-adc-ti-ads112c14-filter-support-v3-0-e5a9b27ddb1a@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Chris Hall <c-hall@ti.com>, Patrick Edwards <pedwards@ti.com>, 
 Kurt Borja <kuurtb@gmail.com>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "David Lechner (TI)" <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8170; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=ipRQM+y4GEfK0iLNUB8nAfxP8/yNtQ0sDmoWBJ2tDGI=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqox1/1aiAbgy+Uf3d3gNsS+yyEcwcEWW/qJX2R
 xM7emYTUeOJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaqMdfwAKCRDCzCAB/wGP
 wLq7B/4rq3+r6tbXQG6SmX1KkB29Ri8ZzWD5Cpp2y562utbYrcQ9XrHqI+CmzAOayk5FsDk/k/q
 2+J9d1YIOd9EaMsLGj+krSBsPHxMT3L6DHQYpa63E2GC1lZt7YJPzEF4TQ/2UX0QRh7dahUswhz
 uKieByxUshAzid6VPaIXhIZucriRGFsfwxj+9qZY9em4cUAVSR14GPGtAUWfxAiNqSrH45TUyBo
 tn4HjVgoc8mOCjjXnORaDlOhQtDgJW+hmaEA/nOk2HLAw1f1Dewto8p0miq+N4tNF1IBI5nskSa
 MsN0KA4e2itP651j/wPfhFhxONBjYyPRkGJRINzKumYkPBKx
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
index b2940b5d3c99..09807ea4fb18 100644
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
@@ -1476,6 +1611,19 @@ static int ads112c14_probe(struct i2c_client *client)
 
 		init_completion(&data->drdy_completion);
 
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
+
 		ret = devm_request_irq(dev, data->drdy_irq, ads112c14_drdy_irq_handler,
 				       0, dev_name(dev), indio_dev);
 		if (ret)
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

