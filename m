Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C3B32D0EE
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790230467; cv=none; b=uj0K4qF2aImvp+U8Hu0bSm4OQqlM7a/Uz6XTtxOb/LaiqPsAttPUnEOAwHP+kYAReiCXh7vOjZ0hlTpN1FK4hVJZDiXCrBjpDAytuhg11L7/tu8Er0x8Zq6vnVKCgiDDHZX9mt8Orz7JLUrw1HGvQJi3GcU5zhtogz1cFMp73NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790230467; c=relaxed/simple;
	bh=em62VDQheZ/tLX+NMbb54Whj+Gyvhiw96wEx0zjeExI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ukXrqKHldP1xjujQYxZwJOB0GyRwCJ+ebI2oWbIHvjYt3KG7sekrs527sebKyA+eaz5KtVEOlLL8C2Gl0pI1/c/cqiEravkMxFrQw5vStcOY9KoOoIn+FMXZuWxkN8WHMi5f7e5Es5jKqn6zgmZVrhaRBS4wMY9GBV9qGRI05qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MNLgSWJE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NLV8Qxew; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MNLgSWJE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NLV8Qxew"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eP7C582533
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	31gZ7OtCFd+aZGFWoKZu0/HFhbNaRl1RagZsu1mV2Cg=; b=MNLgSWJEHqNrWaiw
	lPFT+qTxbWvAZUsT9Wdr/pS3dBk5BJ09LaJdZPmGUTpq0wK4DjMk5yEj5vsftjod
	XmhAJYv4pKZ/fL+ztZANBDvNFGHAFlQOmOfx9ML0Ndrr04W5OXy/tK0NB+KqagzK
	K+lmMFsLLeCM0uK0iLCIyV6qB0jnWLGN4s8J0aTsMQHvEnXEba1T8qtnfD/xFdl8
	l3xQJsZVlsxE+YDDZ5x2dod7FtL97TIitIel2kbfiR4pxa68onzvCtPLlsigr1hp
	sH178lGCUYNk89TKo/ZtCvy0D79BsBQSwgLEquxYUqkLjACfYg583ZmmXB/6+m9y
	uw04tw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfmwkjbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:14:23 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso3445980c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790230462; x=1790835262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31gZ7OtCFd+aZGFWoKZu0/HFhbNaRl1RagZsu1mV2Cg=;
        b=NLV8Qxew4RxESKmwKySSB6SWAtNhx98mUETqUZfAhcq/M5a6ryinFYWgkt5d21TT2J
         9Dw0alGAQVmzVHQyqrcxPbilc6EflyifOfDdw6kZFw/S7eBfc3uLt0dpxt5qn6ivc+8+
         2znmDmKQ8NbRFHe1+7WLVQKyOaI4s9RAFUukMjEMk//nW+AI4I/+dYpMpHiriE7Zqfjs
         suiENV3GcvQdYHdPSTe0zOdwVOQh5YxTippOcBySweoeZp27og67f/Iq9C5To5nXIW27
         3xO0xhHy1l281lJoWygpqQXb2eGOULie7599KKxrWXhnX6vNWhc+jAxECXC2vzAkK3gg
         dwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790230462; x=1790835262;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=31gZ7OtCFd+aZGFWoKZu0/HFhbNaRl1RagZsu1mV2Cg=;
        b=fOYVYmIsfZ/OyCVhPK7EezTQWEgo2i4ppI9y9rChRqFIBbJiVVbnPlJu1+6pq/8Q5z
         8WTTcX7SQtLrbNXz3NtyFwZyAzUSjAs0sWjIqPugixBSRxHLM+Cpto1CA76f6fvZV27r
         +1OOLjk7jvbuoxXNiLKeUwYmHqpfk9hmebnPrX78kRlyK54Pes9HwZVOTbR4GfqnNJE2
         Xd9aj/y1cn59CA5MnPSWCSylDtV8bhdDFw2uAE+AIUYeVXw6NMOht+dxzxAwx5cVc8Hk
         6RizaeZ8TSrrgO699OqmdesNLjPjU6UICODyiifNCRLNJKJ7bcLVUa9JmNTadeJ8ran+
         l9GQ==
X-Forwarded-Encrypted: i=1; AKwUvBzE6fLgEtOWkTlrRmbaDq5ZGFqNMQEMYjWkx/K0LlTYXQAAdtUFjCVRXfNE3+Cm5Tn1Q5Nzq3xNGm3RQbM=@vger.kernel.org
X-Gm-Message-State: AFuF++ngGiQ2X5iOYhqWVdtzCH7m4okCKAdSBJUN/KCbFwgF8AJ2ekc2
	yySCh0qodhRwQpvliwO9ln7bXRVALqYP0vTZXfOUvvbULJuAx76Kr1J01SZi8NjaoC6EUUS2cco
	Z+nuKP0wuwLK5+V6d9YR+h3KOSX5QojUZeF/XMZvhpLW/q1p9F+7fq/teQGVT0KPI7dc=
X-Gm-Gg: AYBFou2JqGSn4KwofcPl8xkt1xVOmYdQKJqpU0Sea4WUW9CUGz4jjX6Ae0EihN63U/A
	0W4SbIhhx769f842gILBKd9ktJS/C+x77YIzfDHrDiJ7mf+FQR1LHwVObI4iiM2I+dGUVkikcqD
	adA/Sal6HPYOBx1OTkKis1ootReOCfCDlua9Suw8luTJNxfVwp6112KjXpRLtfuLklZzp+wWRei
	IomNQ+sUkLk/K/O+O6iDB7z/GU7Fd+iBJZyv6DLDmKVpPNgl2WpT67hVOpFyCvSyNtYLvetJorQ
	8kxrEvNAdnvkQPZxhQ8FvZT3SxfmeTwOLRs/PhMRRipxygJi/iKmp3Vh5KmCueMOLIWcsYEETV1
	sckxXj4fO4Zvg+qtBfAcAgJOnc2b3
X-Received: by 2002:a05:7022:b0c7:b0:144:eab0:9cbc with SMTP id a92af1059eb24-145040b9869mr984362c88.37.1790230462153;
        Wed, 23 Sep 2026 23:14:22 -0700 (PDT)
X-Received: by 2002:a05:7022:b0c7:b0:144:eab0:9cbc with SMTP id a92af1059eb24-145040b9869mr984342c88.37.1790230461549;
        Wed, 23 Sep 2026 23:14:21 -0700 (PDT)
Received: from [192.168.1.25] ([122.183.173.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98209ffsm10084659c88.4.2026.09.23.23.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 23:14:21 -0700 (PDT)
Message-ID: <8cee4223-eaad-4326-9ab8-ec6ef9345e8f@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 11:44:07 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] ASoC: qcom: lpass-rx-macro: Add shikra compatible
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
 <20260922-add_shikra_support-v1-3-6c6cb6444caf@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260922-add_shikra_support-v1-3-6c6cb6444caf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAyNiBTYWx0ZWRfX0/zxf0PutMvz
 VI5lC4TmXU+laSZATbpWjkuLlfWWyMfQ9mATUtvwFTRiTwBU0JrDdLk356zI+1tpQbs5WrLQsi3
 l36Ls5IycBugObypwGOUM26eazWIfGKNr20I1zClj5GVo9uycGUjNLtgsFdis+eK4jhvSVxD45C
 sBXmLeFhAQo31udu9ufGMPeofvbZw0gJ3dNSZN1LI+Tht/we3+sxLLuT9ED9C0cN+noufmsXF3h
 pRESiWgbSjUeEa7NsjLCGeNfut2cnSsiGhDToFnQbkT7V8oQNAqjiEN4f/r8VtpQE5AJaY1b+2H
 XCGPC3ygWAJxpFIkMJdeEoeOHnlCVRTQb30qAgI9/LhNb/NoC8SK6WDYsAPXz8R1YDCEdIok9Tb
 xtBm31SkhW2r+uNC1lO+tBPaQH9K/v882xgvES9jrBNyFwGe8T4RmpYukZvfTzL36cCsT46zwKq
 FZo1eICfkbvf1I+jVag==
X-Authority-Analysis: v=2.4 cv=WK/qzXsR c=1 sm=1 tr=0 ts=6ab4bfbf cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=uk8ae9/F1LYL5lfeGCaUoA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Bjo1vDIwfTV5L2TfZyQA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAyNiBTYWx0ZWRfX8JBW02GRCktg
 OCQtcfhhN4m2V/tWwKP/VW1t4O3iwQC2TAmBKP+aBD8rkb8RRA00gviNGT+im3KTrTi/GwGgMKe
 O+cmIKesHeyOsOiwmI4vqjYszHZp0AQ=
X-Proofpoint-ORIG-GUID: GSvMMJa6aj0aHpjmW48xneWbs5qAS84q
X-Proofpoint-GUID: GSvMMJa6aj0aHpjmW48xneWbs5qAS84q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240026



On 9/22/2026 3:12 PM, Mohammad Rafi Shaik wrote:
> Add shikra RX macro compatible data and hook it into the LPASS codec
> v4.1 flow.
> 
> The RX macro register layout of LPASS codec v4.1 matches the v2.5+
> layout, so reuse the existing v2.5 register access helpers, controls
> and widgets for it.
> 
> v4.1 additionally requires the FS counter to be bypassed before it is
> enabled during MCLK enable. This is a property of the codec version and
> not of the board, so key it off the version detected by the VA macro
> rather than off match data.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>


> ---
>   sound/soc/codecs/lpass-macro-common.h |  3 +++
>   sound/soc/codecs/lpass-rx-macro.c     | 14 ++++++++++++++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
> index 573b2145e1c4..b52665b11e35 100644
> --- a/sound/soc/codecs/lpass-macro-common.h
> +++ b/sound/soc/codecs/lpass-macro-common.h
> @@ -30,6 +30,7 @@ enum lpass_codec_version {
>   	LPASS_CODEC_VERSION_2_7,
>   	LPASS_CODEC_VERSION_2_8,
>   	LPASS_CODEC_VERSION_2_9,
> +	LPASS_CODEC_VERSION_4_1,
>   };
>   
>   struct lpass_macro {
> @@ -70,6 +71,8 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
>   		return "v2.8";
>   	case LPASS_CODEC_VERSION_2_9:
>   		return "v2.9";
> +	case LPASS_CODEC_VERSION_4_1:
> +		return "v4.1";
>   	default:
>   		break;
>   	}
> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> index c41eb8de6160..93ceee878b78 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -60,6 +60,7 @@
>   #define CDC_RX_FS_MCLK_CNT_ENABLE	BIT(0)
>   #define CDC_RX_FS_MCLK_CNT_CLR_MASK	BIT(1)
>   #define CDC_RX_FS_MCLK_CNT_CLR		BIT(1)
> +#define CDC_RX_FS_CNT_BYPASS		BIT(7)
>   #define CDC_RX_CLK_RST_CTRL_SWR_CONTROL	(0x0108)
>   #define CDC_RX_SWR_CLK_EN_MASK		BIT(0)
>   #define CDC_RX_SWR_RESET_MASK		BIT(1)
> @@ -652,6 +653,7 @@ struct rx_macro {
>   	bool is_ear_mode_on;
>   	bool hph_pwr_mode;
>   	bool hph_hd2_mode;
> +	bool fs_cnt_bypass;
>   	struct snd_soc_component *component;
>   	unsigned long active_ch_mask[RX_MACRO_MAX_DAIS];
>   	unsigned long active_ch_cnt[RX_MACRO_MAX_DAIS];
> @@ -1613,6 +1615,7 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
>   	case LPASS_CODEC_VERSION_2_6:
>   	case LPASS_CODEC_VERSION_2_7:
>   	case LPASS_CODEC_VERSION_2_8:
> +	case LPASS_CODEC_VERSION_4_1:
>   		return rx_2_5_is_rw_register(dev, reg);
>   	default:
>   		break;
> @@ -2045,6 +2048,11 @@ static int rx_macro_mclk_enable(struct rx_macro *rx, bool mclk_enable)
>   					   CDC_RX_CLK_MCLK2_ENABLE);
>   			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
>   					   CDC_RX_FS_MCLK_CNT_CLR_MASK, 0x00);
> +
> +			if (rx->fs_cnt_bypass)
> +				regmap_set_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
> +						CDC_RX_FS_CNT_BYPASS);
> +
>   			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
>   					   CDC_RX_FS_MCLK_CNT_EN_MASK,
>   					   CDC_RX_FS_MCLK_CNT_ENABLE);
> @@ -3652,6 +3660,7 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
>   	case LPASS_CODEC_VERSION_2_6:
>   	case LPASS_CODEC_VERSION_2_7:
>   	case LPASS_CODEC_VERSION_2_8:
> +	case LPASS_CODEC_VERSION_4_1:
>   		controls = rx_macro_2_5_snd_controls;
>   		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
>   		widgets = rx_macro_2_5_dapm_widgets;
> @@ -3837,8 +3846,10 @@ static int rx_macro_probe(struct platform_device *pdev)
>   	case LPASS_CODEC_VERSION_2_6:
>   	case LPASS_CODEC_VERSION_2_7:
>   	case LPASS_CODEC_VERSION_2_8:
> +	case LPASS_CODEC_VERSION_4_1:
>   		rx->rxn_reg_stride = 0xc0;
>   		rx->rxn_reg_stride2 = 0x0;
> +		rx->fs_cnt_bypass = (rx->codec_version == LPASS_CODEC_VERSION_4_1);
>   		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
>   		reg_defaults = kmalloc_objs(struct reg_default, def_count);
>   		if (!reg_defaults)
> @@ -3951,6 +3962,9 @@ static const struct of_device_id rx_macro_dt_match[] = {
>   	}, {
>   		.compatible = "qcom,sc8280xp-lpass-rx-macro",
>   		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
> +	}, {
> +		.compatible = "qcom,shikra-lpass-rx-macro",
> +		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
>   	},
>   	{ }
>   };
> 

