Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793892354;
	b=yrObrr9W1NJ49OFR+PVgRkrTpzHZ2NpHnehpV3M2X5e2q2azG1SXiO+5pjmYWxF7lSrU
	 HPL3GSYFe7Za2mDNtX1dEGH4ckgJS9rywdYXrf+DLJoIJY3sWWZqZuZ7uW39XArOREyQY
	 ecw/c2NdnN51VukU9hvRLfbOfaNP1RneuO7M3nF55AhL9vAh/oRrkwKfRcIbKMGAd4mPd
	 V6RoHuqOLSYoywDi5OS2XEXfVQ2vTzvybLMx8HqJcC4G7gHvAG5R76MULg49CjnJsITvb
	 CgfyUJxZSN9HoDM7ZqHlvF7e1jZxJoR3AV00BJvaAA/TCRtBA582DIV1RT4tULFJrmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892354;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vjhKddhBYDjam7gmYzCuUV2TommKkjfbcHQoD1zd0pc=;
	b=x27SQKriom29Qyhi0SpOOZRxWPQYfznWnUamnREm6SMgC+QKV4Ng5MZ37vjdmzIFja9H
	 ia7mFhjwrlwMvPkqpBrunNyw4MdX0QI9jsckN6ZaWQz17gXOL8gmJHaJxKxYyv6KnI3qf
	 gry9sauY51E5PYCh0qXGR8sYStxtC3ITxeCk/E+3FY6FAjbE5d/VwcbV9BZ/xa2cBOpqd
	 oH3+OA1dbCiZWD/O3OrWFKEQ4KmTObYrenGmFL1gOLsbt7PHH1m3UjJtHF1yqG0gcNQfb
	 9OEeHhwYDKlnYg3sUjZnw9GKJz4BjuBk3QPEfShN9LdRirULLvZVdeEzXVXRfnIz1+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WXgsHAIw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WLYXjjDm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235B9606A337
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 235B9606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WXgsHAIw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WLYXjjDm
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQHmC1631001
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 15:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vjhKddhBYDjam7gmYzCuUV2TommKkjfbcHQoD1zd0pc=; b=WXgsHAIw4cd5PFjW
	lNmKFBgafI++UoKu7IynvRLi/wt+QVNg8ySrAgw8O3o35+zwrbp+bul4Z4PAN1Yj
	rjJKnkwqQkbm3cEIvFtNqVcN5f1eOU5pbJnrHNF7D8N5XYQUw2bpbtRs8I2TdFJG
	XpJh1UpmR+xQfx87Of4dPAw+VY2mcxDog4B90qKnrVr6+UWqjryVxh1SflOobBAF
	vH1fjqBhGQhjNGo0WMn7sRRzXep/lW3uyAXpRd3wRC2z9UUR2kiQV/7X0/KsmP4T
	HgFMnwIcqCDB5QW5FsIRrNjs0jkzBxl6B/yxQ4KKr9H5Isw4dfnFF30HR/xD29Kv
	F7jgqQ==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrkaqagr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:25:52 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-679f81d5d7bso3430893d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:25:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793892352; cv=none;
        d=google.com; s=arc-20260327;
        b=GtHaT+uhyu0Gc7XxgCBEZ6CYz9LGyTtfT8UKcaXo6AVFOIbDwQ3rxqy6K7MTVCNz8p
         3IFvFBEa66vIO/d7Ry+ALZF9WRBbKVqUjv6K1QDOd5NXiMn2v6m0PU9zMOOVpDJqEPMq
         2BbyNsQPCs7wSs0+RfZXxCgeaLyMCwQiu6TMEwyOXf+wp/0g+SRcpTPe1dyD8ZhAoC1z
         cKrqpUh5GLq/6tjLlOSPppbsNYTzw8Ge1gHQYugruPI1ullBn4KB6vZ3BqT+GaNn8ohT
         nzZBS9617YkD9RTRmIgIaRC835pUhazns+ee05Qq79I4B3Z07tn7UvZMJvUHhDV+5xlM
         IM9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vjhKddhBYDjam7gmYzCuUV2TommKkjfbcHQoD1zd0pc=;
        fh=zc6Ozex2fHgc1rkS1mNoSHRc/eQkabHnJtINZH6WujY=;
        b=IPddvn9wEgOmLnsVLiayQ3JOZE8aZdcioOHHUgf2cfyEouNNFr9qDVA2vQ/d6nLR1i
         25wGUYJgf/OhQS3mlb03xpUsQ+ba9U/6QOfEAD0ezEZdulZewOIixZFhhpf60xBHT2RU
         yN8bvpcv+LIwGOBSiM/ME5sgS+h4Zcg/iwWrttz5Wc99qCrSPaNTz0lCuuL9GPLppRSY
         vBj57KoqNEE85VcsvcuT+fX8fcpcTzcTHkG14JAR338ETaa7I2t19Ht061QGOHjMkuSj
         vD0yMYVjEiWXZK97jYL97I1fjWis6xKKOZx/8zeDCqTjiH+2qsl+o+bK9TqUI6XrGQoJ
         XSbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793892352; x=1794497152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vjhKddhBYDjam7gmYzCuUV2TommKkjfbcHQoD1zd0pc=;
        b=WLYXjjDmgY+FqKjJ0Xw5kC9fA5KqmRDKTwoAizy2J0qvHSGOSnCMFx2KJGmO0GOtzj
         FRxaVpPyZ4swm0u4Cjbm8I6o+55F/0OArDAs+smRf2mg2hzIyElsQ6dC8V4kqeeiH4bW
         SOWthIOBEUO4sqfg1llxzTOL86nUndA2pe1lsDSfHLJShTM5E2pjH91LALww5TW7ZTxg
         rC+W0Ttfpq2A9PJHnMlzGdk0HJGHy9lx0L+rzycmHrsYE38KL4yzuyCITYXVY0rujdOS
         Aovil250B9Hd5zIhei2HxFjWRD84w61srxtntYZ9FRqeUQxcHnQl0Sj8uWtW1o/bJnus
         38Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892352; x=1794497152;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjhKddhBYDjam7gmYzCuUV2TommKkjfbcHQoD1zd0pc=;
        b=YL0+9Mr18W4HIVNcNLr36aCXvLcoXTwIqj4adFZidVzFzjg73XV7xk9sQLP6TPhMZ0
         wuhiSZoD7Ah3F0rU0QeMfLoOUE+IMJZB/J3kHHtP/5Iqe3v1Oaqa9g2wp7LwSXL0h8oY
         OTzcZlC9zVda/OcUTIVUo7NBCkYeflQoDmiW2ccSsexth27obhfd7WOZaYUt5ukqse4d
         BypuvRErVMGRlkT4Pff21yr+ZTbQoyf4Rql/0FuEpd/Tf7DaZ2Q8LMmv02qXqA1zw0Zd
         WueHBLqs8wODNV9xBZv0NIsDq745Eozvr2kueKuivY/baL7DhMHBsTjN7VnMdRWaU2Wb
         USww==
X-Forwarded-Encrypted: i=1; AKwUvBz+K4JrYXuurVIjfER3uaqr3HtWtyA79/BzkZJ6M1SQCUVVv3ZoqiJUAYM+am1zYLwtPA3jKhxzvDAJoa0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oI8gyGNz2U+DItC8Ahf6jUoNlTt+5azmhS0ReSMbEZBNiK1hk
	jFzSm6z3L75FaditEwBE+MCRsJVAIqMgdgfrVeB0+Xy19Zo4KytCO1OswO3lDVeXbg5f6/nR3AD
	tSC7il5RI6WX/q+icQ7k6b+f7JdxncnH2z72QB2JJjeUGWxqJF92Cil598m4pDi/sQh4d21Yhhw
	4VEBfRUAMELSTAsLuTMpxnVK8BVDbR0i0EZnH501zCMg==
X-Gm-Gg: AYBFou0Qx84JLV48DKvLq350XMAQIpsjky1wvB7wBMHiE7Io2aM5b0b9PeAa9pDV94q
	il3daue4M+dH/Qfq2Xto/o4utvJrB7FZCtFvp9KeCWKnzidwd5/lGlbPPLoOE+PCxl2qf/MXKJf
	XHsxEBNg7U1Geb7xBHub9sEZHmsu4iVF9y+PvJxnB/BOWMmL0wFhoZ5ED9LnhP9IQPLWkR1WHen
	2mCOI+qiZxu4DmdAFiAkirujRo333Sm9dbWNgpP
X-Received: by 2002:a05:690e:12cf:b0:677:dc7e:48b2 with SMTP id 956f58d0204a3-67ba4c86589mr11693056d50.2.1793892352261;
        Thu, 05 Nov 2026 07:25:52 -0800 (PST)
X-Received: by 2002:a05:690e:12cf:b0:677:dc7e:48b2 with SMTP id
 956f58d0204a3-67ba4c86589mr11693043d50.2.1793892351655; Thu, 05 Nov 2026
 07:25:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023210238.551855-1-g.osokin@auroraos.dev>
 <CAGgiveXkWxrdeRYCxBC9X0eQSUAAxF5N+ioe3iM6GZ=pSqHHeg@mail.gmail.com> <auxy_pv57awSTf2m@sumit-xelite>
In-Reply-To: <auxy_pv57awSTf2m@sumit-xelite>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 16:25:40 +0100
X-Gm-Features: AclHuK8d8uq9ewtGZRQXy2A5QzI8YGszOw3YIr6_bJKxcDqcRh8qdQM6EdugmVs
Message-ID: <CAGgiveXx8hwsbjvHFHb7qtCOxKDsgOmGN7rCDVj0y_-uNyX4kQ@mail.gmail.com>
Subject: Re: [PATCH] tee: shm: don't warn on an oversized page array in register_shm_helper()
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Georgiy Osokin <g.osokin@auroraos.dev>, Jens Wiklander <jenswi@kernel.org>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: TkIpvPCTTMNVX4qsT-yoP_PjGSTM6CKg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MSBTYWx0ZWRfX2Ih4zCYpPzqV
 /LjkCNB33XNvBo/zdUpDQ3rgypCyGSMC5yg/TF/73S+ObL3/3zSQPJdO3O3I542Ydr62ULc+7dl
 VjoIA4VX43bP9uPSrCbMxINA9/dMDQ0=
X-Proofpoint-ORIG-GUID: TkIpvPCTTMNVX4qsT-yoP_PjGSTM6CKg
X-Authority-Analysis: v=2.4 cv=OZoNnRTY c=1 sm=1 tr=0 ts=6aeca000 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=HH5vDtPzAAAA:8 a=EUspDBNiAAAA:8
 a=t_EgE2yqlgOat-Z1zJ8A:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
 a=QM_-zKB-Ew0MsOlNKMB5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MSBTYWx0ZWRfX4Tff6q1y+iTR
 HtP76PiE2c+qEbBFt8Y0/XvfVw6Qt7DGky1Td+NfUXSO5n7+BEu2Sys3+vd+pa2bBYWcnlvaXW6
 Z9HwvG+TW+GEU25YQ9Hvm1E23ePCFItlSfOA1jhCAXaILdrH7iTotBViNpbuazW8ARUSZ29qOCe
 KeApwcHKEw40kOK51PphrQT0n46FO2xncDcCt8B0+W1yej1tFickRFkh151Zxo/oeA53OOzFJZJ
 1iI5OEKoP6Phk1o/DXIMUaq4EfRwJ0zVybriKtIvL1ELcytzyNM6hpFOorvXi5OrfamYiouCvyB
 0kFbOEasjwuusNo7ZMy1xZSMw194PPLW4qYIybdaggSF9BOuntaorOArEHNMHapYIIOOidhIjwo
 YEmj7E47J6rdCzgg+Kjm0BEqzpM1y6W4cqAB1kKpcZpC/3pLJWEqHuHexxKFrrb/CKFbAGld3v+
 BhGj9TyxbnpbV//u+UA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050061

On Thu, Nov 5, 2026 at 1:13=E2=80=AFPM Sumit Garg <sumit.garg@kernel.org> w=
rote:
>
> On Tue, 03 Nov 2026 at 19:34:08 +0100, Jens Wiklander wrote:
> >Hi,
> >
> >On Fri, Oct 23, 2026 at 11:03=E2=80=AFPM Georgiy Osokin <g.osokin@aurora=
os.dev> wrote:
> >>
> >> register_shm_helper() sizes shm->pages from the length passed to
> >> TEE_IOC_SHM_REGISTER and allocates it with kzalloc_objs(). A length ab=
ove
> >> 2 GiB makes the array larger than the page allocator can serve in one
> >> block (MAX_PAGE_ORDER), so it trips its order warning; on a panic_on_w=
arn
> >> kernel that is a panic.
> >>
> >> The size comes from userspace and the request fails with -ENOMEM anywa=
y,
> >> so pass __GFP_NOWARN. kvzalloc_objs() would not help since kvmalloc
> >> warns above INT_MAX as well.
> >>
> >> Fixes: 033ddf12bcf5 ("tee: add register user memory")
> >> Cc: stable@vger.kernel.org
> >> Cc: lvc-project@linuxtesting.org
> >> Signed-off-by: Georgiy Osokin <g.osokin@auroraos.dev>
> >> ---
> >>  drivers/tee/tee_shm.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> >> index 6742b35..d539988 100644
> >> --- a/drivers/tee/tee_shm.c
> >> +++ b/drivers/tee/tee_shm.c
> >> @@ -438,7 +438,8 @@ register_shm_helper(struct tee_context *ctx, struc=
t iov_iter *iter, u32 flags,
> >>                 goto err_free_shm;
> >>         }
> >>
> >> -       shm->pages =3D kzalloc_objs(*shm->pages, num_pages);
> >> +       shm->pages =3D kzalloc_objs(*shm->pages, num_pages,
> >> +                                 GFP_KERNEL | __GFP_NOWARN);
> >>         if (!shm->pages) {
> >>                 ret =3D ERR_PTR(-ENOMEM);
> >>                 goto err_free_shm;
> >>
> >> base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
> >> --
> >> 2.54.0
> >>
> >
> >Looks good. Sumit, do you agree?
>
> Yeah, feel free to add:
>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

I'm picking this up.

Cheers,
Jens
