Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793640434;
	b=0UpuP1D5WHzfa4/ETlPEmPA5vcGVM0HZjXWBXHj/RLCaGtWDChx8Ejr/KhMWIwTRe2qo
	 h2K4Jv13/r2VvFdqXFfrQbKh6uHPqskyAOqmmOKqsvkABsVrW6r5vExouXfZ7sy7LRxae
	 hGEaG/uOZXqHU1/28cg7zOAUxSNU9IkxPui5viil52znyPobixPLhhLf1+gz/n7qWfzjM
	 twXSRynGhd1RCpGKe4pJ17C+gfdph7hYYA047pQdsFHAi0nSsqixMi64Z656sthzFzkN+
	 06HtY/Yb+CdatAX3x4PaTM7YUzEtKl1b1WIWokcRlZq9hA0QGLLxvLGz//7BHByqOSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640434;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OKhnWPcmdK/vHA3FEHI8MrqzJldnHSNLvozGU1Xht1Y=;
	b=2OEq+5HPckSqH0DqMFkYVehpBbCSE4cAG1HpeDJyj19gzNLCK0BwUlg+q1czc66M8syg
	 u8y0a/t6R9sFdxsHk+QoXc9hQJyurR17OSYHldNbPTEm6XiedxXgZwCrxYxGdqn6psoFF
	 s03dI5RTSWhwyBONmZia6gYNH5y8GFnO5yTCtr5nqz1SfdflGkNIP8C1Prd/wFNL+9iL9
	 i4PQCjttP++1h8Oi30LZdguM46P30NkWtFjBleHxwRsg4iIAORpi0HvVa6w8mUsPqKydA
	 r1zL1AmicKnNCnLubP6doooW/spY4owLPPhwAkrtRhiqj04jo3r3GA1vU0ZxOM8D4Bg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iTB3RqBN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A37606BA72
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4A37606BA72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iTB3RqBN
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso1650954a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:27:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793640432; cv=none;
        d=google.com; s=arc-20260327;
        b=EhYTm106pvEIiR+iY0bLPXBQgPk8egk+f4FAWAaJeGEBg2Shy5PgxcjEEPxJBtj+ar
         2A2SPm5kCU/8Yy27w100OyqGv/6jpcWNJgxioj2/7F5Ox9cOWKpXhUh8ktTJXemNV4/K
         1fjeQKLtf3iUAO+izB/KLNtV0CQQRLABw8bOPgZ93I5HeybZqweNCKNaBWdHCtUp1aR9
         +5aKe+s60e8O+Oo2bB9UZla/ue+2Gf4dupp9d4pBt6m4g89vPY8gAp0GbueaJ5wKhGsf
         Iz8NLdeL0ZqRCshpxIVrcTQy1xNHaek6Ne1S6186aXij0WQBrgRp7j0XbWMpyr0s/SrV
         5dGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OKhnWPcmdK/vHA3FEHI8MrqzJldnHSNLvozGU1Xht1Y=;
        fh=HGdry81FOJvIECT5OlCwgzoXE1zBsvCUCMgn3J+bj7I=;
        b=PVUx6cYWIIGRgSe2kc4o0DOFNmeaizMnhrF6zteGfcz3kY/i33Fjbn6nQK1J5dtFQK
         0F1qyPhOyZ8HoCo5vgMcvw/JgTcmcOKA8h6BpaIfaty6wzAc9m8s5F+SBcG7hGIXJy2o
         cEAgAKOEW7RO2KxbQVpmg906KB5M9xZuhE4M1m/ojuR46eVDujOPH4WtSWE9niTL6qkx
         Zcv5GBEH7yBI5a+oDEcALCQ1NxFWl2MnLwuzvL0LbVKbuxFTYIZvHOADiTdY9wd2gUwv
         zymgodRQs1e2eDqWs4FN9VL1jZU+sKZLh5+4nx8lmPz3Ih52ADCzdqcetm8CHGU6AHmL
         ovYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793640432; x=1794245232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OKhnWPcmdK/vHA3FEHI8MrqzJldnHSNLvozGU1Xht1Y=;
        b=iTB3RqBNLQDycNkJnAjPS6u/kN78Xr+9CPV/Dm5CgbW4wQx8w80KoHkhUCkbPEX/a4
         ZFyaOmPtRluY5/Iqx9QTgrLw/92UHJcGOw1JFiOTB+dzpDg+RbUf4Gtly16hrTkgDGno
         uSf+NaG+I36nk1QwGA+vaocdOmJWt7ieWFjBSgvIzCkCvU8H6Rsl+WR2EIk4+qXfYS62
         TCUpP0z5RQaBvL4CrWB7L1njpWnSEQM3uYkADnTaTXD2+VI2hrCZtoSmPtOVNKurYV2J
         npjBSflSznS5C5L32VVZIeKGPSmgl4ZlQPlaJwuJVJ+Tzp27fukqJgYd0BYeghMUL8NV
         lRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640432; x=1794245232;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OKhnWPcmdK/vHA3FEHI8MrqzJldnHSNLvozGU1Xht1Y=;
        b=b+4GAev+vwkklqeRpl4U0/jvZnEdrPGYBZt3R3/zrXR4C66j4JYRgIT2vt6byNAtQz
         JSrbdSOTUAeBNf+g8CYWs+ML0vOXIOc1euhWZOxYGeo3D4uDaUcqddM50QC/Nz3sYt6R
         hUH4j7Z0+HizUvnk4NGfIIvPPdcBBKFwZOoPWl2hwpkMK0yPmMTWipasTX5e4+8kFDB4
         I7/XtCpMc2+nk8aBaDDzn5Z8gamxLS1SbCip6LIG35taAUeSVUqtJWYZVD9zZ5Cjf/SU
         n88x5UPEQ5WZIIKHHRB290sqJE7ZH6TiT9GF8siRv+VKh2Bp5TMsqgUvQ1bSCaIGx+t0
         ATAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpWBi/BhlbKwNMnfKlZ4+1pYj4eJpaTeCGGxK0eMt4AVO3k2UhQJRIO60LyYlXaR9eBxRCkS8zohb1k2k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDYn0i2zTBZL+KoCUBKUVD+4J3DVm3P6AVyd5dpznQnHFCp0ij
	zqFDvxbDzmdjaFWgsuxlkmxwUQA7uMKNpe9Z2ShzcyMbaJhS/qO5pzNGM8t3QjPEpXVjauqeH9M
	5et9a4l0Lvd/5M1NUlScGqfnvjCD9xmQ=
X-Gm-Gg: AYBFou3nqjbFf/Aq2xF6xMSoMcJGAh3wnmgoyAUlR9xOMycCiax6aQOnoOI8gtT13mP
	sLsVdaBAOdhmGJXInV6plCtpHOkonmgy8QvlX65VY5v9+R54YpknuKaxymm+pko7g3Ymq72gO//
	dP74AQFTOqMt6WDRq6qiXyhYHhAEYJirrVFP3W1RDgYqaLod6d6E4rVkhOi7UShlH2TPZ98BTMX
	FQNx13CWYUrsjdJ1zBGWLrkdxx4wd38EsyVhsysGhRU+b6qo/qQj8H9Rwz5UkBydT7Uj9zSHkXT
	nI0GktjjQBb3Ce0R2YpMjeYZJMRY/GI1KtCgHIElyUMd2XM21EYskIBjcCDYAO5AgSqIYjj7nL7
	X/n85QQ8aMuXrEupvSjnVNpyPpulv6p3o7dfoJgLQSMhTU7w/Ke2CXH/rbr397GCnnUvNOIGQPD
	q8pq5IK2BQeB4TFO0=
X-Received: by 2002:a17:907:96ac:b0:c49:b8ec:a9e3 with SMTP id
 a640c23a62f3a-c4ca7abe67amr1025275866b.43.1793640431886; Mon, 02 Nov 2026
 09:27:11 -0800 (PST)
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
 <CAMgjq7BYgXLheXDyc=p2mNgxdP3+92v2WHGiXiweDrsiYQ0u2g@mail.gmail.com>
 <auSWtJzFQ7KdElKL@cmpxchg.org> <CAMgjq7AJ0uajpVM+Kva5=_EXtmaawYR8TJQ6RdhrP7+NUZDx=w@mail.gmail.com>
 <aujA7X0IPvtRTmFG@cmpxchg.org>
In-Reply-To: <aujA7X0IPvtRTmFG@cmpxchg.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 3 Nov 2026 01:26:35 +0800
X-Gm-Features: AclHuK9XVquaypx5VfISqYnLO_GBcG43AfTae6Oi2KBrUZzp07UCi6QeSfvyFpc
Message-ID: <CAMgjq7DZYKXGw1McsDT345HS4BNqa46xte_dTJia6EMv2Dy6jg@mail.gmail.com>
Subject: Re: [PATCH 2/3] mm/swap: account synchronous swap reads as memory stall
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Christoph Hellwig <hch@lst.de>, 
	Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>, linux-mm@kvack.org, 
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

On Tue, Nov 3, 2026 at 12:57=E2=80=AFAM Johannes Weiner <hannes@cmpxchg.org=
> wrote:
>
> On Sat, Oct 31, 2026 at 04:00:22AM +0800, Kairui Song wrote:
> > On Fri, Oct 30, 2026 at 9:08=E2=80=AFPM Johannes Weiner <hannes@cmpxchg=
.org> wrote:
> > >
> > > Hm, I think the only option to avoid this would be to split the batch
> > > and flush more frequently, which I'm not sure is worth it. The batch
> > > size is only 32 folios...
> > >
> > > diff --git a/mm/page_io.c b/mm/page_io.c
> > > index 22e5ac1d298f..806cfe633a95 100644
> > > --- a/mm/page_io.c
> > > +++ b/mm/page_io.c
> > > @@ -207,6 +207,8 @@ static bool swap_can_merge(struct swap_io_ctx *ct=
x, struct folio *folio,
> > >
> > >         if (ctx->sis !=3D sis)
> > >                 return false;
> > > +       if (rw =3D=3D READ && ctx->workingset !=3D folio_test_working=
set(folio))
> > > +               return false;
> > >         return sis->ops->can_merge(folio, prev_folio, prev_folio_size=
, rw);
> > >  }
> >
> > We are in a dilemma with this change: if it fires frequently it breaks
> > batching but improves PSI accuracy.  If it doesn't fire frequently, it
> > has no negative effect on batching and performance, and it isn't helpin=
g
> > with PSI accuracy either :/
> >
> > But after a second thought, maybe we can live with it by having both th=
is
> > posted patch merged as it is and appending your suggested fix: the two
> > kinds of devices end up differently.
> >
> > For sync devices the batch is now always one folio, so there is nothing
> > fancy, everything is accurate.  Readahead batching for them only happen=
s
> > on the MADV and swapoff walks, so the cost is limited.
> >
> > For async, the window covers submission.  That cost grows only mildly
> > with the folios in the bio, block layer and dispatch work, unlike a
> > synchronous read.  And the previous per folio accounting was not
> > exact either: in a single threaded task, the throttle or cost of
> > a non-workingset readahead folio pays is also holding up the workingset
> > folio's refault, since the task cannot start the next submission until
> > that one returns.  Same story for delayacct.
>
> That sounds reasonable to me. Zero benefit to batching on these
> devices, so no point in taking the fuzz factor that comes with it.
>
> > And we are missing the completion wait either way: if a fault finds the
> > folio in the swap cache with its read still in flight, it blocks in
> > folio_lock_or_retry() in do_swap_page(), which no window covers.
>
> It's there, if you drill down to folio_wait_bit_common():
>
>         if (bit_nr =3D=3D PG_locked &&
>             !folio_test_uptodate(folio) && folio_test_workingset(folio)) =
{
>                 delayacct_thrashing_start(&in_thrashing);
>                 psi_memstall_enter(&pflags);
>                 thrashing =3D true;
>         }

Thanks for the info! Good to know.

> > So perhaps we can live with it for now by having your suggested fix
> > on top of this posted patch? Some comments could be helpful here and
> > maybe some further improvement is needed.
>
> Yes, I think that plan works.
>
> Want me to send a proper patch with changelog on top of Josef's?

I've tested the following code on top of V1, and it worked well; it
seems there is no need to move some functions or am I missing anything?
How about I keep your authorship and just send V2 including this ? :)
Any other suggestions are welcomed!

diff --git a/include/linux/swap_ops.h b/include/linux/swap_ops.h
index 57ac6c703f68..4d9ddd754712 100644
--- a/include/linux/swap_ops.h
+++ b/include/linux/swap_ops.h
@@ -17,6 +17,17 @@ struct swap_iocb {
 struct swap_io_ctx {
     struct swap_iocb    *sio;
     struct swap_info_struct    *sis;
+
+    /*
+     * Pressure accounting window: opened by the addition of first
+     * folio in a batch, closed by submittion of the batch.
+     * Values below tracks per-task state, so the task that opened
+     * the batch must be the one to close it.
+     */
+    bool            workingset;
+    bool            in_delayacct;
+    bool            in_thrashing;
+    unsigned long        in_memstall;
 };

 /*
diff --git a/mm/page_io.c b/mm/page_io.c
index 83ed0246ebfc..7d45e5acb951 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -470,31 +470,45 @@ void swap_read_folio(struct swap_io_ctx *ctx,
struct folio *folio)
     struct swap_info_struct *sis =3D __swap_entry_to_info(folio->swap);
     bool synchronous =3D sis->flags & SWP_SYNCHRONOUS_IO;
     bool workingset =3D folio_test_workingset(folio);
-    unsigned long pflags;
-    bool in_thrashing;

     VM_BUG_ON_FOLIO(!folio_test_swapcache(folio) && !synchronous, folio);
     VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
     VM_BUG_ON_FOLIO(folio_test_uptodate(folio), folio);

+    /*
+     * A batch this folio can't join has to be submitted before the
+     * pressure window, so that each batch is billed for its own read,
+     * especially before the possible lookup and decompression below
+     * rather than making the batch wait for them.
+     */
+    if (ctx->sio && !swap_can_merge(ctx, folio, READ))
+        swap_read_submit(ctx);
+
     /*
      * Count submission time as memory stall and delay. When the device
      * is congested, or the submitting cgroup IO-throttled, submission
-     * can be a significant part of overall IO time.
+     * can be a significant part of overall IO time. Reads are batched and
+     * submitted later, so both windows stay open on @ctx, and are closed
+     * by swap_read_submit() after the submission, also when the batch
+     * ends up with no folio queued.
      */
-    if (workingset) {
-        delayacct_thrashing_start(&in_thrashing);
-        psi_memstall_enter(&pflags);
+    if (!ctx->in_delayacct) {
+        delayacct_swapin_start();
+        ctx->in_delayacct =3D true;
+    }
+    if (workingset && !ctx->workingset) {
+        delayacct_thrashing_start(&ctx->in_thrashing);
+        psi_memstall_enter(&ctx->in_memstall);
+        ctx->workingset =3D true;
     }
-    delayacct_swapin_start();

     if (swap_read_folio_zeromap(folio)) {
         folio_unlock(folio);
-        goto finish;
+        return;
     }

     if (zswap_load(folio) !=3D -ENOENT)
-        goto finish;
+        return;

     /* We have to read from slower devices. Increase zswap protection. */
     zswap_folio_swapin(folio);
@@ -506,13 +520,6 @@ void swap_read_folio(struct swap_io_ctx *ctx,
struct folio *folio)
      */
     if (synchronous)
         swap_read_submit(ctx);
-
-finish:
-    if (workingset) {
-        delayacct_thrashing_end(&in_thrashing);
-        psi_memstall_leave(&pflags);
-    }
-    delayacct_swapin_end();
 }

 static void swap_write_end(struct swap_iocb *sio, bool failed)
@@ -725,10 +732,19 @@ void swap_write_submit(struct swap_io_ctx *ctx)

 void swap_read_submit(struct swap_io_ctx *ctx)
 {
-    if (!ctx->sio)
-        return;
-    count_vm_events(NRSWPIN, 1);
-    ctx->sis->ops->submit_read(ctx);
-    ctx->sio =3D NULL;
-    ctx->sis =3D NULL;
+    if (ctx->sio) {
+        count_vm_events(NRSWPIN, 1);
+        ctx->sis->ops->submit_read(ctx);
+        ctx->sio =3D NULL;
+        ctx->sis =3D NULL;
+    }
+    if (ctx->workingset) {
+        delayacct_thrashing_end(&ctx->in_thrashing);
+        psi_memstall_leave(&ctx->in_memstall);
+        ctx->workingset =3D false;
+    }
+    if (ctx->in_delayacct) {
+        delayacct_swapin_end();
+        ctx->in_delayacct =3D false;
+    }
 }
