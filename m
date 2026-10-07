Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F51749A3C5
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 12:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791376072; cv=none; b=qhigjpfcrITp8vdYPy6BV7LpBUZAVUgy3gryjshcSoYweP5Cv6J5MPzh1lQM9O8y187CCAQbPuEn3F58p3lVhDa9J7e5DukWLTB9eO7TMOtgBTf+8YhAUlEGVqbwtM7O171QM6tPwxDex3BwZVrc8908zBnbdumS2KuAhxxa0IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791376072; c=relaxed/simple;
	bh=mrYDL8Jc5kHOxo/uk1bef7rw5P9jwUrrYQcpUUCM5R8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lRfH/n6/p+j2YC5JxlMygTkMvZZ9jlgvp1V9If28OHsGkMU6bXa3225mCufZwprEslmqPhFd2NZjLdVvWTyHQxfQyFDZNnFpmEMqqcl6vCm4oTVZmGbfPmcTmRYJBMy7+ya/g30KoniLAgntR+E2uaYrJqtgwDCkGhX7eU38FpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BP0pbMui; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BP0pbMui"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3a4c80d3d5aso2072677a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 05:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791376062; x=1791980862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BhdLoXtc9kkNzHYF4QrrqBcMnO9w0fLSquEWS/rnbxY=;
        b=BP0pbMui3jhElTXQYCUBTYnSKzfUDgvophxTlHJaVR8OoxUZmgv9iRGW65Z5YmaR8V
         CBitjewxxi9zRnXJ6vjMo6wlBleCVDJA4XBb8jiUyImVGj720iHtox3vYGufseei35xe
         S04u/TNrLygaad0S2y93/kMiTmdjr1BEnvf3WMG+gLSJfnd4rKXksmedeONwHDF4Ypsh
         6yCu1KKM8RuRwN09P2e1Rvmy2wDgXGEFkRopDR9QsYAdjjrI0k72w40aItEtNKfKgpnS
         8JQHYGXlcBDtaexYdjRvZACQhgDxbLMFN9rHmNDnIdqFuzQ061AOJRhn0DpURJEjAdzC
         q1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791376062; x=1791980862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BhdLoXtc9kkNzHYF4QrrqBcMnO9w0fLSquEWS/rnbxY=;
        b=IEV+D8AW5VnlYP0ByIxyimPINyDer61WKuYo+slEF9b8CXYeBupwPkMc/dSgEI8W/c
         oSVLtW2FUx89Y7dqfhnfXhPL/BrddnQIZAWZdKO5fviu94JtunOfOO7YywBCaZMUeNb3
         6pWmLMh3pUtACzsd4fOPcK/y4WZc8v6ARoBX/J6CKWFIR+JUUjnwP6NKQXauD0vb1wTN
         EC1lej4UnmUASD5+7REwFvRDmMisQ+Bk3u6AD7MvWQajRQirWGrlXMMLTYYzGM2/Sq20
         egw9O8IFgaxkatFVzr9buVP4QaDTOAezlg8y/gy7V5SQBSni2AokUP4/lXsDfwPSYqww
         V9xg==
X-Forwarded-Encrypted: i=1; AKwUvBzXXYjJjnsF4qvEro7GvIYetDNIU1marZOccriaBXL8/5Nnw56frhvi2ry2tXQgYc8pKOPEDg40CYWwNl0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJW52xC94ZVeaVTuSU4DXxXFl/gr5G975J4tDSnLOolSdjoq7Nz
	e18OSJQcDIGo9li9qwm86vgY3cTv9ZnQRJ9Ez7bhBHYH6MN//XKLUDYW
X-Gm-Gg: AYBFou2QEqcUYmATjHgUQO7YhJpQGLROHow2+C329lqPqsCxi56zbQTp+es/WmxnST+
	t0bok5uD0HVuyBAuiW4cWRFb3fP3WSJdnQ2+7HP1rLs+jei2EBQUKQGLUBgeST6iGi2JHtIUSG5
	dmjx/LYMz0SFdBIYgzCgttkcQ2/aaYN0xSUDQY3Ej9xJiVsYqUaJmZr7ggFj4qNvw8cAgC/JN6o
	D9mvzNx4B5W/Y1NoJXvKnHIiIHL4MEmSsXw6L08qawm/zhaxweFVrKVh+nR3DuXQAtCpxwLWX9p
	VXZNq1BQXHkKU/EQ90/PRL1Cq/A2p34EDZMkVwbpGo/rMO+ankTeXoWNZmH3xDjbc3BJLO9KSZt
	cBQjoRIyFFmqKSayPDe2nPAMkVe/7xkJlTTDqbGAxcjQq18wOjwpveH5uBvrhn71FF6+EE+baHX
	7206GCxkn0fJLkvtuQVvkEmC3HjBbpa4FmnIWSMV1iGFtiyVfNv/pEN+s=
X-Received: by 2002:a17:90b:2884:b0:3a5:364:dfd with SMTP id 98e67ed59e1d1-3a8a0cd1a2dmr1992504a91.31.1791376061688;
        Wed, 07 Oct 2026 05:27:41 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::8534])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a88eff2146sm6384956a91.10.2026.10.07.05.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:27:41 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Sinan Kaya <okaya@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] dmaengine: qcom: hidma_mgmt: fix autosuspend cleanup on probe failure
Date: Wed,  7 Oct 2026 20:25:34 +0800
Message-ID: <20261007122534.194286-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hidma_mgmt_probe() calls pm_runtime_use_autosuspend() during probe, but
the probe failure path does not call the matching
pm_runtime_dont_use_autosuspend() before disabling runtime PM.

Add the missing pm_runtime_dont_use_autosuspend() call to the probe
failure path before pm_runtime_disable() so that the autosuspend
setting is properly undone during cleanup.

This issue was found by manual code inspection.

Fixes: 7f8f209fd6e0 ("dmaengine: add Qualcomm Technologies HIDMA management driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v3:
  - Add the missing changelog.

v2:
  - Keep pm_runtime_enable() and explicitly add the missing
    pm_runtime_dont_use_autosuspend() call in the probe failure path
    instead of switching to devm_pm_runtime_enable().
  - Update the commit message to match the actual change.

 drivers/dma/qcom/hidma_mgmt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/qcom/hidma_mgmt.c b/drivers/dma/qcom/hidma_mgmt.c
index 4805ce390ffa..d8c56af5882d 100644
--- a/drivers/dma/qcom/hidma_mgmt.c
+++ b/drivers/dma/qcom/hidma_mgmt.c
@@ -310,6 +310,7 @@ static int hidma_mgmt_probe(struct platform_device *pdev)
 	return 0;
 out:
 	pm_runtime_put_sync_suspend(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	return rc;
 }
-- 
2.43.0

