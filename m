Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713400;
	b=rJylxl/fpdplDiVcxOctFQ3LGnJOVfrTuBXMIA8U5tBtSIOyQBff4PkQ4I5HAqDi8pr/
	 55q6BYnTJ914uOQUpq3t3u6lU8aarV5xNnkWrg4D+WXkzTqeSXEY09lk/fPbp/hyAGfpd
	 +3uZaFoLdnVoq0KBPMVNS56gxwVQUSg79775+7odT5RisL+hrZp9ZnTaS3xYNpLn+g29W
	 qSG9RLYprHPuK1IWHF2LyfOVgg2FwvvNE6cEMDq5Z7l1SHTSiaXMxoDk2W7ePxfITSPyV
	 giFilVJlQBE38pJ2aFOWKGn/L06l5AzA2NHnlXWtgGaSxuPPEjIl4RRdAxKQolLqWbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713400;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=LBZT1lXwPvoeeYPGJrtFBbjl896cFdaiC8MYzzDlx1M=;
	b=4x3lkonA/zoyMZ/I5ChVYrsErVHQUKXbVZIaT8Viv/EukPKwa1dN8Dd3SsIJnfcGg+ml
	 PpOjxkF9PdUNm+Ynn8bY1UbReajbe+AF2jnTBrh5kVy1sf9Umfr/2zdQBbKg2DqysEIMt
	 6eG8eSUslKEn6rRBvitAHyR/o9d6O1BwKWD5vyQUAWKIUC8nnU9XWt2UD3VDGka/lS+ou
	 pjBfT5ajAdezx82Aln6g8omXgvbLH6iZlkN60iePF79X3M3qD2NaV4fUclE2bGwy/6+Qh
	 FBgBidWJoDAWxaSVjlCtsMPp0uGpoJ52cuKyeOfIXUH/g1b0kN+7n/zHwlax+iacubw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kI1BcTT1;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7633B606A33E;
	Tue,  3 Nov 2026 13:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7633B606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kI1BcTT1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793713399; x=1825249399;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J8v0IAgGr9SXVQka7hqpw9c39FB0mh7inFSdj01aDr4=;
  b=kI1BcTT1o9olZg/5YnyrkENV35nEVyPZLsdpyiH8oR8bfTZDYfzPcTPC
   SPiKAaqdXRxaTr206KGZ5XoUR7O7OfNN3/9+Z5rmgIji8/8AZ/1Ca8345
   CLg0QPIk19CzDkswESEYkro0M554/1mH5zPWxAySCz9zCY8fRmM/kwnB7
   PEAGaos/Ru+P4aoasjTp17eWemSP+IufHYL2gPxEewGpw1gIbeBcEpJMx
   8BQm+jmzVgFDDwfnhsEcbcKwr7hQaJDBXAUabHEdy5bKMETEvX6syJdzF
   +heL1xS4s9Tp/Qb3KIuoXy/AxGbDD4x1RysZlQTgInCRR5pyg8h/PcKOv
   A==;
X-CSE-ConnectionGUID: YchADwFtRxWY0SloKp2oqg==
X-CSE-MsgGUID: dnEOTOJ5S/eYFfINI3EEuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2328124"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2328124"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 05:43:19 -0800
X-CSE-ConnectionGUID: qTh6q61HQLCNz8ihy1p1Lg==
X-CSE-MsgGUID: F2eSjGm8SGCCxIbZY/6cug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6428249"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 03 Nov 2026 05:43:17 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: linux-sound@vger.kernel.org
Cc: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 4/7] ASoC: Intel: avs: Pass irq to dsp_interrupt callback
Date: Tue,  3 Nov 2026 14:49:55 +0100
Message-Id: <20261103134958.2089136-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103134958.2089136-1-cezary.rojewski@intel.com>
References: <20261103134958.2089136-1-cezary.rojewski@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Soundwire IRQ thread function requires passing irq as one of the
arguments, as we will want to call it in dsp_interrupt callback, it
needs to be passed throguh.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/apl.c  | 2 +-
 sound/soc/intel/avs/avs.h  | 6 +++---
 sound/soc/intel/avs/cnl.c  | 2 +-
 sound/soc/intel/avs/core.c | 2 +-
 sound/soc/intel/avs/mtl.c  | 2 +-
 sound/soc/intel/avs/skl.c  | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/avs/apl.c b/sound/soc/intel/avs/apl.c
index cf600e1c986e..3abcdf062035 100644
--- a/sound/soc/intel/avs/apl.c
+++ b/sound/soc/intel/avs/apl.c
@@ -17,7 +17,7 @@
 #include "registers.h"
 #include "topology.h"
 
-static irqreturn_t avs_apl_dsp_interrupt(struct avs_dev *adev)
+static irqreturn_t avs_apl_dsp_interrupt(struct avs_dev *adev, int irq)
 {
 	u32 adspis = snd_hdac_adsp_readl(adev, AVS_ADSP_REG_ADSPIS);
 	irqreturn_t ret = IRQ_NONE;
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index b4f9d66d55ad..b3af2c4126be 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -45,7 +45,7 @@ struct avs_dsp_ops {
 	int (* const power)(struct avs_dev *, u32, bool);
 	int (* const reset)(struct avs_dev *, u32, bool);
 	int (* const stall)(struct avs_dev *, u32, bool);
-	irqreturn_t (* const dsp_interrupt)(struct avs_dev *);
+	irqreturn_t (* const dsp_interrupt)(struct avs_dev *, int irq);
 	void (* const int_control)(struct avs_dev *, bool);
 	int (* const load_basefw)(struct avs_dev *, struct firmware *);
 	int (* const load_lib)(struct avs_dev *, struct firmware *, u32);
@@ -273,8 +273,8 @@ int avs_mtl_core_stall(struct avs_dev *adev, u32 core_mask, bool stall);
 int avs_lnl_core_stall(struct avs_dev *adev, u32 core_mask, bool stall);
 void avs_mtl_interrupt_control(struct avs_dev *adev, bool enable);
 void avs_skl_ipc_interrupt(struct avs_dev *adev);
-irqreturn_t avs_cnl_dsp_interrupt(struct avs_dev *adev);
-irqreturn_t avs_mtl_dsp_interrupt(struct avs_dev *adev);
+irqreturn_t avs_cnl_dsp_interrupt(struct avs_dev *adev, int irq);
+irqreturn_t avs_mtl_dsp_interrupt(struct avs_dev *adev, int irq);
 int avs_apl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_period,
 			u32 fifo_full_period, unsigned long resource_mask, u32 *priorities);
 int avs_icl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_period,
diff --git a/sound/soc/intel/avs/cnl.c b/sound/soc/intel/avs/cnl.c
index 5b5359e9128b..31fd9f251d6c 100644
--- a/sound/soc/intel/avs/cnl.c
+++ b/sound/soc/intel/avs/cnl.c
@@ -58,7 +58,7 @@ static void avs_cnl_ipc_interrupt(struct avs_dev *adev)
 			      AVS_ADSP_HIPCCTL_DONE | AVS_ADSP_HIPCCTL_BUSY);
 }
 
-irqreturn_t avs_cnl_dsp_interrupt(struct avs_dev *adev)
+irqreturn_t avs_cnl_dsp_interrupt(struct avs_dev *adev, int irq)
 {
 	u32 adspis = snd_hdac_adsp_readl(adev, AVS_ADSP_REG_ADSPIS);
 	irqreturn_t ret = IRQ_NONE;
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 611ae9f034d4..9413027e1e32 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -344,7 +344,7 @@ static irqreturn_t avs_dsp_irq_thread(int irq, void *dev_id)
 
 	status = readl(bus->ppcap + AZX_REG_PP_PPSTS);
 	if (status & AZX_PPCTL_PIE)
-		avs_dsp_op(adev, dsp_interrupt);
+		avs_dsp_op(adev, dsp_interrupt, irq);
 
 	/* Unmask GIE, masked in irq_handler(). */
 	snd_hdac_chip_updatel(bus, INTCTL, AZX_INT_GLOBAL_EN, AZX_INT_GLOBAL_EN);
diff --git a/sound/soc/intel/avs/mtl.c b/sound/soc/intel/avs/mtl.c
index d8bdd03275d7..29f79d6ff0d4 100644
--- a/sound/soc/intel/avs/mtl.c
+++ b/sound/soc/intel/avs/mtl.c
@@ -166,7 +166,7 @@ static void avs_mtl_ipc_interrupt(struct avs_dev *adev)
 			      AVS_ADSP_HIPCCTL_DONE | AVS_ADSP_HIPCCTL_BUSY);
 }
 
-irqreturn_t avs_mtl_dsp_interrupt(struct avs_dev *adev)
+irqreturn_t avs_mtl_dsp_interrupt(struct avs_dev *adev, int irq)
 {
 	u32 adspis = snd_hdac_adsp_readl(adev, MTL_DWICTL_REG_FINALSTATUSL);
 	irqreturn_t ret = IRQ_NONE;
diff --git a/sound/soc/intel/avs/skl.c b/sound/soc/intel/avs/skl.c
index 8fb86f364ff3..54c883658cca 100644
--- a/sound/soc/intel/avs/skl.c
+++ b/sound/soc/intel/avs/skl.c
@@ -54,7 +54,7 @@ void avs_skl_ipc_interrupt(struct avs_dev *adev)
 			      AVS_ADSP_HIPCCTL_DONE | AVS_ADSP_HIPCCTL_BUSY);
 }
 
-static irqreturn_t avs_skl_dsp_interrupt(struct avs_dev *adev)
+static irqreturn_t avs_skl_dsp_interrupt(struct avs_dev *adev, int irq)
 {
 	u32 adspis = snd_hdac_adsp_readl(adev, AVS_ADSP_REG_ADSPIS);
 	irqreturn_t ret = IRQ_NONE;
-- 
2.34.1

