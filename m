Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793912880;
	b=dboeGgDtCAtEpHqyRhW2J8rDoanoZSfqHzMhaRj20wYJ29eqpkhmxPG/lsJZZFTUfYtl
	 vMZdEolRRbemQtAxjhhatPtl/dS0o4J4WHC/Y6Wrv9MRQ5JTbyT3qUbap0fMZ/WDHGNfy
	 C3IZFxU4mwVfDehypM+qksg9Ep73fjEzoZ77JqpFIJnYGSOKXATVCcZMbpVyFg9VyyTks
	 VAOOrO0hqfPAyRYw3xdmI4P9LK0mphRUrDuANp1PpACQ8BYy76Vhs2+bgNJ6/fKB+m9Ac
	 BkdZRSFJGBQVn+0r8qXT5MkDYE6bBaVHjWoYi38hi1qsNeIQKw2cWimlaS1kV9sOCVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912880;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yrKHsAyKjgQsLWA30cSaDJqtamOdne71y3/nc/PZAXY=;
	b=ZsfT5m3WB5dMOHPhs+C5kd716PxGhGt8MidjdE6gFNJh7FzxkhYzOw8dVvJnYuDNK+Ah
	 Okzep/8NxRxeWdWhlHDvG8yQPU+lDr144dCHqqlT/3ZQxudEjhOH4nG1zvhIBVYeYS3CL
	 dPrg9eZgmtLdKUa7cY8ADL5dCjcOZCiQkYBj6Z+lJbh6MO4jtD2FxoUiAbfz+VQkxlPab
	 zWjqoBpOJLS3Mt0vJqeah32ex2glrYvQuabR5DKGxnsOd9Be6tHMFuf6I2P26QVq29N/u
	 Q/87H8iXQEIduezKtVXpJq3BY4gEm2P4ZztlEmnuFEDnqvLo30Sf1/MEpjMybObcpgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=koQgpWjC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xh8l0zQ6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44D7606D811
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D44D7606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=koQgpWjC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xh8l0zQ6
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5L6OhX2529097
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 21:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=yrKHsAyKjgQsLWA30cSaDJqtamOdne71y3/nc/PZAXY=; b=ko
	QgpWjC/rgaCt0NHLrQfHNc2+Iz/JbxNh1STZty8f+unqZjTUU/JirMf+++xHmTwn
	YIAZrKLT7itaSsSGx+ulrNeD9GR0qMz2h37Ck+zV4OUg3wh00Mn2WSEsYHMCNcDd
	QqpsSySqlPm5HBaRQpCkyWbihCF2TeRDDGPY3C1W6Lkb3bDv/SiNI7SUwfvyultb
	GbG7PlaJWNLX3FFhR+pBy8UhvcDvG58NsxsaX0KIJrgPskdDOKMUeewLy9T4UlwI
	CMPkAPzsWNfscaE0LpzBsSo3MXr9IP04Bb4wLqiDJ0wLQLUQ/PkQF4uSF49g5qsH
	4MKFiotR99rvbtV2GVww==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hryw18ey9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:07:58 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-451d80641efso2843362fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:07:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793912878; cv=none;
        d=google.com; s=arc-20260327;
        b=MM/q0cLAZhVvbrXFusK53codTsEgW+RdphzoGMekp0PURASajnhHOlvpWx0/kVhyFP
         Hq17EpF8qsu0xZBfPjsCT2TDeCM65pxB1UOrhGBxU8Tzs3eeo5l8RoyjVzkH79ITg9SX
         h4aPZnEd13bvPECujI2gGZw8HLwJYEldMnbOLYGDgevjBgASkcQEUYIy0MI4GMJinsra
         B8gPpnjwvYF5vmeqfY3IHgOEurcflySEzFGzgPK/Atrn4OzUMC9hQs2gggzvyUC+WTpF
         AzAue4XtDum99++JcYMLBb8oU8dbBSBJ+Q8VquA6wazsyyc1tjnXyGvz03lW5w8I+R7v
         7HtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=yrKHsAyKjgQsLWA30cSaDJqtamOdne71y3/nc/PZAXY=;
        fh=vLCIFvLaMtfjl1dLABLOgi7/jgwNAOeb4gH1N5LV2wE=;
        b=BFI8Hor65DmDdXDqN7G/fnkR38v0j0+dM6oHM+PaHw0x8yKmzvrUsIJ3jHBS3D9G++
         7Qc3X3vPkMQ17p87oFvqQzI4Ejf1H02SXZSCmNapiiLCYltYEcjBtcv0JE7rCiDeC8v4
         57zorqSB5PWUvOy1WBrm6YSLkTZAxgn/1fX15Q/EfVtfvajfPHnwrp6nesLvAK+OX+8p
         WGenJTJ+iEL6hclZmEtyeN/EPqiniEsLpRiHlClGdsZwQ/VD8O2RHmMI5Ntq10DtntsC
         FqVGIYbN+UJN8pb+FdfFmLecZmZL23Z9mkTB2uEAo1VkYYkqoB2lmMQZGRXL2HxnmjLv
         Puxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793912878; x=1794517678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yrKHsAyKjgQsLWA30cSaDJqtamOdne71y3/nc/PZAXY=;
        b=Xh8l0zQ6C/xZbWgnXvb+3G/sy1IhfcE9UXe48qhHSuQk99fNy2Ueg8wIurqpJ/pQr1
         YAgM/dtLe5p16fA6mpAQrBTytMe5WLmXR9i47duHnVJxFF84Oytn49z+CMmAtCkxm68r
         5q7pCtN8lUv9wo0HQS/fSD9UrifX+fyX9PfCRsrIdsQzKlf+4QBIidZSwfPSpzWJw+m3
         iOCntmvvt2i8/xtvq2da2su848AK0q0RCV6Q0LelKnt6VGkyq/Fu2Bd1HZkc62rIfNYQ
         vFX5iQSIJTIBJiR//MQGAWCmhP48kGtXPq4G2KZxcO7SweyJYGEhLKyWS+xgoSSokgWR
         Y7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912878; x=1794517678;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yrKHsAyKjgQsLWA30cSaDJqtamOdne71y3/nc/PZAXY=;
        b=PmGb6F+rBaN07zkQqXlh62zGITWjrCSYrTbBiwisGc3CJvcaaVQepz/dObll81X86s
         gR9x8BDeQSIy/zxE9bZ3DBZAkTb7G4Ajy5OtRURPDywdM8WcQEj6j5C5G+3IR5waMYYQ
         q+2c1UKAsevEKMM4yLBIJWE5vanswjQrOo/7tok6yMtLJ671cx8UnD+lAnze14x3t0Lw
         LjFyPXwptvHsJaVgo06Sv72n+tKqAoSOnLczUTa3qlOScf9Rku4Id8bbihh3Z2iY9+Yy
         bc86azbzkfB/A6ZPOm1OpDUBOhuOhpih9tVI6NiigtaOU5A0zu+V2T7gfU+eqwZyxhh4
         Nfhg==
X-Forwarded-Encrypted: i=1; AKwUvBzT8iPxYdIvrm7DPtfQF04xynSywDiIQe3fj5TvioBhTgCWIm56FGXmN8vizRb1gy8vnVO9MOJZR6SojHs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PgcvCp4Y9aXzieN5MPFv1Y51h+K6eG2/0h/qMTDDz8Bp48NRs
	tcf7XEDlWqsTVcVG+Udoq7fwzsanma9NqB3ElFyGAL1wWpdnUx/ZXV8IvJ+GFYlTyCr7NLSiDN6
	Wy3K60unE3+zyA48XM6FEbL4WfAjcoPqRVis4ASrELqFG5LRVXq0SR/kJk1MehyWXRy+QyEYP78
	VB6QEjVmVfZVJnW8hLyhkldBNvyMzbCU3wfgdCaefrwg==
X-Gm-Gg: AYBFou0qoi6bU+u+jaGv3PfCq5ZiYaVc5Eh6hzZul890prmqtFO9MKaRAsuvjMwohlb
	8KspzKU6jTMmlXn0mO4TnDCEypXWgCRbY44T4FkfAS48utFFJoN0K5y3bcRxDJanqc8J8Zba8Mb
	xxT6kxBS34TCAMAoYEwwfBr29VlyOAuVsG7I5BGbP0xMGRxkF9qXVGq8NEN0aJ+97WkPS2CJ7t2
	oLp3oHkTvJ1xCfA90XPcQ==
X-Received: by 2002:a05:6871:a1e1:b0:48f:e0e5:a1ec with SMTP id 586e51a60fabf-4ad98bedbd9mr282014fac.49.1793912877662;
        Thu, 05 Nov 2026 13:07:57 -0800 (PST)
X-Received: by 2002:a05:6871:a1e1:b0:48f:e0e5:a1ec with SMTP id
 586e51a60fabf-4ad98bedbd9mr281983fac.49.1793912877179; Thu, 05 Nov 2026
 13:07:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
 <20261104-ubwc-format-docs-v1-7-389044012b4e@oss.qualcomm.com>
 <86b801ce-a56c-4ff8-8915-9be369fc0ce8@collabora.com> <CACSVV02t9=tm2qyG531f8Ne90ADAb1_ZDDGEg7PwDmoEvGxPrQ@mail.gmail.com>
 <062fe7dca00f77dac05197552d22897b28dc2143.camel@collabora.com>
In-Reply-To: <062fe7dca00f77dac05197552d22897b28dc2143.camel@collabora.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 13:07:45 -0800
X-Gm-Features: AclHuK_l2F4brRz8zEFJVBH6hAHGfTJx_ef7xI7quruekmosYIZayahgz2bCT68
Message-ID: <CACSVV013piWuVo87SuAGK+j9i+rj4cHGiOTX9kznE4ROJup0Hw@mail.gmail.com>
Subject: Re: [PATCH 7/7] media: qcom: iris: describe QC10C as TP10
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Robert Mader <robert.mader@collabora.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: i9f_6VKouLC_1aH_n705mGmTtogb0hN-
X-Proofpoint-GUID: i9f_6VKouLC_1aH_n705mGmTtogb0hN-
X-Authority-Analysis: v=2.4 cv=RdYFmFtv c=1 sm=1 tr=0 ts=6aecf02e cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=w63Y8P8m0PzJOg8PKjMA:9 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4NCBTYWx0ZWRfXyFqIXx41cUwF
 0kEg4vMJFZ/A88hKCtRTC8y0X+PlYDAm+m5kncq8J1IPZ5/GKvGSrTrdMa+O/vrNvGmo0Vmf28O
 QeKYd32QAe3Uvgvm9u7QydiKZMO2bo2Q41zms6TkCawmzFjyXqGM0KlG28fyRv5VAynaH1L6ngd
 qcBpApu7DO8sKXyrZYsyhTabhNxWUm61C5O3nE/RyCNAZGJ/N/85vvdKQK3fzYbKD4t1GyA8f32
 MeSD/cgh5g1ju0Bq8IL/A2wwQAz8xUO2anibrXdMXarqe/BqP5Tdlw9e5AvYJ2eveeiKtG42qDQ
 3zKXT163z3DbJkOiChReUd26+Blne5vRpPV/rj81aWNjfjzTe3/VxJ3CLihsWZqms8B/857QZmx
 hzh3uT7DAfgmgEOEWZ5zJt53zS9kToho2nf6vKlHMDBmDlU4Hdk4Radv2W3W5MXKNJWZtrH5TXg
 0udgxP9qdZU95ygnpSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4NCBTYWx0ZWRfXwW5L0TwZkOZQ
 kkcd9VmHZ9jdpyaouMoAV9SOUlUIicASlR3AEaExZpBFygSjwUW/3pS4lK6kzq4WmrMvVy6z3ny
 36xOyBRygQuOfI6omEJgS6IlYAClS/E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050084

On Thu, Nov 5, 2026 at 12:30=E2=80=AFPM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Le mercredi 04 novembre 2026 =C3=A0 14:11 -0800, Rob Clark a =C3=A9crit :
> > On Wed, Nov 4, 2026 at 11:00=E2=80=AFAM Robert Mader <robert.mader@coll=
abora.com> wrote:
> > >
> > > Nice, very happy to see the series!
> > >
> > > On 04.11.26 17:36, Dmitry Baryshkov wrote:
> > > > The comment describing the QC10C buffer layout calls it a compresse=
d
> > > > P010. It is not:
> > >
> > > If I'm not mistaken the display engine / the DRM side (including Mesa=
)
> > > describes it as P010+QCOM_COMPRESSED as well, and so does my pending
> > > Gstreamer MR [1] . So if we can't pretend that QC10C =3D=3D
> > > P010+QCOM_COMPRESSED, then we probably need a DRM_FORMAT_TP10, wire t=
hat
> > > up everywhere etc. OTOH if we want to keep the DRM side as is, then t=
he
> > > comment should reflect that, IMO.
> >
> > IMHO we need DRM_FORMAT_TP10.. on the GPU side, we have TP10 and P010
> > as distinct formats, both with and without UBWC.  I'm not sure if the
> > same is true on video side but P010+UBWC was never exposed, or if it
> > truely only supports linear P010 and UBWC TP10.
>
> Xilinx ZynMP is all matching TP10 (they had GEY and YUV semi-planar varia=
nts),
> but they never upstreamed it, hence why we don't have it in V4L2. Just fy=
i, we
> named it creatively NV12_10LE32 in GStreamer, but careful, I cannot guara=
nty the
> padding in on the same side.
>
> Though, how do we deal with backward compat here?

On the qc side, it seems like apparently what the display advertises
as P010+UBWC is actually TP10+UBWC.  I'm willing to call that a bug
and just fix it.  On the GPU side there is an MR[1] to add P010 for
vk.  For gl, I think linear P010 should already be handled via shader
lowering.  I'd like to add TP10, although there doesn't seem to be
(yet) a vk format for this.  (And I'd like to stay away from hacks
pretending TP10+UBWC is P010+UBWC at the API.)  For now I think we
could workaround the lack of a vk format by using DRM_FORMAT_TP10.
The main use-case to start would be dma-buf import, so that seems like
it would be enough for now.

On the v4l2 side, I'm not sure.  But it is also not clear to me if the
viddec hw (iris) supports all four combinations of P010/TP10 vs
linear/UBWC.  I guess there is already some fourcc translation needed
between v4l2 and drm, so maybe it is ok to stick with QC10C on the
v4l2 side?

BR,
-R

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/45721

> >
> > BR,
> > -R
> >
> > > Best regards,
> > >
> > > Robert
> > >
> > > 1: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_request=
s/8195
> > >
> > > > P010 stores each sample in 16 bits, QC10C packs three
> > > > 10-bit samples in each 32-bit word, which is what the stride comput=
ed
> > > > below (width * 4 / 3) assumes. Name the format correctly.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > ---
> > > >   drivers/media/platform/qcom/iris/iris_buffer.c | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drive=
rs/media/platform/qcom/iris/iris_buffer.c
> > > > index eb8de60c1177..ec2bf2a2d953 100644
> > > > --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> > > > +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> > > > @@ -266,7 +266,7 @@ static u32 iris_yuv_buffer_size_qc08c(struct ir=
is_inst *inst)
> > > >
> > > >   /*
> > > >    * QC10C:
> > > > - * UBWC-compressed format for P010.
> > > > + * UBWC-compressed TP10, YUV 4:2:0 with three 10 bit samples packe=
d in 32 bits.
> > > >    * Contains 4 planes in the following order -
> > > >    * (A) Y_Meta_Plane
> > > >    * (B) Y_UBWC_Plane
> > > >
