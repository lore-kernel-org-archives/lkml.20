Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105349;
	b=20A+gnk1obLxdgqk82XJRJrlWzl0Y7SRgjCVK6vpM2r32oBj55xX+FVlT0NRvXudvjwN
	 gfsM8LPAUN7/mp25j9fddv9etJtzpHOzuofQ31B1CmfU5LzNlPP/mDMt1haUNrJIxK65n
	 6eB69DtCIK3zD4k1J7W1LmAGpyAeOpRNbdXHOit2o1gYm2EElxVsA1+dIWKAPgYWVtD3r
	 76DxbJdYgXHSt64ej2/orZnwPu5UR/DY9sKYOLiNljiSdnrKYzAlqcHGSWq8ZzmZ12vLN
	 C3a08BtBe6mQSnhPFaigrXwapIMd9fjhzrjxlbfzlUaXgZtp4ncnuj1PznmuGUxSbPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105349;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B6i0VZjdMNofz3Aed0OU9a+yiRrgaLLAM3XHzMWxxWI=;
	b=MtKVLhFa6q1m7iJdLLRU1s8VO2DckwdGrrdEWtUC0nZ/InYt91TqPFOQXCCTgFwgVSe6
	 0JSmNy02Nx738kyhtvJkuKzWw449nuz0U6MFPOApNonDuyxsfUucWDXvyZMlV4avWwCpy
	 ps1unqd2e0UQIX+Ipj680ZwLlP5OkzxjmR/m6U9SpIwLW36waPFcL6YA+m7YrLncn4e89
	 QB6z+j5TqDDd5iria+GwCQAvMJUQAuBQqLBHHSBxV6OWY014LDtEqYV8cZ7esLN3IOuBu
	 VI8LaInbZvvP1uBbJQITedXO8apzOWq2bVlJdzLJ6ARflx6H8dWSOkzMh+u9J2p71vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pvEZM1J6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ITQnFn4q;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266B9606A335
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 266B9606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pvEZM1J6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ITQnFn4q
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe3Zs1935891
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B6i0VZjdMNofz3Aed0OU9a+yiRrgaLLAM3XHzMWxxWI=; b=pvEZM1J6VTirReTO
	sy43gTSU4exZ89RBdk5fizvABRRYEYr82ffYoZ7bo4kqmkxgjNxilbceGISq3h5r
	qoekekSrX1ubiz/mUyDdDIrs/l8Y8eM9myxkKkHwsKaE7X4v3AZ5+HyftHk4wP/V
	sWjfZHF7el+bCBvlYNTMHqJiasEtI1vikTrx7Say1AJzG1E5gDj9RSgyHpG4SLU3
	lmHMCWYPcRYKgZfGBGi1sV9QSW1JC85EkfGGtJWEeeVWAmzrUzRiLL0TMZOp6jLb
	pssHsXa1rGMRl33+CnbdVyaL35PS1jiNodL+RsLo1AJRIQlq3i1ZUXoesz/GdxCK
	ISQUFA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavtvnb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:49:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ca9b53afaso784083885a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793105346; x=1793710146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B6i0VZjdMNofz3Aed0OU9a+yiRrgaLLAM3XHzMWxxWI=;
        b=ITQnFn4qc6H/ZTtGdt4fpD6ZH3JdmZ5obmiKnNt4w3d5Tj105PGBxdc8RdW0XHd6Sm
         RKpxoR9bPBaR4IJoodliSOmw9ZBiwqWZvRYy/ShMvg6Prv3SHg06MwMaBcEZxGH0r1VU
         Mknv2hO8DrWnMVH6hisaEH+Alu+lyfMykv78qgfvijcR6ip3a9/dTTV7smrbeM02XEp5
         Qkb0yhffVMEmsPXMnYhC/gOlTTQcie/puvQ86H0ydHExHIXJ7nCqlyRWoInT8CdRSQJ+
         MmIDz/sMClgtZFqYn3f/W08o7OWwF/0yoa73rjfb9m4pihzR1Ccxai4OXakCUSKSFQd/
         rFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105346; x=1793710146;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B6i0VZjdMNofz3Aed0OU9a+yiRrgaLLAM3XHzMWxxWI=;
        b=Zx6+bMTrmRrtJaChDTOsGAeiBPsb+XQfPoFw8UYA0rzpbXUqwVDgld91aZlthE2laF
         ksj11wyfAIafYwDDc0WSN5TeLGjpTQLocRqqdnPDgcr25i0PEJ/sVYTPwuv+6RUrzBZU
         WGnekbkVPGl0AeflNVLpD6PBtm7tbeqO9aTpX82SheqM80S0VKEURp3nlyZb+q/ZJJzz
         gJh2WqMKW38mzBnGrccFNQQAQJkatqYhlV9lmH4qibSZF0UKXZY+tqT/oNDAAL7G71l3
         oEi0VRCBbfPs/nb4XwcuXqP86S+jsgT5MjvBHE20LvFRtrb+vBl0PpT0P1pP2oHbiuy4
         3dGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwP7UsOT9N0G9jhgnR6ZXlQVduVx/A26oO943556UTrDair2b3b2maxDydJKaHH4L/0VjbyEeCalMEm2vk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKljRthnwGKLc1970J403TlYp8xkc4IG7B1n/j6Q9TybeaBOs3f
	I0kGagd37Hv8SIfEbWut26xJDf7uewiyIfHjCYU0Drj7uGoSBdgLz02wMItirX3K5JL4/VsOnBB
	LniOgH5hkDz+fE9dnLYYBtlRoKCUlZYbFKQ9t6ynBLkJni/kV9NC4ouZhVR5g5TJok4o=
X-Gm-Gg: AYBFou1IHLXAmT9KDTw/YPIn1jX+oDRm76G1br8de9L+1EgkJpwCKbMDalz0Vf5kenI
	CUJwEylfjPxvyVzbm8x0nkPJNQ6d57ypCrpDGbOQywTUNikyivIJ9jTDbAtcJJtYIpH0LlZMR2P
	/u9/awBO12Y8zq0HBhcB+7rZBbXvTYY+Pz0UnvkSXWE8rdL9v8rR9jZXSyoMv3gegJPY7xY8ULs
	kMMwN4gJJMAqb6/vQX/HUcPvyJNeJDOAu4uaFdqe82YOzYX0gfqZ0f6DzMVlpdTS/Juo/UF6J0L
	PZJv8YQOzCRMYS3xViPQ4t3bNSU3QlCTT2Q6P97tNb8ycX34FFh4Jm0lsofFaBJHGyhTt/LcenR
	VfqEjOYLzyvm0lAGpsA9ut79jhQ==
X-Received: by 2002:a05:620a:1793:b0:93f:22f1:97bc with SMTP id af79cd13be357-940ef92a726mr1444844885a.67.1793105346319;
        Tue, 27 Oct 2026 05:49:06 -0700 (PDT)
X-Received: by 2002:a05:620a:1793:b0:93f:22f1:97bc with SMTP id af79cd13be357-940ef92a726mr1444839685a.67.1793105345698;
        Tue, 27 Oct 2026 05:49:05 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8ddasm24864371f8f.48.2026.10.27.05.49.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:49:04 -0700 (PDT)
Message-ID: <8742f177-07c7-4090-a94e-61c7b7140110@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:49:04 +0000
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
Subject: Re: [PATCH] ASoC: qcom: sm8250: Limit RX digital gain to 0 dB
To: Filippo Falezza <effeffe99@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261027-sm8250-rx-gain-v1-1-386ee6d971db@gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20261027-sm8250-rx-gain-v1-1-386ee6d971db@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: X-S9E1Oz9dUaEMTbLN3u4Qr_U4UtsA7A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX2CymRL0CPZCP
 DkOMNY6uwXEw4Q0QXHba50k+jSXV/aUXCOBfwJ08Jj5Fwt8hqxPGCgh5pDM48FeEiUCCg74kSGh
 Y9I69JDRZ9HuC9D3hilBfwIV/UHafkQ=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae09dc2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=K-x0tJcdpy2S_AuEE9cA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: X-S9E1Oz9dUaEMTbLN3u4Qr_U4UtsA7A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX+QwcNMbfMX92
 6Xe2r4t2BD80umxsaofsrosiK/AhiWd5Yya+ZrVZ9b7UKOBLEQ1jRZlwXg4ZwmsXB1nFMcnxgq6
 AW9YqVImQJBGvL1Sz/ZsWFUYBCrFDtlo4P001ZnEuianmKKcbrdlqtKt66gItlljNnU+O/4m4gI
 9Np7Tc1gnZCB+N18BjaUWXPbDj+sh8lE1nsl0FgHAXac08yrLfAvRxINUeCPMchcog/Htc3+vtI
 wrCH5mSgXpGsvVUYh/ACY5dImKVwuFi7KJzV3f/0RL18jALi3ckYlEPA4izgG4yOdoct8UAhsSV
 25m0ZP5FquOyp3iMEWGKo5hqYQVoebyelK9Wv6t/W+M3MP/BWGYLkmMHrlqlgTOoj1erftXbRIy
 NANWWaOuAJkc7qiburgDV/jkLKr35puJeI22AJWJmXhUc4uOpIGAt2QUR6K0DlfJF1vtkVaavU3
 OIpEjuS7ikFDeJYJW6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270050

On 10/27/26 1:33 AM, Filippo Falezza wrote:
> The RX macro interpolator gains ("RX_RXn Digital Volume") run from
> -84 dB to +40 dB. PipeWire and PulseAudio map full volume to the top of
> a hardware control's range, so a UCM device that uses one of them as
> its volume control plays 40 dB hot at 100% and clips.

The control range is 124 steps, its should map 124 as 100%, not zero.
> 
> Set a platform limit of 84 (0 dB) on the RX0, RX1 and RX2 interpolator
> gains when the RX codec DMA link is initialised, the way the sc8280xp
> and x1e80100 machine drivers limit their WSA gains. 0 dB is the default

The reason why we limit this in x1e80100 is due to missing speaker
protection. Is this the same reason why you want to limit this range?
If so please update that in the comment and commit log.

If not am still failing to understand why do you what to not want
1-124 steps mapped to 0-100% volume.

--srini

> of these controls and the value alsa-ucm-conf's rx-macro init sets, so
> existing configurations are unaffected. A control that does not exist
> on a board is skipped.
> 
> Signed-off-by: Filippo Falezza <effeffe99@gmail.com>
> ---
> Hello there,
> 
> this caps the RX macro's digital gains at 0 dB in the sm8250 machine
> driver. I need it on a Motorola Moto G 5G Plus (SM7250), which I'm
> bringing up on mainline: its UCM profile uses "RX_RX0 Digital Volume"
> as the earpiece volume, so that the volume keys change a hardware gain
> that also applies to the voice downlink, and without the cap 100% in
> PipeWire was +40 dB and clipped badly.
> 
> This touches every board that uses this machine driver. As far as I can
> see in alsa-ucm-conf, nothing sets these gains above 0 dB (rx-macro's
> init.conf sets RX0 and RX1 to 84), so the only change for them is that
> the controls no longer offer positive gain. If anyone relies on boosting
> the headphone path digitally, a per-board limit would be the
> alternative, and I'm happy to rework it that way.
> 
> Tested on the phone on top of next-20261021: the earpiece volume follows
> the volume keys from silent to a clean 100%, in media playback and in
> calls. The patch is on top of broonie/for-next (f3c7bee984aa) and builds
> with W=1 for arm64.
> 
> I wrote this patch and drafted this note with the help of an AI coding
> assistant (Claude Code). The testing above is on the phone.
> 
> Thanks,
> Filippo
> ---
>  sound/soc/qcom/sm8250.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index 5866f1f34b3d..d776a17f1fd3 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -39,6 +39,16 @@ static int sm8250_snd_init(struct snd_soc_pcm_runtime *rtd)
>  	case USB_RX:
>  		return qcom_snd_usb_offload_jack_setup(rtd, &data->usb_offload_jack,
>  						       &data->usb_offload_jack_setup);
> +	case RX_CODEC_DMA_RX_0:
> +		/*
> +		 * The RX macro digital gain goes up to +40 dB. Userspace that
> +		 * maps full volume to the top of the range (PipeWire, PulseAudio)
> +		 * would clip there, so stop the interpolator gains at 0 dB.
> +		 */
> +		snd_soc_limit_volume(rtd->card, "RX_RX0 Digital Volume", 84);
> +		snd_soc_limit_volume(rtd->card, "RX_RX1 Digital Volume", 84);
> +		snd_soc_limit_volume(rtd->card, "RX_RX2 Digital Volume", 84);
> +		fallthrough;
>  	default:
>  		return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
>  	}
> 
> ---
> base-commit: f3c7bee984aa0ba2b48a44e16a6f3ec2c27f851e
> change-id: 20261027-sm8250-rx-gain-70cba15f0c1e
> 
> Best regards,
> --  
> Filippo Falezza <effeffe99@gmail.com>
> 
> 

