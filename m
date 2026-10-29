Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793291790;
	b=DHp6OAeFyA9MdcZHfOtkan2qc2CQ68RwrJLB7aarh6BH5y3NgwVqeFji5hsWCRZyP2Fe
	 UrwEO3kYcF1lCpBlmeD1n+rwmGa3+iyhZ9JkG17uHxxc+g3LcFe4v98LhEWIB8E08Ewlr
	 XsH9pENGI21kIN7JaEu3/GERG1tse5hJAOFFtdPMoUIvE+UaNERAwjXu9ANu5kWjLMg/m
	 xchV1naRUmlk2ndDcnQdJZt88Ln4Rq1xN2Gpeo6O8DmsViS9lvB1PBRGP7JSyUdD2UPwr
	 PaRdV7LJKf8SLY0F3ymsQD0sOaJ85v+vzcSjpyKriLMVSpxQQp7sJMptET4LfRnQRuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291790;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kJdI7lgw36TcxKveMl5fMT9rIbHK9w/ZYjtL1gqVF1M=;
	b=3VMq1vZVzkvk9PXNlV2L/cnuf6PLQYkSX/p1MWK38OD86u3NoTKI/5lVTeXxLj+jaY49
	 708QWZWj2Y1pCh8n5uJ5aXPo+NiEkyIuNVmX7ygGbcHpIoZ01GeA5YURo8o11JRaroJcT
	 DFFEcqza730OSTaMzDuFR99U8Z3DFRM5IyfwEwOQgDF4KF0oXHA6UuKa0CqJ+hmhp0Jsj
	 MfqoJmMD4hbLq3T4yDc6KsH60q6huziGKMcLZBwBQCmetdnXBwMdUGGwxcSgkcca9GVge
	 ZhwjDvqwD/8/px8uhHb7GCaMKRK16Sam9khHoDuE84N5zGuKtOLtBSIOM9sqyTE7HkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YJv5fObZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HvUS+66i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70771606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70771606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YJv5fObZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HvUS+66i
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDHbr542920
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kJdI7lgw36TcxKveMl5fMT9rIbHK9w/ZYjtL1gqVF1M=; b=YJv5fObZsxXrs5TJ
	JP2FiRwWcJLzY5Ooe1F/a4kjaCYdASWRjwzbJPuMGDfG0c3vlyjsFq19kXD+kuLC
	etB+pXh+AXmUftAnGybcVOC60/TpddSjI4OKAU0X1oxm9HQB855J/efC0ZxRMtd7
	myEoK8Tq1P+B/0m2ER1b4r/lGjnAtFCgQ0DcryuBM+TamOsCLb1fWHn4zjPIulti
	PsGlwVLHeLm3nxKNwK+zInI8/Zp5YM8NmeEDPgAR/T5xO8sGKo21OsJ2NUASzYED
	aZ6+/5RE/8lR14LSqSbAtnd2CopMflOF9YgLtPoxGT0xhECZ3Sxgfbb9b5cmiAy2
	XaOzlA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkxshtvrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:36:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-944101e6367so170617585a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:36:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793291784; cv=none;
        d=google.com; s=arc-20260327;
        b=FkLsP+jevM4MuxEHzy8DSKhXGzkl3Iz1IBzQu+zZKTdiJ5uT5YVjvUVIZbS9eGP4L5
         cVnLJnT0GCLN6bpFwY1qqyb/R0/GcrfYAZw3G997Edm77zh+U+h01fGZnIu4RQk6L4ec
         u4Xq4KBaQU9jSiTc55ZPUI+QD/2DZutAWWmlbkroI2mDcYipEfXPuVNielY7B7dI6oL3
         /ip/FYoUAYHxoHj67AbO1RgZbyvfY3gKM/h1eeJmpSe/9TSIj2cC9ep1MfhuKTOVVsls
         Tmb06x7si6pZ9nZOQe0AlYvHHeEoHK7RNE6SuItZvl3hMCZMxiI3p0JbHwzupDo2eOTe
         Fq+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kJdI7lgw36TcxKveMl5fMT9rIbHK9w/ZYjtL1gqVF1M=;
        fh=2ySZhcrMXipn1PZE4jCS32FRHPqeOF/PBR9+No+HzAg=;
        b=RbwmHgeqD48B6uPiaUfHAVr22GGUSJKlKxgtJHrnoMGeJQLg7n3n4nWh1NTSIkLDL6
         Hp4rbhi8GO8RC5p3mAFPd9bP8hkTTVYq6kjO6GvshXkLzEB9xBPWpUCMKaCDTjKs2Oyp
         mVupfyZcxNbnxsB7Zm0yXuMIOjfEVqc0tAg/NdOHQnKgOfnqtp/1ZIO8/P3IZEE4Iy30
         Ev/ryYlTiKzC5FeBi88vYPrXhv4VgjZqY1KdaBPI5d80YyGZrgNjf90/IdKucZmKQjsK
         xEBmu7yOFVuDaWl2iDyyCnE/+H5djWNFrX0sTRa+d0HtdAdoCXGeBjjWGCt5fX3YDYpQ
         CyMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793291784; x=1793896584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kJdI7lgw36TcxKveMl5fMT9rIbHK9w/ZYjtL1gqVF1M=;
        b=HvUS+66iBocUOf6Y1f4wvmfEKo4eVByzq1G05DReTOcnZ4PT0yBwqHvLyibsw9xHLB
         Fn88CxtZsBgUcz4xfaNXyukAjDjwTOIoUt76UWuhA6obvgK/0ODgMoSW4jMTvUoXV2wP
         dPUxnWOe8TjxP0Fh8RoTzITb/XkCUVe2FL25UqCichmKz+b2fvBX0PaWqyUYJ8vwj9vH
         FWo4aRrRLAa6s7IP4C6aCM1oQiyACPmk8R7v/zNzq5M0nMcYcBFcLdhB4+8Mi00R0SH9
         E+Jhqv/ygTdcTgfno0MPXRRoC28jRH3tA6TcyLQ7GhM+QZfJ5dy13rfW70BAqUiKwy4t
         0m4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793291784; x=1793896584;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJdI7lgw36TcxKveMl5fMT9rIbHK9w/ZYjtL1gqVF1M=;
        b=nAz34qiGrsMvbKHTYeRwuMCDZr9HHGfHN/KGT0ADg6AwWlp9COfs7GRIe+rdu6B0gP
         RmjrSaFEawL0dtJd+ASAaGptJKF/VsD28FJ348fTozf9Z7M7vZTeR8/ZOfouMVxmPyFg
         zi4OCaBYBIElhXAOgdRL+vKwul0MyybWbK07RuKkZs/w9YA15y7toZ9kv4IYxaOWKSDG
         SLHqtHpJDZWRvdG4rQF6fhUko3bMb1Il+Wd/RpiNW2r5T7Wv7MPl4kVj+4ycj4RSzAPd
         aihVOn0MSZ97eE9sUcCmkFLt3vp6WEu8N3F53pIBUFXVBDGqHNmJHyq9rP59KmwBaS18
         T0Rw==
X-Forwarded-Encrypted: i=1; AKwUvBwdu3uOOR6cGwyDre4L+ZTAm6uaNdJ+ihJM7U/5CivKVECz4ZRWECKuAO69l81yNhL77N5fxZO6OpdpuE8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL738IzElO3Nlf1Y/ZEmMK/MWV0GdMqeY4hO2e9mqMk0Ohiz28v
	0dtNW/mdJvoqYZhpyMIMHImwN0dcLDhwBs9lt/fLbWaglBiKZZMCmX9bHU3N8VBuvsNB0zfq3oC
	A2fSLgIjFQIOL/pXBXukBZiQzLFP8K0T2O7F1zxOxSQ9Ay+BTmH9uRpPD7ENVAo90YNkwFk9q81
	zx67Mj9fsPakTWwTPnIXel008UI9XkKNAEXht3BRTXG4D/Kc8XOcuT
X-Gm-Gg: AYBFou0wNeWMXkBhCNCejyBCETTMR3oPlvLOQT0bqze3SMApEcqUXVz8aeGiBp/7jUm
	kvSayB6mGYdSO2CRSzHcaFxVIgLt/fkp6FVBQDloPl36zAECU5RVleNownd0VwIWn8/VB1DWj+f
	rCMIF1f3bXeouzCDz3sUKyyvOvwdMA4sh8nNYUsHhmUTpNIwgX96ejw9zOW0bZwE7IO9/jo0nCm
	CrDwKMn+JbRO2u26bRwnboVqLfP9oaSNQ1jb3vC8/3fVaiAnmiPFbTvPqUxpUYwcnLosnkd91JO
X-Received: by 2002:a05:620a:410f:b0:93e:53db:d59e with SMTP id af79cd13be357-9441338b4cfmr451652885a.23.1793291783826;
        Thu, 29 Oct 2026 09:36:23 -0700 (PDT)
X-Received: by 2002:a05:620a:410f:b0:93e:53db:d59e with SMTP id
 af79cd13be357-9441338b4cfmr451650085a.23.1793291783401; Thu, 29 Oct 2026
 09:36:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
 <20261029-v4l2-frame-sync-v1-5-d37992559c58@kernel.org> <CAFEp6-2ykusk85REekU3mmFw=4g3yjB=doOi=i=1LS5JEe4T3g@mail.gmail.com>
 <CAFEp6-1Y=OyFHPnGER0GvGfTpc4o3_wTvXncvLWM81T9M-7+kA@mail.gmail.com>
 <1371d5b5-d347-4456-963e-8effb4a82f27@linaro.org> <ada94208-4a90-4e3a-9d9c-1ecc87b53d6a@oss.qualcomm.com>
In-Reply-To: <ada94208-4a90-4e3a-9d9c-1ecc87b53d6a@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 17:36:11 +0100
X-Gm-Features: AclHuK-WDQCkOQS8rm3sz4w-2NNyFvkqhd1R2IYzL8N9_O99RTw_p5nx2kiOD7I
Message-ID: <CAFEp6-0xQTOvTHJyYBK_iT+wz=yrHgufi68NJ5vgEn_PMZx5pg@mail.gmail.com>
Subject: Re: [PATCH 05/14] media: qcom: camss: csid-gen3: Enable RDI SOF driving
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Ahmh3_gHdWKOs4UhOuHnjIsYPQxAa_7F
X-Authority-Analysis: v=2.4 cv=H6BOUOYi c=1 sm=1 tr=0 ts=6ae37608 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=3Wac3Xa727c3rp011QQA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2NSBTYWx0ZWRfX3bE4IbElo1UR
 uIPa/4fststFP08oPDm3veEkeSb0X3nPWoWKferkGxchYlm5LzS/DDLOmsNC4UgOSdYs8UtlOkr
 ijPB6LanVmQrUjfL+Fn8Pzn1OxYOHCo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2NSBTYWx0ZWRfX201CVR2Bd6F8
 TowQFdt8fSuAyTCmLOXbpcSmY39w10PMaF6QMUYmsqbnG30YEfhiUtxZ0Aa/QBjELquhHl5y7yb
 9M1dCwz09LT3R1yL+pRPLGtuTE3eD1eTCbvf+P95xz/0y/RESCXHlv9fIIiY9/j8nagbUf2PQ+Q
 eyyiPrUk9PbmBfxB3LPN7cFrLgZ8R26umfCcT28lLRp4bjkiy++lHaQGwf9Y/QS1fnR8lC9GHnq
 l94U7S3GkFed8SSX9YZfQiePSX1/orIRwdeWR+bApSjmKF+o4irYW1ukoNm9/zieUEf/5fKUAyJ
 TTT0wBnGfTG1co+Bcy2KWyCrbnGAu4icznfgcseOy/L1PJLenyq8yhPB+PoHUODragfbyM+GOjz
 nl163eIXUW6cjsX/zeRXSRgL4ikbRQ==
X-Proofpoint-ORIG-GUID: Ahmh3_gHdWKOs4UhOuHnjIsYPQxAa_7F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290065

On Thu, Oct 29, 2026 at 5:25=E2=80=AFPM Gjorgji Rosikopulos (Consultant)
<gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>
>
>
> On 10/29/2026 5:49 PM, Bryan O'Donoghue wrote:
> > On 29/10/2026 15:46, Loic Poulain wrote:
> >>> Is this something that should also be tied to frame_sync_en?
> >>>
> >>> Also, just thinking out loud, are there cases where we'd want to
> >>> toggle this dynamically at runtime based on any V4L2 configuration or
> >>> pipeline path? For example, should it be enabled for the pixel path
> >>> but disabled for RDI?
> >> Obviously, if userspace subscribes to the related framesync event, we
> >> should enable it regardless.
> >
> > That's the behaviour already :)
> >
> > Again though we want SOF so that we can drive seqno which really
> > _should_ come from the CSID signal not from buf_done() *
>
> My opinion is if userspace does not need on SOF events, the buffer
> sequence may not be  important. However, for use cases that require
> bundling and matching frames from different outputs such as DOL,
> it makes sense to tag them with the same sequence number.
>
> Therefore, if this feature is enabled/disabled if userspace
> subscribes to the frame sync event, this behavior should be clearly
> documented.

Ok then probably better to have a consistent behavior and always
leverage the SOF for sequencing when available.

Regards,
Loic
