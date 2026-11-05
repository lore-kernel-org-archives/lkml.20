Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866305;
	b=kFFF1pWtVHGmJyKXVmba4MPtNhZKU78UgKQLsYqky/j12yxrFYRYYf6TnHEorWLF/6Zn
	 PT6paSDTTVKGEiUqpayazB8napNfnfQqoGs6IvqbwmsPMF5u34Xs86ZC6I1GqDxVknPyH
	 d+LrLSTwq3p6h7udDIq3TP9sDyb4JJLEvfx4UCLs4GwJBoDK2QCB29ePlA8jXJuZ6eZ9e
	 k0jaNM7bUgJ5YvJiA4LUrx2C8iqFl9tElZaGq/Kr0LCX2za/K8o2dSLViMcWmfm6k0wN3
	 uvg5iIKCMlf9fU2LkBhi8cVi9zHlssXFFGd1L0bcz1oQ1Eu4CWItiVUQ7imFMhYmMyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866305;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mIPALp95eM3AkXFlvFAPjNiT6Aysu1euG/w9XR+z1kc=;
	b=QmqXUS+UYDKbqkoXm6e3wOZjw2pIUjNIMcBweD9pLfqfWoRNzW8aPhd46c9N7AHpGjzy
	 t6pIBEKSFEkGH3dyfGgQVAZDTdu+asIQbTM+jUmK4MkMTIJWhb2qS2hEKjYn4RxzPqB9L
	 SXxkRccUjg/yhknBnnl+k0aLoKe+Zlzg3Gn/CjU+mmbg+2/Mt0kcuXslkyGfWbg7F7RM0
	 xPOl28v4HWwGat/1aFGiIdEKGg3iteBcHzEYe/vKZJjI/DK7Gu0hVhBzqUFIc/NAosK2O
	 c/PGraA1F3cpHWHL7+HC+I3lJXPTvFwpHEHP7a8f5hOxi1ati3m97EoD2l2p9JJNiLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a8LwHb4Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cJfYmTmE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F66606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41F66606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a8LwHb4Z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cJfYmTmE
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UZDo595354
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 08:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mIPALp95eM3AkXFlvFAPjNiT6Aysu1euG/w9XR+z1kc=; b=a8LwHb4ZHdGn4MsJ
	20ov9kOlvbDvIQg0LABhso9DtRcQp9puWNQq18Ru1K6N0sJEiArvwPTGJaFrRozj
	khU8WPF049wZiIAsEJj/hAIT39GPXKalNdUrp1/EeOsaj9peDHIVkEVprYWY9drA
	l3z+XTvUcKqSsq3x8upVQPSQtbooBJta092cmY47+kBicyWl1KAOMtAxSAiW7Bl5
	PwoWNjVqm4tUPYx4yPpBf4Wlkwe6J5dEOFBf8Yy6BfF3T5W5sYlNcFvm7P6Ke2Sr
	5DvkxPkb2gVR1XA1seH38HhLXvDcReeBJq0r/hRYFWt1iTHaz/3Idcf8mNomwj8U
	SoYuZw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr8rv3d4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:11:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c6ea5aa1fso3814056d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793866303; x=1794471103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mIPALp95eM3AkXFlvFAPjNiT6Aysu1euG/w9XR+z1kc=;
        b=cJfYmTmEF0pCxy+r41jz/0v/qRBS587sP+w9/rlgJlfc6L3MwP5XdKeRFbZvUO/LDE
         ThdRVHeFJeaC2TkDd9r+Ws0abl6ivqFMD6vrCxvx64/YWGmXez/THI6YtUL2YXmdP3kt
         BpmVbWnYafyMWlsWuDcgxBWn2xjCehowwNEuNnQUMcuTAzXtEQTTgO5z8uNqdTj8cYko
         eIed/SYJFHHE+WParcaxxwVNUCOEXJZ7PybxOvdhwCgaQNr1SKXVJoIhgYOIPePRO++h
         tRNwmQb7dZkeAhnKqEV5dN8Xo37nxsHTkLaQwjg0M1w5yQb37lA1M8+a/hTHYKAdTb/7
         riIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866303; x=1794471103;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mIPALp95eM3AkXFlvFAPjNiT6Aysu1euG/w9XR+z1kc=;
        b=PeOAAmGSrBzmlxPQV0C5XkvxY+axGPtA2dogEcnE+CnDygb4FsaSv10qZlRXYx05gJ
         +Df2Hq661PXM0BYA8SM2mnl/ghGsLiOShoAtS1/QGtldxMFftlCyCMOH2lKZSVzv09Y6
         MVx5KZh9eauxKLj2z1F77w/x5DJ6Hk+OmHgCUQlf47ZacexXOFusp+A2agXNMwSm4Zj/
         PFI0bxwK8GNpnmrw84+JTNLLkMC/RfIM5TP7ksk1Rq74iRy1R/ZZQk7bxCPRSytoTlwL
         M1vmO+4BpHJlTjwJeWOAnMS9Hie8aVV6kouMymZm6fnBLUjlfc0m+3cEzeGxZE5DQIzG
         iTBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBBE9kDmpZIcEMp9rWbu+v/J5n7wZk8AYdBCq0+Kprc0YGDEIDVuNiaern2TucX+za+ipoRdPG3ffYmbI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RgplX9VwUjfL+tUQGq/KgfLP0NXqtqK1R8tfA0XZQ7qyGDQdJ
	j7CbY7Va2J/lnFGVX91/sM+GurMGinm843Pqby1HUgvRiLocGIvAKyXQ+TPmaV+Vx6eMwpRHoRY
	MR/STuiA5204SvRXh0BltISqkq5XFpR5LjhwxcWWCEX0qU2DRprNEueVJxtV4s05VHfE=
X-Gm-Gg: AYBFou1EzZ/QDzx1MpzHhN4dknQe0OsWfweWpCQEDRXW0b9i2Y5J4Z+k6vC5oS6DILp
	72SRNbE9ClljD3lu1yXFWpKI6a59dNW3JtCfLM/Vg1OEt4HHdvVSC5jMn7L3e276AUWZG6k8S0H
	HfbVpfL+q9r6MYPX4eYVyruLI5Xd+eLXufDnUSPjEZf8O+Bcjf3sVoxm4Sv2YjbTxCs9xJOl0wz
	bZf+SrxdWNGB5tNOrD3liZkG8A/jYBUxcJNIXOCHbjaAEv7HAr2nMnkEQF5abjAoIce9K15POnv
	VQjfiDmfKvpn246kCDeoYI/ocRVAypkbwSzJDMmW0Yb9dVNgaCErBKC8uX1pyLTPZ7tQpNNIcuA
	4UV4Z+HjuPVJ5sRkoPozLnQk48M7dQD+jiPVmJKHi2NJ+qszMY077BepASQpxpPyyWF/j
X-Received: by 2002:a05:6214:20ac:b0:91c:7831:f4af with SMTP id 6a1803df08f44-91ca4b63f0dmr405782936d6.4.1793866303128;
        Thu, 05 Nov 2026 00:11:43 -0800 (PST)
X-Received: by 2002:a05:6214:20ac:b0:91c:7831:f4af with SMTP id 6a1803df08f44-91ca4b63f0dmr405782466d6.4.1793866302702;
        Thu, 05 Nov 2026 00:11:42 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e4a49fasm146003566b.82.2026.11.05.00.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:11:41 -0800 (PST)
Message-ID: <cd587c31-9e78-4957-aa41-53d568547654@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:11:39 +0100
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
Subject: Re: [PATCH 3/6] backlight: qcom-wled: Cancel delayed work on probe
 failure
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, David Heidelberg <david@ixit.cz>
References: <20261104183935.1214630-1-lee@kernel.org>
 <20261104183935.1214630-4-lee@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104183935.1214630-4-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vtm2kO2n c=1 sm=1 tr=0 ts=6aec3a40 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bK3wT2hOXHs123jOQ6gA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX2Wuz87l4j/hF
 IZbt3bjLmyDYun+WGZGQEX3Ja9B7wNIar4Ue10ch6vA4biWBoLQIWXaLD/nuoO/O4IgICdDJSWy
 vrUY1LM9rF5JTsDMSI/mAQcleQOxPQQ=
X-Proofpoint-ORIG-GUID: vYYxAbVauyxViSFIVXoNWb53JbGcQPRr
X-Proofpoint-GUID: vYYxAbVauyxViSFIVXoNWb53JbGcQPRr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX58Lk7/lIO+Pb
 GVcy+N4tqrW+PBdmV7cv6qLwUiRb4+RyC+CryIih8rdKghQxXPS75tlU4YzDxm1X6tvXHCLMfie
 yOSdyVuZUoevwud1HGO2EZ3vMLmbaKJ7pj0+KQZcDtEsDKHYuRG8PgJxyRLqTwCdSRxaUIAT+9W
 avCpcZbZ0hM2MW6aVqX6XULF6QqFlbIlB4doeFijEGIOGT0mOZriHoy80i+Jp9DZHwFuBTvrHv+
 jz3FTVoy29peKZi1UtA569ndX207UG5bdSFzb21b8v0TecxPi/2QNxm5d2pgXY1zgts9I3vRMXZ
 xtD1kutxS3R64rSaZakjFo/KVnFO6j0UnpiOjZeSbZElyyvfKk8DQgv6YMwVx38Pgm3cDD57N+h
 j0ZYEAv4VH5ENEIbp5y/5ZQddLVa7Tzjr8NkIjbAmVYy2uzmM7cbAqfEkGCRszSYnEEDRT7nCiZ
 wSuAi3OfAcD/sapqcIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050032

On 11/4/26 7:39 PM, Lee Jones wrote:
> If a short interrupt fires after wled_configure_short_irq() has
> registered the interrupt handler, wled_short_irq_handler() calls
> wled_module_enable(), which schedules wled->ovp_work.
> 
> If wled_probe() subsequently fails during
> devm_backlight_device_register(), devres frees the wled structure while
> wled->ovp_work remains pending, leading to a use-after-free when
> wled_ovp_work() executes.
> 
> Configure the OVP interrupt first, then initialise wled->ovp_work via
> devm_delayed_work_autocancel() before requesting the short interrupt.
> This ensures that on teardown devres frees the short interrupt first,
> cancels any pending wled->ovp_work while wled->ovp_irq is still valid,
> and finally frees the OVP interrupt and wled structure.
> 
> Fixes: 8663c188beea ("backlight: qcom-wled: Add auto string detection logic")
> Closes: https://sashiko.dev/#/bug/linux-ca2e48a2-f511-44b8-a7d4-866f360bf107
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
