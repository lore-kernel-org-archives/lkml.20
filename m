Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AA45187C6
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784905; cv=none; b=ouqvh1yZJMfc46znI8s771kx6+H8xjAqo2XdIz4xclhzUjC7quXLLNdGjNgnwIW9DEOs8J7YuzT8Q0CV5fuNslCQuE3NO4EKVWKYkv27lyoQlvuSj910PRBBrdgTpLwxpXqyZuCWP6QdaqFZozbwxiBCb/f3QQyt37ntR+VXMWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784905; c=relaxed/simple;
	bh=ShjC6ucNSbTXzABmodMFdB6sBUulSzcaGCn++++rQcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=anxQ5EIxRGzau/db+H9ZEFnAJvpgXURabVhxVF+spffUcIrUpoP15oI8CL0v7blkHXZ6+GYcAjUAx9v0ZVfOZKknBO1ZqRfUmSGnp4oIN1M2V5q2TQpfVLuqM+X1vlM1C9o2gWqk2fvvkifyNjx8lUQ63BTbPpMI53XqH3TMQlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oP3NiAuo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d0GSRLGs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oP3NiAuo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d0GSRLGs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UDxrEa3668543
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rtq/wWlS+mrwHHItxvMoEAAj
	+R0M3kvLrZoj3LoEtzE=; b=oP3NiAuo54T7zDU1eTumaSIwkL4GQadMojYc0zc9
	IDQkrrMY4ZY3BLa5qy7te+Wv5bzwRh7cGkpOix0R9VrYVUH8T6GqbAaFB48JW9wO
	bRi7QslIGBoSZ/UDWDZD6ZpoiMSDUvj4OsEv73GvixX2JS6rd+JMxFZa9CkjbA+9
	Rxc2FgyUq1n35psfc1/wYsCD+ZBgBmLu1sRf7xavKtHfTQZ23Eh/m1dYOE9bvGSL
	6FRYjFhDFkwDjAIaMFKOynFgaLwZVejDyMdv1A4LEb9diIEI60DJ6zoBiLqjH9HT
	rdZA503tVDLvLQGMcyA007KEi2d5aj3pRoUR+lQNb4Qfnw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rj2usvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:14:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cafdbdb7cso77483785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790784896; x=1791389696; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rtq/wWlS+mrwHHItxvMoEAAj+R0M3kvLrZoj3LoEtzE=;
        b=d0GSRLGsbKtDNhoiETd8z94T8S14tNR17QD958/JMth44nzl3MyRaCU2S8CEY6EDjT
         oFBzHri3mQOBDY348WrH3cjCnAsEt/v01C+C07ESL//5OzccjEcwYm/bkjWFhMCw5KQQ
         +2IwB22915vq5YPCdJbWTWnnIWIROBtrsCjYtHiOtd2EBDVB5sVf6ZMSflZPT4EkVMaa
         bGXmhQTZcFpBBQxpTkyFF6FtaJPqulVBd5HPSCmdj9L9iR1K4clYmh2C0Cl2VpVhlzRW
         aHkD4nONHClkHNef9IcesJV1CYAgqn3OXeDKrE4QWS1LlXormAWvEwcQtywsFVtG2Utc
         K8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790784896; x=1791389696;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rtq/wWlS+mrwHHItxvMoEAAj+R0M3kvLrZoj3LoEtzE=;
        b=VpaNJgu8trTKZiWAWekNQOIexZ+IhSm6w4ijbhR+xJA1cKZD1K3QdwR7xpJOGkI6QL
         U6a/mS/cENST1QiPrRPKGG9Z0oRAcuY4otIhhKQuiRWNOqEIlEm01EqyluMhCj+MaUz6
         icPg8DLw+ScYDGVLqB2zg+epmkcogCpNEk1AZYArpcyYnaYozg1r1KxH0Tn1Sa2kkqjp
         IXp5Yhvqr1+yJOVOX4qG4A8g+Gdi+0o0ujN7sn4WNHzBtYLZbJqPPuYmSfJ7HBM1HeE0
         K7vY9XndDUQ5L1LcBZQ2WKWC8VpyEfQRLdECpQPlC090/2gKCD0U+9fgcdeGhJMQxv1I
         yGnA==
X-Forwarded-Encrypted: i=1; AKwUvBztaoEMbWeSM+CHp6Km3ZJiAH/gSHAHtHdA/Vze9c3fQ/xrkyvRxcHUafhFgWH5VaDbBfgYZ/o/mq0of4U=@vger.kernel.org
X-Gm-Message-State: AFuF++lNxSoqqDMwBYnq6c/38a2vDwqWhNHVoL61Esq8A/ulU3YJtNb0
	IB6NAHkwU8DpYd96fkJrPYu7+KpeOSR7nfwFhiS4J91asozZLM1t42RGAPRk02tnXYF70+d38QP
	irVtwDeHB81yZhsOOv00yuPLUM7cLh8JB887qYBrJGNCtLdLaJCrQqbtGGos8+qz01Ck=
X-Gm-Gg: AYBFou0jf2V0XpGkEoqAOuepwVOPZIJlJmrcyH69bjECabtWTYIpHEgIHrED75Nxo5L
	i/eSkfSoZ74tmDDSM6lykNm7SXwBedH/lPAloNwcyEhZZaRBvLBS3NL1ZsBzy2rOn/yC0NoXbvq
	o9SSblWmfdk4yKbVrJY+pxCvI7BLPuzx5b7ZIJaQx9G7C6Sj050GXVJX9/RBP4ZX8tUyVDKO6IS
	/tT2m8EfoKhu9gQuizsQ1Es4ym8NdFYypRHZBE7wqqF02XcJSlbirRSimri1H4RBDP0z1IAB+Kb
	zPJZShiGOJxBnZ862IVtGATauiUKYSIkU/ggI7Z09VG0ZnJyNT4mP0n2ppBL2v8lx0aw4Z5zePN
	sq1y7tBO1czP4SPdWD6trUQUQ9J9vyilQKKr3UbU3Ccp7kwSfk72MKwk7UDuE+o/DeenXNb2bca
	IVLzHkrWnx8a4N
X-Received: by 2002:a05:620a:4482:b0:93c:9e87:de76 with SMTP id af79cd13be357-93cb59f3445mr22564985a.10.1790784896490;
        Wed, 30 Sep 2026 09:14:56 -0700 (PDT)
X-Received: by 2002:a05:620a:4482:b0:93c:9e87:de76 with SMTP id af79cd13be357-93cb59f3445mr22559285a.10.1790784895947;
        Wed, 30 Sep 2026 09:14:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fbf20fsm86487e87.78.2026.09.30.09.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:14:54 -0700 (PDT)
Date: Wed, 30 Sep 2026 19:14:53 +0300
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
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 07/13] drm/msm/dp: Track validity of cached sink link
 capabilities
Message-ID: <mtw5s2bogogbbc7eyxoc44pslactrsa5h6wdqa54b4hldwrhqm@nzg4zillqtt3>
References: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
 <20260930-msm-dp-hdr10-v1-7-dbbf8b2b42bc@radxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-msm-dp-hdr10-v1-7-dbbf8b2b42bc@radxa.com>
X-Proofpoint-ORIG-GUID: CpvwPSisksrIf_rlHwK335Z3frlVwEBA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX2c75wMWbhhLv
 GwENOr6vOyxmvD+rBW5Sn0fuajsIVkSFcSeIN4cGBN9KtGj0yOwbGKzCxlWLTbeZJD3K9U+VJ3R
 wEbfxlIkPowZPHZ2esXWaJn0mdkW/dYFx/8MM5V9vJM5WEJ32NuOu4dkZg0cGgzXJ2Ip26DGf2u
 7CEwNflLV51sVc1FfmGMxiEp/yLMQwS7sS60WXiMcXmPuVfk/WQdj9ZqOr0iWhV4z9sG1L3I8Ws
 1kzoB9Ich4TEXShRT7pHk0of/Cq7SyJ5gZ/P42FMpo/TNJXkGDC1JDNG7ZWg/xfS9vC0ZRAOYaA
 4x5N1C33dDkaJgTFhE4O3R/vtQzbyt3f2gpUCoVH01R6NPWufITzHP7hhVDs7+ZYSGgJ63He4hv
 SRRljnSIWoAlO5r2u7bCnssVfzNbv/AS6q8sEJL85oVCa7/YWS6vZds0Ty5DK4h9iBhzEC4z2n0
 e9DglOQMccFUE1ur1Og==
X-Proofpoint-GUID: CpvwPSisksrIf_rlHwK335Z3frlVwEBA
X-Authority-Analysis: v=2.4 cv=Ypya1IYX c=1 sm=1 tr=0 ts=6abd3581 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=ksxQWNrZAAAA:8
 a=mPiFDlsqJXRWNEHsy4sA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfXygOZrn8LJPYp
 Gq6U32A6Ivfczl9m/DQ23nwR+w9Soq3jHEuRNI8qfb2SGFjlHCr/AGXWXeOslDjcCScOqHr8bFf
 IyAiUqvVGmNWzq2DJk9tyB4zIBWDp7U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300064

On Wed, Sep 30, 2026 at 08:41:51PM +0800, Xilin Wu wrote:
> An eDP panel may not have been powered up when its mode is checked, and a
> disconnected DP sink can leave cached link capabilities behind. The cached
> values alone do not distinguish either case from a current read.

Since eDP caps (hopefully) don't change, would it be better to cache
them on the first access?

> 
> Track whether link capability discovery completed successfully. Clear the
> flag before reading capabilities and on unplug, and set it only after the
> downstream information has been read successfully. Subsequent atomic
> checks can then defer checks against unknown capabilities until the sink
> is accessible.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 3 +++
>  drivers/gpu/drm/msm/dp/dp_panel.h   | 1 +
>  3 files changed, 5 insertions(+)
> 

-- 
With best wishes
Dmitry
