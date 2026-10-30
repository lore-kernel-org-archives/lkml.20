Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793373890;
	b=Ybs+ZH7pQPUeZIrzJi7q4w17WnfAPFR4fRTOBIot6fliZ4hk+GYZTyMW4EKoPCx1upqt
	 c886SVcE+EhgwvS06zCAao8Vv2CPEyOkf2HcR0UsOdZ1C1h+biK+dx+ur3Up6xTS7MGKS
	 J2iRM25supGzcCn6MiTN3KVbI4rUh3mrJkjc5iOEEWKcnn7+xBBoOvnRf4+KCL72vqYle
	 ChlHek3LWZeXgSCUxx2wEwiobafVvfNCVx3WRVFGBT/8tocKMYO3oGFE3mMQuvFkToK5e
	 G8Ot80vhn9lGcW5yNLt0ip+TgXP9ao0wPfD+tK6gXGKFQNFmi9Oj12o5P3KJ0rlBIdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373890;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=K3VqXyfdn7aZvC6p6W5C0H6nzI/A5JqmWJ506i3piMI=;
	b=ntQ3s4RGTdXpyWTiwyq5djQUsaFZjjGLKorFu4MEDFwFq1TsSxl0WbmCHKSUhO3kHT3F
	 ZAxKOMeuLsaqy8mBM7L4y4FUZ/2lWPtAb5uP9voW0TglPXS6jDOyHoinVEObrMR/gnIRK
	 8yMEZJ8cNWVuwG+RHq6udmETOm6wb5WW0yhUKeYmrE+7NHG/WTC9ncvR7u7FuSb+i6+iD
	 oEmfDHhe4auxCrD0VNeVPl9zPeHfwnNQXeBGO8lllQZW60LFn1urai0rtE+WxpwY/1XHH
	 ZCCp0gbr8rrfr/tkW/ilP0wgs4UKJ9NNT0jWwQWT0Tn8G6/BYa8MyhDRwZ0I3zv8pCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ngBIoon7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fbiCJQml;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE3B606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DE3B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ngBIoon7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fbiCJQml
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERmIf1953678
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=K3VqXyfdn7aZvC6p6W5C0H6nzI/A5JqmWJ506i3piMI=; b=ng
	BIoon7753itXocLi6kpSZ76gyoIht8FUgc6dDKyKExdonJVl8vQ1NXmSk/QSAB5S
	DN22e5chBcSmc1FKASMIT/DJyPNq1RNPL/K5E/FQ0NKIXx1yg4m+7wVjegl4bYAn
	Aoy1TmQOR1DQqcJxQnghj+lWVFgChBbdv0xpdaMWB0TFkWxJo/P+tbHfNxTtScBR
	RjbwlvH3Pj1bu5XOxYEt0WhrACo25jzVjW/+lOaV6BFraUZZnBVM851C/CmTv9fW
	eqLS7l1Z+wQxKiAAbuiiu5VLl/sMGcG1C7Hgh2dn/p8yMkW9XT3Lcunhk2U+rJji
	h7OjaF0A2hDjorWO8CSQ==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pkrav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:24:49 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-49e5451d6a5so860556fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:24:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793373888; cv=none;
        d=google.com; s=arc-20260327;
        b=B1TD3qVuoNshngnPKho10RncHNEhlxqAmjw+/bpStjUmr3Bpc9GYN0rd+OSamNavW0
         IIbX8K+hylkWUOSs7ZpoJyX/ip7GWQ8z6fNSWrVtbLhQqvgqmDFEZbS5qv6e1WUYhqIT
         GpSTr/1nfhPkj+0lQzYxcf0er+w4pfCZYJaEgF8o35UndQzl+rPzURqJuTmj0qU8H/fA
         K7ONsw/eU6bHEvlAf2z62Hw8og2pevhkQv0lAZHcRPeNSZPD5N5enK5xKuPiwRZv8P7I
         LuzbVq50bdiAl4SmQqGjk5IwO5432uo0Kz6MmOZfbHKStWMFicd9lq0JZXQHWN1nkGmo
         qukQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=K3VqXyfdn7aZvC6p6W5C0H6nzI/A5JqmWJ506i3piMI=;
        fh=ZgoMjNllkd7ooXYSEmXnDUu9j43Z32FMdP6nec8INJk=;
        b=QyE952ZUkZKYAMvqQaC+riLxS3P3SW7buaAFKlb25Q15rF21f2glBj+13eTIoGqeSs
         6iUK3eb2RJEeL3tlTawR85otzPRRTFvLUdu8kAr27Jo8Uo7BqZWuAeH+ryPaLPp+KKnK
         qRZ8RMxWGaLBEONs+nUWxNlzD5Lv/91uGyCKf9Rm+euTE7htdySTK4/Tv8v+K6mALUIo
         qBmBLuX3dT3p5BW5Rs1wvaxwtCT4gh+dXNIXb0KmtK5eGC3ZNBMJDlVzsgSmm1mKfwpW
         fuNSFMEk9UTDkEkt2aX6LR+JOyp/F/8I5a7wAyl/IjWKt+vZUOIMLJ1qKOM/NXMhN00y
         Qsig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793373888; x=1793978688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K3VqXyfdn7aZvC6p6W5C0H6nzI/A5JqmWJ506i3piMI=;
        b=fbiCJQml8OcFatJ8U3vJvG2YbC8IhdjqmhNsuYiCCJAidPdpnQpp8n6bM8W9yUB3ki
         fq1Jw/yW8OsPz6+Luh4l9Cx+n3T4i6TiR07fzN7Uq/R0jU37FrttJW76Awr9qkHdO+yJ
         kSiYls/sCKgcjIfXku8FHHTFurod9fIK5ZMIdQZcHlkTF9HrtnK0WPgROIAFUmlLSeNM
         G7IHxUwbyXRPI4QcMc1tUUUZOtWBEnBgT9aaAY1SkhYAQCc0hhqJVHGoZVNd3Rxzf5kZ
         D8Sz0kUb8N+4/V4s3bxLtrwy3FJot7nvjfRsP/fvg9XFBXPKVBHni0YFk1RuiAFOV7Q5
         ZwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373888; x=1793978688;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K3VqXyfdn7aZvC6p6W5C0H6nzI/A5JqmWJ506i3piMI=;
        b=hxvUCx2iON/s75vaEZFIm8fsVW25nqLxkt38PuvAIkX0/mrFx9FcIvUl+vEPzru/pJ
         aAY2y8QX7KTS26xnr6Xr3D8QbhHN/Usp9o1U/zZwSyI0jwZyMbre4p/9BH6xpts/ceHd
         t5Nz/3jobMTHsVMkrmnIcF+8feGNiRVxfBGA8mOZT/nh9jy1/CURhSKL8B+y6jaD+kfV
         D9COAijMCB+LDRFxcpVCMF51/+fG8okEuSfUIF24uD/Mpt4jVXiele/Ix8yN0xtE/Qa7
         MUBmYtSfBHG0kLH9IWu240ExiCzsR31YKzajYoiVb+CJvheR+3kKUKEz43NWqXoQF//x
         1I6A==
X-Forwarded-Encrypted: i=1; AKwUvBzlsGj8BRyfxb6kwU0222WpZbJLGhHA30K2XkBtfelXr8JGvpLHdijxnGnhZ+Mp4S+gr1/QLe0TitGX1oo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuumIjA9zaNhWzQ0KIlQrUNCk1ZSilZnfT+iYZ8h6atFm7OH1M
	7w4tfbd6JKQKOUQl3BGKgeC1EdnhV7S+BKysQeC7bP/Mgc4hr9xpm/6h3Al/Y9yS8NiaJQfbmKl
	1RqgQTp/MUBjEAq2f42JfWfp4fGjdKgYyj/6paRWp3EG2LbzXZyuqyUmJwggN4VbUmaf9wp9fjW
	OhbsMNSfgGfT1089kDcgfnKUWJUQIXD8qDiz9MZ4H9Cg==
X-Gm-Gg: AYBFou0Ms6+Cpg0P/Uv1SbYCsRjpR88qsMW2ThOJTJV26C2sWCe+6AP8GGzgITs9tvt
	71BUyOPLnCW1f1dN/sXDEerKjXxFOamiPK5EqJuRVN3HB7UFTrOvVhQCA15MkSqnV4Ot0hTkOsO
	dyESX/Ae5Rkoa6b4dm2s9a8xGJo7231fL7/envZbA0xqPAV+QwNbfn78LZWg==
X-Received: by 2002:a05:6870:142b:b0:493:186e:b51 with SMTP id 586e51a60fabf-4a90765f95bmr1797626fac.20.1793373888509;
        Fri, 30 Oct 2026 08:24:48 -0700 (PDT)
X-Received: by 2002:a05:6870:142b:b0:493:186e:b51 with SMTP id
 586e51a60fabf-4a90765f95bmr1797609fac.20.1793373888097; Fri, 30 Oct 2026
 08:24:48 -0700 (PDT)
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
 <20261029201730.151754-13-robin.clark@oss.qualcomm.com> <72mcRc_XaEFYOXsQm5r3_QWSIcGfu2OOwWlCRp086BzS5v9e19_2L3wttKhZOHho-XlIv1lZODbEYPFwnSVWDEQXgilHOfqgP5U0t2xsNcA=@pm.me>
In-Reply-To: <72mcRc_XaEFYOXsQm5r3_QWSIcGfu2OOwWlCRp086BzS5v9e19_2L3wttKhZOHho-XlIv1lZODbEYPFwnSVWDEQXgilHOfqgP5U0t2xsNcA=@pm.me>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 08:24:36 -0700
X-Gm-Features: AclHuK8BnLlPd54aThROE7CjiGNynTqPFp3Ou8wSOh8Og2sGLyha8Oc-svz3-gQ
Message-ID: <CACSVV00SZWNNrY12Zw8NKUksvEagDFEw1S0jJxLNVvc7kGVfZg@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] drm/msm/a8xx: devcoredump state capture support
To: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfX9qs3ZNpxs2wk
 9SOVxkXLucnr8pvOCz9aWb2hAnAAnyKODfN2GxnAmReI1INTO2zu5UjxJOq5nR6LlXP8CeGELz8
 iituTadS8P86CcT3xX8jynHx5721frZPaj9yZmn2Gub3I8ZW7OciSfXfk1nyGssgV3M7EDCLZGQ
 2oyTNGZLrWCLkiF4wM9RllKMmoSRgM0j414q/z3nj/q/uLDGPNJH357ssd3d5k8Q5tJ5szI5Rwo
 K4m2JJaQq4At17yz4sSYJDj7X2RCRimIF2On9a3DN0h1+pvqn/TP4cFRmm9zgNVnpuw6opV6v5H
 pKjLBGKxKp8qPud4XKuqSJgbv9MoK2PsntX9cZIhSkQcGt4ZEjnvcaHfc5cnwKTJZ07/Jh9YD4p
 K2j4YuyfXBUJY5EnhaFkOxaija7LLB5BkZLW0/Tv6tFpE6V6pzCHFHXM8nMfjwFrzCeA+e0atcb
 7ZZD7gm7KZEP3GPA6rg==
X-Proofpoint-ORIG-GUID: alXFPJm0F3BcXzzXZkFhhq_3k9hzR8Xh
X-Proofpoint-GUID: alXFPJm0F3BcXzzXZkFhhq_3k9hzR8Xh
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae4b6c1 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=hxNMMXO8-ik_v7z4v3UA:9
 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfXwSTTZBIgSstL
 VYqZirh04OMJ32vEbIZYmKHmgtxT/VfzqxE8TS2C1is9CITmdFipq+JcmDX4Nn1VZ4dKkGJZiDQ
 P6iLplddntmClgQBsKvJAMfaPZAMqTI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300061

On Thu, Oct 29, 2026 at 2:20=E2=80=AFPM Alexander Koskovich <akoskovich@pm.=
me> wrote:
>
> On Thursday, October 29th, 2026 at 4:20 PM, Rob Clark <robin.clark@oss.qu=
alcomm.com> wrote:
>
> > +static struct adreno_snapshot_sect
> > +__snapshot_sect_init(struct adreno_gpu_state *state, uint16_t id, size=
_t extra_sz,
> > +                  void *sect_hdr, size_t sect_hdr_sz, const char *func=
, int line)
> > +{
> > +     /* A few section types have no section header: */
> > +     switch (id) {
> > +     case ADRENO_SNAPSHOT_SECTION_REGS_V2:
> > +             sect_hdr_sz =3D 0;
> > +     default:
> > +             break;
> > +     }
>
> Heads up that I'm seeing this warning when building with clang:
>
> In file included from ../drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c:9:
> ../drivers/gpu/drm/msm/adreno/adreno_snapshot.h:398:2: warning: unannotat=
ed fall-through between switch labels [-Wimplicit-fallthrough]
>   398 |         default:
>       |         ^
> ../drivers/gpu/drm/msm/adreno/adreno_snapshot.h:398:2: note: insert 'brea=
k;' to avoid fall-through
>   398 |         default:
>       |         ^
>       |         break;

thx, fixed.. not sure why gcc didn't complain

BR,
-R
