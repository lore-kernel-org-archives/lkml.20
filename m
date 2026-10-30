Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793371387;
	b=a0wADn1B6plpU4AZYYDc/tyFnARrdl2Kqa9u1lXxEnNbumsJc1YroBeDPa3NpB9jGYRv
	 HraAlZ1L//zP2yZizTdMuDoYlkZgTPTg+7QeCzctc3R7DXWDNWSldyejrE8Vv7Y7vYAwk
	 b58HqKCAYoTOwMUFCxv76YKfsKPLz/1OIKnrDSHX8kR/Ej4t+u9qfN4wG9R3VGa7DnkK7
	 HagETYfUbFr0P+mOIRghYtJD1A3UNNHBQ7+drQUDeHcLdgF3zO1eNFvNjOhI/miNV2Swf
	 tIb8ngZkEYpS1LTkGDMKP6H9X+HxQ7Op7kjq2pbelxxX/Wuq/shqcCLboprwMVudP2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371387;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KbultFdxARc0+R6qwvP8HKFaCeHvN/9tHGKKeMncdgM=;
	b=Qt3BjOqqrTMS09Stf0D9MjDf3/Hg3c+VL3h+3+xwwV+qLW6sZFUMbKUZFJiwjeIJjvzL
	 GMEdalWqzzvHcnFCIJDTi+CwLIWkimpbv7e78xJ4Uqv8zUpI8tisKULpT3O48RnX9i4LW
	 Ly9TR8nKZ9pT3urE4JIM/moMIZMbOzlCzI7sFO5lZIZGmFbPBum7PR3LXsQ8o2drOvqj/
	 3kmgBNFrfezW2jlBcQCKOQF9hOkp3iOEQDnuqYJujSlP3zkSraOsxeBZN9kK9ltvClzdL
	 V2RrfsX0oLZtSIZxAy5fa3XNGcD38L0sQ+PHZfjWH3XMtukIuyxjPsaosZ2nM2Rfd1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="i/q9l+Sw";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hHGYAMN8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10D8606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F10D8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i/q9l+Sw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hHGYAMN8
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERiHD3207515
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=KbultFdxARc0+R6qwvP8HKFaCeHvN/9tHGKKeMncdgM=; b=i/
	q9l+SwlxImRNuH/8humXE68p8ikHqaC3OSwA5xqd/ORguVoNvdE5CAij/2FZgECT
	RSwS0D6O65xqDzzHk3aCD0TVCe/1d+kxlTz1qSLvEYGrZWm1Xu68bO+oyBkQvJeO
	scx+OsSHS3phCkp0AjdaZkOJFboxghlui9Ctc5hvNREqq9NIMyQVbCkESARQpVqT
	yYMdIUTNRsgL4dLtdR6GFCLhmNo/iGHcpMcYGXrsPlWD7LYrmduNZvQ9SqH9T+Mx
	aHYQb9b4RghMtbAVBDOv1dBkBl1flnMl8tZsZ6kVPPTRlY6v2ktfXODXZh2cQ76V
	B5yb8rhEtu570PHwaU+A==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkhvj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:43:05 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-45e6091d8a1so443603fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:43:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793371385; cv=none;
        d=google.com; s=arc-20260327;
        b=QliMQZUWJ0+HuIm+cio2WnQ1xMJgwm1jyf8/8CD9g9IbGe2MvQRDHQrTxkHKllAnAY
         6MsrhqywkGLrFny12LWj3p0mvKwsG0CIgeb2TFvnhOupu4ma5SdQlFIB1zUNQD9BcT0D
         oheqzB/UbYlNl3BUlycv/LQZsCANj3di/o53P68/eSyvzr0sxu1Gy9r28elXB41SrTg8
         OZ+040n6oG7iSovRRdHUbIX43tB0HBY8OLapGgZbjpgYRpQuurlG/z+DLE9Ltw9REPa4
         EaZLCABwuSBuhXTd68FHVdQWLUaIqA5slkxQnJqSr1ZN6LVJ4G9X9Eys9dCUw9JP6NTW
         hI5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=KbultFdxARc0+R6qwvP8HKFaCeHvN/9tHGKKeMncdgM=;
        fh=wb68fEO2QY/jHjzaOVJSQ69vRvZYtLp1sbR52jrgpvc=;
        b=NfM9ggVcYV6Tpx3MxPDCA0mAFGp4hYJoYTmFE0FkfaHjLXdq1jUX3I+EILIpM+RpJK
         zPfbXoxqiDSlnF+x18TdetrkjW78tlDCixWQMAH1T5SJ1b6lgSobyQEdbogRd304MVpI
         kfytmarcfN0fZJu8SoW/mdbQBo43ksqAfjw9sM4JQXJp5Oi4OzZL/yK2lAhDNAOg/wd4
         eNQv19HpP2nZY6bn286qQGDPdmCyjDxh5Nq0esL3OtZHJ4iuXW8i3fDnouTFEKzZHr4l
         BrykHSfiQqW3jujBSGM9cSVwNhQ9rwiEGiLrjf/ZyZfvBXHNxHiJ7xJreSg1Ne6WcREu
         w5YA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793371385; x=1793976185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KbultFdxARc0+R6qwvP8HKFaCeHvN/9tHGKKeMncdgM=;
        b=hHGYAMN8MeNKFiS4t40qKZtFAoGSZN863fn+QnXvO9c+KniJ5SyqfLOXAgUDjEEVfA
         vierh1aTU/abnEbsHvyIMooyUV+hJw7a0Kc0HHRkzqiplmWderyoaLBD6pcA642R5Mqr
         LZAlSvE0LFxaoAAGyp+XO0dYY5gToNg9AamNMhCUSeGJmrAuCXx9KshP+b/Xfw8UDsLx
         ZProCu6XbxJV9VDjVyEwVN9msYwDtf+U3Xcrr6xCT8CRcq3ozgB7bo/Kpya0on0wnSsb
         2vFPMPE+y6T3LbV86ZtnmY05cvu+Oz3VmpLNEP5yoWjJVOEAOT0TsME2R56t/nGP0tff
         zZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793371385; x=1793976185;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KbultFdxARc0+R6qwvP8HKFaCeHvN/9tHGKKeMncdgM=;
        b=yEMV2x1ijDZvcZj0CB3jxf7DiLvVVaC+3i6X9N1d6D1m8Ct0DOeRn5cRYp1S1CgnZF
         sx4QKwMK8Lo/XTpepqPfC0Y4bhL7cz7L26DvQ5W+y8MAS7B8ZP4YcsoUAUh6/j8ZBNMS
         vsC7N6424TufTMrgrbyKsrtGZ3YhUBQrER+GZ57pk6uQxBsdEBY4CS2O5GZC66sV8svc
         A2Ji9KUAhgM0erX2PtqDp6ek3k9qNxZdTgXRWiy1m5kRwOlRS8hs5gclghvxixHotYCy
         S4miM2z1J5Hl59dS5p05Fi6fLohX7bInudRYelHG3D0NIWPjFa6X3ovwL1ybXJyG9l2a
         plAA==
X-Forwarded-Encrypted: i=1; AKwUvBxtA8U5rfe4qU0yTiFEDK0vl68DMqVkOZxv+WILx+CmT9xng0F5s6Q7Ocu5uP71hLpHElU5Wlievq28XeA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7yrBXp13FUTKa6+iDD9zdNYEsPNfCo8IWXVejdbdfwIsgWUdM
	FyGUmAiwpDgj19LeBYjh3Od3Cof6zHJZX2cSxPJb+fBSeasHUpiPKgrGYlF3T/0yskgmQR6kFhY
	EA7IbDMP4WTBmLsEPLNqDibf2XTeY5NjZsPAB/aG14scw8d1DRf7AQGcEG7kQ3MHt7eQ1NH0peA
	SnshPj4DkCuXGV6k0lhXZU2yIx32D3GqCL44s3rulrfQ==
X-Gm-Gg: AYBFou2IsUKe/Bz/MTrxyYzyPbXQsGuYJ+gB/StZanrr86N8X/iqdLQcakkj9WDVy2o
	uvFvbRzbD77LQMq5f6Q3n4U9Ta5zHChjeMC+bgRhi5cD5RiUPUM5Kfrc4SO2FIiSRwAwSHGQHB2
	Z9WNB9uMC0SIKrr11v4zOiqAIdBKTKCDHbsXuf2W/+twvqJVojna5HiPzbww==
X-Received: by 2002:a05:6871:3149:b0:4a7:4323:3fe1 with SMTP id 586e51a60fabf-4a9075f9d96mr1670313fac.20.1793371385032;
        Fri, 30 Oct 2026 07:43:05 -0700 (PDT)
X-Received: by 2002:a05:6871:3149:b0:4a7:4323:3fe1 with SMTP id
 586e51a60fabf-4a9075f9d96mr1670299fac.20.1793371384641; Fri, 30 Oct 2026
 07:43:04 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
 <20261029201730.151754-14-robin.clark@oss.qualcomm.com> <b1bf792c-8571-417d-9c98-f0b330a3abf9@oss.qualcomm.com>
In-Reply-To: <b1bf792c-8571-417d-9c98-f0b330a3abf9@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 07:42:53 -0700
X-Gm-Features: AclHuK99uM--i8GzOCl9TFxS2xsZbwdUt-6JFVQBI-5UrBBF9foFWcKCI-hrO7g
Message-ID: <CACSVV00dx2kijKkL6-=GzQX4pw+1pK0MA-hyveCscVdDKy7w0g@mail.gmail.com>
Subject: Re: [PATCH v3 13/16] drm/msm/a8xx: Add all CP_PROTECT_PIPE to pwrup reglist
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
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae4acf9 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=XFQ3HDCW75CJcarWahIA:9
 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-ORIG-GUID: T0m2F6vtYLGuYv4CWOjmg4j5MAr6PXuI
X-Proofpoint-GUID: T0m2F6vtYLGuYv4CWOjmg4j5MAr6PXuI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1OCBTYWx0ZWRfX+RtDbwSZtSsD
 hhbxMw9KEsRKfP78CjCmF6X7zgqydfEG6GtjNnzq1tZVbmAmLP1H/Gf9kTxM0+7bGPvmDt3v9h0
 oMhgoYfLOJWk6D728ROjNstD9wI6C1w//CGRgx70bU85G8zu72+TXwxbsDq+egh/vqJoUiBo1vb
 dtGNG73RDXttUru0HdHEZz6pvNmwYj/CAmHwmWqvwy0AxzD18vHBDjHb9b/dupLQsD+zwZYGdnu
 LelTBqiCN/cxRAJEy6MV2BtCovbilcu5wItOHD5c50lgBNNcZINsbWYYitfKc+sSlznjS63K2Yy
 UNZmTn6BNoHElO99nB37FehBP5Fv/RYxrI2asY9QphTgL7DGt8gOlH9vtBEd3Bh3v4/Q/aonFZh
 05DUJQXLewkk8VMvOAOqAv5Q3DA9NY68RjecRJ/GhA5iZyevAtLH1occj55Z3bB+n55Phmd63Dh
 VGtO5uq6gHtxLPp/4ew==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1OCBTYWx0ZWRfXwR4+AD0IAemD
 epBPuJTQJlqSq4v6tVeHYucMpfzTeXcgVUqOgiaabUtMnuQ3fgmRiStZSLIS4tk5PJ8oiQln7Jv
 zHDiU8GiNx5F+okwAt484ypW/JibSCI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300058

On Fri, Oct 30, 2026 at 6:46=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/29/26 9:16 PM, Rob Clark wrote:
> > We're going to start using more of the CP_PROTECT_PIPE regs.  Rather
> > than missing to restore one somewhere, just add them all to the pwrup
> > reglist.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
>
> I was kinda hoping we would iterate over them in the code instead
> anyway for this one

I think it is possible to generate these.. so the looping would be in py ;-=
)

It might be worth re-purposing the 'value' field in
adreno_reglist_pipe to be # of consecutive regs?  That would be a
straightforward way to compress the table on the generation side,
regardless of regs being an <array> or not.

For all the generated tables (esp. the snapshot tables) it would also
be nice to deduplicate identical tables.. either at generation time or
with the compiler.

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

thx

BR,
-R
