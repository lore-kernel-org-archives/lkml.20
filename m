Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B80D44064C
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789927530; cv=none; b=JIO//Oet2pu65uTwONPJGmLyJ8+biHUzgrkHz+EAKSH4F2z6LtoOhIWFxuG7nPkxL21bhIO/UAfGqj6V/efBAaDiuCqYztwjIjb9RoT9wm1jzhDNYM0SCr9aTuvJr4bpbNwZLLXD1/wkzaEU9cZzFur3wang1Lwd0kIcw/5qetM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789927530; c=relaxed/simple;
	bh=oi3+wQ1KpLiTezfjKyRL/LKSMBXvmjgVdRtMkOTKWtM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mh3dj/nnwbIG5iMlXHbPHvV+1FeGMbPxpFky8VA5nZCiiiQosX/KBGTe6RArBNNbj+f7Ns+jRmt7YEbofIEP8VurX/xSyQCyBR2terpm2JKdjxGmyWYmsBsHkEBomWi2MJhSS0W24js/GFviNJMpxwX4tymg8iTnaYiu6lnb3so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9xpQ215; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9xpQ215"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso12393715e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789927527; x=1790532327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gsqm4cPewXVzaiuJiVzcpJTsZHj6gKfFyJeJ9ki9Dwk=;
        b=T9xpQ215KfQ/0VjchjrKVVu310DS8VshZ6QORjRtkox9O8bNvCGYgt3iVDuQ2TspP5
         RoHDEUXYKHSzkbfgkac+vd8ZYwcvTd6wcT9uXJvWTXliX1pnNAFHa6FprZW2Y+5te2wY
         0gJS6EUJnB2mAWRY2yfHVOi4/RJ3rC/APoyUWfsdsLuV1PN0U4RsqaxxJQEmfMrGtT8U
         NxfqsJD5gT0WWtS7CUa5D5DGSPSxjPQupBXs79qTgkArGzcoT27Y1rfWofpkIRYFePcy
         0a6TMOQwt02KsTIy1QaCuSzPek/PVxyDsgoYGhV/Btyq6xjHl7BEClNKfcA23h1L+LfH
         2quQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789927527; x=1790532327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gsqm4cPewXVzaiuJiVzcpJTsZHj6gKfFyJeJ9ki9Dwk=;
        b=B/J6eC+KvKTcBuwNX9DDQ8gciFSvUIND1CyDsc66gJ59Jm+Sek3Ug8eBF2AaFoa925
         EEY8AQglgXGAk2FNQgwvsPRfp/j5i16/sBQMH6p3HRuBgE0Uv3tLgDSfplaXYZbVpQpM
         yqVV50H44xtqbekmILUj/I/4z5ZLA2yyrBBj+I1cA6zrgCt0k+/WPkMRVXQ3jmxdkyII
         w13+dGIs3FXAzB9TsWZ/pvmC9D8ZUeW3llFmMZ9h8riaRCqHnRVZmizVDTc2AR4xhAdU
         w4DdnAhamgFZdjenJ1DkK2qPhBbajeqCBFXsQlRluT4Oz3mBimrBWTODOLCYTPqkpm8R
         /DIA==
X-Forwarded-Encrypted: i=1; AKwUvBzBzwEVr1PbaTN3jBBEhbXBcuLwNYLoNnOrS+TOr1uzhpLz4njNdQAFsxGfmrLNYLbajrtZHwV/aMbTGrw=@vger.kernel.org
X-Gm-Message-State: AFuF++nrGDWMO5UNGWF6eI6j7/EbS1tvxQIaJyRSdDy5H9G23ZJbdTDg
	GIdHRRNhQlVeybbcsLeHJy2n13fVfnhm+UtApJ3ibuNs8rAnEwOjk4uJ
X-Gm-Gg: AYBFou0NY0VUwnL16Yr3pwR759DMnm8N2BQnpHyAzaqvH2cp5KSNCd9Ug5v/yTc0jEo
	rlRty9mfO24+gOm+nMl1eBS96lN0vbiICUY3/8YOI4tvO09tzNgi81Bv53LxueKCMLLNoO581wM
	AxaWv7scPWwqYTtMsiLjFkxVPYXlsaBCJUfsIiI33Dqgm5MsulbWLfo6/y8RuNEtnukfECiFEjL
	v79v8fcCsm+ksXq6OTMV5ixw823VNCBlKJPe4MWG8pLgi1DsbPeRHcID0aoz994kutO7sHMhUm/
	1eL9G4kxiaH3r0X50qi3MMAb12bwKLy7DUa0GZ9sKnFzh79rf9HJGm7FfDyAUdraguHFauN3G1X
	9rpDNACgDdo4BWTxNFaytT+kQKTYEZ/XyLlg7KJ/UocZojFrCkpfdO6m5MiA4LSfhWZvYs1waQj
	muNnU4kd70JceCofqOZ/ioqjUsz12WufhbzH1NpmQWI/4s1B6yhCCNV6SL5mNeqgI6uUYd38rkK
	ttAymO6zZORVsM+MaP+in6T8LTajO1wkv0JZSFoKOzY2OmaMNC42lvqH2a8NrxCWPxfP7yCTH+w
	bzLA+xlUI+CwvXIcl4BbRxY+Rj8oaLtEmt24ZuYKjzb5KvrNp8s27losYBML4GhrlMYrwRO3X9p
	lfeB1x38LOkoQ4+LHRpDTdCmtgb/MjQtPzVU=
X-Received: by 2002:a05:600c:4e46:b0:49e:642a:4f6f with SMTP id 5b1f17b1804b1-49fc585e9edmr115541405e9.33.1789927527400;
        Sun, 20 Sep 2026 11:05:27 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0f7b9bsm164648055e9.5.2026.09.20.11.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 11:05:27 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sun, 20 Sep 2026 20:05:24 +0200
Subject: [PATCH v9 2/5] iio: magnetometer: ak8975: unify messages with help
 of dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260920-ak8975-cleanup-v9-2-1b0f00ec19ef@gmail.com>
References: <20260920-ak8975-cleanup-v9-0-1b0f00ec19ef@gmail.com>
In-Reply-To: <20260920-ak8975-cleanup-v9-0-1b0f00ec19ef@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Crofts <joshua.crofts1@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789927524; l=2774;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=pFfPcnzF8pUVPHOu2K48QMZEOPcPrcWHrj1EG+t2DZc=;
 b=poOj6zH2spN3oNlZcqPZLy9icG/xlgfcoDytiqpMUuOcdWZwllmr54RUviG9OsG/+9kxj31Ro
 fc5uE26WXbYA5kzV7MKO1cVGrvoMMH6oEpz/p/9WMeCYLPYJxA15zP4
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Unify error messages that might appear during probe phase by
switching to use dev_err_probe().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Nuno Sá <nuno.sa@analog.com>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/iio/magnetometer/ak8975.c | 37 +++++++++++++------------------------
 1 file changed, 13 insertions(+), 24 deletions(-)

diff --git a/drivers/iio/magnetometer/ak8975.c b/drivers/iio/magnetometer/ak8975.c
index d217fdf34bce..59a7bb83a731 100644
--- a/drivers/iio/magnetometer/ak8975.c
+++ b/drivers/iio/magnetometer/ak8975.c
@@ -501,14 +501,10 @@ static int ak8975_who_i_am(const struct ak8975_data *data,
 							AK09912_REG_WIA1,
 							sizeof(wia_val),
 							wia_val);
-	if (ret < 0) {
-		dev_err(&client->dev, "Error reading WIA\n");
-		return ret;
-	}
-	if (ret != sizeof(wia_val)) {
-		dev_err(&client->dev, "Error reading WIA\n");
-		return -EIO;
-	}
+	if (ret < 0)
+		return dev_err_probe(&client->dev, ret, "Error reading WIA\n");
+	if (ret != sizeof(wia_val))
+		return dev_err_probe(&client->dev, -EIO, "Error reading WIA\n");
 
 	if (wia_val[0] != AK8975_DEVICE_ID)
 		return -ENODEV;
@@ -1030,18 +1026,15 @@ static int ak8975_probe(struct i2c_client *client)
 		return ret;
 
 	ret = ak8975_who_i_am(data, data->def->type);
-	if (ret) {
-		dev_err(&client->dev, "Unexpected device\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Unexpected device\n");
+
 	dev_dbg(&client->dev, "Asahi compass chip %s\n", name);
 
 	/* Perform some basic start-of-day setup of the device. */
 	ret = ak8975_setup(data);
-	if (ret) {
-		dev_err(&client->dev, "%s initialization fails\n", name);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "%s initialization fails\n", name);
 
 	ret = devm_mutex_init(dev, &data->lock);
 	if (ret)
@@ -1057,10 +1050,8 @@ static int ak8975_probe(struct i2c_client *client)
 	ret = devm_iio_triggered_buffer_setup(dev, indio_dev, NULL,
 					      ak8975_handle_trigger,
 					      &ak8975_buffer_setup_ops);
-	if (ret) {
-		dev_err(&client->dev, "triggered buffer setup failed\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "triggered buffer setup failed\n");
 
 	pm_runtime_set_active(dev);
 	ret = devm_pm_runtime_enable(dev);
@@ -1068,10 +1059,8 @@ static int ak8975_probe(struct i2c_client *client)
 		return ret;
 
 	ret = devm_iio_device_register(dev, indio_dev);
-	if (ret) {
-		dev_err(&client->dev, "device register failed\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "device register failed\n");
 
 	/*
 	 * The device comes online in 500us, so add two orders of magnitude

-- 
2.55.0

