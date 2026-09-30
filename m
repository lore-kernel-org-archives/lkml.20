Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48603C278A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762532; cv=none; b=KcnrZDuzMfex7QuKImHh8OC4mUGQIWaiw0VtaKQkwjut3MoV/t+tly8e/rlHhwXiQhNnT1ic6hI1+dGalfxsKTQ7tzVx/y+bryiG1k/byTwnxqY43mfgVutkZ6VMvAGhqlQbETe3les0DDZBbmrQMt/VGDSf75QdiIjowVO7PaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762532; c=relaxed/simple;
	bh=5yxLldOaCA2w5kfGlU07NtufAnYB46ghSuU0NT+y2kU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qRUqzz9zcsT+bLDjLAv3YJYSg6J5GsNfX4b8tG3JXxHuL3VPZu0m61aG+ng5AjR2MbSga0UPNRd1cALuPEpmCvH41a0/jBcEpAJSLVjm1cfjmS3RNC+xebSgjulbZQtAzLcgkDCjK4L0FQOAZG3zC1KHfwAzDwGgc/XmqS8fe6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M9jwdf/1; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9jwdf/1"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3add810eso799208e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790762526; x=1791367326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lKqIpu7oOccEj9gtR1xapT89lzStUOrGuCslRc1kF2Q=;
        b=M9jwdf/1u8cxOy3Xs8SgUmVK2mVTOgV1Y8HCsZE8plKyNmj8WnFYbP2PJqNQ5iyoVv
         RZUXVkAJW9eGNeAKfGHH1Otk9MXz9ELkHbZq56RG+rg8KvIHg8Oja65ctOm/DZCyvB8O
         MlJ4jXaikOGzFb4R3EAVciZzxkwk0T4/S10ipgc9LPMoUsHtQZ5aIzyTFJnGMcuvBeUd
         afeynwRLzrii+UMEDFzGo644cIIKpf+zas9DBEbOfaF/nfPkOZ+a+Ua6Xv+Q81e7+MH6
         q0ieTVMpyHBR5Bnqwn3Ndc3TLDXgJiA1jVvS58ukbIvrPbD62i1PvAHeeSfNTXffPx5W
         VJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790762526; x=1791367326;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lKqIpu7oOccEj9gtR1xapT89lzStUOrGuCslRc1kF2Q=;
        b=Cei1VBAvV8CLgtmWlx4M3A6Neh6e5a9C3RN8LVBnFTnfLsbgDRyWaZ/5Hrs6vvobIc
         bHrn5MSIjfULiNSiT8+S7UkpL3skRzGKxfIfjFn3zhQA1xe6h6ItyWe+rkh2BLasWRlb
         G6h1mgB3+y3R99hoiy4Kk+4xHLcX/vtwo4DAXgIyKQD9psXQhjR8LHo66egdm3lluw21
         T+Wi9ClmCVK0ELij73Sfsv3zkUK/Lu19zKuOglSMAKMG+IhEOBAp6aAKpcY09HGBl4r2
         4KfCkTHrDp3oQIM1r2zpAzbB7kAuDTFcT5qUaDeUSy63Z4Y1A4uFkxubOclSCoC1/E5w
         IYJw==
X-Forwarded-Encrypted: i=1; AKwUvBz2vKIY6UaXRF8JheYc+FxY/NMJOVOrIGrdzb+nX8ShmXsEyO8px344oQ1qzLA6Mzdp1zQ95dO/BNm3CDk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxTQFbHA9JTKZDyJyLnBL3eOr9FmUBQmNDf+mkDAk4UBuprh3n
	tWCVDPbhr6P2hgNUA+Lue0Dh2z3WY3yVXQYMClU/sb0qYz+5QcWw2lsH
X-Gm-Gg: AYBFou3J9PSTtt6yQ884orrxnkaxOPwTHPUy2bEMXmkowXuVPPNZ6wZNexz1NdqcI65
	zesIFPEUkXGej1unibeEzAVFrPderyo/X9nOZt2goi1FbfiCmZp3ztaeGCxiZVhafRJH9UWQLox
	XZ8HoNUv5oGpaX2tWfbP7KVIl30BjwFHmE+A/5uKljkpKrJjMojlXDrjDcSSK0jdY0Umj23Us73
	I/Xj6zFVP/HuZjojcG+xmKtPn0/h1l3zTb/RzeU26/Ad8nrjd7xTJOJflR/rMi9J3g+wFTYVl+e
	1f7teXC6Z4/Eb6C+U0NM75KMX8KY1IcjfnI3jHQz9IIuxelBD9P0dKIwUO1o/QC9w2i/dktBWbN
	FdYNx6mJwafVpBpNrIQQBz83K3hQCwqh0DyroosEWXZPDkGZpUl6aJiEg9VWshrDzL+fdEmp3RD
	SaBYRze4VqaA0M+SDveNDPUtjagxsjnOztstsS1iR396Ank78WZorgPDLDnonavynsa1yiW/i0W
	5Z2h8J/Ya5+nyQTniY93f3q2FYC3jXjDj3ipO7vrOYoW6D4Z7Uqt3+jLlOAOwyRLCD1AA==
X-Received: by 2002:ac2:5b04:0:b0:5b8:e6e8:a5b7 with SMTP id 2adb3069b0e04-5ba405dac02mr240784e87.24.1790762525442;
        Wed, 30 Sep 2026 03:02:05 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3fbe6c06sm240422e87.22.2026.09.30.03.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 03:02:04 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH v10 1/4] iio: pressure: dps310: read buffered samples from the hardware FIFO
Date: Wed, 30 Sep 2026 13:01:55 +0300
Message-ID: <20260930100158.957977-2-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930100158.957977-1-zoone.rupert@gmail.com>
References: <20260930100158.957977-1-zoone.rupert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

DPS310 has a 32-entry FIFO shared by both measurements. Drain it from a
work item and push what it held, so buffered capture needs no trigger.
Nothing in tree wires the interrupt pin, so the work rearms itself at
half the FIFO fill time.

Each entry carries one measurement, so a pressure entry is compensated
with the temperature ahead of it. Pressure read before a session's first
temperature is held until one arrives rather than dropped, so the first
push can wait a temperature period.

FIFO entries are not timestamped, so postenable refuses the timestamp
channel unless a trigger is attached.

Tested on a DPS310 on a BeagleBone Black.

Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 351 +++++++++++++++++++++++++++++++++-
 1 file changed, 341 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 85df58ac1809..53ebf6962eba 100644
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
@@ -20,7 +15,11 @@
 #include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/time.h>
 #include <linux/unaligned.h>
+#include <linux/units.h>
+#include <linux/workqueue.h>
 
 #include <linux/iio/buffer.h>
 #include <linux/iio/iio.h>
@@ -59,9 +58,22 @@
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
@@ -95,6 +107,22 @@ struct dps310_data {
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
@@ -937,6 +965,288 @@ static int dps310_fill_channels(struct dps310_data *data,
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
+			if (pressure_enabled)
+				pushed += dps310_fifo_push_held(data);
+			else if (!dps310_fifo_push_scan(data, raw[i], 0))
+				pushed++;
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
@@ -969,6 +1279,14 @@ static void dps310_reset(void *action_data)
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
@@ -996,13 +1314,20 @@ static int dps310_probe(struct i2c_client *client)
 
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
@@ -1018,12 +1343,18 @@ static int dps310_probe(struct i2c_client *client)
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

