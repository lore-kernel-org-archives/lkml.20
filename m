Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793089448;
	b=oUuDizcR5rM61qSdZTykgEGCOSmjVkHsUFWOIHWGaCJor6dbzN0smd1Pl6eWePs6FEzL
	 2N+WA4QUW/5PGkXQu8Vxs4ibfxlyspvaItpziJ7bNpJr6izw/jy4WLRQ000UGZS4+yzh9
	 6wYpLsUv0PIYwsnvvNvT6IW2F952aWiozjmH4jtrTmLEnVjGortZvMSj5UC2x004L85uH
	 PXdjcGhwwpJ5GBzYrOvBSXCp3QWOX2clBgo4j3feVbS9LP4YUwqir5n9Q8VssCB45K97S
	 /G6DOJ0iC7fTWQHcHZVfcSuh3hwOj7zFJdQcIQ94j5z6KF+9jywrUY9HtMs/LbrwYzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089448;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4lqM52UNtIm/PsesfmEGnfz1xjM4BBYrsaKB+SObPis=;
	b=nNPBejnQUxsxgM4Z0AxKk8JfFxenxA+ttM8s13xEo22GiGCWikn1DmiiIBHfyJ62RPei
	 rKLBimpkK6bn0XAqMJ0sF+8kkJhOt/kDKb2ym26n+1gKymRWRCRGO5OmJYyxd7YO32sBG
	 6QMDJ62WCbnTbvgZd1W77GtuiRYO4bM60KLu3rXIPs6p+X7A2SGNoNcQ4CCNBy8cGnv0P
	 Q/LlAjJi3j1/J1C4YWnwWhyRORvGxLtqZZhOeAv9vihiCgfzEJHplHx6n0FZVlNYRyDCj
	 aQpuKlnT8TEU5lT1N+hOtfP6MeRBRsEu2hVfZ6MIvHYHH1ntgJdZ+ZTLa6wbK3IWA1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LFvJrAdX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K9LabksJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE8B606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AE8B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LFvJrAdX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K9LabksJ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5ZJBQ3950135
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4lqM52UNtIm/PsesfmEGnfz1xjM4BBYrsaKB+SObPis=; b=LFvJrAdXip0Ihrgh
	fPip5hp4MFBszTRstrAe0XcUxB33FbPuJKl830JUr4gYDS3EuCaSGe0EFIIDKy1T
	iAikAphw2+NSaW/ObbSvfb9KWD/bM17oU07HGMht1zmNpq1IKcywC+sXJvPveqqY
	P7sBbWJWSyaxSpu9RfkMSN/UevrlQWraYNpEOk0BeHR27BpgNoqhOOtjeKikeWQs
	So2ihwDj48SGLjIGx/UB5dkuASKgzEH7pZQCYcjQ8llBVI8F9nPIb7k5a26qup/u
	XchTRAp7SQSsbyqUUbZtsAm9vj2JP9P2TcHBUqQuOY/WRGtXDDbK1vv8AhGVD9W8
	rAxcUg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54ju1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:24:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad840053c7so3855329a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793089446; x=1793694246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lqM52UNtIm/PsesfmEGnfz1xjM4BBYrsaKB+SObPis=;
        b=K9LabksJ8UWR5G65BHGxNz42MrvYkB7mZuUINkGxiaNhA8ZIM4RUNS+SH6R2U8fiXS
         trg9cgKiyTSQbFPYzl/Z9JyMGtivq63pAXTDW6SfsNBjYb+15UzW5FknH7P8NEeRulqY
         YNp70IFVLVYD8F0kxUFZJKeRmxpM9Wjalaq/OMm31tqYvskLBz0REi9a97MPc1q1chSt
         8E6gQZ7CBxyPCfJQ9vKA3CBImdU32Rt1nILyLyg3V5OPgwC+rAKJNfwkpRt3kxAQwOT7
         gRjP5xM2myyhKRpo+zs2bTFaGyzeQNxEonJAi0EAFMAJgl6ShJSxnbgl50mGmbXHoho8
         alVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793089446; x=1793694246;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4lqM52UNtIm/PsesfmEGnfz1xjM4BBYrsaKB+SObPis=;
        b=ld+cCea9heWp6pBCulwnyCzhgYfmpmfdC7v3wVi/hcHq0M2+BTxan+6A69zu+2gcnt
         ajQ+BSe0CFUgDJm0LlMWdossxuClF7KdO8H6PyLEUVCh18tymlS8fqNk7QXJK4ya4hl6
         c0N8esHzvyYwqiRv71foxSIeJx2lo4g7x0JiRxOdjW2wrAdqdY1/tHtGmrRz85N+9KRb
         Iu4uktm4DBKKHWCiWVdv342tjtDjMpU4ErUZ/Z0CubP64HLUlWOznwAGBvykTikW0acN
         rRaSITX301VQ0hqwPDD6AMpMCPuI+QWKVYHAUUJwrsLRjUL6l64zQk3FlY9S9B5TL4PS
         XoQg==
X-Forwarded-Encrypted: i=1; AKwUvByw6Cy9RAPf5nq4pOwuqbUoCpc8rcnjxiYPzdHf/I1XpgLiB6SuvtVav3Uh/KRN7OnVMgEHadraqiYchaA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ73x9HMIyBxtyQdQdqTx5/QJOEx0vbmea7cYn5xfLruvmXRIBc
	C3JYzDfzgZBzrLUKn8f7GzLLhcTi3LyRPD2Hw1WGbERKXiS/BxCZKGpESsKs/Gka+4N+v1YJqk3
	4Lj9XG7WMhz/7AE3owOYKgt5vhysNiZSBBRmitp8J3E7pkpy6oXEh1PtWQArlKuSvAL8=
X-Gm-Gg: AYBFou0QiK81qTkmO9+r3MkP4rt07PE8uQLKlKZflvvVB4/Wl/P8rxxCXTCu0j317b8
	9LAMLp9fUDC02vCHgjE481Of7IN9/9804xq+7PIf2i99xoDVC/WfLxqBLMQMSk+jr6GXtOiKWKN
	9XPavJWYx0Cuah79zyIyeSkpAaFC/YV8f183UUqrvNDZonWqtfx1Y3it4wR/zQkyfMVMDe2hD9O
	1YBMklLIz25B11a3DntQpWXtv4cnGp7eRTKRBrECkgRKFMX+CriY4V4isZxTDWPM+Qv5gNsf60K
	6a3Zh1aPPiTkk6MUrAmwOrrzNrZ9lOyICzyiFcYFJuevtFdT6v5KLzgj2+sC7DeazxGaBRcERBf
	abg2o3AIG4fGlVbkQpIW2v0urL4aLUo2OHRM=
X-Received: by 2002:a17:90b:528a:b0:3ac:a11a:7c79 with SMTP id 98e67ed59e1d1-3adeae6db13mr6803697a91.16.1793089445970;
        Tue, 27 Oct 2026 01:24:05 -0700 (PDT)
X-Received: by 2002:a17:90b:528a:b0:3ac:a11a:7c79 with SMTP id 98e67ed59e1d1-3adeae6db13mr6803684a91.16.1793089445527;
        Tue, 27 Oct 2026 01:24:05 -0700 (PDT)
Received: from [10.217.241.81] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebae7f3csm8147056a91.3.2026.10.27.01.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:24:05 -0700 (PDT)
Message-ID: <254c26ce-ef3a-4296-9981-34863db9fa73@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:53:59 +0530
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: lemans: Add Draco EVK board
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Ajinkya Inchure <ainchure@qti.qualcomm.com>,
        Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>
References: <20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com>
 <20261019-lemans-draco-final-changes-bringup-v1-3-dcabe94f1074@oss.qualcomm.com>
 <e675b54f-9eae-46f0-a207-02580fd0b974@oss.qualcomm.com>
Content-Language: en-US
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
In-Reply-To: <e675b54f-9eae-46f0-a207-02580fd0b974@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX8xWlif/7SpaB
 TEHXa5exduMcYBFdmxR6fLIZMkQttPprsRLkeGTyRaObGBs0FuhMvZfTxFuocN7EfNHBuePGcrc
 bKq4yJvqs/MVw6VWKQ7dq939S8kzftI=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae05fa6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=3SUrRiYI98BmUlIlBn4A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: dcAsh8apx2cNR_7gYlNOrHDtsLQcMGeP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX56PRrCdo31UY
 NGJFGEo2nul2AbqovsDgtm0kEu6897s4IGqssOX3pZmT2DwL1RynvCBb8x09H394HrYZiXw9zRS
 /UBVI4NdwE/ae1JT7OoCIELMFFSEHsWrwNwK34Tg8SUMBAINOpw5aRso472VadIdxzPYsnqXUC+
 nKGPighFvw8Yygxve7KSFISsQw6vzU/+TBIUwlgCrZHxwTt8wrS1Hcvr7VRLOOB1XYU5+kfJhpG
 yNBZkffj7BkwSJ8dOmPnYFokt2K/DvL2CqPml3Wjat1jSC1bas9fifY8Q6oL2Ev0JcMaNW8c2by
 P0EbFx0lRzGSQ/6jjCJyt718hjbjUpqaDTU7ualHRqf5uy2vKF7rRn5yqjk2w9QLDZiso0y9kje
 /4WVDu7rn7OqSazH/X4EMLmQS2hR4o4h8lyFH5t1asTT9ejUF82NtMWPgA4/aBiV+SvxFerwPCh
 GGQC6aB0fC3xpmdatOg==
X-Proofpoint-GUID: dcAsh8apx2cNR_7gYlNOrHDtsLQcMGeP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270033



On 10/19/2026 6:01 PM, Konrad Dybcio wrote:
> On 10/19/26 12:27 PM, Gopikishan Thawre wrote:
>> Add the device tree for the LeMans Draco EVK platform which combines
>> the LeMans Draco EVK SoM and Draco carrier board.
>>
>> This device tree adds board-specific peripheral configuration on top
>> of the SoM, including:
>>
> 
> [...]
> 
>> +	ethernet0_default: ethernet0-default-state {
>> +		ethernet0_mdc: ethernet0-mdc-pins {
> 
> Please drop unused labels
> 

Thanks for the review. The unused labels ethernet0_mdc, ethernet0_mdio, 
ethernet1_mdc and ethernet1_mdio will be dropped in v2.

Best regards,
Gopikishan
