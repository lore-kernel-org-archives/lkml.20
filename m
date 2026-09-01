Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318EB47D470
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788261240; cv=pass; b=IKi8W9kRVENqmpouZ2RXmhnObGHJWEvrm3EdByaLGhkQiuaFPmb1Tet435yd2Pouea4zsJTyPRx2z5ksgR6UX459WIVTnXwm8FpMagx6Ib2LqZ6PKF7k1mSKZnWE0SrL5D/BVLRckpzIFubwpKThDCx/p/Yoap7//Deg36zG0tI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788261240; c=relaxed/simple;
	bh=oagxqboOAu0vv8dpItSMEJg1wO/9O3imbBchABxF3mI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZB72iZKnzPO5H3CCEYev8fQNdKmKCJv6eWgd1lYBEZ8LQgUBkFKEUyv2pMbthXkee1upQgpVRZuAkziXRsx/F56Y08VdstqcD+tv/S8uD9xZihe5YKd7st6+d1PPqs12CtkEUciYRUGt027Tvir8iL7ZgLtaImZGsXMaI97BXzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WejQzLdg; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WejQzLdg"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c1c26d7e951so794152366b.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 04:13:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788261236; cv=none;
        d=google.com; s=arc-20260327;
        b=reIGc7J/b7f8nV9OJqksyzpdF0WK3SUgFWQOZ9sl5CjFLqZHuDqJ8gEn+lc040VB4K
         4KzZcLAsgdxu+XfuhRxxn7zAywtj0uo7QG4SVyrK0M16EmPPpjQijrnGewxE/VjPXQ4J
         sCAMo3TbxvHjbd8HMfsoQq4WpE8t4xz2Rf6+1dqQc8Yo/XRuuF+GQZ3ipo8HdL2GE8y6
         Uv/LQoFGvBqJSM+CF4IRQsPn+DnZN9t1hKcRY4Uug/kpkh0Zl20JW2QxHqj+fZYsIWAP
         KnHsC2cYv+he0wI8wWZ8cC9fw0HJ1fy2LPlskdVbeDdoYlSKihi8aL5R+Z6EpbTT/l6J
         7qXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zo2PPYoJf8/8P2lpcn6RCiPhS+p7e95CjAJ1PNJ8eY4=;
        fh=6RsxJFH54qXPhA7+P37cy0IAowK0tTr1EZ1d3dHGOQ4=;
        b=qew7jv7OvYxcPbzeBKBEc3YQ1Hw8hk91yve9edAYbWIPsLqj0MFsrVdeIp09m9gY+p
         UAq09+kGbI64Z+kZZDBAa741+3c6Qb1TJGASb42+f9r8J5EWmRgYCD6PZtW6slaATv62
         VlcXmmzyV2Oj9QSWzeUpPjVEzbz+UCYk+YtfWm4eNC/woCncoaGKo6NJoWZYXJWg8mgO
         lm0g/I/F525v7dZKAsn9BsQvsLbm0/5mTDnANCKwOw6Ta8arbKKFW5yZq/sKMwbL8JoM
         SaF96UqDf79Vd9Brzoh24SDjxbRjzlqcxgvI/xGdZrIGAiXwFNforVRRkBFIU0+WIW7Q
         n8kQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788261236; x=1788866036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zo2PPYoJf8/8P2lpcn6RCiPhS+p7e95CjAJ1PNJ8eY4=;
        b=WejQzLdgOp0XI4NwyWkJyj5b3A23evwlDon0zhc4UhC6tn5+dIn/OCIBKFdIL6hkXF
         hbI3HOTomqGgFjjbPzZrdW6zn8SuLdrJ1fZgBwXMpi6//l9sP2kz9WNBVjsmXvvAyF3R
         CBQShWqiRUJIKPMz/TI6/9dfl7xFHwmrE2Q8BOHXhWtFUd4qiwXzy5M0klYUz9eQgRge
         HnWkm0Wx4TBJa479YN6ofmhT0mSvM4WF/z8CUUOeePkSK7VTMhrVVUq05eVNFuvjGA4l
         moRhb1CkX5wuD8XHBNEmb7n8vk7SkJdoWwBiiBVRdzr/7Y9+aezxYeiBdtiOWE9ve4Vj
         5aSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788261236; x=1788866036;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zo2PPYoJf8/8P2lpcn6RCiPhS+p7e95CjAJ1PNJ8eY4=;
        b=RMQ/2oHUeg18L4JSU67BHg0pLxSrziI35znuKcWlPxtYm6C+EnWiNP4D6B1wNXV+Sl
         Cuv9jhlo5Um95r6o2XNgOTsWqJGwlWLeC8gh3sIz32GaibniQIqPxm+69tp9AINbDjZL
         1HYO2pTtblM9Y9pRus/dsnSaSkBYbum9MrAc50KekEHb0oFaPmN113GoqpWNquO87nj3
         poXS21e5yoKzYw7waYJKm1s57U9g1XXXFhEQNGU/HLYV17eWUF/407Rt+sFg29ojyhAL
         +cGT+XbyMQPH3ZCAk/04U5+toirAF8OBqoM2m1rxWBAPKb+DiX9UXFxR0b6M6Sa2aK6T
         yarw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+ptKCwYFWWbQ9ju8XyhIV7QjuLwPLTreVqapvMVaMt7T4rkNh9I8qHM6nYqSs3fQwJgxJlR8y7+7jcB4=@vger.kernel.org
X-Gm-Message-State: AFuF++l2bJv9OS50r24JABFvorJ2SV0xLwLZr0MAw/dIR84p3JF75KJl
	e4vG1xRBY9jLCx2+8qXvg0edpJEGi7GWBMUu3omxrN12MZ1eMjBICOUvPudxUVSlajugKK7oDsA
	vRa21GmM5VhC3eFbn81pfsy2YNSVxnLo=
X-Gm-Gg: AR+sD12dc9Wf6ZHM6EErGfgo2WiNrrLpql9Kqdo7rxk0GcoQyDs7qEQqnVMpVfQCTqq
	zqEIYQUQ3G3XRKSjVg88eQsq/605mfhrPGOYeq+GvZ+qypQnO2C9lGJDww4+7vc+peK4z6puEl7
	nmpS+94n5DQpPM1HhqL6KklpEvz1u0y/q+A1UcFzKlgue7/PsGGxQPoLqnjUUxdIKbrvC6cp9sY
	dD4V2OjWpxa26nA6FOfDZSFwJMoj753r1GX/eqmKGBcksC9IFj72N9wc0EeU4EemGJGGCzbF5qW
	2j1L2UofgT/OZ229db9VoQrHNxPQitIc4GrzpcMYSTjrNnGSp8bGS5jciIvGLPwbu0cvkooIFel
	a
X-Received: by 2002:a17:907:934a:b0:c21:34a3:4df9 with SMTP id
 a640c23a62f3a-c25b3b0003cmr478506666b.3.1788261236124; Tue, 01 Sep 2026
 04:13:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-mglru-flags-cleanup-v4-0-2d15dde0d7ee@tencent.com>
 <20260831-mglru-flags-cleanup-v4-6-2d15dde0d7ee@tencent.com> <CAGsJ_4y7MrUeHn4NvtpyyZ3EY-6dTUD4vhitw6Sy6tfRq6Tf9A@mail.gmail.com>
In-Reply-To: <CAGsJ_4y7MrUeHn4NvtpyyZ3EY-6dTUD4vhitw6Sy6tfRq6Tf9A@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 1 Sep 2026 19:13:19 +0800
X-Gm-Features: AcwNN1X-j4abCvg1T2GB3Ar-5P2Ua0p1HBjUPKbFFW5g6FNochd-6przwbyCyV4
Message-ID: <CAMgjq7CiewVYOsBoXMjg+tgbUMsXgYoTe1gJiEoADQdusffeng@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] mm/mglru: fix potential generation folio number leak
To: Barry Song <baohua@kernel.org>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Chris Li <chrisl@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Ridong Chen <ridong.chen@linux.dev>, Lian Wang <lianux.mm@gmail.com>, Yu Zhao <yuzhao@google.com>, 
	Zi Yan <ziy@nvidia.com>, Qi Zheng <qi.zheng@linux.dev>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 6:56=E2=80=AFPM Barry Song <baohua@kernel.org> wrote=
:
>
> On Mon, Aug 31, 2026 at 2:43=E2=80=AFAM Kairui Song via B4 Relay
> <devnull+kasong.tencent.com@kernel.org> wrote:
> >
> > From: Kairui Song <kasong@tencent.com>
> >
> > Each generation of MGLRU accounts anon and file folio numbers
> > separately, and the page table walker updates each generation's
> > counters in batch once the walk is done. The walker promotes a
> > folio's generation with a cmpxchg on folio->flags, and
> > update_batch_size() then reads the live flags again to pick the
> > anon/file column to charge. The walk holds neither the lruvec lock nor
> > the folio lock, so the type can flip between the cmpxchg and that
> > read: the lazyfree path clears PG_swapbacked, and reclaim sets it back
> > on a dirty lazyfree folio. The batched delta pair is then recorded in
> > the wrong type column. Nothing reconciles it afterwards, permanently
> > skewing lrugen->nr_pages and the reclaim budgets derived from it.
> >
> > Fix it by capturing the type from the flags snapshot the cmpxchg
> > linearized against: folio_update_gen() returns the type of the state
> > it transitioned from, and update_batch_size() accounts with that.
> >
> > A folio's type only changes while it is off the LRU list, inside a
> > del/add pair under the lruvec lock, with the gen bits cleared in
> > between. The generation and PG_swapbacked sit in the same
> > folio->flags word, so the cmpxchg snapshot captures them together.
> > Let G be the generation that snapshot captured (old_gen) and G' the
> > one it wrote (new_gen); the CAS can land in only three places:
> >
> >   - before the del: the folio is anon at G; the batch records anon
> >     G -> G', and the del later removes the folio from the anon
> >     counters;
> >   - between del and add: gen =3D=3D -1, so folio_update_gen() returns -=
1
> >     without touching the flags and no batch is recorded; the del/add
> >     pair accounts for the move alone;
> >   - after the add: the folio is file at the fresh generation the add
> >     charged; the batch records file, that gen -> G', matching that
> >     charge.
> >
> > Unlike the drift of lazy promotions, which sort_folio() repairs under
> > the lruvec lock, the phantom deltas from before this fix land in a
> > column the folio never occupies again, so nothing ever repairs them.
> >
> > Fixes: 018ee47f1489 ("mm: multi-gen LRU: exploit locality in rmap")
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
> >  include/linux/mm_inline.h |  7 ++++++-
> >  mm/vmscan.c               | 13 +++++++------
> >  2 files changed, 13 insertions(+), 7 deletions(-)
> >

Thanks for the review!

> > diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> > index 047295ae6e8a..7e487c23aff7 100644
> > --- a/include/linux/mm_inline.h
> > +++ b/include/linux/mm_inline.h
> > @@ -10,6 +10,11 @@
> >  #include <linux/userfaultfd_k.h>
> >  #include <linux/leafops.h>
> >
> > +static inline int folio_flags_is_file_lru(const unsigned long *flags)
> > +{
> > +       return !test_bit(PG_swapbacked, flags);
> > +}
> > +
> >  /**
> >   * folio_is_file_lru - Should the folio be on a file LRU or anon LRU?
> >   * @folio: The folio to test.
> > @@ -27,7 +32,7 @@
> >   */
> >  static inline int folio_is_file_lru(const struct folio *folio)
> >  {
> > -       return !folio_test_swapbacked(folio);
> > +       return folio_flags_is_file_lru(const_folio_flags(folio, 0));
> >  }
>
> I guess we don't need to change this function? It seems more natural to
> me to keep using `!folio_test_swapbacked(folio)` here.
>
> In `folio_update_gen()`, you already use
> `*is_file =3D folio_flags_is_file_lru(&old_flags)` to get the type from
> `old_flags`. I guess that's all we need?

Yeah, that's all we need, I was thinking that using
folio_flags_is_file_lru here can avoid any further change to
PG_swapbacked causing inconsistency of folio_is_file_lru and
folio_flags_is_file_lru, seems a bit easier to maintain.

>
> >
> >  static __always_inline void __update_lru_size(struct lruvec *lruvec,
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index 724b6e034e69..87e667c410ed 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -3269,7 +3269,8 @@ static bool positive_ctrl_err(struct ctrl_pos *sp=
, struct ctrl_pos *pv)
> >   *********************************************************************=
*********/
> >
> >  /* promote pages accessed through page tables */
> > -static int folio_update_gen(struct folio *folio, int new_gen, const vm=
a_flags_t *vma_flags)
> > +static int folio_update_gen(struct folio *folio, int new_gen, int *is_=
file,
>
> Rather than is_file, I feel was_file would be more accurate here,
> since it doesn't represent what the folio is now.

I'm fine either way, is_file seems more natual to me. Or maybe simply
rename it as "type"? Just the below:

> > @@ -3532,9 +3533,9 @@ static void walk_update_folio(struct lru_gen_mm_w=
alk *walk, struct vm_area_struc
> >                 folio_mark_dirty(folio);
> >
> >         if (walk) {
> > -               old_gen =3D folio_update_gen(folio, new_gen, &vma->flag=
s);
> > +               old_gen =3D folio_update_gen(folio, new_gen, &file, &vm=
a->flags);
> >                 if (old_gen >=3D 0 && old_gen !=3D new_gen)
> > -                       update_batch_size(walk, folio, old_gen, new_gen=
);
> > +                       update_batch_size(walk, folio, old_gen, new_gen=
, file);
>
> This is one more place where we rely on `LRU_GEN_ANON =3D 0` and
> `LRU_GEN_FILE =3D 1`.
>
> We do this kind of thing quite often in MGLRU, such as `type =3D !type`.
> It relies on the numeric values of the type constants, which is sort of
> a semantic abuse, but it's hard to find a shorter way to express it.

We also ahve WORKINGSET_ANON, WORKINGSET_FILE, ANON_AND_FILE. I can
rename the newly added parameter to "type" here if that looks better.
