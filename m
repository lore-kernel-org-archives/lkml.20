Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793642639;
	b=H0ZVCQ7psiRycDzumO7PiVsVG45IH1ZZ40K93B0hA8LXDwNIPndqujzd+Fb4fb98uEWA
	 I17Yt5g651NoEzJfW5a9Up92MwBpExTygSmJ1YVpgb993TIB0HSaAEt/X1Zt2Ag26dpwV
	 Yvw04U+qMyFCoTHPu2i8sVujff4TuOMK4I1Yi4bLEMjiQmOGyafvZpZJQb2TmGrdc/whl
	 YrNfM8MLvRniPeyagKnAMIA8GxlXTXtaJEDIt1vQ7cNpeLP2KKilJR3ZuuUTMrngQG2qD
	 hLrlGugdKqQL0Mh/wI5cr7Rxxp9TKn7Jt0oPy9O+PgzFSJvCicGQHXX2sVGx/1e5fcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642639;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KMQ+TsA/EAJoAgzaN+TdZdnXZnp87QfK30CtE1xNd8g=;
	b=S3IGdQYAK9xZll0BZ0b158ckko/X7c3/Owbh9xCeFjTKnAxKKXOTi0tLVO4QnbUwjQVe
	 QQaR/9vap6OAFzgbUTAKJURt+hXJuIqm9pOVGSWwH086RAJbyhdol9pIhoDHy+HE3EhLp
	 WbOB6Gok7MeP2YufriB8IqMcSSeTke6zFQsrAty9Bn9KPO6FPDPzym8b02YmMzipsNAOV
	 D3WTScTooynA6bzRRXnDUVXaErVw2n7mQZwiv0pb4T38zDxq0PvKoRQ0xLjyihX963Qom
	 CHxdF8CLaIZntAU/FiwPEWwqXRvWOj5gxByQ3KNmOVC391vcVfRQGKqaVkyVrdf63WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d1FGA8Qb;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85054606BA53;
	Mon,  2 Nov 2026 18:03:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85054606BA53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d1FGA8Qb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793642634; x=1825178634;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f3IMwuN6leB8zpAllM0ZSdDDO9kWp+2d5a3+JtRA/lM=;
  b=d1FGA8QbwJo0Yb4+Prsvmpv9Lu8olIFg/UZwV5A9Nko6k9W684A5dbG6
   gFs9fEvFj9nLAPvKdKwOgXxKIV3uL6zzBkfVlwR8d7lsZGIlqPXe88PXi
   VTdJCNOrBtwzrqeA93Hcvz1vbdBcMDSpAqvEU5pq/A1qWCVOtyUW0Fwnc
   Gio8LuqriGcIpyqwtdyv/Ivj+GB36hBsCK+IPdYLov63KtdD5IgBVgd00
   i4hM6SCp3OT44hBofeqz3M4T8UEQHGU94jgz1BTGFVLRjVSfmr+I/K/dz
   Lebc9WFAek0EwD7xZJkR+Nzi9lcYpkGslhw97oEz+sKfSIGfAvTjc3Ovx
   Q==;
X-CSE-ConnectionGUID: sDqLv+o1TriFUY+OXQ5Ctg==
X-CSE-MsgGUID: v1txPNKaQpeFFhg1YG8oyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2235496"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2235496"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 10:03:53 -0800
X-CSE-ConnectionGUID: iSAB/HDdQOayp8xvh7qucA==
X-CSE-MsgGUID: LitnubtWQDWW1xx914Ip2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6169236"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 02 Nov 2026 10:03:51 -0800
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
Subject: [PATCH 6/7] ASoC: Intel: avs: Expose common PCM functions
Date: Mon,  2 Nov 2026 19:10:41 +0100
Message-Id: <20261102181042.1922005-7-cezary.rojewski@intel.com>
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

All the PCM operations are currently bundled together within the pcm.c
file regardless of which transfer type they cover. To allow for
splitting them, provide a header that exposes the common operations
outside.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/avs.h |  8 -------
 sound/soc/intel/avs/pcm.c | 42 +++++++++------------------------
 sound/soc/intel/avs/pcm.h | 49 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+), 39 deletions(-)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 40e65639adb2..1b2f1e7d0556 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -347,14 +347,6 @@ struct avs_soc_component {
 
 extern const struct snd_soc_dai_ops avs_dai_fe_ops;
 
-int avs_register_dmic_component(struct avs_dev *adev, const char *name);
-int avs_register_i2s_component(struct avs_dev *adev, const char *name, unsigned long port_mask,
-			       unsigned long *tdms);
-int avs_register_hda_component(struct avs_dev *adev, const char *name);
-int avs_register_component(struct device *dev, const char *name,
-			   struct snd_soc_component_driver *drv,
-			   struct snd_soc_dai_driver *cpu_dais, int num_cpu_dais);
-
 int avs_register_all_boards(struct avs_dev *adev);
 void avs_unregister_all_boards(struct avs_dev *adev);
 
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index f17bbc2ba63d..fb1af3bb493f 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -22,26 +22,6 @@
 #include "utils.h"
 #include "../../codecs/hda.h"
 
-struct avs_dma_data {
-	struct avs_tplg_path_template *template;
-	struct avs_path *path;
-	struct avs_dev *adev;
-
-	/* LINK-stream utilized in BE operations while HOST in FE ones. */
-	union {
-		struct hdac_ext_stream *link_stream;
-		struct hdac_ext_stream *host_stream;
-	};
-
-	struct snd_pcm_hw_constraint_list rate_list;
-	struct snd_pcm_hw_constraint_list channels_list;
-	struct snd_pcm_hw_constraint_list sample_bits_list;
-
-	struct work_struct period_elapsed_work;
-	struct hdac_ext_link *link;
-	struct snd_pcm_substream *substream;
-};
-
 static struct avs_tplg_path_template *
 avs_dai_find_path_template(struct snd_soc_dai *dai, bool is_fe, int direction)
 {
@@ -117,7 +97,7 @@ static int avs_hw_constraints_init(struct snd_pcm_substream *substream, struct s
 	return 0;
 }
 
-static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct avs_dev *adev = to_avs_dev(dai->component->dev);
@@ -147,7 +127,7 @@ static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 	return avs_hw_constraints_init(substream, dai);
 }
 
-static void avs_dai_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+void avs_dai_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct avs_dma_data *data;
@@ -165,10 +145,10 @@ static void avs_dai_shutdown(struct snd_pcm_substream *substream, struct snd_soc
 	kfree(data);
 }
 
-static int avs_dai_hw_params(struct snd_pcm_substream *substream,
-			     struct snd_pcm_hw_params *fe_hw_params,
-			     struct snd_pcm_hw_params *be_hw_params, struct snd_soc_dai *dai,
-			     int dma_id)
+int avs_dai_hw_params(struct snd_pcm_substream *substream,
+		      struct snd_pcm_hw_params *fe_hw_params,
+		      struct snd_pcm_hw_params *be_hw_params,
+		      struct snd_soc_dai *dai, int dma_id)
 {
 	struct avs_dma_data *data;
 	struct avs_path *path;
@@ -199,9 +179,9 @@ static int avs_dai_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int avs_dai_be_hw_params(struct snd_pcm_substream *substream,
-				struct snd_pcm_hw_params *be_hw_params, struct snd_soc_dai *dai,
-				int dma_id)
+int avs_dai_be_hw_params(struct snd_pcm_substream *substream,
+			 struct snd_pcm_hw_params *be_hw_params,
+			 struct snd_soc_dai *dai, int dma_id)
 {
 	struct snd_pcm_hw_params *fe_hw_params = NULL;
 	struct snd_soc_pcm_runtime *fe, *be;
@@ -217,7 +197,7 @@ static int avs_dai_be_hw_params(struct snd_pcm_substream *substream,
 	return avs_dai_hw_params(substream, fe_hw_params, be_hw_params, dai, dma_id);
 }
 
-static int avs_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+int avs_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct avs_dma_data *data;
 	int ret;
@@ -1376,7 +1356,7 @@ static int avs_component_new(struct snd_soc_component *component,
 	return 0;
 }
 
-static struct snd_soc_component_driver avs_component_driver = {
+struct snd_soc_component_driver avs_component_driver = {
 	.name			= "avs-pcm",
 	.probe			= avs_component_probe,
 	.remove			= avs_component_remove,
diff --git a/sound/soc/intel/avs/pcm.h b/sound/soc/intel/avs/pcm.h
index 0f3615c90398..ac127ade4ca1 100644
--- a/sound/soc/intel/avs/pcm.h
+++ b/sound/soc/intel/avs/pcm.h
@@ -9,8 +9,57 @@
 #ifndef __SOUND_SOC_INTEL_AVS_PCM_H
 #define __SOUND_SOC_INTEL_AVS_PCM_H
 
+#include <linux/device.h>
+#include <sound/hdaudio_ext.h>
 #include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc-acpi.h>
+#include <sound/pcm_params.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-acpi-intel-match.h>
+#include <sound/soc-component.h>
+#include <sound/soc-dai.h>
+
+struct avs_dma_data {
+	struct avs_tplg_path_template *template;
+	struct avs_path *path;
+	struct avs_dev *adev;
+
+	/* LINK-stream utilized in BE operations while HOST in FE ones. */
+	union {
+		struct hdac_ext_stream *link_stream;
+		struct hdac_ext_stream *host_stream;
+	};
+
+	struct snd_pcm_hw_constraint_list rate_list;
+	struct snd_pcm_hw_constraint_list channels_list;
+	struct snd_pcm_hw_constraint_list sample_bits_list;
+
+	struct work_struct period_elapsed_work;
+	struct hdac_ext_link *link;
+	struct snd_pcm_substream *substream;
+};
 
 void avs_period_elapsed(struct snd_pcm_substream *substream);
+int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai);
+void avs_dai_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai);
+int avs_dai_hw_params(struct snd_pcm_substream *substream,
+		      struct snd_pcm_hw_params *fe_params,
+		      struct snd_pcm_hw_params *be_params,
+		      struct snd_soc_dai *dai, int dma_id);
+int avs_dai_be_hw_params(struct snd_pcm_substream *substream,
+			 struct snd_pcm_hw_params *be_params,
+			 struct snd_soc_dai *dai, int dma_id);
+int avs_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai);
+
+extern struct snd_soc_component_driver avs_component_driver;
+int avs_register_component(struct device *dev, const char *name,
+			   struct snd_soc_component_driver *drv,
+			   struct snd_soc_dai_driver *cpu_dais, int num_cpu_dais);
+
+int avs_register_dmic_component(struct avs_dev *adev, const char *name);
+int avs_register_i2s_component(struct avs_dev *adev, const char *name, unsigned long port_mask,
+			       unsigned long *tdms);
+int avs_register_hda_component(struct avs_dev *adev, const char *name);
 
 #endif
-- 
2.34.1

