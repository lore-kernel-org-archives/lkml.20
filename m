Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E00339D6FC
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854384; cv=none; b=upRijmS4fsmxk4v/Dh+p8DDX6aP+8xp2lyrmj0FkzaUudgu+JzZQip3nCmEXkGt5PIDYapDLp672fsZ/ynDzGvgrSWbR7RkDk/6AMc7HZ1LLH1WI3fFz07pbjjeva7RzkR3sBsVhguqaixoUIJJD0vVmDOPOEHNF6UvMjscuWjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854384; c=relaxed/simple;
	bh=grCWMjlu6AypHVafYge8htUDkNdD/K2UjElEdZiTn28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dhOJHVZv9jR4RwKW6mBAmF6PMdobTklb7iwRz9nE/4OL33WIi1lbw7z/bOfRgIHifivKj2rLF68HipR8ZnJ+HgVLoj47lLA+ruPc8aj7STrVsmrQJqY0BN0HCSO71lIQJebl8fH9GX6E0qtgsBWNeUJ+DKMelQQ4eOmKgYpx3dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YAEiCbO/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XqECkqE2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YAEiCbO/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XqECkqE2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M24G2363249
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 07:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fpbmmZ1QtShdu/q4PKZ8L0K0xegJNYhOag8VQBO3HSs=; b=YAEiCbO/LI82E+lK
	E/tu8cfQeQ9BJxIYXpSbj9jULhhrfia3qZgIP5fiMdBVp46T4LGvafyY0mcDOD2b
	v/WPrlZTK5cUZ7oRe38qd3cEVrzHF6K9kEOyPmmhgbkEuNKYzt3foruRHyGXLw06
	jFyEfIylRBKVqaaOkcJx+3REByTExfN7moPPuvJsJ3+oom1oPhHzgyoLhrJRvy19
	KOI7Qc+dkA9pi+/KXK1j8JKkyQVNV9Xwdes7LDkJ+Vl4bioPh2yoQnqHmOF840K0
	ooky8E14O1rbhyltuAUUSTtIjEnkPLkI6mpxNGQEYYN7oN+4cfpxdvWsIwScvxFH
	V6m8sg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjagugxdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:59:41 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98283f87cf2so4052241.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788854381; x=1789459181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fpbmmZ1QtShdu/q4PKZ8L0K0xegJNYhOag8VQBO3HSs=;
        b=XqECkqE2qCmOLZfFnWQ70Jb9ecMOdBjmjMWTGV5JEYEPV3YbF2FlQxh99yf3Y59WKH
         B3eUExIOhSG9MH4SaF506FvX9DBqe7/HNT8faEIOrihptTKiSBDlHf6GASFdRhiVoXv6
         qLgvSk38GeBrAIBVXBLieZOsdBITn6/xEYEtG1Kuckdcgpmg7+hrBwq2rnMTr1yj7Pju
         2ytw9IG/+A18EDnFYPRTLyaklOFn+hR9E3CD+QcA5DjsoB7buDowNV4RKYFrVR9xQN1T
         IQsD6EAspfvO3sr7XCyb6Ce1g76y4ZQMhzIvpyurYJNVsZYehFRyfjD9M7asPE90rdnB
         uqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788854381; x=1789459181;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fpbmmZ1QtShdu/q4PKZ8L0K0xegJNYhOag8VQBO3HSs=;
        b=H4EWryZQkjfJY5BEyLcSLhX3NLr3CgNsukkT2B3CEWjizFoRghqCWg1iIL9zH1gLXf
         Lu05px2dvN4/GzF2bMQ2OX6unXzAggtFrkNYakyUhgVzmm2QZ9DPHN2ywcNf5lfFhdIa
         XQ0aRbQI5r7jUPZ7QrDTHJLi2fvlevAmImBuU35nT5gfzz07rVc82+ksUhN3cREnz/LJ
         r3Nz3tG1CKwQ22vACwOL/9ZPLefslly4YPPm4vI2n416Cu2B4/skLBsSLTBQg5F5gkwj
         FskOM48O+kq/89XXUrsxgo7e1SYrO3pxX5elOQtdeXMUnbJirAkcnZNEIWGI9rDNiC9x
         M0rQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTaSS3l3YJo/hHQsaVW382/vUraqJy+m4hNLihlSZASykHcCsARr/R2GlI98bCN9wiN8p67cFfoDqjF6o=@vger.kernel.org
X-Gm-Message-State: AFuF++lw5R2CM5EAcFLHpOAL4IIBRJ30vjTt4B5BJijssAab4K9eIiww
	+IP6dpiv2txjgkvBtNZMhCYSs9EGVNMZMjgNkP2/UWu/g4L7H6I2FvOz/K4NODSw8bOWT5IHsQo
	+qFZVwEZoxVcM1WHhSE05emLsjW7CBl0ppjJVCJBZTey2QZ9gEe7nB8X4Sy2SXA8aCxI=
X-Gm-Gg: AYBFou20OPW1ejSBSP9GnFe4wTSKXrz7KCf4rNqlmJYH6CaIbd0TTBf/xljg+G7HJZw
	Ybaf1p6BO1sx9VuqkpzZIXeZ847LNaekwZHwJdMip9/7q043OYtnTi4gZm9HP9K4m6wM4uleN9Y
	LcQFQYSo+3U/v0RGfS7ixFoS61KbTpvAo1CuTTHDGTGlWyblrTL3lT63bcewgwmN8kNXDpgvrwm
	b6TnCxJDunbX9mdQBFws4oi2F4GfjHG3qVsHs/D1nbJZgUj13yv5+PipGrYqcNIg2PGtmWvaaYe
	P67lbQMjP/1Uz8ep7lVldX3r1yW7VmoI4wFRA35E11riPQqgTqgGDl0tm33rMWgqVeQ1VY/oCr0
	L4I52lcGmXwiFaSGyTThEAA==
X-Received: by 2002:a05:6122:c2d6:10b0:5c6:2128:7cf8 with SMTP id 71dfb90a1353d-5c7fbb2e565mr2177837e0c.3.1788854381115;
        Tue, 08 Sep 2026 00:59:41 -0700 (PDT)
X-Received: by 2002:a05:6122:c2d6:10b0:5c6:2128:7cf8 with SMTP id 71dfb90a1353d-5c7fbb2e565mr2177812e0c.3.1788854380521;
        Tue, 08 Sep 2026 00:59:40 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a37054a1b0sm32636061fa.14.2026.09.08.00.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 00:59:39 -0700 (PDT)
Message-ID: <51fceedb-2dbb-483c-8eee-9409ca61b1cc@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 09:59:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] drm/msm: Properly handle msm_ioremap() without
 name
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
 <20260908-drm-msm-hdmi-fixes-before-eliza-v3-5-dcf8956878ca@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-5-dcf8956878ca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TqLWQjXh c=1 sm=1 tr=0 ts=6a9fc06d cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=cvAdRwzt0-5P8qaLRNMA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: gSQvXQAAGnVypHc-ggW3w5qaX0be16KT
X-Proofpoint-ORIG-GUID: gSQvXQAAGnVypHc-ggW3w5qaX0be16KT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4MiBTYWx0ZWRfX0h8OYdb7YUIc
 3rojY27diPElyM+ZmEbmTUV4WcWrzUrct9IB1fctNH4Pn4x6aqRrTFL2sRXmbjK9/epp0hrh0o8
 Hq7sjT7Prdt1xNulbsGXUvrcumoqm8o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4MiBTYWx0ZWRfX6D1XaR1f60LF
 uabuSJWuC1LgCrgPSXNTE0sEveAkpTqN3Uv879RIglj3wW0L2jA76PwXIW6e9/yziLvBSwjRSWB
 UTO+w5I0LvfIYdhX5dteZxBlLjLYRcdZiBj4d3me/ozSAefFjapr7QyNy11Xto+4rcgVsiZUPeZ
 dFbOwOoi+ssWrhuc4bbG0VgA8qQe6sGvnxC11umfstdsUGVkwilbPVAybDT4SYDb1fu7WO56Eud
 AGtOJDOtBdeYtr7blMaOs6buAJtDXt9Z9ce3/H+IZZumHqwJkMUSOgsawUwRrxyYwVIz/tAEQBc
 ip3Tp80srRlVLOez1tfl/2WydNi7UAAqo/DmJueA+9GxRoyTYnr3teV2ExV9Vfo1Sqg36jC1bX4
 JP9DFkDBE9rs6Hw1+TZjZMLz31LaFp+JZ5osZx5pL5YPWPfoENb243aGeKKQE+OAZjn5VRdQsn6
 7vI/q3hERNt25+rkpRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080082

On 9/8/26 9:10 AM, Krzysztof Kozlowski wrote:
> msm_ioremap() accepts being called without name of the region to map and
> in such case maps by index 0.  However error paths still use the name in
> error message.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_io_utils.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
> index a6efe1eac271..0a4ac0fc5fb5 100644
> --- a/drivers/gpu/drm/msm/msm_io_utils.c
> +++ b/drivers/gpu/drm/msm/msm_io_utils.c
> @@ -77,7 +77,8 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
>  
>  	if (!res) {
>  		if (!quiet)
> -			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n", name);
> +			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n",
> +				      (name ? name : "#0"));
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> @@ -86,7 +87,8 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
>  	ptr = devm_ioremap(&pdev->dev, res->start, size);
>  	if (!ptr) {
>  		if (!quiet)
> -			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n", name);
> +			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n",
> +				      (name ?: "#0"));
>  		return ERR_PTR(-ENOMEM);

It's odd to see one being ?: and one being open-coded..

Konrad
