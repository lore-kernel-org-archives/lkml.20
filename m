Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016114;
	b=2WKLM9VkvIclIK1UB/cMzXY6pjVyUmW038Zeje8+QLWOZMk1vX9czYDgyGiWn8YEYcKH
	 zVcqK2Z/UnsgYAt20H5Yd6e8aa6cLgDY9xW6vB2ZOU4v8FgKDRu1Zd2CqibXjAp8K3Bto
	 4XBQta72NSQYnET78S/Or+whmSmMGPTiiD+j75z9Mjai3LaQZJpNJlfzkjq3kb0Jkm9hz
	 046NoL18hCCXnzt5ChPAJfofISHN5ltgcZUFkJS9cTM4ykGxT9LiTdnnnbSyjBJMGucRc
	 XbH2SoeapCus5JZQIljiRxYp/RCcMCm7GMcIcWBlgeSizbvyqbouag5lXSAqxdkZO1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016114;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VzJXKHWJowrI6hOoUXLp6aJOFbu2bd1z6Aka5OEKUo4=;
	b=syPR9CN7ZkMZy6qjcOoGCrd2WmIwOt/TUyianwGkIRv7y4bwd6ZqOHlSB1FnwQ9ITVFv
	 EpSgLDdKgZlEXe7CI3NzIO7XB/HVZYY/XkEdCR22X9x+zBs0MGEW9xpmYAcdVs/3sc3o+
	 8fyVPF09RDfOEeizYS94pAa4+VupdeiaAkGbM+Mqz1K+I9s1kwVp4OWt7vht29WG6wtMF
	 eHQ3kg3E/sp8Lfb1sQVJNdCjf6gFLecQa2QI1XjoShp5cYl0/E9PlEeTVVHDP1rEwBd5e
	 4q/aKhTDCrVQN31+XMr7sVvF5IVVo66LPGCdR8FvqyxgCnSZGwIZU1cwvqnPxIgH8eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IDSvKgtL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="O/dbzDzC";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979F660A2638
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 979F660A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IDSvKgtL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O/dbzDzC
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtYxF1547961
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VzJXKHWJowrI6hOoUXLp6aJOFbu2bd1z6Aka5OEKUo4=; b=IDSvKgtLSU4Bw1d1
	G8fUyADyvE5gRtxX05159uGej0m6GRxBzbF/sehcA4Q8ObR2HYxpIcJkv/+AJuyn
	LxfV2ZLcXGqpPxEhV93FhgC6SQu8aEOjJg/MtxSc76iGf9/wT4BJPLGUfZfoTtmR
	1xZ5rgMa3MG3vNjWBpZBuvzuCnfUYKMiAkuKaZifA99SSeH8BqdnxNQCmWehsbYV
	6cllylrwNOPt+BXTZDBudlOPfxKk6fIwyMMv2eYk++qM06YqST4R36UEpJ0ZcSKI
	V4kgDlFLmU/ayCf9qP0F0OVYfvEgA1JcbuP+re4466dis4XsTk2d1EGXmql38Nrt
	2f7LMQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgstave-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:01:50 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-8241d159f80so772580a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793016110; x=1793620910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VzJXKHWJowrI6hOoUXLp6aJOFbu2bd1z6Aka5OEKUo4=;
        b=O/dbzDzC5VOVvB52HwMOfku4YxPhZqnAcB/hw79AWgrNCgIxQCBn4GMsm37tBwZOot
         moXI+UJ+QJb0yTxA+dEJuXWXfj/u7YwMKnI3IuCuqvLWzA64oiy3n5mH2BFaKGJgN+zi
         9kow3oqoz03AkfVOi5PQZO3APNqyjShz0pGU0iahLP1XAU2bcSK6a2de1tMxdpSpPXJm
         swIzITILQDAedBmqLMChPPNI/GLFa0CQJCN2jRsYcPPy7P6wdHw3kEDjPdwQY19yc6bg
         oCndGe6Sz3lhS1DiuIHiNH4fS7ewoCJXuy06vXH+ZCSoGN9aVGd7213z8mcmxZrEwqWU
         4Euw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016110; x=1793620910;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VzJXKHWJowrI6hOoUXLp6aJOFbu2bd1z6Aka5OEKUo4=;
        b=GQBqTufbukFXAXICZAQQ+LpNCOI8ISy04kdaGYnRJO12BczXiQWwuUuK4Z6z9vAmMn
         OtORfLz++tB0s4JeN3KBjg98wCjKMqafPoFitLvGaDo9KgvWqC0NLWDbOIyEv5PeRzNT
         1Yd3Gc6MRiHRFGPqi7ySwJOym5h3FJkb5th/gQ7dJ8ZXjl0VnpflVyNU//9xEenQmT0S
         YdRNf2w/w5Dci16qsgn7vqSmGdp6mw7h5mVUrD9yzpwZ9mGIpJYewhPYMxRXCX8l9pAA
         3ojpuOG57kcBS8WT8xYnbDh3mYMN1C/sxYcyRjGpmYI2M9a7MYnfdLcjtgw6RpzcYRF1
         G/Kw==
X-Forwarded-Encrypted: i=1; AKwUvBzBdy6wTiGr1o5D25dSLhjh8H5NVq+AN9mzMQ3spVi8hAm8XtceYE+L21PN5Od0JrIOzRvHEm+OdfKDzeE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5l0MCMDDOhrGYVk28MR5hvCZ83PZ1/CVPQGoeHwrkHLF7PilI
	M7ir49DVROyZCO/ZIvGPLfa0Re3fmgYzPyET58gyuRmXAOeCvQ/HkXKc0D7WH9JvJhDc5ix22jL
	rveXYV08huSERwwx8RjSPsMXk0lX50PeO5jRBnn/VBNHDNOT/HQQBvTPCx8U4Nu0KZvg=
X-Gm-Gg: AYBFou03L7562v1Y9zjgErNmxvf/krCOYjpeJTdHwseN7iojIao9OdRXdG4gXzrShCt
	mhLxNWuBwz9wFtvlzQcgSmnw96dNkt8/wHUtHjhLZtuJWwEcypPnTo+o/8HbA9+rXRMyWDYsa7Z
	6CH6k5cZ1ZYGdxmCGKd4c5GsS+4Oga0fjENlj7UszuDqzQT3quzwetfSLT5tHqMOgNbjKAjp5Cn
	dtyotz0xjXGD08E/9RpEQ7FzzxLi/lcZyVBu3tMNmiuj/Ykyy1KyoHbq7/NOvy7M4fTRP7gxERh
	psdTAvVQyZrgQBMK6FuTcx5wUQ7SYuIS+01AZY6AKqi0ZOJipeaEfALeuQmwY/KDEFHHtoRjkRd
	v54pprR9mr/MTW4XiegBYLQ==
X-Received: by 2002:a05:6820:c0cf:10b0:6de:87d1:a1e6 with SMTP id 006d021491bc7-70ba0d3ee53mr4140767eaf.2.1793016110133;
        Mon, 26 Oct 2026 05:01:50 -0700 (PDT)
X-Received: by 2002:a05:6820:c0cf:10b0:6de:87d1:a1e6 with SMTP id 006d021491bc7-70ba0d3ee53mr4140696eaf.2.1793016109423;
        Mon, 26 Oct 2026 05:01:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46c59c063csm265518866b.34.2026.10.26.05.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:01:48 -0700 (PDT)
Message-ID: <0facde6d-85e6-4394-9de8-8290c4d69582@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:01:43 +0100
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
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: monaco: Remove FastRPC compute
 CB9 entry
To: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@vger.kernel.org
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
 <20261023090308.2898683-3-abhinav.parihar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023090308.2898683-3-abhinav.parihar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NyBTYWx0ZWRfXwKshcok3Gwek
 YTTRLtAxIFR47dKz9cPoSPY+zYI+ZXEMmmpwAusyWQvAIkaRLQqdtn5v8AyHzdun19EfgXEZTIb
 FltmS2IwwALeiB8i7MnFXF2rPFsraj4=
X-Proofpoint-ORIG-GUID: iLAAOTkXq9T0Fvn6d6Wp8h0bVcOzsjtC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NyBTYWx0ZWRfX7UvMpC1etQge
 U/9Ga/6+mxK3TY2w+xcXFLQ9k4HAObSlmQO0Xsnummsrd/2zN91RmKl0/wBtsHm+BUsH5LbBch8
 ai8/10o6HuWVZ9PqukqIOCC5XlZrhYKPuTWSA/4gltyD+Et149kHInLbuWNFGpzFOyAyGKig/5n
 /uUgY8J+C394whT/NDuYdu5A8oo1HmuMwvD5RlWpNZt/UwJVAw1BXL5iN6HoiX0diHBZHW53MW1
 brfcTQaPOm5n74CkkeltwfkJ6BgqOlsjZbZ9OFz50w4H5RMvILjNPaXOXgqnr9ZrY0vgcNJyBVM
 pAOm7aQcxNWLNrknfVqb9CMjmxOgN/LhQK/3Do9A6Kho29RncgZFntN/hPbXZu1mJSGuWTO06sp
 19DxkRPa4BqtntqiHcEHmW/acqVtuQ==
X-Proofpoint-GUID: iLAAOTkXq9T0Fvn6d6Wp8h0bVcOzsjtC
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf412e cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rdexUmAEWTTLP2vLS_oA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260047

On 10/23/26 11:03 AM, Abhinav Parihar wrote:
> Remove the compute-cb@9 nodes from Monaco device tree to
> prevent clients from selecting a secure context bank for normal FastRPC
> workloads.
> 
> Secure use case support is not currently implemented upstream.
> 
> Fixes: af0d19ea5a31 ("arm64: dts: monaco: extend fastrpc compute cb")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
> ---

The documentation doesn't concur this for this platform

Konrad
