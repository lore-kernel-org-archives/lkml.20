Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406146;
	b=gfC5mLyzAVwuNVnEIUX2rXOeI8Bf92l7OiwdulAgFGNSiZkTiwe7lHFrdC6RLDuEygPj
	 MvwM6TZ1bcmKRO7X4M4xpuiNaUEZM7mTjE1XK85VGRXtf5ALQCe9AcPMw3kZWrb5AZZ4c
	 LgA+F+Ik5qEY6HjFYQY34Ylsuw5jnjQxMH++l0P9UwUQmmWCAVG3TKrshnQl7O4+RRdNo
	 tm2ctwa/27WTPQEzY9l6K2iHMaGK8d3hXLGt62GMfP6gapulp0jhPV0XTCdZ+G4w8rZUO
	 PCYQi/yBuD24V4rR6/YMt5iXagonf5oUkgJSX7mS6Ds4QcdEZIdWjwMVxdf9Qm85V+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406146;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QPstyFoqSPmuHiNdLUorh+Rrf2UfIpcMs4IumwAd9y4=;
	b=PpYWlCZ7h835BFjLbpVREX86h7wUAOxyyl608z0FDrnmYzGLokZp1qcpmhDxHjTx+f0i
	 5nyxV5rTa1mfp32DZnsw6ZjlKBX7f6Kb7J2IwpS5X7OhkHXjosWW741sQr8TPBMl9Ah4f
	 P/bV1DPo5fHvA30zZPo3TRrm0gvbewAJzn3nTX9MKd2BMSFVuKFuNVGCx6FeMWosYuIRJ
	 pmEQNpsHTyBWZeYStx9DzkAxKhBZwe5exlNL8JCXEKIvIGr0fazNSzUE6r0kGy0hwXj6/
	 M8sy+NxhpiW6HATPe7lOBTANyJ3B7M1D11iWTC88LhXlvcXthFjRdPBEWL8TEh1SgjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UUp3Ssbp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NIyyXBG2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7354A606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:09:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7354A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UUp3Ssbp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NIyyXBG2
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABDIFkh1343645
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QPstyFoqSPmuHiNdLUorh+Rr
	f2UfIpcMs4IumwAd9y4=; b=UUp3SsbpMCxDkmG8IVteiSnCXOXpT8PaZqwzPyzO
	DHGJrREKLf/xq8zpVZgXdboYDqvD3DvFlaDEE7BzXgLiSUbNo4eAyUjMAdsNJW7Y
	gP97dCBnH3+ykf0gYuvz8RczrG1rXDSZMUs85q+f76ua6PA5G0snPAMRUW4H4IXA
	6p0C9Lb8Ic4iHXE6qvkWvFVABLAa0vrxlgnux/K0pkA/wSNFHIuCtVO8BGhvlMx5
	cMoO28JHX1QrYl3fKAJCzhYlb81VqqItDUTLDhpMoK+N6+VuxxZ5RX34LCxyPU+d
	UZxiP2QIYua22z53/B+CpmdaaNoXSv6j8/JG5yrWa3ec7w==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvs4m06v2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:09:04 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ece56bfeadso2613011e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794406143; x=1795010943; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QPstyFoqSPmuHiNdLUorh+Rrf2UfIpcMs4IumwAd9y4=;
        b=NIyyXBG2SD8Nk4WeGD86L9EjcMOn97V3eymAmr0X7FB16zVTfQB3Kq9Mo/NbGpSbyL
         IxYpPzet5Z+8z4D4W1LIhkQ10QsLnULUxEfWivIa6/qlo1z7i90nDSokleQiprM7VkbN
         Q7tBI4QhLumhgM6DEYv7IyyI7m5WtSs+KGZF0XqcEUGbvqBCGqMFqFQ6CwjM66aTnELL
         k/6LymABCkI/jdrZ05hdX7b+bc2496lQB87Qpy5FrWimLXJQXiLZgAJyiirBYbqDS4iW
         GM4277PcKnSgDTCbsEqBy46u+OZkv05CeUENgoXVSMbFUwoQqJBjoirRxFErJ4oZhtrN
         3Zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406143; x=1795010943;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QPstyFoqSPmuHiNdLUorh+Rrf2UfIpcMs4IumwAd9y4=;
        b=NXFqbN4SnaVjp9jOFL1mTi+6e0LcoSkojkGpQotlbsrakoAyhxXTuxcUpAA/ufVMgE
         eoKPut0FKM25uWhN1+RluLHB4zPPkiuGaP+JpdhDK/050SlHVwlGQWAkyiERRr8U/ngg
         FUeRsLOGcJUm71y/o55B3PS6J1Ct+cSVEXlqXJWCeVJI4ix7YzAWWQvdOa3tKPgZTTBY
         Yshmag+k9FUvhYKeLJB0tZ6W4V1iZdKkwAyVIVrsDfdLDiUnZeb4ZSYGiJwgw4BrT5zM
         YwAElEYmPhT+7RvAfrZYIUvbwXyICj2jpSpn3QuXbYIaFR9SAb/RdL0AWiIOrQNBaobd
         lDzA==
X-Forwarded-Encrypted: i=1; AL+hErE57/8PNubhL31x0lCh74MQyo/JuQyE3b3rAVTCzIJmzZGgma5Ak7rVVqB+7WcvM39SdcQt+5G7S4sx2I4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/TZMBioh1Ba59RBVpFisY8gUbuCYlMny+FqEj1SVEPeoyclUS
	xme7uPe3GkPi1gTyTnAMrmL8cPF44fQk4f9lQnXVdLDrozSC86QtidxyYEZgsIix5HratE/QnNF
	hKxoA2KkR/FoDDQBtZlflnqXLS78WhDkMxG6C6iys04QD2Jphc5VtLy9FPjPX0h4fcgY=
X-Gm-Gg: AYBFou17P5yEbzbATV29pr1Oz53HWfXvR0CMUAmnPQkW2wvN2gfQ/G0Td/qR4Ap4FZZ
	hRSv066WrQRiX2Pa+/5UqAG7HlY8ldDxIm3DaRzlX/J5/WlNI8NIow89tFGaAGXewTHRa/b4M8W
	O94dmeGpLOgr6C+lrIP/2JDEjyKapJbk/8WbDG4mpGBUP4YKudpW0beFZx7fWo1dJy0M1ccDsE9
	j5V7+R1Q+Yuz0slHPKVBSOY1div/aBeSwPiCxYJwRfmb4jX9hK8rTGxqPB6fdeuCbwCBpu54eK/
	lTpqtycNrv0V708X4u0bCcdlxUCJDfPIVW93z5jmtcZpQ4gsjbEUecJzNXfNbPphgMP5Lz4VyVL
	G6zeVM42dGFZWbG49V93vWBLZle8TVqfHZ2y9qTwaXdPJjWUbNswTI4IruJyJWplvDAcAVC56iH
	NKsdvYXK6NBOOjXnYbl5S06+IyhNSukZ01fzuKzngSZyezouV6IsAVZlCYYxquSA==
X-Received: by 2002:a05:6122:4f98:b0:5ea:c722:b3a with SMTP id 71dfb90a1353d-5ee1c3b5490mr777640e0c.7.1794406143341;
        Wed, 11 Nov 2026 06:09:03 -0800 (PST)
X-Received: by 2002:a05:6122:4f98:b0:5ea:c722:b3a with SMTP id 71dfb90a1353d-5ee1c3b5490mr777546e0c.7.1794406142456;
        Wed, 11 Nov 2026 06:09:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157bb87c6sm972630e87.78.2026.11.11.06.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:09:01 -0800 (PST)
Date: Wed, 11 Nov 2026 16:08:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: naidu nama <naidu.nama@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, mani@kernel.org,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com, sean@poorly.run,
        marijn.suijten@somainline.org, irlied@gmail.com, simona@ffwll.ch,
        Saurabh Anand <saurabh.anand@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        quic_riteshk@quicinc.com, quic_vproddut@quicinc.com,
        quic_mkuntuma@quicinc.com, mahadevan.p@oss.qualcomm.com
Subject: Re: [PATCH v2 3/3] drm/msm/dp: continue link training downgrade when
 cable is still plugged
Message-ID: <x74bp2hkm4r2qz7oelhwpgexd3tslsxgc67pu22kmlo5yjy33z@v5ka23e5aqqi>
References: <20261111104434.2222182-1-naidu.nama@oss.qualcomm.com>
 <20261111104434.2222182-4-naidu.nama@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111104434.2222182-4-naidu.nama@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: vLjLM1mS4Qsd5Vm6UtPY8kcODS7GVqti
X-Authority-Analysis: v=2.4 cv=OYANnRTY c=1 sm=1 tr=0 ts=6af47700 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=uXSOaOdxFjozXxwA47UA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: vLjLM1mS4Qsd5Vm6UtPY8kcODS7GVqti
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX5qTxsg/UzeJV
 hYajZXERFrYoe8b+EPmGpFy5MjmNGqH6O5Mo3tMe5dC/AY1hWfc3HjH620CCpR+EiqpnGSqdNis
 IhJiE8sH/YnzVjZUdJndDdYlVriDLSBimR59TgsR9uPwS09XqqSbiSHjrju5wHy3wIl3hOzh7U1
 //8miUkMw/a+4xM0NNvzdn+MtMhozAj+AGSU0LtjZCPjM/UFRVcm0CEXNyRkAiDFO2XvLuF9pPJ
 sCF4//lwyf2OhT/rC44+ATmqAFbLp9Kr5qRD7L3uRSxMddvd/JkXAbB8+ALAoxRxjjNDRcfbBi7
 22+YBbBLRnshPDD6LWQRlggyiuS4QPswTvKmUDiBeNmEJExItjI4bZAq+c13DNMoIJM/Xys12rR
 uhERMbSxZQRW3OACL7JnlyguFDQ75IsjFc9HrHmUtJUhSnPYNheKdImkxrilUsp8/irJcKQxc/o
 XZO+z3hZEWKPvsBy4sA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX2rXgj1xdFk1u
 mSHeG62kS5otm5sIBytDfVKquRbrR0fTbUyMr74VV9kpA/aN/5tbknBhTCrFiELJQFPAdJvd8G2
 YdjTEoN1jdYHOkcZu7ZIMff4Oe4Bxqo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110056

On Wed, Nov 11, 2026 at 04:13:55PM +0530, naidu nama wrote:
> From: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
> 
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

Is there a reason to assume that DP is not plugged at this point? I
guess not. But the other issue is: what if the DP gets unplugged in the
middle of link training.

> 
> Signed-off-by: Saurabh Anand <saurabh.anand@oss.qualcomm.com>

SoB

> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 15 ++++++++-------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  4 ++--
>  drivers/gpu/drm/msm/dp/dp_display.c |  7 +++----
>  3 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 6b9d9a76ba05..f8a6bd7b0d10 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -2274,7 +2274,8 @@ void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl, enum msm_dp_stre
>  }
>  
>  static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl,
> -						struct msm_dp_panel *panel)
> +						struct msm_dp_panel *panel,
> +						bool plugged)

Can it ever be false here with your patch in place?

>  {
>  	int ret;
>  	unsigned long pixel_rate;
> @@ -2293,7 +2294,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
>  	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl, panel->stream_id);
>  	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl, panel);
>  
> -	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl, panel);
> +	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl, panel, plugged);
>  	if (ret) {
>  		DRM_ERROR("failed to enable DP link controller\n");
>  		return ret;
> @@ -2310,7 +2311,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
>  }
>  
>  void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl,
> -				     struct msm_dp_panel *panel)
> +				     struct msm_dp_panel *panel, bool plugged)
>  {
>  	struct msm_dp_ctrl_private *ctrl;
>  	u32 sink_request = 0x0;
> @@ -2325,7 +2326,7 @@ void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl,
>  
>  	if (sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
>  		drm_dbg_dp(ctrl->drm_dev, "PHY_TEST_PATTERN request\n");
> -		if (msm_dp_ctrl_process_phy_test_request(ctrl, panel)) {
> +		if (msm_dp_ctrl_process_phy_test_request(ctrl, panel, plugged)) {
>  			DRM_ERROR("process phy_test_req failed\n");
>  			return;
>  		}
> @@ -2377,7 +2378,7 @@ static bool msm_dp_ctrl_channel_eq_ok(struct msm_dp_ctrl_private *ctrl)
>  }
>  
>  int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
> -			struct msm_dp_panel *panel)
> +			struct msm_dp_panel *panel, bool plugged)
>  {
>  	int rc = 0;
>  	struct msm_dp_ctrl_private *ctrl;
> @@ -2427,7 +2428,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
>  			break;
>  		} else if (training_step == DP_TRAINING_1) {
>  			/* link train_1 failed */
> -			if (!msm_dp_aux_is_link_connected(ctrl->aux))
> +			if (!msm_dp_aux_is_link_connected(ctrl->aux) && !plugged)
>  				break;
>  
>  			drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
> @@ -2452,7 +2453,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
>  			}
>  		} else if (training_step == DP_TRAINING_2) {
>  			/* link train_2 failed */
> -			if (!msm_dp_aux_is_link_connected(ctrl->aux))
> +			if (!msm_dp_aux_is_link_connected(ctrl->aux) && !plugged)
>  				break;
>  
>  			drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index fc884038182f..3edf954cc805 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -17,7 +17,7 @@ struct msm_dp_ctrl {
>  struct phy;
>  
>  int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
> -			struct msm_dp_panel *panel);
> +			struct msm_dp_panel *panel, bool plugged);
>  int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel);
>  int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
>  				  struct msm_dp_panel *panel);
> @@ -28,7 +28,7 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
>  irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
>  			    struct msm_dp_panel *panel);
>  void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl,
> -				     struct msm_dp_panel *panel);
> +				     struct msm_dp_panel *panel, bool plugged);
>  struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev,
>  				    struct msm_dp_link *link,
>  				    struct drm_dp_aux *aux,
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 169938ba515e..551d2c63ef8e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -399,7 +399,7 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
>  
>  	drm_dbg_dp(dp->drm_dev, "%d\n", sink_request);
>  
> -	msm_dp_ctrl_handle_sink_request(dp->ctrl, dp->panel);
> +	msm_dp_ctrl_handle_sink_request(dp->ctrl, dp->panel, dp->plugged);
>  
>  	if (sink_request & DP_TEST_LINK_VIDEO_PATTERN)
>  		msm_dp_display_handle_video_request(dp);
> @@ -648,11 +648,10 @@ static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
>  	if (dp->link->sink_count == 0)
>  		return -ENOTCONN;
>  
> -	if (!msm_dp_display->power_on) {
> +	if (!msm_dp_display->power_on)
>  		msm_dp_display_host_phy_init(dp);
> -	}
>  
> -	rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel);
> +	rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel, dp->plugged);
>  	if (rc) {
>  		DRM_ERROR("Failed link training (rc=%d)\n", rc);
>  		// TODO: schedule drm_connector_set_link_status_property()
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
