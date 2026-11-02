Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793642632;
	b=AZIk/+taIoj1VhOtLFrrvnzQ9RlRhL5K4KX8nth+ev3W/jLjUHR89SGWa93a1Rx9LkSf
	 XW6cWaN/03F0+AGfo5/C9cC28MXnxqBpqS9qH/BawEbf0RYTq3hAH3IXNGCCzc+GtGZ4H
	 tXWswZuCDw2HbMDp7nMNbKzrKHnh+312ySPmokKrcUZw2GmcjSmOhFQBGG0FAIpM3eaZ2
	 9Kgv1wbQStZTG4X1mTuGfNtO7aK1kcZ4g5DAUKUrfqjOItbMrRjWaSaZXlpiwQFGRbcL5
	 ANBoYxDHjdx6msUWEGnVSZbICO1xX3fp1shY1GU8/iG2EOM3rlehU3D5AwDg2zw5vnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642632;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WV+7n2rOz+MebmNFmGWu4EOMGPpGEuN6WHQVAUvB6IE=;
	b=wXiC1WcYhwGNTy/7IdmXB3dtpb6iS1aFNsOsv8iiJLJ86b6Wiut/IApSSCQRvGBR3uaB
	 0HRzsxaqa4uRbJdDwoMvD4EaorvZL/3NDkN6XHERpJWnbHlSIUsOyelkMSafqPUJQt1uE
	 Zyo9RQIIYtZoeCgjJ6572TpXaYGnPaRULeFtBa47niklQSLEvFBQuK3gWhs4OW43YgwIr
	 XptSCcZIOlo9Arx/UF1OZcHS1HbxeLn4DJ2sTOlYIJf2NHnEmdZhQNK9+tac+iJicYHvR
	 wH/AB0dRcxwjQ/hrjLN5AQv3y9TB8hGSUyI4TOV53lblOexifO+dDkNW3MMEJ4GIaTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BHCsgsZM;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE00F606B0EB;
	Mon,  2 Nov 2026 18:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE00F606B0EB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BHCsgsZM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793642631; x=1825178631;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pOYJBCdaR0JhfV/R9cKlKMJS80363+m+CUbH3ueWPSA=;
  b=BHCsgsZM1XW9BfwU35sU2E8dIOvDgut5TQ0dMpm9V1lTD/nCbHVFLOy3
   lbkWnNkAi7cpqeXRBR5kcwm8TdhPArra+6d2TgK/eZytAMVywRCZQdY9A
   aJU/NN8Z4076cs0f9+bYx7BSL9af6+juUshREn5PcsCcJJ+Tw9yAyBh3z
   72ARZSydhpsY0hTyFRJO8U4g4bX1RxytQhtwpgxndPQ4KYek7/1GPDMUB
   6NEHC/9zV3tFx0X0HlR6+MKHVeE/Fc/Z5v518R2STpgOJNzJky2kJXM7j
   zJAYI+9mlqmSpWfqdvtV9I45OvW7Di4sabiTcCVCXZmXe7+jdhyGXGfr7
   g==;
X-CSE-ConnectionGUID: GRI6Im/OTfiad/r+GSI8fQ==
X-CSE-MsgGUID: RHf6GYSPTCmjD9gXAyzL6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2235474"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2235474"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 10:03:49 -0800
X-CSE-ConnectionGUID: Fz96oMr+QUmzK4oxsS+0qA==
X-CSE-MsgGUID: iXszuDNuQ6SBmJhz5b5jDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6169183"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 02 Nov 2026 10:03:43 -0800
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
Subject: [PATCH 3/7] soundwire: intel: Split PDIs and DAIs initialization
Date: Mon,  2 Nov 2026 19:10:38 +0100
Message-Id: <20261102181042.1922005-4-cezary.rojewski@intel.com>
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

Not every client of the soundwire-driver needs the secondary
soc-component and full range of DAIs immediately when initializing the
device. As function intel_register_dai() does all of that on top of
initializing PDIs, split it into two logical blocks to accommodate for
both approaches. In consequence, register_dai() callback becomes
optional.

To keep things in status quo for existing users, update
intel_link_startup() to call sdw_intel_init_pdis().

Cc: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 drivers/soundwire/intel.c           | 24 +++++++++++++++---------
 drivers/soundwire/intel.h           |  3 ++-
 drivers/soundwire/intel_auxdevice.c |  4 ++++
 3 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index d53fa3d299bc..708503373183 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1027,23 +1027,29 @@ static int intel_create_dai(struct sdw_cdns *cdns,
 	return 0;
 }
 
+int sdw_intel_init_pdis(struct sdw_intel *sdw)
+{
+	struct sdw_cdns_stream_config config;
+	int ret;
+
+	/* Read the PDI config and initialize cadence PDI */
+	intel_pdi_init(sdw, &config);
+	ret = sdw_cdns_pdi_init(&sdw->cdns, config);
+	if (ret)
+		return ret;
+
+	intel_pdi_stream_ch_update(sdw, &sdw->cdns.pcm);
+	return 0;
+}
+
 static int intel_register_dai(struct sdw_intel *sdw)
 {
 	struct sdw_cdns_dai_runtime **dai_runtime_array;
-	struct sdw_cdns_stream_config config;
 	struct sdw_cdns *cdns = &sdw->cdns;
 	struct sdw_cdns_streams *stream;
 	struct snd_soc_dai_driver *dais;
 	int num_dai, ret, off = 0;
 
-	/* Read the PDI config and initialize cadence PDI */
-	intel_pdi_init(sdw, &config);
-	ret = sdw_cdns_pdi_init(cdns, config);
-	if (ret)
-		return ret;
-
-	intel_pdi_stream_ch_update(sdw, &sdw->cdns.pcm);
-
 	/* DAIs are created based on total number of PDIs supported */
 	num_dai = cdns->pcm.num_pdi;
 
diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index 7a2e7e73ad63..12416cef8224 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -158,7 +158,7 @@ static inline int sdw_intel_register_dai(struct sdw_intel *sdw)
 {
 	if (SDW_INTEL_CHECK_OPS(sdw, register_dai))
 		return SDW_INTEL_OPS(sdw, register_dai)(sdw);
-	return -ENOTSUPP;
+	return 0;
 }
 
 static inline void sdw_intel_check_clock_stop(struct sdw_intel *sdw)
@@ -262,6 +262,7 @@ int intel_start_bus_after_reset(struct sdw_intel *sdw);
 void intel_check_clock_stop(struct sdw_intel *sdw);
 int intel_start_bus_after_clock_stop(struct sdw_intel *sdw);
 int intel_stop_bus(struct sdw_intel *sdw, bool clock_stop, bool wake_enable);
+int sdw_intel_init_pdis(struct sdw_intel *sdw);
 
 /* common bank switch routines */
 int intel_pre_bank_switch(struct sdw_intel *sdw);
diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index 5983fbc5725a..114dadedfa14 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -423,6 +423,10 @@ int intel_link_startup(struct auxiliary_device *auxdev)
 	if (ret)
 		goto err_init;
 
+	ret = sdw_intel_init_pdis(sdw);
+	if (ret)
+		goto err_init;
+
 	/* Register DAIs */
 	ret = sdw_intel_register_dai(sdw);
 	if (ret) {
-- 
2.34.1

