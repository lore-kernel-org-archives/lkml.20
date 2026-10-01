Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC45A3F164E
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790850799; cv=none; b=H+/B8EjUen1zvKVOe32ReKq07HTXZUs4Kye1cxymiFhqtEoftOCiNcUMkUwIUGZ3Nfxkb4gmkEMfScN0dMECV0/0yR3y/QRDhP70AfSmMyvoioFdwf2zbmMPlYBD/9GLLft/B2nn/tRQ+c7YWc9egIYqsssl0uC2Lh0q9DMssTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790850799; c=relaxed/simple;
	bh=tJTffJZLXlPGAsrJc39ZqaTSQQX+mKudeITiabdnp6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzcbyezZgdhd37U9Rnbg1JTy+a4+Vy6ERCIkoBpqqxdxkq/7RDVb/Fr2NnTP0WCNtZ5tfyT2ITjwT0dVkYU3Qcn2eLC7c6rqm4HPcZbUBC49mVxA/MIuwxmcvM5ETl3WB3B0ZgWECzQ8zHf3upwv8tRY/Fqm7ULBF27KFWFFB4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NE+p73bP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B1G0ygvI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NE+p73bP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B1G0ygvI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xabN962455
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 10:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z+fRcNyFokIOP6C2JoqZvYe6
	PNaD5BlV3HutyAbAUA4=; b=NE+p73bPN3ahQPGdIi5YY5hyFQ38Ob4Ba70MnpBa
	cgNW44UkH6vzVqdajHLjAeii2LDUhmWSJ3wRttKId+OEvJGTAnjz8teTffNhoHbr
	vWJnUH3+M5Gfnd75ULtX/QjNhmAGDeM95iLyM7PocPcVGCTSX9aE4rjUIbBZE00c
	hstLQisITl8lErsQDpMJ8msWZ9vAlfxSWNBv068rjBrt+HmDVR6KFE8nS6lBrA4b
	50ATa2Sv1NbKsKs7FT7OH9LS/63lPG5GVZTjpi6FoyZKDbVe30we+5UjqgUOon2x
	khmPUdweZdqOTUmvbAcwvvobXlh8fdmW8XnoAQeh6JXHxw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h16wcupxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 10:33:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso1161215885a.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 03:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790850782; x=1791455582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z+fRcNyFokIOP6C2JoqZvYe6PNaD5BlV3HutyAbAUA4=;
        b=B1G0ygvI/kEkexvcG/wpvtWaB+uQ6PmxvmLW0lPy8AYYMwfus6VXCnQBW7oxNHAaIv
         WVZEZcZGnrp5pqrRKVtgLryBd8vzstRRnjJXILunG/0Yxurs2Qs9nSnbanFLf+S1qghf
         vaoWYkNDl0MjwSwwS3ql2Lzra83+EOYK7t7e1P9q2F3ibg5GXMDzRymIeU+LfKmdXnCC
         0DnrviSz304/ibNSXFSZRP71nUicAYXbrNjF6tkFD19vnIInFDx9cFbbdyub/p7D+45C
         6DtoYCDjaLftHKmVFlwW/bLo7YOgvsgZx5WDvn+e6Y0wuZqifQPbE6fm4DgI5lbRNVA2
         wdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790850782; x=1791455582;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+fRcNyFokIOP6C2JoqZvYe6PNaD5BlV3HutyAbAUA4=;
        b=jYxrenlV69wyaeKm4LcLx1qzbqeR8hTLenW13zgFVcWLPtx+L+H6JNJ5njOsFP8gep
         e0xzcghMjPafE80SFZxFNreDH52105yPDNYzeVeidMBROs88MLPCnsRl4uYmq43vA18+
         hemdYj8i9FbFh7NMMbyE2ostQIIjHiW8cMtfGwuiGIdsgsfqnuzSGqmkjoC1uw2MNJmm
         j/BNOEtb/YPgIyheL45MFql3QIRJKiHwzIH6vRGk8JhPZs7kTmvQlQ/OHC/zNlhIoxGe
         TCUJRZL5OvAvmp16imoRhHYaKcAUiPaNcpE8CywW+sqMALcmmWaq2Dcq09FPW8YrGdYE
         FZGA==
X-Forwarded-Encrypted: i=1; AKwUvBx8ewa55HTNfMwNJGRcWXCIAy9t1D6i2+j1vw2FDYEMDVNyr8zCK7h9MG2+kHvBB1cxgVYa1wWelOQTeTU=@vger.kernel.org
X-Gm-Message-State: AFuF++lFFlsjtBPAFoDP0uUy6PW96V4G1bNo0oc/RxurdkMFVD0E+8Y0
	YiZ04LTVJ2kaPFwkC9IQC9+Vcxm415bOIjSVkvyp1NrNf/I6VptBER+TwnJ6jW5xcrCy7r7jFQO
	/YYZvsUfnGFJjMLdrup1gltBFTaSKul4p9o82ikLNo5LMXZpB6I1aQpThYxa6w8O8A00=
X-Gm-Gg: AYBFou12T1I1aPIrpNRcj9gHBvJsDomKpogz7v9jDJyEOdRuIcXgLgBsOYauuIyZNvw
	hdQr6WwnvuI5rQ9ysW25lPLbbnZH9io6bg7Y9EjrJ05PZJtC51+fbSNyIB2mgaHyjGrv6AJKoPP
	ybe0cfqvbEMRossinS0Ea6IzIc10MI6AMMASFoq1shy0I0yp7UATda2BsFVeAHg/wO2SzzHc7Pt
	24Z2NuaScyIr9jTuZJh7LIsoZT967RJPrKRgCCTAIVLRcivvGwwGOKnlmk0q/yGkGG7S1an+DNi
	vgTQ/OwPyS/joUbNxFWShDGffDNttQJFiTpiyOvp/UxtE63XEUvulTMWXj5f0mhW48kAsDkQEF9
	7QqZIpeLdQqU5nlmNGIDOERxnnhdf7pDmOSUOYmq8s8SY3Bcko7UK1XEJH7aZLo6aBUerhO7BCF
	MlqdthgAq3vUTm
X-Received: by 2002:a05:620a:4153:b0:93b:ca79:3b0b with SMTP id af79cd13be357-93ca97a1484mr787791685a.24.1790850782203;
        Thu, 01 Oct 2026 03:33:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4153:b0:93b:ca79:3b0b with SMTP id af79cd13be357-93ca97a1484mr787785885a.24.1790850781615;
        Thu, 01 Oct 2026 03:33:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba44059a7esm460736e87.5.2026.10.01.03.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:32:59 -0700 (PDT)
Date: Thu, 1 Oct 2026 13:32:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v7 08/35] drm/msm/dp: add support to send ACT packets for
 MST
Message-ID: <aolbmfnrk6qkfifib6bmhslaro5z2734ydfip4mnn3go4efpsy@2d4m6nnh7ogv>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <20260929-msm-dp-mst-v7-8-4b81473185e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-msm-dp-mst-v7-8-4b81473185e7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MSBTYWx0ZWRfX+XZ+7ppJqUXs
 bH/JeJEHohtkqZZ1WVnNUw5Hs2dwtFDyjxoJhftbh+CIBTBnd4nnOJ0fIVizOBqBfIrYIFbfV+o
 I+0hNcibxc8N5rU3kSYZtxHt3mrZpJ/ITW5mssepe6c62kb1yIRrXQkyDRDLCTRI/m3gD8fivGO
 yAmmRS+eCsf608mctv4rvYwR+ST6gZlfDH8UnoL06hisi3r3zwVWi21ud2GS4UWL7nqpBjKysl5
 fL41MYq5bhj2vt1bKY/ivRKsz901WbAEBVEdo9gsT/myL/MwT2Smmq9iGGTOXY1o4LVHjl8LfBk
 2QC5JTeLHUpGuNmKe8ZTnb+IGhkHwu5SQ6IFZNXiPHY7tpLbUKd2+ZP8cp5XjbvdhXH3ili2vDA
 73MVo0f6wq4ACS+uJRB+lIvAh2RvPqN56FGlOgTePrzDr4dIQqair//JRD66A6687jKJx/ICNxw
 gbUF2RBi6lLxUvBVBUA==
X-Proofpoint-GUID: -xy0W0efPbwYHSt54LDHSXIX7ChGaqzr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MSBTYWx0ZWRfXz9m7YzqIfv/K
 pHTaQKycaE+NrzA+n7zvK7TmebO7ty2/TDO4MpK+z7JRXF83iZBMAfHAIGBypOanH7TTn4kkJZy
 BjRTjZR+RgU5P1yqFSRcY+8FmIaBV6I=
X-Authority-Analysis: v=2.4 cv=S51MU4sP c=1 sm=1 tr=0 ts=6abe36de cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=tbiIBGwOz-cSeEb3_YgA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -xy0W0efPbwYHSt54LDHSXIX7ChGaqzr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010041

On Tue, Sep 29, 2026 at 12:25:32PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Whenever virtual channel slot allocation changes, the DP
> source must send the action control trigger sequence to notify
> the sink about the same. This would be applicable during the
> start and stop of the pixel stream. Add the infrastructure
> to be able to send ACT packets for the DP controller when
> operating in MST mode.
> 
> Add REG_DP_MST_ACT, the ACT trigger register used by this sequence.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 44 ++++++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 ++++-
>  drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_reg.h     |  1 +
>  5 files changed, 51 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index e1614bc49a7c..65d22505c2b6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -142,6 +142,7 @@ struct msm_dp_ctrl_private {
>  	bool core_clks_on;
>  	bool link_clks_on;
>  	bool stream_clks_on[DP_STREAM_MAX];
> +	bool mst_active;

I really don't like the idea of having this flag in two locations. Here
and in the msm_dp_display_private. Can we have it in one place only?

>  };
>  

[...]

>  
>  static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 83117e7619f3..472429d09200 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -19,6 +19,7 @@ struct msm_dp {
>  	struct drm_bridge *bridge;
>  	bool audio_enabled;
>  	bool power_on;
> +	bool mst_active;
>  	unsigned int connector_type;
>  	bool is_edp;
>  

-- 
With best wishes
Dmitry
