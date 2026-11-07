Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794014898;
	b=Bh7zNfwJw3vIdBeESl+veREpUBwd0PUuE6wJ2V3TvGzw/AYXIF8j2VxEC5OKpzTrvZbU
	 e52LkrB4MWbbmBhsTTMqXK8Rdz10LPeDMwEvsaWH9nPF27T4x4ubuv7esbF41xTaTymQp
	 I8mf/GUR2bFL6erjeN72Y2QjXN+ouCRvmb6GWTEBlpIonM6YuTk73dzjWq6ORMoaF2ArK
	 XvZbigsoytmscaIehbpTM7a6rzy6ku/cAbqCaPlIWFwzOU1xBSPZ/Ac/mMMQrEXG09tD7
	 BIcv3UW1xsCv6aZHO1V3C2dBNXQYfrGDeB1/W2B1WyIl2s92KG0Mv7c9EH2YxCEFkdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794014898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=A2K0C4Y601dKboRibgXNYOXQyJ93jJc/YQsibXbCB9k=;
	b=vBERN3d392K0+oH7Anf9cBimb9Waa77BARyvZYhThN3YTD4XO2Frq+VRhQIG5fHaUVrc
	 urH2WRtnawWIEgSQBleXeuA23TJXJebsBs4A6P4XKucJ32Nc4Wog0vtTqIwwQA51tcvB9
	 //ihXDNqkI800WGCHbZ8zR/GSPO/ryFel1TtPU/iGgbXJzQsXQS2XPHWt/66II27JTXSp
	 7hnGhbECmdiVxrGVqNGa46DvVIDobLMnY1+M/NO2hqrxCzUp02vxrlyPhaHHiXzc4P5WO
	 7Ntf9KuGI+JGmhsHOHtYSRS+UhUCdpjOz2LgKVJtuT6gka8U8CX4K0bODQY2wwYOatQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SLS3Ja53;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0D6606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 01:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E0D6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SLS3Ja53
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3acd304b5fbso8100191fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 17:28:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794014896; cv=none;
        d=google.com; s=arc-20260327;
        b=jwhvuGdRcakF0jO0TPgnHuMVSoR2UHlTD7+Q6SqLb6uPEp2HH9uw/HyoBXz2V7B0kl
         B7XtgHS+RxK+tQqQHknbcUu2AUZToig9aHTk8i+QripX5nv8I+7ivy5bXiZ9CIN8x7my
         nZTMLAa6cgb1FckimY7BL9xRqTTtTVCLCsFXgEyt9x/W/RmrDuoCbsCkJgkm+tSAWEFj
         9htAt5kxEnY4u9DSmmzg0nFP+lqNiAMGw6Rg8jZMwg+P/ejheCyrIw1e8CF/x8j7PZPm
         exBd8C+9EWwr5lz43EqKYPlaItrB2a0knmA8stNxzm2Eu9vVOSeShQtjizKFUAVrynYo
         riUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A2K0C4Y601dKboRibgXNYOXQyJ93jJc/YQsibXbCB9k=;
        fh=JUiB0wMXmJ8Qs+vQVL1/+sGMtW1gSwGMSp21nCEj010=;
        b=HVw38etZfRDTs6nfvciJ63SmGVesbu8Kq6ZG1wjjeDFTPqDIDvo8qPmIS1ILAJ4O+x
         1Tddm8x0fr4HDRs39L0qTM5TlUAeNMAmuaXsG4IpE0+TbzkxxKF/89LALIsuBbn6Hra+
         0PV0XmVaVvJDvOIQLrWKNu9fImLy4PVkOvxceqjyBODTZG5i8fsSVfOatz1cdg8xTtWo
         YJbxLZq+jSaWJB0HI71e71C2etDnH1w3h2sQz6zm4tdnwKyndl0a7GTQuwPg9P4ZVniT
         be9NAqvEi1RpobDIKBkbcwH/rcglq1XdEbDAxBxFIHU5xL/KjxUeKKmMkYXkfk+8tERV
         Pu2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794014896; x=1794619696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A2K0C4Y601dKboRibgXNYOXQyJ93jJc/YQsibXbCB9k=;
        b=SLS3Ja53nrJnn/H4p4EZ2yxPSP/BdpYPXGhiGkFELpsdJHlBXM8rPJzemCk2HosQ/7
         zaFBZMmhfIeLmJnVPfWyU8atIwE4aIogKYtdBXpGgGqgs6mTg0RJVGqfAFbEIQ3tpSAU
         Vag06XNZ4/SOvLg+1u1wou0BjMxVQ9Z95L2CoUOGfdq9mbrIn1bVaG3C8Bc84JN6VxFe
         waRuWRBEfQlY02JTi3Kr5m/+oK9g3lzZ7+071GPiKLtjyvhr4HylCk6Tpe3yLTkpzQ8X
         HGhGb6AiCBnFFeYTr5RAq/HSwL+JzhImfx6M7X0MNLr480WdpSKaj3KF4O7Teg4078pU
         7Vdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794014896; x=1794619696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A2K0C4Y601dKboRibgXNYOXQyJ93jJc/YQsibXbCB9k=;
        b=MHorRhXip0ZIFH36ldDC8RVvF8anRe5oEY0sK+6tt7KCKKp38pR9uI8jRmt/dnKAgC
         UYtUGNSM1aIW4AE3EKnLcxQuOk8NJbYMv7DdzHr/P6RFhOJ5iBnbOTse8k/jVCy7Xi/b
         zg3qu7+KAV49oLbVkheje2Ep5S2yF97F6X9nNrygPJlsUGDdlP+YXq20KIKR4rAq4Prq
         4wCBA8U0oiERQuxJPhBxTDzqouuJnhWYVEeKlKk6wJgpFjgrHdmW89kQhZVKRkg643OS
         yWU9tT25jQljfFBRWVOuy1f2nLfRXTvO5/5Dze0k0DFl+qkNa2ZV2mqJve5wuMb9AIQF
         +/Mg==
X-Forwarded-Encrypted: i=1; AL+hErGZMwaNv/a/AQZkSvTeoLnIH20cwNNAbeO3f7qFGLFVsSHLaw5XIpbzBGy7hiXm7DbUQIg7Yv19DwY8Vlw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hM1/F8wk89ju6dVyXvTsHhDEaPLxdnKZehaEKGd9JNT/LAWaI
	LmbFz2tDgRd+yRDBWh9fqaX3VhYXzm9ktXVN58hffipPOLsgP/KILq7Yak0BoPK+EWvLhoK74HA
	yDBROkYEhuKGaq+EVIZEftH/nNgcP+lc=
X-Gm-Gg: AYBFou09w631Uq2AIrkNLHV5aPlwfQ9oA8/xv/XLLm8WMfjQBpjS4CzkoxEZbCLITQO
	eZjx/+EFk4X1Z7OooVV2vGVGM3hS3zYyQw7KjWL+CJ8UDcbom8f/c8TIR4//xgYxxhYd3VZ3nwB
	0nXcr2fdGiHIMs7fQSN6efgoxF1kuGVYKwAVqlr8XOtnkJtnfo6sI/aFIsTb7LAidsZnooNdi6C
	f0B3zq8pAl36lHGtAFRq5zjC2gHB48hKNvQfFTQTQ//NgUv/LX6y8em3RqlX9uJfkgU/wg267Jz
	lLs3yNWTINwuqaxABq+KEXu1031pWfIkJI5mXv6L935S9XqyLNDrVOIqe8/aPssMurJ+QFcA0ko
	JyNrbhcpaVgwl2w7YlNn+ImtV+IjTbVKkChGi
X-Received: by 2002:a05:651c:50b:b0:3ac:7ad6:2007 with SMTP id
 38308e7fff4ca-3acf3d2e1b2mr8306571fa.25.1794014895558; Fri, 06 Nov 2026
 17:28:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106072412.7909-1-kanchanapsridhar2026@gmail.com> <au5l3KEjG_mri-br@google.com>
In-Reply-To: <au5l3KEjG_mri-br@google.com>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Fri, 6 Nov 2026 17:28:01 -0800
X-Gm-Features: AclHuK8dDkK5HTfWUegZtffyaMCinmRWFj4cc_dRxksYCqbkD4npiRB4j2h1mUA
Message-ID: <CACpmpoc3R8gwkMouwyFLw9PEqyDN1i6OcmPxsvZ1d0QOPSS_fQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Batched zswap_store() framework with compression batching.
To: Yosry Ahmed <yosry@kernel.org>
Cc: hannes@cmpxchg.org, nphamcs@gmail.com, chengming.zhou@linux.dev, 
	akpm@linux-foundation.org, linux-mm@kvack.org, herbert@gondor.apana.org.au, 
	davem@davemloft.net, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rientjes@google.com, willy@infradead.org, 
	senozhatsky@chromium.org, 
	"Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 3:59=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrote=
:
>
> On Thu, Nov 05, 2026 at 11:24:04PM -0800, Kanchana P. Sridhar wrote:
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> >    usemem PMD THP BPFTRACE
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> >            Baseline           zswap           zswap          Change    =
Change
> >         mm-unstable           store        compress            with    =
  with
> >          10-25-2026        batching        batching        compress  co=
mpress
> >                         (patch 6-7)       (patch 8)        batching  ba=
tching
> >                                                                (ns)    =
   %
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> >   zswap_store_order0_folio (ns):
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> >   p50        39,631          37,538          37,765          -1,866    =
-4.71%
> >   p95        53,088          49,690          49,349          -3,739    =
-7.04%
> >   p99        65,065          63,529          57,404          -7,661   -=
11.77%
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> >   zswap_store_higher_order_folio (ns):
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> >   p50    21,460,366      21,201,411      20,383,233      -1,077,133    =
-5.02%
> >   p95    25,975,341      27,558,253      25,045,350        -929,991    =
-3.58%
> >   p99    29,538,493      61,926,648      27,184,835      -2,353,658    =
-7.97%
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> >   zswap_single_compress_per_page (ns):
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> >   p50        37,545          39,320          37,218            -327    =
-0.87%
> >   p95        51,549          66,503          51,481             -68    =
-0.13%
> >   p99        89,866         134,854          87,091          -2,775    =
-3.09%
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> >   zswap_batch_compress_per_page (ns):
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> >   p50                                        40,493           2,948    =
 7.85%
> >   p95                                        56,944           5,395    =
10.47%
> >   p99                                        76,242         -13,624   -=
15.16%
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>
> As with previous versions, I cannot reproduce these results. I tried
> with a QEMU VM on a Cascade Lake host. I saw marginal improvements with
> patch 6 and no significant gain with patches 7-8.
>
> I noticed that you omitted high-level metrics (e.g. throughput), I
> didn't see significant changes in throughput, and I also ran a kernel
> build and saw a small regression in some cases (probably with order-0
> folios) and no significant improvement otherwise. Even if latency for
> some functions does improve slightly, it doesn't matter if it doesn't
> show up on higher-level metrics.
>
> It could be the difference in setups, or the overhead of bpftrace hooks
> for zswap_compress() might affect measured zswap_store() latencies, as
> you will have fewer zswap_compress() calls with patch 8.
>
> As advised previously, I would trim down patch 6 to the bare minimum
> (without all the scaffolding and prep work for patches 7-8), and send it
> separately (with patch 5), and we can check if it's worth adding, I am
> still concerned it might be adding overhead for order-0 to be honest.
>
> I am questioning the benefit of batching here without HW batching, so
> far the results are more concerning than encouraging. I already spent
> too much time trying to reproduce the performance gains. Also, sending
> new versions without resolving discussions on previous ones is not
> really productive.

Thanks for taking the time to test and provide feedback, Yosry.

I omitted high-level metrics like throughput since you raised a
concern about variation. Hence, I decided to go with the "ultimate
truth" which is bpftrace latency measurements.

For performance validation, I only have access to a 16G Chromebook
with a Crostini VM to which 13G is allocated. I am setting aside 3G
for swap and 7G for QEMU. Within the QEMU VM, I am selecting 2 E-cores
to run the 2 usemem processes to minimize variation due to frequency
fluctuations. This setup has its own limitations such as being unable
to fix the frequency.

Despite all this, I have been able to consistently replicate the
bpftrace latency improvements with patch 8. My results show regression
with patch 6-7, and improvement only with patch 8. As noted in the
cover-letter, patch 8 adds significant latency improvement for order-0
folios. This is with ZSTD. FWIW, these are bpftrace latency
improvements in a significantly memory constrained environment and
this ought to be a useful data point. I have been posting general
vmstat "system health" metrics to prove that nothing unexpected is
going on.

My data shows that order-0 zswap_store() tail latency improves by 11%
over mm-unstable with patch 8, although p50 is roughly similar between
patches 6-7 and 8. PMD store latency is significantly better at p50
and p99 with patch 8.

Likewise, p99 latency of zswap_compress() alone improves by 3% with
patch 8, while it degrades with patch 6-7. p50 is almost the same with
patch 8, although patch 6-7 regresses. The page-normalized
batch_compress() p99 latency is better by 15%. All comparisons are wrt
mm-unstable.

Hence, I believe even in a memory-constrained setup such as mine,
batching significantly (7-15%) improves p99 in all cases, with 4-5%
gains in p50: for order-0 and PMD folios.

In addition to the latency benefits shown through my validation, I
would like to also emphasize the strategic benefit of moving zswap to
use batching, as noted under "Conclusions" in my cover letter. IOW,
batching within large folios to improve workload metrics can only do
so much (in proportion to the # of large folios reclaimed and
contribution of zswap_store() to the overall allocation-reclaim path).
What this patch series attempts to provide is a zswap batching
framework upon which additional improvements can be built, such as
reclaiming multiple folios as a batch. I believe that compress
batching is essential to support these next steps, which improve
workload throughput/latency metrics even more than simply batching
within folios. This is with ZSTD.

Due to the environmental constraints, I haven't been able to reliably
use kernel compilation for validation.

I have been doing my best to resolve previous discussions by
incorporating the calculate_high_delay() hack that you suggested to
reduce variation. The data posted in v3 comprehends this suggestion.

I would like to suggest/request the following, as next steps:

1) Can we reconcile our methodologies for usemem bpftrace
measurements: # of vCPU, usemem command line, reading Silesia, etc.
Also swap space and QEMU memory allocation, using linear lhists() in
bpftrace, etc. If you can share these details, it would be very
helpful. Thanks again for your time!

2) Does the kernel community offer servers for contributors to test
their optimizations at scale?

3) Can I please request the help of other zswap maintainers/reviewers
to validate this series with ZSTD on a server setup with usemem
running on 30+ cores, under high over-commit ratios; through bpftrace
and/or throughput metrics.

Thanks,
Kanchana
