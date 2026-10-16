Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BFD442397
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149952; cv=none; b=uhrovgn5uuKym3VTNtLUgqNn2DCV1G5qSgrCwFY4JU4A2Dnlmw8nQdLR6dM8ltKmECoDwLf1Qb8BSkfekddlDTgMjuvmf6cBD+jO1NQrZgY8DYXZxa3308ma08XE5f9kRAwK3etUgjY33DLgXptILJxGwbxBd5xmblmlzIQnjLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149952; c=relaxed/simple;
	bh=5v9urK9HksbqZunJAsFacokdAo+ChxXhQSrnr1N194k=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JqOinoiy9RBpKSjC+Dm5Vo70ECGK8fIktHZNZdPfOAK9KxkMORpGRw7c2ddjJwxgxCadiFD7QUt7cYkEnPteetGehKyUCHBQWVfOVs7FxWIwKrgeHHgqRHQF8XvEuY6uVmLX22eDKabwaElvQHkuOEzKsZnsV5mMlsPYypgdCt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SKDOhBaJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SKDOhBaJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEA861F000C4;
	Fri, 16 Oct 2026 11:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792149950;
	bh=bhTqRiskPttZ//Qh78NoZTiKwmkRVRPDuZMSTT8GKac=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=SKDOhBaJIdoNOFoY4lKUq3AnOCca4a44ZflyKjZC6Ec8mJ/+G/qiGkk5ShG6QkN5B
	 tKOhPAcZzix8EiWi3oPgm4bNyseBNZVE54EXIkxdtbQFoRoTdVolePccbVN+5jigTL
	 kgmFl3JIrbCPaSygqjZJQgz8ckokQ2S44b7gj1/95hvmEBr4q75h1VWZdiHgJUUd+H
	 d2IWEFhrPvJlFtxFEfANWXp0xPqBTHk2E7bf0HdSH1Li6GUlM9cTX3aMyMAuUuei7O
	 OyKPkKfPtk8zkViMwB4n3BpnwgSk5N6MFsnUT06FVk3LHkSmkr0tKEDTObIZjLz8gD
	 yUan4gs1XWqmA==
Message-ID: <fc101bc7-6ece-4a30-9e19-9b32376489a8@kernel.org>
Date: Fri, 16 Oct 2026 19:25:46 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Barry Song <baohua@kernel.org>,
 Nanzhe Zhao <zhaonanzhe@xiaomi.com>, Juan Yescas <jyescas@google.com>,
 Daeho Jeong <daehojeong@google.com>, Dev Jain <Dev.Jain@arm.com>,
 David Hildenbrand <David.Hildenbrand@arm.com>, linux-kernel@vger.kernel.org,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Nanzhe Zhao <nzzhao@126.com>, Pengfei Li <lipengfei28@xiaomi.com>,
 Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [PATCH v5 08/16] f2fs: make GC migration large-folio aware
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261014064445.2835813-1-zhaonanzhe@xiaomi.com>
 <20261014064445.2835813-9-zhaonanzhe@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261014064445.2835813-9-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/14/26 14:44, Nanzhe Zhao wrote:
> GC can operate on a 4K block that is cached inside a large folio.
> The data lookup helpers therefore need to test and update uptodate
> state for the addressed subpage instead of rejecting large folios or
> treating the whole folio as the target block.
> 
> Let f2fs_get_read_data_folio() and f2fs_get_lock_data_folio() to use
> subpage uptodate state. Submit single-block reads at the requested
> folio offset and zero only the addressed 4K range for NEW_ADDR.
> 
> Also update `move_data_page` to mark, clear, and restore dirty
> state for the target subpage, and submit write I/O with the subpage
> offset recorded in f2fs_io_info.
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> ---
>   fs/f2fs/data.c    | 46 ++++++++++++++++++++++++++++++----------------
>   fs/f2fs/f2fs.h    |  1 +
>   fs/f2fs/gc.c      | 36 ++++++++++++++++++++++++++++++++----
>   fs/f2fs/segment.c |  2 +-
>   4 files changed, 64 insertions(+), 21 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index b5c048134e00..710213fea7a6 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1633,20 +1633,16 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
>   	struct dnode_of_data dn;
>   	struct folio *folio;
>   	int err;
> -retry:
> +
>   	folio = f2fs_grab_cache_folio(mapping, index, for_write);
>   	if (IS_ERR(folio))
>   		return folio;
>   
>   	if (folio_test_large(folio)) {
> -		pgoff_t folio_index = mapping_align_index(mapping, index);
> -		unsigned long nr_pages = folio_nr_pages(folio);
> -
> -		f2fs_folio_put(folio, true);
> -		invalidate_inode_pages2_range(mapping, folio_index,
> -				folio_index + nr_pages - 1);
> -		f2fs_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
> -		goto retry;
> +		if (!f2fs_ffs_find_or_alloc(folio)) {
> +			err = -ENOMEM;
> +			goto put_err;
> +		}
>   	}
>   
>   	if (f2fs_lookup_read_extent_cache_block(inode, index,
> @@ -1682,7 +1678,7 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
>   		goto put_err;
>   	}
>   got_it:
> -	if (folio_test_uptodate(folio)) {
> +	if (f2fs_ffs_test_blk_uptodate(folio, index)) {
>   		folio_unlock(folio);
>   		return folio;
>   	}
> @@ -1695,9 +1691,11 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
>   	 * f2fs_init_inode_metadata.
>   	 */
>   	if (dn.data_blkaddr == NEW_ADDR) {
> -		folio_zero_segment(folio, 0, folio_size(folio));
> -		if (!folio_test_uptodate(folio))
> -			folio_mark_uptodate(folio);
> +		size_t offset = offset_in_folio(folio,
> +						(loff_t)index << PAGE_SHIFT);
> +
> +		folio_zero_segment(folio, offset, offset + PAGE_SIZE);
> +		f2fs_ffs_mark_subrange_uptodate(folio, offset, PAGE_SIZE);
>   		folio_unlock(folio);
>   		return folio;
>   	}
> @@ -1757,7 +1755,8 @@ struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
>   
>   	/* wait for read completion */
>   	folio_lock(folio);
> -	if (unlikely(folio->mapping != mapping || !folio_test_uptodate(folio))) {
> +	if (unlikely(folio->mapping != mapping ||
> +		    !f2fs_ffs_test_blk_uptodate(folio, index))) {
>   		f2fs_folio_put(folio, true);
>   		return ERR_PTR(-EIO);
>   	}
> @@ -2906,6 +2905,22 @@ static void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
>   		folio_mark_uptodate(folio);
>   }
>   
> +bool f2fs_ffs_test_blk_dirty(const struct folio *folio, pgoff_t index)
> +{
> +	struct f2fs_folio_state *ffs;
> +	unsigned int idx, nr_subpages;
> +
> +	f2fs_bug_on(F2FS_F_SB(folio), !folio_contains(folio, index));
> +
> +	if (!f2fs_folio_has_ffs(folio))
> +		return folio_test_dirty(folio);
> +
> +	ffs = (struct f2fs_folio_state *)folio->private;
> +	nr_subpages = folio_nr_pages(folio);
> +	idx = index - folio->index;
> +	return test_bit(nr_subpages + idx, ffs->state);
> +}
> +
>   static unsigned int __ffs_mark_subrange_dirty(struct folio *folio,
>   			struct f2fs_folio_state *ffs, size_t offset, size_t len)
>   {
> @@ -2999,7 +3014,6 @@ bool f2fs_ffs_clear_subrange_dirty_and_test(struct folio *folio, size_t offset,
>   
>   	return dirty;
>   }
> -
>   static unsigned int ffs_next_dirty_subpage(struct f2fs_folio_state *ffs,
>   			const struct folio *folio, unsigned int start,
>   			unsigned int end)
> @@ -3497,7 +3511,7 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
>   		return true;
>   
>   	if (fio) {
> -		if (page_private_gcing(fio->page))
> +		if (folio_test_f2fs_gcing(fio->folio))
>   			return true;
>   		if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
>   			f2fs_is_checkpointed_data(sbi, fio->old_blkaddr)))
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index d976e6ad058b..36ec8266af69 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4493,6 +4493,7 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
>   				int compr_blocks, bool allow_balance);
>   bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index);
>   struct f2fs_folio_state *f2fs_ffs_find_or_alloc(struct folio *folio);
> +bool f2fs_ffs_test_blk_dirty(const struct folio *folio, pgoff_t index);
>   void f2fs_ffs_mark_subrange_dirty(struct folio *folio, size_t offset, size_t len);
>   bool f2fs_ffs_clear_subrange_dirty_and_test(struct folio *folio, size_t offset,
>   					    size_t len);
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index d7fae1890835..5bb117e5e811 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1512,12 +1512,19 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
>   						unsigned int segno, int off)
>   {
>   	struct folio *folio;
> +	size_t foff = 0;
> +	bool large = false;
>   	int err = 0;
>   
>   	folio = f2fs_get_lock_data_folio(inode, bidx, true);
>   	if (IS_ERR(folio))
>   		return PTR_ERR(folio);
>   
> +	if (f2fs_folio_has_ffs(folio)) {
> +		large = true;
> +		foff = offset_in_folio(folio, (loff_t)bidx << PAGE_SHIFT);
> +	}
> +
>   	if (!check_valid_map(F2FS_I_SB(inode), segno, off)) {
>   		err = -ENOENT;
>   		goto out;
> @@ -1532,6 +1539,8 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
>   			err = -EAGAIN;
>   			goto out;
>   		}
> +		if (large)
> +			f2fs_ffs_mark_subrange_dirty(folio, foff, PAGE_SIZE);
>   		folio_mark_dirty(folio);
>   		folio_set_f2fs_gcing(folio);
>   	} else {
> @@ -1544,32 +1553,51 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
>   			.op_flags = REQ_SYNC,
>   			.old_blkaddr = NULL_ADDR,
>   			.folio = folio,
> +			.folio_offset = bidx - folio->index,
> +			.folio_blkcnt = 1,
>   			.encrypted_page = NULL,
>   			.need_lock = LOCK_REQ,
>   			.io_type = FS_GC_DATA_IO,
>   		};
> -		bool is_dirty = folio_test_dirty(folio);
> +		struct f2fs_folio_state *ffs = NULL;
> +		bool is_dirty = f2fs_ffs_test_blk_dirty(folio, bidx);
>   
>   retry:
>   		f2fs_folio_wait_writeback(folio, true, true);
>   
> +		if (large) {
> +			ffs = (struct f2fs_folio_state *)folio->private;
> +			f2fs_ffs_mark_subrange_dirty(folio, foff, PAGE_SIZE);
> +		}
>   		folio_mark_dirty(folio);
>   		if (folio_clear_dirty_for_io(folio)) {
> -			inode_dec_dirty_block(inode);
> -			f2fs_remove_dirty_inode(inode);
> +			if (!large) {
> +				inode_dec_dirty_block(inode);
> +				f2fs_remove_dirty_inode(inode);
> +			} else if (f2fs_ffs_clear_subrange_dirty_and_test(folio,
> +							foff, PAGE_SIZE)) {
> +				folio_mark_dirty(folio);
> +			}
>   		}
>   
> +		if (large)
> +			atomic_inc(&ffs->write_pages_pending);
>   		folio_set_f2fs_gcing(folio);
>   
>   		err = f2fs_do_write_data_page(&fio);

Nanzhe,

There is valid bug report from sashiko as below, I checked a bit w/ llm:

*Normal fsync() Writeback Flow*
   1. Buffered write dirties a folio:
       • folio_mark_dirty(folio) → filemap_dirty_folio()
       • Sets folio flag PG_dirty.
       • Sets XArray (radix-tree) mark PAGECACHE_TAG_DIRTY on the folio entry in mapping->i_pages.
       • (State: PG_dirty = 1, TAG_DIRTY = 1, TAG_TOWRITE = 0, TAG_WRITEBACK = 0)
   2. fsync() starts and snapshots dirty folios (WB_SYNC_ALL):
       • f2fs_do_sync_file() → file_write_and_wait_range() → f2fs_write_cache_folios() → writeback_iter()
       • Calls tag_pages_for_writeback(), which scans mapping->i_pages for entries with PAGECACHE_TAG_DIRTY and tags them with PAGECACHE_TAG_TOWRITE.
       • (State: PG_dirty = 1, TAG_DIRTY = 1, TAG_TOWRITE = 1, TAG_WRITEBACK = 0)
   3. writeback_iter() fetches the folio for writeout:
       • writeback_get_folio() looks up folios tagged with PAGECACHE_TAG_TOWRITE, locks the folio, and calls folio_clear_dirty_for_io(folio).
       • Clears PG_dirty on the folio, while keeping PAGECACHE_TAG_DIRTY and PAGECACHE_TAG_TOWRITE set in mapping->i_pages until writeback actually starts.
       • (State: PG_dirty = 0, TAG_DIRTY = 1, TAG_TOWRITE = 1, TAG_WRITEBACK = 0)
   4. Filesystem starts writeback on the whole folio:
       • f2fs_write_cache_folios() calls folio_start_writeback(folio) → __folio_start_writeback(folio, false) and submits all dirty subpages in the folio.
       • Sets PG_writeback and PAGECACHE_TAG_WRITEBACK.
       • Because !folio_test_dirty(folio) is true, clears PAGECACHE_TAG_DIRTY.
       • Because keep_write == false, clears PAGECACHE_TAG_TOWRITE.
       • (State: PG_dirty = 0, TAG_DIRTY = 0, TAG_TOWRITE = 0, TAG_WRITEBACK = 1)
   5. I/O completion & fsync() wait:
       • filemap_fdatawait_range() waits on PAGECACHE_TAG_WRITEBACK.
       • f2fs_write_end_bio() calls folio_end_writeback(folio), clearing PG_writeback and PAGECACHE_TAG_WRITEBACK.

*Buggy Race Flow with move_data_page() on a Large Folio*
   Suppose a large folio has subpage 0 (clean, in a GC victim segment) and subpage 1 (dirty from a buffered write).
     Thread A (fsync)                              Thread B (FG_GC: move_data_page on subpage 0)
     --------------------------------------------  -----------------------------------------------------------
     1. Buffered write dirtied subpage 1:
        - ffs->state[dirty, 1] = 1
        - folio_mark_dirty(folio)
          -> sets PG_dirty = 1
          -> sets XArray PAGECACHE_TAG_DIRTY = 1

     2. f2fs_do_sync_file()
        -> file_write_and_wait_range()
        -> f2fs_write_cache_folios()
        -> writeback_iter():
           tag_pages_for_writeback() tags folio
           in XArray with PAGECACHE_TAG_TOWRITE = 1
        [PG_dirty=1, TAG_DIRTY=1, TAG_TOWRITE=1]

                                                   3. move_data_page(inode, bidx=0, FG_GC) locks folio:
                                                      - f2fs_ffs_mark_subrange_dirty(folio, subpage 0)
                                                      - folio_mark_dirty(folio)
                                                      - folio_clear_dirty_for_io(folio)
                                                        -> clears PG_dirty = 0
                                                      - f2fs_ffs_clear_subrange_dirty_and_test(subpage 0)
                                                        -> clears ffs->state[dirty, 0] = 0
                                                        -> sees ffs->state[dirty, 1] == 1 (still dirty!)
                                                        -> calls folio_mark_dirty(folio):
                                                           sets PG_dirty = 1, TAG_DIRTY = 1

                                                   4. Calls f2fs_do_write_data_page(&fio) for subpage 0 ONLY:
                                                      - Calls folio_start_writeback(folio)
                                                        -> __folio_start_writeback(folio, false):
                                                           * sets PG_writeback = 1, TAG_WRITEBACK = 1
                                                           * folio_test_dirty(folio) is true -> keeps TAG_DIRTY = 1
                                                           * keep_write is false -> CLEARS PAGECACHE_TAG_TOWRITE = 0!
                                                      - Submits bio for subpage 0 only; unlocks folio.
                                                   [PG_dirty=1, TAG_DIRTY=1, TAG_TOWRITE=0, TAG_WRITEBACK=1]

     5. writeback_get_folio() searches XArray for
        PAGECACHE_TAG_TOWRITE:
        -> Folio no longer has PAGECACHE_TAG_TOWRITE!
        -> writeback_iter() completely skips folio;
           subpage 1 is NEVER submitted for writeback.

     6. filemap_fdatawait_range() waits for
        PAGECACHE_TAG_WRITEBACK:
        -> Subpage 0 bio finishes -> clears TAG_WRITEBACK.
        -> fsync() returns 0 (success) while subpage 1
           is still dirty in RAM!

*Potential Solution*
We need to call __folio_start_writeback(folio, folio_test_dirty(folio)) to keep
PAGECACHE_TAG_TOWRITE tag in folio xarry entry if there are still dirty page{,s}
in large folio.

     --- a/fs/f2fs/data.c
     +++ b/fs/f2fs/data.c
     @@ -3761,7 +3761,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
          if (ipu_force ||
              (__is_valid_data_blkaddr(fio->old_blkaddr) &&
                          need_inplace_update(fio))) {
     -        folio_start_writeback(folio);
     +        __folio_start_writeback(folio, folio_test_dirty(folio));
              f2fs_put_dnode(&dn);
              if (fio->need_lock == LOCK_REQ)
                  f2fs_unlock_op(fio->sbi, &lc);
     @@ -3788,7 +3788,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)

          fio->version = ni.version;

     -    folio_start_writeback(folio);
     +    __folio_start_writeback(folio, folio_test_dirty(folio));

          if (fio->compr_blocks && fio->old_blkaddr == COMPRESS_ADDR)
              f2fs_i_compr_blocks_update(inode, fio->compr_blocks - 1, false);

Thanks,

>   		if (err) {
>   			folio_clear_f2fs_gcing(folio);
> +			if (large)
> +				atomic_dec(&ffs->write_pages_pending);
>   			if (err == -ENOMEM) {
>   				memalloc_retry_wait(GFP_NOFS);
>   				goto retry;
>   			}
> -			if (is_dirty)
> +			if (is_dirty) {
> +				if (large)
> +					f2fs_ffs_mark_subrange_dirty(folio, foff, PAGE_SIZE);
>   				folio_mark_dirty(folio);
> +			}
>   		}
>   	}
>   out:
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 96bfb7d63692..06fb92fc8479 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3863,7 +3863,7 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
>   		if (is_inode_flag_set(inode, FI_ALIGNED_WRITE))
>   			return CURSEG_COLD_DATA_PINNED;
>   
> -		if (page_private_gcing(fio->page)) {
> +		if (folio_test_f2fs_gcing(fio->folio)) {
>   			if (fio->sbi->am.atgc_enabled &&
>   				(fio->io_type == FS_DATA_IO) &&
>   				(fio->sbi->gc_mode != GC_URGENT_HIGH) &&

