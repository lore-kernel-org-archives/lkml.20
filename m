Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2EE3AFCE4
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791879688; cv=pass; b=KxYK2nffCQ3hJKqEXdzUnjrBCfwXwOx/FOU2q+k+y5uLHweRbuUEPlGmr1y7v0w97zlRW2xI+VBGZ838lsZSZ3sjVC3onYPTSB59zTaEF+NV7PoAVvWMkuI6ynBJ8bPAgthMXwPtu2KAsySQzmHos3yVvGnB7jD5m/y9hSdA/pU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791879688; c=relaxed/simple;
	bh=Nx1SjMixwkrle4y3U7Ab2IqOkuOdHGj1UhkIxBeqQFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FBNzdIBPnssza5qqMj6PHdQGIRWseekY1Jg2bBAsAacafKbpCa3sGMNzhfnlRyizxEa7Bg7Hg36r1O19uyhRpf4czkihTKaS56XIsNfHKPIECnIM+Rc1UKOG5LHdymQeau3iUAFXXgebqfF3atX/7OLMsi7ntyDWIFopv/09MCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gJqhhety; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QEGmre6K; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gJqhhety";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QEGmre6K"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D88XDo3752521
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c1PNbxNjxl3yMAPLNBXy8s1I6w1mnoqka0xQAK1gKCs=; b=gJqhhety9WqLgbhm
	DPZ5pkN9ePz0IasGDvLN7xivT0wGbJVPY+JcPy2W+WhjY6zWN1Y82ADafcAjCuY2
	uy+EmvSLU8BAXl80MLS6loNmUnCXQKBlwf5rmZqMLRY671j5TEst+YtQP1qwS5i8
	qMyWyGBSQYjbNAXm/3oiCiwy1de+ZlqjGl94XHIsP+D6vRQ2zx7x4xK6AcUUMwDe
	I7Vq0MP1HwbxcvmHy3j+s0yLAH22SXe/i83KaozBfk4zRsayTDgqveZZaHDoT5JS
	r2WD8zvrfv40NUSUjhYOvDRuRfIb1ilb0eUgJzF2z4vWXg3zOgkxViHFc3YewnLa
	+2l1FQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h940w326n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:21:26 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9106fce784dso71936346d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:21:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791879685; cv=none;
        d=google.com; s=arc-20260327;
        b=Q9NxBmuEMdhBdtsHZOh+4o35nGiW6QYX7uShA5U5neEr+QiUbESFFgd12ttPqf0Q8R
         A6gG9l59UYE6Yg6FMXxevG5NVwqnA3KcKiSWv/n3sFfRtl5qDtNLPVwHyPol59zNqbm0
         OZQMkwCHbExnfk0xaC60zKWmcJhDEKY2CX2Rjt3K6EkYnTtePeLbrP4cbSWeLKSIJOUj
         70TeUVlJyyRxc/URd+LyN571l0GqAZcb+G/7mbKdoBdS5ZzKFIkO/cqt2KRofkD4uwyJ
         jvBuvp/FVamCF3zDB1kwncpdWxAJ4qLq978assy6k9cJOuCrupOyHwJbsX4wIraFuGWe
         8enw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c1PNbxNjxl3yMAPLNBXy8s1I6w1mnoqka0xQAK1gKCs=;
        fh=jbIJwppJzHuWZJBf/0t+c08zppHw3gmwTh3c6LKsL1Y=;
        b=CQtb+jqU4oucJQwRrh2EQAb5kORUGD8VTZXlrynBKjdMgAlr+C1IY10SONoZX4nsBU
         R+4fYQxBS2hzATUBfN6VE7Ba7ugsOOML1Eb6zaAyxztanfGQf2d3gDM9l6UvQphK6AjD
         b/OY/euiVIaBcuZ8Dy+J2PwoGQeccnZ7s8eLgNXsKx0wB657tj5VTaQvILcZLksyadED
         IkijfSmsr46WFc84RknGKBxdMmm0XzJUK0w8WeZ5skOdT0G0gyXEfhBzeWIlFDZNE00V
         j7+SA15wM5fMWGAwi0IvLR2LN2Mxau3KBhHr64yT3d5OM6AIYJJBXfWZKBPBP4DCyi1z
         iQEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791879685; x=1792484485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c1PNbxNjxl3yMAPLNBXy8s1I6w1mnoqka0xQAK1gKCs=;
        b=QEGmre6K1AkI91UXE6JocG1heQf9zW2nTZQwD+IpmzfKyp6JRwNKqJawK91ah+6B3M
         lY5Np1965Pp+Ck6Ew0dwMGZqz/KKJd1959W2C89UFGebmlELS8y5bUmNVgpQaQDZt+u6
         E2Xl1qPgPs3hWw/fSt4rVa+Kq0ZmeZEoljWq/t34ctPGPHXtvuGAfI42uZEPJOx9FSC8
         pGMOkjYFZ1SxuVcl9h5LW5RvXKc6Kf4xUmCCk1Rv5ef4/wkDcIsJMcqa7ai70/HHbTSg
         2gKWT7vMVNqu0S9RSzWihqVBAUii/PPFeo/gkZ9FpbhpcgtkQni5ojhoS4C+C5Xi8TmE
         Yp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791879685; x=1792484485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c1PNbxNjxl3yMAPLNBXy8s1I6w1mnoqka0xQAK1gKCs=;
        b=ALZIQ4117y5JN30t2lO4WZbs9dsDNj4Lvd0hf53jjLXF+wDfvSxPYcDnGFahRATBYn
         kP6r9ivn7pZn3A8gZ09ePWlu5Ck317oU5nZ9WsbX+OJTExWG4fIKoCcWKPfyv8hWVWQC
         J3KCvAUIwDeaL7Wmw0CxjweC/K+vGgjwVy3gy5nVcb8TuLm9YsbIPQDLNevGNhdGWk6F
         o9xEzfqrw+c5FL+dBHiXfEElI3jhbv8tcLl8UokaA76aPmFU/6y203S0NZ6MvB8Ncebb
         1R7e2+DIr0MU02SPtOGDaiuRf5UAkz2vDrsqvOPbm8GjHr8wAK1LEKjYDg6be8HQDo8G
         gfkg==
X-Forwarded-Encrypted: i=1; AKwUvBw5oWJd5DAhA5AifRr2p3m8hGPzt+QmGOaQ71L4jMDGWeACF79kcgzWZPoI7/Q1PZ/KaYPUFVFwNz66zfA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3+vbBys7kvXFop7R0SB5rYIltI4nx2sKXiqXpCpDNyhIRly6U
	fqKkBLP0hAZpj/GgTSf4cJuqFrmE3ag8vj3ElGdLfdT0sJih6wvOTgABEB2Xnay3tmt3y0KQ6UP
	M2+flUgF/KW8TAuxSSKIDAhrTpCPjlI4whbRuR4M9XhAmmbeSM5aqMevObw0Dwzi0GIgzTdIRWW
	83dMy8uMegA3vw7bfRQ3Eom7SkXzC2ngf/uHrCFtCuGg==
X-Gm-Gg: AYBFou0DjmdkzbaEfuJh9puvO9XoNL+tNp4sKsrpIJF7PKu81pY8Qo7wSl2TaTbO21a
	CL1sSfb5o+UToMQWCdQNOOVG42BfOJ5mVJsmorLgWqYDX8sU1/Rz8fjHxkloRijgBv/v4Y0YIvo
	hNcEnLJoCDFP7BuMiyixH0eUgdt56myuLFjkneBSDBHHYFvPsPAYtvpMd6LvdGZtRKQs6qrjbOZ
	jqlvh1JThFjdYT6AwIdRYznVmYJIWboPC8gmuXaN2oML/75ljIREM2PpmGiz+gSzeKsPda/OREe
	p6GvhYyn6hqKxKhH/y6waRAs3Pln
X-Received: by 2002:a05:620a:6e87:20b0:93e:c5eb:2230 with SMTP id af79cd13be357-93ec5eb2796mr1173393685a.33.1791879685330;
        Tue, 13 Oct 2026 01:21:25 -0700 (PDT)
X-Received: by 2002:a05:620a:6e87:20b0:93e:c5eb:2230 with SMTP id
 af79cd13be357-93ec5eb2796mr1173389185a.33.1791879683843; Tue, 13 Oct 2026
 01:21:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004-cci-imp-v1-0-227d12cb4829@oss.qualcomm.com>
 <20261004-cci-imp-v1-3-227d12cb4829@oss.qualcomm.com> <717d9cb2-d7e5-423b-9d0e-fad307385474@oss.qualcomm.com>
In-Reply-To: <717d9cb2-d7e5-423b-9d0e-fad307385474@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:21:12 +0200
X-Gm-Features: AclHuK8BcryeFwF7_mfVGnZ02cWvL43_LCZ_Rm7JvQqSScTUu5Q5fBxBQFd8Gt0
Message-ID: <CAFEp6-20=Hkb9ZsubULMg9YYVzEc11Y37g90Gu1mxpvOwqJB9g@mail.gmail.com>
Subject: Re: [PATCH 3/5] i2c: qcom-cci: Detect capabilities from
 CCI_HW_VERSION at runtime
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: L3mBH5waxPfipd5238Q-TgHUlAja4EfO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzMyBTYWx0ZWRfX2JNLgHpck95B
 TZgtSQub2Xhynw7lQiLivn6EGvpfr2/8y8EMbGD2zenasNi6PG4WY8CMgFEYwinlAf/cngTJCsB
 rLe/UHS1plGSodZDQWYkAo69VkOfBIVU7RNLXPl1ed0IyEPLmXNwg7Olf3i6FT5hTVuq7TcvDus
 4df46gn+y3uD2NG04a2rSFeq6S5hxlMTVYUUvKqSY0ZbxN7uvYJ0otW05KjUTKb3D0b2bNa9y3c
 MXOwXIa4mipy3yL1dmVCOSv1vGsLVQbkRdIjizRGL7dJRH4HsPWWUpDSEACAJONvJXAZod5/YAx
 cHKx2jus4xr3RZHwdIM/pMLF43VemLfqZzDfVa/xDDasilLGKiYKqHx8+a5jI/xfe1q05Ru9XeW
 IBIfgNrcLVpkN3yKP0BuYkwMOiyuEBk+x+98L93DXlmigx+sjV+ZUaAesDgpRBsaFLhUhUK0cSs
 3DE5Ph9BsEVbO+HH4RQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzMyBTYWx0ZWRfXyUxQ2UHi9vbn
 EvhYQ6Pb/J61bhfWzAt3PrBN3h2NycNlB9SuCLSt7/46iClp7Y9qiuWkSxeAr+fb+iODonU6fr9
 NFNeR0gH+8qzBwkQLb/fXbTcHh78YBc=
X-Authority-Analysis: v=2.4 cv=ftZJ914f c=1 sm=1 tr=0 ts=6acdea06 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=GZDsnYW4LkaCH1OrQOQA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: L3mBH5waxPfipd5238Q-TgHUlAja4EfO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130033

On Mon, Oct 12, 2026 at 3:58=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/4/26 9:09 PM, Loic Poulain wrote:
> > In theory, every SoC integrating a CCI revision that differs from
> > an existing one should introduce a dedicated compatible string.
>
> [...]
>
> > diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c=
-qcom-cci.c
> > index 099da0069251681cc52e351fb656bd73e78a96c9..c0b39d419e296454a083d38=
ce302940875b8ad2b 100644
> > --- a/drivers/i2c/busses/i2c-qcom-cci.c
> > +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> > @@ -14,6 +14,10 @@
> >  #include <linux/pm_opp.h>
> >
> >  #define CCI_HW_VERSION                               0x0
> > +#define CCI_HW_VERSION_MAJOR(val)            (((val) >> 28) & 0xf)
> > +#define CCI_HW_VERSION_MINOR(val)            (((val) >> 16) & 0xfff)
> > +#define CCI_HW_VERSION_STEP(val)             ((val) & 0xffff)
>
> GENMASK/FIELD_GET(), please
>
> [...]
>
> >  static const struct of_device_id cci_dt_match[] =3D {
> > -     { .compatible =3D "qcom,msm8226-cci", .data =3D &cci_v1_data},
> > -     { .compatible =3D "qcom,msm8953-cci", .data =3D &cci_v2_data},
> > -     { .compatible =3D "qcom,msm8974-cci", .data =3D &cci_v1_5_data},
> > -     { .compatible =3D "qcom,msm8996-cci", .data =3D &cci_v2_data},
> > +     { .compatible =3D "qcom,msm8226-cci", .data =3D (void *)1 },
> > +     { .compatible =3D "qcom,msm8953-cci", .data =3D (void *)NUM_MASTE=
RS },
> > +     { .compatible =3D "qcom,msm8974-cci", .data =3D (void *)NUM_MASTE=
RS },
> > +     { .compatible =3D "qcom,msm8996-cci", .data =3D (void *)NUM_MASTE=
RS },
> >
> >
> >       /*
> >        * Legacy compatibles kept for backwards compatibility.
> >        * Do not add any new ones unless they introduce a new config
> >        */
> > -     { .compatible =3D "qcom,msm8916-cci", .data =3D &cci_v1_data},
> > -     { .compatible =3D "qcom,sdm845-cci", .data =3D &cci_v2_data},
> > -     { .compatible =3D "qcom,sm8250-cci", .data =3D &cci_v2_data},
> > -     { .compatible =3D "qcom,sm8450-cci", .data =3D &cci_v2_data},
> > +     { .compatible =3D "qcom,msm8916-cci", .data =3D (void *)1 },
> > +     { .compatible =3D "qcom,sdm845-cci", .data =3D (void *)NUM_MASTER=
S },
> > +     { .compatible =3D "qcom,sm8250-cci", .data =3D (void *)NUM_MASTER=
S },
> > +     { .compatible =3D "qcom,sm8450-cci", .data =3D (void *)NUM_MASTER=
S },
>
> This looks a little sloppy - can we infer the number of masters at
> runtime somehow?

Yes, we can either add a small msm8916-specific condition in the probe
path, or derive the number of masters dynamically from the number of
master subnodes present in the Device Tree.

Regards,
Loic
