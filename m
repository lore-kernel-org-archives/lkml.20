Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F345C4FDA72
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790698848; cv=none; b=fLWnBmMnenYZz5Kj3V0eNx4C4iMjembhY7DreS8Bg2ne//dm1p4iq4AvQA/JtFAPY4AjMKzZLjqSRr7FjtpFemABIlikpcGBOQ2qLecTLhpTyP2vzDgemAJaZ3GPO5wjba9LcuQOERGhxHjptqIivQh1Cegt2znlUH5zuSOZH2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790698848; c=relaxed/simple;
	bh=UgnqOcoiOyCjdaRUkGLaBTpYmnuZDli+Tq5pWs/wI/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MuOVAgMfxDbx7kPgiFn2CORlXIRtldvRy00p/WqDiCCumzJCA9MIAzeL49dpIbrEPnaumiMXe1YF2x5Bxf0XvYQT75uvjbmj6czW4TckFn1ajc0bcQebfnFto/vBNM99kXP3lKo0NsmsHwNWe94eJwwNgTWb+D7lbPYF3q41euo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S3aDfofh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JeFETyiy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S3aDfofh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JeFETyiy"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqoLC205448
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:20:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SKXSfs161kjW32HtCfejw+Tq
	SHrqUFuiYkbURsHolXo=; b=S3aDfofhAVbQ+GB7FUrhXjF6RxRCIGDQ6D2/Odio
	oyFv18xsM/esDMVZEl0CQyPaU3lY3I0fw3ovIxVSHQuBWTOLlnZ+/Sgi4bEKIVXs
	coIefEryno0zgmQEfkwH2Q5kTUs39mvd2sPhLhCHwDugO1Eort+VG5AcNF08CI82
	6iq16IA6dFCDJIb40bnjbyqEPaFoDhAOI7ZieAQvqFnLZ/Mn9558GO1ZsM7dvaDu
	47l49G+4SIT3wo91oL4dsAZvJCWWs9xuwVPRp0W/K5f4izgBgDskd0XBQn/ienM6
	QoUoQSju6bO+k0rbGsef5OLldobdmupE0Ud1KH7+NuAVrw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144v154-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:20:45 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-988d0a7e97eso1590241.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790698845; x=1791303645; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SKXSfs161kjW32HtCfejw+TqSHrqUFuiYkbURsHolXo=;
        b=JeFETyiydEyFiNXgHVAm1LVzwnscZgO0BKQpPev4pPbMhoUQbNV6jZMQUN+rNmv7gg
         1YZAQtV4O5c+ohrsoMmjE5Q+53SjdvF5wLFvKSf+A1RiEAhlgCU/U8KQlP9nDoasFGku
         mvIQKrZ+mrxOKGBhI6h6cEQlD/CbiY+cPojAT7KPEOFFdXlAFqjbmUqMjub9iLO5qeRl
         tOYFgBiqQ8iWvoph3YYlz4mo3av63l1meEdjNp935T8MtImS7kRayi3unb4xlHWnl8As
         50AideFuBjgrDi5EeH4ndhRQ4lYv7DlI47zRUoUZOxCG7ZpkklxAcpDv8CBEtf3DIzR6
         OK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790698845; x=1791303645;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKXSfs161kjW32HtCfejw+TqSHrqUFuiYkbURsHolXo=;
        b=TVODwMt3K4yhkpDwoXHmlo6naay6D1F/bsUGFscwlpARtj1hxIgjAMFIdd4+K/jf1E
         iv0Yed2e7ZBVi220KikcFvHaw1ZpCrCDFqnr9Jsksh14+Gn00AlCOIGH+FaLGyJh6MqT
         HxssqIjZv83J7abAfjfGcvIE6IJ1lQCWT1EN88HfWmzEx8k8zGwoWn+zZRF19gIhnnPT
         pbgwPLn3reAmvnQcBl88gJHucbxsuY0GvbN48mzqHVX4g6/YTmUlixt7/6fIqtl0Dutv
         NJ4WNUjGG97tMhykm2sGVFJqhYQblz/AtggrrhG4V2K3ddcxzrRVosQis18vEFOMZYmV
         UZ9g==
X-Forwarded-Encrypted: i=1; AKwUvBzNk8qh5vfMZCLGR2xWyVb2J9SkinUP/99l1cjbHGOI5VOnY52nuxYPA6oLFcbrNBZJ+GouFD8gat7XWso=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+oPVYCD5R8nM+KagG0SRiGkjykHQuRKyJOrOUDr0s5qdsBaBY
	RA0QARN6bviEnF6Gc43GwxjbmHkTKe3R+Nzqn4StF75YCinXuF/J2bNgc5ILvusb4kS36Fpko+r
	wgK/BBuTBLJVJ9Z1KpivopsiyxuO6c2k05kligYqrxk9Eqnl13aTWYb+RNjU8uK1kSkU=
X-Gm-Gg: AYBFou10edH0zDWJMvl5ccmp/pntBnq44gu+eZM9GdhXyLVY9nMylcSdyZNphfM7FrL
	lSDFji+sSp6z9jRYRK+QEIO2nIYmGhUzw8NgWXbIdBwpB5scbkKYhJUuxjp+fCN/14OYDIDER5T
	vkAWdDxtffrP8JEhSzpIGFXx77Bbl5eg8/p3j7cdnj2MznESkQoCySL/AnkLemlOYmY5MJ+hfZf
	5xmWGbrHE0w/Lk+65O6uSWoXvTk93Q5N+7zvRe+dzukArpXwbWW2PFfUbj96rosfiDQ8BTm+BX8
	VOp2iC1upHVSQ2/1m9mYONCRU8MsCUa8jE2sg7Q+MN205taICMdP9BaB+iH0qkl1UlYx82giKYp
	GieBCsDgCycq+WHLr4mrvuiJQfDU+q7gJt6NFZOGBNwXo+MDTuIGd+wtDGOuTKrJcIxEj6c+uPY
	xb7ab7QUFL0Jw7
X-Received: by 2002:a05:6102:8615:20b0:7a2:2f60:b9d1 with SMTP id ada2fe7eead31-7bc3c4a8df7mr5352137.6.1790698844656;
        Tue, 29 Sep 2026 09:20:44 -0700 (PDT)
X-Received: by 2002:a05:6102:8615:20b0:7a2:2f60:b9d1 with SMTP id ada2fe7eead31-7bc3c4a8df7mr5331137.6.1790698843874;
        Tue, 29 Sep 2026 09:20:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3b486489sm32770e87.54.2026.09.29.09.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:20:41 -0700 (PDT)
Date: Tue, 29 Sep 2026 19:20:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 4/6] drm/msm/dsi: Support dual panel use case with
 single CRTC
Message-ID: <jwlmzhhgpvbi47lt4biwn4razrvbf2rfi5uyyvfhjomzo7uqyh@ahf4ubqvegst>
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-4-c042266b9eeb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-sm8650-7-1-bonded-dsi-v5-4-c042266b9eeb@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2NSBTYWx0ZWRfX0mvBayPhFQZ3
 q55YKEOyw9e5kNAANii9kTrZSVRMK2yYy4TbffjJcELJ+vwfSVvWiqI7B/vEnk+pmP4azFTKsvA
 19Y2YZ2Utv7XQrLhqndGK/Jjcwo/kXJWPXoxdoHAM6T43zmUkIFbsE1PbPzt90N733S5NUONlJH
 qKLVFxtkY6Oz1+Uc4iOukHuYNk237N9T9KTUIqvJ4zVj+ix+ICzCwa0y55lS+kbCIpywtxbtL5C
 aP5ooA5vbij66v4M1PZYgldyxlfggFpflOV5oSji6og1HbKuuQfXhti6fSkV+lMYJUt1so5sREy
 ISBGbyi2++NewVGsn+2Pe9AlpToE4zd5AvPeXYhHGzolYpYr7zysjjhc4fzLibenM5hBzpmFyIp
 Kqbs2hc2p9xdyObVaylsPp/cNJUAdPOI5LpCAUCUJvH6CY1Ko5BbJgdrxoB9I38izSAf/gKFvWl
 wdjHM7smAmJ/PXE/vQg==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abbe55d cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=xngG1aiKzArpkGo9upMA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: M9NvBP-PDZnRJrrePemK4QBfM-nVQwfj
X-Proofpoint-GUID: M9NvBP-PDZnRJrrePemK4QBfM-nVQwfj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2NSBTYWx0ZWRfX/gAzeW9WmbqV
 LIYScm4bh7A7vzqqZnE+6QJuS8A+w3h8TrnO/DzHWV1aJCUAzOg4OV2qg2JDWtqwEoOh7iucu7D
 kRybAP4xfxb6L4dM2Z0IYrprxc11rvc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290065

On Mon, Jul 27, 2026 at 04:08:43PM +0800, Jun Nie wrote:
> Support a hardware configuration where two independent DSI panels are
> driven by a single, synchronous CRTC. This configuration uses a bonded
> DSI link to provide a unified vblank for both displays.
> 
> This allows application software to treat the two displays as a single,
> wide framebuffer with a synchronized refresh cycle, simplifying rendering
> logic for side-by-side panel arrangements.
> 
> At the DSI host level, the frame width for each link must be that of an
> individual panel. The driver therefore halves the CRTC's horizontal
> resolution before configuring the DSI host and any DSC encoders, ensuring
> each panel receives the correct half of the framebuffer.

I guess, the flag from the previous patch should be coming from the DT
node of the DSI host. The DSI should then get the mode from a single
panel and then set the adjusted_mode for the CRTC (note sure how this
will work for the compositors though).


Also please note that the are other possible configurations. For
example, for some time I've had a setup using two Raspberry panels
attached to two DSI hosts for exactly the same purpose (please check, I
think Neil might still have it, or maybe somebody else from the team).
Each channel is an I2C-controlled DSI-to-DPI bridge + a DPI panel. I
understand that it's not your target, but it's something to keep in
mind. I'd say, the bare minimum would be to resolve a second bridge (be
it a full bridge or a panel bridge), possibly create a second bridge
chain (remember, bridges don't support branching, so you are a bit on
your own here) and at least manually call the callbacks. This would
ensure that the second panel (or a second bridge) is properly controlled
(and thus would get rid of the second reset GPIO from your patches).

> The pic_width is used to calculated DSC parameter for DPU DSC controller
>  together with panel's parameter. While panel driver that support dual
> panel shall provide slice_width parameter of single panel. This patch
> only impact DSC configuration, so crtc is not aware of it and not impacted
> by it.
> 
> While the DSI panel driver should manage two panels togehter.
> 1. During probe, the driver finds the sibling dsi host via device tree
> phandle and register the 2nd panel to get another mipi_dsi_device.
> 2. Set dual_panel flag on both mipi_dsi_device.
> 3. Prepare DSC data per requirement from single panel.
> 4. All DSI commands should be send on every DSI link.

broadcasting of DSI commands is controlled by the DT flag.

> 5. Handle power supply for 2 panels in one shot, the same is true to
>    brightness.
> 6. From the CRTC's perspective, the two panels appear as one wide display.
>    The driver exposes a DRM mode where the horizontal timings (hdisplay,
>    hsync_start, etc.) are doubled, while the vertical timings remain those
>    of a single panel. Because 2 panels are expected to be mounted in
>    left/right position.
> 
> To maintain synchronization, both DSI links are configured to share a
> single clock source, with the DSI1 controller using the clock provided
> to DSI0 as below.
> 
> &mdss_dsi1 {
>    assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
> 		     <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
>    assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
> }
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index e39938fb0f502..a3c56c3dc7904 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -186,6 +186,7 @@ struct msm_dsi_host {
>  	bool registered;
>  	bool power_on;
>  	bool enabled;
> +	bool is_dual_panel;
>  	int irq;
>  };
>  
> @@ -1024,7 +1025,10 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  			return;
>  		}
>  
> -		dsc->pic_width = mode->hdisplay;
> +		if (msm_host->is_dual_panel)
> +			dsc->pic_width = hdisplay;
> +		else
> +			dsc->pic_width = mode->hdisplay;
>  		dsc->pic_height = mode->vdisplay;
>  		DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
>  
> @@ -1705,6 +1709,7 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
>  	if (dsi->lanes > msm_host->num_data_lanes)
>  		return -EINVAL;
>  
> +	msm_host->is_dual_panel = dsi->dual_panel;
>  	msm_host->channel = dsi->channel;
>  	msm_host->lanes = dsi->lanes;
>  	msm_host->format = dsi->format;
> @@ -2600,6 +2605,9 @@ enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
>  	if (!msm_host->dsc)
>  		return MODE_OK;
>  
> +	if (msm_host->is_dual_panel)
> +		pic_width = mode->hdisplay / 2;
> +
>  	if (pic_width % dsc->slice_width) {
>  		pr_err("DSI: pic_width %d has to be multiple of slice %d\n",
>  		       pic_width, dsc->slice_width);
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
