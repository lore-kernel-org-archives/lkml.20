Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215D8490BFF
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816524; cv=none; b=D6Q+pcVSnCyvPh+pyFU7gDvm62PXKIe91IHOF0xF5m1PcKocuX1P7xtfolUnzvhrhyqb9sBNK5nBFt2wFnUDnuDRkC0r9UTWh2xUO6lqMJ4WNtsuSeJ2vGHZfbZE2Qdyw3VNXqdUa7VL9UR52BMSwSNYjTPoEz6MqLhzHDNV8Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816524; c=relaxed/simple;
	bh=U91nMmj9tNHa2FZKXfLGH/dqChHGNbg9PKtfAeoX/xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxLjdxy+yJVem6sZ92mizSs529QnXzE753qf81dXaJ94Xdz5mwuY4q59fNxoa58Os6vq4tVRX9cUaU1cA677D+W+0mduzq8eCwEImgHdtaA++jpp17ZyeP11ajM5dXmkxvKl0sNjwvda/cwXyW8zpKeyENk2b0wgz+gwWKZNhHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=leQ3bD+g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E9IHtxYJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="leQ3bD+g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E9IHtxYJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0FCM1236317
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bpOndlgPfv1kdWQOBM72wFH+
	Lnf26uksnJykK9/Hdy0=; b=leQ3bD+g5c4VwVA6byRTH+0bNQu9f658P3LBrm0T
	OeuBlhUzGR7Ak7FXaNvBsYmbvOCx4iV/fyfr7g2TBld1Ih9q5tdgxeH4Zrof98pY
	yer49v/uHQp/PuurFmz/HVauIFCeyCmNVC/UZQ3jRqT09sGtEI58x+P2uRzRufva
	CR0Npj6JR4C31oqsUyLrqhqGA6FhBT4LJondzTSWoOOwl8JrTrYTSQW0CIP7++hE
	XC13s1ELe1gMVTM48x+eMKyN+20CrBsX1zL+ninXNBmkvBRSoQtSIfugCPaVBVI4
	ukHpmfzp7qGfeT6y8elgPZ7KAmFFIntQNJSm4G+aJvO6/Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6dkha3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:48:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917bab67568so68058706d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791816521; x=1792421321; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bpOndlgPfv1kdWQOBM72wFH+Lnf26uksnJykK9/Hdy0=;
        b=E9IHtxYJUcRriUfKi2SyIw77EPKPyEnykZsLXcgua1FL1FPfXz7PvLE6IVLYhevdrJ
         +7onnN2qQnKRNbH9EQ+7XoA321/4G/OIyoTrAFvm3TbYe8hPLXmVGyqeUWU2RSeco7Y0
         LmKUiVy24g0dCNIFRcXvMFTxmSVD0UhnRH23wT6dgVWmE5YtcRa2uMyLRw58yxAbynT/
         c4i3cNf9+RjoIfM867oCZQEykXqFweuhAbMAQsDBmcdF+jiTTVn/C87ujlmz0KeeTSAm
         UL5AY0o2xQDKDfTXe5g8KLkR6JKqFxNbDhZhBzFdIaeWeKfHwpRpwJjjBtSXhRIpVmgz
         fjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791816521; x=1792421321;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bpOndlgPfv1kdWQOBM72wFH+Lnf26uksnJykK9/Hdy0=;
        b=1RcJPDjpC1Ntgg/Pj6Sz18gBd6dAY4544MiUn3jjZviLJuu9WNPlpHwl5ONYjrSG6w
         4CZA7QSqveodXAiRvlj0k+/uH5uLdZ0sk35Kr8yLzFlX2DMKdzyIIyc3r3nRfggnsu3x
         KnZzptM0b3+fOseXaOTuBgh6B+qrXTeURLZ08vQkihgpYeXsi2Jx0N/F3GD0lXr+mOE8
         OGs2ZNICcwRpWV/fZYP/RIfSCP6D+5BA2m3xx1F78suVnL6nWgvlW6JEg46An3T/UEc+
         XpgFSMSfCuwZmjPCEOSmnHNWpAgh7zdvCXtpuLq8hkhUUsMP5JmOhInlP/flThr/duMe
         bbpg==
X-Forwarded-Encrypted: i=1; AKwUvBxdjHpuSX9gjmdKTUODq+ABJ1YhdN+4WhOBleGbtUErOveXgyV8phXf8S79RpmG94fN3L2vR3LBXPfH/3o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPaYE7qrpcDRuQED2LesKHlVZB9yT5NlEVGR7oWB002CrvFpcq
	ETfHbAK9fL0qxke56uEg8jbfpX0uTnuLaMxNiQkEoEemJQRdTYUlJoiyHRyzZs6nSgmyfkQNl30
	iqzLGB2nYKwxCUi3RvZWDQxtmMY6qWTcAnE6GH1UcW0yAxc4gXCG6YDgw3k22PW9j9xc=
X-Gm-Gg: AYBFou3ZoTOzod0MbllNedALUDWMmIqLk5nujssi13rdQrHQr5LZlST6wG1MfCrfZv1
	iayXezfO5xxinlNmkJx76bhqf8GHLLYFJLF+a8O9G6P4cVE0TAqaqy/f/A9O+N7RFPgpowk1Z3R
	YnFP8FzJNVeKdg3k2YuWd2d/s3jTUgpqFFNeF116VEWFK8fV+fvNpremdLpGejlYl/QDjH+Rp4K
	exen8+gKyOL7YieWOi7Aw27HBXXfIzSE7RgQhy5BI93+7vAF6QXkkrHPPKmpwj4S41nav2QDA4M
	eRGTKIVXB4I6RfZRFCo2iCjgODDjkJNd7AZp9OzsAzni6aDYOIJ4wrHm0mFaz0S0s4XwWjJWYuw
	9xsG2GNbvIC0R/6G/d32ld7/fHYmTpmATFK78zXqkeF0E1/Yp3hCXj4r5aOzE52Yf5PgOwYOAZ6
	CAr/rz6wB6RSsW
X-Received: by 2002:a05:620a:4694:b0:93e:d1d0:67f with SMTP id af79cd13be357-93ed1d01a42mr1036815085a.51.1791816520920;
        Mon, 12 Oct 2026 07:48:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4694:b0:93e:d1d0:67f with SMTP id af79cd13be357-93ed1d01a42mr1036807885a.51.1791816520206;
        Mon, 12 Oct 2026 07:48:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3cc7689sm32134791fa.24.2026.10.12.07.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:48:38 -0700 (PDT)
Date: Mon, 12 Oct 2026 17:48:36 +0300
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
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dragon@radxa.com, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 18/20] drm/msm/dp: Signal BT.2020 RGB on DP and eDP
Message-ID: <kjt7k6nrlctvykvqrlvl7ftjeul6woarmjcotlvdasd4u5jb6k@oc246xwutq4h>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-18-1835d4966da3@radxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-msm-dp-hdr10-v2-18-1835d4966da3@radxa.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1OCBTYWx0ZWRfXx9lXtUKZSufl
 xfWA1TuBrx15Jx69UA3Khb4CISFy80gx2Heq5W3klSaaEZtrjTka63ZOoLkTYyHfG2e+Ofe90sg
 +9OMIRNNvlBHYh3Si7DKf+CUpDgX7oaCnXsaRe8eEFnYKvkrX+dKb0XtgbfXvUhaFCEhpS3IJof
 ShPlVejM3I4KPVINyGjXE5u2opywB7Bs+u2u32arvhguIJSMdEPmsrE+4SCpYwz5+iSc1t042i9
 C+v8tdGD7gfxxFj8VvBvi6/j9SPD9hULX72BjqXEaNkMbZuMz/udZOdn40mOvedXlSo/2S6Zw7M
 w4aC8bt+4v78yIbX7LPS0XcdjCHM5nUp9pV4a4TWNB44uJnTGksLhTC1WQezw/02gu7BaK4xTC6
 GGQPu5+2yp3G2RibSlAHNzDoi6ci3Et06OAqOzOhaO9Jgi7Gml+xq/t0oMCnYzmhR7u8rE8wkuG
 9afkkA/s1UsWgMty5Vw==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6accf349 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=ksxQWNrZAAAA:8
 a=EidWXHX74OIilm-ZvMoA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: EJw6fvNixiz2Zys1nm8I170R9MOzix8m
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1OCBTYWx0ZWRfX1hbO2L+dktS+
 cd4hYjzNF0aEbWpBKWUdIBmY4/Lxw6rsBq1ys9q7fPh9BNsPcxy0cKsLWV4Ohup3tO7Xy3ndJAF
 gcwY/PrGbEp6tDV9YuyWq27gHc/BVeA=
X-Proofpoint-ORIG-GUID: EJw6fvNixiz2Zys1nm8I170R9MOzix8m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120058

On Fri, Oct 09, 2026 at 11:16:10AM +0800, Xilin Wu wrote:
> Expose the standard DP Colorspace property with BT2020_RGB support and
> carry the selected colorspace in bridge atomic state. Force a modeset
> when it changes so the stream receives the corresponding VSC packet.
> 
> Signal full-range RGB to match the existing pixel path and retain CTA
> range for YUV420. Reject BT2020_RGB with a YUV420-only mode. Reuse the
> preceding VSC state, update and PSR handling for the new colorimetry.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c |  6 ++++--
>  drivers/gpu/drm/msm/dp/dp_drm.c     |  9 ++++++++-
>  drivers/gpu/drm/msm/dp/dp_drm.h     |  1 +
>  drivers/gpu/drm/msm/dp/dp_utils.c   | 12 ++++++++++++
>  drivers/gpu/drm/msm/dp/dp_utils.h   |  3 +++
>  6 files changed, 29 insertions(+), 4 deletions(-)
> 
> @@ -456,11 +456,18 @@ struct drm_connector *msm_dp_drm_connector_init(struct msm_dp *msm_dp_display,
>  					    struct drm_encoder *encoder)
>  {
>  	struct drm_connector *connector = NULL;
> +	int ret;
>  
>  	connector = drm_bridge_connector_init(msm_dp_display->drm_dev, encoder);
>  	if (IS_ERR(connector))
>  		return connector;
>  
> +	ret = drm_mode_create_dp_colorspace_property(connector,
> +						     BIT(DRM_MODE_COLORIMETRY_BT2020_RGB));

Don't we also need BIT(DP_COLORIMETRY_DEFAULT) here?

> +	if (ret)
> +		return ERR_PTR(ret);
> +	drm_connector_attach_colorspace_property(connector);
> +
>  	if (!msm_dp_display->is_edp)
>  		drm_connector_attach_dp_subconnector_property(connector);
>  

-- 
With best wishes
Dmitry
