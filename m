Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792477609;
	b=G2n2qKy42Wa2Dnmx1uDbx5CFyjn4ThDPJOO7Ebz7EGlw+7llsCrsDt8wp7QHwvVK37TQ
	 z9J3b+I5OjNqb5qjSVyqKZG+t0f+L3emUYyvW0lZVpifYxFP254WGlE4e+yeBM5q4fQ0L
	 aCV3MldkrHBf+CdfHQOYdCF70OrcVPTMqgFS83BXxjc5YEOxd9jZ8BcPYD6EOVyjeCe19
	 mDcKjQariP11T+1ZDEcg3TC3LLIrUoao/b/99U1WyzLv77VeW72pDf9DARU9fUFEiHzXT
	 L+b01jnTdOBO7sU1gBWIKRJZ/zM00yYH3wu0SqGUsZEvQn0p/ruP3H1JMkI+2ymrxGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477609;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OGVkzcZ+M1GQJ/JyVpfuMOLzWiS8Ll/ZhIMxedWXdTc=;
	b=m1BF1aW3J3g9A7ZxZ1v2qnzVC/87QFP4f6UNVCZB/xIKxvZ1Rxqz2M+FSz4nrmNe/JCl
	 Ppv0hgZDTFMaPkd7sUa7DXnqMBZb7VNwTwcYYVOyYaoHyX8OOAisadh/n3ViNmyEWRhvR
	 O+zbh8Hdex3UAirZPtU6x00fmOnM5odRi/ZU1PQPoOfYaOAJRtc7Maa4gM5VaaQhl+ZX6
	 DAixfmdryA0qWkHERGJyRaXJSvuRs+e8vLHRdhGA7ugJCxcREweTiKp5vfNGhIesutxvs
	 hzyuYXfM+yQa5auNTpNEerGWpTePpXQKcIZX7h/vyiOtJeUxJSr4COoQS4DMtpgkUmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jRnqObHs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PChaR9UT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84560606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84560606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jRnqObHs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PChaR9UT
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tPeg4178143
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OGVkzcZ+M1GQJ/JyVpfuMOLzWiS8Ll/ZhIMxedWXdTc=; b=jRnqObHsoEjKRncU
	IdotiXEOHxdM+OdqLnkMtzgi2MdhXJSopjGkmj/MlJXTGHYhWJYmHx5w+BNE6dTD
	Too967m1zhsmFEUWOQhaqjlgThDQoY6kKMsYi1O8E23Qe6qfhRAf09XaHVv29+yr
	pKIqZM1xFpZotkqbSdisfNm/39W1ojTkBCsxFnLEDdSovwDeMPSX9NrI+2tKw4Sp
	Oe51u2gqqHgSsNhaPDtLvz4mWGLwCzi0E5yAARplUOyNT/2M2oz5odbKKIxzVggG
	O6YEDJetjv3UV/bm0I5QgFSjad75IGablrqIplth7prNx3nhMvKD0iS82dJDNl9x
	gd2J0g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n14tp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:26:47 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-919879b09b7so65050646d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792477606; x=1793082406; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OGVkzcZ+M1GQJ/JyVpfuMOLzWiS8Ll/ZhIMxedWXdTc=;
        b=PChaR9UT+V2tZ1ls4JuVB9mpTcvehTrRq5VqzA+Ojd9evOEIl5Hw/IJGaSVmHUUaIy
         9IaSihmVvsjAFmatGa+uirrMX0c3k42LIEQJx6h0oBjRsioznEiAgpP9T/hH9JaEgOsh
         QEwi6f4MC/Wc8bmfDb9tU6j8looEdexT8JyK69sBWbMT5HA/sDEdrah36GE0xQGwQAmy
         Hs5ld8yRgm6WHn0TYuaiKER7WdPD+/dSOSI7zv339feDxTE0+ADXs2h3+buNYm2oplsS
         o0vkHnHufdoxReKtnhhjwFC/+DUi+esrbwDRzaQBPf+gHezzxAddXoMRMH+2lLcdgJRM
         +8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792477606; x=1793082406;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OGVkzcZ+M1GQJ/JyVpfuMOLzWiS8Ll/ZhIMxedWXdTc=;
        b=cucq4Zk2CwKyq3oRuOqa41TTzwYdfAQnQ3OFqErMfN/Mn6I4HNt68Scp83vhLjd44/
         pgjWcec2uOnAu7zEFwmF+YyD0r+P6QCHcVeMxvW3ko3tA6e01YhC0dvNT6K6V7GMyGtB
         V3PuKTeRpQDU4qyOxPOtKb898GCmDJjeA39txzU29crw4dg9HjsiZZfhvV0o2FCiFJQ/
         vOMKKqz9G2MlCDY0skCyG936Nn3w/LKLbW+VwoL47I8U4yVNU1zoezT63mAVJWKLKLj5
         fxqU2yH7Kg1uSy9ENdhMF2BA99+bEWR8Cg2gLZ9gsDu+3oxZs38CcrgCdytliMDvbqgT
         bOkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGH+G0Ky8QT//a8qZDHcGny/zhweBuiefo3K2p8kUHhx20vp8tuqn4bjYyQmKbQw+QrBPv01yJ7vMKfsI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/EwChVc+UmbtqhE3oxvQt1lobMP7WHGFJ/Bo2lmT6kZd3wdiF
	q7tdDX9efTvxO1HS8K+F4geQW2ldXgSBSX/FnGvGv2yTyNIq9U+Uj4nwMUIZ+kvnQFUi4WNLeBJ
	h/P6LTRT/B27vAdHGNl7b76m6i+gh3MTuruAxwYMjylXi+/ZtfD1yECEsv8EoA2rWrVA=
X-Gm-Gg: AYBFou1h9GlVCYGbKBl79xLuOQdUSg+d7Y1LV957LgVo0ya4Rag7dHqW6NDlA2Y0liV
	GcFkH/69GYa3NHOB9V6tDfZ2lrh7+ZvMs1+Oj6VetB913n2KEral2fEZZsjTznlkcVkbD+A5WPz
	9q/oEaIlGv3R3AOaxjMs3jWhD8gJirF311K44M3VPF1uklUo7YeoGZmkety1m9jVxlIobH/rGmU
	dOOu3OzFD8zs3rmBUe5cMSHcEckjTuaQg8rrG3jSeUAP5PGN4ri6xZwrTuuhfksyO63ORJCpwfm
	ZlX2PS18sEBHP4uxxKcXBPC8tTLfy6b0DqHXjFJ0A26MliNx4yhFdQSJV35QujZZku8bOKKOb/j
	aNObU3ITCj/8hiG12ivu99l7Fhg==
X-Received: by 2002:a05:620a:1991:b0:93f:3e39:efa1 with SMTP id af79cd13be357-93f3e39f10fmr881919885a.23.1792477605803;
        Mon, 19 Oct 2026 23:26:45 -0700 (PDT)
X-Received: by 2002:a05:620a:1991:b0:93f:3e39:efa1 with SMTP id af79cd13be357-93f3e39f10fmr881918285a.23.1792477605265;
        Mon, 19 Oct 2026 23:26:45 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e1d6dd2a2sm4074666f8f.7.2026.10.19.23.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:26:44 -0700 (PDT)
Message-ID: <56af7a4c-2212-4397-bb96-d5ba524ae9da@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 07:26:43 +0100
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
Subject: Re: [PATCH 0/3] ASoC: qcom: q6apm: Fix shared memory unmap
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016141153.1346219-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20261016141153.1346219-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -Wy4oQz9ouDtPsEWjdb4S0g3jd6c5Ws7
X-Proofpoint-ORIG-GUID: -Wy4oQz9ouDtPsEWjdb4S0g3jd6c5Ws7
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad709a7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=2d4p9qffbK6MGnQiVHYA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfX9RZIc7mlmRfS
 FVANne1Z2GI68hLgruwV7qcJsvdkuI4kt+wCxBeUbbEGRT9Pc8SuPrwGrp4DFYMrGuHs2TRz1z5
 UrGgQEaJRc9c/TgJel662t0aZs0T6j+YUZ/jBYJda80Q8qE/66T7rVk1n7Z7HssfsepdQK3VFYw
 Of/6a+cLxy+mXsOtPJMGBq7Vqk89qHqjkmIIFetnLTGaYVXH1uwOCCHyrN9aZqKtCY7mqfIGwkB
 +X4dxfXqWEOrA0HyAbx8SfGegWuRuQUMPkY1cu8fBY14h1yKaVgdwadldSN4WfaePvGr+2P5bHl
 4hqncJ7uE3ZjIzGTDrW7X1mvFEkhuiNbc3MGSb4CsbwJEo525Xv2DJT8CoApnVS+V5gqXzdMMtT
 UYtzmUJ6j1NPdAbkS59blQ749Ld8W3ARIxV4bSaO/EpozoTESlDqZ8J2x8vSlN/zD00hjuOadZf
 NeNHznxNg42ALYqepTg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfX0Xxe2Sh68uyY
 hwW54Sl8koRphcC7L1jWZsi85o3QNumL/Up8yH79ueaEIWdftKTBvReTBcj4tKmDX3LJYkYaj9v
 eXtERUjc4nfFz45XfHmScO8EN1Xw+80=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200025

On 10/16/26 3:11 PM, Shawn Guo wrote:
> Since the early buffer mapping, q6apm maps a front-end's DSP buffers
> once in pcm_new() and unmaps them in pcm_free(). The unmap side has a
> few problems, which show up when the sound card is unbound and bound
> again, e.g. by unbinding and binding any codec on the card:
> 
> - The card core removes the components before it frees the PCMs, so
>   the topology and its graph info are gone by the time pcm_free()
>   tries to unmap. The unmap is silently skipped, the DSP keeps the old
>   mapping, and the next bind fails to create the PCM:
> 
>     qcom-apm gprsvc:service:2:1: Error (1) Processing 0x0100100c cmd
>     snd-sc8280xp sound: ASoC: can't create pcm MultiMedia1 Playback :-22
> 
> - Once unmap is actually sent, every command stalls for five seconds,
>   because the response handler matches on the wrong opcode:
> 
>     qcom-apm gprsvc:service:2:1: CMD timeout for [100100d] opcode
> 
> - Unmapping the position buffer clears the circular buffer's handle
>   instead of its own.
> 
> Patch 1 fixes the unmap response handling, patch 2 makes the position
> buffer unmap clear its own handle, and patch 3 moves the unmap to the
> APM component's remove callback, before the topology is unloaded.
> Patches 1 and 2 go first so that patch 3 does not introduce the five
> second stalls.
> 
> Tested on Qualcomm Ride board by unbinding and binding the PCM1681
> codec.
> 
>   echo 0-004c > /sys/bus/i2c/drivers/pcm1681/unbind
>   echo 0-004c > /sys/bus/i2c/drivers/pcm1681/bind

Thanks for trying this case and fixing some of the issues.

Can you pl add Stable tag for these.

Other than than they look good to me.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
> 
> Shawn Guo (3):
>   ASoC: qcom: q6apm: Fix unmap regions response handling
>   ASoC: qcom: q6apm: Clear the right handle on pos buffer unmap
>   ASoC: qcom: q6apm: Unmap DSP buffers before removing the topology
> 
>  sound/soc/qcom/qdsp6/q6apm.c | 49 ++++++++++++++++++++++++++----------
>  1 file changed, 36 insertions(+), 13 deletions(-)
> 

