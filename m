Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611315187CA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790788357; cv=none; b=rIqLwPbo+P9Q4GAIQzRxHZCKXtThVzUWWSXogAZ5n2Sy/Crd4PpoXODIHKk2ho4TRLyE17HAFwAiKWpjmkhvdvZ1+J3JAfMm0Sd9rY9is+KPnJNMYgu3weXhRJsgjYxq7l48kgfkDQxwYy6o2SD4KuVF0S6GYH2E7XlBptkR7rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790788357; c=relaxed/simple;
	bh=vs4c7J9uwvqV0uHuQ1lz5HHxv6HkPh2qTseU5Eo3R48=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lxMXvuLXcPcR26Qx66CaHIyaUAkNpMsevwtrrkqqqzKRs35i0cKqvvCNuBH9O/tl3SJMJxoG5D/CW/mDMILGPS7CjvPu/h9FmQ/2JhWQZ6OwjoplUidAy8Re1dG+1y+18G2Fpur3cuUWaVYp8FcC7Q7tNcsyI3tWOCvXd1aHNM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IF9rg/5N; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IF9rg/5N"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-8805988a200so3683903b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790788356; x=1791393156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2alhO75hg38+nS/12HySrHAbmPDF5QmJOTBYPr59Do=;
        b=IF9rg/5NP5AMyG0zBz1ik6xEUzW3pN1UvxKV0tXavrS17BC3Ptoa44kO9h0D0OxR0A
         8M87id8wjyUqBsGYEVY1TcwIkXk38Nlxxe2Gr/oBwozZECagxknjSbuRCoy6yRYaDFr3
         o819H6rMikOzY9MZaVbvMC2r7tLgdyk3uNDPbJaFud6aQYW0tDQRLaFM5c+qJRC31jMn
         4TJ4bWD+l/au+hp3ucMldA/KwTS0GLpqzpQ6HAetZ+TdMW6xeUwXmGDhFcFQiFWeTpsk
         df67lBDEnYQmlrLymbkslKr24J1negnPl3makZCgvpAN/HNDG4jyFSUwaAWOyt5zgRCb
         eNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790788356; x=1791393156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j2alhO75hg38+nS/12HySrHAbmPDF5QmJOTBYPr59Do=;
        b=LdBGnplT9Wzvi9w9Nr3ZsUI8aWkYcjdeq8KXCZN5dpIGbvkc9dBEWRvikoY2mbVUKk
         1OLfdZv2bTm4h24DzLQ2vhmulDZ8rbWnmsqLk7NMWxsMvMOMBh5bWsHsvHPDOWxdVkDm
         U+IXtfIvhQESZjxhIJ4MrZd9QywVbbIDwctcjGqxHaQiaUuZkoBTKsmZWVzI1mU68QD1
         /vKsSAxSDvnsgFWfWRrn08yB8X7DVVGEuA/tBfC9S6EwVmcCmTD4r+I2cFDpPPJLsbtI
         FrrIy4YwJwY7DLYlo3NnmjDrCyWpg8qsS7AZlZBdD62d3+LdMvvPGJ/qqVDnQ14eWC3N
         ZIbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPbOgaXfzgUCpjeo4yLgmpnLYd0dZZlj5SWyL+vFS4kE7rNEE/Wj61Viu6JKHclZxo0CnZ6CuJilc8NLA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlEBHeMXXzOJjZYub2GIF3pZLKoEhQxEhze4Y/DSxxs814kAZu
	PsOG87HQeYjVQE4Ftx1MLkpJijMFLPNmMqMCamZ9QeeYLT0xBSUk/nNN
X-Gm-Gg: AYBFou0sIKku5mgmViD8L+RhRZu2ML1/YB8shbKnovFD85otPKEirTZDYalQgHO1aST
	+R1EM6POGkgN72ulwLIZY3epSrc7cc62tAGEFSfCfVBO+YtLFQk+nerRGQaRq8F5lbDKdtUFRuX
	PaDEtAXo8rC3tkWAumlYGU3AO5690NnQqqKcCzmPyx6Z4ktDxown3Kr6I/LvX6copiBYlK5qkKq
	vlbKYVVOBNoZ1o3JggqervveGTE9RaQM6qsArRMlqODt/AQRAdPE9OI3rnQSkyuStwqh4ZRDTVT
	czM6O6f18Hbi76Tuix+Bz2HB3SYlRds9B83Cz24gG8h67NQzSWEVjs9u0heqbLGolym4THYdyTG
	pV1XtEgZhgS4OnU3Y+GkT1zPJ9GBcclSosdqYFeliSEeGdzzavFbQGShTZEUfVizHaffsHJ9J0X
	EjFnh/DGBmK1SRuNXZ1FFSH4SV+BTWW4t48AqNZ1huPvJu7RUwKt+RwAUix3v6XhenTLERcJF22
	vZFrJXCPrbGFytj64Em/cVOx8kvzl6zmpBABLySVSSAFDhy3Xi7vSjMeQ+F
X-Received: by 2002:a05:6a00:190a:b0:887:17f3:94f7 with SMTP id d2e1a72fcca58-887472d4656mr1716681b3a.1.1790788355705;
        Wed, 30 Sep 2026 10:12:35 -0700 (PDT)
Received: from debian.ari ([152.58.182.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-887bc2bd404sm636872b3a.46.2026.09.30.10.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 10:12:35 -0700 (PDT)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	nuno.sa@analog.com,
	u.kleine-koenig@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH v5 04/10] iio: adc: ti-ads1015: use local device pointer in probe
Date: Wed, 30 Sep 2026 22:41:58 +0530
Message-Id: <20260930171204.12863-5-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260930171204.12863-1-architanant5@gmail.com>
References: <20260930171204.12863-1-architanant5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a local device pointer 'dev' in ads1015_probe()
to avoid accessing &client->dev repeatedly.

Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/iio/adc/ti-ads1015.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index 9479f110448d..85280200d050 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -944,6 +944,7 @@ static void ads1015_power_down(void *p)
 static int ads1015_probe(struct i2c_client *client)
 {
 	const struct ads1015_chip_data *chip;
+	struct device *dev = &client->dev;
 	struct iio_dev *indio_dev;
 	struct ads1015_data *data;
 	int ret;
@@ -951,9 +952,9 @@ static int ads1015_probe(struct i2c_client *client)
 
 	chip = i2c_get_match_data(client);
 	if (!chip)
-		return dev_err_probe(&client->dev, -ENODATA, "Unknown chip\n");
+		return dev_err_probe(dev, -ENODATA, "Unknown chip\n");
 
-	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
 	if (!indio_dev)
 		return -ENOMEM;
 
@@ -993,7 +994,7 @@ static int ads1015_probe(struct i2c_client *client)
 		return PTR_ERR(data->regmap);
 	}
 
-	ret = devm_iio_triggered_buffer_setup(&client->dev, indio_dev, NULL,
+	ret = devm_iio_triggered_buffer_setup(dev, indio_dev, NULL,
 					      ads1015_trigger_handler,
 					      &ads1015_buffer_setup_ops);
 	if (ret < 0) {
@@ -1029,7 +1030,7 @@ static int ads1015_probe(struct i2c_client *client)
 		if (ret)
 			return ret;
 
-		ret = devm_request_threaded_irq(&client->dev, client->irq,
+		ret = devm_request_threaded_irq(dev, client->irq,
 						NULL, ads1015_event_handler,
 						irq_trig | IRQF_ONESHOT,
 						client->name, indio_dev);
@@ -1041,22 +1042,22 @@ static int ads1015_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	ret = devm_add_action_or_reset(&client->dev, ads1015_power_down, data);
+	ret = devm_add_action_or_reset(dev, ads1015_power_down, data);
 	if (ret)
 		return ret;
 
 	data->conv_invalid = true;
 
-	ret = pm_runtime_set_active(&client->dev);
+	ret = pm_runtime_set_active(dev);
 	if (ret)
 		return ret;
-	pm_runtime_set_autosuspend_delay(&client->dev, ADS1015_SLEEP_DELAY_MS);
-	pm_runtime_use_autosuspend(&client->dev);
-	ret = devm_pm_runtime_enable(&client->dev);
+	pm_runtime_set_autosuspend_delay(dev, ADS1015_SLEEP_DELAY_MS);
+	pm_runtime_use_autosuspend(dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		return ret;
 
-	return devm_iio_device_register(&client->dev, indio_dev);
+	return devm_iio_device_register(dev, indio_dev);
 }
 
 static int ads1015_runtime_suspend(struct device *dev)
-- 
2.39.5

