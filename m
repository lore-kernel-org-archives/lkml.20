Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713391;
	b=BZV227lvay6i5T9nqhSa4Jf/esZfV9dXDZMZrqAr680fHJ70XzeDh7vsS9nOS44GIFT8
	 sScGnZBS2o3U78XKh79MWwSQRC1wmt8QUFqyV7xXLw1QB14FE1Zxf2eVb+ojuQJAXZi6T
	 IWUdF6MBvuIPPbVeK0UMkphbaorWyYXscmTrTOskvR/DXeg8SJo29juOAsdAYu0A+qsnv
	 508mrHNbV1MN37WOTD3UkiqVi4OSUEbm1XqSRqjHQTBDR560GlHNyGyUjKuk1TmL1xNrm
	 US4j5MZUAIvVzGW7MyEsLapwaLR3w8wn8QhEGGsGK2rneaZgEcMF7VXXWPLYHj6q/Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713391;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jgpyDsSSVMKGkaab/Zb1nX8ouUXZODDbuc5KAyvGBVc=;
	b=AneAetkR8Xm2TSECXnRoIUf+kZ+IjGHQXn9c+kpTUrJ3lnrbtHY5cd/zFHude9op7OCC
	 QHR2tvd7mLK3XXi8rm9zS1cOga1sf4FnqsjMwPYoLZp8NfqXjDe4d9R6+MxZ/6iRTRhp7
	 w69k6y7QoZQvCqmolOclKvAq/ij9V0PJF3zw7b4Q4IpgtJ0K+6UB4nsyAF/oG4IFGCfPr
	 NwpdhEhrl4gyTIRSGsgepKfXq1sskmBFoxP2FoUC3/PUa08fjX74JPR7lblmeBrJp4UHE
	 Qa4zP4Lp3UKFqzyDImN296tSX4XTfMxzl1LINAc9onJ/SJtVzj20hXct7cRle4383og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AzYyWfUU;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91602606A32E;
	Tue,  3 Nov 2026 13:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91602606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AzYyWfUU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793713390; x=1825249390;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9ESRYUYS+qJIrWKCET1ZlbTBMATrLLAaIAymN91HDUo=;
  b=AzYyWfUUOXER4kX5XY8SuEnl2bYsmtjZgESDa6X01U5yoERQozKuMguL
   uroJdurUz05R+VOBVDC3MX3XnFtasjqD1ra/XO5lCvjfZIQHEJ0O4qAyG
   K/c5NgAsl5/pGOoZgde4MvwCgHsjL0RguY6RNwjUdXLaH4T+DtALYKYdD
   C7OojDyY3M0v0y1mld2GuBK+/5bX5LZkbLkc4kXHh8jpvEDejqQSN1F7t
   +xFVj+yrHiyQWLr2tx931c3VvkI9Gcizy69MrmR1TY/UVxXVHK335rI6I
   2/3Edn6BoPirgFEXr/uD8JkH4QatoTCEkdXC2sP50Z8LGFq8Oxpga0y7C
   A==;
X-CSE-ConnectionGUID: uw+tU8TSQn6AeXY9+0hbow==
X-CSE-MsgGUID: nclYKq8QQSy9Lw034uCltA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2328079"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2328079"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 05:43:10 -0800
X-CSE-ConnectionGUID: DZVIR/dFQGuzp45yIN+HRA==
X-CSE-MsgGUID: GeLg0UEKRNmWVZXW8P+IUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6428194"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 03 Nov 2026 05:43:08 -0800
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
Subject: [PATCH v2 1/7] soundwire: intel: Define stubs when library is disabled
Date: Tue,  3 Nov 2026 14:49:52 +0100
Message-Id: <20261103134958.2089136-2-cezary.rojewski@intel.com>
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
Content-Transfer-Encoding: 8bit

The library defines no stubs when it is disabled so the actual users
have to do it locally to allow the code to compilte or, guard the code
that does interact with soundwire with #if(s). Define simple wrappers to
make the life of soundwire-code users easier.

The change allows for a driver to build against SOUNDWIRE_INTEL=n whilst
still calling the stubs in its common code without compilation failing.
The driver needs not to flank its soundwire-code with #if(s) either.

Not all sdw_intel_xxx()s are part of drivers/soundwire. Some definitions
are located within sound/hda/core instead. With the wrappers done,
update Kconfig for sound/hda/core as currently the ACPI-related function
are compiled regardless if SOUNDWIRE_INTEL is selected or not. By being
dependent on SOUNDWIRE_INTEL those functions are compiled only if the
SoundWire was actually requested.

Cc: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/linux/soundwire/sdw_intel.h | 34 +++++++++++++++++++++++++++++
 sound/hda/core/Kconfig              |  2 +-
 sound/hda/core/Makefile             |  3 +++
 3 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 9710f2dc04e2..4547dcc710e5 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -358,6 +358,8 @@ struct sdw_intel_res {
 	struct mutex *eml_lock;
 };
 
+#if IS_ENABLED(CONFIG_SOUNDWIRE_INTEL)
+
 /*
  * On Intel platforms, the SoundWire IP has dependencies on power
  * rails shared with the DSP, and the initialization steps are split
@@ -384,6 +386,38 @@ void sdw_intel_exit(struct sdw_intel_ctx *ctx);
 
 irqreturn_t sdw_intel_thread(int irq, void *dev_id);
 
+#else
+
+static inline int sdw_intel_acpi_scan(acpi_handle parent_handle, struct sdw_intel_acpi_info *info)
+{
+	return -ENODEV;
+}
+
+static inline void sdw_intel_process_wakeen_event(struct sdw_intel_ctx *ctx)
+{
+}
+
+static inline struct sdw_intel_ctx *sdw_intel_probe(struct sdw_intel_res *res)
+{
+	return NULL;
+}
+
+static inline int sdw_intel_startup(struct sdw_intel_ctx *ctx)
+{
+	return 0;
+}
+
+static inline void sdw_intel_exit(struct sdw_intel_ctx *ctx)
+{
+}
+
+static inline irqreturn_t sdw_intel_thread(int irq, void *dev_id)
+{
+	return 0;
+}
+
+#endif
+
 #define SDW_INTEL_QUIRK_MASK_BUS_DISABLE      BIT(1)
 
 struct sdw_intel;
diff --git a/sound/hda/core/Kconfig b/sound/hda/core/Kconfig
index bfdcf6384c52..6cbcd9e26420 100644
--- a/sound/hda/core/Kconfig
+++ b/sound/hda/core/Kconfig
@@ -29,7 +29,7 @@ config SND_INTEL_DSP_CONFIG
 	tristate
 	select ACPI_NHLT if ACPI
 	select SND_INTEL_NHLT if ACPI
-	select SND_INTEL_SOUNDWIRE_ACPI if ACPI
+	select SND_INTEL_SOUNDWIRE_ACPI if SOUNDWIRE_INTEL != n
 	# this config should be selected only for Intel DSP platforms.
 	# A fallback is provided so that the code compiles in all cases.
 
diff --git a/sound/hda/core/Makefile b/sound/hda/core/Makefile
index 89cb46143050..28032ac7bc61 100644
--- a/sound/hda/core/Makefile
+++ b/sound/hda/core/Makefile
@@ -18,5 +18,8 @@ snd-intel-dspcfg-y := intel-dsp-config.o
 snd-intel-dspcfg-$(CONFIG_SND_INTEL_NHLT) += intel-nhlt.o
 obj-$(CONFIG_SND_INTEL_DSP_CONFIG) += snd-intel-dspcfg.o
 
+ifneq ($(CONFIG_SND_INTEL_SOUNDWIRE_ACPI),)
 snd-intel-sdw-acpi-y := intel-sdw-acpi.o
+endif
+
 obj-$(CONFIG_SND_INTEL_SOUNDWIRE_ACPI) += snd-intel-sdw-acpi.o
-- 
2.34.1

