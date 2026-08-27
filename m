Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C82E307AC7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787862809; cv=none; b=emsmikwcKoba6Z2uu984OnoP0t98SXI6T9Db1xBdwPLKrAU3c3QkBeb7QXKO+UBQm19O/AI4vaSgB/WkbH9Yr8fRT8YjC/TvAH1Gso0jndrWkX1sy+d0gHgPPf2Avcqhnz5KXyDUd4O4kZg4ED7rkFd0nfrawnkude6gj/wkl6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787862809; c=relaxed/simple;
	bh=JL448ACxsasqagv0UZWbVOd855N/jHYJAj8LxB9DKkc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BfPDm7NtzplVPNEfEmLxKV07pTgHPQHq0SRQEbIhFOEyFgMIwwquFZJunPbIbaqcn33ZZY6DZEJcwg4/Nix7iIhcWqqdQ5sqA97bIfUNoSUfGJr1Au6q5L0SSwKlF0UwbnW7LuDAXhzZPBFrY0g8RCbDFYdifrmrPzvj6I2ZV1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jh7hjHX7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jh7hjHX7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36FBA1F00AC4;
	Thu, 27 Aug 2026 20:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787862802;
	bh=O3KjHmD0IPMWcLD9Xn+YXTCqHQcBqnsYviRiyVpX+NE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Jh7hjHX7iGtT1ug25dVup8Smp11OoN4Nq5b/Wpp9jIB6B/50iPybYaWXAeAzmX2Zv
	 NnJbjzF1TUlwclczDSizbHOSinYOgYijwB9BOHOJ4DblJ08qE6WaTv2SPgpxjhIHj8
	 di6HT6vFRrOJUeF1P9lUkhZjaPWvbY/tJGuKUyXhAQ7i9L0PaSe6Vk8DVXdsGnLbzA
	 IGxfQD+KFl3RwBrOWSd84HPgBY6iH2nLBnzFdvPZ43fXVASFGkoJkwRZQc180EIlzo
	 Y6Ank4A48SPAljZ5fOJgPD4wU6FyvxQz5hHJUlkuIGXfBkTaNgOlIbPdBoNFyjCB/a
	 euSpLK/Dg7yrg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 27 Aug 2026 15:33:05 -0500
Subject: [PATCH 06/11] accel: ethosu: Fix probe error cleanup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-ethosu-fixes-v1-6-346f9ea8791c@kernel.org>
References: <20260827-ethosu-fixes-v1-0-346f9ea8791c@kernel.org>
In-Reply-To: <20260827-ethosu-fixes-v1-0-346f9ea8791c@kernel.org>
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
 drivers/accel/ethosu/ethosu_drv.c | 14 ++++++++++++--
 drivers/accel/ethosu/ethosu_job.c |  6 +-----
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_drv.c b/drivers/accel/ethosu/ethosu_drv.c
index f1af7b3ea038..41ecfc623d42 100644
--- a/drivers/accel/ethosu/ethosu_drv.c
+++ b/drivers/accel/ethosu/ethosu_drv.c
@@ -371,13 +371,23 @@ static int ethosu_probe(struct platform_device *pdev)
 
 	ret = ethosu_init(ethosudev);
 	if (ret)
-		return ret;
+		goto err_job_fini;
 
 	ret = drm_dev_register(&ethosudev->base, 0);
 	if (ret)
-		pm_runtime_dont_use_autosuspend(ethosudev->base.dev);
+		goto err_pm_runtime;
+
+	pm_runtime_put_autosuspend(ethosudev->base.dev);
+	return 0;
 
+err_pm_runtime:
+	pm_runtime_dont_use_autosuspend(ethosudev->base.dev);
 	pm_runtime_put_autosuspend(ethosudev->base.dev);
+	if (ethosudev->sram)
+		gen_pool_free(ethosudev->srampool, (unsigned long)ethosudev->sram,
+			      ethosudev->npu_info.sram_size);
+err_job_fini:
+	ethosu_job_fini(ethosudev);
 	return ret;
 }
 
diff --git a/drivers/accel/ethosu/ethosu_job.c b/drivers/accel/ethosu/ethosu_job.c
index 0982722a9195..7cadd75ad0ba 100644
--- a/drivers/accel/ethosu/ethosu_job.c
+++ b/drivers/accel/ethosu/ethosu_job.c
@@ -349,14 +349,10 @@ int ethosu_job_init(struct ethosu_device *edev)
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

