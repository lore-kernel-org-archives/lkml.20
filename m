Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC6A493D46
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816564; cv=pass; b=twIuC42J0XAg0HqIv6pAYoie1WkcKBr78QUwdv1528orvtFN+m3ufRtvbeyiorRby93arA5KF9cvf0k+1RpPxFRYWIVRCWHVpMJja9+bHrNDryHa+j2eIKNPcAkmwBSAQt6msJLdmTo0RUsC7oR9CRc1f71mbQ6sDD0O67C69l0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816564; c=relaxed/simple;
	bh=J9qMQhiTpJOf48Udf2cuPWnHMtP8lHjxgtPC1iHmQ5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K1J1HsX7ZA1Hfav7c2e00ii/S87DIb2ls2JA4xL4jmgjAkI1ZRlJncr34UK7Ng3OnFrViCIqhXmQEhPlergy0cxwJjQDuZNPxRPipIDEKBRPvgOfFuWJey+TiqPxAHS/0YO7q/XfGDqWlGM7EnTqrzjbNbDZliSdsj7B8/yGKhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=CxmppS68; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="CxmppS68"
ARC-Seal: i=1; a=rsa-sha256; t=1791816536; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Acq7by4LbMfgxIQKG3RfhKIFs08sOhnLvPKzfQzoIukHFf9busvA/gjoeKNWv33C8ERjNAIWd47rFRvBq1/sE0aC6235d0uZJA5VoK3Ysee5i3CVvSul+2DnxdXLC67RAghDp8eKQBsy0Eql+h9dVp5OPTFszwr8OdY2wZiGL7Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791816536; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ow8m1p85I2URfn8W7y19YwhJHcOAO4IB4TdoCwyI3XQ=; 
	b=PYwtBMgv/Teks0rJ5xKxssX7p7zeNAfX50+GIHfXkp0QdLiUiisX6k5pDBbpGQTqr9Q3E8m9GPTZ/I6NTN1E9hWCniqFy8lPaCljIpRLpBKGLvtDTuAKSHdqR0x3prd5KQWfycDjx3uIbFR0CSi5NqZhWHlIGQhL/RT3y4YfFko=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791816536;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Ow8m1p85I2URfn8W7y19YwhJHcOAO4IB4TdoCwyI3XQ=;
	b=CxmppS68NKgMyf0cV42HGFjf5Fco0dL6P6LoVdSI82g6Bw8s8Vs5U7cDFwu73PHE
	8kvMZux6BStJZSWsqno/xdcpgXmfM43+1uTouIXavzfiGCHh/435SI8QWGRBANKcV0Z
	GzAlhnkboGzO+Tnw0eoSTw/xT8SWCferdfbTKhSw=
Received: by smtp.zohomail.com with SMTPS id 1791816535460217.68477037785237;
	Mon, 12 Oct 2026 07:48:55 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Mon, 12 Oct 2026 15:48:02 +0100
Subject: [PATCH v15 10/15] drm/panfrost: Add debugfs knob for manually
 triggering a GPU reset
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261012-claude-fixes-v15-10-bc0a6c498553@collabora.com>
References: <20261012-claude-fixes-v15-0-bc0a6c498553@collabora.com>
In-Reply-To: <20261012-claude-fixes-v15-0-bc0a6c498553@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3249;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=J9qMQhiTpJOf48Udf2cuPWnHMtP8lHjxgtPC1iHmQ5g=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqzPMa9ZUoD7TxMCJ4YatNJBH8MMuZlnta1uCxq
 sgMxmzEGIaJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCaszzGgAKCRAOJn5M7lND
 PW+NDACfv4YPYOPBUJbxNA5yMo7uwRJiHO52s1p9Fggzu84pBLoTp9L73gvhJPnJSus0M+WA37j
 jItqE1NFJl1DTGZMM/6P1z6B6tz46WM47M84FW5Vdr7jH1GEam3r+UmU28jgUSGAUIZQ40B1hai
 eYvL28S7mI6SXr1Q9RQLsKVELaQ3+XWHfhMIf2lieWIMqlSV88cffBP+wbgB05lr1IGtI/C/OlQ
 oyx/f5H1HKiVKks1G72Tk5w8Cl989qDGcBnPnE+a+u4C2J1eL+0ufgNcsXVpuMNncOhEuxQvS2w
 BUqXVBmvAe7F8QWreEIl4L1zIVoxhpodY7BdolVyQ6ya3nLHkO9FlsXBDRmfmMbnGjFXmMjYm21
 ORtgvs16jOlEeNynUgQKHKC6brTvBTmczLXJCBVsut7qi/RTwB3Dj3BolOmxAbyYTzktZvpCTac
 QYk+6muWQs4fAGldINTaJdzAJwLZbiRPjA0g/TmZ9D8VEuNbtPMkPOUjTH4MXQ8AKNbxQ=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

This will be of great help when testing potential races between the GPU
reset sequence and other parts of the code accessing HW registers.

We must also disable the reset work item rather than simply cancelling
it, to prevent the knob from triggering another reset when the device
is being removed.

At the moment, the only legitimate input value for the knob is '1'. This is
to allow for future inputs that would encode alternative reset scenarios
we'd want to trigger manually.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 46 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_job.c    |  2 +-
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 687230225743..b3dae6ce3eb0 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -2,6 +2,7 @@
 /* Copyright 2018 Marty E. Plummer <hanetzer@startmail.com> */
 /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
 
+#include <linux/debugfs.h>
 #include <linux/clk.h>
 #include <linux/reset.h>
 #include <linux/platform_device.h>
@@ -623,9 +624,54 @@ EXPORT_GPL_DEV_PM_OPS(panfrost_pm_ops) = {
 };
 
 #ifdef CONFIG_DEBUG_FS
+static int reset_get(void *data, u64 *val)
+{
+	struct panfrost_device *pfdev =
+		container_of(data, struct panfrost_device, base);
+
+	*val = atomic_read(&pfdev->reset.pending);
+	return 0;
+}
+
+static int reset_set(void *data, u64 val)
+{
+	struct panfrost_device *pfdev =
+		container_of(data, struct panfrost_device, base);
+	int ret;
+
+	if (val != 1)
+		return -EINVAL;
+
+	ret = pm_runtime_get_if_active(pfdev->base.dev);
+	if (!ret)
+		return 0;
+
+	panfrost_device_schedule_reset(pfdev);
+	flush_work(&pfdev->reset.work);
+
+	/* ret < 0 means runtime PM for the device is disabled, so we
+	 * only need to return the PM reference in the opposite case
+	 */
+	if (ret > 0)
+		pm_runtime_put(pfdev->base.dev);
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(panfrost_reset_debugfs_fops,
+			 reset_get, reset_set,
+			 "0x%08llx\n");
+
+static void panfrost_reset_debugfs_init(struct drm_minor *minor)
+{
+	debugfs_create_file("reset", 0600, minor->debugfs_root,
+			    minor->dev, &panfrost_reset_debugfs_fops);
+}
+
 void panfrost_device_debugfs_init(struct drm_minor *minor)
 {
 	panfrost_gem_debugfs_init(minor);
 	panfrost_sched_debugfs_init(minor);
+	panfrost_reset_debugfs_init(minor);
 }
 #endif // CONFIG_DEBUG_FS
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 00fb36c577df..ab65786bf63b 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -932,7 +932,7 @@ void panfrost_jm_fini(struct panfrost_device *pfdev)
 		drm_sched_fini(&js->queue[j].sched);
 	}
 
-	cancel_work_sync(&pfdev->reset.work);
+	disable_work_sync(&pfdev->reset.work);
 	destroy_workqueue(pfdev->reset.wq);
 }
 

-- 
2.55.0

