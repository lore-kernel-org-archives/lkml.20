Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720565;
	b=pseETM+dlG4B6sc5BVoTwq1ZLR8so4974Ld5xErSpKZuoMP037gcC5zAA5ey9cft0an+
	 ugVcOZ7kQMxFM/Atv9j/WctAOu0Ssx5kVqlYv5bgxTAw6t+VimZ/4rACPi5ytFV4gIAsx
	 +dhBAyPwr1mECMC0gKpw8n08al1HsjmDSxV0OX9/iclVlcTYOWYvn5od5W3ECU+ctTPWy
	 1PMSbT0mM6mV9GOjPZ6bTzNAtXkNysstgl3AwdPgawt8EN1x7ET7vkWszu6I3QCd/T9vw
	 mUHicVTHHFjOg/EFrdw6RkTvdRiZ2C2RZp04VCig6IWv3R8FQ3/xHNymlGU61qfuwVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720565;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Qg5aVy+S20ZvI0/BdN6+9Xr4hUEBJxVpKOMywluWEWc=;
	b=pp53P3+NplW+XeSRluKHm8oK9HRNufr0eVEh51GmjFw8b+RWsdF35w/Zl59141AYtiV1
	 Nnfhl8kbFNSTqonyrLskuNzu35AN8Gq64N6Xy5CErLupyo0xsuwakguVy17vscEHL31ma
	 ha2Ivj5+b1wxBt1427favdGU9OnZ0nuj/K+MaFPNf28QSWNsApFV/FHXjSoNmT5C5MBs2
	 3ucG9wghlvToi5E6k0EMXAnSnx6wzjwYXzNDCXkF+rWhAlN7UtnWiQSFPM4/8IJYMIFyR
	 4U6TcJqZBx/GtRTElIBJQRj7pzYF5A2KETfAois6rCmlbnC9V6X/nqvS3eHnfNRLQ+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eSFzNgd8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aYo67Wvw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FB8606D822
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80FB8606D822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eSFzNgd8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aYo67Wvw
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9xR22001388
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 15:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qg5aVy+S20ZvI0/BdN6+9Xr4hUEBJxVpKOMywluWEWc=; b=eSFzNgd8x3l1FanO
	GtqqbgWVVKkmVE01+RwG2kPpF5vEe1oOaxs8rw5fnzj1+WqU2s281JyMim73XwAh
	nn8KUV8hlyxdyyHAkbmThuamyDcBAnDbTkxn0THh3vajtZRasghaVFSKhNgvUJeq
	4zXcM8/IwwwfGh6+OMzDDed5QxIeSc6cK5scq6pF+h7LpefGYnJKvl4bnsDCDjKg
	mv1BxE7wnmoZsqB6Wpi3l4gh2CwA/kV99+spaayhSQu/F8RFtFxFlIfBmr3iAu3o
	yJIcbF6hHeXl7/mlsO4HFUipExI68GlG60qDJ219Rcfqfn+tx/hxVMIl4tktT6Yi
	1L9W8Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5jhmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:42:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac76132001so2922338a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793720562; x=1794325362; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qg5aVy+S20ZvI0/BdN6+9Xr4hUEBJxVpKOMywluWEWc=;
        b=aYo67WvwnuWUkkcMgoKDBQ4fDgeUFEEgqdzpxixVizQBif0EXIROhVGzYjwFeJR55u
         eoT7FUUrj7P5dyYpVzdw39VWs1OcPY7qEEdtNe6JOvcxSM+P9VFZw3Z387tQZP5kpJn8
         YYe7KqeIYqb1d2qcYkZffTr2+DoZbRBFAdP0OMYuh+lYMjHiLQQC169yG+hNCJy2Noln
         fTHfcNjL4lzhFXvQR4NNZsj1N0stIDHma5dVn9dNsYHU8mCpZZNDUsxbfGJSHiOLoVgI
         yPyGLe3IqcPE5MA6GbqpVXrRWtfTL7w2qjHRNkKwJ7pywI1OWOTkxvr/hGPT4N5dmFO2
         eA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720562; x=1794325362;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qg5aVy+S20ZvI0/BdN6+9Xr4hUEBJxVpKOMywluWEWc=;
        b=WsfZQCwRVoWgfh5pBNbmE8+WhHfjMnY93qjXDtpdv5ihuxkbORkRlTCDC28VRcgwIe
         j2yO4BJRWcjG11IpvwWi7vSmxDF607buMypnFagxotdGbQFgnB964dbe6wgYXaJt19+E
         XYI3USPEvVsPFdEIpp8O5h8ucmNNejRLJFkZLzVnNO8gS+oLq1+tJoggKGrtECfGOQ54
         ssKnyBtbUnZhBcr7I5n2UMxM78RYopTYMR9Ghw2yFpwgNvTqXgCntcsMCHn75kPzxehZ
         565lqM2VHB2WAEkaI5sdnNJaOjVQTl4uWw4+igtGmDIPHaMtu/i0kt4b0i5pLTPkG7U4
         WCAg==
X-Forwarded-Encrypted: i=1; AKwUvBxdMh90DQiBHRRHvFCkboQuiKv6z73TvB9k5Ax68/R7w94bbaYPZymtTJZ6LAQiKHQsJfNnPREydFuYTTA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iKLEiklMA3o2JIUbsxRDYw6sC3+4WphIjNnY1H9G+rhHpMSTv
	85+WohvC9ehhAH5fiwX8zrzZR8yN/OU3K8J5JTd0h/CCk2cD0tDOo1Dl55OVR933QGfhLS3Ve3i
	zA45zhYsF6ifSO+36CM2gVro1uIujbd8CvYhCBfs0X0tfCxFUaMEZVXQljdgL3zPuFTkplF5cSj
	s=
X-Gm-Gg: AYBFou3Mwsf/ezgoUzlrY714HX2+ThC1baWWx9gzbYJzQhcX9RJHSc1hp4QXDuTYTns
	aHDUHAUPbDCCteWYEZ5xSJzybE+Eg3CfJOiOHThM8jUVJiX+RIZSRwgfeLH8YmK4qDDKe0Md8Pl
	HObU93LrzXBVj4A7YiA9wIwatz0aOa0fAcxzhAw5/1AwOnT76jIq1g5ZXzI784E474bwVCtOlxG
	OxUIRdjnx90JXTPfAeGi1uulqNydpRhCdgOOteZRYb0ChYYFM/YRBWWbtZt6cq2bsLLIg1t6WrB
	+Eefu3OjGy3SmdNNBo50MYVVd/G2cltziohCelI+pDczot9bMnsXtyBRVnskUQaxsEoX8XUcFBl
	x/xfJesrcR3UIDkw6whJcVuBdlTjHmfmQQDotbEk+ZZv+QaqNgNH/6LRryDAIZ2coZA6DugaapL
	o=
X-Received: by 2002:a17:90b:5807:b0:3ab:be66:ddbf with SMTP id 98e67ed59e1d1-3ae8981dd4dmr10490386a91.54.1793720562128;
        Tue, 03 Nov 2026 07:42:42 -0800 (PST)
X-Received: by 2002:a17:90b:5807:b0:3ab:be66:ddbf with SMTP id 98e67ed59e1d1-3ae8981dd4dmr10490349a91.54.1793720561587;
        Tue, 03 Nov 2026 07:42:41 -0800 (PST)
Received: from [10.206.96.127] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c7dea24sm4786035a91.5.2026.11.03.07.42.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 07:42:40 -0800 (PST)
Message-ID: <719999ca-28b7-4c71-8d85-87c3faaa121c@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 21:12:34 +0530
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
Subject: Re: [PATCH] drm/msm: restore GEM-related IOCTLs for KMS devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260304-msm-restore-ioctls-v1-1-b28f9231fcd2@oss.qualcomm.com>
 <CACSVV00Z0gDW8aGOvO_YaB6AZ7cOR01mTsCHZvxp0qeO85Mqdg@mail.gmail.com>
 <puvl5tg6ovr45oncwcvx5phrkdp6uv6mrtqss2i6x6wsmeixaq@me3hztknlscc>
Content-Language: en-US
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
In-Reply-To: <puvl5tg6ovr45oncwcvx5phrkdp6uv6mrtqss2i6x6wsmeixaq@me3hztknlscc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sqIA3o400bAJc_xmbFiKZuND3_Eb6TQN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfXy2PwMmqUPJXW
 2eTH4pA7Ruf09fgFPfcGU0s1BcfysdmstawKvWj+xqKrOcvsAyaLdejoIiPfB2DHViM4e1BRg96
 HafiX82VyP4FpPBVY4eQT45KlMZpdZw=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6aea00f3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=G6p25mnS-FJF_-mfOFUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: sqIA3o400bAJc_xmbFiKZuND3_Eb6TQN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX9e4BTDMWbLKl
 6obzeqlGhVsfeVZWXBpx73njUqZVRBnHv8Gd+K6hW25cTTVy1H8eFstdB9OXXFGHG/fAwRrp40Y
 q/EwvEzgvvrT8ajU0x4w9lPIH8Rytx4pAQ+FGOFtBwjgtNsoDGyhhGY4P+/PVol5YpVVqYuaE+A
 zmpKr9+xToN4/bYERozC5RCBtNaFKjg4tnLsvR/p2/ih3EElhMVIOvz5hdPbJxjlAYB96GTn4Tk
 ou7d+jODEVinAm753N/Xt365kbTm+7M7qxPvZHMytwg2Iohfyv2xVM7oBH1j7MhHccKAinoQmiG
 /MU6OhKDFQK82J6ca4mXjdYE56Njauu1wZ8/0bUFocAYcY62Q8CxLpg+yYDLiGolVtdJOSFMCWz
 Z7751wBB8A4N/3GgkMMvy/8UV9jmiw7AOcSAIuAklRLRwnx10E/aGdyG16u5A7Awml8CWEBUWKd
 Z+VdcPHzYNFKI1Ndv9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030062


On 3/5/2026 6:14 AM, Dmitry Baryshkov wrote:
> On Wed, Mar 04, 2026 at 07:57:34AM -0800, Rob Clark wrote:
>> On Wed, Mar 4, 2026 at 5:34 AM Dmitry Baryshkov
>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>> The MSM GBM backend uses MSM_GEM_NEW to allocate GEM buffers from the
>>> KMS driver, imports them into the GPU driver (msm or kgsl) and then
>>> uses them for rendering / blending. Commit 98f11fd1cf92 ("drm/msm: Take
>>> the ioctls away from the KMS-only driver") dropped all IOCTLs from the
>>> MSM KMS devices, pointing out the need to use dumb buffers, however dumb
>>> buffers should not be used by the GPU for rendering. Restore GEM-related
>>> IOCTLs for the KMS devices.
>> We shouldn't be exposing DRIVER_RENDER on KMS-only nodes.  If msm gbm
>> is allocating from a primary node, that is problematic, since there is
>> no guarantee that anything but the compositor has access to the
>> primary node.
> We are not exposing DRIVER_RENDER for KMS-only nodes. I'll check with
> the correponding colleagues, what exactly is their use case, if the
> allocation is happening in the compositor or in the app. In the latter
> case, I agree, the buffers should be allocated from the GPU.


Hi Rob,

In combination of msm-kms with kgsl, wayland clients allocate their own 
dma-bufs (typically through EGL/GLES on KGSL) and pass the fd to Weston, 
which imports them. Weston is therefore not allocating client buffers. 
GBM is mainly used for Weston-owned allocations such as render targets, 
composition buffers, and scanout/framebuffers. It can also be used by 
applications that allocate through  EGL (GBM-based path).

One additional consideration is that KGSL is not a DRM driver and does 
not expose a DRM render node. Since |gbm_create_device()| operates on 
DRM devices and relies on DRM interfaces such as |drmGetVersion()|, a 
KGSL device cannot be used as a GBM device. As a result, the MSM DRM/KMS 
node remains the natural GBM allocation point in this configuration. 
Thus we need to add render support in msm-kms driver.

Thanks,
Mahadevan


>> BR,
>> -R
>>
>>> Fixes: 98f11fd1cf92 ("drm/msm: Take the ioctls away from the KMS-only driver")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>> Note, here I assume that dumb buffers generally should not be used for
>>> rendering. That doesn't seem to be complete truth as Mesa kmsro on MSM
>>> devices uses DRM_IOCTL_MODE_CREATE_DUMB to create buffers for resources.
>>> ---
>>>   drivers/gpu/drm/msm/msm_drv.c | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
>>> index ed2a61c66ac9..f82c9a36a166 100644
>>> --- a/drivers/gpu/drm/msm/msm_drv.c
>>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>>> @@ -799,6 +799,14 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
>>>          DRM_IOCTL_DEF_DRV(MSM_VM_BIND,      msm_ioctl_vm_bind,      DRM_RENDER_ALLOW),
>>>   };
>>>
>>> +static const struct drm_ioctl_desc msm_kms_ioctls[] = {
>>> +       DRM_IOCTL_DEF_DRV(MSM_GEM_NEW,      msm_ioctl_gem_new,      DRM_RENDER_ALLOW),
>>> +       DRM_IOCTL_DEF_DRV(MSM_GEM_INFO,     msm_ioctl_gem_info,     DRM_RENDER_ALLOW),
>>> +       DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_PREP, msm_ioctl_gem_cpu_prep, DRM_RENDER_ALLOW),
>>> +       DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_FINI, msm_ioctl_gem_cpu_fini, DRM_RENDER_ALLOW),
>>> +       DRM_IOCTL_DEF_DRV(MSM_GEM_MADVISE,  msm_ioctl_gem_madvise,  DRM_RENDER_ALLOW),
>>> +};
>>> +
>>>   static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>>>   {
>>>          struct drm_device *dev = file->minor->dev;
>>> @@ -868,6 +876,8 @@ static const struct drm_driver msm_kms_driver = {
>>>   #endif
>>>          MSM_FBDEV_DRIVER_OPS,
>>>          .show_fdinfo        = msm_show_fdinfo,
>>> +       .ioctls             = msm_kms_ioctls,
>>> +       .num_ioctls         = ARRAY_SIZE(msm_kms_ioctls),
>>>          .fops               = &fops,
>>>          .name               = "msm-kms",
>>>          .desc               = "MSM Snapdragon DRM",
>>>
>>> ---
>>> base-commit: ac47870fd795549f03d57e0879fc730c79119f4b
>>> change-id: 20260304-msm-restore-ioctls-2a1792311a09
>>>
>>> Best regards,
>>> --
>>> With best wishes
>>> Dmitry
>>>
