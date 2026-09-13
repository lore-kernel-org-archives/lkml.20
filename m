Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BCF2BE7A7
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789334632; cv=none; b=QmKCSClZ1M/i4bkODER1ETAgGewJAkqNjHbGh4LzpNRFv7F48u8JlmwG+OQjhhZ1KM1TLyH634tDQFpmhcJAqEW9En9eKedNfqLjjSd5Ua8DGPhDkHSDwbZLzeOK6Q0CI7D6cUz3sYKf4cPI95Y/3aKrDj9fg9N9gnDhdiWbzFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789334632; c=relaxed/simple;
	bh=ktYUayfPK8R5HhuLAmBeI6ZyOboXtkwGgcWJ7LNROiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RN483rBE/M5JqklfTYm41c3wo4D5BtIAEIrKXpYNd/MIClnQCeVxZ0Bj0Rx6W8K9c0uQjZtfjuRbKZTWHYzZejwm/n3BT3MYWXp2qH4UEyBJo0FpIyKCl9KWOSHJZ108CUrdJhVXKY7iQFYnC54mfkRW6HkMzz59Hx56iDIdHZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TLTv41Jo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UUDxnuio; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TLTv41Jo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UUDxnuio"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DK0f3I1988815
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nan6vW69SNnTd1biCzCJThnP
	a0herBJ+hscih9u1lQg=; b=TLTv41JoK/Z4UhBpy7AOa1L/WQFXSqKMhutIlbFu
	V7pCdgXAu5yzrOrJfpwB/7dqSEmRz4BIJBusXtD+FaBEgj8XEkH8W0fc9m5AAIil
	xmzRTasENQiqk4s2pQA+b0ny5ol8exT7/9Ool5sUM1Ad1FxADHaHzY8jUJD4Wuy4
	b9BQtmeJKVm+DHzYsyHc2apliJEy8gRL4MMrMl8+ZP2goo6f+CwQnH+u0RJMunmh
	lx92zpgly5Wd22278ZsKFUb7YgoytFPAvLSnP/0EKd4XHBYgE1iwuXZRsqqQum+3
	obiBRC6M8dz7kCtU7xspmnAZG2Eu98iSB6m1bGZEv4EF7Q==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cc4sm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:23:49 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97cc09260a3so3158472241.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789334628; x=1789939428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nan6vW69SNnTd1biCzCJThnPa0herBJ+hscih9u1lQg=;
        b=UUDxnuioWyYDqg+mQr1bIalPxvacddXXqI9Zn+zvQbWj4vxjjeeOTsZmYSx0qs/CSC
         mGNNmtdmMv9o++cWP4CB/kuHhjw7rb4MVY1Mk+Seevu0Aod1Acq+EwhBcY3ojph1xKq5
         OCWpQmwD6oIGF9J4TqNQ0BohpRT3j/YMqyvk2PQk5dnVGyOCIGK4pHUrZNgNPlT9OxLs
         vG1WV+17nEAqCKFX06Ma8lPbOBc+y0h6bq6EBm66b19hgK6zUfAu/WC66PVr05B1EyMB
         xx61KmKafYPERXJDrAApL5reX4Z4tgWMZ9SLBw5z1dibjEtRbcbPJ6nQKuqS9rsLAYcY
         NpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789334628; x=1789939428;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nan6vW69SNnTd1biCzCJThnPa0herBJ+hscih9u1lQg=;
        b=jMx8OX0WgEhIUtfi6lEjCygp6ztf/+L0qhnhWfpEVAERgm8HYcYk0Xpz76ocXJYE04
         59iCnFPrlUvInfJmAFK1/tIBPWWO7t7N5uYdbnNz6AVtrMSGVySTlImN3MIjeKk22Uzq
         OeCSbwHhXcNL07WLmQOqPHZQfIJxii8c5EKFvq1hr2FuQhEk9ywW4G1htdvU3p/TNoqr
         qWOWLttr35sU925+lk7bq2aEw+wq3eOVbG3o3PUo51+B5PV4iDZHzona16HiLxd+NhEj
         EwJK7Z7opH3BCtGjdZGP8yRWAPj6AZkRTJ7Tx5yQ0JnlmXZaNJbbXuor0Mbb4azjJuJ1
         A7GQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQtwxDxXxzOb7CvKHUWXq9/WOO6X/66NCz8u8LflYLdw82lFSsLZ0CCp/3dHc4m6n8nAlqmFsI3O5+xac=@vger.kernel.org
X-Gm-Message-State: AFuF++kJjCKs50YHN7pgbRTyoLcz0EAcFmZG0euHB5aPRcjgJgoXNozx
	DHZd9ynWxyUJqKAmwJ/0mWu/4o6IuralQqTkWsyqXDu22ZMtqeimsfQQwA7MTmJBt3ZeT+5B/h7
	grIn8OANfZjV7GIW8lJ26KkI3uW0FUCjrmHukLPW3W0Juo1XgiLwwZh1ENE4qpcWgZww=
X-Gm-Gg: AYBFou2Kt++81+dM8PNKYcM9L1+6htOEybzpEWxIBZ4h95xnJUQLA+2JYrMEqg8k/zI
	lditiFsHPRf37x0yJMVP7vXn0IHKA3nJEa/tZLVHoCULMkKZhk4aXrMiZB8VSXFEU8zEJQwd1JE
	MtXCj3w8+oXdTWgoplXizEi8cPXv/za2/kM17gaZtF8Hp7ZJi2tEFi+v/d0gG8/OawHR/M0gEOd
	T8JDvuf3dFrCBrfUoq1q7A5EAdTeXC0uUPjTT7UXZAEy83CjFFjxSgQtfu9CE2Sj8J0M+u+H8UA
	izWQ0f7/A5YmlHGF/oA/jAEcgB3H5aqE1xdTc1cqH1KPfZFvFeqh/37HWWOhwhnJ4SFoSm3fbk0
	RLSsCJX5PxuGWxhrsXUkIaT0I53XnzLA2e61GUiK3EPVnkQ/v+GpgX9vZR31ZC1zrrax+rxZSak
	w4jT39UC53pyrv
X-Received: by 2002:a05:6102:66c2:b0:785:6b42:b7b0 with SMTP id ada2fe7eead31-7988f46e546mr871107137.4.1789334628426;
        Sun, 13 Sep 2026 14:23:48 -0700 (PDT)
X-Received: by 2002:a05:6102:66c2:b0:785:6b42:b7b0 with SMTP id ada2fe7eead31-7988f46e546mr871104137.4.1789334627921;
        Sun, 13 Sep 2026 14:23:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0456f70sm2032965e87.17.2026.09.13.14.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:23:46 -0700 (PDT)
Date: Mon, 14 Sep 2026 00:23:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: William Bright <william.bright@imd-tec.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: fix link bandwidth check when wide bus is
 enabled
Message-ID: <cixxkgc25p36wchfusuucqsauaahd5w7xfvdoqrfmoghenvgmw@ukirdl7l3nqj>
References: <20260812-msm-dp-link-bw-v1-1-b0e3ce1190be@imd-tec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812-msm-dp-link-bw-v1-1-b0e3ce1190be@imd-tec.com>
X-Proofpoint-GUID: oZHoZbHvba9uUpwu4h9nJxBU2GzzDLc7
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa71465 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=gNcS5RXMAAAA:8
 a=EUspDBNiAAAA:8 a=v9oLtqcirEpa13wbMwwA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=VeqYHxXNbGx7SVBbL1V1:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMwNCBTYWx0ZWRfX//sCYy28Q+lA
 Y5At+WPi0SzrxavyMEuVNKZMDDuCDCDCXkRybXi0Erousdt1hmkGN8nCr6b85Pjj3NwZKTxfi3Q
 vfrQTafevkLsXaisma9sOg8jmJbtCVw=
X-Proofpoint-ORIG-GUID: oZHoZbHvba9uUpwu4h9nJxBU2GzzDLc7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMwNCBTYWx0ZWRfX+/jCTzVB6Fi9
 mQ33CCCfomF+0W3wVATLWfmB6/CUWP5I51Ctgpj/vkiny8I981gqRKKw61V6/FVfbW1KzDTWK2C
 iSmQSXKthcZW1JcT6n7zULgp9mxRiUIhEGz/afDs09OabrxvIQ4ryTIm4mKmsE+iR/pNaRfDfvo
 xVbMVgMMWPSYpFibEaR+gkhZiCxuKpg1FzPMv0jH4LMlHMTZqOcdL+v0J546/TdwJimGsV9RRnZ
 8kwO91qQpBOaI5Tp2RmIeQYovefuG7up3pCi4eUozDOGh+m28ZEBbj/wHzw6VPgIujp4oZYgsLs
 KJOGjZ01RLvsUJA7JwiHLArQu+Wcm5SpMtVlOtulJdupwvL563L4SZd9dPbNuZOL+D9EQKEJlVT
 hYJuOnXuCFzl3DirOrFjotljCDhpXaSycGXap07rbbpWjsUAtjbWJCc649IoDLxoY4yiYIcKlGs
 lqmUoIdBhFAS8Yctz3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130304

On Wed, Aug 12, 2026 at 11:05:52AM +0100, William Bright wrote:
> msm_dp_display_mode_valid() halves the pixel clock when either YUV420 or
> wide bus is in use, then uses that halved value both for the controller
> pixel clock limit and for the DP link bandwidth check.
> 
> Only YUV420 halves the data crossing the link. Wide bus widens the
> internal DPU to DP interface to two pixels per clock, halving the
> controller clock. Every pixel is still transmitted, so the link
> bandwidth requirement remains.
> 
> As a result, modes needing up to twice the available link bandwidth pass
> validation. On the IMDT QCS8550 SBC (rev5 with CYPD6125), where DP runs
> over USB-C alt mode where only two lanes are available, 3840x2160@60 was
> accepted despite needing 9.6 Gbps against the 8.64 Gbps the link can
> carry.
> 
> Use a separate link pixel clock that is only halved for YUV420 for the
> bandwidth calculation, leaving the wide bus halving to apply solely to
> the controller pixel clock limit. With this, 4k@60 is correctly rejected
> and 4k@30 selected instead.
> 
> Fixes: df9cf852ca30 ("drm/msm/dp: account for widebus and yuv420 during mode validation")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: William Bright <william.bright@imd-tec.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index bc646d172abe..b2d6cb82a146 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -756,6 +756,7 @@ enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
>  	struct msm_dp_link_info *link_info;
>  	u32 mode_rate_khz = 0, supported_rate_khz = 0, mode_bpp = 0;
>  	int mode_pclk_khz = mode->clock;
> +	int link_pclk_khz;
>  	bool is_yuv_420;
>  
>  	if (!dp || !mode_pclk_khz || !dp->connector) {
> @@ -775,6 +776,13 @@ enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
>  	if (is_yuv_420 && !msm_dp_display->panel->vsc_sdp_supported)
>  		return MODE_NO_420;
>  
> +	/*
> +	 * Only YUV 420 actually halves the link bandwidth, as wide bus only
> +	 * halves the pixel clock within the SoC, while the link bandwidth
> +	 * requirement remains the same.
> +	 */

When using Claude coding agents please ask them to trim the comments,
which are better suitable for the commit messages. This one is
completely redundant as it duplicates the code and adds no extra
information. I'll drop it while applying.

Otherwise LGTM


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> +	link_pclk_khz = is_yuv_420 ? mode_pclk_khz / 2 : mode_pclk_khz;
> +
>  	if (is_yuv_420 || msm_dp_display->wide_bus_supported)
>  		mode_pclk_khz /= 2;
>  
> @@ -786,9 +794,9 @@ enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
>  		mode_bpp = default_bpp;
>  
>  	mode_bpp = msm_dp_panel_get_mode_bpp(msm_dp_display->panel,
> -			mode_bpp, mode_pclk_khz);
> +			mode_bpp, link_pclk_khz);
>  
> -	mode_rate_khz = mode_pclk_khz * mode_bpp;
> +	mode_rate_khz = link_pclk_khz * mode_bpp;
>  	supported_rate_khz = link_info->num_lanes * link_info->rate * 8;
>  
>  	if (mode_rate_khz > supported_rate_khz)
> 
> ---
> base-commit: 140b13475302601368c0cf4e193e66126a49feb3
> change-id: 20260812-msm-dp-link-bw-99255c870bc4
> 
> Best regards,
> --  
> William Bright <william.bright@imd-tec.com>
> 

-- 
With best wishes
Dmitry
