Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E654E36A03A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787850077; cv=pass; b=BE7xMfoDrYylYH3sPuyB/fpSeoBmSoZyuiwqYsv5o6Cvjy1j/jY6mx/zNHJliTmFyCTFHNSxizRu39td44ebSzDJUAwG7bWX0iyl7vtVrMvOp7ej1w5cNHedl3EMhanW5PkWkBN8PcKsUoNV8otcWy8kZUEd+Bt5Lqlrmx+na7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787850077; c=relaxed/simple;
	bh=homku3v6Ccm9n3FhSdeq6kW0DnSdDErMaxFmwpqpWMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rn6u3ZItfB0TWJ+5fAu8VL+aj4T8bBXkE69UHrjLvNmXGx9pYt9qfonqtRbKBOfaoAaebBS3vIVdquett4ms+IrRdOjO5wy/uEXnEHyKrJxpDolVxISdBWV3vmb2o5HWH4XT+SkKhYDMpA0JxpOdwNAELsdZQkDDB3cvdDAyrTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ErZ4+7ih; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ErZ4+7ih"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b4af4be667so29776e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:01:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787850072; cv=none;
        d=google.com; s=arc-20260327;
        b=FnvSCSZA8mMtz268CnkX3PpaL418dLbKA1C/uQSWY9dQtLmme1Vfwc1eRGwFLbZNdo
         pMKGyqxx6pIqkwnjax+RPTTrFOuRBTI+upFnNzpImKIX4Xmb8KzVqmCxUt29oLS8BGKq
         J0c8B9vLGOMsbC5j2CixsVpH9DOWPQ/83CShUoFbYwXn9m0SoqLXZWgdhA/twTbbLlir
         B5Ktgn9U2wnsxlqbJJtemGsznQ+m9URmsPl/vHyYDZZqIvrgK2zu6vM37Z5Gz3URbpj8
         AEpn2AtV5I445cEpu1F7LYH7YDy+Mz7m01yCBOWtBWw8TbcfO1c99co1E5/n8Q0rVofA
         jdfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gzRcY2d+HxSFH0Qruk+p4BImsrRlCAcy2YZCO0AsEu0=;
        fh=nzmXCcMd01l9dU7ZgwwjoLgW6TUuhFKFWk+WLEYzo8U=;
        b=LD8VNBB7ROSx6ix0ORWVy8xOlzlIrHz6lB0/Fpqh9yyFIiC5hDGXsQkH1+UdIZDj7R
         SGp5AsPTWyloZgg7vkKKp8OMX3nx6V8mVNt9rNKKzjpN+ksjnoMiK4/jwnjR2CblYhDo
         jFExtQKbgbYipopXJvI23v9MDvUUhEQ9t0ayCozOp+e87XMxDTSWIJFwT5Rf/oopLZ8/
         eAXGYIyiJlKtSZkuHAtL6GPlqS81/D1EVcjcuGzmKA7zGscz7pP7LN+qHSFe52MxqgqQ
         0xtkFtjazfY/2TwgWoFwsjkwWaqjP1R+dpCVENbmBF+E6qvuCiI1pp0ekX5VvvHkPewA
         2lWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787850072; x=1788454872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gzRcY2d+HxSFH0Qruk+p4BImsrRlCAcy2YZCO0AsEu0=;
        b=ErZ4+7ih1PgAD0HUTOL1iRtnf/ZhEewLVQycu4DA8jQ7QxucBjaneqRsxhiRCHCgom
         DNDSXsRk/oSzG0jDOwjmi6VpcF2M/R113GeCtTAIGkZli0yK8sTvec4EToJlc3xYQu7Z
         M0y3XibkWCcl1rl+KEEntx2XW1pV+DbBaP0zMHbqxmJjZoQjXW+gq8bBU1QrcxY37nku
         DwXtOIQKyN6Rfu9RCjIRCPfjsA0RCPyuIUUkeQoDtNPrjvdFV/IhQ6FMquZGp2ACBLSn
         qbn78N7HTQKeN+ZIWReREAl3E3T6ZIg5WZc4R1qN8s6qzU65174YIf2MP00ieFVUNkx5
         1uPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787850072; x=1788454872;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gzRcY2d+HxSFH0Qruk+p4BImsrRlCAcy2YZCO0AsEu0=;
        b=k9EJ/fab047h4OiycG0jIaLwErOlTYY7KFqNJ/Ug4/F+eoZ/IJCcFBaulp8vAaKG8+
         diSvnPoDxO9jDoiOIfrvxohsjbH0AQScC3jxaIr4+o4LRnmIneA9iiXi/+p+Ykosf5xl
         qjJM7s7LNqsnLlArY+ian9IBMxdFNf/OlF0J2g7eB+51wZDcPd8iRUI78VYPzdlfe/cN
         25MWMXeXopbs8WASJVRxETu6ZfuX/83wk12W0iR6L2nW+Rj0dev7C3BXX7jwq74Mp8BV
         Icu8M82/nIZVWHFa40updcPRt/6FtUnAlph0MeQov3k3wME3OqNwt8PLlsonP5IsTnFM
         NTpQ==
X-Forwarded-Encrypted: i=1; AHgh+RrrteL/kUbwcmvXPcqvBir0bmGhLDZxHZGa07IYTJUb0lilsOgUmv4NpvNPhxdr3rGwMwWHN4OQpMiViok=@vger.kernel.org
X-Gm-Message-State: AFuF++mvuGYSQIpui+KnSqiGVVcf0q5ba3PV85DQPtcqIrV/RWZn2M2M
	QPMnw6tiZ6rgo8vNtbVVxaXh7NnrZqTgJhRNdxIGCudNUmpfBPBG4SCn3y7B/cR6Qom5IM97t4x
	zNlbwCqWPUFPBcykzyIXVusTlbSGCnVI=
X-Gm-Gg: AR+sD102WbZq+NYqUNIhUcucwS8F2cebjEWSyEhoWDbkpTUikEeNEOW8oYRfuy4ALPT
	uoMI0ezt+b/UP+2Xc7FCE2SVt4dYSaSHti5h48a94MWCiTHJWVzwmObiqvLbUwCI47ZtcBfIpvK
	5ZZQyUzeJEUG8gPl6RfCDqH1lyCvPuESOECiyo68FZcM1C+gkU7QyXvSDU9LtBWWSO5o+InDIgC
	pRJJZswn5kYMGsfrZqzULVzeK/Ne/uVwauqNQTC3hex3sxQJc1XH2hxaiiBDly14eXc+6Qyrd8I
	bTiUGObQ7MAK4WtW0kZz/YyBrcWewqbor8FhxtmLBYBzGdT9kakONK02SelhKiyZYSo96VmMV2x
	wT0EwRttHTO/Ne4Tx1DZ5uMhGHZLI2ms=
X-Received: by 2002:a05:6512:3da0:b0:5b0:23cb:91ea with SMTP id
 2adb3069b0e04-5b5e690e40fmr6032e87.22.1787850071755; Thu, 27 Aug 2026
 10:01:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825130126.2078627-1-chao@kernel.org> <20260825130126.2078627-4-chao@kernel.org>
 <CACOAw_whg1SO2479NL7d=ScRVrqvwHbPWg1pB2T4nWHdGe+w7g@mail.gmail.com> <4880a9a6-4036-4fec-8507-552f1bfc9fbb@kernel.org>
In-Reply-To: <4880a9a6-4036-4fec-8507-552f1bfc9fbb@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 27 Aug 2026 10:00:59 -0700
X-Gm-Features: AcwNN1XCog8IBhVLsINutifx3duUv4Grd0AtxptlMShgPNmS0ag0w8oIlgECn2E
Message-ID: <CACOAw_zTh8FSqcaQNYcPib+vjoMMi4imS5TTzJBOgxtZN90aBA@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v3 03/12] f2fs: cache: introduce shrinker
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 6:19=E2=80=AFPM Chao Yu <chao@kernel.org> wrote:
>
> On 8/27/26 03:19, Daeho Jeong wrote:
> > On Tue, Aug 25, 2026 at 6:03=E2=80=AFAM Chao Yu via Linux-f2fs-devel
> > <linux-f2fs-devel@lists.sourceforge.net> wrote:
> >>
> >> This patch integrates the metadata cache into the F2FS memory shrinker
> >> subsystem to reclaim clean, unreferenced cached blocks under memory
> >> pressure.
> >>
> >> It implements f2fs_shrink_cache() using a 3-phase cache reclamin metho=
d:
> >> 1. isolate clean entries from lru list
> >> 2. truncate from radix tree under lock
> >> 3. splice un-reclaimed entries back
> >>
> >> And hooks the new interface into f2fs_shrink_count() and f2fs_shrink_s=
can().
> >>
> >> Signed-off-by: Chao Yu <chao@kernel.org>
> >> ---
> >>  fs/f2fs/cache.c    | 81 +++++++++++++++++++++++++++++++++++++++++++++=
+
> >>  fs/f2fs/cache.h    |  3 ++
> >>  fs/f2fs/shrinker.c | 12 +++++++
> >>  3 files changed, 96 insertions(+)
> >>
> >> diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
> >> index 8f09492c402f..3cee33c69880 100644
> >> --- a/fs/f2fs/cache.c
> >> +++ b/fs/f2fs/cache.c
> >> @@ -534,3 +534,84 @@ void f2fs_destroy_cache(struct f2fs_cached_block_=
list *cache)
> >>         f2fs_put_cache(entry, true);
> >>         goto next;
> >>  }
> >> +
> >> +static unsigned long f2fs_do_shrink_cache(struct f2fs_cached_block_li=
st *cache,
> >> +                                               unsigned long nr_to_sc=
an)
> >> +{
> >> +       struct f2fs_cached_block *entry, *next;
> >> +       LIST_HEAD(dispose_list);
> >> +       LIST_HEAD(keep_list);
> >> +       unsigned long freed =3D 0;
> >> +       unsigned long isolated =3D 0;
> >> +
> >> +       /* Phase 1: Isolate candidate entries from LRU list into dispo=
se_list */
> >> +       spin_lock(&cache->list_lock);
> >> +       list_for_each_entry_safe(entry, next, &cache->lru_list, list) =
{
> >> +               if (isolated++ >=3D nr_to_scan)
> >
> > scanned?
>
> Okay, will clean.
>
> >
> >> +                       break;
> >> +
> >> +               if (f2fs_cache_test_dirty(entry) ||
> >> +                   f2fs_cache_test_writeback(entry) ||
> >> +                   f2fs_cache_test_locked(entry))
> >> +                       continue;
> >> +
> >> +               if (f2fs_cache_refcount(entry) !=3D 1)
> >> +                       continue;
> >> +
> >> +               list_move_tail(&entry->list, &dispose_list);
> >> +       }
> >> +       spin_unlock(&cache->list_lock);
> >> +
> >> +       /* Phase 2: Process isolated candidates one by one */
> >> +       while (1) {
> >> +               spin_lock(&cache->list_lock);
> >
> > Why do we need this lock to protect local lists?
>
> I think we need to protect the entry from being relocated in f2fs_find_ca=
che()?

Ah, I see your point. In the current implementation, concurrent
f2fs_find_cache() can indeed touch entry->list while it is on
dispose_list.

However, if we adopt the referenced bit approach we discussed in Patch 01:
- f2fs_find_cache() will only set the referenced bit and will NOT call
list_move_tail() at all.
- As a result, entry->list will never be touched or relocated during
lookup, and this list_lock in Phase 2 can be safely eliminated as
well.

So moving to the referenced bit design neatly solves both problems at once.

Thanks,

>
> Thanks,
>
> >
> > Thanks,
> >
> >> +               entry =3D list_first_entry_or_null(&dispose_list,
> >> +                                               struct f2fs_cached_blo=
ck, list);
> >> +               if (!entry) {
> >> +                       spin_unlock(&cache->list_lock);
> >> +                       break;
> >> +               }
> >> +               f2fs_cache_get(entry);
> >> +               list_move_tail(&entry->list, &keep_list);
> >> +               spin_unlock(&cache->list_lock);
> >> +
> >> +               if (!f2fs_trylock_cache(entry)) {
> >> +                       f2fs_put_cache(entry, false);
> >> +                       continue;
> >> +               }
> >> +
> >> +               /* the entry has been truncated */
> >> +               if (!entry->cache) {
> >> +                       f2fs_put_cache(entry, true);
> >> +                       continue;
> >> +               }
> >> +               /*
> >> +                * at least there are shrinker, radix tree and another=
 user
> >> +                * has referenced the entry.
> >> +                */
> >> +               if (f2fs_cache_refcount(entry) >=3D 3) {
> >> +                       f2fs_put_cache(entry, true);
> >> +                       continue;
> >> +               }
> >> +
> >> +               f2fs_do_truncate_cache(entry, false);
> >> +
> >> +               if (f2fs_put_cache(entry, true))
> >> +                       freed++;
> >> +       }
> >> +
> >> +       /* Phase 3: Splice un-reclaimed entries back onto cache->lru_l=
ist */
> >> +       if (!list_empty(&keep_list)) {
> >> +               spin_lock(&cache->list_lock);
> >> +               list_splice_tail(&keep_list, &cache->lru_list);
> >> +               spin_unlock(&cache->list_lock);
> >> +       }
> >> +
> >> +       return freed;
> >> +}
> >> +
> >> +unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
> >> +                                       unsigned long nr_to_scan)
> >> +{
> >> +       return f2fs_do_shrink_cache(META_CACHE(sbi), nr_to_scan);
> >> +}
> >> diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
> >> index 7ee98d276938..618b377590da 100644
> >> --- a/fs/f2fs/cache.h
> >> +++ b/fs/f2fs/cache.h
> >> @@ -184,4 +184,7 @@ void f2fs_stop_cache_wb_thread(struct f2fs_sb_info=
 *sbi);
> >>  #define f2fs_truncate_meta_caches(sbi, start, len)     \
> >>         f2fs_drop_cache_range(META_CACHE(sbi), start, len, true)
> >>
> >> +unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
> >> +                               unsigned long nr_to_scan);
> >> +
> >>  #endif /* _LINUX_F2FS_CACHE_H */
> >> diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
> >> index 4f6bf5926de4..1755c85849e4 100644
> >> --- a/fs/f2fs/shrinker.c
> >> +++ b/fs/f2fs/shrinker.c
> >> @@ -37,6 +37,11 @@ static unsigned long __count_extent_cache(struct f2=
fs_sb_info *sbi,
> >>                                 atomic_read(&eti->total_ext_node);
> >>  }
> >>
> >> +static unsigned long __count_cache(struct f2fs_sb_info *sbi)
> >> +{
> >> +       return sbi->meta_blocks.num_entries;
> >> +}
> >> +
> >>  unsigned long f2fs_shrink_count(struct shrinker *shrink,
> >>                                 struct shrink_control *sc)
> >>  {
> >> @@ -68,6 +73,9 @@ unsigned long f2fs_shrink_count(struct shrinker *shr=
ink,
> >>                 /* count free nids cache entries */
> >>                 count +=3D __count_free_nids(sbi);
> >>
> >> +               /* count generic cache entries */
> >> +               count +=3D __count_cache(sbi);
> >> +
> >>                 spin_lock(&f2fs_list_lock);
> >>                 p =3D p->next;
> >>                 mutex_unlock(&sbi->umount_mutex);
> >> @@ -120,6 +128,10 @@ unsigned long f2fs_shrink_scan(struct shrinker *s=
hrink,
> >>                 if (freed < nr)
> >>                         freed +=3D f2fs_try_to_free_nids(sbi, nr - fre=
ed);
> >>
> >> +               /* shrink generic cache entries */
> >> +               if (freed < nr)
> >> +                       freed +=3D f2fs_shrink_cache(sbi, nr - freed);
> >> +
> >>                 spin_lock(&f2fs_list_lock);
> >>                 p =3D p->next;
> >>                 list_move_tail(&sbi->s_list, &f2fs_list);
> >> --
> >> 2.49.0
> >>
> >>
> >>
> >> _______________________________________________
> >> Linux-f2fs-devel mailing list
> >> Linux-f2fs-devel@lists.sourceforge.net
> >> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>
