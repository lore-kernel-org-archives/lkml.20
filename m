Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560503BFE2A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790759161; cv=none; b=U4xJOXfwhMepTtlA5PsC1RpYyYEhZ4dGfj7GeKFjDMkqTQtLgcA766lAU+Mg/7w6rm9ixOEBdwSXElCyVFi2D37Qv46PZSd6qtjl8354j+NAagUOlvFZgbM5/xxfnTKXWPaag1wwUXTrlCbTh5XtWtsv5XSflUCoE2lo2cwHMNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790759161; c=relaxed/simple;
	bh=RZg7++6hKGXyVEMgA11t+6CfAl3fVKEKnaQBXfdqhUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Shid4vUwWDNhnMRsI1qU2wl1E/2qFZDL2qgRjerqowcTIfgOOULFqp3wEmtT70haFpRPEtDGtxCzbAuCdEKZTEmF4gWd7sGMDN6DlD122taBTV6a4Ag/h4rTXSzUNLJ5dCjjqeXOFWQxuuXug8xsmX5R/NF7Ev//LwR8L4A71+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AUiQoFNJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AUiQoFNJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790759160; x=1822295160;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RZg7++6hKGXyVEMgA11t+6CfAl3fVKEKnaQBXfdqhUY=;
  b=AUiQoFNJkxs6qv6JpbXAuI5KwwKBZGCXKFe0OpMeYWQl6EXjgBNqx8tX
   RDgpTIU7uUVeXQjEj2XJYT4818XVjegUdBQhvIrwAXYMYpn9HK/2KrLur
   C+k5ClJldxsgfCWWDLj6zbUulwrYibaS9dyBhFIRLcHP3lp8FGviGInmv
   osTSMrxb03Lgbgzf2vy0ZvmKog7w/tHlQeA9OG6mWUfyRPdJnzo3RxvUN
   KeYahdV8Lr8NZtED8vAhoeEqcUzBOyFrnqU/DiiaHjfYZ1mO4Iu50y57H
   Do3+tq9C5TjylZwUnlpGdAb4jmqms87pLroyAXjD4LyWdmhCjdD2LSPVP
   A==;
X-CSE-ConnectionGUID: 2G+cNEb2S82MKZe5euqMPg==
X-CSE-MsgGUID: oY6w4kfGQkukg9NypxX2tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90621923"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90621923"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 02:05:59 -0700
X-CSE-ConnectionGUID: 65dMLntITdy3XVgRdWuLHA==
X-CSE-MsgGUID: wtvykDMXRlSskntjW+F72g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="275188967"
Received: from vtg-bdc-vm10.iil.intel.com ([143.185.124.149])
  by fmviesa007.fm.intel.com with ESMTP; 30 Sep 2026 02:05:58 -0700
From: Divyamani Tripathi <divyamani.tripathi@intel.com>
To: linux-kernel@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	antti.laakso@linux.intel.com,
	sarang.sapre@intel.com,
	manik.bajpai@intel.com,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH 7/7] media: ipu6: add PCI ID for IPU8
Date: Wed, 30 Sep 2026 12:01:48 +0300
Message-ID: <20260930090148.3980652-8-divyamani.tripathi@intel.com>
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

Add the IPU8 PCI ID and probe wiring. IPU8 reuses the IPU7P5 buttress
register map (unvalidated against IPU8's hardware spec) but needs its
own default control ratio (0x10), so add dedicated
ipu8_{isys,psys}_buttress_ctrl structs instead of reusing IPU7's.

Signed-off-by: Divyamani Tripathi <divyamani.tripathi@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6.c | 40 ++++++++++++++++++++++++++++-
 include/media/ipu6-pci-table.h      |  2 ++
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index acc492f5cc11..17e659230149 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -140,6 +140,28 @@ static const struct ipu6_buttress_ctrl ipu7_psys_buttress_ctrl = {
 	.pwr_sts_off = IPU6_BUTTRESS_PWR_STATE_DN_DONE,
 };
 
+static const struct ipu6_buttress_ctrl ipu8_isys_buttress_ctrl = {
+	.subsys_id = IPU_ISYS,
+	.ratio = IPU8_IS_FREQ_CTL_DEFAULT_RATIO,
+	.qos_floor = 0,
+	.freq_ctl = IPU7_BUTTRESS_REG_IS_WORKPOINT_REQ,
+	.pwr_sts_shift = IPU7_BUTTRESS_PWR_STATE_IS_PWR_SHIFT,
+	.pwr_sts_mask = IPU7_BUTTRESS_PWR_STATE_IS_PWR_MASK,
+	.pwr_sts_on = IPU6_BUTTRESS_PWR_STATE_UP_DONE,
+	.pwr_sts_off = IPU6_BUTTRESS_PWR_STATE_DN_DONE,
+};
+
+static const struct ipu6_buttress_ctrl ipu8_psys_buttress_ctrl = {
+	.subsys_id = IPU_PSYS,
+	.ratio = IPU8_PS_FREQ_CTL_DEFAULT_RATIO,
+	.qos_floor = 0,
+	.freq_ctl = IPU7_BUTTRESS_REG_PS_WORKPOINT_REQ,
+	.pwr_sts_shift = IPU7_BUTTRESS_PWR_STATE_PS_PWR_SHIFT,
+	.pwr_sts_mask = IPU7_BUTTRESS_PWR_STATE_PS_PWR_MASK,
+	.pwr_sts_on = IPU6_BUTTRESS_PWR_STATE_UP_DONE,
+	.pwr_sts_off = IPU6_BUTTRESS_PWR_STATE_DN_DONE,
+};
+
 static const struct ipu6_buttress_registers ipu6_buttress_regs = {
 	/* Registers */
 	.irq_status	= BUTTRESS_REG_ISR_STATUS,
@@ -624,7 +646,8 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	int ret;
 
 	if ((id->device == PCI_DEVICE_ID_INTEL_IPU7 ||
-	     id->device == PCI_DEVICE_ID_INTEL_IPU7P5) && force_no_probe_ipu7)
+	     id->device == PCI_DEVICE_ID_INTEL_IPU7P5 ||
+	     id->device == PCI_DEVICE_ID_INTEL_IPU8) && force_no_probe_ipu7)
 		return -ENODEV;
 
 	isp = devm_kzalloc(dev, sizeof(*isp), GFP_KERNEL);
@@ -677,6 +700,21 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		isys_ctrl = &ipu7_isys_buttress_ctrl;
 		psys_ctrl = &ipu7_psys_buttress_ctrl;
 		break;
+	case PCI_DEVICE_ID_INTEL_IPU8:
+		/*
+		 * IPU8 reuses the IPU7P5 buttress register map,
+		 * matching staging ipu7 (no dedicated ipu8_buttress_regs
+		 * there either). isys/psys control ratios use IPU8's own
+		 * 0x10 default, unlike IPU7/IPU7P5.
+		 * TODO: confirm buttress register map against IPU8 hw spec.
+		 */
+		isp->hw_ver = IPU_VERSION_8;
+		isp->cpd_fw_name = IPU8_FIRMWARE_NAME;
+		isp->model_name = IPU8_MEDIA_DEV_MODEL_NAME;
+		isp->buttress.regs = &ipu7p5_buttress_regs;
+		isys_ctrl = &ipu8_isys_buttress_ctrl;
+		psys_ctrl = &ipu8_psys_buttress_ctrl;
+		break;
 	default:
 		return dev_err_probe(dev, -ENODEV,
 				     "Unsupported IPU6 device %x\n",
diff --git a/include/media/ipu6-pci-table.h b/include/media/ipu6-pci-table.h
index cacb8a3170d0..4c7e724ea15e 100644
--- a/include/media/ipu6-pci-table.h
+++ b/include/media/ipu6-pci-table.h
@@ -16,6 +16,7 @@
 #define PCI_DEVICE_ID_INTEL_IPU6EP_MTL		0x7d19
 #define PCI_DEVICE_ID_INTEL_IPU7		0x645d
 #define PCI_DEVICE_ID_INTEL_IPU7P5		0xb05d
+#define PCI_DEVICE_ID_INTEL_IPU8		0xd719
 
 static const struct pci_device_id ipu6_pci_tbl[] = {
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6) },
@@ -26,6 +27,7 @@ static const struct pci_device_id ipu6_pci_tbl[] = {
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_MTL) },
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7) },
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7P5) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU8) },
 	{ }
 };
 
-- 
2.43.0

