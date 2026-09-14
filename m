Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B0B40F749
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376169; cv=none; b=KecNUpQ8/xtkCFWwQjGEUgiuI8Gq0Y8Dr+LClYONvoDn973MF47BhheHFv6ppmF0MB2yRwZoN1/o64aAKuIirRvk0zgzw+vJAbs3wBfOafsgYWovW+n/+ca0HmhDS6Qla1JLQwsobo14n54z1Yd5T31RViQvgW72+Vt7tH+8X3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376169; c=relaxed/simple;
	bh=8DM52ZxJYSCTECoScr2jeTQHoMA3M3eAOqwROetVXIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S280xIJOoGIamDOWSn9J7g5IEsrFZL4m4Reg8p3RNiVWU20A1r/oUrCNAsoT1VnMbPm+SiF01MJKMqhft2/mNaEc1Krx6XopIKmQHVreoV/NLDSX548M9PoLW2/oBaYFGpUdfNTTC75C/YauwRvDnxq2warqmyOq5BZkhvPrWwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gut6a78I; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gut6a78I"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2dcff8f44f2so44868715ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789376160; x=1789980960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kR5F0K9Uis9I6dBmqd9WemQ0wgMGxaZJC6u0jihBbyA=;
        b=Gut6a78I0S8hiZdutr9ru7qjIAEm2G78+ELDqopZM710Z3JBqTkyZaFndmym3lrfk0
         iOnRX17Izk7b1IP6cT5Pm6iGCTqe7o8HsQZEVWo4npE+3whdmolbORqREQZWwT25v8Gk
         XTYxf4skLtDt3Rk/TDsigB7axg1hIwhFlTf02GKUZ2qpYRFAJfWNrYslcL2p2LeViBO7
         SUkM22ZgHR5ekZi5JZ/ekh3lsNdcn5ydhgv7f5cm95YrBj50J0uzXIAD5FlLUlnKKxO9
         bVa3o5jh5O6n1RQgLyZBkhwyycLB83kGI4bnZ9eMzThC+O2p9ZyuSEzeJ/R7HGr4NkyV
         UlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376160; x=1789980960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kR5F0K9Uis9I6dBmqd9WemQ0wgMGxaZJC6u0jihBbyA=;
        b=MLOuW9SgESjXrVUJrHnrettpoUh9tIH5Gg01yCe6VlvknMMya63HuXl6zum4h5/RK3
         LJJGGSGIcPfQj4AHnfCWwIeZX5RECguR2ipQlivVKM9PTHyJbp43urc1kpaMdub92Q/m
         AE6P47keWvEO/LpPPfO6hExJn30+d60zw02zHf+YXAWRKwSJ6HOeLzPGoSQXoSDsVk/I
         IeWNk9N0ZTBfw1DUIcdCuYBSH9ImsHR5i3jIwQQBaR+bHV0L/4QgUKUig7nj9Dqg5cCf
         HjwUX3zvZP4qLF8Mzfp94FTfe9X4VbIqWIc+ChUOJGRfrZQoh/KL1HC+9PQDZqzbf/2a
         tlMw==
X-Gm-Message-State: AFuF++lTVp7OY2zRm3zJiWZ0AeOFHYisbvjHhCnXsh+TTGz9oyMHStsZ
	EaUebRYergE1O19grvW+04y2TDoi7xVIAitFHvvN6bNTYhEkQ4e7/Do=
X-Gm-Gg: AYBFou1cRlcxT8rva4tvoCrS/VhQdew9pb6fJVnkxh16B1ZhpJUtdkS2AjjXE0aDJra
	LqOBC8KSPBDFEBEkFGm45bt42j3SIOmDYPbHG8Ka9iHjYm6WaDGZbvKbZKS/BmgeokScWPXs3a5
	Bz3YJt35wpfGe1uDHFIsThJD71Hr3NEFZpbQKcm4eNxfntiT51aWUTCr+xGqjJxDt0kUYG5wCbZ
	SHK/6CfrPiaqFOmcxrVIJ2nWsQPw1SpMMaRYRCl1IbXq4C3jS1Ioo9NZc2iYq2EWBXyzng4icee
	LncdKRLMsKlQOHjLer0lJcIB9jBOIXxg5T5ZynYjpvBtQRRArSWro5ahu3fFVXcVA5vgenEHJRq
	3GXzFfEb78gXWJgFMB0zP6cOdGj+RUQd/d1H8s3Fl0s3q0V+5DPZzyvO0ClEdMLjxkmgNgHxAOh
	Pzvj+Uy8gJJBRRGP/H1pGf+dGPR3kaB4DKPU0UgPvTqDsI+5zKKDfPgWkl2nyK7YOXhBo41WkZ/
	pVgVah3s76e
X-Received: by 2002:a17:902:fc4b:b0:2d0:cc92:f7ae with SMTP id d9443c01a7336-2dd6c5d0c4cmr37285505ad.3.1789376160522;
        Mon, 14 Sep 2026 01:56:00 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfd8c84sm44569105ad.62.2026.09.14.01.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:56:00 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: linux@roeck-us.net,
	tzungbi@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	triet.hoang.dev@gmail.com,
	wim@linux-watchdog.org
Subject: [PATCH v2 2/8] watchdog: da9062: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Mon, 14 Sep 2026 15:54:45 +0700
Message-ID: <20260914085451.891675-3-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914085451.891675-1-triet.hoang.dev@gmail.com>
References: <20260914085451.891675-1-triet.hoang.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert deprecated SIMPLE_DEV_PM_OPS() to DEFINE_SIMPLE_DEV_PM_OPS()
and pm_ptr().

This lets us drop the __maybe_unused annotations from the resume callback.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/watchdog/da9062_wdt.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
index 426962547df1..95585dffba6d 100644
--- a/drivers/watchdog/da9062_wdt.c
+++ b/drivers/watchdog/da9062_wdt.c
@@ -248,7 +248,7 @@ static int da9062_wdt_probe(struct platform_device *pdev)
 	return devm_watchdog_register_device(dev, &wdt->wdtdev);
 }
 
-static int __maybe_unused da9062_wdt_suspend(struct device *dev)
+static int da9062_wdt_suspend(struct device *dev)
 {
 	struct watchdog_device *wdd = dev_get_drvdata(dev);
 	struct da9062_watchdog *wdt = watchdog_get_drvdata(wdd);
@@ -262,7 +262,7 @@ static int __maybe_unused da9062_wdt_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused da9062_wdt_resume(struct device *dev)
+static int da9062_wdt_resume(struct device *dev)
 {
 	struct watchdog_device *wdd = dev_get_drvdata(dev);
 	struct da9062_watchdog *wdt = watchdog_get_drvdata(wdd);
@@ -276,14 +276,13 @@ static int __maybe_unused da9062_wdt_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(da9062_wdt_pm_ops,
-			 da9062_wdt_suspend, da9062_wdt_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(da9062_wdt_pm_ops, da9062_wdt_suspend, da9062_wdt_resume);
 
 static struct platform_driver da9062_wdt_driver = {
 	.probe = da9062_wdt_probe,
 	.driver = {
 		.name = "da9062-watchdog",
-		.pm = &da9062_wdt_pm_ops,
+		.pm = pm_ptr(&da9062_wdt_pm_ops),
 		.of_match_table = da9062_compatible_id_table,
 	},
 };
-- 
2.53.0

