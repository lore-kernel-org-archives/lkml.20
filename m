Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712FA3C199B
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 17:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788109842; cv=none; b=j27RIBvaU3NoJi7dIdoVXE38nx0R4RJf3UhaZbUfqsIpg2+OJZ84q8fI9o5t5zpP/kkeGvqOjUYBMkhxKZbVYkm1xgZx/PvpNMvsUiQVCAUmYXBvtSp5CR0kDosnnr+ZtpxSa+6mqDELH2aLj4s7NiJtt3b7sDHOQnkTOZM7Pwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788109842; c=relaxed/simple;
	bh=MHHJQfeJIqObhw73w1UomEbR7+LOBj+txdDKfQKR74M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dWVyAw5WD3dqafke6sQyCPDbciqTJHk4nZGGq/gStWhWC0Sg6dkcYfEwU9aQG3DPeqx0188rARyj7tSVwqtLY1OM29WMZ+GsKe4vbjkvrnZQJcm3ZvCDulTZmOevzwaxeZer/u6sGVF3oi1kh5Aw+Sas5rcCzksgDJk/UPMTi48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DIwltraJ; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DIwltraJ"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-39266382df6so2217395a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788109838; x=1788714638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TFh7tNrhnkyS5rc0tyeCiGcCiB45l4CkB+Wkyp1hfZg=;
        b=DIwltraJ0W1MbYBY+dMOYG2YuZd5V2UQPF3x+Y4AohgLDcUyzuFEUTEMn1dRtPSk36
         R0zLY6B8sovCPgmugDOzlJ6OAKdv7icblcSvgasiimwU8sR9LMtJsgpMJeNcwEsoKzAo
         //qdyQ+L8InvT8A8tYgK3uTsf2o39hXoZB+xVt+d3s+DARKhj/unkSAXR3MpDMX75BjN
         tePN1rkfrWCIxN+cHyXRvEUTTQg82SU2ULY5OynNMgR7+VAg6/+e4nyg0QtzTGnJMLUT
         J1h51fBa+Pkv2yDrTCz692N1RH4DtrJyqdZAAlybsGZiiQLpDPbFt2nsXYngcjElir2F
         Ut8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788109838; x=1788714638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TFh7tNrhnkyS5rc0tyeCiGcCiB45l4CkB+Wkyp1hfZg=;
        b=FKlsU7z7cbLAaU35cZKyT/WGq7P5xtvdldWexJhO06y+o/Sv65j7NMbks0H5DnKakN
         Ni8wx7y2HwjAS8/0B6raSIE7715Wh3ZirEPKrDvFsGlI3/pDP4uD2eB5zZPoeGK9PRAn
         7Bh8L625J8+bGEiOS266zmiWmveO6vnZYFGRRc9MAEGMz0Jhs3ljVL/o8Y+hiAGA4aZC
         dsUyVhzVJMgoeluMOhuccAkj+noCeL8lO00wxxjq1vUxPnH8Y7wDJHW0LQFR/6cERHHF
         R2JcnvzGzvRwa1nnGTK2fiB8CR4cExpvPGYvo5Dm82srwN9dGx8xqWphQBNA8r+UshR3
         wxzA==
X-Forwarded-Encrypted: i=1; AKwUvBy5Wh04VEQQ9FkhXMyUE6bGrDq8hO/dnMzRXOof5h6Mv6Ez5g0FWXh/hkdR1q2/4xdrF4mbYNgBi3tq3YY=@vger.kernel.org
X-Gm-Message-State: AFuF++n1yUf+JcPyBkFNJ1EfrpLzopTKoVQmLdOvTWYuuk7l29j2YVTq
	uqApQXeL3yaDRMhgkUrZcxnnE1SXaOJ5GG5BjdklKvrEw5SMg/KYziSL
X-Gm-Gg: AYBFou0gOJ59JuB+E1U1nHK2hHkPLDUrbUWgblQrag2H8/gJVtbIs4ewPap0wLA20Gf
	AHtDu5UDUg64xmXV6dTxHFTW5guz/Dz64H6ZCSoCXRCGt9AkKwTazrmktGzQTq9o0TT21z0sgro
	YXbNj+ul/HNGvVBHMLMAfXU4CyWYziiI/AUN6MpjFG1pQ/PPM4iVT2b7CUPh5NLTusYWerbXflI
	2//7GVSguXvKEA8TrhCucHsOvbY47px8S3vziuzGQdlhMlGviqPslZLdNqgOdj64JgCPFQ2nYFc
	y7kEatZgjGSU3gWaBWXs1BffcGAMCDqnF/adlM5gVw2aLTZP2odFpSJCca4M6IiK/XcLLHuPlr7
	XSQYoOZekGvHFTlncdlc6IhsWyWtE0BnG3mhnX6ItvXjxug9k7TH65sMry78fhgI2lXgFxfteIS
	arJtaOyXU/PLlinWKZpg4rHYpX2Fd1644oN6gZCNgAbrJ7mW8FqozGG3j0gDAk7LCCega5
X-Received: by 2002:a17:90b:6c5:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-396d0f9d0famr35772568a91.12.1788109837836;
        Sun, 30 Aug 2026 10:10:37 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:88d5:45ce:40e:490f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fcfa3asm17047101a91.6.2026.08.30.10.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 10:10:37 -0700 (PDT)
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
Subject: [PATCH v2 4/5] iio: adc: bcm_iproc_adc: use devm-managed mutex initialization
Date: Sun, 30 Aug 2026 22:39:17 +0530
Message-ID: <20260830170919.470974-5-mdshahid03@gmail.com>
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

Use devm_mutex_init() to tie the mutex lifetime to the device and
improve debugging when CONFIG_DEBUG_MUTEXES is enabled.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index c7fbdc21f8cc..11f2bc12c19a 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -524,7 +524,9 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	adc_priv = iio_priv(indio_dev);
 	platform_set_drvdata(pdev, indio_dev);
 
-	mutex_init(&adc_priv->mutex);
+	ret = devm_mutex_init(dev, &adc_priv->mutex);
+	if (ret)
+		return ret;
 
 	init_completion(&adc_priv->completion);
 
-- 
2.43.0

