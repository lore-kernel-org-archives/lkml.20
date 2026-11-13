Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569549;
	b=U644rYb7xAkSmCh2nFQH7YxJnA44DCcOW2jZUkxPsVz6/ZTQZkjh5GqoQrBgUCf7CkRk
	 juWRQoBiqQNmFViXMH/IZaVlfUPFahKOiZI9JcOQZ5Fbn6oh7lMo/rtg+Tq6uF9ctav4K
	 ov/uFcP+BTPeHvL/Rj1oiz4NolC+n3EOGHNnv4vht9TmUdu09DwXgHfwb1RUvCrCuvfdl
	 Pnu0agzJ32FrvS5m00LM14FYxQYREuufTy3zLStxtA0ZZ2SxdyS/vm6FZtrposghx4AKB
	 PyIPcO9IcSmaLbZrrwP9CA6ODoVKY77rFXVp+H62VCZpvm4JJQQxgBJGpbR/nUz6CfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569549;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JSICzFVXKy0hCEFS1ZhVqEZldn2v4FGge3JD+ZIkwmg=;
	b=0K9jKVg4AjqZlvRh0SBHKWpbzBvdzRAbdxOTxiHd+/8gNaXl0UaACBT6oQuA/1yyiBi4
	 cxklfeCf34x+XWG5uwUdD+opUNR5GZrJzFIq3g7CCEQTJrUGW/dArnB9Kv17VWSo2q1XH
	 lckQDiOSoCE3gdIJaicl8dqKbiJfQ6qCErsllnYf9mZK9jRPEntZT9P+kjJFSI8//s8s+
	 oGbFQk3bbx1DTp2m63y8C7MnNdysncYzFtPc4b43xahhI4o7yw+ua5Dos4f3jWiHrh1Ij
	 c+ELGBH322L6+Q/uytBcHigrWm263izlCA6sD0F4NgMoxBGep+0M8h4XBskxGhubpxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="nL20/nNm";
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1C7606A8A2;
	Fri, 13 Nov 2026 11:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E1C7606A8A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nL20/nNm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794569550; x=1826105550;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1Mgbsp0M26YNcQ37Ko+wYvdA4+JRO58CUFDq7Yma/Ig=;
  b=nL20/nNmbOtZBjWtzSGDfPM2VGwUKQ4iWJI/KBt9kiDvZy4B2I9sKnRq
   D6TKO9RJlc7JGLIYtGrSOb8h/d3+nBjySRjz/T+OhNvYWbkyHNJNpEPUU
   G+QbjEy+w2j9H+qvtyH0ID85qIMehENfVbxKQHPaOohhyQRFsim7QTpuG
   vEgHRfxQVA4lZaBJelV+nup8yrh8wDwoM5gB73wpfLZoOYpgTnnrKFEzS
   mbGIAxQzhRu1UinDjjLxAJVrRlH2SRWn+RmdsdIfNZ5OZtd9eywWN5fSm
   dmd1veg7MQ1Yy2cZBF3jStY+2ZGfxjxpMZd+G8IE/ijWgSxwLTlpXGbAk
   Q==;
X-CSE-ConnectionGUID: uv3e+1KESiWFO7VVR2M9Xg==
X-CSE-MsgGUID: EcSGC5orSXi/XfX7birnhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3246957"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3246957"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 03:31:42 -0800
X-CSE-ConnectionGUID: PV3PLtosS/SOhEL+86wsfg==
X-CSE-MsgGUID: b6+heBlWRi2MoW0juLHzgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9235623"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2026 03:31:39 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 09/11] ASoC: Intel: avs: Streamline naming of hw_params variables
Date: Fri, 13 Nov 2026 12:38:38 +0100
Message-Id: <20261113113840.3067489-10-cezary.rojewski@intel.com>
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

A number of different naming variations are used throughout the file.
The selected pattern is: fe_params for FE DAIs, be_params for BE ones.
Leave 'params' if a function is tied to no particular end.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 42 +++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 360cb8125bcc..b1a8e8b20cc8 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -166,9 +166,9 @@ static void avs_dai_shutdown(struct snd_pcm_substream *substream, struct snd_soc
 }
 
 static int avs_dai_hw_params(struct snd_pcm_substream *substream,
-			     struct snd_pcm_hw_params *fe_hw_params,
-			     struct snd_pcm_hw_params *be_hw_params, struct snd_soc_dai *dai,
-			     int dma_id)
+			     struct snd_pcm_hw_params *fe_params,
+			     struct snd_pcm_hw_params *be_params,
+			     struct snd_soc_dai *dai, int dma_id)
 {
 	struct avs_dma_data *data;
 	struct avs_path *path;
@@ -179,16 +179,16 @@ static int avs_dai_hw_params(struct snd_pcm_substream *substream,
 	dev_dbg(dai->dev, "%s FE hw_params str %p rtd %p",
 		__func__, substream, substream->runtime);
 	dev_dbg(dai->dev, "rate %d chn %d vbd %d bd %d\n",
-		params_rate(fe_hw_params), params_channels(fe_hw_params),
-		params_width(fe_hw_params), params_physical_width(fe_hw_params));
+		params_rate(fe_params), params_channels(fe_params),
+		params_width(fe_params), params_physical_width(fe_params));
 
 	dev_dbg(dai->dev, "%s BE hw_params str %p rtd %p",
 		__func__, substream, substream->runtime);
 	dev_dbg(dai->dev, "rate %d chn %d vbd %d bd %d\n",
-		params_rate(be_hw_params), params_channels(be_hw_params),
-		params_width(be_hw_params), params_physical_width(be_hw_params));
+		params_rate(be_params), params_channels(be_params),
+		params_width(be_params), params_physical_width(be_params));
 
-	path = avs_path_create(data->adev, dma_id, data->template, fe_hw_params, be_hw_params);
+	path = avs_path_create(data->adev, dma_id, data->template, fe_params, be_params);
 	if (IS_ERR(path)) {
 		ret = PTR_ERR(path);
 		dev_err(dai->dev, "create path failed: %d\n", ret);
@@ -200,10 +200,10 @@ static int avs_dai_hw_params(struct snd_pcm_substream *substream,
 }
 
 static int avs_dai_be_hw_params(struct snd_pcm_substream *substream,
-				struct snd_pcm_hw_params *be_hw_params, struct snd_soc_dai *dai,
-				int dma_id)
+				struct snd_pcm_hw_params *be_params,
+				struct snd_soc_dai *dai, int dma_id)
 {
-	struct snd_pcm_hw_params *fe_hw_params = NULL;
+	struct snd_pcm_hw_params *fe_params = NULL;
 	struct snd_soc_pcm_runtime *fe, *be;
 	struct snd_soc_dpcm *dpcm;
 
@@ -211,10 +211,10 @@ static int avs_dai_be_hw_params(struct snd_pcm_substream *substream,
 	/* dpcm_fe_dai_open() guarantees the list is not empty at this point. */
 	for_each_dpcm_fe(be, substream->stream, dpcm) {
 		fe = dpcm->fe;
-		fe_hw_params = &fe->dpcm[substream->stream].hw_params;
+		fe_params = &fe->dpcm[substream->stream].hw_params;
 	}
 
-	return avs_dai_hw_params(substream, fe_hw_params, be_hw_params, dai, dma_id);
+	return avs_dai_hw_params(substream, fe_params, be_params, dai, dma_id);
 }
 
 static int avs_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
@@ -234,7 +234,7 @@ static int avs_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 }
 
 static int avs_dai_nonhda_be_hw_params(struct snd_pcm_substream *substream,
-				       struct snd_pcm_hw_params *hw_params, struct snd_soc_dai *dai)
+				       struct snd_pcm_hw_params *be_params, struct snd_soc_dai *dai)
 {
 	struct avs_dma_data *data;
 
@@ -243,7 +243,7 @@ static int avs_dai_nonhda_be_hw_params(struct snd_pcm_substream *substream,
 		return 0;
 
 	/* Actual port-id comes from topology. */
-	return avs_dai_be_hw_params(substream, hw_params, dai, 0);
+	return avs_dai_be_hw_params(substream, be_params, dai, 0);
 }
 
 static int avs_dai_nonhda_be_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
@@ -401,7 +401,7 @@ static void avs_dai_althda_be_shutdown(struct snd_pcm_substream *substream, stru
 }
 
 static int avs_dai_hda_be_hw_params(struct snd_pcm_substream *substream,
-				    struct snd_pcm_hw_params *hw_params, struct snd_soc_dai *dai)
+				    struct snd_pcm_hw_params *be_params, struct snd_soc_dai *dai)
 {
 	struct avs_dma_data *data;
 
@@ -409,7 +409,7 @@ static int avs_dai_hda_be_hw_params(struct snd_pcm_substream *substream,
 	if (data->path)
 		return 0;
 
-	return avs_dai_be_hw_params(substream, hw_params, dai,
+	return avs_dai_be_hw_params(substream, be_params, dai,
 				    hdac_stream(data->link_stream)->stream_tag - 1);
 }
 
@@ -643,9 +643,9 @@ static void avs_dai_fe_shutdown(struct snd_pcm_substream *substream, struct snd_
 }
 
 static int avs_dai_fe_hw_params(struct snd_pcm_substream *substream,
-				struct snd_pcm_hw_params *hw_params, struct snd_soc_dai *dai)
+				struct snd_pcm_hw_params *fe_params, struct snd_soc_dai *dai)
 {
-	struct snd_pcm_hw_params *be_hw_params = NULL;
+	struct snd_pcm_hw_params *be_params = NULL;
 	struct snd_soc_pcm_runtime *fe, *be;
 	struct snd_soc_dpcm *dpcm;
 	struct avs_dma_data *data;
@@ -666,10 +666,10 @@ static int avs_dai_fe_hw_params(struct snd_pcm_substream *substream,
 	/* dpcm_fe_dai_open() guarantees the list is not empty at this point. */
 	for_each_dpcm_be(fe, substream->stream, dpcm) {
 		be = dpcm->be;
-		be_hw_params = &be->dpcm[substream->stream].hw_params;
+		be_params = &be->dpcm[substream->stream].hw_params;
 	}
 
-	ret = avs_dai_hw_params(substream, hw_params, be_hw_params, dai,
+	ret = avs_dai_hw_params(substream, fe_params, be_params, dai,
 				hdac_stream(host_stream)->stream_tag - 1);
 	if (ret)
 		goto create_err;
-- 
2.34.1

