Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795414A9D41
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551520; cv=pass; b=tnUjLTCnET6YlcPkNzX0R80WNhOplLV8cku9120F7/W3Gtk90kkCp8apZ5D/Kmioncl82bN4r61Ahw364M23zobyW20Cg2IZTfe0SugRpAQoQIEmQbbn5SVRtJBON5QJlxE1YK+fuo+wYMfmXSk0rZm8O2OYS3IG5Ek0t/xJt68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551520; c=relaxed/simple;
	bh=2qBf4Aq4dtZ2h5XFzmgyvXxPa/Buv3vFpkInPvEQj+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KRj+Gp7RfRljJpKZ5EOeZrJ5cM0lRjp1Eq+tKQsRaG7HjNZtQlHgTu2HCOKQnlnBmNLPQjQoaGAl39w7Rbs7kALcW9+P/Ws7vnIZyFxKAJxMAm9V/64E/tWeC2nsuKQZ/woQawWEfGO01fqCQGhnRcyO0a27OLgyYz6uVctkuEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qy7Ztr2w; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qy7Ztr2w"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482e1b55da8so65141f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789551494; cv=none;
        d=google.com; s=arc-20260327;
        b=AtWOem31ksubOo1CaWTKAM8T+Q/VXa90+PVOTHzPYRw6qvrwQL4sRjQxtHSy6HvFCB
         lLNN2BSgQtV17esnzAbRHlhbw/w98DjeLzr0wuj6FYYLJ7UrbpGjVn8JfooWGprxrm/B
         zZveLPfnEwaCUiBuH/aFCqyS8CSWmZ9Ph0KiY5ZCQ8SbOHtYJhA+Da0m1P8Xa8ULLHpw
         6rcmOf2Mzhd24GhO99Iom6POOZq7m73bQUWhQUUYp4L6fzrKzpJMXkjmhqWK7/5KavNB
         5BNWjEGJtPyQ6MGl8BgGfgpOfFT7nI6Hu08zlKl8+GCP0KasTgVh2G0ouMGNdnVRwXeP
         FiSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2bBKK3bq4FOpt+ZtHxPoHBwTBznMbOC00yd1G3zvqXY=;
        fh=eAP3mIQeXKCNxLpiLf5LhZVXg5WYesNF33u1QQjt+p8=;
        b=qTn5PqwD7h9wVjCUqsnvSGB0/NED/hQqMRGqcsMNVGaY3HjJX07EYbyzkGAgudLE5l
         cvDsSIHEuE/yeSGw+hMq7rQ5gKQEpAVL433NcusAQypCZjTI3n/yL1yrPdFKdckNzSKC
         VDnvNmIesCZBMck9jxbeLdhpJ6Rtwu7EqkffRcG/DcsPYSdHIpEd8a2EN49QvpmCDdJV
         CkOn4mRs3blcRVC6toC4q0VURJWFB0r1v4sMCY5YMMOhkEYga0RNWm235oqCxT8zRs9i
         mkXHVy0j2LWP3W9NohEDQhfcly+tkP5f5ELUZvqrUmDyXWZhKTHO578Wc6uKBQ9n9eXb
         k6dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789551494; x=1790156294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2bBKK3bq4FOpt+ZtHxPoHBwTBznMbOC00yd1G3zvqXY=;
        b=Qy7Ztr2wKF1R3NZ1gn9Xb/bbHx5Ap/lrU4WR/eAomI2xSk0oDV1pEPS/JgywKlPG2b
         6Tf2nknCcCZQ0oLVWU3P/WeX6gFp5N2t+M8HSDIZQHEKI2gJE72CD5U6HzMT5jI2RD7W
         WLCWPByOLX7W3CcREfQw8pGSqis8Eax1X4+f+IHX4+PScomNo0m63cyQ1+JMKxN9Gh77
         lvElzHMdqFUNR0l9Tv727nIXhy4yT9OjVmZHIHZNQ4t8o/ftLq2eyeSwYkUqYxUS1qt4
         OFEeLbdvt3TmCveYL6Dx/f6kKzkb3xN6EeqSiBBYQ1UlrlhuLqTcrujW6ySZsrcDePar
         xbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789551494; x=1790156294;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2bBKK3bq4FOpt+ZtHxPoHBwTBznMbOC00yd1G3zvqXY=;
        b=Frqh9/zadv3niTl0SuckOhBSVLBs93BTO5o28VPt9eeWU8H9uMSLJFFPcRODe8L48m
         T973KFEoiGzjwxdnRRBkG+Y5KCmj5KbCNeyvV4NB9VZWq2HqDKGi3jdZ+BrHHrSTydun
         XZMsaKvG0GsnNfPeUwyTuk3IYuRsUGdhRTCfQ51zfB9b5lJP0cP/8yX49v0wquiMsyvj
         QxI2Se4wkBA4WaF4/5wfk1RL8joJz/5QfQe0k9QcEp5DHseQ16AKtN8xt58zBrs/MJu0
         jPbOERDcC1GR3qYPsGHhdCfAmnaF86MQp6Uj+SMAGLZ0x/747k0/K/Wt6pUbozH9B256
         DvhQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWe923mDUF20gh3W/iQFZppNM9RYFzBRfRNfyUxM5cJN46/VgUUaxZQ06ZeM1p65bXxZUOEgZJP9kd73g=@vger.kernel.org
X-Gm-Message-State: AFuF++kXEuy2/X4OkK5S5L0oOexUyAM6YS34tjQPG6VjLLIk0XqivDje
	BGXMsBk0aaXdfNfI+eAOkfpONWa9qEXRhYL9t9DqfJOgZrwryL+hqUW2H47+En4t7ZYztR5Km0T
	g6XIrvvWdiLHS9NMoKwdmWWSJ3mDLWYI=
X-Gm-Gg: AYBFou2GTvW9ykNWvwb7Occ8cKXbP3q8keIM1yMw1h8yk5uWDRsSyL+G2A3O+s7Z79O
	TLVpdfle+6eYRDwYVEtqRgkpKNYTtNmnBw7oSoEDJ4vGiAUEclO8f3K/GkOMA/bmUzLvLu6BhCL
	biNeBgiCWlihde0gUmoZn6ogZxAgDan1NS63j+KzxiCWDA41rigP2naKJWLoOe7lYPRdKccEmHl
	C1rMFgf7vEaQbKdBwtrjUjKzxCPnKh0w/6t4HBs07H4rn4ZV5Yd19hU5QNBz3Wp3OKjUg9F5tqC
	R1rlC0WcAoMhCzxSu7EDAKMuRiAF+CEgZ1Tekk9+QBH1xHk50Q8md9Ls
X-Received: by 2002:a05:6000:41c8:b0:487:981:4e07 with SMTP id
 ffacd0b85a97d-4870d283da8mr2073778f8f.4.1789551493774; Wed, 16 Sep 2026
 02:38:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916015440.2232938-1-chao@kernel.org> <20260916015440.2232938-10-chao@kernel.org>
In-Reply-To: <20260916015440.2232938-10-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 16 Sep 2026 17:37:36 +0800
X-Gm-Features: AcwNN1V5hQTOwsAJPXGspdhO_tM2Kqw0CjTXxmwTlvakZvnmRq8xN2VMDQkjlMg
Message-ID: <CAHJ8P3JPpNgMBjXaiJmrhuRpwc=SrDPWeSXnkBKMkTj3qwJosA@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v8 09/12] f2fs: cache: use compress cache
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
=E4=BA=8E2026=E5=B9=B49=E6=9C=8816=E6=97=A5=E5=91=A8=E4=B8=89 09:57=E5=86=
=99=E9=81=93=EF=BC=9A
>
> From: Chao Yu <chao@kernel.org>
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
Reviewed-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Thanks!
> ---
>  fs/f2fs/compress.c      | 143 +++++++++++++++-------------------------
>  fs/f2fs/debug.c         |   9 +--
>  fs/f2fs/f2fs.h          |   8 +--
>  fs/f2fs/inode.c         |  49 ++------------
>  fs/f2fs/node.c          |   4 +-
>  fs/f2fs/node.h          |   2 +-
>  fs/f2fs/shrinker.c      |   3 +-
>  fs/f2fs/super.c         |  15 ++---
>  include/linux/f2fs_fs.h |   1 -
>  9 files changed, 74 insertions(+), 160 deletions(-)
>
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index d7f7c35e710f..55931fbcb0d1 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1893,30 +1893,19 @@ unsigned int f2fs_cluster_blocks_are_contiguous(s=
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
> @@ -1924,52 +1913,48 @@ static void f2fs_cache_compressed_page(struct f2f=
s_sb_info *sbi,
>         if (!f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE_REA=
D))
>                 return;
>
> -       if (!f2fs_available_free_memory(sbi, COMPRESS_PAGE))
> +       if (!f2fs_available_free_memory(sbi, COMPRESS_BLOCK))
>                 return;
>
> -       cfolio =3D filemap_get_folio(COMPRESS_MAPPING(sbi), blkaddr);
> -       if (!IS_ERR(cfolio)) {
> -               f2fs_folio_put(cfolio, false);
> +       entry =3D f2fs_find_cache(COMPRESS_CACHE(sbi), blkaddr,
> +                                               F2FS_CACHE_ACCESS);
> +       if (!IS_ERR(entry)) {
> +               f2fs_put_cache(entry, false);
>                 return;
>         }
>
> -       cfolio =3D filemap_alloc_folio(__GFP_NOWARN | __GFP_IO, 0, NULL);
> -       if (!cfolio)
> +       entry =3D f2fs_grab_cache(COMPRESS_CACHE(sbi), blkaddr,
> +                                       F2FS_CACHE_LOCK_CREATE);
> +       if (IS_ERR(entry))
>                 return;
>
> -       ret =3D filemap_add_folio(COMPRESS_MAPPING(sbi), cfolio,
> -                                               blkaddr, GFP_NOFS);
> -       if (ret) {
> -               f2fs_folio_put(cfolio, false);
> -               return;
> -       }
> -
> -       folio_set_f2fs_data(cfolio, ino);
> -
> -       memcpy(folio_address(cfolio), folio_address(folio), PAGE_SIZE);
> -       folio_mark_uptodate(cfolio);
> -       f2fs_folio_put(cfolio, true);
> +       entry->ino =3D ino;
> +       memcpy(cache_address(entry), folio_address(folio), sbi->blocksize=
);
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
> +       entry =3D f2fs_find_cache(COMPRESS_CACHE(sbi), blkaddr,
> +                                               F2FS_CACHE_ACCESS);
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
> @@ -1977,71 +1962,49 @@ bool f2fs_load_compressed_folio(struct f2fs_sb_in=
fo *sbi, struct folio *folio,
>
>  void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi, nid_t ino)
>  {
> -       struct address_space *mapping =3D COMPRESS_MAPPING(sbi);
> -       struct folio_batch fbatch;
> -       pgoff_t index =3D 0;
> -       pgoff_t end =3D MAX_BLKADDR(sbi);
> +       struct f2fs_cached_block_list *cache =3D COMPRESS_CACHE(sbi);
> +       struct f2fs_cached_block *entries[F2FS_ONSTACK_CACHES];
> +       pgoff_t index =3D 0, end =3D ULONG_MAX;
> +       int nr;
> +       int i;
>
> -       if (!mapping->nrpages)
> +       if (!cache->num_entries)
>                 return;
> +next:
> +       nr =3D f2fs_cache_gang_lookup(cache, entries, &index, end);
> +       if (!nr)
> +               return;
> +       for (i =3D 0; i < nr; i++) {
> +               struct f2fs_cached_block *entry =3D entries[i];
>
> -       folio_batch_init(&fbatch);
> -
> -       do {
> -               unsigned int nr, i;
> -
> -               nr =3D filemap_get_folios(mapping, &index, end - 1, &fbat=
ch);
> -               if (!nr)
> -                       break;
> -
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
> +               if (unlikely(!f2fs_is_compress_cache(entry)))
> +                       goto unlock;
> +               if (entry->ino !=3D ino)
> +                       goto unlock;
>
> -                       if (ino !=3D folio_get_f2fs_data(folio)) {
> -                               folio_unlock(folio);
> -                               continue;
> -                       }
> +               f2fs_truncate_locked_cache(entry, false);
> +unlock:
> +               f2fs_unlock_cache(entry);
> +       }
> +       f2fs_cache_gang_release(entries, nr);
>
> -                       generic_error_remove_folio(mapping, folio);
> -                       folio_unlock(folio);
> -               }
> -               folio_batch_release(&fbatch);
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
> index c09c5f700c89..4ed5c271dba3 100644
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
> index 1e23e02cac8b..69690b061236 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -2077,7 +2077,6 @@ struct f2fs_sb_info {
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
> @@ -4889,13 +4888,11 @@ unsigned int f2fs_cluster_blocks_are_contiguous(s=
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
> @@ -4944,8 +4941,7 @@ static inline void f2fs_put_folio_dic(struct folio =
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
> index c822ca2dce20..9164a2b5d9f0 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -574,15 +574,6 @@ static int do_read_inode(struct inode *inode)
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
> @@ -594,42 +585,17 @@ struct inode *f2fs_iget(struct super_block *sb, uns=
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
> @@ -882,7 +848,7 @@ static void f2fs_evict_inode_work(struct work_struct =
*work)
>  /*
>   * Return true, if we shouldn't go through post_evict_inode.
>   */
> -static bool f2fs_pre_evict_inode(struct inode *inode)
> +static void f2fs_pre_evict_inode(struct inode *inode)
>  {
>         struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
>         struct f2fs_inode_info *fi =3D F2FS_I(inode);
> @@ -908,17 +874,12 @@ static bool f2fs_pre_evict_inode(struct inode *inod=
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
> @@ -1080,15 +1041,13 @@ static void f2fs_post_evict_inode(struct inode *i=
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
> index 1af118858fd1..fe5e4c4eff23 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -109,7 +109,7 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *=
sbi, int type)
>                 mem_size =3D (atomic_read(&dcc->discard_cmd_cnt) *
>                                 sizeof(struct discard_cmd)) >> PAGE_SHIFT=
;
>                 res =3D mem_size < (avail_ram * nm_i->ram_thresh / 100);
> -       } else if (type =3D=3D COMPRESS_PAGE) {
> +       } else if (type =3D=3D COMPRESS_BLOCK) {
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>                 unsigned long free_ram =3D val.freeram;
>
> @@ -118,7 +118,7 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *=
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
> diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
> index c8d66ca54e94..2704a5c6a54d 100644
> --- a/fs/f2fs/node.h
> +++ b/fs/f2fs/node.h
> @@ -157,7 +157,7 @@ enum mem_type {
>         READ_EXTENT_CACHE,      /* indicates read extent cache */
>         AGE_EXTENT_CACHE,       /* indicates age extent cache */
>         DISCARD_CACHE,  /* indicates memory of cached discard cmds */
> -       COMPRESS_PAGE,  /* indicates memory of cached compressed pages */
> +       COMPRESS_BLOCK, /* indicates memory of cached compressed blocks *=
/
>         BASE_CHECK,     /* check kernel status */
>  };
>
> diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
> index 499717cd693c..29f488531492 100644
> --- a/fs/f2fs/shrinker.c
> +++ b/fs/f2fs/shrinker.c
> @@ -40,7 +40,8 @@ static unsigned long __count_extent_cache(struct f2fs_s=
b_info *sbi,
>  static unsigned long __count_cache(struct f2fs_sb_info *sbi)
>  {
>         return META_CACHE(sbi)->num_entries +
> -               NODE_CACHE(sbi)->num_entries;
> +               NODE_CACHE(sbi)->num_entries +
> +               COMPRESS_CACHE(sbi)->num_entries;
>  }
>
>  unsigned long f2fs_shrink_count(struct shrinker *shrink,
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 47259e8172fc..6873bad73d7a 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2069,8 +2069,6 @@ static void f2fs_put_super(struct super_block *sb)
>
>         f2fs_bug_on(sbi, sbi->fsync_node_num);
>
> -       f2fs_destroy_compress_inode(sbi);
> -
>         f2fs_destroy_cache(COMPRESS_CACHE(sbi));
>         f2fs_destroy_cache(NODE_CACHE(sbi));
>         f2fs_destroy_cache(META_CACHE(sbi));
> @@ -5315,6 +5313,8 @@ static int f2fs_fill_super(struct super_block *sb, =
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
> @@ -5387,13 +5387,9 @@ static int f2fs_fill_super(struct super_block *sb,=
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
> @@ -5561,8 +5557,6 @@ static int f2fs_fill_super(struct super_block *sb, =
struct fs_context *fc)
>         /* evict some inodes being cached by GC */
>         evict_inodes(sb);
>         f2fs_unregister_sysfs(sbi);
> -free_compress_inode:
> -       f2fs_destroy_compress_inode(sbi);
>  free_root_inode:
>         dput(sb->s_root);
>         sb->s_root =3D NULL;
> @@ -5676,7 +5670,8 @@ static void kill_f2fs_super(struct super_block *sb)
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
> index ac87446cc086..3081702b1ddb 100644
> --- a/include/linux/f2fs_fs.h
> +++ b/include/linux/f2fs_fs.h
> @@ -43,7 +43,6 @@
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
