Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101554;
	b=N3bzp3h60gAfWEs9EysfhmGyWwqlBqcR7aNdzBPr6eg0iNZ7PQDHwX1vHIEIG+77oThi
	 Mpw09Nqsu2elQs7XXmcGnAkaqfPVN/hJxLuCvSUG2FIXt1arRZSV3MJNYJnkZUecWcoFh
	 Ceip4UWfTWu6tl5fYSr9HMH2JVFRc5RtxdFbLOG7fs6Ra3IK6lZw+KPY3y48m2YQ200vN
	 a8e0/H2WZnGGKdGIAWQPD7JzOP1Xy1Jek2A19s8L6q+cvLPcRy227D8TOtLhb+W+jzFWQ
	 tyY7zb8fBVnSXLMo/9lafs+O2LhU5fKVeufha3Z3xPARSjmU7yWzSeC1Ok8bw2JXqYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101554;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FHZ3L3w/nQsHnq4C5s6ko+sKq7e5bzoOBk35gbUopEU=;
	b=UHDG3Ws3LtQroW0WApMtabr0C4M2U0MDxh6bZofuD6L6ywoYAJdCi4MIHZi8ZIAaKiBR
	 e0A00j8nyV9CB3AUJsnd4HhcEAJmqaCgFbSvIE1CD5HtwNaTWsaE8M7gjQaBSAcXehO+p
	 Osb5VXCv95vgE+j8DoqUgW0vBu12difmPd4y7S2lU6y1jrMAXr6+CBaEXMSjytGfcEOuK
	 ctyui4mJnflAiIeL6bZGrVeX0xzsIETluz/008lJG5mEbQB5qUk9b0PZIuq155jIxEmJD
	 UOer7wTeBEiy8OPfizr0gMn1yrHwFpGhbNefDHT8QSLcWx7LPItZ1061k+mAWWF3KsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kdxITGZq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ac0lPHeF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD6B606A325
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DD6B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kdxITGZq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ac0lPHeF
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdv8R1921719
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FHZ3L3w/nQsHnq4C5s6ko+sKq7e5bzoOBk35gbUopEU=; b=kdxITGZqAL5vXUBU
	csjRLcMTe26/jnRHPSiovzugjcmSTCmLpiBkIE6EWQmx1kCdRFcmN8Cqa0yIlqxv
	KxusEm6LOiQgcyD4HMG+4eXfLtVUUw2sRnX4adJJs1xKgJsAzT3EKAccDGYrr5D2
	/byIDegbV9tRVE3AmWZsfEsL4Gvfq9ENXwIt+g4k3aewCrw/4dZJH6VE6F/4poT6
	PnvZkla5s879VbKvOtJx1RQRyNywABxZphy40rorH3IxBpdK3R7HvIqUziJCYebJ
	QwxQlpSYEDVSAJhzSLUnr1w+ZTYqePEzEc8yx0/EpsEHEj5ZyPwC95oH7lccm4SS
	6UXKoA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq68pap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:45:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab926c236aso3697099a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793101551; x=1793706351; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FHZ3L3w/nQsHnq4C5s6ko+sKq7e5bzoOBk35gbUopEU=;
        b=Ac0lPHeF7rTBy8he9qrcXStmMTDkSKWia6VilJK47R9BgQ4ThoKVbdVbUiitxTejr7
         aUa1nGP3IN90VJ+wT4c6vv3hV25dZsuGviA2HvKY+YAefOWiFMdcaJ3j2fGhk9f1e/xm
         /BStuKJpt1XjvYeIWF9ZxsQeAm1fi/VajiUAbEqAvjBy5GlIlUditGhJSU4zFrxiLuSo
         rPhRi7CfjZdQtXjSsHWV9HX6ZDPrB9BHkbAq3n8GLghWBaEkSJ3ifaw+gcYi8onpaEOr
         K+mNFaLj6Vtt/Z77v9bVJxxO/EywxA5/r2XgFDUBuBTQ/b2GBkQuokd1fFeu1/2f9w4S
         cI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101551; x=1793706351;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FHZ3L3w/nQsHnq4C5s6ko+sKq7e5bzoOBk35gbUopEU=;
        b=eWxJaaRuSufXP2RJp7X7aA6bOgTACA6AW1kEGz7EdyPHOYh9+kE9nrfFnhHI2C7EJl
         yGMlCJM8lByXPPSUxRE5UcZFaxg2tMnGs24UEloNtuRuF34/5mad2a/z58Yr6ortP1WG
         Lt1rMUiUT8hrS2BzsxHsunVQXoiDmLhTzx4pWsE9AckJeVhvus0ExeVPo/GcbScGlipF
         ZekSv8AXu6Vj6p45V9e4ARk0ZJ0Naf/V5wYHBksd2XAXJ/kN6ogGScOTkvFjdKI7G1Cy
         fWztP1o3sQND/5LKxbccBc5VJmNC25dOJo0U8Xu8Gc/buApfGdx7hBAx1fB5ImiR0CuP
         VvZw==
X-Forwarded-Encrypted: i=1; AKwUvBxsQ0XVth/Iv632vwS9jVIdxF3rIMYF6CV7oOgqrn8qowUMrfCzJnxZnSF2TQDXtC5ccft+v/n0HDSDKL0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKev87FYQLoK6QdU9r7f9TCOnzHqU976PpN/UP74GQfe4OHDCmZ
	Y1X/WmX8pAs3N+XHrq14BbZOvWSqWLr0Vyr+29+dqB1pVG/XA/tWDfKnQ7HvZTrsgsnsIEdM4kL
	hQ+LnbWRNK7dhTl8sECBospNKLlxAOhlt1Rl8+ZX9o/0jvf/ODY7pWaHGtcg2AmfQrYw=
X-Gm-Gg: AYBFou1rhGKD1K14WVKv+ekax2k7lJIiQRMXUlzD6es6DmpCMf1rMv5WqX3dmukv89c
	kpaNKWyITxVmyF8FBx2vIMdCPjrdzJAyluHeehbyUeDECszU9YZpQWzf+t+BrFFg7xyXOMFPaIs
	RYswS2zCFfGl8NuyC2A+qjMY1BVJW3GXn3/qN8hgws6wqqqpEYLyu4BDC43mRrhLZNRDzhczKrA
	9I4ca6HmeDi2ys5F291wivzMmAprpsU7H3UOOCaHw2D1oMkqomjQZnnzubzD+rrG7GXwEoAWgUr
	YgH4j7hc9y40/B24A1Zl/p0aXNJ/ZqbHUS4tIEyjqJelfaIrXd67wLByCpj+2ylXPNnXmz+muAr
	aVDxaAskBPGsE2AhDMQMVKeCQ1HkMVITGp1U=
X-Received: by 2002:a17:90b:4cd1:b0:3a8:1943:cb7a with SMTP id 98e67ed59e1d1-3adead44808mr7362650a91.18.1793101551309;
        Tue, 27 Oct 2026 04:45:51 -0700 (PDT)
X-Received: by 2002:a17:90b:4cd1:b0:3a8:1943:cb7a with SMTP id 98e67ed59e1d1-3adead44808mr7362618a91.18.1793101550775;
        Tue, 27 Oct 2026 04:45:50 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.196.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40651560sm3607876a91.13.2026.10.27.04.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:45:50 -0700 (PDT)
Message-ID: <3f03403f-732f-4f11-ab82-5f701ee8969f@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 17:15:44 +0530
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
Subject: Re: [PATCH v2] ASoC: qcom: audioreach: support multichannel PCM
 formats
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com>
 <2936b4ec-3203-4137-9d29-7f95f22186d8@oss.qualcomm.com>
 <CAFkd8hsoWa9t6ySWM4o-xgm=mO=_RFuWJDVrCb1u+Zg-eymTJQ@mail.gmail.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <CAFkd8hsoWa9t6ySWM4o-xgm=mO=_RFuWJDVrCb1u+Zg-eymTJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae08ef0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=AmwRsAfReRvrMMgzn5YP8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KEe7bkdQAAAA:20 a=EUspDBNiAAAA:8 a=UJ03Ntq0HI0srxpZ4TQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: jPZScPISdawpspBfXbdTNQURPPrYrJrS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NiBTYWx0ZWRfX4aiZhr7WAO75
 j2dQzx7G0lX1x4vdLbhUadSdXO3eH9nLUfyuj97SDXpU38nX7OZS+GcvM/vYwPyTJbQ9YRydnyu
 Z1XralR19WItd5vEGJQflYqYmAlACSA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NiBTYWx0ZWRfX4ZmDe0vm5oac
 q+p0bBx0T63NfgJNsutqckz6blxd06wzrHeg5VeTYA5K5Gm072/5Lig31EYF7zhingzSVAcLmXR
 GQvtBod6PbKFJyR6cqxU5kHUWb9FQDLhGn+gWEGfquqHo07c5GjftkFIXoAVF9dMt8DiHLf7nfv
 CrjvT5kzDhpKmOr8sUE28Gc6fv0zGbd5Xp9eOr6pK53l2kyPsL1iNtaxuULcNadEJbH5inEmRQi
 pzHgJd26413QLvCpk5/PTO7Xn5yO/HbrhtUHPTceN5Ic/ve8Y/FwCIK9FR8xR+UO6Ds2tapQtwZ
 9Vsx3g85nb3XWQFs2ztU18uU9lS9ciuwioNZ52gm7baCMxtERD3o2kh4oG2iqDGKn150aM5UCTw
 4RZhzwJXlEMXDJvh4B0zUHdYF9UlaTGLQlDfIAgk1SWDeuQOJI/AN7gQ6CpEtn+Tog8Vq9z5fHs
 OFyxNooPBzuBZQ1Pk0w==
X-Proofpoint-ORIG-GUID: jPZScPISdawpspBfXbdTNQURPPrYrJrS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270046


On 10/27/2026 3:25 PM, Zhangfei Gao wrote:
> On Tue, Oct 27, 2026 at 4:46 PM Prasad Kumpatla
> <prasad.kumpatla@oss.qualcomm.com> wrote:
>>>    #define DRV_NAME "q6apm-dai"
>>>    #define POS_BUFFER_BYTES    4096
>>> @@ -344,7 +345,10 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
>>>        cfg.num_channels = runtime->channels;
>>>        cfg.bit_width = prtd->bits_per_sample;
>>>        cfg.fmt = SND_AUDIOCODEC_PCM;
>>> -     audioreach_set_default_channel_mapping(cfg.channel_map, runtime->channels);
>>> +     ret = q6dsp_map_channels(cfg.channel_map, runtime->channels);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>>        if (prtd->state) {
>>>                /* clear the previous setup if any  */
>>>                q6apm_graph_stop(prtd->graph);
>>> @@ -1007,8 +1011,10 @@ static int q6apm_dai_compr_set_params(struct snd_soc_component *component,
>>>                cfg.num_channels = 2;
>>>                cfg.bit_width = prtd->bits_per_sample;
>>>                cfg.fmt = codec->id;
>>> -             audioreach_set_default_channel_mapping(cfg.channel_map,
>>> -                                                    cfg.num_channels);
>>> +             ret = q6dsp_map_channels(cfg.channel_map, cfg.num_channels);
>> |
>> |
>> |q6dsp_map_channels()| changes the mono mapping from |PCM_CHANNEL_FL| to
>> |PCM_CHANNEL_FC| and does not handle 7 channels. Have these cases been
>> checked and confirmed to be supported as expected for AudioReach ?
> Yes, have checked with Rafi, should be PCM_CHANNEL_FC.

Thanks for confirmation.

Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad

>
> Also confirmed from audioreach-engine
> https://github.com/AudioReach/audioreach-engine/blob/master/modules/processing/bassboost/capi/src/capi_bassboost_utils.cpp
>    case 1:
>           if (PCM_CHANNEL_C != format_ptr->format.channel_type[0])
>
> https://github.com/AudioReach/audioreach-engine/blob/master/modules/processing/Virtualizer/api/Virtualizer_api.h
>    uint16_t channel_map[0];
>    /**< @h2xmle_description  { Payload consisting of channel mapping
> information for all the channels. \n
>                                The channel mapping is specific for
> specific number of channels \n
>                                for 1 : [PCM_CHANNEL_C] \n
>                                for 2 : [PCM_CHANNEL_L, PCM_CHANNEL_R] \n }
>
> About 7 channel.
> If hw requirement is there then we can add right.
> Currently no qcom upstream device is testing 7 channels,
>
> For example, RRD 4 chanels and Ride 6 channels.
>
> Thanks
