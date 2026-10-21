Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627297;
	b=fvd0V8PYKbOxTJWk28g13kP7TqbKfdl1Z28Z54CH6UgA46zWtmWDsFhy5OD9trqTm8eC
	 00JUQ/+3b7IzAYflrnXKC2C/YEOB3q6oRqCUAwUGI6nCMh+Dr+MeCan5Fp/CG3v7kvKtQ
	 MiaivEGV36EN3QvOkOCcjlfSVOEvi5aHrcAocmDP5vHrFLaW+S0CdWsfeTFckK09kkoCU
	 XdkC/XBDHiDQUb9Y92wAyCE1onWbnL2GY3H7zqG/eyGeW4EeaRto4KHk+FO4fB1ZCgT9R
	 FUgS9iTNWDQo6HGrMUixn0RgszQ4Djq1Akl2OFemGJyxhG11YwOc+axXTy5Tto7kp7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=dsyz6PyMmMWH12hjOOrerrdLXzBjhoM9BZVLK/+mwbo=;
	b=zsiqUD4HMB+sQBEOvJKHXY5yBgRgaiKTx9CXk29puuRQbtoVxa0BLdIQmSGJIbHSrcpT
	 u7Sw5q7eKZgjY0sxBSDhBablA0nnn2FXd9/h78U3q1FXm9MqU6Cu30w6NxJtMvZthVl84
	 pEYK0ibV1AJGvh+Tq5346xo0eV0cVmRPaSMSMUg2HZsj9DZCKMHG5oWyq4CXkLL+3e5IZ
	 5YGVTx9hKEQDyVlFmGJeGECZBzADg3xAplo6MvTBubY3PNl0dXSZ661+8LjJAr1PmAcvI
	 vSAwlRKRDMJbqd8WBoOnAtPxXS3nUKat3RiKO+NAQwbMUytlh33eiU+YWuovmrtBN/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=i01E8j0X;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032F2606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:01:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 032F2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=i01E8j0X
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-181516de561so121987c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792627296; x=1793232096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dsyz6PyMmMWH12hjOOrerrdLXzBjhoM9BZVLK/+mwbo=;
        b=i01E8j0XnjV3FQzaofSDz1fL2jlLI7WdDnghuCDShMtw5HN3ZDK5A1lHNjIEpq7IC3
         ONK2kvUfmCTqzyboOo74t9wInnwK14JKyCJqPgXsjRL79S8mXp0yiteUQy6SAAEFbfcN
         htMUy8UyPGzWPlmAWHALe/BBymvWtLiELDvqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627296; x=1793232096;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dsyz6PyMmMWH12hjOOrerrdLXzBjhoM9BZVLK/+mwbo=;
        b=UqzZqpmuOkYpQsJa7qEgcKzcjlKXyK2B4ZJAAQOe7outxw9egMKfBXYdfEAebvCFQ4
         cftZs/of1VZ/2A/i011uY+2bwWWBzwHOLWnPIMM04ZIM6cH4cXv5oliHdRG8slxRNMHm
         KbGOr6J5eLdhX/bs/TuTLFC3wOwPfkVdzHhWq4Kdinvjwia2lOKfS8ibrs4QpnnWPFoE
         kdmfCYIdDow4dgnhUrbsd57QxmgrUL+t5V2uluTZn7yQQaw33lvzh16qSKC7ru0/NqRP
         u/ZV5rYNis5xWJkkqlqKNimTDr2m8sw+IxjDl1g3reaS+DmiFdy4VGhtNCyp+xQqKo3P
         e2Zw==
X-Forwarded-Encrypted: i=1; AKwUvBzn3a1mSTk7thpyvOgtH5KMh3PhzDjxphSptXh+V//Em10MiNB9eYacndLyVkZYiodIJ6cpr3iDD28QOPQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKY/O/q2BqjCCTLqxHRzqGyx7aQHQRNvREVlrZhVY3b2C075T3
	Tk96SqC4PTtwaXKn/dU+aOrrgpiDj+mVPEw4F5W7iX/lF1/2zRHbPMkvpimAvWJ5Xw==
X-Gm-Gg: AYBFou1WsNXFX5zpUmXEwouV962GKbm6Ar9Ilf7qsSKrH4gPNyqzBdaXWnp4Ux7aJCN
	YdSsrdJEzTzFPYQs0Pn/Ztus6H8oP4YbcXRqFEXMgMXmQWdTj+lK8dR8HD/zzvUTKe0AULs1sv8
	FXXzk1bclyQ+WON9MGdoMSqa6OCPA3Tb6TtJNn4e9gRdqeEKs1Tce/64bvd0vJm7TEXX+RZknXd
	7hDiiZrp09aFZgPBxQCuM0P3bq73s+bOqBYtOODlyjeqEEktEKnC6zmgcTtjKNi8/osqZuH8AX5
	iq/KW0C8Q980Up/seJ3gIWnzGZFp2gS8seIIo/JKb2mjhXRKR1N5jXOLw04UvXURNXR3rSnR+S8
	AAk8s5hQadA8LYqSB2xBrclO/kLY72q4K3/q0YgfnpwmsPd8EsUzWfIyNMjAH2hLTNH9swQrqOM
	DBbgPu6E0mq+9bYYIMbVhxFa8H271/p/WlZSGrl1o8eP07YnYtz1BkvV3Quvpj9MsCH6kP+pelb
	7SFlJEQXvPVPynUfP4IhEXvcYO+D4ABxxMkFsDUNHR9aqR7NmpGp+B+TEpdc3J0kVIPXt3hV84Y
	Elcqk0NUOdSOtcG+sT4=
X-Received: by 2002:a05:7022:2605:b0:156:d588:c881 with SMTP id a92af1059eb24-192ee219b4fmr1409196c88.2.1792627296072;
        Wed, 21 Oct 2026 17:01:36 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:14ab:bfeb:ac88:458f])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1903e4f2eacsm8955721c88.23.2026.10.21.17.01.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 17:01:35 -0700 (PDT)
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
	Rui Miguel Silva <rmfrfs@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/17] iio: gyro: fxas21002c: Discard pm_runtime_put_autosuspend() return values
Date: Wed, 21 Oct 2026 16:57:12 -0700
Message-ID: <20261021165858.v2.11.I3517fbd2ba5f7d25ddcdf4abaec13f6ca301236d@changeid>
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
pm_runtime_put_autosuspend() return value, and inline the helpers now
that they're even more trivial.

This will facilitate a planned change of the
pm_runtime_put_autosuspend() return type to void in the future, similar
to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
type to void").

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 * Split iio patch into per-driver patches
 * Inlining

 drivers/iio/gyro/fxas21002c_core.c | 33 ++++++++----------------------
 1 file changed, 9 insertions(+), 24 deletions(-)

diff --git a/drivers/iio/gyro/fxas21002c_core.c b/drivers/iio/gyro/fxas21002c_core.c
index a88670207cec..1d891387b121 100644
--- a/drivers/iio/gyro/fxas21002c_core.c
+++ b/drivers/iio/gyro/fxas21002c_core.c
@@ -364,18 +364,6 @@ static int fxas21002c_write(struct fxas21002c_data *data,
 	return ret;
 }
 
-static int  fxas21002c_pm_get(struct fxas21002c_data *data)
-{
-	return pm_runtime_resume_and_get(regmap_get_device(data->regmap));
-}
-
-static int  fxas21002c_pm_put(struct fxas21002c_data *data)
-{
-	struct device *dev = regmap_get_device(data->regmap);
-
-	return pm_runtime_put_autosuspend(dev);
-}
-
 static int fxas21002c_temp_get(struct fxas21002c_data *data, int *val)
 {
 	struct device *dev = regmap_get_device(data->regmap);
@@ -383,22 +371,20 @@ static int fxas21002c_temp_get(struct fxas21002c_data *data, int *val)
 	int ret;
 
 	mutex_lock(&data->lock);
-	ret = fxas21002c_pm_get(data);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
 		goto data_unlock;
 
 	ret = regmap_field_read(data->regmap_fields[F_TEMP], &temp);
 	if (ret < 0) {
 		dev_err(dev, "failed to read temp: %d\n", ret);
-		fxas21002c_pm_put(data);
+		pm_runtime_put_autosuspend(dev);
 		goto data_unlock;
 	}
 
 	*val = sign_extend32(temp, 7);
 
-	ret = fxas21002c_pm_put(data);
-	if (ret < 0)
-		goto data_unlock;
+	pm_runtime_put_autosuspend(dev);
 
 	ret = IIO_VAL_INT;
 
@@ -416,7 +402,7 @@ static int fxas21002c_axis_get(struct fxas21002c_data *data,
 	int ret;
 
 	mutex_lock(&data->lock);
-	ret = fxas21002c_pm_get(data);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
 		goto data_unlock;
 
@@ -424,15 +410,13 @@ static int fxas21002c_axis_get(struct fxas21002c_data *data,
 			       &axis_be, sizeof(axis_be));
 	if (ret < 0) {
 		dev_err(dev, "failed to read axis: %d: %d\n", index, ret);
-		fxas21002c_pm_put(data);
+		pm_runtime_put_autosuspend(dev);
 		goto data_unlock;
 	}
 
 	*val = sign_extend32(be16_to_cpu(axis_be), 15);
 
-	ret = fxas21002c_pm_put(data);
-	if (ret < 0)
-		goto data_unlock;
+	pm_runtime_put_autosuspend(dev);
 
 	ret = IIO_VAL_INT;
 
@@ -725,10 +709,11 @@ static irqreturn_t fxas21002c_trigger_handler(int irq, void *p)
 	struct iio_poll_func *pf = p;
 	struct iio_dev *indio_dev = pf->indio_dev;
 	struct fxas21002c_data *data = iio_priv(indio_dev);
+	struct device *dev = regmap_get_device(data->regmap);
 	int ret;
 
 	mutex_lock(&data->lock);
-	ret = fxas21002c_pm_get(data);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
 		goto out_unlock;
 
@@ -741,7 +726,7 @@ static irqreturn_t fxas21002c_trigger_handler(int irq, void *p)
 					   data->timestamp);
 
 out_pm_put:
-	fxas21002c_pm_put(data);
+	pm_runtime_put_autosuspend(dev);
 
 out_unlock:
 	mutex_unlock(&data->lock);
-- 
2.56.0.218.g1ec904b173-goog

