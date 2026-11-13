Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569539;
	b=GzA9bVmh3HM8cIP+Evpj/HiAzob41baB2Ca5XKg8s/mhq/SpLMsp3l6ILjht9VObPskA
	 PL6vxT2LUr4tRkh/uT4zgbBEIqujEe22xOhr/EsnCyaYA/OzUnjBi9GUdBa64SY9sTqyC
	 WMBQaBP/GftAnRmn6ibJvgtjgVjXJ9shnZlm76M28s3uE5RJdoolvSBYKdb5sv/ucHumO
	 AZHmk6h1juAzlAuDphqCqRKu/etJI1SrdHNzLdnsGyTKOAu1jG335i6k5EX5f3W7aGfL9
	 wrP/YE8UAV2H8efM4uUcsRDtMNYfK+Bo+JPDKNCMyzOAcoSuRDOZMkgOrGtSgCQAsiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569539;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3DBQ0VgVgP9aqVIpKe5cR3JTOzZ9AbiVbIf3Tqn5Pxw=;
	b=2P5qVLc/D/jOTRtUlbu1lW8E4wsH2jAt3YwNe6bLXh3RE6KVn2XXOk8sSkkuOXSlFSLq
	 JS9yN8HL/nlufoVzzhT2AUJhy4EUxaNs0ItIUBOLD/YQwO/cWiAfwshZfx6SREBxxVHyz
	 70rBOx5fCIrI+Y+TGwouuxeQrJYjya3AcUu83HU7yyYlWezKtm8wFBY16ssQaBYZNxRaf
	 hX1P4+1RdPGFS2vIsV4IdpK7rwvQ/+8CKYFFlJJvH7verXETJD6V926tgqFy916D8PHYc
	 uzV8VxZLCvE4W6ut+ccMr/Ox8i0VG3R69Z9CaYiR+Hlc5WfXIzeeuOc2AtFQi0gHUjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="lePPsm/l";
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA537606A32D;
	Fri, 13 Nov 2026 11:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA537606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lePPsm/l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794569539; x=1826105539;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uFCk9ZBj+QPxg6B7zle6saJu081SdgbB3sk30KFPJlY=;
  b=lePPsm/liFDBwyn9NLolpKYzgossUHkYTOfUOG9BWEybI1HveUvEaqJK
   iQz+e/Jr/JxnfQ4a5+0xLaRYHTavyE0CZ4x63FD7bvliwgcGiROrr18xS
   mE9DqQ54mSlrx4G4NGtyD5IEzMiYNGNNxhZRLF15Mn2nNz89sYGaRdKZF
   okVSype54PWUSY89r2VOzDf3d+zBK4vVIStMOLMC3n8cmHKAb0zV7Hd7e
   tO2C8/vhTEs4SgYTiIHqhnFt1RGWaCq+UtA1hfRNEqTuZLLTUkwyKQ+Ev
   3IBSV9QmBlgEWSRpKtm4YX1AdeIRCqKGkNsXlBlyaaqo8kh7tCmh5j677
   g==;
X-CSE-ConnectionGUID: cOUL8wDySSyn+kRpKbNpvw==
X-CSE-MsgGUID: FBvw1plBS8+L2VLsTbwy9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3246910"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3246910"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 03:31:28 -0800
X-CSE-ConnectionGUID: GlunkduXQr6QihENxdBPVQ==
X-CSE-MsgGUID: PCid/jLITVKU3EDD2X+fng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9235581"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2026 03:31:26 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 03/11] ASoC: Intel: avs: Have one location for dumping path-errors
Date: Fri, 13 Nov 2026 12:38:32 +0100
Message-Id: <20261113113840.3067489-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113113840.3067489-1-cezary.rojewski@intel.com>
References: <20261113113840.3067489-1-cezary.rojewski@intel.com>
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

Both path.c and pcm.c print the exact same error messages, one after the
other. Let the avs_path_xxx() handle the messaging so that its caller
need not to do themselves. At the same time enrich them with path's name
so there is no ambiguity which path is being manipulated.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/path.c | 31 +++++++++++++-----------
 sound/soc/intel/avs/pcm.c  | 48 ++++++--------------------------------
 2 files changed, 24 insertions(+), 55 deletions(-)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index 936be206eece..e8bbc9058fc7 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -11,6 +11,7 @@
 #include <acpi/nhlt.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
+#include <sound/soc-dapm.h>
 #include "avs.h"
 #include "control.h"
 #include "path.h"
@@ -1187,18 +1188,11 @@ static struct avs_path *avs_path_create_unlocked(struct avs_dev *adev, u32 dma_i
 
 static void avs_condpath_free(struct avs_dev *adev, struct avs_path *path)
 {
-	int ret;
-
 	list_del(&path->source_node);
 	list_del(&path->sink_node);
 
-	ret = avs_path_reset(path);
-	if (ret < 0)
-		dev_err(adev->dev, "reset condpath failed: %d\n", ret);
-
-	ret = avs_path_unbind(path);
-	if (ret < 0)
-		dev_err(adev->dev, "unbind condpath failed: %d\n", ret);
+	avs_path_reset(path);
+	avs_path_unbind(path);
 
 	avs_path_free_unlocked(path);
 }
@@ -1373,6 +1367,13 @@ static int avs_path_bind_prepare(struct avs_dev *adev,
 	return 0;
 }
 
+static const char *avs_path_name(struct avs_path *path)
+{
+	struct snd_soc_dapm_widget *w = path->template->owner->w;
+
+	return w ? w->name : "(condpath)";
+}
+
 int avs_path_bind(struct avs_path *path)
 {
 	struct avs_path_pipeline *ppl;
@@ -1397,7 +1398,8 @@ int avs_path_bind(struct avs_path *path)
 					   sink->instance_id, binding->sink_pin,
 					   binding->source_pin);
 			if (ret) {
-				dev_err(adev->dev, "bind path failed: %d\n", ret);
+				dev_err(adev->dev, "bind path %s failed: %d\n",
+					avs_path_name(path), ret);
 				return AVS_IPC_RET(ret);
 			}
 		}
@@ -1426,7 +1428,8 @@ int avs_path_unbind(struct avs_path *path)
 					     sink->instance_id, binding->sink_pin,
 					     binding->source_pin);
 			if (ret) {
-				dev_err(adev->dev, "unbind path failed: %d\n", ret);
+				dev_err(adev->dev, "unbind path %s failed: %d\n",
+					avs_path_name(path), ret);
 				return AVS_IPC_RET(ret);
 			}
 		}
@@ -1448,7 +1451,7 @@ int avs_path_reset(struct avs_path *path)
 		ret = avs_ipc_set_pipeline_state(adev, ppl->instance_id,
 						 AVS_PPL_STATE_RESET);
 		if (ret) {
-			dev_err(adev->dev, "reset path failed: %d\n", ret);
+			dev_err(adev->dev, "reset path %s failed: %d\n", avs_path_name(path), ret);
 			path->state = AVS_PPL_STATE_INVALID;
 			return AVS_IPC_RET(ret);
 		}
@@ -1507,7 +1510,7 @@ int avs_path_pause(struct avs_path *path)
 		ret = avs_ipc_set_pipeline_state(adev, ppl->instance_id,
 						 AVS_PPL_STATE_PAUSED);
 		if (ret) {
-			dev_err(adev->dev, "pause path failed: %d\n", ret);
+			dev_err(adev->dev, "pause path %s failed: %d\n", avs_path_name(path), ret);
 			path->state = AVS_PPL_STATE_INVALID;
 			return AVS_IPC_RET(ret);
 		}
@@ -1575,7 +1578,7 @@ int avs_path_run(struct avs_path *path, int trigger)
 		ret = avs_ipc_set_pipeline_state(adev, ppl->instance_id,
 						 AVS_PPL_STATE_RUNNING);
 		if (ret) {
-			dev_err(adev->dev, "run path failed: %d\n", ret);
+			dev_err(adev->dev, "run path %s failed: %d\n", avs_path_name(path), ret);
 			path->state = AVS_PPL_STATE_INVALID;
 			return AVS_IPC_RET(ret);
 		}
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index b0796d18c1c4..360cb8125bcc 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -227,15 +227,10 @@ static int avs_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 		return 0;
 
 	ret = avs_path_reset(data->path);
-	if (ret < 0) {
-		dev_err(dai->dev, "reset path failed: %d\n", ret);
+	if (ret < 0)
 		return ret;
-	}
 
-	ret = avs_path_pause(data->path);
-	if (ret < 0)
-		dev_err(dai->dev, "pause path failed: %d\n", ret);
-	return ret;
+	return avs_path_pause(data->path);
 }
 
 static int avs_dai_nonhda_be_hw_params(struct snd_pcm_substream *substream,
@@ -283,14 +278,10 @@ static int avs_dai_nonhda_be_trigger(struct snd_pcm_substream *substream, int cm
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		ret = avs_path_pause(data->path);
-		if (ret < 0) {
-			dev_err(dai->dev, "pause BE path failed: %d\n", ret);
+		if (ret < 0)
 			break;
-		}
 
 		ret = avs_path_run(data->path, AVS_TPLG_TRIGGER_AUTO);
-		if (ret < 0)
-			dev_err(dai->dev, "run BE path failed: %d\n", ret);
 		break;
 
 	case SNDRV_PCM_TRIGGER_SUSPEND:
@@ -300,12 +291,8 @@ static int avs_dai_nonhda_be_trigger(struct snd_pcm_substream *substream, int cm
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_STOP:
 		ret = avs_path_pause(data->path);
-		if (ret < 0)
-			dev_err(dai->dev, "pause BE path failed: %d\n", ret);
 
 		ret2 = avs_path_reset(data->path);
-		if (ret2)
-			dev_err(dai->dev, "reset BE path failed: %d\n", ret2);
 		if (ret2 && !ret)
 			ret = ret2;
 		break;
@@ -510,14 +497,10 @@ static int avs_dai_hda_be_trigger(struct snd_pcm_substream *substream, int cmd,
 		snd_hdac_ext_stream_start(data->link_stream);
 
 		ret = avs_path_pause(data->path);
-		if (ret < 0) {
-			dev_err(dai->dev, "pause BE path failed: %d\n", ret);
+		if (ret < 0)
 			break;
-		}
 
 		ret = avs_path_run(data->path, AVS_TPLG_TRIGGER_AUTO);
-		if (ret < 0)
-			dev_err(dai->dev, "run BE path failed: %d\n", ret);
 		break;
 
 	case SNDRV_PCM_TRIGGER_SUSPEND:
@@ -527,14 +510,10 @@ static int avs_dai_hda_be_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_STOP:
 		ret = avs_path_pause(data->path);
-		if (ret < 0)
-			dev_err(dai->dev, "pause BE path failed: %d\n", ret);
 
 		snd_hdac_ext_stream_clear(data->link_stream);
 
 		ret2 = avs_path_reset(data->path);
-		if (ret2)
-			dev_err(dai->dev, "reset BE path failed: %d\n", ret2);
 		if (ret2 && !ret)
 			ret = ret2;
 		break;
@@ -696,10 +675,8 @@ static int avs_dai_fe_hw_params(struct snd_pcm_substream *substream,
 		goto create_err;
 
 	ret = avs_path_bind(data->path);
-	if (ret < 0) {
-		dev_err(dai->dev, "bind FE <-> BE failed: %d\n", ret);
+	if (ret < 0)
 		goto bind_err;
-	}
 
 	return 0;
 
@@ -727,11 +704,9 @@ static int __avs_dai_fe_hw_free(struct snd_pcm_substream *substream, struct snd_
 	host_stream = data->host_stream;
 
 	ret = avs_path_unbind(data->path);
-	if (ret < 0)
-		dev_err(dai->dev, "unbind FE <-> BE failed: %d\n", ret);
-
 	avs_path_free(data->path);
 	data->path = NULL;
+
 	snd_hdac_stream_cleanup(hdac_stream(host_stream));
 	hdac_stream(host_stream)->prepared = false;
 
@@ -894,15 +869,10 @@ static int avs_dai_fe_trigger(struct snd_pcm_substream *substream, int cmd, stru
 			snd_hdac_stream_wait_drsm(hdac_stream(host_stream));
 
 		ret = avs_path_pause(data->path);
-		if (ret < 0) {
-			dev_err(dai->dev, "pause FE path failed: %d\n", ret);
+		if (ret < 0)
 			break;
-		}
 
 		ret = avs_path_run(data->path, AVS_TPLG_TRIGGER_AUTO);
-		if (ret < 0)
-			dev_err(dai->dev, "run FE path failed: %d\n", ret);
-
 		break;
 
 	case SNDRV_PCM_TRIGGER_SUSPEND:
@@ -912,16 +882,12 @@ static int avs_dai_fe_trigger(struct snd_pcm_substream *substream, int cmd, stru
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_STOP:
 		ret = avs_path_pause(data->path);
-		if (ret < 0)
-			dev_err(dai->dev, "pause FE path failed: %d\n", ret);
 
 		spin_lock_irqsave(&bus->reg_lock, flags);
 		avs_hda_stream_stop(bus, host_stream);
 		spin_unlock_irqrestore(&bus->reg_lock, flags);
 
 		ret2 = avs_path_reset(data->path);
-		if (ret2)
-			dev_err(dai->dev, "reset FE path failed: %d\n", ret2);
 		if (ret2 && !ret)
 			ret = ret2;
 		break;
-- 
2.34.1

