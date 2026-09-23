Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F64B439F80
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148353; cv=none; b=PqKcgqbWfqTS6S94tlHTw0oDjsnmzNgYapZd6uTdV8ihZZ+2CS+I1fthmdB3h0ypLGleN2DAqcNzFS7rOLkmGlmGCS3n/SX0/xS1pX1ynWPTKw9kCFyUYBM483nFj3bOuKJplJqcpYIA7C8+n2bv/T2mZUNY22P+Kvq+I1q9UQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148353; c=relaxed/simple;
	bh=ztbtXJT8GDvreC8nZav70VVvbuRpS94hZVXtCzOGUic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qVSqCU7qsS3rLICFObWYNOuaN96uednhG/vRAmHaFoQlOcvQA+M42AoiCBKK7AOZl/IclaDxI4KchfwZ2w96DAbQntbAUP/FPjm2a7zLQIO7qJDI8LY4WeYA9GxVV4kUNo7FqBcXLfif8TastpRic9gGdke7mBqLl15ljvNsY0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhogjmTH; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhogjmTH"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb65437so375418a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790148351; x=1790753151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XUW9zlJk8CVD2x9WwkVbdCUyIQznruNWJ5NGWNfGy5w=;
        b=FhogjmTHx9RHhH0FAsb7BiPa6MoWguDcfE1b5Eumg8YLBiF10p9/jYCoc6DYTAD5W0
         DyUhuzacC8lElU7zU1xOkxF+Y5HIFBZ2YxHHHs2a0vpkx+dfwoobfQhOv+AEwo5i7DZd
         lS1JOfslD+fFOHGUAOrkzm8qoYxr5qtWqoWcy5hEvi/JhMy2XecoOfT7hCOqSAjWAIN+
         PfntDq2MUcpthsjElUn4N9i+LA2F7c4utv5rfcOdyBo0S53Do8AJV6uZgaRglHTGk6+w
         QT0WTnuChEP/1Nwo20mEzGoM6yIVM01wP48P2JzaiCzLh0/nbmOSyVTWl5MYlbNntpZe
         LWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790148351; x=1790753151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XUW9zlJk8CVD2x9WwkVbdCUyIQznruNWJ5NGWNfGy5w=;
        b=YokERq8DZh7gY5cQXhxrI18BDjVvAgpY68LheJdSIYG/nOLPGlPTptZ91nsQKAliZ0
         /c6IWmuj1VTR+aRF2zeFNQcEJuuZnca3qiUJmezWE7z/nLu+IBOZkM9mWOxYOGzuPqQj
         kMdwyLNhkC+P8ze4d8nVXxoEoDr1NsumsS23aKtNAlIvlgvqiesj0tPc04ro2OhsvWgZ
         wRTlYpRz8JNl6Ep7gOmBBRyXivSF3imcE70vAfGPGPFmzjz1DtO5WH6WP+aW6sQgR4V2
         eja5vYcA3wk9mGJYG/kvV8eZwkjilq8nGaFagkL/uhA/mrRBCZRNlpbBHDgMyq5Kyzqc
         MGeg==
X-Forwarded-Encrypted: i=1; AKwUvBz42tEu9+fSxRV+mXYofjTKFF0Y92+/d3DA7itXeOYGaSM1W8M1cnS49+ZI008IHNgSggBh+MG/QX9BLHg=@vger.kernel.org
X-Gm-Message-State: AFuF++nH37U3j2HJ7rECar17iT+YTs/glPem7BBTZ8zJrEMqkIZwfu/V
	yHgxzq1KGLU0pji0na2IgGKm0PL0kJCD47GjJUWhYV5tcb+uFBHlt1yD
X-Gm-Gg: AYBFou11L0E7BIpQMh72yHcINHaS+XxGLAJ/Kn4YKKZk5O+lg3lBvWDYAWeSTuVwa6q
	vG1ZfrpQnFsuzdCnk3MYjDC7JsdkCGILXWdn/jU0hh36Zfh/XKPoeRB+BQF6SosW2M3MOXYFTi4
	lOYRsLLpUUODPN8qZuASG8tTiEiWFPbDVSlTOMMzdl4O4BLjNm0yvOHG33jgPhhro0ywn8R5ymz
	gdhOgUQNA7jOKH2qM80OYxuy3IS8nq33jA+Oq+brLZM6AVSd/FwbnJ/119qO5glQZxex1Dz4GIf
	37DzTYAWTtaOAZ4ynRj3gWPor2P+rnamYqPnbFonFyRrCuY/AJRhGL+6Ry+vIOvokZSEzUlabyL
	SHycVy3XPzcsrqxOkwjZlZc4GSP1b9XBCZn8/4vr7E8m6aZX9he38SSTUxpXykAcWFHSYfk9dnK
	dfCun57JCk0rE2TQaNOg2506V//b+XioXRyL9A38g2K8GpMXuAjasNEumxas81fr1ZaoKjwZ/ZC
	ByiJ9M3Sk0bZqE9I2ppnnTaJInjHJAW71QJ464Z/l2FZh0v3jJ7aGImQwwJUH3BlKo+dyb4cxMx
	b/PhotypTgYxUQ==
X-Received: by 2002:a17:90b:270e:b0:39e:6a7e:ee20 with SMTP id 98e67ed59e1d1-3a07e659a2dmr1634764a91.44.1790148351423;
        Wed, 23 Sep 2026 00:25:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07db88298sm3940945a91.4.2026.09.23.00.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:25:51 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Chuhong Yuan <hslester96@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/2] dmaengine: ti: edma: Fix missing pm_runtime cleanup on probe failure
Date: Wed, 23 Sep 2026 14:25:32 +0700
Message-ID: <20260923072532.19307-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923072532.19307-1-phucduc.bui@gmail.com>
References: <20260923072532.19307-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

pm_runtime_get_sync() errors were not checked, so on failure the usage
count leaked and pm_runtime_enable() was never undone, leaving
runtime PM in a half-initialized state after a failed probe.

Switch to pm_runtime_resume_and_get(), which cleans up the usage count
internally on error, and call pm_runtime_disable() to balance the earlier
pm_runtime_enable() on that path.

Fixes: 23f49fd2ea9b ("dmaengine: edma: Remove dynamic TPTC power management feature")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/dma/ti/edma.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
index 8be9e71dab76..5254ce7b8514 100644
--- a/drivers/dma/ti/edma.c
+++ b/drivers/dma/ti/edma.c
@@ -2650,8 +2650,16 @@ static struct platform_driver edma_driver = {
 
 static int edma_tptc_probe(struct platform_device *pdev)
 {
+	int ret;
+
 	pm_runtime_enable(&pdev->dev);
-	return pm_runtime_get_sync(&pdev->dev);
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret < 0) {
+		pm_runtime_disable(&pdev->dev);
+		return ret;
+	}
+
+	return 0;
 }
 
 static struct platform_driver edma_tptc_driver = {
-- 
2.43.0

