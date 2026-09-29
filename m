Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F52511E72
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790681820; cv=none; b=CRVbSfi3LqjUtlzI0t7mMhl49S1luA136aIAHg0acCSnz7Q/eXoJQn5P5pPCreyFz3RxWTy4uyQtjVj1CHcWJdWhdYDXWBB8Q1+0QZpTQSMGDgY6FOcBCbxUigrqVIHiw0C0XDJqdf4aZa2acVPzRyw8qcvTQRWSVWduzy68FZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790681820; c=relaxed/simple;
	bh=zXnsbRUpJLdDkFSNdTwSTBWPW2RKhE+1cP9ym8jpSU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BkxzevzH6/338FKUX7s35de8eZmqwUiToG4lD/oskqUGVgpf+XKKXO2XFnQdDsaGpkORkU6o3JSwdz17WmC/tvYDEdA8xPfn0R8Hc/RZDJNGNCBV6dlTzoRK+WsnmXESqXbqByjOFzEI4uOnHJkcFkPdd2nlmnn3W2XorfIhp3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=plRcbAVg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T12mp6zs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="plRcbAVg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T12mp6zs"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TAjAJ33011298
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FXTQZXvyvmSCkCy/r9CFX47tXuGMoFqofSuvA1lJ7nA=; b=plRcbAVgQ6EaoeBA
	DqCfD/SlIt63TkQ0jcIYB+FxoroofNmn4Ft+ozWjZElKR0uEpnk+bcI8mZuW53qg
	G5k5sG0SZz82R9J8eamxXKFGAp7vg4fBmI2EhXzP8JEXpvbpEEbx+GtFwzh1egpp
	K3jbFbfNYaQFgJg+EqryYgHvcxhISJAQY18L4f7yR4YZzUvUDcmH+lr8yGe66kTf
	SlMEU3Eoii39cd8hqDf6ebRM3Rzr8Zyf5tGX5DrA9VoObsb6itZAQVA9fK8dXZI5
	hHdcJV0q63dT69EU/CoOyk3pj7G8KsGcBF1T/zDI/BfpK36OQCpSqtGeFUMG7Fsu
	fd+n9g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mnaeny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:36:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2df8484f12cso40543165ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790681817; x=1791286617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FXTQZXvyvmSCkCy/r9CFX47tXuGMoFqofSuvA1lJ7nA=;
        b=T12mp6zseqQ4eFb9D9ls+WDpYVOpO02N2cqGioPlw2WZLMm4S3SOBHsfyFZRvLlcQm
         wgu25zdV9PwCJuWPbVSpvN4kVMNvFD9mmlg+XnCBzLfgd0fRteB4yeNCAZ5z3FEVj4nG
         lVeg+1fhez0soAm3Aky7UV7/Xrjvtao9u8yhdxM5XEx3Pps7JPadY9TibRDHCCumX2EJ
         4Sh5oNWCqiR7nTs/3WQw7p84OheRvg67EuMVAj98n121gk7S7pd0gRC0fWrLVzJ9mzP3
         0Vdw4AtoDoG8RqCeB/9uXGCad8z7CEFPPWJoiIzDQuObKgvnxJyMwQOM5FQUO8y+n4Gh
         hDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790681817; x=1791286617;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FXTQZXvyvmSCkCy/r9CFX47tXuGMoFqofSuvA1lJ7nA=;
        b=OP6R7IcwXUXOc8i1/qEOAt0cuJp3MdTcQiU1uIYW0QmqfkfOaTA4HtZ/U8QQsNjhHS
         evO+BiSfu+r8YCuM9OCxD4nGvegC5c7L9NLP/tWbSijLXdtnSEouEShkUO1vsJ+Sn1i1
         sgdmi8+wScLdiUx0mLw+0IO7iSZbF8tTGni1IY9JdelI9V7Aef4XBw9nwTLFZsqWN8qN
         4K2VkhQLFTTW7OktqG6GU4wBC6XNutps3/nEk35hfE/IjYacSwJydQJW6zVaesRIUyZ6
         5fTZuMTtLwUI28bumfC7O+cTgX8OVMCNyYHn6M5Zvg9RMHp+6TqZB9yXmPrctWyEqvkV
         eCOA==
X-Forwarded-Encrypted: i=1; AKwUvBw9qpeAF7rD5P4rw3lhANO5wR8TG0xdLrrD5QRwpYf++xbEcuNX9TZB95CRps9I0jpwIjY2Ya4XcTB9Sw8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWijw+55oaf4yADpkmkel0AirHety3+B9g3+PfcpxKPKcU+t60
	GYTCM6cfOgwSR6t5NSztOq7juAmC/4roVVqfnvZNzuDGAWao6GGkTKCBRYYvmg/TgpB/O1p3Klw
	QzkYIL7xZH4e7llXriHFbPxdtvodnaR7uyX9gTTgJbFzKGlSUuENJAybZbMivbBVzM20=
X-Gm-Gg: AYBFou1AUNi3BASQpwF9TTvb/CLe7/k0lDu9VdL8ABmvxwexunvBQYf2GLFzNvE6/6H
	S6pUw0+5BnXnRBO3bnd9dniX+8NY9sezgVo0cy+sCodMXX6GkouDImh3gNpBzc/U/BixP+lzy5R
	wDmMj+mlvER6sycLu19/pTeKfkHSkvTswzH6Z4cTesQBbptaorSENzE4TnSg0SyWcbZHjX1hdZx
	C/gZVxbq7tUB3Df6vvgHmU2OX+dNKDE3BO2HvdRyeu17kY8nCfOs06J5tQURoIEmz7yVEX7zl6Y
	8eWGxVkpaLgjwoGAyYsTwV6AkFLVbk8AIML2jFtUNdyJrzHrKltbQ6Mv4Mmj6Cn8Jp6EffX/zYp
	EisuOnNK6uwFuT5LXxYWEsXlaF+8=
X-Received: by 2002:a17:902:ce84:b0:2df:90d4:1185 with SMTP id d9443c01a7336-2df90d41ad1mr113254875ad.10.1790681816831;
        Tue, 29 Sep 2026 04:36:56 -0700 (PDT)
X-Received: by 2002:a17:902:ce84:b0:2df:90d4:1185 with SMTP id d9443c01a7336-2df90d41ad1mr113254625ad.10.1790681816300;
        Tue, 29 Sep 2026 04:36:56 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df90c03890sm55353715ad.0.2026.09.29.04.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 04:36:55 -0700 (PDT)
Message-ID: <35e41446-631f-49e7-83d8-bdfca469bc09@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 17:06:48 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/10] ASoC: qcom: Add QAIF IRQ handling and platform
 register
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260928-b4-qaif-shikra-audio-v8-0-ac618057fe85@oss.qualcomm.com>
 <20260928-b4-qaif-shikra-audio-v8-8-ac618057fe85@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260928-b4-qaif-shikra-audio-v8-8-ac618057fe85@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X9fHu2Te c=1 sm=1 tr=0 ts=6abba2d9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=drLfthholnaMhx7I328A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 6lpvO0Uhfe_ltRypOfBRBC5Nj4Qp8e9o
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0NiBTYWx0ZWRfXzy8riIMV6Pp3
 qLdRBfRQbNtzY8fohAuIa3XBtu1hW8gysy8oSS3RRs+R9VXcj380qYgHBEH/THNCvp31rYTbYom
 +D9RlSkLFbKZiL0+yTBU+tXz4shVCic=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0NiBTYWx0ZWRfXyBrHqWl/ELCp
 nAcgPvAsk+qDGLhRHMwK1rGoIbtEKT7ob2DGEoAVB9NGexn8NIxNktOdT8nlydtZEjSszijJoe/
 FkfYLAZZZMF3IXO91X6a2Fm5slas1fn8Be560ts/skvVH2DkpQ5YcGFSw4298owJh97ndpIjaNY
 2URligbiy+j4ZRmD+o6wFQ92xDHeiI/+0Z0E5wV+mU2bcI5Nn6LbbmOLg5ScUkIBSGtDpCWj5wv
 mpzwEJBOCElSBx3gFuByaALhWxjuZaWCe245Tm3JgDDjqsNsmrIBsj2R4v1imfW9h1Ys1XJxKYG
 oZ0iftH+471e5GErrfPRp9BQoWMWpEO2wf0aIwPU21VKStK2oF61AhLPu2fesyLMefU7mMzFJ0E
 X3Jg0vwIqaymxQktyQyYhfYEv/oklrZiZlVf4rAKWANDBxA2Co/uuuqd+Fl2s7zQ9rnysCq3kEp
 9F7CZprLWByEjiBZNkg==
X-Proofpoint-ORIG-GUID: 6lpvO0Uhfe_ltRypOfBRBC5Nj4Qp8e9o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290046

> +	case SNDRV_PCM_TRIGGER_STOP:
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		ret = regmap_update_bits(map,
> +					 qaif_dmactl_reg(v, idx, substream->stream, dai_id),
> +					 QAIF_DMACTL_ENABLE_BIT, 0);
> +		if (ret) {
> +			dev_err(soc_runtime->dev, "error disabling DMA: %d\n", ret);
> +			return ret;
> +		}
> +		ret = regmap_update_bits(map,
> +					 qaif_dmacfg_reg(v, idx, substream->stream, dai_id),
> +					 QAIF_DMACFG_DYNCLK_BIT, 0);
> +		if (ret)
> +			dev_err(soc_runtime->dev, "error disabling dma_dynclk: %d\n", ret);

Should this preserve the first error while still attempting the 
IRQ-disable cleanup? As written, if clearing `QAIF_DMACFG_DYNCLK_BIT` 
fails but `qaif_platform_irq_op(..., QAIF_IRQ_DISABLE)` succeeds, `ret` 
is overwritten and the trigger callback returns 0.

> +		ret = qaif_platform_irq_op(drvdata, substream->stream, irq_type,
> +					   idx, QAIF_IRQ_DISABLE);
> +		if (ret)
> +			dev_err(soc_runtime->dev, "error disabling irq regs: %d\n", ret);
> +		break;

The QAIF programming guide's STOP sequences describe one more hardware 
completion step after clearing DMA ENABLE: wait for the relevant DMA 
shutdown status to complete, then clear/disable the associated IRQs. 
This applies to the AIF RDDMA/WRDMA paths and also to the codec 
RDDMA/WRDMA paths.

This patch already has register definitions for the shutdown-status 
registers
(`QAIF_RDDMA_SHUTDOWN_STAT_REG()`, `QAIF_WRDMA_SHUTDOWN_STAT_REG()`,
QAIF_CDC_RDDMA_SHUTDOWN_STAT_REG(),&QAIF_CDC_WRDMA_SHUTDOWN_STAT_REG()), 
but I do not see them used in this stop path or in `sync_stop()`.

Should the driver poll the appropriate `*_SHUTDOWN_STATUS` register, for
example with `regmap_read_poll_timeout()`, before disabling DYNCLK and 
IRQs? Otherwise a fast STOP->START or suspend/resume path may race with 
a DMA channel that hardware still reports as shutting down.

Thanks
Ajay Kumar Nandam

> +	default:
> +		return -EINVAL;
> +	}
> +	return ret;
> +}
> +
> +static int qaif_platform_pcmops_sync_stop(struct snd_soc_component *component,
> +					  struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
> +	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
> +	struct qaif_pcm_data *data = substream->runtime->private_data;
> +	unsigned int dai_id = cpu_dai->driver->id;
> +	enum qaif_irq_type irq_type = qaif_is_cif_port(dai_id) ? QAIF_CIF_IRQ : QAIF_AIF_IRQ;
> +	int idx = data->dma_reg_idx;
> +	int ret;
> +
> +	synchronize_irq(drvdata->audio_qaif_irq);
> +	ret = qaif_platform_irq_op(drvdata, substream->stream, irq_type,
> +				   idx, QAIF_IRQ_CLEAR);
> +	if (ret)
> +		dev_err(soc_runtime->dev, "error clearing irq regs: %d\n", ret);
> +	return ret;
> +}
> +
> +static irqreturn_t qaif_process_dma_irq(struct qaif_drv_data *drvdata,
> +					u32 stat_reg_addr,
> +					u32 clr_reg_addr,
> +					enum qaif_irq_type irq_type,
> +					enum qaif_dma_dir dma_type,
> +					enum qaif_irq irq,
> +					struct snd_pcm_substream **substream)
> +{
> +	const struct qaif_variant *v = drvdata->variant;
> +	unsigned int reg = 0;
> +	int dma_idx, stream_dma_idx, rv, num_dma, stream_offset, array_size;
> +	u32 mask;
> +	struct snd_pcm_substream *ss;
> +
> +	stream_offset = (dma_type == QAIF_DMA_WRDMA) ?
> +		((irq_type == QAIF_AIF_IRQ) ? v->wrdma_start : v->codec_wrdma_start) : 0;
> +	num_dma = (dma_type == QAIF_DMA_WRDMA) ?
> +		((irq_type == QAIF_AIF_IRQ) ? v->num_wrdma : v->num_codec_wrdma) :
> +		((irq_type == QAIF_AIF_IRQ) ? v->num_rddma : v->num_codec_rddma);
> +	if (!num_dma)
> +		return IRQ_NONE;
> +
> +	array_size = (irq_type == QAIF_AIF_IRQ) ?
> +		QAIF_MAX_AIF_DMA_IDX : QAIF_MAX_CIF_DMA_IDX;
> +	if (stream_offset + num_dma > array_size) {
> +		dev_err(regmap_get_device(drvdata->audio_qaif_map),
> +			"DMA index range %d+%d exceeds substream table %d\n",
> +			stream_offset, num_dma, array_size);
> +		return IRQ_NONE;
> +	}
> +	mask = GENMASK(num_dma - 1, 0);
> +
> +	rv = regmap_read(drvdata->audio_qaif_map, stat_reg_addr, &reg);
> +	if (rv) {
> +		dev_err_ratelimited(regmap_get_device(drvdata->audio_qaif_map),
> +				    "error reading stat reg 0x%x: %d\n", stat_reg_addr, rv);
> +		return IRQ_NONE;
> +	}
> +
> +	if (!(reg & mask)) {
> +		dev_warn_ratelimited(regmap_get_device(drvdata->audio_qaif_map),
> +				     "spurious IRQ: stat reg 0x%x status 0x%x mask 0x%x\n",
> +				     stat_reg_addr, reg, mask);
> +		return IRQ_NONE;
> +	}
> +
> +	if (regmap_write(drvdata->audio_qaif_map, clr_reg_addr, reg & mask))
> +		return IRQ_NONE;
> +
> +	for (dma_idx = 0; dma_idx < num_dma; dma_idx++) {
> +		stream_dma_idx = dma_idx + stream_offset;
> +		ss = READ_ONCE(substream[stream_dma_idx]);
> +		if (!(reg & BIT(dma_idx)) || !ss)
> +			continue;
> +		switch (irq) {
> +		case QAIF_IRQ_PERIOD:
> +			snd_pcm_period_elapsed(ss);
> +			break;
> +		case QAIF_IRQ_OVERFLOW:
> +		case QAIF_IRQ_UNDERFLOW:
> +			dev_warn_ratelimited(regmap_get_device(drvdata->audio_qaif_map),
> +					     "QAIF DMA xRun\n");
> +			snd_pcm_stop_xrun(ss);
> +			break;
> +		case QAIF_IRQ_ERROR:
> +			snd_pcm_stop_xrun(ss);
> +			dev_err_ratelimited(regmap_get_device(drvdata->audio_qaif_map),
> +					    "QAIF bus error\n");
> +			break;
> +		}
> +	}
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t qaif_aif_irq_handler(struct qaif_drv_data *drvdata, u32 status)
> +{
> +	const struct qaif_variant *v = drvdata->variant;
> +	struct snd_pcm_substream **ss = drvdata->aif_substream;
> +	irqreturn_t ret = IRQ_NONE;
> +
> +	if (status & QAIF_SUMMARY_BITMASK_AIF_PERIOD_RDDMA)
> +		ret |= qaif_process_dma_irq(drvdata,
> +					    QAIF_EE_RDDMA_PERIOD_IRQ_STAT_REG(v, QAIF_AIF_IRQ),
> +					    QAIF_EE_RDDMA_PERIOD_IRQ_CLR_REG(v, QAIF_AIF_IRQ),
> +					    QAIF_AIF_IRQ, QAIF_DMA_RDDMA, QAIF_IRQ_PERIOD, ss);
> +	if (status & QAIF_SUMMARY_BITMASK_AIF_PERIOD_WRDMA)
> +		ret |= qaif_process_dma_irq(drvdata,
> +					    QAIF_EE_WRDMA_PERIOD_IRQ_STAT_REG(v, QAIF_AIF_IRQ),
> +					    QAIF_EE_WRDMA_PERIOD_IRQ_CLR_REG(v, QAIF_AIF_IRQ),
> +					    QAIF_AIF_IRQ, QAIF_DMA_WRDMA, QAIF_IRQ_PERIOD, ss);
> +	if (status & QAIF_SUMMARY_BITMASK_AIF_OVERFLOW_WRDMA)
> +		ret |= qaif_process_dma_irq(drvdata,
> +					    QAIF_EE_WRDMA_OF_IRQ_STAT_REG(v, QAIF_AIF_IRQ),
> +					    QAIF_EE_WRDMA_OF_IRQ_CLR_REG(v, QAIF_AIF_IRQ),
> +					    QAIF_AIF_IRQ, QAIF_DMA_WRDMA, QAIF_IRQ_OVERFLOW, ss);
> +	if (status & QAIF_SUMMARY_BITMASK_AIF_UNDERFLOW_RDDMA)
> +		ret |= qaif_process_dma_irq(drvdata,
> +					    QAIF_EE_RDDMA_UF_IRQ_STAT_REG(v, QAIF_AIF_IRQ),
> +					    QAIF_EE_RDDMA_UF_IRQ_CLR_REG(v, QAIF_AIF_IRQ),
> +					    QAIF_AIF_IRQ, QAIF_DMA_RDDMA, QAIF_IRQ_UNDERFLOW, ss);
> +	if (status & QAIF_SUMMARY_BITMASK_AIF_ERR_RSP_RDDMA)
> +		ret |= qaif_process_dma_irq(drvdata,
> +					    QAIF_EE_RDDMA_ERR_RSP_IRQ_STAT_REG(v, QAIF_AIF_IRQ),
> +					    QAIF_EE_RDDMA_ERR_RSP_IRQ_CLR_REG(v, QAIF_AIF_IRQ),
> +					    QAIF_AIF_IRQ, QAIF_DMA_RDDMA, QAIF_IRQ_ERROR, ss);
> +	if (status & QAIF_SUMMARY_BITMASK_AIF_ERR_RSP_WRDMA)
> +		ret |= qaif_process_dma_irq(drvdata,
> +					    QAIF_EE_WRDMA_ERR_RSP_IRQ_STAT_REG(v, QAIF_AIF_IRQ),
> +					    QAIF_EE_WRDMA_ERR_RSP_IRQ_CLR_REG(v, QAIF_AIF_IRQ),
> +					    QAIF_AIF_IRQ, QAIF_DMA_WRDMA, QAIF_IRQ_ERROR, ss);
> +	return ret;
> +}
> +
> +static irqreturn_t qaif_cif_irq_handler(struct qaif_drv_data *drvdata, u32 status)
> +{
> +	const struct qaif_variant *v = drvdata->variant;
> +	struct snd_pcm_substream **ss = drvdata->cif_substream;
> +	irqreturn_t ret = IRQ_NONE;
> +
> +	if (status & QAIF_SUMMARY_BITMASK_CIF_PERIOD_RDDMA)
> +		ret |= qaif_process_dma_irq(drvdata,
> +					    QAIF_EE_RDDMA_PERIOD_IRQ_STAT_REG(v, QAIF_CIF_IRQ),
> +					    QAIF_EE_RDDMA_PERIOD_IRQ_CLR_REG(v, QAIF_CIF_IRQ),
> +					    QAIF_CIF_IRQ, QAIF_DMA_RDDMA, QAIF_IRQ_PERIOD, ss);
> +	if (status & QAIF_SUMMARY_BITMASK_CIF_PERIOD_WRDMA)
> +		ret |= qaif_process_dma_irq(drvdata,
> +					    QAIF_EE_WRDMA_PERIOD_IRQ_STAT_REG(v, QAIF_CIF_IRQ),
> +					    QAIF_EE_WRDMA_PERIOD_IRQ_CLR_REG(v, QAIF_CIF_IRQ),
> +					    QAIF_CIF_IRQ, QAIF_DMA_WRDMA, QAIF_IRQ_PERIOD, ss);
> +	if (status & QAIF_SUMMARY_BITMASK_CIF_OVERFLOW_WRDMA)
> +		ret |= qaif_process_dma_irq(drvdata,
> +					    QAIF_EE_WRDMA_OF_IRQ_STAT_REG(v, QAIF_CIF_IRQ),
> +					    QAIF_EE_WRDMA_OF_IRQ_CLR_REG(v, QAIF_CIF_IRQ),
> +					    QAIF_CIF_IRQ, QAIF_DMA_WRDMA, QAIF_IRQ_OVERFLOW, ss);
> +	if (status & QAIF_SUMMARY_BITMASK_CIF_UNDERFLOW_RDDMA)
> +		ret |= qaif_process_dma_irq(drvdata,
> +					    QAIF_EE_RDDMA_UF_IRQ_STAT_REG(v, QAIF_CIF_IRQ),
> +					    QAIF_EE_RDDMA_UF_IRQ_CLR_REG(v, QAIF_CIF_IRQ),
> +					    QAIF_CIF_IRQ, QAIF_DMA_RDDMA, QAIF_IRQ_UNDERFLOW, ss);
> +	if (status & QAIF_SUMMARY_BITMASK_CIF_ERR_RSP_RDDMA)
> +		ret |= qaif_process_dma_irq(drvdata,
> +					    QAIF_EE_RDDMA_ERR_RSP_IRQ_STAT_REG(v, QAIF_CIF_IRQ),
> +					    QAIF_EE_RDDMA_ERR_RSP_IRQ_CLR_REG(v, QAIF_CIF_IRQ),
> +					    QAIF_CIF_IRQ, QAIF_DMA_RDDMA, QAIF_IRQ_ERROR, ss);
> +	if (status & QAIF_SUMMARY_BITMASK_CIF_ERR_RSP_WRDMA)
> +		ret |= qaif_process_dma_irq(drvdata,
> +					    QAIF_EE_WRDMA_ERR_RSP_IRQ_STAT_REG(v, QAIF_CIF_IRQ),
> +					    QAIF_EE_WRDMA_ERR_RSP_IRQ_CLR_REG(v, QAIF_CIF_IRQ),
> +					    QAIF_CIF_IRQ, QAIF_DMA_WRDMA, QAIF_IRQ_ERROR, ss);
> +	return ret;
> +}
> +
> +static const struct qaif_irq_map qaif_irq_clients[] = {
> +	{ QAIF_CLIENT_ID_AIF_DMA, QAIF_BITMASK_AIF_RDDMA_WRDMA, qaif_aif_irq_handler },
> +	{ QAIF_CLIENT_ID_CIF_DMA, QAIF_BITMASK_CIF_RDDMA_WRDMA, qaif_cif_irq_handler },
> +};
> +
> +static irqreturn_t asoc_platform_qaif_irq(int irq, void *data)
> +{
> +	struct qaif_drv_data *drvdata = data;
> +	const struct qaif_variant *v = drvdata->variant;
> +	u32 summary_irq_status;
> +	int rv, client;
> +	irqreturn_t ret = IRQ_NONE;
> +
> +	rv = regmap_read(drvdata->audio_qaif_map, QAIF_SUMMARY_IRQSTAT_REG(v),
> +			 &summary_irq_status);
> +	if (rv) {
> +		dev_err(regmap_get_device(drvdata->audio_qaif_map),
> +			"error reading from irqstat reg: %d\n", rv);
> +		return IRQ_NONE;
> +	}
> +
> +	if (!(summary_irq_status & QAIF_ALL_CLIENTS_MASK))
> +		return IRQ_NONE;
> +
> +	for (client = 0; client < ARRAY_SIZE(qaif_irq_clients); client++) {
> +		if (summary_irq_status & qaif_irq_clients[client].mask)
> +			ret |= qaif_irq_clients[client].client_irq_handler(drvdata,
> +									   summary_irq_status);
> +	}
> +	return ret;
> +}
> +
> +static const struct snd_soc_component_driver qaif_component_driver = {
> +	.name		= DRV_NAME,
> +	.pcm_new	= qaif_platform_pcm_new,
> +	.open		= qaif_platform_pcmops_open,
> +	.close		= qaif_platform_pcmops_close,
> +	.hw_params	= qaif_platform_pcmops_hw_params,
> +	.hw_free	= qaif_platform_pcmops_hw_free,
> +	.prepare	= qaif_platform_pcmops_prepare,
> +	.trigger	= qaif_platform_pcmops_trigger,
> +	.sync_stop	= qaif_platform_pcmops_sync_stop,
> +	.pointer	= qaif_platform_pcmops_pointer,
> +	.mmap		= qaif_platform_pcmops_mmap,
> +};
> +
> +int asoc_qcom_qaif_platform_register(struct platform_device *pdev)
> +{
> +	struct qaif_drv_data *drvdata = platform_get_drvdata(pdev);
> +	struct of_phandle_args iommu_spec;
> +	u32 sid;
> +	int ret;
> +
> +	if (!drvdata->variant->alloc_stream_dma_idx ||
> +	    !drvdata->variant->free_stream_dma_idx)
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +				     "Variant missing mandatory callbacks\n");
> +
> +	ret = of_parse_phandle_with_args(pdev->dev.of_node,
> +					 "iommus", "#iommu-cells", 0,
> +					 &iommu_spec);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to parse iommus property\n");
> +	sid = iommu_spec.args[0];
> +	of_node_put(iommu_spec.np);
> +	drvdata->smmu_csid_bits = sid & QAIF_CSID_MASK;
> +
> +	/*
> +	 * The DMA base register only holds the low 32 bits of the buffer
> +	 * address, so the coherent buffer must come from the low 32-bit
> +	 * address space.
> +	 */
> +	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to set 32-bit DMA mask\n");
> +
> +	drvdata->audio_qaif_irq = platform_get_irq(pdev, 0);
> +	if (drvdata->audio_qaif_irq < 0)
> +		return dev_err_probe(&pdev->dev, drvdata->audio_qaif_irq,
> +				     "Failed to get IRQ\n");
> +
> +	drvdata->qaif_hw_configured = false;
> +	mutex_init(&drvdata->stream_lock);
> +
> +	ret = devm_request_irq(&pdev->dev, drvdata->audio_qaif_irq,
> +			       asoc_platform_qaif_irq, 0,
> +			       "qaif-irq-audio-core", drvdata);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "irq request failed\n");
> +
> +	ret = devm_snd_soc_register_component(&pdev->dev, &qaif_component_driver, NULL, 0);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to register platform component\n");
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(asoc_qcom_qaif_platform_register);
> +
> +MODULE_DESCRIPTION("Qualcomm Audio Interface (QAIF) PCM platform driver");
> +MODULE_AUTHOR("Harendra Gautam <harendra.gautam@oss.qualcomm.com>");
> +MODULE_LICENSE("GPL");
> 

