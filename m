Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793294975;
	b=fnXwVI6JQJRdITO9NsL8hY0hOwfbBSZ7Cn7uypyLFZRJe5DlSJMc+6bhUMAuB9Qb4NmY
	 tcdMD5nsqpl8u5qTSky9rtQ/gLctXMPVaDXAHc2KqmXxoCLVhm4yi57KlulaSqCYs7DlJ
	 /oWVR2ydpgD4tM8Od4WSKMjaPOM6chUHUjvhzL0KXNhMMFfO3pKzaF6Bx4O2hkSr++gcz
	 2PHncqcWFckK8wenm87lKRKA+faRmuB8/T/t7EzVEj32Hhk5wBcbb1vrmB3W1crEvIrdI
	 +gZSQQRczxZveBiiVA53bFX4UmoQz+YoTajGmqnk3tAvpRLmh+JIpG7hz2IWnrgCFgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294975;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hxmzuO9OtgbaXD0ktYtWzy0CyK8952jBK6ZqziabIvg=;
	b=fFAk/g5pPKMH0wcfiv88TDAfbfr7PrRefxAPz3pq0KwtzRbjmz6PdMnUUU+gKNKICICQ
	 py+JKqzCsW40x9cTfoPMTkoO9WJ7bM39FbFEg6/H1+jsjsibt9zAAgQEnb/5aULlPlYur
	 r6+XE2gZEcGr8HGzYN3CM9BK5oA9Vn52achLFS6wyA+TMCSii2thHl7rP8TLLf28CSlF1
	 /erYzSgyUu5aMJHLuP8JPxWoEE8hJoiRvoSmZxo7KDX9iTcKhxyyCo8oIDuLVY+1FX00p
	 SqFGyecOQCgPwK1R7eQGXFspAUYMWSSXvtWLuRH9C1EbHhRBr0vkwie+ZsjS6IN/bDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZfdJGf3K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="UyzzEDp/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EEE606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6EEE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZfdJGf3K;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UyzzEDp/
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDGKC227428
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hxmzuO9OtgbaXD0ktYtWzy0CyK8952jBK6ZqziabIvg=; b=ZfdJGf3KiMt+tNis
	GFHP/jceO7rWXyXSjC6YBKZZh7yO2wARMFUJki5uYrIEIefxQvLc1/LdrmSsRZRw
	lrLmkoOLc0+m44rJ+CcizXxXrcdVm+/5NDrdR9GP0Y8U1ogA9lRVscOitejxOqje
	mnOIFf7b8bXNNkXM0HwYCaVNZsl8ZiElKHEpqiVDH1mKpMBdJ9eWIStvn1JVmYBi
	vla9XtCQPfMZJusOjGDh+QqKQNNn8lzvHXtN9puTrDmCqGmMwxRZ5Q9ukQbjoEyl
	lBwyP+RqZnaG4JtPcg0jRkGcncj6k1M9gy3f4rMD6/ITpxzEqZwfwb78t4rbTOCA
	e/Y1xA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm42fjbtc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:29:33 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso4227274eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793294973; x=1793899773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hxmzuO9OtgbaXD0ktYtWzy0CyK8952jBK6ZqziabIvg=;
        b=UyzzEDp/760D3NykvygpAoESDrkFN8YtTduncyNgA6kKtqj1LqB9yYGd5657ynJVOa
         APzXSdJKm6Ob1RIHPzCMjSFSM3CQEcrMSFtbXyIJl3F0nf00ZQDeuxOw4RB61QQTORvi
         ZcJdS0YSjouGc8SCY479dvOkPkFE13v5SbdQJ6CLqbk7M0mOG2fgl5tWJC3bQp8fW8Ey
         aXc31tzClAlz80gBJoKEYRJCBTdYtxYEflX5Bw4SWf6hms3yT2FVA7NWRrp1kT1JqqSd
         eVAoon5e4LYRClrfjMem11OgyJ7NFt7u5jVTMZKedkiQeNspgF+s+JmSZW6nO8rgdGKd
         w1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294973; x=1793899773;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hxmzuO9OtgbaXD0ktYtWzy0CyK8952jBK6ZqziabIvg=;
        b=xdF5xg35IHyJYr8WDhE1CcsiQHvwyJ+P+kk4TGk42JWwfwRFmW/V2ABANJpLWNo79h
         cIar9NHpxkgNYRtVvp3E+lqcu1e1QtP+nxbi6CYIlkce3de9rXWrSTfvXBnwEgFAmS/6
         m3+sqkBIsulQiyAjvxw2pxYMpFQ7LvJWmgf14RpSkc05uSLj2tzyodra9OlR+Hez0RZe
         UbIwx1msxGKoJK65a2DW2XfHUefRNo96QR1t4uOU8wy5otPUiw5PBOwFQHLk9gRJUkj3
         00vtwJRDBPJAmKMGXjOTAwoS5auOsPhEw/TvLVD5LdE+OKLWYXxQWaFEk5rkvnTz8xpC
         JtTw==
X-Forwarded-Encrypted: i=1; AKwUvBx6eNOonJ/UTRwOD45YFPIpQOM+IhZGhe9DAe0rxaHb2zTOYy4rMYPo76mS0hEKPW6YknpW0w26HZsUkEU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxIf7fhz9AHAnDYMd9JroZ1LlWGswJTEvOJThnAh8X/Aez5b23
	isFZi/RgGYRNllq58hM+bboIMou++jvHTd6Bkqw006IZVrIuEu2fllb7RoViZdtJHyKHwn8EqF1
	MGozu9uy2NVa+f5UVjBhX47jkNOOkZ/yXpeSE//QJ98WZxcOzZU2t3yDpPb9WuUhcVWM=
X-Gm-Gg: AYBFou1Zp9ifPStBItC/zwQobieumlJrYIuDGmKpvrf/n2xGkyDAfDN+qyPFFLdYDbL
	96JQ+WDGgTv5qfl2qLlTflQhRUBmH+kYOzur7sjzWEeTvvLgm4ROtrUPelrzlKRqsnv8wzc0qs5
	LusC7fXSodeF9kBr9joB+RDDoBKJu9/Bsy3BCxS4LWQKe2ve4oDymhTqS2gVp8wTWbVPHbzxl+2
	pa8J74YpsjouBG92M5cQECu87FBpeLTO8TeMP3MaVnqWc672uovfMzdYR9WWq32N/X5HcvDQdcN
	RHoSfk6ELbdic8SUXyPt6fdErMlEINqp7Nro0V+H7GwH2ymJwQIOpcpZSLtRXriFbmWgsfe39SR
	1miIyA1TE9/tz/33PeFR6TZtSRWliBhkXwKaE5UIZKGWGwKDIUXChGRS99b2Nn8BzZvqpv37Afe
	6SaoG5LXNi
X-Received: by 2002:a05:7022:3a85:b0:191:17d6:ccdf with SMTP id a92af1059eb24-1a6cd499501mr8224223c88.8.1793294972531;
        Thu, 29 Oct 2026 10:29:32 -0700 (PDT)
X-Received: by 2002:a05:7022:3a85:b0:191:17d6:ccdf with SMTP id a92af1059eb24-1a6cd499501mr8224181c88.8.1793294971752;
        Thu, 29 Oct 2026 10:29:31 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.197.72])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1d4dsm136995c88.3.2026.10.29.10.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 10:29:31 -0700 (PDT)
Message-ID: <c28ddf94-9bfb-4ed2-977c-4b1731a03887@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 22:59:25 +0530
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
Subject: Re: [PATCH v2] ASoC: qcom: sc8280xp: Derive TDM channels from DT mask
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261029022340.591372-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261029022340.591372-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2OCBTYWx0ZWRfXx7KL1F0FN6X3
 a5YPy8pZDGlMDC4OZyiBT9fH2ZYJGapgjhXLCTYcI7QZwXFI+PqXUSNmjQfPHqY1LqgFRTz+5AB
 xNDC16n6f4v1a82IrudsnpdVEL7nQt0bgo39EvIiOzvDw/dOXi06urosFJ+WsM82ZZ0ukyOcnSE
 GBmncvALD+Tn3fa1CPZ6j1V4PyomyFyru8wsaLaBU6LfFHmoQuo4BAeitjNkKxkGX/S4YYqSc71
 FoE1pjuHajm6VKE4vna7z6ROnBqvbMywWBuklu/Z8hig1N57si1d/u5PR2r7k7m+nwIgiyyIWoJ
 PwrwYGX/nGhSvE/nIaIQCQcQdT4Lina8U2kEMtcwTBdMZRyETb4p6/dXcBV+JpBPH8QgFSy9Lyj
 szR2L+sMb8sj4V7oYVpxOJna0nTauA==
X-Proofpoint-GUID: flV0GUEAecRLODYAdFHLriCUAWetAOH7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2OCBTYWx0ZWRfX320qa38HLWNy
 AC8LO8Ohk1Tn0e4E8yK5sukSb25DyDQfj1L3hCkN/ZMEdrJ53Q9ye7R91ryoc3b5OucDZrzdh4I
 24Z4jPh2MUivb1gOTqi06/eQHVGchRw=
X-Authority-Analysis: v=2.4 cv=UN9Ijyfy c=1 sm=1 tr=0 ts=6ae3827d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ud/Gc3SFmwde3Mv7YyqU3w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=tgxUJJewBViNwYeMPcMA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: flV0GUEAecRLODYAdFHLriCUAWetAOH7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610190000 definitions=main-2610290068

> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 9aae6aadd43d..f5b147962afa 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -303,6 +303,22 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
>   	channels->min = 2;
>   	channels->max = 2;
>   	switch (cpu_dai->id) {
> +	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> +	case AIF_TDM_RX_0 ... AIF_TDM_TX_12: {
> +		struct qcom_snd_tdm_slot_cfg cpu_cfg, codec_cfg;
> +		unsigned int mask;
> +
> +		if (qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg))


qcom_snd_get_dai_tdm_slots() errors are silently ignored here and the channel count falls back to 2.
Could we distinguish the no-TDM-slot case from an actual parsing/configuration error?
This would also make invalid TDM configurations easier to debug.

Thanks,
Prasad

> +			break;
> +
> +		/* Same slot mask selection as q6tdm_set_tdm_slot() */
> +		mask = (cpu_dai->id & 0x1) ? cpu_cfg.tx_mask : cpu_cfg.rx_mask;
> +		if (mask) {
> +			channels->min = hweight32(mask);
> +			channels->max = channels->min;
> +		}
> +		break;
> +	}
>   	case TX_CODEC_DMA_TX_0:
>   	case TX_CODEC_DMA_TX_1:
>   	case TX_CODEC_DMA_TX_2:
