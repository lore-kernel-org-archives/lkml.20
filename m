Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F31635E94E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790759139; cv=none; b=EpxQsX7zG38CEURNSxdNeJImsk9+f9SSeUXUnPK2d6+ZJTNtGcFh0zezWkaNEJK8CHWUjZitDtjSF/QT9UvUhA9NwJ0ar577PHXt1QtGtkU0YiuNkjHCX3FEsA7NLOVn3ZlGgoWIYYnCeez8S+GeA7CDAhePS8HDRpCT7BYkgVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790759139; c=relaxed/simple;
	bh=HLLZ8N9YRQu5++wPzOsjXTDJCPcIK9Zjrn36eNuudiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CcpaQDdRZN8gryuzvvHU4t2dlMH2I5SWMBPtm9em6ehfnEZw9dt9ev10+YmpxKmzrUXKEWm7rJY7hfc9MVw2g3Kx8VX26kIqnApEeYXeOqddvvCklH613TjFzM9pFapOsmUDH5sah0tZV3TcwcUGpLhr7+qI6pzZbObggZrodzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P6zeX0t4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P6zeX0t4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790759137; x=1822295137;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HLLZ8N9YRQu5++wPzOsjXTDJCPcIK9Zjrn36eNuudiA=;
  b=P6zeX0t4kBaDmYlYAPCPPD83a54NYNpHrprng5Oa2TTiSPNP+xYN1NUO
   0B6sLE1J9j/ADynmAiLuxJB2ZEwYPGmT4Q1GJxieXG1h7Ei32scoQbBHL
   VbcDg7NI0Joof5weBPSwZZ+ashtqsIUw8eUwT9HhK8zK4SoJwF1nagCip
   /SgjbsG/tmJ9xtbHs5KZTHpxvTvN8xLKzGFhHSTV/8esje5ln0mZS9y8O
   KWr42HCOsQsgY3ZbtY+vxEDcR1xt4ll4QebkxpF2OF5R3FmmnTS/wYptl
   9J0ZFS91RnF2uxBoaVVJ2JwUfl54gLG5Z8AlCDxqADp5rB1fmIOS+lfdQ
   w==;
X-CSE-ConnectionGUID: Bpjqudr5QOamhSsBNOVSVA==
X-CSE-MsgGUID: W9ThdSlkSPSgrAfTlWGkVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90621897"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90621897"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 02:05:37 -0700
X-CSE-ConnectionGUID: r7EUTq6EROenjzFz1Ignsg==
X-CSE-MsgGUID: lNaAgVVYREOPL+AK06RPNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="275188871"
Received: from vtg-bdc-vm10.iil.intel.com ([143.185.124.149])
  by fmviesa007.fm.intel.com with ESMTP; 30 Sep 2026 02:05:35 -0700
From: Divyamani Tripathi <divyamani.tripathi@intel.com>
To: linux-kernel@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	antti.laakso@linux.intel.com,
	sarang.sapre@intel.com,
	manik.bajpai@intel.com,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH 5/7] media: ipu6: add IPU8 isys chip/MMU enablement
Date: Wed, 30 Sep 2026 12:01:46 +0300
Message-ID: <20260930090148.3980652-6-divyamani.tripathi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930090148.3980652-1-divyamani.tripathi@intel.com>
References: <20260930090148.3980652-1-divyamani.tripathi@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Complete IPU8 ISYS enablement: add the IPU8 NDE control register, TSC
sync variant, TLBID_HASH bits and ISYS MMU hardware table. Add
IS_IPU8() alongside the existing IS_IPU7() check at each site in
ipu6.c, ipu6-buttress.c, ipu6-isys.c, ipu6-isys-csi2.c, ipu6-cpd.c and
ipu6-mmu.c that needs to follow the IPU7-family codepath, keeping the
two checks independent instead of widening IS_IPU7() to also match
IPU8. Without this IPU8 firmware boot fails with
IA_GOFO_FW_BOOT_STATE_CRIT_UNSPECIFIED (0xdead0001), confirmed on real
hardware. PSYS-specific pieces are intentionally left out here.

Signed-off-by: Divyamani Tripathi <divyamani.tripathi@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-buttress.c  |  44 ++++--
 drivers/media/pci/intel/ipu6/ipu6-cpd.c       |   2 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  15 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c      |  14 +-
 drivers/media/pci/intel/ipu6/ipu6-mmu.c       |   4 +-
 .../intel/ipu6/ipu6-platform-buttress-regs.h  |   2 +
 drivers/media/pci/intel/ipu6/ipu6.c           |  22 +--
 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c    | 145 +++++++++++++++++-
 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h    |  64 ++++++++
 9 files changed, 275 insertions(+), 37 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
index 105de1744dff..be07d33a4dab 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -346,7 +346,7 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
 	if (!active)
 		return IRQ_NONE;
 
-	if (IS_IPU7(isp)) {
+	if (IS_IPU7(isp) || IS_IPU8(isp)) {
 		u32 pb_irq;
 
 		pb_irq = readl(isp->pb_base + IPU7_PB_INTERRUPT_STATUS);
@@ -478,6 +478,9 @@ static int ipu7_isys_d2d_power(struct ipu6_device *isp, bool on)
 
 static void ipu7_nde_control(struct ipu6_device *isp, bool on)
 {
+	u32 resvec = IS_IPU8(isp) ? IPU8_NDE_RESVEC : IPU7_NDE_RESVEC;
+	u32 reg = IS_IPU8(isp) ? IPU8_BUTTRESS_REG_NDE_CONTROL :
+					 IPU7_BUTTRESS_REG_NDE_CONTROL;
 	u32 val;
 
 	val = FIELD_PREP(IPU7_NDE_VAL_MASK,
@@ -486,8 +489,8 @@ static void ipu7_nde_control(struct ipu6_device *isp, bool on)
 			 on ? IPU7_NDE_SCALE_ACTIVE : IPU7_NDE_SCALE_DEFAULT) |
 	      FIELD_PREP(IPU7_NDE_VALID_MASK,
 			 on ? IPU7_NDE_VALID_ACTIVE : IPU7_NDE_VALID_DEFAULT) |
-	      FIELD_PREP(IPU7_NDE_RESVEC_MASK, IPU7_NDE_RESVEC);
-	writel(val, isp->base + IPU7_BUTTRESS_REG_NDE_CONTROL);
+	      FIELD_PREP(IPU7_NDE_RESVEC_MASK, resvec);
+	writel(val, isp->base + reg);
 }
 
 static int __ipu7_power_on(struct device *dev,
@@ -612,7 +615,7 @@ int ipu6_buttress_power(struct device *dev,
 
 	mutex_lock(&isp->buttress.power_mutex);
 
-	if (IS_IPU7(isp))
+	if (IS_IPU7(isp) || IS_IPU8(isp))
 		ret = on ? __ipu7_power_on(dev, ctrl) :
 			   __ipu7_power_off(dev, ctrl);
 	else
@@ -775,7 +778,7 @@ int ipu6_buttress_authenticate(struct ipu6_device *isp)
 	 * Write address of FIT table to FW_SOURCE register
 	 * Let's use fw address. I.e. not using FIT table yet
 	 */
-	if (IS_IPU7(isp)) {
+	if (IS_IPU7(isp) || IS_IPU8(isp)) {
 		writel(isp->cpd_fw->size,
 		       isp->base + IPU7_BUTTRESS_REG_FW_SOURCE_SIZE);
 		writel(sg_dma_address(isp->psys->fw_sgt.sgl),
@@ -822,7 +825,7 @@ int ipu6_buttress_authenticate(struct ipu6_device *isp)
 		goto out_unlock;
 	}
 
-	void __iomem *base = IS_IPU7(isp) ?
+	void __iomem *base = (IS_IPU7(isp) || IS_IPU8(isp)) ?
 			     isp->base + IPU7_BUTTRESS_REG_FW_BOOT_PARAMS7 :
 			     psys_pdata->base + BOOTLOADER_STATUS_OFFSET;
 
@@ -922,6 +925,23 @@ static int __ipu7p5_start_tsc_sync(struct ipu6_device *isp)
 	return -ETIMEDOUT;
 }
 
+static int __ipu8_start_tsc_sync(struct ipu6_device *isp)
+{
+	u32 val;
+
+	for (unsigned int i = 0; i < BUTTRESS_TSC_SYNC_RESET_TRIAL_MAX; i++) {
+		val = readl(isp->base + IPU7_BUTTRESS_REG_PB_TIMESTAMP_VALID);
+		if (val == 1)
+			return 0;
+
+		usleep_range(40, 50);
+	}
+
+	dev_err(&isp->pdev->dev, "TSC sync failed (timeout)\n");
+
+	return -ETIMEDOUT;
+}
+
 static int __ipu6_start_tsc_sync(struct ipu6_device *isp)
 {
 	for (unsigned int i = 0; i < BUTTRESS_TSC_SYNC_RESET_TRIAL_MAX; i++) {
@@ -948,6 +968,9 @@ static int __ipu6_start_tsc_sync(struct ipu6_device *isp)
 
 int ipu6_buttress_start_tsc_sync(struct ipu6_device *isp)
 {
+	if (IS_IPU8(isp))
+		return __ipu8_start_tsc_sync(isp);
+
 	if (IS_IPU7P5(isp))
 		return __ipu7p5_start_tsc_sync(isp);
 
@@ -1037,7 +1060,10 @@ static void ipu7_buttress_setup(struct ipu6_device *isp)
 
 	writel(val, isp->pb_base + IPU7_BAR2_MISC_CONFIG);
 
-	if (IS_IPU7P5(isp)) {
+	if (IS_IPU8(isp)) {
+		writel(BIT(13), isp->pb_base + IPU7_TLBID_HASH_ENABLE_63_32);
+		writel(BIT(9), isp->pb_base + IPU7_TLBID_HASH_ENABLE_95_64);
+	} else if (IS_IPU7P5(isp)) {
 		writel(BIT(14), isp->pb_base + IPU7_TLBID_HASH_ENABLE_63_32);
 		writel(BIT(9), isp->pb_base + IPU7_TLBID_HASH_ENABLE_95_64);
 	} else {
@@ -1057,7 +1083,7 @@ void ipu6_buttress_restore(struct ipu6_device *isp)
 {
 	struct ipu6_buttress *b = &isp->buttress;
 
-	if (IS_IPU7(isp)) {
+	if (IS_IPU7(isp) || IS_IPU8(isp)) {
 		ipu7_buttress_setup(isp);
 	} else {
 		writel(b->regs->irq_all, isp->base + b->regs->irq_clear);
@@ -1085,7 +1111,7 @@ int ipu6_buttress_init(struct ipu6_device *isp)
 	dev_dbg(&isp->pdev->dev, "IPU in %s mode\n",
 		isp->secure_mode ? "secure" : "non-secure");
 
-	if (IS_IPU7(isp)) {
+	if (IS_IPU7(isp) || IS_IPU8(isp)) {
 		ipu7_buttress_setup(isp);
 		b->ref_clk = 384;
 	} else {
diff --git a/drivers/media/pci/intel/ipu6/ipu6-cpd.c b/drivers/media/pci/intel/ipu6/ipu6-cpd.c
index 1fadb0f2f6c1..9824a871dfd6 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-cpd.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-cpd.c
@@ -454,7 +454,7 @@ int ipu6_cpd_validate_cpd_file(struct ipu6_device *isp, const void *cpd_file,
 		return -EINVAL;
 	}
 
-	if (IS_IPU7(isp))
+	if (IS_IPU7(isp) || IS_IPU8(isp))
 		return __ipu7_validate_cpd_file(isp, cpd_file, cpd_file_size);
 
 	return __ipu6_validate_cpd_file(isp, cpd_file, cpd_file_size);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 0db6971d8d3e..4a2b3d460782 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -244,7 +244,8 @@ static void ipu6_isys_csi2_setup_watermark(struct ipu6_isys_csi2 *csi2,
 	s64 link_freq;
 	int ret;
 
-	if (IS_IPU7(csi2->asd.isys->adev->isp))
+	if (IS_IPU7(csi2->asd.isys->adev->isp) ||
+	    IS_IPU8(csi2->asd.isys->adev->isp))
 		return;
 
 	ret = v4l2_g_ctrl(remote_sd->ctrl_handler, &hb);
@@ -298,7 +299,8 @@ static void ipu6_isys_csi2_setup_watermark(struct ipu6_isys_csi2 *csi2,
 
 static void ipu6_isys_csi2_clear_watermark(struct ipu6_isys_csi2 *csi2)
 {
-	if (IS_IPU7(csi2->asd.isys->adev->isp))
+	if (IS_IPU7(csi2->asd.isys->adev->isp) ||
+	    IS_IPU8(csi2->asd.isys->adev->isp))
 		return;
 
 	csi2->watermark.force_iwake_disable = false;
@@ -680,8 +682,9 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 		goto err_requeue_buffers;
 
 	if (!csi2->streaming_vc) {
-		ret = IS_IPU7(isp) ? ipu7_isys_csi2_stream_enable(csi2) :
-				     ipu6_isys_csi2_stream_enable(csi2);
+		ret = (IS_IPU7(isp) || IS_IPU8(isp)) ?
+			      ipu7_isys_csi2_stream_enable(csi2) :
+			      ipu6_isys_csi2_stream_enable(csi2);
 		if (ret)
 			goto err_stop_stream_firmware;
 	}
@@ -696,7 +699,7 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	return 0;
 
 err_stop_stream_csi2:
-	if (IS_IPU7(isp))
+	if (IS_IPU7(isp) || IS_IPU8(isp))
 		ipu7_isys_csi2_stream_disable(csi2);
 	else
 		ipu6_isys_csi2_stream_disable(csi2);
@@ -766,7 +769,7 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 		ipu6_isys_find_stream_firmware(csi2, vc);
 	ipu6_isys_stop_stream_firmware(stream);
 
-	if IS_IPU7(isp)
+	if (IS_IPU7(isp) || IS_IPU8(isp))
 		ipu7_isys_csi2_stream_disable(csi2);
 	else
 		ipu6_isys_csi2_stream_disable(csi2);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 60f5f9ea2910..34ddef410230 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -186,7 +186,7 @@ static int isys_csi2_register_subdevices(struct ipu6_isys *isys)
 	for (i = 0; i < csi2_pdata->nports; i++) {
 		void __iomem *base = isys->pdata->base;
 
-		if (IS_IPU7(isys->adev->isp)) {
+		if (IS_IPU7(isys->adev->isp) || IS_IPU8(isys->adev->isp)) {
 			u32 mask = IS_IPU7_MTL(isys->adev->isp) ?
 					IPU7_CSI_LEGACY_IRQ_MASK(i) :
 					IPU7P5_CSI_LEGACY_IRQ_MASK(i);
@@ -633,7 +633,7 @@ static int isys_notifier_init(struct ipu6_isys *isys)
 			continue;
 
 		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
-		if (ret && IS_IPU7(isp)) {
+		if (ret && (IS_IPU7(isp) || IS_IPU8(isp))) {
 			vep.bus_type = V4L2_MBUS_CSI2_CPHY;
 			ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 		}
@@ -771,7 +771,7 @@ static int isys_runtime_pm_resume(struct device *dev)
 	if (ret)
 		goto err_mmu_hw_cleanup;
 
-	if (IS_IPU7(isp)) {
+	if (IS_IPU7(isp) || IS_IPU8(isp)) {
 		ipu7_isys_setup_hw(isys);
 	} else {
 		ipu6_isys_setup_hw(isys);
@@ -804,7 +804,7 @@ static int isys_runtime_pm_resume(struct device *dev)
 	isys->phy_termcal_val = 0;
 	cpu_latency_qos_update_request(&isys->pm_qos, PM_QOS_DEFAULT_VALUE);
 
-	if (!IS_IPU7(isp))
+	if (!IS_IPU7(isp) && !IS_IPU8(isp))
 		set_iwake_ltrdid(isys, 0, 0, LTR_ISYS_OFF);
 
 err_mmu_hw_cleanup:
@@ -829,7 +829,7 @@ static int isys_runtime_pm_suspend(struct device *dev)
 	isys->phy_termcal_val = 0;
 	cpu_latency_qos_update_request(&isys->pm_qos, PM_QOS_DEFAULT_VALUE);
 
-	if (!IS_IPU7(isp))
+	if (!IS_IPU7(isp) && !IS_IPU8(isp))
 		set_iwake_ltrdid(isys, 0, 0, LTR_ISYS_OFF);
 
 	ipu6_mmu_hw_cleanup(adev->mmu);
@@ -986,7 +986,7 @@ static int isys_probe(struct auxiliary_device *auxdev,
 	if (!isys)
 		return -ENOMEM;
 
-	adev->auxdrv_data = IS_IPU7(isp) ? &ipu7_isys_auxdrv_data :
+	adev->auxdrv_data = (IS_IPU7(isp) || IS_IPU8(isp)) ? &ipu7_isys_auxdrv_data :
 					   &ipu6_isys_auxdrv_data;
 	adev->auxdrv = to_auxiliary_drv(auxdev->dev.driver);
 	isys->adev = adev;
@@ -1023,7 +1023,7 @@ static int isys_probe(struct auxiliary_device *auxdev,
 	if (ret < 0)
 		goto out_remove_pkg_dir_shared_buffer;
 
-	if (IS_IPU7(adev->isp))
+	if (IS_IPU7(adev->isp) || IS_IPU8(adev->isp))
 		isys->phy_set_power = ipu7_isys_csi_phy_set_power;
 	else if (IS_IPU6SE(adev->isp))
 		isys->phy_set_power = ipu6_isys_jsl_phy_set_power;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
index 243d438786ba..1a564ceb7478 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
@@ -473,7 +473,7 @@ static struct ipu6_mmu_info *ipu6_mmu_alloc(struct ipu6_device *isp)
 	if (!mmu_info)
 		return NULL;
 
-	if (IS_IPU7(isp))
+	if (IS_IPU7(isp) || IS_IPU8(isp))
 		mmu_info->aperture_start = isp->secure_mode ?
 			IPU7_FW_CODE_REGION_END : IPU7_FW_CODE_REGION_START;
 	else
@@ -684,7 +684,7 @@ struct ipu6_mmu *ipu6_mmu_init(struct device *dev,
 	if (!mmu)
 		return ERR_PTR(-ENOMEM);
 
-	mmu->ops = IS_IPU7(isp) ? &ipu7_mmu_ops : &ipu6_mmu_ops;
+	mmu->ops = (IS_IPU7(isp) || IS_IPU8(isp)) ? &ipu7_mmu_ops : &ipu6_mmu_ops;
 	mmu->mmid = mmid;
 	mmu->ready = false;
 	INIT_LIST_HEAD(&mmu->vma_list);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h b/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
index 57e661cc2177..a1e00965ac4a 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
@@ -295,6 +295,7 @@ enum {
 
 /* NDE */
 #define IPU7_BUTTRESS_REG_NDE_CONTROL		0x21a4
+#define IPU8_BUTTRESS_REG_NDE_CONTROL		0x21a8
 #define IPU7_NDE_VAL_MASK			GENMASK(9, 0)
 #define IPU7_NDE_SCALE_MASK			GENMASK(12, 10)
 #define IPU7_NDE_VALID_MASK			BIT(13)
@@ -306,6 +307,7 @@ enum {
 #define IPU7_NDE_SCALE_DEFAULT			2
 #define IPU7_NDE_VALID_DEFAULT			0
 #define IPU7_NDE_RESVEC				0xe
+#define IPU8_NDE_RESVEC				0x2
 
 /* IS UCX control */
 #define IPU7_UCX_CTL_RESET			BIT(0)
diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 2ed2a41ac96f..acc492f5cc11 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -274,7 +274,7 @@ void ipu6_configure_spc(struct ipu6_device *isp,
 	void __iomem *spc_regs_base;
 	u32 val;
 
-	if (IS_IPU7(isp))
+	if (IS_IPU7(isp) || IS_IPU8(isp))
 		return;
 
 	dmem_base = base + hw_variant->dmem_offset;
@@ -371,14 +371,16 @@ static void ipu6_internal_pdata_init(struct ipu6_device *isp)
 		psys_ipdata.hw_variant.spc_offset = IPU6SE_PSYS_SPC_OFFSET;
 	}
 
+	if (IS_IPU7(isp)) {
+		isys_ipdata.csi2.gpreg = IPU7_IS_IO_CSI2_GPREGS_BASE;
+		isys_ipdata.csi2.gpreg_stride = IPU7_IS_IO_CSI2_GPREGS_STRIDE;
+		isys_ipdata.csi2.nports = 4;
+	}
+
 	if (IS_IPU8(isp)) {
 		isys_ipdata.csi2.gpreg = IPU8_IS_IO_CSI2_GPREGS_BASE;
 		isys_ipdata.csi2.gpreg_stride = IPU8_IS_IO_CSI2_GPREGS_STRIDE;
 		isys_ipdata.csi2.nports = 4;
-	} else if (IS_IPU7(isp)) {
-		isys_ipdata.csi2.gpreg = IPU7_IS_IO_CSI2_GPREGS_BASE;
-		isys_ipdata.csi2.gpreg_stride = IPU7_IS_IO_CSI2_GPREGS_STRIDE;
-		isys_ipdata.csi2.nports = 4;
 	}
 }
 
@@ -503,7 +505,7 @@ static void ipu6_configure_vc_mechanism(struct ipu6_device *isp)
 {
 	u32 val;
 
-	if (IS_IPU7(isp))
+	if (IS_IPU7(isp) || IS_IPU8(isp))
 		return;
 
 	val = readl(isp->base + BUTTRESS_REG_BTRS_CTRL);
@@ -696,7 +698,7 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return dev_err_probe(dev, PTR_ERR(isp->base),
 				     "Failed to I/O mem remapping\n");
 
-	if (IS_IPU7(isp)) {
+	if (IS_IPU7(isp) || IS_IPU8(isp)) {
 		isp->pb_base = pcim_iomap_region(pdev, IPU7_PCI_PBBAR,
 						 IPU6_NAME);
 		if (IS_ERR(isp->pb_base))
@@ -768,7 +770,7 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto out_ipu6_rpm_put;
 	}
 
-	ret = IS_IPU7(isp) ? ipu7_map_fw(isp) : ipu6_map_fw(isp);
+	ret = (IS_IPU7(isp) || IS_IPU8(isp)) ? ipu7_map_fw(isp) : ipu6_map_fw(isp);
 	if (ret)
 		goto out_ipu6_rpm_put;
 
@@ -811,7 +813,7 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 out_ipu6_rpm_put:
 	pm_runtime_put_sync(&isp->psys->auxdev.dev);
 out_ipu6_bus_del_devices:
-	dir = IS_IPU7(isp) ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE;
+	dir = (IS_IPU7(isp) || IS_IPU8(isp)) ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE;
 	if (!IS_ERR_OR_NULL(isp->psys)) {
 		ipu6_cpd_free_pkg_dir(isp->psys);
 		if (isp->psys->fw_sgt.nents)
@@ -845,7 +847,7 @@ static void ipu6_pci_remove(struct pci_dev *pdev)
 
 	devm_free_irq(&pdev->dev, pdev->irq, isp);
 
-	dir = IS_IPU7(isp) ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE;
+	dir = (IS_IPU7(isp) || IS_IPU8(isp)) ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE;
 	ipu6_cpd_free_pkg_dir(isp->psys);
 	ipu6_unmap_fw_region(isp->psys, dir);
 
diff --git a/drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c b/drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c
index c9b015e89ee6..fecaff5ce032 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c
+++ b/drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c
@@ -538,6 +538,127 @@ static struct ipu7_mmu_hw ipu7p5_isys_mmu_hwdata[] = {
 	},
 };
 
+static struct ipu7_mmu_hw ipu8_isys_mmu_hwdata[] = {
+	{
+		.name = "IS_FW_RD",
+		.offset = IPU8_IS_MMU_FW_RD_OFFSET,
+		.zlx_offset = IPU8_IS_ZLX_UC_RD_OFFSET,
+		.uao_offset = IPU8_IS_UAO_UC_RD_OFFSET,
+		.info_bits = 0x20005101,
+		.refill = 0x00002726,
+		.collapse_en_bitmap = 0x1,
+		.at_sp_arb_cfg = 0x1,
+		.l1_block = IPU8_IS_MMU_FW_RD_L1_BLOCKNR_REG,
+		.l2_block = IPU8_IS_MMU_FW_RD_L2_BLOCKNR_REG,
+		.nr_l1streams = IPU8_IS_MMU_FW_RD_STREAM_NUM,
+		.nr_l2streams = IPU8_IS_MMU_FW_RD_STREAM_NUM,
+		.l1_block_sz = { 0x0, 0x8, 0xa },
+		.l2_block_sz = { 0x0, 0x2, 0x4 },
+		.zlx_nr = IPU8_IS_ZLX_UC_RD_NUM,
+		.zlx_axi_pool = { 0x00000f30 },
+		.zlx_en = { 0, 1, 0, 0 },
+		.zlx_conf = { 0, 2, 0, 0 },
+		.uao_p_num = IPU8_IS_UAO_UC_RD_PLANENUM,
+		.uao_p2tlb = { 0x00000049, 0x0000004c, 0x0000004d, 0x00000000 },
+	},
+	{
+		.name = "IS_FW_WR",
+		.offset = IPU8_IS_MMU_FW_WR_OFFSET,
+		.zlx_offset = IPU8_IS_ZLX_UC_WR_OFFSET,
+		.uao_offset = IPU8_IS_UAO_UC_WR_OFFSET,
+		.info_bits = 0x20005001,
+		.refill = 0x00002524,
+		.collapse_en_bitmap = 0x1,
+		.at_sp_arb_cfg = 0x1,
+		.l1_block = IPU8_IS_MMU_FW_WR_L1_BLOCKNR_REG,
+		.l2_block = IPU8_IS_MMU_FW_WR_L2_BLOCKNR_REG,
+		.nr_l1streams = IPU8_IS_MMU_FW_WR_STREAM_NUM,
+		.nr_l2streams = IPU8_IS_MMU_FW_WR_STREAM_NUM,
+		.l1_block_sz = { 0x0, 0x8, 0xa },
+		.l2_block_sz = { 0x0, 0x2, 0x4 },
+		.zlx_nr = IPU8_IS_ZLX_UC_WR_NUM,
+		.zlx_axi_pool = { 0x00000f20 },
+		.zlx_en = { 0, 1, 1, 0 },
+		.zlx_conf = { 0x0, 0x2, 0x2, 0x0 },
+		.uao_p_num = IPU8_IS_UAO_UC_WR_PLANENUM,
+		.uao_p2tlb = { 0x00000049, 0x0000004a, 0x0000004b, 0x00000000 },
+	},
+	{
+		.name = "IS_DATA_WR_ISOC",
+		.offset = IPU8_IS_MMU_M0_OFFSET,
+		.zlx_offset = IPU8_IS_ZLX_M0_OFFSET,
+		.uao_offset = IPU8_IS_UAO_M0_WR_OFFSET,
+		.info_bits = 0x20004e01,
+		.refill = 0x00002120,
+		.collapse_en_bitmap = 0x1,
+		.at_sp_arb_cfg = 0x1,
+		.l1_block = IPU8_IS_MMU_M0_L1_BLOCKNR_REG,
+		.l2_block = IPU8_IS_MMU_M0_L2_BLOCKNR_REG,
+		.nr_l1streams = IPU8_IS_MMU_M0_STREAM_NUM,
+		.nr_l2streams = IPU8_IS_MMU_M0_STREAM_NUM,
+		.l1_block_sz = { 0x00, 0x02, 0x04, 0x06, 0x08, 0x0a, 0x0c, 0x0e,
+				 0x10, 0x12, 0x14, 0x16, 0x18, 0x1a, 0x1c, 0x1e },
+		.l2_block_sz = { 0x00, 0x02, 0x04, 0x06, 0x08, 0x0a, 0x0c, 0x0e,
+				 0x10, 0x12, 0x14, 0x16, 0x18, 0x1a, 0x1c, 0x1e },
+		.zlx_nr = IPU8_IS_ZLX_M0_NUM,
+		.zlx_axi_pool = { 0x00000f10 },
+		.zlx_en = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
+		.zlx_conf = { 0x3, 0x3, 0x3, 0x3, 0x3, 0x3, 0x3, 0x3,
+			      0x3, 0x3, 0x3, 0x3, 0x3, 0x3, 0x3, 0x3 },
+		.uao_p_num = IPU8_IS_UAO_M0_WR_PLANENUM,
+		.uao_p2tlb = { 0x3b, 0x3c, 0x3d, 0x3e, 0x3b, 0x3c, 0x3d, 0x3e,
+			       0x3b, 0x3c, 0x3d, 0x3e, 0x3b, 0x3c, 0x3d, 0x3e },
+	},
+	{
+		.name = "IS_DATA_WR_SNOOP",
+		.offset = IPU8_IS_MMU_M1_OFFSET,
+		.zlx_offset = IPU8_IS_ZLX_M1_OFFSET,
+		.uao_offset = IPU8_IS_UAO_M1_WR_OFFSET,
+		.info_bits = 0x20004f01,
+		.refill = 0x00002322,
+		.collapse_en_bitmap = 0x1,
+		.at_sp_arb_cfg = 0x1,
+		.l1_block = IPU8_IS_MMU_M1_L1_BLOCKNR_REG,
+		.l2_block = IPU8_IS_MMU_M1_L2_BLOCKNR_REG,
+		.nr_l1streams = IPU8_IS_MMU_M1_STREAM_NUM,
+		.nr_l2streams = IPU8_IS_MMU_M1_STREAM_NUM,
+		.l1_block_sz = { 0x00, 0x02, 0x04, 0x06, 0x08, 0x0a, 0x0c, 0x0e,
+				 0x10, 0x12, 0x14, 0x16, 0x18, 0x1a, 0x1c, 0x1e },
+		.l2_block_sz = { 0x00, 0x02, 0x04, 0x06, 0x08, 0x0a, 0x0c, 0x0e,
+				 0x10, 0x12, 0x14, 0x16, 0x18, 0x1a, 0x1c, 0x1e },
+		.zlx_nr = IPU8_IS_ZLX_M1_NUM,
+		.zlx_axi_pool = { 0x00000f20 },
+		.zlx_en = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
+		.zlx_conf = { 0x3, 0x3, 0x3, 0x3, 0x3, 0x3, 0x3, 0x3,
+			      0x3, 0x3, 0x3, 0x3, 0x3, 0x3, 0x3, 0x3 },
+		.uao_p_num = IPU8_IS_UAO_M1_WR_PLANENUM,
+		.uao_p2tlb = { 0x3f, 0x40, 0x41, 0x42, 0x3f, 0x40, 0x41, 0x42,
+			       0x3f, 0x40, 0x41, 0x42, 0x3f, 0x40, 0x41, 0x42 },
+	},
+	{
+		.name = "IS_UPIPE",
+		.offset = IPU8_IS_MMU_UPIPE_OFFSET,
+		.zlx_offset = IPU8_IS_ZLX_UPIPE_OFFSET,
+		.uao_offset = IPU8_IS_UAO_UPIPE_OFFSET,
+		.info_bits = 0x20005201,
+		.refill = 0x00002928,
+		.collapse_en_bitmap = 0x1,
+		.at_sp_arb_cfg = 0x1,
+		.l1_block = IPU8_IS_MMU_UPIPE_L1_BLOCKNR_REG,
+		.l2_block = IPU8_IS_MMU_UPIPE_L2_BLOCKNR_REG,
+		.nr_l1streams = IPU8_IS_MMU_UPIPE_STREAM_NUM,
+		.nr_l2streams = IPU8_IS_MMU_UPIPE_STREAM_NUM,
+		.l1_block_sz = { 0x0, 0x2, 0x4, 0x6, 0x8, 0xa },
+		.l2_block_sz = { 0x0, 0x2, 0x4, 0x6, 0x8, 0xa },
+		.zlx_nr = IPU8_IS_ZLX_UPIPE_NUM,
+		.zlx_axi_pool = { 0x00000f20 },
+		.zlx_en = { 1, 1, 1, 1, 1, 1 },
+		.zlx_conf = { 0x3, 0x3, 0x3, 0x3, 0x3, 0x3 },
+		.uao_p_num = IPU8_IS_UAO_UPIPE_PLANENUM,
+		.uao_p2tlb = { 0x43, 0x44, 0x45, 0x46, 0x47, 0x48 },
+	},
+};
+
 static struct ipu7_mmu_hw ipu7p5_psys_mmu_hwdata[] = {
 	{
 		.name = "PS_FW_RD",
@@ -697,6 +818,22 @@ static const struct ipu7_mmu_hwdata ipu7p5_mmu_hwdata_lookup[IPU_SUBSYS_NUM] = {
 	},
 };
 
+/*
+ * IPU8 has no dedicated psys MMU table upstream (psys pipeline
+ * support is not targeted for this driver); reuse the IPU7P5 psys
+ * table as a placeholder so the psys bus device still initialises.
+ */
+static const struct ipu7_mmu_hwdata ipu8_mmu_hwdata_lookup[IPU_SUBSYS_NUM] = {
+	[IPU_PSYS] = {
+		.hwdata = ipu7p5_psys_mmu_hwdata,
+		.nr_mmus = ARRAY_SIZE(ipu7p5_psys_mmu_hwdata),
+	},
+	[IPU_ISYS] = {
+		.hwdata = ipu8_isys_mmu_hwdata,
+		.nr_mmus = ARRAY_SIZE(ipu8_isys_mmu_hwdata),
+	},
+};
+
 static void __ipu7_tlb_invalidate(struct ipu6_mmu *mmu)
 {
 	struct ipu7_mmu_hw *mmu_hw = mmu->ipu7_mmu_hw;
@@ -824,8 +961,12 @@ static int __ipu7_mmu_init_hw_data(struct ipu6_mmu *mmu, struct device *dev,
 	if (mmu->mmid >= IPU_SUBSYS_NUM)
 		return -EINVAL;
 
-	lookup = IS_IPU7P5(isp) ? ipu7p5_mmu_hwdata_lookup :
-				  ipu7_mmu_hwdata_lookup;
+	if (IS_IPU8(isp))
+		lookup = ipu8_mmu_hwdata_lookup;
+	else if (IS_IPU7P5(isp))
+		lookup = ipu7p5_mmu_hwdata_lookup;
+	else
+		lookup = ipu7_mmu_hwdata_lookup;
 
 	src = lookup[mmu->mmid].hwdata;
 	nr_mmus = lookup[mmu->mmid].nr_mmus;
diff --git a/drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h b/drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h
index ba31ed31b245..5c552f4ae4f6 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h
+++ b/drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h
@@ -213,6 +213,70 @@
 #define IPU7P5_PS_ZLX_FW_RD_NUM			16
 #define IPU7P5_PS_ZLX_FW_WR_NUM			10
 
+/* IPU8 */
+/* IS MMU Cmd RD */
+#define IPU8_IS_MMU_FW_RD_OFFSET		0x270000
+#define IPU8_IS_MMU_FW_RD_STREAM_NUM		3
+#define IPU8_IS_MMU_FW_RD_L1_BLOCKNR_REG	0x54
+#define IPU8_IS_MMU_FW_RD_L2_BLOCKNR_REG	0x60
+
+/* IS MMU Cmd WR */
+#define IPU8_IS_MMU_FW_WR_OFFSET		0x271000
+#define IPU8_IS_MMU_FW_WR_STREAM_NUM		3
+#define IPU8_IS_MMU_FW_WR_L1_BLOCKNR_REG	0x54
+#define IPU8_IS_MMU_FW_WR_L2_BLOCKNR_REG	0x60
+
+/* IS MMU Data WR ISOC */
+#define IPU8_IS_MMU_M0_OFFSET			0x272000
+#define IPU8_IS_MMU_M0_STREAM_NUM		16
+#define IPU8_IS_MMU_M0_L1_BLOCKNR_REG		0x54
+#define IPU8_IS_MMU_M0_L2_BLOCKNR_REG		0x94
+
+/* IS MMU Data WR Snoop */
+#define IPU8_IS_MMU_M1_OFFSET			0x273000
+#define IPU8_IS_MMU_M1_STREAM_NUM		16
+#define IPU8_IS_MMU_M1_L1_BLOCKNR_REG		0x54
+#define IPU8_IS_MMU_M1_L2_BLOCKNR_REG		0x94
+
+/* IS MMU uPipe */
+#define IPU8_IS_MMU_UPIPE_OFFSET		0x274000
+#define IPU8_IS_MMU_UPIPE_STREAM_NUM		6
+#define IPU8_IS_MMU_UPIPE_L1_BLOCKNR_REG	0x54
+#define IPU8_IS_MMU_UPIPE_L2_BLOCKNR_REG	0x6c
+
+/* IS UAO UC RD */
+#define IPU8_IS_UAO_UC_RD_OFFSET		0x27a000
+#define IPU8_IS_UAO_UC_RD_PLANENUM		4
+
+/* IS UAO UC WR */
+#define IPU8_IS_UAO_UC_WR_OFFSET		0x27b000
+#define IPU8_IS_UAO_UC_WR_PLANENUM		4
+
+/* IS UAO M0 WR */
+#define IPU8_IS_UAO_M0_WR_OFFSET		0x27c000
+#define IPU8_IS_UAO_M0_WR_PLANENUM		16
+
+/* IS UAO M1 WR */
+#define IPU8_IS_UAO_M1_WR_OFFSET		0x27d000
+#define IPU8_IS_UAO_M1_WR_PLANENUM		16
+
+/* IS UAO uPipe */
+#define IPU8_IS_UAO_UPIPE_OFFSET		0x27e000
+#define IPU8_IS_UAO_UPIPE_PLANENUM		6
+
+#define IPU8_IS_ZLX_UC_RD_OFFSET		0x275000
+#define IPU8_IS_ZLX_UC_WR_OFFSET		0x276000
+#define IPU8_IS_ZLX_M0_OFFSET			0x277000
+#define IPU8_IS_ZLX_M1_OFFSET			0x278000
+#define IPU8_IS_ZLX_UPIPE_OFFSET		0x279000
+#define IPU8_IS_ZLX_UC_RD_NUM			4
+#define IPU8_IS_ZLX_UC_WR_NUM			4
+#define IPU8_IS_ZLX_M0_NUM			16
+#define IPU8_IS_ZLX_M1_NUM			16
+#define IPU8_IS_ZLX_UPIPE_NUM			6
+
+#define IPU8_IS_MMU_NUM			5U
+
 struct ipu7_mmu_hw {
 	char name[32];
 
-- 
2.43.0

