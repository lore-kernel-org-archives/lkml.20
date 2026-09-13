Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6529368D4A
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789335603; cv=none; b=MXNbI6haUOWzCTZEWpc7/DN7KHpsmqRzBL0JKsd2/1ygrWwV8IshHCK2fgo1wamXvdk01Lofg7T9s7ZXSVXKjjtvyqy48+8C545UEZIOFuvP/0+60XT/qLdQ9s74mKYKaQe8WyEo5RKHlQJ+WQhQeP4MPbe5XWHDGgk4yVaBavI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789335603; c=relaxed/simple;
	bh=ATf2g0ZSzrp/pC7X7yvuJH7lJ5zSZ1TqWl84sVB607Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sM972znK1GbAff6p4KR4YwMv7e/5W/U9wKmRIWoyMuY53H/YmtG+xau01IH0eyMSMAaWitfGuRjGtJHmcAaMApgYLOVkTvAYRxhOu4//6UZsPwKO2LOwxTES4Tp6fvnuyaQO/6FVDIO6vcFT/AZjIzpy3Rgw34jgHMz9EnqZhIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SGiId68X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zdh1Ivs+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SGiId68X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zdh1Ivs+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DJxYIO2163749
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C/RcLWpqyWB/bxvbtCv9lklV
	mRMtUxPOU2Z0l295uIQ=; b=SGiId68X//DGV/frJRtGspfr0CwCMEQVrn04N9jS
	wA7UPgaBFIDQPjY3PlSaGkI1GYUpcmyoNi5jigpsAjqtOBB2gc4R/o9EgT/u27AC
	qUZksWF7PAIlX14luJAOStEhS7WJUsMPUVtJmN7cqpAkeNgf8Kp0uR/q53dl765j
	qXFULfA3t4vShapg5WcU/+t4TbNnRR7V9K/aWW+qEn/ZPu04x5KvnK52z8ulHe5x
	EDB2UiEkmNGry9075HqGJmzw6p3Ri399pPWdxbHu4MaQU/Hf5crRoyxMwJg9PnLZ
	0ZF8vfcnMLhx4YWl+fqJVsy8C5nt+iLUfGwxmaDSVx3IEg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd47jn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:40:01 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-79014f0b44cso2487169137.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789335601; x=1789940401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C/RcLWpqyWB/bxvbtCv9lklVmRMtUxPOU2Z0l295uIQ=;
        b=Zdh1Ivs+a6QSls+X2m7LQoSR1zh3IOkhdsZyZyyQLLuVNEUjX9sEE1euDsvLxeUiGJ
         xihKEaY9J4I4SfTGpDgbYSmDRgXOSWk0oChGBhuhjrNNCOp0Pk6KSHGtsO2a0o/G3mLj
         2yeJAFKlBZjUwgZbsrs2I1bz05+99kGlP+hueXWmzQBdbS8exs0fdEgLJgndR48hdjkQ
         d3UBCbveyxVRi/2YKrGGlIHgigXXTQSrpqzab2wgdmekIMQOziSEJMbXia8I5ODeHje0
         7CnZDn7yyFZe2UEtmkvfUpbi6MfWZ4JKrIW1xJ1nwyyqwLUXtcja3IyJyp9jOlrsKTa3
         sgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789335601; x=1789940401;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/RcLWpqyWB/bxvbtCv9lklVmRMtUxPOU2Z0l295uIQ=;
        b=owNfgeZr8RXnN7rlwk0OL5DJeH0V+/XzRY0a7j46OZ3NxBEeg389ol7FYZSbrdTnC0
         a9r2sz4BRLFbhoRY4GlO8NdRiuyXHpa+X82idsLVH5oPAiD35hyzqYcRQOPyIa733QIx
         5kJrEieV+0zfkqb16m/Bt6X5bXHH5dUVVIPbUSAupx76B8LZdWS3pe9dES2WvPf6fYyQ
         qoEaCi+ldweuVxAEZ8ssbntfbSRJtDYZ33zElzb4cal++f4d54RQrw1kihl7j1qILvVi
         nILthwEUtYz9jWMs8oh/JpzWTt/U3rvWhHca7j+X9ZuI5Afn8IvOU+9y/vY1tg/Lxp3Z
         moBw==
X-Forwarded-Encrypted: i=1; AKwUvBw0Wjc1dnhL0d7EuwI7K3s1AetOG1SBLy/zhR4JRw7s49kvCHHStLmNYcIwxy/KfGHG6o+FcZMLQxEpBJk=@vger.kernel.org
X-Gm-Message-State: AFuF++kdp4xnmGvUO9KbWdtnHkAHjGGatEwtWIXhUVdcAjt80M9GtRz2
	f2+vo2zUAjW2PZSp+KlNARUI42yzkgEOwgx4wMKOhsaEbWlm/1+YsAiUSx2hCjVf5rM0mQnfU+z
	1E23fioTWeetzHcYDlSxbO6DskI2ngxGWiE3c18ZF8VzLSYMxpkg7rfR7IPDsVaV8TXo=
X-Gm-Gg: AYBFou1zMZMTMdpn4Wbuc+Ea6S5Q95li4fuFzGKM0GnmjN94OyWDF7keV/6hD4cYxoM
	7wYhhE5VZAbRC+gjRr2dAnA9M5w7SF/bxCCY5pDOdWa3ZJUazw4V/EUItHL2OXo905Bp5apcDqv
	knxYidztePIa1/peCSjnu8bPtj0vssAUgEgg+teWsif6r81Q5iTE9oDUn0mplBtujPXRAZ8OdLP
	PAXeudUTL8hQbwtj09u6Ss7ZKCDapPsgKy/9G3d7A4K2GRU631hHVOx1wioQ02VxlqxKpL1cw9Q
	0jRJ1g9jVSqOdtixx9szwiuFgcKTmQEtzlfkN8JhKKfpk80ZddB0yxtidKhkHnd6FMVmhtuW3+Y
	+72e4ekX0xxigRosL4Q76W3fak1aRUDvi7kpHHmSMwkOFec0WeoutU0BprXANwWjS7ZV831GqoB
	LhgXdlydpCUuoE
X-Received: by 2002:a05:6102:8021:b0:77b:ae7:1bba with SMTP id ada2fe7eead31-792a6758ac2mr15026767137.3.1789335600798;
        Sun, 13 Sep 2026 14:40:00 -0700 (PDT)
X-Received: by 2002:a05:6102:8021:b0:77b:ae7:1bba with SMTP id ada2fe7eead31-792a6758ac2mr15026758137.3.1789335600440;
        Sun, 13 Sep 2026 14:40:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a336c26fsm20669481fa.37.2026.09.13.14.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:39:58 -0700 (PDT)
Date: Mon, 14 Sep 2026 00:39:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <quic_riteshk@quicinc.com>,
        Vishnuvardhan Prodduturi <quic_vproddut@quicinc.com>,
        Mani Chandana Kuntumalla <quic_mkuntuma@quicinc.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH 3/4] drm/msm/dp: skip LTTPR init when no LTTPRs are
 present
Message-ID: <ej7zom63d6scqrxtymszwswnstmftm76bsqtn4beqz2vceqzho@rdfxlo3duii2>
References: <20260824-qcom-dp-typec-reconnect-fixes-v1-0-2825e5bf8a96@oss.qualcomm.com>
 <20260824-qcom-dp-typec-reconnect-fixes-v1-3-2825e5bf8a96@oss.qualcomm.com>
 <315db50d-6553-412d-8fca-a4b4441f881b@oss.qualcomm.com>
 <fa897e53-2ebe-4322-bf73-98788854083d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa897e53-2ebe-4322-bf73-98788854083d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa71831 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=amprJqNY4E7PqP1f_1cA:9
 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMwOSBTYWx0ZWRfX1sGWXTggY/5s
 0p5IazIWaeuokEkyAQ5oXVPcog80dAlhSZLyupTQ0B8Pu8W6CmlwW/MskdnDxHXY+SqDkfjAJEe
 6Awd8p+L9pWelNRh4hgZ/XSxqwYUkBLXaiNy6hDQgfrRfrydXlVGbDoz0hvMcU+RV9v0cYR7rLN
 IESpMauz0PKlpopjasa2czVC5/aLCi1zoGzxUK5AQutM50AqtoHwvCCNwwlvLY6NnsJynywwUCB
 f4P5RoxyQ28VPFKhiowT9r1DY+hHzYLPYuCmQ7Fu5+oXFCwUld61c0kzbaVnpemBC+aHcQQHMjM
 opINzv6MuR2ML04hFoGnANZkNQmVo8F6x6wSbbw8KapmnFRbNBvVVkZ2uQGs4MI0FBRmH5pV1Gy
 otL/uot4FHXeae+n7Cl4wxkoi49Fb0HlT2ln+D2601MBFeo74x9hNt1X8ZTLS3pwsVNQ1uTHri+
 6jcGLaGw2ECgWXZJQCw==
X-Proofpoint-ORIG-GUID: VNtTeez5zYaz4C6tFbpD9L34immDFa9t
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMwOSBTYWx0ZWRfX2JwpyFZoJiIh
 km8IVcSgFBqEq/eNTFUjO0Rb4nHnHHPFMyubbsEJibIBogF6icjyJGRTxdxCo8PwAlGHASXDsRz
 ysKRdhnCVoPS3ORFApVgjQVP4u0oRG4=
X-Proofpoint-GUID: VNtTeez5zYaz4C6tFbpD9L34immDFa9t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130309

On Mon, Sep 07, 2026 at 03:14:33PM +0530, Saurabh Anand wrote:
> 
> On 24-08-2026 18:45, Konrad Dybcio wrote:
> > On 8/24/26 1:28 PM, Saurabh Anand wrote:
> > > drm_dp_lttpr_count() returns 0 when no LTTPRs are detected and a
> > > negative value on error. The previous code passed the result directly
> > > to drm_dp_lttpr_init() without checking, which would call into the
> > > LTTPR transparency-mode setup with a zero or negative repeater count.
> > > 
> > > Add an early return for lttpr_count <= 0 to skip the init entirely
> > > when there are no repeaters in the link, matching the expected usage
> > > of drm_dp_lttpr_init().
> > Reading the body of that function, I'm not sure your statement is true
> 
> drm_dp_lttpr_count() returns 0 when no LTTPRs are detected and a
> negative error code when the LTTPR common capabilities report an invalid
> or unsupported repeater count.
> 
> drm_dp_lttpr_init() already handles the zero-count case by returning
> early. However, when passed a negative count, it still writes transparent
> mode before returning -ENODEV.

And this is correct. If there are more than 8 LTTPRs, they must be
switched to the transparent mode as it's impossible to control them
individually.

> 
> I will update the commit message giving more details.
> 
> > 
> > Konrad

-- 
With best wishes
Dmitry
