Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280980;
	b=i3Z0rFRdawAlkiJJ/YafE94yUFkv1unwkSsNSzrDUxT/gszPA7cvB+En1OJlDz580Ph6
	 VpaI4zYZJ+UBiXy7zlDKvY2e0XhqGbtHBeiBwu6/HuTAEMtPB30MhiVbwrC7cwomwjILs
	 kWkDdpFbMcTO/XMrzJwpf2Y5bUlyPzHbcNz4FX4Mx4prN3XNSWEmms4clye2VFNZ4tc+v
	 poP+t11FSqP4jGIevtQYPiI7WtjZVg6dESkmKwZ+wYUkMDyJ8o8qkVozA0+pM53Ss+Hcz
	 81vxoblsGnNVDRUhD03uFewZln/pr4xMVrSN0sUwYOzKliWcZXq6R4Gbm93sKw3IuIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280980;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=jbBxKv6txjlAVMjetzQTUJ/a8zC8R53gc/yB6G9RtL8=;
	b=IGe6H123XEkgJCj8mVp1KouvFbSGVwBuVgys4P7ZZUSTIH+QQP/LCXf4KudqZZ35xK3P
	 JNDGJZGeZQoy5WRBZvkRFdNnz/fq4MbawEOq6ZXe/kodGyrO9VFYZsY5H1NawjgZG8bg0
	 tDkeVraS5b7wgjidfIHlgkgj5mlwIdFFILWTvo+2S8btpRF0orl0EEynmh+hq+gdkGerQ
	 es73guethbacquQjU9LeeHoXl5Pjg1E6TG6cAQ4azrBMnBTv8gZ57UwgAgs0Yr2csM7S3
	 LiiUmb4kvqL1DGnSmLI5xGfTp3Row9f3dGZRjNFcmvIvnEs/9j+TazTxybAsKqtEY2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YILUgJKv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793B760A2637
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YILUgJKv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F621F031E9;
	Thu, 29 Oct 2026 13:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793280980;
	bh=jbBxKv6txjlAVMjetzQTUJ/a8zC8R53gc/yB6G9RtL8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YILUgJKv6arXTEuqnG0Uq+rJQ6ahwsEwQDcBrEi+SbKweaPv7h3ro/nKyupzvkcWd
	 21K3l/e+00a9l6DEI/rvAJTAExz8WfRHJMNWLKC1a/Jm/J+qIbbsmuurbCST2riQxb
	 xpqFnQq/OpvPj/H6eHHhOwZ++4mxmcctyLlDWHE9iQVQbBWF5PzTVRf8J0oQVfgYGb
	 TMym1osiWk3xIS1JtenihVcac0LsDGL1wCCJWt66AOTqvPaSTJLS+oaGU9ugvc20jF
	 OwRqwXvhs+gl/UMsBiEkocnGxmNH8UajTnvlSAanZJrwmpNyqGW62W+mKHL8w0fX+P
	 R5ZKtfJ+xa94Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 29 Oct 2026 08:35:52 -0500
Subject: [PATCH v4 05/31] accel: ethosu: Quiesce jobs before scheduler
 teardown
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-ethosu-fixes-v4-5-4aa25e22578e@kernel.org>
References: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
In-Reply-To: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

An NPU job can complete while driver removal tears down the scheduler. Its
IRQ handler could then access scheduler state after it has been
destroyed.

Stop scheduler submission and timeout work, reset the NPU, and
synchronize its IRQ before finalizing the scheduler. Add a cancel_job
callback so drm_sched_fini() signals queued jobs with -ECANCELED; their
runtime-PM references are then released during normal job cleanup.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v3:
 - Add dma_fence_was_initialized() check in job cancel (sashiko)
v2:
 - new patch
---
 drivers/accel/ethosu/ethosu_drv.c |  4 ++--
 drivers/accel/ethosu/ethosu_drv.h |  2 ++
 drivers/accel/ethosu/ethosu_job.c | 23 ++++++++++++++++++++++-
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_drv.c b/drivers/accel/ethosu/ethosu_drv.c
index 1a65e9eef562..6875ed17a004 100644
--- a/drivers/accel/ethosu/ethosu_drv.c
+++ b/drivers/accel/ethosu/ethosu_drv.c
@@ -216,7 +216,7 @@ static const struct drm_driver ethosu_drm_driver = {
 #define U85_MEM_ATTR0_CFG	0x00000000
 #define U85_MEM_ATTR2_CFG	0x000000b7
 
-static int ethosu_reset(struct ethosu_device *ethosudev)
+int ethosu_device_reset(struct ethosu_device *ethosudev)
 {
 	int ret;
 	u32 reg;
@@ -263,7 +263,7 @@ static int ethosu_device_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	ret = ethosu_reset(ethosudev);
+	ret = ethosu_device_reset(ethosudev);
 	if (!ret)
 		return 0;
 
diff --git a/drivers/accel/ethosu/ethosu_drv.h b/drivers/accel/ethosu/ethosu_drv.h
index 2193bc51d425..f59c845c758b 100644
--- a/drivers/accel/ethosu/ethosu_drv.h
+++ b/drivers/accel/ethosu/ethosu_drv.h
@@ -11,6 +11,8 @@ struct ethosu_device;
 struct drm_device;
 struct drm_file;
 
+int ethosu_device_reset(struct ethosu_device *ethosudev);
+
 struct ethosu_file_priv {
 	struct ethosu_device *edev;
 	struct drm_sched_entity sched_entity;
diff --git a/drivers/accel/ethosu/ethosu_job.c b/drivers/accel/ethosu/ethosu_job.c
index b7faa715b47e..d418ae7961cf 100644
--- a/drivers/accel/ethosu/ethosu_job.c
+++ b/drivers/accel/ethosu/ethosu_job.c
@@ -189,6 +189,17 @@ static void ethosu_job_free(struct drm_sched_job *sched_job)
 	ethosu_job_put(job);
 }
 
+static void ethosu_job_cancel(struct drm_sched_job *sched_job)
+{
+	struct ethosu_job *job = to_ethosu_job(sched_job);
+
+	if (dma_fence_was_initialized(job->done_fence) &&
+	    !dma_fence_is_signaled(job->done_fence)) {
+		dma_fence_set_error(job->done_fence, -ECANCELED);
+		dma_fence_signal(job->done_fence);
+	}
+}
+
 static void
 ethosu_switch_perfmon(struct ethosu_device *ethosu, struct ethosu_job *job)
 {
@@ -315,7 +326,8 @@ static enum drm_gpu_sched_stat ethosu_job_timedout(struct drm_sched_job *bad)
 static const struct drm_sched_backend_ops ethosu_sched_ops = {
 	.run_job = ethosu_job_run,
 	.timedout_job = ethosu_job_timedout,
-	.free_job = ethosu_job_free
+	.free_job = ethosu_job_free,
+	.cancel_job = ethosu_job_cancel,
 };
 
 int ethosu_job_init(struct ethosu_device *edev)
@@ -361,6 +373,15 @@ int ethosu_job_init(struct ethosu_device *edev)
 
 void ethosu_job_fini(struct ethosu_device *dev)
 {
+	drm_sched_wqueue_stop(&dev->sched);
+	cancel_delayed_work_sync(&dev->sched.work_tdr);
+
+	if (READ_ONCE(dev->in_flight_job)) {
+		WRITE_ONCE(dev->in_flight_job, NULL);
+		ethosu_device_reset(dev);
+	}
+
+	synchronize_irq(dev->irq);
 	drm_sched_fini(&dev->sched);
 }
 

-- 
2.53.0

