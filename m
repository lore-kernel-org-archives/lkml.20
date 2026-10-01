Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F30411F83
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790851952; cv=none; b=frIdHltabFJ60X4n/Lfo9FumBpBdTsktVaezu1IiifIDyEJiRsl0OLFzJdbcnbO86cpU4xbgb7MPbrPa1+yzkGmreDouD2WXlzDpcPG1AP/nbNPoFVWSaKSUXU95RR/SSMZ9x2R6q2xAPgZxgwLG0a8whCbNQbFLUai8ZDtGzcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790851952; c=relaxed/simple;
	bh=/FKUHm1Q7AGJpg4CoKepSeiJp6/Qt/IH9mVd+KlQUZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nz714V8aFiS8PRIYDiz5+oVPc1MNIVuELcgX56PIsGLUCfQspMldcGT2hPOo0j08HWe6/lKRq1aWPfPn6ueHEf3iR00ppNICctFz7OfFTvhlQlVHIj+Qr8GFsYv+in8ZHKbGiW/zMxokB5FgOPzCLq2AuRKHqbOLR88pXi5tDCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FafYS09y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hFC7PWgB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FafYS09y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hFC7PWgB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xsFV1661227
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 10:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=seNlxQsU0wllHJnL2cV3aBSv
	wJpkeEtX02XCtF/70CY=; b=FafYS09yqsvT65Yhy3dpAw0dLe2AMzE50o4dWqC0
	bKlv01b6jJ5EUHqvdap6B/wT7rCxVcn9qcevFkPyQfJkzsq8LDHO3ZNv8nHlHQ47
	kD1/EGik/UOcKqKpR4RVaAnGQCXyKv4GbxOfI7dN4x4hqkROIcEIbSI3wruTTeQg
	HBOJ/xDJJVwWT3OGjnVPh+I2+sR12pSurH3PRxVy8Ogfs4QWTJIc/YsK9ZP+ybPe
	cdy2kwZQklyZKfajKHFjJaBsj+vRYA8InJrpd7/rk93pWWbPLHBCl8UAGoYaNDuX
	okGh74rAmv3rBBu6rFc218GDYvmLs6NFH7+rgATcFKSkfg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h167pm2mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 10:52:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c444b438aso1370916985a.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 03:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790851949; x=1791456749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=seNlxQsU0wllHJnL2cV3aBSvwJpkeEtX02XCtF/70CY=;
        b=hFC7PWgBrcszsyi2pBs5xCzvJs6Kuml0+eY6hN4eOM1e11d/5sg1ToIZFNTcRTdXkk
         /0EOnv5zF6RFclgTEQsh2MNOZ9/N6elf6AgmCr+qQ4XLgKEMKPItOMNhXKPqEJ56hqsM
         GcHC9h1C2o9cQ/fXpxkjZbf9rr51h1Q4MD2tROeNxwbJvgzsm0eyBX2FmKIcvGkQKrUz
         3T1zqHp/vonlaJKx9+glz4N6uS6uDcs4cDMvr8aaHtx/SGnaZyj2IFI2Ds2IyvuFbVn8
         O0FQludQ9H+TMUzCpVBYbMufDeQg1RNxupvetAfCAqx+bUE1D8rXVZUuxk5YpcPT7Nv6
         u/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790851949; x=1791456749;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=seNlxQsU0wllHJnL2cV3aBSvwJpkeEtX02XCtF/70CY=;
        b=NcKyq5zEbUe9SykcBn+Z8J6MEoCKc4+NTbK96vMaJuVAuJvmPF1ELLmewr3S+IOv+/
         7EuRSASQ2BZEw8AF6zlerxWG1PixvNosQYwKzieHQTGkuXdIb3iVaijp/fK5UGWnitDR
         dN7+ssay46uHoGMASgvo5xDByYV+Xgo3IuHbU6eHPrSlQycgc7o2Z7yetbcYvTg20Wad
         n8irMglyosYiufkvPAfIEAVQhJCpEZr+fhEJ8s5yxNiXRBOH4S77q2KxnrD4zg3NTWUN
         ltnrsr88QG94yNiD6w+1upSMbozPm/8M2s+CydSb36DqGD9bYqcii/xSXWHQ84SBwWi7
         BVHQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/6ER8sGEUrak6wpS2MKu7MMwg7gS2Q8DwxKN8N/OdKDv3LYBVkWRVv9SgGBPFNAOtwbxdmEkXuK8C56M=@vger.kernel.org
X-Gm-Message-State: AFuF++n3+7hfBwkPUNmmnmunIGdux3zqlWWMqlCdXwcT56jHnqtWwa5M
	Vr57IQhxnfEOciKFcbhZwquXhcXfkYx2l/9B00mWOUchHbX3eckRjiL6rSQ0itnSdxICS8x8AMf
	s+v121dRB1DrUgUlTkXAE2/3cXAoyd6Nn/Sfr5H5TzegDnbQGZheMggp/PLajTAwOxds=
X-Gm-Gg: AYBFou12ARx1Hu4aCyw7weGG+Ki+TKZxACoE1o1ndphJKvHxVwBqn2Fi33kdK8ZOIYT
	axRtwk4a/Ot0oBTAjzlTwz3aPlbuwYFtaGVpadWxuhjTmWd0GQsxH+RH1XB8GFbiiewnENiMtCK
	DmH6qg9ctZH5Rr30PbM+rY+OI+Tpw1o/Cusn1LpMoBOa8bb7Vxq3h1lyVI79Wf42//E0zP77jK+
	nT2H55PgNzF9SM6FgSl5C++Nb6HRezK7v5TqqwEMIrBJkVPndP1QsSAdNWac9ponOV2cFaihhvP
	1Ebd4oHtntjGGhEDB+8ATyY4dm3J8FkJ12sQ3juFRtgMI4886LmzjsENQ17L7TPtj0MsIPAnJ2W
	ezqKEDFt30UR23UOdakkOjcS74HhwiYsqbv1n8as0uLASfKj+bnLO7Vu7Tek+jky+mxTWCowPhz
	thE6YO7QZppDcU
X-Received: by 2002:a05:620a:1d05:b0:93a:3d67:391f with SMTP id af79cd13be357-93ca95da7demr801489485a.7.1790851949393;
        Thu, 01 Oct 2026 03:52:29 -0700 (PDT)
X-Received: by 2002:a05:620a:1d05:b0:93a:3d67:391f with SMTP id af79cd13be357-93ca95da7demr801485185a.7.1790851948771;
        Thu, 01 Oct 2026 03:52:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a7be8b7333sm4165741fa.23.2026.10.01.03.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:52:27 -0700 (PDT)
Date: Thu, 1 Oct 2026 13:52:25 +0300
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
Subject: Re: [PATCH v7 13/35] drm/msm/dp: add support for MST channel slot
 allocation
Message-ID: <agm7esy726no4u4cntecmllz5kxdtxaue7xcn7vdhkuh73lxau@r6mqybgiyl7f>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <20260929-msm-dp-mst-v7-13-4b81473185e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-msm-dp-mst-v7-13-4b81473185e7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: htfqRfA_FHcmGt2DEk6K9UZEIuPZ7R9s
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MyBTYWx0ZWRfXy/N+CEVcXIOg
 kgV5kVeo2KWB4rD71LxIZn4z1nPawbUVJLUlMlqouKS2Bth9Rj1/n7G4OGSMq0nMlsgtcKqPJfi
 0ymCJveW39Ohp8WIaxE1dj1pylPzQck=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MyBTYWx0ZWRfXyWcAX/ZnYb0c
 slL+p6wZGieqcfgg9djqRXJD045jaDoa2b6tiPB9ZhG17aXrOPKNr8fPn4H4J3ucn+DAwW/c4rQ
 PJbFzJQLXBcAeJ1f8LsP9HR9M9usFh0AQMEprlMYJc/Fv3mBJw7mEyjZJ85WNowAz3moUBL+ylW
 ML9jqttbRi9OEaftC+0FnAcsSG5HbQfXqIPZpqCiKBl56shP4slcUk/U7lnrNRbht4YxESumHyV
 WPkuX/vKWJjUnAcAt36+3wTL916O3srdgWtgnlwFxTiHK4jfZZVwzRgkhGlsctCgnyh3uDlaPkU
 P2wj9pzHoaYf+1JdNAL9kYzWLuSobnUE0oZGK/l2oJtxto6VK6sBcW9OsQO5dwMzdoCAFKO4H8D
 j70JAxkAYfZLfjJHXk1ER4cz3oKF5BHvqf+zMYOz6VaMUz6cCyTa3P4+CiIuZVE6IzJelUauqMe
 8eWsGmg5kOx1Ch6KPlg==
X-Proofpoint-GUID: htfqRfA_FHcmGt2DEk6K9UZEIuPZ7R9s
X-Authority-Analysis: v=2.4 cv=WpC+otfv c=1 sm=1 tr=0 ts=6abe3b6e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=B9W9OPTfjs53PBBgks0A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010043

On Tue, Sep 29, 2026 at 12:25:37PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> DP MST streams share 64 MTP slots in a time-multiplexed manner. Add
> support for calculating the rate governor, slot allocation, and slot
> reservation in the DP controller.
> 
> Each MST stream can reserve its slots by calling
> msm_dp_display_set_stream_info() from its bridge callbacks.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 187 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |   4 +
>  drivers/gpu/drm/msm/dp/dp_display.c |  13 +++
>  drivers/gpu/drm/msm/dp/dp_display.h |   2 +
>  4 files changed, 206 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 929e0f94f8dd..02732bd4efa1 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -83,6 +83,7 @@
>  #define MR_LINK_PRBS7 0x100
>  #define MR_LINK_CUSTOM80 0x200
>  #define MR_LINK_TRAINING4  0x40
> +#define DP_MAX_TIME_SLOTS 64
>  
>  enum {
>  	DP_TRAINING_NONE,
> @@ -119,6 +120,12 @@ struct msm_dp_vc_tu_mapping_table {
>  	u8 tu_size_minus1;
>  };
>  
> +struct msm_dp_mst_ch_slot_info {
> +	u32 start_slot;
> +	u32 tot_slots;
> +	u32 pbn;
> +};

How other drivers handle slot programming? Is it something to be shared
between the drivers? If so, maybe it would be better to update MST
helpers. Or, asking differently, why do we store it this way? I don't
see where msm_dp_display_set_stream_info() will be called from, but
isn't it a part of the calculated state? if so, all the slot allocation
should be stored in the state structures rather than storing them
directly in the private structure.

> +
>  struct msm_dp_ctrl_private {
>  	struct msm_dp_ctrl msm_dp_ctrl;
>  	struct drm_device *drm_dev;
> @@ -153,6 +160,8 @@ struct msm_dp_ctrl_private {
>  	bool link_clks_on;
>  	bool stream_clks_on[DP_STREAM_MAX];
>  	bool mst_active;
> +
> +	struct msm_dp_mst_ch_slot_info mst_ch_info[DP_STREAM_MAX];
>  };
>  
>  static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)

-- 
With best wishes
Dmitry
