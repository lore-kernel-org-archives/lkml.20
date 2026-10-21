Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627305;
	b=V3jSvg/45ecVUp1f3BYbncSimB5errkJKBV002PHwGIo2czTBQcptkDxayxk5FbVpltG
	 5dGcRH7qi+qGybqQQixrqJ22SF24mFXAlPBxrJ0wY0QHr/f3iCZ2Spssh3YnWak/9kEz9
	 blMA2nSBcPLZ96p4iWz4LlMNH1eCj8snSDCDSV8EaM8WPkHxCxiHbxz+qZb67M9/gWtje
	 6fN6TgsRTQNlrlMTGqHEaG4jS/CrhbgrMX3RHkSCwYLlv4V4Cv5M6Iaiuw1SjokiaY9lw
	 rz7jeqTX9JMUGdo9HfAUcQBVfeXaIhnq2j1tHVecLJ+Y73r3fAU47eGaGOWhTKiPlgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=hvZJAGJoNW9px1hCT4jyVbr/7Ym3LMfNBDMY5M42JDI=;
	b=U/aFkPh3/6EsVM1yfQtAK8DbO2gk751RIMhaJ7G+2uPpQ/4bJW/6Qf1ELVygbLpWjx/+
	 hHjkvE8XK3M0l4iZyJZNVWF8GXAjhcM37jIN8aNzzbytpxlWRxvxJRQIhgEdqbE2yzri+
	 9n0X89xeONj+gVpuU6AjgQqkdUFQp3BLBRKAQAqVHFesX3GfUAUqr31TQ8sgpr8G20d/W
	 t9yKx7wkWt2AZQ58fsmRTGC23YnOpQCAR15FTUNBdMRsO1L3HVi1zX+PN6MaAW0wvAEv2
	 PpGn6f8KXBT4EgfiSSZAur2MG/KuQq5fOH982+aKN5KwLDqgixh8oWddEVyKQ7zlWMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ECWbVKoP;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389A7606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:01:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 389A7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ECWbVKoP
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3550c917fd3so1717877eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792627304; x=1793232104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hvZJAGJoNW9px1hCT4jyVbr/7Ym3LMfNBDMY5M42JDI=;
        b=ECWbVKoPH/fjp+0fMIXh0XR4F4wF3kd+jhtIeTuoZf3HhCNT5XUBYhAz3nr1EjyK4P
         ycZeszuRSrqXsWhj/ZpWVdMiaFnyaHdQp3HLSMDs2YHhmDjNztwp52dZN4+GUgaXefGP
         ZcPEa6jJ22sfzGvp/iIGEwx5EqtFHq8f7SI4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627304; x=1793232104;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hvZJAGJoNW9px1hCT4jyVbr/7Ym3LMfNBDMY5M42JDI=;
        b=Is+SlEEXrfDBBTvgEfscjviXLCaSOQ9KoArcldUYGGLoPuGOgf6+weAM8nV7396cI3
         P6Ms9awVIybcDcCuQgDNmgi0cie25VzvMKhMHM9p2GkSgH+GOnBj2f3x8OpuUmWuiwIM
         VlIsEVdGjlaKrrYucZmB4oycFdS85n2y6bw7EcthxTYwo7mQIHOw9vsftEXnhbva48Mb
         XRq+6Z12EU3SNW3Xt4xNhCL6bvJeHTXbiem0qQIZysyCfEa7JwUhjrW1fyFNJc0MpxSz
         1sAfczOnbg/tah5jaXEnqaCArX0x0JDhA+JvLemmv5QjlMvESDiLMe+G1LrbImMJBqNy
         qquw==
X-Forwarded-Encrypted: i=1; AKwUvBwk/7hX64+KRfSgpPEOdNuGXEKdcKUxtWCj0tH6Ef8sycv122C+4KWEjcGyJs5f1xdqNr6zwUBDKPHyOq4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5OoSD5ydrh6ob8vh+PbjwXmUKYEZjtrS3oP/DPl5WG/GPHZ9w
	+Q0QTXI//ZVd/ZIuBfZSN66ILEjjSZ+spsbsmomznlBsViX2qXisIezXMcH8wD+iog==
X-Gm-Gg: AYBFou21B491g7spc6psHWA5lwm6jp5J1F8Rf1OZR+ea4RoM1vp7Wt3G69874bk8mee
	88JAYO9R4t4ngIRa+hoXzrHTjHlxZYg76QYHsoKAfKVB/dTDGOPOkf5iC/xb8GEbkMrWpQcsMrJ
	VMTmTAMUGWjF0DvIlUatwEwqmiw/Mjdnur3n7qAx3uBSSK0WGZwhfzwqq1hPSGVIDt/ZpOJsJCd
	Db+ks475wsI4lF1i4L3CQMlbz7K5DKqHKBqttR2D9/hY+VTnS32PzlNwYhCz020h28nEmxpycGx
	ILqBzFoJNkyzFULd+vfej4iGLwsKrB/iQB0MsBf43DEwSXUZ+T5c35pQr+u2Anz6qxNsr3K8MX4
	pKZh/cEpDGrIzz1dzW47qME4I219J/vgJnhmIrZoDdh5p8/0Wc8x9aodEuhkI0Q1da0jxgk3Efc
	1cxWzCuK5oUaIOQn74S7DrZbRaJKtkWsfjzjBl5/X9nLxT98jCVI1m8qPDNQjaOOCS7cwg+QTzo
	F7ggInt97gnvFTgIw3h76KxJdKntZyJMtWkl8jyHbUBwgdbEhe9qOIJNTIotrsng/6donSUPtg1
	tgVAXsnh0dvr0SJ0i+Jc1H6KIGE/oFcGthYvTZ3P
X-Received: by 2002:a05:7300:3398:b0:35e:a225:3ba6 with SMTP id 5a478bee46e88-3674c531737mr4703094eec.13.1792627304253;
        Wed, 21 Oct 2026 17:01:44 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:14ab:bfeb:ac88:458f])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-36741e71eaesm22647943eec.26.2026.10.21.17.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 17:01:43 -0700 (PDT)
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
Subject: [PATCH v2 14/17] iio: light: pa12203001: Discard pm_runtime_put_autosuspend() return values
Date: Wed, 21 Oct 2026 16:57:15 -0700
Message-ID: <20261021165858.v2.14.I501510b542691f595de1e110cfe35632a5fa7768@changeid>
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
pm_runtime_put_autosuspend() return value, and inline some of the
runtime PM helper function, now that it behaves the same with and
without CONFIG_PM.

This will facilitate a planned change of the
pm_runtime_put_autosuspend() return type to void in the future, similar
to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
type to void").

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 * Split iio patch into per-driver patches
 * Inlining

 drivers/iio/light/pa12203001.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/iio/light/pa12203001.c b/drivers/iio/light/pa12203001.c
index c0f4db8d95f7..0a0502a60a06 100644
--- a/drivers/iio/light/pa12203001.c
+++ b/drivers/iio/light/pa12203001.c
@@ -154,13 +154,12 @@ static inline int pa12203001_px_enable(struct pa12203001_data *data, u8 enable)
 	return 0;
 }
 
-static int pa12203001_set_power_state(struct pa12203001_data *data, bool on,
-				      u8 mask)
+static int pa12203001_runtime_resume_and_get(struct pa12203001_data *data, u8 mask)
 {
 #ifdef CONFIG_PM
 	int ret;
 
-	if (on && (mask & PA12203001_ALS_EN_MASK)) {
+	if (mask & PA12203001_ALS_EN_MASK) {
 		mutex_lock(&data->lock);
 		if (data->px_enabled) {
 			ret = pa12203001_als_enable(data,
@@ -173,7 +172,7 @@ static int pa12203001_set_power_state(struct pa12203001_data *data, bool on,
 		mutex_unlock(&data->lock);
 	}
 
-	if (on && (mask & PA12203001_PX_EN_MASK)) {
+	if (mask & PA12203001_PX_EN_MASK) {
 		mutex_lock(&data->lock);
 		if (data->als_enabled) {
 			ret = pa12203001_px_enable(data, PA12203001_PX_EN_MASK);
@@ -185,10 +184,7 @@ static int pa12203001_set_power_state(struct pa12203001_data *data, bool on,
 		mutex_unlock(&data->lock);
 	}
 
-	if (on)
-		return pm_runtime_resume_and_get(&data->client->dev);
-
-	return pm_runtime_put_autosuspend(&data->client->dev);
+	return pm_runtime_resume_and_get(&data->client->dev);
 
 err:
 	mutex_unlock(&data->lock);
@@ -213,7 +209,7 @@ static int pa12203001_read_raw(struct iio_dev *indio_dev,
 		switch (chan->type) {
 		case IIO_LIGHT:
 			dev_mask = PA12203001_ALS_EN_MASK;
-			ret = pa12203001_set_power_state(data, true, dev_mask);
+			ret = pa12203001_runtime_resume_and_get(data, dev_mask);
 			if (ret < 0)
 				return ret;
 			/*
@@ -226,13 +222,11 @@ static int pa12203001_read_raw(struct iio_dev *indio_dev,
 				goto reg_err;
 
 			*val = le16_to_cpu(reg_word);
-			ret = pa12203001_set_power_state(data, false, dev_mask);
-			if (ret < 0)
-				return ret;
+			pm_runtime_put_autosuspend(&data->client->dev);
 			break;
 		case IIO_PROXIMITY:
 			dev_mask = PA12203001_PX_EN_MASK;
-			ret = pa12203001_set_power_state(data, true, dev_mask);
+			ret = pa12203001_runtime_resume_and_get(data, dev_mask);
 			if (ret < 0)
 				return ret;
 			ret = regmap_read(data->map, PA12203001_REG_PDH,
@@ -241,9 +235,7 @@ static int pa12203001_read_raw(struct iio_dev *indio_dev,
 				goto reg_err;
 
 			*val = reg_byte;
-			ret = pa12203001_set_power_state(data, false, dev_mask);
-			if (ret < 0)
-				return ret;
+			pm_runtime_put_autosuspend(&data->client->dev);
 			break;
 		default:
 			return -EINVAL;
@@ -262,7 +254,7 @@ static int pa12203001_read_raw(struct iio_dev *indio_dev,
 	}
 
 reg_err:
-	pa12203001_set_power_state(data, false, dev_mask);
+	pm_runtime_put_autosuspend(&data->client->dev);
 	return ret;
 }
 
-- 
2.56.0.218.g1ec904b173-goog

