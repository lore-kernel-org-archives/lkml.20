Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966931;
	b=sEsKBnydbxXz+hyaEOuZk5zvvNctLuWJOvmxptDHfh7xAzuukySTwWhWmgLiw4NOTfkx
	 wAOJ6DbR1874GsKNqkeBry+DLvStRz9Ek9BhzIw7BY0141fHeZD3BqCVbEAT6g+wkTTpJ
	 2eXW3xXqEOUkyzli03ABkAaMproccJbvygKqrMq6Nsk3ixHZeXRscgPHZOAuy/FWHTfdG
	 CcAlEsUPQvAOsyelWRwqxD6B9Vxh2UCnqVXYV4JlRjbg92aMZ9c1jcppKYmWQ15dhJpBy
	 pkkyCLDO1siHbpeY55Hqs4TObG2e2uIxiY+58/re4O095/TfNyTVam6gP6D8xd/IylQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966931;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=LBZT1lXwPvoeeYPGJrtFBbjl896cFdaiC8MYzzDlx1M=;
	b=ru4/nOnPL1txCf1L5XuTQJKdJlhW6pGkmwLDpZfRgxwYdnA+KRh7DlpF2QQMhznjP3p0
	 8Rtp1pI3RpX6Xz6BaUD6OztpnA9eUIjDff5grV3tIoF8yYDNu54wp8zcd9TlWger5PWyi
	 AUFL3P5GStbHaFqlow1Z1xzTMN7YGrWbS1FT1TrkVAvuXOJ2TsezukXYeKeq6nSTVPAqo
	 VGFa4Qu1a7tA+7q4q0KzRDg4J1W91OXFCFGqyz9UGF5QmcXsHBL4IkpgL5iJCfGcaAF8o
	 lubyNDc2Rq1bVi7KSxtvpFJZfXEoCz/7f7lQEjYaMidYsgoBqBG2k6dCmO+dasXIyyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TE3zYAtP;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913A5606D835;
	Fri,  6 Nov 2026 12:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 913A5606D835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TE3zYAtP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793966931; x=1825502931;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J8v0IAgGr9SXVQka7hqpw9c39FB0mh7inFSdj01aDr4=;
  b=TE3zYAtPDv18fyLLhzByDo0k1Y93HI5iYmV9CTQE4IvdfKzUV7VDJ6dI
   WGwkTwIukEq2VCh4AzyDct/91tQlrGED3paa1bsVLdkj7Gsu6+pIQ9ep0
   d2YTohrFvRKdat2T4gBGxFughORjOmH0jE8QqehoSVGZgWDGmk+hPK/pM
   JQck/IoDTyHaCAYP/GybNMyeEga3OtKfRyujCXesPPO5olFJqn8pm1st+
   fvxS0GI4RUG/Eh1jbDYNdogs+5nr4xVdlBwAtnZ8P7X0EkIPo4brCmDIP
   i0eL1hFmXb0kYd7NJseOewVUAs0b4XoMFYLsToAsdkETPjHgHML65Q2hB
   w==;
X-CSE-ConnectionGUID: 2tVSRvhQSxejHPQhVif2PA==
X-CSE-MsgGUID: 6jYo9ylVSdSiXULk6+aLhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2655376"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2655376"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 04:08:51 -0800
X-CSE-ConnectionGUID: wgm34eLgSH2vpHVRZ1T9uA==
X-CSE-MsgGUID: EaAObOdeS2GcoO7x5bjhbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7146632"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa004.jf.intel.com with ESMTP; 06 Nov 2026 04:08:48 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: linux-sound@vger.kernel.org
Cc: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	yung-chuan.liao@linux.intel.com,
	vkoul@kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 4/7] ASoC: Intel: avs: Pass irq to dsp_interrupt callback
Date: Fri,  6 Nov 2026 13:15:54 +0100
Message-Id: <20261106121557.2338556-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106121557.2338556-1-cezary.rojewski@intel.com>
References: <20261106121557.2338556-1-cezary.rojewski@intel.com>
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

