Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A5A4A6CCD
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790371694; cv=none; b=gWwTI9CJjTpnQCT6C8vJxciMA2DFqNeO9tcXIGghoEsxXfeiqa5JOfrn+hIuoFIGMoNSeTesqNCv45ifYLqTCehnONQ6dEXCa0KUHVnUgYwFvTVvwsTNWUhJzWUVMaWraFJ/9ohuIWQckxhGu9WuXIapqMu4fk+gqsrS4Ijvmms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790371694; c=relaxed/simple;
	bh=rHl8uCSm1X9N3DA6iJNRaFcdq79XZexCnPOK9sIjMCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dfaw618hwIBOM3oupys175Sx78nrpZ/1NhbLKzgNhhfN7FCMbA078C6W8SxlqRNk/p5RhNyuQtCIYUazkDMw0Xz4j5NtdvmNQa2P0g0FF/bKeLjHMVonbyJ9UMfFhksCR18cT6UJGe1Zgp0OcV84tv9eaZ7/JF1VnEz4PwAr5p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jnju2DfO; arc=none smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="jnju2DfO"
Received: by mail-oo2-f39.google.com with SMTP id 46e09a7af769-8144632e066so724176a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790371691; x=1790976491; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O89RuTBcJdc8E3XhUuvYWrS5/N05SkrwjOwV7jj8IWc=;
        b=jnju2DfOEe4fP6GqA45PMPw0I+3gX1+Q3PSDPZirMTsjz1QPq4bQ17xlFMpSHWwsHX
         huLCD+dxEHpihdH9eUZQkI+khJ66bc64JEAbAJYXMD32jNdHxBDZnJbyOu1y98iXdthu
         qqQJQber4LUP4kI7A3kTC2tVpnFRwRR7HOkuS+VnoNXYGkrEOOVSoEF2d9HvYUDje8g8
         V2Zihj598/lc1aBDPG/FLdH4N5XqraoHp8rbRkAEw1p5uDkcNbUFAi9BrTNSVpJ12ky8
         GpQtS3XWzy7U+j5KX/FbZQibePrESiHVd82o8fDJEkHyJ/AYzsN9MpB6VALDWHDp2fx1
         FFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790371691; x=1790976491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O89RuTBcJdc8E3XhUuvYWrS5/N05SkrwjOwV7jj8IWc=;
        b=Rn3Z1L2l+MpR9F9bsPl/bdIIS1oLP4ImCmR7ivzHUkxSCEuKnqWrKtJXSJ2etMwTOB
         AhzWscnbqqfDZ6sd+ZzY89nYJTfssn1IZQUk/0IGriIQ0MvXs3leVfoXtKdomvGvzIX6
         uID/RyxpaJs0RNYwIaMPh4dLtBpKTR8cyczzMIJn94UBx6qZcXxFTOHWsxILE8mfqbMr
         BmiAQ2zpOh9XVPAYp+ENFIIAT6cnTWtG2RyFcusSDGXAw3ZJJMzNf8WbtN3/YkJAVAat
         EsQj4PJ8tg7NVqg1AoUx/Ae+xAEIOu1Y53JcYANhjjm+oeUWMxmvRTmmGsRhxicW16h2
         RcTg==
X-Forwarded-Encrypted: i=1; AKwUvBwQROuC5Sw8a4zxCsSpN1+Wgr5x9+AWw2SGdFIEKDnnF+RRyuJITR3/P4Y18/6h0mnnihYXMStsaSHEKKk=@vger.kernel.org
X-Gm-Message-State: AFuF++lLxHaYp4luerbO0bRDBJ3cxyDkJqzaK2iB1QQcF+YGJqigW/wy
	bKciLbIDlRCnAmReK9jXJqx3PpRej/zdkEnQXcO+FJFbzC7645MLS8GfdSLJfWgm3o9OFuQ2uVI
	mcW+K
X-Gm-Gg: AYBFou1oOWQjv+7jwcWSQOrnvvyQ1QAhzxf8ek9KRmR60m/y7M4Fx+RbiaXFOEEzYuW
	zo2zUka5oBPlocVcyqPBPkhYvppK8AqBTHicBxanpjd+qveQO3woKVXw9lAKPHeFJgbDV86gCSI
	EcjNGhS/CZojM84HvrnHi2lx5PNxbnuikmoCenNv7fJ9+v15Pj+GJhV5xEXaawjw5xm1x+9LlbY
	a9XXiQY5DzpLMuX/rbJVsHqURuM+WrjcJFj4MZ1Ggvk7V9aLWHCOshM1ZdSSE2M4KeQO9MIcDFx
	1T2XExQ8G4ODIKx2LlwpoINqIKw8t/vU5nvnOtqAvL6CvT09ZgDveFthFKqSEqk27kqVSzPzARH
	m/PnkCVDrHrRljjl0TxxLXIpVFXS70Y8S0sW/p0WUkTFNFTheBr8qszirsYIms3vj8XzLdWTo9C
	77IGoOKBgi5i9JSyKO8yRQOazNq7+wk7JpJ7A019cku+snUE7Qq2vUMeuhU6B99t+VD0lqaMRnx
	ck=
X-Received: by 2002:a05:6820:221c:b0:6ba:3635:800b with SMTP id 006d021491bc7-6d4412cbf53mr7415268eaf.68.1790371691030;
        Fri, 25 Sep 2026 14:28:11 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7a0e:55f3:1b40:7bc6])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-818e98b16d4sm3568385a34.26.2026.09.25.14.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 14:28:10 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Date: Fri, 25 Sep 2026 16:27:43 -0500
Subject: [PATCH 1/2] iio: adc: ti-ads112c14: fix negative settlingtime
 check
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-iio-adc-ti-ads112c14-fix-settlingtime-sign-v1-1-1fd53e7242e8@baylibre.com>
References: <20260925-iio-adc-ti-ads112c14-fix-settlingtime-sign-v1-0-1fd53e7242e8@baylibre.com>
In-Reply-To: <20260925-iio-adc-ti-ads112c14-fix-settlingtime-sign-v1-0-1fd53e7242e8@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "David Lechner (TI)" <dlechner@baylibre.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=rHl8uCSm1X9N3DA6iJNRaFcdq79XZexCnPOK9sIjMCA=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqtudarZus1a7Nn7CO5ML9hV1vpPuVVXADAbv4V
 X7DbppewvaJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCarbnWgAKCRDCzCAB/wGP
 wOliCACWVYPolzM1OyJHgiEn+t6FlIEz50WfGvNAEl8rR9KcKW1UG2QZO5Vv4eyFq3ihaItiq9D
 qoS1UBeWFixnv5SzoKuQGInubf5/5CXScMe9oLILcJMgwbqS/LkIq0jxAVD7ELSffuIi9oMKBcm
 2oOch+qrEQ8FcJ54kdn/CX+4VP9kAWxGMr7ae5mfXoIIkUCn2GQAdDMc3Kt5FOFAFJPxESUZRLv
 64WHbWvo5/E+etpy3C4ou28WidyGe8AykqHxNkrNmLMQtyjgKM94rp9lZsWBEloJIfHY+QKmRSx
 Ew/Ucsu2kNnaey/h+629H0ONId/DsxQ2gtZ3lZTjhkGv4C7u
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Fix checking for negative values when writing the settlingtime
attribute. MICRO is an unsigned long, so on 32-bit architectures,
integer * MICRO is evaluated as a 32-bit unsigned value. A negative
integer part is then zero-extended to a positive s64 and passes the
< 0 check. Large positive values can also wrap around.

Reject negative input before doing the multiplication and do the
multiplication as 64-bit.

Fixes: 839cbb1e2331 ("iio: adc: ti-ads112c14: add settlingtime attribute")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260910-iio-adc-ti-ads112c14-filter-support-v3-9-e5a9b27ddb1a%40baylibre.com
Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
 drivers/iio/adc/ti-ads112c14.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ti-ads112c14.c b/drivers/iio/adc/ti-ads112c14.c
index 3c877126b0be..483f159e2836 100644
--- a/drivers/iio/adc/ti-ads112c14.c
+++ b/drivers/iio/adc/ti-ads112c14.c
@@ -729,10 +729,11 @@ static ssize_t ads112c14_write_settling_time(struct iio_dev *indio_dev,
 	if (ret)
 		return ret;
 
-	settling_time_us = integer * MICRO + fract;
-	if (settling_time_us < 0)
+	if (integer < 0 || fract < 0)
 		return -EINVAL;
 
+	settling_time_us = (s64)integer * MICRO + fract;
+
 	IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
 	if (IIO_DEV_ACQUIRE_FAILED(claim))
 		return -EBUSY;

-- 
2.43.0

