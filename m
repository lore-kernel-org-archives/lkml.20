Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736441;
	b=ykLCw+DVchYs8zULj5BR3ekWXfoMoZ/GpMX20Lbu8cGCh2nkpgZvg1/tU99DFEZb3Q0A
	 ZGKzRrMs7e6Ps/1ovY8Nx8ZoqwBVW+hoLGDNiFDKXxbjaP+GFieWxRSldDarcvIcrtaa1
	 ocscU/XCPo184u34Qgr9Q7t+D+3/kzsCbukxyFKJyOhgqKrhfLaSDFh5YzPvsnatpqYki
	 FdFzKO9zdJOivSH60ZR1PqGhJIK+weWDcPL2hI7WmaXx5/Z/+Et49EGxbd6AX2pafeiuv
	 8xOF5mREI/F3NPtcpyCzlkR1q9y4n8wAbjxIQuqlDW5GVo8xBmGbFEXzzoGhMJKideA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736441;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Npxp4p5T07KYijhNecMA4/tJ2yfqYW/jTLtbwkrGbCM=;
	b=osq8G0Jbu7SKI5JSiKd0KInix5DT2KUZjSkI7vvxzE2cVhtRZ75fUWRyeLtUKc8MJE3+
	 CSWpgCymebrbMVHa13yG+yo1DsVFFntQHFADpBOJKf36MYRRUIBr1MuQCroCnjuNwN60x
	 +sMVUnmZJxs0ccRzOaE8dnEe9rPrj83+P44HprGSxIgNHtWUCMFTcZB+Id/4SO+9E9tE3
	 jN+oWXNUqUWizkAGphqRo8/mVpY8LX0aq/x18vf+prg2C2UraL/oZqSEN8gFQebcM0zGp
	 f8EbKPZAUgx6S2Iv7UkhAtyiaMiLjk9qXA0DQVXgl9urwJTw9twXxsAYsf7fFLTWkGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mCjNbZ8r;
	arc=none smtp.remote-ip=95.215.58.217
Received: from mta1.migadu.com (out-217.mta1.migadu.com [95.215.58.217])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64585606A333
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64585606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mCjNbZ8r
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2kgDEQs9sciOUZarr49aF2BSyjHX1XAByR3ifQfn+ck=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793736438; v=1; x=1794341238;
 b=mCjNbZ8rB81zvzo7QE1NN4xEvipSavCidWtPryd3dqUnYVvJTBJeo7v9UjVPRUqrH4x3gcol
 dy8l3Ok9Mbu0Yq+eC1NiKcMcJEzeeCz8Nv2FXLmNONhb1mJ8LYjXEsszwYmfi8SkjaIgbRT++Kc
 RnrojCHlntCCotPjBCStvJ0I=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2450b0abd35e1e97;
	Tue, 03 Nov 2026 20:07:17 +0000
X-Mizu-Trace-ID: 2450b0abd35e1e97
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
Subject: [PATCH v2 4/5] ASoC: sdw_utils: honor empty DisCo port lists when creating DAI links
Date: Tue,  3 Nov 2026 12:05:38 -0800
Message-ID: <20261103200540.3863272-5-matthew.schwartz@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103200540.3863272-1-matthew.schwartz@linux.dev>
References: <20261103200540.3863272-1-matthew.schwartz@linux.dev>
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

The codec_info tables give each DAI a fixed direction, so a TAS2783
always gets an amp feedback capture link. The ASUS ROG Xbox Ally X20
BIOS declares mipi-sdw-source-port-list as 0 for both of its TAS2783s,
so the capture port has no DisCo properties and every open of the
SmartAmp capture PCM fails in sdw_program_slave_port_params() with
-EINVAL. The PCM is probed at session start, which logs a burst of
transport errors on every boot, and the same failure is reported on the
ASUS ProArt PX13.

Store the effective direction in each endpoint and, for codecs whose
driver takes its ports from the DisCo port lists, drop a direction when
the peripheral declares an empty list for it, and skip the endpoint when
neither direction is left. Other codecs keep the table direction, as
many of their drivers use fixed port masks. Since endpoints in one group
can now differ, the machine drivers take the stream name and DAI link ID
from an endpoint that is part of the stream, and only count and
initialize those endpoints.

Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
---
 include/sound/soc_sdw_utils.h           | 16 +++++++
 sound/soc/amd/acp/acp-sdw-legacy-mach.c |  9 ++--
 sound/soc/amd/acp/acp-sdw-sof-mach.c    |  7 ++-
 sound/soc/intel/boards/sof_sdw.c        |  7 ++-
 sound/soc/sdw_utils/soc_sdw_utils.c     | 60 ++++++++++++++++++++-----
 5 files changed, 76 insertions(+), 23 deletions(-)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 418466438ea1c..be7403c89901b 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -97,6 +97,8 @@ struct asoc_sdw_codec_info {
 	const int aux_num;
 	/* Force AMP-style name_prefix handling (append AMP index) even if MIC/Jack DAIs exist */
 	const bool is_amp;
+	/* The driver takes its ports from the DisCo port lists */
+	const bool disco_ports;
 
 	int (*codec_card_late_probe)(struct snd_soc_card *card);
 
@@ -114,6 +116,7 @@ struct asoc_sdw_endpoint {
 	const char *codec_name;
 	const char *name_prefix;
 	bool include_sidecar;
+	bool direction[2]; /* dai_info direction limited by the DisCo port lists */
 
 	struct asoc_sdw_codec_info *codec_info;
 	const struct asoc_sdw_dai_info *dai_info;
@@ -128,6 +131,19 @@ struct asoc_sdw_dailink {
 	struct list_head endpoints;
 };
 
+/* First endpoint of a DAI link that takes part in the stream */
+static inline struct asoc_sdw_endpoint *
+asoc_sdw_first_endpoint(struct asoc_sdw_dailink *soc_dai, int stream)
+{
+	struct asoc_sdw_endpoint *soc_end;
+
+	list_for_each_entry(soc_end, &soc_dai->endpoints, list)
+		if (soc_end->direction[stream])
+			return soc_end;
+
+	return NULL;
+}
+
 extern struct asoc_sdw_codec_info codec_info_list[];
 int asoc_sdw_get_codec_info_list_count(void);
 
diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
index a8b62817b2344..84b602e12f8ce 100644
--- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
@@ -196,8 +196,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		if (!soc_dai->num_devs[stream])
 			continue;
 
-		soc_end = list_first_entry(&soc_dai->endpoints,
-					   struct asoc_sdw_endpoint, list);
+		soc_end = asoc_sdw_first_endpoint(soc_dai, stream);
 
 		*be_id = soc_end->dai_info->dailink[stream];
 		if (*be_id < 0) {
@@ -262,7 +261,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			return -ENOMEM;
 
 		list_for_each_entry(soc_end, &soc_dai->endpoints, list) {
-			if (!soc_end->dai_info->direction[stream])
+			if (!soc_end->direction[stream])
 				continue;
 
 			/*
@@ -307,7 +306,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		(*dai_links)->ch_maps = codec_maps;
 
 		list_for_each_entry(soc_end, &soc_dai->endpoints, list) {
-			if (soc_end->dai_info->init)
+			if (soc_end->direction[stream] && soc_end->dai_info->init)
 				soc_end->dai_info->init(card, *dai_links,
 							soc_end->codec_info,
 							playback);
@@ -472,7 +471,7 @@ static int soc_card_dai_links_create(struct snd_soc_card *card)
 			continue;
 
 		list_for_each_entry(e, &d->endpoints, list) {
-			if (e->dai_info->direction[SNDRV_PCM_STREAM_CAPTURE] &&
+			if (e->direction[SNDRV_PCM_STREAM_CAPTURE] &&
 			    e->dai_info->dai_type == SOC_SDW_DAI_TYPE_AMP)
 				d->num_devs[SNDRV_PCM_STREAM_CAPTURE]--;
 		}
diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index ec3e1f5f1052c..c3cccb75f2349 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -112,8 +112,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		if (!sof_dai->num_devs[stream])
 			continue;
 
-		sof_end = list_first_entry(&sof_dai->endpoints,
-					   struct asoc_sdw_endpoint, list);
+		sof_end = asoc_sdw_first_endpoint(sof_dai, stream);
 
 		*be_id = sof_end->dai_info->dailink[stream];
 		if (*be_id < 0) {
@@ -177,7 +176,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			return -ENOMEM;
 
 		list_for_each_entry(sof_end, &sof_dai->endpoints, list) {
-			if (!sof_end->dai_info->direction[stream])
+			if (!sof_end->direction[stream])
 				continue;
 
 			int link_num = ffs(sof_end->link_mask) - 1;
@@ -215,7 +214,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		(*dai_links)->ch_maps = codec_maps;
 
 		list_for_each_entry(sof_end, &sof_dai->endpoints, list) {
-			if (sof_end->dai_info->init)
+			if (sof_end->direction[stream] && sof_end->dai_info->init)
 				sof_end->dai_info->init(card, *dai_links,
 							sof_end->codec_info,
 							playback);
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 72fe013fffe86..bb96186146f85 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -939,8 +939,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		if (!sof_dai->num_devs[stream])
 			continue;
 
-		sof_end = list_first_entry(&sof_dai->endpoints,
-					   struct asoc_sdw_endpoint, list);
+		sof_end = asoc_sdw_first_endpoint(sof_dai, stream);
 
 		*be_id = sof_end->dai_info->dailink[stream];
 		if (*be_id < 0) {
@@ -973,7 +972,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			return -ENOMEM;
 
 		list_for_each_entry(sof_end, &sof_dai->endpoints, list) {
-			if (!sof_end->dai_info->direction[stream])
+			if (!sof_end->direction[stream])
 				continue;
 
 			if (cur_link != sof_end->link_mask) {
@@ -1020,7 +1019,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		(*dai_links)->ch_maps = codec_maps;
 
 		list_for_each_entry(sof_end, &sof_dai->endpoints, list) {
-			if (sof_end->dai_info->init)
+			if (sof_end->direction[stream] && sof_end->dai_info->init)
 				sof_end->dai_info->init(card, *dai_links,
 							sof_end->codec_info,
 							playback);
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 7a19de75f32b5..ae14b4be66818 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -248,6 +248,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.part_id = 0x0000, /* TAS2783A */
 		.name_prefix = "tas2783",
 		.is_amp = true,
+		.disco_ports = true,
 		.dais = {
 			{
 				.direction = {true, true},
@@ -2407,6 +2408,32 @@ static int is_sdca_endpoint_present(struct device *dev,
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
@@ -2493,6 +2520,26 @@ int asoc_sdw_parse_sdw_endpoints(struct device *dev,
 
 				adr_end = &adr_dev->endpoints[j];
 				dai_info = &codec_info->dais[adr_end->num];
+
+				if (adr_end->num >= codec_info->dai_num) {
+					dev_err(dev,
+						"%d is too many endpoints for codec: 0x%x\n",
+						adr_end->num, codec_info->part_id);
+					return -EINVAL;
+				}
+
+				for_each_pcm_streams(stream)
+					soc_end->direction[stream] = dai_info->direction[stream] &&
+						(!codec_info->disco_ports ||
+						 asoc_sdw_has_ports(dev, adr_link, i, stream));
+
+				/* no stream can use this endpoint */
+				if (!soc_end->direction[SNDRV_PCM_STREAM_PLAYBACK] &&
+				    !soc_end->direction[SNDRV_PCM_STREAM_CAPTURE]) {
+					(*num_devs)--;
+					continue;
+				}
+
 				soc_dai = asoc_sdw_find_dailink(soc_dais, adr_end);
 
 				/*
@@ -2533,18 +2580,11 @@ int asoc_sdw_parse_sdw_endpoints(struct device *dev,
 					"Add dev: %d, 0x%llx end: %d, dai: %d, %c/%c to %s: %d\n",
 					ffs(adr_link->mask) - 1, adr_dev->adr,
 					adr_end->num, dai_info->dai_type,
-					dai_info->direction[SNDRV_PCM_STREAM_PLAYBACK] ? 'P' : '-',
-					dai_info->direction[SNDRV_PCM_STREAM_CAPTURE] ? 'C' : '-',
+					soc_end->direction[SNDRV_PCM_STREAM_PLAYBACK] ? 'P' : '-',
+					soc_end->direction[SNDRV_PCM_STREAM_CAPTURE] ? 'C' : '-',
 					adr_end->aggregated ? "group" : "solo",
 					adr_end->group_id);
 
-				if (adr_end->num >= codec_info->dai_num) {
-					dev_err(dev,
-						"%d is too many endpoints for codec: 0x%x\n",
-						adr_end->num, codec_info->part_id);
-					return -EINVAL;
-				}
-
 				for_each_pcm_streams(stream) {
 					if (dai_info->direction[stream] &&
 					    dai_info->dailink[stream] < 0) {
@@ -2555,7 +2595,7 @@ int asoc_sdw_parse_sdw_endpoints(struct device *dev,
 						return -EINVAL;
 					}
 
-					if (dai_info->direction[stream]) {
+					if (soc_end->direction[stream]) {
 						num_dais += !soc_dai->num_devs[stream];
 						soc_dai->num_devs[stream]++;
 						soc_dai->link_mask[stream] |= adr_link->mask;
-- 
2.56.0

