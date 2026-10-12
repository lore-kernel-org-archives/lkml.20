Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE88841A549
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814148; cv=none; b=rFlfJ99nRO65eBn7Eyxbu3B0IoD3hgcJh3reFXoTFaywGTZs2l2gxTWQelKNyKSW7JSN5jKMIW7XSup+tT98Eg3j8KZmsirNlQn5fYST8kcUpjUV9Ha4AO2ZyZ2HVmOn/RggdopjWFWP9fM+whMKYSRIpmKGHndYWIYEMLqF6n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814148; c=relaxed/simple;
	bh=IGaiwFlsOFfH11rUVL+wBq+QbJN53vZ0bg/khZ+xJys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+ZWxU8JDL4DiiAik3Y/QOTtdzEy6EpTqgY9jJooEN06gvoR/mKrcz2TQsDm8c9FzMzNyWvzCg7OLhbwbVZsTTlkIQ/ZgJofQaiH1z/FjyntnyzaXj+Z/n04V2Mbd8ieV4b1+YxYtfgj2mmq8n8KqicXWLoPVREhCVoFcvR+ovk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ckn2jM7E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YLv5X7r6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ckn2jM7E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YLv5X7r6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CBxsZL1404376
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mdrAE6CtWkM5g2ZOGMq0Ywa6
	INxDz9OrKN4VJ11fBwY=; b=Ckn2jM7Eo0qepYoAQcndFNeW2qyhGOPwe2Mt80W9
	ElX2mrrRhZErw4oASsxb1JsWQZsCTq95LZUB6q00UegX7Ant666BW9yPZzlaSw4f
	PhEhmRCzi62WwFouLsel3RuvzRIkJMB3boSSmZKUtaG/l2Ec4/KOFVVjuX4KzFiL
	eoDv26PvZMSc2N+4pgI9FO3Hxr2f/FKCN23q0JraCNZMvVYNFvWo9Z3C0RsbnPhC
	tXXYzdAiXPZKjONgWzxKUZFcwyjAt9Buz3p0JiABcZrn0eLRvm0OtSedFsP1nFFt
	uLQ4T+fWcVst5Lpu1qCDKK1jIvc5tY5ch+5PAPHjj+VygQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8v7ksf1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:09:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93bf4c0af4eso810903985a.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791814146; x=1792418946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mdrAE6CtWkM5g2ZOGMq0Ywa6INxDz9OrKN4VJ11fBwY=;
        b=YLv5X7r6LtBRNaskJyUo4+iPlbeKmEOTNtz5LhiU9GVULtAjAr8Nq3Tadng37h8fyp
         IluiuXwNhLUZExTHO3wWiGK9sJDEDNb7yGRxzbA7FMyXwKmcA2dFm+KIozyVcRMs4JPk
         6xZFMO+vvVaxgA+rFhzg8cC4seVmw59v0//C84ELngHhFh5lF6jKIcSY4QMlk4m1EZvW
         /xiQXsADFN4zQbjHbpd+x/0BXX15zmM/lC8Z0sPWQdzsquIEoMsUAkK3JFD5njKSTFl5
         1srW4H6/i9SENylwQVz72jH+XIwgMWmIE5nN6mxDFn2tIvi+sGjGizyG9IWBx0Qbm1sm
         b3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814146; x=1792418946;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdrAE6CtWkM5g2ZOGMq0Ywa6INxDz9OrKN4VJ11fBwY=;
        b=dC1j0GPAKBvUkRLrrNSmCJw/V7wUevbM4oHwE4fTsgm4cqgrqrFGqe04oGe8r4iKZj
         OsVBSrmjrb7CLY5enE382MTWqUjBFb9qcKw0C24mYaUs/Eajb9R1ZWkbS/MJPGwxcvRW
         jeTwQcaIx39oKTKrp3KflZfYrRZmvLqlCxlRaMCujMI8OToBo5VxWsRNUh1BXRPylpoh
         GGOxV++fDpD294X8aO/vAkXir0UwqeMnAflmKLR6Xfi/JUWHiDIMV8KDbFQj2rCzocJk
         BmJq0RPf5y82RnDzR110zztXdJvWUD8mALBhBqX8ZEM70zV+m7NHvG/e1WUOvFrjxP/4
         I8FQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9Ls9m05vH7x7sKIPTkzeYJnav97qWpYxvSd7Kv1mc7grDjmk02tCu7EBrGWrWnNdpjxIStyGNDYypwVA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlgqoY2Ydh9sm76xjlBKy00Cf7tN7EHvGSfdRgpNsmSEa2JwjJ
	3LJcDDZWDtVZfCJORffQUMi9g67CZCZIbjtzxK8+Rs6cZUvxZ2c4cuVvTMIRmzm+epHPzAxhUV2
	M1YUCuTq9c/+entpc1eNaEpjBHorZlaGW4fWrZswwaqDZ4IdRQkQOEl8yh6V0BwlqI6w=
X-Gm-Gg: AYBFou3JqzRL3lj1Qs3VHBfstpwbbObssfftMVO/eFSFtvLccONPAEoG+IvdmEHIXSP
	PJ8SCL3AIuyQnqbyYgvBg0OxOoWVw+NpFaEgf6E1kCXxz5GT7mrELLGYhQtEkWnt0iT3UQGRfuP
	78O/bmTy44CksdqkUgjo/qFh1E4HHyPsQt+NL7YvBBtjG77bfpI33naIEjHBOcjE+MNKj86/bKh
	0UJD/clv4HpN0sFzIHy+nysNysEERAnh1Hwx8qABhotLeikoHsOOeviCpe9eO8Q33oKy39H5+zW
	Z7qNwE43d9eGnWgCgcDPfTM412si3JY2BAWpNu4ZJ4Oa+fnsEci0IYSDLjr10z2/G+aMoh2k82N
	8Gw54orW96jEOsjRm8okrGNSCs7DEx212/1YRnz9wZZkVpwYlK4B5hFmigc2x97PkqVWCtMW0p5
	/lSyDUcSBx9DaW
X-Received: by 2002:a05:620a:3182:b0:93b:cb64:25a5 with SMTP id af79cd13be357-93eb95e34cbmr1568176285a.12.1791814145763;
        Mon, 12 Oct 2026 07:09:05 -0700 (PDT)
X-Received: by 2002:a05:620a:3182:b0:93b:cb64:25a5 with SMTP id af79cd13be357-93eb95e34cbmr1568168385a.12.1791814145243;
        Mon, 12 Oct 2026 07:09:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddcd3fcbsm2883054e87.0.2026.10.12.07.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:09:04 -0700 (PDT)
Date: Mon, 12 Oct 2026 17:09:02 +0300
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
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dragon@radxa.com, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 15/20] drm/msm/dp: Flush VSC updates when leaving
 YUV420
Message-ID: <3itnyk5vvlj2piguntvera2ch5qn4mmzmqch3aevfmpdjvis44@7zujyc5sauea>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-15-1835d4966da3@radxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-msm-dp-hdr10-v2-15-1835d4966da3@radxa.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NiBTYWx0ZWRfX03D+cc3ReCGT
 u0fLTLht/YzAfMvZJydpznAxzrcgj8xGNTc7haZHLl3IhGsxP5qVbgaeSszjK4RJxqf0W/azlSD
 sCJC6J28irsQN+UeEFxT+YyEWp2PJSWBUpSMWxRrFskMED1nGDqF62T0TYUQ/rsaH4cQRALcA3S
 hlVxWbbIMuxzPDPG4vupR5Vhw21ShSSJ1waEeR5uLrBx6vJHjXI3myFKoK2BFMgGr5ZZXqAuRDD
 fgggzRedH+ibPRPsR1VXLB2EnMTaMRGwT/s680QIMrwLtRCA3ln03A9X/60ngfPt2T0YyrRrTA/
 fTPDgjSbF74coQAeHEcy0UUECcWPmrx7bh98b7cgycMON0byyEeQsOcg2bMq9qiw1RR8OTgF65M
 PuBXWndHOYudrM4Stg8YnromEH9vP2AdfNnlpmGvUKYMygCW1ppm6N33H698e7lZ2NtiohQnZFx
 n4bd1qtZaZEoQ31vpfw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NiBTYWx0ZWRfX92r16WJxIX3v
 3FP2nL/s1uFGmlPDiEmyKYx0lLW28nUjEdkueAJPxyP2bmzWCQREGUHFI0kXHbixqNzLsN6FSDb
 zufVsLHz8pJiBta2mX3lOr3wp3/4GNk=
X-Authority-Analysis: v=2.4 cv=VOtIDNPX c=1 sm=1 tr=0 ts=6accea02 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=ksxQWNrZAAAA:8
 a=Sq4eR0YASbV39jB7rD4A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: iKt4IhK3tqo9UiN6shGGz2-fhtJvE23a
X-Proofpoint-ORIG-GUID: iKt4IhK3tqo9UiN6shGGz2-fhtJvE23a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120056

On Fri, Oct 09, 2026 at 11:16:07AM +0800, Xilin Wu wrote:
> Peripheral flush is currently requested only for the new YUV420 mode.
> Returning to RGB also changes SDP state and must remove the old VSC
> packet rather than leaving its enable bits set.
> 
> Track whether either stream needs VSC and request peripheral flush for
> both enabling and removing it. Explicitly disable VSC for RGB, and write
> the packet payload before enabling transmission. Retain the existing
> hardware-specific SDP update mechanism.

Missing Fixes tag.

> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 7 ++++++-
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 6 ++++--
>  drivers/gpu/drm/msm/dp/dp_panel.h   | 1 +
>  3 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 1f9595ff5fd9..486348113b8a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -691,6 +691,8 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
>  	else
>  		bpp = state->bpp;
>  
> +	msm_dp_panel->sdp_needs_flush = msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 ||
> +		drm_mode_is_420_only(&msm_dp_panel->connector->display_info, adjusted_mode);

Does it need locking? Can we instead store if SDP is goign to be used in
the atomic state and then pass both old and new state here, letting the
bridge to determine if the SDP status is being changed on this modeset.

>  	msm_dp_panel_init_panel_info(msm_dp_panel, adjusted_mode, bpp ? bpp : 24);
>  
>  	/* populate wide_bus_support to different layers */

-- 
With best wishes
Dmitry
