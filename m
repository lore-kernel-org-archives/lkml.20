Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627302;
	b=jdswMUB/O2F+u/VpBD4V0kOuOn0eAkrcqt50dDAft6Xh/d6frv08kG/IEu/EoKY2EuZo
	 v+EP0CHS8u1etOsv55/KtVV0ZdzupyVUCDHlRh4sLYr9bXPn655p+xvdpjhAVBDB6r3iY
	 N4fqY8mCZhg7wJlGX1yR2WiDjlstpxi+rxci/xHbOq9O/o6Up4UuorjIeKo3VWkE95J42
	 5YfDiEP2P+KmACmrp2oPOO+AKDlDsKjeYI0g+7oW67Kwr+KGMZq4t79Zo8F508HJTkEWV
	 KGWL0mzogKHagpRYnbBYMrlHigaFQCPEVzlLVmUQM9YdURKrTTi7kDU0YH5wRqVGUYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=xzFwmGHdlHCFeH91f0yXYoPTiWjKtDmQ9whoEi6CYmo=;
	b=CmaNeUypO8byKTMAEyhFOAuHW/QxxH5cFF3VGJo65ca+8wgxLb/12sKh/b4sWLLBIcFp
	 7VJQ/jkJLr/4q8eQTTw5D8Hvbg5sP5pwaXSKvRDCr3s2zAbm0UrgMIZxnHHWtqzVU8qJt
	 7d+veLGi6bnPJdsQDbYuLD95vjOOnxjb8OZPJ/TMFNM1hBrHKrVJW7OUqo98XX4/8RUOv
	 UrQHY4F78FcjwLbXYspPjh24jVkNJgYhXoPGRy8pItYukz2NBhuhJzOdQ0urOW0sOtTpj
	 Cbj+/yLGV5L39vYIGink8b2zupNZwxmwszRwXXHiOVTwLpADqrCdSJy5PTb8njZ+amA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mfooWoBL;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0EF60A4ACA
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:01:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E0EF60A4ACA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mfooWoBL
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35f036b17easo1570278eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792627302; x=1793232102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xzFwmGHdlHCFeH91f0yXYoPTiWjKtDmQ9whoEi6CYmo=;
        b=mfooWoBLQ49R4W96lPj6ek9zouBwjFgjcwiTmjoQxjajp8opGZln+hCXXpdBbY31dH
         +W4/G9hlzQePAV0I9WZLPiq5sBTvZQ/eaOtSYfFa4jnH9Cb3/JLrJJPGb+7Jnb+ZI68/
         Ryj/1pPSfTyOoJcWR8luaUtueRELcPvDfUgqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627302; x=1793232102;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xzFwmGHdlHCFeH91f0yXYoPTiWjKtDmQ9whoEi6CYmo=;
        b=1V3+pSsLTf9aVeU61n9DA7UDviUkN27jONLThY+c+Szb+8Xe1EBWSMoYr40xOOldBm
         shd7adxTbhyydv6p3Q2gRg2UcuFM15pJYeIZcJVLNNl6F4XGaiZ2xv0NvV8xoimWiUPx
         mf2LRqv84gRgxqiFEmw0cZUQ5nJhL2FCLLGlF2OA5A9gWGx9CHHtu/xqkPoeCYe/LzSG
         wUizlyjtbOHIMzKnODIBn2I/94sFFiH9PMVSk6Ak11BB8IV5DbXUbC+GF/dcBb4PIV49
         hIMZieZHRPRFzBiRCaH/4LciDQ62zgaycWM8pi+ybJX1FCnuZrdHr0E4D7oElSe+oHH/
         iqzw==
X-Forwarded-Encrypted: i=1; AKwUvBwZCGesNyooxqz+ohxHZ/eFaki30qPYfFfq3s1xpeJZvV/cZmB6ReoDzzTqFLExzHDb8A9bwRGeh76OzwY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQAclK5LO9uiJUQhqGNCbyK9CS72CI1r94FyRXHPx44Vjm/NPw
	datguqsRWsN+ELT85at/T0Pfgfv14/Y7UJE9oubxso8uvFlWabmiFUDNlpYYl0iC5A==
X-Gm-Gg: AYBFou14Us2mNrVPCDWGUtptS6ai5dnCdybPMQVqEwZMHU9KAbpHSdWsTZniexqNIn2
	NYQdn+KryENyfDZcm9dmGQNA9bYGhtLaBy2T4ZxBoVDdG0JJSkVTttjfas5MJC0P40CGRzvQ8bM
	jG1B3NtAB9+bNHkPp5P57xtZjJFvhwIMz8QqedfRrhzJMjsC8Ow6gu3un6J18hxRy63VtHthj9D
	EvDDqbLlPC8iseCB4WqiRpcezNZ534pmNuC+naWOwBA1ZX3D5gugRVHWkr8Ve+cQNXdXkUOsg4+
	fzB+I5NVY8bfwr+74sN1QeCLdvM4gc2bIlmoXmvasY2HXnjx9Pc4rmTQYzSUsNAiEJq1QAdJaUQ
	YUVruBiuG5EarpNrTmBNCtFzoBsbpLQnW1Zj6AQbGhtbHNr92fjQ8TcGDrhxwv0I9XsYHhhxCso
	QxW8xHcZczDTpS+Koif+8yfiHNFi8fL20sw25tC/ALp9lnU0NgLaOP9LldMgBKdnuBN7G1meCuG
	TR3uRahuxdIaxxm9bmDBGY7odpDYAOf+p7+pd2zVVKxGEb5kFHXrHJEcvAKtWBdfr3xUZeEXBzF
	esUn+NGsPoQBfdam8bE=
X-Received: by 2002:a05:693c:864e:10b0:351:7444:8bfd with SMTP id 5a478bee46e88-367508e2cfemr5263895eec.39.1792627301575;
        Wed, 21 Oct 2026 17:01:41 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:14ab:bfeb:ac88:458f])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-36741e71eaesm22647177eec.26.2026.10.21.17.01.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 17:01:40 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-pm@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	linux-iio@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/17] iio: light: apds9960: Discard pm_runtime_put_autosuspend() return values
Date: Wed, 21 Oct 2026 16:57:14 -0700
Message-ID: <20261021165858.v2.13.Ic0c3be7c36a602e32c04628d5ae5692556742fa8@changeid>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
In-Reply-To: <20261021235818.3059519-1-briannorris@chromium.org>
References: <20261021235818.3059519-1-briannorris@chromium.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This driver propagates the return value of pm_runtime_put_autosuspend(),
which is not particularly useful.

Returning an error code from pm_runtime_put_autosuspend() merely means
that it has not queued up a timer or work item to check whether or not
the device can be suspended and there are many perfectly valid
situations in which that can happen, like after writing "on" to the
device's runtime PM "control" attribute in sysfs for one example.

For this reason, modify this driver to simply discard the
pm_runtime_put_autosuspend() return value. Inline the "off" helper, as
it's trivial now, and rename to apds9960_power_on().

This will facilitate a planned change of the
pm_runtime_put_autosuspend() return type to void in the future, similar
to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
type to void").

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
I'm not sure if apds9960_write_event_config()'s existing logic is
correct, but I don't want to mess with it.

Changes in v2:
 * Split iio patch into per-driver patches
 * Inline the put() helper

 drivers/iio/light/apds9960.c | 48 ++++++++++++++----------------------
 1 file changed, 18 insertions(+), 30 deletions(-)

diff --git a/drivers/iio/light/apds9960.c b/drivers/iio/light/apds9960.c
index afe520de60e2..0e084ffba1a6 100644
--- a/drivers/iio/light/apds9960.c
+++ b/drivers/iio/light/apds9960.c
@@ -476,38 +476,23 @@ static int apds9960_set_als_gain(struct apds9960_data *data, int val)
 	return ret;
 }
 
-#ifdef CONFIG_PM
-static int apds9960_set_power_state(struct apds9960_data *data, bool on)
+static void apds9960_power_on(struct apds9960_data *data)
 {
 	struct device *dev = &data->client->dev;
-	int ret = 0;
+	int suspended;
 
 	mutex_lock(&data->lock);
 
-	if (on) {
-		int suspended;
-
-		suspended = pm_runtime_suspended(dev);
-		ret = pm_runtime_get_sync(dev);
+	suspended = pm_runtime_suspended(dev);
+	pm_runtime_get_sync(dev);
 
-		/* Allow one integration cycle before allowing a reading */
-		if (suspended)
-			usleep_range(data->als_adc_int_us,
-				     APDS9960_MAX_INT_TIME_IN_US);
-	} else {
-		ret = pm_runtime_put_autosuspend(dev);
-	}
+	/* Allow one integration cycle before allowing a reading */
+	if (suspended)
+		usleep_range(data->als_adc_int_us,
+			     APDS9960_MAX_INT_TIME_IN_US);
 
 	mutex_unlock(&data->lock);
-
-	return ret;
 }
-#else
-static int apds9960_set_power_state(struct apds9960_data *data, bool on)
-{
-	return 0;
-}
-#endif
 
 static int apds9960_read_raw(struct iio_dev *indio_dev,
 			     struct iio_chan_spec const *chan,
@@ -522,7 +507,7 @@ static int apds9960_read_raw(struct iio_dev *indio_dev,
 
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
-		apds9960_set_power_state(data, true);
+		apds9960_power_on(data);
 		switch (chan->type) {
 		case IIO_PROXIMITY:
 			ret = regmap_read(data->regmap, chan->address, val);
@@ -540,7 +525,7 @@ static int apds9960_read_raw(struct iio_dev *indio_dev,
 		default:
 			ret = -EINVAL;
 		}
-		apds9960_set_power_state(data, false);
+		pm_runtime_put_autosuspend(&data->client->dev);
 		break;
 	case IIO_CHAN_INFO_INT_TIME:
 		/* RGB + ALS sensors only have integration time */
@@ -767,7 +752,6 @@ static int apds9960_write_event_config(struct iio_dev *indio_dev,
 		if (ret)
 			return ret;
 		data->pxs_int = state;
-		apds9960_set_power_state(data, state);
 		break;
 	case IIO_INTENSITY:
 		if (data->als_int == state)
@@ -777,12 +761,16 @@ static int apds9960_write_event_config(struct iio_dev *indio_dev,
 		if (ret)
 			return ret;
 		data->als_int = state;
-		apds9960_set_power_state(data, state);
 		break;
 	default:
 		return -EINVAL;
 	}
 
+	if (state)
+		apds9960_power_on(data);
+	else
+		pm_runtime_put_autosuspend(&data->client->dev);
+
 	return 0;
 }
 
@@ -1078,7 +1066,7 @@ static int apds9960_probe(struct i2c_client *client)
 	pm_runtime_set_autosuspend_delay(&client->dev, 5000);
 	pm_runtime_use_autosuspend(&client->dev);
 
-	apds9960_set_power_state(data, true);
+	apds9960_power_on(data);
 
 	ret = apds9960_regfield_init(data);
 	if (ret)
@@ -1105,12 +1093,12 @@ static int apds9960_probe(struct i2c_client *client)
 	if (ret)
 		goto error_power_down;
 
-	apds9960_set_power_state(data, false);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return 0;
 
 error_power_down:
-	apds9960_set_power_state(data, false);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
-- 
2.56.0.218.g1ec904b173-goog

