Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349437;
	b=jrWM6srb1pNK9LY/T0pJanUYmFv0FJeddgc75XHU31l5+5J6PkAyOiUOTekw9mDzPFjL
	 gF2BfPwM9oO549WUYNidTkTXWr7BYGjRLnYEKyKLwTNMC3jnm1boMnNyJD+GxRgTnqzIb
	 qrgwbQJ3n5ocYHESKXpcRI5cPXX4LvrlRavSpUYA1mcS101QXGl5ssaaAICxoprSZ1Dgm
	 s8XVSTFxzxHjJKMF9pa122LzlJvUNur4rP663gkldkCQMLMROLT7AQb/QWVKcxImrWfDd
	 Z2KBmDZigxhM3M6UOULK+PHpnvzUvhtLwvmIqoL6mD80iBJEY/1MCSVBvLgRcxm0WFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349437;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s8Ivp+bT7DEkicAhEn64MXcraB26IrrC5i5zD1lewD4=;
	b=qcRknP1BCz/syi50N8Z09iXrZB1mgRFxmj7ruw+/rqT9RWFccHUphcHKTSDKMlihUjgj
	 ymSwf0bYvv0Gvrq+RQpw24oflPZdbqKCUcL50xZ/wT1Cix/GiD79HgtGbP6jwJyD5vp5h
	 7+JdbN/KRQaaK0Hx0Z1N5ZByAPtmlddyfXtRuprAzEjfJbTaCwC7N8SLWuMgNIXPW7fAX
	 FiVzSb92f9xUvM/pQ8SIYLv/SwKQVlmiWkyPAqlJn2+XTEztqXUsKc3dLDHp5+Ve+dev7
	 nQC7bqsM4iFB4Jg36wPo+I4kSdijPii5lvtDVSfDmn7s80MrG3zcrWioItbAZrjYbVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R6su5Xpz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GPzaiJs0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFEA60A2606
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EFEA60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R6su5Xpz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GPzaiJs0
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F3nY3308888
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s8Ivp+bT7DEkicAhEn64MXcraB26IrrC5i5zD1lewD4=; b=R6su5XpzpAGgyn9A
	0pXcsmChGNRgVaJSNhOyqG71lOUgobdh5lJyBWcKkYSUCEF/KsBqv+IUZXDdhkoo
	VpsCC9k88tNIfZ0FSB5ae9ox9Mn4+9LkD9898r15+6EHtQXgzr3QeUmWMgvnIuYw
	mCqb5QOBNlBf5i1JItnzro26L+5Bd35cu+1pdVjoLnuTyNmfCsKL5eS5y2+b8YrK
	uHrvMZ97jCjncvk0koZUM5ZIBkJYlyCsRy8erTshhYXpqGGkUxbtQtEN7B1gg8uz
	CgXRMZxxRoV6WgdfnVdalqPx34HHCX+9ou1uqUM3/yMMs0zMmnqr9VsYUcytjbuX
	ac4hMg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qt15e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:37:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cac495d99so2402985a.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793349435; x=1793954235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s8Ivp+bT7DEkicAhEn64MXcraB26IrrC5i5zD1lewD4=;
        b=GPzaiJs0o91i9mfa9N0ZOhDQDKiCmuvHsnVjf8PbTVu8tJu8Wq21//15Csce90ldjn
         +9siYOI5UMIz/6uSt67n3v0TUSjdUYD3ciBuiXTSSGLuXAwvDP7sza8r7tldUbDU7Ow3
         NIGvWiBGAgdV1+Jb0vRfwJQQGEkKrNkPXgXXcU6ulOiQyrAP4zsxR5KLR1tnZDb8DMpy
         Omwg+pJ2MC3XFBNkXk0ZoP2P3Y0C8X9Qt7AFwe3Fg2Z7GkdRiDAsRCWvQX/am1coYHGn
         3RPqqjC7+IQvDFF76nUN4VB8Bkvv74TyJ8c4s2YfV3IhXK+UYY5qrpSw0DnQVn49Oejj
         w6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349435; x=1793954235;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s8Ivp+bT7DEkicAhEn64MXcraB26IrrC5i5zD1lewD4=;
        b=GBG8NKJh+Wh4jFrpfvQjRvYz0425I50aS1OTrdjM1mVq7GTv0evIaMS0JhK/aWWuLW
         Pd6K1sMC73lbVFZjuO1BKdyKCYpsU7HthUlmNiRhdaE0KMtuEyZRwC9EkWvZXKkx6BTu
         qVqVDbWG2PAI7ZWnBlDhrNSDa6uitjo7+giA6IKkAZyXTaSAui4IKdrlJQU/FsJaEu0w
         J0KkhF+w5HnF2/1xu+Zg07J9LYhJ6zt9Zan+akcrxpzBAxGC+1kAJ6SOauNQJV7ZWmKa
         Hzqa20qSaNcx4uwtd+TVTp6MkGCBDyYI+mmErHwmL/ZvUSyHX4ZKD/RIzBfYZidWQtZO
         Y/1A==
X-Forwarded-Encrypted: i=1; AKwUvBzHuooyGDcpGMlFDBN4rzGVmVkMoE2vslIgKqKBonCzGh5ilK5LlkWUCRxHoYyit19erIaVmqSBkKSEPTE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/BB6+u1YthksUZ9y3kjMO5C4/oe2lBqbyz2IPKhnuVNWOEL9y
	FouQmaGyI/UCMVcsxYsvgagmNJjaufx+3ZKTG+8e+boqNwZawhoh6HzGcgoC4InAEJatnak3yeC
	c5VN/zcjstKwK5DEJ5VIkSc98Q5ofxXE+qbdJZWnS+8IchJtIdWrWoqq7jCo793LQwmI=
X-Gm-Gg: AYBFou3QiM5ZvAunwV10QkBqfqV8yonemKoyPucKisrP0gHEkNEBYx1T5FwQQIxdBMS
	gV4G5XaFGB1x99Go7RJQNPkDPxmzXldWmisa1L9wFwqh+0MX8Rk7siWefZqt3rN2KgBkMDl9xty
	OKPgbvm2SAlsEIxbOnmnroFKkGNpN4k3CjIUVzF/yKszg1jIauBzSUbCxR5tOwfQK28WRumYJet
	ppuWTG+jz9j2tSqGuoq7lKkGkcb6w62KvFeXbFiq4SsYaYr+u1MXwSoIAO04w2IEV7sm2dyoJxX
	8Bozkvsub7whnKpLWpl1ZpR+J98CGPH1XyVWDt1F1wnLEgra3wL0/NJ9qeWwquSubtaSMhMva5c
	B93Dprm1smnAPzqCVKezcIfJNNgEsvA3BKC4XIXGiirkXQ4pWT5CqbOPRimfMASz3fakvbH8=
X-Received: by 2002:a05:620a:a29b:10b0:93f:1a1a:2974 with SMTP id af79cd13be357-9442173715dmr264364085a.6.1793349435412;
        Fri, 30 Oct 2026 01:37:15 -0700 (PDT)
X-Received: by 2002:a05:620a:a29b:10b0:93f:1a1a:2974 with SMTP id af79cd13be357-9442173715dmr264361285a.6.1793349434941;
        Fri, 30 Oct 2026 01:37:14 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdc7bsm40134566b.21.2026.10.30.01.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:37:14 -0700 (PDT)
Message-ID: <987b21ce-cab5-4058-9668-94afb1210a87@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:37:12 +0100
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
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sdx75: Mark USB controller as DMA
 coherent
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
 <20261030-usb-dma-coherent-v1-1-3147b8f7aa64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-1-3147b8f7aa64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IKCBs8UFeJsSkpTsPnAKjJEDNTDtyRjm
X-Proofpoint-ORIG-GUID: IKCBs8UFeJsSkpTsPnAKjJEDNTDtyRjm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX3ILBdc8SELgl
 ANn2aF/zNo2JUpnR+6hFhR4G6KXzAZQHGs03AmPwIJBWI9n6Uw6sA4TRnEKaRqZGA3QjD2g0Mdj
 mE1T5e+ZzS4kg6850Vv0qGYJybnC59BDRxLmUGRtXkoLnDn5IqISVzw7nu4Y/2pnN1CdeFSk5bZ
 zeqbYIQTj9t9Yj+1UvvkPlC89dlA9hU6USMHdYhQipd3mFj/HaNuaOWtGNs6gBQbgnBg21pAt3A
 jZYTQHRkqlUvvvOMb8PDq8X9IYDNdFIcIfozJurS6TDD0cslZVJk9Cvl6Qae6EEtPRMnbrIl0TL
 8No2UAJxNVCuhXoVqKqdaog3hM85bFX8BAqhdW3uLMYKqRfYmHzMTJKkAJ7H0W9KnDPOJcnqM6i
 u00QIvXZXXg7G8zrzWKPS46M1r2pGRzt17cc2gzKcd0G/aZbTqAfJrTKNnSHOK6RAqHa+6baoc+
 Kf/0XsgN02NhV9Y23rQ==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae4573c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7li549WNwbtQ9Hvr_rEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX7L8HR4KonHsZ
 34fcwTAjdS1FvfjzVKeMLUr4/FfuMz62KWf40omY1WxjxhQW4C83jyp0yFC1IeZoLKZvslAXWQl
 dOTlG8kXOf4X5emSuYTMJBTv5emowfw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300034

On 10/29/26 7:33 PM, Krishna Kurapati wrote:
> The USB controller on SDX75 is DMA coherent. Add property
> indicating the same.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
