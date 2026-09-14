Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26A6412BF1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376182; cv=none; b=F0oBpzVVT4RK+M9f2EO6bv2FOvtR1jaUR3HNPa6tZQWKWNTzk9UjMDi14ZJp3lmLpDFlXBqVnqizHfBeeEiPTj3/J+OBkMRNsQS0cgB1OJPx0I1bx1c468UKZQ8+ljLsu/OxvxHUCfrWLEdid0HKEUOZpIJHBxn/wvNwc5WdgDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376182; c=relaxed/simple;
	bh=Vjq8CiV+AcjbGl5WrMdRx4kgcRKSqFinvXEF5hweCog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rGLZqlKZ4XyjRNNIDe183FMYw400nA3RWSDo4x/LrPlGKmiJabqNRdHvFoxLqvEnBZE4tpgbWvSPHMdNDEIvboK0aZBv4Ah9MddhhGEJJxeiEgMXI9orWaxeZbgF+ZjmYyIdEivnKF/97mlJYGrql71CfKaoD0FMhdcq/HDeXxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOCb5vLN; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOCb5vLN"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2dd020a2e44so27490265ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789376174; x=1789980974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tm1uWvgjniSyNtPcFMhaA/1vZV2icpLuG4huWPMXaXk=;
        b=TOCb5vLNYloaaLbcGMgRk8mlY2rCFxzMr2EiipdYOwGZ0ca3jvsrMMRSICt/BbWrdh
         P+qqq1MKNr68P7nQmHB6XOogjR0wDMQGNotfxuEJWEWRq3g0x5RfYyd7woMwfdm4mkMt
         ck4iRqc8sdZQtzoPr6Y3jEzqBi1HvBsFquFhWHRr5VSYWCfvN/Ww5bL8+pvSsT4PEBmW
         OlARlYaTk/XaXShPsFAJiO7KzQvt4J5dluHShZfl02Prgvh+GCBzD6echUCrjWWTOUNh
         O5kxhU/fMILZrPSUWHRe++B+HCzMEohdfIpickRjRJOShT7JgRXOTguc2ecWqjdbP2to
         gl+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376174; x=1789980974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tm1uWvgjniSyNtPcFMhaA/1vZV2icpLuG4huWPMXaXk=;
        b=QSV6Unyr1FkmN6dKtvGaKqeDIknMigUeXSzUEUw5r5KYwvVZGS2nJ3HRisrwwdteXA
         9BW09loxBq1gh6z9GnL0q0RtpqSMVtKIsBuZ7gl7ozJQZRttoJ+krLXZXZQTkfR0nHZW
         0qvMNrnJOeL5TOBkyoeIi1DDTOnl/BhsMmasTBUDATbP3wlElom6dkTVdzJVd3t8LGtD
         B78zjxz05A4FO3FY6rqPrJ0lMbpShfm0DQF6iXs/HfilEM/jgMsQaU/VdnvO77n7QGf9
         Jo/ek6XdiOoNgszaehAAIMYcjEuw5Sg0cj6WBOviMU230v/Jqdo5z7Ypx1IEY/Skm1VS
         HLVg==
X-Gm-Message-State: AFuF++k4ssPcfz37FYEauDk0oS5+Yl6COKncqju0BWjZNgcaSbXwqqtG
	DPoapAEBnvVt48/khtnS2HgMMC5rtjTeZXdRTaw36qZOfXbdM1Cga4tVhyqEHZ0=
X-Gm-Gg: AYBFou2a7T+UY45tGF5YXZzDET5Sagk4fOURNXKczDgRG6e9Iuq8FYSNpXxbV8+e7lH
	+e1t7VUKZu0bm/pDBSR5iFkZ1THsXqzgk4AC/xo2iXYu9/wtJL44n2hlJHSD2PZpWdeHf3HdRjR
	3J/1GGB/x29tlwZSP8PVYU2jc2V2RvMYcOhtNpUQyHi/ccjftdA9QBKBG0Yrdzme8IXG4f00TWu
	7PFe65etRsX/3LoALINFX6sPrkyFJkR7+ihZNX9pwgZl4o7BC0Z32UAJPohrQUBLeTC+gE6ZKR7
	/NAbhy3hxUCHiF2cRwCVc1MgL6d4zJ7+rfJ6yAlf1UqyYYLl1ZQbtAWR8a2AHq37lIEx/yen/NI
	aowSMzlXse3Vf5tTY5GKDzsf8hrsqPVQv+MY2x5sONcNBIZTU7pA4fE/ZQ6KOeLX37AjQFwXLEl
	KZ7g50wlNP5zCZXbcPHFKhI3qSJpMwOW4OwqP+W+LpCaC1qwG/ckLHi7JB/PF1rDgQyUAuC6lzJ
	/6Qbul64h9x
X-Received: by 2002:a17:903:458f:b0:2d8:d4ce:9f32 with SMTP id d9443c01a7336-2dd6c70a474mr28892895ad.16.1789376173904;
        Mon, 14 Sep 2026 01:56:13 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfd8c84sm44569105ad.62.2026.09.14.01.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:56:13 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: linux@roeck-us.net,
	tzungbi@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	triet.hoang.dev@gmail.com,
	wim@linux-watchdog.org
Subject: [PATCH v2 8/8] watchdog: stmp3xxx_rtc_wdt: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Mon, 14 Sep 2026 15:54:51 +0700
Message-ID: <20260914085451.891675-9-triet.hoang.dev@gmail.com>
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
 drivers/watchdog/stmp3xxx_rtc_wdt.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/stmp3xxx_rtc_wdt.c b/drivers/watchdog/stmp3xxx_rtc_wdt.c
index 060447101f48..cdd02661758c 100644
--- a/drivers/watchdog/stmp3xxx_rtc_wdt.c
+++ b/drivers/watchdog/stmp3xxx_rtc_wdt.c
@@ -114,7 +114,7 @@ static void stmp3xxx_wdt_remove(struct platform_device *pdev)
 	unregister_reboot_notifier(&wdt_notifier);
 }
 
-static int __maybe_unused stmp3xxx_wdt_suspend(struct device *dev)
+static int stmp3xxx_wdt_suspend(struct device *dev)
 {
 	struct watchdog_device *wdd = &stmp3xxx_wdd;
 
@@ -124,7 +124,7 @@ static int __maybe_unused stmp3xxx_wdt_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused stmp3xxx_wdt_resume(struct device *dev)
+static int stmp3xxx_wdt_resume(struct device *dev)
 {
 	struct watchdog_device *wdd = &stmp3xxx_wdd;
 
@@ -134,13 +134,12 @@ static int __maybe_unused stmp3xxx_wdt_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(stmp3xxx_wdt_pm_ops,
-			 stmp3xxx_wdt_suspend, stmp3xxx_wdt_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(stmp3xxx_wdt_pm_ops, stmp3xxx_wdt_suspend, stmp3xxx_wdt_resume);
 
 static struct platform_driver stmp3xxx_wdt_driver = {
 	.driver = {
 		.name = "stmp3xxx_rtc_wdt",
-		.pm = &stmp3xxx_wdt_pm_ops,
+		.pm = pm_ptr(&stmp3xxx_wdt_pm_ops),
 	},
 	.probe = stmp3xxx_wdt_probe,
 	.remove = stmp3xxx_wdt_remove,
-- 
2.53.0

