Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408446;
	b=aA6w09ruuicdXTJNjHOkFZSI15cvbSWnFqsUybBY5OD0GEAy1y4vUipdzzfMgoNPPadp
	 4YZw9hGd63rh21JAtsOmwIXNUPXxDYNiXD2RNTr3B2BeZlzD7YMVyqSXuoYpLgIjhBX3+
	 jUNCgvYs/+rMi7dKI9DSNoEOGuwzKhm296rFAtJWrn05dx5kv1i66a0JHUopx1pq+vs65
	 mKy3wAywC6IZ8bMww+AiE4RYm/Hk/x3I8eynRt9Q/MouHjC0LAooHdwEarh0EjbKfm8K8
	 /4ETaG2b3OZ+G8A6V0UJ2LJJhr0+Y+GuXXdC6Y2yxLrOuXatkpYL2pxaH3KWmDbyFYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408446;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dSsjgnuER/pCSv8uH7FR/ZRv/e/DAvEndVD96ZB9E8Q=;
	b=D329Cv+yotzPzKL5+92IRUn3jAnxCZQzLldGyrLRN1ZD5BAu5G5TyOqSL4LzF+mbP5Ig
	 Oe4YNUS9lMQd4ialAcMy4hTrdHQB4eiA5GZq6qqCmQeb8jmGgCg6TH4Hxga4tu7+2ZMJN
	 fSTHNIyuYSYDukXdbEb+xn+UElbuiEHGxsfDFTs4+a/3JoVhuG7wrEsNM5zTQPVc/fd8O
	 HFeslEtPSBsRH3nFoUfPP21mu9JUzLHXtQJRkmVDIah0IGZI1JkfdSec/AvFiXkiIVgt2
	 CANf3d0Mzof+HteO3j8TZ6uPV93KCF+p5pRbq7Xlv8od2AbpsFjiHxA9ut3oX8RWX1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PRPttJRC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ODvN/e7J";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88847606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88847606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PRPttJRC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ODvN/e7J
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEGxxK1573366
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dSsjgnuER/pCSv8uH7FR/ZRv
	/e/DAvEndVD96ZB9E8Q=; b=PRPttJRCEn04/y6wsNdOgtk379xKjoNFOzGcHCWu
	qvC4QI4zmwRW9km2D2563TeifbHJFBTgZwtFB90qH2noORntULrUP2OV1Z7nexRK
	VzRqE92rVXID22WBaCnPP9HN3vD7j3+42wG1zeddxWQpCnpxIWdQ8Ze+zVjqAfnj
	z23TfpqJHcwq2U7eJcuWviKuQJ43z1EyYHjA9BFQq68qorzvna2G3LcOVPLuni0A
	zw7MG10/IvhL3H/JQHDpR3X9cGjeS6Oy0IivL9S3hd1+AoQe1PQRhbkygr37Mg23
	HXons1f6wVOrII1RWbq1XMLO2ccuKw6ncElv4FfsIfTmLA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7psqmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:47:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91eb05c8241so57274266d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794408445; x=1795013245; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dSsjgnuER/pCSv8uH7FR/ZRv/e/DAvEndVD96ZB9E8Q=;
        b=ODvN/e7JU8qlcgvbroLe6JyKqGlbacRSKTSVZwK2aAwHYKd+2cj8tZDCd9TCYYGAVI
         gWjybmqz5EtrLc9rYT9rRvOz+1Gtc4eaSC+5MJwWI0suCT56X6yWkXE5anpOpIbQVP4G
         pRmhwh4VBAt+StLKv1lpCpNkwjeX/NHBDJAaTry/BVGjg2fPdqAmajKKnylNBZH/qqUS
         Zh7TzlBc2mBnBKj1FSE+NJy1H+H7NZeoEJE0OrrRbOnRn2/5O9HoiLpfEAyvPW6wDG3O
         /PtRHgOs6eGFJ/ZlZm94e9voVwP/tDXYzjTQB1jy2wyiTiN66pA0JCApjAFfLM95lJos
         P3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408445; x=1795013245;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dSsjgnuER/pCSv8uH7FR/ZRv/e/DAvEndVD96ZB9E8Q=;
        b=1uYfb9k7L4HG71eTU/hDZocMH83fP/Sm/DZOOhGyvXf81De9hB4AW3zzJ40qI7Z6ee
         suB4vdNpTFBgUdQa99zgIdWh87lc1wJ5QQTNwftAMA71mZE3MHxR0mn7uz0Rb/VweKLP
         SCQ/U1bUYy3C1boI6okLx/isemqs9Ig/2MZrtKbCEZTnPtPNquIEF6iQnyAwRZC8pjBC
         PGNuOG6kaIO0iWr+8LxyaTK+cv5EJLLDmCl+zpgiE/3bpmYZpHYUYtG7i07lk+yHh8at
         PNS3dPYSyzkpS4NHd2zkiBql4vhHeaDoPFzp5GrjR+c51IT5GLuQS/LrCq176d6Gq67Q
         +hsg==
X-Forwarded-Encrypted: i=1; AL+hErGduhwbZZT7eFlul2Xt63SwAo4vKkUeYkoBdd7g+4WG3ba7pgq0L+rll9qbdl0jFhavgU/5f08uU4BWJHs=@vger.kernel.org
X-Gm-Message-State: APuU4Z80NQ6fLw7js+6xkXWw95NLSgfcPabezu+UG96t8MIgAGBcnOUg
	uIecockQ4JkQEbYxd3bxcxB6SUAL89drO4ytgYqCREgDePvrHwSQK1KVjiG5EmW8zjD5+Irs76B
	ty0W7Mf3eVRMREU2qc5bzliqZV5Pi6c2NPZsLcFRCF2/pka9xWodrkK8BddnbOFQAwrI=
X-Gm-Gg: AYBFou3gjAP2lZ6whM9xfGw37VylOaipSu8RxPvGyZnbEAa6RTwaFPB/6sTxFqS8SAv
	+9mZ5o2Pw789ChF7/y01mMOjHfZQCq+ODC0oRWdVv3NtwyM0lCZTFuz2A4eeVnatA5TVfgtgNaJ
	UWfbwRFIzIkmb4o2IbeQU9zsX7opiImkPYwQMliDALD1JvA4baorwwpzGMqmcRSixQTRgOq68nG
	ifeI8Gm/lefotcOIZdeEIcJpQxZ+rVWX+cFUCkoAcIdvDzohF328iO7buB3vm6ifoWKhVeeMky/
	OY3nlYGBKfZHt9ZbuDoeySZanUfS/rnR/N/E/USSUL/14eiwJuJUrakB7Or05oqwMlSCKp0J+Xd
	vkZMjZ4NNnpJWCikryS/G4ONscurUDRuztYmzf4a7dbIO19urgsavYfEk2pAGgHHwPKsWNrVu4K
	p4U4byHR5hIprZ4X7ZBa72BvG8jNpGHaO/NNTvpJRUMuZoj3etXZJb1kBS7OK3tg==
X-Received: by 2002:a05:620a:4106:b0:93e:c12c:4416 with SMTP id af79cd13be357-947b00317e7mr403778185a.82.1794408444518;
        Wed, 11 Nov 2026 06:47:24 -0800 (PST)
X-Received: by 2002:a05:620a:4106:b0:93e:c12c:4416 with SMTP id af79cd13be357-947b00317e7mr403768885a.82.1794408443781;
        Wed, 11 Nov 2026 06:47:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae177150c8sm3338901fa.40.2026.11.11.06.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:47:22 -0800 (PST)
Date: Wed, 11 Nov 2026 16:47:21 +0200
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
Subject: Re: [PATCH v8 07/29] drm/msm/dp: add support for MST channel slot
 allocation
Message-ID: <ycikeeqchpswkdw5aeygyyot3c67dso5vn66mhxlexcstnrnou@a2vg44y4rrfm>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
 <20261110-msm-dp-mst-v8-7-d040fb33db5f@oss.qualcomm.com>
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
In-Reply-To: <20261110-msm-dp-mst-v8-7-d040fb33db5f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfX7XEJJ9uurPqL
 Fj1FKNaPsQ27x7YQ5cODJLuaKDx9yY5L4SAEz61whDahxThllrwjXXoeUKHsg+23EbXAHRbO4yr
 5umrOJHrngosNL6ZhJUuWlSuyloRjV0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfX3Li6j6cb88J6
 m6mn6NRt9BXOwRZOG4omxhRNxfyTlyGJGLR3KcGHfZdVOhm2ZZ23w0e3sQTQlyziZu6gdV+rGYt
 SYKBVlkyguQ3BrED0/lzx7hL06TPMY48Qqn7GdyfwMTZ8DBdiylp0vbFNTh54Koq+yOCS2L6HSR
 qQ1QGNajBvl/9gjJX/yJ4FioBRdqLaVJbc2oNvbmXINirfMT5sfBtB5zKqEbErTVsYAhY957Cl0
 PGIg5UzkFtjdk/q9N/d6E5iofQYWj4wVAbWLdYpG3mOLsO3sFPK3LTZ26G4YMWtNez35F/JFRbq
 YL9yaA0enJafR/1EuhTrwXADpCMPHcJRZHU+LV8/FDY8aTGwwaifZcTnk32jnnFs6nTFgqcE/vP
 SMyXiKyUO7/2x6AyvbH5szCEjjSNxUbv+BSxEFSvC94MOxhad12a9VHB+7AMeBzruHafWH2YxlS
 6jTzRk676VSF2f/tf1w==
X-Proofpoint-GUID: 8LUKd7cImXbculPcAZrNbYuiuzJ8XUBF
X-Proofpoint-ORIG-GUID: 8LUKd7cImXbculPcAZrNbYuiuzJ8XUBF
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af47ffd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=pILL0qaYOBIALHQ4VfQA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110058

On Tue, Nov 10, 2026 at 12:54:28PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> DP MST streams share 64 MTP slots in a time-multiplexed manner. Add
> support for calculating the rate governor, slot allocation, and slot
> reservation in the DP controller.
> 
> The per-stream slot allocation is not tracked by the driver. Callers
> pass in a msm_dp_mst_slot_info table derived from
> drm_dp_mst_topology_state::payloads, which the MST helpers keep up to
> date, and the controller only translates it into the per-stream
> timeslot registers and the rate governor inputs.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 147 +++++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |   4 +-
>  drivers/gpu/drm/msm/dp/dp_display.c |   9 ++-
>  drivers/gpu/drm/msm/dp/dp_panel.h   |   6 ++
>  4 files changed, 161 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 8a2396aec6d5e..0b34db3bd5d22 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -83,6 +83,7 @@
>  #define MR_LINK_PRBS7 0x100
>  #define MR_LINK_CUSTOM80 0x200
>  #define MR_LINK_TRAINING4  0x40
> +#define DP_MAX_TIME_SLOTS 64

Doesn't seem to be used.

>  
>  enum {
>  	DP_TRAINING_NONE,

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
