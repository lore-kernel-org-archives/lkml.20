Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D227145B27
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 21:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791406900; cv=none; b=mvTjd4HRttlv7I7gsTZpW4pVptzTWtYg2uXQiSSZstKyKmQjV7x9AVH2Khe+a26bCLvkLFCU1dZUUo01AN38WYHObP0jc5+XacS1Vri0LqrrFoq5JPESQfqd3yLQJrhaSWZN01L1dg4VY12oe7aoehWUPSARS0C1ZVGVhyhsHEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791406900; c=relaxed/simple;
	bh=8HPJDyiKhsXIzNGyG0hMmFP8uRPaOwyMFiTRNLPOQM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GxgHtGVTJPJ/kWm6lKn1tx0FNn/gJqnDk73uFA772Md9A4k3VC3i7U1uBytZC6Ah/ioKugB/teduwu4G85LLfRCJMUjyS9dSGzDgC7r9bMTNUHpcfX3XKdt0OYuGHnfAGLBjhpcU8p82yYEbhAiUdJXRvBsgmelbaUrEQd8gjfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hIcDg1uc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hIcDg1uc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423E91F0089D
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 21:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791406899;
	bh=dl16HxAgUL00IPU8ek1WsOB+q1DZ4i3Hue7YA0SIFcI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hIcDg1ucpxd0ocFqloDfr863lapn+psrW4MYxKrAHkZ1vytjZeHhPcBDzBq4OFI5e
	 9cVp0/WrnYh/010NUuJ11quYedmT+iNh2K6C8cErd5drBE2o40kaXya+eC08yNoBfC
	 StecFxI0+OY6tk2ywGygEwGAQoulOSdh8UVPiwBM1ZW69XpUrKSGJ80US+j/6mv9TJ
	 NXe/OirguGaeVP9V01rOnexehkFD2WbkHgyE+NJHSQ/gBd2tWBumYcQ11Xu/iSJb15
	 Ea2NX8ELwbrY4MIbWMJ6ueveuRhEkjzkKk5hVKbtY7WWGM8HbvhI48w0MgKKfdTMH9
	 dS2GIkY91/GmQ==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c169ae1cb26so7387466b.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 14:01:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw2GBPy33+L+5ww3NcAIa1E0aHvFd25D1IATfru2BoxkGnVqGAjXaSn8bHk5wUNlgcSjhLn5BbmfPd0X70=@vger.kernel.org
X-Gm-Message-State: AFuF++kg50Y/0npI+Q+Vdr62H8UFLnsKM1rirEFU+1Fxo8/QeG57jbcU
	PYcpvVXSDxjMnwSm0X5vM9Eq0pHQ82OJdsNJ9WBV2sMO4yAWZVkfJqNA4cv3G9Sw0fRxQMA1nBs
	uYypKgDCc81TrHgsxCbtw9egwGuzAv/Y=
X-Received: by 2002:a17:907:c318:b0:c29:4b57:503e with SMTP id
 a640c23a62f3a-c3191980358mr35259566b.1.1791406897277; Wed, 07 Oct 2026
 14:01:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006002307.2669023-1-usama.arif@linux.dev> <20261006002307.2669023-2-usama.arif@linux.dev>
In-Reply-To: <20261006002307.2669023-2-usama.arif@linux.dev>
From: Yosry Ahmed <yosry@kernel.org>
Date: Wed, 7 Oct 2026 14:01:25 -0700
X-Gmail-Original-Message-ID: <CAO9r8zPm4B1_wtAUMeSR9PQ5ja+kJz14Ub7MCuJit_NSH2DQsQ@mail.gmail.com>
X-Gm-Features: AclHuK-Q3mzr7L7OrxFyQiTbmZzxOuADEUhJwA1scGB8YD5sCzYWMRoQUzHZsT8
Message-ID: <CAO9r8zPm4B1_wtAUMeSR9PQ5ja+kJz14Ub7MCuJit_NSH2DQsQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: zswap: use separate compression and decompression requests
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, chengming.zhou@linux.dev, dsterba@suse.com, 
	hannes@cmpxchg.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	nphamcs@gmail.com, terrelln@fb.com, riel@surriel.com, shakeel.butt@linux.dev, 
	alex@ghiti.fr, senozhatsky@chromium.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 5:23=E2=80=AFPM Usama Arif <usama.arif@linux.dev> wr=
ote:
>
> Stores and loads serialize on the same per-CPU acomp request and mutex.
> A low-priority store can be preempted as soon as the compressor drops
> its stream lock, while it still holds the mutex. A higher-priority load
> on that CPU then waits until the store runs again, which can take a
> long time when other tasks are runnable.
>
> Give compression and decompression their own request, completion wait
> and mutex. Since commit e2c3b6b21c77f ("mm: zswap: use SG list
> decompression APIs from zsmalloc"), the per-CPU buffer is only used for
> compression. The two requests can share the per-CPU transform: no
> in-tree implementation modifies transform state while (de)compressing,
> and shared codec state has its own locking.

I am a bit uncomfortable with this. If future changes modify the
transform state while (de)compressing, it may result in nasty bugs.

As for the buffer, I would also prefer some protection, but I feel
less strongly about this. For example, we can put it inside
zswap_acomp_req and not initialize it for the decompression request.
Alternatively, we can have an intermediary struct that contains
zswap_acomp_req + buffer, and use that for the compression request.

> Loads can still wait for
> each other on the decompression mutex, and stores still serialize on
> the compression mutex.
>
> This follows the proposal from Sergey Senozhatsky for the same split
> for zram [1].
>
> [1] https://lore.kernel.org/all/20261005122036.718976-10-senozhatsky@chro=
mium.org/
>
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---
>  mm/zswap.c | 89 +++++++++++++++++++++++++++++++-----------------------
>  1 file changed, 52 insertions(+), 37 deletions(-)
>
> diff --git a/mm/zswap.c b/mm/zswap.c
> index ae19e301fced7..54187b1ef751d 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -137,14 +137,20 @@ bool zswap_never_enabled(void)
>  * data structures
>  **********************************/
>
> -struct crypto_acomp_ctx {
> -       struct crypto_acomp *acomp;
> +struct zswap_acomp_req {
>         struct acomp_req *req;
>         struct crypto_wait wait;
> -       u8 *buffer;
>         struct mutex mutex;
>  };
>
> +/* Separate requests, so that decompression does not wait for compressio=
n. */
> +struct crypto_acomp_ctx {
> +       struct crypto_acomp *acomp;
> +       struct zswap_acomp_req comp;
> +       struct zswap_acomp_req decomp;
> +       u8 *buffer;
> +};
> +
>  /*
>   * The lock ordering is zswap_tree.lock -> zswap_pool.lru_lock.
>   * The only case where lru_lock is not acquired while holding tree.lock =
is
> @@ -270,14 +276,10 @@ static void acomp_ctx_free(struct crypto_acomp_ctx =
*acomp_ctx)
>         if (!acomp_ctx)
>                 return;
>
> -       /*
> -        * If there was an error in allocating @acomp_ctx->req, it
> -        * would be set to NULL.
> -        */
> -       if (acomp_ctx->req)
> -               acomp_request_free(acomp_ctx->req);
> -
> -       acomp_ctx->req =3D NULL;
> +       acomp_request_free(acomp_ctx->comp.req);
> +       acomp_ctx->comp.req =3D NULL;
> +       acomp_request_free(acomp_ctx->decomp.req);
> +       acomp_ctx->decomp.req =3D NULL;
>
>         /*
>          * We have to handle both cases here: an error pointer return fro=
m
> @@ -796,6 +798,28 @@ static void zswap_entry_free(struct zswap_entry *ent=
ry)
>  /*********************************
>  * compressed storage functions
>  **********************************/
> +static int zswap_acomp_req_init(struct zswap_acomp_req *areq,
> +                               struct crypto_acomp *acomp)
> +{
> +       /* acomp_request_alloc() returns NULL in case of an error. */
> +       areq->req =3D acomp_request_alloc(acomp);
> +       if (!areq->req)
> +               return -ENOMEM;
> +
> +       crypto_init_wait(&areq->wait);
> +
> +       /*
> +        * if the backend of acomp is async zip, crypto_req_done() will w=
akeup
> +        * crypto_wait_req(); if the backend of acomp is scomp, the callb=
ack
> +        * won't be called, crypto_wait_req() will return without blockin=
g.
> +        */
> +       acomp_request_set_callback(areq->req, CRYPTO_TFM_REQ_MAY_BACKLOG,
> +                                  crypto_req_done, &areq->wait);
> +
> +       mutex_init(&areq->mutex);
> +       return 0;
> +}
> +
>  static int zswap_cpu_comp_prepare(unsigned int cpu, struct hlist_node *n=
ode)
>  {
>         struct zswap_pool *pool =3D hlist_entry(node, struct zswap_pool, =
node);
> @@ -827,25 +851,13 @@ static int zswap_cpu_comp_prepare(unsigned int cpu,=
 struct hlist_node *node)
>                 goto fail;
>         }
>
> -       /* acomp_request_alloc() returns NULL in case of an error. */
> -       acomp_ctx->req =3D acomp_request_alloc(acomp_ctx->acomp);
> -       if (!acomp_ctx->req) {
> +       if (zswap_acomp_req_init(&acomp_ctx->comp, acomp_ctx->acomp) ||
> +           zswap_acomp_req_init(&acomp_ctx->decomp, acomp_ctx->acomp)) {
>                 pr_err("could not alloc crypto acomp_request %s\n",
>                        pool->tfm_name);
>                 goto fail;
>         }
>
> -       crypto_init_wait(&acomp_ctx->wait);
> -
> -       /*
> -        * if the backend of acomp is async zip, crypto_req_done() will w=
akeup
> -        * crypto_wait_req(); if the backend of acomp is scomp, the callb=
ack
> -        * won't be called, crypto_wait_req() will return without blockin=
g.
> -        */
> -       acomp_request_set_callback(acomp_ctx->req, CRYPTO_TFM_REQ_MAY_BAC=
KLOG,
> -                                  crypto_req_done, &acomp_ctx->wait);
> -
> -       mutex_init(&acomp_ctx->mutex);
>         return 0;
>
>  fail:
> @@ -866,14 +878,15 @@ static bool zswap_compress(struct folio *folio, lon=
g index,
>         bool mapped =3D false;
>
>         acomp_ctx =3D raw_cpu_ptr(pool->acomp_ctx);
> -       mutex_lock(&acomp_ctx->mutex);
> +       mutex_lock(&acomp_ctx->comp.mutex);
>
>         dst =3D acomp_ctx->buffer;
>         sg_init_table(&input, 1);
>         sg_set_folio(&input, folio, PAGE_SIZE, index * PAGE_SIZE);
>
>         sg_init_one(&output, dst, PAGE_SIZE);
> -       acomp_request_set_params(acomp_ctx->req, &input, &output, PAGE_SI=
ZE, dlen);
> +       acomp_request_set_params(acomp_ctx->comp.req, &input, &output,
> +                                PAGE_SIZE, dlen);
>
>         /*
>          * it maybe looks a little bit silly that we send an asynchronous=
 request,
> @@ -885,10 +898,12 @@ static bool zswap_compress(struct folio *folio, lon=
g index,
>          * existing method to send the second page before the first page =
is done
>          * in one thread doing zswap.
>          * but in different threads running on different cpu, we have dif=
ferent
> -        * acomp instance, so multiple threads can do (de)compression in =
parallel.
> +        * acomp instance, and compression and decompression use separate
> +        * requests, so multiple threads can do (de)compression in parall=
el.
>          */
> -       comp_ret =3D crypto_wait_req(crypto_acomp_compress(acomp_ctx->req=
), &acomp_ctx->wait);
> -       dlen =3D acomp_ctx->req->dlen;
> +       comp_ret =3D crypto_wait_req(crypto_acomp_compress(acomp_ctx->com=
p.req),
> +                                  &acomp_ctx->comp.wait);
> +       dlen =3D acomp_ctx->comp.req->dlen;
>
>         /*
>          * If a page cannot be compressed into a size smaller than PAGE_S=
IZE,
> @@ -932,7 +947,7 @@ static bool zswap_compress(struct folio *folio, long =
index,
>         else if (alloc_ret)
>                 zswap_reject_alloc_fail++;
>
> -       mutex_unlock(&acomp_ctx->mutex);
> +       mutex_unlock(&acomp_ctx->comp.mutex);
>         return comp_ret =3D=3D 0 && alloc_ret =3D=3D 0;
>  }
>
> @@ -948,7 +963,7 @@ static bool zswap_decompress(struct zswap_entry *entr=
y, struct folio *folio)
>                 return false;
>
>         acomp_ctx =3D raw_cpu_ptr(pool->acomp_ctx);
> -       mutex_lock(&acomp_ctx->mutex);
> +       mutex_lock(&acomp_ctx->decomp.mutex);
>         zs_obj_read_sg_begin(pool->zs_pool, entry->handle, input, entry->=
length);
>
>         /* zswap entries of length PAGE_SIZE are not compressed. */
> @@ -965,15 +980,15 @@ static bool zswap_decompress(struct zswap_entry *en=
try, struct folio *folio)
>         } else {
>                 sg_init_table(&output, 1);
>                 sg_set_folio(&output, folio, PAGE_SIZE, 0);
> -               acomp_request_set_params(acomp_ctx->req, input, &output,
> +               acomp_request_set_params(acomp_ctx->decomp.req, input, &o=
utput,
>                                          entry->length, PAGE_SIZE);
> -               ret =3D crypto_acomp_decompress(acomp_ctx->req);
> -               ret =3D crypto_wait_req(ret, &acomp_ctx->wait);
> -               dlen =3D acomp_ctx->req->dlen;
> +               ret =3D crypto_acomp_decompress(acomp_ctx->decomp.req);
> +               ret =3D crypto_wait_req(ret, &acomp_ctx->decomp.wait);
> +               dlen =3D acomp_ctx->decomp.req->dlen;
>         }
>
>         zs_obj_read_sg_end(pool->zs_pool, entry->handle);
> -       mutex_unlock(&acomp_ctx->mutex);
> +       mutex_unlock(&acomp_ctx->decomp.mutex);
>
>         if (!ret && dlen =3D=3D PAGE_SIZE)
>                 return true;
> --
> 2.53.0-Meta
>
