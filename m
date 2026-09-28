Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D773132695F;
	Mon, 28 Sep 2026 12:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599995; cv=none; b=BYNxCbGJa/Y5uDW3z4V7M2hPtcJRZEcmBSM22Y8GeosspZQkh8cBxUwwuVM8OT4+buf3l4+nmG2CbcOZeAwL7UGmUMHvt8hfyQh9OeojDQAMk8ZfgNaNpFFemjz20/Bc5nROFgWF+5t9ao7ydlJcu0v4vk+AXhrFQWU44IB21XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599995; c=relaxed/simple;
	bh=nh9vtVwOL3Cgn2nF4nG41XLg2k83uLcXWeU0BQJPkIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IeTclcEV8tlKmXs+QwgnkjfxMLCkj/QRS1ltrOgRSX+Gv7jpxhuJ/+7LH8sYjT5qAhdCjyfy8+998X5IW4C2DKpVzb9YJ9zJ5kyw6ZKzB49OpAdrm3tjc/4JF4C6X7wXbpgkljKVc8zDKteJoc/43o0JzbDJ7vR1MJZNcq1Vi0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OLd0EqXD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OLd0EqXD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBA7Tp2404162;
	Mon, 28 Sep 2026 12:53:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7RQDGtY1dI3TEbuXKT6v6BtPGtVCcL4nnnftA4y1ucA=; b=OLd0EqXDIg//kzWc
	uY3EnlZRIv19HFoYBkxnj1/N0vS5/1Z90EQJ0dS0wyv3uVgogfasDNPLFGOvCMZe
	qzPDv/8zlYvIvj1kf6KDGfsAjyPGJIbaSf8OdeLWjwEU8WkWnhTismLKZNixv2lk
	mgL44OJ5hbpCWNxINDsUWbagB8/bGjhBKJwcaeptr81e9CCKqvc+WKAD757Y9nY5
	3UvubNp7h87MY9MZJpAUZAI6tPp5zn932Um/+wTK1t9NgQFPNF9+MlMETPwPS9ja
	MdDQ7zy7f5ZDqCyp7NLSAqTy5s+IsH9DWjX+uprC5kWuDsc6kQi1O6Oy58U9mbZR
	00mYpw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj6t1j40-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 12:53:04 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68SCpWJF2078248;
	Mon, 28 Sep 2026 12:53:01 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 68SCqvL62080411;
	Mon, 28 Sep 2026 12:53:01 +0000 (GMT)
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:22:59 +0530
Subject: [PATCH v8 09/10] ASoC: qcom: Add Shikra QAIF support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-b4-qaif-shikra-audio-v8-9-ac618057fe85@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1MSBTYWx0ZWRfXxjUPBIZHMyeF
 xSGJBBIQbpcO0UDHwLt4Mt/e32gdCnqhyPS91EktBA0mJEPunqwUVeNKEgez6/HuX20HjqsBlNl
 ICjbiYGx3jGz7aG09P8qXMVy6s0whA4u/9rHVpMag4uiUxiStK4cKresEKJmcuniyM/vaZB6IMC
 4KnRd7xM5OBRNHBc3xxQKLIP557zIHnjWkvhUU0L7gZCf1dybiandWgEA03UzSAUhNTlqDTwsD4
 uctEIZQtDS0YXTeXAp81AX6AybBCE/75AyvWkfQrc0552+sCBOZKraGj4MnHhjBdH6xkaJQjucQ
 fs0Gm39Qr+yC4WZleJdBzBAMIxuNwDGjTj6S5SGWm94L5vnsAzT9IPqahCTNSMQB/tUVE+r6ret
 81WXOCwx4j8Zt1Z5c5Fm81jGqTi0X/7LMPnPVzi5H8daNxS1NGvcAc1gzIvQgSjZcjHRV8empYH
 W6tdFODvqpR/lS2N3Jg==
X-Proofpoint-ORIG-GUID: xx1CJatyLbVgY1OucGO-y8KoKdxCI9Db
X-Authority-Analysis: v=2.4 cv=dZkVTnXe c=1 sm=1 tr=0 ts=6aba6330 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=uD8aj_56PGaHGp0t6EcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: xx1CJatyLbVgY1OucGO-y8KoKdxCI9Db
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1MSBTYWx0ZWRfX0WHEGWdSkhlt
 HnPCaoTXHmEBGUfljWRyIdeL90xFZgfpxRS4s0JweyMt8GGVke5NXZl8phFhhjj67xe5bPYYYWO
 4ZBeucZKriole+BygXtNbaTlNVlW2lQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280051

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
 sound/soc/qcom/qaif-shikra.c | 445 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 458 insertions(+)

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
index 000000000000..2db3995a2de0
--- /dev/null
+++ b/sound/soc/qcom/qaif-shikra.c
@@ -0,0 +1,445 @@
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
+	.rddma_shram_len = 64,
+	.rddma_shram_start_addr = {0, 256},
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

