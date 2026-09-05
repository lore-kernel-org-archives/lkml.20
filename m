Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A141F37D11A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 09:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601065; cv=none; b=Xt3s1Y3LACaepVyP4hkr/MNCd/e4cZNXUXu+XWuw8VXDGI91DSpXbwZck9+MJDZG5y+IUwD3SVezOKqvTWUDpV6eDf0uBgh4rIBEbIU1/t0gy2mubbLAR+vaN0rTcSTGcAtrG53XrSYREWfTm4QiKg13RAJYoWd56A6ZfaCUbO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601065; c=relaxed/simple;
	bh=ksZpg4YtS2mtCV6zy/VLeMiRp4B1dHYEiUMBm61k9Lo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dj4avR2bl/xMx11cOI7Dx/2Wn1HF61JLz9509hMBssf9dVFDHAqNOqJQxfUsIh1kuaFo7tjF2aPYaK/WKtwWWxyK8O4q3WPk7Msuixckk0+wjBNfe/4G3RK6lIA1WqWXObrS83q2IAN+tWbhcSyAweq1OydCdlV8MgCPnZpRF+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GiEwRQ9K; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GiEwRQ9K"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so2649155a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 02:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601063; x=1789205863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQgZhvROIqcSSraACFKP6/ol+N08WZO9uWFrqbiZaYY=;
        b=GiEwRQ9KRixr7zUiDarGX6vYNRSWjRvfA6P/WKi3YC+h49Rq6ZtS7XbNvoLb7a25Nj
         l6k9o8mYbQVqsy5hQM1PLrJd1AuXi/JhPxfY1JUUmnbfEn1JBnVfFWhWWcrDbG3AQRq4
         dV/3CWAYVP15WhfGsKCbAY4JgGwbzl78rzTNfiirdpr/qaA2XO851gqiyGxOr+gidGih
         ME60pB18zWQjnpE/yiKO6ov4zyjJVt/MBOkipUM+DAtqgmm1kVHbuvn0aySFEZv0fJrJ
         H0EdKWzTdncoJo+si7eOVV/zSGU9Q9ibDSaj5yY71+ueuRglfi2yG7GylFHUbxSC4CJu
         JaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601063; x=1789205863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wQgZhvROIqcSSraACFKP6/ol+N08WZO9uWFrqbiZaYY=;
        b=rO0cQ+xMYnnl7MBgbtMi5hnLfAiNjKqIsAxnLqsGKnDcPOzoyjAaJNIjrrhCqNuvWw
         7Wz2AD0x37YqzDKXLxg7zudZd8RFRPK9yfELarwgRNLGEDkS+utuE3atsurETIBZwRs2
         BRs8gOuN1xRyPY91BsesXWbwgSB0JIQJMwHtot1+5qUeOISm8WeIivZr9d6cN9Gpb+wl
         UW2RxotwMVYeB5idCUgGqvgNWTQ3lMTJnT2O2iDk6v2PljG4P3Kns6/JCNh/KRcr11Ye
         R6oYGDOsqmnKRvIWkYFHbIechBPryZtQnqXK84GpqAEvWcV4m016rVYrPtqAKkQ8m+GV
         MqQA==
X-Forwarded-Encrypted: i=1; AKwUvBw6X25ZiouRGJ9G/XVyzg0P2Ul8zXrlGgnwY9CeGNnSHpdPrKXdzE2arA6Wml9u0NspcjsClBSON2TSrps=@vger.kernel.org
X-Gm-Message-State: AFuF++knhkZ+DwGBal4PR3J6S4G6+FCyyTTnZ3zFDNWsVnG91E1vAx3e
	vDQ0dwWIiqwydLxnbupWw1qA/Q1qWsH5wKqVZAM84OKdOOfNV6BaJj7b
X-Gm-Gg: AYBFou2Gfwh0w/pbNhGB4JLuIhDKyQOm01ynXhrgoyS2fA7VKg9xU2MrrpwSIV9XAy1
	Ty63ElPBniPJ0qsm4xeH5aDYEM9O1d5FFQj3HCcZXgjijtqO9v13RjtV9nV66tFnlZCZRFz2kDI
	xc5HWPmk2MI0KDeDmc/eJKxXDf2kiJuUUvWISU9WHASasrjx7QSK5UUfhf1hxxPaLOBsIz3Jtcf
	YJOhiAIh7qNFBv2K+pbrx/1tuU04Dn1u4yxKnyNAnIzUc+83C9OCVl0yQwmesYSVvIfvKJnv+IA
	xg3BsOwbK+6JFy6Yu/zDDsmV1X8NQpOndk/ZaPIMjPsfoDF3TDqHUe6KhlI/rvRA6SoknyqJdLY
	4OkUr/BQhfezSKGHUj1lJJ5QpjkFnHcV5wuoisfceAM6P2zW7dJx4OzWll1LpLPc+XOCLU2tq0t
	5fsIDYw4eVzEFw9qj8LnTfS+pGsW8ZeKz60yzcLlQX5PLgdx0/nql8Y/lvbQ==
X-Received: by 2002:a17:90b:1d4c:b0:38e:6d55:b1a6 with SMTP id 98e67ed59e1d1-39b27c121dcmr8907641a91.3.1788601063050;
        Sat, 05 Sep 2026 02:37:43 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:5b5:60e7:9f67:1689])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d086adsm15763353a91.15.2026.09.05.02.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 02:37:42 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v3 3/6] iio: adc: bcm_iproc_adc: use devm-managed clock
Date: Sat,  5 Sep 2026 15:06:28 +0530
Message-ID: <20260905093631.48667-4-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905093631.48667-1-mdshahid03@gmail.com>
References: <20260905093631.48667-1-mdshahid03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mohammad Shahid <mdshahid03@gmail.com>

Convert the ADC clock to use devm-managed APIs to simplify
resource cleanup.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index e54f613d266a..3bbf814d4c8f 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -109,7 +109,6 @@ do { \
 
 struct iproc_adc_priv {
 	struct regmap *regmap;
-	struct clk *adc_clk;
 	struct mutex mutex;
 	int  irqno;
 	int chan_val;
@@ -510,6 +509,7 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	struct iproc_adc_priv *adc_priv;
 	struct iio_dev *indio_dev = NULL;
 	struct device *dev = &pdev->dev;
+	struct clk *adc_clk;
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*adc_priv));
@@ -529,10 +529,9 @@ static int iproc_adc_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(adc_priv->regmap),
 				     "failed to get handle for tsc syscon\n");
 
-	adc_priv->adc_clk = devm_clk_get(dev, "tsc_clk");
-	if (IS_ERR(adc_priv->adc_clk))
-		return dev_err_probe(dev, PTR_ERR(adc_priv->adc_clk),
-				     "failed getting clock tsc_clk\n");
+	adc_clk = devm_clk_get_enabled(dev, "tsc_clk");
+	if (IS_ERR(adc_clk))
+		return dev_err_probe(dev, PTR_ERR(adc_clk), "failed to enable clock\n");
 
 	adc_priv->irqno = platform_get_irq(pdev, 0);
 	if (adc_priv->irqno < 0)
@@ -550,10 +549,6 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(adc_priv->adc_clk);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to enable clock\n");
-
 	ret = iproc_adc_enable(indio_dev);
 	if (ret)
 		goto err_adc_enable;
@@ -575,19 +570,15 @@ static int iproc_adc_probe(struct platform_device *pdev)
 err_clk:
 	iproc_adc_disable(indio_dev);
 err_adc_enable:
-	clk_disable_unprepare(adc_priv->adc_clk);
-
 	return ret;
 }
 
 static void iproc_adc_remove(struct platform_device *pdev)
 {
 	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
-	struct iproc_adc_priv *adc_priv = iio_priv(indio_dev);
 
 	iio_device_unregister(indio_dev);
 	iproc_adc_disable(indio_dev);
-	clk_disable_unprepare(adc_priv->adc_clk);
 }
 
 static const struct of_device_id iproc_adc_of_match[] = {
-- 
2.43.0

