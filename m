Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243206;
	b=peWLOwZM+3opabqSA1wOW/OxXqeg9M2NNc2YmIt++dmvcYwMMRXOuAozqkSSxIudl3TH
	 FA2lCmk8GLkP20C39WnIfJEYQSVtaLf2yWoLNySob3ZU156ItTnRMquCGvE3ClGRsKZPH
	 J6Nd3/a7gsmvEA86OILsFfQcNVxJqM5C/RofL+oSlBTrH78bhBIlSSMy3m/JFMsstrVXQ
	 opaM5j3ddcnU8EcJ1ifYpD62h4OEizn8eeN1DfQ1lfUt+iynB08DI3VdU7zmVA7rAJavf
	 w1qiDYwfFZlB8ywCwZ+Y9mks/PU1qI4Bxw1C2Ixg1HJpZvh6DpBMJxZhEp0jgzj9Eaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CtPurh9nP5v6J/PdC9q4yr2Kpc3EGfiQcCFQ/T/qOS0=;
	b=CrC3wWrlshl5/jgTixsKpzrZ6XBnEKXuGtRsYpeDkjALgk17lgqYhQQ6vZpCWH1Lsnhp
	 CvOR/8GpXirV672SXlXl1/1gxe+X4Dkz/9ZjwddGNBeKJa159xR3PsLZeRbuj6IAl1QAw
	 CCQbFZqKCtIN9aH6V9btqgiG3OQtRmVY03oQkzbQ2UoNLFoCJ8RDz3Pexc2YXQXYb5kAd
	 s23XxZQN/WhQMnVxD2Kq+MZYqC75o3CUk0EteOaUwf+NBRIg9V83/LH/xfX5XabiFbohP
	 m22DQPYx+Ls0LVwUEhbkupteh6b0QhyYpNhCTx+SSHqAFAiXmWVvgsaPZzAi9TsdTug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rW2IJXry;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7764606A334
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7764606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rW2IJXry
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso540539a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243205; x=1794848005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CtPurh9nP5v6J/PdC9q4yr2Kpc3EGfiQcCFQ/T/qOS0=;
        b=rW2IJXryplljzSVpBK+vF6/UEzxH1mJzIXwF+fEmQU/u7lGfNxlmaEGN6VE4R4j6+7
         nKHZcW39AiqzCT6442SzW5qwBAOxD18QTcYBdT6Z/i7KhWipHBua4zCrpWvFk4RG2xDA
         Yje6RduYSFTNwQ0KkIH5PPZIoBOd87ucetPTUjwB3/qfsqkolZNZyA4Pzky7ZjI4n7/A
         k46Uf57deZBJ2WkI+27bgEji8QbksAe6cncYWQ4EpqawtZMZlu4uNA9pe4miriqsZowr
         6PN+qyv8UB2YpdZMcqiq2jDp/CCwNodM/2Gh4vTo6FV/ZhVuRcaHFISjWckEwzQI6A2S
         FCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243205; x=1794848005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CtPurh9nP5v6J/PdC9q4yr2Kpc3EGfiQcCFQ/T/qOS0=;
        b=duTRITHurG525BM7Gx2/tGXkT7ulwilx2TXrmQtuVzvsxYHRl5yykpp0I1Sdma4rS7
         Qdc+NEuRhG8q+hkTH8nOctxW1+N4t5+ieVOKzs+SAeijc9wOBvpaQwEvXgPzT3rMuVEv
         umIZhYc+1qWSVEV/+L85KW7bcC1DK97YQI2ejrUMr8LH7pE1SZd/dYRBeE3XPUfyWQ3g
         pAlYVCMfW4XSwVJ2g1T0DGmmaKm3wYXn/Sxiss+zCIUaRu5F89DriF7Wtdsza7Syh6VE
         si7nPpe/OZwY6uOECuLc23ZjnZMhDDon8hkKXkH3cay7IAmUpxpe2KqksdTKW1oJYL0a
         luhw==
X-Forwarded-Encrypted: i=1; AL+hErG5M6DpC0Dls5YaP35tvqj+fpl66ngNupFYwadUBA3HxbTWDI3h3H5aXc3ZCsTZm2IuraosAcmxNWZWAzQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bwQQUfJL2WokNJoReUiXnZAsh6DnxwMuF5tYLOKXBcS/j0ukH
	vBY+Ylhml8LiWWlJx99ZTicrzITe8hV3BDmRXaXYtj+EA01kCs+RQLAq
X-Gm-Gg: AYBFou2PJX8aw84HnP13OwW64Nft25N7adbTEHNVWnt6SmQ32BMJikBcnV8qaoNeq+u
	gYn+qdQl+OFQufZ4KzSOZLiEj8Ppd28D8NEoPvhp77peiYUMH/Vy8A5r332ZWRQQxnzpgQ8q71v
	c5bhk2UUqTX1z41UimHoovinjAxw16RN0R2YkmgBe/Xn67BQoHAOk4uDeVhqMZwceAiFjF4x2Wt
	6HrPt+f3N/nM8j8Nz4pZRSb0cQgtD4ary7BbBtSZx1haB8FJTgy6t5PDKvDPLbCshQnwYTHRLJO
	a8kXlFXCgVsOY1f0inN7xxx/BxBM25aDse6GBrQTNqZyF84BCeA5b6dl7aSC/YoQJ6oQ5gFudy9
	4xDjhMIts35LKb3s5/v8Aq5zQh/nuDxbn3U8yB0RzUsoD8fFcN4m31BXcE4vhYtMyqXzWlGdgB1
	kns32hUdgN9flVQ63h0+5Kb19SYEsJiwwXgH5+mY3Y/UZqeCeuF4OBVuxF3pBE8DrxhZ0VMxP58
	0mndd9hYf4oYK7Uh2Pla2VJJiEftiF36XZmYZb7LJsWDkNX5QpN2IQ4Fd8lskooqIPaRDrDxV+p
	cjJIJykAdmyv8J2fjOmIvtwj+gWqMEgPp+zQ0P5AeL0smmAf11UqRI46zKufcHa3Q9FKbOOI6wt
	4+x5XURW/vtaqstfI5MRnVSMzfQ==
X-Received: by 2002:a17:90a:e7d0:b0:3a8:5fd6:cb6 with SMTP id 98e67ed59e1d1-3b166a5fb0bmr262595a91.0.1794243205071;
        Mon, 09 Nov 2026 08:53:25 -0800 (PST)
Received: from debian.ari ([152.56.156.124])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1034718f8sm6455688a91.4.2026.11.09.08.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:53:24 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	nuno.sa@analog.com,
	u.kleine-koenig@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH v6 03/11] iio: adc: ti-ads1015: use local device pointer in probe
Date: Mon,  9 Nov 2026 22:21:31 +0530
Message-Id: <20261109165139.30803-4-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261109165139.30803-1-architanant5@gmail.com>
References: <20261109165139.30803-1-architanant5@gmail.com>
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

Introduce a local device pointer 'dev' in ads1015_probe()
to avoid accessing &client->dev repeatedly.

Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/iio/adc/ti-ads1015.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index 3c2f27f41093c..af3ba6b75c410 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -966,6 +966,7 @@ static void ads1015_power_down(void *p)
 static int ads1015_probe(struct i2c_client *client)
 {
 	const struct ads1015_chip_data *chip;
+	struct device *dev = &client->dev;
 	struct iio_dev *indio_dev;
 	struct ads1015_data *data;
 	int ret;
@@ -975,7 +976,7 @@ static int ads1015_probe(struct i2c_client *client)
 	if (!chip)
 		return dev_err_probe(&client->dev, -EINVAL, "Unknown chip\n");
 
-	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
 	if (!indio_dev)
 		return -ENOMEM;
 
@@ -1022,7 +1023,7 @@ static int ads1015_probe(struct i2c_client *client)
 		return PTR_ERR(data->regmap);
 	}
 
-	ret = devm_iio_triggered_buffer_setup(&client->dev, indio_dev, NULL,
+	ret = devm_iio_triggered_buffer_setup(dev, indio_dev, NULL,
 					      ads1015_trigger_handler,
 					      &ads1015_buffer_setup_ops);
 	if (ret < 0) {
@@ -1058,7 +1059,7 @@ static int ads1015_probe(struct i2c_client *client)
 		if (ret)
 			return ret;
 
-		ret = devm_request_threaded_irq(&client->dev, client->irq,
+		ret = devm_request_threaded_irq(dev, client->irq,
 						NULL, ads1015_event_handler,
 						irq_trig | IRQF_ONESHOT,
 						client->name, indio_dev);
@@ -1070,22 +1071,22 @@ static int ads1015_probe(struct i2c_client *client)
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

