Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E178149503C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193690; cv=none; b=mnjiB3dmR7Nf2MRcB5Sv7UfgoBKNNZgAWQ+OOG/UrcJoeF35vryEJlq3MXdLWRNnbFub4mOsaFCEDNTaCAR3uJ5a2S7/PN6LDOUkU5xItHXmdJtwhe6UJyyCOcvke8t87V2UFmv+o7xiwhtGOYOoU1eVPIoyQs4lTIkpissTw0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193690; c=relaxed/simple;
	bh=8ZR3CLLp2qDqIr4K1Ck+jt3CdaBOGsYcfqYueSifaRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PzKSgYlMKW15V+5PVdsGOAcpLK6IgmhtktJ+Rqdzfj8yU9c/J43Rj0vLMXiHaztcvXSpVgAUtEfZ5IOL/+YvsnE9k4a3NXMWLjbnnSjWWHyMVU2zvG9Z75SRp0t4d3f1ZwzC0c7VvZqO+fx15hLhQX3FZKLx66tnkN5luulA+z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cQ84dMke; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dAkUOK5+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQ84dMke";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dAkUOK5+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFq9pO3397932
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LkJ9lxCTtDvdCe5fxVE9tsx5zXvwZAtV4NrQpN1u2Ac=; b=cQ84dMkegfNwZO1A
	ISmP5JBgwUNkXh0ttbyAra6M+RF9f0Uc90yO/hDqUO0c2UxfiuH5ypUOa87owTbv
	rfydUmufXVZHNTrHbGRBfRekOFe8SOKaEK+ZaD/lS2NRiTJciBAljC0qY7MWmv+U
	oioopqJICC7HZH4iBagwsw15YSppKiBxC4lKKxGE/ZKYOIUvuMrr+V9jqiev5h+p
	fzLKiKurVDfia9bRG60GS6bzwcl+q7ec9Oc0L9ipn/ZgL9UNLrKydHkfLnZrSrNC
	0krTSmUEiBuQssOB0oEg4M0oWDCk1JYcCvcLV515n3Cg5Sy2n5VeW+5NdDY41mwf
	kgR6Pg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6vcsvj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:28:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930bd2bfc45so122215285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788193687; x=1788798487; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkJ9lxCTtDvdCe5fxVE9tsx5zXvwZAtV4NrQpN1u2Ac=;
        b=dAkUOK5+cFhQtuxAyNYgpwiVZJKnQ63S0dHU3YaOkrqFMtYolpMzrrBGbX0QDmsdOw
         xd1x09/cG+t6//M7hAfb8fc7X6Ww1wN+1iUCz1uIxDjQQpH/TRUEHW9+PLkU3wnDklst
         N5vqA1DHyqQxCsi5STLFyNegO2eTJ0y7YhbwCCTXQaBKogtty7RtIsqR+y92IjTqzUtG
         AKgmoqudwatSmRBGhdCPZYqFSbnzlDupMCQ9lmOSjQ1976JvkXLV892gTqqZcfB4FkD6
         uGR0/5mxtD4g8MJcYxPLfKTCEo6XSn1FaJTVR1S43PajPJBrhWGrX0dPKDex82f/o+pm
         Yk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788193687; x=1788798487;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LkJ9lxCTtDvdCe5fxVE9tsx5zXvwZAtV4NrQpN1u2Ac=;
        b=SPz2B0T65j/eFQbKt7Ne/2mqdnBVojlhp0k3hU5pyqfqVGMzN29LJ2eO5eSPOFh9tI
         j6ve55ss2E7g+86RB01l7fDt4qkJE4sOZl0P08ir02KZWqbfwosM4Koj4/wEV2xwRh/S
         MqWCnFOkqRUhGV34dQwMf1DVMF325wcX5n0gWTC2ZymEa4zvaiP5tTL33AO2uSXZiRB1
         3zH5sJJeVGEL+ywXXCBwFblxlchmiO+J1RzhCnJ8p8sbBx6pfmh2wI7ozT2jk1D71e0V
         An52L2ThksAvGAYQKDtVk9BOIAOpVlKRK6DGrPmjaNEw6UyfgiU3zYEmIo5jWP3n+p0i
         qeJA==
X-Forwarded-Encrypted: i=1; AHgh+RraBBjaMmucdTdy0Plmko2aU9CGzQM3Wj+gs0itnOOdLAnOEPtX8+HhdQRWUasFR0qBKb7Gr+/1r0yyvHw=@vger.kernel.org
X-Gm-Message-State: AFuF++kfUcSiq0/AlZSwWgMPJ7LVnt8PCV8V/0xu2M2IyHdRHAUB1pTK
	MHRNFJBaWjLK2+A8b0OMz83Hq6r9w8Bd6IuekBLggPdF0MLfHANj6DMxR9txTURqzSkAlXMEbNv
	MzD7iHY0bdo0kanKanxUTab0jH8OuS4yi51bmEn0v7V/UkS1ahBTaMCIdbAN7q5ofgIg=
X-Gm-Gg: AR+sD10qPAjqofEzAl2SIIoIswlq7fyFuF/r5cHcFAgb8SqdMbIRRxmkntxG5P1p06Y
	yeUEbcCuR85EpTBtecVMewM9W42k0csXdspDqp6D8b6TT8dOM3l9EAv8iw/aubvlspMGrmeKa4n
	mwgg1aJVeSclkftjEvtZcuXp3HVFqgkXCAYFXqRMWldZL2o6j9IzkOgmh5AWm9IqbvZfDIYWixR
	rhMOZQZh1t02q8d1geOI6eizl38LjJA92mnOAOy7bVGtGQd2ga6fHfazbBcP9VJfeG44PX71Pnm
	6H7qx8fOoir5ly4EsZbfhzFB/xXndDlCqLX+xDY+BweMEXBp/a81TiJfIAotzrFLYwnnufIgrdU
	C3RsuGrTSXN1ot2ttRBu+NA==
X-Received: by 2002:a05:620a:224a:10b0:939:3fce:1a60 with SMTP id af79cd13be357-9393fce1addmr278294285a.0.1788193686808;
        Mon, 31 Aug 2026 09:28:06 -0700 (PDT)
X-Received: by 2002:a05:620a:224a:10b0:939:3fce:1a60 with SMTP id af79cd13be357-9393fce1addmr278256585a.0.1788193681450;
        Mon, 31 Aug 2026 09:28:01 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b5a4esm464039466b.32.2026.08.31.09.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 09:28:00 -0700 (PDT)
Message-ID: <3e7c4364-db4c-4db8-b37a-c9ed78bbca3b@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 18:27:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/DO NOT MERGE 02/12] drm/msm: Properly handle
 msm_ioremap() without name
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-phy@lists.infradead.org
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
 <20260828-drm-msm-hdmi-eliza-v1-2-67843277de17@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-2-67843277de17@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE0MiBTYWx0ZWRfXxur7DAfE9e5N
 Vn4euzt3S78VCvQ6vsAnuBKG/XHdMkLll1BDjfwjFJqJwqi1EtxX3MuXNBZDTGwGbNjvfM8RVFi
 XexB95UgMomDiiMhAZS503flso0axOjiZfOP3fnJoYa1GUQiwNTbh8jHzTKry7c7iDMJ9vw64ja
 wN+8/sz0bOfN/dZmeD7UlgXwdlPkBgwh7sFmX85zz+G5Kge2qwyma/VzRovAUgYTMhIPaMTi3QY
 aq3hEy+9u4uT0emCS4RfuLKkM5W52Aq3fRYT93Vwsg0HZBE1RPErEdo8rRBTBdjy5tC4NX1sMyS
 5TbSi4ZSFATQHNSnbWu1O6os0gzXCPWr1AkmHmeV2gHw9hxe8f9CwgOQ5NXt5qbT1yAgXQoAzwq
 ijxr4om/hGp0mlpCbZGGE7rjhCV5Fy8bEo5gxdD178/7QOo9e4yChIaI9zSia3zY88/Uzbk/SOG
 GY1H78YozQB8VoX8HXg==
X-Proofpoint-GUID: 8LRmPApzwQSBoNDA0D9PNkVLYQZ1M_L8
X-Proofpoint-ORIG-GUID: 8LRmPApzwQSBoNDA0D9PNkVLYQZ1M_L8
X-Authority-Analysis: v=2.4 cv=Eo7iaycA c=1 sm=1 tr=0 ts=6a95ab97 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=20nyjBPLO04NUT9Gj6kA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE0MiBTYWx0ZWRfX/dMgbUXCYi/B
 ZkgtL9++0oeEAS98ccasYxE1Km5CzpSgYKuRO9kFm6atgtHIcvMixbw9ZKBLFaly7IkDPppk/h7
 f54LQ3U+aXgw3Pe9St5wKfBsiDPlKG0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310142

On 8/28/26 4:05 PM, Krzysztof Kozlowski wrote:
> msm_ioremap() accepts being called without name of the region to map and
> in such case maps by index 0.  However error paths still use the name in
> error message.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_io_utils.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
> index a6efe1eac271..93b94e330cb8 100644
> --- a/drivers/gpu/drm/msm/msm_io_utils.c
> +++ b/drivers/gpu/drm/msm/msm_io_utils.c
> @@ -77,7 +77,8 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
>  
>  	if (!res) {
>  		if (!quiet)
> -			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n", name);
> +			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n",
> +				      (name ? name : "#0"));

nit: name ?: "#0"

Konrad
