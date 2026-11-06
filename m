Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966924;
	b=jMxS5sWoZD2RAM8EMeWxkNVYgqWxlCibFMEqbWGAPRvEFo5uH6pXK5FOYd7l2J6YF/fN
	 u6iz4ZtBBXivF9Jugy6rgDk0JeTAL5/CTrxI9eX5/DS3/b/Hy40kXACE9hsrn+uzaZ3Jl
	 0O/NucoTaDaAxSxFUo+wBmgvV/saJUj4AbQSJ3uPRwpY1A4VTiUGqNVDbiZjZUg6C9d7/
	 74MI0SHFcYekQB3/xM8Rr0KCSza2V2fGuIWj+sfkyTOecRiQZfiVanyBxHMX4MpV8UdmC
	 Q3QqddmAh/jDDP2hm5ZVFCdzIdI+EgoEGQnE0mcpH0KjE7TdAF6rszcySVrmD+Cu5jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966924;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jgpyDsSSVMKGkaab/Zb1nX8ouUXZODDbuc5KAyvGBVc=;
	b=Gb09Rh7bDky7ES+BXy/dq8HcPli8w0DFV2sLygeLDQWFLbWF5zeNOe9NjWO67TjHIFNU
	 cX7u5qa0miP7dB7ObGXrhRhtzfvUzjZD4HpseF2gBgBoLlO4/GbjpO9wJaLk+HjuTjMsi
	 A0viK6P1Su98h63u/U2srt+3tCZyVREe9e15ZiHTKhxAgA58mn96wrG8HuwzhYrgGob2d
	 +LORo9CoNL1I7he1mrHQPiKWbennubJef8weiu+PvPLZXK7dDbrcw0HE6zFNFQnm8SvZZ
	 QfRsMMUBwrV8DmZdcFhpCY7jNTcOGYkp0w3h7PFMatp+hb4acdFfSZ/Mzf5KjAq+dJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n614MPwS;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13314606A33C;
	Fri,  6 Nov 2026 12:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13314606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n614MPwS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793966923; x=1825502923;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9ESRYUYS+qJIrWKCET1ZlbTBMATrLLAaIAymN91HDUo=;
  b=n614MPwSgIKKUfE1asWHhB7LgX5F7COk/0tH/lBSwoOm4ahEy6KeMLg7
   urrqIlT/t5PLH3D2WjS7ac6SWjJXBZukWelXzgdicMKbPQSA5ognhklM5
   OcKhT0hye9iFAmCIM2gO6pN09dJUv4HCuaerMvQA81dZFOSHg/u/UIY4r
   I3CnX1T2T/glIFofqfDwQpJFts9kNyM0xN3DMnRR6w+78H1cfL2flVQb5
   fPmdOhMzqszC45DxFGwp7AQHBcFOg7b+5s/FJDiVJSJjePQQCR1aW0NuO
   QDoXXtFlrWe6gkPeVaCLP1iivmuZwSnirv9Sf4RrsJOMudo+58fBVqavN
   w==;
X-CSE-ConnectionGUID: AIrsYR4dTiak4Qn/kNW0RA==
X-CSE-MsgGUID: HKBBgCi8Q96zSuYwS7Tgow==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2655354"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2655354"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 04:08:43 -0800
X-CSE-ConnectionGUID: IIkt4CYOQ8yJA14fJtMbPw==
X-CSE-MsgGUID: IA4eMVZzRgeP2MV0pv7daA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7146616"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa004.jf.intel.com with ESMTP; 06 Nov 2026 04:08:41 -0800
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
Subject: [PATCH v3 1/7] soundwire: intel: Define stubs when library is disabled
Date: Fri,  6 Nov 2026 13:15:51 +0100
Message-Id: <20261106121557.2338556-2-cezary.rojewski@intel.com>
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

