Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713398;
	b=sYckFDG2MbIjDWCyAOme4t8Auf9pNeH81GCvThFYbWHKqf0LYvaykeDxvthhG4+ymdym
	 hiu3vKQvrdn8IPw/QFr5deAbU+SbvigLhOL9KD4iGDEljnDkSb+54P6cUpjGYoEpdKcgT
	 8XSZnkhGcAQUWj3rbBWFsDtgTq5VgBFW7KGLoZc/lQ6Ha14MkYjoLhY1LFHfzmvmyzgrt
	 oguHtWp+yhvzM+NyYqOt6GYiBt5Z0yTQxMH90ZNimyd3Zv6rcBXtvR+YpHN7tv/nn3QfC
	 9u7kQfS6hazai9pZb/kPwgvY7g2qm3xByhTuwfXY0/dfFqY9pEMt14izpjHV3vpBMtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713398;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dWVWOd6i4xUHXlOtmqbHZr1bxRvKowbPlQ0usmybAmQ=;
	b=G4oVt1VaHLAppkAz+VmKTB3D45kld/QQLV1iVXP3K9jYVFT2qFJ8RDNip9wNyGBq95It
	 MG/p7VOT6hPSHBAOB32UrVFzMD9vGOmFd0CGd7Xk+YZutT9y0qNthaqzYMhpEmV7iIxKe
	 MTYc082BbtvJWpVvGIMs2bCWmsOCjP9geRb/gYdT+zXa9C5VdQ+t/X+EyyBam3ZLn5HYY
	 abzqcshr/AqUgJ8L1MvPmirjYclTq1iTQlGtkqtdrIG8FiYCZZ+KuRsO+euVV0BEdbfpY
	 SJ6Co1l6pcF4L/7wFyTmf56WCd8RcSyLrEXK6fFb4NyWt3ub0RQ91/vqotXbN8ejtyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dmo5AWB7;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA8B606A326;
	Tue,  3 Nov 2026 13:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAA8B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dmo5AWB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793713397; x=1825249397;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=26a0MToV/AU70pUeU1pPoHXhXmoYn6a91yX25IRfdD0=;
  b=Dmo5AWB7GjwlkvaMzWsr60+4Sq/uqeCf0F2H2URakmegWp+Zu9d49ScQ
   ZeyToe1vnYhjne3pxgSL9vZdzx9DazbYGs4i7S3ecQVRmbuPA0cRarlun
   FRVWitvmrX6WpOrBVPGb55RKSp6yuiKh4Q0aIuav/LYn/4TFy/Ubtc7wh
   t64lfxBZn1ucT/iuWtgK1jtCC/Z25Q3MYzoyc+1yx957MEDRXMDmbfehJ
   +cp3HgkEF+s5VjbD7xem4fJsZihWj2W9GchJSuKjTnAu4Xu7m2OnEqAPD
   xF7TXUQgCJpN2dh+akBI21MThbZo1j6MbVli8yTYUraoSrIQBVLc4zqar
   w==;
X-CSE-ConnectionGUID: 4APTzuKdSzSmukv89Buc0g==
X-CSE-MsgGUID: gxz7cBbzT7eY5XE6eLep5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2328111"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2328111"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 05:43:16 -0800
X-CSE-ConnectionGUID: iG1OWHeMTeSrHWX7CWHIug==
X-CSE-MsgGUID: ebV2dyIuRteqVDwfma/CXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6428234"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 03 Nov 2026 05:43:14 -0800
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
Subject: [PATCH v2 3/7] soundwire: intel: Split PDIs and DAIs initialization
Date: Tue,  3 Nov 2026 14:49:54 +0100
Message-Id: <20261103134958.2089136-4-cezary.rojewski@intel.com>
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
 drivers/soundwire/intel.c           | 25 ++++++++++++++++---------
 drivers/soundwire/intel.h           | 10 +++++++++-
 drivers/soundwire/intel_ace2x.c     | 25 ++++++++++++++++---------
 drivers/soundwire/intel_auxdevice.c |  4 ++++
 include/linux/soundwire/sdw_intel.h |  4 +++-
 5 files changed, 48 insertions(+), 20 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index d53fa3d299bc..7807d24ff050 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1027,23 +1027,29 @@ static int intel_create_dai(struct sdw_cdns *cdns,
 	return 0;
 }
 
+static int intel_init_pdis(struct sdw_intel *sdw)
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
 
@@ -1087,6 +1093,7 @@ const struct sdw_intel_hw_ops sdw_intel_cnl_hw_ops = {
 	.debugfs_init = intel_debugfs_init,
 	.debugfs_exit = intel_debugfs_exit,
 
+	.init_pdis = intel_init_pdis,
 	.register_dai = intel_register_dai,
 
 	.check_clock_stop = intel_check_clock_stop,
diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index 7a2e7e73ad63..f2372749f08d 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -154,11 +154,18 @@ static inline void sdw_intel_debugfs_exit(struct sdw_intel *sdw)
 		SDW_INTEL_OPS(sdw, debugfs_exit)(sdw);
 }
 
+static inline int sdw_intel_init_pdis(struct sdw_intel *sdw)
+{
+	if (SDW_INTEL_CHECK_OPS(sdw, init_pdis))
+		return SDW_INTEL_OPS(sdw, init_pdis)(sdw);
+	return -ENOTSUPP;
+}
+
 static inline int sdw_intel_register_dai(struct sdw_intel *sdw)
 {
 	if (SDW_INTEL_CHECK_OPS(sdw, register_dai))
 		return SDW_INTEL_OPS(sdw, register_dai)(sdw);
-	return -ENOTSUPP;
+	return 0;
 }
 
 static inline void sdw_intel_check_clock_stop(struct sdw_intel *sdw)
@@ -262,6 +269,7 @@ int intel_start_bus_after_reset(struct sdw_intel *sdw);
 void intel_check_clock_stop(struct sdw_intel *sdw);
 int intel_start_bus_after_clock_stop(struct sdw_intel *sdw);
 int intel_stop_bus(struct sdw_intel *sdw, bool clock_stop, bool wake_enable);
+int sdw_intel_init_pdis(struct sdw_intel *sdw);
 
 /* common bank switch routines */
 int intel_pre_bank_switch(struct sdw_intel *sdw);
diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index 642b33ab5526..67b5d54bb2a7 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -1058,10 +1058,24 @@ static int intel_create_dai(struct sdw_cdns *cdns,
 	return 0;
 }
 
+static int intel_init_pdis(struct sdw_intel *sdw)
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
@@ -1069,14 +1083,6 @@ static int intel_register_dai(struct sdw_intel *sdw)
 	int ret;
 	int off = 0;
 
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
 
@@ -1149,6 +1155,7 @@ const struct sdw_intel_hw_ops sdw_intel_lnl_hw_ops = {
 
 	.get_link_count = intel_get_link_count,
 
+	.init_pdis = intel_init_pdis,
 	.register_dai = intel_register_dai,
 
 	.check_clock_stop = intel_check_clock_stop,
diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index 5983fbc5725a..9031c96f7e9d 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -423,6 +423,10 @@ int intel_link_startup(struct auxiliary_device *auxdev)
 	if (ret)
 		goto err_init;
 
+	ret = sdw_intel_init_pdis(sdw);
+	if (ret)
+		goto err_power_up;
+
 	/* Register DAIs */
 	ret = sdw_intel_register_dai(sdw);
 	if (ret) {
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index fbfb216bd90c..0efb05a25d12 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -433,7 +433,8 @@ struct sdw_intel;
  * @debugfs_init: initialize all debugfs capabilities
  * @debugfs_exit: close and cleanup debugfs capabilities
  * @get_link_count: fetch link count from hardware registers
- * @register_dai: read all PDI information and register DAIs
+ * @init_pdis: read all PDI information
+ * @register_dai: register DAIs
  * @check_clock_stop: throw error message if clock is not stopped.
  * @start_bus: normal start
  * @start_bus_after_reset: start after reset
@@ -459,6 +460,7 @@ struct sdw_intel_hw_ops {
 
 	int (*get_link_count)(struct sdw_intel *sdw);
 
+	int (*init_pdis)(struct sdw_intel *sdw);
 	int (*register_dai)(struct sdw_intel *sdw);
 
 	void (*check_clock_stop)(struct sdw_intel *sdw);
-- 
2.34.1

