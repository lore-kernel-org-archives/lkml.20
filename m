Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F663F9277
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787850851; cv=pass; b=gl8ZZF/0XlO45qFN8UarClUG8WY8WvrJQtOFXl5Z16YSfT+Cb5AZTH5Kie/o9qY1sOu7E9jZ4sWfeR6ih3BBG8nqu9B5Zy/AFEqbBtNH8E8vn1Ey9c5oT68/lwJcqzo6vupXVMAHpYpx+kM9N1gX3Yqr6cj0PZXEWHSzscUW1Mw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787850851; c=relaxed/simple;
	bh=1LT+JvYSs1lq3nLoYNxkH2Zq+dzk0k0gfXz25027rwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pcwJ6ertCjIdkqo9q5WTKdNDSvvp6kc9Mg0BQAJPjdq1WEtncNJMJlVmzlttOXQ6LE9IH5gK84DUnHRYUZLyrtOTMcz5Vd6P00Ggc3PYW1JduplQSRWNOvp8XczXLdEdt1vApuufzlnkx2M11V4vxarvoIfBtP847KMKYK02Tvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERbHUQHm; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERbHUQHm"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b4ab4b4179so46917e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:14:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787850847; cv=none;
        d=google.com; s=arc-20260327;
        b=irezkICyWRXDFkaee7UXi5rT2cxNwl2BpnDYRfA/oWCf3i4csMBLxe4Pn3syzHkgeE
         KivnO7JOfTjDo1NlznPn5dIzfOIG0XN1CxOV46w7pZrKVgj6LVgTnGOqH1INqUUC5LJp
         +HXcA/qtnZ49C54MZ3wBQY5ZcDr4BDrWQNtOcoCmdEwLJYRqeIkNg+2LMlqnnHVxCl0E
         uWis7fIYtq5Jiu8IpdOWI51wddl4VfmQMf9rcpF7JH28AoRiFoY6A7jDkKTC82eUBnPp
         A60E1BT0Mr/EH73msUKBuXhY+MSmJZxmC+mvNBuBTbZG6Q5aaF9X7J0UOxrCz3sTZnnt
         uJUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qtZt7y9mHNUiUw5uw0uJAAgnVkdR4TjXIiqjQ67aekE=;
        fh=+jHY5NC6AUEbe6vykTd8pHq/nQ3+YKE1XWmtGHETryI=;
        b=qVioxM2JCT8Hj0MCxJJcbF9+2MOC+mJQB2t4Co5W/RL45BTS3k8rB2UVhCSTINYzF/
         Hf6jDGBlCqEcJgv2rr9m8Koe+KSJtajI+RegOmTPQ1eFdYcKDbVvFxShDJ4V9HmsiwpR
         gRziCSDhATtPVbTjRoPAFBjYOFCqy5k9JZYLfJhMqFaa6NTnSzHsWRKxerC1NHRWWdMc
         wKcEfXwB9vWehrV+tCghTGllDFy/FDoS1qWFBsFD7DnWuOrqZw276sbwMGJ95EPQ4AV4
         G3clfmYIGEm3M7US54oXo7yB+HkouSR6D+VYHLA8rHSjHjmFQ78w6Szwtucz7qnkq+cr
         i8xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787850847; x=1788455647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qtZt7y9mHNUiUw5uw0uJAAgnVkdR4TjXIiqjQ67aekE=;
        b=ERbHUQHmyoMZDfsJ1awsj2psz80PlX54GV18hj0AK6ijqIR+cu+WiolgKLMkDkf5Qz
         mlYRQ0CJhPqAFVNJJRUnvZBZfrbk9dk/byE7m+J4zY+pwqXCdz/Q4ufd4dv8K5yzoylB
         6pv810U6mZVUwawuQ7p0J6g7FRa34HPQJyNOlh+rdEDOU05a6Slod/n94PgFm2OsGAB7
         m3Nm9pdO3Rw1OrTu/l4pCmndt1ibaaB0B2jCA5YDQZvq72cIQpmOkv73XPlI8tK7Jzfu
         GlfsFxBzM/H5ckuX7zKvM7e3fF/HsFrmClmZPNPWlTalj4uDbS/NgIt47qS0dJ6JbGEE
         jpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787850847; x=1788455647;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qtZt7y9mHNUiUw5uw0uJAAgnVkdR4TjXIiqjQ67aekE=;
        b=IzIlovHej8Pnh0QrP+Dd8sb8v2beq/jX/SWApZ5fuXWZHUkuqUzOQ9G+v3vfeZw7ta
         1KHMP7fLRti4NKi2ZzPi71tE06cv5Lie5tEQD9AwNagDBzbKhqQy7yT/+0l5bv7dgubC
         7AL1RUz/5/tnaD1Z0gLC/UIu2LE+f9qstbVqe4yXk7J0oIaWVfcYvpGgHjLZSFCg7G6B
         BbfHA1MZFVWtcF2+iaAZYAYu7buS4MD+LRXnx0rvxW1pLydBXxjGguByy1f6E3TtIWFC
         Lb4SYRlvJUggwDkZmWDEMG3G3ONr09hO+njkIFj8t85wL8gwPOQRMX4b6I3sbaAuKOwp
         FWrw==
X-Forwarded-Encrypted: i=1; AHgh+RohBbMbj9N0oIk0QSc5Hrdmp08Gn6vOJ8VC9NAnRmV5PRFh5AmgeSQhydrg5DY0/A9IeqlqmScR5iazrzI=@vger.kernel.org
X-Gm-Message-State: AFuF++mHrjTKHdioj4US0j+Q53GBJ1hatNGoUzHX9thVhdcDS4kS+sJC
	dRtW3pupsYqVW2xDm/DNCnFKDpODtqTC4Dc5pjWCI67/w5EkUJKRJPiBNUEJgVOPMn8zdpreGuv
	4nVnhUsE5iBdiJNTZJh9jfVJ8+zuni5I=
X-Gm-Gg: AR+sD12pC1r1navUt6j5rfoDKJUpvlDTq/dOTOkF3eagy/fur+1aYmy+dkMmaO+jWmT
	gEBS+h7uuUazqt2RwvnFqIL4k2Nr6RLzGZHKI/M9sOBZCTzgxwZMg1dllxZgIl61szuDtA8+xmk
	fakacolx7cLLo+7EAi2WKcoh+N+L8QGrZ25bZBf/Qfk4hDhNhQWGjGRHyxFfdL9UCLwMlK2AS9B
	Z+KlSL9RbGeAEzi9WC9JEZaac7h0/nmuXU6LFkqqUYwxzT1yz+IXnUSAqxxPbfTAOeuRuOx9gF7
	vLTno9W4hSBIO8RW0coEn2tamll6ASs33I2I2WiHMwr5Ef/RxyT2aUCyPas/Gn0PbyORoTsCMdC
	oDsUJOOaJaK34u8AAVJJL/O1sPpXioNs=
X-Received: by 2002:a05:6512:1590:b0:5b5:e2d1:b7b8 with SMTP id
 2adb3069b0e04-5b5e68c8c83mr39741e87.11.1787850847149; Thu, 27 Aug 2026
 10:14:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825130126.2078627-1-chao@kernel.org> <20260825130126.2078627-10-chao@kernel.org>
 <CACOAw_w+QMkTNK=McScLHh1gpm6UFjxLSnVxhFMsgsuArLA=qQ@mail.gmail.com> <18859958-147c-4703-9070-d79601ab6831@kernel.org>
In-Reply-To: <18859958-147c-4703-9070-d79601ab6831@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 27 Aug 2026 10:13:54 -0700
X-Gm-Features: AcwNN1UgNX7ttrBByBi5XXOkIBNmsJ8SOJ_yiZiPX9xJRFVAWpWnC1tBsYJxHP0
Message-ID: <CACOAw_zqTtvyka-1Tczaoq3x8N8WgUuEz=OikPhqs4B1DoaJTQ@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v3 09/12] f2fs: cache: use compress cache
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 8:08=E2=80=AFPM Chao Yu <chao@kernel.org> wrote:
>
> On 8/27/26 04:04, Daeho Jeong wrote:
> > On Tue, Aug 25, 2026 at 6:03=E2=80=AFAM Chao Yu via Linux-f2fs-devel
> > <linux-f2fs-devel@lists.sourceforge.net> wrote:
> >>
> >> This patch migrates compressed cluster caching from the fake VFS inode
> >> page cache (sbi->compress_inode) to compress cache (sbi->compress_bloc=
ks).
> >>
> >> It converts compression caching and decompression paths to use
> >> compress cache APIs, uses entry->ino for per-inode invalidation, and
> >> removes sbi->compress_inode.
> >>
> >> Signed-off-by: Chao Yu <chao@kernel.org>
> >> ---
> >>  fs/f2fs/cache.c         |  14 ++--
> >>  fs/f2fs/cache.h         |   1 +
> >>  fs/f2fs/compress.c      | 158 ++++++++++++++++++---------------------=
-
> >>  fs/f2fs/debug.c         |   9 ++-
> >>  fs/f2fs/f2fs.h          |   8 +-
> >>  fs/f2fs/inode.c         |  49 +------------
> >>  fs/f2fs/node.c          |   2 +-
> >>  fs/f2fs/shrinker.c      |   3 +-
> >>  fs/f2fs/super.c         |  15 ++--
> >>  include/linux/f2fs_fs.h |   1 -
> >>  10 files changed, 98 insertions(+), 162 deletions(-)
> >>
> >> diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
> >> index 8431180bb1f8..5b9055ad49b9 100644
> >> --- a/fs/f2fs/cache.c
> >> +++ b/fs/f2fs/cache.c
> >> @@ -417,13 +417,12 @@ static void f2fs_do_truncate_cache(struct f2fs_c=
ached_block *entry,
> >>         spin_unlock(&cache->list_lock);
> >>  }
> >>
> >> -static void f2fs_truncate_cache(struct f2fs_cached_block *entry,
> >> +void f2fs_truncate_cache(struct f2fs_cached_block *entry,
> >>                                         bool drop_dirty)
> >
> > -> __f2fs_truncate_cache() without locking?
> >
> >>  {
> >> -       f2fs_lock_cache(entry);
> >> -       if (entry->cache)
> >> -               f2fs_do_truncate_cache(entry, drop_dirty);
> >> -       f2fs_unlock_cache(entry);
> >> +       if (!entry->cache)
> >> +               return;
> >> +       f2fs_do_truncate_cache(entry, drop_dirty);
> >>  }
> >>
> >>  static void f2fs_drop_cache(struct f2fs_cached_block_list *cache,
> >> @@ -435,8 +434,9 @@ static void f2fs_drop_cache(struct f2fs_cached_blo=
ck_list *cache,
> >>         if (IS_ERR(entry))
> >>                 return;
> >>
> >> +       f2fs_lock_cache(entry);
> >>         f2fs_truncate_cache(entry, drop_dirty);
> >> -       f2fs_put_cache(entry, false);
> >> +       f2fs_put_cache(entry, true);
> >>  }
> >>
> >>  void f2fs_drop_cache_range(struct f2fs_cached_block_list *cache,
> >> @@ -478,7 +478,9 @@ void f2fs_drop_cache_range(struct f2fs_cached_bloc=
k_list *cache,
> >>
> >>                 index =3D entry->index + 1;
> >>
> >> +               f2fs_lock_cache(entry);
> >>                 f2fs_truncate_cache(entry, drop_dirty);
> >> +               f2fs_unlock_cache(entry);
> >>         }
> >>         f2fs_cache_gang_release(entries, nr);
> >>
> >> diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
> >> index b87feb3eb896..b66dbaefee2f 100644
> >> --- a/fs/f2fs/cache.h
> >> +++ b/fs/f2fs/cache.h
> >> @@ -168,6 +168,7 @@ unsigned int f2fs_cache_gang_lookup_tag(struct f2f=
s_cached_block_list *cache,
> >>                 unsigned int max_items, int tag);
> >>  void f2fs_cache_gang_release(struct f2fs_cached_block **entries,
> >>                                 unsigned int nr_entries);
> >> +void f2fs_truncate_cache(struct f2fs_cached_block *entry, bool drop_d=
irty);
> >>  int f2fs_writeback_cache(struct f2fs_cached_block_list *cache, bool s=
ync);
> >>  void f2fs_cache_wait_on_all_writeback(struct f2fs_cached_block_list *=
cache);
> >>  void f2fs_cache_wait_writeback_cond(struct f2fs_cached_block *entry,
> >> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> >> index 676a5559357f..155be3a3d203 100644
> >> --- a/fs/f2fs/compress.c
> >> +++ b/fs/f2fs/compress.c
> >> @@ -1918,30 +1918,19 @@ unsigned int f2fs_cluster_blocks_are_contiguou=
s(struct dnode_of_data *dn,
> >>         return compressed ? i - 1 : i;
> >>  }
> >>
> >> -const struct address_space_operations f2fs_compress_aops =3D {
> >> -       .release_folio =3D f2fs_release_folio,
> >> -       .invalidate_folio =3D f2fs_invalidate_folio,
> >> -       .migrate_folio  =3D filemap_migrate_folio,
> >> -};
> >> -
> >> -struct address_space *COMPRESS_MAPPING(struct f2fs_sb_info *sbi)
> >> -{
> >> -       return sbi->compress_inode->i_mapping;
> >> -}
> >> -
> >>  void f2fs_invalidate_compress_pages_range(struct f2fs_sb_info *sbi,
> >>                                 block_t blkaddr, unsigned int len)
> >>  {
> >> -       if (!sbi->compress_inode)
> >> +       if (!test_opt(sbi, COMPRESS_CACHE))
> >>                 return;
> >> -       invalidate_mapping_pages(COMPRESS_MAPPING(sbi), blkaddr, blkad=
dr + len - 1);
> >> +
> >> +       f2fs_drop_cache_range(COMPRESS_CACHE(sbi), blkaddr, len, false=
);
> >>  }
> >>
> >>  static void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi,
> >>                 struct folio *folio, nid_t ino, block_t blkaddr)
> >>  {
> >> -       struct folio *cfolio;
> >> -       int ret;
> >> +       struct f2fs_cached_block *entry;
> >>
> >>         if (!test_opt(sbi, COMPRESS_CACHE))
> >>                 return;
> >> @@ -1952,49 +1941,43 @@ static void f2fs_cache_compressed_page(struct =
f2fs_sb_info *sbi,
> >>         if (!f2fs_available_free_memory(sbi, COMPRESS_PAGE))
> >>                 return;
> >>
> >> -       cfolio =3D filemap_get_folio(COMPRESS_MAPPING(sbi), blkaddr);
> >> -       if (!IS_ERR(cfolio)) {
> >> -               f2fs_folio_put(cfolio, false);
> >> +       entry =3D f2fs_find_cache(COMPRESS_CACHE(sbi), blkaddr);
> >> +       if (!IS_ERR(entry)) {
> >> +               f2fs_put_cache(entry, false);
> >>                 return;
> >>         }
> >>
> >> -       cfolio =3D filemap_alloc_folio(__GFP_NOWARN | __GFP_IO, 0, NUL=
L);
> >> -       if (!cfolio)
> >> -               return;
> >> -
> >> -       ret =3D filemap_add_folio(COMPRESS_MAPPING(sbi), cfolio,
> >> -                                               blkaddr, GFP_NOFS);
> >> -       if (ret) {
> >> -               f2fs_folio_put(cfolio, false);
> >> +       entry =3D f2fs_grab_cache(COMPRESS_CACHE(sbi), blkaddr,
> >> +                                       F2FS_CACHE_LOCK_CREATE);
> >> +       if (IS_ERR(entry))
> >>                 return;
> >> -       }
> >>
> >> -       folio_set_f2fs_data(cfolio, ino);
> >> -
> >> -       memcpy(folio_address(cfolio), folio_address(folio), PAGE_SIZE)=
;
> >> -       folio_mark_uptodate(cfolio);
> >> -       f2fs_folio_put(cfolio, true);
> >> +       entry->ino =3D ino;
> >> +       memcpy(cache_address(entry), folio_address(folio), PAGE_SIZE);
> >> +       f2fs_cache_set_uptodate(entry);
> >> +       f2fs_put_cache(entry, true);
> >>  }
> >>
> >>  bool f2fs_load_compressed_folio(struct f2fs_sb_info *sbi, struct foli=
o *folio,
> >>                                                                 block_=
t blkaddr)
> >>  {
> >> -       struct folio *cfolio;
> >> +       struct f2fs_cached_block *entry;
> >>         bool hitted =3D false;
> >>
> >>         if (!test_opt(sbi, COMPRESS_CACHE))
> >>                 return false;
> >>
> >> -       cfolio =3D f2fs_filemap_get_folio(COMPRESS_MAPPING(sbi),
> >> -                               blkaddr, FGP_LOCK | FGP_NOWAIT, GFP_NO=
FS);
> >> -       if (!IS_ERR(cfolio)) {
> >> -               if (folio_test_uptodate(cfolio)) {
> >> +       entry =3D f2fs_find_cache(COMPRESS_CACHE(sbi), blkaddr);
> >> +       if (!IS_ERR(entry)) {
> >> +               f2fs_lock_cache(entry);
> >> +               if (f2fs_is_compress_cache(entry) &&
> >> +                               f2fs_cache_test_uptodate(entry)) {
> >>                         atomic_inc(&sbi->compress_page_hit);
> >>                         memcpy(folio_address(folio),
> >> -                               folio_address(cfolio), folio_size(foli=
o));
> >> +                               cache_address(entry), folio_size(folio=
));
> >>                         hitted =3D true;
> >>                 }
> >> -               f2fs_folio_put(cfolio, true);
> >> +               f2fs_put_cache(entry, true);
> >>         }
> >>
> >>         return hitted;
> >> @@ -2002,71 +1985,70 @@ bool f2fs_load_compressed_folio(struct f2fs_sb=
_info *sbi, struct folio *folio,
> >>
> >>  void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi, nid_t i=
no)
> >
> > This is O(N) Full-tree scan on inode eviction.
> >
> > WDYT to improve it?
> >  - Per-inode tracking
> >  - Re-evaluate eviction policy: Since compress cache blocks are
> > indexed by physical block address (blkaddr) and hold immutable disk
> > data, the cached blocks remain valid even after the inode is
> > closed/evicted.
> >    We should evaluate whether we actually need to synchronously purge
> > clean compress cache entries upon inode eviction, or if we can simply
> > let the memory shrinker reclaim them via LRU under memory pressure.
> >
> >>  {
> >> -       struct address_space *mapping =3D COMPRESS_MAPPING(sbi);
> >> -       struct folio_batch fbatch;
> >> -       pgoff_t index =3D 0;
> >> -       pgoff_t end =3D MAX_BLKADDR(sbi);
> >> +       struct f2fs_cached_block_list *cache =3D COMPRESS_CACHE(sbi);
> >> +       struct f2fs_cached_block *entries[F2FS_ONSTACK_CACHES];
> >> +       unsigned long flags;
> >> +       pgoff_t index =3D 0, end =3D ULONG_MAX;
> >> +       int nr;
> >> +       int i;
> >>
> >> -       if (!mapping->nrpages)
> >
> > Why did you remove this line?
>
> Oh, I see your point, we need to check cache->num_entries here.

That's right.

Thanks,

>
> Thanks,
>
> >
> >> +       if (!test_opt(sbi, COMPRESS_CACHE))
> >>                 return;
> >> -
> >> -       folio_batch_init(&fbatch);
> >> -
> >> -       do {
> >> -               unsigned int nr, i;
> >> -
> >> -               nr =3D filemap_get_folios(mapping, &index, end - 1, &f=
batch);
> >> -               if (!nr)
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
> >>                         break;
> >> +               }
> >> +               f2fs_cache_get(entry);
> >> +       }
> >> +out_unlock:
> >> +       spin_unlock_irqrestore(&cache->tree_lock, flags);
> >> +       if (!nr)
> >> +               return;
> >> +       for (i =3D 0; i < nr; i++) {
> >> +               struct f2fs_cached_block *entry =3D entries[i];
> >>
> >> -               for (i =3D 0; i < nr; i++) {
> >> -                       struct folio *folio =3D fbatch.folios[i];
> >> +               index =3D entry->index + 1;
> >>
> >> -                       folio_lock(folio);
> >> -                       if (folio->mapping !=3D mapping) {
> >> -                               folio_unlock(folio);
> >> -                               continue;
> >> -                       }
> >> +               f2fs_lock_cache(entry);
> >>
> >> -                       if (ino !=3D folio_get_f2fs_data(folio)) {
> >> -                               folio_unlock(folio);
> >> -                               continue;
> >> -                       }
> >> -
> >> -                       generic_error_remove_folio(mapping, folio);
> >> -                       folio_unlock(folio);
> >> +               if (!f2fs_is_compress_cache(entry)) {
> >
> > How is this possible?
> > or if (!entry->cache)?
> >
> > Thanks,
> >
> >> +                       f2fs_unlock_cache(entry);
> >> +                       continue;
> >>                 }
> >> -               folio_batch_release(&fbatch);
> >> +               if (entry->ino !=3D ino) {
> >> +                       f2fs_unlock_cache(entry);
> >> +                       continue;
> >> +               }
> >> +
> >> +               f2fs_truncate_cache(entry, false);
> >> +               f2fs_unlock_cache(entry);
> >> +       }
> >> +       f2fs_cache_gang_release(entries, nr);
> >> +
> >> +       if (index < end) {
> >>                 cond_resched();
> >> -       } while (index < end);
> >> +               goto next;
> >> +       }
> >>  }
> >>
> >> -int f2fs_init_compress_inode(struct f2fs_sb_info *sbi)
> >> +void f2fs_init_compress_cache_context(struct f2fs_sb_info *sbi)
> >>  {
> >> -       struct inode *inode;
> >> -
> >>         if (!test_opt(sbi, COMPRESS_CACHE))
> >> -               return 0;
> >> -
> >> -       inode =3D f2fs_iget(sbi->sb, F2FS_COMPRESS_INO(sbi));
> >> -       if (IS_ERR(inode))
> >> -               return PTR_ERR(inode);
> >> -       sbi->compress_inode =3D inode;
> >> +               return;
> >>
> >>         sbi->compress_percent =3D COMPRESS_PERCENT;
> >>         sbi->compress_watermark =3D COMPRESS_WATERMARK;
> >> -
> >>         atomic_set(&sbi->compress_page_hit, 0);
> >> -
> >> -       return 0;
> >> -}
> >> -
> >> -void f2fs_destroy_compress_inode(struct f2fs_sb_info *sbi)
> >> -{
> >> -       if (!sbi->compress_inode)
> >> -               return;
> >> -       iput(sbi->compress_inode);
> >> -       sbi->compress_inode =3D NULL;
> >>  }
> >>
> >>  int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi)
> >> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> >> index bedaade92677..8cd06f7ba9e7 100644
> >> --- a/fs/f2fs/debug.c
> >> +++ b/fs/f2fs/debug.c
> >> @@ -225,8 +225,8 @@ static void update_general_status(struct f2fs_sb_i=
nfo *sbi)
> >>         si->node_caches =3D NODE_CACHE(sbi)->num_entries;
> >>         si->meta_caches =3D META_CACHE(sbi)->num_entries;
> >>  #ifdef CONFIG_F2FS_FS_COMPRESSION
> >> -       if (sbi->compress_inode) {
> >> -               si->compress_pages =3D COMPRESS_MAPPING(sbi)->nrpages;
> >> +       if (test_opt(sbi, COMPRESS_CACHE)) {
> >> +               si->compress_pages =3D COMPRESS_CACHE(sbi)->num_entrie=
s;
> >>                 si->compress_page_hit =3D atomic_read(&sbi->compress_p=
age_hit);
> >>         }
> >>  #endif
> >> @@ -386,10 +386,11 @@ static void update_mem_info(struct f2fs_sb_info =
*sbi)
> >>         si->page_mem +=3D (unsigned long long)NODE_CACHE(sbi)->num_ent=
ries << PAGE_SHIFT;
> >>         si->cache_mem +=3D NODE_CACHE(sbi)->num_entries * sizeof(struc=
t f2fs_cached_block);
> >>  #ifdef CONFIG_F2FS_FS_COMPRESSION
> >> -       if (sbi->compress_inode) {
> >> -               unsigned long npages =3D COMPRESS_MAPPING(sbi)->nrpage=
s;
> >> +       if (test_opt(sbi, COMPRESS_CACHE)) {
> >> +               unsigned long npages =3D COMPRESS_CACHE(sbi)->num_entr=
ies;
> >>
> >>                 si->page_mem +=3D (unsigned long long)npages << PAGE_S=
HIFT;
> >> +               si->cache_mem +=3D npages * sizeof(struct f2fs_cached_=
block);
> >>         }
> >>  #endif
> >>  }
> >> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> >> index 5b1b3104ec20..d55749b03ed2 100644
> >> --- a/fs/f2fs/f2fs.h
> >> +++ b/fs/f2fs/f2fs.h
> >> @@ -2078,7 +2078,6 @@ struct f2fs_sb_info {
> >>         u32 compr_new_inode;
> >>
> >>         /* For compressed block cache */
> >> -       struct inode *compress_inode;           /* cache compressed bl=
ocks */
> >>         unsigned int compress_percent;          /* cache page percenta=
ge */
> >>         unsigned int compress_watermark;        /* cache page watermar=
k */
> >>         atomic_t compress_page_hit;             /* cache hit count */
> >> @@ -4821,13 +4820,11 @@ unsigned int f2fs_cluster_blocks_are_contiguou=
s(struct dnode_of_data *dn,
> >>  int f2fs_init_compress_ctx(struct compress_ctx *cc);
> >>  void f2fs_destroy_compress_ctx(struct compress_ctx *cc, bool reuse);
> >>  void f2fs_init_compress_info(struct f2fs_sb_info *sbi);
> >> -int f2fs_init_compress_inode(struct f2fs_sb_info *sbi);
> >> -void f2fs_destroy_compress_inode(struct f2fs_sb_info *sbi);
> >> +void f2fs_init_compress_cache_context(struct f2fs_sb_info *sbi);
> >>  int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi);
> >>  void f2fs_destroy_page_array_cache(struct f2fs_sb_info *sbi);
> >>  int __init f2fs_init_compress_cache(void);
> >>  void f2fs_destroy_compress_cache(void);
> >> -struct address_space *COMPRESS_MAPPING(struct f2fs_sb_info *sbi);
> >>  void f2fs_invalidate_compress_pages_range(struct f2fs_sb_info *sbi,
> >>                                         block_t blkaddr, unsigned int =
len);
> >>  bool f2fs_load_compressed_folio(struct f2fs_sb_info *sbi, struct foli=
o *folio,
> >> @@ -4876,8 +4873,7 @@ static inline void f2fs_put_folio_dic(struct fol=
io *folio, bool in_task)
> >>  static inline unsigned int f2fs_cluster_blocks_are_contiguous(
> >>                         struct dnode_of_data *dn, unsigned int ofs_in_=
node) { return 0; }
> >>  static inline bool f2fs_sanity_check_cluster(struct dnode_of_data *dn=
) { return false; }
> >> -static inline int f2fs_init_compress_inode(struct f2fs_sb_info *sbi) =
{ return 0; }
> >> -static inline void f2fs_destroy_compress_inode(struct f2fs_sb_info *s=
bi) { }
> >> +static inline void f2fs_init_compress_cache_context(struct f2fs_sb_in=
fo *sbi) { }
> >>  static inline int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi=
) { return 0; }
> >>  static inline void f2fs_destroy_page_array_cache(struct f2fs_sb_info =
*sbi) { }
> >>  static inline int __init f2fs_init_compress_cache(void) { return 0; }
> >> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> >> index aa6f4d4a55a7..1688d9cbafe1 100644
> >> --- a/fs/f2fs/inode.c
> >> +++ b/fs/f2fs/inode.c
> >> @@ -573,15 +573,6 @@ static int do_read_inode(struct inode *inode)
> >>         return 0;
> >>  }
> >>
> >> -static bool is_meta_ino(struct f2fs_sb_info *sbi, unsigned int ino)
> >> -{
> >> -#ifdef CONFIG_F2FS_FS_COMPRESSION
> >> -       if (test_opt(sbi, COMPRESS_CACHE) && ino =3D=3D F2FS_COMPRESS_=
INO(sbi))
> >> -               return true;
> >> -#endif
> >> -       return false;
> >> -}
> >> -
> >>  struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
> >>  {
> >>         struct f2fs_sb_info *sbi =3D F2FS_SB(sb);
> >> @@ -593,42 +584,17 @@ struct inode *f2fs_iget(struct super_block *sb, =
unsigned long ino)
> >>                 return ERR_PTR(-ENOMEM);
> >>
> >>         if (!(inode_state_read_once(inode) & I_NEW)) {
> >> -               if (is_meta_ino(sbi, ino)) {
> >> -                       f2fs_err(sbi, "inaccessible inode: %lu, run fs=
ck to repair", ino);
> >> -                       set_sbi_flag(sbi, SBI_NEED_FSCK);
> >> -                       ret =3D -EFSCORRUPTED;
> >> -                       trace_f2fs_iget_exit(inode, ret);
> >> -                       iput(inode);
> >> -                       f2fs_handle_error(sbi, ERROR_CORRUPTED_INODE);
> >> -                       fserror_report_file_metadata(inode, ret, GFP_N=
OFS);
> >> -                       return ERR_PTR(ret);
> >> -               }
> >> -
> >>                 trace_f2fs_iget(inode);
> >>                 return inode;
> >>         }
> >>
> >> -       if (is_meta_ino(sbi, ino))
> >> -               goto make_now;
> >> -
> >>         ret =3D do_read_inode(inode);
> >>         if (ret)
> >>                 goto bad_inode;
> >> -make_now:
> >> +
> >>         f2fs_set_inode_flags(inode);
> >>
> >> -       if (ino =3D=3D F2FS_COMPRESS_INO(sbi)) {
> >> -#ifdef CONFIG_F2FS_FS_COMPRESSION
> >> -               inode->i_mapping->a_ops =3D &f2fs_compress_aops;
> >> -               /*
> >> -                * generic_error_remove_folio only truncates pages of =
regular
> >> -                * inode
> >> -                */
> >> -               inode->i_mode |=3D S_IFREG;
> >> -#endif
> >> -               mapping_set_gfp_mask(inode->i_mapping,
> >> -                       GFP_NOFS | __GFP_HIGHMEM | __GFP_MOVABLE);
> >> -       } else if (S_ISREG(inode->i_mode)) {
> >> +       if (S_ISREG(inode->i_mode)) {
> >>                 inode->i_op =3D &f2fs_file_inode_operations;
> >>                 inode->i_fop =3D &f2fs_file_operations;
> >>                 inode->i_mapping->a_ops =3D &f2fs_dblock_aops;
> >> @@ -879,7 +845,7 @@ static void f2fs_evict_inode_work(struct work_stru=
ct *work)
> >>  /*
> >>   * Return true, if we shouldn't go through post_evict_inode.
> >>   */
> >> -static bool f2fs_pre_evict_inode(struct inode *inode)
> >> +static void f2fs_pre_evict_inode(struct inode *inode)
> >>  {
> >>         struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> >>         struct f2fs_inode_info *fi =3D F2FS_I(inode);
> >> @@ -905,17 +871,12 @@ static bool f2fs_pre_evict_inode(struct inode *i=
node)
> >>             test_opt(sbi, COMPRESS_CACHE) && f2fs_compressed_file(inod=
e))
> >>                 f2fs_invalidate_compress_pages(sbi, inode->i_ino);
> >>
> >> -       if (inode->i_ino =3D=3D F2FS_COMPRESS_INO(sbi))
> >> -               return true;
> >> -
> >>         f2fs_bug_on(sbi, get_dirty_pages(inode));
> >>         f2fs_remove_dirty_inode(inode);
> >>         f2fs_remove_donate_inode(inode);
> >>
> >>         if (!IS_DEVICE_ALIASING(inode))
> >>                 f2fs_destroy_extent_tree(inode);
> >> -
> >> -       return false;
> >>  }
> >>
> >>  static void f2fs_delete_inode(struct inode *inode)
> >> @@ -1077,15 +1038,13 @@ static void f2fs_post_evict_inode(struct inode=
 *inode)
> >>   */
> >>  void f2fs_evict_inode(struct inode *inode)
> >>  {
> >> -       if (f2fs_pre_evict_inode(inode))
> >> -               goto clear_out;
> >> +       f2fs_pre_evict_inode(inode);
> >>
> >>         if (!inode->i_nlink && !is_bad_inode(inode))
> >>                 f2fs_delete_inode(inode);
> >>
> >>         f2fs_post_evict_inode(inode);
> >>
> >> -clear_out:
> >>         fscrypt_put_encryption_info(inode);
> >>         clear_inode(inode);
> >>  }
> >> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> >> index 07c23b35e7f7..cf052008aa64 100644
> >> --- a/fs/f2fs/node.c
> >> +++ b/fs/f2fs/node.c
> >> @@ -119,7 +119,7 @@ bool f2fs_available_free_memory(struct f2fs_sb_inf=
o *sbi, int type)
> >>                  * exceed threshold, deny caching compress page.
> >>                  */
> >>                 res =3D (free_ram > avail_ram * sbi->compress_watermar=
k / 100) &&
> >> -                       (COMPRESS_MAPPING(sbi)->nrpages <
> >> +                       (COMPRESS_CACHE(sbi)->num_entries <
> >>                          free_ram * sbi->compress_percent / 100);
> >>  #else
> >>                 res =3D false;
> >> diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
> >> index 20b3fe1f8c07..e7d2830e6a23 100644
> >> --- a/fs/f2fs/shrinker.c
> >> +++ b/fs/f2fs/shrinker.c
> >> @@ -40,7 +40,8 @@ static unsigned long __count_extent_cache(struct f2f=
s_sb_info *sbi,
> >>  static unsigned long __count_cache(struct f2fs_sb_info *sbi)
> >>  {
> >>         return sbi->meta_blocks.num_entries +
> >> -               sbi->node_blocks.num_entries;
> >> +               sbi->node_blocks.num_entries +
> >> +               sbi->compress_blocks.num_entries;
> >>  }
> >>
> >>  unsigned long f2fs_shrink_count(struct shrinker *shrink,
> >> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> >> index 6b42b736a662..5787cfb76c6e 100644
> >> --- a/fs/f2fs/super.c
> >> +++ b/fs/f2fs/super.c
> >> @@ -2050,8 +2050,6 @@ static void f2fs_put_super(struct super_block *s=
b)
> >>
> >>         f2fs_bug_on(sbi, sbi->fsync_node_num);
> >>
> >> -       f2fs_destroy_compress_inode(sbi);
> >> -
> >>         f2fs_destroy_cache(COMPRESS_CACHE(sbi));
> >>         f2fs_destroy_cache(NODE_CACHE(sbi));
> >>         f2fs_destroy_cache(META_CACHE(sbi));
> >> @@ -5285,6 +5283,8 @@ static int f2fs_fill_super(struct super_block *s=
b, struct fs_context *fc)
> >>
> >>         f2fs_init_fsync_node_info(sbi);
> >>
> >> +       f2fs_init_compress_cache_context(sbi);
> >> +
> >>         /* setup checkpoint request control and start checkpoint issue=
 thread */
> >>         f2fs_init_ckpt_req_control(sbi);
> >>         if (!f2fs_readonly(sb) && !test_opt(sbi, DISABLE_CHECKPOINT) &=
&
> >> @@ -5363,13 +5363,9 @@ static int f2fs_fill_super(struct super_block *=
sb, struct fs_context *fc)
> >>                 goto free_ino_entry;
> >>         }
> >>
> >> -       err =3D f2fs_init_compress_inode(sbi);
> >> -       if (err)
> >> -               goto free_root_inode;
> >> -
> >>         err =3D f2fs_register_sysfs(sbi);
> >>         if (err)
> >> -               goto free_compress_inode;
> >> +               goto free_root_inode;
> >>
> >>         sbi->umount_lock_holder =3D current;
> >>  #ifdef CONFIG_QUOTA
> >> @@ -5537,8 +5533,6 @@ static int f2fs_fill_super(struct super_block *s=
b, struct fs_context *fc)
> >>         /* evict some inodes being cached by GC */
> >>         evict_inodes(sb);
> >>         f2fs_unregister_sysfs(sbi);
> >> -free_compress_inode:
> >> -       f2fs_destroy_compress_inode(sbi);
> >>  free_root_inode:
> >>         dput(sb->s_root);
> >>         sb->s_root =3D NULL;
> >> @@ -5655,7 +5649,8 @@ static void kill_f2fs_super(struct super_block *=
sb)
> >>                  * compress inode cache.
> >>                  */
> >>                 if (test_opt(sbi, COMPRESS_CACHE))
> >> -                       truncate_inode_pages_final(COMPRESS_MAPPING(sb=
i));
> >> +                       f2fs_invalidate_compress_pages_range(sbi,
> >> +                                       0, UINT_MAX);
> >>  #endif
> >>
> >>                 if (is_sbi_flag_set(sbi, SBI_IS_DIRTY) ||
> >> diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
> >> index 105cfeedea74..53344e1f2b44 100644
> >> --- a/include/linux/f2fs_fs.h
> >> +++ b/include/linux/f2fs_fs.h
> >> @@ -34,7 +34,6 @@
> >>  #define F2FS_RESERVED_NODE_NUM         3
> >>
> >>  #define F2FS_ROOT_INO(sbi)     ((sbi)->root_ino_num)
> >> -#define F2FS_COMPRESS_INO(sbi) (NM_I(sbi)->max_nid)
> >>
> >>  #define F2FS_MAX_QUOTAS                3
> >>
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
