Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B5C44E046
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787756190; cv=none; b=gQIl6/Rqr/ionLx62is/C0G9UY1vVb1lNOVV5+j9NNw8OXwlIrhCBmESisu7lWZ5W0K/SpOXrKm/ZmOuDcCmK+DtgLgIAmc3qPudy/CaxoRwlomK+8Io98H+C51750cMHOVQetXLAd3GcGVSV1yRqvSXR5xV0XGi8eT5H8vxOME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787756190; c=relaxed/simple;
	bh=ZHo90s3DWmzTdRWMoEtfSpcSErMYWHPDJ0mRoDecfzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L3qXQHCgEjdWHi94uQ+ENe9JIWatUEKZW1W7LbKCwr15sjJB8h8imMwChdETk4SQrbbHW9VkGSPXPsEPv1wL+IjZrXwrYw/cju8i+WwchjQQVVng1hQAdbsf/gjsLy+/pS1lSlCe74D250GFJ0EMQXv8Sj5z9ZfPCjHO0NkM3BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ROOFyV80; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ROOFyV80"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1787756186;
	bh=ZHo90s3DWmzTdRWMoEtfSpcSErMYWHPDJ0mRoDecfzk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ROOFyV80oRwm0YgAr7/bWKM7IIAtbJW61DyhQfZatbPDUgMT5aDlm4Cl7DhmtanHQ
	 JckM3w6HpgXcxbHXDy6gA6qMz7mFvUHR5plvN0hdCsAIlge+mN+MUsmLMnjf3cDpsE
	 /HjFQ3IH6huFskpQFppcoR7/fKEjwSwu+RkcVVgNs5Rixi1UrQYOBvJHz+5qL8na94
	 q62NiT81+3oajNfTNT74MkponGkQpmgIBB86g67VFojf7dTqWqgg7x7iCEKlqPiXNL
	 dd65N59eJZ5QU2Kcic/ytlZdN/GH73Fh11U5k1mvN+LF+FDW8XEpv3SFH3VWRvQWoo
	 cNpHMHGYhnnsg==
Received: from fedora-32.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3E5A217E10C2;
	Wed, 26 Aug 2026 16:56:26 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Wed, 26 Aug 2026 16:56:11 +0200
Subject: [PATCH v4 12/18] drm/panthor: Let l2_power_off return errors and
 force users to check it
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-panthor-unplug-fixes-v4-12-982cc8f4234b@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787756178; l=6920;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=ZHo90s3DWmzTdRWMoEtfSpcSErMYWHPDJ0mRoDecfzk=;
 b=RX6jIaTw3n27y0bXiJ95nchn5l91Q35a+vDMPTCfkDUkd42DAw5VkofZV+UAMFElGWOdPp+XC
 +Y33pUX+b4aCW4x0pCM8h9CcPKwVmuvmrqd9Nxw4G1IVnfbFTvcVZlL
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=

The MMU logic assumes that, after a suspend, all the AS that were
resident before the suspend are free to leave their slot because the HW
is inactive until the next resume request. This doesn't hold if we
ignore failures to power-off the L2 block.

Let's propagate the error from the PWR backend to
panthor_gpu_l2_power_off(), and adjust panthor_gpu_suspend() to
escalate to slow reset when a fast reset is not possible. Add a
__must_check on panthor_hw_l2_power_off() to make sure new users
don't forget that they have to check the returned value.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c  |  2 +-
 drivers/gpu/drm/panthor/panthor_gpu.c | 15 ++++++++++-----
 drivers/gpu/drm/panthor/panthor_gpu.h |  2 +-
 drivers/gpu/drm/panthor/panthor_hw.h  |  7 ++++---
 drivers/gpu/drm/panthor/panthor_pwr.c | 20 ++++++++++++--------
 drivers/gpu/drm/panthor/panthor_pwr.h |  2 +-
 6 files changed, 29 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 68965175105f..731da736e372 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1308,7 +1308,7 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
 	ptdev->fw->vm = NULL;
 
 	if (!IS_ENABLED(CONFIG_PM) || pm_runtime_active(ptdev->base.dev))
-		panthor_hw_l2_power_off(ptdev);
+		drm_WARN_ON(&ptdev->base, panthor_hw_l2_power_off(ptdev));
 }
 
 /**
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index a383b04f101e..09ebe0294691 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -288,9 +288,9 @@ int panthor_gpu_block_power_on(struct panthor_device *ptdev,
 	return 0;
 }
 
-void panthor_gpu_l2_power_off(struct panthor_device *ptdev)
+int panthor_gpu_l2_power_off(struct panthor_device *ptdev)
 {
-	panthor_gpu_power_off(ptdev, L2, ptdev->gpu_info.l2_present, 20000);
+	return panthor_gpu_power_off(ptdev, L2, ptdev->gpu_info.l2_present, 20000);
 }
 
 /**
@@ -446,11 +446,16 @@ int panthor_gpu_soft_reset(struct panthor_device *ptdev)
  */
 void panthor_gpu_suspend(struct panthor_device *ptdev)
 {
-	/* On a fast reset, simply power down the L2. */
+	/* On a fast reset, simply power down the L2. If it fails, escalate to
+	 * a slow reset.
+	 */
+	if (ptdev->reset.fast && panthor_hw_l2_power_off(ptdev)) {
+		drm_warn(&ptdev->base, "L2 power-off failed, escalating to a slow reset.");
+		ptdev->reset.fast = false;
+	}
+
 	if (!ptdev->reset.fast)
 		panthor_hw_soft_reset(ptdev);
-	else
-		panthor_hw_l2_power_off(ptdev);
 
 	panthor_irq_suspend(&ptdev->gpu->irq);
 }
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.h b/drivers/gpu/drm/panthor/panthor_gpu.h
index f615feb05609..4b8bae363efb 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.h
+++ b/drivers/gpu/drm/panthor/panthor_gpu.h
@@ -46,7 +46,7 @@ int panthor_gpu_block_power_off(struct panthor_device *ptdev,
 				   type ## _PWRTRANS, \
 				   mask, timeout_us)
 
-void panthor_gpu_l2_power_off(struct panthor_device *ptdev);
+int panthor_gpu_l2_power_off(struct panthor_device *ptdev);
 int panthor_gpu_l2_power_on(struct panthor_device *ptdev);
 int panthor_gpu_flush_caches(struct panthor_device *ptdev,
 			     u32 l2, u32 lsc, u32 other);
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
index f797663893b2..4531c1239cb6 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.h
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -15,7 +15,7 @@ struct panthor_hw_ops {
 	int (*soft_reset)(struct panthor_device *ptdev);
 
 	/** @l2_power_off: L2 power off function pointer */
-	void (*l2_power_off)(struct panthor_device *ptdev);
+	int (*l2_power_off)(struct panthor_device *ptdev);
 
 	/** @l2_power_on: L2 power on function pointer */
 	int (*l2_power_on)(struct panthor_device *ptdev);
@@ -51,9 +51,10 @@ static inline int panthor_hw_l2_power_on(struct panthor_device *ptdev)
 	return ptdev->hw->ops.l2_power_on(ptdev);
 }
 
-static inline void panthor_hw_l2_power_off(struct panthor_device *ptdev)
+static inline int __must_check
+panthor_hw_l2_power_off(struct panthor_device *ptdev)
 {
-	ptdev->hw->ops.l2_power_off(ptdev);
+	return ptdev->hw->ops.l2_power_off(ptdev);
 }
 
 static inline bool panthor_hw_has_pwr_ctrl(struct panthor_device *ptdev)
diff --git a/drivers/gpu/drm/panthor/panthor_pwr.c b/drivers/gpu/drm/panthor/panthor_pwr.c
index dd7b6ef8ea20..c81e2cc053db 100644
--- a/drivers/gpu/drm/panthor/panthor_pwr.c
+++ b/drivers/gpu/drm/panthor/panthor_pwr.c
@@ -512,16 +512,17 @@ int panthor_pwr_reset_soft(struct panthor_device *ptdev)
 	return panthor_pwr_reset(ptdev, PWR_COMMAND_RESET_SOFT);
 }
 
-void panthor_pwr_l2_power_off(struct panthor_device *ptdev)
+int panthor_pwr_l2_power_off(struct panthor_device *ptdev)
 {
 	struct panthor_pwr *pwr = ptdev->pwr;
 	const u64 l2_allow_mask = PWR_STATUS_DOMAIN_ALLOWED(PWR_COMMAND_DOMAIN_L2);
 	const u64 pwr_status = gpu_read64(pwr->iomem, PWR_STATUS);
+	int ret;
 
 	/* Abort if L2 power off constraints are not satisfied */
 	if (!(pwr_status & l2_allow_mask)) {
 		drm_warn(&ptdev->base, "Power off L2 domain not allowed");
-		return;
+		return -EOPNOTSUPP;
 	}
 
 	/* It is expected that when halting the MCU, it would power down its
@@ -530,14 +531,17 @@ void panthor_pwr_l2_power_off(struct panthor_device *ptdev)
 	 * host control to be powered down in the right order before powering
 	 * down the L2.
 	 */
-	if (panthor_pwr_domain_force_off(ptdev, PWR_COMMAND_DOMAIN_TILER))
-		return;
+	ret = panthor_pwr_domain_force_off(ptdev, PWR_COMMAND_DOMAIN_TILER);
+	if (ret)
+		return ret;
 
-	if (panthor_pwr_domain_force_off(ptdev, PWR_COMMAND_DOMAIN_SHADER))
-		return;
+	ret = panthor_pwr_domain_force_off(ptdev, PWR_COMMAND_DOMAIN_SHADER);
+	if (ret)
+		return ret;
 
-	panthor_pwr_domain_power_off(ptdev, PWR_COMMAND_DOMAIN_L2, ptdev->gpu_info.l2_present,
-				     PWR_TRANSITION_TIMEOUT_US);
+	return panthor_pwr_domain_power_off(ptdev, PWR_COMMAND_DOMAIN_L2,
+					    ptdev->gpu_info.l2_present,
+					    PWR_TRANSITION_TIMEOUT_US);
 }
 
 int panthor_pwr_l2_power_on(struct panthor_device *ptdev)
diff --git a/drivers/gpu/drm/panthor/panthor_pwr.h b/drivers/gpu/drm/panthor/panthor_pwr.h
index adf1f6136abc..98a9a5b24270 100644
--- a/drivers/gpu/drm/panthor/panthor_pwr.h
+++ b/drivers/gpu/drm/panthor/panthor_pwr.h
@@ -12,7 +12,7 @@ int panthor_pwr_init(struct panthor_device *ptdev);
 
 int panthor_pwr_reset_soft(struct panthor_device *ptdev);
 
-void panthor_pwr_l2_power_off(struct panthor_device *ptdev);
+int panthor_pwr_l2_power_off(struct panthor_device *ptdev);
 
 int panthor_pwr_l2_power_on(struct panthor_device *ptdev);
 

-- 
2.55.0

