Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5867A2E7165
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791779792; cv=none; b=ILc2C0HGC9Fzq4ZAIKLcPSTpgIt7pW3ptCcrXVtwcLSyGnea3i/d4k4KNZgOsG2rqRBbAaHRx3GIx7nijwlkOealc/x6IOkW2kJuhHFLz5+C0AvMcOo2DvKU+AwTIlIFIpHEeBj9T5VUroE1rDLTQeW7akJ3m4YwWflKo1bRC2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791779792; c=relaxed/simple;
	bh=G3gmFqHnFWuTNA9sS+5PJlqAgCppp6HdmF5NffA8pHw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YYhjxU2yeqPdJoCmPaFCeQLEpavZ4kvdZ8AslhabHAd/v7RsYqxEXwFsmWd/+eGcpjtHEoNr1F+AbYtaYUX0zcdwKsGWAvC2yw/dhM8k73qlMLHewwkH980ATWZNgZh1cFg4s5aLlgSpA7vKmguTz9U9UcO5kpFy/xfguNJCQBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FIJ6MQIj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FIJ6MQIj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F991F0089B;
	Mon, 12 Oct 2026 04:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791779790;
	bh=UaGrHjaMaTiNcXoRxnyiiUI5P/Y1MsuNbf9lwBAtOl4=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=FIJ6MQIjJOXsufvnEJAH4g5g1PvlgbXHxkABajv9teNXfJ5Fbb+zFPy1kAQze0ONR
	 AAcEftTmuIKCTwRx11PmTleAkGkZLhZceNVD6eN794TZ9mDbvFrOHGBPx5BZw0m8/f
	 8+NIB2OVN3TGbLYLPzDgX5NPrLRjZKnofdWwKe/TyE4ExQg176IlYczzbo5wWuDffs
	 hgrcgyu63eQ5rH5rS4qul2MQkfhaW1pYXO2aCHdleQEA3cvQ2p1RrkOmS4jGvi+kNs
	 A6oj76jd/rfHaextl7u8wnvLmyqXx8NmrnFO8HpadgwQhqSVLNTM0Nju7uxVpbAE8T
	 ZfVRSZCXXD1RA==
Message-ID: <12d6ec4b-7ddf-42c8-83cf-b257524edb15@kernel.org>
Date: Mon, 12 Oct 2026 12:36:19 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>,
 Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>,
 Dev Jain <Dev.Jain@arm.com>, linux-kernel@vger.kernel.org,
 David Hildenbrand <David.Hildenbrand@arm.com>,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Nanzhe Zhao <nzzhao@126.com>, Pengfei Li <lipengfei28@xiaomi.com>,
 Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [PATCH v3 05/17] f2fs: support large folio writeback
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261009161224.4163796-1-zhaonanzhe@xiaomi.com>
 <20261009161224.4163796-6-zhaonanzhe@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261009161224.4163796-6-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/26 00:12, Nanzhe Zhao wrote:
> Large folio can contain multiple dirty ranges.
> Add a folio-based writeback path for large-folio mapping files
> and keep the legacy f2fs_write_cache_pages() path unchanged for
> non large-folio mapping files.
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> ---
>   fs/f2fs/data.c | 427 ++++++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 422 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 315506e394ed..da388ed9cccc 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -334,7 +334,9 @@ static void f2fs_write_end_bio(struct bio *bio)
>   
>   	bio_for_each_folio_all(fi, bio) {
>   		struct folio *folio = fi.folio;
> +		unsigned int nr_pages = fi.length >> PAGE_SHIFT;
>   		enum count_type type;
> +		bool finished = true;
>   
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
>   		if (f2fs_is_compressed_page(folio)) {
> @@ -353,7 +355,16 @@ static void f2fs_write_end_bio(struct bio *bio)
>   			}
>   		}
>   
> -		dec_cache_count(sbi, type);
> +		if (f2fs_folio_has_ffs(folio)) {
> +			struct f2fs_folio_state *ffs =
> +				(struct f2fs_folio_state *)folio->private;
> +
> +			finished = atomic_sub_and_test(nr_pages,
> +					&ffs->write_pages_pending);
> +		}
> +
> +		while (nr_pages--)
> +			dec_cache_count(sbi, type);
>   
>   		/*
>   		 * we should access sbi before folio_end_writeback() to
> @@ -363,8 +374,10 @@ static void f2fs_write_end_bio(struct bio *bio)
>   				wq_has_sleeper(&sbi->cp_wait))
>   			wake_up(&sbi->cp_wait);
>   
> -		folio_clear_f2fs_gcing(folio);
> -		folio_end_writeback(folio);
> +		if (finished) {
> +			folio_clear_f2fs_gcing(folio);
> +			folio_end_writeback(folio);
> +		}
>   	}
>   
>   	bio_put(bio);
> @@ -2885,7 +2898,7 @@ static unsigned int __ffs_mark_subrange_dirty(struct folio *folio,
>   	return bitmap_weight(ffs->state, 2 * nr_subpages) - before;
>   }
>   
> -static void f2fs_ffs_mark_subrange_dirty(struct folio *folio,
> +void f2fs_ffs_mark_subrange_dirty(struct folio *folio,
>   				    size_t offset, size_t len)
>   {
>   	struct f2fs_folio_state *ffs;
> @@ -2903,6 +2916,99 @@ static void f2fs_ffs_mark_subrange_dirty(struct folio *folio,
>   	spin_unlock_irqrestore(&ffs->state_lock, flags);
>   }
>   
> +static bool __ffs_clear_subrange_dirty(struct folio *folio,
> +			struct f2fs_folio_state *ffs, size_t offset, size_t len)
> +{
> +	unsigned int nr_subpages = folio_nr_pages(folio);
> +	unsigned int start, end;
> +
> +	start = offset >> PAGE_SHIFT;
> +	end = (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
> +	end = min(end, nr_subpages);
> +
> +	bitmap_clear(ffs->state, nr_subpages + start, end - start);
> +	return find_next_bit(ffs->state, 2 * nr_subpages, nr_subpages) <
> +			2 * nr_subpages;
> +}
> +
> +/**
> + * f2fs_ffs_clear_subrange_dirty_and_test - clear dirty bits and test remaining
> + * @folio: the large folio
> + * @offset: start byte offset within the folio
> + * @len: byte length of the subrange
> + *
> + * Clear the dirty bits of the 4K subpages covered by [offset, offset + len),
> + * and return whether the folio still has any dirty subpage left.
> + */
> +bool f2fs_ffs_clear_subrange_dirty_and_test(struct folio *folio, size_t offset,
> +					    size_t len)
> +{
> +	struct f2fs_folio_state *ffs;
> +	unsigned long flags;
> +	bool dirty;
> +
> +	if (!f2fs_folio_has_ffs(folio))
> +		return false;
> +
> +	ffs = (struct f2fs_folio_state *)folio->private;
> +	spin_lock_irqsave(&ffs->state_lock, flags);
> +	dirty = __ffs_clear_subrange_dirty(folio, ffs, offset, len);
> +	spin_unlock_irqrestore(&ffs->state_lock, flags);
> +
> +	return dirty;
> +}
> +
> +static unsigned int ffs_next_dirty_subpage(struct f2fs_folio_state *ffs,
> +			const struct folio *folio, unsigned int start,
> +			unsigned int end)
> +{
> +	unsigned int nr_subpages = folio_nr_pages(folio);
> +
> +	return find_next_bit(ffs->state, nr_subpages + end + 1,
> +			nr_subpages + start) - nr_subpages;
> +}
> +
> +static unsigned int ffs_next_clean_subpage(struct f2fs_folio_state *ffs,
> +			const struct folio *folio, unsigned int start,
> +			unsigned int end)
> +{
> +	unsigned int nr_subpages = folio_nr_pages(folio);
> +
> +	return find_next_zero_bit(ffs->state, nr_subpages + end + 1,
> +			nr_subpages + start) - nr_subpages;
> +}
> +
> +static unsigned int ffs_find_dirty_range(struct folio *folio,
> +					u64 *range_start, u64 range_end)
> +{
> +	struct f2fs_folio_state *ffs;
> +	unsigned int start, end, nr_pages;
> +
> +	if (*range_start >= range_end)
> +		return 0;
> +
> +	if (!f2fs_folio_has_ffs(folio))
> +		return range_end - *range_start;
> +
> +	ffs = (struct f2fs_folio_state *)folio->private;
> +	start = offset_in_folio(folio, *range_start) >> PAGE_SHIFT;
> +	end = DIV_ROUND_UP(min_not_zero(offset_in_folio(folio, range_end),
> +					folio_size(folio)), PAGE_SIZE) - 1;
> +
> +	start = ffs_next_dirty_subpage(ffs, folio, start, end);
> +	if (start > end)
> +		return 0;
> +
> +	if (start == end)
> +		nr_pages = 1;
> +	else
> +		nr_pages = ffs_next_clean_subpage(ffs, folio,
> +						 start + 1, end) - start;
> +
> +	*range_start = folio_pos(folio) + ((u64)start << PAGE_SHIFT);
> +	return (u64)nr_pages << PAGE_SHIFT;
> +}
> +
>   static bool find_next_valid_block(const struct folio *folio,
>   				  size_t orig_off, size_t *need_off,
>   				  size_t len)
> @@ -3486,6 +3592,143 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>   	return err;
>   }
>   
> +static int f2fs_write_folio_dirty_range(struct folio *folio, int *submitted,
> +					struct writeback_control *wbc,
> +					enum iostat_type io_type,
> +					u64 *pos, u64 len)
> +{
> +	struct inode *inode = folio->mapping->host;
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	bool atomic_commit = f2fs_is_atomic_file(inode) &&
> +				folio_test_f2fs_atomic(folio);
> +	struct inode *dn_inode = atomic_commit ?
> +				F2FS_I(inode)->cow_inode : inode;
> +	struct f2fs_folio_state *ffs = NULL;
> +	u64 folio_start = folio_pos(folio);
> +	pgoff_t start_idx = (*pos - folio_start) >> PAGE_SHIFT;
> +	pgoff_t end_idx = (*pos - folio_start + len - 1) >> PAGE_SHIFT;
> +	int err = 0;
> +
> +	for (pgoff_t i = start_idx; i <= end_idx && !err; i++) {
> +		struct dnode_of_data dn;
> +		struct node_info ni;
> +		pgoff_t data_idx = folio->index + i;
> +		bool ipu_force = false;
> +		bool dn_held = false;
> +		bool submitted_blk = false;
> +		struct f2fs_io_info fio = {
> +			.sbi = sbi,
> +			.ino = inode->i_ino,
> +			.type = DATA,
> +			.op = REQ_OP_WRITE,
> +			.op_flags = wbc_to_write_flags(wbc),
> +			.old_blkaddr = NULL_ADDR,
> +			.folio = folio,
> +			.folio_offset = i,
> +			.folio_blkcnt = 1,
> +			.encrypted_page = NULL,
> +			.submitted = 0,
> +			.need_lock = LOCK_DONE,
> +			.meta_gc = f2fs_meta_inode_gc_required(inode) ? 1 : 0,
> +			.io_type = io_type,
> +			.io_wbc = wbc,
> +		};
> +
> +		if (f2fs_folio_has_ffs(folio)) {
> +			ffs = (struct f2fs_folio_state *)folio->private;
> +			atomic_inc(&ffs->write_pages_pending);
> +		}
> +
> +		set_new_dnode(&dn, dn_inode, NULL, NULL, 0);
> +
> +		if (need_inplace_update(&fio) &&
> +		    f2fs_lookup_read_extent_cache_block(inode, data_idx,
> +							&fio.old_blkaddr)) {
> +			if (!f2fs_is_valid_blkaddr(sbi, fio.old_blkaddr,
> +						   DATA_GENERIC_ENHANCE)) {
> +				err = -EFSCORRUPTED;
> +				goto block_done;
> +			}
> +			ipu_force = true;
> +			goto got_it;
> +		}
> +
> +		err = f2fs_get_dnode_of_data(&dn, data_idx, LOOKUP_NODE);
> +

Unneeded blank line.

> +		if (err)
> +			goto block_done;
> +		dn_held = true;
> +
> +		fio.old_blkaddr = dn.data_blkaddr;
> +
> +got_it:
> +		if (__is_valid_data_blkaddr(fio.old_blkaddr) &&
> +		    !f2fs_is_valid_blkaddr(sbi, fio.old_blkaddr,
> +					   DATA_GENERIC_ENHANCE)) {
> +			err = -EFSCORRUPTED;
> +			goto block_done;
> +		}
> +
> +		if (fio.meta_gc)
> +			f2fs_wait_on_block_writeback(inode, fio.old_blkaddr);
> +
> +		if (ipu_force ||
> +		    (__is_valid_data_blkaddr(fio.old_blkaddr) &&
> +					    need_inplace_update(&fio))) {
> +			f2fs_put_dnode(&dn);
> +			dn_held = false;
> +			err = f2fs_inplace_write_data(&fio);
> +			trace_f2fs_do_write_data_page(folio, IPU);
> +			if (err)
> +				goto block_done;
> +
> +			if (submitted)
> +				(*submitted)++;
> +			submitted_blk = true;
> +			set_inode_flag(inode, FI_UPDATE_WRITE);
> +			goto block_done;
> +		}
> +
> +		err = f2fs_get_node_info(sbi, dn.nid, &ni, false);
> +		if (err)
> +			goto block_done;
> +
> +		fio.version = ni.version;
> +
> +		f2fs_outplace_write_data(&dn, &fio);
> +		/*
> +		 * The outplace write path failed to submit this block.
> +		 */
> +		if (!fio.submitted)
> +			goto block_done;
> +		if (submitted)
> +			(*submitted)++;
> +		submitted_blk = true;
> +		set_inode_flag(inode, FI_APPEND_WRITE);
> +		trace_f2fs_do_write_data_page(folio, OPU);
> +block_done:
> +		if (dn_held)
> +			f2fs_put_dnode(&dn);
> +		/*
> +		 * If this block was not submitted, roll back its
> +		 * write pages pending.
> +		 */
> +		if (!submitted_blk && ffs)
> +			atomic_dec(&ffs->write_pages_pending);
> +		if (!err) {
> +			*pos = (data_idx + 1) << PAGE_SHIFT;
> +			spin_lock(&F2FS_I(inode)->i_size_lock);
> +			if (F2FS_I(inode)->last_disk_size < *pos)
> +				F2FS_I(inode)->last_disk_size = *pos;
> +			spin_unlock(&F2FS_I(inode)->i_size_lock);
> +		} else {
> +			file_set_keep_isize(inode);
> +		}
> +	}
> +
> +	return err;
> +}
> +
>   int f2fs_write_single_data_page(struct folio *folio, int *submitted,
>   				struct bio **bio,
>   				sector_t *last_block,
> @@ -3935,6 +4178,176 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>   	return ret;
>   }
>   
> +static int f2fs_write_cache_folios(struct address_space *mapping,
> +				   struct writeback_control *wbc,
> +				   enum iostat_type io_type)
> +{
> +	struct folio *folio = NULL;
> +	struct inode *inode = mapping->host;
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	struct f2fs_lock_context lc;
> +	u64 pos = 0;
> +	u64 end_pos = 0;
> +	u32 r_len = 0;
> +	int err = 0;
> +	int submitted = 0;
> +	int nwritten = 0;
> +	bool op_locked = false;
> +	bool next = false;
> +	bool retry = false;
> +
> +	if (get_dirty_pages(inode) <= SM_I(sbi)->min_hot_blocks)
> +		set_inode_flag(inode, FI_HOT_DATA);
> +	else
> +		clear_inode_flag(inode, FI_HOT_DATA);
> +
> +	while ((folio = writeback_iter(mapping, wbc, folio, &err))) {
> +		struct f2fs_folio_state *ffs = NULL;
> +		u64 isize;
> +		size_t poff;
> +		pgoff_t end_index;
> +		bool verity_in_progress;
> +		int folio_submitted = 0;
> +		bool bias_added = false;
> +
> +		submitted = 0;
> +		next = true;
> +		retry = false;
> +
> +		if (err) {
> +			folio_redirty_for_writepage(wbc, folio);
> +			goto retry_out;
> +		}
> +
> +		if (atomic_read(&sbi->wb_sync_req[DATA]) &&
> +		    wbc->sync_mode == WB_SYNC_NONE) {
> +			folio_redirty_for_writepage(wbc, folio);
> +			next = false;
> +			goto retry_out;
> +		}
> +retry:
> +		pos = folio_pos(folio);
> +		end_pos = pos + folio_size(folio);
> +		isize = i_size_read(inode);
> +		verity_in_progress = f2fs_verity_in_progress(inode);
> +		poff = 0;
> +		end_index = 0;
> +
> +		if (retry) {
> +
> +			if (unlikely(folio->mapping != mapping))
> +				goto retry_out;
> +
> +			if (!folio_test_dirty(folio))
> +				goto retry_out;
> +
> +			if (folio_test_writeback(folio)) {
> +				if (wbc->sync_mode == WB_SYNC_NONE)
> +					goto retry_out;
> +				f2fs_folio_wait_writeback(folio, true, true);
> +			}
> +
> +			if (!folio_clear_dirty_for_io(folio))
> +				goto retry_out;
> +		}
> +
> +		/* To avoid dealing with the complexity for one subrange is in bio
> +		 * while we trylock_op failed before writing another subrange.
> +		 * Try to lock_op before any subrange write for the folio.
> +		 */
> +		if (!op_locked) {
> +			if (!f2fs_trylock_op(sbi, &lc)) {
> +				folio_redirty_for_writepage(wbc, folio);
> +				err = 0;
> +				if (wbc->sync_mode != WB_SYNC_ALL)
> +					goto retry_out;
> +
> +				retry = true;
> +				folio_unlock(folio);
> +				f2fs_io_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
> +				folio_lock(folio);
> +				goto retry;
> +			}
> +			op_locked = true;
> +		}
> +
> +		if (!verity_in_progress) {
> +			poff = offset_in_folio(folio, isize);
> +			end_index = isize >> PAGE_SHIFT;
> +
> +			if (folio->index > end_index ||
> +			    (folio->index == end_index && poff == 0))
> +				goto out;
> +
> +			if (end_pos > isize) {
> +				folio_zero_segment(folio, poff, folio_size(folio));
> +				end_pos = isize;
> +			}
> +		}
> +
> +		folio_start_writeback(folio);
> +
> +		if (!bias_added && f2fs_folio_has_ffs(folio)) {
> +			ffs = (struct f2fs_folio_state *)folio->private;
> +			WARN_ON_ONCE(atomic_read(&ffs->write_pages_pending) != 0);
> +			atomic_inc(&ffs->write_pages_pending);
> +			bias_added = true;
> +		}
> +
> +		while ((r_len = ffs_find_dirty_range(folio, &pos, end_pos))) {
> +			err = f2fs_write_folio_dirty_range(folio, &submitted,
> +					wbc, io_type, &pos, r_len);
> +			folio_submitted += submitted;
> +			if (err)
> +				goto out;
> +
> +			nwritten += submitted;

Do we need to update nwritten before goto out? in case if there is partial
blocks were cached in bio and err is valid, otherwise we may missed to call
f2fs_submit_merged_write_cond() below.

> +		}
> +
> +		if (!err && folio_submitted &&

No need to check err because in above loop it will jump to out if
err is valid?

> +		    f2fs_is_atomic_file(inode) &&
> +		    folio_test_f2fs_atomic(folio))
> +			folio_clear_f2fs_atomic(folio);
> +
> +out:
> +		/*
> +		 * Clear the dirty state of the subranges that were written back.
> +		 * If some subranges are still dirty (e.g. the folio was only
> +		 * partially written back), the folio must stay dirty so that
> +		 * the remaining subranges are written back later.
> +		 */
> +		if (f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
> +					(err ? pos : end_pos) - folio_pos(folio)))
> +			folio_redirty_for_writepage(wbc, folio);
> +		else
> +			inode_dec_dirty_pages(inode);
> +
> +		if (bias_added) {
> +			if (atomic_dec_and_test(&ffs->write_pages_pending))
> +				folio_end_writeback(folio);
> +		} else if (!folio_submitted && folio_test_writeback(folio)) {
> +			folio_end_writeback(folio);
> +		}
> +
> +retry_out:
> +		folio_unlock(folio);
> +
> +		if (op_locked) {
> +			f2fs_unlock_op(sbi, &lc);
> +			op_locked = false;
> +		}

It's trivial though, how about reordering f2fs_unlock_op and folio_unlock?

folio_lock -> f2fs_trylock_op -> .. -> f2fs_unlock_op -> folio_unlock

> +
> +		if (!next)

The only case we set next is

		if (atomic_read(&sbi->wb_sync_req[DATA]) &&
		    wbc->sync_mode == WB_SYNC_NONE) {
			folio_redirty_for_writepage(wbc, folio);
			next = false;
			goto retry_out;
		}

Can we handle below logic in above branch?

> +			wbc->nr_to_write = 0;

struct writeback_control {
	/* public fields that can be set and/or consumed by the caller: */
	long nr_to_write;		/* Write this many pages, and decrement
					   this for each page written */
	long pages_skipped;		/* Pages which were not written */

we should decrease nr_to_write only after we have writebacked page, so
shouldn't we increase pages_skipped instead for this case?

Thanks,

> +	}
> +
> +	if (nwritten)
> +		f2fs_submit_merged_write_cond(F2FS_M_SB(mapping), mapping->host,
> +					       NULL);
> +
> +	return err;
> +}
> +
>   static inline bool __should_serialize_io(struct inode *inode,
>   					struct writeback_control *wbc)
>   {
> @@ -4029,7 +4442,11 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
>   	account_writeback(inode, true);
>   
>   	blk_start_plug(&plug);
> -	ret = f2fs_write_cache_pages(mapping, wbc, io_type);
> +	if (mapping_large_folio_support(inode->i_mapping) &&
> +	    !f2fs_has_inline_data(inode))
> +		ret = f2fs_write_cache_folios(mapping, wbc, io_type);
> +	else
> +		ret = f2fs_write_cache_pages(mapping, wbc, io_type);
>   	blk_finish_plug(&plug);
>   
>   	account_writeback(inode, false);

