Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794291450;
	b=gBHzun6Fg0nOPQiiot8JgKHGEjdsUUoV6Ok/FN4YzfOAhZXoHi1PNZ0hgYe821rTisju
	 ZKsx/+YZ8YkuUksv803dUwLoV0ENOn53WoqWsyGyMIuqEKqZzzyOY5BvWhWhJBCLK5Ccg
	 S39S3ZysfNQpb6B51HWDbt7TmpO9UTN9i72UnQSYtqSpdm7zGpV34kZGBviWnRtLJHxEJ
	 ER3V1QfisA4VPq4w1rnjDcTHqjxs3E6zdRXyTrY6+TcwL/GgkmkuT+fe9kdNgsIA3fb8k
	 YbUfMBQ5XpjlKiK02XvOYqrY7qrhWgL497Ne2RqSDPUrbgOm6UAiWy0X4o7gLCUG+eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794291450;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jQOB3FrRYurKMOFGcwJ8uuebFJPQD4bG5QhBZq9L+ow=;
	b=lF+NG9SIXfzwJamJe5av1FvKT2hR6VhE3p4FBkdANFNOZ7Jvu7wy6PzE6TD4iAr17Q/Z
	 FTcB+cORrNxKRSvlRYa2iamHPvTJctbAfWOaJSJgD76GsFFK+31/2WtTIuMttnUhoZwbG
	 nkDiJCOYBAbpzfiraW7gCIGS2YpM8unSA8pddoYX5g+PG1H8Pf4x3ptGEY5BgYCEkD725
	 nkhOmmBW5EXK3rGO7vhBJ6K3NYh4pMXgFQucWhKhTSKrsOq7xDQm+XjCZEuMTNqIfq5G8
	 RB/O5gWYSd84BWQbmAdRnGQ4ifPz67wXn56JUEevzxoXbl9R/pikkO0xcK5M4yxG1Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=auMdDBlu;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D13F60A261C;
	Tue, 10 Nov 2026 06:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D13F60A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=auMdDBlu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794291449; x=1825827449;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VcGLzv//x9tf3AYbLulNHksUbgEzYc++Hmj2QugCapU=;
  b=auMdDBluounnLSP6r2TUrjYevcHInvGdadgrRa9IuxaIM4yDZG1aa1af
   mjkGBdKF0X1wN/gvwp5IVmRQZhuxUW1li65ZI2HDWOXdV/ih2NE8YFz16
   BDNLXZk9+CEbfRu2CTp+icsu689eeMhxHt1N9eeuFF9SM0KnFkpTRVVUK
   kjqn41kZXxVc0W+nvqibJxlXQAWgT9GCKt6Tgq3zXmXVZF/vwzrs26rCN
   /BSwzO2oP0imVJJSr1G0PjnCeqOoXafjohz66zzdXEkrucVpF8nVEvnto
   uvfIKjkfLpXOwbZbOuzvW21ySxe1+3p1aFW4d+07oSal0M/AS+1D9tcbR
   A==;
X-CSE-ConnectionGUID: IubMucw6RyK1E/JHN8EKng==
X-CSE-MsgGUID: Zrb38eXdTqW0ddnTmBKkZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3020992"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3020992"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 22:17:28 -0800
X-CSE-ConnectionGUID: HYA1ZS8pTGqK+Q29ZJk6UA==
X-CSE-MsgGUID: 7FFBxa/3QNOucJ/LCFOf0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7931034"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
  by orviesa004.jf.intel.com with ESMTP; 09 Nov 2026 22:17:22 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
	John.Harrison@Igalia.com,
	kernel-dev@igalia.com,
	alex.hung@amd.com,
	liviu.dudau@arm.com,
	louis.chauvet@bootlin.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	laurent.pinchart+renesas@ideasonboard.com,
	tomi.valkeinen+renesas@ideasonboard.com,
	kieran.bingham+renesas@ideasonboard.com,
	dave.stevenson@raspberrypi.com,
	mcanal@igalia.com,
	kernel-list@raspberrypi.com,
	uma.shankar@intel.com,
	arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v7 5/8] drm: writeback: Modify drm_writeback_signal_completion helper
Date: Tue, 10 Nov 2026 11:46:34 +0530
Message-Id: <20261110061637.2500929-6-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110061637.2500929-1-suraj.kandpal@intel.com>
References: <20261110061637.2500929-1-suraj.kandpal@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drm_writeback_signal_completion() needs access to the parent
drm_connector object as well as the drm_writeback_connector object
itself. So, pass in the top level drm_connector and traverse down
to drm_writeback_connector rather than passing in the lower level
object and traversing back up. Update to use the top level object
for consistency across the writeback interface.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: John Harrison <John.Harrison@Igalia.com>
---
v6 -> v7:
- Rebase over latest kernel
- Rebase over latest writeback series by Dmitry
- Fix null pointer dereference (Alex)

v5 -> v6:
- Rebase over latest kernel

v4 -> v5:
- Make @connector kerneldoc wording consistent across the series (John)

v3 -> v4:
- Update subject line for consitency (John)
- Update commit message across commits for consitency (John)

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c   | 2 +-
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c    | 2 +-
 drivers/gpu/drm/arm/malidp_hw.c                     | 6 +++---
 drivers/gpu/drm/drm_writeback.c                     | 6 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 4 ++--
 drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c | 2 +-
 drivers/gpu/drm/vc4/vc4_txp.c                       | 2 +-
 drivers/gpu/drm/vkms/vkms_composer.c                | 2 +-
 include/drm/drm_writeback.h                         | 2 +-
 9 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 0fdc32878002..512cb24b7f14 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4422,7 +4422,7 @@ bool amdgpu_dm_crtc_complete_writeback(struct amdgpu_crtc *acrtc)
 	if (!pending)
 		return false;
 
-	drm_writeback_signal_completion(acrtc->wb_conn, 0);
+	drm_writeback_signal_completion(drm_writeback_to_connector(acrtc->wb_conn), 0);
 	drm_crtc_vblank_put(&acrtc->base);
 
 	return true;
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index fd35f81dfca8..21445385b245 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
@@ -214,7 +214,7 @@ void komeda_crtc_handle_event(struct komeda_crtc   *kcrtc,
 		struct komeda_wb_connector *wb_conn = kcrtc->wb_conn;
 
 		if (wb_conn)
-			drm_writeback_signal_completion(&wb_conn->base.writeback, 0);
+			drm_writeback_signal_completion(&wb_conn->base, 0);
 		else
 			drm_warn(drm, "CRTC[%d]: EOW happen but no wb_connector.\n",
 				 drm_crtc_index(&kcrtc->base));
diff --git a/drivers/gpu/drm/arm/malidp_hw.c b/drivers/gpu/drm/arm/malidp_hw.c
index 5a7bd27d3718..9b845d3f34e1 100644
--- a/drivers/gpu/drm/arm/malidp_hw.c
+++ b/drivers/gpu/drm/arm/malidp_hw.c
@@ -1315,15 +1315,15 @@ static irqreturn_t malidp_se_irq(int irq, void *arg)
 	if (status & se->vsync_irq) {
 		switch (hwdev->mw_state) {
 		case MW_ONESHOT:
-			drm_writeback_signal_completion(&malidp->mw_connector.writeback, 0);
+			drm_writeback_signal_completion(&malidp->mw_connector, 0);
 			break;
 		case MW_STOP:
-			drm_writeback_signal_completion(&malidp->mw_connector.writeback, 0);
+			drm_writeback_signal_completion(&malidp->mw_connector, 0);
 			/* disable writeback after stop */
 			hwdev->mw_state = MW_NOT_ENABLED;
 			break;
 		case MW_RESTART:
-			drm_writeback_signal_completion(&malidp->mw_connector.writeback, 0);
+			drm_writeback_signal_completion(&malidp->mw_connector, 0);
 			fallthrough;	/* to a new start */
 		case MW_START:
 			/* writeback started, need to emulate one-shot mode */
diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index a97cd4fa8dec..7c74361e38e2 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -453,7 +453,8 @@ static void cleanup_work(struct work_struct *work)
 
 /**
  * drm_writeback_signal_completion - Signal the completion of a writeback job
- * @wb_connector: The writeback connector whose job is complete
+ * @connector: DRM connector which contains the writeback connector whose
+ * job is complete
  * @status: Status code to set in the writeback out_fence (0 for success)
  *
  * Drivers should call this to signal the completion of a previously queued
@@ -468,10 +469,11 @@ static void cleanup_work(struct work_struct *work)
  * See also: drm_writeback_queue_job()
  */
 void
-drm_writeback_signal_completion(struct drm_writeback_connector *wb_connector,
+drm_writeback_signal_completion(struct drm_connector *connector,
 				int status)
 {
 	unsigned long flags;
+	struct drm_writeback_connector *wb_connector = &connector->writeback;
 	struct drm_writeback_job *job;
 	struct dma_fence *out_fence;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 0a4026f22274..977fc0337fbd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -370,7 +370,7 @@ static void dpu_encoder_phys_wb_done_irq(void *arg)
 	spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
 
 	if (wb_enc->wb_conn)
-		drm_writeback_signal_completion(wb_enc->wb_conn, 0);
+		drm_writeback_signal_completion(drm_writeback_to_connector(wb_enc->wb_conn), 0);
 
 	/* Signal any waiting atomic commit thread */
 	wake_up_all(&phys_enc->pending_kickoff_wq);
@@ -431,7 +431,7 @@ static void _dpu_encoder_phys_wb_handle_wbdone_timeout(
 	phys_enc->enable_state = DPU_ENC_ERR_NEEDS_HW_RESET;
 
 	if (wb_enc->wb_conn)
-		drm_writeback_signal_completion(wb_enc->wb_conn, 0);
+		drm_writeback_signal_completion(drm_writeback_to_connector(wb_enc->wb_conn), 0);
 
 	dpu_encoder_frame_done_callback(phys_enc->parent, phys_enc, frame_event);
 }
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
index c3802bbced16..02e74048d00f 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
@@ -258,5 +258,5 @@ void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,
 
 void rcar_du_writeback_complete(struct rcar_du_crtc *rcrtc)
 {
-	drm_writeback_signal_completion(&rcrtc->wb_connector.writeback, 0);
+	drm_writeback_signal_completion(&rcrtc->wb_connector, 0);
 }
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 584610e1628f..7b9f9828ea4e 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -505,7 +505,7 @@ static irqreturn_t vc4_txp_interrupt(int irq, void *data)
 	 */
 	TXP_WRITE(TXP_DST_CTRL, TXP_READ(TXP_DST_CTRL) & ~TXP_EI);
 	vc4_crtc_handle_vblank(vc4_crtc);
-	drm_writeback_signal_completion(&txp->connector.writeback, 0);
+	drm_writeback_signal_completion(&txp->connector, 0);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 13e34d4f515e..0fc915a954ba 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -658,7 +658,7 @@ void vkms_composer_worker(struct work_struct *work)
 		return;
 
 	if (wb_pending) {
-		drm_writeback_signal_completion(&out->wb_connector.writeback, 0);
+		drm_writeback_signal_completion(&out->wb_connector, 0);
 		spin_lock_irq(&out->composer_lock);
 		crtc_state->wb_pending = false;
 		spin_unlock_irq(&out->composer_lock);
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index b4c11d380df0..5e8ab51c2da4 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -100,7 +100,7 @@ void drm_writeback_queue_job(struct drm_connector *wb_connector,
 void drm_writeback_cleanup_job(struct drm_writeback_job *job);
 
 void
-drm_writeback_signal_completion(struct drm_writeback_connector *wb_connector,
+drm_writeback_signal_completion(struct drm_connector *connector,
 				int status);
 
 struct dma_fence *
-- 
2.34.1

