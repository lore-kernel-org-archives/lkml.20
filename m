Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C1F3D3CEF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790794226; cv=none; b=PBVgYz2uZZpMY2uaihZA6iEnOLsXm/NemexudN3d7nF6QaGshGMNbS7c2k/xh1F8fzCbFly2r6vgL8Vua9Q73wHcb/xxMq//sqUTIZJEbFK3IONlCnwxg2HOr9UFR5zjMF0OKHDDPz9p8KF00+y9EvDT1tpnmtSs/oD1viqhNro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790794226; c=relaxed/simple;
	bh=N4DiqAh88LeUjp/uSfpZoNX3tEK9SyS62JSYs7kZhCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RD/GpnlRkucgQV6FfQB8JsWchAbRgoK7rJmecWmuigUfb+Ra7eTC8R+bYqQI2r4/Sh98lK4tr8CqT6vbVhv24da7CmIs9RIUmwFTqcrhBMguQ+9zUEF5mmqSKnj7GPL8prqr0sw6K7/+dgkmmz10MugNdvO36cex3UU4btvLKKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KJ4A8Byt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HZp+LSxP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KJ4A8Byt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HZp+LSxP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UHejFI4160512
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SbdHAaAV2YbCqm+WWfaTCbSz
	kp2/geziO8S1ERFHk4w=; b=KJ4A8BytR+khCzjqhqitw9fl1y9fcyaIeG95UC3O
	8lzAqGXKk6thinaMR/aFrTcAwgIIGl3cIT314twp0SHEwrB67BpsekkPQ0YVb4Vx
	QFlRhhlpLW5aTl7MpkU+vqMUJx212TCmSOJcbc/BkbXMlEufjcnCer/eXGSUSbih
	XMcFPwajxVm0evbrCjCiehm9cvgsWahoISo9XbhT5rVXBnvS4m3dLaoAH3fAirlE
	VaEMjrfwZk7NaleKfalVK8oXSbN5jP7j6jOXXXoREbqyvO+dux+kbCP623YC5KDi
	K55iLry2sBMi0mEs3f9mUkxOPZLgD/+93GPhYpCxIX88AQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h167pgkyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:50:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93bfb2da664so1529325285a.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790794223; x=1791399023; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SbdHAaAV2YbCqm+WWfaTCbSzkp2/geziO8S1ERFHk4w=;
        b=HZp+LSxPKZvMoc/5FJxiby4OdA0nhyLNTMIHWyD8stLXPpYi4KnpJswyq28cFhyqi4
         VbY2XdMECaQgxGi2r8IY8zsdOx4SjcGt+wvR3XSgZE6yN9GI6AVytdQWPm1KUbos2Fbr
         LbVciibag8ZNYv0lNbVzQdHWsoGTghnlKbHgyhOw7HqdwpW4hPN28u5UBjqQBr08qI89
         0t4ArtA7VE50tjHc1vNztF15Pam+rOAzHGwKTu18jI1nSc2k9f/2eDWsTB4xZexaowZo
         7tArNhYcNIxsfKl0xq1kOg08s5BMgx3xWgPhTmN6LBWAoinz+fConQcNnCUZVBMECAS5
         NsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790794223; x=1791399023;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SbdHAaAV2YbCqm+WWfaTCbSzkp2/geziO8S1ERFHk4w=;
        b=hhpdu+Fk6G2wwWOLp4pH6yinQHXJqzm2sz0l3ewJV7MmEL0uhktWul3n6CKQvLAqEu
         TvXA9pF6akYXe9LcjNXFCEiNPka5PYd4edisdNjwPK85BgnCbg2konAHM9807TDjmRQn
         MSUAgZo1+TuF3YV2m9cgkBDtMRZQZ4JGm9YNh5KT/Sl0yGYKKAvmcsTc3haRW5wQ52zp
         S36TAKp4f3pvIJKBJ+/2O3nLRHS/PzTD7+t+s28LmugEBZ9ExJv6PnFynjbd3L+5rbYz
         igtgq1cbUB9KlOWTn0KmlyJANj83OQDjwJtB8m8qiVkVi/CItINzt63ncKMyiF4pm95L
         9QQw==
X-Forwarded-Encrypted: i=1; AKwUvByphH7KBZPN7t9avDEkgwPXrjOXiX6XAF1CO9OWdBw+Io2ynGUht9oKFxrPrlpso48kd1ez1ZsVKuSapag=@vger.kernel.org
X-Gm-Message-State: AFuF++lYY3+4Z7BhhlmzG08ucJA9dsKjCxP4dZig87f6Q8TjBg6iAQUl
	sPj8Io/0Dm5H4HUCo5jNNbItWRzOj8LeVb9pX2CcQt93zjneRUhaoyfqz21APrRjbidE/7p/Qsp
	CkXNl7IUJ4BCjN71UmOScrENEYRigRhwn0y3YqlyzpFA19OLsadqvoXptzhK1DEXWvoE=
X-Gm-Gg: AYBFou3XplU26q3k9zZ04jV2EEnzXLweIHm9zEosGy0Lc+TUZSwO8B6JSpofVW8tvEX
	imZluktRlIA7Jha4WLEA4SVxhHQsnuVaFcVTMMX5ljDWb/G4M09Awk/yDTDuLu/XB5Ke9XFPLQw
	ChqIKwh8+TizY+3CHnKOsZnweV3kWSW3U9Uzxy/IU5Pc8Sz5+//gi6LjpzDVVHaeWVaSAOusGLF
	Wl/l4qkFIi86bxWrqufCVcDQmO0L7WaUkerI76KDP7ukS1QgOdr1V23d/gXmwqVcsMdBd4jbpDQ
	QqN97axKV8bF4ZGl9m2T64rxGLyDO4tgTFD9JVU1+4aPB0POX4zDA2Bro2cBiCIp2ViNyQIm2a/
	v6KS07sFaoOy3ONSb8oZUCDsqEpDJHcTrZKAF0jO2u12RAel/2gzHY3Ha99VYQlBICMtND8Kefk
	fROFLqYn9s8UZY
X-Received: by 2002:a05:620a:bc9:b0:93c:5951:38e9 with SMTP id af79cd13be357-93ca978e4e1mr454236585a.52.1790794223090;
        Wed, 30 Sep 2026 11:50:23 -0700 (PDT)
X-Received: by 2002:a05:620a:bc9:b0:93c:5951:38e9 with SMTP id af79cd13be357-93ca978e4e1mr454230385a.52.1790794222511;
        Wed, 30 Sep 2026 11:50:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fb1fe7sm161163e87.35.2026.09.30.11.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:50:19 -0700 (PDT)
Date: Wed, 30 Sep 2026 21:50:17 +0300
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
Subject: Re: [PATCH 10/13] drm/msm/dp: Signal BT.2020 RGB on DP and eDP
Message-ID: <5bm4fk2j6fhrw2zupe4c275zsktwb3o3htykdfq2tg5jiuybw2@5uecwvjztfjb>
References: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
 <20260930-msm-dp-hdr10-v1-10-dbbf8b2b42bc@radxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-msm-dp-hdr10-v1-10-dbbf8b2b42bc@radxa.com>
X-Proofpoint-ORIG-GUID: gpHnTiV8HsRfaiwjyrWi72OXvn4ocyv9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3NyBTYWx0ZWRfX4u8RFD/gWRQ/
 mmsWl6cLsnJ+wo8ao/Ly8ojWB3yIixKv6ZjshWlmaUkrX9qRqOvu7OsMQToYwrec4Sha/7rm3sv
 O7PQ6+eAW64Cbcc0OUvNBMbIanvDeos=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3NyBTYWx0ZWRfX4TWtlau2jsz8
 nyBWQlWZ1H10ftI3MJHZFXYuF5x9zrwCI7eq6ic2PShywncTkYap3iHsuEHYVAraogI5r0pWGn4
 gpFxYBkGRZyWjdMvvjfZ0n/e3dCujuGqgYU9i2ZQ+z7GYwVqf9EWIkWuzmv3EXDF7/AMTZdRnBn
 rRbmbBAB2DqQ4ZWc4EYZu7RXzo0j8g4PXRslVOQs6ye+IorjLxn9G1ckfN4Ej8sJCsIHZFWlTor
 swC52TweGLMBNhaDigsmbD+UOw1FUA6PAH4SedAizVvCW2mnLCyntwss33+fEog+3JY8fhRWeuN
 aRDmKOrqq4fywpRziam+WWgnmUAdqa/t+Z7sgn29Zy5NQH4bXA5qJC/osGoesBNM++AF+Hu80fc
 syH3hwUD3LpV1HGl4zvNHqwEsGvkj1jfgovkDLiIwnX88dY7g+j/lAPf2OXiKCTJM4UA3wlM42t
 Flodw96g6E5DBYdcMsA==
X-Proofpoint-GUID: gpHnTiV8HsRfaiwjyrWi72OXvn4ocyv9
X-Authority-Analysis: v=2.4 cv=WpC+otfv c=1 sm=1 tr=0 ts=6abd59ef cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=ksxQWNrZAAAA:8
 a=wa0WequbTeZab0NVKFEA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300077

On Wed, Sep 30, 2026 at 08:41:54PM +0800, Xilin Wu wrote:
> Expose the DP Colorspace property and carry VSC packets in bridge atomic
> state. Validate VSC support against cached sink capabilities and check it
> again after powering up the sink. Regenerate the packet if link training
> changes the SDR bit depth.

This doesn't sound nice either. Do you know how it gets handled by i915?

> Signal full-range RGB, matching the existing pixel path, and retain CTA
> range for YUV420. Reject BT2020_RGB with a YUV420-only mode. Clear stale
> MSA colorimetry bits and include VSC removal in peripheral flush requests.

This sounds like too many features for a single commit, sorry.

> 
> Force a modeset when colorspace changes. Disable PSR in the controller and
> sink while colorimetry VSC packets are active, since they cannot share the
> automatic PSR packet generator. Restore PSR configuration when returning
> to a stream that does not need colorimetry VSC packets.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 33 ++++++++++++++++------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 26 +++++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 13 +++++++--
>  drivers/gpu/drm/msm/dp/dp_drm.h     |  3 ++
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 56 +++++--------------------------------
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  4 +++
>  drivers/gpu/drm/msm/dp/dp_utils.c   | 38 +++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_utils.h   |  7 +++++
>  9 files changed, 118 insertions(+), 64 deletions(-)
> 

-- 
With best wishes
Dmitry
