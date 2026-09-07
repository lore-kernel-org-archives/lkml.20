Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2CB52D2A9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788813253; cv=none; b=a3vv3JMlya96BbHmBKDDsAOFQQdW02hpWlH2bqwD29e3PMMWAtrMKAOZ9L+JoUfkmQQCEy/p+5oc5lWtQmjT8GHnnfWR3zf9Yr/WUB7rjSaAdsSMw1zZ4+FOg6iu5k+Dagq+w5Cd03SOTnvpMONsF7SwdUji0MAAeQZMmAWuh8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788813253; c=relaxed/simple;
	bh=h/d4lg5ZYxoEb/eMlkOvsuPSaUhSgZ4AwspfCz0TKr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BwcAkh6Rgdy1lmRqwiFp2D6l8mnOeVgV98G9Gr+niMHJSbrSdH2deltzmQPeWhzIZ9ZtXbKBeRheAfsRgTm3Hux0hqAl0VzQROQc2y5gAjK1y/fZMkAmTxDX6otSNTNp8OMmIJSIQ0z/jDsZrD8iiNc+JkpYdMW/x+gCd7JOJ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pruSq4uD; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pruSq4uD"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47fe89fb333so2528966f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788813250; x=1789418050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wT2cQFs+SDhHO7xry69vOp9pKFSTK+W30fCT/siNbCw=;
        b=pruSq4uDV2rEv6eLC8hugiWfl39SUns4y/BuMozfJszlljaglX/Taw0y9gfYYnq0Em
         5wUxCfdUvCZksWI1Av3tNEXKNvSezSjbuIY+aWt8u8f8RwYxtGe7HblWydiWsQ0q65FH
         FatK3ppwObVKIHGCa7+vWEoT1d4tSKgUEy8WPMCDuZevxrDdRzf6EvObrR4Pb2EClgiu
         zL3ppTF5qWYlLzfOgAJwZzUIOPBijA4nNnB907gVuSzWh+lA65+IUK1FN49oGe0899xl
         4+lZSbz5EYuJsossVGsI+MdrQhEeLLHApZl1SQO+oPMmRpOczynb3bcqxhQAzSJCQ8zb
         tHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788813250; x=1789418050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wT2cQFs+SDhHO7xry69vOp9pKFSTK+W30fCT/siNbCw=;
        b=cYJFugWxewjOAypNAUyaXTUXuOdIXLU+3ywrLU8lLIHj3QntQsyqvttZg44UHE23n6
         e1lFww0Qh5vybONAiGMXU3YTGi+GamG2ZZxn7zxKJeQ9jIpBzXw+CBPVSdboXDErG1CE
         6+dqmFfTkTuOB9ShzWhkosNEROXtuoQztxdLCBGr0i/MspkpXyyVXaN/a3EAyItsqU8i
         HXgOocup7lzN7fGfVRNnhnyae0acquWkboSr8M+bDpI+Di7POw1bE1YAX9Ozi3ItXS8t
         PtNA6hXui5wkl420mZ3AV8MVxVoTJ19txmqushac5K8tETePsbdE49m0KGHOmEAmmHjf
         R86g==
X-Forwarded-Encrypted: i=1; AKwUvByIAcbZF8Teb2ZUCKEvnmErpHS8x1m9IM4RSN4InzRA1eAMnkNxjpRKucsVYKXguyPVdKyJeL1qaz1+sW4=@vger.kernel.org
X-Gm-Message-State: AFuF++kra9fqC9vITyDoljd8jMah8bI9ja9CT/YI7xVq/3a/XKebRXe/
	th9mRqwzSGKg2ErmgjqCRPrfzhkD9F5KzvYYFmCt1jmdG3H2jEFzvEp4
X-Gm-Gg: AYBFou2deKM5rCCMw6RjgRJnKvZP6dvNPUruCHhgsNaadZecpAvUjZmDqXkJlAqyI6/
	qHt0lfNnt2yNe06NrxWsR9ycB55utZVZ+2HqyvwQb/oyZichH7hp9UBWILrIAiblTAIHyJs5csa
	lwjQSWPhAaa9FqlleAcFceXqMYQAn2oLUFJme9Kadx/8D8Rigg5qU62CDEmrO2Uwv7coRbkaQ9D
	t3YUclhW3Ksatd0uomQDTRPOY301kQoWxwg6knlaZBMrO7PWldYkMebMypy2UjKo091wdHtRq0A
	30dCergKg+N4R3IuTPtXsxwCtCpFzEQSNwQzj/WxED9LgvvMyqVXn+RDoGq5dtNtx3K4OSbK+R2
	8Y4+7EMdOVB4fW01Q9/tkQWBnXaqQ6TZzKSWZlOVQGiJltEkrx3jlsnu6ix+No02iIrabLKKNl6
	12M/PcdxqhDI0DAbpynrcf2Ud4yasIVpJ0fW9J4uZxXygKXkxmJvmCyiHKqx8wFw==
X-Received: by 2002:a05:6000:4010:b0:485:96e3:3ede with SMTP id ffacd0b85a97d-48596e33fe0mr10881483f8f.14.1788813249786;
        Mon, 07 Sep 2026 13:34:09 -0700 (PDT)
Received: from antoniarch ([78.212.37.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858e239862sm25959116f8f.9.2026.09.07.13.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:34:09 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v6 5/9] rtc: abx80x: add irq to struct abx80x_priv
Date: Mon,  7 Sep 2026 22:32:12 +0200
Message-ID: <20260907203216.53192-6-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907203216.53192-1-apokusinski01@gmail.com>
References: <20260907203216.53192-1-apokusinski01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This way the irq number is not tied to the i2c_client and can be
easily accessed also in the case of ABX81X SPI clocks.

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 drivers/rtc/rtc-abx80x.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index 8f9211bfb7e2..529f63e024f8 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -135,6 +135,7 @@ struct abx80x_priv {
 	struct i2c_client *client;
 	struct watchdog_device wdog;
 	struct mutex lock;
+	int irq;
 };
 
 static int abx80x_write_config_key(struct i2c_client *client, u8 key)
@@ -305,11 +306,12 @@ static irqreturn_t abx80x_handle_irq(int irq, void *dev_id)
 static int abx80x_read_alarm(struct device *dev, struct rtc_wkalrm *t)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	struct abx80x_priv *priv = i2c_get_clientdata(client);
 	unsigned char buf[7];
 
 	int irq_mask, err;
 
-	if (client->irq <= 0)
+	if (priv->irq <= 0)
 		return -EINVAL;
 
 	err = i2c_smbus_read_i2c_block_data(client, ABX8XX_REG_ASC,
@@ -343,7 +345,7 @@ static int abx80x_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 	u8 alarm[6];
 	int err;
 
-	if (client->irq <= 0)
+	if (priv->irq <= 0)
 		return -EINVAL;
 
 	alarm[0] = 0x0;
@@ -949,6 +951,7 @@ static int abx80x_probe(struct i2c_client *client)
 
 	priv->rtc->ops = &abx80x_rtc_ops;
 	priv->client = client;
+	priv->irq = client->irq;
 	err = devm_mutex_init(&client->dev, &priv->lock);
 	if (err)
 		return err;
@@ -1000,19 +1003,19 @@ static int abx80x_probe(struct i2c_client *client)
 		return -EIO;
 	}
 
-	if (client->irq > 0) {
-		dev_info(&client->dev, "IRQ %d supplied\n", client->irq);
-		err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
+	if (priv->irq > 0) {
+		dev_info(&client->dev, "IRQ %d supplied\n", priv->irq);
+		err = devm_request_threaded_irq(&client->dev, priv->irq, NULL,
 						abx80x_handle_irq,
 						IRQF_SHARED | IRQF_ONESHOT,
 						"abx8xx",
 						client);
 		if (err) {
 			dev_err(&client->dev, "unable to request IRQ, alarms disabled\n");
-			client->irq = 0;
+			priv->irq = 0;
 		}
 	}
-	if (client->irq <= 0)
+	if (priv->irq <= 0)
 		clear_bit(RTC_FEATURE_ALARM, priv->rtc->features);
 
 	err = rtc_add_group(priv->rtc, &rtc_calib_attr_group);
-- 
2.55.0

