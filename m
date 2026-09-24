Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA7348F832
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257303; cv=none; b=Im2COsPf6wMP+viooWmuG+FraM0hdpb9ekm76bcHcbV/ZdfmlYHX6DiDbCQfz9NCuyd7E0J7U8U4oWGBLXJyl+xyw7EXLiu180SbFqYInjiR++VLmVRx1z/MBb3A6b1CBENxXLI7EIPcFlCPfrG3SqsoOBBwfGk6jmv6VcHtVqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257303; c=relaxed/simple;
	bh=aWAGrhyCX9motQNWAluLG+QkdSPnPvrsexRft0qrURk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pn8J+04k9ctkHNzsonnLTu/+WlM0D+J5T57SdUf7WWJQ7zpDyADRYxGweo/Xs5XP/qYBl16Ugv+CHv89xjfWvebRCcQK+a85oaI5H5SAw0pBjf1l9dkicEV9xhqA065uh5+vzmJjU5Z/lu/CxlilM4DE6N3/eYNRZ16vyqoPrlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ne/GjaE9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BzDJGnyU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ne/GjaE9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BzDJGnyU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC53B42002556
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QEYYv0cWpRHAP3FDxsLq4vXa1ZOHiCaWsZmD4zy72Q4=; b=Ne/GjaE9uyckCFt/
	p0/89XjL/xwCoQ9isszFuJo3idOD9dW3SJL106ZqA7rlEJN8mQBzfqf5g3YnxK+f
	3LdSU5UUqA6A18+p0+di+kxKzsyLSEpKB8aSC+f6Ow8hu11cF+CClfrRzdTqrlCs
	bZRzOqKHMcz7MYiT8WcbPbxjbmJz1oIppdMAc+phXvStU57lR5qunx2oN4aNEN2P
	3ltuD+j35Yh4UkEhlrB0c5srLVuXhox71gI/ID8m3HOx+lE+8g3xc2RubfiRay3b
	aAPLXWRFmSK/zu832WvyafWqr5f7+LyvVhoJNF3vjqiJYyTPI+lBU/lyBw8icUP+
	+crHUw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvmrrbt5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:41:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db3b126c9fso21505365ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790257294; x=1790862094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QEYYv0cWpRHAP3FDxsLq4vXa1ZOHiCaWsZmD4zy72Q4=;
        b=BzDJGnyUjpOGFvIaMoE2VZB7gae+LDW0fVBJyxrXFvmu9STOxRr5Ozl/VRl4wr0JHD
         6QoykgN//hnLKiYAz0BvMqFBDzSqwfrIU2sxf7DVU9u6C8q5s2Lys2lUcLOSanzceY/L
         ZCQ/AMKLkCmXKJyoIBQI71ORpxHeCs8/UAq6yyrwguq3G2EhfVKdYrkKMiA7LgLDIyPD
         l5WsvRkz5gtpWqb4eIzVxWYWVpuCgK6OOvUWqT2cROC0dns8A2kdl3DPklIr6ZijUO+2
         Qs7l0jtqEWScRoriPwGwM/fVyDDB/uLo/hFnHNARihIteGc4NFhsCPbLA3XBv6Di4fep
         9RWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790257294; x=1790862094;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QEYYv0cWpRHAP3FDxsLq4vXa1ZOHiCaWsZmD4zy72Q4=;
        b=jqScv4xk/Deu7vVT6zI/8jBNx9Q4xbixUQv/ouGa1BMIYHRJE6Kv8N/RfMnkf9euTn
         Z8oqUTmsq0tn0lkAZvqJNj38F89WmxGpoG6EUZYfzxqcBlBW/+kGT7b8pH+UH4yENakf
         EOyuac10E7sVjmbi4jHOvllQKO8RWC+YSFAX3INhngJtCeW/b7xP3/tvfX3i6ezhAPPY
         AN1qRlyS279zkgGeg5C3lJum/QU6jw04DOObtvtAcZnDk+mwL1BtTCLuuHIBOqk2DwQa
         eOVaSQyqmn5Y6JqMYS+KvJFrLIxpkvR7JWZYXLrRKrfGl6tzNjJm+kk/kH3Eu0i4OUxb
         O3mw==
X-Forwarded-Encrypted: i=1; AKwUvBxX1pWgYNQSYRGbcrZkGdDXaUkM6oX/N5x/mTJnwXImd85QUWGX9fImoy/g6OnK25Oo79Xv76SBRg1TO+U=@vger.kernel.org
X-Gm-Message-State: AFuF++k6+K1R5BFr/conGRS5WjLLXNU+DeQkCV/XfhPE37JDVo5sbS8L
	nPNcNeKAmXBu64c7B9Lvn+kbKN2NXXOy+Lw3pmHsuc7tHtIs7ukS2o+nqfWcryw1HeGLWQM/WCe
	0Gjn3VpW5XVfjQ0b/cXSx7BB3NIBVd2EoWUQMBOgtZJoN1QRc/n5uf7u8GkJXxQiHCCM=
X-Gm-Gg: AYBFou0t4tOhvuTlUdCengoXgbOn4sU280yk9VWG90lh3zIOHovQzQ4phevT4NqmMQf
	jw3R26T7KbPGg2May4i/mDu/BYnPOPyV9IQgz2qLDqU60Yu74U+VKv0YSWtPwEkQxZ4339/2e61
	q+g9cAeFFgrsGZxf6ezxAZX8SJ0eFF4V0EeCBSHGCVV2iXW5PG8R0Qd8/+FE9dDj3xro4FRtp4A
	R9ululHnmb0lBO81TfOCOfFbnPBUrKMWEiuuRyKyPKcU56Y19zDPJaYiIQbkKbN2sH8KfLuHzdW
	VdUDXVYnHx3seFsq5wCY2kESMF0oQZDzZ/6JbpRWVu+i/OUuBZruVLlWKdZgnd1fZDvjGN7AQD+
	xUG+7kdtdcl9g6Cx6Hcd4wQ==
X-Received: by 2002:a17:902:e54a:b0:2dd:c100:424d with SMTP id d9443c01a7336-2df7e246248mr24330595ad.49.1790257293605;
        Thu, 24 Sep 2026 06:41:33 -0700 (PDT)
X-Received: by 2002:a17:902:e54a:b0:2dd:c100:424d with SMTP id d9443c01a7336-2df7e246248mr24330195ad.49.1790257293024;
        Thu, 24 Sep 2026 06:41:33 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.235.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5f52dcsm27897905ad.69.2026.09.24.06.41.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 06:41:32 -0700 (PDT)
Message-ID: <692ff69a-330e-40db-bffc-a53987fa4bce@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 19:11:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] drm/msm: Support for Hawi & Maili GPU
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
 <CACu1E7GndBnSj75ZVqic9NxdSakZJL3ZJOuz7D+RbVWA4DUqTQ@mail.gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <CACu1E7GndBnSj75ZVqic9NxdSakZJL3ZJOuz7D+RbVWA4DUqTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1NiBTYWx0ZWRfX4NH4HHEpf4Rf
 RuWqIsYW80BprjulljCfvO5wXOTXJ7NuBaId8e0eKqYp0i0ySI7vEe2jf2kksSUcngHpZlkSoQm
 p9rcNLyDU3gMQHySeLYzgZETypb8VGoml0UJBQfJzFCLwOg0yEABwXJVAmZtrJ8RdZ6V3V7t9OT
 Givf7X6i8kTImfyCOet5iqtvcUbMmx/PyMGVPrreoeidIZ1hiDGdm5dKrmZcEUo0/vYfKxHduQu
 2afyQtCm/f5DpDNxwreidsdeohfF9ZnQkfrK2E32yBFqd2bxBuJSAcX2QlFbUYkV5UlYlMRWibb
 rsp/Foy1b3hUZXEmw47uYdUoUWGiezZCmACHuJ/D5p+UxpmjXzoh3L4GdvFiNtUKia03AAdwZdH
 za2kpOOdfnEANM+fH39VkTKfNEcRWjZTvBOpLCUeODUkJvZYMBgvz041i9kWc/ScIZb0miOAPxB
 nlV8Awk1v/ECfswdjEg==
X-Authority-Analysis: v=2.4 cv=TYwDJhQh c=1 sm=1 tr=0 ts=6ab5288e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=36LQ094ZKnh52kRnC0Brrg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=tVI0ZWmoAAAA:8
 a=MmXTpdYTAAAA:8 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8 a=Kr7SBsR4NPCIxS1kjiwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=7hoCnnChfAR1N-e-f1W3:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1NiBTYWx0ZWRfX1zvjJMsLoXKg
 cOFJeKwI2RL2b/xMFfvitj37jWAEsr3QKlPIto0j/fene1+4j0iEgazDFyKUxfHKP49lvo+2zpW
 phrSTnPakAQzO6YNjuLrGkIX+KPg1QI=
X-Proofpoint-GUID: j_HR2WV962q4IWi95hNHFr0Wt_U1F6qR
X-Proofpoint-ORIG-GUID: j_HR2WV962q4IWi95hNHFr0Wt_U1F6qR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240056



On 9/24/2026 12:54 AM, Connor Abbott wrote:
> On Wed, Sep 23, 2026 at 6:26 AM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>> Adreno 850 is the next generation of A8x GPU present in Hawi SoC. It shares
>> the ADRENO_8XX_GEN2 family and slice architecture with A840, but has many
>> architectural improvements. There is a new block Matrix core (MALU) which
>> helps to accelerate certain compute workloads. Also, there is a new Bx rail
>> that powes a part of the GPU IP. GMU is now powered by a dedicated GDSC
>> powered by MxG rail.
> 
> If there is a dedicated rail for GMU, then
> VK_KHR_calibrated_timestamps is likely broken, assuming that the GMU
> AO counter is on this rail. The AO offset logic in kgsl probably needs
> to be ported here. Has this been tested?

Not sure how GMU core's power domain affect the AO timer. Could you please point
me to the AO offset related change in KGSL? I will check.

-Akhil.
> 
> Connor
> 
>>
>> Maili GPU (Adreno 845) is very similar to A850, except that it doesn't
>> have the MALU block.
>>
>> We will post the Mesa support and linux-firmware support soon. MALU support
>> will be brought in separately along with its support in Mesa.
>>
>> As there is no display support available for Hawi/Maili, validated offscreen
>> testcases that render basic triangles, glmark2-offscreen etc.
>>
>> The driver/dt-binding patches are for Rob to pickup and the DT patches
>> are for Bjorn.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>> To: Rob Clark <robin.clark@oss.qualcomm.com>
>> To: Sean Paul <sean@poorly.run>
>> To: Konrad Dybcio <konradybcio@kernel.org>
>> To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> To: Dmitry Baryshkov <lumag@kernel.org>
>> To: Abhinav Kumar <abhinav.kumar@linux.dev>
>> To: Jessica Zhang <jesszhan0024@gmail.com>
>> To: Marijn Suijten <marijn.suijten@somainline.org>
>> To: David Airlie <airlied@gmail.com>
>> To: Simona Vetter <simona@ffwll.ch>
>> To: Jordan Crouse <jordan@cosmicpenguin.net>
>> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> To: Maxime Ripard <mripard@kernel.org>
>> To: Thomas Zimmermann <tzimmermann@suse.de>
>> To: Rob Herring <robh@kernel.org>
>> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> To: Conor Dooley <conor+dt@kernel.org>
>> To: Bjorn Andersson <andersson@kernel.org>
>> Cc: linux-arm-msm@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: freedreno@lists.freedesktop.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: devicetree@vger.kernel.org
>>
>> ---
>> Akhil P Oommen (11):
>>       drm/msm/a6xx: Honor perfmode_bw threshold on A8x
>>       drm/msm/a6xx: Fix secondary rail vote in ARC votes
>>       drm/msm/a6xx: Fix RPMH dependency votes
>>       drm/msm/a6xx: Factor out RPMh arc-vote helpers
>>       drm/msm/a6xx: Add BX rail support to GMU dependency votes
>>       drm/msm/a6xx: Clamp MX dependency vote
>>       drm/msm/a8xx: Add Adreno 850 support
>>       drm/msm/a6xx: Send THINMEM config to GMU for A850
>>       dt-bindings: display/msm: Document A850 GPU and GMU
>>       arm64: dts: qcom: hawi: Add GPU support
>>       arm64: dts: qcom: hawi-mtp: Enable GPU
>>
>> Bhaskar Reddy Valluru (4):
>>       drm/msm/a8xx: Add Adreno 845 support
>>       dt-bindings: display/msm: Document A845 GPU and GMU
>>       arm64: dts: qcom: maili: Add GPU support
>>       arm64: dts: qcom: maili-mtp: Enable GPU
>>
>>  .../devicetree/bindings/display/msm/gmu.yaml       |  90 ++++-
>>  .../devicetree/bindings/display/msm/gpu.yaml       |   4 +
>>  arch/arm64/boot/dts/qcom/hawi-mtp.dts              |   8 +
>>  arch/arm64/boot/dts/qcom/hawi.dtsi                 | 336 ++++++++++++++++
>>  arch/arm64/boot/dts/qcom/maili-mtp.dts             |   8 +
>>  arch/arm64/boot/dts/qcom/maili.dtsi                | 309 ++++++++++++++
>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 446 +++++++++++++++++++++
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 231 +++++++----
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   1 +
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   2 +
>>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |  25 ++
>>  drivers/gpu/drm/msm/adreno/a6xx_hfi.h              |   1 +
>>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |  16 +-
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  21 +
>>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   8 +
>>  15 files changed, 1407 insertions(+), 99 deletions(-)
>> ---
>> base-commit: 1e9b8055458b92f9ebab6f39d97ade5265a0b012
>> change-id: 20260811-hawi-gpu-05b4ecfc3c4c
>> prerequisite-message-id: 20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com
>> prerequisite-patch-id: 239c169e15da44519b2dad09ecd92f0052757929
>> prerequisite-patch-id: 6c586be864944bb1eed773e8c211b898bb1289fe
>> prerequisite-patch-id: f3d8748ccdb6760563f3e07f701a18388a9408ed
>> prerequisite-patch-id: b1639353868bed10fd3cbfcd01cfb88b7e737ead
>> prerequisite-message-id: 20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com
>> prerequisite-patch-id: 36f12c16bf9cb0411d8be2f396407c724162189d
>> prerequisite-patch-id: 28ede1ab83d4b5b56423ebb09bae74b6599b3bac
>> prerequisite-patch-id: 6b3e28c55c07bfcdca8bfa9219fa0c6c763c6f6e
>> prerequisite-patch-id: a2007fdaaeaf2981860c54ae5514f5a6f06c6bb3
>> prerequisite-patch-id: af8aa3c630647336bdaeffa9c88de3650f1e49e4
>>
>> Best regards,
>> --
>> Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>

