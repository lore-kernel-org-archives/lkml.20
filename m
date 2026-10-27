Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093847;
	b=ti/97pTahAhBlBiTdNUSRFhn+uulikCExBVPGqXaXNxz+5aE6wLULBSWTa68+DAAZBQ/
	 +P/cNHn5pIeJZnKeEXQoy8M7bSWyHtrYlzX/CsKBmcC01+HfzfHaDJvgqFbe4OqrQXmHL
	 j7pe/vKjmjoHOeluviSzQhxYHqolucyqNLLELS+TdQPm0EPa2F2KkBEWZ2nXlnDdVHxft
	 E8K2NnnUMzGLmw3MvuSS+CWgJEWC1P7yyow/Gx7b+hGPzHU04xRZ0MU8PSs+rCcvceMxa
	 EhVV7TzWUCiRTNHZEc0ec+BXFX02HeZgxM143eFAuPanx3Ze0R32w0J2fJup1qGC4Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093847;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=rRT0J22n/N7hiscjNeBkmmDKgobum7zejo29ezEzj1k=;
	b=eK9hUpxEhZsOqPquAmP+dRrCfRoRQ2eNdl+/BLIMsisWitQhKiOwt6soaZLN4T8dvpl2
	 MW9avFzgyOwnox5g+UVNEec48pmEtYjOvBiuWyz0OC6I5/twbsvaIsARaVLPD1j9VX/7G
	 q3SkSODjGJS2x5aOp4qWYn88nqYiFcPQujuKQ81oyDX188RzCaqLN5gzolRIMoAKLmbv8
	 BF95RSiDaeieAFk1orxy65geXmIKcmE6+JKEJZyPUrW+sF5+McMwMDX67e3KZz1hizeSW
	 LQ4OhMgr7Y/pRRMXlVv5qN+2JdewiqlRfUrov140B/LJsDgEEXkGaQ5orjEyP0/6RDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mti8LYXz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A562E606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mti8LYXz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC6D1F031E0;
	Tue, 27 Oct 2026 09:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793093846;
	bh=rRT0J22n/N7hiscjNeBkmmDKgobum7zejo29ezEzj1k=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=mti8LYXzCh6nQLM6k5FKv1x5AZkHUtXB4BzzTMv4G8Lln3tWav/5TevtDarN/wXY7
	 3vSgVgCBQHQYjcbsue692y1ia2Xc+KLG7T/uOVVs+P4eaGXYaj5F8Dcq52BANOjn4K
	 zj8hZcE4lggnXpDabN2W6KIzfwujamckpyuhvnfvKW8jB4dd8rLW4HLVHMLiiB9XPv
	 3xqD9vguJ4iNT/3NTl0UKqWHkSytzxHWnaA0Ix0tvrlidt5CUr61pH+7mwkwLXxOMI
	 9HSoBOuU06v+mvbBNy9m4zKqUfXN1A3ZX78Oyvqu/D4Hu/nV2bqf/iG0aBX5r6SsWs
	 DZhN77/TofpiA==
Message-ID: <0e93d246-ba73-4e8a-af95-328c22570339@kernel.org>
Date: Tue, 27 Oct 2026 17:37:22 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Barry Song <baohua@kernel.org>,
 Juan Yescas <jyescas@google.com>, Daeho Jeong <daehojeong@google.com>,
 Pengfei Li <lipengfei28@xiaomi.com>, Dev Jain <Dev.Jain@arm.com>,
 David Hildenbrand <David.Hildenbrand@arm.com>, linux-kernel@vger.kernel.org,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Nanzhe Zhao <nzzhao@126.com>, Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [PATCH v7 08/15] f2fs: make GC migration large-folio aware
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261026033745.784107-1-nzzhao.sigma@gmail.com>
 <20261026033745.784107-9-nzzhao.sigma@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261026033745.784107-9-nzzhao.sigma@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/26/26 11:37, Nanzhe Zhao wrote:
> From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> 
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
> The write_pages_pending reference is taken by f2fs_do_write_data_page()
> and dropped from its common error path, so a block that is truncated
> concurrently no longer leaks the counter.
> 
> Reported-by: kernel test robot <yi1.lai@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202610081027.b13dcf10-lkp@intel.com
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> ---
>  fs/f2fs/data.c    | 70 +++++++++++++++++++++++++++++++++--------------
>  fs/f2fs/f2fs.h    |  1 +
>  fs/f2fs/gc.c      | 28 +++++++++++++++----
>  fs/f2fs/segment.c |  2 +-
>  4 files changed, 75 insertions(+), 26 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index d027c949823b..b3ada22cb0cb 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1679,20 +1679,16 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
>  	struct dnode_of_data dn;
>  	struct folio *folio;
>  	int err;
> -retry:
> +
>  	folio = f2fs_grab_cache_folio(mapping, index, for_write);
>  	if (IS_ERR(folio))
>  		return folio;
>  
>  	if (folio_test_large(folio)) {
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
>  	}
>  
>  	if (f2fs_lookup_read_extent_cache_block(inode, index,
> @@ -1728,7 +1724,7 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
>  		goto put_err;
>  	}
>  got_it:
> -	if (folio_test_uptodate(folio)) {
> +	if (f2fs_ffs_test_blk_uptodate(folio, index)) {
>  		folio_unlock(folio);
>  		return folio;
>  	}
> @@ -1741,9 +1737,11 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
>  	 * f2fs_init_inode_metadata.
>  	 */
>  	if (dn.data_blkaddr == NEW_ADDR) {
> -		folio_zero_segment(folio, 0, folio_size(folio));
> -		if (!folio_test_uptodate(folio))
> -			folio_mark_uptodate(folio);
> +		size_t offset = offset_in_folio(folio,
> +						(loff_t)index << PAGE_SHIFT);
> +
> +		folio_zero_segment(folio, offset, offset + PAGE_SIZE);
> +		f2fs_ffs_mark_subrange_uptodate(folio, offset, PAGE_SIZE);
>  		folio_unlock(folio);
>  		return folio;
>  	}
> @@ -1803,7 +1801,6 @@ struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
>  
>  	/* wait for read completion */
>  	folio_lock(folio);
> -
>  	if (unlikely(folio->mapping != mapping)) {
>  		f2fs_folio_put(folio, true);
>  		return ERR_PTR(-EIO);
> @@ -1812,7 +1809,7 @@ struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
>  	/*
>  	 * ffs can be released while the folio was unlocked above.  Rebuild it
>  	 * for a fully uptodate folio; a partially uptodate one cannot be
> -	 * rebuilt and will fail the uptodate check below.
> +	 * rebuilt and will fail the subpage check below.
>  	 */
>  	if (folio_test_large(folio) && !f2fs_folio_has_ffs(folio)) {
>  		if (!f2fs_ffs_find_or_alloc(folio)) {
> @@ -1821,7 +1818,7 @@ struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
>  		}
>  	}
>  
> -	if (unlikely(!folio_test_uptodate(folio))) {
> +	if (unlikely(!f2fs_ffs_test_blk_uptodate(folio, index))) {
>  		f2fs_folio_put(folio, true);
>  		return ERR_PTR(-EIO);
>  	}
> @@ -2970,6 +2967,22 @@ static void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
>  		folio_mark_uptodate(folio);
>  }
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
>  static unsigned int __ffs_mark_subrange_dirty(struct folio *folio,
>  			struct f2fs_folio_state *ffs, size_t offset, size_t len)
>  {
> @@ -3063,7 +3076,6 @@ bool f2fs_ffs_clear_subrange_dirty_and_test(struct folio *folio, size_t offset,
>  
>  	return dirty;
>  }
> -
>  static unsigned int ffs_next_dirty_subpage(struct f2fs_folio_state *ffs,
>  			const struct folio *folio, unsigned int start,
>  			unsigned int end)
> @@ -3561,7 +3573,7 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
>  		return true;
>  
>  	if (fio) {
> -		if (page_private_gcing(fio->page))
> +		if (folio_test_f2fs_gcing(fio->folio))
>  			return true;
>  		if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
>  			f2fs_is_checkpointed_data(sbi, fio->old_blkaddr)))
> @@ -3587,8 +3599,11 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>  	struct dnode_of_data dn;
>  	struct node_info ni;
>  	struct f2fs_lock_context lc;
> +	struct f2fs_folio_state *ffs;
>  	bool ipu_force = false;
>  	bool atomic_commit;
> +	bool pending_added = false;
> +	bool submitted = false;
>  	int err = 0;
>  
>  	/* Use COW inode to make dnode_of_data for atomic write */
> @@ -3617,8 +3632,11 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>  		return -EINVAL;
>  
>  	/* Deadlock due to between page->lock and f2fs_lock_op */
> -	if (fio->need_lock == LOCK_REQ && !f2fs_trylock_op(fio->sbi, &lc))
> +	if (fio->need_lock == LOCK_REQ && !f2fs_trylock_op(fio->sbi, &lc)) {
> +		if (!f2fs_ffs_has_dirty_subpage(folio))
> +			folio_clear_f2fs_gcing(folio);
>  		return -EAGAIN;
> +	}
>  
>  	err = f2fs_get_dnode_of_data(&dn, F2FS_FIO_LBLK(fio),
>  				     LOOKUP_NODE);
> @@ -3630,7 +3648,6 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>  	/* This page is already truncated */
>  	if (fio->old_blkaddr == NULL_ADDR) {
>  		folio_clear_uptodate(folio);
> -		folio_clear_f2fs_gcing(folio);
>  		goto out_writepage;
>  	}
>  got_it:
> @@ -3680,6 +3697,11 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>  	fio->version = ni.version;
>  
>  	__folio_start_writeback(folio, folio_test_dirty(folio));
> +	if (f2fs_folio_has_ffs(folio)) {
> +		ffs = (struct f2fs_folio_state *)folio->private;
> +		atomic_inc(&ffs->write_pages_pending);
> +		pending_added = true;
> +	}
>  
>  	if (fio->compr_blocks && fio->old_blkaddr == COMPRESS_ADDR)
>  		f2fs_i_compr_blocks_update(inode, fio->compr_blocks - 1, false);
> @@ -3694,6 +3716,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>  		err = -EIO;
>  		goto out_writepage;
>  	}
> +	submitted = true;
>  	set_inode_flag(inode, FI_APPEND_WRITE);
>  	if (atomic_commit)
>  		folio_clear_f2fs_atomic(folio);
> @@ -3702,6 +3725,13 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>  out:
>  	if (fio->need_lock == LOCK_REQ)
>  		f2fs_unlock_op(fio->sbi, &lc);
> +	if (!submitted) {
> +		if (pending_added) {
> +			f2fs_ffs_put_write_pending(folio, 1);
> +		} else if (!f2fs_ffs_has_dirty_subpage(folio)) {
> +			folio_clear_f2fs_gcing(folio);

If f2fs_trylock_op() failed:

	if (fio->need_lock == LOCK_RETRY) {
		if (!f2fs_trylock_op(fio->sbi, &lc)) {
			err = -EAGAIN;
			goto out_writepage;
		}
		fio->need_lock = LOCK_REQ;
	}

For order-0 folio, we may loss gcing flag becuase f2fs_ffs_has_dirty_subpage()
return false?

Two migration issues:

In f2fs_migrate_blocks() and f2fs_defragment_range(), we missed to mark subpage dirty?

			folio = f2fs_get_lock_data_folio(inode, blkidx, true);
			if (IS_ERR(folio)) {
				f2fs_up_write(&sbi->pin_sem);
				ret = PTR_ERR(folio);
				goto done;
			}

			folio_mark_dirty(folio);
			f2fs_folio_put(folio, true);

> +		}
> +	}
>  	return err;
>  }
>  
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 915ca72cf276..1b63dd961f15 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4493,6 +4493,7 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
>  				int compr_blocks, bool allow_balance);
>  bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index);
>  struct f2fs_folio_state *f2fs_ffs_find_or_alloc(struct folio *folio);
> +bool f2fs_ffs_test_blk_dirty(const struct folio *folio, pgoff_t index);
>  void f2fs_ffs_mark_subrange_dirty(struct folio *folio, size_t offset, size_t len);
>  bool f2fs_ffs_clear_subrange_dirty_and_test(struct folio *folio, size_t offset,
>  					    size_t len);
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index c66ca03d0d5a..c3e01f6811b4 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1520,12 +1520,19 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
>  						unsigned int segno, int off)
>  {
>  	struct folio *folio;
> +	size_t foff = 0;
> +	bool large = false;
>  	int err = 0;
>  
>  	folio = f2fs_get_lock_data_folio(inode, bidx, true);
>  	if (IS_ERR(folio))
>  		return PTR_ERR(folio);
>  
> +	if (f2fs_folio_has_ffs(folio)) {
> +		large = true;
> +		foff = offset_in_folio(folio, (loff_t)bidx << PAGE_SHIFT);
> +	}
> +
>  	if (!check_valid_map(F2FS_I_SB(inode), segno, off)) {
>  		err = -ENOENT;
>  		goto out;
> @@ -1540,6 +1547,8 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
>  			err = -EAGAIN;
>  			goto out;
>  		}
> +		if (large)
> +			f2fs_ffs_mark_subrange_dirty(folio, foff, PAGE_SIZE);
>  		folio_mark_dirty(folio);
>  		folio_set_f2fs_gcing(folio);
>  	} else {
> @@ -1558,28 +1567,37 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
>  			.need_lock = LOCK_REQ,
>  			.io_type = FS_GC_DATA_IO,
>  		};
> -		bool is_dirty = folio_test_dirty(folio);
> +		bool is_dirty = f2fs_ffs_test_blk_dirty(folio, bidx);
>  
>  retry:
>  		f2fs_folio_wait_writeback(folio, true, true);
>  
> +		if (large)
> +			f2fs_ffs_mark_subrange_dirty(folio, foff, PAGE_SIZE);
>  		folio_mark_dirty(folio);
>  		if (folio_clear_dirty_for_io(folio)) {
> -			inode_dec_dirty_block(inode);
> -			f2fs_remove_dirty_inode(inode);
> +			if (!large) {
> +				inode_dec_dirty_block(inode);
> +				f2fs_remove_dirty_inode(inode);
> +			} else if (f2fs_ffs_clear_subrange_dirty_and_test(folio,
> +							foff, PAGE_SIZE)) {
> +				folio_mark_dirty(folio);
> +			}
>  		}
>  
>  		folio_set_f2fs_gcing(folio);
>  
>  		err = f2fs_do_write_data_page(&fio);

Another race issue my local bots report, please take a look:

  Where:  move_data_page()  (gc.c:1564–1601) and the generic  writeback_iter()  used by  f2fs_write_cache_folios() .

  The cycle:

  1. FG_GC writes one subpage. Its bio waits in  write_io[DATA][COLD]  until  do_garbage_collect()  submits it later.
  2. If another subpage is still dirty, the folio is left both dirty and under writeback and is then unlocked.
  3. A writer doing fsync, sync or checkpoint calls  writeback_get_folio()  →  folio_prepare_writeback() . It locks the folio and sleeps in the generic  folio_wait_writeback() , which does not flush f2fs's merged bio.
  4. GC moves on to the next block of the same folio and blocks on  folio_lock . The bio is never submitted.

  Reachable today? Yes, on immutable large folios: BG_GC dirties subpage A, FG_GC migrates subpage B, and an fsync runs at the same time.

  Fix: in  move_data_page() , when  large && folio_test_dirty(folio)  after the write, call  f2fs_submit_merged_write_cond(sbi, NULL, folio, 0, DATA)  before unlocking. Optionally do the same in  f2fs_write_cache_folios()   out:  when it redirties a folio that is under writeback.

Thanks,

>  		if (err) {
> -			folio_clear_f2fs_gcing(folio);
>  			if (err == -ENOMEM) {
>  				memalloc_retry_wait(GFP_NOFS);
>  				goto retry;
>  			}
> -			if (is_dirty)
> +			if (is_dirty) {
> +				if (large)
> +					f2fs_ffs_mark_subrange_dirty(folio, foff, PAGE_SIZE);
>  				folio_mark_dirty(folio);
> +			}
>  		}
>  	}
>  out:
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index cbb65e0343c8..e017a5f2a67f 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3863,7 +3863,7 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
>  		if (is_inode_flag_set(inode, FI_ALIGNED_WRITE))
>  			return CURSEG_COLD_DATA_PINNED;
>  
> -		if (page_private_gcing(fio->page)) {
> +		if (folio_test_f2fs_gcing(fio->folio)) {
>  			if (fio->sbi->am.atgc_enabled &&
>  				(fio->io_type == FS_DATA_IO) &&
>  				(fio->sbi->gc_mode != GC_URGENT_HIGH) &&

