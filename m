Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D51D39890A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790136529; cv=none; b=dNED1zd0AfVEaUwIG5lDRL0HlnWxilkWxCL1mjUvhBG4i7AQqkicj/NTKzKNx55f6ixf8tSjzelhwxaQGRs7RbN2xkRjUZySKOO4yo+tZXGkYeXGVl2Bt86n0SExOUjM3CcCd/xRj6YGTR3fqB4Jg0YE77zYCUxwET/Ucdgc2YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790136529; c=relaxed/simple;
	bh=jZoiwH0lFIbReLNRSoawrg2rKZWe9gy7jXsrTDDxANQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nNTkTFw+6g/w33hF/dwAN6uSPaQ+QZhTpIUGGOGRiVKqymOdiiW91vyIBKQuAzQtM6+2cP7Ilw6e+S4rQ8gJ2zYV8eX+z4sP3rfDwBM8LXiq0588s0FX/4ntAeLmdRVhbp1IPf8Mb/uEEr4DZdDWTo5tFstXw8YgIi7BETxC3xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUv49y04; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUv49y04"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d9004a1ac0so2046165ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790136527; x=1790741327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Wkrz/pN1mgyckYdtPh64jlSjIcJzRl/WW6ypFtDgEU=;
        b=fUv49y04QKFbQ9wZBNIctWYfWYSSuzV9JRLyrj2/UP7Vmgl8vm510ytVoRR2HdZtfF
         LF6HJFt8vhaDIBKIb3VX7vKZ9JSsxyT6rC2I/LVELV6b0bmxbhLdCIYZMiZuXXZR9Erc
         iyCEIueSALtIdF/ToZbvTmloZ3+Y5yh5PsUn1KC3IzLOLo9PFKZtIVWwT1q/NwkP1G+N
         vDhfkePABUDvjhOAVGM5GUFvNutmeYouppFuBiYXhF2Qrq400p75Kq+i9ZMFO9Or6rkz
         CNcVws75seqK+BlIq2hyaKVUXvd59BEUc2Ar8pC6T7QvpnKzWNthId8+FojacLhdi/Wp
         OuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790136527; x=1790741327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Wkrz/pN1mgyckYdtPh64jlSjIcJzRl/WW6ypFtDgEU=;
        b=ZCfuYYF6QeqdAZiWa14y1Fd9uwL5B5PK/hlSo0SoW5luuX5wWYmW2S7Ycwn60XUouh
         JJ1PVTSWDXgKyXnzuO+cht+NfH4NikYu5MwwgB8P3/a3Pz7nZS1OlMcjCQc+q5YaSybF
         SF912YViW+Mjn3PW1MCluwfOUu6ZXvUBllBNonbR5P46TJxVAM09xQ87sPyMn3omP/Yh
         jx7m4WQVIPiez2mjBLejYXDvD/PEb57cUkn7DnXrN6vMsxi1ZMoFeTjOgx09AI7TE27J
         ysYA1N1EIYfkLGOkefG2TwS43H2uyg0Ou3ctXLOqbhL+Ino9vlw+YlfSmJXvH4BEwRGO
         r1kA==
X-Forwarded-Encrypted: i=1; AKwUvBzBcvxVmRhlGa/ra1+AYhDCAPJ93PFdzQHhVcsTXfoXIEAkZpMnX5wf3ogJLo79sBquvu1WxSkwIzJK05Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nhsBX+dF1mYJ2e9UWMk1U5QdMcENNrIrY8z4wYlIXTPM8Ok1KA
	IWXJkMYZ2C+hmvxaNeN1XGczeAKCXz4sYq8DJd22SnzFZ6PSv02FJJ+N
X-Gm-Gg: AYBFou1x1gIOgC9AQ1uhGOAU8ZHoB5clPlRxIDlfLd1kEzwYprBo3XTWuzOK1AAp238
	0lT42PWcG3FAmhkcoCgilNJRkxbwOtkz8SnLMfm3b5s3rDb4GNoaviYv6hHy8hNrbEWSUe4Fm7c
	mWKTYoeIyoL1vPyLktPLfqHCRpJoUpUf2jA175nn9OycL3BXOivpJhZzrenFzd52z8ydwt4YwOz
	T9AGDNrze/1XI0PnMiFvPiPhGR0HVvibxAseXqOKPoE3SU8GIbEyTZphxqMhB6m61LnZUakA4+Q
	QI2kvVBSIg9Bz6IGTC0KLikLHcHX1Wnwg0RoZhUwcHmaxjzLtqWPWTI71CsUAdAto/JC1pi0hHE
	iqOs8yCEVEXx8UWFgBu6p4SDwZKDW6HObkqTzWxlW+/KytPN5ZPHMIdKRtTVLU5TRdCJTkbLfEc
	RYf/qzH0ZIZmkLAiwvLA2rVI9eDGtCnWHyVuN5bN9VO5faCeO5tUAnR5ip/MGeXV6qHJR6ISMxG
	Fjqm4lRdHSAtkGgAFYePcFBPZKNWHpAOzNMUs7RNrh+sVj9xtwhAtmM5c/selJOc/F5YoGuXtHB
	x9dsybDTD+Y9ja8=
X-Received: by 2002:a17:903:1847:b0:2dd:8b0f:70ba with SMTP id d9443c01a7336-2df69d33992mr12697625ad.7.1790136527473;
        Tue, 22 Sep 2026 21:08:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a60c674sm3980515ad.81.2026.09.22.21.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:08:47 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Chuhong Yuan <hslester96@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] dmaengine: ti: edma: fix pm_runtime usage counter leak on error
Date: Wed, 23 Sep 2026 11:08:29 +0700
Message-ID: <20260923040831.10936-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

pm_runtime_get_sync() leaves the runtime PM usage counter incremented even
when it fails, but the error path in netcp_probe() does not call
pm_runtime_put_noidle() to balance it, leaking a reference each time
resume fails.

Use pm_runtime_resume_and_get() instead, which automatically drops the
usage counter on failure, fixing the leak.

Fixes: 2a03c1314506 ("dmaengine: ti: edma: add missed operations")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/dma/ti/edma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
index d97db5af3555..8be9e71dab76 100644
--- a/drivers/dma/ti/edma.c
+++ b/drivers/dma/ti/edma.c
@@ -2345,9 +2345,9 @@ static int edma_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, ecc);
 
 	pm_runtime_enable(dev);
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0) {
-		dev_err(dev, "pm_runtime_get_sync() failed\n");
+		dev_err(dev, "pm_runtime_resume_and_get() failed\n");
 		pm_runtime_disable(dev);
 		return ret;
 	}
-- 
2.43.0

