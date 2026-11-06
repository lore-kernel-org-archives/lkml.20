Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956819;
	b=J9Jat7fSDVmrvc8l7WtIU/WTCYtaJ3A5AiCAI72zDRDkuOaYqZjOkI+PR9sxX+Jylj53
	 dvt8UB8F+qZ1SEaBf9OzfQq3GHh7AGBPSfxyT45qR1dlQ8Dj6C/nGxmmZcGzilFnwmAah
	 J0XeZ0cPanHBTP0wksk7boihLzfPeNfRw4NTxdPMbk8vVNKNfBz62lORfMLT7TU0Dl7r0
	 CiRB8DiIYbKguTG0RkJE3iZq1FeLa/bS0yFSdXW4jx55cHdTa/nVOKZZW6PNM3fUueCV7
	 I/OWztjSGGM5GLjaq15oyCYKy6SCa/0qGBNkrzLtjnVpLRa9fcbM2HxQV6O0+Hux5Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Lt2el+1PRelTWOtuHBgUwaDovv++emfSs0a0UkoSKek=;
	b=O9F122hYmRhMV2YJcH4VrIojwao0WIJR8lx4LVuOr+zgWqvzdxQ/3//HBofplFZoKZEL
	 M25CYnhACcBHJItshmSA4DdNNPerWjiYRPzb3OyCI27eAdrL7BJpRJsPS1EO5ZY+YGrii
	 ucjTRr+XgK2d2dI/JaOtzVYPiDo7KXcp7txfqF2e5RHCWyHxs2yNmCOyRu/T19ZT4jrtH
	 d4Z3S2KukA1Js9NLzRgXseodYp04Xx35s4VbEFouRaFJNnP3R1Inqqzp1Q9ZcFRsSvjRM
	 cD366MCswFa9ZC1uwo0lysmLy3V0B5MsiXEilW0/7aoY3V7hsSyeWmKmTGOP2BEe3fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vedrZJHa;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831DD6083600
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 831DD6083600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vedrZJHa
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso173451f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793956818; x=1794561618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lt2el+1PRelTWOtuHBgUwaDovv++emfSs0a0UkoSKek=;
        b=vedrZJHa0qrWP8SprQrms0Pn8x+9evx/RNxvdQ/AcgtklhE4TnEUWJjGT6xF3uyWIx
         8GoM7RJrENS9XKcVdPyp+QdYSJoUJg3a2dWIIQQ6tqZPR5H+bpP9c1kHJ9xPPW0xVJxN
         PoISUbdypypvUHECR/kkkynPyG21uxhrU5QouPtHymNd3BzYAxAr1yoHHhLrAmfQH79X
         jldgRFzLBO/2WcF4bieWviVxw2gqnJr4faMCnu4DVf3lHCOPojpTP6zqeiHvazSrgVEt
         tnW27f0Tte+tE56wancPWi3TAVbR+Uio19nMX2EPVLNPr4tLkqUPapj4IcnJhwnerhVq
         ZRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956818; x=1794561618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lt2el+1PRelTWOtuHBgUwaDovv++emfSs0a0UkoSKek=;
        b=Jn7GGQhb7MFSDa+79l6fUYtLRGTocZiSXGmKrC2p3KmRAqdvGL3IqM1O7MvlqxpcAZ
         y1mjAE/PhWA8tTr18L4dZrwWmXnHP2IHFdfSP5EE+waXSn0bbBrzf/ItWq1BQPyMkw2M
         tKH4khb478XkVS28XdxPR7lB8pwTuKwz/npUAMoCgz7BskJIrC7FSCEqyMtr88EDZGcs
         qUEThBKazRzPnoy8ggr1aGonUomBvBgRVUtbaOW5fdOvi6H6So8MvBTbsT6husaaDyv5
         M7+IUzQhLY2HLUGVK091H5RK8FSLRF8/ZjJEwNjzaDQ6iSl6JH/bwFcUUpS3GeLYcHAu
         0U1g==
X-Forwarded-Encrypted: i=1; AKwUvByEsLjTbD0Cjhi58O0AKh+qon4D0ebp282w7fJejx9xsE6R79gJ54b3ZPbvt6A42XshKXafyd7OGTsdL/U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Nq6mrZOZlEti1JFDnwnEP+WjjjyijTM5RLx7WzT2/A7hSX8bV
	V6122wUKWGX3Pk8uW049uqCRC8Zvu4tcTWoyjc0c8Dp7r/9qcexruRwG
X-Gm-Gg: AYBFou065kmyCtrkX3pWk6oVbmBT1QANj5dsw6eckmQ95XY13XrRCiZ+x48NiB51M/Y
	2fazkfxqUGOFUxq2qfegddqK94aiQ2BId1HrCGofGfBPm0u1eG6dxMK3yM1VEym6/rmWZm3Oc6k
	m4rk+dpZIB7m+P93B9MAd9RMxqU3Y6e3bBG5I2SCjoor7XL2C9TTwUny/ij12oj5r02agzY58Ss
	S+ZuAzUodp2L6w3O4Hfx823L8+DfhHhYfgt89vqWKvwixNbu8HSQs88xZ48WhdHQ15JFTZzHFXh
	QXfoL1JpU5CYJLs7gs4rBY9UsjpyQx95XFbTchlS9DNZ8pqrgDPnPNzdhcc058Jlr5bHNwE46CE
	+ky9h/o9ghDn30yKVmrKBdklI/ykQvu2vPw6S017gQx94z/lAiDnuBC9APd+XfaaHEpcpjUOOZz
	2S2Im031PvV11tB64e1ZuJOVqatthM78YpWB2aE1++Vapx98SMiefDrkhLbKhQlGIzh4QlUT/5D
	e95t+MNl0BkoAl0ElEx5kmzSElYOo8hYbWhwHRO6Qmk2tsxEkCYsFH+ipSlMGzRW6Wmjqk3Mu9T
	Zxh5GF3+CDR029v3nsvJ0pF5majoacZ5VOPmprxECAihqJC8tRFd8PzVsJHe1xTOjG/cJzAycrg
	sx2wjJ+SXSQ==
X-Received: by 2002:a05:600c:3ba0:b0:4a7:a5db:a93e with SMTP id 5b1f17b1804b1-4b6db1c5f48mr32230065e9.4.1793956817871;
        Fri, 06 Nov 2026 01:20:17 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57203a98fsm108358935e9.4.2026.11.06.01.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:20:17 -0800 (PST)
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
Subject: [PATCH v2 4/4] iio: light: ltr501: Add support for the LTR-659PS-01 proximity sensor
Date: Fri,  6 Nov 2026 11:19:43 +0200
Message-ID: <20261106091943.35783-5-clamor95@gmail.com>
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

Add support for the Lite-On LTR-659PS-01 proximity sensor. This device is
nearly identical to the LTR-559ALS-01, but omits all elements related to
ambient light sensing.

Add a no_als_support flag, similar to how no_irq_support is used, to
isolate ALS register access for the LTR-659PS-01, since ALS registers are
marked as reserved and interactions with them are discouraged.

The ltr501_trigger_handler relied on the scan index to identify channels.
This approach is fragile regarding channel status flags and can break if
the index is not strictly set. Switch to checking the channel type
instead.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/iio/light/ltr501.c | 73 +++++++++++++++++++++++++++++++-------
 1 file changed, 61 insertions(+), 12 deletions(-)

diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
index d5ce6468a229b..e7762115df913 100644
--- a/drivers/iio/light/ltr501.c
+++ b/drivers/iio/light/ltr501.c
@@ -151,6 +151,7 @@ struct ltr501_chip_info {
 	u8 als_gain_mask;
 	u8 als_gain_shift;
 	bool no_irq_support;
+	bool no_als_support;
 	struct iio_chan_spec const *channels;
 	const int no_channels;
 };
@@ -192,6 +193,11 @@ static bool ltr501_has_irq_support(const struct ltr501_chip_info *info)
 	return !info->no_irq_support;
 }
 
+static bool ltr501_has_als_support(const struct ltr501_chip_info *info)
+{
+	return !info->no_als_support;
+}
+
 static int ltr501_match_samp_freq(const struct ltr501_samp_table *tab,
 					   int len, int val, int val2)
 {
@@ -656,6 +662,29 @@ static const struct iio_chan_spec ltr301_channels[] = {
 	IIO_CHAN_SOFT_TIMESTAMP(2),
 };
 
+static const struct iio_chan_spec ltr659_channels[] = {
+	{
+		.type = IIO_PROXIMITY,
+		.address = LTR501_PS_DATA,
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
+				      BIT(IIO_CHAN_INFO_SCALE) |
+				      BIT(IIO_CHAN_INFO_SAMP_FREQ),
+		.info_mask_separate_available = BIT(IIO_CHAN_INFO_SCALE) |
+						BIT(IIO_CHAN_INFO_SAMP_FREQ),
+		.scan_index = 0,
+		.scan_type = {
+			.sign = 'u',
+			.realbits = 11,
+			.storagebits = 16,
+			.endianness = IIO_CPU,
+		},
+		.event_spec = ltr501_pxs_event_spec,
+		.num_event_specs = ARRAY_SIZE(ltr501_pxs_event_spec),
+		.ext_info = ltr501_ext_info,
+	},
+	IIO_CHAN_SOFT_TIMESTAMP(1),
+};
+
 static int ltr501_read_info_raw(struct ltr501_data *data,
 				struct iio_chan_spec const *chan,
 				int *val)
@@ -1230,13 +1259,24 @@ static const struct ltr501_chip_info ltr559_chip_info_tbl = {
 	.no_channels = ARRAY_SIZE(ltr501_channels),
 };
 
+static const struct ltr501_chip_info ltr659_chip_info_tbl = {
+	.partid = 0x09,
+	.ps_gain = ltr559_ps_gain_tbl,
+	.ps_gain_tbl_size = ARRAY_SIZE(ltr559_ps_gain_tbl),
+	.no_als_support = true,
+	.channels = ltr659_channels,
+	.no_channels = ARRAY_SIZE(ltr659_channels),
+};
+
 static int ltr501_write_contr(struct ltr501_data *data, u8 als_val, u8 ps_val)
 {
 	int ret;
 
-	ret = regmap_write(data->regmap, LTR501_ALS_CONTR, als_val);
-	if (ret < 0)
-		return ret;
+	if (ltr501_has_als_support(data->chip_info)) {
+		ret = regmap_write(data->regmap, LTR501_ALS_CONTR, als_val);
+		if (ret < 0)
+			return ret;
+	}
 
 	return regmap_write(data->regmap, LTR501_PS_CONTR, ps_val);
 }
@@ -1251,16 +1291,21 @@ static irqreturn_t ltr501_trigger_handler(int irq, void *p)
 		aligned_s64 ts;
 	} scan = { };
 	__le16 als_buf[2];
+	unsigned int i;
 	u8 mask = 0;
 	int j = 0;
 	int ret, psdata;
 
 	/* figure out which data needs to be ready */
-	if (test_bit(0, indio_dev->active_scan_mask) ||
-	    test_bit(1, indio_dev->active_scan_mask))
-		mask |= LTR501_STATUS_ALS_RDY;
-	if (test_bit(2, indio_dev->active_scan_mask))
-		mask |= LTR501_STATUS_PS_RDY;
+	for_each_set_bit(i, indio_dev->active_scan_mask, indio_dev->num_channels) {
+		const struct iio_chan_spec *chan = &indio_dev->channels[i];
+
+		if (chan->type == IIO_INTENSITY)
+			mask |= LTR501_STATUS_ALS_RDY;
+
+		if (chan->type == IIO_PROXIMITY)
+			mask |= LTR501_STATUS_PS_RDY;
+	}
 
 	ret = ltr501_drdy(data, mask);
 	if (ret < 0)
@@ -1328,11 +1373,13 @@ static int ltr501_init(struct ltr501_data *data)
 {
 	int ret, status;
 
-	ret = regmap_read(data->regmap, LTR501_ALS_CONTR, &status);
-	if (ret < 0)
-		return ret;
+	if (ltr501_has_als_support(data->chip_info)) {
+		ret = regmap_read(data->regmap, LTR501_ALS_CONTR, &status);
+		if (ret < 0)
+			return ret;
 
-	data->als_contr = status | data->chip_info->als_mode_active;
+		data->als_contr = status | data->chip_info->als_mode_active;
+	}
 
 	ret = regmap_read(data->regmap, LTR501_PS_CONTR, &status);
 	if (ret < 0)
@@ -1569,6 +1616,7 @@ static const struct i2c_device_id ltr501_id[] = {
 	{ .name = "ltr329", .driver_data = (kernel_ulong_t)&ltr329_chip_info_tbl },
 	{ .name = "ltr501", .driver_data = (kernel_ulong_t)&ltr501_chip_info_tbl },
 	{ .name = "ltr559", .driver_data = (kernel_ulong_t)&ltr559_chip_info_tbl },
+	{ .name = "ltr659", .driver_data = (kernel_ulong_t)&ltr659_chip_info_tbl },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ltr501_id);
@@ -1579,6 +1627,7 @@ static const struct of_device_id ltr501_of_match[] = {
 	{ .compatible = "liteon,ltr329", .data = &ltr329_chip_info_tbl },
 	{ .compatible = "liteon,ltr501", .data = &ltr501_chip_info_tbl },
 	{ .compatible = "liteon,ltr559", .data = &ltr559_chip_info_tbl },
+	{ .compatible = "liteon,ltr659", .data = &ltr659_chip_info_tbl },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ltr501_of_match);
-- 
2.53.0

