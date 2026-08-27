Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8F237DE9D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787797369; cv=none; b=egZrbfnZGoc3MWb5Dj2PeGSIFVrJaJ4ZEkYqQZFQ3uX8LH9np95iVQj4JDdPgTDjzxy6z2HZnMnWNipk6ccwHIyUxMOoXaxDEVzWZ7ZEuoNRWQAHKrlMZaX5sQBOVJWztGqxerFqsfMVvBNNI2JpXJdZzkNkPNW5IIZHJltAab4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787797369; c=relaxed/simple;
	bh=dxlIe9+ac2QVv68uTEuCDjBZ36oPhGO3yyTMggwBK3I=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DyIG8lQSAwg5Cjrao63VqQRXHzpOyFnFjkT/h0Z0cX54487IE5Qt40jVUhPvXp6LzoLaAlKAJ2mYIdHYj2/xKkVSd9jzrlNE7ryQm0k+oNHMY9KcaMrOlcvbTQw1Js/c+sWr4gnY1KPhmCdV2r41rUDHFbn0n24cW1/HOBa4VB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XY6wV0/f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XY6wV0/f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF2B71F000E9;
	Thu, 27 Aug 2026 02:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787797363;
	bh=8CHEJu/ZTBGQAb/fShJcboLth9AOe/0yeUdeSixgz0g=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=XY6wV0/fnYmtCmNMYiz758V+jKUl91RZw4kExVDPxP8hUZV79rm6mOJGqJ7MbWSl5
	 VRLfJ4HX2lv2kAQzME+pyXZk3VLoXPxKn2CoMT6VPFltbi4fs7EA7X8g9NN6yErDiT
	 HjjYu6KRvFsRzF+gNY13d4H2BGJULkgnRYidk85+HBdv3/IrazdFI4Zq54AYN7kLUt
	 zF9C0E1iSHvPK2zTG1U+/4DtQxCSqE63vKkTTfG2yVtd7g8FplxQbAf0uESN183xQ1
	 0vlrM9n5Jkcow/g8gmclrxYCaboLaxlNPHGfzXujdo+QSIUcCtq6QeN8smNgxp0ZR5
	 NcvoOuhUO5xcA==
Message-ID: <2109b8de-bd1c-447a-b78d-cd0cd9f2e451@kernel.org>
Date: Thu, 27 Aug 2026 10:22:41 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [f2fs-dev] [PATCH v3 09/12] f2fs: cache: use compress cache
To: Daeho Jeong <daeho43@gmail.com>
References: <20260825130126.2078627-1-chao@kernel.org>
 <20260825130126.2078627-10-chao@kernel.org>
 <CACOAw_w+QMkTNK=McScLHh1gpm6UFjxLSnVxhFMsgsuArLA=qQ@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CACOAw_w+QMkTNK=McScLHh1gpm6UFjxLSnVxhFMsgsuArLA=qQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/27/26 04:04, Daeho Jeong wrote:
> On Tue, Aug 25, 2026 at 6:03 AM Chao Yu via Linux-f2fs-devel
> <linux-f2fs-devel@lists.sourceforge.net> wrote:
>>
>> This patch migrates compressed cluster caching from the fake VFS inode
>> page cache (sbi->compress_inode) to compress cache (sbi->compress_blocks).
>>
>> It converts compression caching and decompression paths to use
>> compress cache APIs, uses entry->ino for per-inode invalidation, and
>> removes sbi->compress_inode.
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>  fs/f2fs/cache.c         |  14 ++--
>>  fs/f2fs/cache.h         |   1 +
>>  fs/f2fs/compress.c      | 158 ++++++++++++++++++----------------------
>>  fs/f2fs/debug.c         |   9 ++-
>>  fs/f2fs/f2fs.h          |   8 +-
>>  fs/f2fs/inode.c         |  49 +------------
>>  fs/f2fs/node.c          |   2 +-
>>  fs/f2fs/shrinker.c      |   3 +-
>>  fs/f2fs/super.c         |  15 ++--
>>  include/linux/f2fs_fs.h |   1 -
>>  10 files changed, 98 insertions(+), 162 deletions(-)
>>
>> diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
>> index 8431180bb1f8..5b9055ad49b9 100644
>> --- a/fs/f2fs/cache.c
>> +++ b/fs/f2fs/cache.c
>> @@ -417,13 +417,12 @@ static void f2fs_do_truncate_cache(struct f2fs_cached_block *entry,
>>         spin_unlock(&cache->list_lock);
>>  }
>>
>> -static void f2fs_truncate_cache(struct f2fs_cached_block *entry,
>> +void f2fs_truncate_cache(struct f2fs_cached_block *entry,
>>                                         bool drop_dirty)
> 
> -> __f2fs_truncate_cache() without locking?

Actually, I'v relocated the lock into callers of f2fs_truncate_cache(),
in order to support check entry->ino, entry->cache w/ the lock in
f2fs_invalidate_compress_pages(), please take a look.

> 
>>  {
>> -       f2fs_lock_cache(entry);
>> -       if (entry->cache)
>> -               f2fs_do_truncate_cache(entry, drop_dirty);
>> -       f2fs_unlock_cache(entry);
>> +       if (!entry->cache)
>> +               return;
>> +       f2fs_do_truncate_cache(entry, drop_dirty);
>>  }
>>
>>  static void f2fs_drop_cache(struct f2fs_cached_block_list *cache,
>> @@ -435,8 +434,9 @@ static void f2fs_drop_cache(struct f2fs_cached_block_list *cache,
>>         if (IS_ERR(entry))
>>                 return;
>>
>> +       f2fs_lock_cache(entry);
>>         f2fs_truncate_cache(entry, drop_dirty);
>> -       f2fs_put_cache(entry, false);
>> +       f2fs_put_cache(entry, true);
>>  }
>>
>>  void f2fs_drop_cache_range(struct f2fs_cached_block_list *cache,
>> @@ -478,7 +478,9 @@ void f2fs_drop_cache_range(struct f2fs_cached_block_list *cache,
>>
>>                 index = entry->index + 1;
>>
>> +               f2fs_lock_cache(entry);
>>                 f2fs_truncate_cache(entry, drop_dirty);
>> +               f2fs_unlock_cache(entry);
>>         }
>>         f2fs_cache_gang_release(entries, nr);
>>
>> diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
>> index b87feb3eb896..b66dbaefee2f 100644
>> --- a/fs/f2fs/cache.h
>> +++ b/fs/f2fs/cache.h
>> @@ -168,6 +168,7 @@ unsigned int f2fs_cache_gang_lookup_tag(struct f2fs_cached_block_list *cache,
>>                 unsigned int max_items, int tag);
>>  void f2fs_cache_gang_release(struct f2fs_cached_block **entries,
>>                                 unsigned int nr_entries);
>> +void f2fs_truncate_cache(struct f2fs_cached_block *entry, bool drop_dirty);
>>  int f2fs_writeback_cache(struct f2fs_cached_block_list *cache, bool sync);
>>  void f2fs_cache_wait_on_all_writeback(struct f2fs_cached_block_list *cache);
>>  void f2fs_cache_wait_writeback_cond(struct f2fs_cached_block *entry,
>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>> index 676a5559357f..155be3a3d203 100644
>> --- a/fs/f2fs/compress.c
>> +++ b/fs/f2fs/compress.c
>> @@ -1918,30 +1918,19 @@ unsigned int f2fs_cluster_blocks_are_contiguous(struct dnode_of_data *dn,
>>         return compressed ? i - 1 : i;
>>  }
>>
>> -const struct address_space_operations f2fs_compress_aops = {
>> -       .release_folio = f2fs_release_folio,
>> -       .invalidate_folio = f2fs_invalidate_folio,
>> -       .migrate_folio  = filemap_migrate_folio,
>> -};
>> -
>> -struct address_space *COMPRESS_MAPPING(struct f2fs_sb_info *sbi)
>> -{
>> -       return sbi->compress_inode->i_mapping;
>> -}
>> -
>>  void f2fs_invalidate_compress_pages_range(struct f2fs_sb_info *sbi,
>>                                 block_t blkaddr, unsigned int len)
>>  {
>> -       if (!sbi->compress_inode)
>> +       if (!test_opt(sbi, COMPRESS_CACHE))
>>                 return;
>> -       invalidate_mapping_pages(COMPRESS_MAPPING(sbi), blkaddr, blkaddr + len - 1);
>> +
>> +       f2fs_drop_cache_range(COMPRESS_CACHE(sbi), blkaddr, len, false);
>>  }
>>
>>  static void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi,
>>                 struct folio *folio, nid_t ino, block_t blkaddr)
>>  {
>> -       struct folio *cfolio;
>> -       int ret;
>> +       struct f2fs_cached_block *entry;
>>
>>         if (!test_opt(sbi, COMPRESS_CACHE))
>>                 return;
>> @@ -1952,49 +1941,43 @@ static void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi,
>>         if (!f2fs_available_free_memory(sbi, COMPRESS_PAGE))
>>                 return;
>>
>> -       cfolio = filemap_get_folio(COMPRESS_MAPPING(sbi), blkaddr);
>> -       if (!IS_ERR(cfolio)) {
>> -               f2fs_folio_put(cfolio, false);
>> +       entry = f2fs_find_cache(COMPRESS_CACHE(sbi), blkaddr);
>> +       if (!IS_ERR(entry)) {
>> +               f2fs_put_cache(entry, false);
>>                 return;
>>         }
>>
>> -       cfolio = filemap_alloc_folio(__GFP_NOWARN | __GFP_IO, 0, NULL);
>> -       if (!cfolio)
>> -               return;
>> -
>> -       ret = filemap_add_folio(COMPRESS_MAPPING(sbi), cfolio,
>> -                                               blkaddr, GFP_NOFS);
>> -       if (ret) {
>> -               f2fs_folio_put(cfolio, false);
>> +       entry = f2fs_grab_cache(COMPRESS_CACHE(sbi), blkaddr,
>> +                                       F2FS_CACHE_LOCK_CREATE);
>> +       if (IS_ERR(entry))
>>                 return;
>> -       }
>>
>> -       folio_set_f2fs_data(cfolio, ino);
>> -
>> -       memcpy(folio_address(cfolio), folio_address(folio), PAGE_SIZE);
>> -       folio_mark_uptodate(cfolio);
>> -       f2fs_folio_put(cfolio, true);
>> +       entry->ino = ino;
>> +       memcpy(cache_address(entry), folio_address(folio), PAGE_SIZE);
>> +       f2fs_cache_set_uptodate(entry);
>> +       f2fs_put_cache(entry, true);
>>  }
>>
>>  bool f2fs_load_compressed_folio(struct f2fs_sb_info *sbi, struct folio *folio,
>>                                                                 block_t blkaddr)
>>  {
>> -       struct folio *cfolio;
>> +       struct f2fs_cached_block *entry;
>>         bool hitted = false;
>>
>>         if (!test_opt(sbi, COMPRESS_CACHE))
>>                 return false;
>>
>> -       cfolio = f2fs_filemap_get_folio(COMPRESS_MAPPING(sbi),
>> -                               blkaddr, FGP_LOCK | FGP_NOWAIT, GFP_NOFS);
>> -       if (!IS_ERR(cfolio)) {
>> -               if (folio_test_uptodate(cfolio)) {
>> +       entry = f2fs_find_cache(COMPRESS_CACHE(sbi), blkaddr);
>> +       if (!IS_ERR(entry)) {
>> +               f2fs_lock_cache(entry);
>> +               if (f2fs_is_compress_cache(entry) &&
>> +                               f2fs_cache_test_uptodate(entry)) {
>>                         atomic_inc(&sbi->compress_page_hit);
>>                         memcpy(folio_address(folio),
>> -                               folio_address(cfolio), folio_size(folio));
>> +                               cache_address(entry), folio_size(folio));
>>                         hitted = true;
>>                 }
>> -               f2fs_folio_put(cfolio, true);
>> +               f2fs_put_cache(entry, true);
>>         }
>>
>>         return hitted;
>> @@ -2002,71 +1985,70 @@ bool f2fs_load_compressed_folio(struct f2fs_sb_info *sbi, struct folio *folio,
>>
>>  void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi, nid_t ino)
> 
> This is O(N) Full-tree scan on inode eviction.
> 
> WDYT to improve it?
>  - Per-inode tracking
>  - Re-evaluate eviction policy: Since compress cache blocks are
> indexed by physical block address (blkaddr) and hold immutable disk
> data, the cached blocks remain valid even after the inode is
> closed/evicted.

So you mean like extent cache policy, right? cache still keep valid before
unlink/umount.

>    We should evaluate whether we actually need to synchronously purge
> clean compress cache entries upon inode eviction, or if we can simply
> let the memory shrinker reclaim them via LRU under memory pressure.

I think your idea is good, also I'm good to improve compress cache, actually,
in this patch I just want to do minimum replacement in between folio and internal
cache, what do you think of improving it w/ a separated patch a bit later?

> 
>>  {
>> -       struct address_space *mapping = COMPRESS_MAPPING(sbi);
>> -       struct folio_batch fbatch;
>> -       pgoff_t index = 0;
>> -       pgoff_t end = MAX_BLKADDR(sbi);
>> +       struct f2fs_cached_block_list *cache = COMPRESS_CACHE(sbi);
>> +       struct f2fs_cached_block *entries[F2FS_ONSTACK_CACHES];
>> +       unsigned long flags;
>> +       pgoff_t index = 0, end = ULONG_MAX;
>> +       int nr;
>> +       int i;
>>
>> -       if (!mapping->nrpages)
> 
> Why did you remove this line?

Because compress_inode's mapping is not existing?

> 
>> +       if (!test_opt(sbi, COMPRESS_CACHE))
>>                 return;
>> -
>> -       folio_batch_init(&fbatch);
>> -
>> -       do {
>> -               unsigned int nr, i;
>> -
>> -               nr = filemap_get_folios(mapping, &index, end - 1, &fbatch);
>> -               if (!nr)
>> +next:
>> +       spin_lock_irqsave(&cache->tree_lock, flags);
>> +       nr = radix_tree_gang_lookup(&cache->root, (void **)entries, index,
>> +               min((unsigned long)F2FS_ONSTACK_CACHES, end - index));
>> +       if (!nr)
>> +               goto out_unlock;
>> +
>> +       for (i = 0; i < nr; i++) {
>> +               struct f2fs_cached_block *entry = entries[i];
>> +
>> +               if (entry->index >= end) {
>> +                       nr = i;
>>                         break;
>> +               }
>> +               f2fs_cache_get(entry);
>> +       }
>> +out_unlock:
>> +       spin_unlock_irqrestore(&cache->tree_lock, flags);
>> +       if (!nr)
>> +               return;
>> +       for (i = 0; i < nr; i++) {
>> +               struct f2fs_cached_block *entry = entries[i];
>>
>> -               for (i = 0; i < nr; i++) {
>> -                       struct folio *folio = fbatch.folios[i];
>> +               index = entry->index + 1;
>>
>> -                       folio_lock(folio);
>> -                       if (folio->mapping != mapping) {
>> -                               folio_unlock(folio);
>> -                               continue;
>> -                       }
>> +               f2fs_lock_cache(entry);
>>
>> -                       if (ino != folio_get_f2fs_data(folio)) {
>> -                               folio_unlock(folio);
>> -                               continue;
>> -                       }
>> -
>> -                       generic_error_remove_folio(mapping, folio);
>> -                       folio_unlock(folio);
>> +               if (!f2fs_is_compress_cache(entry)) {
> 
> How is this possible?
> or if (!entry->cache)?

Looks like a impossible case, let me chaneg it to a f2fs_bug_on().

Thanks,

> 
> Thanks,
> 
>> +                       f2fs_unlock_cache(entry);
>> +                       continue;
>>                 }
>> -               folio_batch_release(&fbatch);
>> +               if (entry->ino != ino) {
>> +                       f2fs_unlock_cache(entry);
>> +                       continue;
>> +               }
>> +
>> +               f2fs_truncate_cache(entry, false);
>> +               f2fs_unlock_cache(entry);
>> +       }
>> +       f2fs_cache_gang_release(entries, nr);
>> +
>> +       if (index < end) {
>>                 cond_resched();
>> -       } while (index < end);
>> +               goto next;
>> +       }
>>  }
>>
>> -int f2fs_init_compress_inode(struct f2fs_sb_info *sbi)
>> +void f2fs_init_compress_cache_context(struct f2fs_sb_info *sbi)
>>  {
>> -       struct inode *inode;
>> -
>>         if (!test_opt(sbi, COMPRESS_CACHE))
>> -               return 0;
>> -
>> -       inode = f2fs_iget(sbi->sb, F2FS_COMPRESS_INO(sbi));
>> -       if (IS_ERR(inode))
>> -               return PTR_ERR(inode);
>> -       sbi->compress_inode = inode;
>> +               return;
>>
>>         sbi->compress_percent = COMPRESS_PERCENT;
>>         sbi->compress_watermark = COMPRESS_WATERMARK;
>> -
>>         atomic_set(&sbi->compress_page_hit, 0);
>> -
>> -       return 0;
>> -}
>> -
>> -void f2fs_destroy_compress_inode(struct f2fs_sb_info *sbi)
>> -{
>> -       if (!sbi->compress_inode)
>> -               return;
>> -       iput(sbi->compress_inode);
>> -       sbi->compress_inode = NULL;
>>  }
>>
>>  int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi)
>> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
>> index bedaade92677..8cd06f7ba9e7 100644
>> --- a/fs/f2fs/debug.c
>> +++ b/fs/f2fs/debug.c
>> @@ -225,8 +225,8 @@ static void update_general_status(struct f2fs_sb_info *sbi)
>>         si->node_caches = NODE_CACHE(sbi)->num_entries;
>>         si->meta_caches = META_CACHE(sbi)->num_entries;
>>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>> -       if (sbi->compress_inode) {
>> -               si->compress_pages = COMPRESS_MAPPING(sbi)->nrpages;
>> +       if (test_opt(sbi, COMPRESS_CACHE)) {
>> +               si->compress_pages = COMPRESS_CACHE(sbi)->num_entries;
>>                 si->compress_page_hit = atomic_read(&sbi->compress_page_hit);
>>         }
>>  #endif
>> @@ -386,10 +386,11 @@ static void update_mem_info(struct f2fs_sb_info *sbi)
>>         si->page_mem += (unsigned long long)NODE_CACHE(sbi)->num_entries << PAGE_SHIFT;
>>         si->cache_mem += NODE_CACHE(sbi)->num_entries * sizeof(struct f2fs_cached_block);
>>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>> -       if (sbi->compress_inode) {
>> -               unsigned long npages = COMPRESS_MAPPING(sbi)->nrpages;
>> +       if (test_opt(sbi, COMPRESS_CACHE)) {
>> +               unsigned long npages = COMPRESS_CACHE(sbi)->num_entries;
>>
>>                 si->page_mem += (unsigned long long)npages << PAGE_SHIFT;
>> +               si->cache_mem += npages * sizeof(struct f2fs_cached_block);
>>         }
>>  #endif
>>  }
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 5b1b3104ec20..d55749b03ed2 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -2078,7 +2078,6 @@ struct f2fs_sb_info {
>>         u32 compr_new_inode;
>>
>>         /* For compressed block cache */
>> -       struct inode *compress_inode;           /* cache compressed blocks */
>>         unsigned int compress_percent;          /* cache page percentage */
>>         unsigned int compress_watermark;        /* cache page watermark */
>>         atomic_t compress_page_hit;             /* cache hit count */
>> @@ -4821,13 +4820,11 @@ unsigned int f2fs_cluster_blocks_are_contiguous(struct dnode_of_data *dn,
>>  int f2fs_init_compress_ctx(struct compress_ctx *cc);
>>  void f2fs_destroy_compress_ctx(struct compress_ctx *cc, bool reuse);
>>  void f2fs_init_compress_info(struct f2fs_sb_info *sbi);
>> -int f2fs_init_compress_inode(struct f2fs_sb_info *sbi);
>> -void f2fs_destroy_compress_inode(struct f2fs_sb_info *sbi);
>> +void f2fs_init_compress_cache_context(struct f2fs_sb_info *sbi);
>>  int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi);
>>  void f2fs_destroy_page_array_cache(struct f2fs_sb_info *sbi);
>>  int __init f2fs_init_compress_cache(void);
>>  void f2fs_destroy_compress_cache(void);
>> -struct address_space *COMPRESS_MAPPING(struct f2fs_sb_info *sbi);
>>  void f2fs_invalidate_compress_pages_range(struct f2fs_sb_info *sbi,
>>                                         block_t blkaddr, unsigned int len);
>>  bool f2fs_load_compressed_folio(struct f2fs_sb_info *sbi, struct folio *folio,
>> @@ -4876,8 +4873,7 @@ static inline void f2fs_put_folio_dic(struct folio *folio, bool in_task)
>>  static inline unsigned int f2fs_cluster_blocks_are_contiguous(
>>                         struct dnode_of_data *dn, unsigned int ofs_in_node) { return 0; }
>>  static inline bool f2fs_sanity_check_cluster(struct dnode_of_data *dn) { return false; }
>> -static inline int f2fs_init_compress_inode(struct f2fs_sb_info *sbi) { return 0; }
>> -static inline void f2fs_destroy_compress_inode(struct f2fs_sb_info *sbi) { }
>> +static inline void f2fs_init_compress_cache_context(struct f2fs_sb_info *sbi) { }
>>  static inline int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi) { return 0; }
>>  static inline void f2fs_destroy_page_array_cache(struct f2fs_sb_info *sbi) { }
>>  static inline int __init f2fs_init_compress_cache(void) { return 0; }
>> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
>> index aa6f4d4a55a7..1688d9cbafe1 100644
>> --- a/fs/f2fs/inode.c
>> +++ b/fs/f2fs/inode.c
>> @@ -573,15 +573,6 @@ static int do_read_inode(struct inode *inode)
>>         return 0;
>>  }
>>
>> -static bool is_meta_ino(struct f2fs_sb_info *sbi, unsigned int ino)
>> -{
>> -#ifdef CONFIG_F2FS_FS_COMPRESSION
>> -       if (test_opt(sbi, COMPRESS_CACHE) && ino == F2FS_COMPRESS_INO(sbi))
>> -               return true;
>> -#endif
>> -       return false;
>> -}
>> -
>>  struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
>>  {
>>         struct f2fs_sb_info *sbi = F2FS_SB(sb);
>> @@ -593,42 +584,17 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
>>                 return ERR_PTR(-ENOMEM);
>>
>>         if (!(inode_state_read_once(inode) & I_NEW)) {
>> -               if (is_meta_ino(sbi, ino)) {
>> -                       f2fs_err(sbi, "inaccessible inode: %lu, run fsck to repair", ino);
>> -                       set_sbi_flag(sbi, SBI_NEED_FSCK);
>> -                       ret = -EFSCORRUPTED;
>> -                       trace_f2fs_iget_exit(inode, ret);
>> -                       iput(inode);
>> -                       f2fs_handle_error(sbi, ERROR_CORRUPTED_INODE);
>> -                       fserror_report_file_metadata(inode, ret, GFP_NOFS);
>> -                       return ERR_PTR(ret);
>> -               }
>> -
>>                 trace_f2fs_iget(inode);
>>                 return inode;
>>         }
>>
>> -       if (is_meta_ino(sbi, ino))
>> -               goto make_now;
>> -
>>         ret = do_read_inode(inode);
>>         if (ret)
>>                 goto bad_inode;
>> -make_now:
>> +
>>         f2fs_set_inode_flags(inode);
>>
>> -       if (ino == F2FS_COMPRESS_INO(sbi)) {
>> -#ifdef CONFIG_F2FS_FS_COMPRESSION
>> -               inode->i_mapping->a_ops = &f2fs_compress_aops;
>> -               /*
>> -                * generic_error_remove_folio only truncates pages of regular
>> -                * inode
>> -                */
>> -               inode->i_mode |= S_IFREG;
>> -#endif
>> -               mapping_set_gfp_mask(inode->i_mapping,
>> -                       GFP_NOFS | __GFP_HIGHMEM | __GFP_MOVABLE);
>> -       } else if (S_ISREG(inode->i_mode)) {
>> +       if (S_ISREG(inode->i_mode)) {
>>                 inode->i_op = &f2fs_file_inode_operations;
>>                 inode->i_fop = &f2fs_file_operations;
>>                 inode->i_mapping->a_ops = &f2fs_dblock_aops;
>> @@ -879,7 +845,7 @@ static void f2fs_evict_inode_work(struct work_struct *work)
>>  /*
>>   * Return true, if we shouldn't go through post_evict_inode.
>>   */
>> -static bool f2fs_pre_evict_inode(struct inode *inode)
>> +static void f2fs_pre_evict_inode(struct inode *inode)
>>  {
>>         struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>>         struct f2fs_inode_info *fi = F2FS_I(inode);
>> @@ -905,17 +871,12 @@ static bool f2fs_pre_evict_inode(struct inode *inode)
>>             test_opt(sbi, COMPRESS_CACHE) && f2fs_compressed_file(inode))
>>                 f2fs_invalidate_compress_pages(sbi, inode->i_ino);
>>
>> -       if (inode->i_ino == F2FS_COMPRESS_INO(sbi))
>> -               return true;
>> -
>>         f2fs_bug_on(sbi, get_dirty_pages(inode));
>>         f2fs_remove_dirty_inode(inode);
>>         f2fs_remove_donate_inode(inode);
>>
>>         if (!IS_DEVICE_ALIASING(inode))
>>                 f2fs_destroy_extent_tree(inode);
>> -
>> -       return false;
>>  }
>>
>>  static void f2fs_delete_inode(struct inode *inode)
>> @@ -1077,15 +1038,13 @@ static void f2fs_post_evict_inode(struct inode *inode)
>>   */
>>  void f2fs_evict_inode(struct inode *inode)
>>  {
>> -       if (f2fs_pre_evict_inode(inode))
>> -               goto clear_out;
>> +       f2fs_pre_evict_inode(inode);
>>
>>         if (!inode->i_nlink && !is_bad_inode(inode))
>>                 f2fs_delete_inode(inode);
>>
>>         f2fs_post_evict_inode(inode);
>>
>> -clear_out:
>>         fscrypt_put_encryption_info(inode);
>>         clear_inode(inode);
>>  }
>> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
>> index 07c23b35e7f7..cf052008aa64 100644
>> --- a/fs/f2fs/node.c
>> +++ b/fs/f2fs/node.c
>> @@ -119,7 +119,7 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
>>                  * exceed threshold, deny caching compress page.
>>                  */
>>                 res = (free_ram > avail_ram * sbi->compress_watermark / 100) &&
>> -                       (COMPRESS_MAPPING(sbi)->nrpages <
>> +                       (COMPRESS_CACHE(sbi)->num_entries <
>>                          free_ram * sbi->compress_percent / 100);
>>  #else
>>                 res = false;
>> diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
>> index 20b3fe1f8c07..e7d2830e6a23 100644
>> --- a/fs/f2fs/shrinker.c
>> +++ b/fs/f2fs/shrinker.c
>> @@ -40,7 +40,8 @@ static unsigned long __count_extent_cache(struct f2fs_sb_info *sbi,
>>  static unsigned long __count_cache(struct f2fs_sb_info *sbi)
>>  {
>>         return sbi->meta_blocks.num_entries +
>> -               sbi->node_blocks.num_entries;
>> +               sbi->node_blocks.num_entries +
>> +               sbi->compress_blocks.num_entries;
>>  }
>>
>>  unsigned long f2fs_shrink_count(struct shrinker *shrink,
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index 6b42b736a662..5787cfb76c6e 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -2050,8 +2050,6 @@ static void f2fs_put_super(struct super_block *sb)
>>
>>         f2fs_bug_on(sbi, sbi->fsync_node_num);
>>
>> -       f2fs_destroy_compress_inode(sbi);
>> -
>>         f2fs_destroy_cache(COMPRESS_CACHE(sbi));
>>         f2fs_destroy_cache(NODE_CACHE(sbi));
>>         f2fs_destroy_cache(META_CACHE(sbi));
>> @@ -5285,6 +5283,8 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>>
>>         f2fs_init_fsync_node_info(sbi);
>>
>> +       f2fs_init_compress_cache_context(sbi);
>> +
>>         /* setup checkpoint request control and start checkpoint issue thread */
>>         f2fs_init_ckpt_req_control(sbi);
>>         if (!f2fs_readonly(sb) && !test_opt(sbi, DISABLE_CHECKPOINT) &&
>> @@ -5363,13 +5363,9 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>>                 goto free_ino_entry;
>>         }
>>
>> -       err = f2fs_init_compress_inode(sbi);
>> -       if (err)
>> -               goto free_root_inode;
>> -
>>         err = f2fs_register_sysfs(sbi);
>>         if (err)
>> -               goto free_compress_inode;
>> +               goto free_root_inode;
>>
>>         sbi->umount_lock_holder = current;
>>  #ifdef CONFIG_QUOTA
>> @@ -5537,8 +5533,6 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>>         /* evict some inodes being cached by GC */
>>         evict_inodes(sb);
>>         f2fs_unregister_sysfs(sbi);
>> -free_compress_inode:
>> -       f2fs_destroy_compress_inode(sbi);
>>  free_root_inode:
>>         dput(sb->s_root);
>>         sb->s_root = NULL;
>> @@ -5655,7 +5649,8 @@ static void kill_f2fs_super(struct super_block *sb)
>>                  * compress inode cache.
>>                  */
>>                 if (test_opt(sbi, COMPRESS_CACHE))
>> -                       truncate_inode_pages_final(COMPRESS_MAPPING(sbi));
>> +                       f2fs_invalidate_compress_pages_range(sbi,
>> +                                       0, UINT_MAX);
>>  #endif
>>
>>                 if (is_sbi_flag_set(sbi, SBI_IS_DIRTY) ||
>> diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
>> index 105cfeedea74..53344e1f2b44 100644
>> --- a/include/linux/f2fs_fs.h
>> +++ b/include/linux/f2fs_fs.h
>> @@ -34,7 +34,6 @@
>>  #define F2FS_RESERVED_NODE_NUM         3
>>
>>  #define F2FS_ROOT_INO(sbi)     ((sbi)->root_ino_num)
>> -#define F2FS_COMPRESS_INO(sbi) (NM_I(sbi)->max_nid)
>>
>>  #define F2FS_MAX_QUOTAS                3
>>
>> --
>> 2.49.0
>>
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

