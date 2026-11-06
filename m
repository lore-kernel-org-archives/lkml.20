Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966939;
	b=EkH/3+3FI19CLQWFK/c86OWkQzqgIVO2KLOpT9xKj4uCxYkVmkL4n23nvcsX4EC9KGC3
	 h02lajF07lEISwGtXxruxpCjFIYCTpKb1krt8jFvPy74NfyYw2yyXDWAa7FsHyfmRnrQ/
	 ELI34vwHbdnG3a9Ptlh52laIasDtw3fv5RnGx76l/fRzFYTqbKsW+udP80nuaArx2P4J+
	 KSldxWEOjxme/AM11YFuBbvW2HhrHwq/zzcub9oupf7ga9N9isTadZdaJTRE2lBIsJ5CD
	 kNW0GCYh7yOaD2j/BuvZvie36PR45LHzbuRyxcDziiCXbuwAcPJG7qZFF4zbakTEglw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966939;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vXVqNotvPQzBmm+iUfHH/DnovOoTHzB1CQmg9RwH5h4=;
	b=OEYntCN2YPu0bZrg7kanmt80kLhvr17FQuZQ3roc6HdBd5qnkkKh+SXCSEUGSi0glEjG
	 4hmIECwy7b7KPdiauvffaQBWxm7y/pfg0NutxPCCSHEZAUkvrc6wHp+tUdo+OoLBBJtuR
	 3nyA6S+MEBu+ybBONkLCAstdutRqAcrN2BCYIM0YY+ekXQp0HoHt+UMdDKUWJmHVIXxE4
	 abrmW1G+GsasHrYTQhUxuZ0bJZSO3CLfkH89YE7rsg6cBziO5axQvasz+16F0CCOKMNEc
	 880mqTX9cCpMFFcU482x/CBXRnkHIXz5+5Gl2zzCzOQ6tjME6Fm9BMC08Sbcbgi/MTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kWamwKyp;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3A5606D82E;
	Fri,  6 Nov 2026 12:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C3A5606D82E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kWamwKyp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793966939; x=1825502939;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fzXUxtz9FKvo7L1UM2kPxuUN0yc0I2VYCpziW/m4LOc=;
  b=kWamwKypipwZsNoX54s2418xDevtEiJCKG16NQnEP5CELxMpy3/TwbqY
   Py0YMqpHv6eVRnD7KkYs/xyvAmACj+d9Y67GBg2rYx8wFNHSWOVFB1sO5
   /Cjwp5/Q7WVoNKgZKBjGk/5tQEujfla6VebGJV87PVZxrjPyvo07nvrX5
   e3dVaKQ4ITRx0s2kpRANSg9bRo+hjwQm2loLu8kq0+WPI2n2nqn0Nb1Wk
   3nko9c7EO5HQeDge7rYKh47WK6J4PhELL4vp2BQfokIzKOL89okK4zODz
   lyH4e6FXotfFywXza008DPAZ5dSvFSxIsmNP+Iawm06fyJFHlsh6KxoJu
   w==;
X-CSE-ConnectionGUID: e82cCJjJQw6DJVt74izv5g==
X-CSE-MsgGUID: ClZyMf9gTkOGGuoF+PFlOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2655406"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2655406"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 04:08:59 -0800
X-CSE-ConnectionGUID: HokVDLavQx+khRZFTjHrWQ==
X-CSE-MsgGUID: IoOOQ222QdehcJNaFW5Yag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7146663"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa004.jf.intel.com with ESMTP; 06 Nov 2026 04:08:56 -0800
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
Subject: [PATCH v3 7/7] ASoC: Intel: avs: SoundWire PCM BE operations
Date: Fri,  6 Nov 2026 13:15:57 +0100
Message-Id: <20261106121557.2338556-8-cezary.rojewski@intel.com>
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

Implement the back-end PCM operations for the SoundWire Link to support
data transfer over SoundWire interface. Most of the actual job is done
by the SoundWire library, thus code added here just invokes them in
correct order.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/Makefile    |   2 +-
 sound/soc/intel/avs/messages.h  |   2 +
 sound/soc/intel/avs/path.c      |   2 +
 sound/soc/intel/avs/pcm.h       |   3 +
 sound/soc/intel/avs/pcm_sdw.c   | 291 ++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/soundwire.h |   7 +
 6 files changed, 306 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/intel/avs/pcm_sdw.c

diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
index 042e8dd232f8..fab7e1ba622d 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -15,7 +15,7 @@ snd-soc-avs-y += probes.o debugfs.o
 endif
 
 ifneq ($(CONFIG_SND_SOC_INTEL_AVS_SOUNDWIRE),)
-snd-soc-avs-y += soundwire.o
+snd-soc-avs-y += soundwire.o pcm_sdw.o
 endif
 
 obj-$(CONFIG_SND_SOC_INTEL_AVS) += snd-soc-avs.o
diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index 55c04b0142ae..d1ffc640dda2 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -750,6 +750,8 @@ enum avs_dma_type {
 	AVS_DMA_DMIC_LINK_INPUT = 11,
 	AVS_DMA_I2S_LINK_OUTPUT = 12,
 	AVS_DMA_I2S_LINK_INPUT = 13,
+	AVS_DMA_SDW_LINK_OUTPUT = 16,
+	AVS_DMA_SDW_LINK_INPUT = 17,
 };
 
 union avs_virtual_index {
diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index a8a2b3484338..60d9245894e7 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -260,6 +260,8 @@ static void avs_init_node_id(union avs_connector_node_id *node_id,
 
 	case AVS_DMA_HDA_LINK_OUTPUT:
 	case AVS_DMA_HDA_LINK_INPUT:
+	case AVS_DMA_SDW_LINK_OUTPUT:
+	case AVS_DMA_SDW_LINK_INPUT:
 		node_id->vindex = te->copier.vindex.val | dma_id;
 		break;
 
diff --git a/sound/soc/intel/avs/pcm.h b/sound/soc/intel/avs/pcm.h
index a5093e62da26..f2620d6f3479 100644
--- a/sound/soc/intel/avs/pcm.h
+++ b/sound/soc/intel/avs/pcm.h
@@ -35,6 +35,9 @@ struct avs_dma_data {
 
 	struct work_struct period_elapsed_work;
 	struct hdac_ext_link *link;
+	struct sdw_stream_runtime *sdw_stream;
+	struct sdw_cdns_pdi *pdi;
+	bool sdw_suspended;
 	struct snd_pcm_substream *substream;
 };
 
diff --git a/sound/soc/intel/avs/pcm_sdw.c b/sound/soc/intel/avs/pcm_sdw.c
new file mode 100644
index 000000000000..578162e9fc4d
--- /dev/null
+++ b/sound/soc/intel/avs/pcm_sdw.c
@@ -0,0 +1,291 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2024-2026 Intel Corporation
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amade@asmblr.net>
+//
+
+#include <linux/device.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_intel.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-component.h>
+#include <sound/soc-dai.h>
+#include "avs.h"
+#include "path.h"
+#include "pcm.h"
+#include "soundwire.h"
+#include "topology.h"
+
+static int avs_sdw_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct sdw_stream_runtime *sdw_stream;
+	struct snd_soc_acpi_mach *mach;
+	struct snd_soc_dai *codec_dai;
+	struct avs_dma_data *data;
+	struct sdw_cdns_pdi *pdi;
+	struct sdw_slave *codec;
+	int dir, ret;
+
+	mach = dev_get_platdata(dai->component->card->dev);
+	codec = mach->pdata;
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		dir = SDW_DATA_DIR_RX;
+	else
+		dir = SDW_DATA_DIR_TX;
+
+	ret = avs_dai_startup(substream, dai);
+	if (ret)
+		return ret;
+
+	sdw_stream = sdw_alloc_stream(substream->name, SDW_STREAM_PCM);
+	if (!sdw_stream) {
+		ret = -ENOMEM;
+		goto err_alloc_stream;
+	}
+
+	pdi = sdw_cdns_assign_pdi(codec->bus, dir);
+	if (!pdi) {
+		ret = -EBUSY;
+		goto err_assign_pdi;
+	}
+
+	/* Fulfill the codec needs by setting the sdw_stream. */
+	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	snd_soc_dai_set_stream(codec_dai, sdw_stream, substream->stream);
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	data->sdw_stream = sdw_stream;
+	data->pdi = pdi;
+	return 0;
+
+err_assign_pdi:
+	sdw_release_stream(sdw_stream);
+err_alloc_stream:
+	avs_dai_shutdown(substream, dai);
+	return ret;
+}
+
+static void avs_sdw_dai_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_acpi_mach *mach;
+	struct snd_soc_dai *codec_dai;
+	struct avs_dma_data *data;
+	struct sdw_slave *codec;
+
+	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	mach = dev_get_platdata(dai->component->card->dev);
+	codec = mach->pdata;
+
+	snd_soc_dai_set_stream(codec_dai, NULL, substream->stream);
+	sdw_cdns_release_pdi(codec->bus, data->pdi);
+	sdw_release_stream(data->sdw_stream);
+	avs_dai_shutdown(substream, dai);
+}
+
+static int avs_sdw_dai_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *hw_params,
+				 struct snd_soc_dai *dai)
+{
+	struct sdw_stream_config sconfig = {0};
+	struct sdw_port_config pconfig = {0};
+	struct snd_soc_acpi_mach *mach;
+	struct avs_dma_data *data;
+	struct sdw_cdns_pdi *pdi;
+	struct sdw_slave *codec;
+	int ret;
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	if (data->path)
+		return 0;
+
+	mach = dev_get_platdata(dai->component->card->dev);
+	codec = mach->pdata;
+	pdi = data->pdi;
+	pdi->ch_count = params_channels(hw_params);
+	pdi->h_ch_num = pdi->ch_count - 1;
+	pdi->l_ch_num = 0;
+	sdw_intel_pdi_config(codec->bus, pdi);
+
+	if (data->sdw_suspended)
+		return avs_dai_be_hw_params(substream, hw_params, dai, pdi->intel_alh_id);
+
+	sconfig.direction = pdi->dir;
+	sconfig.ch_count = pdi->ch_count;
+	sconfig.frame_rate = params_rate(hw_params);
+	sconfig.type = SDW_STREAM_PCM;
+	sconfig.bps = snd_pcm_format_width(params_format(hw_params));
+	pconfig.num = pdi->num;
+	pconfig.ch_mask = (1 << pdi->ch_count) - 1;
+
+	ret = sdw_stream_add_master(codec->bus, &sconfig, &pconfig, 1, data->sdw_stream);
+	if (ret) {
+		sdw_stream_remove_master(codec->bus, data->sdw_stream);
+		return ret;
+	}
+
+	ret = avs_dai_be_hw_params(substream, hw_params, dai, pdi->intel_alh_id);
+	if (ret)
+		sdw_stream_remove_master(codec->bus, data->sdw_stream);
+	return ret;
+}
+
+static int avs_sdw_dai_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct snd_soc_acpi_mach *mach;
+	struct avs_dma_data *data;
+	struct sdw_slave *codec;
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	if (!data->path)
+		return 0;
+
+	mach = dev_get_platdata(dai->component->card->dev);
+	codec = mach->pdata;
+
+	avs_path_reset(data->path);
+	avs_path_free(data->path);
+	data->path = NULL;
+	sdw_deprepare_stream(data->sdw_stream);
+	if (!data->sdw_suspended)
+		sdw_stream_remove_master(codec->bus, data->sdw_stream);
+
+	return 0;
+}
+
+static int avs_sdw_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct avs_dma_data *data;
+	int ret;
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+
+	/*
+	 * There is no guarantee trigger(RESUME) fires, so reset the flag here.
+	 * Ensures there is no sdw_master leak should hw_free() occur without resuming.
+	 */
+	data->sdw_suspended = false;
+
+	ret = sdw_prepare_stream(data->sdw_stream);
+	if (ret) {
+		dev_err(dai->dev, "sdw stream prepare failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = avs_dai_prepare(substream, dai);
+	if (ret)
+		sdw_deprepare_stream(data->sdw_stream);
+	return ret;
+}
+
+static int avs_sdw_dai_trigger(struct snd_pcm_substream *substream, int cmd,
+			       struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct avs_dma_data *data;
+	int ret = 0;
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_RESUME:
+		if (rtd->dai_link->ignore_suspend)
+			break;
+		fallthrough;
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		ret = sdw_enable_stream(data->sdw_stream);
+		if (ret)
+			break;
+
+		ret = avs_path_run(data->path, AVS_TPLG_TRIGGER_AUTO);
+		if (ret)
+			sdw_disable_stream(data->sdw_stream);
+		break;
+
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		if (rtd->dai_link->ignore_suspend)
+			break;
+		data->sdw_suspended = true;
+		fallthrough;
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_STOP:
+		avs_path_pause(data->path);
+
+		ret = sdw_disable_stream(data->sdw_stream);
+		if (ret)
+			dev_err(dai->dev, "disable sdw stream failed: %d\n", ret);
+		break;
+
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static const struct snd_soc_dai_ops avs_sdw_dai_ops = {
+	.startup = avs_sdw_dai_startup,
+	.shutdown = avs_sdw_dai_shutdown,
+	.hw_params = avs_sdw_dai_hw_params,
+	.hw_free = avs_sdw_dai_hw_free,
+	.prepare = avs_sdw_dai_prepare,
+	.trigger = avs_sdw_dai_trigger,
+};
+
+static const struct snd_soc_dai_driver avs_sdw_dai_template = {
+	.playback = {
+		.channels_min	= 1,
+		.channels_max	= 8,
+		.rates		= SNDRV_PCM_RATE_8000_192000 |
+				  SNDRV_PCM_RATE_KNOT,
+		.formats	= SNDRV_PCM_FMTBIT_S16_LE |
+				  SNDRV_PCM_FMTBIT_S32_LE,
+		.subformats	= SNDRV_PCM_SUBFMTBIT_MSBITS_20 |
+				  SNDRV_PCM_SUBFMTBIT_MSBITS_24 |
+				  SNDRV_PCM_SUBFMTBIT_MSBITS_MAX,
+	},
+	.capture = {
+		.channels_min	= 1,
+		.channels_max	= 8,
+		.rates		= SNDRV_PCM_RATE_8000_192000 |
+				  SNDRV_PCM_RATE_KNOT,
+		.formats	= SNDRV_PCM_FMTBIT_S16_LE |
+				  SNDRV_PCM_FMTBIT_S32_LE,
+		.subformats	= SNDRV_PCM_SUBFMTBIT_MSBITS_20 |
+				  SNDRV_PCM_SUBFMTBIT_MSBITS_24 |
+				  SNDRV_PCM_SUBFMTBIT_MSBITS_MAX,
+	},
+	.ops = &avs_sdw_dai_ops,
+};
+
+int avs_register_sdw_component(struct avs_dev *adev, const char *name, u32 link_id)
+{
+	struct snd_soc_dai_driver *dai;
+	struct device *dev = adev->dev;
+
+	dai = devm_kzalloc(dev, sizeof(*dai), GFP_KERNEL);
+	if (!dai)
+		return -ENOMEM;
+
+	memcpy(dai, &avs_sdw_dai_template, sizeof(*dai));
+
+	dai->name = devm_kasprintf(dev, GFP_KERNEL, "avs-sdw%d-pin", link_id);
+	if (!dai->name)
+		return -ENOMEM;
+
+	dai->playback.stream_name = devm_kasprintf(dev, GFP_KERNEL, "%s Tx", dai->name);
+	dai->capture.stream_name = devm_kasprintf(dev, GFP_KERNEL, "%s Rx", dai->name);
+
+	if (!dai->playback.stream_name || !dai->capture.stream_name)
+		return -ENOMEM;
+
+	return avs_register_component(dev, name, &avs_component_driver, dai, 1);
+}
diff --git a/sound/soc/intel/avs/soundwire.h b/sound/soc/intel/avs/soundwire.h
index e57e29ed16bf..b2279613a326 100644
--- a/sound/soc/intel/avs/soundwire.h
+++ b/sound/soc/intel/avs/soundwire.h
@@ -22,6 +22,8 @@ void avs_sdw_enable_irq(struct avs_dev *adev, bool enable);
 void avs_sdw_process_wakeen_event(struct avs_dev *adev);
 irqreturn_t avs_sdw_thread(int irq, struct avs_dev *adev);
 
+int avs_register_sdw_component(struct avs_dev *adev, const char *name, u32 link_id);
+
 #else
 
 static inline int avs_sdw_probe(struct avs_dev *adev)
@@ -51,6 +53,11 @@ static inline irqreturn_t avs_sdw_thread(int irq, struct avs_dev *adev)
 	return IRQ_HANDLED;
 }
 
+static inline int avs_register_sdw_component(struct avs_dev *adev, const char *name, u32 link_id)
+{
+	return 0;
+}
+
 #endif
 
 #endif /* __SOUND_SOC_INTEL_AVS_SOUNDWIRE_H */
-- 
2.34.1

