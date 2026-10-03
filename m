Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE73F38B7D1
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 19:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791057028; cv=none; b=LvpPrnOzDTrXVZuHU45n1XB6DMHQm5Uq6Rq3VwrO2blLD3mpyqVnuOrTqclsjLw4oZzgktAoNfTj/XZZ4yAJPbWQFQbJuHvRxjWgkZmxIzgWQd2WK36z5HDoRrGUb1KE8eyQ5t/dS4Ym7sTES9foLPV6DDDG2IeptBAQp2iukwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791057028; c=relaxed/simple;
	bh=uCTsc2c8A/rVz4TvRfgpaFUtI5YBUmKgbTrQP/c0vrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HTZhH6WsjYC7Jna6iCb7S+YYSTdfuuERfuEueLpZNfXMsPQx2j+1d8ewhks5SoPR+TW7M/fDE7QDiVHlYvJ+pILi3d6hMAe7iNhhg7trsIV1kghUUt57C05wDcpbrVkjGlTz5WFg9ru3B4DTNmTX5KgYtotU6KlPtFCSbR1+2eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7Tgg5b3; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7Tgg5b3"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5ba7ed32ccdso565025e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 12:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791057023; x=1791661823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x5LOaqD7/ccBXerjwYsXzaIEG00JTCjcgI1VQuXaVpI=;
        b=a7Tgg5b3kaMZ3aRRH8pRd4NnUV33wa/zox+hJfPXDwKNNmmBcx7KfjtqKVZ2PUKQ6g
         F5lcW1BK6HTVSEz1U2U/ga4G14stSyVKJ2KFJYiI9DJM8wyQAdphXYcmGSRdKkPqGn7Z
         C6tk3XiT5nRmMFezjjZki4h7q/k7rSCQlVyb67/8iT3nWlasZH6wcHiposPhdJT1hrGG
         /9qaiE8tICIW2UWvGKZ7Ggv4EUGnTCbvSRm5ioG0xT/iFID9t0YWh0a/3Os0ecijCjrq
         TlrSEr+f5nuXTCRvrYeWQHcT63A1IFpY/x+5d6ZYZRLPW5+EXDzcOMaojSf55qw7/HHR
         XgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791057023; x=1791661823;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x5LOaqD7/ccBXerjwYsXzaIEG00JTCjcgI1VQuXaVpI=;
        b=lURXPzk71lkpwLcSYi7Q97u/NyTKYZmiPQAw3nyK0LusPkvSQ/Yazg5u6qkIWjkGGx
         SoyInh2HVmIsX00A+MIVTWVZC+OjARcpbzb2ietTrRhp2o/Bp4KZAgbBNMZbUw1H8blK
         50l5PGB9x5C6z0DY7oiqL4XlLzU6npOtvslA+cEFQgeD9FvtdvJDe3EjNLA8rnDSM5RV
         vxonjULFek0ryY5f1zHfTXlk8H+UKQ1TxR7tRAHsDezpBr7V3vr4HF9yZ4w1+Sl7noOE
         vKBqTw76joAEUX64EwItRNgXlbhXOY1pF9IwOSpYWckjQc5cIZ5vRDw4TmyqxJv9bSBl
         z3FQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXF0TE15aaztLNVw/8cGeqEz8DKOmXo7KiW7kSBCwV5ci1OdAaDn+CZp0fsAiu+21G3B1tFpoQqdjFZEg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZIP3gab8xluJqUAMpFKAv+gdTyjBmpHDwSXYIA9ztYyo7z5NQ
	YPacP6V+u+ZCwwKZ+992YoSz3MoSj+wGQ7pnMze7wqeP2HxbiDKkpHFn
X-Gm-Gg: AYBFou0UkM77VoI18sU+rqT19GHyDEWBbM13oLVkC6uf3UvJGUC0tr12cMUco+yvoxX
	sQzf3JptnP7/WcAp6Vwai63De7ktWxFTsQyaIaB2VRXSDsGPdNpmdNR0vrmW+QROa1GkAI4Y2R+
	SbByqGVifQb9RbWDWA0t7oYg1PjZf30PkDpG89PCfE5PDTmJSXYdiVMr1uWqLj+d3BZoAJ+6L2q
	MnZszreaKi5XTORZecxH3ofQ0HBscb9ieKgkuPcyuGa8CzJZ3w8PPHZeoi52Hoxq+xJb4kl25W9
	WYdLe274w9tLTEK1xUzY38ShTyozYLIL0nDG3hwiPBYn+YlBui8kduwzrtlBZdfTXvzg/PYjcp4
	D2EATGGDuQ7Yrcq6T1q5dWRX1NxEYUMEeb94GzhoNGguI3w6W5ScGszpeVq+T1ujH5L4AsP/2cm
	Tk3ccNFFEW/Er1ZlNxjeTL3xhGe2xZEwfBQRdGMYHO4Fe4TGYQD2I2PI8oXdM3l9y9uZuPCvtoA
	CKGYsmn9cHKOIeRoRaKYVtPQEdXgA5rMC55lOPyJcRGS9co8b/KTmMCVloVtmOew3nzNw==
X-Received: by 2002:a05:6512:6401:b0:5b8:f2ca:40c8 with SMTP id 2adb3069b0e04-5bcb548a9ebmr1145082e87.59.1791057022500;
        Sat, 03 Oct 2026 12:50:22 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7abdbfsm1762608e87.65.2026.10.03.12.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 12:50:21 -0700 (PDT)
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
Subject: [PATCH v12 2/5] iio: pressure: dps310: read buffered samples from the hardware FIFO
Date: Sat,  3 Oct 2026 22:50:08 +0300
Message-ID: <20261003195012.92948-3-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261003195012.92948-1-zoone.rupert@gmail.com>
References: <20261003195012.92948-1-zoone.rupert@gmail.com>
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
 drivers/iio/pressure/dps310.c | 335 +++++++++++++++++++++++++++++++++-
 1 file changed, 325 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 5c8af216ece4..b782b187ccce 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -2,26 +2,25 @@
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
+#include <linux/devm-helpers.h>
 #include <linux/i2c.h>
 #include <linux/limits.h>
 #include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/time.h>
 #include <linux/unaligned.h>
+#include <linux/workqueue.h>
 
 #include <linux/iio/buffer.h>
 #include <linux/iio/iio.h>
@@ -60,9 +59,22 @@
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
@@ -96,6 +108,22 @@ struct dps310_data {
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
@@ -938,6 +966,284 @@ static int dps310_fill_channels(struct dps310_data *data,
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
+/* No interrupt pin is wired in tree, so drain on a timer */
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
+	return raw & DPS310_FIFO_TAG_PRS ? DPS310_FIFO_PRESSURE : DPS310_FIFO_TEMP;
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
+
+	for (unsigned int i = 0; i < data->fifo_held; i++) {
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
+	unsigned int cnt;
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
+	for (unsigned int i = 0; i < cnt; i++) {
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
+	scoped_guard(mutex, &data->lock)
+		rc = dps310_fifo_drain(data);
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
+static int dps310_fifo_start(struct dps310_data *data)
+	__must_hold(&data->lock)
+{
+	int rc, prs_rate, tmp_rate;
+
+	rc = dps310_get_pres_samp_freq(data, &prs_rate);
+	if (rc)
+		return rc;
+
+	rc = dps310_get_temp_samp_freq(data, &tmp_rate);
+	if (rc)
+		return rc;
+
+	data->drain_interval_ms = dps310_fifo_interval(prs_rate, tmp_rate);
+
+	rc = dps310_fifo_hold_alloc(data, prs_rate, tmp_rate);
+	if (rc)
+		return rc;
+
+	/* Drop whatever accumulated before enable */
+	rc = dps310_fifo_hw_flush(data);
+	if (rc) {
+		kfree(data->fifo_hold);
+		return rc;
+	}
+
+	rc = dps310_fifo_set_enable(data, true);
+	if (rc) {
+		kfree(data->fifo_hold);
+		return rc;
+	}
+
+	schedule_delayed_work(&data->fifo_work,
+			      msecs_to_jiffies(data->drain_interval_ms));
+
+	return 0;
+}
+
+static int dps310_buffer_postenable(struct iio_dev *iio)
+{
+	struct dps310_data *data = iio_priv(iio);
+
+	/* An attached trigger drives the capture instead, FIFO stays off */
+	if (iio_device_get_current_mode(iio) == INDIO_BUFFER_TRIGGERED)
+		return 0;
+
+	/* Entries are not timestamped and the drain timer is no substitute */
+	if (iio_scan_timestamp_enabled(iio))
+		return -EINVAL;
+
+	guard(mutex)(&data->lock);
+
+	return dps310_fifo_start(data);
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
@@ -997,6 +1303,7 @@ static int dps310_probe(struct i2c_client *client)
 
 	data = iio_priv(iio);
 	data->client = client;
+	data->iio = iio;
 
 	rc = devm_mutex_init(dev, &data->lock);
 	if (rc)
@@ -1006,7 +1313,8 @@ static int dps310_probe(struct i2c_client *client)
 	iio->channels = dps310_channels;
 	iio->num_channels = ARRAY_SIZE(dps310_channels);
 	iio->info = &dps310_info;
-	iio->modes = INDIO_DIRECT_MODE;
+	iio->modes = INDIO_BUFFER_TRIGGERED | INDIO_BUFFER_SOFTWARE |
+		     INDIO_DIRECT_MODE;
 
 	data->regmap = devm_regmap_init_i2c(client, &dps310_regmap_config);
 	if (IS_ERR(data->regmap))
@@ -1022,12 +1330,19 @@ static int dps310_probe(struct i2c_client *client)
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
+	rc = devm_delayed_work_autocancel(dev, &data->fifo_work,
+					  dps310_fifo_work);
 	if (rc)
 		return rc;
 
-- 
2.43.0

