Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64A547D461
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787851324; cv=none; b=d4NHrUbfMfk9U+3pjuTijClKBu8vm0jEYEx7GWEHjU8i7buDnVVXY6QIMxekDY9A3fVsjijLALb/9RqcrTDOYbzAe3ZnjRqfrxAOSdIU+pY6KtL9tGW/wLgkWt7ow1J4y3lg+O4SWZvAhUrKReE98odtBXS6r5PpWr0bIXq2RhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787851324; c=relaxed/simple;
	bh=SQjMM6e5l1eXQ326406VN4Ppfu0Q1sDCfdFbTQj8lmk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ztd7r2OAS8UUYLPdjTfIUhDaQuaJogdDql5H9EzKkWAL9uCILhRQiJznNOpk21L4BT5R7FYqCzMyZQdbIcuTp+5CvYherLplDWYQvHUFN1creE6rwDkO3WQYBLC7EvH4IGJqjIUeE+d4zhrBS4vI2eWS3fPyRcWYqPUw+estY38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahecb6Lj; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahecb6Lj"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3965d3d9ab8so214686a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787851323; x=1788456123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zSPvpz+bFRPPrDJKLP2l884CdP+OIZCEuQCCyJqs4wI=;
        b=ahecb6Lj8hn7UHxE4gAGhXJf4rfsX/io5wMhKVgL6cRjm3Do3dzKWiOFmBDxSl56+f
         OqyWjJHSardnItpUllhAU0+LDOlmbJjIBPyx1QsKKCk+LCfSo95nimLYePBRX2Zbltqa
         fxoPjwOQ6zkTDwwee8HV9ogC6Q9OcO5pTZrba56M+Hq3DNaCPX6fvxTiJY7APDB0Fz5g
         pHQwN6ArnLWZxG1wFiinBBsRubsuDTH9i/B1cwhoqDwUHk8+kJbFN+jWIpgUtES1+JrJ
         giWSRmrxG9wxWkHNp3BemQwLIqyD6dCzOHe9YgPlpEwiJ7YcKoO8x+Jl7AhXycsMeBRm
         xVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851323; x=1788456123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zSPvpz+bFRPPrDJKLP2l884CdP+OIZCEuQCCyJqs4wI=;
        b=Ni+iM/qG7cd5eCSg6HVdDmc+bD2i+ZlEDiSRD3d8LkaQmz4J1EMBIii6ofhIqKkVYI
         AT4fY6oh46t6+Rm25JiE9zpimMNP12gQsXPOA0Tqn2Z4iIDneubtcqAUcQHA+q0nOSNm
         zTs8PaJ6IeLG5oYUikmUSccKdX1x9FiwDxg4yDcQ90fO5kcuwtWzqNdmVoy9005t+xO+
         kNwqn1dqnugenzT/VsvChNr5qzKJQpymRfl6O0BPFYWNKTuzHWbToERyYg7Qb5AmTz8x
         dy5wfyaw+xFdi0SnPtIugXVTkhwMCO+zaqyyWO4Jx0RZ+TIKPM21S8XbZi9yuY7zUYuu
         XO1w==
X-Forwarded-Encrypted: i=1; AHgh+Rri3P2o+tsoyYm3i3k26viDlk+kq53Z/zCR+Q8vT9bJaYzdC9qXJ5jA5SBlS95H9iCp/TOIztjpj+4n2XI=@vger.kernel.org
X-Gm-Message-State: AFuF++nvNjUnJkxRcVQwN2qOm92fBvFYr4iWKyrxAEBTbo5HCibl/mGw
	7GyZNvH5tcv1EV63hraKO8Za3t412q/Z37sGBGjhYlfIEzwIIXBG7LX/
X-Gm-Gg: AR+sD12JsN8xuPMuyJGjQe+jWkJPfS0ebFq4f2peF362lMhioXCiIFl0irqzqyfV1T1
	qnJERZCes59ED82BIjvzqrH+bq5VN63u5mXG7wjGlkzdwx9cl8b0dSU3pU4D7CfgienmBb1AHdQ
	BH6uMe39iIzPjsGYc+dQcPsoEPBSrYwxzaZsT8cdzN4rZtsiBow8zJtNMKdfk5+6dbfcLb1IgzD
	o202Flh1kn0N9bZsr8pNkPfSYRDJyJBw5gPfjKizlwvIFaWzlQQSktdEzM7aPz7Qi5owOH3ahGP
	AsWKgMKMZhplRdr+QS4Bwb+4OwCdKnCAV/DeD9LRyWFhmFB2U1KDA9jNJ7sGNx2XIyoTT1jAkon
	Iy25fcysscucHtuv6kGC/aDxCtJ5uQ78UA66AvPErPZtkhqpA9sOayXYQsXRDH+sP/wVWWrcYwS
	eLJC/v/oS/o1u+YtilgCYFW83paE5PAB0cZc7CwNpAncMSSDcXyjk7rN862GMkJeQ0e2ktUBcM4
	v6W0GWZjJUWNOdDM00XaeT6sb/nKhIRdKIg
X-Received: by 2002:a17:90b:384e:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-396d104d0bfmr1151199a91.15.1787851322882;
        Thu, 27 Aug 2026 10:22:02 -0700 (PDT)
Received: from debian.ari ([47.30.51.191])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8eedd13sm17797165c88.1.2026.08.27.10.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:22:02 -0700 (PDT)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	nuno.sa@analog.com,
	u.kleine-koenig@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH v4 6/8] iio: adc: ti-ads1015: Convert to managed resources
Date: Thu, 27 Aug 2026 22:50:58 +0530
Message-Id: <20260827172100.39176-7-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260827172100.39176-1-architanant5@gmail.com>
References: <20260827172100.39176-1-architanant5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use managed resource helpers for the mutex and runtime PM setup.

Replace mutex_init() with devm_mutex_init() and replace the separate
pm_runtime_set_active() and devm_pm_runtime_enable() calls with
devm_pm_runtime_set_active_enabled().

This simplifies resource management and ensures resources are
automatically cleaned up on probe failure and device removal.

Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/iio/adc/ti-ads1015.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index ba4a01850531..a6dd85debc0e 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -959,7 +959,9 @@ static int ads1015_probe(struct i2c_client *client)
 	data = iio_priv(indio_dev);
 	i2c_set_clientdata(client, indio_dev);
 
-	mutex_init(&data->lock);
+	ret = devm_mutex_init(dev, &data->lock);
+	if (ret)
+		return ret;
 
 	indio_dev->name = ADS1015_DRV_NAME;
 	indio_dev->modes = INDIO_DIRECT_MODE;
@@ -1044,12 +1046,9 @@ static int ads1015_probe(struct i2c_client *client)
 
 	data->conv_invalid = true;
 
-	ret = pm_runtime_set_active(dev);
-	if (ret)
-		return ret;
 	pm_runtime_set_autosuspend_delay(dev, ADS1015_SLEEP_DELAY_MS);
 	pm_runtime_use_autosuspend(dev);
-	ret = devm_pm_runtime_enable(dev);
+	ret = devm_pm_runtime_set_active_enabled(dev);
 	if (ret)
 		return ret;
 
-- 
2.39.5

