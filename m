Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6740B48A2BE;
	Mon,  7 Sep 2026 12:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783025; cv=none; b=WdS3dDrjf62zUOXO2FNAQdQvVwf7+/pr6KCSTQItiVeAl3X9BYRr5OQwWWJGYacvOSQGbaktLdin+t1gk4jKBootToDFcfMLBFO5//DbvxenBF74v6xAUxdO0Zp5r+9TfAPJXQZJoITRSqnGuUsjOxgjUEcuok5LQpuia/mKLB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783025; c=relaxed/simple;
	bh=vuu9ZqQuFlaW1nI36kry3EYtm9lf8zEWif0bEZSWDWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I1DfgoFAz6TQAXml4GE5aE3kCxI+zNEzVe02Z80/bNel7dp50xsgrNU4GW/vuKw8eNcAwAhfenB29G5QJPmepWf9gDaxH99HLwZBOxXf+WbAL7RFy1JpuTHdfEAKRNwKTLir05h/voKir2IaAWC7O2zSSMdctEMWyCw6FEPapCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SRWkp++K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SRWkp++K"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AmujZ3349035;
	Mon, 7 Sep 2026 12:09:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q+yPpTBmdAIHECbKm20MKHGZ1Jiv6J2XNI1hva85LqI=; b=SRWkp++K60Xpafd9
	YRAXz48ZPAd88BFsBz+kWMgee6TMnr3Am4n0A4NhSE8d9XPbZYEDHX1WCXBTcY+d
	akRX2rhU5phVrkBmW4UjVD98/bm2AoHPsva/t7PSCVQ5vfS7z2pB1iBcSmNfj07F
	u5XPw8V89wbetAD4gvxhTnJyci5ub16E9lnjXIpXlZuoRjkqOJ8AqeRecX21KNJD
	OG54Xypo6tzi7tx832rrejbHf/NKKaz+AkS5vIESgsJpJLG+QMmHfBpRqip1PqPP
	WM4HHyJLRNIMlbl+1hOlKZp9ZfI0WCYvG93mpnsKt//60r2tsXZopMCqUtOXsPnO
	zGt2LQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx0pe8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 07 Sep 2026 12:09:41 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 687C9aC83932923;
	Mon, 7 Sep 2026 12:09:38 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 687C9XQZ3932854;
	Mon, 07 Sep 2026 12:09:38 +0000 (GMT)
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 17:39:33 +0530
Subject: [PATCH v5 08/10] ASoC: qcom: Add QAIF IRQ handling, suspend/resume
 and platform register
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-b4-qaif-shikra-audio-v5-8-6d8ad9ba5c9f@oss.qualcomm.com>
References: <20260907-b4-qaif-shikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com>
In-Reply-To: <20260907-b4-qaif-shikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9ea985 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=o7TJiAN18BN_QPpExZUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 6i41GPBNUctR8FK9QjzhON3u9u3UnmF1
X-Proofpoint-ORIG-GUID: 6i41GPBNUctR8FK9QjzhON3u9u3UnmF1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzNCBTYWx0ZWRfX4YGt/V1HrkKO
 xF0js1rNO9h40G1t0+CR2xbKLM62+5d8zMP7BoyMHd5WuvTmmPoVRNnW6vd3dkawaM1Z1aUXzjI
 ATMjyL8qr8xKAHuXxsRtG6misL6uFq0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzNCBTYWx0ZWRfX0JwhLM0msHrM
 xFqr8RjZ0yq5dWvs44oQcaD/64v1S3kMo/9OQgGAvsdXCvNeaE4cvPDX+baHCz/DdQOB/k6B5rX
 oy1hwh4n8P31f5iivptLyOW/IfwgRx2stYc3Dnz8DaTN4vLvwLhFIrOIVtAtMix6DqJf0QRShi1
 XP2/BEvhq1QYv+z6JyDPLtsxjvKxeTEYJgW7MJJkGh4AzXdDzsgCZnB4WAblwYtM5OtlMsK6umK
 LpwDOvnEY5riRLIh2Sn2iq1Quy5JKEYelnt68RKyfF8gAuTajswpRI+uOH3l10XzWFGKhgjfFUo
 q24gcY16ulzNde7/QGQnivII8Jspyqe+4tXcGN1sL/BKI0+wkIn8phWg2q+qOc86W+0NXIdweQw
 tLvf3yY7lUq15TS2Khz7X9Ed1bQ+p9pzfjrb+BXKR5km2MWWBdWEYLMiZH10X9bd32f6RNMSKpi
 VUSx3Ek29g7UtrMQZXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070134

Finish the QAIF PCM platform support so streams can be registered, started,
stopped and serviced by DMA interrupts.

Register the ASoC component, request the QAIF interrupt and add trigger
handling to enable or disable DMA and its interrupt sources. Dispatch the
top-level IRQ status to the AIF and CIF DMA handlers, report period elapsed
events to ALSA, warn on xrun conditions and stop the stream on bus errors.

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 sound/soc/qcom/qaif-platform.c | 392 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 392 insertions(+)

diff --git a/sound/soc/qcom/qaif-platform.c b/sound/soc/qcom/qaif-platform.c
index a64bbd7f6fe5..1da50a834b78 100644
--- a/sound/soc/qcom/qaif-platform.c
+++ b/sound/soc/qcom/qaif-platform.c
@@ -534,3 +534,395 @@ static int qaif_platform_copy(struct snd_soc_component *component,
 
 	return (copied != bytes) ? -EFAULT : 0;
 }
+
+static int qaif_platform_irq_op(struct qaif_drv_data *drvdata, int dir,
+				enum qaif_irq_type irq_type, int idx,
+				enum qaif_irq_op op)
+{
+	const struct qaif_variant *v = drvdata->variant;
+	struct regmap *map = drvdata->audio_qaif_map;
+	unsigned int bit = BIT(idx);
+	unsigned int val = op == QAIF_IRQ_ENABLE ? bit : 0;
+	u32 per_reg, err_reg, xrun_reg;
+	int ret;
+
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+		per_reg = op == QAIF_IRQ_CLEAR ? QAIF_EE_RDDMA_PERIOD_IRQ_CLR_REG(v, irq_type)
+					       : QAIF_EE_RDDMA_PERIOD_IRQ_EN_REG(v, irq_type);
+		xrun_reg = op == QAIF_IRQ_CLEAR ? QAIF_EE_RDDMA_UF_IRQ_CLR_REG(v, irq_type)
+						: QAIF_EE_RDDMA_UF_IRQ_EN_REG(v, irq_type);
+		err_reg = op == QAIF_IRQ_CLEAR ? QAIF_EE_RDDMA_ERR_RSP_IRQ_CLR_REG(v, irq_type)
+					       : QAIF_EE_RDDMA_ERR_RSP_IRQ_EN_REG(v, irq_type);
+	} else {
+		per_reg = op == QAIF_IRQ_CLEAR ? QAIF_EE_WRDMA_PERIOD_IRQ_CLR_REG(v, irq_type)
+					       : QAIF_EE_WRDMA_PERIOD_IRQ_EN_REG(v, irq_type);
+		xrun_reg = op == QAIF_IRQ_CLEAR ? QAIF_EE_WRDMA_OF_IRQ_CLR_REG(v, irq_type)
+						: QAIF_EE_WRDMA_OF_IRQ_EN_REG(v, irq_type);
+		err_reg = op == QAIF_IRQ_CLEAR ? QAIF_EE_WRDMA_ERR_RSP_IRQ_CLR_REG(v, irq_type)
+					       : QAIF_EE_WRDMA_ERR_RSP_IRQ_EN_REG(v, irq_type);
+	}
+
+	if (op == QAIF_IRQ_CLEAR) {
+		ret = regmap_write(map, per_reg, bit);
+		if (ret)
+			return ret;
+		ret = regmap_write(map, xrun_reg, bit);
+		if (ret)
+			return ret;
+		return regmap_write(map, err_reg, bit);
+	}
+
+	ret = regmap_write_bits(map, per_reg, bit, val);
+	if (ret)
+		return ret;
+	ret = regmap_write_bits(map, xrun_reg, bit, val);
+	if (ret)
+		return ret;
+	return regmap_write_bits(map, err_reg, bit, val);
+}
+
+static int qaif_platform_pcmops_trigger(struct snd_soc_component *component,
+					struct snd_pcm_substream *substream,
+					int cmd)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
+	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
+	const struct qaif_variant *v = drvdata->variant;
+	struct qaif_pcm_data *data = substream->runtime->private_data;
+	unsigned int dai_id = cpu_dai->driver->id;
+	enum qaif_irq_type irq_type = qaif_is_cif_port(dai_id) ? QAIF_CIF_IRQ : QAIF_AIF_IRQ;
+	struct regmap *map = drvdata->audio_qaif_map;
+	int idx = data->dma_reg_idx;
+	int ret;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		ret = qaif_platform_irq_op(drvdata, substream->stream, irq_type,
+					   idx, QAIF_IRQ_CLEAR);
+		if (ret) {
+			dev_err(soc_runtime->dev, "error clearing irq regs: %d\n", ret);
+			return ret;
+		}
+		ret = regmap_update_bits(map,
+					 qaif_dmacfg_reg(v, idx, substream->stream, dai_id),
+					 QAIF_DMACFG_DYNCLK_BIT, QAIF_DMACFG_DYNCLK_BIT);
+		if (ret) {
+			dev_err(soc_runtime->dev, "error enabling dma_dynclk: %d\n", ret);
+			return ret;
+		}
+		ret = regmap_update_bits(map,
+					 qaif_dmactl_reg(v, idx, substream->stream, dai_id),
+					 QAIF_DMACTL_ENABLE_BIT, QAIF_DMACTL_ENABLE_BIT);
+		if (ret) {
+			dev_err(soc_runtime->dev, "error enabling DMA: %d\n", ret);
+			return ret;
+		}
+		ret = qaif_platform_irq_op(drvdata, substream->stream, irq_type,
+					   idx, QAIF_IRQ_ENABLE);
+		if (ret)
+			dev_err(soc_runtime->dev, "error enabling irq regs: %d\n", ret);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		ret = regmap_update_bits(map,
+					 qaif_dmactl_reg(v, idx, substream->stream, dai_id),
+					 QAIF_DMACTL_ENABLE_BIT, 0);
+		if (ret) {
+			dev_err(soc_runtime->dev, "error disabling DMA: %d\n", ret);
+			return ret;
+		}
+		ret = regmap_update_bits(map,
+					 qaif_dmacfg_reg(v, idx, substream->stream, dai_id),
+					 QAIF_DMACFG_DYNCLK_BIT, 0);
+		if (ret)
+			dev_err(soc_runtime->dev, "error disabling dma_dynclk: %d\n", ret);
+		ret = qaif_platform_irq_op(drvdata, substream->stream, irq_type,
+					   idx, QAIF_IRQ_DISABLE);
+		if (ret)
+			dev_err(soc_runtime->dev, "error disabling irq regs: %d\n", ret);
+		break;
+	default:
+		return -EINVAL;
+	}
+	return ret;
+}
+
+static int qaif_platform_pcmops_sync_stop(struct snd_soc_component *component,
+					  struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
+	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
+	struct qaif_pcm_data *data = substream->runtime->private_data;
+	unsigned int dai_id = cpu_dai->driver->id;
+	enum qaif_irq_type irq_type = qaif_is_cif_port(dai_id) ? QAIF_CIF_IRQ : QAIF_AIF_IRQ;
+	int idx = data->dma_reg_idx;
+	int ret;
+
+	synchronize_irq(drvdata->audio_qaif_irq);
+	ret = qaif_platform_irq_op(drvdata, substream->stream, irq_type,
+				   idx, QAIF_IRQ_CLEAR);
+	if (ret)
+		dev_err(soc_runtime->dev, "error clearing irq regs: %d\n", ret);
+	return ret;
+}
+
+static irqreturn_t qaif_process_dma_irq(struct qaif_drv_data *drvdata,
+					u32 stat_reg_addr,
+					u32 clr_reg_addr,
+					enum qaif_irq_type irq_type,
+					enum qaif_dma_dir dma_type,
+					enum qaif_irq irq,
+					struct snd_pcm_substream **substream)
+{
+	const struct qaif_variant *v = drvdata->variant;
+	unsigned int reg = 0;
+	int dma_idx, stream_dma_idx, rv, num_dma, stream_offset, array_size;
+	u32 mask;
+	struct snd_pcm_substream *ss;
+
+	stream_offset = (dma_type == QAIF_DMA_WRDMA) ?
+		((irq_type == QAIF_AIF_IRQ) ? v->wrdma_start : v->codec_wrdma_start) : 0;
+	num_dma = (dma_type == QAIF_DMA_WRDMA) ?
+		((irq_type == QAIF_AIF_IRQ) ? v->num_wrdma : v->num_codec_wrdma) :
+		((irq_type == QAIF_AIF_IRQ) ? v->num_rddma : v->num_codec_rddma);
+	if (!num_dma)
+		return IRQ_NONE;
+
+	array_size = (irq_type == QAIF_AIF_IRQ) ?
+		QAIF_MAX_AIF_DMA_IDX : QAIF_MAX_CIF_DMA_IDX;
+	if (stream_offset + num_dma > array_size) {
+		dev_err(regmap_get_device(drvdata->audio_qaif_map),
+			"DMA index range %d+%d exceeds substream table %d\n",
+			stream_offset, num_dma, array_size);
+		return IRQ_NONE;
+	}
+	mask = GENMASK(num_dma - 1, 0);
+
+	rv = regmap_read(drvdata->audio_qaif_map, stat_reg_addr, &reg);
+	if (rv) {
+		dev_err_ratelimited(regmap_get_device(drvdata->audio_qaif_map),
+				    "error reading stat reg 0x%x: %d\n", stat_reg_addr, rv);
+		return IRQ_NONE;
+	}
+
+	if (!(reg & mask)) {
+		dev_warn_ratelimited(regmap_get_device(drvdata->audio_qaif_map),
+				     "spurious IRQ: stat reg 0x%x status 0x%x mask 0x%x\n",
+				     stat_reg_addr, reg, mask);
+		return IRQ_NONE;
+	}
+
+	if (regmap_write(drvdata->audio_qaif_map, clr_reg_addr, reg & mask))
+		return IRQ_NONE;
+
+	for (dma_idx = 0; dma_idx < num_dma; dma_idx++) {
+		stream_dma_idx = dma_idx + stream_offset;
+		ss = READ_ONCE(substream[stream_dma_idx]);
+		if (!(reg & BIT(dma_idx)) || !ss)
+			continue;
+		switch (irq) {
+		case QAIF_IRQ_PERIOD:
+			snd_pcm_period_elapsed(ss);
+			break;
+		case QAIF_IRQ_OVERFLOW:
+		case QAIF_IRQ_UNDERFLOW:
+			dev_warn_ratelimited(regmap_get_device(drvdata->audio_qaif_map),
+					     "QAIF DMA xRun\n");
+			snd_pcm_stop_xrun(ss);
+			break;
+		case QAIF_IRQ_ERROR:
+			snd_pcm_stop_xrun(ss);
+			dev_err_ratelimited(regmap_get_device(drvdata->audio_qaif_map),
+					    "QAIF bus error\n");
+			break;
+		}
+	}
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t qaif_aif_irq_handler(struct qaif_drv_data *drvdata, u32 status)
+{
+	const struct qaif_variant *v = drvdata->variant;
+	struct snd_pcm_substream **ss = drvdata->aif_substream;
+	irqreturn_t ret = IRQ_NONE;
+
+	if (status & QAIF_SUMMARY_BITMASK_AIF_PERIOD_RDDMA)
+		ret |= qaif_process_dma_irq(drvdata,
+					    QAIF_EE_RDDMA_PERIOD_IRQ_STAT_REG(v, QAIF_AIF_IRQ),
+					    QAIF_EE_RDDMA_PERIOD_IRQ_CLR_REG(v, QAIF_AIF_IRQ),
+					    QAIF_AIF_IRQ, QAIF_DMA_RDDMA, QAIF_IRQ_PERIOD, ss);
+	if (status & QAIF_SUMMARY_BITMASK_AIF_PERIOD_WRDMA)
+		ret |= qaif_process_dma_irq(drvdata,
+					    QAIF_EE_WRDMA_PERIOD_IRQ_STAT_REG(v, QAIF_AIF_IRQ),
+					    QAIF_EE_WRDMA_PERIOD_IRQ_CLR_REG(v, QAIF_AIF_IRQ),
+					    QAIF_AIF_IRQ, QAIF_DMA_WRDMA, QAIF_IRQ_PERIOD, ss);
+	if (status & QAIF_SUMMARY_BITMASK_AIF_OVERFLOW_WRDMA)
+		ret |= qaif_process_dma_irq(drvdata,
+					    QAIF_EE_WRDMA_OF_IRQ_STAT_REG(v, QAIF_AIF_IRQ),
+					    QAIF_EE_WRDMA_OF_IRQ_CLR_REG(v, QAIF_AIF_IRQ),
+					    QAIF_AIF_IRQ, QAIF_DMA_WRDMA, QAIF_IRQ_OVERFLOW, ss);
+	if (status & QAIF_SUMMARY_BITMASK_AIF_UNDERFLOW_RDDMA)
+		ret |= qaif_process_dma_irq(drvdata,
+					    QAIF_EE_RDDMA_UF_IRQ_STAT_REG(v, QAIF_AIF_IRQ),
+					    QAIF_EE_RDDMA_UF_IRQ_CLR_REG(v, QAIF_AIF_IRQ),
+					    QAIF_AIF_IRQ, QAIF_DMA_RDDMA, QAIF_IRQ_UNDERFLOW, ss);
+	if (status & QAIF_SUMMARY_BITMASK_AIF_ERR_RSP_RDDMA)
+		ret |= qaif_process_dma_irq(drvdata,
+					    QAIF_EE_RDDMA_ERR_RSP_IRQ_STAT_REG(v, QAIF_AIF_IRQ),
+					    QAIF_EE_RDDMA_ERR_RSP_IRQ_CLR_REG(v, QAIF_AIF_IRQ),
+					    QAIF_AIF_IRQ, QAIF_DMA_RDDMA, QAIF_IRQ_ERROR, ss);
+	if (status & QAIF_SUMMARY_BITMASK_AIF_ERR_RSP_WRDMA)
+		ret |= qaif_process_dma_irq(drvdata,
+					    QAIF_EE_WRDMA_ERR_RSP_IRQ_STAT_REG(v, QAIF_AIF_IRQ),
+					    QAIF_EE_WRDMA_ERR_RSP_IRQ_CLR_REG(v, QAIF_AIF_IRQ),
+					    QAIF_AIF_IRQ, QAIF_DMA_WRDMA, QAIF_IRQ_ERROR, ss);
+	return ret;
+}
+
+static irqreturn_t qaif_cif_irq_handler(struct qaif_drv_data *drvdata, u32 status)
+{
+	const struct qaif_variant *v = drvdata->variant;
+	struct snd_pcm_substream **ss = drvdata->cif_substream;
+	irqreturn_t ret = IRQ_NONE;
+
+	if (status & QAIF_SUMMARY_BITMASK_CIF_PERIOD_RDDMA)
+		ret |= qaif_process_dma_irq(drvdata,
+					    QAIF_EE_RDDMA_PERIOD_IRQ_STAT_REG(v, QAIF_CIF_IRQ),
+					    QAIF_EE_RDDMA_PERIOD_IRQ_CLR_REG(v, QAIF_CIF_IRQ),
+					    QAIF_CIF_IRQ, QAIF_DMA_RDDMA, QAIF_IRQ_PERIOD, ss);
+	if (status & QAIF_SUMMARY_BITMASK_CIF_PERIOD_WRDMA)
+		ret |= qaif_process_dma_irq(drvdata,
+					    QAIF_EE_WRDMA_PERIOD_IRQ_STAT_REG(v, QAIF_CIF_IRQ),
+					    QAIF_EE_WRDMA_PERIOD_IRQ_CLR_REG(v, QAIF_CIF_IRQ),
+					    QAIF_CIF_IRQ, QAIF_DMA_WRDMA, QAIF_IRQ_PERIOD, ss);
+	if (status & QAIF_SUMMARY_BITMASK_CIF_OVERFLOW_WRDMA)
+		ret |= qaif_process_dma_irq(drvdata,
+					    QAIF_EE_WRDMA_OF_IRQ_STAT_REG(v, QAIF_CIF_IRQ),
+					    QAIF_EE_WRDMA_OF_IRQ_CLR_REG(v, QAIF_CIF_IRQ),
+					    QAIF_CIF_IRQ, QAIF_DMA_WRDMA, QAIF_IRQ_OVERFLOW, ss);
+	if (status & QAIF_SUMMARY_BITMASK_CIF_UNDERFLOW_RDDMA)
+		ret |= qaif_process_dma_irq(drvdata,
+					    QAIF_EE_RDDMA_UF_IRQ_STAT_REG(v, QAIF_CIF_IRQ),
+					    QAIF_EE_RDDMA_UF_IRQ_CLR_REG(v, QAIF_CIF_IRQ),
+					    QAIF_CIF_IRQ, QAIF_DMA_RDDMA, QAIF_IRQ_UNDERFLOW, ss);
+	if (status & QAIF_SUMMARY_BITMASK_CIF_ERR_RSP_RDDMA)
+		ret |= qaif_process_dma_irq(drvdata,
+					    QAIF_EE_RDDMA_ERR_RSP_IRQ_STAT_REG(v, QAIF_CIF_IRQ),
+					    QAIF_EE_RDDMA_ERR_RSP_IRQ_CLR_REG(v, QAIF_CIF_IRQ),
+					    QAIF_CIF_IRQ, QAIF_DMA_RDDMA, QAIF_IRQ_ERROR, ss);
+	if (status & QAIF_SUMMARY_BITMASK_CIF_ERR_RSP_WRDMA)
+		ret |= qaif_process_dma_irq(drvdata,
+					    QAIF_EE_WRDMA_ERR_RSP_IRQ_STAT_REG(v, QAIF_CIF_IRQ),
+					    QAIF_EE_WRDMA_ERR_RSP_IRQ_CLR_REG(v, QAIF_CIF_IRQ),
+					    QAIF_CIF_IRQ, QAIF_DMA_WRDMA, QAIF_IRQ_ERROR, ss);
+	return ret;
+}
+
+static const struct qaif_irq_map qaif_irq_clients[] = {
+	{ QAIF_CLIENT_ID_AIF_DMA, QAIF_BITMASK_AIF_RDDMA_WRDMA, qaif_aif_irq_handler },
+	{ QAIF_CLIENT_ID_CIF_DMA, QAIF_BITMASK_CIF_RDDMA_WRDMA, qaif_cif_irq_handler },
+};
+
+static irqreturn_t asoc_platform_qaif_irq(int irq, void *data)
+{
+	struct qaif_drv_data *drvdata = data;
+	const struct qaif_variant *v = drvdata->variant;
+	u32 summary_irq_status;
+	int rv, client;
+	irqreturn_t ret = IRQ_NONE;
+
+	rv = regmap_read(drvdata->audio_qaif_map, QAIF_SUMMARY_IRQSTAT_REG(v),
+			 &summary_irq_status);
+	if (rv) {
+		dev_err(regmap_get_device(drvdata->audio_qaif_map),
+			"error reading from irqstat reg: %d\n", rv);
+		return IRQ_NONE;
+	}
+
+	if (!(summary_irq_status & QAIF_ALL_CLIENTS_MASK))
+		return IRQ_NONE;
+
+	for (client = 0; client < ARRAY_SIZE(qaif_irq_clients); client++) {
+		if (summary_irq_status & qaif_irq_clients[client].mask)
+			ret |= qaif_irq_clients[client].client_irq_handler(drvdata,
+									   summary_irq_status);
+	}
+	return ret;
+}
+
+static const struct snd_soc_component_driver qaif_component_driver = {
+	.name		= DRV_NAME,
+	.open		= qaif_platform_pcmops_open,
+	.close		= qaif_platform_pcmops_close,
+	.hw_params	= qaif_platform_pcmops_hw_params,
+	.hw_free	= qaif_platform_pcmops_hw_free,
+	.prepare	= qaif_platform_pcmops_prepare,
+	.trigger	= qaif_platform_pcmops_trigger,
+	.sync_stop	= qaif_platform_pcmops_sync_stop,
+	.pointer	= qaif_platform_pcmops_pointer,
+	.mmap		= qaif_platform_pcmops_mmap,
+	.copy		= qaif_platform_copy,
+};
+
+int asoc_qcom_qaif_platform_register(struct platform_device *pdev)
+{
+	struct qaif_drv_data *drvdata = platform_get_drvdata(pdev);
+	struct of_phandle_args iommu_spec;
+	u32 sid;
+	int ret;
+
+	if (!drvdata->variant->alloc_stream_dma_idx ||
+	    !drvdata->variant->free_stream_dma_idx)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "Variant missing mandatory callbacks\n");
+
+	ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
+					       "iommus", 2, 0,
+					       &iommu_spec);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to parse iommus property\n");
+	sid = iommu_spec.args[0];
+	of_node_put(iommu_spec.np);
+	drvdata->smmu_csid_bits = sid & QAIF_CSID_MASK;
+
+	/*
+	 * The DMA base register only holds the low 32 bits of the buffer
+	 * address, so the coherent buffer must come from the low 32-bit
+	 * address space.
+	 */
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to set 32-bit DMA mask\n");
+
+	drvdata->audio_qaif_irq = platform_get_irq(pdev, 0);
+	if (drvdata->audio_qaif_irq < 0)
+		return dev_err_probe(&pdev->dev, drvdata->audio_qaif_irq,
+				     "Failed to get IRQ\n");
+
+	drvdata->qaif_hw_configured = false;
+	mutex_init(&drvdata->stream_lock);
+
+	ret = devm_request_irq(&pdev->dev, drvdata->audio_qaif_irq,
+			       asoc_platform_qaif_irq, 0,
+			       "qaif-irq-audio-core", drvdata);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "irq request failed\n");
+
+	ret = devm_snd_soc_register_component(&pdev->dev, &qaif_component_driver, NULL, 0);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to register platform component\n");
+	return 0;
+}
+EXPORT_SYMBOL_GPL(asoc_qcom_qaif_platform_register);
+
+MODULE_DESCRIPTION("Qualcomm Audio Interface (QAIF) PCM platform driver");
+MODULE_AUTHOR("Harendra Gautam <harendra.gautam@oss.qualcomm.com>");
+MODULE_LICENSE("GPL");

-- 
2.34.1

