Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956814;
	b=mk3W37K5rSTDl6NVYatBJmBq9s+cW5mUpf9FHs1c7wCZEWRfEmha0QN/Ft9HUu4aOeOB
	 hQWHlmRDiDTpuxrjR/wVE5q1IkYbh+15CagNJC9YDBL51TtDZxz2mXWWOGBsUcVHFaeYH
	 8mv2ShIFkOIlNgShmCYNDZTWRMLLEiQDrTVRT4xdRnGAjSfYKA/J0tzDW5PZcZZNjHZ1r
	 41Y/eXtgTJDxRAKR9y20dkPufg/DBO0vj6b+vek7GspPXUixYOwBmZPUWTMfm2i5td2o2
	 7YfuE4x3Yw4DrOW2gL1mU0QNIfZsZ4YzKnKXvSQOQZegdikDmRDbzToNs+LfSGUrxEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p9yngXRQlhdY0K3IAiQSprScx4advF1zvS5JKRcEVLE=;
	b=eTIBwxI83Jzumye2gt9TN6Io6+jWvky6weMDBzOmrjVhCVkNWqtxCRUYggi1fXtzrmD5
	 HQE6QJxdlPNdiyJwhBfIkwBYbHx29cqKIGH/ubUfmQs3pX6j4ThxdS35A8wlrCkw8229t
	 s7V/I/s+577X3AU+QyPBXtUseAZXewAI5C59ewtaZuPt2HLGCE830EIOEPbdaalmCQ9/U
	 GOIZ+prl4Sm5csrmK2H0r0VGrwZLsB7dK6XzN9aDx5mJBGr9bDGsXheo1Kcx8+5EjBcBO
	 FGw4+cjBsY+upGlRQjP1n0Qt6JwHU2tQR7xqEMQwkt3P55W6bA0MZrRmdN1MQRQn7kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W0wmRzvc;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DDD606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7DDD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W0wmRzvc
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso3033435e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793956812; x=1794561612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p9yngXRQlhdY0K3IAiQSprScx4advF1zvS5JKRcEVLE=;
        b=W0wmRzvc2u9ak/YWdAwi7ePbK/k/Z5ld27hzZcZ+69z+95DeEos7Gc5qbdixNAUSGr
         /guFC4QyITO1kI2K7uMrhE2cd2P82VoCri+8gkEdDm0taJFeewmC/tYT/p0k8kLK+++z
         0TljBCVhqNogjFK+7V2Nk3tY53RP5DanN0NNc3u6a+JUy3Oy83OlxtmoS4U4wtM2j+qk
         lTgsrq5JtnJSg8PYEso3ZxL5V5LSbBS2mLAVIdxnsvcoD9lwlZ9Jz3r/aZ2yEzOhhJ6f
         zQ/0b93a3/5/LMTVbgthcWOCQUf3yEYah/K40NXuq3VBFLQeX4VZBlnK9o+Vcq/6tFsL
         AryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956812; x=1794561612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p9yngXRQlhdY0K3IAiQSprScx4advF1zvS5JKRcEVLE=;
        b=BjeQ8LaRfrWsUNXMGdNh16J0xBihY1T7pH9SvHx2RpdVQWcbfJ09VV0sgooERWt779
         I9b2MR+7D98/qRyMtQ6KwJ307vj1RSJX+VvbETlv7Mbx7zirUhwHYrHCW0aBwUIhAtLF
         yeH49VK2vbVJSwwLaIcy9CEMDb6ny4/7KTMrOacZ06YsNprxjcms/xXRxtiQXQkzciyV
         ebwWSV6m2cZWilZJiMqBSYeOeX6BSt4Ls3RSmtFBb6K57XP7inctl5s3M/P/UVAqMf2S
         wCQVlGUEt6ILvI8n8SLIjW3vkDFaLPFS162X1DP23LsPZk5i3KmK/SviS+gZNBw0pGB0
         eVOA==
X-Forwarded-Encrypted: i=1; AKwUvBzA71EJHMkeECMstc8m6wywJrsVC/F1TMSOnCsTmwUuSFYPAqhbC2cTWQziQR8BZBIZHEPsVsCAbPq6ne4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xVcQAJ4boYk+dGeOn38qRxtbkwE5N/3prL2hKXfYb+s7cv/Dh
	Zu5u57D0rhK1PIGHF58Oq2LeJeFb5OKdSSuj77Qy8KxxWfZ9QmtA5LXG
X-Gm-Gg: AYBFou3tzRD1NFfAmmlQD3k8/4A37aBBYyOVcDHnxykhNr28mxhRp7LJjMFWKrQLEZw
	K5MaZJSFR3NceY07TcNWhxW/tjlihu+601RfV2cceuUfwd5cAbr6HE5W2s81xWkyPnBb73L9di6
	LvzU9bT2/Xtk8sREB8GqMKA88gDJVzzS0+1fZidmB2B3Bdz8vIxg3ccb49Jf7C76FiwG1UKWRho
	+jbm76RMV0PyrOJ+jkjAHHcQFSle90GQoJfZ+8B7+3pKgA3KY7K+CPgxP3/8gAeu2ukcbv169lo
	wYSwQJICb+ibHzd10K/Ql19JvV0JoZyN7luNFAH4Icm+eyLJpDzDNPj2T+b1FYpDswlajEkTxWo
	Ipsq2PV+tgJDGrzwhemey18FU5BdfNeL5xWLoS5N8319udyAh7xl4xrQW1mQqJpf4g/x0SewNkV
	JKGsYDdeyOSTEXBu8MG/j5Loq/OFAgH+Nolb0gAup6THlz0b8FzVUK7TxPikj+HMhZ3yCu54j3L
	y2ihqs1wE1U2qkm78wzKFnQ4wQVWONyXMKiI03xIfSdYh07ahGm65HTNL9ERRjOHGfJFj8Mjh7x
	rhxNwirGFwp6dPoBsu/eowgX+ltgoAYcH1IDCZ8+3QMAKApXWD1gDjsA/i40K0Z60eKgtUb4FjJ
	8AK5uD4qURg==
X-Received: by 2002:a05:600c:c085:b0:4a7:d9b1:b684 with SMTP id 5b1f17b1804b1-4b6e5ab7bdbmr22578535e9.2.1793956812200;
        Fri, 06 Nov 2026 01:20:12 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57203a98fsm108358935e9.4.2026.11.06.01.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:20:11 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Esben Haabendal <esben@geanix.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pan Chuang <panchuang@vivo.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Nikita Travkin <nikita@trvn.ru>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] iio: light: ltr501: Switch to read_avail() op from manual attribute registration
Date: Fri,  6 Nov 2026 11:19:40 +0200
Message-ID: <20261106091943.35783-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106091943.35783-1-clamor95@gmail.com>
References: <20261106091943.35783-1-clamor95@gmail.com>
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

Switch to the read_avail() operation from manual attribute group
registration. This eliminates the need for per-chip attribute_group
structures and related ltr501_chip_info iio_info entries.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/iio/light/ltr501.c | 153 +++++++++++++------------------------
 1 file changed, 52 insertions(+), 101 deletions(-)

diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
index 302be2fc314c5..cc5d7af44d77c 100644
--- a/drivers/iio/light/ltr501.c
+++ b/drivers/iio/light/ltr501.c
@@ -133,6 +133,22 @@ static const struct ltr501_gain ltr559_ps_gain_tbl[] = {
 	{0, 15624},
 };
 
+static const int int_time_avail[] = {
+	0, 50000,
+	0, 100000,
+	0, 200000,
+	0, 400000
+};
+
+static const int samp_freq_avail[] = {
+	20, 0,
+	10, 0,
+	5,  0,
+	2,  0,
+	1,  0,
+	0,  500000
+};
+
 struct ltr501_chip_info {
 	u8 partid;
 	const struct ltr501_gain *als_gain;
@@ -145,8 +161,6 @@ struct ltr501_chip_info {
 	bool no_irq_support;
 	struct iio_chan_spec const *channels;
 	const int no_channels;
-	const struct iio_info *info;
-	const struct iio_info *info_no_irq;
 };
 
 struct ltr501_data {
@@ -590,6 +604,7 @@ static const struct iio_event_spec ltr501_pxs_event_spec[] = {
 	.channel2 = (_mod), \
 	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW), \
 	.info_mask_shared_by_type = (_shared), \
+	.info_mask_shared_by_all_available = (_shared), \
 	.scan_index = (_idx), \
 	.scan_type = { \
 		.sign = 'u', \
@@ -1111,111 +1126,56 @@ static int ltr501_write_event_config(struct iio_dev *indio_dev,
 	return -EINVAL;
 }
 
-static ssize_t ltr501_show_proximity_scale_avail(struct device *dev,
-						 struct device_attribute *attr,
-						 char *buf)
+static int ltr501_read_avail(struct iio_dev *indio_dev,
+			     struct iio_chan_spec const *chan,
+			     const int **vals, int *type, int *length, long mask)
 {
-	struct ltr501_data *data = iio_priv(dev_to_iio_dev(dev));
+	struct ltr501_data *data = iio_priv(indio_dev);
 	const struct ltr501_chip_info *info = data->chip_info;
-	ssize_t len = 0;
-	int i;
-
-	for (i = 0; i < info->ps_gain_tbl_size; i++) {
-		if (info->ps_gain[i].scale == LTR501_RESERVED_GAIN)
-			continue;
-		len += scnprintf(buf + len, PAGE_SIZE - len, "%d.%06d ",
-				 info->ps_gain[i].scale,
-				 info->ps_gain[i].uscale);
-	}
 
-	buf[len - 1] = '\n';
+	switch (mask) {
+	case IIO_CHAN_INFO_SCALE:
+		if (chan->type == IIO_INTENSITY) {
+			*length = info->als_gain_tbl_size * 2;
+			*vals = (const int *)info->als_gain;
+		} else {
+			*length = info->ps_gain_tbl_size * 2;
+			*vals = (const int *)info->ps_gain;
+		}
+		*type = IIO_VAL_INT_PLUS_MICRO;
+		return IIO_AVAIL_LIST;
 
-	return len;
-}
+	case IIO_CHAN_INFO_INT_TIME:
+		*vals = int_time_avail;
+		*type = IIO_VAL_INT_PLUS_MICRO;
+		*length = ARRAY_SIZE(int_time_avail);
+		return IIO_AVAIL_LIST;
 
-static ssize_t ltr501_show_intensity_scale_avail(struct device *dev,
-						 struct device_attribute *attr,
-						 char *buf)
-{
-	struct ltr501_data *data = iio_priv(dev_to_iio_dev(dev));
-	const struct ltr501_chip_info *info = data->chip_info;
-	ssize_t len = 0;
-	int i;
+	case IIO_CHAN_INFO_SAMP_FREQ:
+		*vals = samp_freq_avail;
+		*type = IIO_VAL_INT_PLUS_MICRO;
+		*length = ARRAY_SIZE(samp_freq_avail);
+		return IIO_AVAIL_LIST;
 
-	for (i = 0; i < info->als_gain_tbl_size; i++) {
-		if (info->als_gain[i].scale == LTR501_RESERVED_GAIN)
-			continue;
-		len += scnprintf(buf + len, PAGE_SIZE - len, "%d.%06d ",
-				 info->als_gain[i].scale,
-				 info->als_gain[i].uscale);
+	default:
+		return -EINVAL;
 	}
-
-	buf[len - 1] = '\n';
-
-	return len;
 }
 
-static IIO_CONST_ATTR_INT_TIME_AVAIL("0.05 0.1 0.2 0.4");
-static IIO_CONST_ATTR_SAMP_FREQ_AVAIL("20 10 5 2 1 0.5");
-
-static IIO_DEVICE_ATTR(in_proximity_scale_available, S_IRUGO,
-		       ltr501_show_proximity_scale_avail, NULL, 0);
-static IIO_DEVICE_ATTR(in_intensity_scale_available, S_IRUGO,
-		       ltr501_show_intensity_scale_avail, NULL, 0);
-
-static struct attribute *ltr501_attributes[] = {
-	&iio_dev_attr_in_proximity_scale_available.dev_attr.attr,
-	&iio_dev_attr_in_intensity_scale_available.dev_attr.attr,
-	&iio_const_attr_integration_time_available.dev_attr.attr,
-	&iio_const_attr_sampling_frequency_available.dev_attr.attr,
-	NULL
-};
-
-static struct attribute *ltr301_attributes[] = {
-	&iio_dev_attr_in_intensity_scale_available.dev_attr.attr,
-	&iio_const_attr_integration_time_available.dev_attr.attr,
-	&iio_const_attr_sampling_frequency_available.dev_attr.attr,
-	NULL
-};
-
-static const struct attribute_group ltr501_attribute_group = {
-	.attrs = ltr501_attributes,
-};
-
-static const struct attribute_group ltr301_attribute_group = {
-	.attrs = ltr301_attributes,
-};
-
 static const struct iio_info ltr501_info_no_irq = {
 	.read_raw = ltr501_read_raw,
 	.write_raw = ltr501_write_raw,
-	.attrs = &ltr501_attribute_group,
+	.read_avail = ltr501_read_avail,
 };
 
 static const struct iio_info ltr501_info = {
 	.read_raw = ltr501_read_raw,
 	.write_raw = ltr501_write_raw,
-	.attrs = &ltr501_attribute_group,
-	.read_event_value	= &ltr501_read_event,
-	.write_event_value	= &ltr501_write_event,
-	.read_event_config	= &ltr501_read_event_config,
-	.write_event_config	= &ltr501_write_event_config,
-};
-
-static const struct iio_info ltr301_info_no_irq = {
-	.read_raw = ltr501_read_raw,
-	.write_raw = ltr501_write_raw,
-	.attrs = &ltr301_attribute_group,
-};
-
-static const struct iio_info ltr301_info = {
-	.read_raw = ltr501_read_raw,
-	.write_raw = ltr501_write_raw,
-	.attrs = &ltr301_attribute_group,
-	.read_event_value	= &ltr501_read_event,
-	.write_event_value	= &ltr501_write_event,
-	.read_event_config	= &ltr501_read_event_config,
-	.write_event_config	= &ltr501_write_event_config,
+	.read_avail = ltr501_read_avail,
+	.read_event_value = &ltr501_read_event,
+	.write_event_value = &ltr501_write_event,
+	.read_event_config = &ltr501_read_event_config,
+	.write_event_config = &ltr501_write_event_config,
 };
 
 static const struct ltr501_chip_info ltr501_chip_info_tbl[] = {
@@ -1226,8 +1186,6 @@ static const struct ltr501_chip_info ltr501_chip_info_tbl[] = {
 		.als_mode_active = BIT(0) | BIT(1),
 		.als_gain_mask = BIT(3),
 		.als_gain_shift = 3,
-		.info = &ltr301_info,
-		.info_no_irq = &ltr301_info_no_irq,
 		.channels = ltr301_channels,
 		.no_channels = ARRAY_SIZE(ltr301_channels),
 	},
@@ -1238,8 +1196,6 @@ static const struct ltr501_chip_info ltr501_chip_info_tbl[] = {
 		.als_mode_active = BIT(0),
 		.als_gain_mask = BIT(2) | BIT(3) | BIT(4),
 		.als_gain_shift = 2,
-		.info = &ltr301_info,
-		.info_no_irq = &ltr301_info_no_irq,
 		.channels = ltr301_channels,
 		.no_channels = ARRAY_SIZE(ltr301_channels),
 	},
@@ -1251,7 +1207,6 @@ static const struct ltr501_chip_info ltr501_chip_info_tbl[] = {
 		.als_gain_mask = BIT(2) | BIT(3) | BIT(4),
 		.als_gain_shift = 2,
 		.no_irq_support = true,
-		.info_no_irq = &ltr301_info_no_irq,
 		.channels = ltr301_channels,
 		.no_channels = ARRAY_SIZE(ltr301_channels),
 	},
@@ -1264,8 +1219,6 @@ static const struct ltr501_chip_info ltr501_chip_info_tbl[] = {
 		.als_mode_active = BIT(0) | BIT(1),
 		.als_gain_mask = BIT(3),
 		.als_gain_shift = 3,
-		.info = &ltr501_info,
-		.info_no_irq = &ltr501_info_no_irq,
 		.channels = ltr501_channels,
 		.no_channels = ARRAY_SIZE(ltr501_channels),
 	},
@@ -1278,8 +1231,6 @@ static const struct ltr501_chip_info ltr501_chip_info_tbl[] = {
 		.als_mode_active = BIT(0),
 		.als_gain_mask = BIT(2) | BIT(3) | BIT(4),
 		.als_gain_shift = 2,
-		.info = &ltr501_info,
-		.info_no_irq = &ltr501_info_no_irq,
 		.channels = ltr501_channels,
 		.no_channels = ARRAY_SIZE(ltr501_channels),
 	},
@@ -1548,7 +1499,7 @@ static int ltr501_probe(struct i2c_client *client)
 				     &data->near_level))
 		data->near_level = 0;
 
-	indio_dev->info = data->chip_info->info;
+	indio_dev->info = &ltr501_info;
 	indio_dev->channels = data->chip_info->channels;
 	indio_dev->num_channels = data->chip_info->no_channels;
 	indio_dev->name = name;
@@ -1573,7 +1524,7 @@ static int ltr501_probe(struct i2c_client *client)
 		if (ret)
 			goto powerdown_on_error;
 	} else {
-		indio_dev->info = data->chip_info->info_no_irq;
+		indio_dev->info = &ltr501_info_no_irq;
 	}
 
 	ret = iio_triggered_buffer_setup(indio_dev, NULL,
-- 
2.53.0

