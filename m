Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792673279;
	b=MyzOGAEtxZgKDxgxJnMBUsRY0Ar/1v2RicWqDIH4TnLFfT9TDwriErTVmTRB3SHa2vyg
	 MG+/k1kK4N6D71dqCXqEL33RQJMMBOd3tMGKLBWzOMZCU2i7VZ3vEtDZcudAPhv9FewQ1
	 zVZ/eXQUZSnsTFm1vZQmFQDtFtP8dOLRBNhdN+dJhElk1v/L+xHDrav5HznTYBb43Msti
	 hBOY31IZ57UtYlb8aowxRNhSbeh7p4pWtsLSkXEt71+3livX4K/G7Q2Agr+2N1E/JWdD+
	 mcihxCAUcqK/Zgx9o6+nx4GEfQNYlu/CQL7iFbnNogcpiBn6KnGMZVEXREzTKDE2GOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673279;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=06kemhZBYWxkv5vRs3riZ3fnXQfC1fnOjES4AGUZ0io=;
	b=hR7cj3Fb1Y1HGpI1UR1wgfNgsQmVOZAeaFFyvs6iqNARi1EIf92z48o5f11uCE/RE6UZ
	 HbL/eQf/syP1dGKFlHUT3X+Frau7Tk27vYx/2/8p0FxyVhLXUMVYujv6bsni+ZBl2FdRN
	 kBp45SGwu6VjO6c7itmPF9B33KsUqfpuZKmCJ513L8heQ2amczD1xs0qQMxdoNvzsnWSL
	 4Rt3tYBF/ksUJGfRxzAeIVmsiLjq3f1z98Vg2CnWqJF9pXUu+VZ1NOd+2gZPY77Wh2RU6
	 T0uLAXY1IO4VNjc1DS3aDIUZVDTide/+HMD07SjQOU7MFrSgdj5Jy5fxkD2zEmVhf0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DHejP2Uq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YkVHx4NL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDA6606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EDA6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DHejP2Uq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YkVHx4NL
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0eYn3923338
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=06kemhZBYWxkv5vRs3riZ3fnXQfC1fnOjES4AGUZ0io=; b=DH
	ejP2UqKqnZRcjb3dBlJySyQ62Va4PpCZ3lH+mvy9or1T8HObGB0TJfC4G6h3wxzl
	xVPSoBw/Xy17TcuaBdjwd43QXaRkck90qrK/VEzlfDFbeQo26ggJ3Bb1pMJcsV8f
	ZV6OBhasP0QcQbGExDwvasAZhmjnoyPkglpToyrmCfqMsKctky6OjEd0eQuOvnku
	v5QHtohgNUYOe04uNysp2Kw7e5wobZ12qXZRHmMCBljN5QMqZvZDVxmT+kMvTrBK
	n2LyUDlHAOp9ki2QV9GzSNhNd1MUNOKw8KL/rq6iTjyrJebf+gxSI4ptdYQMu+Et
	TquK3SHU9+1tnQaGCvpQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bkbbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:47:58 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6e0509533c8so862775eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:47:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792673278; cv=none;
        d=google.com; s=arc-20260327;
        b=db4cNs2LFHrPHFwnEmlSe3sEX5a9O7Toa0tQe2xUiNdw+WpdfLiOse/BVrBjdwVqpg
         UZbfRALCoJFGCB8IURFUROeoQvAq2fQmRS9AHH1zeXR3PwMojPz0oJ84viE8YVh9ufYZ
         g98FaTMYfEz5L21D03OonBGxVuYC6FfPcmriWSFFDV4fQGJIc5VIZnLsS8CFD8BMpnCf
         34g4KC5okxK3+kN8cAxwf8ZG6U1Zk57ujgC/kVKjl/tmxGOSv3TPqpLPnsvxAF7euzmP
         YTpIHoNPpPyaUKYSiATKgw7DDelmMzHp+cmEM+sAFbwTlLQCvTItNIkDyb9BuVfmZgzj
         AA3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=06kemhZBYWxkv5vRs3riZ3fnXQfC1fnOjES4AGUZ0io=;
        fh=S4ekTSah1ryycnaZpOV39L1kdbJpr9QKyW31nFqRYxc=;
        b=jGbGr5djNMuvPU6zAB2XhdVAOK+wIqaygslbq/XTdaHN8ZPlXkIZbY5cDslUJOTlrd
         TOhAx4I4BHLmPiP8Vr7YfhmDBg/6/6gI1Sc9f+Vxpw0/3aGZylH0V31e6rdvLdTHUjPm
         HLTvjG0b0T8waVyXM17nO28Y+yHg6wuEsLk6uqK7dPDrSyVPe6UMmRYjVKYPvMpXtKlg
         /qumnj6DgWLsD7v4YoHzo0pmn5HufFXpnbEz5p7zOzMDT2moXi8qg9pS2EW0Juum06Pa
         /Ij/hYMw1Ey0A3GcQZIKRIbXI08+fyy26ywBjZopjsYbDv3Q24uaAKFYaQ3NpCQ9GBQ2
         FJYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792673278; x=1793278078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=06kemhZBYWxkv5vRs3riZ3fnXQfC1fnOjES4AGUZ0io=;
        b=YkVHx4NL+lY3LpTRnPvq710SV0Cl7bJFukKDud6A9PA+Axp+P862ozU3U7GrWzyDha
         097QBk1fDGLlGTH6qJ7sdib+X3OoEmq1IIL0mnX25WmXVOeYJZSnDbADIB6jH/vieu58
         lRIL9uYxceEMX8K6JT3mF3rpQkWLc1iUk99R5OFsrW8RQkA/V5aH6WvFnT9RZ/27GZgb
         1ravdv++8dk234r7knuSAdGJO8iOldeQxjuNacHilP+blwMw/9Tb2za2ELWbh/HT+sYQ
         ESc9nyJdJnxe4QPBhU2yEWVJ6bWtjasclv3w03P+hLoyZ7lt/vJcnsGT2n7P4q/YP8nk
         +GYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673278; x=1793278078;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=06kemhZBYWxkv5vRs3riZ3fnXQfC1fnOjES4AGUZ0io=;
        b=dAvrbCdOavQqT8sRNQue3LDxyS21ewbK0tVlDdUG67m6+G8FH8XI7IW/ZFCD+GYasx
         +P5mZV5KxAiEnBYNRcy7hLbxZm/nIwiJAgO/txctGrc34GOYH3LzaJNggYBfWbPXNCZo
         eDvpuRWJ6qFMuA7O33wLiLsGZzjRN72+Q1dH8fYqyY7ep0CV8OcyVhu2TRWrcXHn/vjd
         3XuyqVlyR7rKSjEVfNr/3FGE5pXeW9oVCKsuwrgINFjPs6zgErArM13eEg0ywL/sbCUY
         SgmGXtIHJ/S5P1w94i7T+coZ663VaKP7GXFFurjvafvfl+5bsX3a+aD15SlgygqPc76q
         LZ2g==
X-Forwarded-Encrypted: i=1; AKwUvByXe1mhx09mMwtxvqatlSmtvwibX7+P3DrVvm7PDj3U2plU6QKvPmb9B6ams3bmr1Tbzl2586AKRqahBNI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhwloQ1rW0TVpQezEI4vnpXeX6aUTMSWAH9rGT1KyyLc+OXYdL
	vYnYCBmXl9dEzl7fdL25esSSCLZGqWJgGWp+I39lwZrodiK17wEYFcqk87tiPSyG/BoA9PxXcT3
	h1RPCuyaAnK+6ElQXZX+R/+Nza41COYjqrnYRN7gCgAfC4d6gEL0M07rW7m8Wt79EsvnKHcW7gM
	7ZX86Bk9tSx3LTaFw88R8yEgktVf8JqpaUA7TYPbmWmA==
X-Gm-Gg: AYBFou1eRYaFVvzXxzqe2E+OMeWmKZ/4s0GQYn2AnXlHWeNRC2PBmXfaQW0b2EL3vHr
	ZL4r2cWwQQTSxU7tJGE20UX0rYRhC9mp8V+N9eLT9/sM+fKq1RwZceqIb8fHKaNp+c55zlgJMjU
	WPG0EUxSykiuUZNNo515E+XtUZ/nglcSkls7VtOl/Dhq2KeGMp7EFxWuR8Ig==
X-Received: by 2002:a05:6820:8ca:b0:6d3:abd1:9b90 with SMTP id 006d021491bc7-70a817ffd79mr1195060eaf.54.1792673277875;
        Thu, 22 Oct 2026 05:47:57 -0700 (PDT)
X-Received: by 2002:a05:6820:8ca:b0:6d3:abd1:9b90 with SMTP id
 006d021491bc7-70a817ffd79mr1195042eaf.54.1792673277444; Thu, 22 Oct 2026
 05:47:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
 <20261021204244.67160-6-robin.clark@oss.qualcomm.com> <aa6dda5b-419f-425f-a9b5-198a9bf7eac2@oss.qualcomm.com>
In-Reply-To: <aa6dda5b-419f-425f-a9b5-198a9bf7eac2@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 05:47:45 -0700
X-Gm-Features: AclHuK_bU7poutswK7uYA510NNIdE34sTKZBdGNumfyeiwA09wzxHoW41SK7b2o
Message-ID: <CACSVV02OCkPrTBuGN1n+nCkVOZP4WGacDSNy1GUp9okZqPNkuw@mail.gmail.com>
Subject: Re: [PATCH v2 05/14] drm/msm/a8xx: Add missing a850 ifpc reglist entries
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MCBTYWx0ZWRfX9ch/2hidZ5CV
 mzSpcMxmV53NI+ir7aBrUrBY9KNGm5Z9uKwGLf7+DeCoUTkzWhTxY6QVLlAx0AkfJdcY3kRAIHB
 5DdEhNm2MRMIAXRunH4seNjWSMYOVbLC9dbg8BsuExQj3gk5e1j4bI60e0x80fNSyCFK9CMytUd
 vWZNJqaBpEJn4R+bqz2Oxd2u61YpBycJpE/1+ebcdshqc6h1MHUtEdZ0vGQspzSoip5odJ60FVl
 oPj04JYKetUqR5ocVmST1QdeovE/+dqjUXg2jGf2GryfbDQn8DTbD+wcXmpPMSsAbE1NlNntKnI
 80gCWrB22M87gHK/gpTUEH/xZD+CVRDmTJ9FrLHTyLfHC14BTGtBwlydhc7YbmEo13MAb39s64u
 WLnBSNjteq3+cYooM18c88WXrYik1g==
X-Proofpoint-GUID: 6z8wnC7tG-h5mI6q5M6h3RRee7BL1BnC
X-Proofpoint-ORIG-GUID: 6z8wnC7tG-h5mI6q5M6h3RRee7BL1BnC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MCBTYWx0ZWRfX6uFlBeWRrMHx
 b5b3UzNLl15EQ8Pv0Ew0OY1d3rGrldHSkBT5SiB87916RX7FdXtW1kw01tq8KjqMoxtH3WbJmny
 Vq4zAH3Fmti3OqrHF3a/qM5KXvUZ+Vk=
X-Authority-Analysis: v=2.4 cv=CMy/zhrD c=1 sm=1 tr=0 ts=6ada05fe cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=arxZg2z8A5urglJSSYUA:9
 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220050

On Thu, Oct 22, 2026 at 12:19=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/21/26 10:41 PM, Rob Clark wrote:
> > We want to save/restore all of the CP_PROTECT regs across IFPC.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
>
>
> >  drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/dr=
m/msm/adreno/a8xx_catalog.c
> > index 55a805ab438c..45cd986ad4b5 100644
> > --- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> > +++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> > @@ -1477,6 +1477,13 @@ static const u32 a850_ifpc_reglist_regs[] =3D {
> >       REG_A8XX_CP_PROTECT_GLOBAL(53),
> >       REG_A8XX_CP_PROTECT_GLOBAL(54),
> >       REG_A8XX_CP_PROTECT_GLOBAL(55),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(56),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(57),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(58),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(59),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(60),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(61),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(62),
> >       REG_A8XX_CP_PROTECT_GLOBAL(63),
>
> Sounds like we should autogen this part of the list?

yes.. but not yet :-)

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad
