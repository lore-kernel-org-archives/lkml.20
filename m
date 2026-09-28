Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB2247DF86
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790629908; cv=none; b=TBqdPh5vp142nlBJOVijGBu2iZ2qNtdBpyM5g+N3W32pKm/FA8xxOfxQgy7gw4QWaxhus6rXu6GLSexEGOovLhKU6uVWSU9enUCKGPgB5vFpAAmS0ROQChnw3w15qYs+e1bcDjnrkK3tcopj2aPIUgRnzEjf5Hyg8odjfTL+aCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790629908; c=relaxed/simple;
	bh=+ZFAOzEuyZTYXvsQ98ZE7ZkrGkC3sX2aHXTzC2jfO/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lWd0ETq7/VkHwPQ2edU3TKV0QZp/yMfIkzOt8a9YYDgQqAOnXRRTzpmsRGkDuu/5UDHZmlKV5FiFW4sK6ftqzumHCCHvdpP2Xva7OzLxbgT2EnT0TOLg/niqGTKWAHk9/19CCQeBi7yr0aDspP0WexkH3dboaMF1xS5046EgBnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZsuTjgpg; arc=none smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZsuTjgpg"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a6502b74abso26079851fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790629903; x=1791234703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jDJNE24LnrV9UMCuKz8CfqvzAVnauEFrV/uA31R0eD8=;
        b=ZsuTjgpgL9rTDjdnxzYDx9dJN9criQsgPlt+olYpnOAhiEGOy/VkpnpigfkbJxGAEa
         FdF7CLEUwKBh9ZJ73txsGDwwM4irsU5lBDwGMvnj37D6fYAAVlYD23oXe32Vmzb4Inr4
         yh9j4E91qUs++Fh7KZxZ9VbGfcOloQoYraQ+Vh4N1OUsNk9Fhn18QyJ3VVJr1yBralWM
         PWNjuHNYtygCWxbIl5fLnm5m6kP844hJBI+fGSipciwePb1wh6j57D40EcEeL56L4LIg
         39bfsKqHOpog3AZlgyOizJmo3Ngu7TWPxL47UqLPURsB4vYetMu0X/koc8XtBZ+4O5Gz
         XdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790629903; x=1791234703;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDJNE24LnrV9UMCuKz8CfqvzAVnauEFrV/uA31R0eD8=;
        b=ysHJ6SEht3SUVZNXmuMUg2xfzd6+0ZP77lVrjokKjedTWh6MM173VDQlGg3jqXlQe1
         E1LcxPYJUX6P53EPRKmisZYY0pZaheA0JkaqHbA6+rXyEa6nHUNEct0C/7XSPMuEh4oV
         1kVDQM5MImSE6wZZ5KKCdABOHLnLyFmpBFTV+VAVik+LqLVc8b/AfENV4Kt/7suG8r5j
         G+QaSkAfrfhQI86ye4bLl2AA6SP7mbhnFbNBYEDJszceLxIOzn8k16mHTxcjtoz5xmrj
         Fk1uaUTcBVEACZGP8urlvB9soIi+np/74drv1KJXRO8I1l9AMDY4Eo2QJMVhFY6+g1dW
         oWww==
X-Forwarded-Encrypted: i=1; AKwUvBy0Fv8Ld96TGL4BPWKAs6A8zbmiAxr464VP5wf29n8gwlvdNm2/eyIhpZmfUra4jXkK2qd7E3chJQG43Xc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJH5R3mAkJGwrNvkUT6VZC7xClagBxwWuYbGxhwPhx0yvyvAIpw
	AS4x18jefqwUahqnywBfX2ey9erD7WYHFdOwTTOk3PpJx6stdA1/8FYl
X-Gm-Gg: AYBFou3KOq1FLuAktbxW7d56rTwJyaQ0patAO4YSgGibVX5BpRX22SHADU465qVK0J6
	/MiYno6mxf0sIl3fnSxo9c/k0GPu6czXZqLmZ5j9EihZ8ODQLDpO7mm+82MFLgoIUrMk91flpvN
	oSWXmooQRgnECIuCeWnqhmtvBjg0/Eb+bLwAvoTqgsniJMYmKrF4YJQ+WtK1lzYM1HLo5mAdPQ8
	7X1oHDNa0pkXsSRDapSutUc18f2tMhNeKjTuoNnmpeZTO3Bajp/Snfwi/qOV9q6HCkJX9whIoLD
	Z3qBK3uL+hng+OTSPksJCUXyiHbLXoLGn5Ni1Vr3csrONF8h0mIgwxcQyrIllI/Rp7nJAvVsI1K
	ePjNECbLKsqJogJlA/Jh2fV4Wyuz2J/yeMJx7K+7xn89jtmtvhayjYB6aopymQ+D7vg9L+cHy7+
	4RLFmtUiWWWo13wP0qpNKaY8V9KHer5XmLWuiGGYdl6vGh0imOToLM7AFrG3WbAbReCETiWtE+4
	ENbCRIpOcHykBqhWOBBqaHgqDVgaL1wp7ZIiVHCANFw5aAcNivzVvISE4tQACdvyFmo2g==
X-Received: by 2002:a05:6512:304c:b0:5b8:bc5e:d10e with SMTP id 2adb3069b0e04-5b8df0b1685mr5074234e87.56.1790629903166;
        Mon, 28 Sep 2026 14:11:43 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9d826fa06sm842860e87.8.2026.09.28.14.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 14:11:42 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH v9 1/3] iio: pressure: dps310: read buffered samples from the hardware FIFO
Date: Tue, 29 Sep 2026 00:11:25 +0300
Message-ID: <20260928211127.641828-2-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928211127.641828-1-zoone.rupert@gmail.com>
References: <20260928211127.641828-1-zoone.rupert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The DPS310 has a 32-entry FIFO shared by both measurements. Drain it from
a work item and push what it held, so a buffered capture needs no
trigger. Nothing in tree wires the interrupt pin, so the work rearms
itself at half the time the FIFO takes to fill.

Entries carry one measurement each, so a pressure entry is compensated
with the temperature ahead of it. Pressure read before the first
temperature of a session is held until one arrives rather than dropped,
so the first push can wait a temperature period.

FIFO entries are not timestamped, so postenable refuses the timestamp
channel unless a trigger is attached.

Tested on a DPS310 on a BeagleBone Black.

Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 353 +++++++++++++++++++++++++++++++++-
 1 file changed, 343 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 85df58ac1809..c199fc734084 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -2,16 +2,11 @@
 // Copyright IBM Corp 2019
 /*
  * The DPS310 is a barometric pressure and temperature sensor.
- * Currently only reading a single temperature is supported by
- * this driver.
  *
  * https://www.infineon.com/dgdl/?fileId=5546d462576f34750157750826c42242
  *
  * Temperature calculation:
  *   c0 * 0.5 + c1 * T_raw / kT °C
- *
- * TODO:
- *  - Optionally support the FIFO
  */
 
 #include <linux/cleanup.h>
@@ -20,7 +15,10 @@
 #include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
 #include <linux/unaligned.h>
+#include <linux/units.h>
+#include <linux/workqueue.h>
 
 #include <linux/iio/buffer.h>
 #include <linux/iio/iio.h>
@@ -59,9 +57,22 @@
 #define  DPS310_FIFO_EN		BIT(1)
 #define  DPS310_SPI_EN		BIT(0)
 #define DPS310_RESET		0x0c
+#define  DPS310_FIFO_FLUSH	BIT(7)
 #define  DPS310_RESET_MAGIC	0x09
 #define DPS310_COEF_BASE	0x10
 
+/* Section 4.8: 32 shared entries. Stops when full, so late drains lose data */
+#define DPS310_FIFO_DEPTH	32
+
+/* Read back once the FIFO is empty */
+#define DPS310_FIFO_EMPTY_VAL	0x800000
+
+/* LSB tags which measurement produced the entry */
+#define DPS310_FIFO_TAG_PRS	BIT(0)
+
+#define DPS310_DRAIN_MIN_MS	20
+#define DPS310_DRAIN_MAX_MS	(2 * MSEC_PER_SEC)
+
 /* Make sure sleep time is <= 30ms for usleep_range */
 #define DPS310_POLL_SLEEP_US(t)		min(30000, (t) / 8)
 /* Silently handle error in rate value here */
@@ -95,6 +106,22 @@ struct dps310_data {
 	s32 pressure_raw;
 	s32 temp_raw;
 	bool timeout_recovery_failed;
+	bool fifo_temp_valid;
+
+	/* Used only while the FIFO is enabled */
+	struct iio_dev *iio;
+	struct delayed_work fifo_work;
+	s32 *fifo_hold;
+	unsigned int fifo_hold_max;
+	unsigned int fifo_held;
+	unsigned int drain_interval_ms;
+	s32 fifo_temp_raw;
+};
+
+enum dps310_fifo_entry {
+	DPS310_FIFO_EMPTY,
+	DPS310_FIFO_TEMP,
+	DPS310_FIFO_PRESSURE,
 };
 
 enum dps310_scan_index {
@@ -937,6 +964,291 @@ static int dps310_fill_channels(struct dps310_data *data,
 	return 0;
 }
 
+static int dps310_fifo_hw_flush(struct dps310_data *data)
+	__must_hold(&data->lock)
+{
+	return regmap_write(data->regmap, DPS310_RESET, DPS310_FIFO_FLUSH);
+}
+
+static int dps310_fifo_set_enable(struct dps310_data *data, bool enable)
+	__must_hold(&data->lock)
+{
+	return regmap_assign_bits(data->regmap, DPS310_CFG_REG, DPS310_FIFO_EN,
+				  enable);
+}
+
+/*
+ * No interrupt pin is wired in tree, so drain on a timer. Both measurements
+ * share the entries, so they fill it together.
+ */
+static unsigned int dps310_fifo_interval(int prs_rate, int tmp_rate)
+{
+	unsigned int fill_ms;
+
+	fill_ms = MSEC_PER_SEC * DPS310_FIFO_DEPTH / (prs_rate + tmp_rate);
+
+	return clamp(fill_ms / 2, DPS310_DRAIN_MIN_MS, DPS310_DRAIN_MAX_MS);
+}
+
+/* Returns which measurement the entry came from, or a negative error */
+static int dps310_fifo_read_entry(struct dps310_data *data, s32 *value)
+	__must_hold(&data->lock)
+{
+	u8 val[3];
+	s32 raw;
+	int rc;
+
+	/* Entries come out of the pressure registers whichever made them */
+	rc = regmap_bulk_read(data->regmap, DPS310_PRS_BASE, val, sizeof(val));
+	if (rc < 0)
+		return rc;
+
+	raw = get_unaligned_be24(val);
+	if (raw == DPS310_FIFO_EMPTY_VAL)
+		return DPS310_FIFO_EMPTY;
+
+	*value = sign_extend32(raw, 23);
+
+	return raw & DPS310_FIFO_TAG_PRS ? DPS310_FIFO_PRESSURE :
+					   DPS310_FIFO_TEMP;
+}
+
+static int dps310_fifo_push_scan(struct dps310_data *data, s32 temp_raw,
+				 s32 pressure_raw)
+	__must_hold(&data->lock)
+{
+	struct iio_dev *iio = data->iio;
+	s32 channels[2] = { };
+	unsigned int i;
+	int rc;
+
+	/* Direct-mode claim keeps sysfs reads off these */
+	data->temp_raw = temp_raw;
+	data->pressure_raw = pressure_raw;
+
+	i = 0;
+	if (test_bit(DPS310_SCAN_TEMP, iio->active_scan_mask)) {
+		rc = dps310_calculate_temp(data, &channels[i++]);
+		if (rc)
+			return rc;
+	}
+
+	if (test_bit(DPS310_SCAN_PRESSURE, iio->active_scan_mask)) {
+		rc = dps310_calculate_pressure(data, &channels[i++]);
+		if (rc)
+			return rc;
+	}
+
+	iio_push_to_buffers(iio, channels);
+
+	return 0;
+}
+
+/* Pressure seen before any temperature, kept until one turns up */
+static void dps310_fifo_hold(struct dps310_data *data, s32 pressure_raw)
+	__must_hold(&data->lock)
+{
+	if (data->fifo_held < data->fifo_hold_max)
+		data->fifo_hold[data->fifo_held++] = pressure_raw;
+}
+
+/* Returns scans pushed. One that fails to compensate is dropped. */
+static unsigned int dps310_fifo_push_held(struct dps310_data *data)
+	__must_hold(&data->lock)
+{
+	unsigned int pushed = 0;
+	unsigned int i;
+
+	for (i = 0; i < data->fifo_held; i++) {
+		if (!dps310_fifo_push_scan(data, data->fifo_temp_raw,
+					   data->fifo_hold[i]))
+			pushed++;
+	}
+
+	data->fifo_held = 0;
+
+	return pushed;
+}
+
+/*
+ * Read the batch out before compensating it, so a pressure entry pairs with
+ * the temperature preceding it rather than the last one in the batch.
+ *
+ * Returns scans pushed.
+ */
+static int dps310_fifo_drain(struct dps310_data *data)
+	__must_hold(&data->lock)
+{
+	bool pressure_enabled = test_bit(DPS310_SCAN_PRESSURE,
+					 data->iio->active_scan_mask);
+	u8 kind[DPS310_FIFO_DEPTH];
+	s32 raw[DPS310_FIFO_DEPTH];
+	unsigned int pushed = 0;
+	unsigned int cnt, i;
+	int rc;
+
+	for (cnt = 0; cnt < DPS310_FIFO_DEPTH; cnt++) {
+		rc = dps310_fifo_read_entry(data, &raw[cnt]);
+		if (rc < 0)
+			return rc;
+
+		if (rc == DPS310_FIFO_EMPTY)
+			break;
+
+		kind[cnt] = rc;
+	}
+
+	for (i = 0; i < cnt; i++) {
+		if (kind[i] == DPS310_FIFO_TEMP) {
+			data->fifo_temp_raw = raw[i];
+			data->fifo_temp_valid = true;
+
+			if (!pressure_enabled) {
+				if (!dps310_fifo_push_scan(data, raw[i], 0))
+					pushed++;
+				continue;
+			}
+
+			pushed += dps310_fifo_push_held(data);
+			continue;
+		}
+
+		if (!pressure_enabled)
+			continue;
+
+		if (!data->fifo_temp_valid) {
+			dps310_fifo_hold(data, raw[i]);
+			continue;
+		}
+
+		if (!dps310_fifo_push_scan(data, data->fifo_temp_raw, raw[i]))
+			pushed++;
+	}
+
+	return pushed;
+}
+
+static void dps310_fifo_work(struct work_struct *work)
+{
+	struct dps310_data *data = container_of(to_delayed_work(work),
+						struct dps310_data, fifo_work);
+	int rc;
+
+	mutex_lock(&data->lock);
+	rc = dps310_fifo_drain(data);
+	mutex_unlock(&data->lock);
+
+	if (rc < 0)
+		dev_dbg(&data->client->dev, "FIFO drain failed: %d\n", rc);
+
+	schedule_delayed_work(&data->fifo_work,
+			      msecs_to_jiffies(data->drain_interval_ms));
+}
+
+/*
+ * First temperature is one temperature period away at most, which bounds the
+ * pressure before it. Rates cannot change while the buffer runs.
+ */
+static int dps310_fifo_hold_alloc(struct dps310_data *data, int prs_rate,
+				  int tmp_rate)
+	__must_hold(&data->lock)
+{
+	data->fifo_temp_valid = false;
+	data->fifo_held = 0;
+	data->fifo_hold = NULL;
+	data->fifo_hold_max = 0;
+
+	if (!test_bit(DPS310_SCAN_PRESSURE, data->iio->active_scan_mask))
+		return 0;
+
+	data->fifo_hold_max = prs_rate / tmp_rate + 2;
+	data->fifo_hold = kcalloc(data->fifo_hold_max, sizeof(*data->fifo_hold),
+				  GFP_KERNEL);
+	if (!data->fifo_hold)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static int dps310_buffer_postenable(struct iio_dev *iio)
+{
+	struct dps310_data *data = iio_priv(iio);
+	int rc, prs_rate, tmp_rate;
+
+	/* An attached trigger drives the capture instead, FIFO stays off */
+	if (iio_device_get_current_mode(iio) == INDIO_BUFFER_TRIGGERED)
+		return 0;
+
+	/* Entries are not timestamped and the drain timer is no substitute */
+	if (iio_scan_timestamp_enabled(iio))
+		return -EINVAL;
+
+	mutex_lock(&data->lock);
+
+	rc = dps310_get_pres_samp_freq(data, &prs_rate);
+	if (rc)
+		goto err_unlock;
+
+	rc = dps310_get_temp_samp_freq(data, &tmp_rate);
+	if (rc)
+		goto err_unlock;
+
+	data->drain_interval_ms = dps310_fifo_interval(prs_rate, tmp_rate);
+
+	rc = dps310_fifo_hold_alloc(data, prs_rate, tmp_rate);
+	if (rc)
+		goto err_unlock;
+
+	/* Drop whatever accumulated before enable */
+	rc = dps310_fifo_hw_flush(data);
+	if (rc)
+		goto err_hold;
+
+	rc = dps310_fifo_set_enable(data, true);
+	if (rc)
+		goto err_hold;
+
+	schedule_delayed_work(&data->fifo_work,
+			      msecs_to_jiffies(data->drain_interval_ms));
+
+	mutex_unlock(&data->lock);
+
+	return 0;
+
+err_hold:
+	kfree(data->fifo_hold);
+err_unlock:
+	mutex_unlock(&data->lock);
+
+	return rc;
+}
+
+static int dps310_buffer_predisable(struct iio_dev *iio)
+{
+	struct dps310_data *data = iio_priv(iio);
+	int rc;
+
+	if (iio_device_get_current_mode(iio) == INDIO_BUFFER_TRIGGERED)
+		return 0;
+
+	cancel_delayed_work_sync(&data->fifo_work);
+
+	guard(mutex)(&data->lock);
+
+	kfree(data->fifo_hold);
+
+	rc = dps310_fifo_set_enable(data, false);
+	if (rc)
+		return rc;
+
+	return dps310_fifo_hw_flush(data);
+}
+
+static const struct iio_buffer_setup_ops dps310_buffer_setup_ops = {
+	.postenable = dps310_buffer_postenable,
+	.predisable = dps310_buffer_predisable,
+};
+
 static irqreturn_t dps310_trigger_handler(int irq, void *p)
 {
 	struct iio_poll_func *pf = p;
@@ -969,6 +1281,14 @@ static void dps310_reset(void *action_data)
 	dps310_reset_wait(data);
 }
 
+/* The drain rearms itself, so stop it even if the buffer never disabled */
+static void dps310_cancel_fifo_work(void *action_data)
+{
+	struct dps310_data *data = action_data;
+
+	cancel_delayed_work_sync(&data->fifo_work);
+}
+
 static const struct regmap_config dps310_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -996,13 +1316,20 @@ static int dps310_probe(struct i2c_client *client)
 
 	data = iio_priv(iio);
 	data->client = client;
+	data->iio = iio;
 	mutex_init(&data->lock);
+	INIT_DELAYED_WORK(&data->fifo_work, dps310_fifo_work);
 
 	iio->name = DPS310_DEV_NAME;
 	iio->channels = dps310_channels;
 	iio->num_channels = ARRAY_SIZE(dps310_channels);
 	iio->info = &dps310_info;
-	iio->modes = INDIO_DIRECT_MODE;
+	/*
+	 * Both modes advertised: the core picks TRIGGERED with a trigger
+	 * attached and falls back to SOFTWARE, which the FIFO path uses.
+	 */
+	iio->modes = INDIO_DIRECT_MODE | INDIO_BUFFER_TRIGGERED |
+		     INDIO_BUFFER_SOFTWARE;
 
 	data->regmap = devm_regmap_init_i2c(client, &dps310_regmap_config);
 	if (IS_ERR(data->regmap))
@@ -1018,12 +1345,18 @@ static int dps310_probe(struct i2c_client *client)
 		return rc;
 
 	/*
-	 * The device measures continuously in background mode, so a capture is
-	 * just a read of the latest results. The trigger is not aligned with
-	 * the measurements, so the timestamp is taken in the handler.
+	 * The device measures continuously in background mode, so a triggered
+	 * capture is just a read of the latest results. The setup ops run the
+	 * FIFO drain when no trigger is attached. The trigger is not aligned
+	 * with the measurements, so the timestamp is taken in the handler.
 	 */
 	rc = devm_iio_triggered_buffer_setup(dev, iio, NULL,
-					     dps310_trigger_handler, NULL);
+					     dps310_trigger_handler,
+					     &dps310_buffer_setup_ops);
+	if (rc)
+		return rc;
+
+	rc = devm_add_action_or_reset(dev, dps310_cancel_fifo_work, data);
 	if (rc)
 		return rc;
 
-- 
2.43.0

