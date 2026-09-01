Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3BD47CC92
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788260491; cv=none; b=Qvx7M3XfuC/tKwiovMv2IptiJ4hpG/ttaKhgZaWSDVMF0jfn8KvLwstmqnwREz3UBXROS3pmBGtYwd68B0gLA2mVnRefFgLpJpr3Hff0CAsuqPhXCgy8BczPBg/SeSAEzOactoLQpKuaoogYULOiSONAlFG5nSUuUhleaM+7Lb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788260491; c=relaxed/simple;
	bh=rUg5RDcbQwv21+EeGr6tJRVYoyYOYvydRnuXEoCQPSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=njNO8N6JonX+0Z/cTUc8a0RWaK3vHHWcyL0PsGPtq/vFbkRxAD4ClsbVnSefEEVHHM6DO0ZXLRDmM7o3aJpkH/9utrQI+cuRfVmiTctMR20IfiZ1tFZIsDK+9jRzap5kb4PLtbzrzp3lgFLzsK3eIzeycVo2rBMKRGKL1PYb6GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CW83/wQb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RmIiYnIr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CW83/wQb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RmIiYnIr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJilU2752208
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 11:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZF/DA0i/vJB8ETVhi537WGfCwLGoiddks1hUp3ZHR0s=; b=CW83/wQb1Y2K6z+G
	0dyFxJoDvzG7dR2702RceUiMPF8VFNuTNnJ6J2A28NyzdnTMriZNJnfYIwzvcraY
	VSfzLNiBLOn0MTSucE7A6S0FPP2m9hmQUXmAP7XD6hZMlL1kBS2g1pUS4xfL02NU
	sSowKQX9+f/ZWkf7JHo26vnDLo0sc03R42ERljW6qoVRho3NI37/DEbThiLYCwQZ
	25yzSE1uJylfQJj8TWRbLsWcnCYIKJwBW2CC9LYUOhvii0W4SNq6IRZBU1wCK0Rs
	zISEzek6R9Hmyf/0LK7ugjLWZxSiISeP73/ct1g/wTdzf4tdP4OXhcJIcmHWf4YF
	sKPXlA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfchbjx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 11:01:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6f80c76e6so75060915ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 04:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788260488; x=1788865288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZF/DA0i/vJB8ETVhi537WGfCwLGoiddks1hUp3ZHR0s=;
        b=RmIiYnIr8z+S8YBCgI1FJ7kpFszkiHr2gJbwdjGTflyU7QhWVIzo98/RMgRBf4ZH+j
         ZEWkwwsn2ofyso+1tAKIIx/Zs+bt/E/1NiVHfoj6wK+wBcNcy5l5vcAyPCHicfCKcOGy
         2WmEtIC6cnYTkoV8sfw3pLjc6AsFKlgovkZMhvXxnGoAEZMXm9YDp6pHjaxKTc7kvb3H
         v+CFXg75qiRxNOBPmlZzGbDyDQjkUPnHId5VXZgDRzwxwETa2VTWzB65JIlbii3coBY1
         LTnE9TxXZdD5NRe1MpV5D68wOVEBLQYhKhKXSSQPG/3tAcOgG9hQoLhGGl3t90GVNxRv
         RSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788260488; x=1788865288;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZF/DA0i/vJB8ETVhi537WGfCwLGoiddks1hUp3ZHR0s=;
        b=qQ3Env75+YwplwOy/126OH5QbL5hPagjW48cT8wXMH30kWsCQecI8s018xd8Bv5R2p
         Zff/WUg/ntp0WykegbZKSFg6V+LpWL3ETZG2tGb9p7FP/gL0tCnLhDEhSAPV1EKm4VYs
         ghsHM/YkEOWBwXFbn1BMXt7Tsj5zq5JZcilmVtwhbhMWi/U6MvA3rPGn8hu08U/EZZGi
         5omw+1iSsKF2XYHvfsT5hotQmvd6g+BfkWf2gScs6miCrM7z8HtHVAdZUjO7x0yPxasD
         tZj5k7h7gPuaTKlGdSUN/pfBpjS3W8naaULOx2g8rStVIWLC4HpHE8X5pz52tOLRwD8Y
         Z30g==
X-Forwarded-Encrypted: i=1; AKwUvByndlxlGk5yGn4MlSFrShtKAX9L1Ot2THy3vDPxP6y4LmXA34H9vAP8f+n7EWvLR5lPZRZr6lhz/hGTE2s=@vger.kernel.org
X-Gm-Message-State: AFuF++mLdpExioJQHv3w4MvltQNpbExWc2Zm3ckeNLDiPDJgCX+e6SuO
	fkyjliCh16fJFUiUmvzQjh41j7ji5zGcs51g62/vUMprkzQsEvR0WmaSv/zPi/yvBJfartwyAxs
	nQTDAZcHKkjsZsyFcLPUedHIt3nKlc3eVzZJpWMDVVnFkRyFpJ2UG36TYtO1iU9ReGG2B8OMqwZ
	E=
X-Gm-Gg: AYBFou0G27sqM71S+BE+iJBlpfyboj8rp2hH2vO3EYfYpDA0io6IQRooPbAs7M+3Ub3
	hFvuUDE2tZIMLmOp4IQuCYNZwDR3pY5fttI6t/R3SE1nnut3MKg1Mf9JDFuBj/kWch2H3BKH9aN
	NoYTSLa/OzsYUJfQi5wH7dQRabxevfmG6kYmGAyHvGd8B+n8ehJaNogLEiiiBlGwq11nXQGol7q
	NMPeSOd1Q9lqOFBJXdzfRrC39Antb3FbWy3LZ/GcBOrMREMlVomU2pTCUiiHgSu1UW/0RfSveRi
	4hhSea/ZAG1zgOSoLI8pARHZwW6qBBjxYOfdCDHlGBesuh02pZz+Hv7+AlJFP7FX4G7SqxLdC3R
	GcAwiQpAKewECc89147S5553+YWsVmw==
X-Received: by 2002:a17:903:1a2d:b0:2d8:d4cc:be64 with SMTP id d9443c01a7336-2d94a904ffcmr110370415ad.17.1788260485726;
        Tue, 01 Sep 2026 04:01:25 -0700 (PDT)
X-Received: by 2002:a17:903:1a2d:b0:2d8:d4cc:be64 with SMTP id d9443c01a7336-2d94a904ffcmr110365825ad.17.1788260484072;
        Tue, 01 Sep 2026 04:01:24 -0700 (PDT)
Received: from [10.219.57.226] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7596412c2sm49707335ad.37.2026.09.01.04.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 04:01:23 -0700 (PDT)
Message-ID: <5c91768f-b8b0-48f8-aac3-b08b76605e1d@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 16:31:19 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, stable@kernel.org
References: <20260826033803.475-1-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260826033803.475-1-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tYlABIJwHZ7PSp8dhyoQMQOMHMpEmeKA
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a96b089 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MOthyIZreOk6ictk8Y8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: tYlABIJwHZ7PSp8dhyoQMQOMHMpEmeKA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5NyBTYWx0ZWRfX3AjhLihS1NIw
 gzCXPsgzJnptqlU7M4g1zkjSyVo8JBvMNcdtdSX42t03lInWDNW+xEiQORyPyL5rh4RRe8lVum2
 UB5haL1sRdJO8DW9jFKWCAFT3SDntJA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5NyBTYWx0ZWRfX7+HfwmVsNex7
 2lhOHtQ9IXgn74w3IBXJ2VWvuInNQwZl+8jez3XZznhq6qHw9lN19eTr1aQ73M2gd2USQtDUmdT
 +K62Y6z2GGwhSIfcd2XoJHpa/DbITEDDASySTdAeehaqFm7/oM3sFH4QtnQt6/GkY6LavapsjqY
 da9X/h4DoMGqgzvIrjesGPqW8iqgTqr8bRLcRnZmhxiAFj7I1jnxihxJP80LSLJMTl6MpJVu/54
 F3meC9HyNO47Wiv4CejPqpkpFj8N0D3rJ0YlLNU0n0PHmQOkHG7C+nvpghhbi19g0SonUD8z+KV
 2lCYGVcVSjOc9qp+tm6NFTL91fj8cLylHIZbFzMP53r04Zj9A9wUjrZstwPt5Fej59Mp8jT76dN
 eTsAozElgb2joF80Cat4PA7ToSPjNUpR3xOXBrOGRPI5tayb5ISDjt83cDZl8Dkkb3zWbMiRuXc
 A8ASagS47nP/uZyo0eQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010097

On 26-08-2026 09:08, Jianping Li wrote:
> Allocating and freeing Audio PD memory from userspace is unsafe because
> the kernel cannot reliably determine when the DSP has finished using the
> memory. Userspace may free buffers while they are still in use by the DSP,
> and remote free requests cannot be safely trusted.
> 
> Additionally, the current implementation allows userspace to repeatedly
> grow the Audio PD heap, but does not support shrinking it. This can lead
> to unbounded memory usage over time, effectively causing a memory leak.
> 
> Fix this by allocating the entire Audio PD reserved-memory region during
> rpmsg probe and tying its lifetime to the rpmsg channel. This removes
> userspace-controlled alloc/free and ensures that memory is reclaimed only
> when the DSP process is torn down.
> 
> The reserved-memory region is now mandatory for the Audio PD domain.
> Rather than failing rpmsg probe when it is missing, validate it in
> fastrpc_init_create_static_process() and reject only the static-process
> creation. This keeps the fastrpc device probing for all other domains
> even on a misconfigured device tree.
> 
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@kernel.org
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
