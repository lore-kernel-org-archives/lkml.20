Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792560305;
	b=jc1vCzxKg//REYkQlHAJgO/P3I7BQqoqJj/a6ZCX4jGfIYFA/NYVnsjl7yHiJO0tgiQM
	 79FlEOEQrVAln0biBws/+bkX9ueuoo/jDSx3VU29gbwbOsvR1gUJ9FyH4mh35mPzbvYOh
	 aJk6BY9drLzuuDZOvkE+PmzeazR+yJU8OhwHnisvSupihH3okfTEzWmvOg6VcgsEX2LHR
	 2+yJ2F2+Y5ZZNODJFT/pmlReWbOnZXAu+Cw3XUpBAycCf3NgIcrQLtJUuIT/yrM3lD7Hs
	 qSldvHptIet8/Qj/cIbSv8cMg+xioEmr/HqH0dSTFallEmJGD1DC8zftn5pD2+fu4gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792560305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QO11p1cdvBfNgfWBeER77MVqw8qS2d4+wBk/vDSDlTM=;
	b=cGeJmt8Ap3RKFYRDwZD5xIuxAv2m3EYEeGUl64nHTeVH/Fy14gdGV54r+DkXs5NStbae
	 rTfiLwZEdy1On9rUWYy/NvuLqdGTizZmCf0F/cKrEtJtGu4DshmWMHLM/loiB6DAXHMtF
	 Wv4kf9yWpuSlX+ijXBFvt673fX0ePOwjKUnrwxIYF6Y95jog/w7C6VsgeHO6Td1z5a/FR
	 JejoAdtwtm1ma1JtWXOy1qr9HNyg1CzJ1WdS+fZh7W0okIQzf2rm2lrKmNihTExnle3KB
	 91qtpqtf5hdiOtjQeBWA8U1JBg8AOgeMFPOoikBa/O8K1qkMP3PUndALyexIoe7qkdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gExZuUhk;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD292606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD292606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gExZuUhk
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be469d4f9fso262740e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792560303; x=1793165103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QO11p1cdvBfNgfWBeER77MVqw8qS2d4+wBk/vDSDlTM=;
        b=gExZuUhkSHZ8RiSOZBDjxhHa6r4jx4Y4hhffO2HQqZCp2azJr/32CTUe+2ixB/ngsB
         l6nIgYyhfn+N1GQPLcSJUwmK4VGvOcG6SP/WfxqGuVjADDPIA6dScBH78LLRk+YalCk9
         d0U8oIdYI8kCZUclwapRe6Tqes48kUpKNhEQwRd8jCUW5NW/1FeIUzGDDDc23NLjg16D
         amdTdepRbt+fO8zyhfAyVofoJ+ncQVyCsTNyFv0M0+DgRaR/lPXQESqcDTcqFe+BF3mR
         83cuVQy/WWMmsToaMZluNvmr9LHjhC+hBm0zPdQiqzbcJriPKalP35h2uPcjWITcyAvV
         7aYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792560303; x=1793165103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QO11p1cdvBfNgfWBeER77MVqw8qS2d4+wBk/vDSDlTM=;
        b=KhVSFvAWPJShjIjoldLUr0REPlIZQZ7YW7XzGFLqtTjmtMJWuSv2eSudRi9fzeENzf
         uWf2gQBJm88BHdWab5fBM+7qeLfg4WLlHcXgmMf9SRvYaZDSdJLyzMHkJWhRaDmKmF7U
         LeNf0fffOOLNlLYM7RqwUUPxPW6cN57rP70eoA6ZHBJVrNVKot61S3LW8XOVw+8iuwij
         XDpoXfYEghk+XU11ipfd4pxXEj3uRjHgfcAvELpX4ivCsym1CJhUhER1cUn60eqfkyCR
         Ni+TyODHvHKOHF4TcU6cN3Xygv3YI0j3yNkwfd2DrHt50KDx+Zlm5PB0R406cPYShbhK
         rrbg==
X-Forwarded-Encrypted: i=1; AKwUvBwSBJSIrxwEq2whlfVnbgjmY4uFC1Nb68zWOWhpVZqwd4wXR7U5HzJKxTVpz+Af1QK7pzdsi9L5MZJ+JRk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVV5uVGQs1qWAKNfoArMsWKefZs2nCOVzJy/UWxrS3h1NLHGZ/
	ACdmE2QZpVIR52Tu1x84Cnkj/sMwOH0LRpNgLAzHy+KUOeTYWVjRLSYq
X-Gm-Gg: AYBFou1rpAejUdgEj6ntXAARmO+auP2lYNGXh9p0/LdlnW4fpunWcgwij1LwVgUnfB0
	iWHx/kgPlbwj/ZnEJbXxblLK/W0BIJSqAC6gJsHGzj/GxJVp7iweccAkL0n1WGv8ONL4NWjAMw3
	RltEclY1do/BVtgdrRlJhzJL79OKR+39npWCkaT5WcvDcWEMnucwAb75/znC+w1vjd60ptcWTsv
	dJwK3bJrgavr/Yzdbx5C23SzSAJ7F0xBWozr3/qpfgr3fCtc+A8K+TwAKxFNvzVoA2t0/c5A/0k
	ztxWgeGuu7sV+n+WM/aGcfe6pXJC9jhWNHx3mcZV6FBKchHf2BQBdA625qdkWUvGuba4TxiIk0D
	1Pm6s5M7h2JonI2vUagq9F4V29vHtAHcb/p5G75cAoLc5lYYG8fuFZWh7yprfpQtPcMhVIqh/1E
	VNaaXf9ZhaUIhfiny3mERE5ig234/cy1ncexv0ug0QL2X7WzTq/Re0GukQ306/zBV0rmUg+cSso
	PsKoq2WyvAHfdVmFTgvbFkGBIIDpN3UFwa2dvR0OJVk+oXHSExK0Z8h2VdyMZibEY5UV2y7eEqQ
	IBX5je+0BIZ4IGtuzmprI8QuQZBoYwlbz3ZsYmUQ0qYHaVTzIDYrZasTfO+mKUHc
X-Received: by 2002:a05:6512:6686:10b0:5bf:a2b5:b1f8 with SMTP id 2adb3069b0e04-5bfa2b5c70emr124342e87.0.1792560302719;
        Tue, 20 Oct 2026 22:25:02 -0700 (PDT)
Received: from yantra.. (nekmmqvnobjree8k203-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:ed79:febf:8fd2:e723])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa11f6dddsm284385e87.18.2026.10.20.22.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 22:25:02 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Marco Elver <elver@google.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH v2] iio: adc: qcom-spmi-adc5-gen3: fix lock annotations on mutex helpers
Date: Wed, 21 Oct 2026 08:24:35 +0300
Message-ID: <20261021052435.112686-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 5b63d0ae94cc ("compiler-context-analysis: Remove Sparse
support"), __acquires() and __releases() only feed context analysis.
Their argument is parsed before the function body, where only dev is in
scope, so with analysis enabled for this file the build fails:

  error: use of undeclared identifier 'adc'

These helpers take and drop the lock for the ADC_TM driver, which only
sees their declarations in the header. Naming the lock there would
mean exposing struct adc5_chip, and with no annotation at all the
analysis flags the unbalanced locking. Mark both __context_unsafe().

Fixes: baff45179e90 ("iio: adc: Add support for QCOM PMIC5 Gen3 ADC")
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>
Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
v2: explain __context_unsafe() in commit message (Andy)
v1: https://lore.kernel.org/linux-iio/20261003214516.128573-1-zoone.rupert@gmail.com/

Found by building with CONTEXT_ANALYSIS_qcom-spmi-adc5-gen3.o=y, which the
driver does not set today. Build tested only, no hardware here.

 drivers/iio/adc/qcom-spmi-adc5-gen3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
index c68c6c5f6aca..6a3cabedf4e8 100644
--- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
+++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
@@ -663,7 +663,7 @@ static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc)
 }
 
 void adc5_gen3_mutex_lock(struct device *dev)
-	__acquires(&adc->lock)
+	__context_unsafe(/* returns with adc->lock held */)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev->parent);
 	struct adc5_chip *adc = iio_priv(indio_dev);
@@ -673,7 +673,7 @@ void adc5_gen3_mutex_lock(struct device *dev)
 EXPORT_SYMBOL_NS_GPL(adc5_gen3_mutex_lock, "QCOM_SPMI_ADC5_GEN3");
 
 void adc5_gen3_mutex_unlock(struct device *dev)
-	__releases(&adc->lock)
+	__context_unsafe(/* releases adc->lock */)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev->parent);
 	struct adc5_chip *adc = iio_priv(indio_dev);

base-commit: 43ffda3c7f8456bbe641ae8249a077a361b97880
-- 
2.43.0

