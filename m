Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5F25908A8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788888350; cv=none; b=VWN3xHSzpdj0ZNt8gVCdbkxQK15S36R+Ki7IX1oeC73Dhwp/JBgjqyd9rCm/vNkarmVOf89k6/JhfrulKP4kcIHZSTjIBkx/nLZxIUsXG5jqynqNnEoeoMflNffjb6Iv/sq6vbTcPTzjYcly6KL4C7S8jA2M3vSXOnx/W6xQ9EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788888350; c=relaxed/simple;
	bh=wvUTcCBQZzKDbM9i8CICMan82jk+je7iizDWRvrhU0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FVPaGr5P0iu/rOozoIJmEky+vBGcfjjd1cRt9OGFGVqDXkSjnhYkmniNDWG4jDidLyoaRwrtf7qMhQFwYgyg8GDwkQwrI78OFOQ2BVVkdAkJSyPHl3y+Q4Nba7Mvs40Gg/DnpKDNMUpFJtDzms+lx0oaMQDKgQok2mQzIwxybLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p11BosEJ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p11BosEJ"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84830c774a0so4735477b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788888349; x=1789493149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fYdCGwR2PPQ+VhuIDyakmIiYQ5Y15ZgMmXSqFF9HOCc=;
        b=p11BosEJFD1WFsDES+xPhAEn1LU3fMdO3JLMHZt2a+Hd+PZaBAnxQ2VMBl/lA81Rv7
         HTu6h6qNb3mjHOqVqPghdQ0FxgnLXSeTvBzg1IF+6eCSDbaSFATJCzjNBDxaom/MHMwA
         a86gnkNbUwlcaAx8/Z5KGv0qCa7F+Sdm5ZvIlwHS6B5gZC/jLImC3EyHH1jLBFSt2KtV
         UowaDMVl6KngwpXj4j1pSF6sugHac8mnWv2FTtQizvRqF6SItOeZTq4sggeHssd9xUUh
         ie82KAo4SK7dKGBZu3tufh4lxesW2aR/XKTftLLisCK370GpgPxjiJ1L7NQIaelbeA4a
         0cGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788888349; x=1789493149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fYdCGwR2PPQ+VhuIDyakmIiYQ5Y15ZgMmXSqFF9HOCc=;
        b=ielrRN1NxUV/Q1BGask7xOQkeQy1yRndneY55wPyG2hn/xCDve/Q++28J6HRIjJ6DV
         mr3uQe9QTRXhz2zDWMu1BHP95OAw2aQxEGtrp+s9TIucUj+wJpND+k7tgAGhJorscPxp
         YomiF79lkyYE0O8T1WjAFP5Co+RwlAH61JYjbcVtiUMV4Jp8/BEU8uXfktv/gm55SNwK
         NdHVn+EPuxXg+VcK9A1Aip9T7+ejwRU2XY0n0QjTuXvC1fIudP/tak+Q08KpK/ijXoKV
         XMbHU2z7rVb1lDR8dkoNMdDkxPskjIDeyjZalei1UVf49S3TY2x/8f4rcSyY0AP5PoRd
         5XuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmOifBYoYcOp5btHgsJB/08EqYDxQIvGGzsebqXZplHKAJoPWLcUGsuoARyaPLcV5Qdwmw1oPcsCLqcYs=@vger.kernel.org
X-Gm-Message-State: AFuF++mJldAZM8XjPnv9xL3oXcuyPAdx/uvY7QUbnRCPQ5np5LLCb/hD
	iVHFGutnepwbmBDdOgtD+uISfIMhJ8xIQ+l0N9YNT4RJgPovWNIoH1PB
X-Gm-Gg: AYBFou2YFMpw3Z2v31zc0InYlo8o9ZeIFfwYqxIBSFwaKG3XODST6H2HMwIB9ge6WWK
	4f0ZLiAX2Ud4xA2DDC2kRuXK8ZovzyLRmA3p3jE4G0hky0JHQr2mlh7JYIpGt5STELhMpSySc+Z
	DQQ2uYReXL8H6cVkd3CIRTuCQaydYxNdUHYuuolDwJVK4dNxMy6ngqF09jsyttZtD1JKuso14Ga
	1hi/jXMvnwGt8co3sD4O7UX5tbblhM3ZRz00JrF1S7bybi0jorJ6YaFgyxFLdIZEjafM5FCXfnf
	t7aIz8ndZQKiRIj0IgajiCLLnlUY0QmdZ13HKm89nxK/McILBy6CQ+4TP2BHcEZEvHlCJMlsBA+
	GJ5XcTrw2dDR9mIzGbQiCvE4oEQTnq7Gd5+oRnr1xk9Bx29aEwDXEcidopJ+sF9HORzQ2B6Hqv4
	wqIClPrG944jXT8YtIp1AHKlVNrpF+Ja1xALMK3pGx3RPruq6v3+Fj6fHaS88=
X-Received: by 2002:a05:6a20:bea6:b0:3bf:7e2a:e874 with SMTP id adf61e73a8af0-3da39b5c429mr46679411637.1.1788888348747;
        Tue, 08 Sep 2026 10:25:48 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:43ae:bf76:d99a:e5ff])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33688cfc714sm19297176eec.20.2026.09.08.10.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:25:48 -0700 (PDT)
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
Subject: [PATCH v4 6/6] iio: adc: bcm_iproc_adc: use devm-managed IIO device registration
Date: Tue,  8 Sep 2026 22:53:59 +0530
Message-ID: <20260908172359.30003-7-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908172359.30003-1-mdshahid03@gmail.com>
References: <20260908172359.30003-1-mdshahid03@gmail.com>
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
index 9881a3104c26..ca81e0edd24d 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -523,7 +523,6 @@ static int iproc_adc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	adc_priv = iio_priv(indio_dev);
-	platform_set_drvdata(pdev, indio_dev);
 
 	ret = devm_mutex_init(dev, &adc_priv->mutex);
 	if (ret)
@@ -571,18 +570,7 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	indio_dev->channels = iproc_adc_iio_channels;
 	indio_dev->num_channels = ARRAY_SIZE(iproc_adc_iio_channels);
 
-	ret = iio_device_register(indio_dev);
-	if (ret)
-		return dev_err_probe(dev, ret, "iio_device_register failed\n");
-
-	return 0;
-}
-
-static void iproc_adc_remove(struct platform_device *pdev)
-{
-	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
-
-	iio_device_unregister(indio_dev);
+	return devm_iio_device_register(dev, indio_dev);
 }
 
 static const struct of_device_id iproc_adc_of_match[] = {
@@ -593,7 +581,6 @@ MODULE_DEVICE_TABLE(of, iproc_adc_of_match);
 
 static struct platform_driver iproc_adc_driver = {
 	.probe = iproc_adc_probe,
-	.remove = iproc_adc_remove,
 	.driver = {
 		.name = "iproc-static-adc",
 		.of_match_table = iproc_adc_of_match,
-- 
2.43.0

