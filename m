Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058E33C09F2
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 17:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788109850; cv=none; b=XqKpceTFJqTnFmw/OCT0kMfQwAVCN2HQYIVlIbQTXDPJODMXXiFMDQCTZBfmr0KkY6e6wnpYwf1lXr6p1xiTFmQyzAWXC0Q6Pzd2uTYLxY2Ge9LM1fgdoOswlTv0RgcSw1d2PTOiB1bJ+4YPMlQvF3ITUvHKTTS0cs2p8KP5PHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788109850; c=relaxed/simple;
	bh=sy8BZryh+VKv74VP8uHYb984yUyfJh7wIVMGurHwjnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H8ekQggh/3NmEzhODltZSzMc6Qk9TNqAI+D3oIRiAtnfIW44TLtONKJqydAbwiWJKPurJ4iLwE2NMdv3ygltgaJMpJ0b9b9eQ6mqCpylKPuuNigfOTEWaW9jH8McEMBjg696JsHBz6MDI/8llRYJMKdpu2yHAy7QqZXUg6vj0cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHgtMmR1; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHgtMmR1"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so2617825a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788109847; x=1788714647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+GRZL0uxq37pp9qHzlDeSvEEyunsmZeKfcXgUqg4T+M=;
        b=IHgtMmR1e28ozTFPzIVA2Feyxf74vjQZouzJ+OZZNKEKAOWUxNkH39HPj4o2TYl0Pv
         OWMyiLgUQJYCwNpjDPSum+bszpMkZqgv2YPPbx/BEDrIeFa9VRp+Fd7ahkdcCGoY8uE1
         Gr0Tk+08W/Y7hWonPnBuwpEDSyM21a21bg2GjUfs/Ne7b0DtKmPENb+iX96hrxfL+Dom
         X/1n75ZvQYRqPsH/jGTcBoq2F5vfUdXfOUdZ8UMhv5YgssMwsnJVRdG0XAYlXBYgHC4+
         T30rytVKcephGN/CJlju0cY5U3ln3tY/Jita2GmDhejeFPD6JtQ0e+6zt2HCl4rEgFP/
         G+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788109847; x=1788714647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+GRZL0uxq37pp9qHzlDeSvEEyunsmZeKfcXgUqg4T+M=;
        b=r0V1aJJtQBHQ77e3ZsOTMoFzaipWmpIEmxzdcFz74m9h9uOkru8+kIm3YYEJ6zpt3Q
         Lpc72+Zp66cLz+1WbVjuKK8O4jx4UKWYoyXy+6m9mo5EoDcCcNz7f8bj9wiVuraNxYiN
         EoWKZtgZHv076SBH551JAiOAzBU/6PQ2h9VJvzvMmrCUawHQI+flzymWhXI1g3nyPaBu
         JdhP3IgMEVAzJJc54zFH1FCkYAfcTBi5jUOchefKqR17ufgZnigIpt4KBCS71ssX4ePH
         I88EcmMCD2NgKeeU8NW023H3AcJLg2fZqRZpR3ynTf9LKRDo/bKGUcFtTTWWK8+vhXHR
         EXOA==
X-Forwarded-Encrypted: i=1; AKwUvBzxgW8aGY4XhEakelRhKwGzmo32zhKypZbzFB9I+AWK8n3mB43+FMjWtM7U/5+QURFes7XwFWatEr9bU3s=@vger.kernel.org
X-Gm-Message-State: AFuF++no8TCJ+RnOrN7lmceU7RFnXNHgiDLPWineq0BZeu9oISPBAyls
	Dx+Q3Jlm/fnHS6+U5FVRmQoLasevv4vhOCG2wlGlGQIjMfIHr/1DV+gU
X-Gm-Gg: AYBFou1ZIMRm2mckeEd5jOUjLA6fwSu2Ix9t1CnnyFnbw1L0F1RdjOoOJipnbSzrSRW
	Y/TGuqmQOQwuHJkg6imbShtcsPc+6Wti+2alK7V4Cep9RsuGDX30bNQBwveBabzER8jXgxbHgVB
	fUZDohVDFHx1klv3TjQkbfPw61xSqd/jJwYsIqf4y+udPrzzfcIsfTvuNbcSDelqJseKdBgDlCe
	xFe4jQknKzmSgQnNaP95+0aolNFxJFywV1qH5VsEjXkRfuUnVjraNg0HpXwHnxO+7mN/yJvoGPy
	D9QAGMeVndau8nMaPzxzqwSG/QodZ4KuMIBpJjYosTiOGvShotRHBsPAh1axgrXa4xHeLuaBE2i
	QP5YhTW2aqK4PPOnVtmlIBd59rDzCrusRnMrTb6Vi4v2HfTA2Abx2aXW8kE9A/R7N8JRQZ1tlHi
	KdrYILClbBChEMgvMXWTSd0sMfxjFpli3REoYQABg0jgPhXvoze19xVzNicg==
X-Received: by 2002:a17:90a:ec87:b0:390:84db:888e with SMTP id 98e67ed59e1d1-398da62a9f1mr2503612a91.7.1788109846855;
        Sun, 30 Aug 2026 10:10:46 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:88d5:45ce:40e:490f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fcfa3asm17047101a91.6.2026.08.30.10.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 10:10:46 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v2 5/5] iio: adc: bcm_iproc_adc: use devm_iio_device_register()
Date: Sun, 30 Aug 2026 22:39:18 +0530
Message-ID: <20260830170919.470974-6-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830170919.470974-1-mdshahid03@gmail.com>
References: <20260830170919.470974-1-mdshahid03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mohammad Shahid <mdshahid03@gmail.com>

Use `devm_iio_device_register()` to automatically unregister the IIO
device when the device is detached.

This removes the manual `iio_device_unregister()` call and makes the
`iproc_adc_remove()` callback unnecessary.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index 11f2bc12c19a..38a153d6fc70 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -570,7 +570,7 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	indio_dev->channels = iproc_adc_iio_channels;
 	indio_dev->num_channels = ARRAY_SIZE(iproc_adc_iio_channels);
 
-	ret = iio_device_register(indio_dev);
+	ret = devm_iio_device_register(dev, indio_dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "iio_device_register failed\n");
 
@@ -578,13 +578,6 @@ static int iproc_adc_probe(struct platform_device *pdev)
 
 }
 
-static void iproc_adc_remove(struct platform_device *pdev)
-{
-	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
-
-	iio_device_unregister(indio_dev);
-}
-
 static const struct of_device_id iproc_adc_of_match[] = {
 	{.compatible = "brcm,iproc-static-adc", },
 	{ }
@@ -593,7 +586,6 @@ MODULE_DEVICE_TABLE(of, iproc_adc_of_match);
 
 static struct platform_driver iproc_adc_driver = {
 	.probe = iproc_adc_probe,
-	.remove = iproc_adc_remove,
 	.driver = {
 		.name = "iproc-static-adc",
 		.of_match_table = iproc_adc_of_match,
-- 
2.43.0

