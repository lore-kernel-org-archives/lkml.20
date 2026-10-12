Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2A842DA3D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808810; cv=none; b=g51edELVwafgz/Ma8A6zIAgEUCNYZDN1sQ47xK6Rv6m1+GTab5r/+9hS9ZFFcDJR+4V+Zc954eUe2NmvMZsDUgNoMwed2DY4aSiw6Bmoo+VUNRk+cfHO09imZCy0vVCtrbNSfQnzJMu4aVwLL9c+9enifzML5l8qqRmb6snJ2xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808810; c=relaxed/simple;
	bh=Bsh7M2zUPNuGiyuSTf7nyrw460zsO4xhYjEIMRWMS3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mr6KopJfv585YAUyQuad3MCOtartdYJSkeraepIKrgShEybrvaxmPgBjwp7ZOxFy0+z1vVpmR4k8AggouxoYBOXAIM69vAp4azWHIFBE7PQjTd1n/7ux7jI3WaSFwLHPY7uV5IcCa88GASa9jXVIH4DLpCZoxREZovCT35smsPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ByZxy/6J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EdLXfIwR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ByZxy/6J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EdLXfIwR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC05qm2786871
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sxiNADN34Bn3hCov2PhV3feq
	5avacxCrZr/2GuhWpv0=; b=ByZxy/6Js4fHnxneBjxYjCUubPTr79h1A+yP9Pzg
	x8aFZntUDX7xs7KWuK222xsvzmdMQfW+qUbHbQ7CWDCsD1VH4BqX5WJCwW4xbRa9
	tzn64/nsBHpz5T+kfovaDhZhfWmnb992bOu5BpFDyZbKnhFVj8IJdefp+0Kcgqbe
	ffMAraZ80Ib8x+iVMtSeUsM2A8yi5PBa+TzUgUCvCku8Tyx9LeNck9+lHyAooxgq
	2+xteOC7CZgqVi2OYDRFgDASD1WeMIIunxutO27PxlL0FkDEKnruNp3WohNT0D1b
	YCSARZkUwmRC1pugGI3OSCp1uh5waA3k+EK7fw/7ENANUw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wffgq00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:40:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa34873bso388740685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791808807; x=1792413607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sxiNADN34Bn3hCov2PhV3feq5avacxCrZr/2GuhWpv0=;
        b=EdLXfIwRqG+BoT2sZgbmTm8izgfGAqcdrviNPkd8ZwAgllRqynOEJs30VvMc+KjKpS
         1TW57kEWyFDFpjOBfkeDwZhZp+9BEXhVSOoGS5AQVSxcmzFdyuJ/UbkJjvvLB7/D26GE
         Y7AfxRqSYwaTXqxkxk5nmxzRb8P+1hXZdi9Sc8vP/toJ+YKZVGZU5eYpsUK8ZKm2IiEy
         rxy2k/okza1XcOZWi1I/hs5hRagPjxrC/LskH/EYo7SevXrACTp8z1ceig2JMWI1Tfjx
         jZRZvlxol85VF8mAjk7tdu0lcM/Sl4OC0pU2wRIDaBuQIMqe90Zh3phR3pKCjlmDPnOQ
         5FUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791808807; x=1792413607;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sxiNADN34Bn3hCov2PhV3feq5avacxCrZr/2GuhWpv0=;
        b=XnvC3pFewi/loLpAnpcWO0D9kYdBoQF5sBZK2K/KwwymZVcElAlL1Bct30PFwE/iaO
         5MWYTmVHxzHC3Y4l3DuSwvqcyGDPDKVj38F7ukElk9BM0lp6FNX4gEYy6iFA999r1TON
         D5kBW+iYinBiP+CYUD0GLCmhKwhbroUW2YLi0jB54lyEan6QqvLv1w7WWDf1xLWeRBWC
         qNXkBMyox9/0OZ2x2IoEwZm3UGzROnCgGTz+zDzltnCzbB9n3Kd+XN8r5g8BSfGoKDnN
         XKfOFPU3JDnH4ZfpfvcQHwjN6JvnQtffJU/qPsX5y9LC8MwWYt0knCqZlRZ6dKOnG+3i
         E8Rg==
X-Forwarded-Encrypted: i=1; AKwUvBzTadHyZmQRzf9zmD/x8KqvLaFAuwHStAoOQp44sk1L34qluwQC6vwNd2wsKqFnHkDRaYlJJsU+GwgQ5vQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9PtS30UdsmLXn7yHL72QiVnN3QBOoF9KcHlBPxrqOy/d7gS+m
	4MxwSL0AEgVo9AnuUl4sJUOopZLU3MSO09YkOwVHzx93F8z2bBE+X6uwwPLIDj1e6gKpLZnRCAG
	94ep5WZJh4g1ypk/vU1LIYRlxRoxrEL4cZGVCF97f+hge6mRzvf8LubVaROyWOWxvkyg=
X-Gm-Gg: AYBFou2RprpEvwXWvz/+O0gFKL2aEa0iEzfkf+AtYWZKSTe7bCfEM7xRqIa3AJ1ubMO
	U1NOYC4K6cQV71o/3IZiLoMzQFMLhQMBZil5y9DHOoAU0LptzSWIS8L3/rzV0SMv3BxCODsDpVU
	KX1rLQnKexJqGe6Sqytms3HZULbFkbE50ssD9oYqmJsQ8XHQqlbc+TFqYWKZcsQhV6zla6Y4kn9
	DBA8ZxZ8qjidVWIMXH3hYDoeOnQhZePB60jTtbglurNMkpTd+5vliNqfJbuL8bGMD4INb52cTmJ
	UhugYOF38JmZy250uZxExAhtIOx2ECw4Y9B4hS2Ig+JNYw2pzG7AM4+W3lvbGdNLeJY4aA4+nqp
	HY9gC7LF7xs+MFqoTl5n6j+NgT0iGHyM9WMn8EmJRU4VEbVvNGiRm8RylA+tKa6073JKJsQbMeM
	vLhfdAHFP6kSET
X-Received: by 2002:a05:620a:2719:b0:93e:c12c:9b6c with SMTP id af79cd13be357-93ec12c9f75mr1287528485a.71.1791808807240;
        Mon, 12 Oct 2026 05:40:07 -0700 (PDT)
X-Received: by 2002:a05:620a:2719:b0:93e:c12c:9b6c with SMTP id af79cd13be357-93ec12c9f75mr1287525785a.71.1791808806759;
        Mon, 12 Oct 2026 05:40:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddeb5136sm2762212e87.61.2026.10.12.05.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:40:04 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:40:02 +0300
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
Subject: Re: [PATCH v2 03/20] drm/bridge-connector: Attach max bpc for
 non-HDMI bridges
Message-ID: <hh2nn5eazfxpulmtvrugkjujhsspf7wlr64a65smmzxtlb53ml@6wynyytdaued>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-3-1835d4966da3@radxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-msm-dp-hdr10-v2-3-1835d4966da3@radxa.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MCBTYWx0ZWRfX81778QOqoDGh
 H5zU+ry0u27iI+72W0UBLieMHoPnvQbqEOpL2AblZ0Q5CCUq/ppoz9MjDCTRhJg0+9CTrHGN1xO
 D9baakJRyWMktGKaKk7bMa1WK1DwZafQKrqu8yyh3mtCbOTVQUowLcDnZ3KW2RTEqDsrYokDRms
 ggOrVJDNz0mkAxN7S+s71lVAs/1vRbwZNrh6/JI2VYxo9z03VQqkKZ2UmAd7WSh2qkX+Qia6rIQ
 NMea3P1Yi0CW5akzAnfYQr0YcO4Uej+25m0aOtKcGgu+EoJEzUh0+gBjYfcI3Cxaeg+IhKKbZ7q
 R6/74tluN/RmGuHJm2sLAPTFpZuD5E+bb7bjNaMeXAQIgumK4Lu9kI294GdJTp5yFaETRM/BqEj
 +R2HagfPYkmIA/Ownye580EvLwJSYcd0jo/kAFW3COFWX63F9JDBiQDpVnZKlipqrg436WcipFh
 nymouFRC1dzKyI6k2sg==
X-Proofpoint-GUID: hhfSYZv-YqkEFRriyFzSHwtV5yQCFgFT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MCBTYWx0ZWRfXxCCnFz/86GCs
 LFMN4b6qKPAOdqFAB0aqCouv9uQvDnD6IFTiffaJbcpgxe6WjCn42TbBZOwMj0103PY6QmGmVYS
 MEzubaYs2/SmXkv9oD5EFyucRpt/9OI=
X-Authority-Analysis: v=2.4 cv=ZcWIpcVA c=1 sm=1 tr=0 ts=6accd528 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=ksxQWNrZAAAA:8
 a=4AZdoXe02SclfKkZrKEA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: hhfSYZv-YqkEFRriyFzSHwtV5yQCFgFT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120050

On Fri, Oct 09, 2026 at 11:15:55AM +0800, Xilin Wu wrote:
> Allow non-HDMI bridges to advertise their output bit-depth limit through
> max_bpc. Attach the max bpc property when the lowest reported limit in the
> chain exceeds 8, ignoring bridges that do not report a limit. This lets
> DP drivers expose deep-color support without attaching the property in
> their connector initialization code.
> 
> Use a lower bound of 6 for DP and eDP, which support 6 bpc RGB output, and
> 8 for other connector types. Keep the existing HDMI registration path.
> The property can be attached before connector state allocation; the
> atomic state helper initializes its default when state is created.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 18 ++++++++++++++++++
>  include/drm/drm_bridge.h                       | 11 ++++++++---
>  2 files changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index 8b54069fa53a..be2e08a3694a 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -825,6 +825,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  	struct drm_bridge *panel_bridge __free(drm_bridge_put) = NULL;
>  	unsigned int supported_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444);
>  	unsigned int max_bpc = 8;
> +	unsigned int chain_max_bpc = 0;

UINT_MAX?

>  	bool support_hdcp = false;
>  	int connector_type;
>  	int ret;
> @@ -985,6 +986,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  			panel_bridge = drm_bridge_get(bridge);
>  		}
>  
> +		if (bridge->max_bpc)
> +			chain_max_bpc = chain_max_bpc ?
> +				min(chain_max_bpc, bridge->max_bpc) : bridge->max_bpc;
> +
>  		if (bridge->support_hdcp)
>  			support_hdcp = true;
>  	}
> @@ -1026,6 +1031,19 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  					  connector_type, ddc);
>  		if (ret)
>  			return ERR_PTR(ret);
> +
> +		if (chain_max_bpc > 8) {
> +			unsigned int min_bpc = 8;
> +
> +			if (connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
> +			    connector_type == DRM_MODE_CONNECTOR_eDP)
> +				min_bpc = 6;

This opens a can of worms. Consider having host -> DP -> HDMI chain of
bridges. DP would support 6bpc. HDMI would not output 6bpc, but would
the chain be able to negotiate 6bpc, feed that to HDMI and let it output
8bpc? What is the resulting bpc?

> +
> +			ret = drm_connector_attach_max_bpc_property(connector, min_bpc,
> +								    chain_max_bpc);
> +			if (ret)
> +				return ERR_PTR(ret);
> +		}
>  	}
>  
>  	if (bridge_connector->bridge_hdmi_audio ||

-- 
With best wishes
Dmitry
