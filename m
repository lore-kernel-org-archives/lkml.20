Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5F533C195
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 09:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601038; cv=none; b=OfvDkKnBZRoASFFpKuGOBT2jusgv3Mdq6+I3kuwzrUPxHTKVKNSKVSTpCTo+P/CX8ehynLQjCLTzNtCAMSbBnyUaYua+913O+FIZgPnKLjuXqvwsSWxkFdJFr5NJbxSXx+2IikeVHr4j8MmWU+60hhIIxXm0kwt33vp3lx9DMNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601038; c=relaxed/simple;
	bh=tQy3e3cd404IH7aHwVXCZjBfpap2WUWtbVT76HQTigI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uk3TCyA+9A/DBGKBBQVJRHXwzY8YOqZQMBZ1Z4OFA1pkhhJ6NVFNxsmf3EbOW4wCAhwCxdyn6biyENVrj1ZAYjnjhia5Cse4xQAnjYntbJDFM8rV0ODBFINYSxCx0zNldGwU5Ap5IQ0lh6pYibKJnhHjHPxvAmglr2wMZSOkVUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOfK3VP/; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOfK3VP/"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso1509501a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 02:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601036; x=1789205836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jRA+96YLaMc6tCnYBwn+B3DVe6jv3AYL6noHLa2o+KA=;
        b=iOfK3VP/hM+212xQnHKlbMSpEEFSfjkRISQ7FZ/Z050rf5AQbOfjwoKWxVd40ClSCm
         zDboHkbrD0bL6OWedVi13UktRDmeqC8PYwqN8IWh1F7SQaB1XRPGNMq5/AWFrx3U1HxP
         S0klQ9nLG+ixEl6UkH54rZ1L71tN3Dw1q4iE4hdF8O58k35K2+2GpqSSeO3n0zndUmLF
         hrfEN9LlgUy/McG9mDURc+UqfYTAUVBhSCLzcZGlRdkWCLNCOGmyK9hzGAr4anJ+M4u/
         of10pX5Ju3RCEDqQT4n7Fe9hQBL0kctTt5g/5b2f/W9jUZgECd4nKk4ApfbeiwzYnC+b
         Wy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601036; x=1789205836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRA+96YLaMc6tCnYBwn+B3DVe6jv3AYL6noHLa2o+KA=;
        b=EJcPMdQGvv5/uzx4KMDOaFjvUUeHldcSHyWPl9ei/g76JhphOTN/YKbIg1mwcfA2Hi
         HEyM4BgDauTMLf7YVgCwwHzVeDJCtb1B5KDIufRHzm8TbrVZWW3NVwgBkMjvUPLx9u3p
         hRRwiV2TmdR5XwxaA9g6dPWemOs4aKWZd/EfiLCUwgc9FafPyoQue49v9r2F6IBjlrru
         tqUhp/aBtsAt/ZTJdGuZ9EjnXhRMRlmv8MBAESmIdr6AUAyAa2YFugDvyJnNjVP15+8S
         lDLaxMTonBKgQk1ORslOu2pdWQaPWTgmGy+a5neo9sTGCX1Lfz4Mk1Wzr7jFOqE9+BKt
         2JVg==
X-Forwarded-Encrypted: i=1; AKwUvBxVfN5iiHXy/jHmn6ps5H1bQ2+CQV0doi3kRdKQwF9xGH7mHoSPMoEYo+feGwWIoqX8Va07jH/er1UcRgo=@vger.kernel.org
X-Gm-Message-State: AFuF++kQAhpYZOJ86Riu9o6uctyrJ4aewOEGZtV41OD7AiIM6MdU/pj5
	NFATI4cj2dTWjZCwpk+YRRp62/QtCYWP9VvCByJ0nr+5KZNyZdhVpy7I
X-Gm-Gg: AYBFou1GiAH7vVAl0CDgYcKpTJJ7sIGMFChehurcrP19X9iNSPI7jmyEgiVDzf29RrN
	TvlBAa6kxglzrYd0L6AD5mjBAfWYiRXtBH4DM36SbNpF84btVpFdglMf410VOZred85zYU9fBas
	GP91uiHEWY3ybfgoXOSDmRdNHc6kY1vuUk/yc0OKXRHv81z/Pw5UJElzFTN9aPcaOfZ0eJ1dQaQ
	Z75dssheOqXvCI1t10ok3oc8yDHB77pSgQLjmAOJeOHrwy1ksVXSEldLgItvX6exvUzyBoy7RNm
	DtFIeW8T0CSjM2d0NqAviXSAJj/SOoo7NWtrcWejXjh8K1eUUz2CbHKHlAVB1xzcRW6DzR4yhGU
	+UbVLbiCg+FrPBqteaeq52e2oQ0dshbHiSj2sQge57xcf+5weEOk1T0H2SHPlqStUyLlNroi/ni
	o9uwZfXCxCzhllTD+X2TX9KMgFQOmm0jvfXkSHd6H8Wsj4C/NIpCMRbrWv2A==
X-Received: by 2002:a17:90b:1a88:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-39b2619138bmr16464351a91.8.1788601035821;
        Sat, 05 Sep 2026 02:37:15 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:5b5:60e7:9f67:1689])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d086adsm15763353a91.15.2026.09.05.02.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 02:37:15 -0700 (PDT)
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
Subject: [PATCH v3 0/6] iio: adc: bcm_iproc_adc: convert to devm-managed APIs
Date: Sat,  5 Sep 2026 15:06:25 +0530
Message-ID: <20260905093631.48667-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mohammad Shahid <mdshahid03@gmail.com>

Convert the bcm_iproc_adc driver to use devm-managed APIs to simplify
resource management and cleanup.

Changes in v3:

-Add the missing direct include dependencies.
-Split the clock and ADC cleanup conversions into separate patches.
-Use devm_clk_get_enabled() for clock management.
-Use devm_add_action_or_reset() for ADC cleanup.
-Remove platform_set_drvdata() and the remove callback when converting
 to devm_iio_device_register().
-Simplify the devm_iio_device_register() return path.

---
Mohammad Shahid (6):
  iio: adc: bcm_iproc_adc: sort headers alphabetically
  iio: adc: bcm_iproc_adc: fix include dependencies
  iio: adc: bcm_iproc_adc: use devm-managed clock
  iio: adc: bcm_iproc_adc: use devm-managed ADC cleanup
  iio: adc: bcm_iproc_adc: use devm-managed mutex initialization
  iio: adc: bcm_iproc_adc: use devm_iio_device_register()

 drivers/iio/adc/bcm_iproc_adc.c | 67 +++++++++++++--------------------
 1 file changed, 27 insertions(+), 40 deletions(-)

-- 
2.43.0

