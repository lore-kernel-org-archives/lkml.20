Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FE14D955C
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791549353; cv=pass; b=O8V3Q8tbtedGaDqSMxD8S1+Km47lU15FAhaSejBtMXWttx909v8Kov2gvlxwWS68gNfS1m8OiJghJPsKIDsIRlSg+soXmKlO/TUvtRmDzB4YB3TY/Xg+sTwa7/bmL7sT8WwTWqOCKhp2Eo969ubrYrgO8hsw7wQYQinFWjWRbu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791549353; c=relaxed/simple;
	bh=c7X8b74ywjqaJw1xMOJ/QyyXlM602ll9atW8Djb3EBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DkF5RaTc+CfDZuRZ4oBd1gagS5D9bAUfpvQKtNmAAuMupixM+OTEeYz7g5XBRX0BcRxuJxBRO/gVsnm1ajdXUfKJP+wDl6OXOgvItoL+QWmRoezyrWoFXgCYABMFwDMYcKR4p8ONTGfb/8KxntXZxsFvxo2EJ2Rou9v+zgXNW+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=ANIOo3qy; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="ANIOo3qy"
ARC-Seal: i=1; a=rsa-sha256; t=1791549319; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UAszmpnfdylCgyYJm/TiY8w1DpZsBoytL/NN/79nbEi0TZz/Smz1mEY/gJq/w06JxzKaEi9qKfyOIbfmjf7is59Y7ORoj4hOaclcQF/fzrQA1HPwhxrNEk0u8+n6q3ZSHBGrbDU7RtMFm9iD4EV09oiRBumkO2o1vxf+qpuli/8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791549319; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tW7ZGdBI0CeTF9WeXr+7R/B9XC2tuQnNlaOB3VCmv/E=; 
	b=WfNL0NCS32QW+7ZqY/gIwF3V9+tDTh3AZ9OadBTiWiOiSqc+2NNwQTuCaeFogBJLXoIq8wzAHSfcUCp1u/iCzwWNmt1nEqckQkZL8tn3636JkHnPOcT0MD4cLTGfuE232zKXWRqGAymrsKgtMRHn1GuQpeSNR0t4AnDle5tdWM8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791549319;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=tW7ZGdBI0CeTF9WeXr+7R/B9XC2tuQnNlaOB3VCmv/E=;
	b=ANIOo3qyvJkOA33PSvAclxZLPujHMdzLtsL4zNth/j2DSoOt/CbJPyN8/UeIpLMq
	AnuOM6BKiW2GMjg5+SGkm6jvcDGg2xkcV9xuolFuyd27aVUYcOXG6elWR2p0aGzk3nh
	4p+t+awUEPvtIJTOJdQ/HZ0K+qdM5bl6cw7FaTWU=
Received: by smtp.zohomail.com with SMTPS id 1791549317570662.3179738267629;
	Fri, 9 Oct 2026 05:35:17 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Fri, 09 Oct 2026 13:34:01 +0100
Subject: [PATCH v14 14/15] drm/panfrost: Introduce a reset lock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261009-claude-fixes-v14-14-cb743b3b973b@collabora.com>
References: <20261009-claude-fixes-v14-0-cb743b3b973b@collabora.com>
In-Reply-To: <20261009-claude-fixes-v14-0-cb743b3b973b@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, 
 "Marty E. Plummer" <hanetzer@startmail.com>, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Eric Anholt <eric@anholt.net>, 
 Robin Murphy <robin.murphy@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Collabora Kernel Team <kernel@collabora.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3054;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=c7X8b74ywjqaJw1xMOJ/QyyXlM602ll9atW8Djb3EBY=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqyN8vIOIPlICOK8nRjj6eEvBWErC+UD37KPTz+
 ZgCFD355SyJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCasjfLwAKCRAOJn5M7lND
 PfmUC/0SOl0G8MM+spU8X6B/kbpvjC0NW5Woltb7jrxXO+akNPGTiKjXmX8nBYlFEcfE3kkYvjD
 +a5gs9eR60jYdUFCdHK4kz3Yrl4MOUzlPXJCTeV4Zgg28ATMS2FK1o04NhYTaNGXvWLkj4FnvBz
 kFo478wdEUteQkrZguBVfY8zQX2n+HwB0JHJ5pcT0ZbCkaoc/mcgY/TYyIvFwY0qDuUENMW0lr4
 kf77dgj03hhI6QI3y7SvvrUX4o3bqz8WBvYrhckASi7YP40hkuGASx7UDALRFMj4ZX+jdQjEaZb
 kcWqBa9ksIEFlKIYAo6gpg285UMQZBS7iQ5+1BXfdQ+XB01ah5VWZsJhlsou40DasWzg3GHnP9M
 52d/OWzlf0U3e8ZiqSsffe1SRiwKIfFQhARhyEXVAJOmtua3SfuC5PYnsIMHY9VIrmLxubibU5Z
 l3pbVv3gehVkJmNHiNdztBQzVIB9CD8YaCEXAf+OwGXoFvUG5wj5aiipi7m06vtanwtF8=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

In order to avoid accessing HW register while a reset is ongoing, a
read/write semaphore that envelopes the reset sequence will help driver
entry points avoid racing with it. For now, the only such racy entry
point is the ioctl that returns the current GPU timestamp.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 2 ++
 drivers/gpu/drm/panfrost/panfrost_device.h | 1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c    | 9 ++++++---
 drivers/gpu/drm/panfrost/panfrost_job.c    | 1 +
 4 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index b3dae6ce3eb0..5718e8185427 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -509,6 +509,8 @@ bool panfrost_exception_needs_reset(const struct panfrost_device *pfdev,
 
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

