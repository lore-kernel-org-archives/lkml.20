Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793642632;
	b=AQR7Lv6Biuk33xDffj0JIQDQSUJkJvQkczKRyaN1xZ2ujoKuATKs5XL4p1AYaz09V7hF
	 9R6fxtYavvG6PpAZK2VmbPnvG6LXayVD5fo7Rbvj3V6JEmWYGkEl8RLA5YpmdPHSi9VJs
	 suOl9YRIF+hew2p8xIW0GLCTpcT8mNJ70zF7qNN9GuFL0UhuJ7/Z2BboOfvUY3pGs7bjn
	 hFv0Fsvn5sSXsGamP9x1MVUHUEEnNfo16a9Kr6SrxYnVNvJSkUFTlxdI7gnKHFrjs7wFs
	 n/WivzFXTQ6a1bBjaVNqBj92nZDvhnjk/5ExhibOHB2GoHn3Kyg408Y90ESWlvOgzPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642632;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GoaKHKx+mbDwizTsMzmpGtij9+xHhs9Q3rJUfOYnWD0=;
	b=vaRPZ+sVMmYyEwyYvCw5jHI12GEmP4eNwBqTWhxQmGHrz70Sa5oEAbUnldouByw3wKQs
	 GZj63NtT9ZnyRy/yND9TfpHUXKyncJlJZ8iQZCBGBdEKx/vk/JKqRT6DTyY41TMv/g7p+
	 eoijtyKXboQH56KOZhMchF1O5krGWPqoP7MSYVr/gM/GplnwQFQoaHY9UwIyJi8UNjpha
	 xY72FJGo3pe3nUBjmzlU7uaG9aEudVSww/7b5G/5it8KWMaXk1vlLb+Q9b/6W/2sTRMS/
	 dJdDt4/wS/UZrd1Gb0nz2wjTzvcRiO+nEHIS7++KUYXdlgIc+48W/uSLHXekMYZI+ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lYwstp1j;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52F4606B0E1;
	Mon,  2 Nov 2026 18:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A52F4606B0E1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lYwstp1j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793642630; x=1825178630;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WSTKqMjAm/trVd+7S5ZRTX3n/lK22D2tTdZRWkUsgfE=;
  b=lYwstp1jrbzDXBhIGezjJ0SW1umZB1cZds/JWplVT19OBbmV1C1H+ign
   dPZ7+t5kYIR8aplVP0zKlKjSQh8fC7hOhRHMJnX796lJ1/Eu0Drktpx0m
   T1g21sf+6tizGM5Mh8fIlfb8ETpGLFWtdARwmt88z/3yFxNa0U9IuV459
   NypVV4maRD7a+S0mxhEJazDT4TXNExGY/Xou2uKHEASUhKNHSOzHfwS/u
   7GMv2Bg/L2ZZ7mIs0vk/Smxj4wSWSh4Vhzn7U/1NQziMK7xnd0AuirNff
   s12KOn20Ms7jwlqvkH29i5LWKXinUGcxBJvTkcGtVevT2QUtbnnI8AhIA
   A==;
X-CSE-ConnectionGUID: tEIpwB6ARw6iM5hl3M44gA==
X-CSE-MsgGUID: 5wXcq8p6QVuVW/Ba++1VZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2235462"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2235462"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 10:03:49 -0800
X-CSE-ConnectionGUID: bWG5mXKOT1m7HMqkciTCYw==
X-CSE-MsgGUID: NMwaP4D8Tka/8RsZ3bSKDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6169168"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 02 Nov 2026 10:03:38 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: linux-sound@vger.kernel.org
Cc: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	vkoul@kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/7] soundwire: intel: Define stubs when library is disabled
Date: Mon,  2 Nov 2026 19:10:36 +0100
Message-Id: <20261102181042.1922005-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102181042.1922005-1-cezary.rojewski@intel.com>
References: <20261102181042.1922005-1-cezary.rojewski@intel.com>
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
index 9710f2dc04e2..83021cc0f5b8 100644
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
+	return 0;
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
index bfdcf6384c52..f91053dd9f58 100644
--- a/sound/hda/core/Kconfig
+++ b/sound/hda/core/Kconfig
@@ -29,7 +29,7 @@ config SND_INTEL_DSP_CONFIG
 	tristate
 	select ACPI_NHLT if ACPI
 	select SND_INTEL_NHLT if ACPI
-	select SND_INTEL_SOUNDWIRE_ACPI if ACPI
+	select SND_INTEL_SOUNDWIRE_ACPI if SOUNDWIRE_INTEL
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

