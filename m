Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0544137AD
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790362043; cv=pass; b=T0kQApm2vDHxWqfoIqE+N84z8RxfdoIIhOzZ8B2eoxV1fdWH2SYifOVd1dtEGGRbtRnUYSFNu7SkU9eqCyzqNu6PoiEb2ivdZSLTDjAwuRaLxlxBO/cbmTlSnJa/fYCHyu6jdZXUOLYkdK0hyTD4j0vSHSD8jR7uMUywgeRYbMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790362043; c=relaxed/simple;
	bh=ScNLEoz/xgrROfFtst5rBsE00tM5S+Iws+qVQdXGlw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sk3ESKZ+Zj5ANKebGUHngJ4trc59j/Wi+X62ui7DPfOiKVwTClioEItDPnAOI+r4WulQOTJ+0sbbu+cVu6LIVxDC2ZET6a42YlFiuhy73OBGFAb1ooqfygwSvmAJ9yDKV0+rbSQMWEdN41oDggCYpngkIkGDZKonFNjHPiWo8do=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=OhIhVfHT; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="OhIhVfHT"
ARC-Seal: i=1; a=rsa-sha256; t=1790362014; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IjF/rrBaDVLKMQbu+wNECuTFeXtBLvlb6BbhZV33TCEWf2SlQ1n2wV1hQTSGnL3y8LXvzoylgjMxEt5vKH+mIB8Emw406pdLCAWlfBkjD7c0L8Us6K5SDZCWunH4kzPNtKoOOCaVShEFrtPQpoM5+HGj/7R439H2W7++Ci6b6cM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790362014; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cjGSqdI1UByjhdXjHyJfzvl5uUQhyxKEiMCZqMcnxFw=; 
	b=SaO/8iXE7CKbX6Ew3nlBEKTrSZjrg2ym9XUaa5EvQkH0/4MoxwNK4/LjpKWOXHAQBOGWXdy2l65Aj+dGZN6puWeQ2yuueH8sXZ5aFZrUE23MJZodvqM8mbEoSNpqELPtRdgFemqf/tmju530m9QBWrGmmBWQDPHXd8NdcQmpC6U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790362014;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=cjGSqdI1UByjhdXjHyJfzvl5uUQhyxKEiMCZqMcnxFw=;
	b=OhIhVfHTuDTfyGzMQz+hXfluYb0Z8znVWcbQUY/iT6BFZDkEcPCrCZxLqktAn2i4
	Znw4GYdywTqJWksDV+VX9Q3xG16OdYxIcpy7suya0y2uqiI2DszeQDysEiU2Skrdf19
	DFs1PzXpG4jSMJDwVCL6aQcIVfvqnAIGZR4JSX5I=
Received: by smtp.zohomail.com with SMTPS id 1790362014041116.49688504232824;
	Fri, 25 Sep 2026 11:46:54 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Fri, 25 Sep 2026 19:45:35 +0100
Subject: [PATCH v11 14/15] drm/panfrost: Introduce a reset lock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260925-claude-fixes-v11-14-0dbf5a58e7ce@collabora.com>
References: <20260925-claude-fixes-v11-0-0dbf5a58e7ce@collabora.com>
In-Reply-To: <20260925-claude-fixes-v11-0-0dbf5a58e7ce@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, 
 "Marty E. Plummer" <hanetzer@startmail.com>, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Eric Anholt <eric@anholt.net>, 
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Collabora Kernel Team <kernel@collabora.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3001;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=ScNLEoz/xgrROfFtst5rBsE00tM5S+Iws+qVQdXGlw8=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqtsFExHH7nXHtM4qCm8dY2qnJ4frFZOo9ftc01
 MH3I2HFWVyJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCarbBRAAKCRAOJn5M7lND
 PbAbC/sGbVcPTAikPZ5xNTDjrcdIcdundVnSjGD6QwaDDQ9c8mMl7/Mak6h9qXFYls6HHswPvlN
 6zQyUKrZd8iDTDbpuNG7mSSPQdW/43K7fqmiAxndJVN9bs8QCqWGsR9PEb/USxu8rGbzKykWK6r
 mRiiXwT4Su5PJ+6ZBHfMKYGhP44T6Gkc3ie67+QM2Tayu2gf1puEjMDBMbA7sTD9cOYBI7N4q/O
 Y0TfCCEaM9IoF9BgPXqxdAr7pNVdZcGaW98yYV+4+/dLfKArYoRKda1N0d5czfUk7MJJHE0GK9K
 /B7QNQToX3uU6+WYhDVn0X3HfAL40bw/75BHsxK27OYjC4WVPWZEYyOY/T3b90RLT0nPtl2JiIP
 hkHJEmw9WZLKYQrWP51YwZblTLHEYvlV/lLifMp8IQIM3y4MlJs8IABEXPvjuoiw+CGADtRq38o
 1jI59rMuq+/6bOVZQXN9wk8xYspz+TK1y+1X4hjl8CGgVlVS26MA+KH4xyDbMQvy1cAzk=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

So as to avoid accessing HW register while a reset is ongoing, a read/write
semaphore that envelopes the reset sequence will help driver entry points
avoid racing with it. For now, the only such racy entry point is the ioctl
that returns the current GPU timestmap.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 2 ++
 drivers/gpu/drm/panfrost/panfrost_device.h | 1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c    | 9 ++++++---
 drivers/gpu/drm/panfrost/panfrost_job.c    | 1 +
 4 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 3cc9540f8f33..0cbd25607fb9 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -478,6 +478,8 @@ bool panfrost_exception_needs_reset(const struct panfrost_device *pfdev,
 
 void panfrost_device_reset(struct panfrost_device *pfdev, bool enable_job_int)
 {
+	guard(rwsem_write)(&pfdev->reset.lock);
+
 	panfrost_gpu_soft_reset(pfdev);
 
 	panfrost_gpu_power_on(pfdev);
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index a0b9a2145fc9..63452febb1cf 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -165,6 +165,7 @@ struct panfrost_device {
 	struct {
 		struct workqueue_struct *wq;
 		struct work_struct work;
+		struct rw_semaphore lock;
 		atomic_t pending;
 	} reset;
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index f77780c72a1a..571a26b84126 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -41,9 +41,12 @@ static int panfrost_ioctl_query_timestamp(struct panfrost_device *pfdev,
 	if (ret)
 		return ret;
 
-	panfrost_cycle_counter_get(pfdev);
-	*arg = panfrost_timestamp_read(pfdev);
-	panfrost_cycle_counter_put(pfdev);
+	/* We should not read timestamp register while the GPU  is being reset */
+	scoped_guard(rwsem_read, &pfdev->reset.lock) {
+		panfrost_cycle_counter_get(pfdev);
+		*arg = panfrost_timestamp_read(pfdev);
+		panfrost_cycle_counter_put(pfdev);
+	}
 
 	pm_runtime_put(pfdev->base.dev);
 	return 0;
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index ab65786bf63b..4ddf4b722ddf 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -877,6 +877,7 @@ int panfrost_jm_init(struct panfrost_device *pfdev)
 	INIT_WORK(&pfdev->reset.work, panfrost_reset_work);
 	spin_lock_init(&js->job_lock);
 	mutex_init(&pfdev->sched_lock);
+	init_rwsem(&pfdev->reset.lock);
 
 	js->irq = platform_get_irq_byname(to_platform_device(pfdev->base.dev), "job");
 	if (js->irq < 0)

-- 
2.55.0

