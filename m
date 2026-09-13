Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDDC29DB64
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789335757; cv=none; b=d9ywiaIJ19XtcPPhWSJIS+EwzKXvuBpoN4BOKFpejVu4eWq9RsDqxHSFIAfrulM6xaZ9R9gR4bxAOGYsbozZto3PRS0fZEdUsQOOFnvS0DT10tdnq78/wInr/PKJYrGWANIpNWNGeJ0KdhobYw7kiutCgBi6/M3br1dKBtvpJaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789335757; c=relaxed/simple;
	bh=21N43bNCbNwQdRLSoYTobyN2WN37hNF14IohhrclkRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YEF0eayqJXSFpjZfFkeBnMF7hQSBBcYZZ5YtLIqzeCswmbRCjiiMQ/c+NJ7l8XB9y4I+DJ/i0pMm/AOiQBkIShE9CgyeZRAvcMSkXj8ut1P9rlYTebjO/YP3T9eb01LdZPmugP+HQclWuui+nNxhgrCZlcZA+0OizhttI+m16DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HiG7s61O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UYJsJ2LI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HiG7s61O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UYJsJ2LI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DK0YnH3041232
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UAdGueHE+a9zntgGiuhM1GjC
	qAqzf2hTlkwX0CikYMg=; b=HiG7s61O7LGrUojzPSNwW2HKxGtpYY3b88ujTUKb
	bCz5YQeaL1TvTwyu/bR4bkuoLNH1OXicEdKxBlRWa6xI5XwLKLWrUisB+inMjHPt
	yiaZttPMLj1pU1rDsqxtBnIitLj7TmSKsT9yTtioZjE+IOjGRxSjUBhlkF+nahOs
	1A+VL6iuLZYJt8WeheaW5DnRma/8QI6kfRauPkD8ripL0p/y8OqdSI97VH8XLAeY
	hYVMXso/MHXdeWoN9Tfd7dEjdcfUARMHkjU0TBsb1L+SLoTGoiSbntsjm7PhVxu5
	+od8D/nSWUgqo6akM6tHPP9KHqvj3U7PPd89be8d3a3D1Q==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dm835-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:42:34 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c7ab4af214so758895e0c.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789335754; x=1789940554; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UAdGueHE+a9zntgGiuhM1GjCqAqzf2hTlkwX0CikYMg=;
        b=UYJsJ2LIECcZOqI5yVQdqECg93atHjuJnA0NjE5jb3edgd1GhBvcqumgJ40sdM08/b
         yJWK4kHF5OLekRuVIAGrRIGg4y1zAO7ZJVRiQrnyUdBha2QLlvu5+CxQPQTyp4Z4eXvM
         VVQZ9kNFp3A489+SBMLJCEN2VrYaZ/n5/4E7olN+3JLfbweSnV6Rlup0YYDLzecvyf3s
         5Bd2Nlvy2A+Jz0//nZrxnHtO5dTORnMe4X3s0p+6MAQp30OWcxBawXDcTHq7Uhudq+e0
         WbXreD0QYmQudrIBeR8uvZvx1vBKEbfpauXlwlfRpV57XH0dlTnh0r84XYLcUlSxVKM5
         WW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789335754; x=1789940554;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UAdGueHE+a9zntgGiuhM1GjCqAqzf2hTlkwX0CikYMg=;
        b=SIvhX+wwNmH5erit8Hvtd8d2gJRwv3leB1JLBEN+LMJSOJjmSF3qgDZQ6uGHQHxXpK
         1BAW+AxpNWfOufwfPS4vH5jiwnlQ5qHKmYOP38v+RpvsOcWjhNUiHL+Tjnvex5EryLw7
         fgjXGTmGPACz/cmZbOCOSBcI/IukVBTlzVMJFCtyt7nKD4xr4+pWFicHeazj6UGmGtPu
         yUVt5afpRR++Gu6fbvW9/Dop1LuVm+BciihvfuNStTG/6s4HnjnaDJecolmlMfuXT/rf
         lVhQh3lPxVNTMwznKRvr9QfWZXFLlfTq+rsg16iqaGszUmz372tNpTTkenxaDB5CYHuj
         u6yA==
X-Forwarded-Encrypted: i=1; AKwUvByvYqP+XyFRjtZLO5bsYI0jfAAJhWZrFUJ1jM+JoCaH1c7WkZaz1XfsFv/ci0tWrJ7Eo7L3Ng2EShO82LI=@vger.kernel.org
X-Gm-Message-State: AFuF++kFf3aWP170NwE0O+QbfFbhOb64nD97b4Zom2sd2fkY8ad1wWbl
	xC7EH/K0DZ8oNKi9uXOrpAEEorQkXX2xmywo9fcJxsq6WVOaA4rq3uqINWdLeNNZ2rCVr1pTzRY
	qRh5QbJCzn0+BiYIB8rd4mSykkIdd0cUv8qIubQkwVULDxtf49s6/jfyOuD8pTkIC+rk=
X-Gm-Gg: AYBFou2TOShCyQCvoLxz2h1KjwxU0Iddv7ziLY63wfJfwG0tbOtzSwKw85icEr/4lfD
	LRVwIm9vWD/cJLCJ4M6UfuWhqfdIToH6/zp0/D0GZgYXWyN8yDHQ40DYkq+G3XNkFoZ9/urZPuK
	piTmW11/Rqv0hZ5uMIdxs/aXmIpkgdF0mPd6p7X2qe9DoDECNf5QVaiiBnGZpa/8WRBKVFNntHv
	0z3aBSC1SFj6/KyLLoAs75iAK22HWfE/eLtHlMIWUvR/AklS65cKithGcLGR9nVsxzVXAXWT2HK
	imOHqWaz9UMsYmAOjLtjwam5TzHxvAPxcif8zywMhtay67SZPn69T5M4HB4NRnYng9z1jYEMqne
	ezBCoXbvx9elNG18Kjy1lZ42Jp8d2u4ojbWZAqcjhLI1llBj9NRbQ7P7LfP8IZceOdPhGA9x43h
	PfTZFsmuImUmYZ
X-Received: by 2002:a05:6102:a144:b0:796:7d9:a60 with SMTP id ada2fe7eead31-79607d9203fmr2599838137.3.1789335753511;
        Sun, 13 Sep 2026 14:42:33 -0700 (PDT)
X-Received: by 2002:a05:6102:a144:b0:796:7d9:a60 with SMTP id ada2fe7eead31-79607d9203fmr2599819137.3.1789335753065;
        Sun, 13 Sep 2026 14:42:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047854fsm1938531e87.67.2026.09.13.14.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:42:30 -0700 (PDT)
Date: Mon, 14 Sep 2026 00:42:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <quic_riteshk@quicinc.com>,
        Vishnuvardhan Prodduturi <quic_vproddut@quicinc.com>,
        Mani Chandana Kuntumalla <quic_mkuntuma@quicinc.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH 4/4] drm/msm/dp: continue link training downgrade when
 cable is still plugged
Message-ID: <q45k66o2geby5lewynwx3okmmmun7ippmlzsyx6jegabptmrd2@cwk4f2hu7vwk>
References: <20260824-qcom-dp-typec-reconnect-fixes-v1-0-2825e5bf8a96@oss.qualcomm.com>
 <20260824-qcom-dp-typec-reconnect-fixes-v1-4-2825e5bf8a96@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824-qcom-dp-typec-reconnect-fixes-v1-4-2825e5bf8a96@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMwOSBTYWx0ZWRfX3rdUViin4d60
 szwWEG4B/AxdR+Gfj+PSF83NRb4F0qS2MOzzNT8nMAjjAW2/xaP3/Pe+vgBF/BKDf0ZcsfR//sg
 YGq7NkL0p1a8AU39W96HhDly+pA94MQc7qiMfp+d2afKDxAkCnXC6Gg/JvKoYsTAEJrfUX4IOGh
 HpBzjHHkBs61KW38sZiDt7LzczGiHnQT3yH5oj6HsSvdKEz6TOVBuavqBm9cmJ/LxLT5lPTgLec
 4pReTLjfyWy4Txla1usftzNa36mbws4lkg/LLMvVXYRSnaL0Q2MFawrqQC8vCVg/XYBozJRs997
 MiaaIbv6jDf0QTJcYTn4cb1C7qmDoNdDZb39+aS//xAtdr8/CbI/RCXwdEmoabTS507rkQSAoCq
 wJvqKPw7k9msGamlwOUc9vWpdgek+z7vaEc3UvIZtDIOFK970OSSOAxFvRuez6MK3UDzMpFByvq
 DQFAMXGoq4L7PJZVKCQ==
X-Proofpoint-ORIG-GUID: yuFRwOwYd7ytMpOEvqUa5DjLjXkrYXas
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMwOSBTYWx0ZWRfXwPla4wMAUCq0
 nIJQ8bxtCv6pZ69S5VPku9+3YOfr7VAoI4EWxTsn4rl+9eVq4Di5wxjA8csy8qCt3a3RvVhSriD
 rHd8idg/CzaMQwqa9LukX2clxx1vDjg=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa718ca cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=282R5v4PAPrGKAVVY-QA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: yuFRwOwYd7ytMpOEvqUa5DjLjXkrYXas
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130309

On Mon, Aug 24, 2026 at 04:58:07PM +0530, Saurabh Anand wrote:
> During a Type-C reconnect the AUX channel may report link-disconnected
> transiently while the physical cable is still present. The link training
> retry loop in msm_dp_ctrl_on_link() was aborting immediately on any
> msm_dp_aux_is_link_connected() failure, preventing the rate/lane downgrade
> path from running.
> 
> When the display is known to be plugged (msm_dp_ctrl->plugged), an AUX
> link-disconnected status is likely a transient glitch rather than a true
> unplug. Allow the downgrade loop to continue in that case by requiring both
> conditions before breaking out of the retry loop: AUX reports disconnected
> and the display is not plugged.

A cable reconnect should follow the full procedure. DPRX may use long
HPD pulses to signal that DPTX should reconfigure the link according to
the changed status registers.

> 
> The plugged state is snapshotted from dp_display into msm_dp_ctrl just
> before msm_dp_ctrl_on_link() is called, so the retry loop has an accurate
> view of cable presence at the time link training started.
> 
> Signed-off-by: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 4 ++--
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    | 1 +
>  drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>  3 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 59070f399e2d..e8fd8f4c75fe 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -2379,7 +2379,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
>  			break;
>  		} else if (training_step == DP_TRAINING_1) {
>  			/* link train_1 failed */
> -			if (!msm_dp_aux_is_link_connected(ctrl->aux))
> +			if (!msm_dp_aux_is_link_connected(ctrl->aux) && !msm_dp_ctrl->plugged)

Locking?

>  				break;
>  
>  			drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
> @@ -2404,7 +2404,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
>  			}
>  		} else if (training_step == DP_TRAINING_2) {
>  			/* link train_2 failed */
> -			if (!msm_dp_aux_is_link_connected(ctrl->aux))
> +			if (!msm_dp_aux_is_link_connected(ctrl->aux) && !msm_dp_ctrl->plugged)
>  				break;
>  
>  			drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 5902cf7e746a..95533b0b6297 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -12,6 +12,7 @@
>  
>  struct msm_dp_ctrl {
>  	bool wide_bus_en;
> +	bool plugged;
>  };
>  
>  struct phy;
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 1f60c78a463d..93a37a44273f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -644,6 +644,7 @@ static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
>  	if (!msm_dp_display->power_on) {
>  		msm_dp_display_host_phy_init(dp);
>  		force_link_train = true;
> +		dp->ctrl->plugged = dp->plugged;

No, don't create copies of the fiels. They easily get out of sync.

>  	}
>  
>  	rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
