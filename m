Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101127;
	b=SGB2b6UXL1AqIP5RyUiaBh8fOtHVC5kL4JbgexLTYEiU5sFRW9G4l5Fk4k9LSuZD+kRJ
	 wk4LltNouks+AWs/UanT717439Dk0uOJvFmBOp8cAb8qS1k/eUohnNHRAL5w2W7qmJFrR
	 7eDCn/PfXyVzQ1MYo8yzaQ5TEAvJTjIq4XDxpAS4prmP63YBCwsqIna+RzPzmNDRdeCag
	 owk/RActUKsMAatCtZ5UJaGdJyT6T0MVnF8Vg7t3+AM06mTc9l3zvCvDGKTX7Z2chK3j2
	 KvOU1xF/2cV59A+WIS7Sx9m7rDMBpGFJeZ2OACkZu+SZch2G12fBzNrbsvJ4T4TGpnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101127;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=t8KeJqXYQPr8zutUgjnJ6yEQLnjHNNZkSiiSYzj+XfU=;
	b=otE348xtDoQp/dC3oQx/985wl9Z/G+XuuZJzldoPwseXTrC7XedPiz0VbusKf4qviPeb
	 I9nS0mbJBBfhkISUJHXPlzWkEAiI2FUvl2RafgpbNj0nmECUB8aeC0VFIvLAT/aaQKDIc
	 YAQQOM4jvi2NR9Wosws3jfWbSWjJmJuOJRDU+Bd2HDSJZyDWEaWCNGuxuguzobZrvIV07
	 Q0yuaFV1T7nCV58iy9RNpc4Rk5Mmtb0ZcFywFI+XM2FVhkGSaymLa87echz0JemaetwDv
	 Jt069mefurZl+yxgCqb6tzwWG4i02mgn2xpNwMUIOTRGirXacLmrS29LFtnN2nvLxEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="d8A1SGU/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z2l3y2gl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA82606B5FA
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FA82606B5FA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d8A1SGU/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z2l3y2gl
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe4v61935912
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t8KeJqXYQPr8zutUgjnJ6yEQ
	LnjHNNZkSiiSYzj+XfU=; b=d8A1SGU/3lNieXhNKzh78QX8sIvtyhoggCDvkjo2
	ZooNqFjFtRxIPsA+xBHGhEwUfOys1kTG07Iff1x+bBTZFVWToPjzxT9N8EnOkrNx
	IEGxQb2KI8RaKfi6IZ19cdymyNOTdoCHQeQYQLCMNTK9oZwDvYY148nlQMyElYrH
	nDvOEUPoI5cM1gKNxhj7N7mZKOPMRLIrN6j0HBwaYQi86++6BI0mVQNoQLmdXzQ9
	wKMW0uM4oJNn608zdT4wH+3YUkoQIer3xZf8YVZLZru2N3Hx6hdqAnijFoHnd9sT
	w6PcNVLoGn9P/kyfRan8jZasQplHO5ZXeiRXOVeR9WFG9Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavtmdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:38:45 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98bcae867a1so1202809241.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793101125; x=1793705925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t8KeJqXYQPr8zutUgjnJ6yEQLnjHNNZkSiiSYzj+XfU=;
        b=Z2l3y2gl8efDAcKPmx9asGDaPwrkEVgMxaadFXzkcQ29PiAAQ33AYJIFNUpZ7pfna6
         bPA7/SmpEQ6e5JgFXQVokPSAn72P4zixpAiV7eidruSoAyE32tFIqVU+2Q/KCwz7vryt
         1KSe5VQxCrNDjMBU4GAYDIV5uq8V+0Lw6puWV9D4e7VCChWMPskJ1YrDEuS1UNt1RIf9
         aUcpb7Sin+YwYVS4+/5Y3PkL68D4oyZMtM0C+DTT2TaPQhU2dk+lyN0FrB2EzLCoaHhn
         bMAC+UCpC6E9CNRPStjZNGb2zkL/TcDwYczV0COzyn/9+/bEKQlzQCWLqYgqB0DPNUHx
         JCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101125; x=1793705925;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t8KeJqXYQPr8zutUgjnJ6yEQLnjHNNZkSiiSYzj+XfU=;
        b=v4YOt31EszQKMtls3NH4RYi0YjnY4BdoAKPaPlIIkhBE5/L74npYbm9mJshsSoWw5S
         s2YAK4MOSQorPR1Sjd7j5SCI/oOl9drHtjSE2Zr+emi1xV3oC0UGc1fBumS3RWFgjsbs
         A/DDgioybSBeJ57aMiq1GPD9/ISzjJFFHfHJUaikUKneA/A0e84dCPn0381knj61WnPx
         1iQC1wE1ccr1G81jtNjiOQTz6d/+urONvvYaidCN79CxDrymoU1vuuCekEuvoh67MNLN
         aVmk3tNYWOExrBZklfIgbIh9Qa5lDsoumqklOFY8HTZN0YKgep4yJbQwFWo0usQApyy9
         YTyA==
X-Forwarded-Encrypted: i=1; AKwUvBxy7n4RhsP4CvvmL24ChZy7ARWOpQYoxhoUKrC5sDkHBPR7MPyep5AVkJO8eYgoqhg/vurmYyuGp+2Ryis=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwlhxPmglCWQVADFV7kdE1N2mo7gQzfXfK6y8dWGtmAnrr4PER
	VWh4eMBLH6eTh4p6uq9+Z1BWUMV41VXxiY5AA0gb5uQMNBX/MnxNDZmNpyzO2ck2kF95jN6mBdL
	39bmCLdPSgr4e3o0EDnkJCUakv+O2hwvKdchzNG0VcbaYjRSiNkgEmNdPpS9Rskug6WU=
X-Gm-Gg: AYBFou0mU1eORXkhxDytZiDW0+uFR0EDElEuzsBDgU780784C7HYggFY/oZ1h1QokNB
	uMqYY+ylTPD60xsOPMVa2h96UWnj/0AVhSLR+rH6a5RmhH0Ix5xnHW2Vdb5Y3yNzUSE729+gs8j
	EH4YULo/sENP/jjOSMC9BLQECjibd7YxCTgSkjXtmWtpCCPx6yIwAZmXgZnxKILJh6+g7BaEegI
	2ejE0EMs0lhWJqOnP2SP8ezp2/22GKlbvTg6Xg40bcyNI2n2WSh9epo5l5fc+79f/9+ohgveqZ6
	bGCyolWLS7tE//qRqMrwQ+qMuq25gwQjpg7ugl7mNIfL4XYzuXK751frS9v0gRGL7szvQWMhFD6
	Ex/PTANNHiHf1O4TiAVZNYpvtraLJnDfhEF9EzNfZC+WrVGmgXCXuhBJZtUJr0ZGegZ6o9ltiYN
	BeRt78zqSB/9ex
X-Received: by 2002:a05:6102:ca:b0:7ce:6474:7216 with SMTP id ada2fe7eead31-7ce647480demr2158184137.36.1793101124418;
        Tue, 27 Oct 2026 04:38:44 -0700 (PDT)
X-Received: by 2002:a05:6102:ca:b0:7ce:6474:7216 with SMTP id ada2fe7eead31-7ce647480demr2158168137.36.1793101123899;
        Tue, 27 Oct 2026 04:38:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70a27a03sm24389741fa.29.2026.10.27.04.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:38:41 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:38:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>, virtualization@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Subject: Re: [PATCH v2 22/23] drm/msm: Register the DCP backend
Message-ID: <m7zuu3txmzw4xemqrdtemccmvc4g6l3fsqk6xyxz5zzdbltptd@oqubuxwbukeg>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-22-7cf014efdee1@oss.qualcomm.com>
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
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-22-7cf014efdee1@oss.qualcomm.com>
X-Proofpoint-GUID: u_HH9kFJF5Svyqkhsxjnlo9DZeR4e4TY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NiBTYWx0ZWRfX0PqXE2/hORjn
 MyPLu2RgHdFtIiSa/Zk2HCrNoLfAM2Y/9wF9hkDFipWnaPtOEksbY8zVugLpUTREzhksY1s+8bA
 wckAQCDQHc+0CUrmZkGrVhNX3LL2Sg0=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae08d45 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=5ffiRAJw0Nfj9fulafYA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: u_HH9kFJF5Svyqkhsxjnlo9DZeR4e4TY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NiBTYWx0ZWRfX7sITYJHEn4Z/
 G3JYIELpeyY8XN9N3NSVMzgNxNeYLoG+P03W0QQzNPeCvtk6K4LCojByRcK/tK0XaSAGJKXrCHX
 prbm9jMpzfX7UtCIjmUREFUvD/8BTiLo/TCfIQt4r+UFNA0qw6o+29IL32ztPRaywBzmk6WHKa/
 iV2u39q6uJreI1Hi5DbGwfkoPCpLpPxWH8RyXDfJ7DCs3YoScCBh7IGsz8k7A3hDeP4giosVsX8
 XjWhV4NEAxpm6f+pvhQdSXRB0Ck9P1P17QNJYmHSrpYYz8HhHht411Ynp0mmBvDJMijlUXh23FN
 UAEvQZy0UE+5iel+4Y97oliX5uhkKehc5/5F/Htb5LRlrePFiUDoXKdBl0vGno9XNcznhVisaJa
 ewJwS2KgCOi2xh9UkgTfHhUrfV9N1P5yLm0uwD4pq0DuP0JK++VZIWh/RS2gFA7Jnx+Xm2IiWuK
 COFNcL0M8Mc9QLj8FZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270046

On Mon, Oct 26, 2026 at 11:51:32AM +0530, Jayant Shekhar wrote:
> The DCP platform driver provides an MSM KMS backend. Register it from the
> MSM DRM driver init and exit paths so the VirtIO driver can use the backend
> when the DCP function is discovered.
> 
> Add DCP registration hooks with no-op stubs when CONFIG_DRM_MSM_DCP is
> disabled. This keeps backend registration consistent with the other MSM
> display backends while allowing DCP support to remain optional.

There is no need to describe patch contents. Please update the prompts
you pass to your AI.

> 
> Assisted-by: LLM
> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 2 ++
>  drivers/gpu/drm/msm/msm_drv.h | 8 ++++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 5816c64d7ce7..d413c361c442 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1208,6 +1208,7 @@ static int __init msm_drm_register(void)
>  	DBG("init");
>  	msm_mdp_register();
>  	msm_dpu_register();
> +	msm_dcp_register();
>  	msm_dsi_register();
>  	msm_hdmi_register();
>  	msm_dp_register();
> @@ -1229,6 +1230,7 @@ static void __exit msm_drm_unregister(void)
>  	msm_dsi_unregister();
>  	msm_mdp_unregister();
>  	msm_dpu_unregister();
> +	msm_dcp_unregister();
>  }
>  
>  module_init(msm_drm_register);
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index aa5dfd82ac6f..befaa9f2cb5c 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -417,6 +417,14 @@ static inline void msm_dpu_register(void) {}
>  static inline void msm_dpu_unregister(void) {}
>  #endif
>  
> +#ifdef CONFIG_DRM_MSM_DCP
> +void msm_dcp_register(void);
> +void msm_dcp_unregister(void);

This means that the earlier patches generate "function without
prototype" warnings. Please fix that. The prototypes must come together
with the function definition.

> +#else
> +static inline void msm_dcp_register(void) {}
> +static inline void msm_dcp_unregister(void) {}
> +#endif
> +
>  #ifdef CONFIG_DRM_MSM_MDSS
>  void msm_mdss_register(void);
>  void msm_mdss_unregister(void);
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
