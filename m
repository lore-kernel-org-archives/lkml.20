Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6737496D49
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790342234; cv=none; b=ZLlpoDlBkTmZkL95qCHe8+kmc2WP5EQIuddhMfxWaw95IKi/Br7QVV5y46ANSMldGDHRE2geDDwcXNjUJ+CrmcOOD1PdQU1UHAK7TaKjfFzkCwgwyWRDR0zCBa6AZntCRuMap64vbfClz3dosBZW3WIqxDnmK90foTdZsZmvWmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790342234; c=relaxed/simple;
	bh=zDaaCC/jLOIWcnflHQlHeEjB6WL5lOGO6nUa7LjxF7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8sg6OLfZAg4k5A3MrJNB2cqKBbq+fI+7gIQWoycJRSUiiULSePn5LyhdtBf+tnkmoNAzMw8nqDbzqPFUyjYL8TQNicLwwUHf9OpGmo2Ao9iIMOFPIQBfGfmYGDXKiFOVWxn0ibfAl6vLmzRyZh3DJXBfWcVLGHK3sR7+aE5SAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PC94QTS8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EkghJ1rg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PC94QTS8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EkghJ1rg"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5J33M756734
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YgTkQRn9Jl78hxcy8EjhxfN7
	hIYcFJc0FMzXtgfR1Ok=; b=PC94QTS8MLGJJcGpAeJDGmSZ7L38HLKgyvREdhLy
	K0jDy8DigbalKUVUPNmoeg7DDFpxsrvRCZeNMLOE9+wlatE5JccvdRNsXPrILZmp
	8uhuV4wP5Zj5aM7rkLOqIsUWzZT6VVu+SRriDw/P4bCnsHuzWh1iSH1jylgpXU0h
	xR05qnFnPuVi+6SWgaYVONwDDmroSchzyLZNehQZeFU4Q2UCjqqALq3pVYSSjYAv
	StH89nFhEtW9DqLS/HJRSG28r342YFTp+wBuR9jApkxrIt45FhamFkNCiJfz7amA
	xVW/IHrNVzHKF6HEe7p63qD6LRBrOv6acwR2REeiJ5v0qA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq09eyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:16:58 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-791463ed29dso740494137.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790342218; x=1790947018; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YgTkQRn9Jl78hxcy8EjhxfN7hIYcFJc0FMzXtgfR1Ok=;
        b=EkghJ1rgi+hcCeQrbA59uF4aqucRTRoWhcEw+qdUOt/g7ZY3xbPfdI4xmLTkxEFzkG
         7bDk9ZHzEJqzdaUc0FZ1xff1PWFir1hwJ87BPpv/kI6EBcRgItreF6cdoOia+fECwxzC
         7QjLgA7QRP54ioywiE9k96V52zpMTOxH0oyeXwmDqs9E1YnVV/jNCFv+4ImarYHDEnsT
         M9+dPhEZiMKhmv77mHgqppQZQMpDNln1dOvpIwTaU4jcA7O6J3t4rwhqdXGXwiwfQTbu
         yV9QvMuPiveOOlE6mwNwQkKAMjocA6OktKx0o1mn5UQtIvRH+xu/Pb+s13FleIqWPFtE
         vSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790342218; x=1790947018;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YgTkQRn9Jl78hxcy8EjhxfN7hIYcFJc0FMzXtgfR1Ok=;
        b=VaUVPijG3RdbI6YyH6YyAmhO1zqNbnxxwah1aPUUdIzeGvbWj9Q36ugFNowQ8isnc1
         0qM+ZLoj5krrNx73Y9L/C7Ic9Uj1UFEK5gWZzFDcuYKbCxWjiVDAbJbRMxKpC8hjRMUA
         rxnz2GQt2zYMAaolD6gCRyLL51+GwatJHohXy1MsL0JDn6rTS84MS+0NBskT4i9Co02y
         TUVZ2Wba2VRmHEK1oFeQr+42svU4EFMX+uJ8e+YiJZY1OClQnAqm8Flxj1dFkY6c4JaP
         ZKLdyVyLapUxoR1NwrMbXoVGCX/8MT1jUm3W0Gi71xwTVucUyG9HeE/K9qlnwSMd9RPn
         +aDw==
X-Forwarded-Encrypted: i=1; AKwUvBx7DDB2tE4JGiljDIU0vtgXIPVASI+lucAgatlwK7HhoucegB94TO/t+dCqGdMHnTktfSevvsa/9NXpLgw=@vger.kernel.org
X-Gm-Message-State: AFuF++nuBGM3x/OhtuYeDjXeQWOdd/9mgN84wM7R8vmiw7dZOaNxx3Sn
	onMu3wvvQ5v0D0TjQK/22KMqvXlKSgNiJEpRZ3pFKeVKcCgDEjNRXQJjIU2QEMsQS/CEeFUbazR
	uosPUYZtvb/G1WYjdKJGdUqUBvhEyc8NWsRlU8YR/vM3x2MWpdC3hMVKQV5rmC36GDdg=
X-Gm-Gg: AYBFou34fVyXgPeq58rWMrmL4fPIMZTJV0p53p2pYflLaqCkXhy1U8BMAEuWOFKEcth
	LBtlvcuwBChsiTlWGL/KqAfIK4phBogEFlgbqG8NvIn3V5M6e6UafCnB4AkhPO5cC1vzHUc5/B0
	gNp231FWduM2qzhLX8Z5sD/wLlGDzJ+yKLaLKu17XJGEP3rwtkXQ/QI7SyDktRltgMvFd7QzX1J
	CChUdjtHqUxlXp6Ygk4cIay+z0LTWRfJhCoTTYtjJ7ARqcpMEfnVpm44xTMtUL8RIeoCdIm/RDt
	qnL6dziagfOxPFjUNFuEMAfCX/N2A/oajy1HAcmP6MKByBTROQfaOYuAkn55LShlHWUWEiWpGeZ
	TXMY/tFkbze4Qd8KSt9Twdij+pugNRrJac9N2cFgB8A4TN6fi1q8cqOuKbqzW0ptSXcZTy/A8Fy
	X40sQtJcN54nVz
X-Received: by 2002:a05:6102:8092:b0:7a1:3d97:fa91 with SMTP id ada2fe7eead31-7af1b96bb69mr2644363137.4.1790342218115;
        Fri, 25 Sep 2026 06:16:58 -0700 (PDT)
X-Received: by 2002:a05:6102:8092:b0:7a1:3d97:fa91 with SMTP id ada2fe7eead31-7af1b96bb69mr2644341137.4.1790342217568;
        Fri, 25 Sep 2026 06:16:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e6af1318sm546173e87.35.2026.09.25.06.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:16:56 -0700 (PDT)
Date: Fri, 25 Sep 2026 16:16:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Oleg Keri <okerixx@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: don't report link training success after a
 reinit
Message-ID: <abnzr3ksgpndanmbra57px2daapzztxuqnar6jfvdhmgf5ff6s@jrvxv3gnz7o3>
References: <20260925125314.16563-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925125314.16563-1-okerixx@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1MiBTYWx0ZWRfX3nI/og6VtTFS
 HBRQ4vq9ZjSHJVP0pOzkRE+e2MlAE+Gf9p2RxAj9Ed2LJGBGNW0w3jvz2XmSPU7W7NfHxA9+/tH
 n8+oQz6MJeFwgvVjkEhJJ1O6r30aQCs=
X-Proofpoint-GUID: FPa0q6w4-_-FLpfr5gx_u7tmXgmXh_hx
X-Proofpoint-ORIG-GUID: FPa0q6w4-_-FLpfr5gx_u7tmXgmXh_hx
X-Authority-Analysis: v=2.4 cv=LNPz05W9 c=1 sm=1 tr=0 ts=6ab6744a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=m9j_GCGoi3mryc8sS7EA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1MiBTYWx0ZWRfX47nR1LN4HPht
 F4MEQkvHrRpRQLZilC5mLyNtmk4KZtee3y5xY64bN/SNbL7StSSEhc+GWno4fz34FDGrHkbLCDd
 VmvVlkR7W0Py00uT1toYWvsgvkMRpGE6UmvuX13iy2lv6/M3Pwirl6+DKsjcwza2iWN26JkB1TX
 b1PMstp3GxOdqEcXjfME9huTs5eEKggeppexHA7ZYjUCs+InaQWqNSFx1Ez9L0m6I62okuJCpUU
 SHAY9LKp9V3sOCC8kE+Fpm+lwh2afKNe9za2oAzpP9cSuaP8LJ5hGD/xGb099TiwTpYYI5XjxqC
 0ZFDM9joMRay/4WF8/pQgVLEYqCoo7SyOF+yNMhoTuCw5yDFd+8CuAwJmuNfjJw+uOzgCy0mMuj
 d+smBD5YrfB7TZ/ZYFDvE0YQ7BzSKaVdJAPY480lP2MQTpFpZGXbdyKlEqVGdILu/sWA9jJpTz5
 msXSvcRxisyfjnjT06A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250052

On Fri, Sep 25, 2026 at 02:53:14PM +0200, Oleg Keri wrote:
> When every training attempt fails, the retry loop in
> msm_dp_ctrl_on_link() ends on a successful
> msm_dp_ctrl_reinitialize_mainlink(), leaving rc at 0. The caller then
> enables the stream on an untrained link and the display stays dark.
> 
> The retry counter only reaches zero in that case, so treat it as a
> training failure.
> 
> Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
