Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739844;
	b=nw7t9rw8weuR1iA59ipL1OtcpZHc/JpC1uwFyvwh87K4sqrYyeDBl7SyH9gAtSeI4hZu
	 bjTQEplDgOn+dn4owP2czB0zyfBaVL+dOjMPzJI4NMWl1+GpRDE58+b9O0LAT0pZUJp42
	 0DNvt8RxnCJt35ZSmkAK9TX3v6wX6C42A6ovbHoI53beAP2nJ6MLeuonieNDFbENiMKtK
	 Vvf9BUUHpcYcTb0fQeQT+ZxVFpdSZaaLcV1YCCg4gq7NPY6FSClVcaqCkVpbasczTR3uJ
	 DAn8j19VfnLEF/fmJDZyFRBQSzjfeu1/FWUpyxpsDO65XNiNsiaDSsk03dCHqBXrIrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739844;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yop3kT58qwR/Xl9syoWFG9U+E8lkKWEQu0m0TSWLIwI=;
	b=Yvl5x6+jzKWoMXZJeiffjVwCa1ACe5tuLGAHnmRgjGJu2n7OUlQIKEj9cuSIgJe+JFc2
	 KAYb4JXF4RXacaa43XMKytrEnup0R+2VDoqh3k3ISsq2HEHApSarRR3/gp5QMpb73yigl
	 OR7Jnw5VGcJRb5CvRPlcx448T+iD2gmwNHJLU/MmxfYzybdI7ZyUBHWXpwaViglmukHS/
	 VeA0eZKlfW4Ad7KRhsI2kgtwIsJNylQaTmG/bbUnbw/h1alVXTxJHiON/mYW5MBeZESud
	 MQBHJURY57b6fZ/9AWC0fROMxOGBsV3rDmibX3n9JHwpvG5Is+8Ct3XXv7zw1pCOJJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ijrvIHpc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y3Yv73kt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBC6606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CBC6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ijrvIHpc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y3Yv73kt
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF7wHdW536698
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yop3kT58qwR/Xl9syoWFG9U+E8lkKWEQu0m0TSWLIwI=; b=ijrvIHpcx1qBsm/w
	KRn/rKQhmJIZZITCLfJn+vXLjrNa2aSnNocDk++/FFjH8WFcKFnJZmvTkHV8phHo
	yAZRwMNRh8D24gGbCJKSGCx2qfN5ykE5WBjtaONIySRe4rV8dn66JkE4coiUAhzZ
	r7uctxYvOOLF3Bm+DaVZ0IcWMtcIEMIFx0CfvnBkAf+7XXoeTB4ztux2iYFKSjoN
	C6NPO+7OQoB1srHqlrsVtKkF7JTCroj6nK7BNo47n9V3pNhnN0x36cgRf0O32VFD
	N1ioCfIXFOPcve9Ncw6f0cq7I7BXsrvfrHtPD76rptnj1/vQ0MzMKT4WI9y8DJ9C
	eDJosA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmcara5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:50:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495dd0f07eso396285485a.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794739843; x=1795344643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yop3kT58qwR/Xl9syoWFG9U+E8lkKWEQu0m0TSWLIwI=;
        b=Y3Yv73ktyBlryfyygYNaH8G9mu7fuR/HKeKj/XBwmDXFnjO96byQy3FHuxR6xRs++2
         ts3CuhlfLUUkr9QwiXqU4FBcY2Nj5EvVAWnV4Q8Z8AEloUeYD3HjVlep4OmmoAI5TI/5
         F9TI0UzZO2VqCdQ+Gfckvwgn3F0UiGO4hxrmwmj1hQRufmZk+Phi2zYrpKP44yr2gX81
         58WC50y80efXQjIaG9lM0V2WWdNhbF5P405sU4XADsFiESbM0FrsDTP2Yrs+iHAn+6Fm
         EXu2ZE+jwhiGZlCWOEHiQOuGi7cl8R1aMgQwQnUe75amxrK1gJLrIX7mDJYUo1EPZLB5
         TtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794739843; x=1795344643;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yop3kT58qwR/Xl9syoWFG9U+E8lkKWEQu0m0TSWLIwI=;
        b=j8UaQser8dKQc0lIQK4KC+hJjLj8jt2XMKGawg7k64QnNzlfCOESbDeDqIXyLqSc1J
         pXY99xD/AvMLUwDNwZJf1yH27aryOFwS5GC2cRrOE5/SoKt5nCue4zKfrxyORdebm1Gm
         xkZu3o8dgCjHac/nYBK28G3Zehb6G8JGKEBUHqvZ7k8rmiWKuLIildxJsA6f/HkZBNt2
         KGfAdgqSYN6tf7wOefFOQSTADlRByNnwsCLaMHgJnAyf9606RaYbHBJzmfINdZUzViw4
         2MP0ccMtPb5cbNL5rIDkA0DL4XuKwA7bTnHuXWIM4bhvvteBzgL99hrEYOo8y/x4zj2C
         nmwQ==
X-Forwarded-Encrypted: i=1; AL+hErFocPrOsn0Hb1mZhy+92XHdX48XrcFyc55I8g281ZlnL9uzF272caBwkS72PDPQP7zhaEFQHpXA7BeB+o0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/icH2yBkZP1vXBiaHG2dSCQliyJF4L695tnm+9mb4a7g7FIkiy
	/lvjiOyWg9rZWf2HLADY+Nby8c1D9NV6fxlMZSIngJo6mH/OziovoWGsvSLmgzLsTjFibsfM9Kq
	0hwxdseMDdDEXOOStOVRpN7+7hzEPdIZpBnngs1S0vLNn0afIcbSBPo5OmK85h9c2GZg=
X-Gm-Gg: AYBFou3nduxgnocRX+ZN7cy48K6t8D2j5b8rwjMFNJXrgliJz2WHgd40P7/TvxGBjV4
	xuw2TEzlzZly+3ZKOQsqzSkaOowDie/Rhifnu+tayrlBYaIQZjI1uERnmSuIWxUxlQwVLYlEoWV
	8GhxW5BKgjTUq8BQCj7AdMIUbLgt25/sNOqaaNIqmkyUR2o1CPbrAsBR01FT/4HpB9ZWCngWAiG
	xU3gU3c5USZK6o0RNchOczrS2iEfE6zW5jEcpRo51EHsi/iuXvlM4l95mQFC3gZWpIQ8ri7ZQbT
	MXx5IuW4IgATVp3ajASg7cvI/UVtc3oYB/ByYhQ/K/PX9pGcmgpvyt2MUNQkoiKWEv/w6qIqR7H
	6ICNRuK3sma/jZpKWiEXQzd82K8ww4te9D6GTd4XqCqLO55+D+AYMNbvpBV8PPtfsQ3LSXMSU8J
	llcbNhEZCma9OmCjTpxg==
X-Received: by 2002:a05:620a:1a04:b0:949:74d8:4713 with SMTP id af79cd13be357-94974d84d61mr209325385a.49.1794739842811;
        Sun, 15 Nov 2026 02:50:42 -0800 (PST)
X-Received: by 2002:a05:620a:1a04:b0:949:74d8:4713 with SMTP id af79cd13be357-94974d84d61mr209323785a.49.1794739842409;
        Sun, 15 Nov 2026 02:50:42 -0800 (PST)
Received: from [172.20.10.5] (82-132-234-47.dab.02.net. [82.132.234.47])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c2361242sm3272377a12.12.2026.11.15.02.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 02:50:40 -0800 (PST)
Message-ID: <f8d9be2d-b8a3-4f54-803f-dd9c974280f7@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 10:50:38 +0000
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
Subject: Re: [PATCH 2/2] ASoC: qcom: audioreach: only disconnect the route a
 mixer control owns
To: marcht@proton.me, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261111-q6apm-fixes-v1-0-1beb5702b372@proton.me>
 <20261111-q6apm-fixes-v1-2-1beb5702b372@proton.me>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261111-q6apm-fixes-v1-2-1beb5702b372@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA0MiBTYWx0ZWRfXzZ21ha+z5LOf
 FHPML4gRN9qPOymc0+FPF6OjVOaK8oUDFfPC8WtBs5pXKqu0l2M2sX5GNnLwsZj31bodixOWcpL
 WV4dqXJ714S4IKyNObeNPLWXVx6QLrU=
X-Proofpoint-ORIG-GUID: RULOlv2eWr6eRqzVRJ-1fgRFCOkLRiip
X-Proofpoint-GUID: RULOlv2eWr6eRqzVRJ-1fgRFCOkLRiip
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA0MiBTYWx0ZWRfXy009JPNAaXKQ
 +F/h6c/ue4r0Hda2qLtii5G77M3c/vNTmsX25DtMqGEJklHHS2NpOM9xnovPn8sQVDTzpBiLdDw
 NKflHgyJKpYkoXQpR90po1xUq/MXq4FBJxxHkXMmaEYKLWjVx1lWn1nlDGnbY3wXVs8TYkUuh76
 GTZU4N6nnlcNKFNwdTY0eA7jf4e0y91grFiUrGEHb2QIXv2AkICmBDKhiiZ1Tv4AS/GvCFJQlLi
 1KGQYRSpN3d2iRfTctby4l7Lqm2YuF3/aFsfhGxgLgTeMJHJ+uF0U7hUUydRqJSVnUTS+77UwCl
 DONdmim22M39gxVdkWBPHLK+EKt0XI/xFCzKKcjyuuxqE8RdvNxFSVI21UMZf5VEocn5q+WQB/N
 tznrY3vWqBxkIdNDxxbSlmXZgiJr+QPXpPcrGbfnyw3Xa4OasaGe9btVGr8esMQlK2PDP1r6YyU
 wWt+kRN8W6PGQ30GnjA==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6af98e83 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=AI3hfGQ59aOwaD8qyfpUrw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=zknksMb4cIbI7LntptQA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150042

On 11/11/26 10:54 AM, Marc Herrero via B4 Relay wrote:
>  	if (ucontrol->value.integer.value[0]) {
>  		audioreach_connect_sub_graphs(data, scontrol, dapm_scontrol, true);
>  		snd_soc_dapm_mixer_update_power(dapm, kcontrol, 1, NULL);
> - } else {
> + } else if (audioreach_is_vmixer_connected(data, scontrol,
> dapm_scontrol)) {
>  		audioreach_connect_sub_graphs(data, scontrol, dapm_scontrol, false);

move this type of check inside the audioreach_connect_sub_graphs itself.
--srini
>  		snd_soc_dapm_mixer_update_power(dapm, kcontrol, 0, NULL);
>  	}

