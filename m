Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007634;
	b=fH35m2es0YGSZ0cugO6qdHb+mhlK3pw20W9oS5AjMdvW0AQj7MDNTGruoYYnWcapI6FS
	 KEedbVbQgvMYL7ZTso6OAAwasxZ6czr3oEnhd2XSiWZIjPSYdM11lV8UVNOuxOEkVE936
	 ukNaCurWnHfXqO7TjEGQzu8H8qosFp+dLvJQBnRl4NU4o9fqbHcz6dWCxwqf/lAY9cyml
	 nIEPBT+h8xv8BGs2xby5cdWVy5UjsGMzHFULTzPSZAXoUlqfjzOKo9zeoee32Qr91K0iA
	 TedDBa46VgTYvC13bh+GlHBxiRYnBV8g+DCG29v3GPF9szRwqsExbRKDgSBuSzhP2GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007634;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OcTBksbIW2mgBaa78YQJkuMhgafx6BdMoS+/otq+mGA=;
	b=5Ne4YQlDTwxzLLJDK0PCzdyAZgI5KN3Uy8qP4JogPrBXLcXctLLjZ/TvzjGy9y4SguLN
	 KCyWCqMPFDTFNIdA/UXSdX87xtggijyJRaDhkOucoA3vWWim+JPXQwvWpoqJu9+K5ymvm
	 Z/vLqdxglEnIcoPWIdtx9WhuJn5TWr7Brob7RuCblldn6cqPr5nhM1gVEl3m8eVpYfuNH
	 Jrn/CPKjkMSLUycrWiud+I/4XIjvRcSOVKpJmMFxTU0/IlP1/XQe8j5iEitGqDnffkxw2
	 VKETZ8siddJurb6J0DbQFpFu4Z1P56kXi+pBptPNWIEXj+9QTheKIDBkjt5V1D0MwTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IJTvIbc4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kRYHzBzX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AFF606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5AFF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IJTvIbc4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kRYHzBzX
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4auge2255188
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OcTBksbIW2mgBaa78YQJkuMhgafx6BdMoS+/otq+mGA=; b=IJTvIbc44rF5CL39
	Dl/OAuV0Pu4/t2JqcNSgZ8FgEH5YHfDNzAoTj1m6HyEwm/976G785vA1nB9G/KWG
	BVMCXYSejpmXkTLUFhQcFXpHxMSIr4bpVpd2tUMHRQJgb+vcLHCTbbloGhZzEBJV
	hRsagjmw5WTcY9ZkE8UF+T1gwIgJjtBMx7SjeiJJYVc8ReFj2bawChK/SPQmmOuC
	rY8XC6X3DZkd5gp60d0uuqdgAPixY4JoJ/Oypwj40+FttqVdbCeqXVMa3npiPcrc
	Ocr1J8ZzzEa/1tV0bVwNczkAT5ZFDXUfyWBOgttaIU+Ma0Nkt62t8+KQS5U62YeL
	MV3Ftw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3nq4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:40:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93df7a9466bso28227485a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793007632; x=1793612432; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OcTBksbIW2mgBaa78YQJkuMhgafx6BdMoS+/otq+mGA=;
        b=kRYHzBzXKTfQZLrRNsgkhxqY7r2FZsijVhP1FSh4qh9jH7lcZoeDTSfc+ssE7WSrj4
         JEcgtCOicmxc7UdJKpeABnVZb4JnfNtGOspeCCDGddeuYr1AJ8fOHYkrV9KA+ivewW+X
         ZNwGSsrY0KzXOg4NFXnwULckp57tsA6GyREJm6J0bRt1PYs1q/IjRyE21NW4UWVBO5Ep
         og6WeOJ1ppUNbApG2Gjpisw6nEryoctIaMZEKNaQOgbYK88mYnFiRG3TWKsrd/52ozgc
         RYzb9ThF7GFN79gxaDRF0Vbenq3YY617qFq1KM/LDHy2yWNk0Niq4CZnVbID064FztO/
         4ekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007632; x=1793612432;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OcTBksbIW2mgBaa78YQJkuMhgafx6BdMoS+/otq+mGA=;
        b=qMVUE1m+cDJnVYdUtQ3eC6vUDWbmi1Kk8J5/fiGLZFVT2ZGLCYhf9/jIBFORR1BvQ+
         Gar4y/a+E6QWS9cDOuyendr0JGe1jVe/CZvnz7XPIXNfFA0SiJNih944OTDeKXpy+OeD
         NRHqPn2JToQV/eq0z6FSY/k1Xr64MbiuLjGfaEy+93wKQjE/03Yq3VOfMs9ymSFjPdRj
         //XtTrHGP+DDdma4DwMYgvtBtmLt59SFLeyiFZZITRfWw6YoQQ261x6d6ZipB9EVq54G
         aI2IsJEh6sTNZS5YqLzVEQbXHtKQod1t+HG6xG3rsUeNplJ4Pd+6rD/lMsY5nBKmc9uT
         gSeg==
X-Forwarded-Encrypted: i=1; AKwUvBy/TrxxiVHsyW75lD5ghiNp39pRAcpDPWugYbuXRV9bCembFMaPcTw8jAJ+6g2rNIyHu5tCIocM5paBwCA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8l48zpsqU+39ag/DPVj5qulPKq6epKc/leB2WtFoD8xPIHPv6
	wDROLTbr8jZU/SZ9zCZ/mi72SmgA0epxRfKyUfh4bakGIcTp4B0oC9J0exU/ojjtK0Bfj0a2lUq
	0veltyb6xxB+tbcPAUBrLfzKVEaI59ht13wyNUCKP0btvWrO7SMid/7Y2iIOhys6FmKU=
X-Gm-Gg: AYBFou091NCkPDSRFNdafeeOTGMOslRHWXbN1olvIb6LuPKoUD8ebaYuNR9Wbrl6iVM
	vDPf16nT4/QTaHZi8ARl5QB86CGQh+Ydsamgr8qDpmIAA79ponSENCZtOx76HsI+zAV59JqIoF8
	wq+oJfgSFgpx53QczmnJPuJgTOhIpU0zi5AQ3KJ/vG+a7vfU0JYQnL6uBVoc2P+bWK/7mRw0Ufs
	WQ4z4vJyk9QQOPCSoEzfyMSvckRsBhD0CpmEl2iWtUM2e0YXEB9YUAUws+fTfjpZ74KYgX9XrOd
	IXAZYnZ7zp3VIbURInVmSzXAIjUwXZigST1uj2LVschSmPXJOx7aFFzByXVw8u3Bb+8Df4rUOva
	OIWVRaeE3MPy5J8kNQxBZUg==
X-Received: by 2002:a05:620a:8794:b0:93f:43a4:a48f with SMTP id af79cd13be357-940ef96b4d0mr911111485a.5.1793007631913;
        Mon, 26 Oct 2026 02:40:31 -0700 (PDT)
X-Received: by 2002:a05:620a:8794:b0:93f:43a4:a48f with SMTP id af79cd13be357-940ef96b4d0mr911109685a.5.1793007631426;
        Mon, 26 Oct 2026 02:40:31 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34f465sm296760466b.8.2026.10.26.02.40.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:40:30 -0700 (PDT)
Message-ID: <c3fa2f7b-42ba-4e10-af06-4cbf5676e438@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:40:28 +0100
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
Subject: Re: [PATCH v3 08/14] drm/msm/mdp4: unwind a failed mdp4_kms_init()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
 <20261024-msm-kms-destroy-fixes-v3-8-66a30120a5ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-8-66a30120a5ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iuqkG4o2SHRmcpu6wKRs9TG0JUsmX8Of
X-Proofpoint-ORIG-GUID: iuqkG4o2SHRmcpu6wKRs9TG0JUsmX8Of
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX7gs5GJ14zBjK
 G95ftvgMmwSIU1XSpwYCszB4hGmq34aHU51BvWi3gzWki4TkagBJXVMOPRH32LYL82jLLrqmCBw
 XgEE36mwTLgJa3PUztwIbsdzmMoNFVg=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adf2010 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=kk-Jr0jdRmDx8_r1h5YA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX/sgwQF7ctqSD
 RA/LZR/L2wvoz68r9qtGdX04XUoPK8Bv5zogKRsFjomnoN9cNqmJT8KNJbIJyTe+e688Y8XiwVD
 lGtSon6DxwU1Hr0xPq7DxgBa1E5RtpMqOLulBO/+0Zbbh4VytyeawCbCmPGrCIxq0p7jTtCppVd
 k77L4T1x/jXYhS7Lxdm/YavHujp/BC9V6pNVlrGT2d7A4DUOaqv3gcw8zZFa3xdiMG8bwIhMAlu
 ZszzjdtUCAjqK1B5uQ6m+xZeQlIP2r8001OkVEEoMJOC6ht6EffkaCxAgWJqPbP1e13Pz+NY/oG
 Lw/kX8javsFmbVC7EHML+j9mSqK7Kca//L44A4F22GiQXKAi+c/OsOic2R5rlg5+jhTCHY3YTxO
 1fYmWnI2l1FnEnIwVsTd2dDKAjq/yPXgc9OpRyq1sHBs40Vzg0IjZbiDhi0qPTUNY+9E31IE58M
 fTTxUVdwhWZTo+3nE5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260038

On 10/24/26 1:19 AM, Dmitry Baryshkov wrote:
> mdp4_kms_init() returns straight away when one of its steps fails and
> lets the ->destroy() callback, which the caller runs afterwards, clean
> up. mdp4_destroy() however dereferences mdp4_kms->dev, which is only set
> after mdp_kms_init() has succeeded, so a failure there turns into a NULL
> pointer dereference. It also leaves the vdd regulator enabled.
> 
> Set mdp4_kms->dev before anything can fail, undo the steps which have
> completed, in the reverse order, and tell the caller not to run
> ->destroy() after a failed init. Fold the hardware setup, which can't
> fail, into mdp4_kms_init().
> 
> Fixes: 93c125e4ea98 ("drm/msm: don't tear down KMS twice when KMS init fails")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
