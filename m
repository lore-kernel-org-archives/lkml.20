Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966928;
	b=GQ5BQGZ6bsJ56WcGAqSkiuW37rSQBfw4owspAjtuofzTbtw2wfaZ9k2UuX+4lbgKdy2o
	 d1OeaRzB5Gp4AlyyN0sQNoAX2LN1s3Nv2DBeuVt2/+76xRdJAMRUWAe3lbuqh60HiI/ww
	 cnxGC2w1WVb65D1/HHK2fnPWu3hzEs13D+p0nZUfj682FtAn8szRAY/aldzdWWh4tXsli
	 Jjiw3qO5LuQrSRWfZW1yTKjy+Riv91oz3waZKD/JGAb2j9GxJaAKdi7+TGiDW29hgE7B2
	 wMAEwCgCVe8NGx2xe1sKH+higvZNh8487nHmSpRfOQCJ+sM91dqulfdmsUJSkdzOvlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966928;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Lj4E18LF4xQ/yopc+o/wssobAmJgqPGBrk2/TmRnx+E=;
	b=xBP2St4GUaS9FyryqPMafbeLQcyo1djD9Q6Uazr6BlcQcEJg74ath+T37drdpA2LK7vT
	 D9YZB74bj0jFGIzFJIg8Qtq+q0uO7fKfXKK0t4za5Dj5p7C7Iwn/PL+8wwA9hNFVSKlyP
	 8AXodCyjrkNFRwArGcMsQuK6E48hUAyJt34Bzbu2yIy8/BhWelA60xsoFxr6glcyupkpO
	 pLAmX4KrJE++2yopXr9aasjEo3YTGaJREUl9Cxd/i1A9LqLuWR7L8wtwwnuIvtc4OCdve
	 kMiD74PnRjH1TkUeSAAOC2M93oQ048SxRV0NLLPSGKs87+12fxXgDx1iTFBPvbcc/wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="c31/rCLa";
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4A7606D818;
	Fri,  6 Nov 2026 12:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D4A7606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c31/rCLa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793966928; x=1825502928;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZbSVn+oSYkonO1FKuiMFkQ2Jkh9I6bmwcn7NMTdEBLw=;
  b=c31/rCLaVab5KpgO1NS01YnEmnEG0a7cgpr82w/dGMnB3+3TlTvQutF8
   /k+8VtUBAKGI9pG3J+qj3AZIz8vpgfc1YTJlMQZQQ6q/nKGqlrSZNwNAy
   gyvufeOWkjWXG83iXlMX/TRnrPbql/7QWhU/aNYeaTe9bWJtZSU8ugYzn
   WtmycIQpEGXIfsjx1VG1QoVdNh03cY9UlDD6xabyJscvHJlg0Gboc7ltS
   brUAReny7jAHoqGbc9yu1bmAOIXbBKQqaXVyvO72hRVAIDzXAH83VKG+6
   4ClUSb/Xcx0IV3y+Lxqz3PVIDKy+p1330pS0BBvEBFf2b5qwNX1owDW3U
   A==;
X-CSE-ConnectionGUID: +nEW6+59TKmE1eGFmb13mg==
X-CSE-MsgGUID: a4w6qJiCRkSn0M1Lhf030A==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2655369"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2655369"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 04:08:48 -0800
X-CSE-ConnectionGUID: g9GX5v4wSjWVfcGZtmyaYg==
X-CSE-MsgGUID: rkGFSbx7Q8+Lk5h+5eq5Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7146624"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa004.jf.intel.com with ESMTP; 06 Nov 2026 04:08:46 -0800
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
Subject: [PATCH v3 3/7] soundwire: intel: Split PDIs and DAIs initialization
Date: Fri,  6 Nov 2026 13:15:53 +0100
Message-Id: <20261106121557.2338556-4-cezary.rojewski@intel.com>
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
 drivers/soundwire/intel.h           |  9 ++++++++-
 drivers/soundwire/intel_ace2x.c     | 25 ++++++++++++++++---------
 drivers/soundwire/intel_auxdevice.c |  4 ++++
 include/linux/soundwire/sdw_intel.h |  4 +++-
 5 files changed, 47 insertions(+), 20 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 0baa032fb4e8..e18727695791 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1023,23 +1023,29 @@ static int intel_create_dai(struct sdw_cdns *cdns,
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
 
@@ -1083,6 +1089,7 @@ const struct sdw_intel_hw_ops sdw_intel_cnl_hw_ops = {
 	.debugfs_init = intel_debugfs_init,
 	.debugfs_exit = intel_debugfs_exit,
 
+	.init_pdis = intel_init_pdis,
 	.register_dai = intel_register_dai,
 
 	.check_clock_stop = intel_check_clock_stop,
diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index 7a2e7e73ad63..65f7d53a3d2b 100644
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

