Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793365744;
	b=V7smhPRSc8DTcaCQ9cl3LoiRCngcD8m3ZEwPleC020VD8cLZQjsP9JRhREZ0l/CVdWKs
	 zkeJ6dYEB4TROdM3ywKaoqcuUQtXdF+jQxIWSwQs1dK+P3v49/VKHnNp0H2l2QjKI/JgC
	 m68hbZQfQLp/ohjAbXNZ6PM2dYVSgq0OFxcYVPqejdlnnmCVyIy8VKdNyBG7aBhpvJbpG
	 LeDN8PQeyu8MOb5mVKC4ic3Q16cHZ6UGEOkI7NFXKAoBHKchOu62YhZqUTO2EX7Iy25nD
	 aFvQpoiXxm3PRXmCQLsi7xxgLTIxaDNGS7M627RNBhFn9kvrXCH69RiymVcxHqE62Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365744;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y4P301YqaFnb7KKDE2QgQixMk0k7HBc05iLOcpHCCho=;
	b=3EbznR9SIF2ddzMJhnuzdyxExTA8Qt/7VhHp1gNlfvUe+HD8EZwqpknxYE7fxyU/7Jqf
	 DAcBgM8iYnEUcpqqc/6MnF/6p9MWnPbUcbAD1e+RCLtMBVS/GXTnj/YHRnD6sG4n51Ja0
	 sQ/q/mQpEiWy9ejwZTmd7RQqWzO/tWE5/yUgqW12wODEcr02xSZrSniMQmXxza/72Xm2p
	 k7DcWcK+7YJWy6efhfQj1UD78MweTROOumDTTbFTeBvpTLrE4p0y/BMjGjcq9ZkRAd1RJ
	 LiEBgSu/03/FUeB55jryMMQp+oqi5V4UVyftRjiI2Pe/nzxtAJ0mwBKI+xHsuE3JR8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jofX2PlH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CGG4eFhg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CB8606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85CB8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jofX2PlH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CGG4eFhg
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBFwbH3089189
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y4P301YqaFnb7KKDE2QgQixMk0k7HBc05iLOcpHCCho=; b=jofX2PlH9sK44rY1
	hTJwH/V8S1h2Ehj/NWXUdY64MVX3m+B7He4PrRq6Yb9Iekg2dQxrn0HvtZI28zJ9
	RRcY15pL9JIX/ZRIW1lSCPl2zi8c+svbt1KdqyBn7OuE618BEsyNZA/awYfXJfHZ
	x394lXmUJwAi5oWW7Y3mnrQb4mhpf5ALmAZkfuOBe1PS6soxP30XEchqhEVQXb8S
	6wfxhs5I3ebouclMOJoynZoJ8Lm7FMseFxIg3Aa7qkHnSU7I8HOiGB0jkDZ1sMbu
	mKCDKfioiruMwPg2jwuK8B5KLaUXuIWmy2seuAdgtrA912gg7ClcJYCBdXlsoH4r
	r9G6wA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk5xk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:09:03 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-988ba2453abso18905241.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793365743; x=1793970543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4P301YqaFnb7KKDE2QgQixMk0k7HBc05iLOcpHCCho=;
        b=CGG4eFhgjFpoCVhXhzoK7DzZqrspLx156azgmt8v84zkPP8XRAjOHqYpMQV6a/yZlW
         ZqCtlIg39cs7+vE6cD0Bimac8XPWBBwyfI/jsiK10gEDqjiiDe0yaahdMTZLj2BLsFwu
         czhBf3ftOZ4awB9FjiAEfZl/FAmGPBVN3vnosXqlbnGcrvK8mPD0zyfC5zBBATsqZ5ME
         QBbAF7BX1tXWg+qhLASO2jaOYB1mMlp2oTZlvyY2YddfFzl8CrX/SyiiE8ET9CXhGTTz
         CyOkKd1cDy5dt4k12lA/MLBh06tvJ87ZY9su2WJf7D1zEaNzDBTvLBKhxUYqpHUxc8GD
         qDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793365743; x=1793970543;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y4P301YqaFnb7KKDE2QgQixMk0k7HBc05iLOcpHCCho=;
        b=k0Wwid9DIr8XeyhL1l1DmGnLBtwCowpW7gAiRK+e8MSE1qt7WlkibEZ8SZX1JYKXzX
         cP77PlbG9l86DDRyspg9VnoAEdHz0D8fr8hllAem/YdQUHJgeke3/oPHMAgPAclVkLS3
         7nYuK8NAmK9ak33geaxKw9ZwBdLKEgLRs1rfU4N6fmxF4VGOyHrjdMs4MoSphJdwS9na
         dLhmuQMRrW9ReUKK2q2bD9aJd40atLOl6X/XQlpPqADxGPxoN0ssRBBo2lJG49JidN2s
         g/tLTdl2RXenhlIP5Nf4RsMyKnn2TIow25yZMRL0wYpGygLvne8WAICFx0fj6ebFrZtm
         ATZw==
X-Forwarded-Encrypted: i=1; AKwUvBzAzPCW5grNPEhlr61+b/s2VMveFD+ClPzKXRL5BbkN9KOvwkWEivJPRFPoy8aDbEFmR6jWbvZpYdssjKw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwgc9xYDCnwv2OraGBfVXfhj71Se2nWN1CcFW5XYnqDNRZVzgc
	23ZLRaU/klGRUpwzbSaiiw+2cG7KO5PzkcyH/jUTl8Brbj6YdAECUoXtt7WZ5wwg6jWtp14rq6l
	822y83+HSR24K3UJV8WjIZqG2OJ7za1CtmYZoDjyThpGpQLD7WJFa0mI46JChacmTqPA=
X-Gm-Gg: AYBFou24vDuRD0+pLiup5nEtxtG21EXVNE4hM9JcgokvpgLeX2xmzOFGXlBf+xMOrkv
	U7hu/kQw2HQhstxs0bo4XBy3VLdHbz66YuiCdRwuiKKDq9MKMl/SBCpHicWG6XaM5qI6DxnDUqq
	uFmhvjR+uqgdYuAFBDYXxBWKqGm287nGMNeHm55d1+xf+mWQNXgJPMknN+nriXnBKpPPFeXEiha
	MDXKTFnx03p1WhxHiGTKClrjmvt3DzPvrmzfzOiRQiK6eLLNRoqwRf5f1yAokJUXw8cXQejixXg
	lR1ETy6iPif56gfPSyeJ63JwApUVGI8pHHfEqbt5WsRTYiliRJuhkuYXkTtBuFjBEiFb9WGBlFF
	vFWoyZS9LRPQESwj2GmvZlsUjBiy0JKdobqZAeP8u/TKZMNMWT9PQ0jsjW0nyAtEMT05S8lk=
X-Received: by 2002:a05:6102:868f:20b0:7b4:f1cd:80dd with SMTP id ada2fe7eead31-7d0727a54dbmr802572137.1.1793365741999;
        Fri, 30 Oct 2026 06:09:01 -0700 (PDT)
X-Received: by 2002:a05:6102:868f:20b0:7b4:f1cd:80dd with SMTP id ada2fe7eead31-7d0727a54dbmr802519137.1.1793365741491;
        Fri, 30 Oct 2026 06:09:01 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4d7b01b5esm605327a12.20.2026.10.30.06.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:08:59 -0700 (PDT)
Message-ID: <3f11cf8c-db2a-4243-b1f6-7f2cb9a7a87e@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:08:55 +0100
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
Subject: Re: [PATCH RFC v2 05/14] firmware: qcom: scm: Configure LPAC aperture
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
 <20261029-descriptive-name-lpac-upstream-v2-5-a21a5c850961@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-5-a21a5c850961@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KOvWfaHT7bhCVQv5K0UEx5ANNiWKjTKp
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae496ef cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=HiRCik2jR1DMqHai1FgA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MiBTYWx0ZWRfX4vTE6iIqjd7T
 p2fam9J3Jmw859SLr2MaiFqThkHyWp5FmBdhPm2/Bfv/JJ2pe1le7AP4WPRbpS88+obX+gCW8R0
 KfKAswg31JRexT69bnZh3fxKTLl0ogspsdk9m5QNi3MoBfcax+4HSWekB11ZoDNx2Itxq07aI+r
 ywKaF2NUidLCU34ZjxeDryxle2b3Zb6RTEAyWvqCRR5NLpVgLcgwA2hpfnGQfGXsUdnmT92wexq
 4wNvWIwHwy60KfWcasf0nDCk5T5KzFL+jiSieR/6VOd3NM5bW0FruhhcrTFw4RZVVFnB3G6RsUd
 JCP9p3QmIGer+rBZUivjo9BiiPtK//FPinlVyTPKko8jM1dlIsKXtaKgsyBsQrFGFl7tlWN0qig
 RIbL/8neCutPK4rVQRADkIarPjcqTAR3Qh+IdvT1MSOJ93XHYSQciOr3vTJ6E1P4310zXNbhLHB
 6n8OrX/71Ox1UALsNTw==
X-Proofpoint-ORIG-GUID: KOvWfaHT7bhCVQv5K0UEx5ANNiWKjTKp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MiBTYWx0ZWRfX7JpDA6jMDfVk
 jmpdTQ77bGOWh9DDax20VPAV8uc4jpZ2Ka6UPTXLCwoXQFhn73+Yee/0A+FS5l1/YTHBW7ZeMxJ
 XijRwHlFFvQGiAJafJ3olUieVjWDeNs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300052

On 10/29/26 2:52 PM, Anna Maniscalco wrote:
> In order to be able to update the SMMU registers from CP for page table
> updates we need to configure the LPAC aperture to include the context
> bank that will be associated with SID 1.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c        | 18 ++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
>  include/linux/firmware/qcom/qcom_scm.h  |  1 +
>  4 files changed, 26 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 9b06a69d3a6d..92093399f20d 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -1204,6 +1204,7 @@ int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare)
>  EXPORT_SYMBOL_GPL(qcom_scm_restore_sec_cfg);
>  
>  #define QCOM_SCM_CP_APERTURE_CONTEXT_MASK	GENMASK(7, 0)
> +#define QCOM_SCM_LPAC_APERTURE_CONTEXT_MASK	GENMASK(7, 1)
>  
>  bool qcom_scm_set_gpu_smmu_aperture_is_available(void)
>  {
> @@ -1229,6 +1230,23 @@ int qcom_scm_set_gpu_smmu_aperture(unsigned int context_bank)
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_set_gpu_smmu_aperture);
>  
> +int qcom_scm_set_gpu_smmu_lpac_aperture(unsigned int context_bank)
> +{

Please make qcom_scm_set_gpu_smmu_aperture() take a parameter instead
- bit 8=0 is QCOM_SCM_CP_APERTURE_REG, bit 8 =1 is
QCOM_SCM_CP_LPAC_APERTURE_REG

Konrad
