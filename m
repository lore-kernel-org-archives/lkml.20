Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9316338E8D0
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792121023; cv=pass; b=J3ZePfn2iMkxHDilv0M1EwUvcZ5unsyiC6zK6FYmAfnfr1oSNEBihgDHKjqnwBNtwJhjhdJw/3lA8Dvfe1elTiKhvoY1TR2gbyYqmW5KuZ7eUK1swBf4KPG6U4IUuT3JVHviXWIKm9uPH6MtJabyCviV5igPuKstVuJI0zBE1yk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792121023; c=relaxed/simple;
	bh=cIDew5yWJsVRzcclhzpz41GAk/yQ0E2hQ6SrIkR6mLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zw5xDHbMXXTlQsshBKonY0Jbj1BM54fcXjj7A7ZnRRXLmw+7vjtMaXF9cn+veKD9hUOsNxa3xWx9nGh/2Y2+09FjfQs+PLtfuTwmSo4TXuIGgXQkz/7DZx81LVujW0PRw0ouS5OFWz0KX1EAQY3o2ZtCDUxOF1n/jpIOJMsfDH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QRNZhxNW; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QRNZhxNW"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4956869750eso38819285e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:23:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792121020; cv=none;
        d=google.com; s=arc-20260327;
        b=L0RMaaS2tKY1UFZesRWqZnwYUHEdz+Xhs5IVXFRp+NiL0EgtyZGtScBB0oamPwhh2T
         OSFGzTFEDSTQHKaoLWP+biaZI+H/EwWYaQSPbvkrP9VwW5kbz+CX0z17sIHMUrfkIyk/
         wKPCE/2t3ApaQDstF+mIRp0YnP/FdpDbzNbDo2dUCNpbI2xpWYjm1nNbXOXYw3aconFb
         yW+Wv/lsdOC9wERTQP2IhXhcZtSxh21+SeIJYn75y7Ec+R82M9lzE6q+08oo3EAZFso0
         9jxdhyInXl/IUonrpqa6l9/bWDr1IjYHjrCLeVC1igutju1nTBiZm1sJG5+5edEaj59A
         a3Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8YNJkTl/DWHv1ezxEcAU72VeJT6fYlt0s29Bmaa9qVQ=;
        fh=HIgSTJYEK5aPyqxi/saeq7A+fHG0mD6wDXOfOCuED5A=;
        b=Gz9Ve7rfb4GPKy++/LdjCp4NU8IhUwl1HY8XYOwW8lJ/G3GIrnwKQzQSITU0Ij5kMx
         ThCZORjkt6T2o8FGcU3TqTj06dTQXJ1xV1ypX+4V9n18x5jXEK75GK1lhj7awFoMWror
         CSNcWCy5W0mXuVGhkudaQFhNWXnqP2tozRKLCD1FATwUB0aRj7V7uZHD083rJSylNI7d
         5hYuWdnfzs9qwGuiukf4qc0NjEWTGj145hcCvKHGovQ6se70272ooNMzlWc7ZSxMmr9Q
         1imaFfjgWZYUMM2nlUl21fenuYSAE1y3z+q+yeKTeG7EG5pBPJs1awVMob7QvT3K2ynY
         HQ4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792121020; x=1792725820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8YNJkTl/DWHv1ezxEcAU72VeJT6fYlt0s29Bmaa9qVQ=;
        b=QRNZhxNWJ1gijYVZoCNWvSCsvIJNEG+5lwWDAD1lRX+fnAKy4dA/lrbkmZZg9dP4CE
         Q/LjZ8elBixqoTm2SDVzZWfiWmUa6oXQupWCjX4py8lbBPOoEv2PLRAkHOq62XdyQkE3
         9yiHbHZP35STCLdXLgpWajCNThvNAaLzrMbNg+64/jcpkXTJ+N87DscQoIHdPW2wDyCo
         FfukSvDQV2eymVDhzoH9NOgPy9+Osr56mafaLNK4tqoTvk8gVnXqJsQaLz9bcdEWB29t
         9+LqD4hnYdtVkerlDhhQFFYabn6GJ8ks99ql6hWmPkM+cXrQ4cekQyuAF2EC/ROujav4
         eJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792121020; x=1792725820;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8YNJkTl/DWHv1ezxEcAU72VeJT6fYlt0s29Bmaa9qVQ=;
        b=IWromzEn4HsjROlrs7Z/TRhvO1OUrp9t6dGciITxRbWc84eFEvYpZI039iF/+L9hhD
         0s4+/QIME6WXDpWzMNiIh1RudrIIqmu3+xeeblaWgL8ZFAp/ZYYDgX+xeo6XpJo7RQTT
         46uIcXb/1IP0+fN+hVB/8kJmYC3CT94SHyIMqKWGpHAh9hW9JnbPb4GD/m8fO4/pe2Ug
         NQHAD8MkpPWptcyne/V+TlYJE0i8KjEC/P4zo4uKdGDmNeiF9j1JoMtQgdeIQVbZ33i5
         0kaMYQO7r1GpL5XMfsrbzhniBIn/bXEyZhQRN9mn5IJfTpa5hMRAtIHOOsXLVlZIOGhm
         qaGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLPj5KjxmEiRbdfcZXg3qALY4CCzboQyMjwfFnatH+dQQObmLteAxuDVDSYmylX87dn4G5NxGR7a6hzk4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKY7Sijd69AhRRF3qP4f/kiXHTREf3dfKdoV1v9BlIs6X5yH4LZ
	r2U39xCdsYEbyFbKuzmV14HrTMMMANhgXcqAmHfz1tD4avxzfkwwlYawwuCFK0/4GgA9qrKzaeO
	W1EKfeXtTlMcFzENGIbQDJdtxu++JhKQ=
X-Gm-Gg: AYBFou2fG16wlZjtvm2G+eNfj08XSzN8h7Pqdh9sPl8Bdjg1OSVccO+47V3f7vX+J0z
	snQw7pIe4Pca9MhmuxC6YcArdcH+X/8CwFSpyq5X7lajuSnjmoovJ4buBmwKDRnXDtsPNs0ccy2
	IJNzGjA9lkDALGdcXa9opNSA3RGUdZHwWiTYE0jVpDAk1/ZjwsIFhQK3/QoOeSuiszG6RPTeWpz
	VIx7kZUCjTun8FvNwpzH+Ch5wujVS0Imgyo8sKl07OWMVVokTVdYyTUvGSD+Rf6xtmbXh/GaFab
	1mzRKkR+FOjRx3/1sILN8qF0D1t8hXWTDXB8PgA0iOS/xMHGjcBmb921
X-Received: by 2002:a05:600c:1d0b:b0:4a0:13ea:2ec3 with SMTP id
 5b1f17b1804b1-4a18e4ddca6mr422203805e9.35.1792121018258; Thu, 15 Oct 2026
 20:23:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-mglru-fg-v3-0-cbd4546a5bd9@tencent.com>
 <20261003-mglru-fg-v3-13-cbd4546a5bd9@tencent.com> <CAN_Opa-GVYVg1mUc=PJFfE8ZLCoAWjzDoWoxA8FEfsPAYGdijA@mail.gmail.com>
 <atBL2inthrJH_ng4@KASONG-MC4>
In-Reply-To: <atBL2inthrJH_ng4@KASONG-MC4>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 16 Oct 2026 11:23:26 +0800
X-Gm-Features: AclHuK_N9VwznAnK-_rOKQvlcBwO7N2BPlytUJO1x0sN6vdiDFScfhSSqrqgPcw
Message-ID: <CAN_Opa-42w3BwKV-DBjy-x-Ldi+RQgbRcgjGmsT_jzM4+4=K+g@mail.gmail.com>
Subject: Re: [PATCH RFC v3 13/17] mm/mglru: make folio_inc_lru_refs lruvec lockless
To: Kairui Song <ryncsn@gmail.com>
Cc: kasong@tencent.com, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Muchun Song <muchun.song@linux.dev>, Qi Zheng <qi.zheng@linux.dev>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <baoquan.he@linux.dev>, Nico Pache <nico.pache@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
	Gregory Price <gourry@gourry.net>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
	SeongJae Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, Yu Zhao <yuzhao@google.com>, 
	Vernon Yang <vernon2gm@gmail.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Chen Ridong <chenridong@xiaomi.com>, Tal Zussman <tz2294@columbia.edu>, 
	Xiang Liu <liuxiang.277@bytedance.com>, Ehab Ababneh <ehab.ababneh@intel.com>, 
	zhaozhengzhuo <zhaozhengzhuo@uniontech.com>, Lian Wang <lianux.mm@gmail.com>, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 11:46=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wro=
te:
>
> On Mon, Oct 05, 2026 at 01:29:00AM +0800, KunWu Chan wrote:
> > On Sat, Oct 3, 2026 at 8:55=E2=80=AFPM Kairui Song via B4 Relay
> > <devnull+kasong.tencent.com@kernel.org> wrote:
> > >
> > > From: Kairui Song <kasong@tencent.com>
> > >
> > > The lruvec spinlock in folio_inc_lru_refs was only taken to keep
> > > concurrent aging from corrupting the size counters.  This is no
> > > longer needed: the per-generation counters are atomic, and the
> > > active/inactive ABI counters are updated per folio and linearized by
> > > the CAS on the folio flags, so concurrent aging can no longer corrupt
> > > them.  The same argument already allowed folio_reset_lru_refs() to
> > > drop the lock.
> > >
> > > Use folio_lruvec_live_get()/folio_lruvec_live_put() to hold the RCU
> > > read lock around the lruvec lookup, and drop the spinlock entirely.
> > >
> > > Without the lock, aging can advance max_seq while a promotion is in
> > > flight.  Generations are indexed by seq % MAX_NR_GENS, so the folio
> > > flags can return to the value read earlier and the cmpxchg succeeds
> > > with a target gen computed from a stale max_seq.  Recheck max_seq aft=
er
> > > a gen-changing cmpxchg: if it moved, account the committed update and
> > > retry with LRU_REF_FORCE, which promotes the folio to the newest gen.
> > > The retry may count the access twice, which is acceptable and avoids
> > > folio_activate(), whose LRU lock causes latency jitter.  smp_rmb()
> > > orders the flags read, including the one returned by a failed
> > > cmpxchg(), before the max_seq read.
> > >
> > > Also simplify the post-CAS accounting guards: gen is only assigned
> > > non-negative values after the old_gen < 0 early exit, so gen !=3D old=
_gen
> > > implies gen >=3D 0, and lru_gen_update_size() needs no explicit guard=
.
> > > The active/inactive ABI update keeps its gen >=3D 0 check because an
> > > off-LRU folio has no lruvec to update.
> > >
> > > Signed-off-by: Kairui Song <kasong@tencent.com>
> > > ---
> > >  include/linux/mm_inline.h | 10 +++++-----
> > >  include/linux/mmzone.h    |  3 ++-
> > >  mm/vmscan.c               | 47 ++++++++++++++++++++++++++++---------=
----------
> > >  3 files changed, 35 insertions(+), 25 deletions(-)
> > >
> > > diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> > > index ee7fcbe2366b..b68d68101248 100644
> > > --- a/include/linux/mm_inline.h
> > > +++ b/include/linux/mm_inline.h
> > > @@ -293,10 +293,9 @@ static inline int folio_lru_gen(const struct fol=
io *folio)
> > >         return lru_get_gen_flags(READ_ONCE(*const_folio_flags(folio, =
0)));
> > >  }
> > >
> > > -static inline void lru_gen_update_size(struct lruvec *lruvec, struct=
 folio *folio,
> > > -                                      int old_gen, int new_gen)
> > > +static inline void lru_gen_update_size(struct lruvec *lruvec, int ty=
pe,
> > > +               struct folio *folio, int old_gen, int new_gen)
> > >  {
> > > -       int type =3D folio_is_file_lru(folio);
> > >         int zone =3D folio_zonenum(folio);
> > >         int delta =3D folio_nr_pages(folio);
> > >         struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> > > @@ -371,7 +370,7 @@ static inline bool lru_gen_add_folio(struct lruve=
c *lruvec, struct folio *folio,
> > >         /* use the refs from the atomic snapshot to avoid raced updat=
e */
> > >         refs =3D lru_get_refs_flags(flags);
> > >
> > > -       lru_gen_update_size(lruvec, folio, -1, gen);
> > > +       lru_gen_update_size(lruvec, type, folio, -1, gen);
> > >         if (lru_refs_is_active(refs))
> > >                 lru +=3D LRU_ACTIVE;
> > >         __update_lru_size(lruvec, lru, zone, delta);
> > > @@ -389,6 +388,7 @@ static inline bool lru_gen_del_folio(struct lruve=
c *lruvec, struct folio *folio,
> > >  {
> > >         unsigned long flags;
> > >         int gen, refs;
> > > +       int type =3D folio_is_file_lru(folio);
> > >         int zone =3D folio_zonenum(folio);
> > >         int delta =3D folio_nr_pages(folio);
> > >         enum lru_list lru =3D folio_is_file_lru(folio) * LRU_INACTIVE=
_FILE;
> > > @@ -411,7 +411,7 @@ static inline bool lru_gen_del_folio(struct lruve=
c *lruvec, struct folio *folio,
> > >         if (!reclaiming && ((max_seq - gen) % MAX_NR_GENS) < MIN_NR_G=
ENS)
> > >                 folio_set_active(folio);
> > >
> > > -       lru_gen_update_size(lruvec, folio, gen, -1);
> > > +       lru_gen_update_size(lruvec, type, folio, gen, -1);
> > >         if (lru_refs_is_active(refs))
> > >                 lru +=3D LRU_ACTIVE;
> > >         __update_lru_size(lruvec, lru, zone, -delta);
> > > diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> > > index e096fd0a5047..d78e3f97423e 100644
> > > --- a/include/linux/mmzone.h
> > > +++ b/include/linux/mmzone.h
> > > @@ -558,9 +558,10 @@ enum lruvec_flags {
> > >  #define LRU_TIER_MIN           0U
> > >  #define LRU_TIER_MAX           (MAX_NR_TIERS - 1)
> > >
> > > -/* Access source flags for folio_inc_lru_refs() */
> > > +/* Flags for folio_inc_lru_refs() */
> > >  #define LRU_REF_MAPPED         0x1U
> > >  #define LRU_REF_EXEC           0x2U
> > > +#define LRU_REF_FORCE          0x4U
> > >
> > >  #define LRU_REFS_REFERENCED    0x1
> > >  #define LRU_REFS_WORKINGSET    0x2
> > > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > > index ae4a0522a8d5..9cc06a95d931 100644
> > > --- a/mm/vmscan.c
> > > +++ b/mm/vmscan.c
> > > @@ -982,38 +982,33 @@ void folio_inc_lru_refs(struct folio *folio, un=
signed int flags)
> > >         long nr_pages =3D folio_nr_pages(folio);
> > >         struct lru_gen_folio *lrugen;
> > >         struct lruvec *lruvec =3D NULL;
> > > +       bool aged =3D false;
> > >
> > > +retry:
> > >         old_flags =3D READ_ONCE(*folio_flags(folio, 0));
> > >         do {
> > >                 new_flags =3D old_flags;
> > >                 old_gen =3D lru_get_gen_flags(old_flags);
> > >                 old_refs =3D lru_get_refs_flags(old_flags);
> > > -               file =3D folio_flags_is_file_lru(&old_flags);
> > >                 refs =3D old_refs + 1;
> > >                 gen =3D old_gen;
> > > +               file =3D folio_flags_is_file_lru(&old_flags);
> > >                 if (old_gen < 0)
> > >                         goto out;
> > > -               /*
> > > -                * Lock the lruvec if the folio is on-list. We are al=
ready
> > > -                * doing lazy promotion so in theory we don't need th=
is,
> > > -                * but for now, concurrent aging would still corrupt =
the
> > > -                * size counters.  This is a temporary limitation and
> > > -                * will be lifted very soon, so the lock here is not =
a
> > > -                * performance concern.
> > > -                */
> > >                 if (!lruvec) {
> > > -                       lruvec =3D lruvec_live_lock_irq(folio_lruvec(=
folio));
> > > +                       lruvec =3D folio_lruvec_live_get(folio);
> > >                         lrugen =3D &lruvec->lrugen;
> > >                 }
> > > +               /* Failed cmpxchg() does not order old_flags before m=
ax_seq. */
> > > +               smp_rmb();
> > >                 max_seq =3D READ_ONCE(lrugen->max_seq);
> > >                 max_gen =3D lru_gen_from_seq(max_seq);
> > >                 min_gen =3D lru_gen_from_seq(READ_ONCE(lrugen->min_se=
q[file]));
> > >                 if (old_gen =3D=3D max_gen)
> > >                         goto out;
> > > -
> > > -               if (flags & (LRU_REF_MAPPED | LRU_REF_EXEC)) {
> > > -                       /* Promote second page table access or execut=
able */
> > > -                       if (refs > LRU_REFS_REFERENCED || flags & LRU=
_REF_EXEC)
> > > +               if (flags & (LRU_REF_MAPPED | LRU_REF_EXEC | LRU_REF_=
FORCE)) {
> > > +                       if (refs > LRU_REFS_REFERENCED ||
> > > +                           flags & (LRU_REF_EXEC | LRU_REF_FORCE))
> > >                                 gen =3D max_gen;
> > >                         /* First access only defers eviction from the=
 oldest gen */
> > >                         else if (old_gen =3D=3D min_gen)
> > > @@ -1037,9 +1032,19 @@ void folio_inc_lru_refs(struct folio *folio, u=
nsigned int flags)
> > >                         break;
> > >         } while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_=
flags));
> > >
> > > -       if (gen !=3D old_gen)
> > > -               lru_gen_update_size(lruvec, folio, old_gen, gen);
> > > -       if (lru_refs_is_active(old_refs) !=3D lru_refs_is_active(refs=
) && old_gen >=3D 0) {
> > > +       if (gen !=3D old_gen) {
> > > +               /*
> > > +                * Gen-index reuse can fool cmpxchg(). Retry lockless=
ly, accepting
> > > +                * an extra reference to avoid folio_activate() laten=
cy.
> > > +                */
> > > +               if (unlikely(READ_ONCE(lrugen->max_seq) !=3D max_seq)=
) {
> > > +                       flags =3D LRU_REF_FORCE;
> > > +                       aged =3D true;
> > > +               }
> > > +               lru_gen_update_size(lruvec, file, folio, old_gen, gen=
);
> > > +       }
> > > +
> > > +       if (lru_refs_is_active(old_refs) !=3D lru_refs_is_active(refs=
) && gen >=3D 0) {
> > >                 enum lru_list lru =3D file * LRU_INACTIVE_FILE;
> > >
> >
> > Hi Kairui,
> >
> > One question about the retry path.
> >
> > When `max_seq` changes after a gen-changing cmpxchg, the retry uses
> > `LRU_REF_FORCE` and promotes the folio directly to `max_gen`. In the
> > normal first `LRU_REF_MAPPED` access path, the same folio is only moved
> > to the next generation when it is in the oldest generation.
> >
> > Is the stronger promotion on the retry intentional? In other words,
> > does detecting that `max_seq` advanced during the update justify
> > promoting the folio all the way to the newest generation, rather than
> > re-evaluating the original promotion policy with the new `max_seq`?
>
> I think we are fine, that window is very very rare already, and the
> problem is we may cause hotness inversion if the gen number lapped
> with each other. To making things easier, if the max_seq changed,
> just force promote it so we won't lose any hotness info. It may
> over protect but the chance is like once in a million so I think
> it's fine.

Makes sense =E2=80=94 over-protecting once in a million is clearly the
safer side.
Thanks for the explanation. I'll look at v4 and follow up there.
