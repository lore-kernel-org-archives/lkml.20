Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D42A390600
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365376; cv=none; b=YGhFOdzvioWu3ObpM8AwGXNLaRFP9WvQ8aBmVpqZRLvjLdVSicujuUelAB7/TO2/Wol4pNOA45JTvjLsDu51/JQrxH/25RPX702m9uCjC+b8szXx0KFySG+z8tTWT8kpvFvIlE3TtHJ963wBkMUab1UfPWBilaDZxT0pJ7Gi4Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365376; c=relaxed/simple;
	bh=nu/WPoQ0EAyEhS8CM219AvAu4yABv69H/QW5iE+j0NI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gJYHFAgIDFvgwXD9us/JeaDfDkX4SNzvxku210tN/diFiAI2RMJisSyWcUbNFGz7ROaFwfWdJwd/V0+Kgqi3rwbCLFm9PTxnLaPjMjLMcYmUodNFwvAOG6ILAwKLFSBtZyMuzIHIISKLV90EU2gFisG16EMIpyhljlBDyadicFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ksb2JztI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cIF127Tt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ksb2JztI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cIF127Tt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jp4R2711530
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AgoL/vrS/xBAIKFF8vFxhe4JgJTENxBcmxfV/usIkY8=; b=Ksb2JztIlZuGLagv
	nrNPDbkhal5x3PNf3UkjP/eCfnE4a3XDW1IbngTCcrzPlGmTZeSMWfr8UBJPQsSD
	HIzQ7rnhgnrpuuZzcYaSMYvy0aF2NRm/wwM7qVIm+Wgww18OTLmpK4HwTa1t4SJz
	Rpm+nYsyvHix4zXuhY+oPMHsiGVg7HRT723ZNrCN7U4YLbX/azWZWKONl3k7WtEX
	/jCA1/sygGBJh3rN7RjKWlspfFBspUfAH1MbAhHCD2jhWrQ/GQb2eRE3n8Rqs7CA
	GhrZ6iZMejmoIJwtnoK4q3Lb1AxiAF8YPwLtUdJIVh4ATR/T8byhpKOOuRm10dXv
	g0UHUw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s1ge0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:29:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e2d4a8623bso37577655ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791365361; x=1791970161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AgoL/vrS/xBAIKFF8vFxhe4JgJTENxBcmxfV/usIkY8=;
        b=cIF127TtXzS5ckGBrFsw9R5/lmfJD/0+PZff4q6Wvp5maZXy/Dv2y23uTnoUMnlFgp
         ImSKynVvXP+ThLaX18zwvtcK8+JnFQvGxvqD67meJjDnBjsH0pNBjpOYRYMkoGrd2TG2
         6UDdqtERzvQvWF4CU9yPRcnGUR/tD4TNWsBlC3Fhh55VNDgwbOBpTFYjxkfRUMgpRpmH
         inx52r6UOlsrxSWPpa4vHUJ3zeWqdg+BVxRONhlO3Hx5HxTEhGjp2L5aZOPEFvHfawbh
         ma0L691Z8JvzVIWVMGvEMLlMQVPguuhS93K7lZKRs716E66CrpJaHyvCCntJQ3zAT1SE
         DK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791365361; x=1791970161;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AgoL/vrS/xBAIKFF8vFxhe4JgJTENxBcmxfV/usIkY8=;
        b=0+X3AY8eV2cWNqBPR5vUZ96EQAPNyODSd5j6GP/vFP2dSn1HsR3IgWY508aWdcKOEd
         w2REFJ+JIJFmE8/HaeSU4au8Zt0PBOCmDkw4lc2PRKPVLymLig6O+JrEP2n3RrMx0SQR
         APX1hkbD3xPH8ILvL9WLmk5jZw9zGj1QqJXY53FTEnX3Ocj+MBGhy5vAwN0py2k/3gGV
         KDb+j4n64jcPjsWsffOufHLIakr8wjjXMljI7BMPGj39NhhvttPtFa1LMIcfEoGMOOW/
         jgy+t953CR5wMN145ybnYXWt5gH5Ec8LX3BVI13zrOVP6jBn68vJhcNp/SeweOqBBToU
         ThZg==
X-Forwarded-Encrypted: i=1; AKwUvBx+91o/ba7EURnQbknxFeS7mX76HR2MpcNxto3M0M4/5oq60EBMWVVqPz33ZR/Ac+e79q7J3mP8Dd1Mv3U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYh+lqvpG2cwavOaOJ3BjVhfAQnGKUgp70XoXXanu/0h2+1hZ5
	q+u//KovoKE3n8mcKL4lumvKweoqOE+ZY3guYZLuzPwrpA/Q6P5HOMmH9OjHQayxBr86ecyf7KI
	uaNcKCO6nyLWo6n538bL2anVZLyTnaXlvGm6AKjVpRbTQyz+McXYnGe9Amn8/TNGmMzk=
X-Gm-Gg: AYBFou3PH1VsVbC184YnTgElhwZM/a/MpyWCROeoTN9PXwWnd7uOS0wk7Wxody4CXb1
	0t8S0SmJzjDDaZbpRCqgJBcC9e51TuXBeNxNV6wEWt3dTFToEatroIkj4d0TxLHa5UJOP1CqpN1
	gmBN1ByR/SQHDCoOqjqTjiUv/DFVB2iPO9++9ynhtQwyiIRvT9ui+VP5SVR5FLIr2/qnhgEK4Ut
	onl5Dz1LO81s6hH4PQTjuW8WkiM1ViuOlHtTF9BcAyBTSAtrbsmG5BbItzUGWwp75h5NOEWy89/
	nMCUtCnJKJLC8gexiDNwIPgORpJLo7CUj4e2e2I4A1YslbheeIw4Tb4SsWVKoH16+B9/AyyFist
	9mYIOlMnaBwjAG0MUTFmF/RduZLE=
X-Received: by 2002:a17:902:d54c:b0:2dd:ad73:5b68 with SMTP id d9443c01a7336-2e60036c99cmr14983245ad.24.1791365361364;
        Wed, 07 Oct 2026 02:29:21 -0700 (PDT)
X-Received: by 2002:a17:902:d54c:b0:2dd:ad73:5b68 with SMTP id d9443c01a7336-2e60036c99cmr14983115ad.24.1791365360897;
        Wed, 07 Oct 2026 02:29:20 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604720e81sm7335615ad.36.2026.10.07.02.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 02:29:20 -0700 (PDT)
Message-ID: <223555e8-f17c-4bd7-abe5-06d8f4406867@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 14:59:14 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] ASoC: cdns: Add Cadence I2S-SC controller driver
To: joakim.zhang@cixtech.com, lgirdwood@gmail.com, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de
Cc: cix-kernel-upstream@cixtech.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260928053613.2158446-1-joakim.zhang@cixtech.com>
 <20260928053613.2158446-3-joakim.zhang@cixtech.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260928053613.2158446-3-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tY0DoEOXt8-FJIClSQWcSxC3OQ_g5ZTl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNyBTYWx0ZWRfX+zAkfF6jSpds
 4c0oTT3+KM9hceBL3nQBIuzPg7QHYkV8t2nTCDy+61xYImGtUSwf50LY3vWtfkH/QyW/VBHle57
 83qgI40x+cxm/zPGXbIycx3OHCBR1aHUQU1JB9dS79X+DgYKeJ+SuAfXx0aFv2YfxBGExbSwJ60
 mipiYCxAGQ8hOGZIbMXupy+z8BvJlHaSPzzO8O5ZS74+lwwuUdCcZhgFr22QQpTh/bNorgeAN40
 9mhh9ZPvH3g6kY7T/+hfdbA8N4LJBgBt4O2as7juMq0tEUUpRN+Xr1HnI1an+7TkPjFA/JMOlyu
 NcSOQB2LVdGZmheGwmHIUiWoRGsgWSj3EDa9VJlBKbQ/Y2TUXjp27FrVy+18gYYld1JZfDnAzzX
 VFS2LCntZz+oU2LZLFP/FR2PouQTz3lWwPazVoTcUKttZeBj8+nnBiZoWrtV75Uz1c1TSTF/z8o
 RGAbSN1QPQ4Xt1JotRw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNyBTYWx0ZWRfX6s2sLSUD92Lr
 uvtpSeqk/+tRU1m6oe03aeX7Ha6ZfK+gXNZtAxlyK3D57z8d25ATWXA7biI+W/PLbAwfZvyQGst
 F4KDm9qVm4e7rqvAeJLXt+oTrcZACKw=
X-Proofpoint-GUID: tY0DoEOXt8-FJIClSQWcSxC3OQ_g5ZTl
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac610f2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=TAThrSAKAAAA:8 a=v9BIAvi8InMdnKEPHzMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=8BaDVV8zVhUtoWX9exhy:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070037



On 9/28/2026 11:06 AM, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Add support for the Cadence I2S-SC controller found in the CIX SKY1
> audio subsystem.
> 
> The controller provides full-duplex stereo playback and capture in
> standard I2S, left/right-justified and DSP modes, with mono operation
> mapped onto the left audio channel. It also supports TDM operation
> with up to 16 slots per frame, where the PCM channels map onto the
> active slots of the stream direction while the bit clock covers the
> whole frame.
> 
> The transmitter and receiver share the transceiver enable sequence,
> so the start/stop state machine is serialized with a spinlock against
> independently triggered playback and capture PCMs. The driver
> registers the dmaengine PCM helper, selects the audio reference clock
> parent for the 8 kHz or 11.025 kHz sample rate family and keeps the
> minimum functional-clock to bit-clock ratio required for safe clock
> domain crossing. Runtime and system suspend/resume restore the
> registers through the regcache.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---

> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <sound/dmaengine_pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +

> +static int cdns_i2s_sc_clks_enable(struct cdns_i2s_sc_priv *i2s_sc_priv)
> +{
> +	int ret;
> +
> +	ret = clk_prepare_enable(i2s_sc_priv->clk_hst);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_prepare_enable(i2s_sc_priv->clk_i2s);
> +	if (ret)
> +		clk_disable_unprepare(i2s_sc_priv->clk_hst);
> +
> +	return ret;
> +}
> +
> +static void cdns_i2s_sc_clks_disable(struct cdns_i2s_sc_priv *i2s_sc_priv)
> +{
> +	clk_disable_unprepare(i2s_sc_priv->clk_i2s);
> +	clk_disable_unprepare(i2s_sc_priv->clk_hst);
> +}
> +
> +static void cdns_i2s_sc_rxtx_common_config(struct cdns_i2s_sc_priv *i2s_sc_priv, bool on)
> +{
> +	if (on) {
> +		/* Full-duplex mode enable */
> +		regmap_update_bits(i2s_sc_priv->regmap, I2S_CTRL_FDX,
> +				   I2S_CTRL_FDX_FULL_DUPLEX, I2S_CTRL_FDX_FULL_DUPLEX);
> +
> +		if (i2s_sc_priv->is_tdm_mode) {
> +			/* TDM mode enable */
> +			regmap_update_bits(i2s_sc_priv->regmap, I2S_TDM_CTRL,
> +					   I2S_TDM_CTRL_TDM_EN, I2S_TDM_CTRL_TDM_EN);
> +
> +			/* Number of supported audio channels in TDM mode */
> +			regmap_update_bits(i2s_sc_priv->regmap, I2S_TDM_CTRL,
> +					   I2S_TDM_CTRL_CHN_NO,
> +					   FIELD_PREP(I2S_TDM_CTRL_CHN_NO,
> +						      i2s_sc_priv->tdm_config.slots - 1));

This driver uses FIELD_PREP() in several register programming paths, but 
it does not include <linux/bitfield.h>. A local targeted build with

  M=sound/soc/cdns W=1 fails with:

  error: implicit declaration of function 'FIELD_PREP'

Please add the explicit bitfield.h include. After adding that include 
locally, cdns-i2s-sc.c gets past this compile error.

> +
> +			/* TDM mode channels enable */
> +			regmap_update_bits(i2s_sc_priv->regmap, I2S_TDM_CTRL, I2S_TDM_CTRL_CHN_EN,
> +					   FIELD_PREP(I2S_TDM_CTRL_CHN_EN,
> +						      i2s_sc_priv->tdm_config.rx_mask |
> +						      i2s_sc_priv->tdm_config.tx_mask));
> +		}

> +	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to register dmaengine component\n");
> +
> +	pm_runtime_get_noresume(&pdev->dev);
> +	pm_runtime_set_active(&pdev->dev);
> +	ret = devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to enable runtime PM\n");
> +
> +	ret = cdns_i2s_sc_clks_enable(i2s_sc_priv);
> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret, "Failed to enable clocks\n");
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}
> +

After cdns_i2s_sc_clks_enable() succeeds, the platform_get_irq() failure 
path returns directly without disabling the clocks or dropping the 
runtime PM usage count. The devm_request_irq() failure path has a 
similar issue: it calls pm_runtime_put_noidle(), but that will not run 
the runtime suspend callback, so the clocks enabled manually above 
remain prepared/enabled.

Thanks
Ajay Kumar Nandam

> +	cdns_i2s_sc_rst(i2s_sc_priv);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +	i2s_sc_priv->irq = irq;
> +
> +	ret = devm_request_irq(&pdev->dev, irq, cdns_i2s_sc_isr, 0,
> +			       dev_name(&pdev->dev), i2s_sc_priv);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}
