Received: from mta0.migadu.com (out-134.mta0.migadu.com [91.218.175.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1691B3CF030
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792193095; cv=none; b=kOSanUKRCh9TMAOKkbDuKDi/O0ofcNXg8rRqWDqnsKNij/dCwl8P+ZB1xPrTzyAs0aoKwt0Bws4BB2dTLY4zapgBCzZRTXyquHlmoivLplgosvhVuwLRxRr+ZBSua2iE8XhjE7/heRiKa9Os8/WXt2kPKj0cIk81DiDVCWZ7wPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792193095; c=relaxed/simple;
	bh=OVI3p3krhkoSN7FAxDrVf6Z0Aje2lulzx3UDiTbPl7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZkriYizxGaT7Bb2HLFn7Q5x3e28/9MmoOvwnsser9M9Qv/22eBexSgj5lG6ks/fY/vd+DJu9XK5RNmOcJhpSpPrM7tD7vPNxc5JPohWxhKKFIc7wIg5Hw+QHQR5QiGt/tkvRy9iChPLLICg9cNU7lEJgf/C8Z+PwE/nPwly6QG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ca0pc2m9; arc=none smtp.client-ip=91.218.175.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ca0pc2m9"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OVI3p3krhkoSN7FAxDrVf6Z0Aje2lulzx3UDiTbPl7c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792193091; v=1; x=1792797891;
 b=ca0pc2m9VG0LPza2iqg4k86hTcKH7UvPyMdG5tGTu5PKVWk3fZJcvZPXXC3dpW6pHoozNsOF
 A7q9YbfwrX5BwWDta5bg+BNbbvxO+b71fB/Tt3yb207lVq/YdLmrpU4pHDFh6XrnVtSz4Ejxtaj
 sJM6N7QaI/T0lSwZi5iWz6IM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e753c315e4fb4982;
	Fri, 16 Oct 2026 23:24:51 +0000
X-Mizu-Trace-ID: e753c315e4fb4982
X-Migadu-Flow: FLOW_OUT
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: broonie@kernel.org
Cc: Matthew Schwartz <matthew.schwartz@linux.dev>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] ASoC: sdw_utils: honor empty DisCo port lists when creating DAI links
Date: Fri, 16 Oct 2026 16:24:14 -0700
Message-ID: <20261016232416.2628603-5-matthew.schwartz@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016232416.2628603-1-matthew.schwartz@linux.dev>
References: <20261016232416.2628603-1-matthew.schwartz@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The codec_info tables give each DAI a fixed direction, so a TAS2783
always gets an amp feedback capture link. The ASUS ROG Xbox Ally X20
BIOS declares mipi-sdw-source-port-list as 0 for both of its TAS2783s,
so the capture port has no DisCo properties and every open of the
SmartAmp capture PCM fails in sdw_program_slave_port_params() with
-EINVAL. The PCM is probed at session start, which logs a burst of
transport errors on every boot, and the same failure is reported on the
ASUS ProArt PX13.

Store the effective direction in each endpoint and drop a direction
when the peripheral declares an empty port list for it. A missing port
list keeps the table direction, so platforms that do not describe their
ports are unaffected.

Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
---
 include/sound/soc_sdw_utils.h           |  1 +
 sound/soc/amd/acp/acp-sdw-legacy-mach.c |  2 +-
 sound/soc/amd/acp/acp-sdw-sof-mach.c    |  2 +-
 sound/soc/intel/boards/sof_sdw.c        |  2 +-
 sound/soc/sdw_utils/soc_sdw_utils.c     | 36 ++++++++++++++++++++++---
 5 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 418466438ea1c..8e247a457a7c6 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -114,6 +114,7 @@ struct asoc_sdw_endpoint {
 	const char *codec_name;
 	const char *name_prefix;
 	bool include_sidecar;
+	bool direction[2]; /* dai_info direction limited by the DisCo port lists */
 
 	struct asoc_sdw_codec_info *codec_info;
 	const struct asoc_sdw_dai_info *dai_info;
diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
index a8b62817b2344..d485cee42542c 100644
--- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
@@ -262,7 +262,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			return -ENOMEM;
 
 		list_for_each_entry(soc_end, &soc_dai->endpoints, list) {
-			if (!soc_end->dai_info->direction[stream])
+			if (!soc_end->direction[stream])
 				continue;
 
 			/*
diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index ec3e1f5f1052c..87e495e601bcd 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -177,7 +177,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			return -ENOMEM;
 
 		list_for_each_entry(sof_end, &sof_dai->endpoints, list) {
-			if (!sof_end->dai_info->direction[stream])
+			if (!sof_end->direction[stream])
 				continue;
 
 			int link_num = ffs(sof_end->link_mask) - 1;
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 72fe013fffe86..42c6c262cc80e 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -973,7 +973,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			return -ENOMEM;
 
 		list_for_each_entry(sof_end, &sof_dai->endpoints, list) {
-			if (!sof_end->dai_info->direction[stream])
+			if (!sof_end->direction[stream])
 				continue;
 
 			if (cur_link != sof_end->link_mask) {
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 7a19de75f32b5..126ff1b2dc450 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -2407,6 +2407,32 @@ static int is_sdca_endpoint_present(struct device *dev,
 	return 0;
 }
 
+/* A DisCo port list that is present but empty means the stream cannot run */
+static bool asoc_sdw_has_ports(struct device *dev,
+			       const struct snd_soc_acpi_link_adr *adr_link,
+			       int adr_index, int stream)
+{
+	const char *prop = stream == SNDRV_PCM_STREAM_PLAYBACK ?
+			   "mipi-sdw-sink-port-list" : "mipi-sdw-source-port-list";
+	const char *sdw_codec_name;
+	struct device *sdw_dev;
+	u32 ports;
+	int ret;
+
+	sdw_codec_name = _asoc_sdw_get_codec_name(dev, adr_link, adr_index);
+	if (!sdw_codec_name)
+		return true;
+
+	sdw_dev = bus_find_device_by_name(&sdw_bus_type, NULL, sdw_codec_name);
+	if (!sdw_dev)
+		return true;
+
+	ret = device_property_read_u32(sdw_dev, prop, &ports);
+	put_device(sdw_dev);
+
+	return ret || ports;
+}
+
 int asoc_sdw_parse_sdw_endpoints(struct device *dev,
 				 struct asoc_sdw_mc_private *ctx,
 				 struct snd_soc_aux_dev *soc_aux,
@@ -2529,12 +2555,16 @@ int asoc_sdw_parse_sdw_endpoints(struct device *dev,
 					}
 				}
 
+				for_each_pcm_streams(stream)
+					soc_end->direction[stream] = dai_info->direction[stream] &&
+						asoc_sdw_has_ports(dev, adr_link, i, stream);
+
 				dev_dbg(dev,
 					"Add dev: %d, 0x%llx end: %d, dai: %d, %c/%c to %s: %d\n",
 					ffs(adr_link->mask) - 1, adr_dev->adr,
 					adr_end->num, dai_info->dai_type,
-					dai_info->direction[SNDRV_PCM_STREAM_PLAYBACK] ? 'P' : '-',
-					dai_info->direction[SNDRV_PCM_STREAM_CAPTURE] ? 'C' : '-',
+					soc_end->direction[SNDRV_PCM_STREAM_PLAYBACK] ? 'P' : '-',
+					soc_end->direction[SNDRV_PCM_STREAM_CAPTURE] ? 'C' : '-',
 					adr_end->aggregated ? "group" : "solo",
 					adr_end->group_id);
 
@@ -2555,7 +2585,7 @@ int asoc_sdw_parse_sdw_endpoints(struct device *dev,
 						return -EINVAL;
 					}
 
-					if (dai_info->direction[stream]) {
+					if (soc_end->direction[stream]) {
 						num_dais += !soc_dai->num_devs[stream];
 						soc_dai->num_devs[stream]++;
 						soc_dai->link_mask[stream] |= adr_link->mask;
-- 
2.56.0

