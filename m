Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995578;
	b=Q30ofAIyi0GVMkMqJhJHVZVQQn0KajlbJg1Egr1st2uSXQb1L8TMdQekaC9l8DKd32Yz
	 GffTyJzvmJc3lNOYAlihGg+Me5ipZwy7ofcmuZda8+yZRm0a7HK/7jsH2swZHgWRe0Y1W
	 Y4LvwnwgiIKwWVAeWFEbOh35zybWYYCeMHg7k6f9z2LLLzqoaq95TJCPYxSdu71IY8zXV
	 tbcnbTSRIqVwNb2KOMlse8VwyxqyRLPDfz5iPZT2y9HbCsPl5AZHeuccJHIJIZtMnNL0n
	 zU2Ulna//2L95X3iz6j2dlQpWNhgCuQUmw8wRgU34WcKdmfL8Kgsn7mT3aSAjqpbDyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995578;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wPQWKP+qPP8aJ13vBCzCbVovXHwFOu7J1CBcKioSk9Q=;
	b=UCwoIY+DS62h3zgLdbyFqEjcOIHjLt6w1m+etNbLN+PbVheVeN3mcm96q8jn6YQP52FR
	 MVhq+dJNw1X8TnV2aV3qsvEvZWg9ubacMvjphrYKHsrUnTn1YDFCzfK7zBaKHsXgsSnsC
	 W7Obn1jrRdZErNZ3sVxomN7DC9LwwxmhIwV5MRhKZ7ltZQOmvHC3ieP97t6aoUo8+Tp8i
	 7ZhMosMOMBeFcgMMXEs9z6Stv6rIbqzuQYTpiatVG59Fd/stRm9awlKdxH6+EU3eMHNCO
	 giZTu7Iup8CbFrr4oOYp4sNqEVzOp+GYQErYV+oNdZ8dwt0mmI2a3uRBmccU8Syj83A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZOVpBaQG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fHvn2QyZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FE0606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30FE0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZOVpBaQG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fHvn2QyZ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b5qH1340513
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wPQWKP+qPP8aJ13vBCzCbVovXHwFOu7J1CBcKioSk9Q=; b=ZOVpBaQG3lHZACQt
	k2AEhAHWHF+RCP/KHzisSwnkMwidWXGSTuvKMLUdHjjkdKEWUz/LCez58/+8pdpF
	HFIeL27TB2Y7UYHaeobbMWLdgvTaPGxp1uJawsItekSBDj9UE06l2GNayaVxDQV6
	2vBy9k0I4YuzKsxDk4+e6WpU4Tn2dTOywwhIix0FZStOsYzpU5r5/TNpTJHbuKqr
	fX16RR1xE1T4ZeoJX0/nuFeSTF3t1Gi7uK6c03kyVCjefqLA4OL5QyA4O9RDvYja
	NwFozqxFJ6P/SssQlleWF1B55UeSn37eeEiy7erE0O1ELNNbDTtOtGgYAJNXzOEf
	w6NGmg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgny9vvpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:19:37 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso4650084eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995576; x=1793600376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wPQWKP+qPP8aJ13vBCzCbVovXHwFOu7J1CBcKioSk9Q=;
        b=fHvn2QyZkTr7d/2p8SwxYpT5h/S8FNjZYpi7iOgmkpKOPNCjStqRB1xGI2LoOpsStz
         eWsKUtQQaU7Arkxz9Ofan6K2Rzzt9CEOPAs0rCeZpymyi31sD6tuUhFRi73wknyCl6f7
         WedR1+n54tR7SpZONJ0lEbtL6aqBJGsAlZ3IctYvOrtLqQ+gpLxAg1UppI7wiZPHNC59
         AsCKI2o6c8kJtnPGjWyKC3LRbmfEuGhynDFKpYbIJr/vOSztpRhSXFTgD/Kz8iR8677F
         DuxNVqOSU++HOdu2i232+4rF0oWsNujLX3bFKldL17GeCRWygsuCVLr03IAdH9shpzsB
         8d2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995576; x=1793600376;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wPQWKP+qPP8aJ13vBCzCbVovXHwFOu7J1CBcKioSk9Q=;
        b=NcNH1GCbl0joRaTRF2NTX4/4C3ZtZicxPiTQ51x33SZbbZ0oqYH8DfKhZ8z8XoKwQZ
         hrput9o5/FWvTdmp6fUGgRrUZZgmTSS4jW63PbwIadS6/8AnXfclQkoV8Ih2i1+OpO44
         CMnY+BlDDbZc4jmsA9WfV+vZHjSwh4hCPg7LUpbtiOIiEGTFwpf8NoRzkQzZb+PBU2ZT
         AC/YP13Q6o5cLGGIUV6MgukI27XlsBrXIkfeYO/ChZABgQreG1zMUs7z3LdOZz12mr4U
         i0S2+cgp2AodAvyY8A4OR2JIWveRtLJqfGmq/P1POyVzkq0SEkaBM/cUAI/R2bZj9bcL
         ttxw==
X-Forwarded-Encrypted: i=1; AKwUvBzqB0P6vAXawBsRamc3mnNzovusrI5X0lunkiJ4bJn9ev/UlJNAO7EO532CAFfRRGRPToAZkYQyJdBLtjg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJY3GzXnKwkZIWyTVhL+ky8JVKhhW//ez1LRz0+D4bbDspawc/c
	Lsq1RT7sjChnVp3a74LuJNkaJ02yDqLKR/JSgCwNkKqBBWC+FLI1mMq8XD71NnxpUT9ibxAfWXM
	zNz1sAPQ4VzYo4r1jd7gAhyILSOp+pjkc4gYGI2KUz7zRVpT8YHNkJvhvF9oul3r/NMk=
X-Gm-Gg: AYBFou3jHxvRf7GgnsQGqn+Kegx4OttgiDLWpOdFsZB07LEeLcaPcqCjxXfNQl4QPi2
	qbs2puOd0LEJwZBJJtwl9lkynAcgxk3w5ZS2ZCwhJu87CqzSEcaiGQG6/CCcInORTwZHz0BbGJz
	qVSjnDumAPE8EP+yU3aCIuuitbR+UvSsFPJiyQDMBxpZJSe9WOYh4tMj6veSJnMI4nseRJz9x2B
	bb2TfJbVzScc0ONcmwCaTP4x4d921QPubshgpGZlpsap8L4qKXDNerD4qjshEylJ6lQaP59hkhl
	6mU+8sRpmYfRwITNJ7S0/2nohQdfnfWbzER5LDnzhhd/z9UkyzRMZoGOhikSXxhU1+ATJjJoBXG
	03B1IFDpp1ChKhvNtXvFRbaNbfg35+8/JR4h+
X-Received: by 2002:a05:7300:d085:b0:369:f9da:a70f with SMTP id 5a478bee46e88-369f9daa873mr4931978eec.17.1792995576280;
        Sun, 25 Oct 2026 23:19:36 -0700 (PDT)
X-Received: by 2002:a05:7300:d085:b0:369:f9da:a70f with SMTP id 5a478bee46e88-369f9daa873mr4931949eec.17.1792995575594;
        Sun, 25 Oct 2026 23:19:35 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.198.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm41844315eec.23.2026.10.25.23.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 23:19:34 -0700 (PDT)
Message-ID: <cfad7934-2311-4f90-84f6-1f4f0fe585ac@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:49:29 +0530
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
Subject: Re: [PATCH] ASoC: qcom: audioreach: support multichannel PCM formats
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261021102549.411456-1-zhangfei.gao@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261021102549.411456-1-zhangfei.gao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sj9-GunPY7ZGVuO_icN0UG6kARajqrzP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNCBTYWx0ZWRfX7fbE5HdrUb4W
 ZGz9GI6HSbFDY3gRNOiiZHC0x8Rf6Sb/4LK8SEPldo/AVD0uezyQHfbq0tdSCT4rbCo+FLWRMYe
 /EqoaB9xsmLc1Vgb36oPpALs0+1GtBnrlC5t2iiVVC+dzwRTC8IVw0UDZQ37/oVGPGNb0lRJ1zn
 1amnUeuA+0jbNItIk9MgO3Syd9QmVxQgFlgRVUjFZCpuJnqE8kptKLz6ad/+vF1J+OwuP8RnXt6
 ykj16gbH+yUGfMmpV8ckCWKzclhVLPOW3d+xlWjYWUvexsxHQYHv4Mn3Lz8tRmIBsXTW38Dwvbw
 tW6ZdJBMUHD+OsVKhZXRZtao0x30hC6ZQ4e8JVs5mHJTgZpOxkCBQWCr7ItGJD42T0tc3NtDUg4
 fUSpd1QtpdOeS6bpAikmRfzrmrWSmkTgiTtdz9/3Ea91LQfTD1iZRC+T1iIXy5jsm62ZPY8bk9P
 ps2xsgnqiptGsb/GeAw==
X-Authority-Analysis: v=2.4 cv=PqcG/AM3 c=1 sm=1 tr=0 ts=6adef0f9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=YdEwHcodOreUj24YWHnpAA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=nP5ThTwYepZGQzjsTqgA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: sj9-GunPY7ZGVuO_icN0UG6kARajqrzP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNCBTYWx0ZWRfXxdUcV2ZMs3BW
 xoIOicFJJ7z7GFORuGczmEwqHzLswA7MT10t+ibyflD0gWJtdRmKkPM2YtClQA2qv58N0gUgsT2
 Mjwu4YMOpxOf4Y1uvK+AHxXcSFcjpAA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260024

>   void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels)
>   {
> -	if (num_channels == 1) {
> -		ch_map[0] =  PCM_CHANNEL_FL;
> -	} else if (num_channels == 2) {
> -		ch_map[0] =  PCM_CHANNEL_FL;
> -		ch_map[1] =  PCM_CHANNEL_FR;
> -	} else if (num_channels == 4) {
> -		ch_map[0] =  PCM_CHANNEL_FL;
> -		ch_map[1] =  PCM_CHANNEL_FR;
> -		ch_map[2] =  PCM_CHANNEL_LS;
> -		ch_map[3] =  PCM_CHANNEL_RS;
> +	memset(ch_map, 0, AR_PCM_MAX_NUM_CHANNEL);
> +
> +	switch (num_channels) {
> +	case 1:
> +		ch_map[0] = PCM_CHANNEL_FL;
> +		break;
> +	case 2:
> +		ch_map[0] = PCM_CHANNEL_FL;
> +		ch_map[1] = PCM_CHANNEL_FR;
> +		break;
> +	case 3:
> +		ch_map[0] = PCM_CHANNEL_FL;
> +		ch_map[1] = PCM_CHANNEL_FR;
> +		ch_map[2] = PCM_CHANNEL_FC;
> +		break;
> +	case 4:
> +		ch_map[0] = PCM_CHANNEL_FL;
> +		ch_map[1] = PCM_CHANNEL_FR;
> +		ch_map[2] = PCM_CHANNEL_LS;
> +		ch_map[3] = PCM_CHANNEL_RS;
> +		break;
> +	case 5:
> +		ch_map[0] = PCM_CHANNEL_FL;
> +		ch_map[1] = PCM_CHANNEL_FR;
> +		ch_map[2] = PCM_CHANNEL_FC;
> +		ch_map[3] = PCM_CHANNEL_LS;
> +		ch_map[4] = PCM_CHANNEL_RS;
> +		break;
> +	case 6:
> +		ch_map[0] = PCM_CHANNEL_FL;
> +		ch_map[1] = PCM_CHANNEL_FR;
> +		ch_map[2] = PCM_CHANNEL_LFE;
> +		ch_map[3] = PCM_CHANNEL_FC;
> +		ch_map[4] = PCM_CHANNEL_LS;
> +		ch_map[5] = PCM_CHANNEL_RS;
> +		break;
> +	case 7:
> +		ch_map[0] = PCM_CHANNEL_FL;
> +		ch_map[1] = PCM_CHANNEL_FR;
> +		ch_map[2] = PCM_CHANNEL_LFE;
> +		ch_map[3] = PCM_CHANNEL_FC;
> +		ch_map[4] = PCM_CHANNEL_LS;
> +		ch_map[5] = PCM_CHANNEL_RS;
> +		ch_map[6] = PCM_CHANNEL_CS;
> +		break;
> +	case 8:
> +		ch_map[0] = PCM_CHANNEL_FL;
> +		ch_map[1] = PCM_CHANNEL_FR;
> +		ch_map[2] = PCM_CHANNEL_LFE;
> +		ch_map[3] = PCM_CHANNEL_FC;
> +		ch_map[4] = PCM_CHANNEL_LS;
> +		ch_map[5] = PCM_CHANNEL_RS;
> +		ch_map[6] = PCM_CHANNEL_LB;
> +		ch_map[7] = PCM_CHANNEL_RB;
> +		break;
>   	}
>   }
>   EXPORT_SYMBOL_GPL(audioreach_set_default_channel_mapping);

audioreach_set_default_channel_mapping() silently leaves an all-zero channel map for unsupported channel counts.
Since this helper is exported and callers such as q6apm_dai_prepare/q6dma_hw_params/q6hdmi_hw_params() don't validate the range.

would it make sense to return -EINVAL for unsupported values and have callers propagate the error?

Thanks,
Prasad

>
