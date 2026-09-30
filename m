Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415F64F3EAA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790788364; cv=none; b=ozpDeYZbsn4taTM08+WW5OrWoB5aYCBW+g3F5IZ+t7RRgKLQQzT/bsnVQPETq3qJhFApAhgDuNeQhkT29C0R1RsxtBxyf78QHvaSxxADKLxx8JC1YbB2SLKc5N4yC8UXqjBXC+gyNcni6hFumDXT8q6hhjCsjLXRs9lbgueXGGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790788364; c=relaxed/simple;
	bh=f77Xp17F3ryUSktbgkY9BYOv3VUPFlsynWUp9wiAQlg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EVT7iY/0WjQpsbfa6t4e1wE2w/kF7vVr9+DDvvFZOtL/FFEypQt15I1RNGvNfNBTil2rXYMwTXDKF1N168qWmqcVMli5OS0elteBP03vVaXLgzGUvlTZRvyRfWybPOblzpAOTQsEhJcJvRVhymK3Kle5cAFyOkifLVhaXGntzVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JBMjlHst; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBMjlHst"
Received: by mail-pz2-f37.google.com with SMTP id d2e1a72fcca58-8873070bcd0so409880b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790788360; x=1791393160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hwg3CO3tgd3nJolHxTuonw5jbIxyxt02qyF3nDmMd30=;
        b=JBMjlHst3E8DghQFnHJuwrlE+ZZkje0M71bfk5MOEvOV5qhew+AhHFuXRpRxMZXpW3
         y4yG/HEAPQ8YhUefJkOJzf7eHxV/PRrDLrVIzrA6rWvJsW/XUeBUI4mE7/7uUFE7xROG
         EQ8zBmDDbaUI1Bkkvg3lwEyTESo5bNUkq3/c5g3/Y+cJ3G/jqWrXYBZgLfLMn8emk3lO
         Icjh2yBXFKvfSfM7aHIpeX/HsxFFIuhJEYt+WozCdVfbC86Z++dXBd5fLhQwafFDyNBb
         Pr6wJmbl9dwtDD5jwug6YX/0usc10f8f4wbSuizcH9CnhrXKJbA4whV0qqaq0O1czkBc
         uGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790788360; x=1791393160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hwg3CO3tgd3nJolHxTuonw5jbIxyxt02qyF3nDmMd30=;
        b=2v+2hx9qh7AGJ/l1O4snd/k5XR9G+N6bruOxcnYqtoHFoArI5i1H9IVrQBc69Mh97R
         lvozcBTDn9lzhjxsED3W7hrgdU9oQDRnrzmf8cjDkoMo/g1kkiIU1lcNSJq7YII9G+Yu
         7rvDsMzYGgW9S2IBKs529olApqYJx2WH3KzHvTZ8KLnUaJiQ6i4p4BMyhlY4DrcxCQib
         Ke3gXmHhjmMAN0wtReAik81DPbIjCY6llvq+F1PNgX/4bcTEU2MpScQlTHLz0WGG7GoC
         5G8X1DFSV9tc6OrTRyLrdmjFzp6qjLFRTrDk1vD91DWQKuWvsitwmSeYSv0QCE+aNrvU
         0chA==
X-Forwarded-Encrypted: i=1; AKwUvBxASTIV5911Fhu2YlfpUgS59fTumphxAf7qxLlgl7lIhuKkClRO502pE+7FDpAIHdoAoJRqatVOnkPGhlg=@vger.kernel.org
X-Gm-Message-State: AFuF++mqgpTJdlwQpuxTBJboP4Z4RhBPqFS68R9iEmceN9jdV7Ur4hBI
	kzfl6B018+ScMXGc8GzVYRGp2gXvJaplJAprskCBUBVR8LERRV86IeQE
X-Gm-Gg: AYBFou1vdJJyyTPGt9FqCaJVNv5zIHenX7E1TpXiShaqMfbJI1OxAgUXBsLeBtyNZ0l
	KcfbleN58gjgtCi76sOihrF+dQ1YFhMSSFLnEe0Vkok5kmzRqxulInio9F/2BDyX/B9VR61/ULU
	ABa7NugbUnq6Vgkb+EN+4Hahq7q72qYsq3IOc6FySV27aszKr1pom7cqLcSL3Zl8KXWfcwN1b4d
	Ph2NlQEdHbcvn2LsnFZtjeruetuKiFf2DsVpGUM2F+eu7F/+MhVfWg943jFZY+tsixvbuyRJYx7
	+a9Fw6JygEjUjFfLrlX5KqZ33Nq+IZNM43F+VU24QJ0dXsD7ZAXdoUK4fTybAls3cMT+sO/EzLj
	bCYEOD/CPm5UD2LoDNiPPvMDZJutsKMQmPKf8Zql1tGb2vYBcaJQ/U95Exj8S1JyNfgJPylJsWu
	xvGqmXxAMdRdcTe7sOGwN6jpFRLlQSc8crVdtYEOUoytImwr3l9hrhchDfOsj0b8QqP3gcCz+WJ
	Tg0Cdqx+YjwRNXOXbezhdP/lu8fiKkJq2E/ximWyCZG+SVQlw==
X-Received: by 2002:a05:6a00:c48f:b0:888:add:a07d with SMTP id d2e1a72fcca58-8880adda0femr95292b3a.29.1790788360462;
        Wed, 30 Sep 2026 10:12:40 -0700 (PDT)
Received: from debian.ari ([152.58.182.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-887bc2bd404sm636872b3a.46.2026.09.30.10.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 10:12:40 -0700 (PDT)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	nuno.sa@analog.com,
	u.kleine-koenig@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH v5 05/10] iio: adc: ti-ads1015: use dev_err_probe() for error handling
Date: Wed, 30 Sep 2026 22:41:59 +0530
Message-Id: <20260930171204.12863-6-architanant5@gmail.com>
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

Simplify the error handling paths in ads1015_probe() and
ads1015_client_get_channels_config() by converting dev_err()
calls that are immediately followed by a return statement
over to the modern dev_err_probe() helper.

Note: This patch takes advantage of the previously introduced
local 'dev' pointer when converting the legacy
dev_err(&client->dev, ...) calls, avoiding unnecessary
code churn.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/iio/adc/ti-ads1015.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index 85280200d050..34d3d31b5ddd 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -883,18 +883,16 @@ static int ads1015_client_get_channels_config(struct i2c_client *client)
 
 		if (!fwnode_property_read_u32(node, "ti,gain", &pval)) {
 			pga = pval;
-			if (pga > 5) {
-				dev_err(dev, "invalid gain on %pfw\n", node);
-				return -EINVAL;
-			}
+			if (pga > 5)
+				return dev_err_probe(dev, -EINVAL,
+						     "invalid gain on %pfw\n", node);
 		}
 
 		if (!fwnode_property_read_u32(node, "ti,datarate", &pval)) {
 			data_rate = pval;
-			if (data_rate > 7) {
-				dev_err(dev, "invalid data_rate on %pfw\n", node);
-				return -EINVAL;
-			}
+			if (data_rate > 7)
+				return dev_err_probe(dev, -EINVAL,
+						     "invalid data_rate on %pfw\n", node);
 		}
 
 		data->channel_data[channel].pga = pga;
@@ -989,18 +987,16 @@ static int ads1015_probe(struct i2c_client *client)
 	data->regmap = devm_regmap_init_i2c(client, chip->has_comparator ?
 					    &ads1015_regmap_config :
 					    &tla2024_regmap_config);
-	if (IS_ERR(data->regmap)) {
-		dev_err(&client->dev, "Failed to allocate register map\n");
-		return PTR_ERR(data->regmap);
-	}
+	if (IS_ERR(data->regmap))
+		return dev_err_probe(dev, PTR_ERR(data->regmap),
+				     "Failed to allocate register map\n");
 
 	ret = devm_iio_triggered_buffer_setup(dev, indio_dev, NULL,
 					      ads1015_trigger_handler,
 					      &ads1015_buffer_setup_ops);
-	if (ret < 0) {
-		dev_err(&client->dev, "iio triggered buffer setup failed\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "iio triggered buffer setup failed\n");
 
 	if (client->irq && chip->has_comparator) {
 		unsigned long irq_trig = irq_get_trigger_type(client->irq);
-- 
2.39.5

