Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3ECE35A925
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788413946; cv=none; b=qgHcPylo//f3Ox6NgHYXhh3D4W0jezOcDYSJDwQ6rCPPVAeOHt/dG0JeU86J96SFF3JXtDtDyHFEU3FOnQDi3QzazRdbByPUd3Fafki88b+/S1I5sedKGjyzPXiedgyw+ZCA7JtYKz9cNtfSJ12QMhTl9PWATddI4H73e1DJkGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788413946; c=relaxed/simple;
	bh=b3b6gfesD/os7apgK4gtFisoUHeK/sYTDMIjbfHch5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HsLIbeDRRKkNjNsHBvXhQzV2BJ/9wD5X/XugglQU+zlWcfO4jvRvqZoKd0f4NIaXvBGI3yeWOw0en0dL0ZPFwxjHtU9BHKWaOeYksvFCdlnxwtREvu3Sk57IxYgzaJqmiKcZx6A42H5zmyVRMBDWCJHOrRupDt8kM6ZFQR+KIVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P/2JVReG; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/2JVReG"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so1518056a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788413944; x=1789018744; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZPmOa6ZX8GipLr+aIS+ts/201Kh9WrJNcUfS+NBI5Ec=;
        b=P/2JVReGm6cbKAZpWPXYbSWfujzFRkcsHCR/JOzeen1XAGcOSBmUD4jpNaaO9AguZI
         ypeJmwWUu6U6wNrV2GIXaDfG8E2kAdVVoAw8bXG/b87D3mfVPeHIAyUsvVHa/X4R0ufi
         2JsTIvZRvBAN1zUx64v610jE6mxJUtAEIby5525n62+p3W5fzi6zG/w5oOMcTX0Uu11/
         3t8y2u6aj5wd4l+R4Zl3k1MhvyAL2OjeDVC4kSe6WRwawHNhU0dmBFv/K8W9ipBTM9vt
         o65QMIA5xZ9ETBKdwUyAoDlEVzD3sZ9IyKtSzikT+w8S26peuUZwXGp4nNulo4ZgtBDq
         wTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788413944; x=1789018744;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZPmOa6ZX8GipLr+aIS+ts/201Kh9WrJNcUfS+NBI5Ec=;
        b=ME7RA9jrBXj6kk8Ef46goPlBqYGbQN0sJ8iSx1VU2k7iMGgi7piRSJniXDKWM3CU89
         XBjALwa2dkSBA49y1ktusU7X258xzxKStyHZdbDNrnSQtZ1ILouqK+qetH71PNv2d4w8
         ETfjPRPoe1sFEo/Il4Z430wmU23aRfoMj/Xp+OEM10Aw+DsmoXN3zmSzcxLkYJS13Gme
         iQQMu5uLetLrA50lr1cVJGH8NBLvbr+gWTWJu89dyvI0197EboqscUmAzzLnbRnS2yxm
         Q78npwiWFY1iaSgPCMlkdq1qVvz/k85WKJbluLne732XyHA/Zs1VTy0Ghp6SZWlVigSK
         ihuA==
X-Forwarded-Encrypted: i=1; AKwUvBw31f32PjJD5iFSYnp8ggekeVBCX2m2JH48Cr3sgJxesF4nCogIr0DrkDvqwIeRncfkwdx8XMpLFaW5KL4=@vger.kernel.org
X-Gm-Message-State: AFuF++nqgmpi8qh9l6tyAXMUBJQkJQPJm/Mt2Znh6OtppwCFLS9FKnOd
	WTJRkSMHr0mO3k1AjFtx5tFv9M2hNGma/DgzzCI9kP/pcVx/yQSI0wYM
X-Gm-Gg: AYBFou0Mx94viam9KwpubI8VKFBC9QAAk+cnyn+u85B1J/2S37Ltuc5AGTIkwUU3loK
	njxOnB3KRcOu4zHEEqk7u8POgajhXHsEjx2BVqm7Fy03WLFYq/ZIyIaAyoEfFF+ielJZjoNuX+A
	CwT/X+ihuxItr2lx3K/6Y59uO2GBXj/GTSgbUCy8cKa7r8FbXjxV7kMJWFmst8KxyLEqEyv9jFj
	A/8RRDjPAW3ZO1bdsiUxmUsL2+GddIp8/ryX6IFG8eht3zu1pmw0hu1rhDJmYo7ozOpjhudLpN6
	KvK+g2y0PXW2Z2uPwB7fhFEuwdSZOKmRxBsPXy4t+63L7jmZ01JxshG/e1ddUA9gPMVUQuwvLuR
	M0z0KvZl+RE6oChNWJlHdFJVkWDBixAWXVBo1IdLa0rG1he+Pj5l6nkfMQ0BWjD+eV3zQY8qJ2M
	8f+OV/m7BMN+nqYLvY0znCTFiJVYQFtfeHE3B3t7kIwlHLZ9QqczJijbagjcCJEljiu33ddmAy7
	aj+s9HZ3jjkU/8A9m0s1kQZjcs=
X-Received: by 2002:a17:90b:3b52:b0:396:d28e:bd8 with SMTP id 98e67ed59e1d1-39aedf61001mr14096928a91.3.1788413944106;
        Wed, 02 Sep 2026 22:39:04 -0700 (PDT)
Received: from [192.168.20.42] (115-70-157-242.ip4.superloop.au. [115.70.157.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ce4221sm3253082a91.14.2026.09.02.22.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:39:03 -0700 (PDT)
From: Tsz Shan Chan <tsz.chan.dev@gmail.com>
X-Google-Original-From: Tsz Shan Chan <tchan@jacques.com.au>
Date: Thu, 03 Sep 2026 15:38:47 +1000
Subject: [PATCH] iio: light: apds9306: fix default sampling frequency
 definition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-apds9306-v1-1-3f892aa4f156@jacques.com.au>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwNj3cSClGJLYwMz3aTUlKRE8yRzk1RTSyWg8oKi1LTMCrBR0bG1tQD
 lNLVoWgAAAA==
X-Change-ID: 20260903-apds9306-bedba7b74e59
To: Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonathan Cameron <jic23@kernel.org>, Tsz Shan Chan <tchan@jacques.com.au>
X-Mailer: b4 0.14.3

APDS9306_SAMP_FREQ_10HZ is defined as 0.

According to the datasheet (page 11, ALS_MEAS_RATE), bits[2:0] set the
measurement rate:
- 000: 25ms  (40Hz)
- 001: 20ms  (20Hz)
- 010: 100ms (10Hz)

Change APDS9306_SAMP_FREQ_10HZ from 0 to 2 to write the correct value
for 10Hz.

Fixes: 620d1e6c7a3f ("iio: light: Add support for APDS9306 Light Sensor")

Signed-off-by: Tsz Shan Chan <tchan@jacques.com.au>
---
 drivers/iio/light/apds9306.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/light/apds9306.c b/drivers/iio/light/apds9306.c
index f681b02e4922..7dd41136734f 100644
--- a/drivers/iio/light/apds9306.c
+++ b/drivers/iio/light/apds9306.c
@@ -61,7 +61,7 @@
 #define APDS9306_NUM_REPEAT_RATES	7
 #define APDS9306_INT_SRC_CLEAR	0
 #define APDS9306_INT_SRC_ALS	1
-#define APDS9306_SAMP_FREQ_10HZ	0
+#define APDS9306_SAMP_FREQ_10HZ	2
 
 /**
  * struct part_id_gts_multiplier - Part no. and corresponding gts multiplier

---
base-commit: 940de590b839f71d6dc846160534bf202401b8b7
change-id: 20260903-apds9306-bedba7b74e59

Best regards,
-- 
Tsz Shan Chan <tchan@jacques.com.au>

