Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793150098;
	b=Nd7g6p6SW1cEFqmBR1gHQ36gHJ430zxRiM9GA9y9VprPUALTQMLhmZgTmpqLkTaN37jD
	 q5RpPOhN9HFMbc0lIdIJ9he4BboCEjZSYWODq9NArSCjpqnwViYyEGVzLOVlXKvbu6lDY
	 RWb5g9AACkn2Cf4a+cgKVtPcDqnDGLQYIog2dQd7WbSV4xXwLLcv2TYGyotBdpyGPMRHW
	 3rl2a96+lnkR9kX7COf6+pPDJCeSnGDr3VVsIapxEznPhAOh7QGaUMZ/avaMFI4rxjzk9
	 3C0rNYpbaTrjBra2YxGpIYD8CqTNg8ZwR83mw+EyvZZ/T+ZcRj5R64cMu+quWIJjDBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793150098;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xZH3utzkTV32x5e3Qo7yc9QKlSSV4XGUFUs3fU/VUmE=;
	b=zY9dPOKn+vZjImMbHo2P2mqFRX4UdGXIZXD7p8beqDVrxBBMysQqiKPftkXlQm/YiQHu
	 xIfINf6IdvFX2whKfliDjdgxSU024hb0OGpufhJrtqMP5E8CsIU+23TaeanvJ15iCttsm
	 UxTSA4af0DUWQrBv1RC5CbfNCnr2hoWBtAKbO+HJrOU5LGb+/VD6FBwSk9tmRFAeuN2RR
	 kRyXICHj7im8qu1T2sPggSBsvZWO90+NGz58Ft16cAJcUapp/vYTjCHRI5Cp0iR3+3meY
	 Bn/mUHd22z40LmK2kii004oEuYgFHdMpdCIhca9ilG6F+/RmX05HUldUzEApYGlZK4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y+vSERIw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B9tDXsVO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B59606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94B59606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y+vSERIw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B9tDXsVO
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S0jAHr657963
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xZH3utzkTV32x5e3Qo7yc9QK
	lSSV4XGUFUs3fU/VUmE=; b=Y+vSERIwAKZcDLiMG2qxIfjdEWYbo7A036dCT/dE
	aug6zLuixgg+G0du54YZ8eLh8j66I4gk97XD2Ju3GXe/VsAKA8AAaZVJ/chcsu/K
	p42DyppHFHITrha/JroAmgpwDTajQrLTqrooMQJ7isegPzIfFy3yurB8Atna+/yE
	EXksK+X1LX10lKWuk6ROl+RyAxWROTJ2xjulw3WW2oEeG6Z6BSTu+esvkUgu53mJ
	5rnShGoN69TvP34c2p/SPVl/we9HgIejyQi5KgvmgnPSxIzfIzb+sWcJi40Vjwi4
	C4tSe5W3pLHP/99fEgyQYWgcD8A4+GePfqYNBnId0E2vBg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpsr02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:14:56 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98bcae867a1so156176241.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793150095; x=1793754895; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xZH3utzkTV32x5e3Qo7yc9QKlSSV4XGUFUs3fU/VUmE=;
        b=B9tDXsVONULLDF5WYRYfJK9qYeI4SlhRKhYVgV3s6LuhhiS3sGeoQQyCjp30bdFovb
         2JNYDAzhf28p4RVWvPBstDRtdLf4qAYRWB7km0oR/6jtxwDiqWrTP1iKOf0tJqNB+bSO
         xNu2K2To/oQsaIFUkwMIUrbkezjT/QTxR9XiT0BytDoQ0ON4VAX4zezgYaTvGdwrmEbo
         JWGPam0YikiOy2iK5qnI+21Xi6zt10KMxETlCo8DCpPoroyMJZHzLaXGbcF4Osi6+nCW
         ynMyPmy1lyePaPjmZYeZVT4kW2jv6jBF3cGtJMzsQq+uXWxIMYrPnpwR5xcptyDPUEMK
         d3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793150095; x=1793754895;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xZH3utzkTV32x5e3Qo7yc9QKlSSV4XGUFUs3fU/VUmE=;
        b=Y0F8wHTtVGODK0+Z2cVhUYu/9pM2TasRCsAIm2wFE6JezlgQvbvdMVt5pbQ4eahmPc
         xm+Bi5BZZrYlWyfO5nVGlmSmnuOa2AEKNatveYznQ3X4QJ8fjwhlUW1DDM796rH7pQAG
         zXZlaUvpP+QleyrZl9/mFN0EfnllBkTMscVYpR/QI8Uejl5BTlcH2hTUc25cTbSFefyK
         +QMD2qzbpZ5ZzxeS8d83r2aj7Riaw0GDUruhkn45g6eH3aF3ewB9CwZ6/mqelaVlqb/X
         nMratGtImygUja6wHNx27QXMCEd05vn3qA/iiKTr3w1jEoVBxlApLTZnH2RFgTDPG6EJ
         jAUg==
X-Forwarded-Encrypted: i=1; AKwUvByTGgba5UxfvQMCWl53EtrCF3N+AnRDmr2g/yeo3XJ4WT40Hf6eHV7z3HOg0NAKYPwLyKXQnpTKZCkA8Ng=@vger.kernel.org
X-Gm-Message-State: AFq9FYIP5EMhbwjyq53ixSV+SedS/cR9EP9EWMrFZffxYO9SXTV9CEEa
	RrHAkB5dHzFYIxGyjc5oJLz1U/9/zg8KguIVHxVsyY821IY/jmoeAt4U/4TQgtVdJjP+bwGlZ3M
	LOMUPn28WT/spXfCrc0HOEHi7cd+SeCXBUUOD8mEjH3lMcoRq9qHtZTfhzmA+Ka5Ukcc=
X-Gm-Gg: AYBFou3FRsALde6pdZ4EAEAQLuX6CvWDWVbFkOwt6byAyaiO1YSZAW/5EbxIJLQwb10
	gtqLrWFGZt8Z9LzPwvP1+8xoRiF5w0hiQiXqZAoCicitwoqsG4XcUz5VLqq6ksXaCix6ZxO4SZY
	+k2mSFAmkEGCmmhh9jqJ8Ipz3tgoGlpSx+Oi80r187A6mLlCLnd2k+Y48cEE2Bb0OcO54cIwLWL
	rF7BZxQNAtbqeLoChVu6jBArloZnu/2dhrGqzM6GAIk4FSUNpzCFMWWAe3d07dwV5wG7ABVOcNu
	K7VomCylsBKvd2J3rcMPK/PsXkBazly+xX+FwwlkoVpPdUe35aJ8YPVBej9fgjFYXAq1AwaZ1vT
	XSqmmxDxZY+bRPDWawqrFlsL6b4mk6PBIBbsYUZR3YljTZtFE4teoEakOvYew2wDjV+jLqdHqSq
	9GFf7oHuZvLUdh92ZCN1w90KZAJ6DdhSfPPE6X+8C4Akhcaqb+yZ+hKiayh6r6UA==
X-Received: by 2002:a05:6102:5688:b0:7cc:ccb:ce5a with SMTP id ada2fe7eead31-7d03a5c5b97mr394314137.28.1793150095446;
        Tue, 27 Oct 2026 18:14:55 -0700 (PDT)
X-Received: by 2002:a05:6102:5688:b0:7cc:ccb:ce5a with SMTP id ada2fe7eead31-7d03a5c5b97mr394300137.28.1793150094940;
        Tue, 27 Oct 2026 18:14:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3d9esm27236441fa.26.2026.10.27.18.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 18:14:52 -0700 (PDT)
Date: Wed, 28 Oct 2026 03:14:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 5/6] drm/msm: Convert map helper to use dma-address
Message-ID: <wxfx4nhwdx6dud4ahy3rfz3btfto4t2zor2pjbotlqpglvwolx@jhnm65bzecnq>
References: <20261027230452.130031-1-robin.clark@oss.qualcomm.com>
 <20261027230452.130031-6-robin.clark@oss.qualcomm.com>
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
In-Reply-To: <20261027230452.130031-6-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAwNCBTYWx0ZWRfX4Sbpk9DWHUq6
 Uxsj8phwhNKnQdfnLTPwQShvFIrmsmtDpluYcD0HdSgeT6IxFkA5JkbFl32S+m6CAjBe7Jzfi4g
 zOf6SJpPiX41sLyCtJoxYI2Y5WMTyZWAK5fHNXXFk9GRuNKrKDghoKfA5dm3e7dr67dv+G5yzOg
 Ko2WYbegQ5XpDu0hlQbdydil/+wPrfIbavf9q+6Ttui+bzlhBYXd1opEhUeX2Hu+6VndgIeeidM
 c+8k6dR+j9/orb1dOiXBMZ0LQp5H4RlvobYN4G2pCr/sm24UtRH/oNdClR7WBFMqCGx0uyhm7mE
 HUgbl7kVGXhqyer7Zv2HnN9Tp1445WzZ9kG9UHnl2K1FYKgUa2lm/VG7aG800D8yg2rrKQ1tqVv
 FnBPQD/D46RHSijp/9tZDXYfIIKQU5fW5W+AeNFoxi7kEyaZQEjQgx8b5Z1aTmnA56RWtaNbLtW
 I/1lb6m1Rqv3x67zqbQ==
X-Proofpoint-ORIG-GUID: gdyzQqpHJjBnN1PzvPly0pGOVfA8PQuo
X-Proofpoint-GUID: gdyzQqpHJjBnN1PzvPly0pGOVfA8PQuo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAwNCBTYWx0ZWRfX4WaP3wM8Kia1
 /m0P2PZiiPPZBNIfzyj8x1AeJzhqyE4JGL02NDUkZh/V+fqsYvqsWUV2mhLvU3ZMwsDLxpiX8ui
 J/3/rHKEevHAqzx+CzwO1twZS62u7z8=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae14c90 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=Uw3JNNrttYxbrt0Y1o4A:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280004

On Tue, Oct 27, 2026 at 04:04:48PM -0700, Rob Clark wrote:
> Now that we have everything unified in one path, switch over to using
> dma addresses for setting up the mapping.  This avoids issues with
> CONFIG_DMABUF_DEBUG stripping the pages from the sgt.
> 
> Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com> # x1e78100 (Acer SFA14-11), v7.3-rc5 + this series, CONFIG_DMABUF_DEBUG=y
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_iommu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

This commit seems to break GPU on db410c (which uses qcom_iommu).

[  104.954564] [drm:a3xx_idle] *ERROR* 03000600: timeout waiting for GPU
to idle!
[  104.954932] msm_mdp 1a01000.display-controller: [drm:adreno_load_gpu]
*ERROR* gpu hw init failed: -22
[  105.958559] [drm:a3xx_idle] *ERROR* 03000600: timeout waiting for GPU
to idle!
[  109.082571] [drm:a3xx_idle] *ERROR* 03000600: timeout waiting for GPU
to idle!
[  109.082670] msm_mdp 1a01000.display-controller: [drm:adreno_load_gpu]
*ERROR* gpu hw init failed: -22
[  110.086572] [drm:a3xx_idle] *ERROR* 03000600: timeout waiting for GPU
to idle!
[  111.098576] [drm:a3xx_idle] *ERROR* 03000600: timeout waiting for GPU
to idle!
[  111.098674] msm_mdp 1a01000.display-controller: [drm:adreno_load_gpu]
*ERROR* gpu hw init failed: -22
c[  112.102576] [drm:a3xx_idle] *ERROR* 03000600: timeout waiting for
GPU to idle!
> 
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index 479e5450a4dc..c2950d32c507 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -153,9 +153,9 @@ __do_map(unsigned long pgsize_bitmap, u64 iova, struct sg_table *sgt, size_t off
>  	u64 addr = iova;
>  	unsigned int i;
>  
> -	for_each_sgtable_sg (sgt, sg, i) {
> -		size_t size = sg->length;
> -		phys_addr_t phys = sg_phys(sg);
> +	for_each_sgtable_dma_sg (sgt, sg, i) {
> +		size_t size = sg_dma_len(sg);
> +		phys_addr_t phys = sg_dma_address(sg);
>  
>  		if (!len)
>  			break;
> -- 
> 2.56.0
> 

-- 
With best wishes
Dmitry
