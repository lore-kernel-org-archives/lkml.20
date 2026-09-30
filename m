Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F0E51476F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790791526; cv=none; b=rHXxTYO7djx9IIr/zc8TJoeLm6zx+DKm5j8GUg5Dth6SOOVt06EiUCXnK56TbZ0hHFe3ICpwzfWouBcoq3UbP1iHQOJPGXu+AZNBREqqUXXT+aO5QhK9uy3M31gmKZcInxe9OrsR8GBEeKLTQAgWOpgUqnrZlISwLGq0f28hJ/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790791526; c=relaxed/simple;
	bh=sxH4dofpoZUjjjRkfjU4M97ZTTGbZFjgCSjjQ6AM+Lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rUgs7Mm5whLsuZe4mlpkY0948oxfu1wP/kndYd4LpMXW/0Cs6pijyy4KRedHEcWT+AQPLzon11A5pLpfxz5IYY0np3qHTW9YgCo4cHW2gik4TfVN2BctEPzSbla2bWZ2UhbJANYHMI5N3eXQbaQUclyZR1l3JDaDURd1H7qQEys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B7bPf8VI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yie/TGEe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B7bPf8VI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yie/TGEe"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UHfJE52903003
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=H/daFQ4eGR9SxKZQYumOcM+1
	gprzJRcbFZIEUlbLCvc=; b=B7bPf8VIh6J9xRP5uLUOI75qqF2EOAv4pW9rfGx9
	8tCB1+HRZ63xQibjgL5DFNnwzQZVcS9gzIPbVKuLzU/d6WZsse2PILQnKLncI4Y8
	st8SbJBSIzUq0018f6ZaihIl5k0zH0xHdZI9Rbx4OoZh0dNo0ZKMgpab8OoQnJT/
	Abdh9MEd1gFcZL39cU+EGutWi1AYZ9qRSjD4n4Djd9j0jvZds7FzHXiud0enqfA+
	gqMnROPHsfE3HJPng7RDkMUbNMfpJ86GtlTJjprFRFoB4HoQ7x7fo6Z0H1pm6AWC
	rdfL/WEn5Sdbm3NEfOrehFAEnpeb2vfqr0ITL5J/1zfJIw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c2ufx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:05:24 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98909a978b9so88677241.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790791523; x=1791396323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H/daFQ4eGR9SxKZQYumOcM+1gprzJRcbFZIEUlbLCvc=;
        b=Yie/TGEe23jPghY8LdzHTZgwxxqaR+BwszIY3duBVQU++rZjcUaIILqrwj2ct1qo8J
         jlIXsjkhU98i5bJ1eUziwXOHKgXN5vSMkulbEouTl9k977O4e9W6xSOkgquIL8EkVT5x
         gFupuR2QrxKb7R4P2bk1W1ePCwS8+MjIth4N8Urpj8XkgBgb+7RuP0Xxx5AEXm0KUo/s
         9C/KyYiMsm0pxZseQAM9uIq/yg+h6xe6KXq5XMS9lQRRK8hUfTGsiSbyzVYVZESHCc9+
         YGnQHS6gKnwFil3aNqf+/CKzZzvPBGZBD84h/XQF+75OvVF2g5NjlPye49NfG3DLWjz7
         eB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790791523; x=1791396323;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H/daFQ4eGR9SxKZQYumOcM+1gprzJRcbFZIEUlbLCvc=;
        b=qRYq2x6ld1FcIgbRILbAVpwRMupn+FliQStr+YFYNxJ1oOXqPnI66/udL+xsniga4P
         o9JxzhSq39b8MEIMuf6iT8G1vGhGwhtX+jwmMwxQj8dkgJ639R3FfLpNvkD/mA3odyDo
         mFcAnGGVn8UBPUEPQlv/LMX83Fm/kbip5rTwv5AkUwzc4wzwf4YbU6kZF3QSe87AvJ32
         DXGNhVvCrZldnCCwZCsJyELDNhoe9cn337T1GLNPWsG5b1Gx1kAy2JWGHcTIYTE4IfqU
         cdNx8/o/tYnczDJ5F+Vh2Ha7KHc601A1cjCk2O9RWnHmEnKUKR3ZC4ZFLEmeeKAM54D8
         tLwA==
X-Forwarded-Encrypted: i=1; AKwUvBy6qFk+CKi3i1j4i2IajcbEzP9ORQMUzehBH4tPKk0ly1OLWjNGtUPYWZp1R6q9wh0BjIXrxX8lpw1wlyQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyS1R0Vf8lTxOQVDguddFa9RPBbJl5X9t0uWvlDwFssQsQbIO0
	zyLNyb3EEPGPST4JnDbpKfVtIK3zMk/Z9tw7MyFaEDlWDlu5gJR4Zr9yHC8TTBQkxNNzLtNuu9G
	6X/0DoE3gLm4eBQo9mDO2kkSBQUvm8N6nsHsmJHnZf868HGMiKUkgaTzZ9s5p3cTIk0V/B3Tmy1
	w=
X-Gm-Gg: AYBFou3qDb30YblxXPcYY8pLUZNEwGhK3njU8UV2OgIRfz9nP9AmOx9bvc8qDElXSJL
	7Q80rAs59ZkbNl0fo9G+7ez2Ie92qedXF/MkBqM/9cs3zf8IZa1t8sgEJnzdtNLj4yOOgrpvQY9
	veEP0cNXl2zHIKnBaDFwBNv5juqlKOrQdpWAxArGLTN+SDlF8rUdp7FmlEtoaXwSp5BJ3VYHvY+
	Gy8qufY9aJXRCvb66UdscWRHjaXe8Tnm68KgWOJrEo01oUlpta6G58ol47ty91+R71Wglvdpuhi
	WT2p5jne5eb6wr9bRC5oogZmQA3FipgIKG2xNiVEOZc+PPtBoy1jXMQX/lDbFV+Al8g0cPz/SHB
	WNGNky+6KdV+wA4GMBSdeiePKaxYUe64UwrAQg+/i5Vs49UH4flEoWm8VI/QyJgiCCkqyyYO1Qz
	7/7c9ptd0rj6aL
X-Received: by 2002:a05:6102:2ad0:b0:7b4:eb1d:d1e9 with SMTP id ada2fe7eead31-7be61e96e98mr567984137.5.1790791523037;
        Wed, 30 Sep 2026 11:05:23 -0700 (PDT)
X-Received: by 2002:a05:6102:2ad0:b0:7b4:eb1d:d1e9 with SMTP id ada2fe7eead31-7be61e96e98mr567973137.5.1790791522440;
        Wed, 30 Sep 2026 11:05:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a7839d26b0sm426811fa.5.2026.09.30.11.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:05:21 -0700 (PDT)
Date: Wed, 30 Sep 2026 21:05:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 09/13] drm/msm/dp: Track output bit depth in bridge
 atomic state
Message-ID: <bwnubezloh6442xm3t6soho4npktvgd52g6bpzcqygghx5gu5b@whfcbf664ps7>
References: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
 <20260930-msm-dp-hdr10-v1-9-dbbf8b2b42bc@radxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-msm-dp-hdr10-v1-9-dbbf8b2b42bc@radxa.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3MyBTYWx0ZWRfXyp9Sr6wn/wnM
 vt3ShVpbw64NVDtcnjEUK2RJM5k0zEf/IMKQR5WNn9Hj82xnh9PCmkvA//ANbYBDgf1egcWrpyb
 mKogArOtMCSsQLHW2HRymYhQoJavb24=
X-Proofpoint-ORIG-GUID: fK6r-GCsA5kb7F6KMRZox90PqMS-yLYC
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abd4f64 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=ksxQWNrZAAAA:8
 a=M2bzw9_zRUdtQjVNecQA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: fK6r-GCsA5kb7F6KMRZox90PqMS-yLYC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3MyBTYWx0ZWRfX+gJE/pz4E1ys
 I/1kBKMwGtEy5s63ZCqqIHRizD1hm71fTWgsBwJQ8PnUdWp+tP2kdzSFwApwMYeWno1yEJjt6DS
 tJEvj91xfApj5/8xvxwp0B7NopQTIG/eeEtR5p+PIxSa7IKymvhe4U3sd1l5Me6Kew3p3l4sdM3
 M/q1PMEba61eVlnpOCJ92NYih/BYYIwDJg+OSnvJAwRBK32gRVvDJxlcdlf0QtZjkdf+B9sEBQy
 cltYlGJBdvZJL29gohEPMHqjOQEDZ6bN9BywnlifNqAnLRL3rgzgR2x8K9DJ3WdXE84GP+ERFQN
 p9aw+pe1jLpFBjZqHQYixs0c+qQbhXfeIoh2TVQYTKzXxXx3mR6YFDcL2+IRQ5Ck/68ahwTr8EI
 ygt2IEBp+RYNrxaZmHt9xzrENq/9QuRH9nzRKtMsn5Ofz5EoOhDF/ugRZkaKzPtE9IX4HY3C0RV
 TDjgxxmNneflfYvWWbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300073

On Wed, Sep 30, 2026 at 08:41:53PM +0800, Xilin Wu wrote:
> Expose max bpc on DP and eDP and select a supported component depth from
> the new connector state. Keep the result in a private bridge state so
> TEST_ONLY atomic commits do not modify the running stream. Force a modeset
> when max bpc changes to apply the new depth to the stream.
> 
> Read cached capabilities under the plugged lock and defer the bandwidth
> check if they are not yet valid. Recheck the selected depth against the
> trained link before enabling video, including the reduced pixel rate of
> YUV420. Retain support for 6 bpc SDR panels.
> 
> Retain the generic bridge helper's missing-state guard in the custom
> duplicate callback. Initial state allocation can fail at bridge attach;
> return NULL in that case so atomic state acquisition reports -ENOMEM
> instead of copying from a NULL pointer.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 15 +++++++
>  drivers/gpu/drm/msm/dp/dp_display.c | 39 ++++++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_display.h |  6 +++
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 81 +++++++++++++++++++++++++++++++++----
>  drivers/gpu/drm/msm/dp/dp_drm.h     |  7 ++++
>  drivers/gpu/drm/msm/dp/dp_panel.c   |  5 ---
>  drivers/gpu/drm/msm/dp/dp_utils.c   | 20 +++++++++
>  drivers/gpu/drm/msm/dp/dp_utils.h   |  4 ++
>  8 files changed, 162 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 16c9165b5f31..f41924e75854 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -23,6 +23,7 @@
>  
>  #include "dp_reg.h"
>  #include "dp_ctrl.h"
> +#include "dp_utils.h"
>  #include "dp_link.h"
>  
>  #define POLLING_SLEEP_US			1000
> @@ -2620,6 +2621,20 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  
>  	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>  
> +	/* Link training may have reduced the available bandwidth. */
> +	if (!panel->video_test) {
> +		u32 clock = panel->msm_dp_mode.drm_mode.clock;
> +
> +		if (panel->msm_dp_mode.out_fmt_is_yuv_420)
> +			clock /= 2;
> +		ret = msm_dp_utils_select_bpp(panel->msm_dp_mode.bpp / 3, 10,
> +					      clock, ctrl->link->link_params.rate,
> +					      ctrl->link->link_params.num_lanes);

This doesn't feel correct. Yes, we can lower num_lanes (or rate), but
then it would mean that the caps that we checked in atomic_check() might
no longer match the actual hardware. How do other DP drivers handle the
case? We have a "golden standard" of i915, amdgpu and nouveau, which we
probably should refer to and follow.

> +		if (ret < 0)
> +			return ret;
> +		panel->msm_dp_mode.bpp = ret;
> +	}
> +
>  	pixel_rate_orig = panel->msm_dp_mode.drm_mode.clock;
>  	pixel_rate = pixel_rate_orig;
>  

-- 
With best wishes
Dmitry
