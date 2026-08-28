Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7341A353A74
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787941125; cv=pass; b=aFkhpvfYr8Um9+aBAnYTX53zjOVKfJ49gN9ltVJjK8cKZo/4PJq0reKpl4+4E7SKBwvrqjh0XtBpXYDqgY+143CLSt8g0j8X34dNHvPFFJfajt0BkXQ2qDkuU0aRJVr5oKL7pj5WM+NrjqGP1h3WrfRud969ZCQu5BBQcxZyNw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787941125; c=relaxed/simple;
	bh=Vl8dq7bj4zl3FSlf8qhi5xpKTkYMqxkivImPd2d+uGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ndPjvrUDaKWP0txDVSptYXj7+5pV9SIL1/S/fbs80/ZC86NifMXhJRJJUDllHZDt8MUjdixoFYav0H7oRZohh16xV3xdd1kCZAzCQtTTV7b557zzUmNoP/GySQtKYiXxJYj78jGAc1nkkXhLk9xtQRo1oV/r7oyHNE7rJb1ZZYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UfKbfgsG; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfKbfgsG"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b4ab0e4da6so1138685e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:18:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787941121; cv=none;
        d=google.com; s=arc-20260327;
        b=rfzNCmEQt5d9b/TxNziw8MHHIZ+YHGh0yP6YKtOfepI8W2iAXa2+GvwATebLb0jnIP
         I11Hg0tojsN/qkO+IMs+TSu9ohIbUobe2VyEgSGDtgpoIPgx92MAGDlCCkKVd3EDhIu1
         qo3nv9h1FiJI38hjyBx1l5JMSvZh+B5sGqyz5/dnNEB9w8X9EbZifiuKVOo9UzBNj4Fl
         fAWRWwOcYusXm2yuusp9uMtBNYgspaxfdCgsDjxHe/CR4JnvAtu0FqZtn3yGdjpgbTwy
         XkOX304w69sMkGpPdlDI6oqnzn6CrSuIKrcAe7e24tSNaLwsqJzVkHTacOcq7SXYKLL8
         27Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pq9pm5t3qnq1QPD5G3OPazKxgHomgs6L4a3Ze2xWI04=;
        fh=5modKBxCme931BlxqWlfX7QyMRl5fIM+IROD/30JJQA=;
        b=gSlsIvk0+Ld/jRE3dD2djmasQgzPerMcxN9RvCtyJ27GA0IZ8fQB5hrY4K7ERSyLrC
         cNq6MR+N7oXmVlNfuO6mbDHoID3lAghrWTNxEKPdeEMqRh2GRD9j3KOec/dSjqjP4i96
         DaG65kfNYV2xn44m2h478ov5FZJHw8PgT1NsTdGCPO33VErtgs0Zp/mcomOYPC7bEzfR
         ie6PW5ZdE6uizy6k/Iv51bc2Wqyg0kaRpQE+tRyLur+BX04OB6cW4Jz1Js+H5TV8UjO1
         txEA6CU/RpUhbvmnNtRekHldVMlmhF+3Zv/PtkbaZ2dYrRpUaD47qAXy/py0e8jPuC3V
         MPvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787941121; x=1788545921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pq9pm5t3qnq1QPD5G3OPazKxgHomgs6L4a3Ze2xWI04=;
        b=UfKbfgsGqUUSR7e1ciDlewvb9RPC6LjFcglIwtw453lz6jNQD71J4FTXwuuUYoNUta
         BFaq44nzW4XXpCBUYqI80p8PCd44sEu+mNui4AwDMUlM2JizvuZ76OX74ZtcwR8ggNMw
         l4dG0tijmPEZ/OVYw+g3uaJnWno7rLffBmNicz0XzS27Svu7l+fLOeEsbrRBbu3YbT+J
         2uXqSxd0CCDJqvFvZ2ABwgF+vAuka9tKZPo4v2HTl4uLCNAQn1UGUQAVXe6qj70At9Jk
         VO1Sash9ZgmQ1v5WPzGGW2d006PR1K3qRj+KeSagNHkio2387+5a+9e8EOmagkC4o3R4
         CBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787941121; x=1788545921;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pq9pm5t3qnq1QPD5G3OPazKxgHomgs6L4a3Ze2xWI04=;
        b=T+5KJ97EpkI76Ta7TwxI6nl8Tlh3zfA7KBIgfthIsUz5py3Zm2XVXYYvpv8ErNrJ54
         5sOrot8JHhTse4vz2HVnKycX6BXghsQzxrfgXhJ3XNhoNLqciefDNF5xuaCncpV1BtJK
         87RS8b3fLDtrOuGoJEd/2+tJkN94F5f7xE3wrH00pd2WLE5pLlDLrAI4T2/TtkE22NOF
         Aa4xZEfsZ6cYZQ1eBl8mZOLnWJP1wpd2R9mu6oKXMxOoLaBST5S+MRrathrrHU/GAfFm
         KFpUCheXjPyXGN4NoZDbXO5BmQ6GjI3ukjXp1MgWrJ/FbnMfuKWOMMHd6d1Ufl+5yjCb
         ui/Q==
X-Forwarded-Encrypted: i=1; AHgh+RoLhwkyUYCrkzPgRAWug7DKTSX+qOawstaOAMlzFy8QLhVCOq3aKgZDmEJTKcYPWjZl6lkb5yP6Y7Iw41k=@vger.kernel.org
X-Gm-Message-State: AFuF++lGtfoRsLfvPTyxy/lTAThNFCxXQc68RX5BQhV3c3jbuohhZmdS
	qqUFyjtwHERvuy09LSL/hqG7wlqFdg0XeF2zV0w4Y3o4Bu6IxsyMEyMVXi+riq478I90kR811/R
	umAHAbXiG8RlP4p/XPyQKcdeVkfWRP2gkck6AhKZGcA==
X-Gm-Gg: AR+sD11/mPdiHeEka4LVx8nI9HCl8JMq1hzhvOp2C3cA9lO9vA7naXIJvY5wnG+CmMr
	c5/28nHW7o05JN269jXzbIdOCU9VwI1C/HAodWGY33aCl61UIsLrwGuQKcs3wdI56gvUXUBQoFj
	mYAFYPhFapfyTifzOglCXqaxkjVFVNPo/yV9o0a9Tkicsqe+C2u4PRwg2pDst7/zB9Z0EU7S32r
	YgRXVrqaAIbX31ky2oX10wvUPJe0OSrral9zZIssvQUJS45JwdXOgtqO+y/aZUpWPmGCdH5qFH6
	CVpW6GqjsZa3EetdHMqIKbejLyJCxuJ4UzoeKLlzNslqhsX8NhMEQgTjcrA5bPWSHL3vXQEsvis
	XID6bahMHLMGHzkeD8YFf0a+3W0RiVB3hOQ==
X-Received: by 2002:a05:6512:131d:b0:5ae:c542:33ef with SMTP id
 2adb3069b0e04-5b5e68c1ee1mr2560691e87.8.1787941120899; Fri, 28 Aug 2026
 11:18:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825130126.2078627-1-chao@kernel.org> <20260825130126.2078627-4-chao@kernel.org>
 <CACOAw_whg1SO2479NL7d=ScRVrqvwHbPWg1pB2T4nWHdGe+w7g@mail.gmail.com>
 <4880a9a6-4036-4fec-8507-552f1bfc9fbb@kernel.org> <CACOAw_zTh8FSqcaQNYcPib+vjoMMi4imS5TTzJBOgxtZN90aBA@mail.gmail.com>
 <a2dacbb1-4bc9-4616-b14f-85ef3a061697@kernel.org>
In-Reply-To: <a2dacbb1-4bc9-4616-b14f-85ef3a061697@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 28 Aug 2026 11:18:28 -0700
X-Gm-Features: AcwNN1W-ixdjCnx3M69efiJ9KawjYbY44A_NGpH0ZGJAqhu5CNRGXdppdYaeyvc
Message-ID: <CACOAw_zJ=8ktFTNTpL1v0=Tx5ewEj_GRrNX5YU+CboPqMz_=XA@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v3 03/12] f2fs: cache: introduce shrinker
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 7:56=E2=80=AFPM Chao Yu <chao@kernel.org> wrote:
>
> On 8/28/26 01:00, Daeho Jeong wrote:
> > On Wed, Aug 26, 2026 at 6:19=E2=80=AFPM Chao Yu <chao@kernel.org> wrote=
:
> >>
> >> On 8/27/26 03:19, Daeho Jeong wrote:
> >>> On Tue, Aug 25, 2026 at 6:03=E2=80=AFAM Chao Yu via Linux-f2fs-devel
> >>> <linux-f2fs-devel@lists.sourceforge.net> wrote:
> >>>>
> >>>> This patch integrates the metadata cache into the F2FS memory shrink=
er
> >>>> subsystem to reclaim clean, unreferenced cached blocks under memory
> >>>> pressure.
> >>>>
> >>>> It implements f2fs_shrink_cache() using a 3-phase cache reclamin met=
hod:
> >>>> 1. isolate clean entries from lru list
> >>>> 2. truncate from radix tree under lock
> >>>> 3. splice un-reclaimed entries back
> >>>>
> >>>> And hooks the new interface into f2fs_shrink_count() and f2fs_shrink=
_scan().
> >>>>
> >>>> Signed-off-by: Chao Yu <chao@kernel.org>
> >>>> ---
> >>>>  fs/f2fs/cache.c    | 81 +++++++++++++++++++++++++++++++++++++++++++=
+++
> >>>>  fs/f2fs/cache.h    |  3 ++
> >>>>  fs/f2fs/shrinker.c | 12 +++++++
> >>>>  3 files changed, 96 insertions(+)
> >>>>
> >>>> diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
> >>>> index 8f09492c402f..3cee33c69880 100644
> >>>> --- a/fs/f2fs/cache.c
> >>>> +++ b/fs/f2fs/cache.c
> >>>> @@ -534,3 +534,84 @@ void f2fs_destroy_cache(struct f2fs_cached_bloc=
k_list *cache)
> >>>>         f2fs_put_cache(entry, true);
> >>>>         goto next;
> >>>>  }
> >>>> +
> >>>> +static unsigned long f2fs_do_shrink_cache(struct f2fs_cached_block_=
list *cache,
> >>>> +                                               unsigned long nr_to_=
scan)
> >>>> +{
> >>>> +       struct f2fs_cached_block *entry, *next;
> >>>> +       LIST_HEAD(dispose_list);
> >>>> +       LIST_HEAD(keep_list);
> >>>> +       unsigned long freed =3D 0;
> >>>> +       unsigned long isolated =3D 0;
> >>>> +
> >>>> +       /* Phase 1: Isolate candidate entries from LRU list into dis=
pose_list */
> >>>> +       spin_lock(&cache->list_lock);
> >>>> +       list_for_each_entry_safe(entry, next, &cache->lru_list, list=
) {
> >>>> +               if (isolated++ >=3D nr_to_scan)
> >>>
> >>> scanned?
> >>
> >> Okay, will clean.
> >>
> >>>
> >>>> +                       break;
> >>>> +
> >>>> +               if (f2fs_cache_test_dirty(entry) ||
> >>>> +                   f2fs_cache_test_writeback(entry) ||
> >>>> +                   f2fs_cache_test_locked(entry))
> >>>> +                       continue;
> >>>> +
> >>>> +               if (f2fs_cache_refcount(entry) !=3D 1)
> >>>> +                       continue;
> >>>> +
> >>>> +               list_move_tail(&entry->list, &dispose_list);
> >>>> +       }
> >>>> +       spin_unlock(&cache->list_lock);
> >>>> +
> >>>> +       /* Phase 2: Process isolated candidates one by one */
> >>>> +       while (1) {
> >>>> +               spin_lock(&cache->list_lock);
> >>>
> >>> Why do we need this lock to protect local lists?
> >>
> >> I think we need to protect the entry from being relocated in f2fs_find=
_cache()?
> >
> > Ah, I see your point. In the current implementation, concurrent
> > f2fs_find_cache() can indeed touch entry->list while it is on
> > dispose_list.
> >
> > However, if we adopt the referenced bit approach we discussed in Patch =
01:
> > - f2fs_find_cache() will only set the referenced bit and will NOT call
> > list_move_tail() at all.
> > - As a result, entry->list will never be touched or relocated during
> > lookup, and this list_lock in Phase 2 can be safely eliminated as
> > well.
> >
> > So moving to the referenced bit design neatly solves both problems at o=
nce.
>
> Hmm, however, f2fs_truncate_cache() will race w/ shrinker,
>
> - f2fs_truncate_cache                           - f2fs_do_shrink_cache
>  - f2fs_do_truncate_cache
>   - list_del_init(&entry->list) w/ lock          - list_move_tail w/o loc=
k
>
> So we can not simply drop the list_lock in phase 2.
>
> Or we can relocate list_del_init(&entry->list) from f2fs_truncate_cache()
> to f2fs_free_cache(), but it will cause the butterfly effect:
>
> At that time entry->cache will be set to NULL in f2fs_truncate_cache() be=
cause
> now we treat entry->cache =3D=3D NULL as the entry was truncated (somethi=
ng like
> folio->mapping =3D NULL), so it can not access entry->cache->list_lock be=
fore
> deleting item from list, then we need to update the truncation definition=
 from
> entry->cache =3D=3D NULL to another state e.g. F2FS_CACHE_TRUNCATED.
>
> I suffer a lots of bugs caused by shrinker and truncation, needs to handl=
e it
> carefully here.
>
> I think we can set it as a base and improve it once it get merged, how do=
 you
> think?

Hi Chao,

Thanks for the detailed explanation. You are completely right.

Given how tricky shrinker vs truncation lifecycle races can be,
keeping the current safe locking as a solid baseline and refactoring
it in a follow-up patch after merging makes total sense to me.

Let's go with your approach!

Thanks,

>
> Thanks,
>
> >
> > Thanks,
> >
> >>
> >> Thanks,
> >>
> >>>
> >>> Thanks,
> >>>
> >>>> +               entry =3D list_first_entry_or_null(&dispose_list,
> >>>> +                                               struct f2fs_cached_b=
lock, list);
> >>>> +               if (!entry) {
> >>>> +                       spin_unlock(&cache->list_lock);
> >>>> +                       break;
> >>>> +               }
> >>>> +               f2fs_cache_get(entry);
> >>>> +               list_move_tail(&entry->list, &keep_list);
> >>>> +               spin_unlock(&cache->list_lock);
> >>>> +
> >>>> +               if (!f2fs_trylock_cache(entry)) {
> >>>> +                       f2fs_put_cache(entry, false);
> >>>> +                       continue;
> >>>> +               }
> >>>> +
> >>>> +               /* the entry has been truncated */
> >>>> +               if (!entry->cache) {
> >>>> +                       f2fs_put_cache(entry, true);
> >>>> +                       continue;
> >>>> +               }
> >>>> +               /*
> >>>> +                * at least there are shrinker, radix tree and anoth=
er user
> >>>> +                * has referenced the entry.
> >>>> +                */
> >>>> +               if (f2fs_cache_refcount(entry) >=3D 3) {
> >>>> +                       f2fs_put_cache(entry, true);
> >>>> +                       continue;
> >>>> +               }
> >>>> +
> >>>> +               f2fs_do_truncate_cache(entry, false);
> >>>> +
> >>>> +               if (f2fs_put_cache(entry, true))
> >>>> +                       freed++;
> >>>> +       }
> >>>> +
> >>>> +       /* Phase 3: Splice un-reclaimed entries back onto cache->lru=
_list */
> >>>> +       if (!list_empty(&keep_list)) {
> >>>> +               spin_lock(&cache->list_lock);
> >>>> +               list_splice_tail(&keep_list, &cache->lru_list);
> >>>> +               spin_unlock(&cache->list_lock);
> >>>> +       }
> >>>> +
> >>>> +       return freed;
> >>>> +}
> >>>> +
> >>>> +unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
> >>>> +                                       unsigned long nr_to_scan)
> >>>> +{
> >>>> +       return f2fs_do_shrink_cache(META_CACHE(sbi), nr_to_scan);
> >>>> +}
> >>>> diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
> >>>> index 7ee98d276938..618b377590da 100644
> >>>> --- a/fs/f2fs/cache.h
> >>>> +++ b/fs/f2fs/cache.h
> >>>> @@ -184,4 +184,7 @@ void f2fs_stop_cache_wb_thread(struct f2fs_sb_in=
fo *sbi);
> >>>>  #define f2fs_truncate_meta_caches(sbi, start, len)     \
> >>>>         f2fs_drop_cache_range(META_CACHE(sbi), start, len, true)
> >>>>
> >>>> +unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
> >>>> +                               unsigned long nr_to_scan);
> >>>> +
> >>>>  #endif /* _LINUX_F2FS_CACHE_H */
> >>>> diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
> >>>> index 4f6bf5926de4..1755c85849e4 100644
> >>>> --- a/fs/f2fs/shrinker.c
> >>>> +++ b/fs/f2fs/shrinker.c
> >>>> @@ -37,6 +37,11 @@ static unsigned long __count_extent_cache(struct =
f2fs_sb_info *sbi,
> >>>>                                 atomic_read(&eti->total_ext_node);
> >>>>  }
> >>>>
> >>>> +static unsigned long __count_cache(struct f2fs_sb_info *sbi)
> >>>> +{
> >>>> +       return sbi->meta_blocks.num_entries;
> >>>> +}
> >>>> +
> >>>>  unsigned long f2fs_shrink_count(struct shrinker *shrink,
> >>>>                                 struct shrink_control *sc)
> >>>>  {
> >>>> @@ -68,6 +73,9 @@ unsigned long f2fs_shrink_count(struct shrinker *s=
hrink,
> >>>>                 /* count free nids cache entries */
> >>>>                 count +=3D __count_free_nids(sbi);
> >>>>
> >>>> +               /* count generic cache entries */
> >>>> +               count +=3D __count_cache(sbi);
> >>>> +
> >>>>                 spin_lock(&f2fs_list_lock);
> >>>>                 p =3D p->next;
> >>>>                 mutex_unlock(&sbi->umount_mutex);
> >>>> @@ -120,6 +128,10 @@ unsigned long f2fs_shrink_scan(struct shrinker =
*shrink,
> >>>>                 if (freed < nr)
> >>>>                         freed +=3D f2fs_try_to_free_nids(sbi, nr - f=
reed);
> >>>>
> >>>> +               /* shrink generic cache entries */
> >>>> +               if (freed < nr)
> >>>> +                       freed +=3D f2fs_shrink_cache(sbi, nr - freed=
);
> >>>> +
> >>>>                 spin_lock(&f2fs_list_lock);
> >>>>                 p =3D p->next;
> >>>>                 list_move_tail(&sbi->s_list, &f2fs_list);
> >>>> --
> >>>> 2.49.0
> >>>>
> >>>>
> >>>>
> >>>> _______________________________________________
> >>>> Linux-f2fs-devel mailing list
> >>>> Linux-f2fs-devel@lists.sourceforge.net
> >>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> >>
>
