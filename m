Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D4F4CB8D2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788888328; cv=none; b=TY1LRuhpG8iTsV8iMV99htM6bOr6wmYFKiLe5GmwI0MOlgzCb/MvChnE/N+CcKF1U9EzS+YOwcMtafHndF2KFqOcLuE+fIt4kVhG6XvghBsAgYx2KoXdOa4gDmVllhoE1fs1yUsk8fpH0NOjSx/mPOVnRWOkv0kwRUSGI8hjvcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788888328; c=relaxed/simple;
	bh=iSm6gUUkWSpkXgJjmPimBp+kKrGEEM4tZY4iWPBzihA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VV4TmEGCA940XsPFL4FgFv0hBDXKrJO6ByQCSh/2KG5mLgemi9PxR+zq3T+w62X2giAJY938Jit9rRQ16seNeGZKlrmpWBnNIhbIWF4F4+0CHVkEcHScXpv+pSMRTGLeF4A+jZ69O8z44FExBp2E1ukj3xuMd79brNC+7hvn5Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rcw43/vu; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rcw43/vu"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc1c8d4a959so3288456a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788888326; x=1789493126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zs21gAo4QkiJe7skjL4wk3AEQvdIKI9ChNhU3Egus/E=;
        b=Rcw43/vu1YmIaY5oX0YN3GoRK1JiKCJFZRLhoi8pZB7AHYsniJpDy1eTIG7W2WNoaJ
         RkuGlv9jAunXkDubDJCNLLcc+SCzniu604EWp7OIMhZeNY/0hYT4reBdkK4kk30UoxJ2
         BKwjaE1b30t9Rsc8CnnNel2jAb2a0Ptr4vGCrg6a2gQi0Nl7whUrSz3JTCj5HSfra7ez
         YdWL46YlgwaEmXBCDWPtJ8lRcJAwbL3qxRxABsPWg1gYHzx1KqVME6ssQZv+Zayhouj3
         AUUb+up7RbUjQZMajo7RiHtQAkleL89VSwnQDsjQb1POnYyR+lPlXnjzGLZJ23JWb6AO
         vrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788888326; x=1789493126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zs21gAo4QkiJe7skjL4wk3AEQvdIKI9ChNhU3Egus/E=;
        b=mQwuq87+x5wQUd5K6j4soOd6WDSr6LmRxaDWxuY2usKf5zhWF1MQEQLm7S/RPhkj+c
         r4xcBvnDRrDmEPGf4tenIaeFnBbWOQzJsLUHFpTIcBEH7XChvG9SsSoLtUx/QnwhfRgL
         wTC2qbXZWAF2mcAuxNELwUbJiLiqqpPyGU9+/nwmn/GJ/dkvU2qN4yPMhxoHtRKa29FY
         GPyNPOL4W+IT5Bvwuiub5s6e7t7n+CJZVZE0sw7gkWM2iX0ndXSaFATVk6TVwJgTWr5c
         f9yqXkuLetyQI+N9fAEsn9qS6xNmDoWmTYIN7mwKbXRAZpFTs9j0Gx2HNHA4xP5yRJZQ
         Hllg==
X-Forwarded-Encrypted: i=1; AKwUvBxIGelyAi8Klknr06nV6E/hw6oeCiOYE7NWbHZv052lzh5B5aUP/0mTb1u5jyRRmhvI10Ms4ewTVY9KadU=@vger.kernel.org
X-Gm-Message-State: AFuF++lZHPVQc/tSmGFqkC7LG6pw98qNAqfW24GiR+fdCphnR0Ps18UY
	s2qDF+2u3TdgRw2OnbGfStBO+88hf/0pWIoPI/GoMRmzZ8DzU+gEgXQJpcSee2fHlkw=
X-Gm-Gg: AYBFou38zJT++eM/L5hWQINu+zv4hU293PcVzfNkUO8QZ8dyRK1qkMK3sDHgf401DP6
	ewyN74AlESFscG6GejrGeAVHAW1ysr9DrHomgKCzp4U+mAX4kN+oBOP+KpGQ9NGlV0VsAe3Ovje
	qDOmaK/RXznpbnDQmFrTFLiMGRMdfAOhVa/a3+HwkhM2kDYJu0P+GAzDOhNBo/jrSP5XkA+Znny
	Vcsj/imeMqNfge/gWkPHboTvZeLSjPhdM2tp19BoNGSjnQhdeHIMZizKfytsPPVbPKWzvtb1lPR
	lzMILmE08Zdrk9ugLi5tXKL1fYw1wZo3su4MD/27L0lAOky+hnNNI2Dlt206hvUIsNlivVGKyqC
	FttlcHIawXXG7kwuXh2JXkyBJhLkj3IfxvKG5yfrPdtnfM1mktIoPmsn3uEwiQ4LnCkSSbskf9k
	cc+P/ZaSk636PPJEfZhgn9rLJK7mSA+dsmJ4PCV+bXzVvtk9lMwAq/2uOuYBc=
X-Received: by 2002:a05:6a21:2291:b0:3d0:88f5:f812 with SMTP id adf61e73a8af0-3da39d147e0mr44672625637.10.1788888325834;
        Tue, 08 Sep 2026 10:25:25 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:43ae:bf76:d99a:e5ff])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33688cfc714sm19297176eec.20.2026.09.08.10.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:25:25 -0700 (PDT)
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
Subject: [PATCH v4 4/6] iio: adc: bcm_iproc_adc: use devm-managed ADC cleanup
Date: Tue,  8 Sep 2026 22:53:57 +0530
Message-ID: <20260908172359.30003-5-mdshahid03@gmail.com>
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

Use devm_add_action_or_reset() to disable the ADC automatically when
the device is detached or probe fails.

This removes the manual ADC cleanup from the remove and error paths
and ties the ADC cleanup to the device lifetime.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index d6f82f8ddee1..ff271c7fb2de 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -451,6 +451,11 @@ static void iproc_adc_disable(struct iio_dev *indio_dev)
 	}
 }
 
+static void iproc_adc_disable_action(void *indio_dev)
+{
+	iproc_adc_disable(indio_dev);
+}
+
 static int iproc_adc_read_raw(struct iio_dev *indio_dev,
 			  struct iio_chan_spec const *chan,
 			  int *val,
@@ -554,6 +559,10 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = devm_add_action_or_reset(dev, iproc_adc_disable_action, indio_dev);
+	if (ret)
+		return ret;
+
 	indio_dev->name = "iproc-static-adc";
 	indio_dev->info = &iproc_adc_iio_info;
 	indio_dev->modes = INDIO_DIRECT_MODE;
@@ -561,17 +570,10 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	indio_dev->num_channels = ARRAY_SIZE(iproc_adc_iio_channels);
 
 	ret = iio_device_register(indio_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "iio_device_register failed:err %d\n", ret);
-		goto err_clk;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "iio_device_register failed\n");
 
 	return 0;
-
-err_clk:
-	iproc_adc_disable(indio_dev);
-
-	return ret;
 }
 
 static void iproc_adc_remove(struct platform_device *pdev)
@@ -579,7 +581,6 @@ static void iproc_adc_remove(struct platform_device *pdev)
 	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
 
 	iio_device_unregister(indio_dev);
-	iproc_adc_disable(indio_dev);
 }
 
 static const struct of_device_id iproc_adc_of_match[] = {
-- 
2.43.0

