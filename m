Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA7941DE0D
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 21:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791408542; cv=none; b=IQYZx4LH2ofc2GYk9UXT/UXIEApEEkcSfifXeCxnVJ6cpy1C60ppET4eXT1ai+S6/yPmXzUEnfSMrm6G/CIYOzWNdByQem4mrVTx4uexvAHWKbCEEwYNBjNh2c0iv6uyFNgt9XngnL5k+R0R1SUZwt0x/2zDyF1PVSGlThyVZic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791408542; c=relaxed/simple;
	bh=0DwTmndYdJjNXPOp8UGa7UIyjN1P6k+JD9+MviZcJHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V7h6VAVpYXRQjHu++GPcMCg70wr+mHSGg5Ck0ShL6XAmfVL6hh82cM3qguApoUitlXY2s9U/oSzgik2c5gvBGTtuGkRE8lEhOqqz4Omb0yk0bdfMacJtAXxn5zqCk80adM1wC0WbYF66w8YamkM2WXDJlzNnWOGIVmIGHLUM0RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eOAzyudq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eOAzyudq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D0141F0089E
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 21:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791408540;
	bh=s296vYmHTM5Jn/CKCey80EK1fXozhN0ctKiQiBSlM1U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eOAzyudqWomGLlailMZVr3oqTsWY9oP6xg4uzx+MDFQ+f3+PKpunCzofnY4ibLHEm
	 meHKtruzMQhR+qQYPxrFTXnXtZdEMPzupIdP3CKMb9MAAma03wgYv+DqmOn35nkjgK
	 Z/Od6owg7rDUCo4TMItT53ZbPQ14EMciB+IKEAshNGw9wGgoPlYECK6LP0vXnWXXU+
	 Wfy8hVIauH6ll2ryWcraljA/J+ut7pOo5drFR5xiRJsdOglZHs8ox1wVmo0ZrDLnDa
	 aGb+sbgcm91Nar5Lu5vtOolS0rib3cHTBWz6keA4C1rOS6eCpNbMJMPoWPlMK9Epff
	 71mfqlE93+tmw==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2acc1e170cso375258066b.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 14:29:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwjdnbxVBAJACWCjQbWQuzy+dKQvdgGXRa5kO3OrvXTwg+63Thb79hU0qHf8/iqveITdO+YOjolrhNeYxQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n8oxtTXE0nS+0lhH++DHnARbNJd50KB79cdmuCimRjulGqzsm4
	EmjvKWW9N3KTHVf9jMaTVQwAUt6Zou6Oux+a9k1RPbh8/vBdkXGidno6Z8DOJFex6D2+WlR5lDR
	pqwukWKBIuMPzBvgT+mzBsb8vD4K/mag=
X-Received: by 2002:a17:907:8688:b0:c29:f5d8:9c70 with SMTP id
 a640c23a62f3a-c317c0cf7d5mr393488466b.31.1791408539228; Wed, 07 Oct 2026
 14:28:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006002307.2669023-1-usama.arif@linux.dev> <20261006002307.2669023-3-usama.arif@linux.dev>
In-Reply-To: <20261006002307.2669023-3-usama.arif@linux.dev>
From: Yosry Ahmed <yosry@kernel.org>
Date: Wed, 7 Oct 2026 14:28:47 -0700
X-Gmail-Original-Message-ID: <CAO9r8zMFm+JsboodgkG-jdQ9eTk+JHo=d-3Dw8PUcEqjr3+xVg@mail.gmail.com>
X-Gm-Features: AclHuK-5R4r0YHsSTZUcRih_AIGrvnyYGURQcJJzjQGiBpSeuJP90nRuJBZ24Lc
Message-ID: <CAO9r8zMFm+JsboodgkG-jdQ9eTk+JHo=d-3Dw8PUcEqjr3+xVg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm: zswap: use stack requests for synchronous decompression
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
> With separate requests for compression and decompression, loads still
> serialize on the per-CPU decompression mutex. A low-priority load that
> is preempted after the codec drops its stream lock keeps holding the mute=
x
> and stalls every other load on that CPU, including higher-priority ones.
>
> Synchronous algorithms whose requests need no extra context can use an
> on-stack request, so decompress with one and take no zswap lock. All
> in-tree software compressors qualify. Asynchronous algorithms, and
> synchronous ones with request context, keep the per-CPU request and
> mutex, which is still taken before the zsmalloc read lock.
>
> Reading the per-CPU context without the mutex is safe. Since
> commit ef3c0f6cb798e ("mm: zswap: tie per-CPU acomp_ctx lifetime to the
> pool"), it is set up before its CPU comes online and is not torn down
> until the pool is destroyed. The codecs keep their own stream locks, and
> crypto_acomp_decompress() rejects on-stack requests only for
> asynchronous transforms, which never take this path.
>
> For software compressors this drops the heap request added by the
> previous patch. The on-stack request and wait take 216 bytes, which
> makes the load path about 270 bytes deeper on x86-64. Asynchronous
> algorithms pay this too.
>
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---
>  mm/zswap.c | 65 +++++++++++++++++++++++++++++++++++++-----------------
>  1 file changed, 45 insertions(+), 20 deletions(-)
>
> diff --git a/mm/zswap.c b/mm/zswap.c
> index 54187b1ef751d..7e7fb6e7ec24c 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -147,7 +147,7 @@ struct zswap_acomp_req {
>  struct crypto_acomp_ctx {
>         struct crypto_acomp *acomp;
>         struct zswap_acomp_req comp;
> -       struct zswap_acomp_req decomp;
> +       struct zswap_acomp_req decomp;  /* unused by synchronous algorith=
ms */
>         u8 *buffer;
>  };
>
> @@ -851,15 +851,20 @@ static int zswap_cpu_comp_prepare(unsigned int cpu,=
 struct hlist_node *node)
>                 goto fail;
>         }
>
> -       if (zswap_acomp_req_init(&acomp_ctx->comp, acomp_ctx->acomp) ||
> -           zswap_acomp_req_init(&acomp_ctx->decomp, acomp_ctx->acomp)) {
> -               pr_err("could not alloc crypto acomp_request %s\n",
> -                      pool->tfm_name);
> -               goto fail;
> +       if (zswap_acomp_req_init(&acomp_ctx->comp, acomp_ctx->acomp))
> +               goto req_fail;
> +
> +       /* Synchronous algorithms decompress with an on-stack request. */
> +       if (acomp_is_async(acomp_ctx->acomp) ||
> +           crypto_acomp_reqsize(acomp_ctx->acomp) > MAX_SYNC_COMP_REQSIZ=
E) {

Where does the requirement on crypto_acomp_reqsize() come from? I see
crypto_acomp_compress() and crypto_acomp_decompress() only checking
acomp_is_async().

Regardless, these are crypto-specific details that shouldn't be
checked directly by zswap. Ideally we'd have something like
acomp_can_use_stack_req() or something.

Also, could you please CC Herbert on future iterations? I would like
to get his eyes on any crypto-related changes if possible.

> +               if (zswap_acomp_req_init(&acomp_ctx->decomp, acomp_ctx->a=
comp))
> +                       goto req_fail;
>         }
>
>         return 0;
>
> +req_fail:
> +       pr_err("could not alloc crypto acomp_request %s\n", pool->tfm_nam=
e);
>  fail:
>         acomp_ctx_free(acomp_ctx);
>         return ret;
> @@ -951,19 +956,14 @@ static bool zswap_compress(struct folio *folio, lon=
g index,
>         return comp_ret =3D=3D 0 && alloc_ret =3D=3D 0;
>  }
>
> -static bool zswap_decompress(struct zswap_entry *entry, struct folio *fo=
lio)
> +static bool __zswap_decompress(struct zswap_entry *entry,
> +                              struct zswap_pool *pool, struct acomp_req =
*req,
> +                              struct crypto_wait *wait, struct folio *fo=
lio)
>  {
> -       struct zswap_pool *pool =3D zswap_entry_pool(entry);
>         struct scatterlist input[2]; /* zsmalloc returns an SG list 1-2 e=
ntries */
>         struct scatterlist output;
> -       struct crypto_acomp_ctx *acomp_ctx;
>         int ret =3D 0, dlen;
>
> -       if (WARN_ON_ONCE(!pool))
> -               return false;
> -
> -       acomp_ctx =3D raw_cpu_ptr(pool->acomp_ctx);
> -       mutex_lock(&acomp_ctx->decomp.mutex);
>         zs_obj_read_sg_begin(pool->zs_pool, entry->handle, input, entry->=
length);
>
>         /* zswap entries of length PAGE_SIZE are not compressed. */
> @@ -980,15 +980,14 @@ static bool zswap_decompress(struct zswap_entry *en=
try, struct folio *folio)
>         } else {
>                 sg_init_table(&output, 1);
>                 sg_set_folio(&output, folio, PAGE_SIZE, 0);
> -               acomp_request_set_params(acomp_ctx->decomp.req, input, &o=
utput,
> -                                        entry->length, PAGE_SIZE);
> -               ret =3D crypto_acomp_decompress(acomp_ctx->decomp.req);
> -               ret =3D crypto_wait_req(ret, &acomp_ctx->decomp.wait);
> -               dlen =3D acomp_ctx->decomp.req->dlen;
> +               acomp_request_set_params(req, input, &output, entry->leng=
th,
> +                                        PAGE_SIZE);

Just use a single line :)

> +               ret =3D crypto_acomp_decompress(req);
> +               ret =3D crypto_wait_req(ret, wait);
> +               dlen =3D req->dlen;
>         }
>
>         zs_obj_read_sg_end(pool->zs_pool, entry->handle);
> -       mutex_unlock(&acomp_ctx->decomp.mutex);
>
>         if (!ret && dlen =3D=3D PAGE_SIZE)
>                 return true;
> @@ -1002,6 +1001,32 @@ static bool zswap_decompress(struct zswap_entry *e=
ntry, struct folio *folio)
>         return false;
>  }
>
> +static bool zswap_decompress(struct zswap_entry *entry, struct folio *fo=
lio)
> +{
> +       struct zswap_pool *pool =3D zswap_entry_pool(entry);
> +       struct crypto_acomp_ctx *acomp_ctx;
> +       bool ret;
> +
> +       if (WARN_ON_ONCE(!pool))
> +               return false;
> +
> +       acomp_ctx =3D raw_cpu_ptr(pool->acomp_ctx);

We probably want a comment here explaining the two possible paths?

> +       if (!acomp_ctx->decomp.req) {
> +               ACOMP_REQUEST_ON_STACK(req, acomp_ctx->acomp);
> +               DECLARE_CRYPTO_WAIT(wait);
> +
> +               acomp_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLO=
G,
> +                                          crypto_req_done, &wait);

I would rather add a wrapper for this (e.g.
zswap_set_acomp_req_callback()) to avoid the mental toil of checking
that we are passing in the same things as zswap_cpu_comp_prepare().


> +               return __zswap_decompress(entry, pool, req, &wait, folio)=
;

Hmm would it be more readable if we create a dummy zswap_acomp_req
object here and have __zswap_decompress() take in __zswap_decompress
instead of taking in the req and wait separately?

> +       }
> +
> +       mutex_lock(&acomp_ctx->decomp.mutex);
> +       ret =3D __zswap_decompress(entry, pool, acomp_ctx->decomp.req,
> +                                &acomp_ctx->decomp.wait, folio);
> +       mutex_unlock(&acomp_ctx->decomp.mutex);
> +       return ret;
> +}
> +
>  /*********************************
>  * writeback code
>  **********************************/
> --
> 2.53.0-Meta
>
