Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C97835E94E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790759115; cv=none; b=Rgj9na3XZv1m5rrBvzIWb3V9DK1EOgFC49hZvk5a1ZrT1xXyt3T+1Q10xD7OT2dolRarUCuevlSqkAC1E5PSPV3fT6hNo9qpbR128DoBk8byWgRyGigGrzFo4yxp2jp7eQ/2MIg2C1p/hS2dhLBVwDr0iS/kme1lQw53m7OvYNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790759115; c=relaxed/simple;
	bh=bawWlWt1fb9XSFon1jMCjVm0oddf4NIgXp/Mo/sSZ3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d1VDpiloQ/lBv31vZKFwUPFlyydJeQGEHKe4mYODer/aQXDMZSWtCW32TfxTCFJGQhfXdZmDLy3i9u9wBCZqQ5OZ5e/0o3hmmzy41uLbZHmK6uXh8iXL2786goahwPGKc631pMhJ/OR9Sw7P6QAaD4qWOvEYmVLI1SZDOM/QJBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gnSrk7GF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gnSrk7GF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790759113; x=1822295113;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bawWlWt1fb9XSFon1jMCjVm0oddf4NIgXp/Mo/sSZ3Q=;
  b=gnSrk7GF4hFasQiY8e0MlzfBpCzILG2y/QmKcK2yTZZgZs8eMtxdr+Nf
   MMbmRVNdeqEh+66AFO6x+uDyEYj+vKb5eMYvesMrcHWcYKIO9O9GFqwUt
   T6HTKzzEd64XqAw7rdvoUBSc6p5497/KTzit8Jj64Rgrfr4IwREtVNhNI
   SK5wz29aFTkIiOoNFFkUY3HJGjBN8bRcWnHc4V20/FSWVGkVz6sFR/Onn
   NEly77TOiO0ikVzRigkKO88/ckPLqDGTMAjwqVhjXyq0uOgMyRVth2V2D
   0DFaZyMSbUO2zzbhraPLrXjlRt1mrL6+hd7ksxDZwEwSc8BwImh2uivF2
   Q==;
X-CSE-ConnectionGUID: qqVHTlayTjSI2C7sphyLEg==
X-CSE-MsgGUID: P/tjSVQ0TKiGKSdixSEK0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90621883"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90621883"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 02:05:13 -0700
X-CSE-ConnectionGUID: mCJ8vqZdRbe5D1/dsyMEiA==
X-CSE-MsgGUID: Oa3BoPvITwC9tGQXsLQGZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="275188790"
Received: from vtg-bdc-vm10.iil.intel.com ([143.185.124.149])
  by fmviesa007.fm.intel.com with ESMTP; 30 Sep 2026 02:05:11 -0700
From: Divyamani Tripathi <divyamani.tripathi@intel.com>
To: linux-kernel@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	antti.laakso@linux.intel.com,
	sarang.sapre@intel.com,
	manik.bajpai@intel.com,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH 4/7] media: ipu6: make ipu7 gpreg stride configurable as per IPU version
Date: Wed, 30 Sep 2026 12:01:45 +0300
Message-ID: <20260930090148.3980652-5-divyamani.tripathi@intel.com>
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

IPU8's GPREG stride is 0x2000, not IPU7's hardcoded 0x1000. Add
csi2.gpreg_stride and use it in the two gpreg accessors instead of the
fixed value, wiring it up for both IPU7 and IPU8 in
ipu6_internal_pdata_init().

Signed-off-by: Divyamani Tripathi <divyamani.tripathi@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6.c                | 7 ++++++-
 drivers/media/pci/intel/ipu6/ipu6.h                | 1 +
 drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.c   | 6 ++++--
 drivers/media/pci/intel/ipu6/ipu7-isys-csi2-regs.h | 2 ++
 4 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 43d951735f72..2ed2a41ac96f 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -371,8 +371,13 @@ static void ipu6_internal_pdata_init(struct ipu6_device *isp)
 		psys_ipdata.hw_variant.spc_offset = IPU6SE_PSYS_SPC_OFFSET;
 	}
 
-	if (IS_IPU7(isp)) {
+	if (IS_IPU8(isp)) {
+		isys_ipdata.csi2.gpreg = IPU8_IS_IO_CSI2_GPREGS_BASE;
+		isys_ipdata.csi2.gpreg_stride = IPU8_IS_IO_CSI2_GPREGS_STRIDE;
+		isys_ipdata.csi2.nports = 4;
+	} else if (IS_IPU7(isp)) {
 		isys_ipdata.csi2.gpreg = IPU7_IS_IO_CSI2_GPREGS_BASE;
+		isys_ipdata.csi2.gpreg_stride = IPU7_IS_IO_CSI2_GPREGS_STRIDE;
 		isys_ipdata.csi2.nports = 4;
 	}
 }
diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/ipu6/ipu6.h
index 20ffbb4a9934..00fb78a1ec1d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -147,6 +147,7 @@ struct ipu6_isys_internal_csi2_pdata {
 	u32 fw_access_port_ofs;
 	/* IPU7-specific field */
 	u32 gpreg;
+	u32 gpreg_stride;
 };
 
 struct ipu6_isys_internal_tpg_pdata {
diff --git a/drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.c b/drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.c
index 10273c687faa..ac4f94764407 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.c
+++ b/drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.c
@@ -167,7 +167,8 @@ static void gpreg_write(struct ipu6_isys *isys, u32 id, u32 addr, u32 data)
 {
 	void __iomem *isys_base = isys->pdata->base;
 	u32 gpreg = isys->pdata->ipdata->csi2.gpreg;
-	void __iomem *base = isys_base + gpreg + 0x1000 * id;
+	void __iomem *base = isys_base + gpreg +
+				     isys->pdata->ipdata->csi2.gpreg_stride * id;
 	struct device *dev = &isys->adev->auxdev.dev;
 
 	dev_dbg(dev, "gpreg write: reg 0x%lx = data 0x%08x",
@@ -344,7 +345,8 @@ static int ipu7_isys_phy_ready(struct ipu6_isys *isys, u32 id)
 {
 	void __iomem *isys_base = isys->pdata->base;
 	u32 gpreg_offset = isys->pdata->ipdata->csi2.gpreg;
-	void __iomem *gpreg = isys_base + gpreg_offset + 0x1000 * id;
+	void __iomem *gpreg = isys_base + gpreg_offset +
+				      isys->pdata->ipdata->csi2.gpreg_stride * id;
 	struct device *dev = &isys->adev->auxdev.dev;
 	u32 phy_ready;
 	u32 reg, rext;
diff --git a/drivers/media/pci/intel/ipu6/ipu7-isys-csi2-regs.h b/drivers/media/pci/intel/ipu6/ipu7-isys-csi2-regs.h
index 3859401d4802..4f7f33b9d661 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-isys-csi2-regs.h
+++ b/drivers/media/pci/intel/ipu6/ipu7-isys-csi2-regs.h
@@ -968,7 +968,9 @@
 
 /* software config the phy */
 #define IPU7_IS_IO_CSI2_GPREGS_BASE		(IPU7_IS_IO_BASE + 0x53400)
+#define IPU7_IS_IO_CSI2_GPREGS_STRIDE		0x1000
 #define IPU8_IS_IO_CSI2_GPREGS_BASE		(IPU7_IS_IO_BASE + 0x40e00)
+#define IPU8_IS_IO_CSI2_GPREGS_STRIDE		0x2000
 #define IPU7_CSI_ADAPT_LAYER_SRST		0x0
 #define IPU7_MPF_SRST_RST			0x4
 #define IPU7_CSI_ERR_IRQ_CTRL_SRST		0x8
-- 
2.43.0

