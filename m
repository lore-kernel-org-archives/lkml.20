Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64ABC3911DD
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792342825; cv=none; b=HZjltYTAqNut/dvvBuR+mD6RnINllQxZQjJcGkCCwPFSoigS9kuV6NdM78cbzZ7v3JqFHU5Hyq63bmrB9a8hAT4lqBH8etLfQOhjnuVMptdi+vzuWRaa7UpInkbrzJEvFj87ZWEjQTBHqwTQGDtsr+zAmaSp2s6w6u/Rvr0o1kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792342825; c=relaxed/simple;
	bh=ZjedDeld5RX6fASryBMqBtDu/GcSA57+Ex/jbaQmc/g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g5Adb9Gy6+sS3xUyVZ/JjpVIyB/4GC84pl6RXUd5KMLYmTSMnY3MtAAGf0SQNA6AlhQWb75rsbDuNm1X4ICfJigCoECrvYvhjCB3egGgrGmdgWdgz0Fcftk/lPlyAbPYoMLg6kKWRgXYvQj7aiXsOUx1tKTTWwhKfZIdq9hnsnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4/VEOm3; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4/VEOm3"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35ef6b49813so2658628eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792342823; x=1792947623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6FM1MA66tNAmn5lRFJ2nA1E4CaxhhsRh1DU3FWW8nEE=;
        b=J4/VEOm3IMXQF8BRGqLxkeKy+gSNESuUiSbLJCzdd3LLFr1gOXz0Rl5zxETnz4WxUG
         dsWsJm1iYs5Suxy0zGOZML8eu7fO+HB9bd9d5soL64Nq3TMUPlK0qM5SjWYf7PHp/Doy
         cb1+OgTpBCdACpGNlwg3TpNnvTrNQM73YFB7NPpeY5q27z2KYtHCAlltwmusDou9NcyV
         REiJZCNAafmGM9eS6s02y8cJkfmTo06cEQ2IXL+MQmUawHNNd46bJ1hIaWIOpeIWyPGH
         R6mm5N+vVA5YR2ydPA4YDAwnfFhLHgV9k5HWVAJR1Z1+DAddJQsHHCMou7Cge/B8uqN4
         y+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792342823; x=1792947623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6FM1MA66tNAmn5lRFJ2nA1E4CaxhhsRh1DU3FWW8nEE=;
        b=vgU8cBbJU58IUa7gbYsQF47TLXYwmMbqGlJa0/Pjydv4EeSy8g/9AoDh8Rc3WvGk0g
         PDFdpcGqNzCSTf92lwlfX9K2epPf9xqFSsnUy42rsciHjBvHFPap/LqYA8kMlR/9BApy
         0cTsZ+Q9F6PAS78yxAdar4puRyXGztdikrRMusnJ6z77FFi/WMR3VkT7dDnRaMKFFscp
         XcdzZvKkATfVYJy+Do3QfP3VI/730nn2Uord8XKe2gE7QU5GzxAY488FY/hlirhPn/VN
         4UcNonTxA6gkCQl6KfCAfamM0ZT+Zi9dBUYWxpjCdxgCeoNtktPNSXodLH/Jwj6nJ9Q7
         ybNA==
X-Forwarded-Encrypted: i=1; AKwUvBxWIXTLoqhuyfwrQRUfrVT/l5+jLfL+CNRCz598izcUj1bX0fegvAGu38f3HxRd62KFKeY+i0qlETp+D8E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJl8Mkao10i+yfWNSSnafbI9dApWsx2L3CIGO0tXIE27jUAarXj
	/qduhxY7pKk9qoyXRnjw3RcLqLVyG3mtnSsosComIXxUhUuc6HgOQfQTdUQ0kFTzHQ==
X-Gm-Gg: AYBFou0BpYi66gpHEzg58WgFJQO+cYK/Q6reQpNvTiyHY54O7d6gyfm1YTOb0F/pvdy
	Du+/Nw27wLAp0F9eE8DjG8LWWnmw3Q3nQ1230l+fdwaOsdVhZga3Q0VRs/JgkcU49gb0Fusge3S
	7S5eSZIyRBaoluIB9G8fUzaiIk+jB5+tihFLYH0BRX/c4MeOB1EZMip1O5mJiJYWmLwajy3+z2R
	9L4k0B+kLGUIkFURFX1vvHVi/PoAVTtaIx2O9/6c4Cc/kPpgC5Fg/JlxFqY8lbONi6fwCkE1Z46
	qHjnhmlAUzdsAZ6LJO8ghtNSZzJ3Drt825rMteGfD74aT55m7XNc23Y7XbKC5me6XfjHwhgb5hg
	cVRALldpRl6D7Lban2s7u9H1OxWonMkLjSpcdd/g7oDXBjbpVWV5YslGE3NxJ/0LIMj5Nk+ZLGl
	L/Iwpj6Jbi4i62M7zdt0sAZ2BXdjQByecP1culWYLcUGAKWLOZ+rIOzACrW94qTPpLH4AiNo0AZ
	XjFM2Xq9PgpDKRGKxHI3rXGqrAsrm4VF+Z6ZldkJkcdpSXr
X-Received: by 2002:a05:7301:1888:b0:351:595f:a941 with SMTP id 5a478bee46e88-361a166778fmr6962607eec.8.1792342822362;
        Sun, 18 Oct 2026 10:00:22 -0700 (PDT)
Received: from localhost.localdomain ([101.0.63.175])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36083283478sm24222297eec.29.2026.10.18.10.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:00:21 -0700 (PDT)
From: Nikhil Gautam <nikhilgtr@gmail.com>
To: linux-iio@vger.kernel.org
Cc: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-kernel@vger.kernel.org,
	Nikhil Gautam <nikhilgtr@gmail.com>
Subject: [PATCH] iio: chemical: ccs811: Make sampling frequency configurable
Date: Sun, 18 Oct 2026 22:30:13 +0530
Message-Id: <20261018170013.79443-1-nikhilgtr@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow userspace to configure the CCS811 IAQ measurement rate through
the IIO sampling_frequency attribute.

Support the three IAQ measurement modes with sampling frequencies of
1 Hz, 0.1 Hz, and approximately 0.016667 Hz, corresponding to
measurement intervals of 1, 10, and 60 seconds.

Preserve unrelated bits in the MEAS_MODE register when updating the
drive mode, and cache the selected mode after a successful register
write. Expose the supported frequencies through
sampling_frequency_available.

Signed-off-by: Nikhil Gautam <nikhilgtr@gmail.com>
---
 drivers/iio/chemical/ccs811.c | 139 +++++++++++++++++++++++++++++++---
 1 file changed, 130 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/chemical/ccs811.c b/drivers/iio/chemical/ccs811.c
index d126ee12ffe5..4d157f3f5714 100644
--- a/drivers/iio/chemical/ccs811.c
+++ b/drivers/iio/chemical/ccs811.c
@@ -9,10 +9,9 @@
  * IIO driver for AMS CCS811 (I2C address 0x5A/0x5B set by ADDR Low/High)
  *
  * TODO:
- * 1. Make the drive mode selectable form userspace
- * 2. Add support for interrupts
- * 3. Adjust time to wait for data to be ready based on selected operation mode
- * 4. Read error register and put the information in logs
+ * 1. Add support for interrupts
+ * 2. Adjust time to wait for data to be ready based on selected operation mode
+ * 3. Read error register and put the information in logs
  */
 
 #include <linux/cleanup.h>
@@ -54,6 +53,7 @@
 #define CCS811_STATUS_FW_MODE_APPLICATION	BIT(7)
 
 /* Measurement modes */
+#define CCS811_MODE_MASK	GENMASK(6, 4)
 #define CCS811_MODE_IDLE	0x00
 #define CCS811_MODE_IAQ_1SEC	0x10
 #define CCS811_MODE_IAQ_10SEC	0x20
@@ -79,6 +79,7 @@ struct ccs811_data {
 	struct iio_trigger *drdy_trig;
 	struct gpio_desc *wakeup_gpio;
 	bool drdy_trig_on;
+	u8 drive_mode;
 	/* Ensures correct alignment of timestamp if present */
 	struct {
 		s16 channels[2];
@@ -86,6 +87,12 @@ struct ccs811_data {
 	} scan;
 };
 
+static const int ccs811_samp_freq[] = {
+	1, 0,
+	0, 100000,
+	0, 16667,
+};
+
 static const struct iio_chan_spec ccs811_channels[] = {
 	{
 		.type = IIO_CURRENT,
@@ -103,6 +110,8 @@ static const struct iio_chan_spec ccs811_channels[] = {
 		.modified = 1,
 		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
 				      BIT(IIO_CHAN_INFO_SCALE),
+		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SAMP_FREQ),
+		.info_mask_shared_by_type_available = BIT(IIO_CHAN_INFO_SAMP_FREQ),
 		.scan_index = 0,
 		.scan_type = {
 			.sign = 'u',
@@ -163,16 +172,21 @@ static int ccs811_start_sensor_application(struct i2c_client *client)
 	return 0;
 }
 
-static int ccs811_setup(struct i2c_client *client)
+static int ccs811_setup(struct ccs811_data *data)
 {
 	int ret;
 
-	ret = ccs811_start_sensor_application(client);
+	ret = ccs811_start_sensor_application(data->client);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_write_byte_data(data->client, CCS811_MEAS_MODE,
+					CCS811_MODE_IAQ_1SEC);
 	if (ret < 0)
 		return ret;
 
-	return i2c_smbus_write_byte_data(client, CCS811_MEAS_MODE,
-					 CCS811_MODE_IAQ_1SEC);
+	data->drive_mode = CCS811_MODE_IAQ_1SEC;
+	return 0;
 }
 
 static void ccs811_set_wakeup(struct ccs811_data *data, bool enable)
@@ -188,6 +202,44 @@ static void ccs811_set_wakeup(struct ccs811_data *data, bool enable)
 		usleep_range(20, 30);
 }
 
+static int ccs811_set_sampling_freq(struct ccs811_data *data,
+				    int val, int val2)
+{
+	u8 drive_mode;
+	int ret;
+
+	if (val == 1 && val2 == 0)
+		drive_mode = CCS811_MODE_IAQ_1SEC;
+	else if (val == 0 && val2 == 100000)
+		drive_mode = CCS811_MODE_IAQ_10SEC;
+	else if (val == 0 && val2 == 16667)
+		drive_mode = CCS811_MODE_IAQ_60SEC;
+	else
+		return -EINVAL;
+
+	guard(mutex)(&data->lock);
+	ccs811_set_wakeup(data, true);
+
+	ret = i2c_smbus_read_byte_data(data->client, CCS811_MEAS_MODE);
+	if (ret < 0)
+		goto out;
+
+	ret &= ~CCS811_MODE_MASK;
+	ret |= drive_mode;
+
+	ret = i2c_smbus_write_byte_data(data->client,
+					CCS811_MEAS_MODE, ret);
+	if (ret < 0)
+		goto out;
+
+	data->drive_mode = drive_mode;
+	ret = 0;
+
+out:
+	ccs811_set_wakeup(data, false);
+	return ret;
+}
+
 static int ccs811_get_measurement(struct ccs811_data *data)
 {
 	int ret, tries = 11;
@@ -249,6 +301,28 @@ static int ccs811_read_info_raw(struct ccs811_data *data,
 	}
 }
 
+static int ccs811_write_raw(struct iio_dev *indio_dev,
+			    struct iio_chan_spec const *chan,
+			    int val, int val2, long mask)
+{
+	struct ccs811_data *data = iio_priv(indio_dev);
+	int ret;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_SAMP_FREQ:
+		if (!iio_device_claim_direct(indio_dev))
+			return -EBUSY;
+
+		ret = ccs811_set_sampling_freq(data, val, val2);
+
+		iio_device_release_direct(indio_dev);
+		return ret;
+
+	default:
+		return -EINVAL;
+	}
+}
+
 static int ccs811_read_raw(struct iio_dev *indio_dev,
 			   struct iio_chan_spec const *chan,
 			   int *val, int *val2, long mask)
@@ -293,13 +367,60 @@ static int ccs811_read_raw(struct iio_dev *indio_dev,
 		default:
 			return -EINVAL;
 		}
+	case IIO_CHAN_INFO_SAMP_FREQ:
+		guard(mutex)(&data->lock);
+		switch (data->drive_mode) {
+		case CCS811_MODE_IAQ_1SEC:
+			*val = 1;
+			*val2 = 0;
+			return IIO_VAL_INT_PLUS_MICRO;
+		case CCS811_MODE_IAQ_10SEC:
+			*val = 0;
+			*val2 = 100000;
+			return IIO_VAL_INT_PLUS_MICRO;
+		case CCS811_MODE_IAQ_60SEC:
+			*val = 0;
+			*val2 = 16667;
+			return IIO_VAL_INT_PLUS_MICRO;
+		default:
+			return -EINVAL;
+		}
+
 	default:
 		return -EINVAL;
 	}
 }
 
+static int ccs811_read_avail(struct iio_dev *indio_dev,
+			     struct iio_chan_spec const *chan,
+			     const int **vals, int *type, int *length,
+			     long mask)
+{
+	if (mask != IIO_CHAN_INFO_SAMP_FREQ)
+		return -EINVAL;
+
+	*vals = ccs811_samp_freq;
+	*type = IIO_VAL_INT_PLUS_MICRO;
+	*length = ARRAY_SIZE(ccs811_samp_freq);
+
+	return IIO_AVAIL_LIST;
+}
+
+static int ccs811_write_raw_get_fmt(struct iio_dev *indio_dev,
+				    struct iio_chan_spec const *chan,
+				    long mask)
+{
+	if (mask == IIO_CHAN_INFO_SAMP_FREQ)
+		return IIO_VAL_INT_PLUS_MICRO;
+
+	return -EINVAL;
+}
+
 static const struct iio_info ccs811_info = {
 	.read_raw = ccs811_read_raw,
+	.write_raw = ccs811_write_raw,
+	.read_avail = ccs811_read_avail,
+	.write_raw_get_fmt = ccs811_write_raw_get_fmt,
 };
 
 static int ccs811_set_trigger_state(struct iio_trigger *trig,
@@ -460,7 +581,7 @@ static int ccs811_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	ret = ccs811_setup(client);
+	ret = ccs811_setup(data);
 	if (ret < 0) {
 		ccs811_set_wakeup(data, false);
 		return ret;
-- 
2.39.5

