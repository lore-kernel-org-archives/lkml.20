Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C89E4FC8D1
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015503; cv=none; b=dwWTI7J7EkbxtfrjWh+pKW8lXocAnwcqT3yQ1Z3kaGawI2zPNeqJCTQUG/NE92syeL/UDkwZTwcFWNO/RufJ6epCs9eR9hA0z4lMOxdYBXd7WalKArhQwm02Fh59higjroiuiGlR8LE5NKhENQbE/3Hw8eqUSbsFynsesMJ76Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015503; c=relaxed/simple;
	bh=Yj4RwbCvi7B7lQgZjaL6AuMOkRGQNU1rLzNzZVSRhLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kqPZ4Iq47o4VPC93aaQEn4DmI8KJOmky0AoQeQrMfa7THFxvPdH+8eJ8HI/jyIv5mC5i7v+f9KeSWVEaN8q03U5ynLWBomRW3IWvEVOaO0XN8pK7UKnHbQ4fQR7YYnqBUyi8KRpiqMH1AVGgYh5EQHloq7tikbXsfleRIBSjdGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1v9rFGO; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1v9rFGO"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5d0ad9b89so27011831fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790015500; x=1790620300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bIjQv3Ni12nKKfUqhl2wfffLShu1iZGR3QKWNIW24Vw=;
        b=k1v9rFGOq29JfAvVic9zrYkqG7bvrAzTjwUe+LiiVzJJc0cCBEKDU0GahcOmFPq3xZ
         IajVmL3GibHoWavmbvxkX5bV2ExYunqq9p2tIi8hN5/o4WAAgQ9DmCzia3f/hf45sTfe
         W1x0JU3VEkbS/qUH1lhzThQbXF1Bt7L91K6K52WbBhKnIVut4SPCpZBJ3wFr63RShpju
         yO92jY49YqvV8ScMAvvfYJCuX8oyX/DtbDDrOZJtICTB+OitvUOnBCzwFvMEothRq8XZ
         SBnBu/NbTJDK9pccFoh2jt31OOtEWbPgWbj0y5gAYwfZpREuAItsYoGJOr2sypuu7RcO
         8C0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015500; x=1790620300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bIjQv3Ni12nKKfUqhl2wfffLShu1iZGR3QKWNIW24Vw=;
        b=M4pBSwci+aNEy9N8SR7h40WHKp/RCLy+M/iAw7SvzEfTHKpZFt55Rak8SLsIRly7J6
         pHWsD6swEIH2i0R/jNKfx6dONiwtyht81v2wmxvUdEpRLcgukXPtuNZYHEmXVdEaWEfe
         0Wg2cRU3VB28zg6o3aBc0brIMGUWKBQYcJ/NJ+yTaY40Nbr5+WTv3tInmtARCbfb1m8i
         u6p3vKoRGFjuGqiDv87ncNubqLCW6T007ADGQWLnC/LcYg1XFruYMRM43ueD5xL/yNhk
         OV9/bRuSr37r1qY2Q1OdokbPrfy7mPpKRc3qVjcL0PTmV9oYu+g7hHV0SxCkmN5+yqZ+
         nGpg==
X-Forwarded-Encrypted: i=1; AKwUvBxUj5Nd8VLUUi3zhjNotFpXD5EdSKt2xPVnw/ZXXFFbCA1UW91Jfdq8GMnf/b+2tvb/IShshIbuFAFOrp8=@vger.kernel.org
X-Gm-Message-State: AFuF++n27+PiLUDsiwuLO0j7tmBJSAi24uE1i+hBUjrpgKno0iGw/M7F
	WdCLIUPNRoCq5cRzy1GXF7ZD4Q12ruQLIMOr4wD/TimvmQFjOo41Rpih
X-Gm-Gg: AYBFou38v1nQtin6SQPj7Zqj/Hp4q1A9COo6uxwKP8gl8qQFNn/ux/Bp78FMxuoqlpK
	X4g8XWGtHpre2nAFHeNRlJcnzO8hQdpqC8vmV3mzWOBVeIhg6demC85fH6K1xoZm8I3DmTUlho2
	30Jfg7eoT5iv9BaVSBhaoW3UYNf29BY4aIF7likBzLgetYA7TqGrqqJIeYJIykY44OlC6lgt/zq
	MXlc88Am5/gCCfCPKAfo8GQ+C3SdrxN/bfULvUUXIwcvUbAgU/5YbLSycXrvSoWASwIYjLJO3kc
	lA8g4hpXBgZe7q/p8AWvdC4veMBr7JLSfbLyayzjIvuH+cRpI7bYoW2qMHMa6fXD/6u86Uy7BeA
	/N5P9g3/8e0iobIWgA82QhvAQ74s9QqsnMeA7geyxdOqugErdvWzER/shp3cMdOAI1ggr9/fjLf
	Xy+jGOxRkmEtRuNNYz5SSm+x4AwyRcmBxIKQIf1x84RsSxYmiWdSUW26T4iRGkbEFSBTWvxTATM
	DUufO8NGv5XNBa8V8sWy69y7Xj8BVYRgeQGkYQFyxNHfe8wGCW/+/90L88Qcv+V/eXjsZGKUhkq
	20bc
X-Received: by 2002:a2e:a812:0:b0:3a3:74b9:8a7f with SMTP id 38308e7fff4ca-3a5fc089db5mr26899541fa.24.1790015499454;
        Mon, 21 Sep 2026 11:31:39 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a60761e5d6sm24260141fa.29.2026.09.21.11.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:31:38 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Jonathan Cameron <jic23@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH v8 02/10] iio: pressure: dps310: use a local device pointer in probe
Date: Mon, 21 Sep 2026 21:31:24 +0300
Message-ID: <20260921183132.233136-3-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921183132.233136-1-zoone.rupert@gmail.com>
References: <20260921183132.233136-1-zoone.rupert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

probe() spells out &client->dev for every devm call. Take it into a local
instead. Keeps lines short as more calls are added later in this series.

No functional change.

Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 35260b399390..bd7da4f12749 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -845,11 +845,12 @@ static const struct iio_info dps310_info = {
 
 static int dps310_probe(struct i2c_client *client)
 {
+	struct device *dev = &client->dev;
 	struct dps310_data *data;
 	struct iio_dev *iio;
 	int rc;
 
-	iio = devm_iio_device_alloc(&client->dev,  sizeof(*data));
+	iio = devm_iio_device_alloc(dev, sizeof(*data));
 	if (!iio)
 		return -ENOMEM;
 
@@ -868,7 +869,7 @@ static int dps310_probe(struct i2c_client *client)
 		return PTR_ERR(data->regmap);
 
 	/* Register to run the device reset when the device is removed */
-	rc = devm_add_action_or_reset(&client->dev, dps310_reset, data);
+	rc = devm_add_action_or_reset(dev, dps310_reset, data);
 	if (rc)
 		return rc;
 
@@ -876,7 +877,7 @@ static int dps310_probe(struct i2c_client *client)
 	if (rc)
 		return rc;
 
-	rc = devm_iio_device_register(&client->dev, iio);
+	rc = devm_iio_device_register(dev, iio);
 	if (rc)
 		return rc;
 
-- 
2.43.0

