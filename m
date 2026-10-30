Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369673;
	b=pnnqzJTJhy31dmHl38oXcMXm2lak994xyprY98riki2GWn6HkJAUT+Qh3qMN/5PeCxfp
	 TmxSLv7YEC2SujA79OcbrMs1L0jqoQfqVrR65Vo60vfNe4nk3Ketmob9MRMqXt5oycwDc
	 9j73nJx8QJHYFuwPron6OaN2K6SzyeKhMIkRs+/Y/5AOoq+qdw4SIguBpjCR8gFJ+oBT2
	 A7AY/PdOdhUIJ8lqv9pZWkT1zxBXeslh/Fyq4gpLCRHSMdJO1JlhBgVlTtwtuW5ics1Ma
	 onLxzL0+YVHtDn8HN4bhpayeovz/gu8u1hj6gpOphvgQpxc+7VhhIV3QpdE13yLvaxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369673;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3Jaru/sr4U9yir9nA9QRFkdDdW1X3YADwZa6Fl4aEpI=;
	b=2FxNFQEQlAsnPlJqOr1Bu6nsBDRysDr8IC5YGBKkJNDKssQMQg8p8b8NV4GvXxjshM/i
	 1rISvUchd3WFsLfkaX7eqkhnJxVKQZJgmm4ydyu2RvKigFZCT/SaG+JoDX0xi+XpKejfJ
	 zzQ9jy6H8vpO7tutIC/1ANY/G8iGN37RAKUAxNy9va9hNgT8LoqVjaMzQm66aDJpOlVoF
	 jnZIUoJsYbzxXVJCLvxGLWFpPTwgiQsgGkKvR8t7QGAdU+mCOy8QEZEzd3YpTtXL2BAKa
	 wy2iES0y4XO4c0Cjku3Mg7BjPIODl8gBH+iu95nPegQ3RIp8lP9iSBoOGEKsWGDxmjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="D/0F0tJD";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V156ucym;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587E6606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 587E6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D/0F0tJD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V156ucym
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDnMlt294166
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Jaru/sr4U9yir9nA9QRFkdDdW1X3YADwZa6Fl4aEpI=; b=D/0F0tJDf2Lllyzr
	dInXChbQXJBWuhLcixxOCSO7eYhukDPdCMVAkxA8qtVOsxa3CKmWdxLAvJsGHCgp
	nDBP7gZmDpzxLPSGFaKxPbCSUM9UA/WV40YDEFB/R591WypnMfwNlVlBIf7p5rTc
	CxAppIgwIDRAFjscogg7hw4I+KmIxEBI6ZpwMfnLWei7MuluFd2JmMIsoyHHhFbq
	eFiQ8FOtlS9carTAf0rLsDlThzE4gDIdaiOGJErLoxS36tuFLMVkdsZ6X9UxhQlb
	qRwvohziZCCTVJywMnEb1ZYmb7ng1uVN5n0+TbdcUHPUYynerYirq+IzgmToxfKY
	GIn3+A==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme753drg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:14:31 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eabddbb650so18207e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793369670; x=1793974470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Jaru/sr4U9yir9nA9QRFkdDdW1X3YADwZa6Fl4aEpI=;
        b=V156ucymngSmViQaqZmDYwRtNDSYEnrqdz0mfuEXMAA/iczKN55kfBxkIxOBq5l4jG
         mFzeNSqIBvwTBVBAf3eW94/6/gfovk4RwwpGZtLlywlgY2Ygaf520/ieC+9oJ8UE5D4o
         /VZ3Ow+V0RNCrEKGFHMVEXoYXsj8f2UeeJiFOv6Dr16N6uEsZ1BrTWQMwtnjv7mV9sCV
         QcIqx4rKBHpPyQL47TzgQiHwjxWYclZqR8GtQvzWgCoBxCfY/muvvYrq988SoIyMoWAe
         mV/RNBGz4nfUJxPD1+ybmUeHLAQ4luGGy30RY8BHxrIPZ1+0JNiyaLN2gLHGyvOkD9Bx
         ZGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369670; x=1793974470;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Jaru/sr4U9yir9nA9QRFkdDdW1X3YADwZa6Fl4aEpI=;
        b=1INUKtFArUFZAGna3WtsTcuGN/xkEyMC4yjw+dLcBXWmhI4mChdk7YRK3X+cfEISGC
         HamBL3hN9hC1yz3U9xtDYArQySuqayljnwX5JetPje7vi7dydjMnta0gRXss4ZnjQ8xQ
         voptunGPmCryIkUQYdsbNW3X48B9ijs2Zz1vmL0Z52puOvNhT3fCBfyi7usTBI52xYtg
         kZe8y/v73lnyQ9oUZVCg7NvAa7BMbUHduWqsn2TNISG99CPAXxi9Z0FqjD7dxfteiyLs
         wIpXmiOYw86wYTi90RgdDaQosydHJMGSzh1gCuGrbVdE9OkOmlNTDTgeEoOqA7LbTkgc
         qZeA==
X-Forwarded-Encrypted: i=1; AKwUvBzdie6t3AnmGmCYbi1e0cQcYOoWO3X5Fzu/K7dOATqGHzqJtiaQZ9Ng1KZyrbY6FyZO2A2U8TwUQao66WY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLTuPMDHFj1VPpd6XybHfAyyxkcmNIytZRyPRuQILgMz6rcRLr
	aSZjMip8JKMY29jOSJh0F3g8Wscv1atKI+yEs/AIRjmm0Fwcplts5aEcdOf0FHF23QoHWMw7+Dz
	aSBNFeRJU2EoP/wBN8IHm0FmhyitiAxK37RbQIj8dwhd8zMREAsXF789ZLX9p284gVC4=
X-Gm-Gg: AYBFou3qJHgc15w2nS6sst5oJTr/DkctGnx7vuJSASXyEaE6J0QeWjx3CkLH5d8MeLn
	/6vafuQY1UpwNoYVl8vFIJaMSzlEXb3KVVtZmFHzitEKoD37Rt0XdWZF5h9dzdf9fjpzrkLNzv7
	92m5VgGbHlMvootN+aU+eT1OvuyhHb+vuGInfVgruXZVDrM8DKHiwoupOLLMEicn0MW8rrqxQVP
	ZNes9IGa1ySe8OV7uvcgzmFu7E4hWNxNowhlvDm8nkK+riryLfsHnolms8VjeBH0e8vjGyf/4vw
	TaOZgoRdr2fDfCN2+EbiT1kMa1DVQ66IsPjPTsqERYmd6CPIgVfnUORPzAZ1GeZBTklK4Heyk7V
	AHr9FaU/SyMAfjGOjUcnyy038e/1CzMut7kkoxjh9bgiF0KJB+Amm9fRL/DXJbgQyEcUdOfLr
X-Received: by 2002:a05:6122:4a47:10b0:5ea:cc1d:173e with SMTP id 71dfb90a1353d-5ec6851cd15mr1215921e0c.1.1793369670477;
        Fri, 30 Oct 2026 07:14:30 -0700 (PDT)
X-Received: by 2002:a05:6122:4a47:10b0:5ea:cc1d:173e with SMTP id 71dfb90a1353d-5ec6851cd15mr1215878e0c.1.1793369669938;
        Fri, 30 Oct 2026 07:14:29 -0700 (PDT)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc18ed0sm70345466b.2.2026.10.30.07.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 07:14:28 -0700 (PDT)
Message-ID: <eb461324-2ae1-4e62-bced-e662a69b19ff@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:14:26 +0100
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
Subject: Re: [PATCH v3 14/16] drm/msm/a8xx: Use CP_PROTECT_PIPE regs
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
 <20261029201730.151754-15-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029201730.151754-15-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZUJrDLfcxAo7Wjrw7ZLGMxkcgQ18fp1T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NiBTYWx0ZWRfX3ernJy1YKbK8
 DCNRUECT92CCip2OTaZ8B699zdfQGmg+v7LgGcGLm5+lgZ95c+o0QFQPCXciHT7YsIkpqQX0h1R
 W4c4JX4Mu2AIoOxJ37Hx9NYSZFtoIVB6evLkr8TR2qficq0h64PlorKyiLjFRAMmke0xfxiJDw7
 tp1aqmomiPxJ3XYrJsNlN68oRETrT1STIapCi6VJ9l6DAsLwbJfvdHmzUX4SdvfxJpcmS84iSSt
 ZeHhiklA28uUYXVJpCC5aLrCpmHAQci3B1QCIf6sGOe3Y3Tcd0GqqBXYYUKSe4jGS7vcBVj80Sb
 NJnHySIru0OL1yFNMCQLYeKU5Sv7cKpSPTROz4Uqo6HNmvNh23q4Cc85/mGi4ApTRchTwKPjOwz
 8OaNLvNhGBgaOSHQ+gEJ/nj4S1sy4kn8PCkcb8B4ptcMNWMqkhXz0mesVIO9j6mst7JaHTcfERH
 RLG3Kw7qWJCNDSvu71w==
X-Proofpoint-ORIG-GUID: ZUJrDLfcxAo7Wjrw7ZLGMxkcgQ18fp1T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NiBTYWx0ZWRfX5hIkw/KjNga0
 cCrTD1FAF29NO1L4uM6uZIW9Sa7lFVk5Q4/GVKVc6kOSsTlrHf4J+/DxePj21BHY+9r5cWvIUaT
 oTo43LUMtSD1HS6U72dK/PnJBb8OA2Y=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae4a647 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6Pdd9y4b2srEKQt70McA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300056

On 10/29/26 9:16 PM, Rob Clark wrote:
> If there are not enough global CP_PROTECT_GLOBAL regs, we can use
> CP_PROTECT_PIPE regs for the extra spans.  We just need to configure
> them the same on all pipes.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
