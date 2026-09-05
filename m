Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0D43D3D14
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 09:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601093; cv=none; b=ijfTRvdiTunvrmmLDJ2C4wka0IJsDKMPU9A3P1mNrt1rNKdG2Og7BeMm9NQv1OIVQ4ktAk8mqSvNxV3onGR4+UabGWmn50/D6yCcDuDOOXkXpMPm7xrEG60KBYjGiu6XmMi4JIV9zrZtFWUMmbIC34r3hwObaJ2JigYe+vhlECU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601093; c=relaxed/simple;
	bh=/SnvANubHgj9t723fD3mWASr15hxcpq0LbaSmB4ROXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GRT+ODpa6Ipzc+5Q7fNhU/wApCAXuhP0Nf4c8zmbzEbTfQEJxgGzpGdyA5kese9A5eojslxlIOlHFAJZyCIlsa/1LauYNA7EqHpoowB9Z3Hfqq+R4dJoHcW/p8vL2N3tF4WLHqBDjLMboXhAf1ekPdjIO5Y82cRnpoVh8vwr+4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qFzKWe4v; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qFzKWe4v"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so2559227a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 02:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601089; x=1789205889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKhaAa1V6dcazyDIDdMRIu/saWb8D7tpQe+JyGNOhTA=;
        b=qFzKWe4v6mY7w15FxyEseDpJtEZmkYtf7jV7h5U8m2y3uoq+lAEAGIq68NqHIGWoXr
         3HJizsIOmFMWHvA6n2qyPY5rNsEUBIPQ32nOtVCUyDBQj3E6MhenCzQfQgFPRs7pFeFk
         5B05p+ZZ7V0oTumGQn3ZRB5huy5+euDIwP0YQ9+k3XVF2P7I35Ef9OTQq18AA7tQyOaX
         HOZBvuy9J3VNNubAu/FJWKkwBkd1LqvYiXelfyDhbOdwafEBfR5Cgiy2rLOHkQ3V0G+E
         q6A4aJDYYulW3wmKKHFDBR5aGQESEixBI7woiO52XNbfzPo6460I9jmuNCzzzPKAW3Ec
         l5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601089; x=1789205889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKhaAa1V6dcazyDIDdMRIu/saWb8D7tpQe+JyGNOhTA=;
        b=MQwP18nTXalETb8/601JCcLkXiwmzWwZWs8ueTusECLqgisasuc8KZ9/Oa0bI+G8lV
         4OBY98uhp0cYbEG0cLakiOKY3AkrPztkKDz4k4Kywnnx1SfI723yTyLX7E5s4E47wQ8e
         l8HAQHYKrAaDzPOOs5aVovbL5czgV7yB2NQ42hGS5/zE1ZA0touARkwJbOMkS2sjBGCL
         m0T2K1SxOc05li+7X6Mrq91vhX6Aumj7xwTfe7WkceYTYb9l8AjpCcnBR/gNLJ9RjVDW
         0GLTKuhXNavfX3VXYgilNvnzYBJZ+h8mVhEL15A954IalOOdcJK8+SBdZ8gBulRmTw15
         F+2A==
X-Forwarded-Encrypted: i=1; AKwUvBw9dmSvqVm1DQUgTwI2NKh048K3E4sFwsGklqPhRBww8pQPGy6z0zvD0qgIhsCo8IPWb8zXj0G5YF3nz5I=@vger.kernel.org
X-Gm-Message-State: AFuF++nQ2wFQTxJrrk6S0gaghva1gIzDRx/ooPeRMPi0JDHeCeRpVk+j
	PbBEVQPt097+tmz/wLAZX/NWkW+7MBANjGPTwYvOlMhHVHoVNgrQGiAD
X-Gm-Gg: AYBFou0ccZimZdrtsVAudKvlmIsiyb55vQoDAzoy5EkTC3/3W8zJrcnSbKbFgVjkit9
	FKKPpBxVHeQsrWAsI9JjIFn/MsP66mr6tW/F8HqN8vG6sTlm4fePw+A325WdJQ5KQAxCQ7xldU6
	Hr6I0fbOtiFPD3ku3kQrQgxdp9kCQsirXWi6/CtKTp7rvDRChlu3Cr9dFxpsa3jOjPlgbEZ5C53
	ZXM7U80MkD0GfOx4klLkw1Ysv6/cUwxxPECStuz474kWMehMKvde1QE1xbplJNeRANRCjmMJ/tY
	mr9JS3cEUjaJnYnPlYL8BQus70B3BXj1M69oWAIfuQhZpqEE5QNw653cOY1iZkIXiPefVMm5oUz
	JNBamcyDx24Zimm6O/qgC5QnrpyRT4iuXQBH38jiqjjnmuxRWYQaZEYuftetniNi1cx2oeaR1vF
	Y45asjjwv7vNgtT29r8yLzT1xH6F6pFHP6LuQadnKg4XNmbDuLz+visBmENA==
X-Received: by 2002:a17:90b:3d89:b0:398:9be8:ea69 with SMTP id 98e67ed59e1d1-39b262167e7mr19037767a91.22.1788601089070;
        Sat, 05 Sep 2026 02:38:09 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:5b5:60e7:9f67:1689])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d086adsm15763353a91.15.2026.09.05.02.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 02:38:08 -0700 (PDT)
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
Subject: [PATCH v3 6/6] iio: adc: bcm_iproc_adc: use devm_iio_device_register()
Date: Sat,  5 Sep 2026 15:06:31 +0530
Message-ID: <20260905093631.48667-7-mdshahid03@gmail.com>
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

Use devm_iio_device_register() to automatically unregister the IIO
device when the device is detached.

This removes the manual iio_device_unregister() call and makes the
iproc_adc_remove() callback unnecessary.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index f4676607682b..6eae7596ac8d 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -524,7 +524,6 @@ static int iproc_adc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	adc_priv = iio_priv(indio_dev);
-	platform_set_drvdata(pdev, indio_dev);
 
 	ret = devm_mutex_init(dev, &adc_priv->mutex);
 	if (ret)
@@ -572,19 +571,8 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	indio_dev->channels = iproc_adc_iio_channels;
 	indio_dev->num_channels = ARRAY_SIZE(iproc_adc_iio_channels);
 
-	ret = iio_device_register(indio_dev);
-	if (ret)
-		return dev_err_probe(dev, ret, "iio_device_register failed\n");
-
-	return 0;
-
-}
-
-static void iproc_adc_remove(struct platform_device *pdev)
-{
-	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
+	return devm_iio_device_register(dev, indio_dev);
 
-	iio_device_unregister(indio_dev);
 }
 
 static const struct of_device_id iproc_adc_of_match[] = {
@@ -595,7 +583,6 @@ MODULE_DEVICE_TABLE(of, iproc_adc_of_match);
 
 static struct platform_driver iproc_adc_driver = {
 	.probe = iproc_adc_probe,
-	.remove = iproc_adc_remove,
 	.driver = {
 		.name = "iproc-static-adc",
 		.of_match_table = iproc_adc_of_match,
-- 
2.43.0

