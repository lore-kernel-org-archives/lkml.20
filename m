Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015506;
	b=DbCq7x3e2Vz/MKPRhibZtoYrvI+OL1qVl6GM0UiFuA+SmtNpTAHDwPd/0WsDzb/xEgr+
	 g7UNa5k2rp/wVRTzL6q2Y6xDpClRbE2nT4iMcIFIog4j0d5mjJeeLW9Snj2mFoRtEKkCG
	 uXyMmHdC8bYn/Jl2RXoshQtifPzVUzKGo6aPDSWo+lu+/E+47EK9kmiwgsEhV51ZGjaAd
	 Fs1elCYN/AR2WZEgPPT/mNMDabauKaGL56kmmNXe6FoNMhfaFo7fUPZuYmJRX06lv37gs
	 PPgLs5pfxeYwJrFGFPRJFJMipT0fJmpA/vQko8OWBTkx9s3atixRIFHZM+Lh+NVYm/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015506;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/DFWAQQY1zY++oRBXWRTyotn7tN5airZcvKlxRljH5Y=;
	b=cyCiWs0zg+VWBJMfPFQlktYls6RBUhJGlN6C+qIfOOwv7pru+GUqKDn0scepCUcygonk
	 eI3pCKRiMnIQzH6eO2BvBbIXBcwPa5/Vw7vj0wcr7/vhnSV/fjQJXXb2iNVcMmMnVCrBk
	 RO9fYLDR0T+iPIOHc37NfZuM+9M8JmPpsw3zbihFWBrskR5cdvOKR04MKRpkgXorm9z1f
	 g7Tv8vEunxGV3Xod7UK1NYgYe5NzYJwtQPeMcZb2qBPBwSSulqi52bbaT/4FS80lN34Z7
	 Xlvd2nAO7lkoq9rq3BUv7WAfQEMWPTCkXWvr0izGsIfQl2ESeMc1/cKUurOM/BFoZbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UnU7jHou;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hhTIZCh6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00697606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00697606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UnU7jHou;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hhTIZCh6
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtX9k1547945
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/DFWAQQY1zY++oRBXWRTyotn7tN5airZcvKlxRljH5Y=; b=UnU7jHouAnx1JUOw
	nwRKhafg8Pu+P8w0LFnzR4p4hgbje6zCIbrgvVtY6WllaFAHE6pz31CmL7qzb/Hr
	xYigkiYqBGUbqpH1iAKg0vZBR9MBwKLvvzIpvyOFESR+kpMxRlh30ZD788O6LrKa
	cOBaiFhwJFp6bq2BGL86XqY2qOIW0c0Dpp/ILHp3mC6BpmRg/Gja0PsFUcXZoh4C
	AHDpct4hvtMZYVIzX2HHcrYrXXdWQ7n9A/ZMgOVOqqbINWSqeNUw60t/tAMFl92h
	OSXcQq40gXSPGZv2Hke/dMmFmAs5eNymYfF7gRFZkNgOzbR1hEBRDFIEId8LXPlN
	RLVpkw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgst9r4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:51:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e629c7b16so38713885a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793015499; x=1793620299; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/DFWAQQY1zY++oRBXWRTyotn7tN5airZcvKlxRljH5Y=;
        b=hhTIZCh6hhFn0UOPOo/9DEmTBg5I4kjZq/ERm+Je3yju3i0l7WWPYieDRVKEmTzMjF
         MwWP27FLljyjcQF9cbNLsbM6A07lzcyntZIP1+WKp+7ck87fQeh9sVwTMLFiWWnzHO2Z
         huFUh5UAr8bi+vyKy1IPzSwQfATFLhHm25Wfi9AXvX8YRE7L3YdPgCPeTvL2bZoK1PcA
         0D/k/Gvl0gXKP9O2PBWm7P0jqRT01fnWH23hyE8ys7SiUYmQkZ1IihCm7nHVBF9qnOrL
         rioJR4wEPVXbkER1qXAkC9RJj01ZcbJRvLO+uGMGks6RdN75KmxjjddHt+btr6MXThoG
         /30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015499; x=1793620299;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/DFWAQQY1zY++oRBXWRTyotn7tN5airZcvKlxRljH5Y=;
        b=W0j0WOiuyfEyp2f/EbxY8tvAKG9sU+k2qs43ZM1uUv0COVbV0gSrMRR57ud194XA8v
         tx4XMosuhPRYuOmHV5SXthb+V/dbkufl9w7IUdqzQ7ua9DxO+Hnin1AnWENNWEmg5vCu
         NbhLlVuyWPt+EauESep3AbMYhY0DMz6cVmwK3GdZmJXwRT2H/NX0IjoxGz5c0e21sevC
         3ISJlivaOpOtT2fhsib1b5i5vRc7XhtivDFiQOLnnpP0rmdhPVi+JzQWj0MdWwr5cra/
         eRqPgLshfWvmAz2Tl/AMkA2G8Pr+4dAUShNSgsCQMuzE49T4eARc8VhkWnzPvus5f6Md
         1nfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdsT21wHhmjndXUQi6ZzJiRJRkfm8Gx9aF92pp4C55IM3aNX8MB/GJ51Rj/n0yvkWnUIWe/bBLstTpLe0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL50JY98x26YWpfn7c7AjHqFJu/A5sG+sG1mlveNSiGo3ZHulMV
	agAeAzughpdc1OYMI+sN94eojRmM3T1evEZ4g43he3MAzzEckCGmghT17U8CvdynsgKhSed++K4
	pghffelqRa8RhnMRYQHwciScUm6VB92L5a1WTXO/GuL2tGxGDmfjUSXRaj1avh8lrrhA=
X-Gm-Gg: AYBFou17zp9gVsF2H6AxB/SqUl6ftOX1o1ynCLuYQUmJTYnlPDsInpo4hnOYcAZ1Vco
	sRbKIjiFJDIKBzWzrwH4faTG04lfu8bUrSBgBLkfTGuXYloUsoIKQgGg8imj5LZaVWdBDtuP4bP
	MI6f232cnTcr62Xrwlp/HZWzNKzS6YVoHHyxYZn38G+XdQ9M9L2FYCDDEfC3dERLmDEcX0LzNGP
	pk+kuZDH/vF9vJ+sf0OWXDQJF9us1cHBhR8zkhnqRmvaX1Lj6cCV8XBTLNaOb5/z9DqlXltWDqK
	z614ESNYF/6tQj5V3MIkZzyTcB3Oqw59XexewLIOjtDvSB3gPUFnHRmZAroQK/sS+fCvSZ7rVMs
	thg4t52flOp6NLzeL5I7quw==
X-Received: by 2002:a05:620a:899:b0:939:eb09:4458 with SMTP id af79cd13be357-940ef8dcadamr1000467485a.3.1793015499102;
        Mon, 26 Oct 2026 04:51:39 -0700 (PDT)
X-Received: by 2002:a05:620a:899:b0:939:eb09:4458 with SMTP id af79cd13be357-940ef8dcadamr1000463885a.3.1793015498587;
        Mon, 26 Oct 2026 04:51:38 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e9968sm310083866b.17.2026.10.26.04.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 04:51:37 -0700 (PDT)
Message-ID: <e7788a12-3cad-4bd4-9f79-82cd118e0049@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 12:51:33 +0100
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
Subject: Re: [PATCH 4/6] thermal: qcom: tsens: add hardware-bin trip-point
 filtering
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
References: <20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com>
 <20261002-thermal_bin-v1-4-5a29be7e8ec5@oss.qualcomm.com>
 <7cd708de-a58e-47fd-acd4-0e37be77de92@oss.qualcomm.com>
 <e832301a-6129-4697-a5e4-94671072622b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e832301a-6129-4697-a5e4-94671072622b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NyBTYWx0ZWRfX31D2pT26KWvS
 vWRxu6yw1YPGfL6i8HkOqetyq7IUR3Wf56lGWq+EIaBV5Bs4/mMrftXVrZELXYGE3HcnFG0HuSk
 U/LIrYTIqwxTPFXa4y/XzEmEPoIYFO0=
X-Proofpoint-GUID: 2quwejS3eYwUypho6HMLuWg3CNy41cA4
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf3ecc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_EuTZlPCPfvd7hdiCfkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 2quwejS3eYwUypho6HMLuWg3CNy41cA4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NyBTYWx0ZWRfX0F1xIhUK1LEx
 TAN6rRoJma50j7MaqYIx0YzqiexrWempsmz3dQ0Ef4bxrmNh0/TmKLHYaHuoB18kx/t0AZ6NCEY
 Dx9UAIIPrqXSWFmjpCoEsnlBX6jlhVbKBWs5pj2LujmTQdY+JhAzKSA5Oy+vv6MIVjmeun8LqDi
 YVlIHM6WXOc1bBvT//3LjdM2meepXYI0LVJPgtP5Ppw555Ie3QSaeFkoXSG8XOF023N/pKB2sfN
 Dv82ygg+UI9w+k3KR/fxov7QIuc0nt8KxnNh0Cd/UoAyFk8HTWK9MIM2jo440mbX2BB+puP2ujf
 vnqiYLF5M2Qo4YwWpEI7E0BsgwJ1+EUoCKk1k3dyUfclUZXzQ6dDjXExArh/10dG/lqgYeqUwa+
 wUb35O/RQPVAINW1Hh/kBqpQEz+U5wQKswA9eIXkLVUk15Ov7GVXnJKl3YQ3DD2IJrfmJ+4pRGJ
 FF0JBBgo5HZtX5G+kLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260047

On 10/23/26 12:01 PM, Gaurav Kohli wrote:
> 
> 
> On 10/22/2026 2:39 PM, Konrad Dybcio wrote:
>> On 10/2/26 12:46 PM, Gaurav Kohli wrote:
>>> From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>>>
>>> Some Qualcomm SoCs are binned at manufacturing time and expose the bin
>>> in qfprom fuses.  The thermal core's supported_hw_bin mechanism filters
>>> trip points by hardware version; wire tsens up to feed it.
>>
>> [...]
>>
>>> +    /* Hardware-bin values for thermal-hw-bin matching in DT. */
>>> +    const u32 hw_bin_std = 0x1;
>>> +    const u32 hw_bin_elevated = 0x2;
>>> +
>>> +    /* Higher thermal profile identification for qcm6490/sc7280 bins. */
>>> +    const u32 tsens_chip_id0 = 0x197;
>>> +    const u32 tsens_chip_id1 = 0x198;
>>> +    const u32 tsens_chip_id2 = 0x20e;
>>> +    const u32 tsens_chip_id3 = 0x20f;
>>> +    const u8 tsens_feat_id2 = 0x2;
>>> +    const u8 tsens_feat_id3 = 0x3;
>>> +    const u8 tsens_feat_id4 = 0x4;
>>
>> Isn't that (also) exposed over SMEM?
> 
> Thanks Konrad, for review.
> 
> SMEM has related socinfo data, but there is no exported helper for the
> exact fields needed here, such as feat-id, which is also used as the bin
> value.

Is that different to qcom_smem_get_feature_code()?

> This jtag-id/feat-id decoding is Kodiak/QCM6490-specific, and the
> thermal-bin mapping needs both values. Other/future targets are expected
> to use only the generic i-temp fuse bit, like Hamoa.

So there are variants of kodiak that ""incorrectly"" set the feat_id?

Konrad
