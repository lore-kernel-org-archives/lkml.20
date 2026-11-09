Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243502;
	b=I6qnq4lEA0evVmXmbPmHST9u3lF32vlKFt8wlJstCt64gPPaIFl79p8srhNifmFwGONW
	 +ZVn0VqKV1SLrsS6s2GhN3tTZ/HhMKrEntAU2p+wDLPpKcCGY/zbiizkHCFoQyUW3o5T7
	 hAYU5CA26HdlTGWuerde5AhGVORcsuVc1nGpoa/P/TvuGWs5jIjPt+lE10kOogsqvFEUJ
	 YhX0MQtnvdVp59srwAMI7Usjq/XaDpsurCsZI8rMdQdX+lu+X8vmS9n0AK+1lk07lBREj
	 FHxL8SWaB9ykvImysqbYCeo1LkO1JXBdkUlVR82q4jGdB6tFxZaAJ8oOGOf8nnAx3Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AjZ0gkuST9kJnYFKaJfinARuiAaOZL0xMfhNAvmAhqM=;
	b=YDpuzlXLNVoj70IE6P3qvP/WWkeR9UGujxdSzottFuHDY6CxeUkjgDbORXcwapbpB9ad
	 eIt56fMPb55LDug698+mT7i3kLrFTwv/z+wq4WaXM+KTiZpDl6zyoYE+8J73kQoaSJiXq
	 3DYd0lh8ynjGATKwiKM70VaWs6apTkpB6u16kxF+Uos70be2FHCZH0MAtPz8LvAK+dIYS
	 xtiKMd1iPGb9UsMyhVQURkQALAAZ7YkAhEGeOsyApdmFTo7juwBmXhOTTdSo02aPW+zGG
	 XgphwQTty6NAsdIOl7DA8gBcvjYJZJRGupJok6AkJoByasbsgwfqKLlhdtjoRnWF2ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l7kQuGUK;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CEE606A429
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4CEE606A429
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l7kQuGUK
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso544529a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243500; x=1794848300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AjZ0gkuST9kJnYFKaJfinARuiAaOZL0xMfhNAvmAhqM=;
        b=l7kQuGUKcub1ZV97fvktn/GUOJUXtjOg+LcyhTWzGFtMo2yRArgz4schVwFw9Vm0Rm
         QPWP/5yhu2Y7kwZ5mMBUdljQwynDg0eGVElnWRqN0jhoCdpnY/Nz3eAFdngNoQQdfL6y
         0icFLmQUVo7Lq8rDnaSfD1fun1Z4zrN7IurNV/i/iKiS8peCVE6F1B38QUSmQ89pZhDh
         VUwxgFsayFy4RQzKKl+Jcm7wO3dwElTUCs32J+sf3iWPuhPLU6aqkE+bU/3xRAtbuEpj
         oEQl4+SwOKba1OTvC/KYhyKCQQCIEw425kwplG/RU2qL53zWiXrOFS4ecFZc7PtAP90C
         VBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243500; x=1794848300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AjZ0gkuST9kJnYFKaJfinARuiAaOZL0xMfhNAvmAhqM=;
        b=J7bXX0bL50Jf1UmFWsRHJU35x8p9HB0Cb1dy2Cxp842kx4++9IR/2q33JVS9QgXr6M
         43QYkeXmbOfjq971QTxLuYV4SmjTdslpjxP4NoVDCg2p2/HzkgRZkok8NUVtwoPO3rjy
         qLNWDjf9fO45MlXkiGcSbZ/wZWxvoNnmJuZHnaYiLTAh+QmI6LbTQbp9ttFmRBzzhZ+j
         7tmkQOwL+34mOCUg8MeMlPCxU5+1TaAGqFnn+NFAEHRmytTSj0S9CbPvxH3WfagfWhW8
         BYEcZmafLc0+UHGym5pBfoTs8s8YDrTyU6Oio0FJBFdGt+otCmyjCDKiFZH9vbXw4GMh
         vfBQ==
X-Forwarded-Encrypted: i=1; AL+hErG0kiR0wYFIx+5nU4TGuEo2VnKKBhvUR93A3pLgjs9B/cFCTULFCgcSAUrhDUg3SoVqgCvRyZ8BLuAd410=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1oQO3QvVs/0APkWZ1BNHdzVfXyNCHbYw62tLMhtW4thM0sxP/
	xpTLUiajeJYNaKzyxzu71QLYmrJkniRgvtXhbJrlAHkUJxZzIKceaRoI
X-Gm-Gg: AYBFou2EqaQxOa2UsMr51M9950pWFYWnw3TSHyIn330Es2hXr13cv4IM6rBf3Ditr3a
	GVacO8Nss2cfWHV/H/7B5YC8VsHatSyT32/a73Dtor6b41uzFHGAB5/PH/l2r+cE4kHShxmrUMv
	f/Ut2SEk8KnuPWYhF70QYHSBtKShNjEbDi4ozXPaMWq/6AdlMRjlxmzx6CkUUpzkrdwz4UyZVv7
	A/LPr4bAOvxDjfjUa2pK2MerwuFNgO/om4cyXxxP10KQW2XKTcK5b14Y+vHQq7v/PY9FcRbEg8N
	QKPnhR9o+xSCbic+y0Q/bRQb0vqyA0omN3gZ5XSSuPRCkHNZzhuOwYAlZ2wYtI2GIHBb9FTkd1E
	hTu+OGPECjA1l8AwAaqc6cY9ImvuKlfH3xnluVxiVVqk9zH9bP1shST5W7eVlKZcRVLVS5bPg7q
	9EQdUkUOwU37g39cdrl/NlFQNk+eCmy5NEXwybEV9lOJ2ATv7zhehkvLvc3ItEQ7DqOqpSg9Ip9
	57p7m/WADGVXxsde4Fc6JYOXnE8R348i9eM5ros65CBeUEwZajmwIkaCxgLtXgP8//Q8ewEXYEL
	STy19Hmkl6luvpip6TbwfCceh5gEdLzSV4tIkTxmY90YDS7ac8gnRhma+vVcuROobdFhluBYwf4
	wb7DO
X-Received: by 2002:a17:90a:e7d0:b0:3a8:5fd6:cb6 with SMTP id 98e67ed59e1d1-3b166a5fb0bmr272689a91.0.1794243499914;
        Mon, 09 Nov 2026 08:58:19 -0800 (PST)
Received: from debian.ari ([152.56.156.124])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16779cf05sm138766a91.3.2026.11.09.08.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:58:17 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	nuno.sa@analog.com,
	u.kleine-koenig@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com
Subject: [PATCH v6 06/11] iio: adc: ti-ads1015: Remove ads1015_set_power_state()
Date: Mon,  9 Nov 2026 22:28:00 +0530
Message-Id: <20261109165805.31160-1-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
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

Remove the unnecessary ads1015_set_power_state() helper and
use runtime PM helpers directly at the call sites.

Use PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND() to manage the
runtime PM reference in __ads1015_read_info_raw(), ensuring
it is automatically released on function exit, including
error paths.

For event configuration and buffer operations, retain
explicit reference management as the runtime PM reference
must remain held beyond the lifetime of the respective
function.

Mark the device as last busy before putting it into
autosuspend.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/iio/adc/ti-ads1015.c | 59 +++++++++++++++---------------------
 1 file changed, 24 insertions(+), 35 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index 9fd07ee21ede8..2e6bf45871340 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -366,30 +366,6 @@ static const struct iio_chan_spec tla2024_channels[] = {
 	IIO_CHAN_SOFT_TIMESTAMP(ADS1015_TIMESTAMP),
 };
 
-
-#ifdef CONFIG_PM
-static int ads1015_set_power_state(struct ads1015_data *data, bool on)
-{
-	int ret;
-	struct device *dev = regmap_get_device(data->regmap);
-
-	if (on)
-		ret = pm_runtime_resume_and_get(dev);
-	else
-		ret = pm_runtime_put_autosuspend(dev);
-
-	return ret < 0 ? ret : 0;
-}
-
-#else /* !CONFIG_PM */
-
-static int ads1015_set_power_state(struct ads1015_data *data, bool on)
-{
-	return 0;
-}
-
-#endif /* !CONFIG_PM */
-
 static
 int ads1015_get_adc_result(struct ads1015_data *data, int chan, int *val)
 {
@@ -532,26 +508,26 @@ static int ads1015_read_avail(struct iio_dev *indio_dev,
 static int __ads1015_read_info_raw(struct ads1015_data *data,
 				   struct iio_chan_spec const *chan, int *val)
 {
+	struct device *dev = regmap_get_device(data->regmap);
 	int ret;
 
 	if (ads1015_event_channel_enabled(data) &&
 	    data->event_channel != chan->address)
 		return -EBUSY;
 
-	ret = ads1015_set_power_state(data, true);
-	if (ret < 0)
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(dev, guard);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&guard);
+	if (ret)
 		return ret;
 
 	ret = ads1015_get_adc_result(data, chan->address, val);
-	if (ret < 0) {
-		ads1015_set_power_state(data, false);
+	if (ret < 0)
 		return ret;
-	}
 
 	*val = sign_extend32(*val >> chan->scan_type.shift,
 			     chan->scan_type.realbits - 1);
 
-	return ads1015_set_power_state(data, false);
+	return 0;
 }
 
 static int ads1015_read_raw(struct iio_dev *indio_dev,
@@ -709,6 +685,7 @@ static int ads1015_enable_event_config(struct ads1015_data *data,
 {
 	int low_thresh = data->thresh_data[chan->address].low_thresh;
 	int high_thresh = data->thresh_data[chan->address].high_thresh;
+	struct device *dev = regmap_get_device(data->regmap);
 	int ret;
 	unsigned int val;
 
@@ -735,7 +712,7 @@ static int ads1015_enable_event_config(struct ads1015_data *data,
 	if (ret)
 		return ret;
 
-	ret = ads1015_set_power_state(data, true);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
 		return ret;
 
@@ -744,7 +721,8 @@ static int ads1015_enable_event_config(struct ads1015_data *data,
 	ret = ads1015_get_adc_result(data, chan->address, &val);
 	if (ret) {
 		ads1015_event_channel_disable(data, chan->address);
-		ads1015_set_power_state(data, false);
+		pm_runtime_mark_last_busy(dev);
+		pm_runtime_put_autosuspend(dev);
 	}
 
 	return ret;
@@ -753,6 +731,7 @@ static int ads1015_enable_event_config(struct ads1015_data *data,
 static int ads1015_disable_event_config(struct ads1015_data *data,
 	const struct iio_chan_spec *chan, int comp_mode)
 {
+	struct device *dev = regmap_get_device(data->regmap);
 	int ret;
 
 	if (!ads1015_event_channel_enabled(data))
@@ -774,7 +753,10 @@ static int ads1015_disable_event_config(struct ads1015_data *data,
 
 	ads1015_event_channel_disable(data, chan->address);
 
-	return ads1015_set_power_state(data, false);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return 0;
 }
 
 static int ads1015_write_event_config(struct iio_dev *indio_dev,
@@ -830,17 +812,24 @@ static irqreturn_t ads1015_event_handler(int irq, void *priv)
 static int ads1015_buffer_preenable(struct iio_dev *indio_dev)
 {
 	struct ads1015_data *data = iio_priv(indio_dev);
+	struct device *dev = regmap_get_device(data->regmap);
 
 	/* Prevent from enabling both buffer and event at a time */
 	if (ads1015_event_channel_enabled(data))
 		return -EBUSY;
 
-	return ads1015_set_power_state(iio_priv(indio_dev), true);
+	return pm_runtime_resume_and_get(dev);
 }
 
 static int ads1015_buffer_postdisable(struct iio_dev *indio_dev)
 {
-	return ads1015_set_power_state(iio_priv(indio_dev), false);
+	struct ads1015_data *data = iio_priv(indio_dev);
+	struct device *dev = regmap_get_device(data->regmap);
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return 0;
 }
 
 static const struct iio_buffer_setup_ops ads1015_buffer_setup_ops = {
-- 
2.39.5

