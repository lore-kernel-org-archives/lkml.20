Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645521;
	b=OGlVexfMW+m+qWUi07+kTip6sHcHREMDl32uL5c6wMlBaGjyw2ukOeApWxPlk4I1MW8u
	 N3t+tnnv71EvDlqAiNWN0qt07T9dDevC5bvdjiNfre5x6TlXeBOPQwdoB0eT5/yYkBVzT
	 QKf0W3mFt2GmafDPNvP4QrCZypQv7JtkEYF3wEQiRYJocN/EltDvQMfNOVp8nOSbkWHt0
	 y0qams0kzn5kXXuCaHt2VXgbTfcFgEK07M5XaABrVHWVaJpHyzTsHae6uvGHuDZ++Bcm9
	 IKzBitKfqdbdQ/E/MkzKZZoxZuh5Mtxn0Hgk1zUtbrDlfuwZgtU6JTR+YAwaK7Zn4KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zyE4xCX9HvJllaMLP70tzPUjIbcqX6HcRdSreMx+zOM=;
	b=AlnV5g8BzR/rUnF3U64qsLGXKvcrRfaGwB/k2JYNOTIGwepbgc5NysEncStYNl7xVjhW
	 ipzBlE8WpihedoWNNlHpjZlBIoKwPYkvWBgd2HzX5wQUhbX5Kx1XceTXmvlZBJGZzh7f4
	 3jdJTobAeAxpB9gWJN+kRNJaO1p8ASHy0/+RnEyVIdyEkX6/IuZDDhSwq+NLTZqu51qab
	 Y3ZoMggojtNPgR/mgv00RbqiZZAhxkSgX4S8uUWmLR+srHIpg0TlKa5eIPZMc3MQaboph
	 /Vz4yUT8rdJwpt98GLdoMnfTJSXj/oaSbkoHb5+0LJqgs4HiPlxcFbBs71w1VB+EcMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xs2r+u5U;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AB5606A8A7
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3AB5606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xs2r+u5U
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso2640083e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794645519; x=1795250319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zyE4xCX9HvJllaMLP70tzPUjIbcqX6HcRdSreMx+zOM=;
        b=xs2r+u5UFm4f0R0hG33a5Ewlpc5U6An1amF5QFJsRAHXXBtUXbeM2UuLS9v0I+DaDL
         TfbMj3nonsnMHMps6NCvhAxuUCdZbDpQahRjwjpgIRG+J+Qf0GPMUqWoSKVucUvOXSgc
         gTgoAwsLCNXiuykx+Pfswb/Fqf++l2SPXLCpNFJ7FMVeM0zBBZOz7fDB2w/quY3E52SD
         UxvZlWOibnfriRip5Q/2ItB9afgqt3r3I/s2bt5YSsySrnDBx/FAbSsvs4eEEU0wbv4g
         ydiMmtnncHAALvI2ImZSEJevPEGGaIeYKmCd9JpuPo0Sg/R+1umH3bCwkxj8wLguoErK
         HDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794645519; x=1795250319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zyE4xCX9HvJllaMLP70tzPUjIbcqX6HcRdSreMx+zOM=;
        b=C3Nsh1NCSijbCl43W84DUbxJScEgSPpDxkWluBz3RT+j9EXZmhRFI2VQE/A6+0ZwRm
         qwcjnr1Glwvpn8J7aIAVOaprDFxdoYlvptwM4wr/7BzTpFN9UJ216XEHZ/8xw/KaFkO4
         IDwpSnqE6j6BkICciMZqiNGF+nTBTfv6rVJIRvZBCi8g9JTK+UHOXUlA14dTrscpqV5d
         EX7qoaCSCtXKmUkbKqDNMAzHkW0FEk/k6s60aA/iXYvj++BXZ29z/XPi5kIqip7Sf/Mt
         uqEUowFoNaQPFYHvKGB1JMMCsv6tRrveSy+hyCmSb0sEuAARDfLbedL/sM8Hvvw8vhP+
         NXGg==
X-Forwarded-Encrypted: i=1; AL+hErGVjqrDJf6EUFJPb3i5BXp0CBTnedz/UtvVPzkQuor/gxP2vMsIaSPMOa4qjelP52M4Yl5WNBwX9KGmPlA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xqc/yAhFa65GzW39B5b2F82klPisymfu7WKhl5YcHtpNivpUo
	gK6fhjq1ijBS2y0H5DE34Ae1FF0VkmKxLZ6wLNCkZLmHxmQV1jLsj6AG
X-Gm-Gg: AYBFou0LOCBK+rRoQeGzjVTjthX+Wai/d3IzABlrxBMO0N1JbdwJ5eg24hhGRo7C3gJ
	33wxFYtmk2x/B37DyP2rZmtAoKbomo8sk2UGynh0D3M8KvbufAY5V4aXi9im3KkZpew7Sk7LwIG
	6Am6F+f67n0fkvosYskudVfr+hw5oDmpJd34S2/KxKEfv+H0Sd0Nl7tpix1RCiVQDEVsGYJyosJ
	g9d01b7IMn+2k5+ZYoQVMErYHXuhe+9UIQ6G+pHvBmX+CoffmyYEeMgqhMokywPKYNbNqha/G8A
	DQiaIjdUeminLU4Q0bMgHCOpVGZuu+Gup+pRStSa3QD4nqO1BVOnam1MIU9LdW9W6thXWrvYjog
	N7OT/QdnLRoRz9nqX7vr2CuSLGb4cmUqYSFl9Non6jd7ezL8JhmlCQpS4XiBxVcffBvnlM4S0n8
	5Vxa6Qr7P5U+d3L2gRZtxe9PzMEZBMWRt5OpLrrKqtrVoYl8RS9CWnLGnUlX/2d1KWTrDVNIuoN
	zfHbnqNexCxpySFEZVgA0gyHnkr04d8tIT5LmV/tLGKUvE19BMGmTqDCNiMFu3R1WR4Ca3d8h/Y
	3Vs5L0WAeI32La6+O7rgI5jCQ2L+nd/RScK3f2wBCajjmUYqNEwlD9cfegugmwHGh2i/UPWytdx
	OUnoD0R2yYvHfjXPZihc8oURCy3ZfhekoTjaBrBemA7BBymjEATnvca+WEOs=
X-Received: by 2002:ac2:4bc5:0:b0:5c1:4c12:8b7d with SMTP id 2adb3069b0e04-5c1707952d1mr2087344e87.29.1794645518560;
        Sat, 14 Nov 2026 00:38:38 -0800 (PST)
Received: from yantra.. (nekmmqusxj170dz200l-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:b551:8edb:536d:8395])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1713565a6sm1527803e87.78.2026.11.14.00.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:38:37 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: [PATCH v2 2/2] iio: pressure: dps310: add a data-ready trigger
Date: Sat, 14 Nov 2026 10:38:28 +0200
Message-ID: <20261114083828.18059-3-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114083828.18059-1-zoone.rupert@gmail.com>
References: <20261114083828.18059-1-zoone.rupert@gmail.com>
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

With an interrupt wired to SDO, the chip can signal each new result.
Expose it as a trigger, so captures follow the measurements and scans
carry the time the result was ready, not when the handler ran.

The trigger fires on new pressure results, or on new temperature
results when pressure is not in the scan. As that depends on the scan,
only this device can use it. Polarity follows the interrupt type.
Status latches while the interrupt is disabled, so it is cleared before
enabling. The trigger is not the default, so FIFO mode without a
trigger is unchanged.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
v2:
- interrupt on temperature results when pressure is not in the scan
- limit the trigger to this device
- local regmap pointer in set_state and probe (Andy)

Cc: Paulius Zaleckas <paulius.zaleckas@gmail.com>

 drivers/iio/pressure/dps310.c | 139 +++++++++++++++++++++++++++++++++-
 1 file changed, 135 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 5cee23986f30..4bff9e93ea92 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -17,6 +17,8 @@
 #include <linux/cleanup.h>
 #include <linux/devm-helpers.h>
 #include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
 #include <linux/limits.h>
 #include <linux/math64.h>
 #include <linux/module.h>
@@ -31,6 +33,7 @@
 #include <linux/iio/buffer.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
+#include <linux/iio/trigger.h>
 #include <linux/iio/trigger_consumer.h>
 #include <linux/iio/triggered_buffer.h>
 
@@ -62,10 +65,15 @@
 #define  DPS310_COEF_RDY	BIT(7)
 #define DPS310_CFG_REG		0x09
 #define  DPS310_INT_HL		BIT(7)
+#define  DPS310_INT_TMP		BIT(5)
+#define  DPS310_INT_PRS		BIT(4)
 #define  DPS310_TMP_SHIFT_EN	BIT(3)
 #define  DPS310_PRS_SHIFT_EN	BIT(2)
 #define  DPS310_FIFO_EN		BIT(1)
 #define  DPS310_SPI_EN		BIT(0)
+#define DPS310_INT_STS		0x0a
+#define  DPS310_INT_STS_TMP	BIT(1)
+#define  DPS310_INT_STS_PRS	BIT(0)
 #define DPS310_RESET		0x0c
 #define  DPS310_FIFO_FLUSH	BIT(7)
 #define  DPS310_RESET_MAGIC	0x09
@@ -144,6 +152,9 @@ struct dps310_data {
 	bool timeout_recovery_failed;
 	bool fifo_temp_valid;
 
+	struct iio_trigger *trig;
+	s64 irq_timestamp;
+
 	/* Used only while the FIFO is enabled */
 	struct iio_dev *iio;
 	struct delayed_work fifo_work;
@@ -706,6 +717,7 @@ static bool dps310_is_volatile_reg(struct device *dev, unsigned int reg)
 	case DPS310_TMP_B1:
 	case DPS310_TMP_B2:
 	case DPS310_MEAS_CFG:
+	case DPS310_INT_STS:
 	case 0x32:	/* No documentation available on this register */
 		return true;
 	default:
@@ -713,6 +725,12 @@ static bool dps310_is_volatile_reg(struct device *dev, unsigned int reg)
 	}
 }
 
+/* Cleared on read */
+static bool dps310_is_precious_reg(struct device *dev, unsigned int reg)
+{
+	return reg == DPS310_INT_STS;
+}
+
 static int dps310_write_raw(struct iio_dev *iio,
 			    struct iio_chan_spec const *chan, int val,
 			    int val2, long mask)
@@ -1048,7 +1066,7 @@ static int dps310_fifo_set_enable(struct dps310_data *data, bool enable)
 				  enable);
 }
 
-/* No interrupt pin is wired in tree, so drain on a timer */
+/* The FIFO only interrupts when full and then stops, so drain on a timer */
 static unsigned int dps310_fifo_interval(struct dps310_data *data,
 					 int prs_rate, int tmp_rate)
 {
@@ -1375,6 +1393,7 @@ static irqreturn_t dps310_trigger_handler(int irq, void *p)
 		s32 channels[2];
 		aligned_s64 timestamp;
 	} scan = { };
+	s64 timestamp;
 	int rc;
 
 	mutex_lock(&data->lock);
@@ -1383,7 +1402,12 @@ static irqreturn_t dps310_trigger_handler(int irq, void *p)
 	if (rc)
 		goto err;
 
-	iio_push_to_buffers_with_ts(iio, &scan, sizeof(scan), iio_get_time_ns(iio));
+	if (iio_trigger_using_own(iio))
+		timestamp = data->irq_timestamp;
+	else
+		timestamp = iio_get_time_ns(iio);
+
+	iio_push_to_buffers_with_ts(iio, &scan, sizeof(scan), timestamp);
 
 err:
 	iio_trigger_notify_done(iio->trig);
@@ -1391,6 +1415,105 @@ static irqreturn_t dps310_trigger_handler(int irq, void *p)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t dps310_irq_handler(int irq, void *private)
+{
+	struct dps310_data *data = private;
+
+	data->irq_timestamp = iio_get_time_ns(data->iio);
+
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t dps310_irq_thread(int irq, void *private)
+{
+	struct dps310_data *data = private;
+	unsigned int status;
+
+	if (regmap_read(data->regmap, DPS310_INT_STS, &status))
+		return IRQ_NONE;
+
+	if (!(status & (DPS310_INT_STS_TMP | DPS310_INT_STS_PRS)))
+		return IRQ_NONE;
+
+	iio_trigger_poll_nested(data->trig);
+
+	return IRQ_HANDLED;
+}
+
+static int dps310_trigger_set_state(struct iio_trigger *trig, bool state)
+{
+	struct dps310_data *data = iio_trigger_get_drvdata(trig);
+	struct regmap *map = data->regmap;
+	unsigned int status, bits = 0;
+	int rc;
+
+	guard(mutex)(&data->lock);
+
+	if (state) {
+		/* Status latched while disabled would fire a stale interrupt */
+		rc = regmap_read(map, DPS310_INT_STS, &status);
+		if (rc)
+			return rc;
+
+		/* Without pressure, scans follow the temperature results */
+		if (test_bit(DPS310_SCAN_PRESSURE, data->iio->active_scan_mask))
+			bits = DPS310_INT_PRS;
+		else
+			bits = DPS310_INT_TMP;
+	}
+
+	return regmap_update_bits(map, DPS310_CFG_REG,
+				  DPS310_INT_TMP | DPS310_INT_PRS, bits);
+}
+
+static const struct iio_trigger_ops dps310_trigger_ops = {
+	.set_trigger_state = dps310_trigger_set_state,
+	.validate_device = iio_trigger_validate_own_device,
+};
+
+static int dps310_trigger_probe(struct dps310_data *data)
+{
+	struct device *dev = &data->client->dev;
+	struct regmap *map = data->regmap;
+	struct iio_dev *iio = data->iio;
+	int irq = data->client->irq;
+	bool active_high;
+	int rc;
+
+	switch (irq_get_trigger_type(irq)) {
+	case IRQ_TYPE_LEVEL_HIGH:
+	case IRQ_TYPE_EDGE_RISING:
+		active_high = true;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+	case IRQ_TYPE_EDGE_FALLING:
+		active_high = false;
+		break;
+	default:
+		return dev_err_probe(dev, -EINVAL, "Unsupported interrupt type\n");
+	}
+
+	rc = regmap_assign_bits(map, DPS310_CFG_REG, DPS310_INT_HL, active_high);
+	if (rc)
+		return rc;
+
+	data->trig = devm_iio_trigger_alloc(dev, "%s-dev%d", iio->name,
+					    iio_device_id(iio));
+	if (!data->trig)
+		return -ENOMEM;
+
+	data->trig->ops = &dps310_trigger_ops;
+	iio_trigger_set_drvdata(data->trig, data);
+
+	rc = devm_request_threaded_irq(dev, irq, dps310_irq_handler,
+				       dps310_irq_thread, IRQF_ONESHOT,
+				       iio->name, data);
+	if (rc)
+		return rc;
+
+	return devm_iio_trigger_register(dev, data->trig);
+}
+
 static void dps310_standby(void *action_data)
 {
 	struct dps310_data *data = action_data;
@@ -1404,6 +1527,7 @@ static const struct regmap_config dps310_regmap_config = {
 	.val_bits = 8,
 	.writeable_reg = dps310_is_writeable_reg,
 	.volatile_reg = dps310_is_volatile_reg,
+	.precious_reg = dps310_is_precious_reg,
 	.cache_type = REGCACHE_RBTREE,
 	.max_register = 0x62, /* No documentation available on this register */
 };
@@ -1470,8 +1594,9 @@ static int dps310_probe(struct i2c_client *client)
 	/*
 	 * The device measures continuously in background mode, so a triggered
 	 * capture is just a read of the latest results. The setup ops run the
-	 * FIFO drain when no trigger is attached. The trigger is not aligned
-	 * with the measurements, so the timestamp is taken in the handler.
+	 * FIFO drain when no trigger is attached. Only the data-ready trigger
+	 * is aligned with the measurements, so for others the timestamp is
+	 * taken in the handler.
 	 */
 	rc = devm_iio_triggered_buffer_setup(dev, iio, NULL,
 					     dps310_trigger_handler,
@@ -1484,6 +1609,12 @@ static int dps310_probe(struct i2c_client *client)
 	if (rc)
 		return rc;
 
+	if (client->irq > 0) {
+		rc = dps310_trigger_probe(data);
+		if (rc)
+			return rc;
+	}
+
 	rc = devm_iio_device_register(dev, iio);
 	if (rc)
 		return rc;
-- 
2.43.0

