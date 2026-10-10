Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAB5384CF5
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 19:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791661978; cv=none; b=XEDvO9UE5jmiz/L9d975MO/w9jgMaxdOG6CXXeeAYiP+pgfJpTw2vguG6c7dq121NsonIbF1oA+GSrO6I9P0BimnZC+vMr6Y/uvr/Wz7OCCNCHXQy/0EvObMUg8DCuJs4L2YZOnWU3doum/4iTGFT1+FzfU35VBSWVCEsRdrnFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791661978; c=relaxed/simple;
	bh=l7Efzsnfv3qywaHkyur3AcvZcWrKIUflOPGO8lxviHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b08KdyAFQhNbxDxfAF5CIny//xEAlHJBJ5I8L/Lf3z5KCNlFAgKAKGXXbQZx+50NZBprsSfG3LwGiXzsiE9LbQ4YUXduQARuh8WB1frE/amVaXdDVi7qS6rs5Di2/ECb7YkHR93oz8nqAIQ/3aqauwMx+PrvNamdQ+W1CZkNZFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NTBF1d7t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HSj22z1Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NTBF1d7t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HSj22z1Z"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69AIfR8l4104533
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 19:52:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lwjqTvVgkBjNJF/ouDo5/S2ypeV7Y1OJppFgq5AUL+0=; b=NTBF1d7tsKuvErin
	2j1axxi0Ng5VZcUaaonMlLnsXgbJE6vUuzaEmQFHnrdUbvf26fPsjf5gp9t56eg/
	Cg9Cqde/4E//M1NbOHyUM67uXs9Zh7jpev9BYOMW66vormUsReVfxfsbuAbO0u9q
	HAFw6uv2CY85dGtHOTXAY5k+WfkMciPmfQMBpSPZu7nSBt/UTfsf56843AAMJeQE
	d3dMuWkCQr49rInIoA9bYjAF+mcOOzHvN4OTWnNiTBvuNa8LJl8mWLpFACFg8TVr
	1Eijba4WKtYTdXmIDXMG/Gsw7UZJY9cra3ysWngbNg0JemBJLeh6+yvi3Ir/MGsT
	zVEy1Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7ehjhjhd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 19:52:52 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-351788121cfso4252455eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 12:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791661972; x=1792266772; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lwjqTvVgkBjNJF/ouDo5/S2ypeV7Y1OJppFgq5AUL+0=;
        b=HSj22z1Zbu8v77NSpmp0pEvTONy7UnwMZ9+5mWmMXVHxTjNcPzxgjavXF8tw/Mes8E
         Ti4uDk7nFRxmcjsXA7vmD/CnOydTmCTCwBoZTupAKCWQsNNfPrq3SmzTiG10OYXEg0X5
         3JF4AjfmOYLY2KNaGHsiovUupM+UVakYFNDUAVNvtTRFvcYF9xNPCApgiEOhz83w0MZb
         89/6ISdNl8baXy38uT4madtaxdZh1zapz4SNs7JTdzArVteedPkSYyK5wqLotQrohT9S
         3y78C0VOl56zdFp2XXKvvBDGukpmJD/SPQErhpuv8zFiueNa76HTmk4fOycu0NU8Dc9e
         9VUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791661972; x=1792266772;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lwjqTvVgkBjNJF/ouDo5/S2ypeV7Y1OJppFgq5AUL+0=;
        b=oa8b6AtAtMDl8AU2vDWTK2kapINpHDaqaCUFoIDWZJB+yxwjhG8hIDp9wBvpOp1UvY
         cmeRPWn/HJtFRQPKbWJJpKjfFp9KdiSHSNII1h3gtGa2IGdaad8q9CiIXbjp+OXAKcPY
         uIN1eJMy2FYDyh2lw9j6XPzxHrqaDIgASckkpsJ7b/rLL108krCXz9+LMOq8NtvxRz1Z
         pLZpuW7pKmesAV1XQENBNrm94gRAiM/85OKtXN/zMDDD+52FZAPI7ZC/dtWRO6e3WkN4
         OJ/ePFdQanCDZp4eOK7gSE9AVpmIz4T2nn+6pmo5RGEysCLe/IUozTjSdgtknLO+TPiv
         WaKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhdEBX8Ww9JsR0BBCAMaxWfQQR6OAUBKx8j/Jt7vftVv5I3pIXVOFuCTeT6igLK8m8uwq0ZYD1RBNW/jA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJD/FIi0u1P/pkgrNmUP24jMowAJDKn2VUD9zjXEMNJoIXSdbt2
	ubn0T81GzmIxqN53SM4KRBRxPLPJir+RgtsMGU6y9fgO2Edz8woTHmOWcKjdwsqnKEs2eYwlax5
	GQ3SgetxQXu2tJ8dAIszrqMAiHvTOuIA0tZcNIgEXJlLJb9K/d9DBVRzY/sk5eeT5jt0=
X-Gm-Gg: AYBFou3VBWikhRegbeGHXpNChLW/r30TFHx9ilU4LrjuLuwqnFqwHrC+POixJPFZKAB
	AZ+Pv+MsczpR+uQBFQxwJoxoP+E2EydBZf0ROyQguxa0E1oSE/KYh5TJNWMbjASHaE2zAP+DQOe
	pRby+f0CReD+yxtF/rrdw68Gk+6lpJN8OyF6RCChQP7mrsJHfjn9/AJxTS3StNhKE589tncmbl8
	BM5c13/qUktFRv2qrQj4XdHiaUwtNveSoKDSwq3XSG9YTVdjydgtmZ1462D09MLNid8BzCg55NF
	dGRQpSeNOmPpodqb7ULH/gtApq3tXDmes9VUoqqn3q8wQaROA0uBRR2mmpVmgxhLj5R6+f40oOe
	OSJCH4wbIiK3TgtYuX85VPbzxSa2RIQ==
X-Received: by 2002:a05:7022:1702:b0:13f:b41f:bda with SMTP id a92af1059eb24-16a5c5f4414mr7341870c88.16.1791661971798;
        Sat, 10 Oct 2026 12:52:51 -0700 (PDT)
X-Received: by 2002:a05:7022:1702:b0:13f:b41f:bda with SMTP id a92af1059eb24-16a5c5f4414mr7341825c88.16.1791661970943;
        Sat, 10 Oct 2026 12:52:50 -0700 (PDT)
Received: from [192.168.29.225] ([49.37.144.177])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a42407e7sm16545214c88.15.2026.10.10.12.52.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2026 12:52:50 -0700 (PDT)
Message-ID: <396781e8-8115-4524-87a8-ec989330ce4f@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 01:22:44 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] drm/msm/dpu: rework layer mixer allocation and
 mode limits
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Xilin Wu <sophon@radxa.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
Content-Language: en-US
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
In-Reply-To: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA3OSBTYWx0ZWRfX+xhbavWM/ZC4
 HN1xeDT5GL6WFLR1Yzyo3Whcy3FW8bZxK6k3NbJr7sBKqrLobtyv9RK30ryNi+nxRPX+V7psOpn
 V6mdB8qj/vx2Yu2bVqlQ+zTT6hq3u0+bP4cSUrzCru3aaNcKx1k2J4oikO47JSkpE7h6mU1R7nm
 L2jGa0SACQoDT7GXATJgLbRqCcsnGIrDc0uK3+IOm26Ed54/VxS8ARaABQKlSXKizM7BqNnfMFY
 teKkwFwBMNefwFVDNgB7RkWLuFAz+4ZG7fbCNk/0SeJWf0GTQepazbuVB/fGkxrclkv2/LYJhXt
 a0u88vdvp3ZaE0lYdFyzjz9Yj8nYdWXJyx/Gpw4gQJiuQyfkT+Y2CqcibAnvePNJ3IvK1BCFYh0
 43xmDXpULDb+ZLZhvP2kFO6TFPbjM++3BcbdthTC8OKgHV5aOmBnB5TicD4zCXadks9CiREuLed
 3No33ldzAcC9ubkwvhg==
X-Proofpoint-ORIG-GUID: hOyDTV9wNClIouWlJKRZJUt49A8P7AFy
X-Authority-Analysis: v=2.4 cv=MpTHeGae c=1 sm=1 tr=0 ts=6aca9794 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=20alU+YIu2uqf8Hyrg49Cw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=L3DgtkeIYyT9a_Y7rtsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: hOyDTV9wNClIouWlJKRZJUt49A8P7AFy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA3OSBTYWx0ZWRfX7dibCg912JX2
 77E4S9g63ADlnOhiXrMEeT7qfS4xAMIAHBo8/vmGTN+yjWZsGVRTbtcaHwUSJ/3Tewp+xylRfPG
 81g8BYM2hXfdeuCox0p/6qsmPoAYevc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610100079

On 10/8/2026 10:53 PM, Mahadevan P wrote:

> Currently, the DPU driver bases LM reservation off of the maximum
> supported width for the layer mixer and an arbitrary MAX_HDISPLAY_SPLIT.
> However, these limits are not hardware limits meaning that a single LM
> can support higher resolutions.
>
> Switch to basing LM reservation off of PINGPONG and DSC encoder hardware
> limits.
>
> This revision also adds clock-based mixer selection and a source-pipe
> width guard for mixers without source split.
Hi Dmitry,

I missed the ongoing quad-pipe changes 
(https://lore.kernel.org/all/20261003-dpu-quad-pipe-fixed-v1-0-6a6a00917b71@oss.qualcomm.com/#t) 
when preparing this v4.
I’ll rework my changes on top of your series, check the topology 
interactions, and resend an updated version.

Thanks, Mahadevan
>
> Assisted-by: LLM
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
> Changes in v4:
> - Rebased on msm-next, resolving conflicts.
> - Added clock-based mixer selection and reused the helper in mode
>    validation.
> - Added a source-pipe width guard for mixers without source split.
> - Extended the catalog cleanup to newer platforms.
> - Link to v3: https://lore.kernel.org/r/20260112-max-mixer-width-v3-0-f98063ea21f5@oss.qualcomm.com
>
> Changes in v3:
> - Rebased on msm-next, fixing conflicts
> - Updated commit messages to describe the actual issue.
> - Link to v2: https://lore.kernel.org/r/20260103-max-mixer-width-v2-0-ef5d3d246709@oss.qualcomm.com
>
> Changes in v2:
> - Dropped PP and DSC encoder width drop the catalog, they are now
>    determined in the code by using the DPU programming
> - Corrected DSC encoder width for DPUs < 8.x (2048 vs 2560)
> - Link to v1: https://lore.kernel.org/r/20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com
>
> ---
> Jessica Zhang (3):
>        drm/msm/dpu: check mode against PINGPONG or DSC max width
>        drm/msm/dpu: filter writeback modes using writeback maxlinewidth
>        drm/msm/dpu: remove max_mixer_width from catalog
>
> Mahadevan P (3):
>        drm/msm/dpu: split modes a single layer mixer cannot clock
>        drm/msm/dpu: do not assume a merged datapath when validating mode clock
>        drm/msm/dpu: limit the mode width to a pipe if the LM has no source split
>
>   .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  1 -
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_10_2_milos.h |  1 -
>   .../drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    |  1 -
>   .../drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h    |  1 -
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h |  1 -
>   .../drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h |  1 -
>   .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |  1 -
>   .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |  1 -
>   .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |  1 -
>   .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |  1 -
>   .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  1 -
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |  1 -
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |  1 -
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  1 -
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  1 -
>   .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  1 -
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |  1 -
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |  1 -
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  1 -
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  1 -
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  1 -
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  1 -
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |  1 -
>   .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  1 -
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |  1 -
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  1 -
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  1 -
>   .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  1 -
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  1 -
>   .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |  1 -
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  1 -
>   .../drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   |  1 -
>   .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 82 +++++++++++++++++++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  9 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |  9 +--
>   36 files changed, 79 insertions(+), 54 deletions(-)
> ---
> base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
> change-id: 20261008-lm_fixes_final-9b9a8d0d9835
>
> Best regards,
