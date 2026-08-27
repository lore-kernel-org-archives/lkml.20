Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D23E477995
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787849819; cv=pass; b=hzBvYYZvoRadALGfTys1QLFeQr3Z/oZ6LC3TYbkFmByxkgghkGbkBQ7IsR4cxJQZft6z9apnYlTK8zHvqBczz5hcTGoJxj6ORczlQrwTlqNGqM2giRd6MzUrhYmsarMuQsthyFPfdE4RwWOMx/6sVwWjJCDmzuWx/Uw3hDO8enE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787849819; c=relaxed/simple;
	bh=oiUNWF1QscLRq+iNHky6YxGBOmsRbmCQ0fflbUc3frA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I05PzXeFvY4XoO51Z9LMQhn7AEFmJ6KikKyLyfhLNBpgOrquSIlpXSVtI7LpndwSs01c0RpIaeLpA3grPVZDollrQGeceUHEvfMr54SgH63GwHTI3AgcnUXidd4dcIvGEAZeFYYGmM2F2UrGLZ9a1b3BITBcvkiM8scQ0lFQHc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QTtN80JO; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QTtN80JO"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b4adcce4b1so5894e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:56:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787849813; cv=none;
        d=google.com; s=arc-20260327;
        b=lB9VxOR14EIiqHjPjhRX+MedB0u7hQwAK/Che3Nh0TyfOEgLffioCLBhgalHF7Opkq
         7B7/9M62d4ubsD0t24ik/eArjqAR6sfIcu/NC6nO5xsPbEMUzP4uBuEQEkYFVdFbmtY5
         wbJMheO4LyxIPZUmhbnCBgPxUSMbSC2G51YdmpfEk/kFc//qM4MtpfHDjxTlyBeT6iFx
         xuZOL9iWK2o7GAqm148VqOV9f0AtEAwLCGBJPLLCrrzadkha5ygbjEaJsV9nKkg8Eyoa
         SgHo9YcS2uNxdr5vyy/NmJVDqbRhCj/iiM2vDlH+0j73bXFavDC9jEvGyei7+IzwVVCv
         DJvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w8bMtPhK9xH3h4coKuMHEBCb7sVGGbhmNmgEhd8raOo=;
        fh=S/0l3KDbN/yrHqYDMR4kVfawTV5lIEHVzLEH05MVTEA=;
        b=fq03GVWW392eKXKs9bATTHqHw64sSUK7y+UHpM1wl0obBWaJyqONhhXJV8Xf0ZPeKL
         6mC5x4RMS8YNS9a7hnk/QsEr20aVBdruyUkbSCDvjJMcERM+vJpOddn9alIVpnF/64V/
         nNwsWHbCm1/LvmkXd1wiNHKzPdaaUqQdR5tNxp1FvItmVn+yMp332dxsgHZ/yNK5tZG7
         2Gq7VgatDd7OrKaG04WRAtaSMi2aE7/CQxQh1N9S+vwmLFewtCiIPHq4GrL9jzuIiBGN
         mLHmaCZswgp7UVGhmUuMvqld2PdV520JjLmSCYg5e8+1/R4T5umnrVsIeXQ/nVMU7JuR
         +JEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787849813; x=1788454613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w8bMtPhK9xH3h4coKuMHEBCb7sVGGbhmNmgEhd8raOo=;
        b=QTtN80JOl1dnE0L4r98pyvm80rsFUg8sopODs/ykSbR4a9bS+b+QvmVWsH5c6+VZos
         SbBDIdo3JVBtOfN8Ci8u7cPln8lll4nqWMy5TRjjl32KzE8OsRtR4nH+yunM4+bVKaor
         X3lcWGelAZ1l+K6Oj8emjkEAkYXqV6Uku1lo0KEiKKlcSwxUo47hU5E08Asm53g2dvQx
         6x0ajJ4AlA/GjVJi5yJ4OUS7fp4VT3zSLQkKXXXWP0Lcmf7rPrm1cNlbm4YCAfMnYwP1
         KNlShru7Fh13dB9PHi/l6ypWThr0gfq12kDK7yw6zdRB94OEaGFGLv3NMVo54KWxncFc
         6Hxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849813; x=1788454613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w8bMtPhK9xH3h4coKuMHEBCb7sVGGbhmNmgEhd8raOo=;
        b=SkSQUeXHpiggJxOucLdVcmcbPO90y7FUv2Y7fY4HbzLC73VKIxCpetqphC5TZwjgVS
         VC7QlTyoXOO3Uge2WuYBJ1lHT8GRow2ZHunn3/Q6QxgURwEPmmfXqQjVrivcmy6sAyHg
         kPU0DfJ1FH1L9Y5QV5np1iIiPQcLzHBuRfCEaKatzS1HteH9eoHZfu3fzkIBC3C3LcYo
         fJlwEkHo50IznfwhxtGT1WSGdfHbCcd3qtHqjykhiMDvgRtlWRWHtNUkeTZMR7rns7kO
         ts6vqVKs6UVpYnIvHsmvxR6lo0hJkPM0reVwi/1T6imRXGa1q1QD884YCW8pbgBJ+jZs
         PC/Q==
X-Forwarded-Encrypted: i=1; AHgh+RoNXMU2FWoT0N+qeoahyLwnxMwy1JwjeBGaEUVwrTx/7o2C+L5j3eCWx/qfBk+ipAdcwri+0dUeOJkuLqA=@vger.kernel.org
X-Gm-Message-State: AFuF++nCWu9aqi8rhDkxEkuiINWD+WWnLhMo6BdMdKDtb3ykOqJ8Cxa/
	Mcj5RKC4dKCXWmx2v5PDarzuNeNy75LVb4ekz8yoKwIgX+Rhi7I2mjQGfC0KT8B458+Wghg67Ol
	SpWcndztI0VyAbpJEN+YrUyxQEGJQJOI=
X-Gm-Gg: AR+sD11ZaynKS8Cok6WmlgHazCuZUxiQ+UaREj2MqfmfK6GBjhrle8ZvravRVzCJOj5
	+P+VaRYDTgh8Q2sBZ/J+Lp4xS1koKgZI96OVvEH65or0iGFymDkYQaueeD2P0seCsS14TTiuELT
	gXcRbhSoojrhl/blxW3NGl8SM6XaWKRBBgXju4gW49ra/QTID4kb+WzraWFIEBxPf4wVQMMoOoR
	acNmFCXsI/Qx95tCgeKg3h0hzyEO7FmfHnh8ffKt416YFdOPTc/yNGguaL+Gx7O4yNsWsGlOmuF
	GRvba12p9Mco43WcZaxLo09vXR+y6X5yoRlwv7Mh7MEOs8273f3w1uoJ9Nrhjf0PW330XZA56Wu
	jfc/ggCroxqoAd13kvMZlxMgv5rIvIiM=
X-Received: by 2002:a05:6512:31cc:b0:5b5:3b86:602 with SMTP id
 2adb3069b0e04-5b53b8607f4mr2579874e87.23.1787849812516; Thu, 27 Aug 2026
 09:56:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825130126.2078627-1-chao@kernel.org> <20260825130126.2078627-2-chao@kernel.org>
 <CACOAw_z5fKX2refsnOzUFSXQLVkCetHyzujxEepuja5x+E=mkw@mail.gmail.com> <1719b723-988a-4f97-b46f-b74c8d1a94e0@kernel.org>
In-Reply-To: <1719b723-988a-4f97-b46f-b74c8d1a94e0@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 27 Aug 2026 09:56:39 -0700
X-Gm-Features: AcwNN1Xre4Dp6FMWXw76wqqfdBqlghim2CrcS54rmkyL8NOlKJZMj8sZlItCE_c
Message-ID: <CACOAw_z-QjubNTcodONJoa07qQvvNufBE7sDVegyonJoFPoARQ@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v3 01/12] f2fs: cache: implement metadata cache
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 6:17=E2=80=AFPM Chao Yu <chao@kernel.org> wrote:
>
> On 8/27/26 03:14, Daeho Jeong wrote:
> > On Tue, Aug 25, 2026 at 6:05=E2=80=AFAM Chao Yu via Linux-f2fs-devel
> > <linux-f2fs-devel@lists.sourceforge.net> wrote:
> >>
> >> This patch introduces the core metadata block caching infrastructure t=
o
> >> manage f2fs metadata independently of the page cache.
> >>
> >> It implements:
> >> - core cache APIs: get, create, put, drop, backed by a radix tree and
> >>   a single global LRU list.
> >> - support multiple status of cached block: LOCKED, UPTODATE, DIRTY,
> >>   WRITEBACK, INLINE.
> >> - internal bio based read/write helpers with adjacent block vector mer=
ging.
> >>
> >> Signed-off-by: Chao Yu <chao@kernel.org>
> >> ---
> >>  fs/f2fs/Makefile |   2 +-
> >>  fs/f2fs/cache.c  | 536 ++++++++++++++++++++++++++++++++++++++++++++++=
+
> >>  fs/f2fs/cache.h  | 175 ++++++++++++++++
> >>  fs/f2fs/data.c   | 282 ++++++++++++++++++++++---
> >>  fs/f2fs/f2fs.h   |  24 +++
> >>  fs/f2fs/iostat.h |  11 +
> >>  6 files changed, 1002 insertions(+), 28 deletions(-)
> >>  create mode 100644 fs/f2fs/cache.c
> >>  create mode 100644 fs/f2fs/cache.h
> >>
> >> diff --git a/fs/f2fs/Makefile b/fs/f2fs/Makefile
> >> index 8a7322d229e4..fbf49c30b066 100644
> >> --- a/fs/f2fs/Makefile
> >> +++ b/fs/f2fs/Makefile
> >> @@ -3,7 +3,7 @@ obj-$(CONFIG_F2FS_FS) +=3D f2fs.o
> >>
> >>  f2fs-y         :=3D dir.o file.o inode.o namei.o hash.o super.o inlin=
e.o
> >>  f2fs-y         +=3D checkpoint.o gc.o data.o node.o segment.o recover=
y.o
> >> -f2fs-y         +=3D shrinker.o extent_cache.o sysfs.o
> >> +f2fs-y         +=3D shrinker.o extent_cache.o sysfs.o cache.o
> >>  f2fs-$(CONFIG_F2FS_STAT_FS) +=3D debug.o
> >>  f2fs-$(CONFIG_F2FS_FS_XATTR) +=3D xattr.o
> >>  f2fs-$(CONFIG_F2FS_FS_POSIX_ACL) +=3D acl.o
> >> diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
> >> new file mode 100644
> >> index 000000000000..8f09492c402f
> >> --- /dev/null
> >> +++ b/fs/f2fs/cache.c
> >> @@ -0,0 +1,536 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * Copyright (c) 2026 Google LLC
> >> + * Author: Chao Yu <chaseyu@google.com>
> >> + */
> >> +#include <linux/fs.h>
> >> +#include <linux/f2fs_fs.h>
> >> +#include <linux/radix-tree.h>
> >> +#include <linux/slab.h>
> >> +#include <linux/list.h>
> >> +#include <linux/pagemap.h>
> >> +#include <linux/kthread.h>
> >> +#include <linux/freezer.h>
> >> +#include <linux/delay.h>
> >> +#include "f2fs.h"
> >> +#include "cache.h"
> >> +#include "node.h"
> >> +#include "segment.h"
> >> +
> >> +void f2fs_cache_wait_writeback_cond(struct f2fs_cached_block *entry,
> >> +                                       enum page_type type)
> >> +{
> >> +       /* in case the entry was truncated or on-going shrink */
> >> +       if (!entry->cache)
> >> +               return;
> >> +
> >> +       if (!f2fs_cache_test_writeback(entry))
> >> +               return;
> >> +
> >> +       /* submit cached bio */
> >> +       f2fs_submit_merged_write_cache(entry, type);
> >> +
> >> +       wait_on_bit_io(&entry->state, F2FS_BLOCK_WRITEBACK,
> >> +                                       TASK_UNINTERRUPTIBLE);
> >> +}
> >> +
> >> +void f2fs_cache_wait_writeback(struct f2fs_cached_block *entry)
> >> +{
> >> +       /* in case the entry was truncated or on-going shrink */
> >> +       if (!entry->cache)
> >> +               return;
> >> +
> >> +       f2fs_cache_wait_writeback_cond(entry,
> >> +                       IS_META_CACHE(entry->cache) ? META : NODE);
> >> +}
> >> +
> >> +static void f2fs_cache_update_tag(struct f2fs_cached_block *entry,
> >> +               unsigned int clear_from, unsigned int set_to)
> >> +{
> >> +       struct f2fs_cached_block_list *cache =3D entry->cache;
> >> +       unsigned long flags;
> >> +
> >> +       spin_lock_irqsave(&cache->tree_lock, flags);
> >> +       if (clear_from !=3D F2FS_CACHE_TAG_NONE)
> >> +               radix_tree_tag_clear(&cache->root, entry->index, clear=
_from);
> >> +       if (set_to !=3D F2FS_CACHE_TAG_NONE)
> >> +               radix_tree_tag_set(&cache->root, entry->index, set_to)=
;
> >> +       spin_unlock_irqrestore(&cache->tree_lock, flags);
> >> +}
> >> +
> >> +bool f2fs_mark_cache_dirty(struct f2fs_cached_block *entry)
> >> +{
> >> +       struct f2fs_cached_block_list *cache =3D entry->cache;
> >> +
> >> +       f2fs_cache_set_uptodate(entry);
> >> +
> >> +#ifdef CONFIG_F2FS_CHECK_FS
> >> +       if (cache->type =3D=3D F2FS_NODE_CACHE && IS_INODE(cache_folio=
(entry)))
> >> +               f2fs_inode_chksum_set(cache->sbi, cache_folio(entry));
> >> +#endif
> >> +
> >> +       if (f2fs_cache_test_dirty(entry))
> >> +               return false;
> >> +
> >> +       if (!f2fs_cache_test_and_set_dirty(entry)) {
> >> +               enum count_type type =3D IS_META_CACHE(cache) ?
> >> +                               F2FS_DIRTY_META : F2FS_DIRTY_NODES;
> >> +
> >> +               f2fs_cache_update_tag(entry, F2FS_CACHE_TAG_NONE,
> >> +                                               F2FS_CACHE_TAG_DIRTY);
> >> +               inc_page_count(cache->sbi, type);
> >> +               return true;
> >> +       }
> >> +
> >> +       return false;
> >> +}
> >> +
> >> +bool f2fs_clear_cache_dirty(struct f2fs_cached_block *entry)
> >> +{
> >> +       if (!f2fs_cache_test_dirty(entry))
> >> +               return false;
> >> +
> >> +       f2fs_cache_clear_dirty(entry);
> >> +       return true;
> >> +}
> >> +
> >> +static void __drop_cache_dirty(struct f2fs_cached_block *entry, bool =
force)
> >> +{
> >> +
> >> +       struct f2fs_cached_block_list *cache =3D entry->cache;
> >> +       enum count_type type =3D IS_META_CACHE(cache) ?
> >> +                               F2FS_DIRTY_META : F2FS_DIRTY_NODES;
> >> +
> >> +       f2fs_cache_clear_uptodate(entry);
> >> +
> >> +       if (!force && !f2fs_clear_cache_dirty(entry))
> >> +               return;
> >> +
> >> +       f2fs_cache_update_tag(entry, F2FS_CACHE_TAG_DIRTY,
> >> +                                       F2FS_CACHE_TAG_NONE);
> >> +       dec_page_count(cache->sbi, type);
> >> +}
> >> +
> >> +void f2fs_drop_cache_dirty(struct f2fs_cached_block *entry)
> >> +{
> >> +       __drop_cache_dirty(entry, false);
> >> +}
> >> +
> >> +void f2fs_force_clear_cache_dirty(struct f2fs_cached_block *entry)
> >> +{
> >> +       __drop_cache_dirty(entry, true);
> >> +}
> >> +
> >> +void f2fs_start_cache_writeback(struct f2fs_cached_block *entry)
> >> +{
> >> +       f2fs_cache_set_writeback(entry);
> >> +       f2fs_cache_update_tag(entry, F2FS_CACHE_TAG_DIRTY,
> >> +                               F2FS_CACHE_TAG_WRITEBACK);
> >> +}
> >> +
> >> +void f2fs_end_cache_writeback(struct f2fs_cached_block *entry)
> >> +{
> >> +       /*
> >> +        * should call f2fs_cache_update_tag() before clearing writeba=
ck bit,
> >> +        * in case f2fs_truncate_cache() set entry->cache to NULL.
> >> +        */
> >> +       f2fs_cache_update_tag(entry, F2FS_CACHE_TAG_WRITEBACK,
> >> +                                               F2FS_CACHE_TAG_NONE);
> >> +       clear_and_wake_up_bit(F2FS_BLOCK_WRITEBACK, &entry->state);
> >> +}
> >> +
> >> +static int f2fs_cache_refcount(struct f2fs_cached_block *entry)
> >> +{
> >> +       return atomic_read(&entry->refcount);
> >> +}
> >> +
> >> +static void __f2fs_free_cache(struct f2fs_cached_block *entry)
> >> +{
> >> +       kfree(entry->data);
> >> +       kfree(entry);
> >> +}
> >> +
> >> +static void f2fs_free_cache(struct f2fs_cached_block *entry)
> >> +{
> >> +       WARN_ON_ONCE(!list_empty(&entry->list));
> >> +       WARN_ON_ONCE(f2fs_cache_refcount(entry));
> >> +       __f2fs_free_cache(entry);
> >> +}
> >> +
> >> +void f2fs_cache_get(struct f2fs_cached_block *entry)
> >> +{
> >> +       atomic_inc(&entry->refcount);
> >> +}
> >> +
> >> +static bool f2fs_cache_put(struct f2fs_cached_block *entry)
> >> +{
> >> +       WARN_ON_ONCE(!f2fs_cache_refcount(entry));
> >> +       if (atomic_dec_and_test(&entry->refcount)) {
> >> +               f2fs_free_cache(entry);
> >> +               return true;
> >> +       }
> >> +       return false;
> >> +}
> >> +
> >> +static struct f2fs_cached_block *f2fs_create_cache(
> >> +               struct f2fs_cached_block_list *cache,
> >> +               unsigned long index, bool nofail)
> >> +{
> >> +       struct f2fs_cached_block *entry;
> >> +       unsigned int flags =3D GFP_NOFS;
> >> +
> >> +       if (nofail)
> >> +               flags |=3D __GFP_NOFAIL;
> >> +
> >> +       entry =3D kzalloc_obj(*entry, flags);
> >> +       if (!entry)
> >> +               return ERR_PTR(-ENOMEM);
> >> +
> >> +       entry->data =3D kmalloc(cache->sbi->blocksize, flags);
> >> +       if (!entry->data) {
> >> +               kfree(entry);
> >> +               return ERR_PTR(-ENOMEM);
> >> +       }
> >> +
> >> +       entry->index =3D index;
> >> +
> >> +       atomic_set(&entry->refcount, 0);
> >> +       entry->next_entry =3D NULL;
> >> +       INIT_LIST_HEAD(&entry->list);
> >> +
> >> +       entry->cache =3D cache;
> >> +
> >> +       return entry;
> >> +}
> >> +
> >> +static struct f2fs_cached_block *f2fs_insert_cache(
> >> +                       struct f2fs_cached_block_list *cache,
> >> +                       unsigned long index,
> >> +                       struct f2fs_cached_block *new)
> >> +{
> >> +       struct f2fs_cached_block *e;
> >> +       int ret;
> >> +       unsigned long flags;
> >> +
> >> +       ret =3D radix_tree_preload(GFP_NOFS | __GFP_NOFAIL);
> >> +       f2fs_bug_on(cache->sbi, ret);
> >> +
> >> +       spin_lock(&cache->list_lock);
> >> +       spin_lock_irqsave(&cache->tree_lock, flags);
> >> +       e =3D radix_tree_lookup(&cache->root, index);
> >> +       if (!e) {
> >> +               e =3D new;
> >> +               f2fs_bug_on(cache->sbi, f2fs_cache_refcount(e));
> >> +
> >> +               ret =3D radix_tree_insert(&cache->root, index, e);
> >> +               f2fs_bug_on(cache->sbi, ret);
> >> +
> >> +               /* radix tree referenced cache entry */
> >> +               f2fs_cache_get(e);
> >> +               f2fs_bug_on(cache->sbi, !list_empty(&e->list));
> >> +               list_add_tail(&e->list, &cache->lru_list);
> >> +               cache->num_entries++;
> >> +       }
> >> +       f2fs_cache_get(e);
> >> +       spin_unlock_irqrestore(&cache->tree_lock, flags);
> >> +       spin_unlock(&cache->list_lock);
> >> +       radix_tree_preload_end();
> >> +
> >> +       if (new !=3D e) {
> >> +               f2fs_bug_on(cache->sbi, f2fs_cache_refcount(new));
> >> +               __f2fs_free_cache(new);
> >> +       }
> >> +
> >> +       return e;
> >> +}
> >> +
> >> +struct f2fs_cached_block *f2fs_find_cache(
> >> +                       struct f2fs_cached_block_list *cache,
> >> +                       unsigned long index)
> >> +{
> >> +       struct f2fs_cached_block *entry;
> >> +       unsigned long flags;
> >> +
> >
> > Every lookup acquires both cache->list_lock and cache->tree_lock to
> > move the entry to the LRU tail
> >
> > For metadata and node caches, lookup is a very frequent, read-heavy ope=
ration.
> > Grabbing the global list_lock and moving the entry on every single
> > cache hit will cause severe spinlock contention.
> >
> > Instead of updating the LRU list synchronously on every lookup,
> > consider adopting a reference bit like VFS?
>
> Daeho,
>
> IIUC, do you mean something like this?
>
> update_lru =3D flag & F2FS_CACHE_ACCESS;
>
> if (update_lru)
>         spin_lock(&cache->list_lock);
> spin_lock_irqsave(&cache->tree_lock, flags);
> ...
>         if (update_lru && !list_empty(&entry->list))
>                 list_move_tail(&entry->list, &cache->lru_list);
> ...
> spin_unlock_irqrestore(&cache->tree_lock, flags);
> if (update_lru)
>          spin_unlock(&cache->list_lock);
>

Hi Chao,

The idea is to drop list_lock completely from f2fs_find_cache() by
deferring LRU rotation to the shrinker (like page cache's
PG_referenced / clock algorithm):

In f2fs_find_cache() (no list_lock at all):

if (entry) {
    f2fs_cache_get(entry);
    set_bit(F2FS_BLOCK_REFERENCED, &entry->state);
}

In f2fs_do_shrink_cache() Phase 1 (under list_lock):

list_for_each_entry_safe(entry, next, &cache->lru_list, list) {
    /* If accessed, give it a second chance and rotate to tail */
    if (test_and_clear_bit(F2FS_BLOCK_REFERENCED, &entry->state)) {
        list_move_tail(&entry->list, &cache->lru_list);
        continue;
    }
    ...
    /* Reclaim cold entry */
}

This completely eliminates list_lock overhead from the read lookup
path while keeping active entries protected from eviction.

Thanks,

> Thanks,
>
> >
> > Thanks,
> >
> >> +       spin_lock(&cache->list_lock);
> >> +       spin_lock_irqsave(&cache->tree_lock, flags);
> >> +       entry =3D radix_tree_lookup(&cache->root, index);
> >> +       if (entry) {
> >> +               f2fs_bug_on(cache->sbi, !f2fs_cache_refcount(entry));
> >> +               f2fs_cache_get(entry);
> >> +               if (!list_empty(&entry->list))
> >> +                       list_move_tail(&entry->list, &cache->lru_list)=
;
> >> +
> >> +       } else {
> >> +               entry =3D ERR_PTR(-ENOENT);
> >> +       }
> >> +       spin_unlock_irqrestore(&cache->tree_lock, flags);
> >> +       spin_unlock(&cache->list_lock);
> >> +
> >> +       return entry;
> >> +}
> >> +
> >> +struct f2fs_cached_block *f2fs_grab_cache(
> >> +                       struct f2fs_cached_block_list *cache,
> >> +                       unsigned long index, int flags)
> >> +
> >> +{
> >> +       struct f2fs_cached_block *entry, *new;
> >> +       bool create =3D flags & F2FS_CACHE_CREATE;
> >> +       bool nofail =3D flags & F2FS_CACHE_NOFAIL;
> >> +       bool lock =3D flags & F2FS_CACHE_LOCK;
> >> +
> >> +repeat:
> >> +       entry =3D f2fs_find_cache(cache, index);
> >> +       if (!IS_ERR(entry))
> >> +               goto found;
> >> +
> >> +       if (!create)
> >> +               return ERR_PTR(-ENOENT);
> >> +
> >> +       new =3D f2fs_create_cache(cache, index, nofail);
> >> +       if (IS_ERR(new))
> >> +               return new;
> >> +
> >> +       entry =3D f2fs_insert_cache(cache, index, new);
> >> +found:
> >> +       if (lock) {
> >> +               f2fs_lock_cache(entry);
> >> +               /* has been truncated */
> >> +               if (entry->cache !=3D cache) {
> >> +                       f2fs_put_cache(entry, true);
> >> +                       goto repeat;
> >> +               }
> >> +       }
> >> +       return entry;
> >> +}
> >> +
> >> +bool f2fs_trylock_cache(struct f2fs_cached_block *entry)
> >> +{
> >> +       return !test_and_set_bit(F2FS_BLOCK_LOCKED, &entry->state);
> >> +}
> >> +
> >> +void f2fs_lock_cache(struct f2fs_cached_block *entry)
> >> +{
> >> +       wait_on_bit_lock(&entry->state, F2FS_BLOCK_LOCKED,
> >> +                                       TASK_UNINTERRUPTIBLE);
> >> +}
> >> +
> >> +void f2fs_unlock_cache(struct f2fs_cached_block *entry)
> >> +{
> >> +       clear_and_wake_up_bit(F2FS_BLOCK_LOCKED, &entry->state);
> >> +}
> >> +
> >> +bool f2fs_put_cache(struct f2fs_cached_block *entry, bool unlock)
> >> +{
> >> +       if (IS_ERR_OR_NULL(entry))
> >> +               return false;
> >> +       if (unlock)
> >> +               f2fs_unlock_cache(entry);
> >> +       return f2fs_cache_put(entry);
> >> +}
> >> +
> >> +unsigned int f2fs_cache_gang_lookup_tag(struct f2fs_cached_block_list=
 *cache,
> >> +                               struct f2fs_cached_block **entries,
> >> +                               pgoff_t *first_index, unsigned int max=
_nr,
> >> +                               int tag)
> >> +{
> >> +       unsigned long flags;
> >> +       int nr, i;
> >> +
> >> +       spin_lock_irqsave(&cache->tree_lock, flags);
> >> +       nr =3D radix_tree_gang_lookup_tag(&cache->root, (void **)entri=
es,
> >> +                               *first_index, max_nr, tag);
> >> +       if (!nr)
> >> +               goto out;
> >> +
> >> +       for (i =3D 0; i < nr; i++)
> >> +               f2fs_cache_get(entries[i]);
> >> +       *first_index =3D entries[nr - 1]->index + 1;
> >> +out:
> >> +       spin_unlock_irqrestore(&cache->tree_lock, flags);
> >> +       return nr;
> >> +}
> >> +
> >> +void f2fs_cache_gang_release(struct f2fs_cached_block **entries,
> >> +                               unsigned int nr_entries)
> >> +{
> >> +       int i;
> >> +
> >> +       for (i =3D 0; i < nr_entries; i++)
> >> +               f2fs_put_cache(entries[i], false);
> >> +}
> >> +
> >> +void f2fs_cache_wait_on_all_writeback(struct f2fs_cached_block_list *=
cache)
> >> +{
> >> +       unsigned long index =3D 0;
> >> +       struct f2fs_cached_block *entries[F2FS_ONSTACK_CACHES];
> >> +       int nr, i;
> >> +
> >> +next:
> >> +       nr =3D f2fs_cache_gang_lookup_tag(cache, entries, &index,
> >> +                       F2FS_ONSTACK_CACHES, F2FS_CACHE_TAG_WRITEBACK)=
;
> >> +       if (!nr)
> >> +               return;
> >> +
> >> +       for (i =3D 0; i < nr; i++)
> >> +               f2fs_cache_wait_writeback(entries[i]);
> >> +       f2fs_cache_gang_release(entries, nr);
> >> +
> >> +       cond_resched();
> >> +       goto next;
> >> +}
> >> +
> >> +static void f2fs_do_truncate_cache(struct f2fs_cached_block *entry,
> >> +                                               bool drop_dirty)
> >> +{
> >> +       struct f2fs_cached_block_list *cache =3D entry->cache;
> >> +       unsigned long flags;
> >> +
> >> +       if (!drop_dirty &&
> >> +               (f2fs_cache_test_dirty(entry) ||
> >> +               f2fs_cache_test_writeback(entry)))
> >> +               return;
> >> +
> >> +       f2fs_cache_wait_writeback(entry);
> >> +       f2fs_drop_cache_dirty(entry);
> >> +
> >> +       spin_lock(&cache->list_lock);
> >> +       spin_lock_irqsave(&cache->tree_lock, flags);
> >> +
> >> +       f2fs_bug_on(cache->sbi, !entry->cache);
> >> +       if (!radix_tree_delete(&cache->root, entry->index))
> >> +               f2fs_bug_on(cache->sbi, !entry->cache);
> >> +
> >> +       entry->cache =3D NULL;
> >> +       cache->num_entries--;
> >> +
> >> +       atomic_dec(&entry->refcount);
> >> +       f2fs_bug_on(cache->sbi, !f2fs_cache_refcount(entry));
> >> +
> >> +       f2fs_bug_on(cache->sbi, list_empty(&entry->list));
> >> +       list_del_init(&entry->list);
> >> +
> >> +       spin_unlock_irqrestore(&cache->tree_lock, flags);
> >> +       spin_unlock(&cache->list_lock);
> >> +}
> >> +
> >> +static void f2fs_truncate_cache(struct f2fs_cached_block *entry,
> >> +                                       bool drop_dirty)
> >> +{
> >> +       f2fs_lock_cache(entry);
> >> +       if (entry->cache)
> >> +               f2fs_do_truncate_cache(entry, drop_dirty);
> >> +       f2fs_unlock_cache(entry);
> >> +}
> >> +
> >> +static void f2fs_drop_cache(struct f2fs_cached_block_list *cache,
> >> +                       block_t blkaddr, bool drop_dirty)
> >> +{
> >> +       struct f2fs_cached_block *entry;
> >> +
> >> +       entry =3D f2fs_find_cache(cache, blkaddr);
> >> +       if (IS_ERR(entry))
> >> +               return;
> >> +
> >> +       f2fs_truncate_cache(entry, drop_dirty);
> >> +       f2fs_put_cache(entry, false);
> >> +}
> >> +
> >> +void f2fs_drop_cache_range(struct f2fs_cached_block_list *cache,
> >> +               unsigned long start, unsigned long len, bool drop_dirt=
y)
> >> +{
> >> +       unsigned long index =3D start;
> >> +       unsigned long end =3D (ULONG_MAX - start < len) ?
> >> +                               ULONG_MAX : (start + len);
> >> +       struct f2fs_cached_block *entries[F2FS_ONSTACK_CACHES];
> >> +       unsigned long flags;
> >> +       int nr, i;
> >> +
> >> +       if (len =3D=3D 1)
> >> +               return f2fs_drop_cache(cache, index, drop_dirty);
> >> +
> >> +next:
> >> +       spin_lock_irqsave(&cache->tree_lock, flags);
> >> +       nr =3D radix_tree_gang_lookup(&cache->root, (void **)entries, =
index,
> >> +               min((unsigned long)F2FS_ONSTACK_CACHES, end - index));
> >> +       if (!nr)
> >> +               goto out_unlock;
> >> +
> >> +       for (i =3D 0; i < nr; i++) {
> >> +               struct f2fs_cached_block *entry =3D entries[i];
> >> +
> >> +               if (entry->index >=3D end) {
> >> +                       nr =3D i;
> >> +                       break;
> >> +               }
> >> +               f2fs_cache_get(entry);
> >> +       }
> >> +out_unlock:
> >> +       spin_unlock_irqrestore(&cache->tree_lock, flags);
> >> +       if (!nr)
> >> +               return;
> >> +
> >> +       for (i =3D 0; i < nr; i++) {
> >> +               struct f2fs_cached_block *entry =3D entries[i];
> >> +
> >> +               index =3D entry->index + 1;
> >> +
> >> +               f2fs_truncate_cache(entry, drop_dirty);
> >> +       }
> >> +       f2fs_cache_gang_release(entries, nr);
> >> +
> >> +       if (index < end) {
> >> +               cond_resched();
> >> +               goto next;
> >> +       }
> >> +}
> >> +
> >> +int f2fs_init_cache(struct f2fs_sb_info *sbi,
> >> +               struct f2fs_cached_block_list *cache,
> >> +               enum f2fs_cache_type type)
> >> +{
> >> +       cache->sbi =3D sbi;
> >> +       cache->type =3D type;
> >> +       INIT_RADIX_TREE(&cache->root, GFP_ATOMIC);
> >> +       spin_lock_init(&cache->tree_lock);
> >> +       spin_lock_init(&cache->list_lock);
> >> +       INIT_LIST_HEAD(&cache->lru_list);
> >> +       cache->num_entries =3D 0;
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +void f2fs_destroy_cache(struct f2fs_cached_block_list *cache)
> >> +{
> >> +       struct list_head *head =3D &cache->lru_list;
> >> +       struct f2fs_cached_block *entry;
> >> +       unsigned long flags;
> >> +
> >> +       f2fs_cache_wait_on_all_writeback(cache);
> >> +next:
> >> +       spin_lock(&cache->list_lock);
> >> +       if (list_empty(head)) {
> >> +               spin_unlock(&cache->list_lock);
> >> +               return;
> >> +       }
> >> +       entry =3D list_first_entry(head, struct f2fs_cached_block, lis=
t);
> >> +
> >> +       spin_lock_irqsave(&cache->tree_lock, flags);
> >> +       radix_tree_delete(&cache->root, entry->index);
> >> +       cache->num_entries--;
> >> +       list_del_init(&entry->list);
> >> +       spin_unlock_irqrestore(&cache->tree_lock, flags);
> >> +
> >> +       spin_unlock(&cache->list_lock);
> >> +
> >> +       /* wait on read cache IO */
> >> +       f2fs_lock_cache(entry);
> >> +       /* wait on write cache IO */
> >> +       f2fs_cache_wait_writeback(entry);
> >> +       f2fs_bug_on(cache->sbi, f2fs_cache_test_dirty(entry));
> >> +       f2fs_bug_on(cache->sbi, f2fs_cache_test_writeback(entry));
> >> +       f2fs_bug_on(cache->sbi, !list_empty(&entry->list));
> >> +       f2fs_bug_on(cache->sbi, f2fs_cache_refcount(entry) !=3D 1);
> >> +       f2fs_put_cache(entry, true);
> >> +       goto next;
> >> +}
> >> diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
> >> new file mode 100644
> >> index 000000000000..c336d5f13418
> >> --- /dev/null
> >> +++ b/fs/f2fs/cache.h
> >> @@ -0,0 +1,175 @@
> >> +/* SPDX-License-Identifier: GPL-2.0 */
> >> +/*
> >> + * Copyright (c) 2026 Google LLC
> >> + * Author: Chao Yu <chaseyu@google.com>
> >> + */
> >> +#ifndef _LINUX_F2FS_CACHE_H
> >> +#define _LINUX_F2FS_CACHE_H
> >> +
> >> +#include <linux/pagemap.h>
> >> +#include <linux/mm.h>
> >> +#include <linux/list.h>
> >> +#include <linux/radix-tree.h>
> >> +#include <linux/spinlock.h>
> >> +#include <linux/wait.h>
> >> +#include <linux/types.h>
> >> +
> >> +struct f2fs_rwsem;
> >> +struct f2fs_io_info;
> >> +enum page_type;
> >> +
> >> +/* Represents a single cached block (meta, node) */
> >> +struct f2fs_cached_block {
> >> +       struct list_head list;          /* LRU list head */
> >> +       struct f2fs_cached_block_list *cache;   /* parent cache list *=
/
> >> +       struct f2fs_cached_block *next_entry;   /* chain for merged BI=
O */
> >> +       unsigned long index;            /* key in radix tree, (meta: p=
ba, node: nid) */
> >> +       unsigned long state;            /* cache entry state (e.g., Di=
rty, UpToDate) */
> >> +       void *data;                     /* blocksize-aligned memory (4=
KB or 16KB) */
> >> +       atomic_t refcount;              /* reference count */
> >> +};
> >> +
> >> +struct f2fs_sb_info;
> >> +
> >> +enum f2fs_cache_type {
> >> +       F2FS_META_CACHE,
> >> +       F2FS_NODE_CACHE,
> >> +};
> >> +
> >> +/* Main cache control structure (per sb_info) */
> >> +struct f2fs_cached_block_list {
> >> +       struct f2fs_sb_info *sbi;       /* Pointer to f2fs_sb_info */
> >> +       struct radix_tree_root root;    /* Radix tree for cache lookup=
 */
> >> +       spinlock_t tree_lock;           /* Lock for radix tree */
> >> +       struct list_head lru_list;      /* Single global LRU list */
> >> +       spinlock_t list_lock;           /* Lock for LRU list */
> >> +       enum f2fs_cache_type type;      /* Cache type (Node or Meta) *=
/
> >> +       unsigned long num_entries;      /* Current number of entries *=
/
> >> +};
> >> +
> >> +#define IS_META_CACHE(cache) (cache->type =3D=3D F2FS_META_CACHE)
> >> +
> >> +/* Flags for f2fs_cached_block state */
> >> +enum f2fs_cached_state {
> >> +       F2FS_BLOCK_LOCKED,              /* cache entry is locked */
> >> +       F2FS_BLOCK_UPTODATE,            /* cache data is valid */
> >> +       F2FS_BLOCK_DIRTY,               /* cache data is dirty, need t=
o writeback the data */
> >> +       F2FS_BLOCK_WRITEBACK,           /* cache data is writeback sta=
te */
> >> +       F2FS_BLOCK_INLINE_DATA,         /* indicate inline data */
> >> +};
> >> +
> >> +enum {
> >> +       __F2FS_CACHE_CREATE,            /* create the cache if there i=
s no cache entry */
> >> +       __F2FS_CACHE_LOCK,              /* get and lock the cache entr=
y */
> >> +       __F2FS_CACHE_NOFAIL,            /* do not allow failure */
> >> +};
> >> +
> >> +enum f2fs_cache_request_flag {
> >> +       F2FS_CACHE_CREATE       =3D 1 << __F2FS_CACHE_CREATE,
> >> +       F2FS_CACHE_LOCK         =3D 1 << __F2FS_CACHE_LOCK,
> >> +       F2FS_CACHE_NOFAIL       =3D 1 << __F2FS_CACHE_NOFAIL,
> >> +};
> >> +
> >> +#define F2FS_CACHE_LOCK_CREATE (F2FS_CACHE_LOCK | F2FS_CACHE_CREATE)
> >> +
> >> +#define F2FS_ONSTACK_CACHES            (32)
> >> +
> >> +#define F2FS_CACHE_FLAG_TEST_FUNC(name, flagname)                    =
  \
> >> +static inline bool f2fs_cache_test_##name(                           =
  \
> >> +                       const struct f2fs_cached_block *entry)        =
  \
> >> +{                                                                    =
  \
> >> +       return test_bit(F2FS_BLOCK_##flagname, &entry->state);        =
  \
> >> +}                                                                    =
  \
> >> +
> >> +#define F2FS_CACHE_FLAG_SET_FUNC(name, flagname)                     =
  \
> >> +static inline void f2fs_cache_set_##name(                            =
  \
> >> +                       struct f2fs_cached_block *entry)              =
  \
> >> +{                                                                    =
  \
> >> +       set_bit(F2FS_BLOCK_##flagname, &entry->state);                =
  \
> >> +}                                                                    =
  \
> >> +
> >> +#define F2FS_CACHE_FLAG_CLEAR_FUNC(name, flagname)                   =
  \
> >> +static inline void f2fs_cache_clear_##name(                          =
  \
> >> +                       struct f2fs_cached_block *entry)              =
  \
> >> +{                                                                    =
  \
> >> +       clear_bit(F2FS_BLOCK_##flagname, &entry->state);              =
  \
> >> +}                                                                    =
  \
> >> +
> >> +#define F2FS_CACHE_FLAG_TEST_AND_SET_FUNC(name, flagname)            =
  \
> >> +static inline bool f2fs_cache_test_and_set_##name(                   =
  \
> >> +                       struct f2fs_cached_block *entry)              =
  \
> >> +{                                                                    =
  \
> >> +       return test_and_set_bit(F2FS_BLOCK_##flagname, &entry->state);=
  \
> >> +}                                                                    =
  \
> >> +
> >> +F2FS_CACHE_FLAG_TEST_FUNC(locked, LOCKED);
> >> +F2FS_CACHE_FLAG_SET_FUNC(locked, LOCKED);
> >> +F2FS_CACHE_FLAG_CLEAR_FUNC(locked, LOCKED);
> >> +
> >> +F2FS_CACHE_FLAG_TEST_FUNC(uptodate, UPTODATE);
> >> +F2FS_CACHE_FLAG_SET_FUNC(uptodate, UPTODATE);
> >> +F2FS_CACHE_FLAG_CLEAR_FUNC(uptodate, UPTODATE);
> >> +
> >> +F2FS_CACHE_FLAG_TEST_FUNC(dirty, DIRTY);
> >> +F2FS_CACHE_FLAG_SET_FUNC(dirty, DIRTY);
> >> +F2FS_CACHE_FLAG_CLEAR_FUNC(dirty, DIRTY);
> >> +F2FS_CACHE_FLAG_TEST_AND_SET_FUNC(dirty, DIRTY);
> >> +
> >> +F2FS_CACHE_FLAG_TEST_FUNC(writeback, WRITEBACK);
> >> +F2FS_CACHE_FLAG_SET_FUNC(writeback, WRITEBACK);
> >> +F2FS_CACHE_FLAG_CLEAR_FUNC(writeback, WRITEBACK);
> >> +
> >> +F2FS_CACHE_FLAG_TEST_FUNC(inline, INLINE_DATA);
> >> +F2FS_CACHE_FLAG_SET_FUNC(inline, INLINE_DATA);
> >> +F2FS_CACHE_FLAG_CLEAR_FUNC(inline, INLINE_DATA);
> >> +
> >> +static inline void *cache_address(const struct f2fs_cached_block *ent=
ry)
> >> +{
> >> +       return entry->data;
> >> +}
> >> +
> >> +#define CACHED_NODE(entry)     ((struct f2fs_node *)(cache_address(en=
try)))
> >> +
> >> +static inline struct folio *cache_folio(const struct f2fs_cached_bloc=
k *entry)
> >> +{
> >> +       return virt_to_folio(entry->data);
> >> +}
> >> +
> >> +int f2fs_init_cache(struct f2fs_sb_info *sbi,
> >> +                               struct f2fs_cached_block_list *cache,
> >> +                               enum f2fs_cache_type type);
> >> +void f2fs_destroy_cache(struct f2fs_cached_block_list *cache);
> >> +void f2fs_cache_get(struct f2fs_cached_block *entry);
> >> +struct f2fs_cached_block *f2fs_find_cache(
> >> +                       struct f2fs_cached_block_list *cache,
> >> +                       unsigned long index);
> >> +#define F2FS_CACHE_TAG_NONE            0
> >> +#define F2FS_CACHE_TAG_DIRTY           1
> >> +#define F2FS_CACHE_TAG_WRITEBACK       2
> >> +
> >> +bool f2fs_trylock_cache(struct f2fs_cached_block *entry);
> >> +void f2fs_lock_cache(struct f2fs_cached_block *entry);
> >> +void f2fs_unlock_cache(struct f2fs_cached_block *entry);
> >> +bool f2fs_put_cache(struct f2fs_cached_block *entry, bool unlock);
> >> +bool f2fs_mark_cache_dirty(struct f2fs_cached_block *entry);
> >> +bool f2fs_clear_cache_dirty(struct f2fs_cached_block *entry);
> >> +void f2fs_drop_cache_dirty(struct f2fs_cached_block *entry);
> >> +void f2fs_force_clear_cache_dirty(struct f2fs_cached_block *entry);
> >> +void f2fs_start_cache_writeback(struct f2fs_cached_block *entry);
> >> +void f2fs_end_cache_writeback(struct f2fs_cached_block *entry);
> >> +unsigned int f2fs_cache_gang_lookup_tag(struct f2fs_cached_block_list=
 *cache,
> >> +               struct f2fs_cached_block **results, pgoff_t *first_ind=
ex,
> >> +               unsigned int max_items, int tag);
> >> +void f2fs_cache_gang_release(struct f2fs_cached_block **entries,
> >> +                               unsigned int nr_entries);
> >> +int f2fs_writeback_cache(struct f2fs_cached_block_list *cache, bool s=
ync);
> >> +void f2fs_cache_wait_on_all_writeback(struct f2fs_cached_block_list *=
cache);
> >> +void f2fs_cache_wait_writeback_cond(struct f2fs_cached_block *entry,
> >> +                                       enum page_type type);
> >> +void f2fs_cache_wait_writeback(struct f2fs_cached_block *entry);
> >> +struct f2fs_cached_block *f2fs_grab_cache(struct f2fs_cached_block_li=
st *cache,
> >> +                               unsigned long index, int flags);
> >> +void f2fs_drop_cache_range(struct f2fs_cached_block_list *cache,
> >> +               unsigned long start, unsigned long len, bool drop_dirt=
y);
> >> +
> >> +#endif /* _LINUX_F2FS_CACHE_H */
> >> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> >> index 6ae0eb37d20f..75ab768bb4f7 100644
> >> --- a/fs/f2fs/data.c
> >> +++ b/fs/f2fs/data.c
> >> @@ -41,11 +41,6 @@ struct f2fs_folio_state {
> >>         unsigned int            read_pages_pending;
> >>  };
> >>
> >> -struct f2fs_bio {
> >> -       struct work_struct work;
> >> -       struct bio bio;
> >> -};
> >> -
> >>  #define        F2FS_BIO_POOL_SIZE      NR_CURSEG_TYPE
> >>
> >>  int __init f2fs_init_bioset(void)
> >> @@ -69,7 +64,6 @@ bool f2fs_is_cp_guaranteed(const struct folio *folio=
)
> >>                 return folio_test_f2fs_gcing(fscrypt_pagecache_folio(f=
olio));
> >>
> >>         inode =3D mapping->host;
> >> -       sbi =3D F2FS_I_SB(inode);
> >>
> >>         if (inode->i_ino =3D=3D F2FS_META_INO(sbi) ||
> >>                         inode->i_ino =3D=3D F2FS_NODE_INO(sbi) ||
> >> @@ -437,6 +431,65 @@ static void f2fs_write_end_io(struct bio *bio)
> >>         }
> >>  }
> >>
> >> +static void f2fs_cache_read_end_io(struct bio *bio)
> >> +{
> >> +       struct f2fs_cached_block *entry =3D F2FS_BIO(bio)->entry;
> >> +       struct f2fs_sb_info *sbi =3D entry->cache->sbi;
> >> +       enum count_type io_type =3D IS_META_CACHE(entry->cache) ?
> >> +                                       F2FS_RD_META : F2FS_RD_NODE;
> >> +       struct f2fs_cached_block *next;
> >> +
> >> +       iostat_update_and_unbind_ctx(bio);
> >> +
> >> +       if (time_to_inject(sbi, FAULT_READ_IO))
> >> +               bio->bi_status =3D BLK_STS_IOERR;
> >> +
> >> +       while (entry) {
> >> +               next =3D entry->next_entry;
> >> +               entry->next_entry =3D NULL;
> >> +
> >> +               if (bio->bi_status =3D=3D BLK_STS_OK)
> >> +                       f2fs_cache_set_uptodate(entry);
> >> +
> >> +               dec_page_count(sbi, io_type);
> >> +
> >> +               f2fs_unlock_cache(entry);
> >> +               entry =3D next;
> >> +       }
> >> +       bio_put(bio);
> >> +}
> >> +
> >> +static void f2fs_cache_write_end_io(struct bio *bio)
> >> +{
> >> +       struct f2fs_cached_block *entry =3D F2FS_BIO(bio)->entry;
> >> +       struct f2fs_sb_info *sbi =3D entry->cache->sbi;
> >> +       struct f2fs_cached_block *next;
> >> +
> >> +       iostat_update_and_unbind_ctx(bio);
> >> +
> >> +       if (time_to_inject(sbi, FAULT_WRITE_IO))
> >> +               bio->bi_status =3D BLK_STS_IOERR;
> >> +
> >> +       if (bio->bi_status !=3D BLK_STS_OK)
> >> +               f2fs_stop_checkpoint(sbi, true,
> >> +                       STOP_CP_REASON_WRITE_FAIL);
> >> +
> >> +       while (entry) {
> >> +               next =3D entry->next_entry;
> >> +               entry->next_entry =3D NULL;
> >> +
> >> +               dec_page_count(sbi, F2FS_WB_CP_DATA);
> >> +
> >> +               if (!get_pages(sbi, F2FS_WB_CP_DATA) &&
> >> +                               wq_has_sleeper(&sbi->cp_wait))
> >> +                       wake_up(&sbi->cp_wait);
> >> +
> >> +               f2fs_end_cache_writeback(entry);
> >> +               entry =3D next;
> >> +       }
> >> +       bio_put(bio);
> >> +}
> >> +
> >>  #ifdef CONFIG_BLK_DEV_ZONED
> >>  static void f2fs_zone_write_end_io(struct bio *bio)
> >>  {
> >> @@ -444,7 +497,10 @@ static void f2fs_zone_write_end_io(struct bio *bi=
o)
> >>
> >>         bio->bi_private =3D io->bi_private;
> >>         complete(&io->zone_wait);
> >> -       f2fs_write_end_io(bio);
> >> +       if (f2fs_is_cache_bio(bio))
> >> +               f2fs_cache_write_end_io(bio);
> >> +       else
> >> +               f2fs_write_end_io(bio);
> >>  }
> >>  #endif
> >>
> >> @@ -531,12 +587,21 @@ static struct bio *__bio_alloc(struct f2fs_io_in=
fo *fio, int npages)
> >>                                 fio->op | fio->op_flags | f2fs_io_flag=
s(fio),
> >>                                 GFP_NOIO, &f2fs_bioset);
> >>         bio->bi_iter.bi_sector =3D sector;
> >> +       F2FS_BIO(bio)->entry =3D NULL;
> >> +       bio->bi_private =3D NULL;
> >>         if (is_read_io(fio->op)) {
> >> -               bio->bi_end_io =3D f2fs_read_end_io;
> >> -               bio->bi_private =3D NULL;
> >> +               if (fio->is_cache)
> >> +                       bio->bi_end_io =3D f2fs_cache_read_end_io;
> >> +               else
> >> +                       bio->bi_end_io =3D f2fs_read_end_io;
> >>         } else {
> >> -               bio->bi_end_io =3D f2fs_write_end_io;
> >> -               bio->bi_private =3D sbi;
> >> +               if (fio->is_cache) {
> >> +                       bio->bi_end_io =3D f2fs_cache_write_end_io;
> >> +               } else {
> >> +                       bio->bi_end_io =3D f2fs_write_end_io;
> >> +                       bio->bi_private =3D sbi;
> >> +               }
> >> +
> >>                 bio->bi_write_hint =3D f2fs_io_type_to_rw_hint(sbi,
> >>                                                 fio->type, fio->temp);
> >>                 bio->bi_write_stream =3D f2fs_io_type_to_write_stream(=
bdev, fio->type,
> >> @@ -559,7 +624,7 @@ static void f2fs_set_bio_crypt_ctx(struct bio *bio=
, const struct inode *inode,
> >>          * The f2fs garbage collector sets ->encrypted_page when it wa=
nts to
> >>          * read/write raw data without encryption.
> >>          */
> >> -       if (!fio || !fio->encrypted_page)
> >> +       if (!fio || (!fio->encrypted_page && !fio->is_cache))
> >>                 fscrypt_set_bio_crypt_ctx(bio, inode,
> >>                                 (loff_t)first_idx << inode->i_blkbits,
> >>                                 gfp_mask);
> >> @@ -769,6 +834,53 @@ void f2fs_submit_merged_write_folio(struct f2fs_s=
b_info *sbi,
> >>         __submit_merged_write_cond(sbi, NULL, folio, 0, type, true);
> >>  }
> >>
> >> +static bool __has_merged_cache(struct bio *bio,
> >> +               struct f2fs_cached_block *target)
> >> +{
> >> +       struct f2fs_cached_block *entry;
> >> +
> >> +       if (!bio)
> >> +               return false;
> >> +
> >> +       entry =3D F2FS_BIO(bio)->entry;
> >> +
> >> +       while (entry) {
> >> +               if (target && entry =3D=3D target)
> >> +                       return true;
> >> +               entry =3D entry->next_entry;
> >> +       }
> >> +       return false;
> >> +}
> >> +
> >> +bool f2fs_submit_merged_write_cache(struct f2fs_cached_block *entry,
> >> +                               enum page_type type)
> >> +{
> >> +       struct f2fs_sb_info *sbi =3D entry->cache->sbi;
> >> +       enum temp_type temp;
> >> +       bool ret =3D false;
> >> +
> >> +       for (temp =3D HOT; temp < NR_TEMP_TYPE; temp++) {
> >> +               enum page_type btype =3D PAGE_TYPE_OF_BIO(type);
> >> +               struct f2fs_bio_info *io =3D sbi->write_io[btype] + te=
mp;
> >> +               struct f2fs_lock_context lc;
> >> +               bool merged;
> >> +
> >> +               f2fs_down_read_trace(&io->io_rwsem, &lc);
> >> +               merged =3D __has_merged_cache(io->bio, entry);
> >> +               f2fs_up_read_trace(&io->io_rwsem, &lc);
> >> +
> >> +               if (merged) {
> >> +                       __f2fs_submit_merged_write(sbi, type, temp);
> >> +                       ret =3D true;
> >> +               }
> >> +
> >> +               /* TODO: use HOT temp only for meta pages now. */
> >> +               if (type >=3D META)
> >> +                       break;
> >> +       }
> >> +       return ret;
> >> +}
> >> +
> >>  void f2fs_flush_merged_writes(struct f2fs_sb_info *sbi)
> >>  {
> >>         f2fs_submit_merged_write(sbi, DATA);
> >> @@ -832,6 +944,8 @@ static bool io_type_is_mergeable(struct f2fs_bio_i=
nfo *io,
> >>
> >>         if (io->fio.op !=3D fio->op)
> >>                 return false;
> >> +       if (io->fio.is_cache !=3D fio->is_cache)
> >> +               return false;
> >>         return (io->fio.op_flags & mask) =3D=3D (fio->op_flags & mask)=
;
> >>  }
> >>
> >> @@ -1063,6 +1177,33 @@ static bool is_end_zone_blkaddr(struct f2fs_sb_=
info *sbi, block_t blkaddr)
> >>                 f2fs_blkz_is_seq(sbi, devi, blkaddr) &&
> >>                 (blkaddr % sbi->blocks_per_blkz =3D=3D sbi->blocks_per=
_blkz - 1);
> >>  }
> >> +
> >> +static void f2fs_wait_zone_io_completion(struct f2fs_sb_info *sbi,
> >> +                       struct f2fs_bio_info *io, enum page_type btype=
)
> >> +{
> >> +       if (f2fs_sb_has_blkzoned(sbi) && btype < META && io->zone_pend=
ing_bio) {
> >> +               wait_for_completion_io(&io->zone_wait);
> >> +               bio_put(io->zone_pending_bio);
> >> +               io->zone_pending_bio =3D NULL;
> >> +               io->bi_private =3D NULL;
> >> +       }
> >> +}
> >> +
> >> +static void f2fs_submit_zone_io(struct f2fs_sb_info *sbi,
> >> +                       struct f2fs_io_info *fio, struct f2fs_bio_info=
 *io,
> >> +                       enum page_type btype)
> >> +{
> >> +       if (f2fs_sb_has_blkzoned(sbi) && btype < META &&
> >> +                       is_end_zone_blkaddr(sbi, fio->new_blkaddr)) {
> >> +               bio_get(io->bio);
> >> +               reinit_completion(&io->zone_wait);
> >> +               io->bi_private =3D io->bio->bi_private;
> >> +               io->bio->bi_private =3D io;
> >> +               io->bio->bi_end_io =3D f2fs_zone_write_end_io;
> >> +               io->zone_pending_bio =3D io->bio;
> >> +               __submit_merged_bio(io);
> >> +       }
> >> +}
> >>  #endif
> >>
> >>  void f2fs_submit_page_write(struct f2fs_io_info *fio)
> >> @@ -1079,14 +1220,8 @@ void f2fs_submit_page_write(struct f2fs_io_info=
 *fio)
> >>         f2fs_down_write_trace(&io->io_rwsem, &lc);
> >>  next:
> >>  #ifdef CONFIG_BLK_DEV_ZONED
> >> -       if (f2fs_sb_has_blkzoned(sbi) && btype < META && io->zone_pend=
ing_bio) {
> >> -               wait_for_completion_io(&io->zone_wait);
> >> -               bio_put(io->zone_pending_bio);
> >> -               io->zone_pending_bio =3D NULL;
> >> -               io->bi_private =3D NULL;
> >> -       }
> >> +       f2fs_wait_zone_io_completion(sbi, io, btype);
> >>  #endif
> >> -
> >>         if (fio->in_list) {
> >>                 spin_lock(&io->io_lock);
> >>                 if (list_empty(&io->io_list)) {
> >> @@ -1141,16 +1276,109 @@ void f2fs_submit_page_write(struct f2fs_io_in=
fo *fio)
> >>
> >>         trace_f2fs_submit_folio_write(fio->folio, fio);
> >>  #ifdef CONFIG_BLK_DEV_ZONED
> >> -       if (f2fs_sb_has_blkzoned(sbi) && btype < META &&
> >> -                       is_end_zone_blkaddr(sbi, fio->new_blkaddr)) {
> >> -               bio_get(io->bio);
> >> -               reinit_completion(&io->zone_wait);
> >> -               io->bi_private =3D io->bio->bi_private;
> >> -               io->bio->bi_private =3D io;
> >> -               io->bio->bi_end_io =3D f2fs_zone_write_end_io;
> >> -               io->zone_pending_bio =3D io->bio;
> >> +       f2fs_submit_zone_io(sbi, fio, io, btype);
> >> +#endif
> >> +
> >> +       if (fio->in_list)
> >> +               goto next;
> >> +out:
> >> +       if (is_sbi_flag_set(sbi, SBI_IS_SHUTDOWN) ||
> >> +                               !f2fs_is_checkpoint_ready(sbi))
> >>                 __submit_merged_bio(io);
> >> +       f2fs_up_write_trace(&io->io_rwsem, &lc);
> >> +}
> >> +
> >> +static void f2fs_bio_add_cache(struct f2fs_io_info *fio, struct bio *=
bio)
> >> +{
> >> +       struct f2fs_bio *fbio =3D F2FS_BIO(bio);
> >> +       struct f2fs_cached_block *head =3D fbio->entry;
> >> +       struct f2fs_cached_block *new =3D fio->cache_entry;
> >> +
> >> +       new->next_entry =3D head;
> >> +       fbio->entry =3D new;
> >> +}
> >> +
> >> +int f2fs_submit_cache_read(struct f2fs_io_info *fio)
> >> +{
> >> +       struct f2fs_sb_info *sbi =3D fio->sbi;
> >> +       struct f2fs_cached_block *entry =3D fio->cache_entry;
> >> +       struct bio *bio;
> >> +       enum count_type io_type =3D IS_META_CACHE(entry->cache) ?
> >> +                               F2FS_RD_META : F2FS_RD_NODE;
> >> +
> >> +       if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
> >> +                       fio->is_por ? META_POR : (__is_meta_io(fio) ?
> >> +                       META_GENERIC : DATA_GENERIC_ENHANCE)))
> >> +               return -EFSCORRUPTED;
> >> +
> >> +       bio =3D __bio_alloc(fio, 1);
> >> +
> >> +       bio_add_virt_nofail(bio, cache_address(entry), sbi->blocksize)=
;
> >> +       f2fs_bio_add_cache(fio, bio);
> >> +       inc_page_count(sbi, io_type);
> >> +
> >> +       f2fs_submit_read_bio(sbi, bio, fio->type);
> >> +       return 0;
> >> +}
> >> +
> >> +void f2fs_submit_cache_write(struct f2fs_io_info *fio)
> >> +{
> >> +       struct f2fs_sb_info *sbi =3D fio->sbi;
> >> +       enum page_type btype =3D PAGE_TYPE_OF_BIO(fio->type);
> >> +       struct f2fs_bio_info *io =3D sbi->write_io[btype] + fio->temp;
> >> +       struct f2fs_lock_context lc;
> >> +       struct folio *folio;
> >> +
> >> +       f2fs_bug_on(sbi, is_read_io(fio->op));
> >> +
> >> +       f2fs_down_write_trace(&io->io_rwsem, &lc);
> >> +next:
> >> +#ifdef CONFIG_BLK_DEV_ZONED
> >> +       f2fs_wait_zone_io_completion(sbi, io, btype);
> >> +#endif
> >> +       if (fio->in_list) {
> >> +               spin_lock(&io->io_lock);
> >> +               if (list_empty(&io->io_list)) {
> >> +                       spin_unlock(&io->io_lock);
> >> +                       goto out;
> >> +               }
> >> +               fio =3D list_first_entry(&io->io_list,
> >> +                                               struct f2fs_io_info, l=
ist);
> >> +               list_del(&fio->list);
> >> +               spin_unlock(&io->io_lock);
> >>         }
> >> +
> >> +       verify_fio_blkaddr(fio);
> >> +
> >> +       fio->submitted =3D 1;
> >> +       inc_page_count(sbi, F2FS_WB_CP_DATA);
> >> +
> >> +       if (io->bio &&
> >> +           (!io_is_mergeable(sbi, io->bio, io, fio, io->last_block_in=
_bio,
> >> +                             fio->new_blkaddr)))
> >> +               __submit_merged_bio(io);
> >> +alloc_new:
> >> +       if (io->bio =3D=3D NULL) {
> >> +               io->bio =3D __bio_alloc(fio, BIO_MAX_VECS);
> >> +               io->fio =3D *fio;
> >> +       }
> >> +
> >> +       folio =3D cache_folio(fio->cache_entry);
> >> +
> >> +       if (!bio_add_folio(io->bio, folio, sbi->blocksize,
> >
> > Avoid virt_to_folio() on kmalloc buffers in f2fs_submit_cache_write().
> > Since entry->data is allocated via kmalloc(), it is a slab object
> > rather than a genuine pagecache/standalone folio. Passing it through
> > cache_folio() (virt_to_folio()) and bio_add_folio() introduces an
> > unnecessary round-trip?
> >
> >> +                       offset_in_folio(folio, cache_address(fio->cach=
e_entry)))) {
> >> +               f2fs_bug_on(sbi, !F2FS_BIO(io->bio)->entry);
> >> +
> >> +               __submit_merged_bio(io);
> >> +               goto alloc_new;
> >> +       }
> >> +
> >> +       f2fs_bio_add_cache(fio, io->bio);
> >> +
> >> +       io->last_block_in_bio =3D fio->new_blkaddr;
> >> +
> >> +#ifdef CONFIG_BLK_DEV_ZONED
> >> +       f2fs_submit_zone_io(sbi, fio, io, btype);
> >>  #endif
> >>         if (fio->in_list)
> >>                 goto next;
> >> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> >> index 16720f1f0a9c..84ee4601126d 100644
> >> --- a/fs/f2fs/f2fs.h
> >> +++ b/fs/f2fs/f2fs.h
> >> @@ -222,6 +222,8 @@ struct f2fs_rwsem {
> >>  #endif
> >>  };
> >>
> >> +#include "cache.h"
> >> +
> >>  struct f2fs_mount_info {
> >>         unsigned long long opt;
> >>         block_t root_reserved_blocks;   /* root reserved blocks */
> >> @@ -1372,8 +1374,10 @@ struct f2fs_io_info {
> >>         unsigned int is_por:1;          /* indicate IO is from recover=
y or not */
> >>         unsigned int encrypted:1;       /* indicate file is encrypted =
*/
> >>         unsigned int meta_gc:1;         /* require meta inode GC */
> >> +       unsigned int is_cache:1;        /* indicate IO is from interna=
l cache */
> >>         enum iostat_type io_type;       /* io type */
> >>         struct writeback_control *io_wbc; /* writeback control */
> >> +       struct f2fs_cached_block *cache_entry;
> >>         struct bio **bio;               /* bio for ipu */
> >>         sector_t *last_block;           /* last block number in bio */
> >>  };
> >> @@ -1783,6 +1787,12 @@ struct f2fs_gc_kthread {
> >>         unsigned int boost_gc_greedy;
> >>  };
> >>
> >> +struct f2fs_bio {
> >> +       struct work_struct work;
> >> +       struct f2fs_cached_block *entry;
> >> +       struct bio bio;
> >> +};
> >> +
> >>  struct f2fs_sb_info {
> >>         struct super_block *sb;                 /* pointer to VFS supe=
r block */
> >>         struct proc_dir_entry *s_proc;          /* proc entry */
> >> @@ -2326,6 +2336,16 @@ static inline bool is_node_folio(struct folio *=
folio)
> >>         return folio->mapping =3D=3D NODE_MAPPING(F2FS_F_SB(folio));
> >>  }
> >>
> >> +static inline struct f2fs_bio *F2FS_BIO(struct bio *bio)
> >> +{
> >> +       return container_of(bio, struct f2fs_bio, bio);
> >> +}
> >> +
> >> +static inline bool f2fs_is_cache_bio(struct bio *bio)
> >> +{
> >> +       return F2FS_BIO(bio)->entry !=3D NULL;
> >> +}
> >> +
> >>  static inline bool is_sbi_flag_set(struct f2fs_sb_info *sbi, unsigned=
 int type)
> >>  {
> >>         return test_bit(type, &sbi->s_flag);
> >> @@ -4241,6 +4261,8 @@ void f2fs_submit_merged_write_cond(struct f2fs_s=
b_info *sbi,
> >>                                 nid_t ino, enum page_type type);
> >>  void f2fs_submit_merged_write_folio(struct f2fs_sb_info *sbi,
> >>                                 struct folio *folio, enum page_type ty=
pe);
> >> +bool f2fs_submit_merged_write_cache(struct f2fs_cached_block *entry,
> >> +                               enum page_type type);
> >>  void f2fs_submit_merged_ipu_write(struct f2fs_sb_info *sbi,
> >>                                         struct bio **bio, struct folio=
 *folio);
> >>  void f2fs_submit_all_merged_ipu_writes(struct f2fs_sb_info *sbi);
> >> @@ -4248,6 +4270,8 @@ void f2fs_flush_merged_writes(struct f2fs_sb_inf=
o *sbi);
> >>  int f2fs_submit_page_bio(struct f2fs_io_info *fio);
> >>  int f2fs_merge_page_bio(struct f2fs_io_info *fio);
> >>  void f2fs_submit_page_write(struct f2fs_io_info *fio);
> >> +int f2fs_submit_cache_read(struct f2fs_io_info *fio);
> >> +void f2fs_submit_cache_write(struct f2fs_io_info *fio);
> >>  struct block_device *f2fs_target_device(struct f2fs_sb_info *sbi,
> >>                 block_t blk_addr, sector_t *sector);
> >>  int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkadd=
r);
> >> diff --git a/fs/f2fs/iostat.h b/fs/f2fs/iostat.h
> >> index 2025225b5bed..61c6bc8e3119 100644
> >> --- a/fs/f2fs/iostat.h
> >> +++ b/fs/f2fs/iostat.h
> >> @@ -60,6 +60,13 @@ static inline struct bio_post_read_ctx *get_post_re=
ad_ctx(struct bio *bio)
> >>         return iostat_ctx->post_read_ctx;
> >>  }
> >>
> >> +static inline void iostat_set_post_read_ctx(struct bio *bio, void *ct=
x)
> >> +{
> >> +       struct bio_iostat_ctx *iostat_ctx =3D bio->bi_private;
> >> +
> >> +       iostat_ctx->post_read_ctx =3D ctx;
> >> +}
> >> +
> >>  extern void iostat_update_and_unbind_ctx(struct bio *bio);
> >>  extern void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
> >>                 struct bio *bio, struct bio_post_read_ctx *ctx);
> >> @@ -81,6 +88,10 @@ static inline struct bio_post_read_ctx *get_post_re=
ad_ctx(struct bio *bio)
> >>  {
> >>         return bio->bi_private;
> >>  }
> >> +static inline void iostat_set_post_read_ctx(struct bio *bio, void *ct=
x)
> >> +{
> >> +       bio->bi_private =3D ctx;
> >> +}
> >>  static inline int f2fs_init_iostat_processing(void) { return 0; }
> >>  static inline void f2fs_destroy_iostat_processing(void) {}
> >>  static inline int f2fs_init_iostat(struct f2fs_sb_info *sbi) { return=
 0; }
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
