Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243E8411FBB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376172; cv=none; b=t+fHMWMqA2EAO43icjYIuD7BPDrGz/GDCkDIyIlwDALBQxb2RCZoxe9HwqkAG7yBIXXiwpi8QhvMBrD+xkyW5tZmV37AaIspSueAEQZvU1ZRbwIt/arknk7SzbkcMqmaMipbyRPrqJSG/IDNZ7NdmQ3vKLTXrHh9KzvISI9e1s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376172; c=relaxed/simple;
	bh=Aq13WwFZ5IUb4sLjIzePFF+aTf4ieMLXlYis4xhqArU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rsdSYovzUfF9DSqai7E97aK02QFmC0JTnHCx88OFe3H+lG91/TzEwvh2wq3hXJloxh700LS+fuvIGTo7JThEbw98dW//uO3AhKfGWBcrRDwXUqIckvrv7CtFZWAcOtN9KnB/sZYl4YBjyTqEtwoEAfmcZCq9lq0Bl0ZKfNjnfqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTtTcFYY; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTtTcFYY"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2dd020a2e44so27488905ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789376165; x=1789980965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sRCQV878jtq6GctMBbJVislS20aqHZzAEyWzyuDnmA8=;
        b=VTtTcFYYsygX5/xlYBq8KHZCLhyoHqVlQTKoXXOUtX3azlRHeAD9XVEMDEu8vu/4cc
         ubf6wlL0quQM9mvT/x5ZjpUXCnpWA8tiTRqoTICCv0ybt8DS1YKzNrP7+n0cd3G+i6Ss
         aFeULxCAxzWnV2WNXHHskUjJXVEu/f+vFnKmZZM1Mb058XeNtXtyhes0y1e9X2zoFDF7
         BFPQ9q0gfR2gQqphEijB/fSupkDrehN/b1++pQOIMw+19FQv1bPIc+n4eTqvr5t1lRHc
         ECF+VwkZwaLrs99dZqmTn901NOtJPswOGCBa3KBhXCZmCOT83Z4b9nWn4fg6tEUj2Ldm
         7eIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376165; x=1789980965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sRCQV878jtq6GctMBbJVislS20aqHZzAEyWzyuDnmA8=;
        b=R82XHDBX+epUr7zdzlHiTDy9gwLZrtWtOeoOXVQ6BPSENC6LR4ejYNJg7QP9l6F8V4
         ETpY4Mo+X2lvPg9oc/hYAs59WQqF+AN5acdycxeaE/lXMthbVlzOwLG/af3TQ56G1g2N
         zS9G23APTpk7QfQvKKLyZuqIC8SPK3jufcYyoIyaVjyXVpyTn89Kjg1WgPOb0XMuEKfA
         goUadKeK9sMeRPEf3NdtnqkF64LhpKc40fnEsfNQojyEQ4RanV/bXqq9B67+LZSKCmYi
         hIJV8fQLmSxOT1aQDPigJhJhmOv1F7QnwIkn9FXug4SbrTYYJgsFKVY19XQ8WEIB8/BV
         6YcQ==
X-Gm-Message-State: AFuF++moD2Q8vxIpesCoKSER60N5yOo1l5xxuFMx6wksAnrO2niTbLuB
	qwrO7xsGsXs858NK8m9rL+xpEcAp3wfYqWZXu7v6DMuChlR6k7sMOus=
X-Gm-Gg: AYBFou04b1q+8G8AEERuSriSKsmTdIQ0t+Kv5F7XgUmkFkra3lcjamTpzZAMoV/0mMs
	CORSwii0X94rklkVgwXsjNcK2Sc158L0yt21njbnQzLkf/ekqnom7AlNC4bxxwXBtFn2+GSvNFV
	KXTU4eD54ow+swrLZOyKCL9ehST5Z3v/uT0sGeajVQg557kPHK063C+bLDzGIS9rD4psVSxlhRp
	N18b+8EcFMcxPR/iWweaBLE2lBI0H6hehQcgRSROUpkx+WpF+Wfo5vmNoRMTgasKOkIKgjHSwtq
	zpM7DP53ho7yymrmTkrCfGYGKyC3kagSBbTY2LxeKGWCCod3Gm6Lozp81yFfmEb0M7YpRJKCYs3
	XEQk+DDDkpRfpNXcJkni/GpITSL48WKv0621+uOku19PYaKv66CHREbfgmny99FFF78eIMEsUzj
	NHhwJQh8MSPf0aRys4GZBcj5NC2p5Gvtw7TLlQbMBxHEehanLbtA3TiPaLAPKn7R1DEz+HuZ+BJ
	43LwnsFJagq
X-Received: by 2002:a17:903:37c7:b0:2d0:cc92:f7a9 with SMTP id d9443c01a7336-2dd6c5be5damr34524815ad.4.1789376164939;
        Mon, 14 Sep 2026 01:56:04 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfd8c84sm44569105ad.62.2026.09.14.01.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:56:04 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: linux@roeck-us.net,
	tzungbi@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	triet.hoang.dev@gmail.com,
	wim@linux-watchdog.org
Subject: [PATCH v2 4/8] watchdog: msc313e_wdt: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Mon, 14 Sep 2026 15:54:47 +0700
Message-ID: <20260914085451.891675-5-triet.hoang.dev@gmail.com>
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
 drivers/watchdog/msc313e_wdt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/msc313e_wdt.c b/drivers/watchdog/msc313e_wdt.c
index 4a5cce2a16b1..a77ff57a4457 100644
--- a/drivers/watchdog/msc313e_wdt.c
+++ b/drivers/watchdog/msc313e_wdt.c
@@ -178,7 +178,7 @@ static int msc313e_wdt_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int __maybe_unused msc313e_wdt_suspend(struct device *dev)
+static int msc313e_wdt_suspend(struct device *dev)
 {
 	struct msc313e_wdt_priv *priv = dev_get_drvdata(dev);
 
@@ -188,7 +188,7 @@ static int __maybe_unused msc313e_wdt_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused msc313e_wdt_resume(struct device *dev)
+static int msc313e_wdt_resume(struct device *dev)
 {
 	struct msc313e_wdt_priv *priv = dev_get_drvdata(dev);
 
@@ -198,13 +198,13 @@ static int __maybe_unused msc313e_wdt_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(msc313e_wdt_pm_ops, msc313e_wdt_suspend, msc313e_wdt_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(msc313e_wdt_pm_ops, msc313e_wdt_suspend, msc313e_wdt_resume);
 
 static struct platform_driver msc313e_wdt_driver = {
 	.driver = {
 		.name = "msc313e-wdt",
 		.of_match_table = msc313e_wdt_of_match,
-		.pm = &msc313e_wdt_pm_ops,
+		.pm = pm_ptr(&msc313e_wdt_pm_ops),
 	},
 	.probe = msc313e_wdt_probe,
 };
-- 
2.53.0

