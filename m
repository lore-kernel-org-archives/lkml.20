Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653568;
	b=5dD1FVVY5HyppgfL53a7OsPbp/UQtaOsd6G9Tsr3FkomJ2SyVrR5wr3Yw1GmvkcDfY0U
	 gbCEh4v0tWOVv/WrC45Fx6mQOzdAsaIulxcWjCEX8aF90QWWdZLX34mvZ7fiFN66SNFtz
	 e7itrlIdyDJpxEOXQQyFV6SldbXJrBCqAClYpNAZMuVemZYci7HwnfOgeLNJAKCp60w2m
	 RMpKvJYus8krUjrDJoZUPlY3JVk24/JyKdWNWjQxDz6MIQXEgnCjZjsHqHLhpV1QB6sMn
	 0QPmqSHiiW+Gi7Gie5yQprA0osKK+xTzxU8yNVChTpILXaMLHfxgjPutEZSnWaqQH2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653568;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Nf3jSk7w1j+okvpezp41LPgG6BghIMDC87ldAfN1ggo=;
	b=WEmg7DC1/6f3D7VQEtWACvXUcxtk4AQUErSCjOg4GN1HbMzQ0CmQ1ttAynJOxZnIY/P0
	 Ic3bIDDHC9tAYR8ck6P6k2JAMKVFNLCRXuJ5XlR/0+VBTKGCcWUVniUaRtxyomfxR3OCk
	 5W+FauMKQT6VQzoskgHdOW63MIOPx0Yf/lOhwoM3eHbi2fm3ZbHofNXU96aH1YmcJCEv8
	 NsGrIyko08np+KkYIAcjrA5XEJ1raSBn2YlNbM9HsgCapEmpIBh1hqkKKPHFMOGO+HNkC
	 ghYnkEC2jr9B+SccRSG6jkWy8NRXvlm01eXI893NPK/OE6J94d9kY1UcRucDwxPbf+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m32+gmS1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HFmts7vs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A043F606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A043F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m32+gmS1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HFmts7vs
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M701EV2714176
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nf3jSk7w1j+okvpezp41LPgG6BghIMDC87ldAfN1ggo=; b=m32+gmS1Ymgq9JAz
	909NtzQRlLitABxi+BEbDuyTVdl0Tfme/4QwK7FCvNftCP5Ro+9ZqYZoH5KdhcXe
	2l0fewiOP9qDBRoBHxPQD9+yeoahvjMqNb0gZghc3DC/t7RxBSwEYemaMi0KmsxP
	JKuZiMMl2L8o1VlUE9MaQ7nw/HEpUf9FKwnyKPx7lJc8ObyytvsYG/uWQAaYckhY
	HVVi2rYzJ7hbE3C0ZnliDhzGigHl+qsz7YtfrIw3gJb4skPLHpv1n1dLakzb90e4
	oIOqlnzo11KIZrSj1XGscGwf0RtpkIUiUJvIeQgVY4a4lWwpi+ggExICml39zqpI
	bLKhZQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bs69u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:19:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53568f05f8bso4192101cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792653566; x=1793258366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nf3jSk7w1j+okvpezp41LPgG6BghIMDC87ldAfN1ggo=;
        b=HFmts7vsImyCOEdAlE39KgvF+SV7PEbRoMJ+yTcnycpUz2J1Pv7sePCw3AyCZCrERy
         nbab86v8bW5n56GzG7QjCJ4W/0cKk2fEFvz2sC1PV+SYAnzToXGXwaMq7yUGIuSnhI+T
         dUXomsHIlGKFJYWnibqmOJEZcTDT70VcJUkRM4kWgxSAG3M9XG47+2X1538BufOCPnaF
         Iyc1FcVe07Atq0w8FYwzUn/K6h7888fKohoNewKkLWcmni8gmSihl1Ig3yNWvd355dYV
         VGvmfU/BrZnZY+E2AbKiU6cOnLNomnrfTNDmFJ8nOo/ue5oI+RtZA0YTf8RisZrKqpBS
         Td1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792653566; x=1793258366;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nf3jSk7w1j+okvpezp41LPgG6BghIMDC87ldAfN1ggo=;
        b=SUBz1BBXfA8VKIHMuB/48FX3J4vc132tojRlBClPL5EtpG6t9VJ0NMDN5CXR3EzXkn
         q5mLs7qEhISE0id0GJ2B3d9bSk2N75gchj5eh8GaL6s0oni0wfYWKD2CRqZhscoU49xT
         R0989372NRYWCO6PDNr630Bgbv7Zm6RbnRipfOIPdCRRs0smCXZonBbl4mu07PLqpvSz
         5Muqqb7yC879Xdebv9E+jfEHYOHCL+XgXvDQxK0z6IngBYp19v++7cgez49K4NBYw5ap
         19GEzmK3gXRTqA2nENC+qq//jC7+N4znfjBUwEnWzAqqjOtfx0mrB2PT4/LE5istOyNk
         H39g==
X-Forwarded-Encrypted: i=1; AKwUvBxMMes9i/9V1f/L/cwG4rZRGh4YBWbYcpid1GJ92Xd1fdEy+cnKOktph0b3vzuHQRZqy5dXPsA8PZ+muIo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVn3E3RzTgGD9OThqstTMVjh6dYzJH7Sm/SXVB9HPlRLBCJOtg
	++RapGJjcTpoobHfjIHRximQ5gJGX1P0hW4igiZ5pXE3jI7JAtmUlJlKbBn7x65TbA7rIOlqOtr
	jCEeHT14zuEZi3nWBhkdGsVuE1Qb8ZLAjEhsbUphEXOKaYHE3rNCQn0JUec6hGtEt8uY=
X-Gm-Gg: AYBFou1o7DEE5s4POydpG0kFORX98OKDWgGcdvxTiK1/KsU6g2VyB0/C837IKXyC3JM
	Yapv51w9L++dXh8ztUuacNk3BErdHmCETlQtI5s1NjEutP6sYtWgiB5OEdpuJNTY0RKU/qVrbIf
	eSCgujseTe8lCwGF0+doRefd7B/ZVuOiM7lOGrQlXhYpsB2z8xHmuyIXsKMqLvdDC+ganjzzV+7
	0HkstGlHREPpMx5kh7M1wv+347zDmG6QwOW9iKgulqGVsaRfT9mm6xF5hRlD95Uc4sVAerf744x
	GmiFFc2CFF23E7xW/BuxVkOrTvQYyAwI9YPxBbejU4nrslTnYENrbpGwb+kS+wpTpajwJVq5ZNj
	EVBk7oyK8ywMm7l97ZXZJcw==
X-Received: by 2002:ac8:5d15:0:b0:535:496:56ab with SMTP id d75a77b69052e-5369b1c0348mr85871741cf.0.1792653565633;
        Thu, 22 Oct 2026 00:19:25 -0700 (PDT)
X-Received: by 2002:ac8:5d15:0:b0:535:496:56ab with SMTP id d75a77b69052e-5369b1c0348mr85871531cf.0.1792653565233;
        Thu, 22 Oct 2026 00:19:25 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a59b91asm76726866b.52.2026.10.22.00.19.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:19:24 -0700 (PDT)
Message-ID: <aa6dda5b-419f-425f-a9b5-198a9bf7eac2@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 09:19:21 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/14] drm/msm/a8xx: Add missing a850 ifpc reglist
 entries
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
 <20261021204244.67160-6-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021204244.67160-6-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CcuPfrD-UAl2DAhIsoGxIa6NTufov-wE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAyOCBTYWx0ZWRfX5mlACfCu/Edx
 u4e3XxuePkm6OenQCeWyFsg8qE8nnN6JJ8uFEbK6phHOij1wWHQs7Sf7UwInySgXOI8quZDoB6P
 KrpY0UFI6mOXkYeEcy0/fykxHJ6XpySRHHJQ/Gc8Wg35hLdue3e0eV6kYb7pMkL1pejRkwKnlaM
 Bnjv0FwBQzFzGc3dXOxCZfOUuAubbDrgpnGmcRHnYfetpVcMqh+xxK/Z6GuMRjPwYb+/cGxl6pU
 wH6VsmPPD26mdqlNnEJp75H/ZRu1wYP/ygsDR3D3ReR93SwhZOsdxQDMS2dZ77oEaaedQymbCYt
 502or4ksCVudp7xw6ZnMDgRWOUqWsso6jCjEmhHJyMLMYiKu3EoD0x5bnn78QP8hZPY8n3//czu
 YOZYskXHNTn8FRNhPcQz0tfeJDWbo9ILrQIQakXAss6NY2aaF6WpVPg8PXY1LJ4e7R4ARyRjPhA
 dDShzbDmBWOOZNwGhjQ==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ad9b8fe cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ZG9rikoeVC3lgFHVExcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAyOCBTYWx0ZWRfX05AWdOPydCkQ
 GrconPKpN7IrZqU2xQYpVliMePZ7qXnfqUJH8Wc2b+D89J4WT5V0L/TON8B/sAWWMRDSVcNUd/3
 TWDvfGbFe9LDNdPOLPMNRrLtNIrLVo0=
X-Proofpoint-ORIG-GUID: CcuPfrD-UAl2DAhIsoGxIa6NTufov-wE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220028

On 10/21/26 10:41 PM, Rob Clark wrote:
> We want to save/restore all of the CP_PROTECT regs across IFPC.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---


>  drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> index 55a805ab438c..45cd986ad4b5 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> @@ -1477,6 +1477,13 @@ static const u32 a850_ifpc_reglist_regs[] = {
>  	REG_A8XX_CP_PROTECT_GLOBAL(53),
>  	REG_A8XX_CP_PROTECT_GLOBAL(54),
>  	REG_A8XX_CP_PROTECT_GLOBAL(55),
> +	REG_A8XX_CP_PROTECT_GLOBAL(56),
> +	REG_A8XX_CP_PROTECT_GLOBAL(57),
> +	REG_A8XX_CP_PROTECT_GLOBAL(58),
> +	REG_A8XX_CP_PROTECT_GLOBAL(59),
> +	REG_A8XX_CP_PROTECT_GLOBAL(60),
> +	REG_A8XX_CP_PROTECT_GLOBAL(61),
> +	REG_A8XX_CP_PROTECT_GLOBAL(62),
>  	REG_A8XX_CP_PROTECT_GLOBAL(63),

Sounds like we should autogen this part of the list?

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
