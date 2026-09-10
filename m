Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D226218EBA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789079478; cv=pass; b=Jk5zb+JkRqS/BVBf/nk8BVSzfdPsq3REceivvDqs+d1Zn7E1rMfhGN3zpijYPxIPSWBzg/g0UsEn4AIpTJZSlxV3ysFzRxzYBoMQSD2ZYy2J9vk9jPuUN93fKfpA+eAYa4B6RJr+/qvvK1Eh3q2Mf27iZSajFLq4y+BwdelOdfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789079478; c=relaxed/simple;
	bh=mqkdWXOaH7nmkon+ND3yeEXHqdrXFJ4EUiqvK2I9fBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cyF+PmM1fzoCt5KGMYpQtH/2oXVTa9JfyPwO1MEK1iEijUkU2Ptw6K1nbfa/IrWVFBECax6E3GkoSfBDLiwRrwZC1MwX3BWN0VPkibHIEFtLJnI7KL/KQu80O2mEJvaJ04SX0Zyts1LU3zEpnnJbmI9dW4zUnO6QVPDetS+1p9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=RPshzASx; arc=pass smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="RPshzASx"
Received: from pps.filterd (m0528005.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALUuDH3848137
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:31:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=Xyns3w1s5BnPWLiZe/VHaLNYj68K+2MXvTrvc
	ya5Tcs=; b=RPshzASxcfHSqEkDfY2qvyQ9KR11JtMXcK7g8OZY2oqZbw/2cz/Qj
	yv/kFiCFZTJDoilGMoDqeMiqMhDefhjzp8Sg7i5GvuAA7gMC8S2CLvT9zW6eYi/c
	n7WC9dptKGY2NamqnmsTjzu30Tfuh0mpIHQIP2UHMJ7tD/9VeUUqTB4HmQza2Njq
	0oTIwPr8oSKFSF9Fa5McA1kgFtzy/5Q6K9pdHyYg3bxO6cXd/hMU/Vlkh/pfvP6p
	XxRo1hC4mMRhJRaHYWzNp0wOuMpc2VkJpn07itXEejPKVfl5XWq2Wa71oZFHrdpe
	JeeuQ0H0F66PoQt0UJ51mLUh3fYdOIoag==
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4gkcyet85p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:31:13 -0700 (PDT)
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-490a767b782so2157285e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:31:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789079473; cv=none;
        d=google.com; s=arc-20260327;
        b=UY8XUzAiAkGt6BzqaMPjZ6qefg/qDXmAKyhQdaSDAAbZ4op3KKtqYBr6Xzrg4+H5Fk
         c3x7w3K/OeudT6I9B+3BSeRfYj+l6irsaNVQDdBqsUebwmRxsH9XXEScCSkW94w/UKpv
         YeAUW31SS7Rdz14TJmkoilg46V85BLQ6oiCl1kkgsGpe1wV94mqplC8H0Dme3NTSvNYR
         qCkvSYjuthWxu9tJqHiNbpdqXsHmaAHCov1Jg6XJEQshIzYBGreO5Av1daiGusHUBX/X
         DV0/nq1LSeayqDoMfh/acqoSpihbo+1DiwBBCoTlhxxZsQUp7seMncBvBBpw3Ic5gb2q
         h8PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=Xyns3w1s5BnPWLiZe/VHaLNYj68K+2MXvTrvcya5Tcs=;
        fh=OVheK3554xhQQ1LqFwTyoTljD/AX6T1IvbSOqm22uyY=;
        b=Ux5wd8yVtRzODAftdyerDElk7+KXd0nquGfybTxH7RWIBhpsRyMmPz7hnxxN7cq0RH
         dDdRsmNxgX3Fwwfoyg8woqVz7WYPu/ybTASwh+/wQ+ighPOlU7UZLB2qk0BePfxCrPma
         al6Vfc0xNj4hDEkd32GzQB4rx2cG5s6Q5lmXTX3jOf7zP9upqwDTOO5rl3dWhLQIuPUZ
         LtV56RBcQ5O6nKU6HvFY3AOleb9xAoSErGKWXkK53LeCtVPJTMLObb4k2hvFafoWdbV2
         5NGY/qqTK9G+7ch3h+/m/cja0BnVnlE5/ReIuhY2xL0DexjIkqbqv3S0+7AwuaHRnoIr
         uEcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789079473; x=1789684273;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xyns3w1s5BnPWLiZe/VHaLNYj68K+2MXvTrvcya5Tcs=;
        b=OzSOeoJZL8kxMhm6HlAp3WujiFQc9b9HFZYVGyk1S0p6ecnr3wDzaez7x9eULfudsj
         hJKzwbkVITJwDxkUb+UjMDN/oSt7Mm9yLef8cNpTORvwHMtEmLUgTJIcQfVqG+BjjLwc
         27LaXG+RS3U48evEPlckQFAEbsQPgTCUlwsKh89KAfRSYhAyNU4jzUL8ABrmF8dIIsRU
         akopWjSALtTc1kzi4U1dpwgEG317AjBKFCf8gfWl8lPckuk6n+FnCfSXqlNlhTYZ18pH
         Wk+T+BHRorrLCEatU0SWKF1Bc5NvsSVtH4sUvewi51rjz7MB1MiGOf7SevvCETH/OGJC
         Yi6g==
X-Forwarded-Encrypted: i=1; AKwUvByOOx0IrWw6y45L1r2x+EA38YGLilQS6AtXrB9oPXRID7Pq+zWWZMf4eP53uKCZ60+NbzQpEZYHnFyB7rg=@vger.kernel.org
X-Gm-Message-State: AFuF++k7iOmfSNyR5rTuTMzpdacezOuf2L6yisAEzVYQqSSlRSiIkj8D
	CkhRynRxTmKan3s3gOSP8L7+gef+5qSvoxZPhAJ24qoazMhF4zYEHFX3sm3lehIVot8v0m/JOAa
	dYbjbuPCkoz1UmNbHTPMiUHoT8fUMZ758t3G580yk2so4BlOo/g8YjroZYw/lqVriKZ9wJGc7vE
	WxWaAAEVoHARa+//DXVo6t6usE7FKAUFFyLC0saDE=
X-Gm-Gg: AYBFou0c5c/0EGRP/ZByRi34549PlZvgMbmqyQD4pBXn+81BxLJR5H5R50Q9Ftukzcb
	Z6+zQS8gjsNhUhb1actCxwn8svmNJAhyHQvD9d79yM14BkNLLBDKBCp9Ajz/CqD4cNFprVLark6
	CMZ85E/iVIt4X0ZKOQcsZ0Zqy++DNvVZBau8NyDJT1cVvWY6lR5791gtCChA==
X-Received: by 2002:a05:600c:3513:b0:49c:fc6e:a3d2 with SMTP id 5b1f17b1804b1-49e619bfdc8mr12376045e9.17.1789079472845;
        Thu, 10 Sep 2026 15:31:12 -0700 (PDT)
X-Received: by 2002:a05:600c:3513:b0:49c:fc6e:a3d2 with SMTP id
 5b1f17b1804b1-49e619bfdc8mr12375835e9.17.1789079472575; Thu, 10 Sep 2026
 15:31:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825220616.3842633-1-usama.arif@linux.dev> <20260908153715.3063790-1-usama.arif@linux.dev>
In-Reply-To: <20260908153715.3063790-1-usama.arif@linux.dev>
From: Nick Terrell <terrelln@meta.com>
Date: Thu, 10 Sep 2026 18:30:59 -0400
X-Gm-Features: AcwNN1Xvy4hCdQWDoJBuTqwETdZ28QWr_8dT9gnVleiBuTga15NCigx00hGAtSc
Message-ID: <CA+BOzqre9-EjDZcMEa0m64p6dNks0_FO4u5Z6bHpUovkT9U92Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] crypto: zstd - avoid initializing the workspace twice
To: Usama Arif <usama.arif@linux.dev>
Cc: davem@davemloft.net, dsterba@suse.com,
        Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, terrelln@fb.com, cyan@meta.com,
        hannes@cmpxchg.org, yosry@kernel.org, nphamcs@gmail.com,
        chengming.zhou@linux.dev, shakeel.butt@linux.dev, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: wXskNNbarD73vEUe7YVinQvxqtMWVqNA
X-Proofpoint-ORIG-GUID: wXskNNbarD73vEUe7YVinQvxqtMWVqNA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI4MyBTYWx0ZWRfX1o2uKrYnH7bP
 NTLwMC2OzOqoyFyE5c7MVneE249FluATTaVtYIR559L81BxD1/VfbWlL4doaXcVHlhr3i9J8Azx
 d31ZyDbry1t+laVSVqCOQkBCUdSuMXYZ/fw/IZtqqPxEyCmI0vH2a+GICPzMl+xWeZJWlgQM//e
 4nIAOA1tCZgzfEPGkgV1hg4sQmSqJl1bzG8OANo0yR4WIAsuQM7LXik0Uhi3+Y7NF776D7bxTPz
 Kx/wnzn1qeKvrnhN0NkviHApu9KoJuC5V0/WJf5R6uuPyx5u8g5u/qGJVFo0ooZUOmZQzUDGin5
 Jh9YEz5rU9h8BRfoScvrUcqaq7L/oRaO3qJmJpcGM2wyUdAUdH2DP3qMDS1cb1HE54Gtwy2GC+i
 /fmWTsAY3JZybmqdOfj9XdyKkiArwHr106B5++GVV10EyuEq+VDedZG7b/1hK1jhMyiegm9qL/R
 vtxBhCv6eailK6kweMg==
X-Authority-Analysis: v=2.4 cv=B+0sQ+tM c=1 sm=1 tr=0 ts=6aa32fb1 cx=c_pps
 a=Ech0Gv1thIkdqUNjVc2Ehg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=jCddH8ec0KUNCymVuxII:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=FAvacPIE_xOtX3pQF60A:9 a=QEXdDO2ut3YA:10
 a=cZgK7WzY9ta9U-6s7oqD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI4MyBTYWx0ZWRfX2t8mwz4qICcB
 z/o7RpOUneKyakQOkbStVlsV7/GUJNpZEQXIY50gspxFHCt2zzqaYo3agNPRJWvninA3rrJbAUg
 ojoguaa9scYG17hjpocB66CmVza3WK8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01

On Tue, Sep 8, 2026 at 11:39=E2=80=AFAM Usama Arif <usama.arif@linux.dev> w=
rote:
> On Tue, 25 Aug 2026 15:06:00 -0700 Usama Arif <usama.arif@linux.dev> wrot=
e:
>
> > Both zstd_compress() and zstd_decompress() set up the shared per-CPU
> > workspace as a C/DStream before walking the request, and then, when the
> > first source and destination fragments each span the whole request, han=
d
> > off to zstd_compress_one()/zstd_decompress_one(), which immediately
> > overwrite that same ctx->wksp with a CCtx/DCtx. The stream setup is
> > discarded without a byte having been processed.
> >
> > That one-shot path is not a corner case: zswap always takes it when
> > storing, and takes it for a load whenever the stored object lies within=
 a
> > single zsmalloc page.
> >
> > These two patches defer the stream initialization to the first walk
> > iteration that actually streams, guarded by a flag because that iterati=
on
> > can be reached more than once.
> >
> > A 4 KiB crypto_acomp benchmark [1], twelve runs of nine 30,000-operatio=
n
> > rounds. Bare metal is an Intel Xeon Platinum 8321HC, turbo off,
> > performance governor, pinned to one core; the VM is a one-vCPU KVM gues=
t
> > on a faster host.
> >
> >                   baseline    patched     delta
> >   bare metal
> >     compress      52,283 ns   51,038 ns   1,245 ns   2.4%
> >     decompress     2,317 ns    1,998 ns     319 ns  13.8%
> >   one-vCPU KVM
> >     compress      16,675 ns   15,050 ns   1,625 ns   9.8%
> >     decompress     3,516 ns    2,265 ns   1,251 ns  35.6%
> >
> > The guest numbers are larger because the two CPUID instructions in
> > ZSTD_cpuid() become unconditional VM exits there.
> >
> > [1] https://gist.github.com/uarif1/5cf02f0e22c23f0d1b3d84348f12914c
>
> Hi,
>
> Just wanted to check if there was any feedback or review of the series.
>
> I think its a nice optimization and even with the CPUID instructions
> getting cached [1], this is still needed. The improvement in baremetal
> is not coming (just) from CPUID instructions.

Agreed, this optimization makes sense to me as well.

> [1] https://lore.kernel.org/all/20260901110850.1805747-1-usama.arif@linux=
.dev/
>
> Thanks,
> Usama
