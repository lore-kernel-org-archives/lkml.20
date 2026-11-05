Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901610;
	b=IkeW0lv7/wNHw2EakQIY0rDB/HNmbx6Wr5vaB4G5bUBMay6FyXggnF9WxH5/jVihZXk4
	 W+YN1mHhEoah90Bq7RBQYfUHHvAV6gu731HYctJC+rYIHYU7/RfTRamy6GiJRcQwb02zC
	 kw5QlElhD+n3G1f8U/3Z+ekj39VgMwo2AG45ywa3kLxD2iDv+RRhB4RxvKN7/VoKXRhdq
	 VlWYomC+dzy8ASzv5GF4c0mCpVrTBGVWaNYFsoJ+FMyw6ymUzBXawZfZX6LAip2Mqcftv
	 7DQ9G/YcbsxZmKUyS4OlwOREi/SA6DIXTPYCfh5qtt7fB0sBr5LQlB7gbFtC9nS9JHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901610;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hcIGtKJGIA7HEdXy4JiUyk2jk93QxytfweWjrnaJdwM=;
	b=gRF0aNj95T5WgvUGadSNpFxFgFwEg2+gjRbVY/C2fD7PyvOG2u5oAlaAPwCqNQ1pvSSb
	 RbdA4SaOitRXPJKHeKaF/4D3Od2ZkIFJplQhoElBgZs1GDWLhOFSRmtAAMVA7SV9xBfgu
	 KkA3l8JV0oCOeoK5RCn2n2NPh/4BRGdVU9aLpczTBPJQk5BT2QoLwmciWOECzzBbW6a0Z
	 UjNmqDUtEeg2o69HHSmNZv28SXM6ZtHYTW7AmdrEKJEFfGQNRs2l5mF7OZsnPSAoW14YL
	 rOrCcBQJ0xvtCDw9KN4LP+a9RCcC0ea9kE1swtqRbOIo68JgL9lB1Nio3lEpcWvsCAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l14XjqE4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ay1ovo8x;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB06606A33A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EB06606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l14XjqE4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ay1ovo8x
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeNA01485140
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 17:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hcIGtKJGIA7HEdXy4JiUyk2jk93QxytfweWjrnaJdwM=; b=l14XjqE4iAeaylTw
	udgrt5Fz/NBNSZujhmgBHfQbVeUdVAnfcdzy+5JxCYMrm8RwQiUY4dvtYrvyPFNE
	O+7HSqjZCGjLWJz0keLVrobm+Pig1cRLkWSZ494lXWuJ26XaPzR12dIdmaI3P3Qz
	/Sfuqnc2UoIs8f0s8NRrDvr7t6BEWqaLstla7bVvVVohMCxMa9bmEDKZbqSQTO6u
	Rk67HNB+/VS7G7eobiJHoZAEg32daNlxHV2zNnBOZRXrspsOLFr9ooaBn1snM9DV
	Lw/gFGIkrAB91na7p6PrgBoyMjY3yXD5RzOgm+aSxmZscf1phwp8jjMG6Yd1O9uc
	IEnxxg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrpaajfwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 17:59:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3662e7a9299so928101eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793901595; x=1794506395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hcIGtKJGIA7HEdXy4JiUyk2jk93QxytfweWjrnaJdwM=;
        b=Ay1ovo8xKUgAm19fvObEyGvk615xuQ9WBwizOd6Bv+ikTDEEbI8AaTVsIlH59W8/Gw
         DiI5opGZCBqcuDh+VTKUrbAgbB4EXpTJiK/YCa+t61rLvDxLVb63JlnNUz3lr/3z0gVv
         oMYiLJvxRHiosyPJPdgaSl2GhTiHwHHPSvnx/olKCspBwL5vrXV/UKlST0ydHIkBXYEp
         c8PX22SFPDhNGNMTQZGrIeaTGW7KrGmoueDUCIsEtSM05gEEbUHYPGWcSaPKieHJsgIt
         5epzut1SbizLJPdAffJHXu7g7eWFrtCdb7geBHuvffimvfQLDy3CV3oife+S3s1b2LYh
         2gIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793901595; x=1794506395;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hcIGtKJGIA7HEdXy4JiUyk2jk93QxytfweWjrnaJdwM=;
        b=njb5UBfxMl26HKDCfUHwNwdR9UkCUVqZRbCtdYDMF5VD4AnTrAXtZwYC/2lq9AYiiu
         D2vaQ/Y7+jfSIcfcTAa/m9tGnA2yojz+2sem6/rlK7kqh9lrzHy148tTdfh8jffwnnRS
         L9KEE+SV3aGSmpM70NyR0B8PtP0nYkni+YDzwwODskG87mLMELxGB1+Ad4GUwrtCgFry
         ZXejKHIbYIC4lnetIYJmAQc8r52x25B6x0nXWLnJ7CZI3eqK24n2Qd/mEG0QWNtgyaBu
         DQdaQ6istGDauJmzHltBOSizTtZGyc/e4l2e2vIspMLtZ7DQEM3GmA/LCNCI61UEyQaa
         cQuA==
X-Forwarded-Encrypted: i=1; AKwUvBwVn/PFK4CVMdAWQkQ9WgSuODfzKjltumrqgEdKdcMn5jyb+3H1HAzi4wcDdRUA1B2SelBbdGr/HM1m1MA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2+9O2jBBPktmcubF723YZwkBe/fbw5zppAe9mqMpEYUHVOaNI
	aVNay72AfmU7GaJceN8KkErUCpKcF9UacE/xB0mhnX+4tc4Ja9HeGg2Fwelq3mg9bi3MBoUDiyF
	Mm1TyZFeI8zaV9Eg9foIw8xREVm6nGVJfp9f5qcI8+37nU3K6OtPMzjRIX19Ncnd/Vvc=
X-Gm-Gg: AYBFou0tk4Y9xD3vYmKHnH65kpEh1BKptxX5AE+6WnminbnF2t9MJbRQHytaorlc2gK
	DLktNP+/kZLfLWO5Q15e3R/O8BI42iBfZjNaWpaRglB0P2jGrNtyWhlIuZbNHo7GctjEMa+xVpR
	p6sonO9Ydllh/QUuRy3ufveeComkIer8HaX+Dpgd7VlG8lSRJ8IbBoXzVrZE7sa0hNvGDbs/RTV
	bk0MX8Y34X5yjhL2Z7uUYRP5TqGEQQXG2iKSgRbjcAxaSN4yhPu6jU2keXFKMaIh0lacoP76sFd
	l0w4WNvq9MmCbwg8Hvqm8EFv+9Bxzq3zEyMzkJtGT/qEB2zdiOu41Ds60Mapj21W4M64wWyKbHQ
	FFRfRttCy/Qe3kUiTu82B3yATJAlTUr3R7PZCBlso8wEZabpDfI160DwHJlMW7n0LgjIPUC28mL
	MyBsht04vPreseIiqgu1geENYlpA==
X-Received: by 2002:a05:7301:619b:10b0:36a:1d6f:917c with SMTP id 5a478bee46e88-36a423c3380mr31476051eec.22.1793901595366;
        Thu, 05 Nov 2026 09:59:55 -0800 (PST)
X-Received: by 2002:a05:7301:619b:10b0:36a:1d6f:917c with SMTP id 5a478bee46e88-36a423c3380mr31476004eec.22.1793901594753;
        Thu, 05 Nov 2026 09:59:54 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38fa273sm21151517eec.16.2026.11.05.09.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:59:54 -0800 (PST)
Date: Thu, 5 Nov 2026 09:59:48 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Borislav Petkov <bp@alien8.de>
Cc: "Santino Wang (=?utf-8?Q?=E7=8E=8B=E4=BF=8A=E5=82=91?=)"
 <Santino.Wang@mediatek.com>,
        "linux-edac@vger.kernel.org"
 <linux-edac@vger.kernel.org>,
        "Sidney Chang (=?utf-8?Q?=E5=BC=B5=E5=B1=A5?=
 =?utf-8?Q?=E5=B9=B3?=)" <Sidney.Chang@mediatek.com>,
        AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>,
        "Fred-WY Chen (
 =?utf-8?Q?=E9=99=B3=E5=A8=81=E5=AE=87?=)" <Fred-WY.Chen@mediatek.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Light Chen
 (=?utf-8?Q?=E9=99=B3=E6=98=B1=E5=85=89?=)" <Light.Chen@mediatek.com>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "tony.luck@intel.com"
 <tony.luck@intel.com>,
        "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
        "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        Arnab
 Layek <Arnab.Layek@mediatek.com>
Subject: Re: [RFC PATCH 00/11] soc: mediatek: add a DRAM ECC error handling
 driver
Message-ID: <20261105095948.000013c0@oss.qualcomm.com>
In-Reply-To: <20261105045321.GAauwLwdk2PSruRAcw@fat_crate.local>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
	<20261102123642.000044cf@oss.qualcomm.com>
	<20261102124434.00007741@oss.qualcomm.com>
	<78ce4a6ef441cb9836466e9ae5e72ffe21a88242.camel@mediatek.com>
	<20261105045321.GAauwLwdk2PSruRAcw@fat_crate.local>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3MSBTYWx0ZWRfX/j4meadgaz8a
 QMGghCheol3zY6owgIxAvqhHW2U4FHaleGdMhgoVv9eh65uk9nV4HzgT7vbMDMAgcOu1giAf5eX
 gtVnoWRgSMYKbaECcJBrKgctRrQrRYpOc01MwflaErQ6q8/1R33dUEi3iMe4jYfG6BskGjm5Gru
 QbJIND0KL4tLFEcr7rqwb2seycuUiQfFSUV2+ArBYO8LAgmikcnbLdgA/pyA2raSbLjQo6O3AiO
 n81LzjVljuW4c54xoprqzpjLn9M2wecj2i1eF/q+HB6bDFI+IBD+BdeS7NasSYkdZoLN9DcAZSn
 tLTwhw7i2wL37dggdrHQz2Xbc29pQx3RkIj1gAPrXVHYU33h/ZVI6l7g9QITbwmUKEXUiYQeRrS
 cCY2hrFP4/2yvAgGwVufKaRyC01YWoVhqA7xtzrkM28cl/wjiBzqB4Z5nvqTtHprPPLq/UZ1wNq
 qu5PkAt92MsySn/T7Tg==
X-Proofpoint-GUID: jYoWVWzSVdZhRFRr54KuSLTjt7nOlcRy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3MSBTYWx0ZWRfXzxuap76oWRoZ
 anQAoxXGPzBTKfLBTal5KdQctZQSTiQ3ZlLge2Hv/4gd8Zqke6i/WISGJTWJ/3xv01h1Ql5bgJV
 6D4Fp/s+G31yg8SRvchJ/RJ2MORqHIQ=
X-Proofpoint-ORIG-GUID: jYoWVWzSVdZhRFRr54KuSLTjt7nOlcRy
X-Authority-Analysis: v=2.4 cv=WOXqzXsR c=1 sm=1 tr=0 ts=6aecc41c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=xlvtQj9HLH9P9y80AtsA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050071

On Wed, 4 Nov 2026 20:53:21 -0800
Borislav Petkov <bp@alien8.de> wrote:

> On Thu, Nov 05, 2026 at 04:19:27AM +0000, Santino Wang (=E7=8E=8B=E4=BF=
=8A=E5=82=91) wrote:
> > Which existing interfaces would you recommend for obtaining retirement
> > status from each memory owner? With that information available, can ite=
ms
> > 5=E2=80=937 be maintained in userspace, or would they require support f=
rom an MTK
> > driver? =20
>=20
> mm/memory-failure.c
>=20
> Look how the others use it.
>=20
> What you write above sounds like you need an EDAC driver which collects a=
nd
> reports errors. Look at examples in drivers/edac/ and there's some
> documentation in Documentation/edac/. Perhaps ask AI too.
>=20
> If the stuff you need is not there, you can extend the existing interface=
s by
> justifying the extensions properly.
>=20
> But what you have - a completely separate RAS implementation, homegrown
> somewhere else in the kernel doesn't fly. I'm actually wondering how you =
even
> managed to do this driver without *finding* all the RAS/EDAC glue we have=
 in
> the kernel. Googling for it would've told you that there's something...
>=20

I would add to this that if the standards don't work for you, consider chan=
ging
them.  These days it isn't that hard to get ACPI changed and they have a ni=
ce
code first path so discussion can take place on kernel mailing lists to ref=
ine
the idea before going to the standards org.

There is some overlap with things we will probably be proposing for ACPI in
the next few weeks. I'll make sure to +CC everyone in this thread on that
discussion.  Inputs form Mediatek (and ideally Borislav, Tony etc!)
should help refine that and avoid pitfalls that have made previous RAS ACPI
stuff less than ideal.

Jonathan

> HTH.
>=20

