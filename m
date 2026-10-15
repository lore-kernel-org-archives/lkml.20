Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAAA4A5EB6
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792104687; cv=pass; b=hmBlqXGRGykIksPrR/kxCIoYRkq3QVi8+0Dc95pVVA2yvp3B0JxcBzlN5nEcHOr0B5c3xaebxDAvY6k1gQ++ebEwR39w7T39QmeTBOqjAzDCOyV+9au19Wy7itI8P+EeUxkzor+RbuZpSYTOeFt8/tIsDqSqeSAnFO4nsWuL4Og=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792104687; c=relaxed/simple;
	bh=1sT8NdIr+AU2SPJki3v9lJtmhGP0p+Dta5BBYpiM838=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AgTcPDmd/5f1FaLn/FfcSWPUSey5yV4a402QJcoVZMjXZCM1SIYHEaVEpOYjyN0iUTnb+Sn8xaLouI220M6Zbio9Zzt5Q9k4ss1RwWTr8rDVe4PXjn1T/rBYKjdxF72t3lV6WVKx4CI6vWkU3rIgVU1mvKe8boLZXJcyJdM2ElI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fqZuYkqv; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqZuYkqv"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso29728e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:51:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792104684; cv=none;
        d=google.com; s=arc-20260327;
        b=kjtMpWA9jcER0eWPX0Yre2I3JrXM946l6wctOFi80fyaQd86k+f4DLbrhBiYItHxTk
         sbnfCm+aNoRsFX91CfwuwFS7OdHcNCGWNg0H5mixgJaAM5LGiNQs7svTvc9VHbSsCh5a
         HGjEMEgfbaI8mGy32orb7Jp8mfF87sCYdz4ofBEmkArTj3OVDQ8lio+n5I0LCMtP8yZV
         /w1G4yr4b8fdvr1e981D+dAo+ScHqWzhnvV7oKn3qQlZ3hBF+hUF2z6Un5dUFTs4Bxq3
         m5ee4BY2oPxDXX7EDLejw3Gpa/vmRuSgDn1i9tvqyGi3JScYc6edxQaj6t43ITWh3nJc
         7+cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n63KkNNJ2ZOvS2IAs8k+KZxz8QryTA7xZPJO3TDdt5A=;
        fh=36LkHiAC57RwpdapcMMMvsjifHdL0Sw2/zDJ1xG15Kg=;
        b=o7Ms2mf1XWVb2qzSVeH0wdPF2g+Y2snw80IFS8r8jiSMBDz61DBdiNlntkAJEb3nbu
         RBqXnjQuXqbqE16dh7wKdK2uJp47P5jLnx5Nezdb2LvXDd+MoxazaGgSLV1TJDZ9b27l
         AByGtO5xhN9bZnbdJy/vnCGCdXu9dvdFSU908c8bED92fZB5ddflftfa0cz4eFkEUxQc
         Z96CgHdBzBVmYtgykaHAHsqEtVmmD+v4ORkELtb9YcAm2gS8KXaPu9Ak0lyVk2JDpQLl
         AQbPu0ORFHn6m5SbPwQp1ChUDW7SBWCwxRC0dHMLtsr1qrRObDhiomaf3SqY50fCMFwB
         /UpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792104684; x=1792709484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n63KkNNJ2ZOvS2IAs8k+KZxz8QryTA7xZPJO3TDdt5A=;
        b=fqZuYkqvGWTSuoGfR9kkjcfgt6yx0xIZNE0Q4POhZHahcbLhRjePS5ODBAHj1hm9O2
         EGZ9csHAX4srpNsrPkeRqQ2PF8yla98LcY26tlBti15bVaRVb65f3hD/mwNo8PZCUjYc
         R6wWZJz4eX/vxvTmpnbbnWJgnj3EkJkxNbk549EYNfgF0DXtSQor4OeCalx8oecW4SAK
         xZjw1/BRsuNd8/p3LQQSN84M33KVE2yrLpaiYEkMN7ede9B4Oq8Ow8uaze5icyrTkdBP
         TC4Rz6pLZuVILhn0uzfNyRT2W/UM1mCorPUs1JeBOfig46UCeglkXPw/QJNJaZ+4PlOt
         NnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792104684; x=1792709484;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n63KkNNJ2ZOvS2IAs8k+KZxz8QryTA7xZPJO3TDdt5A=;
        b=ftFjc/ZGOZvJItwPYkPF2Ac92fYm/F0BlavF7oWykfBXHGi7CZL0TGMQ505F2pAKeA
         fcXzs0J7FRgtnT8oKSExPkfkIOZjRC/w4X8FGdQWOrxfEjaM8Buhuw6+siu3ShpETi5N
         06eJsW0109AA4Suzz0SsjLquQrOUD/UgZj6ekwy1Y5aHtdHRtmy9fp355vSgDd2lfKnJ
         iV/nqLyNnCj8JrI+i73SKDeFznN0bDa8FSXN79eaR1/UPWokm8NS9u0wtmDRTLOu4pOr
         zNaQ+SUWgwJpKrnHQbYenAl2lnRCl1uD0PZ5U4C2GZg5d7kRJgr38KAtM6jcvRiYKHS6
         5rTw==
X-Forwarded-Encrypted: i=1; AKwUvBwlIq5r1bgYRwLeoKgceMwgZCUCyNXphD23N6O9kgq1/dJaUmjBdqD0zaBh1To8aP4lJ0zi0gFlQvQ+IT0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDBZbK8GBxhLwe+vE+2lZ1CyEQdCFtVBQK44KWYaSMqaMnpOIz
	V6NZB2TLUNwtez+DEyN8ubQqGY3dsgSvQwNh4f4bYXNcYFNhnDFwvEfktetX5fjk5rjVfVl9zft
	0LAC43X3+83Plq8BtIkncz7X4E8wTs26f2UYw
X-Gm-Gg: AYBFou05ut5aS5Sha+huTAE0XD5EYUUF/mk5cEsQ2kL6BQgJYiVM9FZQHOLcfVg0yDZ
	8p2Wicee+62HmtpEQFHHa5yOkoUMJWlCsjs2rBYGd5RAm/aHeSGt0jJWQkAY0Ik0xl8vcq4VMTz
	xizggo/PB/+nP/CinG24eP035kwW7yvVXNXaLpAHriaynTdA0DcY/QUXUdVEUmdlKCcyrRbdm++
	hVUWLWfDE/hmVHCUF1vtokS9XeeIkGGkHfDgK3qacLyHdkylp7g/LGtyjP7Wiv4/zJNsOqcKODZ
	q18JaQywbX9L6QbscPDZDRRXGF1eGZsLiLgUgY14QnetfTxkXVsFuc8=
X-Received: by 2002:a05:6512:238c:b0:5bc:b728:31b with SMTP id
 2adb3069b0e04-5bcde39f1c0mr6258902e87.21.1792104683741; Thu, 15 Oct 2026
 15:51:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008182814.27450-1-kanchanapsridhar2026@gmail.com>
 <as-jZopKRfuYAiTE@google.com> <CACpmpoeS_cvXRWJXqiYZV9oykk=91efv8KtZgK2Pi-QwHnQH3A@mail.gmail.com>
 <CAO9r8zN5n=9v4K+OtEEODg=e0kcFW99PreUcZm09q9CUMQc+ew@mail.gmail.com>
In-Reply-To: <CAO9r8zN5n=9v4K+OtEEODg=e0kcFW99PreUcZm09q9CUMQc+ew@mail.gmail.com>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Thu, 15 Oct 2026 15:51:11 -0700
X-Gm-Features: AclHuK-C_rlfvY9gc7Ysw5I3rgT-17tzvCB8MZKJeUsSlTmiFpKdeYuI1BXf3wA
Message-ID: <CACpmpofdoeVbbw7izCDeJ7eS+XpWj+3sp3teKEQWywyRB75jYQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/8] Batched zswap_store() with compression batching
To: Yosry Ahmed <yosry@kernel.org>
Cc: hannes@cmpxchg.org, nphamcs@gmail.com, chengming.zhou@linux.dev, 
	akpm@linux-foundation.org, linux-mm@kvack.org, herbert@gondor.apana.org.au, 
	davem@davemloft.net, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rientjes@google.com, willy@infradead.org, 
	senozhatsky@chromium.org, 
	"Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 3:04=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Thu, Oct 15, 2026 at 3:00=E2=80=AFPM Kanchana P. Sridhar
> <kanchanapsridhar2026@gmail.com> wrote:
> >
> > On Wed, Oct 14, 2026 at 8:45=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> =
wrote:
> > >
> > > On Thu, Oct 08, 2026 at 11:28:06AM -0700, Kanchana P. Sridhar wrote:
> > > > v1: Batched zswap_store() with compression batching
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > > >
> > > > This series is a spin-off of "v14: zswap compression batching with =
optimized
> > > > iaa_crypto driver" [1], and focuses on the generic crypto_acomp and=
 zswap
> > > > compression batching enablers. Resuming work on this series followi=
ng a gap
> > > > since v14 (January 2026). Please note that my email address and aff=
iliation have
> > > > changed from kanchana.p.sridhar@intel.com to kanchanapsridhar2026@g=
mail.com. I
> > > > have retained the original Intel sign-offs on prior patches for his=
torical
> > > > attribution while signing off v1 of this series with my current add=
ress.
> > > >
> > > > To summarize the main contribution of this patch series: Batching i=
s introduced
> > > > in zswap_store() of large folios: we carve out a large folio into b=
atches of
> > > > ZSWAP_MAX_BATCH_SIZE (8 pages) for software compressors, and store =
each
> > > > batch. Moving the fundamental operations that need to be happen to =
store a page
> > > > to now work at the granularity of a batch offers opportunities to o=
ptimize them
> > > > from these perspectives:
> > > >
> > > > 1) Utilize existing kernel API that minimize obtaining locks for bu=
lk
> > > >    operations, e.g. kmem_cache_alloc_bulk()/kmem_cache_free_bulk().
> > > >
> > > > 2) We keep the working set for each of the core store functionaliti=
es (alloc
> > > >    entries, compress pages, store pages in zsmalloc) to be focused =
on a
> > > >    batch, thereby minimizing cache evictions and benefiting from ca=
che
> > > >    locality.
> > > >
> > > > 3) Along the lines of (1), the main zswap_compress() batching routi=
ne obtains
> > > >    the acomp_ctx mutex lock once per batch, and releases it after i=
t has
> > > >    processed all pages in that batch.
> > > >
> > > > 4) Any zswap store functionality that works on a batch can potentia=
lly be
> > > >    parallelized as a next step, to further improve performance.
> > > >
> > > > Performance data: usemem with 60% over-commit:
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > > How much of the performance benefits come from patch 6 vs patch 8?
> >
> > This is how the performance changes: Average throughput is averaged
> > from 10 iterations of usemem.
> >
> > patch 6: 19,119 KB/s
> > patch 8: 17,593 KB/s
> >
> > So the acomp_do_req_chain() path that ZSTD goes through with patch 8
> > causes a regression, even though it provides a generic batching
> > framework in acomp.
> >
> > I was able to retrieve performance with the following change in acompre=
ss.c:
>
> Why add it to begin with in this case?

Patch 3 ("crypto: acomp - Add trivial segmentation wrapper.") was
co-developed with Herbert. The request chaining for non-segmentation
algorithms was as in Herbert's original implementation. Since this
causes a regression, I would like to get Herbert's Ok on replacing the
request chaining in this part of crypto_acomp_compress().

>
> >
> > patch 3 with this change in acompress.c: 19,578 KB/s
> >
> > diff --git a/crypto/acompress.c b/crypto/acompress.c
> > index 192ea996e779..dc609bd7d927 100644
> > --- a/crypto/acompress.c
> > +++ b/crypto/acompress.c
> > @@ -293,8 +293,12 @@ int crypto_acomp_compress(struct acomp_req *req)
> >                 return -EAGAIN;
> >
> >         if (likely(req->unit_size && acomp_request_issg(req))) {
> > -               if (!crypto_acomp_req_seg(tfm))
> > -                       return acomp_do_req_chain(req, true);
> > +               if (!crypto_acomp_req_seg(tfm)) {
> > +                       int err =3D tfm->compress(req);
> > +
> > +                       req->dst->length =3D unlikely(err) ? err : req-=
>dlen;
> > +                       return err;
> > +               }
> >
> >                 return tfm->compress(req);
> >         }
> >
> > Herbert, would you be Ok with this change in patch 3?
