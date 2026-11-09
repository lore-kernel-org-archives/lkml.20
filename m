Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243194;
	b=WOHVL4zx/o9dURuC0ck4JxQQS5G07qszIhHTGQ2dfVHh13PzJ6Ondy8xo/wZQjrKn7JH
	 CHCZdkpbXNltyECsHbIzK+KVU1zFBaH8e88xWNcwBfVjkGC0bOwP/B/7LPN485c4o4Ri3
	 aZIJVEhFP1Kvi7lEZ83nb4Yx/DrJ1oBijV/tNWiekjJYv2Uv3Oc2NHjlvaol/IU9hQXXe
	 c8ONbbyjFPfE8tgy+xM7K+YOgjKp+H8Xgl8xIeR2IBl0noU3mOYsZzjcDHKRiiyOvJ5se
	 PTmoMkAXmyOsfEuUZi0ah7SIyNktKFGlGmHvdGYjDziUZBlj2YZQ5bjfjyz6UdujXCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iW5Y6DSmv3mo4M8j1f3fncvFLgJhUVoqDVLP18y5N8Q=;
	b=q5X0sGOTf2KVQn+I+1f8wQIdX2jzThEXsmCYnjGnKI09M4waBxYY0eFWICRiDu2R1yEV
	 OBv0sK6y00hB/7pUcvBbb00HmSQ2c8mAQ/Q71JYnt6VafnSQ0RKp0n/DnVgDdeybIC0aS
	 T09+B2OXtALX84OU8Y0BwiEGsQvoe1XjfmTB7p+H2dNfXy73QjCThBYxci0dU++MRbBCe
	 doHxq+qpyYoT3H7CzaiTPeTryR/Llu0ozTfjgtz+Wyr9T0XZ9Q4tCjwka7SqlOyxEEzPb
	 vZCZYMGYaJgZy6Ktr28dY/xtn1K9IlZ/jPeYHib7ZrSXg/bMm2XAV/jXsrSDXULZUiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s4i9hlp1;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C92D60A3811
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C92D60A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s4i9hlp1
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so576218a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243193; x=1794847993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iW5Y6DSmv3mo4M8j1f3fncvFLgJhUVoqDVLP18y5N8Q=;
        b=s4i9hlp1/qJM1+WFUAFoVfuVvOCSAyZ0m5tykRk8wxkgojTOUiihpd918olM8kox63
         0ZshFTCcqk4sKZg007UaKq/SmZZUE+snFrJKhibDahsUnQP1sbv+uLCfjzpFIA06cfCD
         1vW/UjUUr4/L/yMfQbR7X0odHyUrpGZbov7tvreksP0LpxftS2yG1ptLuPFKu17koZkb
         wIcI6uw268r4oDqG0JyWuXrgrPUJp7fdIOy9qdQIMjtt/AIq1GRXJ+xcCuqm6/8iP9UM
         sVRLqXnoPS/evm3q9X+TIQibNbDn5nEp7LMzQ0CwrBxr1KKtgEZNvCiMOUqmVOA1DK3u
         Qvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243193; x=1794847993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iW5Y6DSmv3mo4M8j1f3fncvFLgJhUVoqDVLP18y5N8Q=;
        b=XeVUQNXP+2SjWqqXNLcxkFpbvWKonpYHDDg6J2AjkaIqpL1XC9YKoCeOlggsHSrzno
         ch5iLeQbsP8hUZ2gPRgjlttF8KE6uKPLe2yxVO1BXW/onym2ZaxIwkE7JXjqn2Qha52b
         NBWfUQ92eAg7bFnEgH764/jophKl5vk53tgfxDoSVmlFf4IcUVhoMX4nZTjwp2CrWOsM
         B3tVCdI+g/YGpzt2f0B/0dS0fdPkXl1LSE/bmieTfp1AGqicxI8mo/j3nbYbx6Ww/jeU
         ts+VHbeTiwmrZLgxPMq8qO5CYZmwKdZvfYqlLmA8VLJAY8fqTgUOWCJuX7Coa+HP4+sX
         gbbw==
X-Forwarded-Encrypted: i=1; AL+hErF8JER4HKRP/sSFRDMz/s2sSwJOkpKhkHt1jWKhlTsEoQ5VPqcTxa81FczpQbEubl0r3s9pF3G8o52sWjo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NTUmu/FQcwJgJnjUXn2s+wcW1l88GJVW1wkeDm0qRSUuaIZEf
	D+y25VZlAtwQ3YyW/g/b+iYSoOWAO6dROfemyZq6ex4CBxsox/vxuFXc
X-Gm-Gg: AYBFou05r47vW0iOoGis3dKriiY7yOfsgyrEq5/s2XWNZ5Uo07J79OagExaYFgxWdjV
	H0RYC6DAWGBb5Y3kMnxqtCZlmeQZMPGPzX3otOiGmWzapkikRQDFWRQDw9Bk8CskObm5IyHO9mC
	70SryM5uj/36G4vyldQtB3Hbjh7cKlccmJ1k1udaErzAvwcqCL1bWc3f0oLPPhwbmdSEt75UayW
	SvPJVSGcdz5xda6zafmaQKIPHli2PRIHcZsWOK1c0pD6uq2jzyClOhFYACyJhs8XYiwD7KFScpV
	F3jRSlH2KcRAPzefEE6aYKPPNqsGW9Kw2D+3KqAbpJOAXJudJNF59XgwE5F2UTZ18lSTSXSUk7k
	XngRSAwT7AcuBE4VEUsf8EQ45ydWDXBXdmOEoyF589PIu+CBhVc3dkuV9qObGueu9MSh4pGQaAt
	TIU+0PBwpzz2EIMlD6li7UoVFIJirQdPjkZD3Id2zD26gvPLEWdW9jzwW8VJD1KiLtj9fC9zU/e
	UhSEUGW9PgcWlqID59Y5ZYB8GGmARzUDjYePfoN/mGXgZC6uzFBD9/JpWWKyQ6kw5Ura6nL/2GW
	grHK4qqIOeFS8SrtnsD1rm7jPXLLJJTne4A4Nb4NahpgQnNz03KhVloHHDEX0qa9VG031zmOuDj
	SQpqa
X-Received: by 2002:a17:90b:55c6:b0:3ac:4291:f569 with SMTP id 98e67ed59e1d1-3b166ae70f5mr249394a91.8.1794243193329;
        Mon, 09 Nov 2026 08:53:13 -0800 (PST)
Received: from debian.ari ([152.56.156.124])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1034718f8sm6455688a91.4.2026.11.09.08.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:53:11 -0800 (PST)
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
Subject: [PATCH v6 01/11] iio: adc: ti-ads1015: use DEFINE_RUNTIME_DEV_PM_OPS()
Date: Mon,  9 Nov 2026 22:21:29 +0530
Message-Id: <20261109165139.30803-2-architanant5@gmail.com>
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

Replace the deprecated SET_RUNTIME_PM_OPS() with
DEFINE_RUNTIME_DEV_PM_OPS().

This also configures the system sleep PM operations to use the
runtime suspend and resume callbacks, ensuring that the device
is properly suspended and resumed during system sleep transitions.

The new macro also handles dropping unused functions when
CONFIG_PM is disabled, eliminating the need for explicit
preprocessor conditionals.

Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/iio/adc/ti-ads1015.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index 0f9244107c6dd..7211cefc731d1 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -1089,7 +1089,6 @@ static int ads1015_probe(struct i2c_client *client)
 	return devm_iio_device_register(&client->dev, indio_dev);
 }
 
-#ifdef CONFIG_PM
 static int ads1015_runtime_suspend(struct device *dev)
 {
 	struct iio_dev *indio_dev = i2c_get_clientdata(to_i2c_client(dev));
@@ -1110,12 +1109,11 @@ static int ads1015_runtime_resume(struct device *dev)
 
 	return ret;
 }
-#endif
 
-static const struct dev_pm_ops ads1015_pm_ops = {
-	SET_RUNTIME_PM_OPS(ads1015_runtime_suspend,
-			   ads1015_runtime_resume, NULL)
-};
+static DEFINE_RUNTIME_DEV_PM_OPS(ads1015_pm_ops,
+				 ads1015_runtime_suspend,
+				 ads1015_runtime_resume,
+				 NULL);
 
 static const struct ads1015_chip_data ads1015_data = {
 	.channels	= ads1015_channels,
@@ -1170,7 +1168,7 @@ static struct i2c_driver ads1015_driver = {
 	.driver = {
 		.name = ADS1015_DRV_NAME,
 		.of_match_table = ads1015_of_match,
-		.pm = &ads1015_pm_ops,
+		.pm = pm_ptr(&ads1015_pm_ops),
 	},
 	.probe		= ads1015_probe,
 	.id_table	= ads1015_id,
-- 
2.39.5

