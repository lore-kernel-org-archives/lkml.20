Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E5B33BBCF
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 01:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790819425; cv=none; b=SoRxxdT/fYHco9+nZ7bLAONB+Ubl+3qnL3a2y3JQu++Ukt7jKT2eR1l1BKsyzrpObKlndXlXfjN7g9hjUg4+hHhvnLw7WQL0u+MGIjqsk+5wbFvK/oRlKl5vw0cIku1nfhVoLFCSWRvjaATuVdlWLdXjlAMW9fW2rgR5p2p2+X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790819425; c=relaxed/simple;
	bh=ddmOco6M44U6/kCdB0OMu4XDwtxhdxIMJxJvizrGdiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TeJ/GKzvRlK38P86RtlMUfsS85TO4+ZV23K9TWWbNo+uVmDUo8qEsV0WtwQd8yyu7VKkK27VDt581Rdc1kz1rX8AW8X0qNUqIFRWZLCyscmoOiUxtxROwkPQfBuRq3jLF5BokBKvxskRJYVd85OVNFQS9/TTZmcpotttbt3a1Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QzQsRAcf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A9bwG3Oj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QzQsRAcf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A9bwG3Oj"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6910k2001384230
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 01:50:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4EFomxxn+q0H1KdWbKrzZ6/a
	kRtlgLbLTJvHUklGuRg=; b=QzQsRAcfOz4JAfUdl3Hty9YDCHnT3a+CVkqBw7zd
	k8kmP0iqoUumg/iEx4OaoR6IrE3Pp9MYDiR8lwOYwltghxMTEQWKJupjqdj9H7f7
	NHqdUoeMwbhadVKUIAniKeKj+6A9r+SvBXXffNC/+7mkR5/n7b5PTNIP8oLILy4c
	xXWbOwIXc4yo6z8oqwFU174zPh6WGPN+zWjeQe77GeNyQAc8XVqwgkKS2Lz6SpE+
	qE8dygEkJsEwFOYEYMU2aB1RfnIHbt8MjzdoOIA0PD6xNsblxHoMnKtW2zhecc1x
	VEwAcZERLd7Gc/h4F7S1jBdmx8vMY9frVfMlAzZ3aijsmw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h155vt9qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 01:50:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso1104329985a.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790819423; x=1791424223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4EFomxxn+q0H1KdWbKrzZ6/akRtlgLbLTJvHUklGuRg=;
        b=A9bwG3Oj34j99JltSNupyQo1GqX5v0GSvAbwPbjFHI0tA5qud0kcRoBwc41d2mKugw
         FBaZYo1qKMvjzty9YiR6cKQKmIs+IlkALw7kxLxsLVD2ns87itVI2/CIxRlNmqSVe3xQ
         n+5ul6rjotlOZayqDlvBrzHSNrKCrTpGufbgtBvKAQU9mWQlJNErTMLqGTL++fOazLQT
         uDk2+6uNnLbbPazvmHo7wumt/hwjhEqRrx7wzfLqniqjbzZ5T7Ch2EK46EX+COTxoZji
         nIoaFSrTNVWo77e+ppTL4qRMjJHkJn2d12qncGavTVt8J+jVauVE8wv4Q/lTSWfTFlHf
         zBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790819423; x=1791424223;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4EFomxxn+q0H1KdWbKrzZ6/akRtlgLbLTJvHUklGuRg=;
        b=x04aUbBFslmmAYwEGeueRijpBsZmTUhBw7/bjlAFXCDB1cUdyyjA6RcWMxmwkNEdJR
         Pgln1+2H234GS7QaGLvReTI4yOCDEpydcZAE9jwtcHaF9ULuxrBIknCRRQwsEl7HsTnO
         8H6m478sLtAyB8eDXV44e8Ri7eJdsWPvjG+nJevnzTWS9a3TSYLeSkGAlBwfzSemyFCN
         tU+XYTLQdgTizl+vHEQ3GZq3mg5UJ7tObih5Jq1y/XjmOW7pFOOgXFBTfEV3WbBp4aos
         tZ67VxINLUIg00g23fd/PgyVSCkqXOpHEgEwewgPPyhV1fuC4BsBKmvysFZerMe5hl3z
         Lw9w==
X-Forwarded-Encrypted: i=1; AKwUvBzWdFrPi2qX289IKs/rttckLay0AQJLBmmbcCnzb1ckhXxPGAHAqbHWw79jDE+6o/On8sVbVyD0Pe7EKxA=@vger.kernel.org
X-Gm-Message-State: AFuF++mylYpdoxL1In8SiAEU8q+sR3ZLxc89xVH/l5sjMLlCXa5vHJMh
	Z+oStILm7gHtGqeM/vP5hXbIULk4Yqzfdztgy/bZClnCz+BRi43k84LwpfP2ULblMAn3o0m7E2l
	c4R6mSMPIDnmzRUZcCF6Spw+YsMhzHq86yl1du7M99EpNa3HsEt5tnxm0lmUpXuitP7I=
X-Gm-Gg: AYBFou1+imsYu0/3CmMp2ni+5pSbgsAdW54EGzQ2BfVU7wfjU8i7XywHMSTrhIND1iT
	cfeUK7pTCoZo4fKPcR8VIA0xbuLv/IMEdwpP6dyXJB1aIw6rRsubQZvzIk3u5BKTXuSdP5YT1Z4
	y9ipgSRgQv+q+K2K6LBa6NbddsB5OOZzZ3plxCdkiuoxDOy76FHQ7IiN7PMIo/aucllteMo1yxn
	4z8y9cBpD6as9ky9PvrBmsmR9qraW/Li1D7pRycJC8Iq2TsuyO1WhW4X3go4lBxZL6Us645dtJh
	VayX9VGUxq68kAjjA3OtRnHM3LsPyYla9urlI/9iLGfBlsP8e9z+A0bh5wZ/dCwE2OM7O849Bnq
	MRJxQKoEpURIKVQ6y+u9Dm4guuAA2q4CbJOP5JSYFt2BcaeTdCXkfgExOs8uSbnEEvv0a8kXCiq
	KsVVrPRWrEJt1r
X-Received: by 2002:a05:620a:4625:b0:93c:6341:1d64 with SMTP id af79cd13be357-93ca9863312mr639814485a.57.1790819422622;
        Wed, 30 Sep 2026 18:50:22 -0700 (PDT)
X-Received: by 2002:a05:620a:4625:b0:93c:6341:1d64 with SMTP id af79cd13be357-93ca9863312mr639811585a.57.1790819421958;
        Wed, 30 Sep 2026 18:50:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fbf031sm349870e87.66.2026.09.30.18.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 18:50:20 -0700 (PDT)
Date: Thu, 1 Oct 2026 04:50:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Kumar <vk092kumar@gmail.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/dp: allow eDP sinks without DP_SINK_COUNT
Message-ID: <2hmqmjd6q322d6wobtbiyrem2zihayz6qcw42frjbbsbi5clp3@3gwkjqrv52yo>
References: <20260917124706.421107-1-vk092kumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917124706.421107-1-vk092kumar@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAwNyBTYWx0ZWRfX1ib4IzubCkw/
 jSjOO89FljTaWiolL2Rl47zp0swQ0oQTAstTfTr+eNLyusg83gWZbSeoMnVUkktGnmTQsmgnb9Q
 fAjKtBq1CAL44mX3SaxigBxz2As3NeY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAwNyBTYWx0ZWRfX92KklvY0a95u
 2tkND3vBBDrJRGkzL1LanV9q872tsXsjVIz4SNrhODfpHsEKHaR/bRLN2EXRAqVMP9Y8sNHkb6q
 /UsI7/UT6G96xajs+yHpI2CVfdkJk8CnLJvJq3us/o2oYQDkDGc2PpUquUOLbGPwY/BeS6P1r0n
 hfm7zG987nd5rvTDzz148RobStDIL8+rlbjXoXtscNO6rP+83Ix5VtHOWommDXWq+UJMy16kIUD
 WWATF40eynyLZDEDIFJEuUMQhTwylb+zsIKvpj4jcUnVNiB9FhysAQBISD/PvC/16WtwvEn0qsH
 WrNkE9uxhbUHPlR39Dj/92gphHg2ElGswOWy9zpXpECPROO0re3m8mJpSrywD+uh9MNPNdS6q37
 wQfj+NqyYo8lyhyLEVJxKWSm2bku0sbiNAsCQdW4aI1ksm7WAKLQDIK3dsJJkTOeVWuRyb+iZIU
 qLwfTmwMbROBfQ1n1Zg==
X-Proofpoint-ORIG-GUID: 9DcYUKRhO4MKEc3TQEF_b7qSWpCl4MOT
X-Proofpoint-GUID: 9DcYUKRhO4MKEc3TQEF_b7qSWpCl4MOT
X-Authority-Analysis: v=2.4 cv=ZYOIpcVA c=1 sm=1 tr=0 ts=6abdbc5f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=VKs8yQVpha0xVrop0z4A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010007

On Thu, Sep 17, 2026 at 06:17:06PM +0530, Vivek Kumar wrote:
> Some eDP sinks, especially fixed-format eDP-to-HDMI bridge chips with
> no downstream AUX-capable panel behind them, do not report a non-zero
> DP_SINK_COUNT even though they participate normally in DPCD capability
> exchange and link training.
> 
> Treating sink_count == 0 as a permanent disconnect is valid for external
> DisplayPort, but it breaks eDP probe/enable paths in
> msm_dp_display_prepare_link().
> 
> Use the same eDP exemption as drm_dp_read_sink_count_cap() for the raw
> sink_count checks in this driver, via a small shared helper, so valid eDP
> outputs are not rejected as disconnected just because the downstream sink
> does not expose a usable DP_SINK_COUNT.

This will still break if the DP has no sink count cap. Could you switch
your workaround to using the function which you just mentioned?

> 
> Tested on a Qualcomm QCS6490-based board driving a fixed-format
> eDP-to-HDMI bridge IC (chrontel,ch7218a).
> 
> Signed-off-by: Vivek Kumar <vk092kumar@gmail.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c  |  8 ++++++++
>  drivers/gpu/drm/msm/dp/dp_aux.h  |  1 +
>  drivers/gpu/drm/msm/dp/dp_link.c | 10 ++++++++++
>  3 files changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
> index 4be02e8b4d0b..9ab401c8526f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.h
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.h
> @@ -22,6 +22,7 @@ void msm_dp_aux_hpd_intr_enable(struct drm_dp_aux *msm_dp_aux);
>  void msm_dp_aux_hpd_intr_disable(struct drm_dp_aux *msm_dp_aux);
>  u32 msm_dp_aux_get_hpd_intr_status(struct drm_dp_aux *msm_dp_aux);
>  u32 msm_dp_aux_is_link_connected(struct drm_dp_aux *msm_dp_aux);
> +bool msm_dp_aux_is_edp(struct drm_dp_aux *msm_dp_aux);
>  
>  struct phy;
>  struct drm_dp_aux *msm_dp_aux_get(struct device *dev,
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index 34a91e194a12..bf08b5b18097 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -725,6 +725,16 @@ static int msm_dp_link_parse_sink_status_field(struct msm_dp_link_private *link)
>  		DRM_ERROR("DP parse sink count failed\n");
>  		return ret;
>  	}
> +
> +	/*
> +	 * Some eDP sinks do not report a valid sink count, even though they
> +	 * otherwise participate in link training and DPCD capability exchange.
> +	 * Treat a zero raw count as a valid non-zero placeholder so we do not
> +	 * misclassify the link as disconnected on eDP.
> +	 */

I'm sorry, but this looks like you are using an AI agent. If so, please
see Documentation/process/coding-assistants.rst.

The comment duplicates commit message and is generally useless. Please
drop it.

> +	if (msm_dp_aux_is_edp(link->aux) && ret == 0)
> +		ret = 1;
> +
>  	link->msm_dp_link.sink_count = ret;
>  
>  	ret = drm_dp_dpcd_read_link_status(link->aux,
> -- 
> 2.55.0
> 

-- 
With best wishes
Dmitry
