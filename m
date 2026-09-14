Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2489046E019
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392561; cv=none; b=ESmDYsaMmnIX6Xh3l0R/FOLIfOByeidbcSuKq9ZWsDav00Cr3+kFIFvnmGjPf/BkBYtYsryLCv77Hg8LDVu4QAb4R+iCJraNSwXIjBGa6K9auNbh0iCpzmlrSID3O3DiHHYpdg+YAH0qCd70nvidThAIi1fPMGA9Zr2WyIyUEg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392561; c=relaxed/simple;
	bh=qg/RBhESd51ajr8WDi37wRKO0z5KsP/UjDdEMv+gNuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O0A9HwEu2mQLa7c443DsUZacrw1UaQlz7V+yxkbK4U9m/L5kd1M7ToYzsryjQhhPHLvL9G/ymkLrKfbXVisJ3bQ7iMIxbL79saz0S5t9mVQGdd+t06Ex5sXlHsASl/pTI+v6+ZY+pc9SyINHxj3WQSW43arZwjwd+aaygTKKSWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CdYADE78; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1aLWJWt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CdYADE78";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1aLWJWt"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0Zxa830765
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A2oe9WYaH4TAkTlCFmhnHizk5lGknQxaw0iqFnj0J8k=; b=CdYADE78z/zH8CyG
	FRA32jzDGmlkiHgOcX90VEsNibqKg/uouUN9JLiWmCTe8cYgWKsizhKfQukbbUsq
	LLZx+/1Qi+Dh//KFH6kJwoOOFdS1heOaaKFHktKpOLdNugLgGTIksinRlhfJ6fM+
	m6KAKvmQsb8NadTRgzZ7Okrwi1LvB/bSttjNBdMc/jJM/oscOCjSc7ndzJBhz76K
	uBB0+EGKpZ8GUJ6lg/OnGguFMWCpNfHLMSWOq4UgNBS8kIAPWhCTRgAzDargEb0/
	Ly51XRROf1cLP+1/UDZQukfmlDs3dW5Q1JUlkAYYLyiQnsst1o1h/FFfKQKudN1Z
	4+66BQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hstm5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:29:18 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78f2fe53829so2878085137.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789392558; x=1789997358; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A2oe9WYaH4TAkTlCFmhnHizk5lGknQxaw0iqFnj0J8k=;
        b=d1aLWJWt55cLMxt8PvstfPgip3MC57q8Eme6zEjGGPNjYwwxpk0DGAKlF/95HBx5zi
         lTTP542hXhv8VjWH0a7OWA2732wcArVRB4C+VDeUJffDUDlCIfROFTL7RYVR3sjPGNNZ
         B5CoHWfTO89igDxoU6UwhuIuORf9kQUTdiNCfLqtkykInCVD0l5ZegJF89WF5/WysY/t
         6bwTQRujgfnuyZKMEyg44PFWlRiKBavG1nq5Xn5O66vVyl3b/8jeZirSu+cHzp14Jdfm
         x1cBnrQkgn6E8p+LOkmUe+sXVJd8R+oCqGWeY7Gl4z5t83wR5YblbwwPSE0UBMqzuYn5
         EY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789392558; x=1789997358;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A2oe9WYaH4TAkTlCFmhnHizk5lGknQxaw0iqFnj0J8k=;
        b=KeamYHmgXbj+i8yrPtygaiJebqu4ggr9pbSI2I6PxYX+8b3FJlOoEzB9mOqGCGkWFm
         drCn44EiCVB8ulVNFxyj0wb71xVKHOwrCK+Lwq4i6fPfDF6E+sJHBniVrFoKF1xmwoZC
         9JY6QuA/FmrnyrBGBQES6/fJF8wUGMYQ9L69QwGkDkZ481LU2NZUo/sZcenFiUwWGuqe
         AtzzV+bCiomhaPzIWBEH0PfLKv97BJUL10HTBOnGmLCosxxyVD/uzRt4Jc/fWKKtr4xI
         dFfmmJM9galNYoeZ4VjK8vjp8a3Ok328F7vV06AWdbB6kAqt4GDmagw1qfQ5+Lzhg0dl
         /Ppw==
X-Forwarded-Encrypted: i=1; AKwUvBz8cvJv5K/jh15znt9DHFwTas7Pi1YOG6x6LDEqqQ7NUalpKhHzlCocGSF8DJXOpOltr65jvOT10eEhnXM=@vger.kernel.org
X-Gm-Message-State: AFuF++m5dghh4tEvGpUduMAVoJZRUQtJgKf14h2nZd7d1HzfhDf+3hiB
	2s3yvH9hzik/a0Ortb99YVzpxbI7piaLekRuPG8zhhUdU+DpZm37/JNqENu61cxzhHuJcJOh/Qu
	f8NIjKnnkN6weNBOKATgLZuStmybKhIGyzkWqQbg9nZM0XaBjPZ+zmLbppd8hK4GHuc4=
X-Gm-Gg: AYBFou0HhDq8FRxzed7a1FH670iXc1w+3qfluYSqqdFOmG8vyySxR+He3/nvwMJigC1
	/qm/uHa9j5mZmAcWWFTqnLR/w97p2a6AJsVRKqdGDmY51/NBIamK5Jp6ktaQG13nT5Xx3tkWb8G
	9vkKSu4cTML9p/iCLWz9LeyQr5meV9yCNxlpXC5+VB+0QqlXriNJn7c+ygK4ClK9HjN52f0dUtL
	//4K7iwTi7/XlzPe6Vm1ZYUQPve2Rlzjirnj9ljnfGIEWAgDrfLGI+CWPWpc9OBOGl4YawEh1gp
	j5XIoNcuHSQvxB9KXwsvWLxLgNfqYhxPN+j6k7YkrjF9lNtlQlOu7RjZ+xAYZdiLxnj/+Npwwlu
	JdMjj0W+GMmPqymbNHPqSwKxSfCxEXMFtPu47cHrK7mcOfQPKuXm+MSpfb6VU23YLEVpuMVly3O
	s8/lFWi8a+t8UY
X-Received: by 2002:a05:6102:512c:b0:778:f972:32eb with SMTP id ada2fe7eead31-79b5c515679mr1850371137.12.1789392558284;
        Mon, 14 Sep 2026 06:29:18 -0700 (PDT)
X-Received: by 2002:a05:6102:512c:b0:778:f972:32eb with SMTP id ada2fe7eead31-79b5c515679mr1850285137.12.1789392557779;
        Mon, 14 Sep 2026 06:29:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a3144a4esm26968051fa.0.2026.09.14.06.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:29:16 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:29:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: kavakliyigitcan@gmail.com
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org, linux-input@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 09/10] drm/msm/dsi: separate host link enable from
 video stream enable
Message-ID: <2wj3y5o5edya4uifambdpzh2jkpo7xpxtjgrmtvdxk3z76uty6@tuoe2vkh7p6u>
References: <20260911-ginkgo-submission-final-v1-0-0e68e63a18d4@gmail.com>
 <20260911-ginkgo-submission-final-v1-9-0e68e63a18d4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-ginkgo-submission-final-v1-9-0e68e63a18d4@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5MyBTYWx0ZWRfX9pozefpY/YdM
 HrcG7U1t+dH1nKtevWLEKxOp7r16m1o4rajJbC/SEw9bL4KVtj13A/yfzYCmTL/ju0l3/J35eK8
 gORxTlYNDkXCpwLNWvdiPJi/5RfpKYfruSHqvC9W29VI1+PICMg/gsMegz5TUTTzZ9qG+iHwT15
 Y0uwTO365PMeZ3bblwG9cmPuIhhJ97ZoOAH5AOLAAfnWfwq6I9ZKseS0wpotG5fntoiwFawHJ6O
 y2Um0TFVFK0ePz/cBK8pFiAsJHdmjCTlSDN3wFvx+MS7VkNOtZDWRfsuDMAVp7tYRGAerUcUCRU
 t/VhXU9ew0qjWtLwXEgDwLnvVy0vxLq1rl8psM2aOkg/i/XNJle49qIkYsEBQCKKQsmwHlE/fbO
 8UJjf/+mQueEH1DYgHToR/1qKh/UB9OJMVA6iEl/bRxxPrp15jKy8gFZt9BEsxoQTsVYj6h7LvA
 KRtRuw9RUIf5hMm//ag==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7f6ae cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=4I8C5fWqZRg8XWo767wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: uDoC9f0bv2REWa9XHlWZxC8yLYMd5ZjQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5MyBTYWx0ZWRfXzUUZzezcBKfm
 u8Eac56ewTWbXL/zkmLWMwRwRcjwG+pwzvkq8cD8LYICQAYkalavgsh19k40v18LFZEiYOCloPD
 YZhtUOgL21bgkTCFXd4Dl7Ckc4AUmR8=
X-Proofpoint-ORIG-GUID: uDoC9f0bv2REWa9XHlWZxC8yLYMd5ZjQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140193

On Fri, Sep 11, 2026 at 11:51:06AM +0300, YİĞİTCAN KAVAKLI via B4 Relay wrote:
> From: YİĞİTCAN KAVAKLI <kavakliyigitcan@gmail.com>
> 
> In video mode DSI displays, enabling the host previously engaged the
> hardware video engine immediately during atomic_pre_enable. When panel
> prepare routines transmit initial DCS sleep-out and setup commands,
> concurrent active video transmission causes DMA timeouts (-110).
> 
> Keep the DSI host in command mode during atomic_pre_enable to permit
> clean panel preparation, and start video streaming in atomic_enable
> after the panel has completed initialization.

I've not seen this kind of issue with the DSI mode panels. Do you have a
more exact issue description or a downstream reference? Is it the case
that the bootloader has configured the DSI host for the command mode
transfers and you are reconfiguring it for the video mode?

> 
> Signed-off-by: YİĞİTCAN KAVAKLI <kavakliyigitcan@gmail.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.h         |  1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c    | 23 ++++++++++++-----------
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 20 ++++++++++++++++++++
>  3 files changed, 33 insertions(+), 11 deletions(-)

> 
> +	/* Keep DSI host in command mode (VID_MODE_EN = 0) during panel init
> +	 * to allow clean DCS communication without premature video engine startup.
>  	 */
> +	dsi_op_mode_config(msm_host, false, true);

This sounds plausible, but I'd like to check it out.

> +
>  	msm_host->enabled = true;
>  	return 0;
>  }
>  

-- 
With best wishes
Dmitry
