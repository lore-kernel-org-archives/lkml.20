Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4CC4BFE77
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784239; cv=none; b=PoZnWiDY2aXPi/1wPbxpFoprYwytcPPG1pOdlEgRJq9sIB4wkIq66Pzw6l8wai3FCa2JYb1D7D/Ua/lj3n/53XHRUrPcYVHqJEPP/ckkAUhEUgs1N2OBxm8y5Npbg9Vwp1PkIqPGSwpMFDLeMOiH0ZiJEUxu5QPX6cCnLM/W3jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784239; c=relaxed/simple;
	bh=lqtpsWq3wo4si/QO8G3pKIJCGKQhQ4+/l/BkuckMCt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L19cz69B9Ijccsn10/1cxH2RSZBq4SeWxDKSIQuTIEFkccNvSz3IiMzcbiOYmZ2ZTx3QCCV/hYKAft/+MAgFguKTcYljtuTqOjRGYfIs2pE+5syL6AEHK4gihSYeSHp8xBZRnRkQfEuR9GGIrGHLc1H2Jm81CwEm3EBlcmNo4ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T9OBUABX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MLNDYPre; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T9OBUABX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MLNDYPre"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UDxobW3063753
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Mw2NmiDzGrvm0Nc5TJoWz+Vm
	SYKEEwRfglbvsWyB/cQ=; b=T9OBUABXWxadqO2acfVmAO6Ln3+3dEoJPlZCgzAt
	yTnk+TPxblHPGXGaEtdrz+FpjA45cJfPr5xaXDhrdJEG72JptZdAGIVIbRMVmEAw
	JbeDcMh5Tupv1Aw3r4epR3AwtZHAV3lVBK7fFhsWVr1X5epPHYjyg4abarTL2Joc
	NozTbcICpwOdFRPTvGBgaMbOUq+Oj3Fw648kXEQK4UN0bqJTgjRWKNg9qSEb+u6m
	nJGlQ/Ypj2KQaq5j3kjaK/1WYkBWDK/RNSOIo09H3n/W4b2U+fRghjxUiKowNkou
	izxR9OA71idq7ireXNMUvcz/K7fUroVAcYxz+/2x6dG4Dw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0smjkf1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:03:53 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bf67e46ae0so38372137.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790784232; x=1791389032; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mw2NmiDzGrvm0Nc5TJoWz+VmSYKEEwRfglbvsWyB/cQ=;
        b=MLNDYPre/8zrIiZrQJA4EUQEU3LBby8fyTn+yQUtHkB8ydgI5HRU+aQyWo9+HOKeF6
         goPTtKCUGZtws43o8/WqXO7NEwwzFmTM31Br/1e4jNoyxY13wjii6bngdeLF6JBKFhCW
         iooAcfhvxTPXRHwiIlBjdsueyKLJfP25HsN29nWWg/aTgmCUkg98+JypslDnbS7M/iz7
         7UmjPNg4DgwRVsXQFOo2vTo43o2vQd3SqDTBY91/+bfCf38MBiWDUWye1sOev/bbrlzz
         dl++MoRcAPeAjWw8i52cofD78KvmSBb6hBbTywJXWZQIMnnVxJcTSF8vE7WlWQ4ACz4u
         yIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790784232; x=1791389032;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mw2NmiDzGrvm0Nc5TJoWz+VmSYKEEwRfglbvsWyB/cQ=;
        b=eyup4Jw/2eJ4paTSVhzcZh5QjGAiGgk97DCc56OOwI0WY7j7vnQNwEd2Zld83fnur5
         lAMnT3PdnQ+f27TQBm7Gx60Y+w/BXFerwotf6cxKG3KCOPhDNg5pkZmrWp0eGnbG/itC
         5iOjCkd+Lgb/xkqxci5VY85h2pJUc/81X/6IdzxTIl8jnxWkQJOjNf99O+EI05QBe3ZX
         Xjs0ay5wMnlw8r8qgz0+VJZO1uDjwzrWWM/t/TXLqgVYU02IEvi+xeUzcyKLikeQPjDO
         EFL3SWAGaPsRLZsOVCZ6E+CQCs0jwpG7WEfUohVTSHDtFLNiP46eYu5uZGva7Thfdi9u
         gbqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHuD7iRgBpAFOAM4UZpiYyuTRggk9JDp4Aan0Rs84+2IbKMsA31DDEqx/oM9D9FekXGwx7k3+OpYdRDuI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVMx+Sd4iOlsXDTRPgkGOh1AqowmJbRnDa4az6UOXROiL0xhMU
	YkQul55I2nGMNZHGPLADF4CjNfJDpo6t2ol4xTNrPVJGzQsuW76gCC3XUOtBpVekh863K7GwNLu
	0uEHBlPetfkUpr34Ugx6ETfhtq1eEDqRxwfd58KZNyHujENTVovJrei5NZcZOTxpi03k=
X-Gm-Gg: AYBFou3eaME/DwF1oAy4NwN1tytUdkGQnwsbcp9crR+1D68WZ7yqPdIMY7knTE0ecH7
	hrbAxQrinDrmrygHp9p0vB3dfsqAqo9ieHu92ndSdDbZ32216sNRQh+gwuNKe2QJYx534uHbxS5
	o2iDGa0LKFK46ZMg6W7hFoJxVVJJL9ATwvgQ2a+lRBfciDmlQyBogJpdQ4XPP252IxCn1ZLkfak
	UkKaZZbqZ+Qj6wxmN7u2IEjmrQ9EUdnhp4smy3ZtcHvtQ0geVVlJgMWlani3bnXjhbw0OTfr6Xn
	SDJwV9oAaA+gip1fZ8xUbYnZlM78/Gs2/rJgROWg7yQqfVjI8HHef28KCLh6J46gi578uI+8qAO
	5/pwvRnngmJlcVXgbUI0NXB5gUb2X82Y0HLb62f4CY/pKBmPFT0AFXiBizY9tuIHAsB5Ey3XnxD
	zXl30TtL2VdakL
X-Received: by 2002:a05:6102:162b:b0:7a7:196a:84e6 with SMTP id ada2fe7eead31-7be73e956b7mr418891137.30.1790784232415;
        Wed, 30 Sep 2026 09:03:52 -0700 (PDT)
X-Received: by 2002:a05:6102:162b:b0:7a7:196a:84e6 with SMTP id ada2fe7eead31-7be73e956b7mr418863137.30.1790784231690;
        Wed, 30 Sep 2026 09:03:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42faa832sm82205e87.14.2026.09.30.09.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:03:50 -0700 (PDT)
Date: Wed, 30 Sep 2026 19:03:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/dpu: Fix GAMMA LUT for sm8750 related DPUs
Message-ID: <hvd2zaz6zvhcalnjew7p2krbafpctx7hmsgnsbyrvvmh4vhe7z@pdomohlcb4vo>
References: <20260930152645.22194-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930152645.22194-1-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2MyBTYWx0ZWRfX1fb3DahCrrGB
 fIBFU1euiUiAyoTV9jyTi54d12n63BKNlUsOCz2YIrlJLqCzuJURIWBF2oj0SUjLsU4LZlZOEH8
 J5zESNJtHjjCrDbddxO0yS4srK6MCuQ=
X-Proofpoint-GUID: AHL2NCXYy7RFqF7R3S4ZddViKE5OfJy0
X-Proofpoint-ORIG-GUID: AHL2NCXYy7RFqF7R3S4ZddViKE5OfJy0
X-Authority-Analysis: v=2.4 cv=KfxHIgYD c=1 sm=1 tr=0 ts=6abd32e9 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=wTaCxXlcGNsknM-wzUMA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2MyBTYWx0ZWRfXzVG3SJgrzOQ8
 fkk0rub65IpQXj51JM2Ef48Dmo67jyD4muNmnIdkdnxiqh2jUeLlmlbp0eGJiubOic5tbDpslgk
 a7CmkiC5b65RckEjNLb/5nxQ8z+ofKTCtmELVQLhq3tV7vVAu8h/zW6PgU8zEz3K+LOloiYHwId
 W2kDOiLJm/+nDzb07EoyL2Wm4zyTxLqfQZu4U2fAdUmqr9lxQ383hswGZF5eE7zjRV3ZfwNN38G
 lNq42GdzjV9LpWMk1YabJJ+htCvZQfpVtrY/wzWuTEyVgPgNou9lTxvjr16fqXL3lb+d69o0nfy
 icIEt9YyKng6OEopRjCWZlHPdoE81sr9UxXbaxeI/l+qNGLg5jqrjMb5Dc5dz86CYHRcQ17g0mA
 9KySTHne1Oww/QAvbIR6sqYOvVyWTtdhauI8ypXcq9Xw9ou3r4xIyAEsRKdmIzJMGVdfMqHEKVE
 F3a/7vp1fPITdSXSWQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300063

On Wed, Sep 30, 2026 at 08:26:43AM -0700, Rob Clark wrote:
> Add missing GC block.  Fixes GAMMA LUT on glymur/knp/etc.
> 
> Reported-by: Connor Abbott <cwabbott0@gmail.com>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
