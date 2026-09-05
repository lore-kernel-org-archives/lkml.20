Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17412FBE1F
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 00:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788569025; cv=none; b=cWxgNJiNkLEuG//aBm23CN3XQ3Ui97TsgKsOcveQC8v6kayJAY4HVRDnYLSNAViOJegSrjDvT35ORn3gFFX2EGMjM3qPguEqa6vYt6kcZVHxO9cA7bVKCOHetp3vT6KRoz1jrrv5DObE0laqss9m0KIEI1uuWRjk9FeQU0TAhPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788569025; c=relaxed/simple;
	bh=KALISCleQiLUoj5uIbbj+6E2d/lbdP+ozOyYlmDO3Bo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XOS3OCoZqvSluADdQlSeXsobCJJjfI+ULlv8D66tLfp22aOwLAZ28Uf3cpi3/Vb73Le+29Irrn90cW/loOc7RjGl+nPnl27BeqVnk1lsHz1ZbKhnFkedPYfZoxVYcsOuXBmLY5uEY/3q++Ynm84HwRvD4YcmlIfOb0wfuPl4Jbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4N/ws20; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4N/ws20"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 000C51F00A3D;
	Sat,  5 Sep 2026 00:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788569024;
	bh=mqjpar+f+Cbdq0pcg7A44i7twxcYoQfNarTSIk1nh1I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=D4N/ws2031xrS0VVK2n/p92pVVAXHWTnmNjUpCldYgvY5M6YP4tIOwHoxDiJdIHiM
	 qwYJvkTZgS96Sb9IxXsc2BrHkoqHNAdtQNLo5K7Iu1llqaJz7pcXA+7ivVuWxhQAAU
	 t/y+C47gui4QrntSq/QUzF7dZhuhLg2NA8uwG5rACRDqcLfoNibHZVtXZLhNERQZL8
	 ByOoXkSTjYB7U9GLX3OO4bJPvrWQQM5GW6PFmM6jWPHCug+oYuXF494x9gq5ZSN6ET
	 ybJSumPbIkqqW526GjSc7R63xKSPL2TdOtDZUi0CzNnyjB1cYPMzH5rRLpIssd5VXc
	 4OLEzd7+wVT6g==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 04 Sep 2026 19:43:21 -0500
Subject: [PATCH v2 02/19] accel: ethosu: Fix probe error cleanup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-ethosu-fixes-v2-2-3767738756a4@kernel.org>
References: <20260904-ethosu-fixes-v2-0-3767738756a4@kernel.org>
In-Reply-To: <20260904-ethosu-fixes-v2-0-3767738756a4@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

Once the job scheduler has been initialized, failures from ethosu_init()
or drm_dev_register() return from probe without tearing it down. The
registration failure also leaves the SRAM-pool allocation in use, because
the platform remove callback is not called after a failed probe.

Unwind the initialized resources on both paths. Also do not call
drm_sched_fini() after a failed drm_sched_init(): the scheduler initializer
already unwinds its partial setup, while drm_sched_fini() requires a
successfully initialized scheduler.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Adjust for previous patch reworking runtime-PM suspend
---
 drivers/accel/ethosu/ethosu_drv.c | 13 ++++++++++++-
 drivers/accel/ethosu/ethosu_job.c |  6 +-----
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_drv.c b/drivers/accel/ethosu/ethosu_drv.c
index df76253d01a6..c684e28ac787 100644
--- a/drivers/accel/ethosu/ethosu_drv.c
+++ b/drivers/accel/ethosu/ethosu_drv.c
@@ -375,9 +375,20 @@ static int ethosu_probe(struct platform_device *pdev)
 
 	ret = ethosu_init(ethosudev);
 	if (ret)
-		return ret;
+		goto err_job_fini;
 
 	ret = drm_dev_register(&ethosudev->base, 0);
+	if (ret)
+		goto err_sram_free;
+
+	return 0;
+
+err_sram_free:
+	if (ethosudev->sram)
+		gen_pool_free(ethosudev->srampool, (unsigned long)ethosudev->sram,
+			      ethosudev->npu_info.sram_size);
+err_job_fini:
+	ethosu_job_fini(ethosudev);
 	return ret;
 }
 
diff --git a/drivers/accel/ethosu/ethosu_job.c b/drivers/accel/ethosu/ethosu_job.c
index 8dce74db0cb4..ec65305e0cd7 100644
--- a/drivers/accel/ethosu/ethosu_job.c
+++ b/drivers/accel/ethosu/ethosu_job.c
@@ -355,14 +355,10 @@ int ethosu_job_init(struct ethosu_device *edev)
 	ret = drm_sched_init(&edev->sched, &args);
 	if (ret) {
 		dev_err(dev, "Failed to create scheduler: %d\n", ret);
-		goto err_sched;
+		return ret;
 	}
 
 	return 0;
-
-err_sched:
-	drm_sched_fini(&edev->sched);
-	return ret;
 }
 
 void ethosu_job_fini(struct ethosu_device *dev)

-- 
2.53.0

