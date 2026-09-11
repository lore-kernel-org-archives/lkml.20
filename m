Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177583B5820;
	Fri, 11 Sep 2026 09:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118380; cv=none; b=fh8M8LcQMbQM7LK9gqiKkZuRVxmwpx3epednqHq7cVj1G2c86vF/7T9+Iw5n9gwKrReP3EL6NqveE7/tKLk63U2ASFDHzB6a8vyzEX2yw3jwhsqQ+WRnNnf3psTGY6GUsIF7pS7jn84iF69xhKfOTlN0RcFifbrqT/4Y5D8maQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118380; c=relaxed/simple;
	bh=FW/XeAHbrTNr82j0hz8EWpWL1b0PvJT8ATOveejkZjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DsKG3mUkF+XEJ3YiN8oA27ZH0U7nQvfiq0mNASqy3SJ3S4FVwYPkJtRIBFZkSXe9MWJwyaujgdlTkLsatEGxGdzM5Bic1qN6Mg475Oyt5b8kEZd94kdmK//5Ns2ZOFX2CZOvTD0zapG7wrxcQBuki1vB3oAG2XEPIYqIv78MAKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I7KQiR2j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I7KQiR2j"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7ktd63687072;
	Fri, 11 Sep 2026 09:19:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2pY80PvDV6iExYov5wC67KqHfSfKYMJwWVmg4/2GrSw=; b=I7KQiR2jXkm3a6Xl
	IAbRESLMYmiSbPtrQq8+nANwJjFIk8hfD3hYkuEjYvmSaDsV/Meg0mW2nVHedvHc
	gUYnx0wGbZuNoDSFRCYWofvVqLdrav/GeKY3Wrqo59eWuV4LHVIDJucb6eBjqkFE
	I7E0nxi3ksplK4I3EIEM9c2SU9qV6vmBMwATjMfmZb6Q4Ewpej7TkzzyUjndZjdq
	tXfKODI7qsGY+L0HyqlroYaIAyE+gTv4NLASRGJSN3C+LLNi9IjCQl8HSx7ZCRmR
	o8SXUADokTPJgyWxncQ1CnhOt8NqXlnHODx2WZTwA8Q4TgaSOICfKOOqvpVDcHj1
	70pY9Q==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg12kh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 09:19:29 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68B9JMU32870832;
	Fri, 11 Sep 2026 09:19:26 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 68B9JL2f2870824;
	Fri, 11 Sep 2026 09:19:26 +0000 (GMT)
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 14:47:33 +0530
Subject: [PATCH v6 09/10] ASoC: qcom: Add Shikra QAIF support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-qaif-shikra-audio-v6-9-e9addb358201@oss.qualcomm.com>
References: <20260911-b4-qaif-shikra-audio-v6-0-e9addb358201@oss.qualcomm.com>
In-Reply-To: <20260911-b4-qaif-shikra-audio-v6-0-e9addb358201@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: rJqRA7pYiIgAKtz50RTtYb1Wp6TyH6ur
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEyOSBTYWx0ZWRfX67NTxHn/jqcy
 /d+PI5V3xypE8eq7OShIv+vELKEUUSdpJYfbdnCITKx4r4G3FNqmdS0GFhX+KdvNlzUjdHtYcom
 OZBVwAT0/auJOce7WLdX6iWPcMk89V8=
X-Proofpoint-GUID: rJqRA7pYiIgAKtz50RTtYb1Wp6TyH6ur
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa3c7a1 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=uD8aj_56PGaHGp0t6EcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEyOSBTYWx0ZWRfX1A1AUAodZpmA
 VEaKCV1U5QcbH6izu+ebEhovFvpLtNq/enmWzLDXebcrnC87WBPCy9m0FkdWdBUp7JIyM7gWGfZ
 IdVyf1Jb8pFMPp/D4G/YW4AB0tNStvH2sKXLVk8bepNcPPrG/3C5MjbUepKKsAwsIgxhq352EU0
 1LnkZYPLWs0DpccrujinXlThTu5AILXATunbAeU1kFCyD+jKBqYE6KPMzTTKjjj+8vmb5t4vBBa
 4S5m+RiN9NbkUTFZL2/R8ia7A0KTUWxV5Nu7eioVnqXZAPHIZsPq+lCmsKAeEAJZ+uHp3fEP9i9
 jg/JBR39K3rMz2DGcBwuL+PRjhZ/Q4aMUWGO8Ny5thRT63TEd0WaeSC2F7JuS5Eq9cpUJsd+tqv
 987ZOi6PKSuDJ1mTPUt8TJKwdfUElkkYmQDhbKEHiAYaVcUdkILg255mArlhTCFg1Iru3ziv01O
 28KpYjutwIFnz9k4ClQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110129

Add the Shikra variant data for the Qualcomm Audio Interface driver so
the common QAIF code can bind to the Shikra QAIF device and expose the
SoC-specific DAIs.

Provide the Shikra DMA-to-DAI mappings, DMA and SHRAM layout, clock
names, DAI driver data and power-management hooks required by the QAIF
driver. Add the Kconfig symbol and Makefile entries needed to build the
new variant.

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 sound/soc/qcom/Kconfig       |  10 +
 sound/soc/qcom/Makefile      |   3 +
 sound/soc/qcom/qaif-shikra.c | 447 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 460 insertions(+)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index e6e24f3b9922..b7088b1e5cad 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -71,6 +71,16 @@ config SND_SOC_QCOM_COMMON
 config SND_SOC_QCOM_SDW
 	tristate
 
+config SND_SOC_QCOM_QAIF
+	tristate "Qualcomm QAIF audio interface support"
+	depends on COMMON_CLK
+	select REGMAP_MMIO
+	help
+	  Say Y or M to enable the Qualcomm Audio Interface (QAIF) driver
+	  for the Shikra audio platform. QAIF is a DMA-based audio
+	  subsystem that moves PCM data between memory and external serial
+	  audio interfaces (AIF) and internal codec interfaces (CIF).
+
 config SND_SOC_QDSP6_COMMON
 	tristate
 
diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
index 985ce2ae286b..cf50b7a24bcf 100644
--- a/sound/soc/qcom/Makefile
+++ b/sound/soc/qcom/Makefile
@@ -47,3 +47,6 @@ obj-$(CONFIG_SND_SOC_QCOM_OFFLOAD_UTILS) += snd-soc-qcom-offload-utils.o
 
 #DSP lib
 obj-$(CONFIG_SND_SOC_QDSP6) += qdsp6/
+
+snd-soc-qcom-qaif-y := qaif-cpu.o qaif-platform.o qaif-shikra.o
+obj-$(CONFIG_SND_SOC_QCOM_QAIF) += snd-soc-qcom-qaif.o
diff --git a/sound/soc/qcom/qaif-shikra.c b/sound/soc/qcom/qaif-shikra.c
new file mode 100644
index 000000000000..0d5c2baade28
--- /dev/null
+++ b/sound/soc/qcom/qaif-shikra.c
@@ -0,0 +1,447 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * qaif-shikra.c -- ALSA SoC CPU-Platform DAI driver for QTi QAIF
+ */
+
+#include <linux/module.h>
+#include <linux/pm.h>
+#include <sound/pcm.h>
+#include <sound/soc.h>
+#include "qaif.h"
+
+static const struct qaif_dmaidx_dai_map shikra_mi2s_dma_dai_map[] = {
+	{ AIF_MI2S_RX_0, QAIF_DMA_IDX0 },
+	{ AIF_MI2S_RX_1, QAIF_DMA_IDX1 },
+	{ AIF_MI2S_RX_2, QAIF_DMA_IDX2 },
+	{ AIF_MI2S_RX_3, QAIF_DMA_IDX3 },
+	{ AIF_MI2S_TX_0, QAIF_DMA_IDX0 },
+	{ AIF_MI2S_TX_1, QAIF_DMA_IDX1 },
+	{ AIF_MI2S_TX_2, QAIF_DMA_IDX2 },
+	{ AIF_MI2S_TX_3, QAIF_DMA_IDX3 },
+};
+
+static const struct qaif_dmaidx_dai_map shikra_tdm_dma_dai_map[] = {
+	{ AIF_TDM_RX_0, QAIF_DMA_IDX0 },
+	{ AIF_TDM_RX_1, QAIF_DMA_IDX1 },
+	{ AIF_TDM_RX_2, QAIF_DMA_IDX2 },
+	{ AIF_TDM_RX_3, QAIF_DMA_IDX3 },
+	{ AIF_TDM_TX_0, QAIF_DMA_IDX0 },
+	{ AIF_TDM_TX_1, QAIF_DMA_IDX1 },
+	{ AIF_TDM_TX_2, QAIF_DMA_IDX2 },
+	{ AIF_TDM_TX_3, QAIF_DMA_IDX3 },
+};
+
+static const struct qaif_dmaidx_dai_map shikra_cif_dma_dai_map[] = {
+	{ RX_CODEC_DMA_RX_0, QAIF_DMA_IDX0 },
+	{ RX_CODEC_DMA_RX_1, QAIF_DMA_IDX1 },
+	{ VA_CODEC_DMA_TX_0, QAIF_DMA_IDX0 },
+	{ VA_CODEC_DMA_TX_1, QAIF_DMA_IDX1 },
+};
+
+static struct snd_soc_dai_driver shikra_qaif_cpu_dai_driver[] = {
+	{
+		.id = AIF_MI2S_RX_0,
+		.name = "MI2S AIF RX Zero",
+		.playback = {
+			.stream_name = "MI2S AIF RX Zero Playback",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 2,
+		},
+		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
+	}, {
+		.id = AIF_MI2S_TX_0,
+		.name = "MI2S AIF TX Zero",
+		.capture = {
+			.stream_name = "MI2S AIF TX Zero Capture",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 2,
+		},
+		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
+	}, {
+		.id = AIF_TDM_RX_0,
+		.name = "TDM AIF RX Zero",
+		.playback = {
+			.stream_name = "TDM AIF RX Zero Playback",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S24 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 8,
+		},
+		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
+	}, {
+		.id = AIF_TDM_TX_0,
+		.name = "TDM AIF TX Zero",
+		.capture = {
+			.stream_name = "TDM AIF TX Zero Capture",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S24 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 8,
+		},
+		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
+	}, {
+		.id = AIF_MI2S_RX_1,
+		.name = "MI2S AIF RX One",
+		.playback = {
+			.stream_name = "MI2S AIF RX One Playback",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 2,
+		},
+		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
+	}, {
+		.id = AIF_MI2S_TX_1,
+		.name = "MI2S AIF TX One",
+		.capture = {
+			.stream_name = "MI2S AIF TX One Capture",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 2,
+		},
+		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
+	}, {
+		.id = AIF_TDM_RX_1,
+		.name = "TDM AIF RX One",
+		.playback = {
+			.stream_name = "TDM AIF RX One Playback",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S24 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 8,
+		},
+		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
+	}, {
+		.id = AIF_TDM_TX_1,
+		.name = "TDM AIF TX One",
+		.capture = {
+			.stream_name = "TDM AIF TX One Capture",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S24 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 8,
+		},
+		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
+	}, {
+		.id = AIF_MI2S_RX_2,
+		.name = "MI2S AIF RX Two",
+		.playback = {
+			.stream_name = "MI2S AIF RX Two Playback",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 2,
+		},
+		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
+	}, {
+		.id = AIF_MI2S_TX_2,
+		.name = "MI2S AIF TX Two",
+		.capture = {
+			.stream_name = "MI2S AIF TX Two Capture",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 2,
+		},
+		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
+	}, {
+		.id = AIF_TDM_RX_2,
+		.name = "TDM AIF RX Two",
+		.playback = {
+			.stream_name = "TDM AIF RX Two Playback",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S24 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 8,
+		},
+		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
+	}, {
+		.id = AIF_TDM_TX_2,
+		.name = "TDM AIF TX Two",
+		.capture = {
+			.stream_name = "TDM AIF TX Two Capture",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S24 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 8,
+		},
+		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
+	}, {
+		.id = AIF_MI2S_RX_3,
+		.name = "MI2S AIF RX Three",
+		.playback = {
+			.stream_name = "MI2S AIF RX Three Playback",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 2,
+		},
+		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
+	}, {
+		.id = AIF_MI2S_TX_3,
+		.name = "MI2S AIF TX Three",
+		.capture = {
+			.stream_name = "MI2S AIF TX Three Capture",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 2,
+		},
+		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
+	}, {
+		.id = AIF_TDM_RX_3,
+		.name = "TDM AIF RX Three",
+		.playback = {
+			.stream_name = "TDM AIF RX Three Playback",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S24 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 8,
+		},
+		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
+	}, {
+		.id = AIF_TDM_TX_3,
+		.name = "TDM AIF TX Three",
+		.capture = {
+			.stream_name = "TDM AIF TX Three Capture",
+			.formats	= SNDRV_PCM_FMTBIT_S16 |
+					  SNDRV_PCM_FMTBIT_S24 |
+					  SNDRV_PCM_FMTBIT_S32,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.channels_min	= 1,
+			.channels_max	= 8,
+		},
+		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
+	}, {
+		.id = RX_CODEC_DMA_RX_0,
+		.name = "RX CDC DMA RX0",
+		.playback = {
+			.stream_name = "RX CDC DMA RX0 Playback",
+			.formats = SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 1,
+			.channels_max	= 2,
+		},
+		.ops	= &asoc_qcom_qaif_cif_dai_ops,
+	}, {
+		.id = RX_CODEC_DMA_RX_1,
+		.name = "RX CDC DMA RX1",
+		.playback = {
+			.stream_name = "RX CDC DMA RX1 Playback",
+			.formats = SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 1,
+			.channels_max	= 2,
+		},
+		.ops	= &asoc_qcom_qaif_cif_dai_ops,
+	}, {
+		.id = VA_CODEC_DMA_TX_0,
+		.name = "VA CDC DMA TX0",
+		.capture = {
+			.stream_name = "VA CDC DMA TX0 Capture",
+			.formats = SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 1,
+			.channels_max	= 4,
+		},
+		.ops	= &asoc_qcom_qaif_cif_dai_ops,
+	}, {
+		.id = VA_CODEC_DMA_TX_1,
+		.name = "VA CDC DMA TX1",
+		.capture = {
+			.stream_name = "VA CDC DMA TX1 Capture",
+			.formats = SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 1,
+			.channels_max	= 4,
+		},
+		.ops	= &asoc_qcom_qaif_cif_dai_ops,
+	},
+};
+
+static int shikra_qaif_get_dma_idx(unsigned int dai_id)
+{
+	const struct qaif_dmaidx_dai_map *map;
+	int i, size;
+
+	if (dai_id >= AIF_MI2S_RX_0 && dai_id <= AIF_MI2S_TX_12) {
+		map = shikra_mi2s_dma_dai_map;
+		size = ARRAY_SIZE(shikra_mi2s_dma_dai_map);
+	} else if (dai_id >= AIF_TDM_RX_0 && dai_id <= AIF_TDM_TX_12) {
+		map = shikra_tdm_dma_dai_map;
+		size = ARRAY_SIZE(shikra_tdm_dma_dai_map);
+	} else {
+		map = shikra_cif_dma_dai_map;
+		size = ARRAY_SIZE(shikra_cif_dma_dai_map);
+	}
+
+	for (i = 0; i < size; i++) {
+		if (map[i].dai_id == dai_id)
+			return map[i].dma_idx;
+	}
+	return -EINVAL;
+}
+
+static int shikra_qaif_alloc_stream_dma_idx(struct qaif_drv_data *drvdata,
+					    int direction,
+					    unsigned int dai_id)
+{
+	const struct qaif_variant *v = drvdata->variant;
+	int dma_idx, index;
+
+	dma_idx = shikra_qaif_get_dma_idx(dai_id);
+	if (dma_idx < 0)
+		return dma_idx;
+
+	if (qaif_is_aif_port(dai_id)) {
+		index = (direction == SNDRV_PCM_STREAM_PLAYBACK) ?
+			dma_idx : v->wrdma_start + dma_idx;
+		if (index >= QAIF_MAX_AIF_DMA_IDX)
+			return -EINVAL;
+		if (test_and_set_bit(index, &drvdata->aif_dma_idx_bit_map))
+			return -EBUSY;
+	} else if (qaif_is_cif_port(dai_id)) {
+		index = (direction == SNDRV_PCM_STREAM_PLAYBACK) ?
+			dma_idx : v->codec_wrdma_start + dma_idx;
+		if (index >= QAIF_MAX_CIF_DMA_IDX)
+			return -EINVAL;
+		if (test_and_set_bit(index, &drvdata->cif_dma_idx_bit_map))
+			return -EBUSY;
+	} else {
+		return -EINVAL;
+	}
+
+	return index;
+}
+
+static int shikra_qaif_free_stream_dma_idx(struct qaif_drv_data *drvdata,
+					   int index,
+					   unsigned int dai_id)
+{
+	if (qaif_is_aif_port(dai_id))
+		clear_bit(index, &drvdata->aif_dma_idx_bit_map);
+	else
+		clear_bit(index, &drvdata->cif_dma_idx_bit_map);
+	return 0;
+}
+
+static const struct qaif_variant shikra_qaif_data = {
+	.ee = 0,
+
+	.num_rddma = 4,
+	.num_wrdma = 4,
+	.wrdma_start = 4,
+
+	.num_codec_rddma = 4,
+	.num_codec_wrdma = 4,
+	.codec_wrdma_start = 4,
+	.num_intf = 4,
+
+	.rddma_reg_base = 0x8000,
+	.rddma_stride = 0x1000,
+	.codec_rddma_reg_base = 0xc000,
+	.codec_rddma_stride = 0x1000,
+
+	.wrdma_reg_base = 0x11000,
+	.wrdma_stride = 0x1000,
+	.codec_wrdma_reg_base = 0x15000,
+	.codec_wrdma_stride = 0x1000,
+
+	.rddma_irq_reg_base = 0x19000,
+	.rddma_irq_stride = 0x1000,
+	.codec_rddma_irq_reg_base = 0x191A0,
+	.codec_rddma_irq_stride = 0x1000,
+
+	.wrdma_irq_reg_base = 0x19078,
+	.wrdma_irq_stride = 0x1000,
+	.codec_wrdma_irq_reg_base = 0x19290,
+	.codec_wrdma_irq_stride = 0x1000,
+
+	.qxm_type = QAIF_QXM0,
+	.rd_len = 512,
+	.rddma_shram_len = 64,
+	.rddma_shram_start_addr = {0, 256},
+	.wr_len = 512,
+	.wrdma_shram_len = 64,
+	.wrdma_shram_start_addr = {0, 256},
+
+	.clk_name		= (const char * const []) {
+					"lpass_config",
+					"lpass_core_axim",
+					"bus",
+				},
+	.num_clks		= 3,
+
+	.dai_driver		= shikra_qaif_cpu_dai_driver,
+	.num_dai		= ARRAY_SIZE(shikra_qaif_cpu_dai_driver),
+
+	.dai_bit_clk_names	= (const char * const []) {
+					"aif_if0_ibit",
+					"aif_if1_ibit",
+					"aif_if2_ibit",
+					"aif_if3_ibit",
+				},
+	.aif_full_cycle_en	= (const bool []) { false, false, false, false },
+	.aif_ctrl_data_oe	= (const bool []) { false, false, false, false },
+	.aif_loopback_en	= (const bool []) { false, false, false, false },
+	.alloc_stream_dma_idx	= shikra_qaif_alloc_stream_dma_idx,
+	.free_stream_dma_idx	= shikra_qaif_free_stream_dma_idx,
+	.get_dma_idx		= shikra_qaif_get_dma_idx,
+};
+
+static const struct of_device_id shikra_qaif_cpu_device_id[] = {
+	{ .compatible = "qcom,shikra-qaif-cpu", .data = &shikra_qaif_data },
+	{}
+};
+MODULE_DEVICE_TABLE(of, shikra_qaif_cpu_device_id);
+
+static struct platform_driver shikra_qaif_cpu_platform_driver = {
+	.driver = {
+		.name = "shikra-qaif-cpu",
+		.of_match_table = shikra_qaif_cpu_device_id,
+		.pm = pm_ptr(&asoc_qcom_qaif_pm_ops),
+	},
+	.probe = asoc_qcom_qaif_cpu_platform_probe,
+};
+module_platform_driver(shikra_qaif_cpu_platform_driver);
+
+MODULE_DESCRIPTION("Qualcomm Audio Interface (QAIF) Shikra variant driver");
+MODULE_AUTHOR("Harendra Gautam <harendra.gautam@oss.qualcomm.com>");
+MODULE_LICENSE("GPL");

-- 
2.34.1

