Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743243;
	b=cOijZ8lK54jueINhANcWL6ZB5HIsd7KLJ+PU/xX3zlJwN+0JKMrhDRSE8u/yrynwraSC
	 8jHU8XFOk5e0xGSfal0nh/sttqwTznB9TsUAb8mB5POaOAnM3Yf2v6PuRJDMbyEhCPRaD
	 BKqG1pPstdEKLmX0rj4El6+t6qG8x0Nf6T5I5IxwsHZsjonutbPwQwCQBUr0g0/x01idh
	 81f8JGB7mXJyYDoqHEkAAKotMpRweXVbQcb+MGlY+pRoO8KabWndFsDmGX86Ca9eJgk83
	 TSTi6GWMx/7M7FBdTezCcLOxBEhb+Yj2hXiuGYapQEQRxmy++DpUE90sEmjoOcFM93w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743243;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tqv4KAoTYY3S/U2JwEiFFAex7twOglJ8WJnUqUg1DcM=;
	b=Bl+IUQ+7x6g9Wym9re1PaNfD3hjHS5Znv+gSbfNs2mF8THhxWH+d2ijuJu25UocOhG8g
	 qhBj19S2pYpQzdUdnetKVv9YEEpeBVYa90/BtrhzUWNhW+y+EcF+RyE7hgzrTY5XHATNn
	 LCzeplSMIyjy5IFuP/wdH0VDsCi2GRrzrHQSDesICpt0+jG+D5TvRMaU+SAz4El0BXYdm
	 JFGuYxRlsHxq1hoXuprtwRF+DczBtnmwNd/hykBIGVkHDVyElyBWDkCuQHQWRDHCr3aqw
	 yzucrZ4C35Jg8WPw+yDBK988nbOndAcp3OIuFYpDCc/DSHbjVg4hDPEsZ8ELJUoIj5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kJQsA8Fs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S0FuaQ0p;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E6960A2600
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3E6960A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kJQsA8Fs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S0FuaQ0p
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FDKt1767187
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tqv4KAoTYY3S/U2JwEiFFAex7twOglJ8WJnUqUg1DcM=; b=kJQsA8FsdDYDXY6i
	a7Kj2LAxWDzNHdXqTYI8OUen0oHwtkYY49xBoELPc7nsS3cmskLKwlLSQuMI1Sfz
	PQ8/BdIr+lSMLozM6PymdpD5dU3HjuHwh4a5XIRnCtneyZgq9dsjQ5LKU9PZL3gG
	lefv5o5fY+/kjDHBCB2iMrXOQpZpJRVbfwokoURV/idtOFD0KAO6VLk0sZsUCrsU
	5tneIsou6i0pqjtKPcEW8Ajev5nljBoxbIg9OCcyzjB1wSvh7gkwUVCBr5gQ8H54
	yDjCWahkVkHcW4MKPCMPHpVtBndx3L+ZDbwKERK5HP+7uOTs/CY8sT858z7Pr4Ip
	NTGnzg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahu3y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:14:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so663414a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792743240; x=1793348040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tqv4KAoTYY3S/U2JwEiFFAex7twOglJ8WJnUqUg1DcM=;
        b=S0FuaQ0pkI6VjzKMlizG3ZnUjauVgPirRVozKYI0Yh9BFgO71UCTRUU3zG13O1d/Xn
         4P0IGe0lD5Sf4jGJftoAKmu4zT0YMvEneKlojMLzTlF4sWMOSrdxBXUp7Hb5S0IhjEjq
         BYKn0dYhhf9PI5oC6L7/G+pTuA08lMma2QYXVQCQeYIJpuHMsNzgoi81eVs35MSSq1rf
         6P7anoX6Azgf1wZazuZn5+gscmu6hm+PZiSEA1lcXyb8pN8+KQgWNGrNDjig6PErBBCt
         nlHirsSmaoi5fFF6L/gw5jSAmbt6nDT/4WevzbxIeCqdqSrJTaj4FrNn/d2cQ9wvx3fT
         COqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743240; x=1793348040;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tqv4KAoTYY3S/U2JwEiFFAex7twOglJ8WJnUqUg1DcM=;
        b=SKMGqwOhDW6Tz+P6mJffd9laxR+OKE9NJKuyrIFU5Z058nNM0NLt7xpb8deq/GClaY
         kSXAyEC0Ujin+kMJBpKvP+DJ81OTuclSymuSEaJ1ogzienVkr47507MOV2RS1/2ymd+y
         dMNTdVc+k/RrOFUH5MJUF+X6c0li3CcjIcrreGDU0/42bid5BtjseSOZItGjMra0qPd+
         Sy9xoOBpKprupLGs2SWAa5Dk9r8R3PpjkBKfxTok+3Xo3dkkdJg15eQF2eME4SgoDaUZ
         PWG3698Y+sRggTxDXsXK/u34Kn9Jqjpv0wBEMz1fPFKAwpK1TtLTaI9ANb1TBj957G7v
         r8Vg==
X-Forwarded-Encrypted: i=1; AKwUvBxDXAZ4IJJ6cKxyoaCePFkGaAI6h0RSEr9vdTbfrTirm3ujyHwN0bhXYw5VlZ30n8L7mZxcehjrS0Gn73c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkcAJgOaEJlZuMbCiClgibKUV3S8sPSNlGsF0apATLLV7oJU1i
	GfOCzqkmOtfMsF4sWa4PqZn6bSxP4a613Jz1DuAkBQL8Nq/XHbBpfZ8CHPdTfY0VFs8xrsDh3I6
	8L84qSN69BoGHs7QlNzJo2vh3K/HoR+rbECSt/6YBRVjLR0fGSEdo827v+5C3juGYngw=
X-Gm-Gg: AYBFou2XLLczNfHr39uqgnsUbmg/rrUTTJ5dBz16Un9TY1BvZV+oCnYLXjQ1sZ6MR1t
	YrUgp1N6X7epDurLQ08FurXGxOe7wz+Ft71IUlwus/YdCbERhFyhS2krA2Ce89xy/ziQCH1AEn9
	WHE05Ciah7pRkY6WIwzJXnJ3XOk6N/DC11VJoDUhNcHFKtv8e5YUhZpduZTZXPz7AwmMFeR/Zjw
	AsOuQRIpux2HZyRRhKG5xsniBiN/K8EZDWkZNvKZivvH4E30MM8fWO/TFYWOlD8+wPb5w4eP8W+
	dIx2Jmjm4S4O4pGZ8k0+mCZGz0DX5B+PW1io9nbt+rhobAoqEnwBoksUGM4LIwIvFguQlcXM7Vc
	NMR8aIH750TyP5eVvMS3b1Glt5zLLr8JdDg==
X-Received: by 2002:a17:90a:d40b:b0:3ac:8ee5:e007 with SMTP id 98e67ed59e1d1-3adce616026mr940572a91.20.1792743240447;
        Fri, 23 Oct 2026 01:14:00 -0700 (PDT)
X-Received: by 2002:a17:90a:d40b:b0:3ac:8ee5:e007 with SMTP id 98e67ed59e1d1-3adce616026mr940524a91.20.1792743239783;
        Fri, 23 Oct 2026 01:13:59 -0700 (PDT)
Received: from [10.204.79.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4954979sm7758959a91.17.2026.10.23.01.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:13:59 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Google-Original-From: Jayant Shekhar <jshekhar.shekhar@oss.qualcomm.com>
Message-ID: <4c4e48a7-5ece-4fca-9387-a50c29bbcc83@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 13:43:49 +0530
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
Subject: Re: [PATCH 09/13] drm/msm/dcp: Register DCP display pipeline
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-9-48aad0fe4f72@oss.qualcomm.com>
 <b2cf0c52-4c31-4b17-b341-029b82ddbd7f@kernel.org>
Content-Language: en-US
In-Reply-To: <b2cf0c52-4c31-4b17-b341-029b82ddbd7f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX+WTp9899RQ64
 3hdtVp1HXi2cTWZUM5Hpb4C6KohwCOLzIKwuy4ibm1HDldqNTXuJ/BgBUWD88STQq0woRLbMKO5
 QHF6I22CZdd5KfZhJgxGK8aqW6ykIrA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX3s+zYhBY38Yd
 Ovucm5YN+6JD5jzDM5Nzae5ZRFyDvEnQKNqN9xLj0yQUzb1ttGSqbBqs0iS5nOQs5ERuIK8u6Yd
 rYClkLBssO+RdF4cu01y8ggbRVE+rjEXj0h+Bc5qHzz7+DZcLeQuM3ICEZv/EdgqYJqaYbeMltX
 TuU5vdX6mQihS3IxTX+ZuZVvtwHSUmLP5llwtvfhfJW2hiBEdMP0/xnWNYkSIMQGMyVxOt65HLk
 7H+3q4QZ1MvXQTx/UzYQCdJhX78wMkwwj9e5vKH77G91y99zjEqkcaqip4uTsE+q7ujN2Qb4EcY
 OmeFz07mTUIQqWgv/3R7CpHNQBIDI8LCLY3rv5x6N+cfb6Cku/DduUPCO4wbkv8FqA2WDQg/Xs5
 wkgqPg/gV4mtwAcLmYOw8eCxfQ63RbORzRvocNYPtauqw+Jq255VKeU385yItjQ4Da35Q5tzAbq
 w/OolqH7DGs7qbpMwrg==
X-Proofpoint-GUID: uy18Fkm1IgZZDIYYelT6yqH_3NywPUJT
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb1749 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=_vtLzGX-cFUddgSYHekA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: uy18Fkm1IgZZDIYYelT6yqH_3NywPUJT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230032


On 21-10-2026 17:35, Krzysztof Kozlowski wrote:
> On 15/10/2026 09:38, Jayant Shekhar wrote:
>> The DCP firmware exposes display resources through capabilities rather than
>> through host-visible display registers. The MSM DRM backend therefore needs
>> to build its KMS objects from the firmware capabilities and device-tree
>> display graph.
>
> ...
>
>> +
>> +		remote_np = of_graph_get_remote_port_parent(ep_np);
>> +		of_node_put(ep_np);
>> +		if (!remote_np)
>> +			continue;
>> +
>> +		if (!of_device_is_available(remote_np)) {
>> +			of_node_put(remote_np);
>> +			continue;
>> +		}
>> +
>> +		if (of_node_name_prefix(remote_np, "dsi")) {
> Where did you document the ABI?
>

Will update in the bindings in v2.


Thanks

Jayant


>> +			if (dsi_idx >= ARRAY_SIZE(dpu_kms->dsi_bridge)) {
>> +				dev_err(dev->dev, "too many DSI outputs\n");
>> +				ret = -E2BIG;
>> +				goto out;
>> +			}
> Best regards,
> Krzysztof
