Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656504;
	b=E37TopwAA7m2EN4xci8p0ymo7usZpPBqnq0KcFOcNJUxXtl3m5TzPTSlxcUXyFFOVmp/
	 5bETecolC8ohnaplY9VM+qAOhQE/m8fiXoufkw0gMC+QgKSPPNWs7zSyg8Tb5tEaQufY+
	 vwQ5BawASgGWA6DvDq7jR3YeMpw90kHTKPJgDfDvUFp+F+Imzqc9LlGYE9ZN74R8+TYxL
	 Q/StD527nqL+QYh3XNA+T7ga/eYyX8GLJfZqRxjWdkmXaXXQblXOrVSMXbQ7i12Vz3akd
	 oaRiXGmwyAlI2Llhb2BCTycBgx9u61OULCK/EsZ7tMkg2JECH/aT+S7muGUUp+Vywrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656504;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Rju0kQfcTmFq0/nuf/5fckzUJMwcIHsYdpF1vEzgPqc=;
	b=kwAmpgdi8qkZkCznUsUc/MNuCdM+oejHBhhrumAGxfEYH3eZwGH2C5OUk0uPER1PxzyL
	 26yp2zwpLhOjB1MTFc/hktfe0RbjY+PPOfVKZOKJTv+5d5OGTN+weUoVjdwG1TyTdZL7i
	 7XblWUVYUt1EJZCNhW9oN96mMGsDvar6Zy8ZKOBZ+5Vs3BHAO/BOD0KXJpjz7r8k+weye
	 yCl3OR2e3nk8L6YL3FRYoAUAC6TgJcoiaQqAWJcGE/EVd6rmDJlALTRDT24WDepM7dg+W
	 ToSFt1J8gs8T8Z5xLgSqmugMdyVUFLfzI94osTOm3LmTgNiRpfIjpFdHsrDNGRfdKzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cwBZnlj5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kj0xNvvq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C060606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C060606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cwBZnlj5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kj0xNvvq
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M704tw4110574
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rju0kQfcTmFq0/nuf/5fckzUJMwcIHsYdpF1vEzgPqc=; b=cwBZnlj5GU+HwE9E
	4jLJAB5g69Kn9u+bz8XrvLss4OfO1m3giEycZoDqEeGvr7ZUf2oo6cWXpSPvaC1H
	vygNgPXU3Twxo1W3u8AWZiyHiUpCZwlOmeenufKnbEfJjxwdUlwrShwVbD5QY+GJ
	hakWlGZ/+VUIlMoLFkP5lo/J7oXBbqVbNbOdNqt5DQz8q2c3sxjuslwNXLKPa/2o
	pfefa9Xau+Cxx25EgoGnbAvcAy1mV7AqbsbXO1KEI41b4Qr63tw/2Fc9FF3kDO4b
	RCAB84UkGeOZxPFVEY+ncfX+g4wp5zjh83i+y8erI5njadqq68h6wlY0N3+ID1bZ
	eP2Ddw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahcvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:08:22 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9179d9bc964so4756676d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656502; x=1793261302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rju0kQfcTmFq0/nuf/5fckzUJMwcIHsYdpF1vEzgPqc=;
        b=kj0xNvvqwzksAwfwVxssk9dxUkm2FIKO3BRGKGmmSf5zofslZFI7ElNXsNHcR/c+dp
         xNs+yMTTJFD8oa9AJh+5Bgwq9omuRWeaZTiC4SDgG4NLYW0//FzqIDC5sfHNKGkeir5F
         uOfmJ/JgJUi3wXHuKKjpiOMeIh6/m8KPafXAoKX+aZ7+qslf7mFu9sUkVHyw+mgzx1bv
         XtWudRRTqhDXUniEkpCoC2Lcq4AslJxG5TRuBrr4CoSnpRtITR535uIO52379qolFN/h
         2JyI35n6KSzTWtB3ut9/SVAE8ahKthbxci1+jLxbBFQrWrYYYMOiNybUAgcvp418bgHR
         vGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656502; x=1793261302;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rju0kQfcTmFq0/nuf/5fckzUJMwcIHsYdpF1vEzgPqc=;
        b=U0B7Gu3uQvkF8LsjY5/m+JwCwAnwjvPYsKG7SVQdt2y2GhNcGenBHzr9NTSfAnhIQP
         vRJbRfY+d6NzoKXYmDpZIrz2s+fgeKhK41pZdxXryj0wh6y4mP2Uwi+b4MYKvy7PepcK
         j5UbAXwdCc0yHEfIxyo18ukhlqU0uhG8ZhMTXoHlGnB4yoFIp6fmZ13TKqiaMyobWza9
         Q5TlE5Cr8Jcujm3pCz8Ctiwh6StdEKcZB6r67G8yZvIb92bsaskO9CNae/wJXP8iWFib
         lBmM4+gaTE8itiB0R5iSnimZ/GP1eO4QdCxYlbuYw4fHEIiQJit5Jin+hAxxHSTIbYIm
         ACWw==
X-Forwarded-Encrypted: i=1; AKwUvBzFQLjJS2OnqEJOHTyy24lNYkVMb7Bl+597LK439bOTsWumVFG39LJyj4JX0uFXgoKk41ODr6WuqbVFQac=@vger.kernel.org
X-Gm-Message-State: AFq9FYIr0qGr0Zyf5+hijZgj6nEVo+RmG6rqjtm993NbJnyVBs7OrNIj
	ytFosPaxrHn5sFLsg8KaT6YMEoWNMZqsFVQRqDg3Pfv5jDkSj6ME7n7dciWDm+laQue0AqL0q5R
	ZYygzIOFN3d0ynvYRJcKyLguspDJ+QUHanHeEB+VhCNWMq8LuQFy18JTkDyMbydetA44=
X-Gm-Gg: AYBFou03hGZtdJvoFDBzYNBJkVLPlY7Tzd+11SDGNKJNvdQRj5KqSsdFcZ3cmpJwUIP
	dbft15Q6mbBPHxO3lJiRt7OjqgLgOSso+BFp8SHu9fGrrtmshdNAmMB5ESqMD0jLZbPagVZB3Yx
	YLNbnliMkyfS0CEcEfph+fnQ58VPLvVVTmAaK0i4aef/tIo6FSUvg+BypWAq6YGyuHgbg+Hoiya
	xNugc7gA5LKwYjZvK8EsRFtMpayaHrYG241IMsopX0HMqI/HNYvPSmpsUSnqSXVY4M/G7/kGViJ
	/fuIafOhdi22E0ly2xOKV0xLA/Eg6JzF14RJr7BfRiVBm2XJoPOo7TMmf+6Qclitq0hPyySUqmP
	9He0p4o9gSQD4w9RfYE9GwA==
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr1009350385a.1.1792656502103;
        Thu, 22 Oct 2026 01:08:22 -0700 (PDT)
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr1009346585a.1.1792656501661;
        Thu, 22 Oct 2026 01:08:21 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a1f0b46sm79569966b.8.2026.10.22.01.08.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:08:20 -0700 (PDT)
Message-ID: <29d55c6c-5565-417b-8252-7f346f07a035@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:08:17 +0200
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
Subject: Re: [PATCH v4] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Hansson <newbyte@postmarketos.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>, Abel Vesa <abelvesa@kernel.org>
References: <20261013-sm7125-samsung-v4-1-3233901b48bb@gmail.com>
 <5fb086d1-7725-4d8b-a2c9-7627f6da7cd9@oss.qualcomm.com>
 <b33efcca-eaed-4efe-99c6-035afd73dec5@gmail.com>
 <eb559119-4d52-41be-a954-2c26492d6a2e@oss.qualcomm.com>
 <701defd4-79af-4ce3-9c49-d3f4378a9953@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <701defd4-79af-4ce3-9c49-d3f4378a9953@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX4tdqRBp9dk1x
 goOLPb3htJj5swdcv5OGoumGQWHmFyaeqsXVFvr4Ddtj7X7nvYmfN5RKB2NCkoHWeCir6cVpBIK
 cZzkJ84MhZx8rWma6zaTmYXkLbJGfHLvWTsbX3jGH+Gxbj93R9K+dLY6tdSzRgFNeHl2TES5vr9
 dPBEcS07FYOErKYnSxFbkyo9Rso3DQIEd3vtZ1Q3HAXLLxedFoxWVXryDX3m8w9NtPkTnsIaiTQ
 sIV983XiCnOm8eBltBfVdIgYuOd8Xh/o3pbygzWejyyvjCNbN59nftcQht0f7GsBdT74qh1rWgn
 G9VvTWx0tz5a2eSczgWWWAzYahmTNy5E1oVVun7Pc+O3CLKuVMk6UyXznvzRRJnlRhi6O6SRl2S
 btGUSoTX3BJ7GfnQsxbi7YN8ZY7mCckaza9y13ojFvr1xUx9eI5d6m+KmIW4m3sdEvNDdLlHqxa
 uewbLz2H+5dl49WYvwg==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ad9c476 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=C8oghTkgAAAA:8 a=aE2qjto-PEiQifxUPIUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=BFEk1I1Cc5IuqT1TcHpZ:22
X-Proofpoint-ORIG-GUID: buzZVIyF5EU6E6YDCGJiciHFFzgTo3-n
X-Proofpoint-GUID: buzZVIyF5EU6E6YDCGJiciHFFzgTo3-n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX1Yq1aZTx0nVL
 A0b68yoFIHjHRim7bd1YhenhPUr9cSOZL51nH/sVMIWtm/aKBp6nO1B94pJr00g5a2b4BmcBWmu
 u4X0evwvf0UnRe+Zr9uf3NHS0ARvKzg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220032

On 10/21/26 5:00 PM, Erikas Bitovtas wrote:
>>>> Have you tried using the bus through the normal QUP driver path?
>>>>
>>> No, I haven't. GPI DMA support for this platform is not yet upstream.
>>
>> It's a copy-paste job, try it out please.
>>
> 
> The pinctrl driver for SC7180 has no QUPv3 mux for 51 and 52 GPIOs. I
> also tried checking devcfg.mbn of my device using qc-devcfg-parser, but
> it printed limited information:
> https://bpa.st/PEZED3BN3JGND6HS6BOGNHQG7I>>>> +&usb_1 {

I checked the hw spec and indeed there's no QUP routed there.

Konrad
