Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793359051;
	b=Q4lNkW9TQi/lBXnP+hYwnMwy7P0slZNDm8e2x6N83Sj1P+P5/HTbo9QOXcqZPH/+NS0P
	 NraUrUBA+wXw/JOYppUt0a8b08fF2aE2kQQn/GmFJyguINW3QVwIaOCDWrtloBLJu3Vva
	 WtWq1Tf8FqZH9AgiQfZkma46Qodh+vvz+PfyCXlujMlm+vwRRcXWGHr52swq9ph8WXKD/
	 s20ndhQ/7EylvEsktleFw2ysu8p6QKG5YLfkHlu8MOHShu4SP30qhhdoahKHVdJIjBBY9
	 RKuCOA5uxiHUeFj1IJRreCFk3hZBJMEsYk5ckcbr/C5G/aOXbB2aFdalE7nPmS+gO2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nsvpoCq67ikFM43Za6bLeWpM8Cql/+fjWhbCUzkmcmg=;
	b=b8UBiM9JXHMyKum9zwrV8idxk6nyI/vejbFz1VUtqPU1T41MLp72p8vVVV6LQ7oro13H
	 xHzhYRE1/GdvfDGTMcK9Z8b+cREW72des3Bfo3e2T0ue8nrSmqTjwNoD9Feh4W65MwqE0
	 Rih+YnLT7XpfjE12AktBg4hlWs6n+5S82jBjWhQytdBOQqwlgZGc94HXEeEOTkLF2Efpu
	 bVQO+dx2Kx7ukUb8fuzdR52EuSA+rVnTcFdAoeERqmcNqBILQVEpPjTguo8ZQAkidD01v
	 Zq/5jlC6TfXK9zhHCuQgMBENd/YIzqRtx81ssrl8jFfBfQ+yfnci55rmD9Qr1ndIEcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0QUesskK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69AE606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D69AE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0QUesskK
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c450ab1483cso89270866b.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:17:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793359049; cv=none;
        d=google.com; s=arc-20260327;
        b=goxR7VGDhm0rNYuBpgTlWiMWT/whz0JMD4Pv5c9JS3SkBPvEbwEMQOBEzZCty07o5B
         vqrVyvzo5NIFt18dnjMxVxg5MamE+IcKtkAIdK6UJdPmelsIJNQoN/a1MUKhirj0rNB6
         y4awAPKxl9Wigu23Lx+hBZ10AKdhslHU0FZ3QaS6H4vDhUnVaC6hrqpQUj57rQjwwQgM
         SQClEm8DNPjFCtFHWF/Q808Nj2l1V3xQ7Oj3AMapYjf9XVxy4TOmkO5EACRwYZ48J+zD
         XGv7nHoQkMEOmgWlTVMD9LA/BJblkoXpWKEoDG5i+oCsR8d7Zr/SxPn6ZZ0SVrgMUWWf
         Eu6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nsvpoCq67ikFM43Za6bLeWpM8Cql/+fjWhbCUzkmcmg=;
        fh=D4Op4sWcTtGQXYm6qVcrbssXwrp4WEN72PDiB74YSrg=;
        b=i0x9dOZICrEGmgf09Qu+gW2+vLmsrKUP1P9ehDzgAwJnn2Jw+ea6FAl0HrogzDUvYH
         7mDA5KGMzay6R1tGJkIznWmePlwrAVjNO1Cd9GjqTDLI661vTRr86/AetvlnqDR9CiaJ
         xuwbLck2X+eKpDCcZEkFgOOKb34UVZjIDCPBiKtdejr+/2N+bnQuoRjWGwlC0ExV0N2W
         T8efvI8nq06E2qh1rvhHJmJZqRdAen8voYKM0WYkuQ55l/P8kBRTYoH5jMjOg9uLReNm
         Q+Pq4NQMfV6PXOqcbdvMhaEyeEwK2Edi8lj3+I+7Qkqi4PClD1bo1+ODDhkEp5RStTYB
         BYKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793359049; x=1793963849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nsvpoCq67ikFM43Za6bLeWpM8Cql/+fjWhbCUzkmcmg=;
        b=0QUesskKIbNE42V8Lm5Dz2G0L661BUJ68WsiKSvugwGJOHOmG4f+wIy1Rt+OKunnQ6
         puS5eKD7oYAlqrV+6Qj813kOw0aanp3D67FypIh/X0ixj5BdMY/ZwAXIfpHndOY2vjdB
         oxs848HDNgw5uOGa/gRbwTwPHIXzPXKN7R6V6e9kxtZtUHhUCRXceaImZg+1JLiIqw0p
         mzCXFIbjTQdhtZRXoWYStv6Dd+ph+4tcqgdW0LEj7mOXqD0TOtfo/vwBsvWrvl4IkblF
         4f7Qv8URbgbM+9sNcx+CBdyv90cxWn5IcrCFpMFdTrU+K25asJOfnhpQjK2z29b6HYDW
         7t9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793359049; x=1793963849;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nsvpoCq67ikFM43Za6bLeWpM8Cql/+fjWhbCUzkmcmg=;
        b=BurT1YCnS8Njtv1jLbynuFAXa1qbTn1pDQj4lichziJ6KyKWZSLB4nOJsAkqxjZ5Yn
         2WSHHoiPt7aAGskjWHphub9XEYaHrAjwuEtQl5tMc4n/Vh1DbeLguc1h4R+EWV6886qf
         85eycA6dXIjzV8BE8UngQGXJG9LMehQx/HXdtp8aMK0z27zrSmi4uG9i5tWygn7g3M7Q
         9kQ7cU/4zX/ATi9rm82XWzbnxyNdtjsSQ6ujo3nCE3mCpptEfcEQsZqMXtpUfXdPhpmD
         sDQEh3ocT+4WnowlBieRV4JPG3pJ95P5VgboZb4kWQ/3JPpkRXiiwqAo0cLSs9xIzOh+
         7aug==
X-Forwarded-Encrypted: i=1; AKwUvBznCqnLo5W8GEIX0PnCH8GzFnPktHGmrTPaiMN7OXUnpKSBfzGxsFp2g5kqgbw0nubEjHW8IGloEDw84f0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzbze4Uxcclom5pD67GH7pRsdAXxi8WlxgQwjFgnf/BgwJ/R81
	Lgx24oT234gxpkwHV++OUmzUcAp+BfdND6sp8iiCXkdmLyGQHyKmEzsuITjoOTsrdY+fHaIYHMQ
	mrx8O8O/CEcvWpSr0NI8iW9biXK7SBlI=
X-Gm-Gg: AYBFou1khiod54ieXT9eosgI5nAlJeNeY20HO1bNaw+4yAutq8X3hNheD6xAqMIGL8n
	sTC6sxPsfqYKeP9XEKk4aOkthSkEHr3gVIz5fc14TFzLFrVmDuwjWrDGGF6Bd9McuKAHYeCM/hX
	mq9iA2iMSRf3qlTBIJG3zSa4J/FcE6Fxr2sUJlV221XHBF1JlOtwzQwsLl6c44iptTvK+ic27Tz
	eKzozZraIqJTml7uWWMwaFspbwvfIABSJLiu2FjS9xo/VpUCViTYpSfeTus93BYKRc8JWyhyq8e
	HPxu8UqUyNor9BNRIh294d1z5AQA5RQS4BpeM2KD5/MB0Oqwm7EC6RFsr27+aJO/sGEbkYSOTXs
	ntWvRfTvl1dS5/jTpksNdR9xErzuO9/KIjahgaDFmWCPk50SbOj5kFWzwE2oGE3FWhcl/oQ==
X-Received: by 2002:a17:907:94c2:b0:c25:4f7c:8ec5 with SMTP id
 a640c23a62f3a-c4ca7a84587mr190103666b.23.1793359048873; Fri, 30 Oct 2026
 04:17:28 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-swap-fixes-v1-0-73f73a59f2fc@tencent.com>
 <20261030-swap-fixes-v1-2-73f73a59f2fc@tencent.com> <auOz00OGB_8dgniC@cmpxchg.org>
In-Reply-To: <auOz00OGB_8dgniC@cmpxchg.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 30 Oct 2026 19:16:51 +0800
X-Gm-Features: AclHuK_QtoyukUCJkCFO0WEKLkvtcn1cotvwCTndLO53R98gepDq_gXzXwzOz4k
Message-ID: <CAMgjq7BYgXLheXDyc=p2mNgxdP3+92v2WHGiXiweDrsiYQ0u2g@mail.gmail.com>
Subject: Re: [PATCH 2/3] mm/swap: account synchronous swap reads as memory stall
To: Johannes Weiner <hannes@cmpxchg.org>, Christoph Hellwig <hch@lst.de>
Cc: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Yosry Ahmed <yosry@kernel.org>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Usama Arif <usamaarif642@gmail.com>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chuanhua Han <hanchuanhua@oppo.com>, 
	Mani Tofigh <mt4022@columbia.edu>, linux-kernel@vger.kernel.org, 
	Josef Bacik <josef@toxicpanda.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 5:00=E2=80=AFAM Johannes Weiner <hannes@cmpxchg.org=
> wrote:
>
> On Fri, Oct 30, 2026 at 02:31:42AM +0800, Kairui Song via B4 Relay wrote:
> > From: Josef Bacik <josef@toxicpanda.com>
> >
> > Swap-ins from SWP_SYNCHRONOUS_IO devices such as zram are no longer
> > counted in PSI memory pressure or in the swapin and thrashing delays of
> > delay accounting.  Refaults of the workingset from zram, the main input
> > to userspace OOM handlers like lmkd and systemd-oomd on zram systems,
> > become invisible in /proc/pressure/memory.
> >
> > swap_read_folio() opens the accounting window with
> > psi_memstall_enter() and delayacct_swapin_start() and, per its comment,
> > means to count the submission time.  For synchronous devices the
> > submission is the entire read: swap_bdev_submit_read() does
> > submit_bio_wait() and completes the folio.  Since reads are batched in
> > a swap_iocb, swap_read_folio() only queues the folio with
> > swap_add_folio(), and the bio is submitted later by swap_read_submit()
> > in the caller, e.g. swapin_sync(), after the window has been closed.
> > By then the folio is uptodate and unlocked, so the fault does not wait
> > on the folio lock either and the read time is not counted anywhere.
> >
> > Found by code inspection; not reproduced.
> >
> > Fix by submitting synchronous reads from within swap_read_folio(), as
> > was done before the batching, rather than from the caller.  This gives
> > up batching of readahead for synchronous devices, which do their I/O
> > inline anyway, in exchange for keeping the accounting simple and in one
> > place.
> >
> > Fixes: dda8fb68b590 ("mm/swap: also use struct swap_iocb for block I/O"=
)
> > Assisted-by: LLM
> > Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> > Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> > Signed-off-by: Kairui Song <kasong@tencent.com>
>
> Hm, this isn't a complete fix to the problem described. IO throttling
> happens at submission time, so there can be significant delays on
> async devices too that are no longer tracked since the culprit change.

Yeah you are right! Thanks for the heads up, not only a sync isssue
indeed, async devices are affected too :(, throttled swap fault also
went unaccounted.

> How about keeping the accounting window open across the batch? Opens
> on first read, closes on submission. A batch with at least one
> workingset folio is "contaminated" and the whole sequence and
> submission becomes a stall. Would need to pull the !can_merge flush
> out of the batch-add function to get the accounting window right but
> that seems reasonable.

Won't this cause an amplified PSI reading if only one folio in a batch
is workingset? Maybe not a big issue though.

>
> Something like this:
>
> diff --git a/include/linux/swap_ops.h b/include/linux/swap_ops.h
> index 57ac6c703f68..6e45c9204482 100644
> --- a/include/linux/swap_ops.h
> +++ b/include/linux/swap_ops.h
> @@ -17,6 +17,10 @@ struct swap_iocb {
>  struct swap_io_ctx {
>         struct swap_iocb        *sio;
>         struct swap_info_struct *sis;
> +       bool                    in_batch;
> +       bool                    workingset;
> +       bool                    in_thrashing;
> +       unsigned long           in_memstall;
>  };
>
>  /*
> diff --git a/mm/page_io.c b/mm/page_io.c
> index c6824fcd483e..22e5ac1d298f 100644
> --- a/mm/page_io.c
> +++ b/mm/page_io.c
> @@ -197,6 +197,19 @@ static void swap_zeromap_folio_clear(struct folio *f=
olio)
>         swap_cluster_unlock(ci);
>  }
>
> +static bool swap_can_merge(struct swap_io_ctx *ctx, struct folio *folio,
> +               int rw)
> +{
> +       struct swap_info_struct *sis =3D __swap_entry_to_info(folio->swap=
);
> +       struct bio_vec *last_bv =3D &ctx->sio->bvecs[ctx->sio->nr_bvecs -=
 1];
> +       struct folio *prev_folio =3D bvec_folio(last_bv);
> +       size_t prev_folio_size =3D folio_size(prev_folio);
> +
> +       if (ctx->sis !=3D sis)
> +               return false;
> +       return sis->ops->can_merge(folio, prev_folio, prev_folio_size, rw=
);
> +}
> +
>  /*
>   * We may have stale swap cache pages in memory: notice
>   * them here and get rid of the unnecessary final write.
> @@ -218,6 +231,13 @@ int swap_writeout(struct swap_io_ctx *ctx, struct fo=
lio *folio)
>                 goto out_unlock;
>         }
>
> +       /*
> +        * Don't hold up a batch this folio can't join for the zero
> +        * check and possible compression. Submit it now.
> +        */
> +       if (ctx->sio && !swap_can_merge(ctx, folio, WRITE))
> +               swap_write_submit(ctx);
> +
>         /*
>          * Use the swap table zero mark to avoid doing IO for zero-filled
>          * folios. The zero mark is protected by the cluster lock, which =
is
> @@ -322,32 +342,15 @@ int sio_pool_init(void)
>         return 0;
>  }
>
> -static bool swap_can_merge(struct swap_io_ctx *ctx, struct folio *folio,
> -               int rw)
> -{
> -       struct swap_info_struct *sis =3D __swap_entry_to_info(folio->swap=
);
> -       struct bio_vec *last_bv =3D &ctx->sio->bvecs[ctx->sio->nr_bvecs -=
 1];
> -       struct folio *prev_folio =3D bvec_folio(last_bv);
> -       size_t prev_folio_size =3D folio_size(prev_folio);
> -
> -       if (ctx->sis !=3D sis)
> -               return false;
> -       return sis->ops->can_merge(folio, prev_folio, prev_folio_size, rw=
);
> -}
> -
> +/*
> + * Callers submit a pending batch that @folio can't join before adding
> + * it, see swap_writeout() and swap_read_folio().
> + */
>  static void swap_add_folio(struct swap_io_ctx *ctx, struct folio *folio,=
 int rw)
>  {
>         struct swap_info_struct *sis =3D __swap_entry_to_info(folio->swap=
);
>         struct swap_iocb *sio =3D ctx->sio;
>
> -       if (sio && !swap_can_merge(ctx, folio, rw)) {
> -               if (rw =3D=3D WRITE)
> -                       swap_write_submit(ctx);
> -               else
> -                       swap_read_submit(ctx);
> -               sio =3D ctx->sio;
> -       }
> -
>         if (!sio) {
>                 ctx->sis =3D sis;
>                 ctx->sio =3D sio =3D mempool_alloc(sio_pool, GFP_NOIO);
> @@ -460,42 +463,45 @@ void swap_read_folio(struct swap_io_ctx *ctx, struc=
t folio *folio)
>         struct swap_info_struct *sis =3D __swap_entry_to_info(folio->swap=
);
>         bool synchronous =3D sis->flags & SWP_SYNCHRONOUS_IO;
>         bool workingset =3D folio_test_workingset(folio);
> -       unsigned long pflags;
> -       bool in_thrashing;
>
>         VM_BUG_ON_FOLIO(!folio_test_swapcache(folio) && !synchronous, fol=
io);
>         VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
>         VM_BUG_ON_FOLIO(folio_test_uptodate(folio), folio);
>
> +       /*
> +        * Don't hold up a batch this folio can't join for its lookup
> +        * and possible decompression. Submit it now.
> +        */
> +       if (ctx->sio && !swap_can_merge(ctx, folio, READ))
> +               swap_read_submit(ctx);
> +
>         /*
>          * Count submission time as memory stall and delay. When the devi=
ce
>          * is congested, or the submitting cgroup IO-throttled, submissio=
n
> -        * can be a significant part of overall IO time.
> +        * can be a significant part of overall IO time. Reads are batche=
d
> +        * and submitted later, so the windows close in swap_read_submit(=
).
>          */
> -       if (workingset) {
> -               delayacct_thrashing_start(&in_thrashing);
> -               psi_memstall_enter(&pflags);
> +       if (!ctx->in_batch) {
> +               delayacct_swapin_start();
> +               ctx->in_batch =3D true;
> +       }
> +       if (workingset && !ctx->workingset) {
> +               delayacct_thrashing_start(&ctx->in_thrashing);
> +               psi_memstall_enter(&ctx->in_memstall);
> +               ctx->workingset =3D true;
>         }
> -       delayacct_swapin_start();
>
>         if (swap_read_folio_zeromap(folio)) {
>                 folio_unlock(folio);
> -               goto finish;
> +               return;
>         }
>
>         if (zswap_load(folio) !=3D -ENOENT)
> -               goto finish;
> +               return;
>
>         /* We have to read from slower devices. Increase zswap protection=
. */
>         zswap_folio_swapin(folio);
>         swap_add_folio(ctx, folio, READ);
> -
> -finish:
> -       if (workingset) {
> -               delayacct_thrashing_end(&in_thrashing);
> -               psi_memstall_leave(&pflags);
> -       }
> -       delayacct_swapin_end();
>  }
>
>  static void swap_write_end(struct swap_iocb *sio, bool failed)
> @@ -709,9 +715,19 @@ void swap_write_submit(struct swap_io_ctx *ctx)
>  void swap_read_submit(struct swap_io_ctx *ctx)
>  {
>         if (!ctx->sio)
> -               return;
> +               goto out;
>         count_vm_events(NRSWPIN, 1);
>         ctx->sis->ops->submit_read(ctx);
>         ctx->sio =3D NULL;
>         ctx->sis =3D NULL;
> +out:
> +       if (ctx->workingset) {
> +               delayacct_thrashing_end(&ctx->in_thrashing);
> +               psi_memstall_leave(&ctx->in_memstall);
> +               ctx->workingset =3D false;
> +       }
> +       if (ctx->in_batch) {
> +               delayacct_swapin_end();
> +               ctx->in_batch =3D false;
> +       }
>  }

Nice suggestion, and I forgot to Cc Christoph on this though,
worth getting more attention.
