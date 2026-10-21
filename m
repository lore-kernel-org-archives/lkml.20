Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792560444;
	b=WvvCWurZGxG3Nfk5NWFRlMHgIUEYuaVBuHFDPZdieJ7d5ZIKM7T+nFFYl2flLDShsOp/
	 yhuGCCA6tSsMxgl2Vpqds6PppPmPDnYmrhmayH41TYQP4LxDQNzxPoHW81fZJ+oCP6RIc
	 Q61XadY2FxqhjlWgr6lAXC/NWTgQI6tzBDNvpR/jNYWenlcOY151v2m+Vp+Z+IWm2wV9J
	 IfY8b06Josm1IFDluICI4PoMoPpEaug5YwY4oNjGhwYSAiNfIXxkWCikeHLTA0IDIeVc3
	 B5m6eAEk3NscTe7HzqWs0YFjwZIVKgENT04eLb5MOKugdNypNWi5lMogC+IUWP79VYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792560444;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jdMNgAjehHI5qPpF5jPX4R7hZm/DeFz7xTp5SYBV/0g=;
	b=vBGw8VoLIkvtxpUOrenifwkwgTE68ALPuAa5qf9Q3O5KHYW8+cLQvMz9bgSAb8/XjqHs
	 225fb5PPl0N03UCoFlRxjHLoUm8hG5FPsd960gKSPJ4+bGuuG87uLOSFVIzvzOOZk7cRu
	 qe9rEnqQoptFzlP9j6KrDWAgULSA2TOg9dxoCI8PxRWPPqQ9IpsgC7+s0JbNbYK7d7NmQ
	 f106VU4rl+WeDO9dmUfG8is98Vg6kU3H4tRePL1EOeVUbk1CZri5DQwq6JVxC4vNNbid2
	 JNeN1aK0hODrvKm1sstAdXpctsahJuOHLkT3fmn3u5bRXjz0nM73TVDkeLl9fkFu1og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hil7sIMY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BGfKmdE5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3778606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3778606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hil7sIMY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BGfKmdE5
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2FE8s3906651
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jdMNgAjehHI5qPpF5jPX4R7hZm/DeFz7xTp5SYBV/0g=; b=Hil7sIMYzkdqfvGk
	SBDhTM9TiXhFvdVJfYn4qmWAiIO0T/fuFkIr0gEtRpckin+J62Q+TTtJfjxsszm6
	c6elfhGPcZXnqLP3QLaIrDeLnVv3/ceCQaLtxamyjRes6RGtDXhnBgFwBFrVfNdO
	7rLJuHTRWZ/tOf48CVWJXOuR1vLzoLP/lhl9iZ6R87VFyj5jV3zHM/TyhxjSk1+Z
	QfWrKQnooYxa0N1kPZJNQiLUiAAu9bQSq2XBAfJe+FMYQpeb28XAAxWwf314xYnF
	ZY8xqbnG8FKg6fqviA0NUS/9S4CA0CX2DD/OLI2MM6ckMZIvRlXQxLaM4ZouBcqA
	hpQi0g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs01a7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:27:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3662e7a9299so1489604eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792560442; x=1793165242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jdMNgAjehHI5qPpF5jPX4R7hZm/DeFz7xTp5SYBV/0g=;
        b=BGfKmdE5e6LemyZce9m14wtMD+YyG+aZMKFruQ7hulyf2q/J6oLMCq0u/9ZpiySCUw
         fnno1rEkbm6pWFSL2ktT3nqBZ7ZDxSU2efjsiYvhJ67cKYkKtg99pyM+fN/O4FTAzMZ3
         Y79Fj8goO8c9khoQreEjimKwH034UAiy3B1Y5myMB+BkKJ96PFLpTjGeMuWTDLJQdOOA
         cz18BBwCzyJ+aw0iotPArVdHhhK9PEL7aiMDr95t9gdiaroaqUJe9yWvE4+Lm/+67Ds5
         vVCOpG87A59nDmi5hlN/o2EtWWBrazBCakQ1WUn08uE8j5gpCAHucafsC8VUbFJ0kSEb
         s8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792560442; x=1793165242;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jdMNgAjehHI5qPpF5jPX4R7hZm/DeFz7xTp5SYBV/0g=;
        b=nUkpXzKkpw4w+arWUURcVKtvBMMXtasmE3VutRRFeiWmTLWSb9OOsz26T9hEJCm4/I
         Q3qbYnUfs+M6pHgLNJh4LGHJwAlHIZnw9LgQ7AaCqSjUWU9QEb/nRwBDLz+5UUOCv/qb
         eulpe/+zoSy5aLDTU38dWA+b/sr/lDV1dnh5FlrjuaSItZWt5nsuSEhV80RLG6j8WpW+
         A8488EbLavylXtFAYtK0WoQm4lJjXvL5iMvt7oerb2Zb5bNSqW5eanhvHUUIaVzVwNsP
         C0dcTJEfR8mdWWl8R8LvvfK3JiVRDHS0N0+wUxtw1es8+MZPjJodWZj62ZbVA2p4P3HW
         m3uw==
X-Forwarded-Encrypted: i=1; AKwUvByAnGAtaZcsBt3gfOY4UANpnF/HbrgUjLpl0RA/zXdRjD4WrSAS1ZovVSkLfo7wP2wkqmfPg9Mi0uKguXY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvktXi/kI6ZeX7vdI814YJhEz5F1mzLHmjFih6rYU+A9pGjeDS
	Mql1sixxVG8frJFoNZ6lvkQVIGg2MsnvrEsAJcau+nQ+uwxdD3sKDCgaBpPxd0Jv0ylO/x6ulVU
	V8lctcZfMjbJm5xM9h+c3PQESQ0Dy4HFoYbnBKZx5YbcrxW5rNz5mziD0tLzxMwr/Jdw=
X-Gm-Gg: AYBFou0G2oTecxxWOg/JRx7fVL1VgFGQu8l5JailxWBuGmHDMU9Pep9A8qXixQFOqhM
	JpydFk9emCz3/zWx0tkcbQED/Bshws/HgzvyOTSqd1gBxVoiFZDQoIHdPzQygryHgzow0iqgZ+y
	Tk8gWCBgi3+o3sSAd1LgWNjNZ22nMKHd5e9ZcowAyupbiFtZwHZHBLhtodMjOh7LpIHAB7TAZL4
	Wm7JkMDv/PM/yFhQ2xOZp61HhJQNu0j76PUYpyLDSox/vr4jWp34nqrd1QOA7ELkOdnpxcUH1lm
	Tb/RT/dzWvxuuijTnwFGXMzJZYQXvRTJLqepUs4Kx1Ihqbg8te/3RH4lx1Xcy6haev0/TNlvKLF
	oUqi3B0wszp3lNlNQ8Qvm/e2IGKP/VDfMuw==
X-Received: by 2002:a05:7300:dc14:b0:358:cc1e:e23e with SMTP id 5a478bee46e88-3674e164bbamr2292195eec.38.1792560441371;
        Tue, 20 Oct 2026 22:27:21 -0700 (PDT)
X-Received: by 2002:a05:7300:dc14:b0:358:cc1e:e23e with SMTP id 5a478bee46e88-3674e164bbamr2292158eec.38.1792560440663;
        Tue, 20 Oct 2026 22:27:20 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367411bc89fsm4184662eec.16.2026.10.20.22.27.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 22:27:17 -0700 (PDT)
Message-ID: <7db04008-5dd7-40f0-be6c-eb230bb3490e@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:57:09 +0530
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
Subject: Re: [PATCH ath-next v2 01/17] dt-bindings: net: wireless: Add QCN6432
 device tree binding documentation
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
 <20261016-mpp-bringup-v2-1-f510c33bfcf5@oss.qualcomm.com>
 <20261017-little-fanatic-bulldog-e84f9d@quoll>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <20261017-little-fanatic-bulldog-e84f9d@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad84d3a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=saEJ52dEQi1JaZ5hwHYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyMSBTYWx0ZWRfX/ShtRTMcrIyx
 K5zskyLetCxYcG5FRfLmAYF1sfU/80UyvZzmWWGaAxHZqeuJercICDtNqnb7PMwvdaldWjFBYbv
 /VF6KwfMj7vFi24SNUNEuGQ8qT4I2CwLP+b3Dpyo/6+kwcRnF2uyM1rsNPXJGMu74bJ6nJVlAKp
 7ds16I6EsN8318j0BoSv/ZCQVyQiISo7KsfX64nuW26yPyNYUtsgJblaeKNGG3+f3z5xDKGLpeT
 ws2qvkNPlyQytNE8k3J84+FNQq1GQJtkeby1fZeqxprM/XrxuU1qxOWOCB0wy85/OYsR9quQkR+
 JmHXsL1gffxGNZ33U9eWrVloGJMCuqsJksexfM5twK8bZ8zSWgSvTEBGwdiWyk6I6JIxFj+wYkC
 emVJIRYz607PitiUBYtzMH0jOMmYA6KVqPekVL6mCjyrEuWqbKJ7lFFC5wOSD1lzRehh7EJEzcm
 5fSh2C7FRDdup71OEeg==
X-Proofpoint-ORIG-GUID: 6-jht51F-FY1CbaXMCUdVZAEzCfiL5Xc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyMSBTYWx0ZWRfXzoB7QQVSgGtV
 vuLPtLhwHakdWo4L4FvBIMAugTdz/g83gkSa6vOYbHQpkqBMbjgrp0kWaWUXKDIBBbgGHmvJil7
 XhC6Kj775VUcxHT+Yxpwb88YZ8GfkIM=
X-Proofpoint-GUID: 6-jht51F-FY1CbaXMCUdVZAEzCfiL5Xc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210021



On 10/17/2026 10:30 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 16, 2026 at 08:51:38AM +0530, Aaradhana Sahu wrote:
>> Add Devicetree binding documentation for the Qualcomm QCN6432 IEEE 802.11be
>> wireless device.
>>
>> QCN6432 is attached to the WCSS Q6 subsystem and is represented as an AHB
>> platform device, even though the Wi-Fi hardware interfaces over PCIe.
>> Document the compatible string and the resources, including the Q6 remote
>> processor phandle, MSI interrupts, SMEM states and memory regions.
>>
>> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> 
> I missed during previous review - you almost hit combo. If you added
> YAML or schema it would be the most redundant information ever. Well,
> pity, no combo.
> 
> A nit, subject: drop second/last, redundant "device tree binding documentation". The
> "dt-bindings" prefix is already stating these.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
> 
> With subject fixed:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
> 

Thanks, I'll update the subject and send the next version.

