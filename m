Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3F63C10AB
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458475; cv=none; b=T2Rq0M+9AY6lgYvEqlsB+i8TSJeoAN5UXYxfeS78Yp4JWPZLNlxtK/hrnDYwBdsanNaEEL7rDW2qEjOTkyZxV3WKUMRaD5yZuv1xSbkPOUDubNvHFrzwTg7EevorG4l2cW9AlZNlOxfacOXP9oQmgP15jDyldYDQTAx7GvEzR3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458475; c=relaxed/simple;
	bh=SljyMxBKWr2CpealiW36AbaRGvWzkIBacD1hiSrvdJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XOx9wdKDhxs7QRgQuAeqXhvgs2RhqUWmFwPu/AZquCPvT3B7P+x7cv07myz67kmARZJgVat1EegCl4eICvkA4lGBbzAGth6cX0i0HtxlDNDX3U/cbj1/rJ2WaNLwvtp4nDDvCBJVr/2xHBiLF5CBu8j5JAtWu7997bjUYFFMs3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o6rSdA7r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QAGKFH+g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o6rSdA7r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QAGKFH+g"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BK8lL2116450
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 11:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hM5/nE+fuMDRbs1mg2VaperUxdMjUhS2Ee0Nt+KjhX8=; b=o6rSdA7r90kr5/sL
	/ulaUY+7hOWd7HrhkNWDjweP0N5jRvQQbVGXE5pv96/+kEYEBaay+aHwrCBRC3dT
	SXiyeS4NQSYenwMVsQ5s4Z991oU7LmRysyJWxjd6NzhMC8fCoeYXFIxrSU8wA1DR
	dcymgbtWe3DnNzgYAA/MlZ4Og0FMCmv+B7Smx7IGnEa9rgDf5NLpe83gAPxJMh8I
	Wxu72exx2O3L1PDeXKNU9pzPBUnB0VJBK6bCbn/O+VyurFWgCvdVTYIx4Vycwmpm
	WE6Px/jvfiKB3DOi7jMVmc7sT3uwUOepzH24GQEM8ykZs2CbkzEQaOnUVfwNYPEp
	vtBqLg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe52nkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:21:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e5cb9d39c0so21606385ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791458473; x=1792063273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hM5/nE+fuMDRbs1mg2VaperUxdMjUhS2Ee0Nt+KjhX8=;
        b=QAGKFH+gounJeBC4/x4zE0xjr8cMaxPNrsAZLpPac9Ud8Z6aLJd7K7oSXsIWDnzlVP
         7BEGxiM5FtAlon3ELwTCNz84CPzbd+twP4TTvxl6bOB305mscj0SBdxnLSqKHI7Ehf5a
         ZTDZPKwer6exkW5OjtFvtE13YseS6foTW8qHYReh9SFo7gBzD6rYJ8SL/F+lxGguoGpA
         1lhot0VkSZ8RJEzM0/xdQ8DTTj2f5kkTev+JY5CB6QNigcTWe+okVc7LqZNUG6qSzLf/
         4kRUmz7E5JAVO1N0JjfTupzkUE90S2rUPOR9Gb/DPEBF1RXn1k1ci/tEj+MsbnkCfI86
         gEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791458473; x=1792063273;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hM5/nE+fuMDRbs1mg2VaperUxdMjUhS2Ee0Nt+KjhX8=;
        b=FZ3cy9K7fU2EKWY9YdDKwPgQWkNuaAbWtHUPtDKvwWrOYQFQOvzp/gyw+uDDmGDEYB
         KUV8KxgpJILGf68N8cxVnjNY8ksPwrncJNBczwrS5+LWgUABOlNrFcOaqiJw1YU+EBga
         7Xj+zUrLAcGrcX8eOAFPOxDdK/oq9ETAGnnRmPbJmsEnd3O1GgCWAjAUY3WdN77t22vn
         7zWW8CsLAeIEaKvZKSDhhontRXpcERv5V0A/vt6twiAbbZC3f+YXx0KCy43YeevrNlf5
         fpRxT/Xkfsq3meYBp9l/zggdi0rmMuJi+PIuDjZsHRX5VqQ/L6Dxt5wlOqL3DgEZkcqr
         0TaQ==
X-Forwarded-Encrypted: i=1; AKwUvByaRvylU1a71jQtYfWwZyfraN8HFJpv8EB3fNQ5/kiqROtGId9wzNR9Wa7lKRMXSen91MJ2mDz7dlqjUtI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcML+JKsDqaCW2OucY4vJSGAic3cnuhkKzvM7XjitcxXyTXnS1
	ZumINjYYXnM19XwvtSrNRvEjhWCtAJWpC3aU3fXq9PU5DTG/I3+JJRWz54FAQwp3E2scOtpAUH4
	701Z9nBkoJlgqYkP3j61PjD8XBLGJ3PD/dzTZg4o/BJfvk4GOWBc63ADsSpYdRQmNHfo=
X-Gm-Gg: AYBFou3mu1unGBYqeKcyhzxcumHCzwFwKwnBUAOTcB462yI6bqUq0o9aM64Tj4KAWse
	qd9iQ+4QN2SgcOM9jZtSSz3+lB+ftlzfNav2wIydnWfrzOgMW1RrAowhGYA4xOAZhz7UlWi/z0l
	tEc7EKMXomTkCEeSV3zl+X7+nVsx0Y1i/8/xHeN1v7hB8ux+xHXEbKlMEaeHH6IbG9cxA5BensO
	BHu0kkd6AxNigHp+D19QBShYszf7P476wLcpUv0XRT1gF2rdJtKY61XC35AMDbsYnkdFW+DZMEf
	D8PJmilUHOwBZi7OmKhpZ2plKzcj2NYH9jdkHKp4dbsEavgatan2cpXXwzpp8g9XmX/07lVAQMp
	k+IDEXzLmrbG3uFSPsHvzpVVOhxw=
X-Received: by 2002:a17:903:3246:b0:2dd:ad74:ac28 with SMTP id d9443c01a7336-2e6004e1588mr46557845ad.26.1791458472902;
        Thu, 08 Oct 2026 04:21:12 -0700 (PDT)
X-Received: by 2002:a17:903:3246:b0:2dd:ad74:ac28 with SMTP id d9443c01a7336-2e6004e1588mr46557605ad.26.1791458472408;
        Thu, 08 Oct 2026 04:21:12 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60443810asm22367435ad.9.2026.10.08.04.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:21:12 -0700 (PDT)
Message-ID: <56ca274e-5b56-413a-9fcd-9ccf1631d8b9@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 16:51:04 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/14] ASoC: mediatek: mt8195: Fix tuner clock error
 handling
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Trevor Wu <trevor.wu@mediatek.com>, ajay.nandam@oss.qualcomm.com
Cc: Liam Girdwood <lgirdwood@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        cassiogabrielcontato@gmail.com,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Liviu Dudau <liviu.dudau@arm.com>, Haotian Zhang <vulab@iscas.ac.cn>,
        HariKrishna Sagala <hariconscious@gmail.com>,
        linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
 <20261005110257.50145-2-phucduc.bui@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261005110257.50145-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OVIDm-S-HOGRrq2W3qs_SgJmv6QDBud6
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac77ca9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=SQuuAJ8L7pDmPWVkXYcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NSBTYWx0ZWRfX0mvuyydwmbez
 /hJXgnmsMQp/6CtQivuTSp62k/vKrpfc07DKI9bpKUJmsjm5dR6zDX1ASUn8MmViDvH8fx3zT/k
 /M4JL51LT4MokFvRZ4F69omMR7CnUjw=
X-Proofpoint-GUID: OVIDm-S-HOGRrq2W3qs_SgJmv6QDBud6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NSBTYWx0ZWRfX20dpl2Fe7wts
 qofl4NVP4DKwycDnhRzE/EEyNVK++IRsDYtfooLCf7eXme+IE9Xxtp1TzzEh4C9ser7SG/kIJcZ
 ZkITKe8OL/6DaCqHkat3E/1DxeB1/AT5xTuVpCM+ggwvp61zzWomWjTR0tKguNxf8ihmkS/74rM
 UiLhbpL3FerLAMjATGHAy5lCG7YFZHvKGhtSdvHH8/Wctl1eiL+N5ymOrN9U2NVJxcPUskFyU9k
 1m2dugtPNisji2QC63AWbXCF6KijPhLKfu3L82GwfBnP54fUHAXFKFO707sadItBkJ4qi+/CrZf
 PY6M/fd5NfLT7u9DKm3V+Yc8QN7GwTUdjpSzV6L0fkWlF0qpQ16/dgNUoeqwBvB+vUIkzxqpiia
 bVwrbJfNMuK3S+la1RdPodhI2YQPNUA5IvQoGlyolbqCxi32JaTIRhJLBi8xlGZ/3t2fW0c6j7/
 +iOnDImkwmT6uTHuZuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080045



On 10/5/2026 4:32 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Check and propagate errors from mt8195_afe_enable_clk(). If enabling
> the tuner clock fails, disable the previously enabled APLL clock.
> 
> Fixes: ff5a90173d98 ("ASoC: mediatek: mt8195: enable apll tuner")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 24 +++++++++++++++++-----
>   1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> index 618d8400913a..ec1ea5b988ff 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> @@ -241,21 +241,35 @@ static int mt8195_afe_enable_tuner_clk(struct mtk_base_afe *afe,
>   				       unsigned int id)
>   {
>   	struct mt8195_afe_private *afe_priv = afe->platform_priv;
> +	int ret;
>   
>   	switch (id) {
>   	case MT8195_AUD_PLL1:
> -		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
> -		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL1_TUNER]);
> +		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
> +		if (ret)
> +			return ret;
> +		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL1_TUNER]);
> +		if (ret) {
> +			mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
> +			return ret;
> +		}
>   		break;
>   	case MT8195_AUD_PLL2:
> -		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
> -		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2_TUNER]);
> +		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
> +		if (ret)
> +			return ret;
> +		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2_TUNER]);
> +		if (ret) {
> +			mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
> +			return ret;
> +		}
>   		break;
>   	default:
> +		ret = 0;
>   		break;
>   	}
>   
> -	return 0;
> +	return ret;
>   }

This makes mt8195_afe_enable_tuner_clk() return the clock enable 
failure, but after applying the series I think the error is still 
dropped by the next caller.

mt8195_afe_enable_apll_tuner() now returns the error from this helper, 
but mt8195_afe_enable_main_clock() still calls it for APLL1 and APLL2 
without checking either return value. mt8195_afe_runtime_resume() does 
check the return from mt8195_afe_enable_main_clock(), so checking the 
tuner calls there would let the failure reach the existing resume unwind 
path.

Should mt8195_afe_enable_main_clock() also check these return values, 
and unwind APLL1 if enabling the APLL2 tuner fails?

Thanks
Ajay Kumar Nandam

>   
>   static int mt8195_afe_disable_tuner_clk(struct mtk_base_afe *afe,

