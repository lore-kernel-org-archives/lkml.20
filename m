Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794131001;
	b=ixz0Ms5HaSHyxWdAsp07YaAmFqq0kk+ryXq2KEqiqCMEuaP//W+ONYdbXYoefMgE6Ict
	 +6q507M2aQTGk6mDpQiKO07z00U3RFFpoB/DbVcM3pKBIAVaXsyyRq0tmcQWOAKxeo/T9
	 tBz5+HsS/hYAtxQNUDceUJmpzbEPl8Awz+9CEejIXUpcSAw8+U7hNs68EVJk5FDbPBwK5
	 O9wkjtzqfcBQXxYNMezaRF6cLVHVBVTmq5gWRU6ic0sNEu7r+SHzPIAfQRqbfKJHpF5fx
	 17J9/HAVOlTVp6Wkwz4eOAGRumgENLxu4QICBsZbuM8FVVOpVi89xEcfyRmqEM3ynBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794131001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zATDjvi0ueP4ucWse6X9jXoZiNkvGsfI7v1aTgEFm+4=;
	b=3kfTNZD6vzX4QG3Hr5hkU6FGB5BJ//IYBCIsC5aWxeaZWHJAUuyjTRAruzBdjST40eEx
	 LngR8I8ttPq15jiQCYdIRsoLBWKsyGXJu2TSMu5szX+mD1bVkfSdz5feIQ6SxAFNWgQW/
	 1sAynOapJyJOGI7MeNGAQIYfeaRUS9IpfR8M+rCkHVvytSYRi0ZdtxfplNswGcMc+nHxf
	 DPF3sxqnYruAixpUkk0qljTQkjR95ZoSZCJKXVAi3oitEYRGfNAvtS3VwukeOB3XmIKMe
	 g+R9AwdfbEPsgM3aoc94exTQFcIw+Aek2Yp93dgX1n6V+g034Lm1uUJmsS7Hxf5XLow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u6p8wtb9;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68875606A33E
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68875606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u6p8wtb9
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b566cf56c1so10150a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 01:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794131000; x=1794735800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zATDjvi0ueP4ucWse6X9jXoZiNkvGsfI7v1aTgEFm+4=;
        b=u6p8wtb9fGXkf1QKwGVd3g69+9r04WtTaYtjfGj7wq4qgRW/X+UN/lSqD5TxyLeRpT
         US5wOzpyna4Juh9NH/EJdadRj1Cxk6Roc1MxQW8aPfYQZOVVSciJd3hCaqR1LiLUB2Ei
         Ow9WXKJXacJawdejKJ+0dO8shVKOKvUzUJL67ca/Cb+42PAjCC86e7zRFpRSx8qcI86F
         Ppj6LIVCirt/lr0/HBNjFJ8lMetYn0/m4t2aBp0HmTAktV1xNEp4Xgim3z9rwhCmLLF0
         XxfjfHP0aN2qm5dkiNHcJOUTBCUGCBYe7B9I2ZW7oA3AMhM5+f/Chdie3/SwKXPSlhkE
         XBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794131000; x=1794735800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zATDjvi0ueP4ucWse6X9jXoZiNkvGsfI7v1aTgEFm+4=;
        b=h8bNdlKT3m2VYNfzldMmQFgBkSYmMGemdZYUbjUXmnj731n1kvqZz9e/lK2F9qPr3R
         uLyMjB91FKJwpdtM6GGOX/ckJEP5Wk07Ae+x6POdsd2TszzSV/pI2qQz8JYrjhLBxm6M
         1U2KV7VWCqnMFJp1nIUHGwihQS+K72v2rubOwG+3HY0mRV1zTN37Oq3F6BCwOfimjncm
         kZU1hfoD8ZomrvCbxrq5yr1gFderulEyPsBndJbRCGHtrg1n0IfvZo6YTpxVieSocnKz
         ztNeUukOohrasZHX1wclwT2uoHWN+oeb73DZxqscZFbEnOWaDNpeU6KMHHIbZa1PRDPr
         dd/A==
X-Forwarded-Encrypted: i=1; AL+hErEgLPuioszgElPFjWWKoevJslNsroZvxNlTT6kSec1UhXm0xmrWAQ/p6bGLWRAN6birVvplrB2ZCRfo038=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UObJHl06iqq3l0t7KE23wR+IISn1YkJRkhoyGz4l4B73IDxai
	FtcJEPJxrJOZSVLPulW+FM/eSysHmEcZDNomc5PLWI/MZMQbGNC9TKe9
X-Gm-Gg: AYBFou1Yvb8oLlFRZ+wzKMhTXBH7NQ79eAWArsz80AZ6v8KyBn+OjpMUbIvQJTf8DZf
	AkOuVk1ZneXaLY2wp3vtdfBrnho2I3oyrZuX2QrmnVhaTHcFISd+ozqZBj7YCBj6RElyxC3gJgx
	e/odgYhAGvj/CfCBzCPuPd0pYGnBVxuTnWHMDPNyUy0NATwDLSVX64WvEDu0jLlIVKnOfuWzUSW
	z0lYNOgFos6HPhU39RBPwc8GVx8Q2Vllo8alxi7ggaoUz7EkGcShZqPSeReIPWR5GSSZakB2lnW
	BXmI5540zU6NdyCcfd2S26Cg2z2azk3B19sxFqVW9jX4qrv7w9lmNGBBvrRVp6BRvbATu6lHr8W
	V27fXd5l55TaUeifEaBWVtVeS4kvDTPm7ZHwqrSQWd0N1fFsxAhK2PTtYrVhSCWVDhNWiVmRqiL
	4o6BIZWJa4sOibplieJe5VyEXk0a8P61iKAQqt9zBoaskXeViF9Ps5zTf+gLKtQhLG1jgtdqe8K
	xPy2sG3EMwLlZZgHOwFnGbpyxmLwjWSDG24AC/cekeQgTPYwhwK95b1NNYZUQ2gv1vTJD2LQx5/
	ppHwz4f3Z3O2Tn7lnnnKwHnySL8sf+LhNJpC+29HMpT3Hg2xV1HPO9QrjsX/2YK5rQyyVVELXjt
	U9PpLPUJIlQ==
X-Received: by 2002:a05:6402:1ece:b0:6b5:6546:f7f2 with SMTP id 4fb4d7f45d1cf-6b722462a1cmr546791a12.37.1794130999707;
        Sun, 08 Nov 2026 01:43:19 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ea56f2sm436321a12.8.2026.11.08.01.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:43:17 -0800 (PST)
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
Subject: [PATCH v3 1/4] iio: light: ltr501: Switch to read_avail() op from manual attribute registration
Date: Sun,  8 Nov 2026 11:42:50 +0200
Message-ID: <20261108094253.83899-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108094253.83899-1-clamor95@gmail.com>
References: <20261108094253.83899-1-clamor95@gmail.com>
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

Adjust LTR501_INTENSITY_CHANNEL to account for the new
info_mask_*_available layout, allowing the removal of _shared since all
intensity channels share the same layout of available entries.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/iio/light/ltr501.c | 192 +++++++++++++++----------------------
 1 file changed, 76 insertions(+), 116 deletions(-)

diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
index 302be2fc314c5..1ddd0dfd55ea2 100644
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
@@ -582,14 +596,18 @@ static const struct iio_event_spec ltr501_pxs_event_spec[] = {
 	},
 };
 
-#define LTR501_INTENSITY_CHANNEL(_idx, _addr, _mod, _shared, \
-				 _evspec, _evsize) { \
+#define LTR501_INTENSITY_CHANNEL(_idx, _addr, _mod, _evspec, _evsize) { \
 	.type = IIO_INTENSITY, \
 	.modified = 1, \
 	.address = (_addr), \
 	.channel2 = (_mod), \
 	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW), \
-	.info_mask_shared_by_type = (_shared), \
+	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE) | \
+				    BIT(IIO_CHAN_INFO_INT_TIME) | \
+				    BIT(IIO_CHAN_INFO_SAMP_FREQ), \
+	.info_mask_shared_by_type_available = BIT(IIO_CHAN_INFO_SCALE), \
+	.info_mask_shared_by_all_available = BIT(IIO_CHAN_INFO_INT_TIME) | \
+					     BIT(IIO_CHAN_INFO_SAMP_FREQ), \
 	.scan_index = (_idx), \
 	.scan_type = { \
 		.sign = 'u', \
@@ -609,19 +627,18 @@ static const struct iio_event_spec ltr501_pxs_event_spec[] = {
 
 static const struct iio_chan_spec ltr501_channels[] = {
 	LTR501_LIGHT_CHANNEL(),
-	LTR501_INTENSITY_CHANNEL(0, LTR501_ALS_DATA0, IIO_MOD_LIGHT_BOTH, 0,
+	LTR501_INTENSITY_CHANNEL(0, LTR501_ALS_DATA0, IIO_MOD_LIGHT_BOTH,
 				 ltr501_als_event_spec,
 				 ARRAY_SIZE(ltr501_als_event_spec)),
-	LTR501_INTENSITY_CHANNEL(1, LTR501_ALS_DATA1, IIO_MOD_LIGHT_IR,
-				 BIT(IIO_CHAN_INFO_SCALE) |
-				 BIT(IIO_CHAN_INFO_INT_TIME) |
-				 BIT(IIO_CHAN_INFO_SAMP_FREQ),
-				 NULL, 0),
+	LTR501_INTENSITY_CHANNEL(1, LTR501_ALS_DATA1, IIO_MOD_LIGHT_IR, NULL, 0),
 	{
 		.type = IIO_PROXIMITY,
 		.address = LTR501_PS_DATA,
 		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
 			BIT(IIO_CHAN_INFO_SCALE),
+		.info_mask_separate_available = BIT(IIO_CHAN_INFO_SCALE),
+		.info_mask_shared_by_all_available = BIT(IIO_CHAN_INFO_INT_TIME) |
+						     BIT(IIO_CHAN_INFO_SAMP_FREQ),
 		.scan_index = 2,
 		.scan_type = {
 			.sign = 'u',
@@ -638,14 +655,10 @@ static const struct iio_chan_spec ltr501_channels[] = {
 
 static const struct iio_chan_spec ltr301_channels[] = {
 	LTR501_LIGHT_CHANNEL(),
-	LTR501_INTENSITY_CHANNEL(0, LTR501_ALS_DATA0, IIO_MOD_LIGHT_BOTH, 0,
+	LTR501_INTENSITY_CHANNEL(0, LTR501_ALS_DATA0, IIO_MOD_LIGHT_BOTH,
 				 ltr501_als_event_spec,
 				 ARRAY_SIZE(ltr501_als_event_spec)),
-	LTR501_INTENSITY_CHANNEL(1, LTR501_ALS_DATA1, IIO_MOD_LIGHT_IR,
-				 BIT(IIO_CHAN_INFO_SCALE) |
-				 BIT(IIO_CHAN_INFO_INT_TIME) |
-				 BIT(IIO_CHAN_INFO_SAMP_FREQ),
-				 NULL, 0),
+	LTR501_INTENSITY_CHANNEL(1, LTR501_ALS_DATA1, IIO_MOD_LIGHT_IR, NULL, 0),
 	IIO_CHAN_SOFT_TIMESTAMP(2),
 };
 
@@ -1111,111 +1124,67 @@ static int ltr501_write_event_config(struct iio_dev *indio_dev,
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
+			int valid_als_gains[ARRAY_SIZE(ltr559_als_gain_tbl) * 2];
+			int j = 0;
+
+			for (int i = 0; i < info->als_gain_tbl_size; i++) {
+				if (info->als_gain[i].scale == LTR501_RESERVED_GAIN)
+					continue;
+
+				valid_als_gains[j++] = info->als_gain[i].scale;
+				valid_als_gains[j++] = info->als_gain[i].uscale;
+			}
+
+			*length = j;
+			*vals = (const int *)valid_als_gains;
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
@@ -1226,8 +1195,6 @@ static const struct ltr501_chip_info ltr501_chip_info_tbl[] = {
 		.als_mode_active = BIT(0) | BIT(1),
 		.als_gain_mask = BIT(3),
 		.als_gain_shift = 3,
-		.info = &ltr301_info,
-		.info_no_irq = &ltr301_info_no_irq,
 		.channels = ltr301_channels,
 		.no_channels = ARRAY_SIZE(ltr301_channels),
 	},
@@ -1238,8 +1205,6 @@ static const struct ltr501_chip_info ltr501_chip_info_tbl[] = {
 		.als_mode_active = BIT(0),
 		.als_gain_mask = BIT(2) | BIT(3) | BIT(4),
 		.als_gain_shift = 2,
-		.info = &ltr301_info,
-		.info_no_irq = &ltr301_info_no_irq,
 		.channels = ltr301_channels,
 		.no_channels = ARRAY_SIZE(ltr301_channels),
 	},
@@ -1251,7 +1216,6 @@ static const struct ltr501_chip_info ltr501_chip_info_tbl[] = {
 		.als_gain_mask = BIT(2) | BIT(3) | BIT(4),
 		.als_gain_shift = 2,
 		.no_irq_support = true,
-		.info_no_irq = &ltr301_info_no_irq,
 		.channels = ltr301_channels,
 		.no_channels = ARRAY_SIZE(ltr301_channels),
 	},
@@ -1264,8 +1228,6 @@ static const struct ltr501_chip_info ltr501_chip_info_tbl[] = {
 		.als_mode_active = BIT(0) | BIT(1),
 		.als_gain_mask = BIT(3),
 		.als_gain_shift = 3,
-		.info = &ltr501_info,
-		.info_no_irq = &ltr501_info_no_irq,
 		.channels = ltr501_channels,
 		.no_channels = ARRAY_SIZE(ltr501_channels),
 	},
@@ -1278,8 +1240,6 @@ static const struct ltr501_chip_info ltr501_chip_info_tbl[] = {
 		.als_mode_active = BIT(0),
 		.als_gain_mask = BIT(2) | BIT(3) | BIT(4),
 		.als_gain_shift = 2,
-		.info = &ltr501_info,
-		.info_no_irq = &ltr501_info_no_irq,
 		.channels = ltr501_channels,
 		.no_channels = ARRAY_SIZE(ltr501_channels),
 	},
@@ -1548,7 +1508,7 @@ static int ltr501_probe(struct i2c_client *client)
 				     &data->near_level))
 		data->near_level = 0;
 
-	indio_dev->info = data->chip_info->info;
+	indio_dev->info = &ltr501_info;
 	indio_dev->channels = data->chip_info->channels;
 	indio_dev->num_channels = data->chip_info->no_channels;
 	indio_dev->name = name;
@@ -1573,7 +1533,7 @@ static int ltr501_probe(struct i2c_client *client)
 		if (ret)
 			goto powerdown_on_error;
 	} else {
-		indio_dev->info = data->chip_info->info_no_irq;
+		indio_dev->info = &ltr501_info_no_irq;
 	}
 
 	ret = iio_triggered_buffer_setup(indio_dev, NULL,
-- 
2.53.0

