Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3CF33C195
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 09:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601077; cv=none; b=Hyk/OQI7r4bUHSO0xnlqEl5GkkhfWMA8Llxt1g7fkAAOTIweFUERELyaSWeNdVpL9Wp/HVO/TGEPjifEpYvv+GX6YfQVAsJ5lDbojlbTi1rmhA9O50yyH2VPyeXUvSMu//+dLw44FU2KEit4elgVr3SJA8AIpm8sv2+AcFZp4pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601077; c=relaxed/simple;
	bh=mZPq9LcmgwAvNURf/extfUGWqqJSNfRaX6LbCY+2TTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MBZRRFNorIkegzAuXPYDpxVuvRDqlu+nJHaecfr86sLzjpBUK8Je9UgvX9NxWAqtwytklwmnRjw/fCyCfFaiayU7i6Z9L2JrYUy5Dd2HAa+viIxmGo/x0v05wg3zAz5xWBMUxjpNFQhWYXRY4FiZ5VwQpimqF+gh1jOIEsYVahc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rNohPktb; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rNohPktb"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38511175ad3so1611203a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 02:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601073; x=1789205873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cdCH0/RB1tBvaj1W6sXWObI//sTHWe8b2CDTC69fJ18=;
        b=rNohPktb0DxxJNtokoj+tdSF8Laf8JvPGaOjvofMq7Oy89G4iudPODk0Wm0k7oXoXn
         bv8gNuZ41rz/COfBA37gKvRaVN2zXoy/qKPJ9G8SrO9OVNM6Y8cPMD3AQqyV8OFMG8oh
         GIr+MR/udKmMwNsp0+Hqgu9NQhg4BjyOlKV/xbakFma/0p/lmr4dkyHCYncm2X8zg7J3
         QES1VHnwaPhTsxVGIyD2nV3pr8gBFX3bsaHeWhKQlVay9JtjvSk7iO7RO0qtGv4AcrzQ
         k4D/SGXKkowa6Ig1lm/MHfrup6DFL4OIoNXKT1a7AkMPfzssTpZhU82KM00f/p9VSyv1
         jqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601073; x=1789205873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cdCH0/RB1tBvaj1W6sXWObI//sTHWe8b2CDTC69fJ18=;
        b=eY0+WYR+JDreTKNw103qLECteCJa9EE1ir//pErKhXj0bRs0nYFfpYZuhILMgSX547
         AkSBeIxuf77Lf/bTwCX9eqk5X2Vwu3WKuD5hLi3tU8Eid4GBPxGptHgdmNm8bg0RaJHA
         l+Vb6xkm3nMnlBcaSL+1kKyrlMNr830tiZvjtHtrCTSLTkIyu2uM/DSnF1KYDrxuv4Jn
         OVZ/vDdYRPqKQ3Xy8ZpadIFrB9Wb4QlAfQsYhO0c3Sb9mwcVstp5sfVEVt8XDDk5ngMH
         U9sOrfHPwHap14AsiNK9rcWrjqIUXpxoO/v5pwO3hr/a0fkFeT4i//3YmkSRK/m9x/pB
         7+ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzt+h8xtTs7E/40SsiOamZkQ0if3q9Q9Fxs1yPxhn6Wy3XdovdKKPMEsH77M27bvp4Tw03CvizFTcl9Ulw=@vger.kernel.org
X-Gm-Message-State: AFuF++mu8rnqSrxhngYi3uxtnssEThaU17f+nVW4b/nQY/R2kaffdnYE
	Dp6LCgGhxkqIccmZFiJ40HUeSzfNA5jvsQIcbjKrw+s+VwfGqxIgvqSe
X-Gm-Gg: AYBFou0v6GTMt0nms+VZXmzlhjirQ2Wb+xE52UJsAcU6kfUdGCS57GR6HqZnnIhyIa6
	M1fdXMkLjZN3Ne93DuIc/LjMBQcs6zPLbJC60QFUYfqYvhuaRH+dvpHQZey4ewNKOaI2yANwOGN
	5U3v1HEf9GCc4VkeAIfGrI6q+v5Y/jAcAnSWwJGb7GN58Ig/N4yMeV8eI0gNwOIXsmoBQsttAg6
	+uu5ut8BKPh7NZL5rF/9OhdoTGaKfjrjhMD6VrQ7LZesQJs2Ep1Fgfxy1h3zus2GP791vfPj08u
	JZD6Wsowz+OojQ4qQaifBVYmjV6dGoq5APIPYeeoIvH6ooWZ4SnPcIFB5/GLoiiFYTDdCPCdW90
	pGJ3znNMwk9avcgLJIhwTGbIf3DnRnENJja+CSdfBR94+HuMLEHanZGUZMQ+mo5wDj45d3NvTGU
	22eTJmPYMhKgCS4TbjaRP1y0/XESaXPPy4rrs9s9DIJLfmnwJNm9wbwlZyuw==
X-Received: by 2002:a17:90b:3b8c:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-39b26242a75mr15470856a91.18.1788601072809;
        Sat, 05 Sep 2026 02:37:52 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:5b5:60e7:9f67:1689])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d086adsm15763353a91.15.2026.09.05.02.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 02:37:52 -0700 (PDT)
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
Subject: [PATCH v3 4/6] iio: adc: bcm_iproc_adc: use devm-managed ADC cleanup
Date: Sat,  5 Sep 2026 15:06:29 +0530
Message-ID: <20260905093631.48667-5-mdshahid03@gmail.com>
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

Use devm_add_action_or_reset() to disable the ADC automatically when
the device is detached or probe fails.

This removes the manual ADC cleanup from the remove and error paths
and ties the ADC cleanup to the device lifetime.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index 3bbf814d4c8f..24fb41751e93 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -450,6 +450,13 @@ static void iproc_adc_disable(struct iio_dev *indio_dev)
 	}
 }
 
+static void iproc_adc_disable_action(void *data)
+{
+	struct iio_dev *indio_dev = data;
+
+	iproc_adc_disable(indio_dev);
+}
+
 static int iproc_adc_read_raw(struct iio_dev *indio_dev,
 			  struct iio_chan_spec const *chan,
 			  int *val,
@@ -551,7 +558,11 @@ static int iproc_adc_probe(struct platform_device *pdev)
 
 	ret = iproc_adc_enable(indio_dev);
 	if (ret)
-		goto err_adc_enable;
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, iproc_adc_disable_action, indio_dev);
+	if (ret)
+		return ret;
 
 	indio_dev->name = "iproc-static-adc";
 	indio_dev->info = &iproc_adc_iio_info;
@@ -560,17 +571,11 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	indio_dev->num_channels = ARRAY_SIZE(iproc_adc_iio_channels);
 
 	ret = iio_device_register(indio_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "iio_device_register failed:err %d\n", ret);
-		goto err_clk;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "iio_device_register failed\n");
 
 	return 0;
 
-err_clk:
-	iproc_adc_disable(indio_dev);
-err_adc_enable:
-	return ret;
 }
 
 static void iproc_adc_remove(struct platform_device *pdev)
@@ -578,7 +583,6 @@ static void iproc_adc_remove(struct platform_device *pdev)
 	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
 
 	iio_device_unregister(indio_dev);
-	iproc_adc_disable(indio_dev);
 }
 
 static const struct of_device_id iproc_adc_of_match[] = {
-- 
2.43.0

