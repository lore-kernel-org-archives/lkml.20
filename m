Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC314FE2E6
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784360; cv=none; b=U+iU2+CAKOS2UZsxLBiB/IrHDQVBIFQxzc9mmsKcRzmV0LpVlEc+3M7ybHIL7/3ug7Vf/j/7444poOl9V4q71EspdWjij+WuVartNQLSoizayl/G8x8JqAcAqihRCpm8oBHhA8uePz/nJzAFJimL8sqyerDoUNh6UgU1LCLtVNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784360; c=relaxed/simple;
	bh=92uvHtP0aB8dDOPbibDyl3wKTqYTl1hlRgCvI2j7YIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6PY6mRHNN0nc5AzzaZ6jJ2BAME+0jCP69Bdqx7dSzzWlMiuHY6rmDxJ/TsfH9h1AfoWoTninS1ehe4pXrKhuaVQB8/8i3EMmmrkGQW4+nZbvcgh5Cys8vAVPzTWxOT6tfGSu/CxwuAdVrsmcgx9qMaT9og+RHXRbulD/cDt42o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CSkxcT2e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FjCzTtLy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CSkxcT2e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FjCzTtLy"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE077a705156
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lVSSkheA67JcJaOOxaTY5iya
	49LPdhkaRKnKJzVkXi0=; b=CSkxcT2e2v3iw0zQDW8ukNDekQ1EQyJ90AyZpxrk
	fJ1EA2EAd/6v6jQErtU70Dv6BAnGdNfKcYb7iZ2bZZSPm749W+a74EqVYlgAGA8X
	WQjhYe5Huy5G0d0AbtBZQxoPRmu8jyLcslGCSDEmQhWVDmPtbi8QZT35TeSCmJ3v
	sCZuayG/N7MLbQkK33Td3lJxb3tc6B+7vTAx68TDwWIpu17SjPeUGsX4aQIVN3MW
	XkBHd5vBMZ9zCymIjxSZwDfBHXTuXuuR3uYp5wNAE/FMJghJOb2L+mSq6PhXA2My
	LnVdFYNKcHczR2WWNvBIbgQHC8mEnuYW8GSue1hdn2d2ag==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h136tgqu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:05:52 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-988bbb0ed9aso1805980241.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790784351; x=1791389151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lVSSkheA67JcJaOOxaTY5iya49LPdhkaRKnKJzVkXi0=;
        b=FjCzTtLyW8oGvBrd122TP5kQ7c2MWpOweEkRX3V44yGY3lYgdm9jrMJrmTKJ47wI9N
         /11uUoN8ubYArJK4UdbZw5zWiJi+uGC3s2p3s/enUJ7BtAk6zQvUAoTN3lwsE5BJ9ale
         feNXfN56S7KNTa4qje4bLHM0FC0SKZfri3gyf7kABbSci6EDXKy3CQ6xGpIvlv2lga/9
         f5lwIPwhCSNXAmQPLs/Om0mho3J2jMoH9NYxcd6lQEHyWjqAV7gequQ7gtDS0pTfXei8
         XSw8Lh/S6FtQkDBkV1wL/ycW65hqYspZPb5XP1T05gO9zKl3SWU9U9LVuDucDBWesvbr
         zJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790784351; x=1791389151;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lVSSkheA67JcJaOOxaTY5iya49LPdhkaRKnKJzVkXi0=;
        b=cvck50TTPPYoyvQFxrMpZf1IQxIMNWE0rA+5rTfAXOiS0If9DMboKubTiGjUzwTfyp
         0sRXPlYQMctki1maO8TX/p4wYESibz0kfvp+2IHnpUfE+vxHAI9YMHnDUGKkAbLn7fOs
         I3UgNSTCSkb0lZu8uUgvcpGtr5D6AOV7fS4FT4UJTbfDuC6v/xZgIMkvoZLyG5G+gIlS
         FpyqeW//auk3gzbcA/NNgNfCdZg7CuL+waa+6013yyiyrSNgJrUuySIOYUTkTgLL36GY
         LY4jo8bST5Bfg/pGl9U1K3UMCSiBfFYtiu1WVAqiBNeQNQeRfVR0KN4hrIx6BiI0Fglx
         fs2Q==
X-Forwarded-Encrypted: i=1; AKwUvBw5uq8HU6R0VHsi1UNfqPSBOtuk/h9H5IHA3vh83V/GhPhiW8R3JH0PJXKsbifxXJv/3iOVlrZ8Rn0A7fI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJN+KAK4A9mDGxh1VdAwHCRqXHAlffvDWfscvg3H4WU3BzGukrj
	6vj0lXnp1ZaLgiovLR+/+gRnCYeg3V4g0fjHDlgkcKC2bU7HF+/EsW/rHOGzdOw+lVxwWFCcfd6
	nvk71Axkl2XU70ktFWYGcmBYg6qoRXJvJmQU6EnAnpBKd8zkE49bL6vF0dLMkGsoDu/E=
X-Gm-Gg: AYBFou0bjf52+KIgvlmCL1Z6iRf6QXs1kF1dR7PwP9nGigmFKuY4PUjZ4QItASkbpY3
	+geHCB93AtcO7KVcxI6OYlv52nt6ipvKgbuqmd5dKgvIsf9EZy3pKYMWPgJSGmSdeU7v/aDKcQP
	YP5BMHd10Oeq0NDIPzTxbPUSMl96FUbymFmWOPXURpjeR8aGG4HxefFW6nVZKAqElSI/Gnpllgl
	s9/5ebtczAEKMR6nXSbWGBPxokcL9+1uKpQgrOzW3GbGq4RGdxhZe4BcIFCwb8DfqIILW7to3Mw
	QSs9rZbJTuAJjFy8pDc2finsDncrQVwj1Leqif78zZK4D1GuQxwF4D26dsfjfuMmxullGAORZnP
	hpwBQJ5djnzMHimVsDK5rACjp5RhOV7/0GyCn7V2dqRXAgEOYl6jV1eBFLmOTx2AMRbdxZ8nRRT
	GryO41tSX53Jmn
X-Received: by 2002:a05:6102:2924:b0:7a1:f7c3:3a41 with SMTP id ada2fe7eead31-7be72da8338mr544570137.14.1790784351139;
        Wed, 30 Sep 2026 09:05:51 -0700 (PDT)
X-Received: by 2002:a05:6102:2924:b0:7a1:f7c3:3a41 with SMTP id ada2fe7eead31-7be72da8338mr544540137.14.1790784350574;
        Wed, 30 Sep 2026 09:05:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42f7d653sm89094e87.5.2026.09.30.09.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:05:49 -0700 (PDT)
Date: Wed, 30 Sep 2026 19:05:47 +0300
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
Subject: Re: [PATCH 02/13] drm/msm/dp: Support multiple generic SDP slots
Message-ID: <exo4twskpmrpvuspuka7pstg5psenkeztcj66cmzebhfusjjme@fda4wrt7czzh>
References: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
 <20260930-msm-dp-hdr10-v1-2-dbbf8b2b42bc@radxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-msm-dp-hdr10-v1-2-dbbf8b2b42bc@radxa.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX81ELebJBmeEV
 AlK9IWlmYCUUMViT+2PNPl7nf94ScQJ1ZGeWT+CvjPlEqt8Lqd9oy9u3hTIH1NF3sOyOyDUK6/f
 JlwFGOUQe6XWb9Q0CJlavGxVggzV4Ck=
X-Authority-Analysis: v=2.4 cv=aPFlOr9m c=1 sm=1 tr=0 ts=6abd3360 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=ksxQWNrZAAAA:8
 a=EUspDBNiAAAA:8 a=dRvoGPQ9uURqmwrP_ZcA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: qhIIwikPCdUTo6AQtXXd5QHk7t5h3dUF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX24ro6AEes7YP
 uqgjq3/uF9qgWkxQuMoBsFKwNmBjFkS8PwVUJGmoTF++DiWuQqchmIjKXdOweyZe508rG3m+FJv
 Xdjfcgsn3sP5fyXbWmBxS4/MAPygbSCM7+uKZb8Q0EDNnenRKOyJea328w5DxbDIldhpRYCAoKs
 cDM/Ut93ZcT1w9PjCpeaLeewvsFOVgdg2cDynyRx9Wzp8eQivae+kw7T1SDyGHkkKy2DDum9ZUh
 iLBBqImKdjdyoCcmL3t/v4UmPNGSzlpnrdApztRTiAbJHoL6WAvir6Jun666X+cAWrqUi9eG3wI
 zXrunt+z2WtXZrG24ZY/U8eYGo9wXoNmVsU6TkVabL0KY3yZ4+iVpDw5PCcxnn8+tS4CyUwtOWG
 4SkMgRs7HBvYPVjtZg/ibbq1nRoICWaMjzzd6nZAnu7FlOHBjV0FGI4eGfPGCi7/62TbrosyQqS
 ak7HVYx8veZ6LNZnslA==
X-Proofpoint-GUID: qhIIwikPCdUTo6AQtXXd5QHk7t5h3dUF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064

On Wed, Sep 30, 2026 at 08:41:46PM +0800, Xilin Wu wrote:
> The SDP writer currently targets Generic0 for VSC packets. Static HDR
> metadata needs a separate slot so that both packets can be sent on the
> same stream.
> 
> Allow the SDP writer to address a generic packet slot, and define the
> Generic2 registers needed for static HDR metadata. Use unaligned
> little-endian loads for the payload words and accept a const SDP header.
> 
> The existing VSC packet continues to use Generic0 without changing its
> layout or enable sequence.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_panel.c | 22 ++++++++++------------
>  drivers/gpu/drm/msm/dp/dp_reg.h   |  4 ++++
>  drivers/gpu/drm/msm/dp/dp_utils.c |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_utils.h |  3 ++-
>  4 files changed, 18 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_utils.c b/drivers/gpu/drm/msm/dp/dp_utils.c
> index 4a5ebb0c33b8..226b370ce8fe 100644
> --- a/drivers/gpu/drm/msm/dp/dp_utils.c
> +++ b/drivers/gpu/drm/msm/dp/dp_utils.c
> @@ -74,7 +74,8 @@ u8 msm_dp_utils_calculate_parity(u32 data)
>  	return parity_byte;
>  }
>  
> -void msm_dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 header_buff[2])
> +void msm_dp_utils_pack_sdp_header(const struct dp_sdp_header *sdp_header,
> +				  u32 header_buff[2])

Nit: separate commit for this one, please.

Feel free to use for both of them:



Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



>  {
>  	header_buff[0] = FIELD_PREP(HEADER_0_MASK, sdp_header->HB0) |
>  		FIELD_PREP(PARITY_0_MASK, msm_dp_utils_calculate_parity(sdp_header->HB0)) |
> diff --git a/drivers/gpu/drm/msm/dp/dp_utils.h b/drivers/gpu/drm/msm/dp/dp_utils.h
> index 2e4f98a863c4..2fdb89efc57c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_utils.h
> +++ b/drivers/gpu/drm/msm/dp/dp_utils.h
> @@ -31,6 +31,7 @@
>  u8 msm_dp_utils_get_g0_value(u8 data);
>  u8 msm_dp_utils_get_g1_value(u8 data);
>  u8 msm_dp_utils_calculate_parity(u32 data);
> -void msm_dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 header_buff[2]);
> +void msm_dp_utils_pack_sdp_header(const struct dp_sdp_header *sdp_header,
> +				  u32 header_buff[2]);
>  
>  #endif /* _DP_UTILS_H_ */
> 
> -- 
> 2.55.0
> 

-- 
With best wishes
Dmitry
