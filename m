Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48810390212
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789339692; cv=none; b=XhLjPvrku7t5ejWdy0zy+emuZz+/2DYhFU2RsWNr7gmtowarXIJZdCyoXrFuHWDQS6ESCI4bWKdgP8QnNXrbBX0bmr5QnHkEaRo/fwBRkQ5hylinL7S/xHJQ0Zfffb1fbTM/V9UYHQZuAITYYWHlDeSwpBq2bNMTNpJdMK+5fUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789339692; c=relaxed/simple;
	bh=58OgDlTMM2M00oxH9nm1BTrz7jrOAurzgvEz8WXteGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tdDgMKb1HHq1p0CMTXOCQf8rK23On4cDCPyapVV2XzbZLWKP8GVZzAxK3e3yG04k4iNq85/C0der/WtIw61seraU4KVJy9B9O5F+2FadyeslB+uBYU9l9TYbMcNHh5fQGOQNYNPXudsy8O2sbXGsTgIPVdilmvlzcG6IqfyNK2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lz5rRZ5D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MzYtkcAU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lz5rRZ5D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MzYtkcAU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DLCA8W2995707
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UClHT6BNKVMxCVVP0I8xuLd0
	OwsPHW+1D4sWw1kmvxQ=; b=Lz5rRZ5Dd5AzE7gS0Jn9i3iiurCBGSRCfwyVxN/g
	CxZYWhCMqwH3WEWRWsr/9uW+6pJ9MwFZb3iRAQSKiIuNnIE2VAjRUWM8Q0M3vv0J
	UgBygzx9XcUaRiUNUBjGhevVG1QjUP+0p4TC63tUSLCDFELTIKRf7KBiSHqA6Y/e
	YTrL2kETJ49NWMqTzuj8+wU066KHimFTtfGPlxt9pSj3RezT+r7IsawXHoXr79H1
	LRcSmuTCSqQIAuB7ZRdLuov64jdsrXKEZpiU0dly+V87iBqXPFztBBgi+zOkQIur
	CD80ex1IaAos6ScioZ40A4Aqwi9A6gTUs2V7XXEzx50GUg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hsr4ex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:48:09 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c82c2e9761so604028e0c.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789339689; x=1789944489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UClHT6BNKVMxCVVP0I8xuLd0OwsPHW+1D4sWw1kmvxQ=;
        b=MzYtkcAUDHxaj1finVz9ID7OJMqNTpnstWER0Sc2l8hNkjQoRPliMCAHssoTZf62En
         1cjglcgw9/9x7KA69Nzbv4PZ7sU5YoOgLMu40Lb2ri6jjLkFpKNnIjLv7D2HKi6oeQGI
         v+VtSGIxV8WkxBZB5j5ahXa8LCn2SilccywlBSQMc6YtR8EAKJzp/pmeEYjG4HWHzxfP
         jRZfr0MJBFhILto2JZfS+jxmnYF5uPhIFL3Ag8wT1I1Kfyx5nsI5M7+yixeKPTwDk/fq
         i7Y+ufGU1NFLNZj3HJINqOdb/glTTGlfUZU/wHncqwzXo9nfE+unCv9sE/y7YZmosgE8
         GwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789339689; x=1789944489;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UClHT6BNKVMxCVVP0I8xuLd0OwsPHW+1D4sWw1kmvxQ=;
        b=Vu7J6l3tTAYw/HdZ4jJy3t0IypcDIs/B2LWvyc47EJX5qDd+5T/EnOzUYRPj64sN7j
         b11qVk7bTcw1UStmHEXhRW4Nwl10yBEbutJDjGIJ+UNSvbfhJ2SR6AuPPwBKpcAbzGay
         mPHIs+5jGDUyNUwqLq0klQZWnkuUmXhlHPCTBg/e3z8vqDFjK/wMWkY3Xo7qZP3Db3u5
         JMM7kmcpoKveYdGO5FsrYylUnWWpUeU+O3PyTVx3arv/XDDawfMi1fLEYxb0bN+Gpp86
         JcsZgWaPfZcWCEFhqG6OCMKpQi/dK9ZgsonwP3g+3l7W43pIjOsqsNM0eZF7Ctg1bqoQ
         kgdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKrBpyO2vZAntHd3MwWS39DwCf4VVaUewXoCm7MfOi78IopYg3kq9BO7QTSd3Fj0yE+Y3LrGIbPfRRKHQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l3jhZR1Y1gXOkuWknQclpCmWPXo0qsPGbjdN5HUnsNUsBGjL9e
	NKuFEZn6umiWRbu3egHDcv61Da/4nUXL2OfzWga8HqYr2G9K2wGXqr1zUrWLOzBd3gw84Rh2gNp
	ovcGD3lFkRW7fJ/wF4ZCuYrlW/GUJCCyFf1TAr4rupEUcujtcawZyQOyt3u4dzGsJtIw=
X-Gm-Gg: AYBFou0mBy+RtziNYchrGDuNEidRSu/P54xisr88DA6kS9Xyo1Wxrn9HWpiI1Hgye/1
	cUXDlM0kz/Llnm9QhnIHL9r7x28P/IlYfDISHtcfv511d4sGcQy/u8QPyYUzbMCgKXBhwsZ7i7S
	YuK7EVzBeHXvbrQk4wRMXccmzYSp4MbNB5CKrXfmjKBb442Q22yoRNR5thzG4VdX8toYHfnlo2m
	OHm9oxNx2gQ0Kc9ZSLHJ6CjjZQ+xQMob6w0kAL6lgBbtbwJSapTmPzEWPRJggaCG3mTINDLDqO1
	B5o7o2e1bh9Zvjid4WvfkClyzNS3kpIWbApGfQf3Sk0MW8JKRcgSsjlEZWRYJ2FgVFjxWLHwOCJ
	YYaWb3l9G0GFBw92JjoaEHxazkTPWx9mJoWTZ9ZL7HjkmlmEbmHn+v6ipGGIqVXCm2T+yhY5bR5
	WquxR7YqNzZ6Qe
X-Received: by 2002:a05:6102:554a:b0:784:d83f:2a59 with SMTP id ada2fe7eead31-795aad394c0mr5074052137.9.1789339688793;
        Sun, 13 Sep 2026 15:48:08 -0700 (PDT)
X-Received: by 2002:a05:6102:554a:b0:784:d83f:2a59 with SMTP id ada2fe7eead31-795aad394c0mr5074036137.9.1789339688314;
        Sun, 13 Sep 2026 15:48:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a3144a4esm22118731fa.0.2026.09.13.15.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 15:48:07 -0700 (PDT)
Date: Mon, 14 Sep 2026 01:48:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Archit Taneja <architt@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/hdmi_phy: fix runtime PM cleanup on probe failure
Message-ID: <rwzplkleui7i334kfsaort2iqgqwvg6pesk7xm3v272zupgmae@7whuqr2rk7if>
References: <20260913085814.1509352-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913085814.1509352-1-lgs201920130244@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMyNiBTYWx0ZWRfX4pukRaOdUs9w
 2YEeTDGVeiiEDdgjPtxDz41jVqBTthuoD0Mz7Wt7Z9v3XL8gTk25tMVkSkJPSKKxZTCLq4VG6N4
 y/s55KKwinobVIIuoRVyb0aZLt/fgUfFicq3YMjNgzUQaZZB2ZzLHZoBFOeqb7E4OQEZihNp/od
 h4+NcHgJREjf7Kjvfr6U6sxDcHjXsleXxW7SCkfisbVh/+R70UG9PNKJUC8eNR5Dn5zOBXH9hHN
 6L9Zw7X4E/NG8quJcRzusFRMabtdtq5hh/ZiIeHM56YzOwKzuCAjJgOVsMkweo+maef8Rtfdy7s
 72AM59+BxaMUax+y0BFEINvSr4J7kJ0rbO1VYHND21GMps1BHI0ALNbax7nzELyaarwApGSwPaY
 VbWTiBGkA/G39MZz8EuiDnpjG5yJ9yIkkPLRnlXvGTAzk5tKHpGYP/Zo7uwWLPed6RpHmLV64za
 Z50Igr2MxSi8NIrKZgA==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa72829 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=eqkjudQgZ73XcBGNVqcA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: brfjKCxgMhfgnZBz7CpF1M9u_ZNmT-nd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMyNiBTYWx0ZWRfX7ONMegDkKoru
 NnltcVtRK88h+2bJ0CSLis55DIRJ1izp9ZNy3hEpYIj1g2SEPtxCSd+Hu1cGZbpzqCYudqey1VJ
 aQI0j5VMtctuNK1+E2YQdc4+KfmXfYk=
X-Proofpoint-ORIG-GUID: brfjKCxgMhfgnZBz7CpF1M9u_ZNmT-nd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130326

On Sun, Sep 13, 2026 at 04:58:14PM +0800, Guangshuo Li wrote:
> msm_hdmi_phy_probe() enables runtime PM before enabling the PHY
> resources and initializing the PLL, but failures from either operation
> return without calling the matching pm_runtime_disable().
> 
> The remove path disables runtime PM, but it is not called when probe
> fails. As a result, runtime PM remains enabled after an unsuccessful
> probe.
> 
> Route failures after pm_runtime_enable() through a common error path
> and disable runtime PM before returning.
> 
> This issue was found by manual code inspection.
> 
> Fixes: 15b4a4523859 ("drm/msm/hdmi: Create a separate HDMI PHY driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_phy.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
