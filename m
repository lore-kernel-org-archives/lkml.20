Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B14E446BE0
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787756184; cv=none; b=JbHs5A1stgFmipbwBLb3M5t+HKHId8eOxHPIq80r2tF9BPEB68sBcKyMbCISLaJb73aZYTHHJScEgo97SQ8Q8iohp1ZXubqIyNOFB1PAmDPQzQoSAmPT6rFVYXPtAf9lhzAdF4Cs+ZhHOvnCLYAUlLskQQOiap6T8971mUIssRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787756184; c=relaxed/simple;
	bh=IY55ctd8QpVuJxEhgpxyAs4KE3A33RMtWcMVdJveAoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ek9Wf7YtaqrllVF4WnFJuFoT8peNSfmzRI2GNY+5xn9LvuODCyRsEX4xpT5nxbc3t/59hfsvwrfhVE2FrX7rHuGBOZRwkT2UsgAZxq7zUvEi85CcKdEKlOJNPvnaARzJvFntNJ1tipt6al+rZxGUU2SuFMP6c+U8f+gV3ZToSLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XnwbnByx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XnwbnByx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1787756180;
	bh=IY55ctd8QpVuJxEhgpxyAs4KE3A33RMtWcMVdJveAoc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XnwbnByxyESQk2w0NAYiBavfZh5wnSigjtC5MNIxFDJiJ/pG0Q+MU1ESGG/rGLW9A
	 raUd1fAa167GULD43Kk8qBKmQJC0QBXMoMOlha+M1Ma3uUJDor6vsMxFzg/O1iTMTc
	 O6TS8TwcjaYt2/QkMKyvAGLbrLO3QmmnJtuzQBhMCtly37IPoQmWKQ+ECuOA9A8LbZ
	 WfyPeR447q85Ilt5AvQERcZlJ/Euh+BMzBihGtDeAJyS79ZDlIiR0MCtnj+kf9yPcz
	 v8I2uMFZWw4lxwbYdOp4uAd/vhnD70gzF2FWzO7M90f/TYUh8YiJawBrEJPmys8Hd4
	 YY53bRmACrC7A==
Received: from fedora-32.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AC36E17E0A4C;
	Wed, 26 Aug 2026 16:56:19 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Wed, 26 Aug 2026 16:56:00 +0200
Subject: [PATCH v4 01/18] drm/panthor: Disable reset work before unplug
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-panthor-unplug-fixes-v4-1-982cc8f4234b@collabora.com>
References: <20260826-panthor-unplug-fixes-v4-0-982cc8f4234b@collabora.com>
In-Reply-To: <20260826-panthor-unplug-fixes-v4-0-982cc8f4234b@collabora.com>
To: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: Chris Diamand <chris.diamand@arm.com>, Akash Goel <akash.goel@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787756178; l=3456;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=IY55ctd8QpVuJxEhgpxyAs4KE3A33RMtWcMVdJveAoc=;
 b=rIbMfAgdsvBYVBOZ+KoWfjDLuJ85lAbb6Vwh24qLqzgMHBnJXFYPOtDgFv6dhLNXoEJO+Ug0H
 8vOGQ2vs1qtBkWJiapvgco6J3U14/ULZYb/1qJHnX+1jwbd6jLyYsup
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=

Unplug is supposed to be the end of the road, so we need to make sure
reset works won't execute while we're cleaning up everything as part
of the unplug, otherwise it would mess up the internal state.

In order to be able to call disable_work_sync() in the unplug
path, we need to defer the unplug triggered by the reset logic,
otherwise we would deadlock.

Fixes: 5fe909cae118 ("drm/panthor: Add the device logical block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.c | 21 ++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_device.h |  3 +++
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 0b25abebb803..7c55d0c45cfd 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -79,6 +79,9 @@ void panthor_device_unplug(struct panthor_device *ptdev)
 		return;
 	}
 
+	/* Make sure we're not interrupted by resets while we're unplugging. */
+	disable_work_sync(&ptdev->reset.work);
+
 	drm_WARN_ON(&ptdev->base, pm_runtime_get_sync(ptdev->base.dev) < 0);
 
 	/* Call drm_dev_unplug() so any access to HW blocks happening after
@@ -91,6 +94,13 @@ void panthor_device_unplug(struct panthor_device *ptdev)
 	 */
 	mutex_unlock(&ptdev->unplug.lock);
 
+	/* Unplug triggered by a device removal might race with the deferred
+	 * one queued by the reset work. The function covers this concurrent
+	 * unplug situation, but if we can disable the work before its
+	 * execution, that's still better.
+	 */
+	disable_work(&ptdev->unplug.work);
+
 	/* Now, try to cleanly shutdown the GPU before the device resources
 	 * get reclaimed.
 	 */
@@ -114,6 +124,13 @@ void panthor_device_unplug(struct panthor_device *ptdev)
 	complete_all(&ptdev->unplug.done);
 }
 
+static void panthor_device_unplug_work(struct work_struct *work)
+{
+	struct panthor_device *ptdev = container_of(work, struct panthor_device, unplug.work);
+
+	panthor_device_unplug(ptdev);
+}
+
 static void panthor_device_reset_cleanup(struct drm_device *ddev, void *data)
 {
 	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
@@ -148,8 +165,9 @@ static void panthor_device_reset_work(struct work_struct *work)
 	drm_dev_exit(cookie);
 
 	if (ret) {
-		panthor_device_unplug(ptdev);
+		disable_work(&ptdev->reset.work);
 		drm_err(&ptdev->base, "Failed to boot MCU after reset, making device unusable.");
+		queue_work(ptdev->reset.wq, &ptdev->unplug.work);
 	}
 }
 
@@ -206,6 +224,7 @@ int panthor_device_init(struct panthor_device *ptdev)
 	 */
 	*dummy_page_virt = 1;
 
+	INIT_WORK(&ptdev->unplug.work, panthor_device_unplug_work);
 	INIT_WORK(&ptdev->reset.work, panthor_device_reset_work);
 	disable_work(&ptdev->reset.work);
 	ptdev->reset.wq = alloc_ordered_workqueue("panthor-reset-wq", 0);
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index b55a3f9edd41..6529e01e838d 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -268,6 +268,9 @@ struct panthor_device {
 		 * operation is done.
 		 */
 		struct completion done;
+
+		/** @work: Unplug work. */
+		struct work_struct work;
 	} unplug;
 
 	/** @reset: Reset related fields. */

-- 
2.55.0

