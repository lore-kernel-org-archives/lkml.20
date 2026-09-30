Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B6C41F7EA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790759151; cv=none; b=cTlii583vSk997igRVa63XT2dTdIkW6VJlKcJkEe6zG5zxxqdyT6z4PIrf8WELZ9XioyARSyJc7YXbkGVH8U2K5fQRXg67APRoFE11VI6dXx86MFoo0UDK5/9QbPztNc2i2GoD1HvYvnl/h1TPb1KVEmRVrB0TWEVfaVsVBm7RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790759151; c=relaxed/simple;
	bh=dD9W8u7CYEygodd6fpryDikPKKPQEt+By4TdaeflOrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eXC6DtvMaBqZMKhLXjZFIsSixa8U4dK+0pRP8/LL//YOS02tbBT+6n4nUkUOd6HT7BAgTDSgrhQvFlpwWNR2uqnpcEl4WEnSD1WH9FAhhnpeMJWLUUHwhvTjFhbFnk6NBDxwy1g2QTQnocgasocnUjI0PiUKqa4eYjuqQmxVIUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KLkWSpqp; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KLkWSpqp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790759150; x=1822295150;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dD9W8u7CYEygodd6fpryDikPKKPQEt+By4TdaeflOrc=;
  b=KLkWSpqpF/Tr2gPypJxKO30uVOsPaJMKaqZQscVfg/Nmka8JaTO+zoQO
   0KHDVYopUbQD+mPC6XxYQ5ZE2nfLavb+oR4XvLqs2U4mip9cq1xWjBZf9
   BBRvTr2uF0tS34pgo7k4D6u2fja6eIMNi95mk5FtxEV/ZEJSdfi+0Bz5R
   qXIo5yuh1UjMmz9N9ysCCC/sH29hmE4ctIR9Qg9ray1Cvqn1IG5D+F0I9
   Sg2sXG970bo0KCxmfHTKagPnbbfFveiGrxn9/hlv/pULprrcuPRGg6JNo
   D8/QSPw2WNNzyLj33hDHVd/sFRoYeoxXIFp9osEJbbsPNywvwabbSTbrQ
   w==;
X-CSE-ConnectionGUID: ECaTPS7FQrOdkxV41TTnTw==
X-CSE-MsgGUID: DlOAJm34Th21j3IsTvL1+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90621911"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90621911"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 02:05:49 -0700
X-CSE-ConnectionGUID: Seg1oUiPSIqkxbgDkDXaCw==
X-CSE-MsgGUID: TjX5BM4XSzGr4TUms+ecag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="275188929"
Received: from vtg-bdc-vm10.iil.intel.com ([143.185.124.149])
  by fmviesa007.fm.intel.com with ESMTP; 30 Sep 2026 02:05:48 -0700
From: Divyamani Tripathi <divyamani.tripathi@intel.com>
To: linux-kernel@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	antti.laakso@linux.intel.com,
	sarang.sapre@intel.com,
	manik.bajpai@intel.com,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH 6/7] media: ipu6: add IPU8 psys MMU table and PLL power sequencing
Date: Wed, 30 Sep 2026 12:01:47 +0300
Message-ID: <20260930090148.3980652-7-divyamani.tripathi@intel.com>
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

Port the remaining IPU8 psys platform enablement that already exists
upstream in staging ipu7: the psys MMU hardware table and PLL
request/release in the shared power-on/off path. This driver has no
psys pipeline consumer, so it only affects the psys bus device's power
sequencing and MMU setup.

Signed-off-by: Divyamani Tripathi <divyamani.tripathi@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-buttress.c  |  17 +++
 .../intel/ipu6/ipu6-platform-buttress-regs.h  |   4 +
 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c    | 131 +++++++++++++++++-
 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h    |  51 +++++++
 4 files changed, 196 insertions(+), 7 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
index be07d33a4dab..00d504647c29 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -512,6 +512,17 @@ static int __ipu7_power_on(struct device *dev,
 		ipu7_nde_control(isp, true);
 	}
 
+	/* IPU8 psys needs its PLL running above 400MHz. */
+	if (!is_isys && IS_IPU8(isp) && ctrl->ratio > IPU8_PS_FREQ_CTL_DEFAULT_RATIO) {
+		writel(1, isp->base + IPU7_BUTTRESS_REG_PS_PLL_ENABLE);
+		ret = readl_poll_timeout(isp->base + IPU7_BUTTRESS_REG_SLEEP_LEVEL_STS,
+					 val, (val & IPU7_BUTTRESS_OWN_ACK_PS_CLK),
+					 100, BUTTRESS_POWER_TIMEOUT_US);
+		if (ret)
+			dev_warn(&isp->pdev->dev,
+				 "ps_pll req ack timeout: 0x%x\n", val);
+	}
+
 	/* Request clock ownership. */
 	ovrd_clk = is_isys ? IPU7_BUTTRESS_OVERRIDE_IS_CLK :
 			     IPU7_BUTTRESS_OVERRIDE_PS_CLK;
@@ -569,6 +580,12 @@ static int __ipu7_power_off(struct device *dev,
 		ipu7_nde_control(isp, false);
 	}
 
+	if (ctrl->subsys_id == IPU_PSYS && IS_IPU8(isp)) {
+		val = readl(isp->base + IPU7_BUTTRESS_REG_SLEEP_LEVEL_STS);
+		if (val & IPU7_BUTTRESS_OWN_ACK_PS_CLK)
+			writel(0, isp->base + IPU7_BUTTRESS_REG_PS_PLL_ENABLE);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h b/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
index a1e00965ac4a..04d196c49c60 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
@@ -282,6 +282,9 @@ enum {
 #define IPU7_BUTTRESS_IS_FREQ_CTL_RATIO_MASK	GENMASK(7, 0)
 #define IPU7_IS_FREQ_CTL_DEFAULT_RATIO		0x1b
 #define IPU7_PS_FREQ_CTL_DEFAULT_RATIO		0x14
+/* IS: 400MHz, PS: 400MHz */
+#define IPU8_IS_FREQ_CTL_DEFAULT_RATIO		0x10
+#define IPU8_PS_FREQ_CTL_DEFAULT_RATIO		0x10
 
 /* D2D power control */
 #define IPU7_BUTTRESS_REG_D2D_CTL		0x21d4
@@ -320,6 +323,7 @@ enum {
 #define IPU7_BUTTRESS_OWN_ACK_IS_CLK		BIT(9)
 #define IPU7_BUTTRESS_OVERRIDE_PS_CLK		BIT(2)
 #define IPU7_BUTTRESS_OWN_ACK_PS_CLK		BIT(10)
+#define IPU7_BUTTRESS_REG_PS_PLL_ENABLE		0x21bc
 
 /* PB registers */
 #define IPU7_GLOBAL_INTERRUPT_MASK		0x8
diff --git a/drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c b/drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c
index fecaff5ce032..d991f4d29e36 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c
+++ b/drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c
@@ -538,6 +538,128 @@ static struct ipu7_mmu_hw ipu7p5_isys_mmu_hwdata[] = {
 	},
 };
 
+static struct ipu7_mmu_hw ipu8_psys_mmu_hwdata[] = {
+	{
+		.name = "PS_FW_RD",
+		.offset = IPU8_PS_MMU_FW_RD_OFFSET,
+		.zlx_offset = IPU8_PS_ZLX_FW_RD_OFFSET,
+		.uao_offset = IPU8_PS_UAO_FW_RD_OFFSET,
+		.info_bits = 0x20003a01,
+		.refill = 0x00002726,
+		.collapse_en_bitmap = 0x1,
+		.at_sp_arb_cfg = 0x1,
+		.l1_block = IPU8_PS_MMU_FW_RD_L1_BLOCKNR_REG,
+		.l2_block = IPU8_PS_MMU_FW_RD_L2_BLOCKNR_REG,
+		.nr_l1streams = IPU8_PS_MMU_FW_RD_STREAM_NUM,
+		.nr_l2streams = IPU8_PS_MMU_FW_RD_STREAM_NUM,
+		.l1_block_sz = { 0x00, 0x08, 0x0a, 0x0e, 0x10, 0x12, 0x14, 0x16,
+				 0x18, 0x18, 0x18, 0x18 },
+		.l2_block_sz = { 0x00, 0x02, 0x04, 0x06, 0x08, 0x0a, 0x0c, 0x0e,
+				 0x10, 0x12, 0x14, 0x16 },
+		.zlx_nr = IPU8_PS_ZLX_FW_RD_NUM,
+		.zlx_axi_pool = { 0x00000f30 },
+		.zlx_en = { 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0 },
+		.zlx_conf = { 0x0, 0x2, 0x0, 0x0, 0x2, 0x2, 0x0, 0x0,
+			      0x0, 0x0, 0x0, 0x0 },
+		.uao_p_num = IPU8_PS_UAO_FW_RD_PLANENUM,
+		.uao_p2tlb = { 0x2d, 0x32, 0x33, 0x30, 0x34, 0x35, 0x36, 0x31,
+			       0x0, 0x0, 0x0, 0x0 },
+	},
+	{
+		.name = "PS_FW_WR",
+		.offset = IPU8_PS_MMU_FW_WR_OFFSET,
+		.zlx_offset = IPU8_PS_ZLX_FW_WR_OFFSET,
+		.uao_offset = IPU8_PS_UAO_FW_WR_OFFSET,
+		.info_bits = 0x20003901,
+		.refill = 0x00002524,
+		.collapse_en_bitmap = 0x1,
+		.at_sp_arb_cfg = 0x1,
+		.l1_block = IPU8_PS_MMU_FW_WR_L1_BLOCKNR_REG,
+		.l2_block = IPU8_PS_MMU_FW_WR_L2_BLOCKNR_REG,
+		.nr_l1streams = IPU8_PS_MMU_FW_WR_STREAM_NUM,
+		.nr_l2streams = IPU8_PS_MMU_FW_WR_STREAM_NUM,
+		.l1_block_sz = { 0x00, 0x08, 0x0a, 0x0c, 0x0e, 0x10, 0x10, 0x10 },
+		.l2_block_sz = { 0x00, 0x02, 0x04, 0x06, 0x08, 0x0a, 0x0c, 0x0e },
+		.zlx_nr = IPU8_PS_ZLX_FW_WR_NUM,
+		.zlx_axi_pool = { 0x00000f20 },
+		.zlx_en = { 0, 1, 1, 0, 0, 0, 0, 0 },
+		.zlx_conf = { 0x0, 0x2, 0x2, 0x0, 0x0, 0x0, 0x0, 0x0 },
+		.uao_p_num = IPU8_PS_UAO_FW_WR_PLANENUM,
+		.uao_p2tlb = { 0x2d, 0x2e, 0x2f, 0x30, 0x31, 0x0, 0x0, 0x0 },
+	},
+	{
+		.name = "PS_DATA_RD",
+		.offset = IPU8_PS_MMU_SRT_RD_OFFSET,
+		.zlx_offset = IPU8_PS_ZLX_DATA_RD_OFFSET,
+		.uao_offset = IPU8_PS_UAO_SRT_RD_OFFSET,
+		.info_bits = 0x20003801,
+		.refill = 0x00002322,
+		.collapse_en_bitmap = 0x1,
+		.at_sp_arb_cfg = 0x1,
+		.l1_block = IPU8_PS_MMU_SRT_RD_L1_BLOCKNR_REG,
+		.l2_block = IPU8_PS_MMU_SRT_RD_L2_BLOCKNR_REG,
+		.nr_l1streams = IPU8_PS_MMU_SRT_RD_STREAM_NUM,
+		.nr_l2streams = IPU8_PS_MMU_SRT_RD_STREAM_NUM,
+		.l1_block_sz = { 0x00, 0x04, 0x06, 0x08, 0x0c, 0x0e, 0x10, 0x14,
+				 0x18, 0x1c, 0x1e, 0x22, 0x24, 0x26, 0x28, 0x2a,
+				 0x2c, 0x2e, 0x30, 0x32, 0x36, 0x3a, 0x3c, 0x3c,
+				 0x3c, 0x3c },
+		.l2_block_sz = { 0x00, 0x02, 0x04, 0x06, 0x08, 0x0a, 0x0c, 0x0e,
+				 0x10, 0x12, 0x14, 0x16, 0x18, 0x1a, 0x1c, 0x1e,
+				 0x20, 0x22, 0x24, 0x26, 0x28, 0x2a, 0x2c, 0x2e,
+				 0x30, 0x32 },
+		.zlx_nr = IPU8_PS_ZLX_DATA_RD_NUM,
+		.zlx_axi_pool = { 0x00000f30 },
+		.zlx_en = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+			    1, 1, 1, 1, 1, 1, 0, 0, 0, 0 },
+		.zlx_conf = { 0x6, 0x3, 0x3, 0x6, 0x2, 0x2, 0x6, 0x6,
+			      0x6, 0x3, 0x6, 0x3, 0x3, 0x2, 0x2, 0x2,
+			      0x2, 0x2, 0x2, 0x6, 0x6, 0x3, 0x0, 0x0,
+			      0x0, 0x0 },
+		.uao_p_num = IPU8_PS_UAO_SRT_RD_PLANENUM,
+		.uao_p2tlb = { 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e,
+			       0x1f, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26,
+			       0x27, 0x28, 0x29, 0x2a, 0x2b, 0x2c, 0x0, 0x0,
+			       0x0, 0x0 },
+	},
+	{
+		.name = "PS_DATA_WR",
+		.offset = IPU8_PS_MMU_SRT_WR_OFFSET,
+		.zlx_offset = IPU8_PS_ZLX_DATA_WR_OFFSET,
+		.uao_offset = IPU8_PS_UAO_SRT_WR_OFFSET,
+		.info_bits = 0x20003701,
+		.refill = 0x00002120,
+		.collapse_en_bitmap = 0x1,
+		.at_sp_arb_cfg = 0x1,
+		.l1_block = IPU8_PS_MMU_SRT_WR_L1_BLOCKNR_REG,
+		.l2_block = IPU8_PS_MMU_SRT_WR_L2_BLOCKNR_REG,
+		.nr_l1streams = IPU8_PS_MMU_SRT_WR_STREAM_NUM,
+		.nr_l2streams = IPU8_PS_MMU_SRT_WR_STREAM_NUM,
+		.l1_block_sz = { 0x00, 0x02, 0x06, 0x08, 0x0a, 0x0c, 0x0e, 0x10,
+				 0x12, 0x14, 0x16, 0x18, 0x1c, 0x1e, 0x22, 0x24,
+				 0x28, 0x2a, 0x2e, 0x30, 0x32, 0x36, 0x38, 0x3a,
+				 0x3a, 0x3a },
+		.l2_block_sz = { 0x00, 0x02, 0x04, 0x06, 0x08, 0x0a, 0x0c, 0x0e,
+				 0x10, 0x12, 0x14, 0x16, 0x18, 0x1a, 0x1c, 0x1e,
+				 0x20, 0x22, 0x24, 0x26, 0x28, 0x2a, 0x2c, 0x2e,
+				 0x30, 0x32 },
+		.zlx_nr = IPU8_PS_ZLX_DATA_WR_NUM,
+		.zlx_axi_pool = { 0x00000f50 },
+		.zlx_en = { 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+			    1, 1, 1, 1, 1, 1, 1, 0, 0, 0 },
+		.zlx_conf = { 0x3, 0x6, 0x38000002, 0x38000000, 0x3, 0x38000002,
+			      0x38000002, 0x38000002, 0x38000002, 0x38000002,
+			      0x38000002, 0x6, 0x3, 0x6, 0x3, 0x6,
+			      0x3, 0x6, 0x3, 0x3, 0x6, 0x3, 0x3, 0x0,
+			      0x0, 0x0 },
+		.uao_p_num = IPU8_PS_UAO_SRT_WR_PLANENUM,
+		.uao_p2tlb = { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
+			       0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
+			       0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x00,
+			       0x00, 0x00 },
+	},
+};
+
 static struct ipu7_mmu_hw ipu8_isys_mmu_hwdata[] = {
 	{
 		.name = "IS_FW_RD",
@@ -818,15 +940,10 @@ static const struct ipu7_mmu_hwdata ipu7p5_mmu_hwdata_lookup[IPU_SUBSYS_NUM] = {
 	},
 };
 
-/*
- * IPU8 has no dedicated psys MMU table upstream (psys pipeline
- * support is not targeted for this driver); reuse the IPU7P5 psys
- * table as a placeholder so the psys bus device still initialises.
- */
 static const struct ipu7_mmu_hwdata ipu8_mmu_hwdata_lookup[IPU_SUBSYS_NUM] = {
 	[IPU_PSYS] = {
-		.hwdata = ipu7p5_psys_mmu_hwdata,
-		.nr_mmus = ARRAY_SIZE(ipu7p5_psys_mmu_hwdata),
+		.hwdata = ipu8_psys_mmu_hwdata,
+		.nr_mmus = ARRAY_SIZE(ipu8_psys_mmu_hwdata),
 	},
 	[IPU_ISYS] = {
 		.hwdata = ipu8_isys_mmu_hwdata,
diff --git a/drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h b/drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h
index 5c552f4ae4f6..0d3fd7ddea64 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h
+++ b/drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h
@@ -277,6 +277,57 @@
 
 #define IPU8_IS_MMU_NUM			5U
 
+/* PS MMU FW RD */
+#define IPU8_PS_MMU_FW_RD_OFFSET		0x148000
+#define IPU8_PS_MMU_FW_RD_STREAM_NUM		12
+#define IPU8_PS_MMU_FW_RD_L1_BLOCKNR_REG	0x54
+#define IPU8_PS_MMU_FW_RD_L2_BLOCKNR_REG	0x84
+
+/* PS MMU FW WR */
+#define IPU8_PS_MMU_FW_WR_OFFSET		0x149000
+#define IPU8_PS_MMU_FW_WR_STREAM_NUM		8
+#define IPU8_PS_MMU_FW_WR_L1_BLOCKNR_REG	0x54
+#define IPU8_PS_MMU_FW_WR_L2_BLOCKNR_REG	0x74
+
+/* PS MMU FW Data RD VC0 */
+#define IPU8_PS_MMU_SRT_RD_OFFSET		0x14a000
+#define IPU8_PS_MMU_SRT_RD_STREAM_NUM		26
+#define IPU8_PS_MMU_SRT_RD_L1_BLOCKNR_REG	0x54
+#define IPU8_PS_MMU_SRT_RD_L2_BLOCKNR_REG	0xbc
+
+/* PS MMU FW Data WR VC0 */
+#define IPU8_PS_MMU_SRT_WR_OFFSET		0x14b000
+#define IPU8_PS_MMU_SRT_WR_STREAM_NUM		26
+#define IPU8_PS_MMU_SRT_WR_L1_BLOCKNR_REG	0x54
+#define IPU8_PS_MMU_SRT_WR_L2_BLOCKNR_REG	0xbc
+
+/* PS UAO FW RD */
+#define IPU8_PS_UAO_FW_RD_OFFSET		0x156000
+#define IPU8_PS_UAO_FW_RD_PLANENUM		12
+
+/* PS UAO FW WR */
+#define IPU8_PS_UAO_FW_WR_OFFSET		0x157000
+#define IPU8_PS_UAO_FW_WR_PLANENUM		8
+
+/* PS UAO SRT RD */
+#define IPU8_PS_UAO_SRT_RD_OFFSET		0x154000
+#define IPU8_PS_UAO_SRT_RD_PLANENUM		26
+
+/* PS UAO SRT WR */
+#define IPU8_PS_UAO_SRT_WR_OFFSET		0x155000
+#define IPU8_PS_UAO_SRT_WR_PLANENUM		26
+
+#define IPU8_PS_ZLX_DATA_RD_OFFSET		0x14e000
+#define IPU8_PS_ZLX_DATA_WR_OFFSET		0x14f000
+#define IPU8_PS_ZLX_FW_RD_OFFSET		0x150000
+#define IPU8_PS_ZLX_FW_WR_OFFSET		0x151000
+#define IPU8_PS_ZLX_DATA_RD_NUM			26
+#define IPU8_PS_ZLX_DATA_WR_NUM			26
+#define IPU8_PS_ZLX_FW_RD_NUM			12
+#define IPU8_PS_ZLX_FW_WR_NUM			8
+
+#define IPU8_PS_MMU_NUM			4U
+
 struct ipu7_mmu_hw {
 	char name[32];
 
-- 
2.43.0

