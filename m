Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1EE3AA4E8
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 19:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787771988; cv=pass; b=d/EBYX7GJFqiWsiuhBd2OCtHN1E6WSj4myl8MHopqP6uNYKzYaMamIdmlF2iSabKAY9sNZMZSQ6PamkROdbwMFdLCwxIp2giObOQyUs30Pfbfki6ijRKRlT54oVG93RCXFVk8u64gzs3KUARz2WW6xTplCHRBedEtBfHk928CW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787771988; c=relaxed/simple;
	bh=QHHedlUK034mwRTWAL2haf43BOwX/MEv86dFmL7F+V4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=spSW2+j/fMgSRGvuKTcK+wK8dmmwqTvOfL7EnNArUbqTpGy8Tyo9w2l3vtya1MajX0qhJRfbwxfvWoaxnS7g3eGETNp/ZWra1Qbi2OcqYj/GVxQsttjkBmXFtl5LPbScnHEYnb0rh50wYT4+4m54X6QzSc2zdUfJRR4sPcQHzUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z13wbFrY; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z13wbFrY"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b4af4be667so597026e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:19:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787771979; cv=none;
        d=google.com; s=arc-20260327;
        b=HKJsfWGKzsUKvA9AKxJx2y2JL6+ANzcjBNr0J/8XECriNaox3GHQwFlmBAQzKl0/1J
         hf72mSICYl0BG9keNuk2tVLhw2L0z/zNvLZLjQRTeuv3wWtJdd7cnUxPO50//9734tDL
         UTbZs5HcF3CjIzn+xUe2IBbzGba0BT3T7pB1WBaDe6Qt6RYWhLNEGe6haWzJQYTvHf8a
         etR56eCuS/dF6/wlvlmBWzvBjeVqeWMCszNy7n6uRoOZVkU7/ZdIxitOByWGplNt0bvL
         cR8bj6MWhm2KZD2Km1/9tLjsTWxsUvvbmAQjtUKcCzpcGQjJhQaO/A6tvMoSAU+Arkrz
         YPDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t2i2L6YTIGnhSB42KjZpaHV6HA/UT99vGI1+wnSQ1WY=;
        fh=EgR4TCxqatVveWx3P9p8Zb9dOsVbriJyWv/7T5PNgo8=;
        b=OgWiyw5pDFIoBdvBEJo+xi+MXk1IEpfX/HOwEDpuafO2HAaOPUd54/ZVaCUB1dWuEl
         lpomNOHC6ZbjdX8riBtjONMgWdWVUTlJArd3Q7lvSaSdecfwh20C3w9uJs6FEEiWQfNQ
         Y5+Z1oophRgFAsePe9vPEXkRwdYrWrzbL77mFKLEfhef35mLi+0IYYOP903Dd8BS6c2j
         dczrJ3ULvDR+452+IoXd60F9CcxCxo5K3F4UySopaYzg0/dU/ackXSSqgNwFxRRs+KyL
         dzy2n+CzCeO+W3pPtUOErhiHdSR7R3iI7CdPxYJklEgYRdeEnFkwMYrzKFCeut944UV9
         fqzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787771979; x=1788376779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t2i2L6YTIGnhSB42KjZpaHV6HA/UT99vGI1+wnSQ1WY=;
        b=Z13wbFrYMTw6xmd5LLbj4JpZOuN20EFFmD9Q3VWap/5Stx4wU3H9bLgc8pMWbE6+Ve
         SxmKgxp667m3nrQmKKmhaIx5D9swKIb4T7KFDi2/jcJTQ3/wRwUYK2DvYZXWVJQXNnAo
         Ra4N9WHAPx+r+GbPJZmewznkCxvSAb0TG8LIpcSfWkzrphRQeVvf7iN/9B+GwVJRc77o
         0GS0/eSMVukuxZBo4LYARsk8DJLyZzGQkT5UE8ZPwYmOXEvUaYTnNj4/ZVYyUlJ4mU1R
         gyo+BdDcS040eRk3gStAdYKJ/ow4+WIE/FnRhIV+uIRkQSgjcO7/QwrClpJnVLZUf0qY
         CO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787771979; x=1788376779;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t2i2L6YTIGnhSB42KjZpaHV6HA/UT99vGI1+wnSQ1WY=;
        b=LipyhHrNmkGfBgRDbmF7i+wipWYVqpOxipbv3fvYSyl7CaEm9jJyc5pLvjUhDD3mQg
         fPu8KOY4z2vF+G/2bmma4bHUNOPyzo3BT2wWjRwJBl6/pfD6Irr8lCiGJgTxtyk+rxLU
         wj4M8gpAaQH2RaH0bPVTwnvXPxz87HOAIxR/yle5HRL0BffJSJT4u93enJB2Rlc3oxYx
         OzL00ZCZP1kGgPLK4+c7Pz2TEcRArGnTTCvG/61vVFxWdXkWZz+sN4lPbMZMKjkY7Jzu
         HyEveQok2B7p/KIAyy7psqnq2mkDDmYTmYg8S22YrAcr7trMz7cdlhQdO3bjA5u7GQpI
         hWcw==
X-Forwarded-Encrypted: i=1; AHgh+RqU72HtUu2mAXmU+s7kLVPJhEo18JozPfQn+uwWQMS4r64r2n6gOwRY1b1HPBquR7PILVkzd/pgp7ZQLQA=@vger.kernel.org
X-Gm-Message-State: AFuF++kKjVPhlEVCz9QVqd+aXbyRN9kY56/XX/o5TzZyjKNhMbvp9Mre
	j30fQJc7tpQ2wX9YMFrU2MjqE8nrJfIof17tjl22QQau5ozTX2CN4CzxPnJWz+8TwX5J+iWgRs6
	m5UsYrhIgOpwy5xn0qouM1As6hh/bA68=
X-Gm-Gg: AR+sD11+OD8pwVD5+2c3FtMmOCwCfN8jzfqbeqmF3toZy7rFGx2bNY2N2AdO6FbeFHQ
	gT7RBV1Q9shvZpTa5pLjmhqemTFrTNAIv7pVlZQ9A/iF78focXpvknEy0RTPwMWP5mGMdlktjxr
	dYCsMZwlZ1LyKr7pC82+TlATwTpIZDSls8MxEMc13z/aZLIACo8ZVZ+sRIwXEij0ktV0kguZw/Y
	U0tYdqMyncm5eXKd1LwEdWaf+vHTatXi69Tw2IelxcBRLp1y/lUjBrvG2tpJw0LF59Yoonii9Pz
	FWSO2xHAgbjBst9p+VEzji1veRm51Wc3fNDgLFoZhRQ9n9TwXAxCggLVXLy6AxLhw1KNCqZLe4A
	2PA/6xXTs6IMBdC/qRoXsqukpw8ak5gHG5g==
X-Received: by 2002:ac2:59cc:0:b0:5b1:5451:d969 with SMTP id
 2adb3069b0e04-5b4a90972fcmr2330084e87.25.1787771978921; Wed, 26 Aug 2026
 12:19:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825130126.2078627-1-chao@kernel.org> <20260825130126.2078627-4-chao@kernel.org>
In-Reply-To: <20260825130126.2078627-4-chao@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 26 Aug 2026 12:19:26 -0700
X-Gm-Features: AcwNN1WZLAUcoUopOYf-cXa06xLijW-46Ik8GMb-_Y8sRpN5XDVIpoLfrFJUe-Y
Message-ID: <CACOAw_whg1SO2479NL7d=ScRVrqvwHbPWg1pB2T4nWHdGe+w7g@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v3 03/12] f2fs: cache: introduce shrinker
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 6:03=E2=80=AFAM Chao Yu via Linux-f2fs-devel
<linux-f2fs-devel@lists.sourceforge.net> wrote:
>
> This patch integrates the metadata cache into the F2FS memory shrinker
> subsystem to reclaim clean, unreferenced cached blocks under memory
> pressure.
>
> It implements f2fs_shrink_cache() using a 3-phase cache reclamin method:
> 1. isolate clean entries from lru list
> 2. truncate from radix tree under lock
> 3. splice un-reclaimed entries back
>
> And hooks the new interface into f2fs_shrink_count() and f2fs_shrink_scan=
().
>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/cache.c    | 81 ++++++++++++++++++++++++++++++++++++++++++++++
>  fs/f2fs/cache.h    |  3 ++
>  fs/f2fs/shrinker.c | 12 +++++++
>  3 files changed, 96 insertions(+)
>
> diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
> index 8f09492c402f..3cee33c69880 100644
> --- a/fs/f2fs/cache.c
> +++ b/fs/f2fs/cache.c
> @@ -534,3 +534,84 @@ void f2fs_destroy_cache(struct f2fs_cached_block_lis=
t *cache)
>         f2fs_put_cache(entry, true);
>         goto next;
>  }
> +
> +static unsigned long f2fs_do_shrink_cache(struct f2fs_cached_block_list =
*cache,
> +                                               unsigned long nr_to_scan)
> +{
> +       struct f2fs_cached_block *entry, *next;
> +       LIST_HEAD(dispose_list);
> +       LIST_HEAD(keep_list);
> +       unsigned long freed =3D 0;
> +       unsigned long isolated =3D 0;
> +
> +       /* Phase 1: Isolate candidate entries from LRU list into dispose_=
list */
> +       spin_lock(&cache->list_lock);
> +       list_for_each_entry_safe(entry, next, &cache->lru_list, list) {
> +               if (isolated++ >=3D nr_to_scan)

scanned?

> +                       break;
> +
> +               if (f2fs_cache_test_dirty(entry) ||
> +                   f2fs_cache_test_writeback(entry) ||
> +                   f2fs_cache_test_locked(entry))
> +                       continue;
> +
> +               if (f2fs_cache_refcount(entry) !=3D 1)
> +                       continue;
> +
> +               list_move_tail(&entry->list, &dispose_list);
> +       }
> +       spin_unlock(&cache->list_lock);
> +
> +       /* Phase 2: Process isolated candidates one by one */
> +       while (1) {
> +               spin_lock(&cache->list_lock);

Why do we need this lock to protect local lists?

Thanks,

> +               entry =3D list_first_entry_or_null(&dispose_list,
> +                                               struct f2fs_cached_block,=
 list);
> +               if (!entry) {
> +                       spin_unlock(&cache->list_lock);
> +                       break;
> +               }
> +               f2fs_cache_get(entry);
> +               list_move_tail(&entry->list, &keep_list);
> +               spin_unlock(&cache->list_lock);
> +
> +               if (!f2fs_trylock_cache(entry)) {
> +                       f2fs_put_cache(entry, false);
> +                       continue;
> +               }
> +
> +               /* the entry has been truncated */
> +               if (!entry->cache) {
> +                       f2fs_put_cache(entry, true);
> +                       continue;
> +               }
> +               /*
> +                * at least there are shrinker, radix tree and another us=
er
> +                * has referenced the entry.
> +                */
> +               if (f2fs_cache_refcount(entry) >=3D 3) {
> +                       f2fs_put_cache(entry, true);
> +                       continue;
> +               }
> +
> +               f2fs_do_truncate_cache(entry, false);
> +
> +               if (f2fs_put_cache(entry, true))
> +                       freed++;
> +       }
> +
> +       /* Phase 3: Splice un-reclaimed entries back onto cache->lru_list=
 */
> +       if (!list_empty(&keep_list)) {
> +               spin_lock(&cache->list_lock);
> +               list_splice_tail(&keep_list, &cache->lru_list);
> +               spin_unlock(&cache->list_lock);
> +       }
> +
> +       return freed;
> +}
> +
> +unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
> +                                       unsigned long nr_to_scan)
> +{
> +       return f2fs_do_shrink_cache(META_CACHE(sbi), nr_to_scan);
> +}
> diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
> index 7ee98d276938..618b377590da 100644
> --- a/fs/f2fs/cache.h
> +++ b/fs/f2fs/cache.h
> @@ -184,4 +184,7 @@ void f2fs_stop_cache_wb_thread(struct f2fs_sb_info *s=
bi);
>  #define f2fs_truncate_meta_caches(sbi, start, len)     \
>         f2fs_drop_cache_range(META_CACHE(sbi), start, len, true)
>
> +unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
> +                               unsigned long nr_to_scan);
> +
>  #endif /* _LINUX_F2FS_CACHE_H */
> diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
> index 4f6bf5926de4..1755c85849e4 100644
> --- a/fs/f2fs/shrinker.c
> +++ b/fs/f2fs/shrinker.c
> @@ -37,6 +37,11 @@ static unsigned long __count_extent_cache(struct f2fs_=
sb_info *sbi,
>                                 atomic_read(&eti->total_ext_node);
>  }
>
> +static unsigned long __count_cache(struct f2fs_sb_info *sbi)
> +{
> +       return sbi->meta_blocks.num_entries;
> +}
> +
>  unsigned long f2fs_shrink_count(struct shrinker *shrink,
>                                 struct shrink_control *sc)
>  {
> @@ -68,6 +73,9 @@ unsigned long f2fs_shrink_count(struct shrinker *shrink=
,
>                 /* count free nids cache entries */
>                 count +=3D __count_free_nids(sbi);
>
> +               /* count generic cache entries */
> +               count +=3D __count_cache(sbi);
> +
>                 spin_lock(&f2fs_list_lock);
>                 p =3D p->next;
>                 mutex_unlock(&sbi->umount_mutex);
> @@ -120,6 +128,10 @@ unsigned long f2fs_shrink_scan(struct shrinker *shri=
nk,
>                 if (freed < nr)
>                         freed +=3D f2fs_try_to_free_nids(sbi, nr - freed)=
;
>
> +               /* shrink generic cache entries */
> +               if (freed < nr)
> +                       freed +=3D f2fs_shrink_cache(sbi, nr - freed);
> +
>                 spin_lock(&f2fs_list_lock);
>                 p =3D p->next;
>                 list_move_tail(&sbi->s_list, &f2fs_list);
> --
> 2.49.0
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
