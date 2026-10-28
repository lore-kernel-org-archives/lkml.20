Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191515;
	b=dSSDUFO2Era1Rmi5s8T3IXU9Eg4KJ3qQ7PbtVdMp88nepXw87V3iarwLsOGcNasaa/Gu
	 xgKZypllenkEF8e/KQu/FjxkMv+ow6A68UXmfL1zrbvtqAU5F8cx09Ib5a+NuYfSwaVzx
	 aDL8HBInDy484O4i0e0FP+KT7gS715kCXTxEWzthAX1Hk6gh/XdpUXQDEEifNtbxMraeW
	 wHB3Xi0u9cKqNVoXRpYHY+i6HYTjxQq4r7RAPjOzR+RC7zXXIBae01AYvc6guT8PzaIJL
	 +sL/moRlmhrIat1AvddL4M/Z4yBgKVgcZsn+Ot5OlZ6lHZTkh+lSW0tTj/az23w9R+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191515;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5KmPEv9BbYq9ivb9/xdVcH9aF3UwmKIrOH5Phn5qMjw=;
	b=iD7fmX249nTuuzMnRpCOwPWSJx0/nQjHFDCjF52g9mf46C63szQ9Ajh0irFqGj4MYbXC
	 WR5qW0hQtbx9nuf3KY6Dnjgo2RxQUhlTYYwSh7obVJ81CPLJ2b7fx447JddO7krqH6pWr
	 xx+rlgx1sMXvzjChI6Ei9Qs74taPtlMhQx6HkBWGhNX0cLBR1NvhsZdZMOxqT5A5zBE9b
	 XGuDcDuxr282gi85+Ndj8IKsA/jx2mvgYWYnXv0S3/qkDuB0ZEmiFGUpdb7TrgsbvvLXT
	 p8jlqTLsylrW3lZETXJLhaXXNyO4b7RQj43sfMR+AvEod615oa3M7Q/3+A+wMsbqc9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I44WwHAm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A+vlr6Vf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47960606A321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47960606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I44WwHAm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A+vlr6Vf
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBduRU2082334
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:45:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5KmPEv9BbYq9ivb9/xdVcH9aF3UwmKIrOH5Phn5qMjw=; b=I44WwHAm/HLXf4JB
	acZzXtlzC8FLWO1unDttC4szXJESyC1+HmHFlL7YVwzPx0Ag0hCwCgPj4APu6nHh
	BgER+kq3w+iwcSyxMx39ox2lMIFtn/p0AHLbosPkVycMa59y1x/+5UM8xr/Mycb3
	/PUbTf33jTnuAbaUzrhHMPVE1z5BYMiWkFflzS2JvJDbD/ewmwjffhTthAScgooc
	SIUTSZkXZ6ZPsfq6mIeDl1WZlM7Bvrncq5Qs+tEtkscTYTy1n5cKo30V9KhPDlxW
	buJZDjYLsyutXkH69rhU2lwmay9GxvzykqzZR56r8/7UoAxyu40f3FlF44qQWyMJ
	o9KI9g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpv0vg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:45:14 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a223755e4so2990827eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793191513; x=1793796313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5KmPEv9BbYq9ivb9/xdVcH9aF3UwmKIrOH5Phn5qMjw=;
        b=A+vlr6VfSwJ5TNkgqLd/8eN2B/E1CCpahqdf7OI2YGwytw6qirRf8eVcdzssJWnG/6
         CtxkWogfmYNat11uHYVXNj4q/93rvRVXoKwHMIJFkYIc0iFmLlP2Z2gsol262sqCz6EN
         HHwcgfBE/n/awGhP6OzoFEQXSmuY6lDQ/KxdGkGU0a+RvZdFNIQVbJZrBdJ2VhJruMC+
         pdxhKI//X5s7vu4PAi7zVrZnOve9Yq0kwUDGqlCle6+QGTulYjr20CnE3/faVF1SvTMY
         zmMo3C69MgiVjkwHEc4Jm5PJB87M1SrNhRm/lYwTzGm52BvGMCqL/KLZr3COF8PxNBeW
         1XyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191513; x=1793796313;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5KmPEv9BbYq9ivb9/xdVcH9aF3UwmKIrOH5Phn5qMjw=;
        b=u79F9f0ZozLc9xS3fcaPUwQkR5z2ZLhtY+bwlIBUUsveB6G/qs4dPnt7iFBCeicJi2
         zGfMktNKKVZpJaqJBM1t/at7xa7gE+p5MixLgXGQ+Gf9yTlgZPz3gDkU9nHRLznfOzt7
         5TY9f98xGqqV99cpszTASlhHrD8YddbbzK9bUu4+EXEIbc4IkfIda+xlEYgrLclKqtKI
         TWL2aYe5sH3XCAs+ablKF/bf6L6W4v+TPWfIQwLIC1nlDm2Yg2jPO1QL3espUQqXLRZU
         lEDKXuha+BfrTbVzJEdXl81dDEvvTsDPsE3xpy2VEdcudVtnRh7bLwqFJ89J77dNJIYI
         2vDg==
X-Forwarded-Encrypted: i=1; AKwUvBx8MTMM8Mz2uNP5Ax9Gez4vVN3WdIndhYQ9AXLpNKfBRU6QDrZM5YEaekZaiTh1RwTerqmo1KPqPp+VC7g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxu981Vw3PC1TIkI8gd528tdtMMF5QKXjn1V0Z/NyqJDJP99HE
	nl0oImi9KbcRfjtRQs8NsNtlASIZcpZ1VCDtm3/fXRaI4NYWy2/wFKCjm9tT3nBhABjvT9Sj3qP
	l4jYQ3rWiQKFMs8SL6tnP0iGLDVbapqx39rcieKxzzHbG5Zdaapz2dUKrnLcxWxfsZ14=
X-Gm-Gg: AYBFou1ckJuis4xc+VSW29IvCbh6Ug8Z7OWZdKGr3klRTh+YhkTq8Ejg0GlUEo+n8ts
	hN4TUKyAPFKZn1zne1ejrbpOUb0v69ATbG/DA1WMYJfJfVVcXdaYKCM1T/mPBsqwKfrfHY2iFDw
	BgEF+9KetM4Fn2hnyVVOWqVUrJncWj68GNr/hL/OmmT0WL4c//DJfTrayuW9nq259aKJg4aSU0G
	BSM+6KsSxEAHLdUaanUA2yL3ZURe/EmJAOswEDYvlSTXzmwUPxQWhdmotEZdR/iK+h6KY5E3Vcp
	S1hEschLbdCejM2GSRVp16id/Cghi/6TH2sGHJ1AMEQT93M4bJB2SmsqtIr7NijdCrMiNtLs9iW
	UtJByANuljMOWqeniIaU28ZiDhkMkyZHWOY38ORDHlcW2KL+vXL8sZGCVWNSS9oHQceiAdRe7Z8
	T/mo1frp7A
X-Received: by 2002:a05:7301:1448:b0:369:f97f:72c1 with SMTP id 5a478bee46e88-36a20443a72mr3591393eec.36.1793191513392;
        Wed, 28 Oct 2026 05:45:13 -0700 (PDT)
X-Received: by 2002:a05:7301:1448:b0:369:f97f:72c1 with SMTP id 5a478bee46e88-36a20443a72mr3591342eec.36.1793191512698;
        Wed, 28 Oct 2026 05:45:12 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.197.72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm10179800eec.23.2026.10.28.05.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:45:12 -0700 (PDT)
Message-ID: <dd81646e-a30b-46a9-84a1-bc39d71ec748@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:15:04 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] ASoC: qcom: sc8280xp: Extend hw_params for QAIF
 backends
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
 <20260910-shikra-machine-v2-v2-2-9bf6bad589d8@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-2-9bf6bad589d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfXwbHAI9ZHI7ke
 2lLOzxcGunirg7fag4YgxfncQw/XxkQSLNPs9NTEmM+J5bjNzN9QFpLUZ/e+Szq4YpX9XD0VNSw
 eArzK8qOU2UBdhSGYfZzwDZjaaok4OPFV07aiKApBUdcioLyonZDcXH0SUDuLuTnjCT5wlA9p4/
 X+/zBSc9i+v33G4v69yWKsLQpz/ge2npnmPG0c7WT1/3yhzkAJydzUJx6m03cOwP5kc108vxXbq
 OX4PqPFyPjC6WaSQTsLm9ufLBlShqzi+uDjauzjSWdT5BJEvS8R3HgVWM+uoKiVJ0FVCF2Tkhlg
 u0/hzTIx+69LByT0QryyhRjcIgMfTEyKfZhc7FbjoIYoYXyAchlSLIMiE/OmuFKhCXzm/f7hLNG
 N6YEYhUe5wleYbqkVawu2ShG4HVQZ9ez+rLTpQHnEYcZQVWFdHzmGzqzwuQjBDijMHBuBDSk9qo
 v7fDeIrmeROq7NkYwrQ==
X-Proofpoint-ORIG-GUID: 6xlsw9dJqqlnFePHp80BU72ZxUao7awl
X-Proofpoint-GUID: 6xlsw9dJqqlnFePHp80BU72ZxUao7awl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX9bPHLzggWvTE
 XMSK2QuqH5wkc9XJMvD5Lu+UyNllTouUNspOE+A+h41y9DBhHnBGrVib9OWtDcSXHJHlOJ5r6Jh
 25TtPsaBNZBMTlIjXKUU3L9zWrGyH9g=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1ee5a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ud/Gc3SFmwde3Mv7YyqU3w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=fOOVHHMWt1wa0l6bWdMA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280050

> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 4d48e1012cd4..452296a9e67d 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -67,6 +67,7 @@ struct qcom_snd_soc_common {
>   	const struct snd_kcontrol_new *controls;
>   	int num_controls;
>   	unsigned int codec_dai_fmt;
> +	unsigned int cpu_dai_fmt;
>   	bool codec_sysclk_set;
>   	bool mi2s_mclk_enable;
>   	bool mi2s_bclk_enable;
> @@ -126,9 +127,15 @@ static int sc8280xp_tdm_hw_params(struct snd_pcm_substream *substream,
>   	if (!cpu_cfg.slots)
>   		return 0;
>   
> -	ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
> -	if (ret && ret != -ENOTSUPP)
> -		return ret;
> +	if (data->priv->cpu_dai_fmt) {

Could this be simplified by selecting the format first and keeping a single call and error path?
Same in sc8280xp_snd_hw_params().

fmt = data->priv->cpu_dai_fmt ?: SND_SOC_DAIFMT_BP_FP;
ret = snd_soc_dai_set_fmt(cpu_dai, fmt);
	if (ret && ret != -ENOTSUPP)
		return ret;

> +		ret = snd_soc_dai_set_fmt(cpu_dai, data->priv->cpu_dai_fmt);
> +		if (ret && ret != -ENOTSUPP)
> +			return ret;
> +	} else {
> +		ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
> +		if (ret && ret != -ENOTSUPP)
> +			return ret;
> +	}
>   
>   	if (data->priv->codec_dai_fmt) {
>   		for_each_rtd_codec_dais(rtd, i, codec_dai) {
> @@ -234,6 +241,7 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
>   	case TX_CODEC_DMA_TX_1:
>   	case TX_CODEC_DMA_TX_2:
>   	case TX_CODEC_DMA_TX_3:
> +	case VA_CODEC_DMA_TX_1:
>   		channels->min = 1;
>   		break;
>   	default:
> @@ -260,9 +268,16 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>   	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
>   	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
>   	case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
> -		ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
> -		if (ret && ret != -ENOTSUPP)
> -			return ret;
> +	case AIF_MI2S_RX_0 ... AIF_MI2S_TX_12:
> +		if (data->priv->cpu_dai_fmt) {
> +			ret = snd_soc_dai_set_fmt(cpu_dai, data->priv->cpu_dai_fmt);
> +			if (ret && ret != -ENOTSUPP)
> +				return ret;
> +		} else {
> +			ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
> +			if (ret && ret != -ENOTSUPP)
> +				return ret;
> +		}
>   
>   		if (data->priv->codec_dai_fmt) {
>   			ret = snd_soc_dai_set_fmt(codec_dai,
> @@ -296,6 +311,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>   		}
>   		break;
>   	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> +	case AIF_TDM_RX_0 ... AIF_TDM_TX_12:
>   		return sc8280xp_tdm_hw_params(substream, params);
>   	default:
>   		break;
> @@ -382,7 +398,7 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
>   	int i;
>   
>   	for_each_card_prelinks(card, i, link) {
> -		if (link->no_pcm == 1) {
> +		if (link->no_pcm == 1 || link->num_codecs > 0) {

Can num_codecs > 0 also match DPCM frontends using the dummy codec?
If so, would this unintentionally apply the BE ops/fixup to existing frontend links?

Thanks,
Prasad

