Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5923B3BFADE
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 23:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791587350; cv=none; b=F2IKKU/YNKgY1min59obNlkWhpBx58DfF+rO8lCDIN3aj+RTKmuiDOL41IhTzXCEAghju94vmXE80F9cVCD7YPhYSPcLEiW84+ZmjvHjmaX20ms/y6381D6enyUqfDvO1Pe+mV3sPpIESz3FQPUaIhuWyP6lPUt91HFkjcmTnDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791587350; c=relaxed/simple;
	bh=Rd40uEn2aGwiiLsr15oVuQdMEfOU+oDPXaASOpjIWDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PiuIbRpHpT4FsBLjdiTQtin5kagreUlljwQcmansrO0whSVCIMIITNxtHmEkwJHGMgdV9lJ9QLilDmGqohdYKO4LMREqaLN2D5LLXX+OE83Sz3FVvgTdtNNIQ46MbOTDZoQmdSot6Mb76TBfMQ88DIVt6JG9l0G7aEYo9mMhj4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X24Q1Fp3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YE/pp5TN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X24Q1Fp3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YE/pp5TN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699Khpw33275351
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 23:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xSGqqaD+HqzjVuxc27KH2WeAXhL0TG4E9SeBeSeo+MI=; b=X24Q1Fp3tHgtoz9o
	QU2y5YDvMjRhLtw64Xf3UHOYje2TYLNz9l8TIy92UMIhKIzxwopofVHIB2MRCBbI
	qfm/Zd0Vg4UQ9dT/yv/L6PInM0TMntIELb/SjUi/DQWsbkRAJ7X8SPC9Bzim6P/b
	k0dDyjsIpAwLDDH3mo5cnR1yiF8cogHk6he016tRiKxuTun3QkoaOELmk5ft9Fgk
	uISv6pNlqWSXMwTVeN3sCrxEY8f7c4D6r7kxhBrvWHE9zU5F1AMKqdQaC/IJwwAh
	PQfO2ph8iZv00hQMC2/dUuO65akws/cqi3+rneo32h1LNXr0yRzZL+ffR0ZQUEOX
	R9gRvg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t7h2h3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 23:09:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e46b4b700so33121085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 16:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791587348; x=1792192148; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSGqqaD+HqzjVuxc27KH2WeAXhL0TG4E9SeBeSeo+MI=;
        b=YE/pp5TNiuQDOST0Gpf2TFeXF535xDo/Jhl8qvcdSM5oiYRPUjnbiXU+ISgNf5jDja
         LMa2Ez6VHLBPEAbvHCyXzJcZeyYGnIU/xK//MAe00P5paqkLXrzKZDV7rWJBiGMOerYS
         LsbZFPoheVnCaemFg1ydVN46pDnvi3oKJQmlrMcItD0Ed4hLaIIi0BQn2aIpUK/SN/2T
         G4j6VM8ibtaQI2UEjSipILH8sZFRVpu1Tk5ue64dguPtpOjk1gp+1s6D73/jKmkT6eTJ
         o3yt64qyYWKIswr/eI0IdXbtea1qhYA6GV7IJBjvYrUSTjTa2uPqcWU5AoS+GsxxTL/O
         fZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791587348; x=1792192148;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xSGqqaD+HqzjVuxc27KH2WeAXhL0TG4E9SeBeSeo+MI=;
        b=zDfCV7ukys9rZCqGXB3Ch21hPQl2+v2w5vUGWeaG6tk44Ar6U8OXp5KVOwa2c+E1Na
         FbGwFmwBxf73Lp83mOrlpWzquuNu2PTQEfESvPJS5GBwq9sWQbu37HUwc+5VfMkT6uh8
         vmt900fsb6m2pD4YCPR5hxtlnOUOmON3ZUxawwUSDl4YSMdLGmc0bM8G9MKjKu3YgjzN
         Yp54APZKf/fb6HbFQJpjgRufGS51XGboCf7l/8EXbSq/jcgEMhrETEndEiCcgJwvSHnS
         egLTwkD0zljrVcy8SUw4Nq30lbePYRyB0G6QIhkQLpkqPpqTP0iOAEj950lCuGoq0pky
         PWKg==
X-Forwarded-Encrypted: i=1; AKwUvBwzKuh3UyGw/wVJUuEFnZlTOpY/HQkKl+EJWi/ceq1DNYd9kHcgVmtP9NYa6Sqfdd6TlaGcr4rweCjAh5g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIIRyMbRQOF5lXHIFiMYFKL4qgNqTwddjGZz4E/FnZQQVi1oQ+
	0FjiEyVaOjsIcDuJXHzBcU0i4CjawbHcl3OfmTuHvwIQA+VAwS1qx93JDvJgbUo++i2/7XB943A
	4QMrQbOK991bapLtzXx2Db44dij3TsD6V1O8zTefen2m/JknbPh1VpCI+CYAWBPrLLOc=
X-Gm-Gg: AYBFou3vFchcYveNxHh1psw6cyiiaAIA6SnENEe1gAPTDWFt+lhURM23WSVsxQc/b25
	gr88rJcaj/BTxFa7BGKmokrqG2BRzfBMPL0CX/DMkBaGEKZjsq31d92OTT/Hkjn0JAU0Q+HCmcX
	f0zwl7itPR2N0XcEchgv3W1NEChyg98/BXLzFSzvOh1sdfbEzuxJedJBNLJXKLrxj1Uy1ixoobo
	qU/ljWqAvvI5bMEaHxWp0Pxc8lPHhHrJBk2jCxhobQ98fS07Q1aTa+P2i+DXb3HWucEZMW5dxJA
	6gwSD/thIFUslBRIWh6YMY4VFpbKb1XsIRbGWLLzkE85HghzDRIOuzpsxnMh6SMaiLa0xRs8/t9
	+ZudKgIHNG3/MW3bNB8t3BvTI1eks9Dgw+SUS84rMKImzZViRqr80m9/xL9+4nUE0AvmcqtBIA9
	ijYNKxY1dmKaxh
X-Received: by 2002:a05:620a:800f:b0:93e:c12c:9b70 with SMTP id af79cd13be357-93ec12c9f31mr442672085a.75.1791587347548;
        Fri, 09 Oct 2026 16:09:07 -0700 (PDT)
X-Received: by 2002:a05:620a:800f:b0:93e:c12c:9b70 with SMTP id af79cd13be357-93ec12c9f31mr442667985a.75.1791587347039;
        Fri, 09 Oct 2026 16:09:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3cf5903sm11083321fa.42.2026.10.09.16.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 16:09:04 -0700 (PDT)
Date: Sat, 10 Oct 2026 02:09:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/msm/a6xx: Split out a7xx/a8xx device tables
Message-ID: <zsewft5gviv45ks3xvrxoso2vhxa7eeyrxznwhgnnpjjyyngbn@czuyvv2wwdzn>
References: <20261009131927.551319-1-robin.clark@oss.qualcomm.com>
 <20261009131927.551319-3-robin.clark@oss.qualcomm.com>
 <7c9149f5-b1fc-43f1-9f4f-299767c32a90@oss.qualcomm.com>
 <CACSVV01j14Ew6BQbW47vzy6OBDcUdODBT+J7DqBsB2geJRnC-Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV01j14Ew6BQbW47vzy6OBDcUdODBT+J7DqBsB2geJRnC-Q@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=W8atxhWk c=1 sm=1 tr=0 ts=6ac97414 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=3T64X_j-PjA9zNe75B4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ke3BJhgfccItTEF4Uvekl0Nc_rjQkhLI
X-Proofpoint-ORIG-GUID: ke3BJhgfccItTEF4Uvekl0Nc_rjQkhLI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA5MiBTYWx0ZWRfX/dCNNde3VRuJ
 MxHwR/jGCVmSWnxzwm0JGnetL/3tHahN9YwHcz6rWfVzQDaZH5L3e98U8x6ZSujVqoLhHPsGRDa
 5BZMgY1l0/gwHVAujPdXB1sWxfWI+m8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA5MiBTYWx0ZWRfX8Du82xoJim5t
 n0Mio6bL+gT3xsCE6XO4qP1DjXdZK6t21J9YvMLAAUTxsXxRICm0+QEK70acRi8KBco7voynkiS
 CEu/zwiv8LrdnbOxlGsLh4uvQeqsHlDR5ooCpTjPZVDURYcXj1gq/OtMyiHsvivXSL3gq4HacFs
 XoZ9+WV89Ylet6GuUqQ0akzaYZkDG+jUQ2DBzaaDwMvaK47LPUBSi+WgeTczfvqgB+L6pdBwkNM
 GaIGvNpEc60f5rSOSon4FWU2wDZXfX1nsiM23Nr1/lPO1q+cCEtAn97MzZGZaAGE2KwDkJruLmP
 8SGiOjNzA1DpmxxjPhhNYHoQ9oTw9HyFlW46xpkE2DcjOqD/qjjs5AUrYYeeDXNRtH65lJCfCeb
 mRPSr2hSFQNOtT9o3EmhiqMhjRQz96Wn1Gj7IydwwJ/qFjzummKu+yAFhez4JlXJunWpCCY6EFp
 J9BsYzgZD5PZvQx7UMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090092

On Fri, Oct 09, 2026 at 01:38:19PM -0700, Rob Clark wrote:
> On Fri, Oct 9, 2026 at 11:55 AM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
> > On 10/9/2026 6:49 PM, Rob Clark wrote:
> > > This way we can start including generated tables for a8xx GPU snapshot
> > > in the device table (without having conflicts with earlier gens if we
> > > eventually try to retrofit this approach, or later gens in the future).
> > >
> > > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > > ---
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > > index b44b0fd916aa..66c44cbc4d55 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > > @@ -670,7 +670,7 @@ static const u32 a690_protect_regs[] = {
> > >  };
> > >  DECLARE_ADRENO_PROTECT(a690_protect, 48);
> > >
> > > -static const struct adreno_reglist a640_gbif[] = {
> > > +const struct adreno_reglist a640_gbif[] = {
> >
> > Is the removal of 'static' intentional here? I think some static checkers will
> > complain.
> 
> Yes, but alternatively we could just have a 2nd copy in
> a7xx_catalog.c, since it isn't that big of a table.  It was the one
> awkward aspect of the split.

I think it might be a better option.


-- 
With best wishes
Dmitry
