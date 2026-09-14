Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03982036E9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789347338; cv=none; b=bVM1cVs4rLjCqUgNj4Wf1euotFmuNRXVvfYyxTGnq3/a61rVERFsrEvE+1mGxraRCX5L9sQBwc2EbWim3DAljCYycWGTUPfTmIGzp3X2RSQVHsuyh9Uk9nm1eyPHy4keEGFFIet7nrr+GkM42qpgr0KmlwN14JlDKNAYXDp+gY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789347338; c=relaxed/simple;
	bh=cP/1SR5rtgSSMX0d/wxHIKQxCymUglh7Mycq699WPvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EY1K/+DR9RYZdVn/Y957mGIRzqM/kdVUE9qXGRrwtapCXi1YW56jh5u3vhOQYX1TcHM8cw4KXrCXnrDEFuydIXgh5SrFsAFJtNa5CY56Undv9s3xtZS1OKnjvHdY4jyd6VM19ph3huYINBXpJYVbEGSG3Mf5K7C4CX2I8hCWdCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DKJDLfnd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NCsqsAhe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DKJDLfnd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NCsqsAhe"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E069xR2659932
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Eqj8O5+j4nR4tTJICXutRdTQ
	r7vbmzRL35wvcRkWqos=; b=DKJDLfndDxEy2z35J22zfTEJ/MJVWwmdNtS49hZm
	Ijfk0rbkYGnHvfhb8yQcnRBTrZp9t7w+mtPx9rkoGWvMsLPthFeYR6BJWlPAy1iO
	gOGJAhX1xd7uk3wU//w2fkj8Ai/l2dZU9g+Ogn33nFXn+37wlishZF/DRC2NyrNj
	7TK5vxKchROt+LAJzb7XZJVEgkQ3qvZQzhSlDx3ckRUxXwNE2vnQ9rRJMX5a2edY
	84Q3XQTeJ0N+T+nnT05fnMr3v+C7mfTLigKZEN0YmtP5g+XnthpVEs+7RfKbMFV6
	fcCl5fOgir6TaFISu1iLEzGNLKXbPDTp7tWcT+z4xoa4ow==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd4gqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:55:35 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78fb21aaad9so2542529137.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789347334; x=1789952134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Eqj8O5+j4nR4tTJICXutRdTQr7vbmzRL35wvcRkWqos=;
        b=NCsqsAhe1uUhwCom/CUZF6y21WTbUCJovGMSVTmdpYlt8H/6UHhAfmp9WOG28FjR/R
         /YnS1oSRyC3C0PS6sFYavZSCJtOqOgxbQsOG+rU3RNUZCshhjIAgM33Nl5owxwOaTixs
         nftH+MhSTFBBzBl74Ov7tTRGbFS+pz06IBVXWiMaZep/BeXPN3imwrymi80gqMk5J3BS
         FQLj+05yK5o4XDp2bDtEgQH9xjCFT+9HbmCefrqJ1WCJRRCCVoCOahC7t5Z/wEwi7nZw
         APVqPy6A5Z64fUxZsUWSLmeJscNIY9NPO37O3iz2lPpz2BnHz/zslUGLWKHF2Xvoxvmf
         7VcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789347334; x=1789952134;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eqj8O5+j4nR4tTJICXutRdTQr7vbmzRL35wvcRkWqos=;
        b=qGa15PqG5G/pvm+cXVqgMK1vLIOqw2dfxIVpFGb3zq3f5mwDK2THid0/gP9jqInz1c
         PWjPCZ5bwCaoS9Kwv8xvnaAyEZs9IvP7V9yJCJIWmmhqQMU28Rt5TTn8XlqThS5avH1f
         Yc+UyGuerxddk4lmo8b2Ne7zhFyjM2WYFCgRuhm1PQXxTtNMHk04ObbAUU+T0DRNCVfl
         0bDzzniuypU+aidUN+vzCrkdnpGoSI116mboYDEuXGUBjCCizKDK6FerHVzfMz8pwmyN
         ocENtIp8onqeGmQrK3nId2QtiAneA+varggVCrY8pG86LlLDo1eIFxNMl4KnxGWrziNR
         7Psg==
X-Forwarded-Encrypted: i=1; AKwUvBzG8vElvH7xiOZWZK0kSj1rnexXzowDWlDp7x9vKbXKHVjfX3nKmZtorZ4av/bktQCQjSFxze+tUHcZL8c=@vger.kernel.org
X-Gm-Message-State: AFuF++mqFh+hV9gkVZncNaAABkcy/mrnjX5d92Fypt4E6rzXZO8IQ35W
	ljEyfH4yduIHrLStv3But9I4yt5GuhXpYGNRjynraO1Q8jefLnfyAj1nhPd7hxR0ajK3iaKQUkW
	nblP0r0AY4Qe7Lo7+dPdhH7DeuT44kHvETLyd1341b+whWp4pPlQnlyDCByLGePGDndY=
X-Gm-Gg: AYBFou3g3PPNtHRmU714jPh2g5OdNJY0GRzyghvGZcDTaQSW3YqksjLpofdisaVReIo
	KOIwxc0F0TnR94WFL/aMgF42laMtw/eVqsZbFH9N/e6tJ6c+kaYSwQdDPRXzmKCyW0uVFzwVw0P
	SjEIM+pJjii1MnmAr0YsWFB//s5HcZXPASAo4GUBd4etkd9yjPcwfoxYPWywEcxpsmrCspb5xlJ
	8xUZUlJXcFGqojuA5L7Dz77eMgov4H7Xnpf8JlWykKQhZb30iySMgck3zaSDVQtx5pZGnn+Iv7k
	yaulBOgwCIB5UtSIx4Q1NxI6rSJF1dxGiyrntQHtd7KISJnJb+KxXBhDDVxKA0Ee0gndksqrXdB
	p1JMjzXVGH+2OO24G9D5XZXi0jICQZnPVPPNsNaW0teuSRxDOM0QhUT0bz878mFGExjtDRqyvDd
	9t40lAfw+EdoCU
X-Received: by 2002:a05:6102:5f0c:b0:791:d32:d2c5 with SMTP id ada2fe7eead31-7988f56307dmr1409694137.3.1789347334005;
        Sun, 13 Sep 2026 17:55:34 -0700 (PDT)
X-Received: by 2002:a05:6102:5f0c:b0:791:d32:d2c5 with SMTP id ada2fe7eead31-7988f56307dmr1409680137.3.1789347333625;
        Sun, 13 Sep 2026 17:55:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0456fecsm2054227e87.24.2026.09.13.17.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:55:32 -0700 (PDT)
Date: Mon, 14 Sep 2026 03:55:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v4 2/7] drm/msm/hdmi: Handle msm_hdmi_power_on() errors
 during .atomic_pre_enable()
Message-ID: <s365obqnzubh46l766wcw5hd7bbbictenj67hm5taarqssrngl@bjk3gebiamk5>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
 <20260911-drm-msm-hdmi-fixes-before-eliza-v4-2-87bdb9f1987f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-2-87bdb9f1987f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa74607 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Zn5m-JxrSwsgyg9zXDUA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAwOCBTYWx0ZWRfXznypfYt5LuI/
 YDMT6lzJyDcIheToWXqVUKf8jXdcaN51QuaJkMNnQ/zkm8kO54U83YLz3OxyOkxYFPjbfQ3RC2o
 /bt+PzS8aZw34k9bE+R/yEHsiWRPakX+OIR5/zowvdxCVrC/Krg3zy57cyiUEqNaW7s/3zOBG34
 BYiuAd+foNTaqeV7pKbCHmLPDnxNbNxtueBU5zXujm8IDBlALzCstnJJLMByTnfOrYBjjX9gh8Z
 HduvLsrcy8bLsv2AvKBPk/ROkXe+zp+VD0W1za3tnSQzfxa+PzdhwM12iS5AW5WOgSWJMVasnhM
 THsSfxsrseOGD/2u/W8wtf2kux0X/mNkOum+qVfGAsYg3rl50fPWBA5R3a2sQnhWHRYqAdYZK7X
 +xbC7jtSBJWbdX/Xta9bqK3sl1sHDiugis2pO1HfT3vv8QvDTJtyWoC0PgGIyg00oxws9qwyipW
 uo1txxBrW4VPQTswF/w==
X-Proofpoint-ORIG-GUID: VxqVhcdxrmQCRT9CJG1rHVPVnEwWlvf7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAwOCBTYWx0ZWRfX7UJMDlwfVUrp
 Wmc8hM/WFTQOcGWVL4QdmRpk0xRjnnkQk3nR39ysZsOB+lwixoGx5jGGx5SBVupTPZ6ioHFfKVl
 eCmuyZVLWbbmPuZXmkHx/EPa+ckinl0=
X-Proofpoint-GUID: VxqVhcdxrmQCRT9CJG1rHVPVnEwWlvf7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_08,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140008

On Fri, Sep 11, 2026 at 12:29:35PM +0200, Krzysztof Kozlowski wrote:
> Properly handle power up failures during .atomic_pre_enable() by
> aborting the .atomic_pre_enable() to avoid accessing registers why
> blocks did not bring up.  Otherwise this could lead to imprecise aborts
> when accessing MMIO while entire power domain is off.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: ba3d7bf3a7ab ("drm/msm/hdmi: Convert PHY files according to new design")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 30 +++++++++++++++++++++---------
>  1 file changed, 21 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> index 157f19bd90b4..db85400e574e 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> @@ -13,14 +13,16 @@
>  #include "msm_kms.h"
>  #include "hdmi.h"
>  
> -static void msm_hdmi_power_on(struct drm_bridge *bridge)
> +static int msm_hdmi_power_on(struct drm_bridge *bridge)
>  {
>  	struct drm_device *dev = bridge->dev;
>  	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
>  	struct hdmi *hdmi = hdmi_bridge->hdmi;
>  	int ret;
>  
> -	pm_runtime_resume_and_get(&hdmi->pdev->dev);
> +	ret = pm_runtime_resume_and_get(&hdmi->pdev->dev);
> +	if (ret)
> +		return ret;
>  
>  	if (hdmi->extp_clk) {
>  		DBG("pixclock: %lu", hdmi->pixclock);
> @@ -29,9 +31,14 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
>  			DRM_DEV_ERROR(dev->dev, "failed to set extp clk rate: %d\n", ret);
>  
>  		ret = clk_prepare_enable(hdmi->extp_clk);
> -		if (ret)
> +		if (ret) {
>  			DRM_DEV_ERROR(dev->dev, "failed to enable extp clk: %d\n", ret);
> +			pm_runtime_put(&hdmi->pdev->dev);
> +			return ret;
> +		}
>  	}
> +
> +	return 0;
>  }
>  
>  static void power_off(struct drm_bridge *bridge)
> @@ -287,13 +294,18 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>  
>  	msm_hdmi_set_timings(hdmi, &crtc_state->adjusted_mode);
>  
> -	mutex_lock(&hdmi->state_mutex);
> -	if (!hdmi->power_on) {
> -		msm_hdmi_phy_resource_enable(phy);
> -		msm_hdmi_power_on(bridge);
> -		hdmi->power_on = true;
> +	scoped_guard(mutex, &hdmi->state_mutex) {
> +		if (!hdmi->power_on) {

Thinking about it... Why would it be power_on here? I think the if() is
redundant.

> +			if (msm_hdmi_phy_resource_enable(phy))
> +				return;
> +
> +			if (msm_hdmi_power_on(bridge)) {
> +				msm_hdmi_phy_resource_disable(phy);
> +				return;
> +			}
> +			hdmi->power_on = true;
> +		}
>  	}
> -	mutex_unlock(&hdmi->state_mutex);
>  
>  	if (connector->display_info.is_hdmi)
>  		msm_hdmi_audio_update(hdmi);
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
