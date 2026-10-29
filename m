Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793301459;
	b=asKfIHLr1JzoFmQFSbS+0XotLD8L5YRKikvud0oajpGhbIOgQs+bBh/NJ22SHG821pAo
	 BF9XW95ZJLWQH43b6yS/fhDsm8DyyItkeQ+KA7JSxaPxLud2p3TVynamL0zW91xKaKtdX
	 wOIhrnJUHP3X4wz7Yw0EGXZ2zwc5SeBI0CRPKxL4h1lHSJS/oXplTIcIDDZi2vTlT5Iz3
	 W7IO16iG0wK27eJvrmzr9NFYBjO/xdUCmA/h1NJz1OKm5Oqvwqd7q0KzFVFj1FKnL+SL2
	 xGFP55GS8FBYl8GVrm8p/PcPUZSsoyPUulei2R74oLUn3PzQAn8IVoxQ2bpFa9cbEvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793301459;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cawB1yu5x8Q7YZwPnUWaDkm3zGLpJJu3DplPcK6FK44=;
	b=JFJ0Q+nhPeYyeUbH17y4Wo3WZWhBcMGLwP0Ww/XUmxXY1S1/VNo5fTDM951CuX0Ssmxu
	 TGzNqCCelGQpTM2AFqLVZKyBN5sU1TTvCZ7fLv6cG0cIFq2mNp6LyuVHUyXxoPNLO+RSX
	 5GqU1u8vZ7vgebwhAylbLu3o2Uam1WQ47Z/f17p4moYaKSFRR9bvrqT0YAds+5xrf+CHs
	 tirqp9pFewm3s82m1owRP3NTQe6hraqvNBeArxeWNmM3a5QZMJbF0YfhASCSJnQs6qKQS
	 IXmpMDEsDJ+5zWVkNg0fSPqdI01VtYn65It7weaV1VKinQyBv9F/BXNyvLKZNrpEZCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ipEW2xho;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P9+7vIQH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B32606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26B32606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ipEW2xho;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P9+7vIQH
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGD1ew535251
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cawB1yu5x8Q7YZwPnUWaDkm3zGLpJJu3DplPcK6FK44=; b=ipEW2xhoZW8XNvmm
	UvC7Y9C8Kxilxdg7AhcZthbFaP6dZQcx+ru1dhb/VPi5NpMwpWHDaJ4LM57i1YMl
	VWEBkn8MNanV7fgWkI0utRgY4wjqBeaxpcQpU5qTN2y108wQsn9N21Tfdz4PSj1/
	5rlz7IaYx5uu/NpHGx956CI66/metieVi6OUJOjEfQzSSIBDQ48KpwYKhOR66KHN
	HPWW4+0qGo4+gXCaWaMVFHXd8plFmRkG7DtvAzWf6J8I3+vfFgJgIi8tcSRuUT87
	77o4usUYlbk3y9iwx2aQ/sGnuUEg69MvFGLxe1EGneuU/buWBuwz/UCZYrUAixIR
	G15WLA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm8k4jswf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:17:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c85f95701so39498886d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793301457; x=1793906257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cawB1yu5x8Q7YZwPnUWaDkm3zGLpJJu3DplPcK6FK44=;
        b=P9+7vIQHk8lt3Oq23X+j76w+9FSCG9LgEvNAIApgpnM3lFG29f0iIgMk9bwx/R5dI+
         sqnpq9pLIfmw4Gx+dlbRBF697vqGj6VSiBVuZOGwcke4k0N3mx8Cx4Lv/rq/GKTMSndx
         1c5tXjUSZZWhcEBVHcjtD5Co8QiC+994ZOh34VfT+ioga540Q5+Zgn1uDsJC1pQcShlF
         T6m1ZEPcSnwowVkUK5vFxW126pd6cJcLKGNXNifQP3dh5l+G6m4xYz5TXnLpb/Dq/KLT
         Pzgf4ySdLLT3fwAGdbCc6hjE/p5tW3lKVcug9ZhLGBgLakNLzcIzUn8aK95RhjXYNhT6
         lMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793301457; x=1793906257;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cawB1yu5x8Q7YZwPnUWaDkm3zGLpJJu3DplPcK6FK44=;
        b=X+PMMOFkL1MkA9o/F7ijyfr9LUgxjuggJtxE9l9xmvKV6/Q9ya8T4VWlfbQy6DMZQg
         W/3b/rIraZeXW6hBD0+tLmNMAOfkPDRx1guzhuFGhPHcfKqAUci8o1aGSeG+/fkgIdd+
         02lx8rkBiKvzUrupygQ7d47QwH/5IaLZ6dgO3JUqIfPFPOFbbUcBGfEOvlvseZHHk9qc
         T62yuhc7Xo39mdcUNmc3BoWAaithKHa7JVuLaN9ovut7PogvJLAqlJs6XW/nqJh0IRX6
         w5gDmyxvAK06MUORwwU7ASCzTvOGab4swuUm+WbqqkSof/PiWIDWDxqMNwQ3KAcOL4VO
         fZpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKDqAZBmGi6XcqPPiGhJ3vTW6T65I4e2ll3sHfw2e4+gCQkfo8skmt98JlNBbTxsbqPhUUvnLgfrDrPH4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1S9Zi9XRoyG+OxPBAC1NmtiPo7g3vx9InGtOxKP8O/iABACkd
	AwBpw2EfVpCa87C2BgGeWA2Uozg8uwbd75q14kySXLOTMdo3jZSfPsK+Yc4f5+ocar5bqq/QIZQ
	u4Q0nPvqhgVY5o1zIz0NW1bYErFvfdMixK9vsLVNotGw5kAZEEtqUOsqJNqgSWR01SZQ=
X-Gm-Gg: AYBFou0qfpmK2tei9Sve7naIDZC92Vt7Zd9Pjp4WZK3Bxlude5J3K6qFXemxtwONS75
	T476LYTDTU6+olnui13GbUx6+6At/lhfb6rqLPIhBq9WC12H/4ceEwqUw7QpzsfkGa8ESMwIHtP
	FUqg1PQIBK2htN7G4XW1Qvpy6b7n5d34mlmnos40cRYN0ja+7uSisqOE4LzqVob00Zc6B1mdieJ
	HKme+/lQ4FZwUz/GifhU8glv/wcDaYl3OJRYJzokKbZMMpqD/G+nOEMCd988jG/f+eZGsrfD891
	yuHjpdXJvRCYZX7A4pqe9CVmXDmyoX4rhDZsVirJpEdjqYrGgl8mVpmlSaM3hJvH0ZDVuUxiI5X
	63ggjxN8aCO5TTYLpy1UjWCB/a7hSG8+7s52bKMTP8GvBj776/b5GqRR7QQ5thZyVfIptEhxWMa
	0=
X-Received: by 2002:a05:620a:84c4:b0:93f:211b:a88 with SMTP id af79cd13be357-94421712a75mr26302685a.14.1793301456891;
        Thu, 29 Oct 2026 12:17:36 -0700 (PDT)
X-Received: by 2002:a05:620a:84c4:b0:93f:211b:a88 with SMTP id af79cd13be357-94421712a75mr26297085a.14.1793301456304;
        Thu, 29 Oct 2026 12:17:36 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm80549715e9.2.2026.10.29.12.17.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 12:17:35 -0700 (PDT)
Message-ID: <a9910bba-5a4d-4eae-905f-4e576b03e112@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 20:17:33 +0100
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
Subject: Re: [PATCH net-next] net: ipa: Drop unused qmi_elem_info arrays
To: Alex Elder <elder@ieee.org>, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20261029111059.85020-2-krzysztof.kozlowski@oss.qualcomm.com>
 <97e9474a-f491-4447-b128-e4a5687056ab@ieee.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <97e9474a-f491-4447-b128-e4a5687056ab@ieee.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3NSBTYWx0ZWRfX2pLhNwiAGjlx
 r1j1Q5G2LXVN8gDjW14okwNzN4NnBfYxH3WYxlfcQIaXv8k7KedRwW4CYHoIi/9xbfh951hPXCh
 prMG2JrQmRnSPIdyuC5fGBEV7E7a8xdvWBBTlBQR/FnJq0KXjriLt+jSOSl62eWII4jUH8PDiNn
 J6PWSjtnZdNjbqA1TxmTx+DbRIXWSP1UROPJDEknZUnr8aR9hN33UmHsmlhwAcqVpwIAGxv9VeE
 BLI9Gm2WDhqI8oIWVAWwZb5gg5E0TGj9MxKBFjiunjp8bBvc/FEeyI4BcJUug+w5al6eqz/bfQ+
 n6/6sI/atDVC89HQM3KX4Oa7amFQGHR+TMLUw23Un45zesVQHt3iNr0+6KtZoLWU7nM65kqQojw
 1yex5LJgGdxrREw8rslsKxeKanI0r2Sily8+pVGnggtkZX0K/uGiODWEy2gBNSBVeCauetSKA7u
 xr0f40x6LQ54LswmrHA==
X-Authority-Analysis: v=2.4 cv=LuAHWXdc c=1 sm=1 tr=0 ts=6ae39bd1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=ee_2aqc6AAAA:8 a=CEbFsyCIg0w9jv0LxFQA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-GUID: Nmxf0nwPbaNbUvcfsmWCxbTaUYwKKQVd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3NSBTYWx0ZWRfXwQxSyqoaIRYs
 mu8bSs1cFMV9a3TzvWNaOg2tbGA8g76uZima1G049YwpbMZCHaxFljWY4Sd9bE5e2na5p6GEnuM
 dtX5/XEfxTq0ZKfQMC3efGafTWpuPYU=
X-Proofpoint-ORIG-GUID: Nmxf0nwPbaNbUvcfsmWCxbTaUYwKKQVd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290075

On 29/10/2026 19:02, Alex Elder wrote:
> On 10/29/26 6:11 AM, Krzysztof Kozlowski wrote:
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Did you send this before?  (Why the From:?)

Old commit I forgot to send at some point.

> 
>> 'ipa_mem_array_ei' is not used anywhere, so can be dropped completely.
>> 'ipa_mem_bounds_ei' and 'ipa_mem_range_ei' are not used outside of their
>> units, so they can be narrowed to file-scope.
> 
> I wonder why ipa_mem_array_ei was still defined.  It must have
> been used at some point...  Anyway, you're right, it's not
> used, so good riddance.
> 
> Did you find these by inspection?

I was going once through all these QMI arrays through multiple drivers.

> 
> Reviewed-by: Alex Elder <elder@riscstar.com>
> 
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---


Best regards,
Krzysztof
