Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFCB411661
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376174; cv=none; b=nc8y45JB8w3zF3veJwShYJgJaeX1yiX2/YKvBKX4ySNUuj4zlXpxnsBTXqOHERsoekfr13gjFLxNYOIrXQpOGswFiYk/Ss5RUfEVBZ6y+DvqvJ+mjqrKwcJuESgGXbLFciXtbINIRE6anHwcEvsOY+ny7ixY60vlH1gg4aE5tQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376174; c=relaxed/simple;
	bh=RTx5WaxsisAj0HLL0P1fz576+Kb5f7F2t2qZp8J09GI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DYNUzDWofhHeNwlUB+lEYF1ZmaAqWmZX49xeonXUvI4L1ZuQ4MvILMdVzTcNJo8QkU4ZgtPprQuYiVD0fLwbM6G9lKMWHwcHW1QU4OqaX8Kdcck91iGte4vr0UmZwBdpzFC5CSiydKSL2TcNBw3602Vo8g8tahtAdQLYzqbJ1vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NbWC1qTh; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NbWC1qTh"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db1ca06b03so8524455ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789376163; x=1789980963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3yUcjSw+ELbT5990YXFbEuKGTao/RyBM42W2/FthmwA=;
        b=NbWC1qTh7hi42rw5zgZTtr9V/AVaf5xV6JToRdPItIuCofkiwsOKr3ZrrEU9jJa6Ox
         3EL9nFh1i7KV7O0MWPoIbi+eg6SZyEP8BTxocWpySJFkh9M8TUsqyFZSFQWJ/picEcXa
         s8d64JM37N1zX3i/BtvGmtWiSJCWJlDt2s+t+hpkmoA3OUHy4cY/SUZoGWZIYpyAs8xc
         K0HxPiGrUgpc39bYlbxbwW9XddvzM6ZW99N3TIAzAiSpP/Vyc9rXm1biwmvUsvuXF9hA
         80PBESHaqwUMp0n+hSGJbE/+0VsSMB6sNpfWd2+lq/4RfebzunpBYZmDHlPNQkao0IOR
         lBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376163; x=1789980963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3yUcjSw+ELbT5990YXFbEuKGTao/RyBM42W2/FthmwA=;
        b=KIBmFozWGOas3Cea7nXKcQKW09dXBOaSolsBtSdxBcBkeXoHAgtAvSxCZN+cL5hR6l
         J61w/Leu3Hw23DjXLSQJhS8P4Ug4eGB7JFDcxI1QFz0uxB7NS+b8pMRMDvSgUtzwaIjG
         5Guf0KScUBW+LRWqF1ulKxIKCQyoXTcDA7rsn3TBimbkFGbHbDrB/jD/kp5WUHEH9pDE
         pSdqyepZy+L1LY+wLXH3Ja/Em+kX+OXHssX/BLSvgv+EgN5SrCqZ5aP+sELttNXBVT5l
         1p+zDy11i395dZsNfECsMdadbpxgj38MdybVmPIFkZ98cEH2zOZRjaKf13VkVfDJP0OU
         fE4g==
X-Gm-Message-State: AFuF++lrTDzKh4WQMeX9OnDXCrcL716ro3s1l4gyqLtsrlsGGvGFTMBy
	PwviMFuhWBB3z7bOQKEOgHTlH2GBErCr7p7i55b+Xja5TcAt0hceR7g=
X-Gm-Gg: AYBFou1q+1a506ds6EhU0NNdUQDYVRylKqaHLY/ZzWvU6aHBwpcMS/iVhC9VMisvtLL
	k0eG+j/l4D3VaieTpUI6yLFSR2dcZWrCIW9bA8KGrBAd9d3p2zUtMBvLB10qqLrQL+AWLAVWW9O
	UfBBKzDSsR6iKAAeVgs1NWaWy+Q+pPLg6XMtncNNNYlyDxf7xt5J0H0J166prF0Bj/ANXler+Lp
	elG0xf0JlauXENYVyAjZVf6kOKvpnWwRuJcW1+BPVTGB0PDr/bBwvpgq9snxOtuaSKTsqpc/xDf
	Z3J2sThWpmnbvuYgQD87nWSD7640R54E2iQ39esj6Ev8QDrc/FdASqOZo8F1t9wir5X4xo3wLGf
	7Zret19k4uVwXkrI6VTln01eo5zanHY2F+jmYswTwJjcyNUodRnvIXBpEeUnhxfKedGYHc5z7ES
	cRXdetx+XQsNfdq7LKvvAOExboyG2Jq3VhUwBIzRvV0+R24BVejjty5sXa+2wLO2EBQDgV7Ds1w
	xYRKDFy+UTn
X-Received: by 2002:a17:902:f68f:b0:2db:3d84:efff with SMTP id d9443c01a7336-2dd6c60eba2mr20724315ad.2.1789376162686;
        Mon, 14 Sep 2026 01:56:02 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfd8c84sm44569105ad.62.2026.09.14.01.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:56:02 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: linux@roeck-us.net,
	tzungbi@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	triet.hoang.dev@gmail.com,
	wim@linux-watchdog.org
Subject: [PATCH v2 3/8] watchdog: keembay_wdt: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Mon, 14 Sep 2026 15:54:46 +0700
Message-ID: <20260914085451.891675-4-triet.hoang.dev@gmail.com>
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
 drivers/watchdog/keembay_wdt.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/keembay_wdt.c b/drivers/watchdog/keembay_wdt.c
index 7c8e53921e40..2c187b20a5ec 100644
--- a/drivers/watchdog/keembay_wdt.c
+++ b/drivers/watchdog/keembay_wdt.c
@@ -250,7 +250,7 @@ static int keembay_wdt_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused keembay_wdt_suspend(struct device *dev)
+static int keembay_wdt_suspend(struct device *dev)
 {
 	struct keembay_wdt *wdt = dev_get_drvdata(dev);
 
@@ -260,7 +260,7 @@ static int __maybe_unused keembay_wdt_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused keembay_wdt_resume(struct device *dev)
+static int keembay_wdt_resume(struct device *dev)
 {
 	struct keembay_wdt *wdt = dev_get_drvdata(dev);
 
@@ -270,8 +270,7 @@ static int __maybe_unused keembay_wdt_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(keembay_wdt_pm_ops, keembay_wdt_suspend,
-			 keembay_wdt_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(keembay_wdt_pm_ops, keembay_wdt_suspend, keembay_wdt_resume);
 
 static const struct of_device_id keembay_wdt_match[] = {
 	{ .compatible = "intel,keembay-wdt" },
@@ -284,7 +283,7 @@ static struct platform_driver keembay_wdt_driver = {
 	.driver	= {
 		.name		= "keembay_wdt",
 		.of_match_table	= keembay_wdt_match,
-		.pm		= &keembay_wdt_pm_ops,
+		.pm		= pm_sleep_ptr(&keembay_wdt_pm_ops),
 	},
 };
 
-- 
2.53.0

