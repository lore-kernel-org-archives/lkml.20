Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8352E285C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790794457; cv=none; b=BTp1Ldoe2UVjKSI6lKzi9EiUfhfeI7Ql/iHWkzgWL+eTAIPIxVtg/HTD5w8M5fN+TIUIKGrM0avg9CNAEK6a92gBSotPfZIvdVHuJCabLsM9767yC9+5XNF1sjBrhrYLlzocIhcOwjnp9EHC+HKlZ/BYeV+7+4XvPCGQW6kpwnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790794457; c=relaxed/simple;
	bh=mBfR8m37lYq2vnd1auojbZ2KSl7yWaueyWc8jTpR7MU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EFZRZlwb9rVBYQaTb71K3HIiLuuvFGcPvGMnM2UNpxPF9+dUoSV30yn+2oJxtgxlXk8ADrQ/bksumM+SzNN7SI7ShEn+hkZv969PPtUCdXXe1JGiWtXBM3mt0lngUWhr0HXJXr7hD/Th15UuqvxYt4IuIT/Xtixv67z6gMXYUno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QJG6Rbqk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A+7NOHk0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QJG6Rbqk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A+7NOHk0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UHfCdN4014120
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gnnRitNHQsGGZhY39Q2WfcsA
	gBctnLcpoJur/qokc8I=; b=QJG6RbqkWltaOXjdWTCf37r8Jt47ICQMxogyCmWu
	1Pz2SKFiT32S09RpePoOLYEAMOc95KUtX3ELA8b/wk2qLDBRI8DDWGMhiVlR1DOF
	WF5eCQ5NeSo7x6ekXDtMGJzF17qEfb794vdPLbQaRcCNPk1ue4YZ1ej14knc2lmE
	QtIEwfRyw6x5PW+g1k1Myf1MSzsO6DBgngl0wWWU6s5ho+Yc/LCGRnbWdQN3MpxL
	8hX4LvFyBUys7r2nrI2guUqoGtQOZEUWNG69zrYpjORWBXosS3i76JAIaK+VbvDC
	/fxvlr61OYa+vTYIpO5Ytf3yRJIvjtUHccm9fK1oafd+Gg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x27k3k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:54:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939c30aa9a0so607096085a.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790794454; x=1791399254; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gnnRitNHQsGGZhY39Q2WfcsAgBctnLcpoJur/qokc8I=;
        b=A+7NOHk0/LfOf6uDpimET6JvuFlZ5ntC1M4ubxDjwRaiDhzTf8K2Usp+zNwe3obMaJ
         2qMnHmcbGjUVA359TrsxQLllqzGxiPVZe/yPm2XQ9x+rnVjzccnkfqP9ZIIgzxlLCd1z
         4khqpNcdLDPDxCcTcTyjA5BgH6BzA9kzmndnT8404NzXAQa+If1iD0vM9FZcWe0FIp7a
         misZZlkznB4mFPnTVQ0URs0/HTFcIVcEaYWMbAspK5RpwOEo7VpyZ3iRxZIsQT+3kgjm
         2VlPmYiIyKWSPX6YTdInM0qstHFFha6ikNb2YxCkofFKyZ2NXv3gOuJtyqpph419dW0R
         raZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790794454; x=1791399254;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnnRitNHQsGGZhY39Q2WfcsAgBctnLcpoJur/qokc8I=;
        b=111L4HC1KlNYgw5Wicuaa+jGZtb5yFMyvxAHReBhkdaTrwuO/2Rb8CYnd8qotlYnA9
         kI4GjJSigColwWH8ST9cQmuOAP6PGpDCySOXE24R458O+WfzJEoRYuAGEMbwBhHYk5P9
         nBNRg2r3y2hrk/BQOumTRZ5dWSMxQwTrRU2Ssn0E0IwRhkZGXs4PrZptg6gOGqy7MY/R
         usyqSwJ/y/jFpu0PMFjHstgqJk1Ia7NuohWN3vTRTKsrbcAmfRZ7M+YyXhRqwJj3WOmc
         /FJ9UOW4jMYvQED/OTbxcZV9CatsF4BD+RN2r5TamAuT6C6GChClXXRoDfKG4rsqxiXd
         176Q==
X-Forwarded-Encrypted: i=1; AKwUvBwF7sdTfULdtO7hyXJj/DXF4ng7dBSFR3pd2Upsbese1Qz0oNQaKTCLbQqzi9l+au9W1M/yX3xQMtDovno=@vger.kernel.org
X-Gm-Message-State: AFuF++kqEtTi7TH8UnWG4SB3GrFuq2edlrz9tRpT90+keztcrWXaG4o7
	FoN9nHiVdRhiTMeCmup8OEPU1YL48/bmMTCuYQv/9y6WgRcD2Odry/Zm0qA3I9n0l6K8g4ypciM
	QbO823a/9oHvB5zD//yWmmEsJ3e2dzEdSfBqH8CvVJLISmTH/8URy6qId3k72rDHrpZc=
X-Gm-Gg: AYBFou0trW4CaR+7u/fItPlDXcBkOUl/PQm6wOLCDMOdNVooz7V//Unznl2G3SN2uzz
	nEn2LxyZu385ACWV7O1dQxkrh0wbvoeKfq5RjBWoL2o/XW7On/Wn0//lqnfOKllFFFdNFgSJpaj
	CBE2zC3qlTzQKvn1THbPQ18q1qkSDSR4bBeE1nav6mymH89O4sLt+W292P7F9mZVrT0m/2sQ3Io
	jBGhSCn6snR+vpqdJi5qxlVo3vEhq3mhWlsitFHBj0bfw1YuJE6ZyUW29ZP9Y20+CasZxjrfTCd
	/lPVi4rjOweFmy6EA8uiZUc0aicZp9RWetYZ4YnTK2lfi2dylPPllgqBBv8PfC1P/xjp4PRL7n6
	JmGOEtg4r9FbT+xtfVhYEos1s7pSyuCjg9Ikq1RGwvLishboaQnEGXq7oteLucLo+XVo2k8pSsI
	BuFyupnqfL7fnv
X-Received: by 2002:a05:620a:838e:b0:93b:c581:2e16 with SMTP id af79cd13be357-93ca96f18cbmr421033685a.30.1790794454191;
        Wed, 30 Sep 2026 11:54:14 -0700 (PDT)
X-Received: by 2002:a05:620a:838e:b0:93b:c581:2e16 with SMTP id af79cd13be357-93ca96f18cbmr421029985a.30.1790794453655;
        Wed, 30 Sep 2026 11:54:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fbf388sm163284e87.75.2026.09.30.11.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:54:12 -0700 (PDT)
Date: Wed, 30 Sep 2026 21:54:10 +0300
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
Subject: Re: [PATCH 13/13] drm/msm/dp: Add static HDR metadata support for DP
 and eDP
Message-ID: <uaqcvnjhzcj3d6zoq2begzhu6ld4ehfmmsedoc725ubodmmuxv@mjpvzey6ysuz>
References: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
 <20260930-msm-dp-hdr10-v1-13-dbbf8b2b42bc@radxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-msm-dp-hdr10-v1-13-dbbf8b2b42bc@radxa.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3NyBTYWx0ZWRfXwfejwFL/0KZ4
 c958oKcoG3n5jlrYD76H3AbxD4kvO2itZH01i/n04bBPJN0VpdQCWRnmmPTycZTDG34yxGPR0Gl
 7PLlka36yxuDXpAWqCQtPngZdNqbX98=
X-Proofpoint-GUID: FkKCZhnwxn2FkqcuP9hOp-6wuYI16n2d
X-Authority-Analysis: v=2.4 cv=W9GtxhWk c=1 sm=1 tr=0 ts=6abd5ad6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=ksxQWNrZAAAA:8
 a=CHs-XZVRUtj_WxdIW8AA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3NyBTYWx0ZWRfXxIF3HNL70mWl
 8wX7EpGIp5rYHBN13x7DrkS5P5X5WoWQDun1sDCuem+CSlDD8ehCW7KI4tKtKtX9EJwjpRa7wRz
 z+9S23gZR4rukTouSGjQdqFDbM7b7mm4iU0fRjHUdnksk6oJgKXDDHJs0IvNlKoyWCaKEycJivZ
 n+O/ynukTmetqLjheusWuFL3iXpjQoz8OLityxlLJAuNQ5UOIPuMP/KkFCIBMkI0W3zzYIdQ8HX
 LNyE1PfY95qD6PIYJZX52R3nAvPimpu4xLr7jUIlj+1aB2+qhl36yR4Tgj0pFvGU3DAhiuknAMb
 TKfTVX1u64K2D1CD7d74/YK9g9aSkegG0wxYabQmntawSLdzBUyfO4UUqdjKWdglqKBNquW3SDd
 hL6fBncua92g2iTnvuVtcdmvjpGSVzgFVtE693gmd44AbKpgaGrUJ2sjwOzF87V9j16wIzF9pY7
 fNflsBPCcEQ1TCt/bnw==
X-Proofpoint-ORIG-GUID: FkKCZhnwxn2FkqcuP9hOp-6wuYI16n2d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300077

On Wed, Sep 30, 2026 at 08:41:57PM +0800, Xilin Wu wrote:
> Expose HDR_OUTPUT_METADATA and validate and pack it during atomic check.
> Program Generic2 from the checked bridge state on every stream enable.
> Reuse the DRM metadata conversion and infoframe packing helpers, omit
> the HDMI checksum when constructing the DP SDP, and zero reserved bytes.
> 
> Require 10 bpc for HDR transfer functions and reject insufficient
> bandwidth after link training instead of silently reducing color depth.
> Revalidate sink HDR capabilities after powering up an eDP panel, using
> the stream enable failure path if the requested output is unsupported.
> 
> Force a modeset for metadata changes and include metadata enable and
> disable in peripheral flush requests. Keep HDR streams out of PSR and
> clear Generic2 enable state when disabling the stream. Preserve the
> software metadata across teardown so that every stream rebuild restores
> the checked packets.
> 
> Give checked HDR modesets precedence over SDR video-pattern tests. Reject
> new test requests with NAK while HDR is configured and return -EBUSY from
> the debugfs test control. Clear the test override under plugged_lock when
> applying HDR so that a request arriving after atomic check cannot replace
> the checked output depth. Keep pending test colorimetry from overriding
> HDR signalling. Atomic checks leave the running test state untouched.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/Kconfig         |  1 +
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  9 ++++--
>  drivers/gpu/drm/msm/dp/dp_display.c | 39 +++++++++++++++++++++---
>  drivers/gpu/drm/msm/dp/dp_drm.c     |  4 ++-
>  drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 33 ++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  3 ++
>  drivers/gpu/drm/msm/dp/dp_utils.c   | 61 ++++++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/msm/dp/dp_utils.h   |  5 ++-
>  9 files changed, 145 insertions(+), 12 deletions(-)
> 
> @@ -717,17 +727,25 @@ int msm_dp_display_atomic_check(struct msm_dp *msm_dp_display,
>  
>  	guard(mutex)(&dp->plugged_lock);
>  
> +	ret = msm_dp_utils_pack_hdr_sdp(conn_state, &state->hdr_sdp);
> +	if (ret)
> +		return ret;
> +
> +	state->hdr_enabled = !!conn_state->hdr_output_metadata;

This should be done in atomic_check. Also please make sure that we don't
copy data from the state to the long-term structures. I'd rather pass
state pointer around.

>  	bpp = msm_dp_utils_select_bpp(info->bpc, conn_state->max_requested_bpc,
>  				      clock, dp->panel->link_caps_valid ?
>  				      dp->panel->link_info.rate : 0,
> -				      dp->panel->link_info.num_lanes);
> +				      dp->panel->link_info.num_lanes,
> +				      state->hdr_enabled && state->hdr_sdp.db[2] !=
> +				      HDMI_EOTF_TRADITIONAL_GAMMA_SDR);
>  	if (bpp < 0)
>  		return bpp;
>  
>  	state->bpp = bpp;
>  	state->colorspace = conn_state->colorspace;
>  	state->vsc_enabled = drm_mode_is_420_only(info, mode) ||
> -			     state->colorspace != DRM_MODE_COLORIMETRY_DEFAULT;
> +			     state->colorspace != DRM_MODE_COLORIMETRY_DEFAULT ||
> +			     state->hdr_enabled;
>  	if (!state->vsc_enabled)
>  		return 0;
>  

-- 
With best wishes
Dmitry
