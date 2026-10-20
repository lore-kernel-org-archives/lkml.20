Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792502339;
	b=tfGxExlzb/NSGufLaPbGcYuPz1Cxcbu6yhnM3Eps3IzCEMpIlihZaoLKD4N+2EzrrBdO
	 MCkqdPj/xiVTCTLs5IhK/P/ddWETK4VzZ3rvsh3G5YSK2jxofgvP+pspQkViQK4XVldBg
	 +qpjwxFejxkr440BwkgvCJ2RLbD0g++ZNmSMMJyFXKmfKk9lFGMloRuT6GWlNk6ILO3bg
	 JdG8aqbKAxHaLlz4ZtuoNGG2gZ/6Uq1koq8YjxYYirKGc2MPMFhLhxUdeqZLyMubxnBqu
	 SNrWau6raMpp1yALHITXxaMdNqB5gVzGrvvA1SA3+7k6ZnxvZz1Q73wQqsZ8EXV4Frg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=i+31L6D/8A8U1mIX096CB/r7t4YtUtlf54h/6tqEmZI=;
	b=BVyuO5WSo/+oUe2hUwRBKfYSHDFwTDCSJX1MFutZeudDAVrtcVNBddlYjOMGenqwli1c
	 /06zJVI87guWLxJf9x/88Ey/ZMmm1gsxhWvZ//ilRkNx7TxpIy+nZHmG/YjR/KzxeT2ov
	 lnh4dEJLRLBwn1FK0ZYMNcgyaWISBFNHBTq7DOio6qunYaVRs352YdYQVQYhenByCufji
	 TXTJWJ4nGvOTEHbWU+EO4UMnK2YCaFu9N94pu+HOuxrrhFixd6EyzrJtcXVz9yXJ6JAbd
	 o3heYrYDrIe7Z9tEsQue45Ag+D0wuQAvOaSlpgMOZ2fhfynXhFKPwsj+NP/pq4RRyzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Tle3hE8/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311B3606A327
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 311B3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Tle3hE8/
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so19145365e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:18:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792502337; cv=none;
        d=google.com; s=arc-20260327;
        b=Iq4mVNlAEuXKxuIA7eDfxOmhBu/qHfKoFjnk0ps/xn0E+hfUeP4XGHiRL7XJi1GS8w
         a3NcyMvVyOIucAZF/fnnccgT+hn/OhhVO/bq8kXbr9W2J+PXbh+6v+iM/R4zzOQDLlGv
         TTW+RjD5G+cDYezjhVrzSFCWgNrwOtua9HryB7KTW8w2YnHfFenaxPvKiS7fFLVWjXGP
         U3wLA1BtcU/9XlLgoaNPXVi7NMwFksEjcVWJwgjuWi65GK3cinZkz8XnF9Zjq4sgt+Qh
         dsMCX/qAB9BC8dJzqqmA9Osi93lbzPA8PArGokNFyBDwPoejGuBkRRL1MXiAuV3sKTse
         rnqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i+31L6D/8A8U1mIX096CB/r7t4YtUtlf54h/6tqEmZI=;
        fh=GHYsbF/KVrqhCMYdJmXgb54m+a2sX/X+NbMGp6YIYmM=;
        b=dhbC2Mo3G4Jc9MhCmixJxBigQo3rYQ3i7Ww1ZDPVml/n7gT4MYlmcbWBe0zFEXHDFS
         H8mhcfPO4CVHbeHLEcHCVAosv71dcDUgLGeOjCm89D9uMM5qxRl3EjcslR98isiMoFRK
         ynNWKqzz94x3ohJp8rBBB/JHRhkg5JalUridZInvSolJhWsed6geAp56hYh+tMmWWVaE
         bCbAe+UMXXQ4d13/RSGHUA3tHtxs0W1KCQ6sSsHBoo6IBBP+M3b6Zjxr33Vclm5QX1iE
         5xj3O6Q6EOcCYme0mtlYnJMhoCsi2oJwDNWJfdSFvE46eCDsQqFWWNPyj5shpq65H/M+
         OM5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792502337; x=1793107137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i+31L6D/8A8U1mIX096CB/r7t4YtUtlf54h/6tqEmZI=;
        b=Tle3hE8/ArxDIt0aenu5uX9Q+SHQoxhgy3zhFT9eTi6TK6WeUdgW/TI1ynrttXXXd9
         g4fMjZP5/t7HdUErZdcz9+XeXGV8M5CwDLImcLaaNDYuzhrIhvqUhaPMZNyL2ciWwBZu
         eSUfb7XeloCJ456QC1xYD3kdqguWFkNNf6hbc+P+xVBJXZCJf1thODjdyzopj2zgOOxa
         eUDjOOKXvcVeCwZg8RHiJkSTkVwzzO5wPAJa4Xd11AejaDQYFbt21mq+48j13xiXJkyb
         gn3eJLNrZt4gP4n/PX/NTfoYsKhDFLOGXAQaUCFbmE4na+oFxdBmEPEviIbVZ/uo1kgG
         O6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502337; x=1793107137;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i+31L6D/8A8U1mIX096CB/r7t4YtUtlf54h/6tqEmZI=;
        b=bysem26u1QgcqbbujS0YzYltc+AIuTaCdM9hzcAxOm2lqQumWlZDXVoy0KVOCJCjRc
         Tsdh6++xvEnsilekFi+vZU0G6vnqi3uQdA0wggVG8SlBLwh/DR6mnpix1BL/LRNuzXkO
         AXeX3UTL1VoTEiWLPFyW1U5nh5T6qnrzC1eL6V5vrO/wPCrHJoxTeh3AmqDmzDtnWfkg
         NjZAgIC3TAkhrE/2WQGzMwVfZeEDvjM/DilQXs9fwNG81RcCe5k432zjUAR1KG5TGJUv
         zdNK+8mtN4leypNEAIqt5ooVUkc4DLIq1lq9aKWetSN3IzoUSr9XO8j8HEGBmxTd0Tpu
         PW6w==
X-Forwarded-Encrypted: i=1; AKwUvByQj3dhfLrZD6vZMGY6wWLohSXbfQjxRusiHT86Xm5O9yp66RmvRfxuLLP46RnQck+HNT/5VBx5MrfUD04=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6RSO4qnAPW09vZC7R+nTH0c3al3lWHnqbqB9YTP2klzsYSjV8
	41hSae9JTEC49OCy+9Qp2m8tGLzhk0yegdwasi2OFLq/QV8BnSFBBpdewV4mjhMYMXnuXtj9lNd
	3zJCcOUGA1OpMm9kZxy9IwIg/7zWKwow9QZa9sf2X+g==
X-Gm-Gg: AYBFou305o761hVDbDzH4dKPQZ8z/dWZH4yWiRFpc5nNl5jJYXgGs7cFsxLP1YN67WL
	4wOzc0YHn+NT1XNULdRteXm8DdLTY7DHuY9W1ikVpQlWY/8hWFMzp7c/xYaxTJTxYQzdci9nXBc
	9WToDkd3sOM4WPm6XbhgaSuZI3KegGpwO/8NT4mRgNavSFFqtujlYeyqAme6xpHiaPX1ZlqEEd1
	D4ya48xOGsNLwFJNIzOvrpYVT99IBhOEWVRFbdYU+6fUTCU5ywiNP8PfsCaQ5kqXcotSwQo1g7Q
	6pCfH4Y1Okg2fETaqbySLn5h8g3VXl6zsCgDfyq3d27ALJcAOlD0vh4WmwokuAtMHcVUl4r1IOZ
	5modzM8jwJ6zFEwkZJf4tOdvJKdRwZkh1f3mpFhrdfVhJoI6FwtJ0Tm43QTHJ2OC2UShU0Yw=
X-Received: by 2002:a05:600c:870b:b0:4a1:d487:2dc8 with SMTP id
 5b1f17b1804b1-4a1d760518amr230058635e9.18.1792502337460; Tue, 20 Oct 2026
 06:18:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019160615.2348500-1-nphamcs@gmail.com> <atcRLYvKavedT6Hs@yjaykim-PowerEdge-T330>
 <CAKEwX=MRvzzd0Fn=UX+LcRo+K9wuqCWSB42NNn7rvZkZukRRrg@mail.gmail.com>
In-Reply-To: <CAKEwX=MRvzzd0Fn=UX+LcRo+K9wuqCWSB42NNn7rvZkZukRRrg@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 20 Oct 2026 06:18:46 -0700
X-Gm-Features: AclHuK9yxutAL1VqPHvSn75b4RZFEVufpPDBhsYXxR7jl8qX4EzLhrwQ7rZCnpg
Message-ID: <CAKEwX=OwzpxUfdANEXoCeZPBqch+91C4gKwhrcikm6Gj_LBPKw@mail.gmail.com>
Subject: Re: [PATCH] mm, swap: revalidate populated clusters before scanning
To: Youngjun Park <youngjun.park@lge.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 6:12=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Mon, Oct 19, 2026 at 11:58=E2=80=AFPM Youngjun Park <youngjun.park@lge=
.com> wrote:
> >
> > On Mon, Oct 19, 2026 at 09:06:15AM -0700, Nhat Pham wrote:
> > > swap_cluster_populate() can publish a cluster's table with the cluste=
r
> > > lock dropped. A cached allocator can use and empty it before the
> > > populating allocator reacquires the lock. The resumed scan can then
> > > dereference a NULL table.
> > >
> > > For example, CPU1 can retain a cached cluster offset on an SSD with
> > > per-page discard disabled:
> > >
> > >     CPU0                          CPU1
> > >     ----                          ----
> > >     swap_cluster_populate()
> > >       swap_cluster_alloc_table() fails
> > >       spin_unlock(&ci->lock)
> > >       local_unlock(&percpu_swap_cluster.lock)
> > >       swap_cluster_alloc_table()
> > >         rcu_assign_pointer(ci->table, table)
> > >                                   swap_alloc_fast()
> > >                                   local_unlock(&percpu_swap_cluster.l=
ock)
> > >                                   mem_cgroup_try_charge_swap() fails
> > >                                   swap_cache_del_folio()
> > >                                     __swap_cluster_free_entries()
> > >                                       free_cluster()
> > >                                         __free_cluster()
> > >                                           swap_cluster_free_table()
> > >                                             rcu_assign_pointer(..., N=
ULL)
> > >       local_lock(&percpu_swap_cluster.lock)
> > >       spin_lock(&ci->lock)
> > >       return ci
> > >     alloc_swap_scan_cluster()
> > >       cluster_scan_range()
> > >         __swap_table_get()
> >
> > Hello Nhat.
> >
> > Good catch!
> >
> > > Reject an unusable cluster under its lock before scanning it. Relocat=
e
> > > it only while its table is present.
> > >
> > > Fixes: cdd77f84d966 ("mm, swap: consolidate cluster allocation helper=
s")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> > > ---
> > >  mm/swapfile.c | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/mm/swapfile.c b/mm/swapfile.c
> > > index c3288910b3e3..988b7316e0a1 100644
> > > --- a/mm/swapfile.c
> > > +++ b/mm/swapfile.c
> > > @@ -981,7 +981,11 @@ static unsigned int alloc_swap_scan_cluster(stru=
ct swap_info_struct *si,
> > >       bool need_reclaim, ret, usable;
> > >
> > >       lockdep_assert_held(&ci->lock);
> > > -     VM_WARN_ON(!cluster_is_usable(ci, order));
> > > +     if (!cluster_is_usable(ci, order)) {
> > > +             if (cluster_table_is_alloced(ci))
> > > +                     relocate_cluster(si, ci);
> > > +             goto out_unlock;
> > > +     }
> >
> > If this patch is applied as bloew, does it prevent the issue described =
here?
> >
> > https://lore.kernel.org/linux-mm/20260720071342.50742-2-shikemeng@huawe=
icloud.com/
> > (This patch publishes cluster table after lock acquired.)
> >
> > This patch is chagned the way I suggested during review... :(
>
> Ah I missed that patch series and your review! What happened to it?
> Did we just never land it?
>
> Looks like we are still doing neither Keming's approach (table
> copying) nor your approach (publishing at the end of
> swap_cluster_alloc_table()).

Ah nope, I saw that Kemeng implemented your approach:

https://lore.kernel.org/linux-mm/20260907091356.53026-2-shikemeng@huaweiclo=
ud.com/

My bad! But yeah I think we still need this small fix (or Kemeng's
original proposal?), unless I missed something...?
