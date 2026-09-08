Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0964D56B87E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905097; cv=none; b=KMSbNqMPIFT0MViQDINeBBEYbGhPPSzBcAohSOLXdKqgTJbwJA9tQA9b0pPfeIBVNW3+y7k1MuSgYmjdmd5sEMYaKHAcmpCJNiKgTJg90JTVKf/hXan7f9p4uemJ5TgJWaGIUQur9ljWI3CvuJuptyq7m38s951qgr/vr9bUSnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905097; c=relaxed/simple;
	bh=7cDVW5k7uv+yCCX/FOtnQsCs0zUnRL+ulmsnKVge8Xk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dFBfOYbJiXnVY0OEkyltri6cvLSTIaG91y0PZgr7P8/495G99lY9pKjQcOzC8m8JoXf7R+TbdJjyDke6VyjMBJS1/785y8i/8bEqK7LkKA+o8HZnhZAEBWW10FNxg0MMpoReLHvydcOLoe+QdPe1xpDvrFi5qpuxywZ250eBZDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QcIgNaHn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QcIgNaHn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7142F1F00A3D;
	Tue,  8 Sep 2026 22:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788905095;
	bh=qwUK2PGPRP9N49QDc9653gAgUPcVpEE3+mhOYY7c0D4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QcIgNaHnvXKOcubmt/xp5UWcjJDPUO0ISoikgJFGKAmrV4uQS0Y4fM6WlljzC0NaB
	 ls1zUlsZ4FmxDA94LbK0I+iwMckHWpPKXa2m3Jdm/KhR3t/EyFQCHSrKaGdPXem8Fu
	 Uzv/8nW10Bmq0WTwZmYIUbm/OJhO07FbiNaJBPPyK3A3b4FOg3BWGIuHK0RUyWlKX2
	 n2Et8WmKsiBN0zMcewDD3on1T1H75orxWg4W21/jYV7vYPnkbAhK6cqlAhnvn6/npA
	 /ZUVt9dEGGdOZb2P2TkpkW+BEJGRm9SzDVU4XNmqpCvAbvnM7MX34p5mkYX0O4KUhf
	 HJLC2UptOXqbQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 08 Sep 2026 17:04:40 -0500
Subject: [PATCH v3 03/22] accel: ethosu: Fix probe error cleanup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ethosu-fixes-v3-3-490fe215286f@kernel.org>
References: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
In-Reply-To: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
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
index 1f6fb5d18cf2..2c8d735767b2 100644
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

