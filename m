Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3C03C5DA1;
	Mon, 28 Sep 2026 12:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600001; cv=none; b=p6u5GqzziGoVh87XZom1fFpmoxGaSnoHEstO6INrEqKXVlX4S6o0ysxtFU5tm815Oih5n4JClB/loIvzq7Umr1wHYeZuLLwweGC1pfsQ0lXB/fLRKpvhJ4/JV6Ctp/J9JN084ObPtbrtTqiyRXslLor94Ip09mxjFpsUd1r/Kh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600001; c=relaxed/simple;
	bh=b/OFaDIdyvpg2tD6RPfaKEaGH8EOj/QRzdm9sywx2T4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d7dm0SvkS9B9DS5Y8y82fSbonMrRaySMOmAbWwU0HC4NrO+BCjRgC5QBEPN3rpwkAIb59j2eO1QUmhEm+w7zvpkNBd++jf1GZ3cYiTXD8eYgbsFzushdxEtqWGaKXsEU9LLXe6jxqtkLGzhhODPbFKigOmoPVXNwul4b5XVZy+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jQdOLMgX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQdOLMgX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAMMa2294756;
	Mon, 28 Sep 2026 12:53:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yRnmijQ4DcZo4wEnXob3kZrcWq8wSRoTN49GdWDJNX4=; b=jQdOLMgXw9HywoEr
	Owt+DGF1anZaqCjOTlRcYN4WCQB6mKzDmL429TgVVOHaX5I5HrXHttCxZXom0ZEb
	BgTKyPW7Hy8VoYIp78bz0uhnzSEyILt5CJ5kRDe0bJrnVGGYldbOMEkataibBdRI
	hqK0NU2mj2CZHqdXmUwKbMRhepzLpS9UpsrZ2JN56WyGDLNe3LFc9bWOfIOK6ePF
	un4f27W4OfNoizHXbABPGu7lbEKUFj6CB9kWdl73bm/SIi2Q8M0Z8Jv1yBytGlWY
	UKolleM/ptnn7fD0HtTwQ/Av8HHOYU9HpHfpvzE1OXu+RStnuJp+DC44P+hHwErW
	liMwkg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyhubhkeu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 12:53:03 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68SCpWn42078250;
	Mon, 28 Sep 2026 12:53:00 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 68SCqvL42080411;
	Mon, 28 Sep 2026 12:53:00 +0000 (GMT)
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:22:57 +0530
Subject: [PATCH v8 07/10] ASoC: qcom: Add QAIF PCM operations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-b4-qaif-shikra-audio-v8-7-ac618057fe85@oss.qualcomm.com>
References: <20260928-b4-qaif-shikra-audio-v8-0-ac618057fe85@oss.qualcomm.com>
In-Reply-To: <20260928-b4-qaif-shikra-audio-v8-0-ac618057fe85@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: wn6yJXaakLHn6xiDq7jhzhinQBwuD6Lt
X-Authority-Analysis: v=2.4 cv=C7F8WgP+ c=1 sm=1 tr=0 ts=6aba632f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=2Ps45Wj44deZX3ff0YAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: wn6yJXaakLHn6xiDq7jhzhinQBwuD6Lt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1MSBTYWx0ZWRfXxG64OumuI1SC
 HKACrluJU6Pah+feDrOs8pfAyZw2CdEMjZcnnX3zXOUAAClUNW6hs1TLUT+zrVwnG6TqdxoEKlF
 BPcok9i1DHhPXCXmCBuyDE6dsWxzzF3EeroyhIJozwmfrExdmsnYaRBHIVfZgE6BZNgcXShr8Mb
 ti3VdSMvUqfLlR04EFBVROWr9ptYZZZh0nkXtsTsU++grhS/P9EwAa0ZTTufYciMMgOcgWRrpzE
 /NQnky8RoYz7TliLo5SDc9jbfQtTjS+pVnRJwXDpvxarHqqjDt584xg3OA3yUo2DmKB4Ih7PvtD
 mOCYzFD2iLxioGwj85VP3gQ7PkZW/CDSDaUE7dhuqtWQF3FdemO7zMxaeOrC/DdzcZJ08Gs9UOs
 h4i3FZdO9mKWM7zdXExumOMAv75RiJlLUdvMpqHEmWk6SfsgtYVu9WEG6/ifFO1IWzVRDrjQn3o
 JLmXnXHt3r5WoEtSjyw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1MSBTYWx0ZWRfX5s4qDsL+VTge
 E7XiD7EdQF+OwDzYNz8igLtyfY9FkyiPdwfcTm/xp+NAZ44A9p6Qb2HF+dcBGrVnPcDlBFaIqal
 hB9gNLJ4k827q5u/2mmshArFZfTTX/4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280051

Add the PCM platform callbacks needed to use QAIF DAIs for playback
and capture.

Pre-allocate the DMA buffer via snd_pcm_set_fixed_buffer_all() in the
.pcm_new callback. In open(), reserve a stream DMA index and perform
the one-time QAIF hardware initialization. Program the DMA configuration
in hw_params(), set the DMA clock rate and program the DMA base, buffer
and period registers in prepare(), and report the current DMA position
from pointer(). Release all resources in close().

The DMA clocks themselves are prepared and enabled by the CPU DAI
driver's startup and shutdown callbacks.

Support mmap() for CIF and AIF paths.

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 sound/soc/qcom/qaif-platform.c | 464 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 464 insertions(+)

diff --git a/sound/soc/qcom/qaif-platform.c b/sound/soc/qcom/qaif-platform.c
new file mode 100644
index 000000000000..e24c4252825e
--- /dev/null
+++ b/sound/soc/qcom/qaif-platform.c
@@ -0,0 +1,464 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * qaif-platform.c -- ALSA SoC PCM platform driver for the Qualcomm Audio Interface (QAIF)
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/export.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include "qaif-reg.h"
+#include "qaif.h"
+
+#define DRV_NAME "qaif-platform"
+
+/* period: 5ms @ 48kHz/1ch/S16 min, 20ms @ 48kHz/8ch/S32 max */
+#define QAIF_PLATFORM_PERIOD_BYTES_MIN		(48 * 5 * 1 * 2)	/* 480 B */
+#define QAIF_PLATFORM_PERIOD_BYTES_MAX		(48 * 20 * 8 * 4)	/* 30720 B */
+#define QAIF_PLATFORM_PERIODS_MIN		2
+#define QAIF_PLATFORM_PERIODS_MAX		4
+/* QAIF_PLATFORM_PERIODS_MAX * QAIF_PLATFORM_PERIOD_BYTES_MAX = 122880 B */
+#define QAIF_PLATFORM_BUFFER_BYTES_MAX		\
+	(QAIF_PLATFORM_PERIODS_MAX * QAIF_PLATFORM_PERIOD_BYTES_MAX)
+
+/* DMA CFG register bit positions */
+#define QAIF_DMACFG_SHRAM_WM_MASK	GENMASK(11, 0)
+#define QAIF_DMACFG_BURST4_BIT		BIT(18)
+#define QAIF_DMACFG_DYNCLK_BIT		BIT(24)
+
+/* DMA CTL register bit positions */
+#define QAIF_DMACTL_ENABLE_BIT		BIT(0)
+#define QAIF_ALL_CLIENTS_MASK		(QAIF_BITMASK_AIF_RDDMA_WRDMA | \
+					 QAIF_BITMASK_CIF_RDDMA_WRDMA)
+
+static const struct snd_pcm_hardware qaif_platform_hardware = {
+	.info			=	SNDRV_PCM_INFO_MMAP |
+					SNDRV_PCM_INFO_MMAP_VALID |
+					SNDRV_PCM_INFO_INTERLEAVED |
+					SNDRV_PCM_INFO_PAUSE |
+					SNDRV_PCM_INFO_RESUME,
+	.formats		=	SNDRV_PCM_FMTBIT_S16 |
+					SNDRV_PCM_FMTBIT_S24 |
+					SNDRV_PCM_FMTBIT_S32,
+	.rates			=	SNDRV_PCM_RATE_8000_192000,
+	.rate_min		=	8000,
+	.rate_max		=	192000,
+	.channels_min		=	1,
+	.channels_max		=	8,
+	.buffer_bytes_max	=	QAIF_PLATFORM_BUFFER_BYTES_MAX,
+	.period_bytes_min	=	QAIF_PLATFORM_PERIOD_BYTES_MIN,
+	.period_bytes_max	=	QAIF_PLATFORM_PERIOD_BYTES_MAX,
+	.periods_min		=	QAIF_PLATFORM_PERIODS_MIN,
+	.periods_max		=	QAIF_PLATFORM_PERIODS_MAX,
+	.fifo_size		=	0,
+};
+
+static int qaif_map_ee_resource(struct qaif_drv_data *drvdata)
+{
+	const struct qaif_variant *v = drvdata->variant;
+	struct regmap *map = drvdata->audio_qaif_map;
+	int ret;
+
+	ret = regmap_write(map, QAIF_EE_RDDMA_MAP_REG(v), GENMASK(v->num_rddma - 1, 0));
+	if (ret)
+		return ret;
+	ret = regmap_write(map, QAIF_EE_WRDMA_MAP_REG(v), GENMASK(v->num_wrdma - 1, 0));
+	if (ret)
+		return ret;
+	if (v->num_intf > 0) {
+		ret = regmap_write(map, QAIF_EE_INTF_MAP_REG(v), GENMASK(v->num_intf - 1, 0));
+		if (ret)
+			return ret;
+	}
+	ret = regmap_write(map, QAIF_EE_CODEC_RDDMA_MAP_REG(v),
+			   GENMASK(v->num_codec_rddma - 1, 0));
+	if (ret)
+		return ret;
+	return regmap_write(map, QAIF_EE_CODEC_WRDMA_MAP_REG(v),
+			    GENMASK(v->num_codec_wrdma - 1, 0));
+}
+
+static int qaif_map_dma_path(struct qaif_drv_data *drvdata)
+{
+	struct regmap *map = drvdata->audio_qaif_map;
+	int ret;
+
+	if (drvdata->variant->qxm_type != QAIF_QXM0) {
+		dev_err(regmap_get_device(map),
+			"only QXM0 is supported, qxm_type=%d\n",
+			drvdata->variant->qxm_type);
+		return -EINVAL;
+	}
+
+	ret = regmap_write(map, QAIF_RDDMA_MAP_QXM, QAIF_QXM0);
+	if (ret)
+		return ret;
+	ret = regmap_write(map, QAIF_WRDMA_MAP_QXM, QAIF_QXM0);
+	if (ret)
+		return ret;
+	ret = regmap_write(map, QAIF_CDC_RDDMA_MAP_QXM, QAIF_QXM0);
+	if (ret)
+		return ret;
+	return regmap_write(map, QAIF_CDC_WRDMA_MAP_QXM, QAIF_QXM0);
+}
+
+static int qaif_config_shram(struct qaif_drv_data *drvdata)
+{
+	const struct qaif_variant *v = drvdata->variant;
+	struct regmap *map = drvdata->audio_qaif_map;
+	u32 start_addr, shram_len;
+	int ret, i;
+
+	if (v->qxm_type != QAIF_QXM0) {
+		dev_err(regmap_get_device(map),
+			"only QXM0 is supported, qxm_type=%d\n",
+			v->qxm_type);
+		return -EINVAL;
+	}
+
+	start_addr = v->rddma_shram_start_addr[QAIF_AIF_DMA];
+	shram_len = v->rddma_shram_len;
+	for (i = 0; i < v->num_rddma; i++) {
+		ret = regmap_write(map, QAIF_RDDMA_QXM0_SHRAM_ST_ADDR(i),
+				   start_addr + (shram_len * i));
+		if (ret)
+			return ret;
+		ret = regmap_write(map, QAIF_RDDMA_QXM0_SHRAM_LEN(i), shram_len);
+		if (ret)
+			return ret;
+	}
+
+	start_addr = v->wrdma_shram_start_addr[QAIF_AIF_DMA];
+	shram_len = v->wrdma_shram_len;
+	for (i = 0; i < v->num_wrdma; i++) {
+		ret = regmap_write(map, QAIF_WRDMA_QXM0_SHRAM_ST_ADDR(i),
+				   start_addr + (shram_len * i));
+		if (ret)
+			return ret;
+		ret = regmap_write(map, QAIF_WRDMA_QXM0_SHRAM_LEN(i), shram_len);
+		if (ret)
+			return ret;
+	}
+
+	start_addr = v->rddma_shram_start_addr[QAIF_CIF_DMA];
+	shram_len = v->rddma_shram_len;
+	for (i = 0; i < v->num_codec_rddma; i++) {
+		ret = regmap_write(map, QAIF_CDC_RDDMA_QXM0_SHRAM_ST_ADDR(i),
+				   start_addr + (shram_len * i));
+		if (ret)
+			return ret;
+		ret = regmap_write(map, QAIF_CDC_RDDMA_QXM0_SHRAM_LEN(i), shram_len);
+		if (ret)
+			return ret;
+	}
+
+	start_addr = v->wrdma_shram_start_addr[QAIF_CIF_DMA];
+	shram_len = v->wrdma_shram_len;
+	for (i = 0; i < v->num_codec_wrdma; i++) {
+		ret = regmap_write(map, QAIF_CDC_WRDMA_QXM0_SHRAM_ST_ADDR(i),
+				   start_addr + (shram_len * i));
+		if (ret)
+			return ret;
+		ret = regmap_write(map, QAIF_CDC_WRDMA_QXM0_SHRAM_LEN(i), shram_len);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+static int qaif_init(struct snd_soc_component *component)
+{
+	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	if (drvdata->qaif_hw_configured)
+		return 0;
+
+	ret = qaif_config_shram(drvdata);
+	if (ret) {
+		dev_err(component->dev, "failed to config shram: %d\n", ret);
+		return ret;
+	}
+
+	ret = qaif_map_ee_resource(drvdata);
+	if (ret) {
+		dev_err(component->dev, "failed to map EE resources: %d\n", ret);
+		return ret;
+	}
+
+	ret = qaif_map_dma_path(drvdata);
+	if (ret)
+		return ret;
+
+	drvdata->qaif_hw_configured = true;
+	return 0;
+}
+
+static int qaif_platform_pcmops_open(struct snd_soc_component *component,
+				     struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
+	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
+	const struct qaif_variant *v = drvdata->variant;
+	unsigned int dai_id = cpu_dai->driver->id;
+	struct qaif_pcm_data *data;
+	int ret, stream_dma_idx, dma_reg_idx, dir = substream->stream;
+
+	dma_reg_idx = v->get_dma_idx(dai_id);
+	if (dma_reg_idx < 0) {
+		dev_err(component->dev, "invalid DMA register index for DAI %u: %d\n",
+			dai_id, dma_reg_idx);
+		return dma_reg_idx;
+	}
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	runtime->private_data = data;
+
+	mutex_lock(&drvdata->stream_lock);
+	stream_dma_idx = v->alloc_stream_dma_idx(drvdata, dir, dai_id);
+	mutex_unlock(&drvdata->stream_lock);
+	if (stream_dma_idx < 0) {
+		ret = stream_dma_idx;
+		goto err_free_data;
+	}
+
+	data->stream_dma_idx = stream_dma_idx;
+	data->dma_reg_idx = dma_reg_idx;
+
+	if (qaif_is_cif_port(dai_id))
+		WRITE_ONCE(drvdata->cif_substream[stream_dma_idx], substream);
+	else
+		WRITE_ONCE(drvdata->aif_substream[stream_dma_idx], substream);
+
+	snd_soc_set_runtime_hwparams(substream, &qaif_platform_hardware);
+
+	/*
+	 * The DMA buffer/period length registers are programmed in 64-bit
+	 * (8-byte) words, so constrain buffer and period sizes to that step
+	 * to keep the ALSA and hardware sizes identical.
+	 */
+	ret = snd_pcm_hw_constraint_step(runtime, 0,
+					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
+					 BIT(QAIF_DMA_BYTES_TO_WORDS_SHIFT));
+	if (ret >= 0)
+		ret = snd_pcm_hw_constraint_step(runtime, 0,
+						 SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
+						 BIT(QAIF_DMA_BYTES_TO_WORDS_SHIFT));
+	if (ret >= 0)
+		ret = snd_pcm_hw_constraint_integer(runtime,
+						    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0) {
+		dev_err(soc_runtime->dev, "setting constraints failed: %d\n", ret);
+		if (qaif_is_cif_port(dai_id))
+			WRITE_ONCE(drvdata->cif_substream[stream_dma_idx], NULL);
+		else
+			WRITE_ONCE(drvdata->aif_substream[stream_dma_idx], NULL);
+		mutex_lock(&drvdata->stream_lock);
+		v->free_stream_dma_idx(drvdata, stream_dma_idx, dai_id);
+		mutex_unlock(&drvdata->stream_lock);
+		goto err_free_data;
+	}
+	return 0;
+
+err_free_data:
+	kfree(data);
+	return ret;
+}
+
+static int qaif_platform_pcmops_close(struct snd_soc_component *component,
+				      struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
+	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
+	const struct qaif_variant *v = drvdata->variant;
+	struct qaif_pcm_data *data = substream->runtime->private_data;
+	unsigned int dai_id = cpu_dai->driver->id;
+
+	if (qaif_is_cif_port(dai_id))
+		WRITE_ONCE(drvdata->cif_substream[data->stream_dma_idx], NULL);
+	else
+		WRITE_ONCE(drvdata->aif_substream[data->stream_dma_idx], NULL);
+
+	mutex_lock(&drvdata->stream_lock);
+	v->free_stream_dma_idx(drvdata, data->stream_dma_idx, dai_id);
+	mutex_unlock(&drvdata->stream_lock);
+
+	substream->runtime->private_data = NULL;
+	kfree(data);
+	return 0;
+}
+
+static int qaif_platform_pcmops_hw_params(struct snd_soc_component *component,
+					  struct snd_pcm_substream *substream,
+					  struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
+	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
+	const struct qaif_variant *v = drvdata->variant;
+	struct qaif_pcm_data *data = substream->runtime->private_data;
+	unsigned int dai_id = cpu_dai->driver->id;
+	int idx = data->dma_reg_idx;
+	int ret;
+
+	mutex_lock(&drvdata->stream_lock);
+	ret = qaif_init(component);
+	mutex_unlock(&drvdata->stream_lock);
+	if (ret) {
+		dev_err(soc_runtime->dev, "qaif_init failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = regmap_update_bits(drvdata->audio_qaif_map,
+				 qaif_dmacfg_reg(v, idx, substream->stream, dai_id),
+				 QAIF_DMACFG_BURST4_BIT | QAIF_DMACFG_SHRAM_WM_MASK,
+				 QAIF_DMACFG_BURST4_BIT | QAIF_DMACTL_WM_5);
+	if (ret)
+		dev_err(soc_runtime->dev, "error updating DMA CFG: %d\n", ret);
+	return ret;
+}
+
+static int qaif_platform_pcmops_hw_free(struct snd_soc_component *component,
+					struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
+	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
+	const struct qaif_variant *v = drvdata->variant;
+	struct qaif_pcm_data *data = substream->runtime->private_data;
+	unsigned int dai_id = cpu_dai->driver->id;
+	int idx = data->dma_reg_idx;
+	int ret;
+
+	ret = regmap_update_bits(drvdata->audio_qaif_map,
+				 qaif_dmactl_reg(v, idx, substream->stream, dai_id),
+				 QAIF_DMACTL_ENABLE_BIT, 0);
+	if (ret) {
+		dev_err(soc_runtime->dev, "error disabling DMA: %d\n", ret);
+		return ret;
+	}
+
+	ret = regmap_write(drvdata->audio_qaif_map,
+			   qaif_dmacfg_reg(v, idx, substream->stream, dai_id), 0);
+	if (ret)
+		dev_err(soc_runtime->dev, "error clearing DMA CFG: %d\n", ret);
+	return ret;
+}
+
+static int qaif_platform_pcmops_prepare(struct snd_soc_component *component,
+					struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
+	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
+	const struct qaif_variant *v = drvdata->variant;
+	struct regmap *map = drvdata->audio_qaif_map;
+	struct qaif_pcm_data *data = runtime->private_data;
+	unsigned int dai_id = cpu_dai->driver->id;
+	int idx = data->dma_reg_idx;
+	int ret, dir = substream->stream;
+
+	ret = clk_set_rate(drvdata->aud_dma_clk, QAIF_DMA_CLOCK_FREQ);
+	if (ret) {
+		dev_err(soc_runtime->dev, "error setting aud_dma_clk rate: %d\n", ret);
+		return ret;
+	}
+	ret = clk_set_rate(drvdata->aud_dma_mem_clk, QAIF_DMA_CLOCK_FREQ);
+	if (ret) {
+		dev_err(soc_runtime->dev, "error setting aud_dma_mem_clk rate: %d\n", ret);
+		return ret;
+	}
+
+	ret = regmap_write(map, qaif_sid_map_reg(dir, dai_id), drvdata->smmu_csid_bits);
+	if (ret) {
+		dev_err(soc_runtime->dev, "error writing to SID MAP reg: %d\n", ret);
+		return ret;
+	}
+
+	ret = regmap_write(map, qaif_dmabase_reg(v, idx, dir, dai_id),
+			   lower_32_bits(runtime->dma_addr));
+	if (ret) {
+		dev_err(soc_runtime->dev, "error writing to dma base reg: %d\n", ret);
+		return ret;
+	}
+
+	ret = regmap_write(map, qaif_dmabuff_reg(v, idx, dir, dai_id),
+			   (snd_pcm_lib_buffer_bytes(substream) >>
+			    QAIF_DMA_BYTES_TO_WORDS_SHIFT) - 1);
+	if (ret) {
+		dev_err(soc_runtime->dev, "error writing to dma buf reg: %d\n", ret);
+		return ret;
+	}
+
+	ret = regmap_write(map, qaif_dmaper_len_reg(v, idx, dir, dai_id),
+			   (snd_pcm_lib_period_bytes(substream) >>
+			    QAIF_DMA_BYTES_TO_WORDS_SHIFT) - 1);
+	if (ret)
+		dev_err(soc_runtime->dev, "error writing to dma period reg: %d\n", ret);
+	return ret;
+}
+
+static snd_pcm_uframes_t qaif_platform_pcmops_pointer(struct snd_soc_component *component,
+						      struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
+	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
+	const struct qaif_variant *v = drvdata->variant;
+	struct regmap *map = drvdata->audio_qaif_map;
+	struct qaif_pcm_data *data = substream->runtime->private_data;
+	unsigned int dai_id = cpu_dai->driver->id;
+	unsigned int base_addr, curr_addr;
+	int idx = data->dma_reg_idx;
+	int ret, dir = substream->stream;
+
+	ret = regmap_read(map, qaif_dmabase_reg(v, idx, dir, dai_id), &base_addr);
+	if (ret) {
+		dev_err(soc_runtime->dev, "error reading from rdmabase reg: %d\n", ret);
+		return SNDRV_PCM_POS_XRUN;
+	}
+
+	ret = regmap_read(map, qaif_dmacurr_reg(v, idx, dir, dai_id), &curr_addr);
+	if (ret) {
+		dev_err(soc_runtime->dev, "error reading from rdmacurr reg: %d\n", ret);
+		return SNDRV_PCM_POS_XRUN;
+	}
+
+	return bytes_to_frames(substream->runtime,
+			       (curr_addr - base_addr) %
+			       snd_pcm_lib_buffer_bytes(substream));
+}
+
+static int qaif_platform_pcmops_mmap(struct snd_soc_component *component,
+				     struct snd_pcm_substream *substream,
+				     struct vm_area_struct *vma)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	return dma_mmap_coherent(component->dev, vma,
+				 runtime->dma_area, runtime->dma_addr,
+				 runtime->dma_bytes);
+}
+
+static int qaif_platform_pcm_new(struct snd_soc_component *component,
+				 struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_pcm *pcm = rtd->pcm;
+
+	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+					    component->dev,
+					    QAIF_PLATFORM_BUFFER_BYTES_MAX);
+}

-- 
2.34.1

