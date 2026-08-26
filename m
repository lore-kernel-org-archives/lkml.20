Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274B4456E0A
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787774683; cv=pass; b=KrJEibAMfst+E5sFL5DuJfDqir1g5yufmbffCRANdFaSXx5GMj6XcmyQDwJUw7kYZNBT6SIxhvRaeQqdqQrUWJOgqn4Y7jzonFdHnNhm3nQ4NvS9dKyCTekUpy7Mr6N+vvpAEBnVhzvMTuLgDrQZnOZT+H7Sno/TN7ogv5iFiTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787774683; c=relaxed/simple;
	bh=KsV5BLyekzFuk9KiaW+7gXPvcdhGSGPYYUC23yLhQrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ppph4F0zYHoQ32gMH3yxhQl8VMG1kkSGmnT9UqYkjJt3yc4vY2qL1HMjLzxJakYu9g/FizQ1D6nnLkj4d8kQ6GYGJmd4nbsKrRmubAeCRm/4qq3qguSpQ+QXiLRju/TyOeV233bsPuNZmTkk3X1FQ6ZSocpXS25eSw/94XLFpiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eeWCMyOG; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eeWCMyOG"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b015b2d792so1278660e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:04:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787774674; cv=none;
        d=google.com; s=arc-20260327;
        b=dWY5xwZ77pZjiIbf58rUDnleukpBGPNYOXudrcYBJYOn+Q8wzPHaJWFzdasPlGbj4G
         qzfVL09cvI8iZyLSVCLhZjXtKu5lAK9DHqJF8VBAWpKIfkhVIUaQRiVS1E6UkeqMPG94
         L9URlENB28W2T48uurHP54aeVHp0bxuMPrBzQ+oILBQO3+t/PYaExK+3UoaKiNtLT0H4
         RjnotyN2w5QFyDNPegq1Qush+Rhd3XMEPpHvSg1F2xL3nHo1uqjkfndYzEHO0F0Z3Nec
         75zfvVoDkLEh6/VbSJKpftF8C3JClbNxHf7loBy1ZnwKoxV5THr/1rPj4ju0Oow6+LUl
         IA4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tTTyxpzvjdWwxMmWb+pS4GlN22XjLRg3AK/ZBFBhT0U=;
        fh=oPzPnJgCyxKij57nsyQD15SRxoi2HG54QgTD27VFXBg=;
        b=b/ZdjCZPB+d3l/1I4PTCPqN6O7LZfeytoGQqd8ZulBmRl0icGeG7YagHxz4Ytzk2Fo
         aOn11129aiuWA4WM0VG1ipsqts4aTT9izphubuS9lICuE7WSaTW5tTZMjnWsxis1yZc4
         nX5EyauPb3daVCOws8bScCJvodCqxQPngUkS4J6h/y/v6sJyWuHfMCvFRxYL5enCWxhM
         HYYqW84fYD4rJ1Bbh7zImzJeQHRudiWek7PFKOMaO0v+KRqiaHCgzQ/GVv9S4GEJwQP5
         5rTPqaNFPzXw02Ip7GQbHa11Qcl3rLv5Y31SVv2LHHvaIWDlrjEl8M5NWekCNhvcjlE0
         CsQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787774674; x=1788379474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tTTyxpzvjdWwxMmWb+pS4GlN22XjLRg3AK/ZBFBhT0U=;
        b=eeWCMyOGPcMnc5md+ox/GltHZrMv4g9YNhGFZupSAM76xHh7nxv8fUmPyJtm/8utb2
         LUdcoR0OtKkP324N4NVXyqxchOl+k/rT/CE6OTEap+Nt19ujtdYovNzV0B0IUnYuwFon
         e5cy2TCpaPD74NX3niEVE6qBJ1uYd3I9HzcMbT3OIAPU9obcrIdPHyAcKyEOgWbUwZl5
         ItRX8GAMFwL2gvmvVDrvvTUfksbO5apgL9NG0vXNs4O+JKX5U1YYoNWM6rki6AvqXDKi
         TI5MVzcDmSpQSN9E8HqHePMsiYJV83aUNuZuSJ4/wvftyXTI+4tjpUPnMBzZw0So32ZG
         g7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787774674; x=1788379474;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tTTyxpzvjdWwxMmWb+pS4GlN22XjLRg3AK/ZBFBhT0U=;
        b=JYaZkH14DxZHa+HeIX8Nf9bdRSCxFAueQg9O4PmXLZsBoN5OwF96A2bll6VCoDlGG7
         qhqGCNSpkLplZeLHBvXrEJ3vy2lXcoq4nktV7lWC3vjJJb4qdjpko5yYeqoj+C7c3kHK
         73VkMTXPYRQ6n8wWuRSYTqyNdXtAFZa7jwc4OObAefbQD5kMG+1Yd8sWr9QdtndxA22I
         hTHPS4jnR7+Ly2mrq8f25Hq0fErJLFe5DX6O1MkcwlRr8NsHsEUeon4PNiEsk6COtaHn
         jMe5N5R9FYAW423BeYX5WXQUDv+zBLvyuIiu+MLp+xlR3x3zEQDmYT4vB3Fr60RDIwuF
         L2jw==
X-Forwarded-Encrypted: i=1; AHgh+Rpz2LP6Np2zccyDYxahaTVKE05B2jaegkqzyCUZRLF+lXrcZ9W0hwSRsLFYlM2BK8KMsVVT0+u4IrdO0xU=@vger.kernel.org
X-Gm-Message-State: AFuF++lXhUdoxHW0IbfGZgoNh6nbEHaRWRr8jaRRUSkwSrFb8AIPvIsH
	lCmf7mukbG56bEt8M3VjJLu6XtGxM4SF9m28kjFguMHCo2pcpdvnw3vGDWYCt1fekxnlj1q9xOq
	JWZ58yUpAhN6V68dciH0icO2Hg7ATLYY=
X-Gm-Gg: AR+sD13EQhwARkDJWj1XjxDNGoLsOkvP9w2DJsyeCxzqaTe74861xJYGMB1vQ2fOZec
	cK3N7zwv6995IG+8GlwQ9ZC03+PCvxX2avDAsxYqyoP2XXNq7NJjSvb+6dsOq/zm5KeXqxlIM1K
	R+BoFVVVXOJcJdph2xZxNZYEzTncNiDJWy5f4d76CT3D3NrPMrgdL14JOLHNBD3F1gKPmtD+5Yq
	3PTZlC6qRvL/f2EsKgeyzTOI72Fh6yCJHJY10rIko5LhsYyfQk3DwAEfnNLEmp0wIKgty5ciR0H
	k/YsmNOUEeRkQes3bwO7Rhk6TlTCn8BUOIIuvaFHGmki3v4jxyJ4J/gP6yyG/QHdCYV+0htR2v0
	H56FyUcXCD1hKnpP0f+NO+wqVPWVqS0e3ZA==
X-Received: by 2002:a05:6512:6190:b0:5b0:bc3:dc11 with SMTP id
 2adb3069b0e04-5b4a906a44amr3443908e87.22.1787774674041; Wed, 26 Aug 2026
 13:04:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825130126.2078627-1-chao@kernel.org> <20260825130126.2078627-10-chao@kernel.org>
In-Reply-To: <20260825130126.2078627-10-chao@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 26 Aug 2026 13:04:21 -0700
X-Gm-Features: AcwNN1Vszj1E99slnXrSxwvNlwOOCt5K4JuCf0eS65XCvASmBNmlSEaelXufaVw
Message-ID: <CACOAw_w+QMkTNK=McScLHh1gpm6UFjxLSnVxhFMsgsuArLA=qQ@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v3 09/12] f2fs: cache: use compress cache
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 6:03=E2=80=AFAM Chao Yu via Linux-f2fs-devel
<linux-f2fs-devel@lists.sourceforge.net> wrote:
>
> This patch migrates compressed cluster caching from the fake VFS inode
> page cache (sbi->compress_inode) to compress cache (sbi->compress_blocks)=
.
>
> It converts compression caching and decompression paths to use
> compress cache APIs, uses entry->ino for per-inode invalidation, and
> removes sbi->compress_inode.
>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/cache.c         |  14 ++--
>  fs/f2fs/cache.h         |   1 +
>  fs/f2fs/compress.c      | 158 ++++++++++++++++++----------------------
>  fs/f2fs/debug.c         |   9 ++-
>  fs/f2fs/f2fs.h          |   8 +-
>  fs/f2fs/inode.c         |  49 +------------
>  fs/f2fs/node.c          |   2 +-
>  fs/f2fs/shrinker.c      |   3 +-
>  fs/f2fs/super.c         |  15 ++--
>  include/linux/f2fs_fs.h |   1 -
>  10 files changed, 98 insertions(+), 162 deletions(-)
>
> diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
> index 8431180bb1f8..5b9055ad49b9 100644
> --- a/fs/f2fs/cache.c
> +++ b/fs/f2fs/cache.c
> @@ -417,13 +417,12 @@ static void f2fs_do_truncate_cache(struct f2fs_cach=
ed_block *entry,
>         spin_unlock(&cache->list_lock);
>  }
>
> -static void f2fs_truncate_cache(struct f2fs_cached_block *entry,
> +void f2fs_truncate_cache(struct f2fs_cached_block *entry,
>                                         bool drop_dirty)

-> __f2fs_truncate_cache() without locking?

>  {
> -       f2fs_lock_cache(entry);
> -       if (entry->cache)
> -               f2fs_do_truncate_cache(entry, drop_dirty);
> -       f2fs_unlock_cache(entry);
> +       if (!entry->cache)
> +               return;
> +       f2fs_do_truncate_cache(entry, drop_dirty);
>  }
>
>  static void f2fs_drop_cache(struct f2fs_cached_block_list *cache,
> @@ -435,8 +434,9 @@ static void f2fs_drop_cache(struct f2fs_cached_block_=
list *cache,
>         if (IS_ERR(entry))
>                 return;
>
> +       f2fs_lock_cache(entry);
>         f2fs_truncate_cache(entry, drop_dirty);
> -       f2fs_put_cache(entry, false);
> +       f2fs_put_cache(entry, true);
>  }
>
>  void f2fs_drop_cache_range(struct f2fs_cached_block_list *cache,
> @@ -478,7 +478,9 @@ void f2fs_drop_cache_range(struct f2fs_cached_block_l=
ist *cache,
>
>                 index =3D entry->index + 1;
>
> +               f2fs_lock_cache(entry);
>                 f2fs_truncate_cache(entry, drop_dirty);
> +               f2fs_unlock_cache(entry);
>         }
>         f2fs_cache_gang_release(entries, nr);
>
> diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
> index b87feb3eb896..b66dbaefee2f 100644
> --- a/fs/f2fs/cache.h
> +++ b/fs/f2fs/cache.h
> @@ -168,6 +168,7 @@ unsigned int f2fs_cache_gang_lookup_tag(struct f2fs_c=
ached_block_list *cache,
>                 unsigned int max_items, int tag);
>  void f2fs_cache_gang_release(struct f2fs_cached_block **entries,
>                                 unsigned int nr_entries);
> +void f2fs_truncate_cache(struct f2fs_cached_block *entry, bool drop_dirt=
y);
>  int f2fs_writeback_cache(struct f2fs_cached_block_list *cache, bool sync=
);
>  void f2fs_cache_wait_on_all_writeback(struct f2fs_cached_block_list *cac=
he);
>  void f2fs_cache_wait_writeback_cond(struct f2fs_cached_block *entry,
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 676a5559357f..155be3a3d203 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1918,30 +1918,19 @@ unsigned int f2fs_cluster_blocks_are_contiguous(s=
truct dnode_of_data *dn,
>         return compressed ? i - 1 : i;
>  }
>
> -const struct address_space_operations f2fs_compress_aops =3D {
> -       .release_folio =3D f2fs_release_folio,
> -       .invalidate_folio =3D f2fs_invalidate_folio,
> -       .migrate_folio  =3D filemap_migrate_folio,
> -};
> -
> -struct address_space *COMPRESS_MAPPING(struct f2fs_sb_info *sbi)
> -{
> -       return sbi->compress_inode->i_mapping;
> -}
> -
>  void f2fs_invalidate_compress_pages_range(struct f2fs_sb_info *sbi,
>                                 block_t blkaddr, unsigned int len)
>  {
> -       if (!sbi->compress_inode)
> +       if (!test_opt(sbi, COMPRESS_CACHE))
>                 return;
> -       invalidate_mapping_pages(COMPRESS_MAPPING(sbi), blkaddr, blkaddr =
+ len - 1);
> +
> +       f2fs_drop_cache_range(COMPRESS_CACHE(sbi), blkaddr, len, false);
>  }
>
>  static void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi,
>                 struct folio *folio, nid_t ino, block_t blkaddr)
>  {
> -       struct folio *cfolio;
> -       int ret;
> +       struct f2fs_cached_block *entry;
>
>         if (!test_opt(sbi, COMPRESS_CACHE))
>                 return;
> @@ -1952,49 +1941,43 @@ static void f2fs_cache_compressed_page(struct f2f=
s_sb_info *sbi,
>         if (!f2fs_available_free_memory(sbi, COMPRESS_PAGE))
>                 return;
>
> -       cfolio =3D filemap_get_folio(COMPRESS_MAPPING(sbi), blkaddr);
> -       if (!IS_ERR(cfolio)) {
> -               f2fs_folio_put(cfolio, false);
> +       entry =3D f2fs_find_cache(COMPRESS_CACHE(sbi), blkaddr);
> +       if (!IS_ERR(entry)) {
> +               f2fs_put_cache(entry, false);
>                 return;
>         }
>
> -       cfolio =3D filemap_alloc_folio(__GFP_NOWARN | __GFP_IO, 0, NULL);
> -       if (!cfolio)
> -               return;
> -
> -       ret =3D filemap_add_folio(COMPRESS_MAPPING(sbi), cfolio,
> -                                               blkaddr, GFP_NOFS);
> -       if (ret) {
> -               f2fs_folio_put(cfolio, false);
> +       entry =3D f2fs_grab_cache(COMPRESS_CACHE(sbi), blkaddr,
> +                                       F2FS_CACHE_LOCK_CREATE);
> +       if (IS_ERR(entry))
>                 return;
> -       }
>
> -       folio_set_f2fs_data(cfolio, ino);
> -
> -       memcpy(folio_address(cfolio), folio_address(folio), PAGE_SIZE);
> -       folio_mark_uptodate(cfolio);
> -       f2fs_folio_put(cfolio, true);
> +       entry->ino =3D ino;
> +       memcpy(cache_address(entry), folio_address(folio), PAGE_SIZE);
> +       f2fs_cache_set_uptodate(entry);
> +       f2fs_put_cache(entry, true);
>  }
>
>  bool f2fs_load_compressed_folio(struct f2fs_sb_info *sbi, struct folio *=
folio,
>                                                                 block_t b=
lkaddr)
>  {
> -       struct folio *cfolio;
> +       struct f2fs_cached_block *entry;
>         bool hitted =3D false;
>
>         if (!test_opt(sbi, COMPRESS_CACHE))
>                 return false;
>
> -       cfolio =3D f2fs_filemap_get_folio(COMPRESS_MAPPING(sbi),
> -                               blkaddr, FGP_LOCK | FGP_NOWAIT, GFP_NOFS)=
;
> -       if (!IS_ERR(cfolio)) {
> -               if (folio_test_uptodate(cfolio)) {
> +       entry =3D f2fs_find_cache(COMPRESS_CACHE(sbi), blkaddr);
> +       if (!IS_ERR(entry)) {
> +               f2fs_lock_cache(entry);
> +               if (f2fs_is_compress_cache(entry) &&
> +                               f2fs_cache_test_uptodate(entry)) {
>                         atomic_inc(&sbi->compress_page_hit);
>                         memcpy(folio_address(folio),
> -                               folio_address(cfolio), folio_size(folio))=
;
> +                               cache_address(entry), folio_size(folio));
>                         hitted =3D true;
>                 }
> -               f2fs_folio_put(cfolio, true);
> +               f2fs_put_cache(entry, true);
>         }
>
>         return hitted;
> @@ -2002,71 +1985,70 @@ bool f2fs_load_compressed_folio(struct f2fs_sb_in=
fo *sbi, struct folio *folio,
>
>  void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi, nid_t ino)

This is O(N) Full-tree scan on inode eviction.

WDYT to improve it?
 - Per-inode tracking
 - Re-evaluate eviction policy: Since compress cache blocks are
indexed by physical block address (blkaddr) and hold immutable disk
data, the cached blocks remain valid even after the inode is
closed/evicted.
   We should evaluate whether we actually need to synchronously purge
clean compress cache entries upon inode eviction, or if we can simply
let the memory shrinker reclaim them via LRU under memory pressure.

>  {
> -       struct address_space *mapping =3D COMPRESS_MAPPING(sbi);
> -       struct folio_batch fbatch;
> -       pgoff_t index =3D 0;
> -       pgoff_t end =3D MAX_BLKADDR(sbi);
> +       struct f2fs_cached_block_list *cache =3D COMPRESS_CACHE(sbi);
> +       struct f2fs_cached_block *entries[F2FS_ONSTACK_CACHES];
> +       unsigned long flags;
> +       pgoff_t index =3D 0, end =3D ULONG_MAX;
> +       int nr;
> +       int i;
>
> -       if (!mapping->nrpages)

Why did you remove this line?

> +       if (!test_opt(sbi, COMPRESS_CACHE))
>                 return;
> -
> -       folio_batch_init(&fbatch);
> -
> -       do {
> -               unsigned int nr, i;
> -
> -               nr =3D filemap_get_folios(mapping, &index, end - 1, &fbat=
ch);
> -               if (!nr)
> +next:
> +       spin_lock_irqsave(&cache->tree_lock, flags);
> +       nr =3D radix_tree_gang_lookup(&cache->root, (void **)entries, ind=
ex,
> +               min((unsigned long)F2FS_ONSTACK_CACHES, end - index));
> +       if (!nr)
> +               goto out_unlock;
> +
> +       for (i =3D 0; i < nr; i++) {
> +               struct f2fs_cached_block *entry =3D entries[i];
> +
> +               if (entry->index >=3D end) {
> +                       nr =3D i;
>                         break;
> +               }
> +               f2fs_cache_get(entry);
> +       }
> +out_unlock:
> +       spin_unlock_irqrestore(&cache->tree_lock, flags);
> +       if (!nr)
> +               return;
> +       for (i =3D 0; i < nr; i++) {
> +               struct f2fs_cached_block *entry =3D entries[i];
>
> -               for (i =3D 0; i < nr; i++) {
> -                       struct folio *folio =3D fbatch.folios[i];
> +               index =3D entry->index + 1;
>
> -                       folio_lock(folio);
> -                       if (folio->mapping !=3D mapping) {
> -                               folio_unlock(folio);
> -                               continue;
> -                       }
> +               f2fs_lock_cache(entry);
>
> -                       if (ino !=3D folio_get_f2fs_data(folio)) {
> -                               folio_unlock(folio);
> -                               continue;
> -                       }
> -
> -                       generic_error_remove_folio(mapping, folio);
> -                       folio_unlock(folio);
> +               if (!f2fs_is_compress_cache(entry)) {

How is this possible?
or if (!entry->cache)?

Thanks,

> +                       f2fs_unlock_cache(entry);
> +                       continue;
>                 }
> -               folio_batch_release(&fbatch);
> +               if (entry->ino !=3D ino) {
> +                       f2fs_unlock_cache(entry);
> +                       continue;
> +               }
> +
> +               f2fs_truncate_cache(entry, false);
> +               f2fs_unlock_cache(entry);
> +       }
> +       f2fs_cache_gang_release(entries, nr);
> +
> +       if (index < end) {
>                 cond_resched();
> -       } while (index < end);
> +               goto next;
> +       }
>  }
>
> -int f2fs_init_compress_inode(struct f2fs_sb_info *sbi)
> +void f2fs_init_compress_cache_context(struct f2fs_sb_info *sbi)
>  {
> -       struct inode *inode;
> -
>         if (!test_opt(sbi, COMPRESS_CACHE))
> -               return 0;
> -
> -       inode =3D f2fs_iget(sbi->sb, F2FS_COMPRESS_INO(sbi));
> -       if (IS_ERR(inode))
> -               return PTR_ERR(inode);
> -       sbi->compress_inode =3D inode;
> +               return;
>
>         sbi->compress_percent =3D COMPRESS_PERCENT;
>         sbi->compress_watermark =3D COMPRESS_WATERMARK;
> -
>         atomic_set(&sbi->compress_page_hit, 0);
> -
> -       return 0;
> -}
> -
> -void f2fs_destroy_compress_inode(struct f2fs_sb_info *sbi)
> -{
> -       if (!sbi->compress_inode)
> -               return;
> -       iput(sbi->compress_inode);
> -       sbi->compress_inode =3D NULL;
>  }
>
>  int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi)
> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> index bedaade92677..8cd06f7ba9e7 100644
> --- a/fs/f2fs/debug.c
> +++ b/fs/f2fs/debug.c
> @@ -225,8 +225,8 @@ static void update_general_status(struct f2fs_sb_info=
 *sbi)
>         si->node_caches =3D NODE_CACHE(sbi)->num_entries;
>         si->meta_caches =3D META_CACHE(sbi)->num_entries;
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
> -       if (sbi->compress_inode) {
> -               si->compress_pages =3D COMPRESS_MAPPING(sbi)->nrpages;
> +       if (test_opt(sbi, COMPRESS_CACHE)) {
> +               si->compress_pages =3D COMPRESS_CACHE(sbi)->num_entries;
>                 si->compress_page_hit =3D atomic_read(&sbi->compress_page=
_hit);
>         }
>  #endif
> @@ -386,10 +386,11 @@ static void update_mem_info(struct f2fs_sb_info *sb=
i)
>         si->page_mem +=3D (unsigned long long)NODE_CACHE(sbi)->num_entrie=
s << PAGE_SHIFT;
>         si->cache_mem +=3D NODE_CACHE(sbi)->num_entries * sizeof(struct f=
2fs_cached_block);
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
> -       if (sbi->compress_inode) {
> -               unsigned long npages =3D COMPRESS_MAPPING(sbi)->nrpages;
> +       if (test_opt(sbi, COMPRESS_CACHE)) {
> +               unsigned long npages =3D COMPRESS_CACHE(sbi)->num_entries=
;
>
>                 si->page_mem +=3D (unsigned long long)npages << PAGE_SHIF=
T;
> +               si->cache_mem +=3D npages * sizeof(struct f2fs_cached_blo=
ck);
>         }
>  #endif
>  }
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 5b1b3104ec20..d55749b03ed2 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -2078,7 +2078,6 @@ struct f2fs_sb_info {
>         u32 compr_new_inode;
>
>         /* For compressed block cache */
> -       struct inode *compress_inode;           /* cache compressed block=
s */
>         unsigned int compress_percent;          /* cache page percentage =
*/
>         unsigned int compress_watermark;        /* cache page watermark *=
/
>         atomic_t compress_page_hit;             /* cache hit count */
> @@ -4821,13 +4820,11 @@ unsigned int f2fs_cluster_blocks_are_contiguous(s=
truct dnode_of_data *dn,
>  int f2fs_init_compress_ctx(struct compress_ctx *cc);
>  void f2fs_destroy_compress_ctx(struct compress_ctx *cc, bool reuse);
>  void f2fs_init_compress_info(struct f2fs_sb_info *sbi);
> -int f2fs_init_compress_inode(struct f2fs_sb_info *sbi);
> -void f2fs_destroy_compress_inode(struct f2fs_sb_info *sbi);
> +void f2fs_init_compress_cache_context(struct f2fs_sb_info *sbi);
>  int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi);
>  void f2fs_destroy_page_array_cache(struct f2fs_sb_info *sbi);
>  int __init f2fs_init_compress_cache(void);
>  void f2fs_destroy_compress_cache(void);
> -struct address_space *COMPRESS_MAPPING(struct f2fs_sb_info *sbi);
>  void f2fs_invalidate_compress_pages_range(struct f2fs_sb_info *sbi,
>                                         block_t blkaddr, unsigned int len=
);
>  bool f2fs_load_compressed_folio(struct f2fs_sb_info *sbi, struct folio *=
folio,
> @@ -4876,8 +4873,7 @@ static inline void f2fs_put_folio_dic(struct folio =
*folio, bool in_task)
>  static inline unsigned int f2fs_cluster_blocks_are_contiguous(
>                         struct dnode_of_data *dn, unsigned int ofs_in_nod=
e) { return 0; }
>  static inline bool f2fs_sanity_check_cluster(struct dnode_of_data *dn) {=
 return false; }
> -static inline int f2fs_init_compress_inode(struct f2fs_sb_info *sbi) { r=
eturn 0; }
> -static inline void f2fs_destroy_compress_inode(struct f2fs_sb_info *sbi)=
 { }
> +static inline void f2fs_init_compress_cache_context(struct f2fs_sb_info =
*sbi) { }
>  static inline int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi) {=
 return 0; }
>  static inline void f2fs_destroy_page_array_cache(struct f2fs_sb_info *sb=
i) { }
>  static inline int __init f2fs_init_compress_cache(void) { return 0; }
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index aa6f4d4a55a7..1688d9cbafe1 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -573,15 +573,6 @@ static int do_read_inode(struct inode *inode)
>         return 0;
>  }
>
> -static bool is_meta_ino(struct f2fs_sb_info *sbi, unsigned int ino)
> -{
> -#ifdef CONFIG_F2FS_FS_COMPRESSION
> -       if (test_opt(sbi, COMPRESS_CACHE) && ino =3D=3D F2FS_COMPRESS_INO=
(sbi))
> -               return true;
> -#endif
> -       return false;
> -}
> -
>  struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
>  {
>         struct f2fs_sb_info *sbi =3D F2FS_SB(sb);
> @@ -593,42 +584,17 @@ struct inode *f2fs_iget(struct super_block *sb, uns=
igned long ino)
>                 return ERR_PTR(-ENOMEM);
>
>         if (!(inode_state_read_once(inode) & I_NEW)) {
> -               if (is_meta_ino(sbi, ino)) {
> -                       f2fs_err(sbi, "inaccessible inode: %lu, run fsck =
to repair", ino);
> -                       set_sbi_flag(sbi, SBI_NEED_FSCK);
> -                       ret =3D -EFSCORRUPTED;
> -                       trace_f2fs_iget_exit(inode, ret);
> -                       iput(inode);
> -                       f2fs_handle_error(sbi, ERROR_CORRUPTED_INODE);
> -                       fserror_report_file_metadata(inode, ret, GFP_NOFS=
);
> -                       return ERR_PTR(ret);
> -               }
> -
>                 trace_f2fs_iget(inode);
>                 return inode;
>         }
>
> -       if (is_meta_ino(sbi, ino))
> -               goto make_now;
> -
>         ret =3D do_read_inode(inode);
>         if (ret)
>                 goto bad_inode;
> -make_now:
> +
>         f2fs_set_inode_flags(inode);
>
> -       if (ino =3D=3D F2FS_COMPRESS_INO(sbi)) {
> -#ifdef CONFIG_F2FS_FS_COMPRESSION
> -               inode->i_mapping->a_ops =3D &f2fs_compress_aops;
> -               /*
> -                * generic_error_remove_folio only truncates pages of reg=
ular
> -                * inode
> -                */
> -               inode->i_mode |=3D S_IFREG;
> -#endif
> -               mapping_set_gfp_mask(inode->i_mapping,
> -                       GFP_NOFS | __GFP_HIGHMEM | __GFP_MOVABLE);
> -       } else if (S_ISREG(inode->i_mode)) {
> +       if (S_ISREG(inode->i_mode)) {
>                 inode->i_op =3D &f2fs_file_inode_operations;
>                 inode->i_fop =3D &f2fs_file_operations;
>                 inode->i_mapping->a_ops =3D &f2fs_dblock_aops;
> @@ -879,7 +845,7 @@ static void f2fs_evict_inode_work(struct work_struct =
*work)
>  /*
>   * Return true, if we shouldn't go through post_evict_inode.
>   */
> -static bool f2fs_pre_evict_inode(struct inode *inode)
> +static void f2fs_pre_evict_inode(struct inode *inode)
>  {
>         struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
>         struct f2fs_inode_info *fi =3D F2FS_I(inode);
> @@ -905,17 +871,12 @@ static bool f2fs_pre_evict_inode(struct inode *inod=
e)
>             test_opt(sbi, COMPRESS_CACHE) && f2fs_compressed_file(inode))
>                 f2fs_invalidate_compress_pages(sbi, inode->i_ino);
>
> -       if (inode->i_ino =3D=3D F2FS_COMPRESS_INO(sbi))
> -               return true;
> -
>         f2fs_bug_on(sbi, get_dirty_pages(inode));
>         f2fs_remove_dirty_inode(inode);
>         f2fs_remove_donate_inode(inode);
>
>         if (!IS_DEVICE_ALIASING(inode))
>                 f2fs_destroy_extent_tree(inode);
> -
> -       return false;
>  }
>
>  static void f2fs_delete_inode(struct inode *inode)
> @@ -1077,15 +1038,13 @@ static void f2fs_post_evict_inode(struct inode *i=
node)
>   */
>  void f2fs_evict_inode(struct inode *inode)
>  {
> -       if (f2fs_pre_evict_inode(inode))
> -               goto clear_out;
> +       f2fs_pre_evict_inode(inode);
>
>         if (!inode->i_nlink && !is_bad_inode(inode))
>                 f2fs_delete_inode(inode);
>
>         f2fs_post_evict_inode(inode);
>
> -clear_out:
>         fscrypt_put_encryption_info(inode);
>         clear_inode(inode);
>  }
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 07c23b35e7f7..cf052008aa64 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -119,7 +119,7 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *=
sbi, int type)
>                  * exceed threshold, deny caching compress page.
>                  */
>                 res =3D (free_ram > avail_ram * sbi->compress_watermark /=
 100) &&
> -                       (COMPRESS_MAPPING(sbi)->nrpages <
> +                       (COMPRESS_CACHE(sbi)->num_entries <
>                          free_ram * sbi->compress_percent / 100);
>  #else
>                 res =3D false;
> diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
> index 20b3fe1f8c07..e7d2830e6a23 100644
> --- a/fs/f2fs/shrinker.c
> +++ b/fs/f2fs/shrinker.c
> @@ -40,7 +40,8 @@ static unsigned long __count_extent_cache(struct f2fs_s=
b_info *sbi,
>  static unsigned long __count_cache(struct f2fs_sb_info *sbi)
>  {
>         return sbi->meta_blocks.num_entries +
> -               sbi->node_blocks.num_entries;
> +               sbi->node_blocks.num_entries +
> +               sbi->compress_blocks.num_entries;
>  }
>
>  unsigned long f2fs_shrink_count(struct shrinker *shrink,
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 6b42b736a662..5787cfb76c6e 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2050,8 +2050,6 @@ static void f2fs_put_super(struct super_block *sb)
>
>         f2fs_bug_on(sbi, sbi->fsync_node_num);
>
> -       f2fs_destroy_compress_inode(sbi);
> -
>         f2fs_destroy_cache(COMPRESS_CACHE(sbi));
>         f2fs_destroy_cache(NODE_CACHE(sbi));
>         f2fs_destroy_cache(META_CACHE(sbi));
> @@ -5285,6 +5283,8 @@ static int f2fs_fill_super(struct super_block *sb, =
struct fs_context *fc)
>
>         f2fs_init_fsync_node_info(sbi);
>
> +       f2fs_init_compress_cache_context(sbi);
> +
>         /* setup checkpoint request control and start checkpoint issue th=
read */
>         f2fs_init_ckpt_req_control(sbi);
>         if (!f2fs_readonly(sb) && !test_opt(sbi, DISABLE_CHECKPOINT) &&
> @@ -5363,13 +5363,9 @@ static int f2fs_fill_super(struct super_block *sb,=
 struct fs_context *fc)
>                 goto free_ino_entry;
>         }
>
> -       err =3D f2fs_init_compress_inode(sbi);
> -       if (err)
> -               goto free_root_inode;
> -
>         err =3D f2fs_register_sysfs(sbi);
>         if (err)
> -               goto free_compress_inode;
> +               goto free_root_inode;
>
>         sbi->umount_lock_holder =3D current;
>  #ifdef CONFIG_QUOTA
> @@ -5537,8 +5533,6 @@ static int f2fs_fill_super(struct super_block *sb, =
struct fs_context *fc)
>         /* evict some inodes being cached by GC */
>         evict_inodes(sb);
>         f2fs_unregister_sysfs(sbi);
> -free_compress_inode:
> -       f2fs_destroy_compress_inode(sbi);
>  free_root_inode:
>         dput(sb->s_root);
>         sb->s_root =3D NULL;
> @@ -5655,7 +5649,8 @@ static void kill_f2fs_super(struct super_block *sb)
>                  * compress inode cache.
>                  */
>                 if (test_opt(sbi, COMPRESS_CACHE))
> -                       truncate_inode_pages_final(COMPRESS_MAPPING(sbi))=
;
> +                       f2fs_invalidate_compress_pages_range(sbi,
> +                                       0, UINT_MAX);
>  #endif
>
>                 if (is_sbi_flag_set(sbi, SBI_IS_DIRTY) ||
> diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
> index 105cfeedea74..53344e1f2b44 100644
> --- a/include/linux/f2fs_fs.h
> +++ b/include/linux/f2fs_fs.h
> @@ -34,7 +34,6 @@
>  #define F2FS_RESERVED_NODE_NUM         3
>
>  #define F2FS_ROOT_INO(sbi)     ((sbi)->root_ino_num)
> -#define F2FS_COMPRESS_INO(sbi) (NM_I(sbi)->max_nid)
>
>  #define F2FS_MAX_QUOTAS                3
>
> --
> 2.49.0
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
