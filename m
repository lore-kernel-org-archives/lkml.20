Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1EB351C1E;
	Mon, 28 Sep 2026 12:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599997; cv=none; b=IRUwzL5J4eiO5S1EMpHVr9/pQ3gbfJYDKvIEGp6k/f742Uf8Ep5ZJ/tyIq+HZxCcSGWRDQ0NDnDXf55DQqPl/g62rF/lrk9xNWse8AiYBKDXNwQbmWoNc875qRS6tsX5eXRmL/qvqzA776lHu2NlDifxbo/SdI8yoJ4c5T1n0M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599997; c=relaxed/simple;
	bh=sPwiHLPW+7KRorLdZWudqOXeQzPvuJb7XidQpW8KtRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rWqdU3Cn20I9vzI3ydvAasQbwBWAngQ6Q5Ftra0RMUrVyx5XGj8CYXWppe/CEVNKeEZFMaXuTLzgNVUschYEIklXrkmkmLOfo2ZPw2thvoViGbPhRcAlsqAAnbTyew/ZL8keARSg0RlxnEehtrOkLOFyCnY9dc0bMpGMGCM4Fog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L9H1fT18; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L9H1fT18"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SC4YSm038647;
	Mon, 28 Sep 2026 12:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jDG0zGNjZ1R+0jI9TJq7BvLkTnKKTz0ALPFLanyU6Gw=; b=L9H1fT18zEyzzim9
	S+15t2Utc8CHBGi6Ni5TQC+mcJ3gn+p5qpoKIj1LnxUkMmIEoxdl05VuvOsovHnu
	VanXF23gAv1QnypJQL7EFIM38aV7rQJCUA28vu9M96afQzWXapnIG94+hbwBGuVX
	KAcq4kDVYEvNlONeGFQXRl9Au3F4AxCIpVzDzR5nnwnW5lxEveICcD6iLnpXMdzT
	D1hlSAXd3De7HjDuvpIYsEa8EYCMqkKn2SdjaFTAcCCgLE5xd8L79zNzCcXZ0PM3
	N/U5NSJMG3L8CPV1DPOZ+vICfwsxjKNxJO5UNpnf7QH/RlPuq/tItYJ1uDjM40h6
	gMj1UA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyqx3859f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 12:53:01 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68SCqwSa2080638;
	Mon, 28 Sep 2026 12:52:58 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 68SCqvKx2080411;
	Mon, 28 Sep 2026 12:52:58 +0000 (GMT)
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:22:52 +0530
Subject: [PATCH v8 02/10] ASoC: qcom: Add QAIF shared data structures and
 variant interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-b4-qaif-shikra-audio-v8-2-ac618057fe85@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1MSBTYWx0ZWRfX3Hjw1GxUF9iZ
 rvXkffQt7tI/CaaonDUaafPjUF9jru4UpDRKrLpeeB5yI2p42EUPqdMDcOA6OYS3Q+vKHbY46WW
 AO7i6jwI/l1pd35gMOkMPHdJc2/bs3n+RZvN6BBLjoxmHKgct0sRS1wb38cZYARDhLekdW8qS3d
 QumePJmvEygpz+ag8D6OAi1dya8HBWhfUk8yOE/JS9yOV7jcii/irO6/ykchEzcQod8A1sXOkxo
 8Gb0AADT6xzRUoXi1rWruBjIMXBufKAj7aDiNTF0KmvrencaVyyA9cOZg/HrGohM5WS9qsogYq1
 Oh4y41H/VFQeVRZv2cx/V72bjwR0NVJJBbLQGXs+oDNuyrQtwlgkaPTvV7nWa3HAH29AZ/4BS0Q
 Lc+uiYIBylwnmcqfoNuTQOhuMxITGAGTdrozRjOs5Xh6ai6ebsdrBextWAc0xw4ibNrIaidzb9K
 HEcqiPwm9bh+ds0pUNQ==
X-Authority-Analysis: v=2.4 cv=f7jdl+yM c=1 sm=1 tr=0 ts=6aba632d cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=saP4gpNJyMUPrehjqOQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: MPHJVkLXq9y9x-dwo5BRbyRterrCeJ7L
X-Proofpoint-GUID: MPHJVkLXq9y9x-dwo5BRbyRterrCeJ7L
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1MSBTYWx0ZWRfXwHXs/sAAGtft
 Qqaz7bMgMVibnuZgjDIFb8hqb3jqjsueRDmuxvYvSj8zpQSu16iPHrElbb57zHn/72wE5En3dGT
 m+CNQ7OKO7rXU2UaF7xbrbSFcMjJthE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280051

Add qaif.h to hold common definitions shared by the QAIF CPU DAI and PCM
platform drivers.

QAIF exposes AIF DMA paths for external audio interfaces and CIF DMA paths
for the internal codec interface. The two drivers need a common place to
describe DMA channel allocation, regmap fields, interrupt dispatch, SHRAM
buffer tracking and per-stream runtime data.

Introduce the QAIF driver data, AIF and CIF register-field descriptions,
IRQ mapping helpers and SoC variant descriptor. The variant descriptor
describes the register layout, DMA channel counts, clock names, DAI table
and platform callbacks used by the QAIF driver code.

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 sound/soc/qcom/qaif.h | 292 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 292 insertions(+)

diff --git a/sound/soc/qcom/qaif.h b/sound/soc/qcom/qaif.h
new file mode 100644
index 000000000000..794d02ef128b
--- /dev/null
+++ b/sound/soc/qcom/qaif.h
@@ -0,0 +1,292 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef SND_SOC_QCOM_QAIF_H
+#define SND_SOC_QCOM_QAIF_H
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+#include <sound/pcm.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
+struct snd_pcm_substream;
+struct snd_soc_dai_driver;
+struct snd_soc_dai_ops;
+struct platform_device;
+
+#define QAIF_CIF_DMA_INTF_ONE_CHANNEL		0x01
+#define QAIF_CIF_DMA_INTF_TWO_CHANNEL		0x03
+#define QAIF_CIF_DMA_INTF_FOUR_CHANNEL		0x0f
+#define QAIF_CIF_DMA_INTF_SIX_CHANNEL		0x3f
+#define QAIF_CIF_DMA_INTF_EIGHT_CHANNEL		0xff
+
+#define QAIF_AIF_SLOT_WIDTH(bits)		((bits) - 1)
+#define QAIF_AIF_SAMPLE_WIDTH(bits)		((bits) - 1)
+
+/* Watermark level 5 encoded as N-1: hardware field value = watermark - 1 */
+#define QAIF_DMACTL_WM_5			4
+
+#define QAIF_DMA_BYTES_TO_WORDS_SHIFT		3
+#define QAIF_DMA_CLOCK_FREQ			38400000
+
+#define QAIF_MAX_AIF_CFG_CNT			4
+#define QAIF_MAX_LANES				8
+
+#define QAIF_MAX_MI2S_PORTS			8
+#define QAIF_MI2S_SLOTS				2
+#define QAIF_MAX_AIF_DMA_IDX			8
+#define QAIF_MAX_CIF_DMA_IDX			8
+
+/* SID map register CSID field (WRDMA_SID/RDDMA_SID), bits [4:0] */
+#define QAIF_CSID_MASK				GENMASK(4, 0)
+
+static inline bool qaif_is_aif_mi2s_port(unsigned int dai_id)
+{
+	return (dai_id >= AIF_MI2S_RX_0 && dai_id <= AIF_MI2S_RX_12) ||
+	       (dai_id >= AIF_MI2S_TX_0 && dai_id <= AIF_MI2S_TX_12);
+}
+
+static inline bool qaif_is_aif_tdm_port(unsigned int dai_id)
+{
+	return (dai_id >= AIF_TDM_RX_0 && dai_id <= AIF_TDM_RX_12) ||
+	       (dai_id >= AIF_TDM_TX_0 && dai_id <= AIF_TDM_TX_12);
+}
+
+static inline bool qaif_is_aif_port(unsigned int dai_id)
+{
+	return qaif_is_aif_mi2s_port(dai_id) || qaif_is_aif_tdm_port(dai_id);
+}
+
+static inline bool qaif_is_cif_port(unsigned int dai_id)
+{
+	return (dai_id >= WSA_CODEC_DMA_RX_0 && dai_id <= RX_CODEC_DMA_RX_7);
+}
+
+enum qxm_sel {
+	QAIF_QXM0 = 0,
+	QAIF_QXM1 = 1,
+};
+
+enum qaif_irq_type {
+	QAIF_AIF_IRQ = 0,
+	QAIF_CIF_IRQ = 1,
+	QAIF_IRQ_TYPE_MAX,
+};
+
+enum qaif_dma_type {
+	QAIF_AIF_DMA = 0,
+	QAIF_CIF_DMA = 1,
+};
+
+struct qaif_aif_config {
+	u32 sync_mode;
+	u32 sync_src;
+	bool invert_sync;
+	u32 sync_delay;
+	u32 slot_width;
+	u32 slot_en_rx_mask;
+	u32 slot_en_tx_mask;
+	bool loopback_en;
+	bool ctrl_data_oe;
+	u32 lane_en_mask;
+	u32 lane_dir_mask;
+	bool full_cycle_en;
+	u32 slot_num;
+};
+
+struct qaif_pcm_data {
+	/* Flat slot in aif_substream[] (or cif_substream[]) used to track
+	 * this stream. Direction-encoded: playback uses the raw DMA channel
+	 * number (0..num_rddma-1), capture adds wrdma_start so playback and
+	 * capture of the same DAI occupy distinct slots.
+	 * Set by alloc_stream_dma_idx(); bounded by QAIF_MAX_AIF/CIF_DMA_IDX.
+	 */
+	int stream_dma_idx;
+	/* Hardware channel number (0-based within its DMA bank) passed to
+	 * register address helpers (e.g. QAIF_RDDMA_CFG_REG(v, chan)).
+	 * Direction-agnostic: the register helpers select RDDMA or WRDMA bank
+	 * based on stream direction, so both directions of the same DAI share
+	 * the same value. Set by get_dma_idx().
+	 */
+	int dma_reg_idx;
+};
+
+/* Named 0-based DMA channel indices used as the dma_idx of a
+ * qaif_dmaidx_dai_map entry, so board tables reference channels by name.
+ */
+enum qaif_dma_idx {
+	QAIF_DMA_IDX0 = 0,
+	QAIF_DMA_IDX1,
+	QAIF_DMA_IDX2,
+	QAIF_DMA_IDX3,
+	QAIF_DMA_IDX4,
+	QAIF_DMA_IDX5,
+	QAIF_DMA_IDX6,
+	QAIF_DMA_IDX7,
+};
+
+/* Associates a DAI ID with its physical DMA channel index on a given
+ * board/variant. @dai_id is the DAI to match; @dma_idx (a qaif_dma_idx value)
+ * is the 0-based hardware channel that get_dma_idx() returns for it.
+ */
+struct qaif_dmaidx_dai_map {
+	unsigned int dai_id;
+	int dma_idx;
+};
+
+struct qaif_drv_data {
+	struct clk *mi2s_bit_clk[QAIF_MAX_MI2S_PORTS];
+	struct clk_bulk_data *clks;
+	int num_clks;
+	struct clk *aud_dma_clk;
+	struct clk *aud_dma_mem_clk;
+	void __iomem *audio_qaif;
+	struct regmap *audio_qaif_map;
+	int audio_qaif_irq;
+	struct mutex stream_lock; /* serializes stream open/close */
+	bool qaif_hw_configured;
+	const struct qaif_variant *variant;
+	struct qaif_aif_config aif_intf_cfg[QAIF_MAX_AIF_CFG_CNT];
+	unsigned long aif_dma_idx_bit_map;
+	unsigned long cif_dma_idx_bit_map;
+	struct snd_pcm_substream *aif_substream[QAIF_MAX_AIF_DMA_IDX];
+	struct snd_pcm_substream *cif_substream[QAIF_MAX_CIF_DMA_IDX];
+	u32 smmu_csid_bits;		/* SMMU stream ID bits from DT iommus cell */
+};
+
+enum qaif_summary_irq_bitmask {
+	QAIF_SUMMARY_BITMASK_AIF_PERIOD_RDDMA		= BIT(0),
+	QAIF_SUMMARY_BITMASK_AIF_UNDERFLOW_RDDMA	= BIT(1),
+	QAIF_SUMMARY_BITMASK_AIF_ERR_RSP_RDDMA		= BIT(2),
+	QAIF_SUMMARY_BITMASK_AIF_PERIOD_WRDMA		= BIT(3),
+	QAIF_SUMMARY_BITMASK_AIF_OVERFLOW_WRDMA		= BIT(4),
+	QAIF_SUMMARY_BITMASK_AIF_ERR_RSP_WRDMA		= BIT(5),
+	QAIF_SUMMARY_BITMASK_CIF_PERIOD_RDDMA		= BIT(18),
+	QAIF_SUMMARY_BITMASK_CIF_UNDERFLOW_RDDMA	= BIT(19),
+	QAIF_SUMMARY_BITMASK_CIF_ERR_RSP_RDDMA		= BIT(20),
+	QAIF_SUMMARY_BITMASK_CIF_PERIOD_WRDMA		= BIT(24),
+	QAIF_SUMMARY_BITMASK_CIF_OVERFLOW_WRDMA		= BIT(25),
+	QAIF_SUMMARY_BITMASK_CIF_ERR_RSP_WRDMA		= BIT(26),
+};
+
+enum qaif_client_status_register_bitmask_info {
+	QAIF_BITMASK_AIF_RDDMA_WRDMA	= GENMASK(5, 0),
+	QAIF_BITMASK_CIF_RDDMA_WRDMA	= GENMASK(26, 18),
+};
+
+struct qaif_irq_map {
+	u32 client_id;
+	u32 mask;
+	/*
+	 * Called from the hard IRQ handler (asoc_platform_qaif_irq()) with
+	 * @status holding the summary interrupt status. Must not sleep.
+	 */
+	irqreturn_t (*client_irq_handler)(struct qaif_drv_data *drvdata, u32 status);
+};
+
+enum qaif_dma_dir {
+	QAIF_DMA_RDDMA = 0,
+	QAIF_DMA_WRDMA = 1,
+};
+
+enum qaif_irq {
+	QAIF_IRQ_PERIOD = 0,
+	QAIF_IRQ_OVERFLOW,
+	QAIF_IRQ_UNDERFLOW,
+	QAIF_IRQ_ERROR,
+};
+
+enum qaif_irq_op {
+	QAIF_IRQ_CLEAR = 0,
+	QAIF_IRQ_ENABLE,
+	QAIF_IRQ_DISABLE,
+};
+
+enum qaif_client_info {
+	QAIF_CLIENT_ID_AIF_DMA = 0,
+	QAIF_CLIENT_ID_CIF_DMA,
+};
+
+struct qaif_variant {
+	u32 ee;				/* Hardware EE index assigned to this driver instance */
+
+	u32 num_rddma;
+	u32 num_wrdma;
+	u32 wrdma_start;
+	u32 num_codec_rddma;
+	u32 num_codec_wrdma;
+	u32 codec_wrdma_start;
+	u32 num_intf;
+
+	u32 rddma_reg_base;
+	u32 rddma_stride;
+	u32 codec_rddma_reg_base;
+	u32 codec_rddma_stride;
+	u32 wrdma_reg_base;
+	u32 wrdma_stride;
+	u32 codec_wrdma_reg_base;
+	u32 codec_wrdma_stride;
+
+	u32 rddma_irq_reg_base;
+	u32 rddma_irq_stride;
+	u32 codec_rddma_irq_reg_base;
+	u32 codec_rddma_irq_stride;
+	u32 wrdma_irq_reg_base;
+	u32 wrdma_irq_stride;
+	u32 codec_wrdma_irq_reg_base;
+	u32 codec_wrdma_irq_stride;
+
+	/* QSB master port selector; only QAIF_QXM0 is supported today */
+	enum qxm_sel qxm_type;
+	/* SHRAM sizes in 64-bit words */
+	u32 rddma_shram_len;
+	/* SHRAM start offsets (in 64-bit words), indexed by enum qaif_dma_type */
+	u32 rddma_shram_start_addr[2];
+	u32 wrdma_shram_len;
+	u32 wrdma_shram_start_addr[2];
+
+	const char * const *clk_name;
+	int num_clks;
+	struct snd_soc_dai_driver *dai_driver;
+	int num_dai;
+	const char * const *dai_bit_clk_names;
+	/*
+	 * Optional per-AIF configuration tables, indexed by AIF interface
+	 * index (0..num_intf-1). NULL if the variant does not use them.
+	 */
+	const bool *aif_full_cycle_en;
+	const bool *aif_ctrl_data_oe;
+	const bool *aif_loopback_en;
+
+	/* Returns a direction-encoded flat slot index for use in
+	 * aif_substream[]/cif_substream[] and the dma_idx_bit_map.
+	 * Playback returns the raw channel number; capture adds wrdma_start (or
+	 * codec_wrdma_start) so both directions of the same DAI get distinct
+	 * slots. Sets the corresponding bit atomically; returns -EBUSY if
+	 * already open, -EINVAL if @dai_id or the computed index is out of range.
+	 */
+	int (*alloc_stream_dma_idx)(struct qaif_drv_data *data, int direction,
+				    unsigned int dai_id);
+	/* Clears the bit set by alloc_stream_dma_idx. */
+	int (*free_stream_dma_idx)(struct qaif_drv_data *data, int chan,
+				   unsigned int dai_id);
+	/* Returns the hardware channel number (0-based within its DMA bank)
+	 * for @dai_id, direction-agnostic. Used as dma_reg_idx.
+	 */
+	int (*get_dma_idx)(unsigned int dai_id);
+};
+
+extern const struct snd_soc_dai_ops asoc_qcom_qaif_cif_dai_ops;
+extern const struct snd_soc_dai_ops asoc_qcom_qaif_aif_cpu_dai_ops;
+
+int asoc_qcom_qaif_cpu_platform_probe(struct platform_device *pdev);
+int asoc_qcom_qaif_platform_register(struct platform_device *pdev);
+extern const struct dev_pm_ops asoc_qcom_qaif_pm_ops;
+
+#endif /* SND_SOC_QCOM_QAIF_H */

-- 
2.34.1

