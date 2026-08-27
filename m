Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12A3409635
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787821024; cv=none; b=WuEM14H1FUENTJOYLmLpQ+uZL6ac7ZPX5HlnRWWrWP1fVNq84x8ubNF4/XQ3wdqgkZdEeHOSoCeCaXGfsVWbpeKuSa21T0TNWyo8/7rDCAJTWDp9UWKzcqoQEtZKU5KLF+6SF0q95sXS8MBuI64ansj+HPYWZ01eXdmDKKZzrGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787821024; c=relaxed/simple;
	bh=8GLsPyCYSReJXtFnw/pED7QoBc7HdU/pN0zL/QOQEEM=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bLrK56gwA5+dCj9eQm9eqz8gh2tgyuvuTh2fiD3ux+KK4QW2m/m7JaK86F+62SFsUqE+uDcTFXIDuO3KRdvsqaKU/4/Q5+tLRpQlSsIolRTkVPzxHmx5Gm2ru0x5kuZYma+PuZnb0cGeGBArWdCu3LJR/6RTjq5SJwfyK85JyqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gp0g68Aa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gp0g68Aa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B202C1F000E9;
	Thu, 27 Aug 2026 08:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787821018;
	bh=EOEJ4CK0mQUXac3rydzccVHddtIdGliR8fWdejy4oaI=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=gp0g68AaIhrthBM/KDS6XlNpnTpE4gg4BJ4XIiKjXsgCrxbNUGE6QJghvBBsmzlG6
	 qoW6PB6d1GHchgmay9SK2R8tPi9G0TyKesB8F1IXgbFoQgloXt23qtXgnLtHsXt3Qg
	 xz6fWhjyxgMD+z7gu6ylS9AsHJZkqihljdLuofpByrylKpfEC1W2KBRfzc5EUU1ExQ
	 t7cHAT//9DFfi87ZlPiOSu2iEE1m8UZ1yuD6oypN11ayv+ZWXWYBN8yQMwx0zC99Ip
	 3azGSVBIGcpcsRAJMuGXO0TyiAH12RoNOnvxE/YeqlF+MmzQ/p0GCh2upZTEKl4ATr
	 iwjzEOSlYBeZw==
Message-ID: <83fe187e-e3e8-4328-bbbf-a6751873b9e0@kernel.org>
Date: Thu, 27 Aug 2026 16:56:53 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Barry Song <baohua@kernel.org>,
 Nanzhe Zhao <nzzhao@126.com>, Juan Yescas <jyescas@google.com>,
 Dev Jain <Dev.Jain@arm.com>, linux-kernel@vger.kernel.org,
 David Hildenbrand <David.Hildenbrand@arm.com>,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Ryan Roberts <Ryan.Roberts@arm.com>, Pengfei Li <lipengfei28@xiaomi.com>
Subject: Re: [PATCH 03/14] f2fs: support regular file buffered writes on large
 folios
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260826082641.2007658-1-zhaonanzhe@xiaomi.com>
 <20260826082641.2007658-4-zhaonanzhe@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260826082641.2007658-4-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/26/26 16:26, Nanzhe Zhao wrote:
> To avoid the complexity of unlocking a large folio in write_begin,
> preallocate partial blocks for inodes that can use large folios.
> During write_begin, read only the partial head and tail 4K subpages
> that need read-before-write, and skip read I/O for the full middle
> subpages covered by the write.
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> ---
>  fs/f2fs/data.c | 289 +++++++++++++++++++++++++++++++++++++++++++++++--
>  fs/f2fs/f2fs.h |   1 +
>  fs/f2fs/file.c |  17 ++-
>  3 files changed, 293 insertions(+), 14 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 8649d443ca74..7ce96ae02cfc 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1249,6 +1249,40 @@ static void f2fs_submit_page_read(struct inode *inode, struct fsverity_info *vi,
>  	f2fs_submit_read_bio(sbi, bio, DATA);
>  }
>  
> +/*
> + * Synchronously read a single 4K subpage by reusing f2fs_submit_page_read()
> + * so that iostat, trace, blk-crypto and post-read handling are all preserved.
> + * The caller must have already allocated ffs for the folio.
> + */
> +static int f2fs_submit_page_read_sync(struct inode *inode, struct folio *folio,
> +				      pgoff_t index, block_t blkaddr)
> +{
> +	struct f2fs_folio_state *ffs = folio->private;
> +	unsigned long flags;
> +
> +	/* Add bias so end_io does not call folio_end_read(). */
> +	spin_lock_irqsave(&ffs->state_lock, flags);
> +	ffs->read_pages_pending++;
> +	spin_unlock_irqrestore(&ffs->state_lock, flags);
> +
> +	f2fs_submit_page_read(inode, NULL, folio, index, blkaddr,
> +			      REQ_OP_READ, false);
> +
> +	/* Wait for pending drops back to bias which indicates all bio have completed. */
> +	while (READ_ONCE(ffs->read_pages_pending) != 1)
> +		f2fs_io_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);

Suspect there will be potential performance issue, as timeout interval is
large.

> +
> +	/* Remove the bias. */
> +	spin_lock_irqsave(&ffs->state_lock, flags);
> +	ffs->read_pages_pending--;
> +	spin_unlock_irqrestore(&ffs->state_lock, flags);

Looks hacky.

If large folio has 4 sub pages, first 3 pages are uptodate.
Then we use f2fs_submit_page_read_sync() to read last page,
in f2fs_finish_read_bio(), we update state bitmap of last page to 1,
but as read_pages_pending is 1, so folio won't be set as uptodate.

Oh, in f2fs_write_end(), we have another change to set folio uptodate
though, so the flow is a little bit different here.

> +
> +	if (!f2fs_ffs_test_blk_uptodate(folio, index))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
>  static void __set_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr)
>  {
>  	__le32 *addr = get_dnode_addr(dn->inode, dn->node_folio);
> @@ -2582,6 +2616,112 @@ static void ffs_detach_free(struct folio *folio)
>  	kfree(ffs);
>  }
>  
> +bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index)
> +{
> +	struct f2fs_folio_state *ffs;
> +	unsigned int idx;
> +
> +	if (!f2fs_folio_has_ffs(folio))
> +		return folio_test_uptodate(folio);
> +
> +	if (!folio_contains(folio, index))
> +		return false;

Can we check this out of f2fs_ffs_test_blk_uptodate()? and add a sanity
check here:

f2fs_bug_on(sbi, !folio_contains(folio, index));

> +
> +	ffs = (struct f2fs_folio_state *)folio->private;
> +	idx = index - folio->index;
> +	return test_bit(idx, ffs->state);
> +}
> +
> +static bool __ffs_mark_subrange_uptodate(struct folio *folio,
> +		struct f2fs_folio_state *ffs, size_t offset, size_t len)
> +{
> +	unsigned int nr_subpages = folio_nr_pages(folio);
> +	unsigned int start, end;
> +
> +	start = offset >> PAGE_SHIFT;
> +	end = (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
> +	end = min(end, nr_subpages);
> +
> +	bitmap_set(ffs->state, start, end - start);
> +	return bitmap_full(ffs->state, nr_subpages);
> +}
> +
> +static void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
> +				       size_t len)
> +{
> +	struct f2fs_folio_state *ffs;
> +	unsigned long flags;
> +	bool mark_uptodate = false;
> +
> +	f2fs_bug_on(F2FS_F_SB(folio), offset + len > folio_size(folio));
> +
> +	if (!f2fs_folio_has_ffs(folio)) {
> +		folio_mark_uptodate(folio);
> +		return;
> +	}
> +
> +	ffs = (struct f2fs_folio_state *)folio->private;
> +	spin_lock_irqsave(&ffs->state_lock, flags);
> +	mark_uptodate = __ffs_mark_subrange_uptodate(folio, ffs, offset, len) &&
> +			!ffs->read_pages_pending;
> +	spin_unlock_irqrestore(&ffs->state_lock, flags);
> +	if (mark_uptodate)
> +		folio_mark_uptodate(folio);
> +}
> +
> +static void f2fs_ffs_mark_subrange_dirty(struct folio *folio,
> +				    size_t offset, size_t len)
> +{
> +	struct f2fs_folio_state *ffs;
> +	unsigned int nr_subpages, start, end;
> +	unsigned long flags;
> +
> +	f2fs_bug_on(F2FS_F_SB(folio), offset + len > folio_size(folio));
> +
> +	if (!f2fs_folio_has_ffs(folio))
> +		return;
> +
> +	ffs = (struct f2fs_folio_state *)folio->private;
> +	nr_subpages = folio_nr_pages(folio);
> +	start = offset >> PAGE_SHIFT;
> +	end = (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
> +	end = min(end, nr_subpages);
> +
> +	spin_lock_irqsave(&ffs->state_lock, flags);
> +	bitmap_set(ffs->state, nr_subpages + start, end - start);
> +	spin_unlock_irqrestore(&ffs->state_lock, flags);
> +}
> +
> +static bool find_next_valid_block(const struct folio *folio,
> +				  size_t orig_off, size_t *need_off,
> +				  size_t len)
> +{
> +	size_t start = orig_off;
> +	size_t end = start + len;
> +	size_t head, tail;
> +	pgoff_t index;
> +
> +	if (start & (PAGE_SIZE - 1)) {
> +		head = round_down(start, PAGE_SIZE);
> +		index = folio->index + (head >> PAGE_SHIFT);
> +		if (!f2fs_ffs_test_blk_uptodate(folio, index)) {
> +			*need_off = head;
> +			return true;
> +		}
> +	}
> +
> +	if (end & (PAGE_SIZE - 1)) {
> +		tail = round_down(end - 1, PAGE_SIZE);
> +		index = folio->index + (tail >> PAGE_SHIFT);
> +		if (!f2fs_ffs_test_blk_uptodate(folio, index)) {
> +			*need_off = tail;
> +			return true;
> +		}
> +	}
> +
> +	return false;
> +}
> +
>  static int f2fs_read_data_large_folio(struct inode *inode,
>  		struct fsverity_info *vi,
>  		struct readahead_control *rac, struct folio *folio)
> @@ -3975,6 +4115,102 @@ static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
>  	return 0;
>  }
>  
> +static int prepare_large_folio_write_begin(struct inode *inode,
> +					  struct folio *folio, loff_t pos,
> +					  unsigned int len)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	struct f2fs_folio_state *ffs;
> +	size_t ori_off = offset_in_folio(folio, pos);
> +	size_t need_off = ori_off;
> +	int err = 0;
> +
> +	len = min_t(unsigned int, len, folio_size(folio) - ori_off);
> +
> +	/*
> +	 * When folio minimum order is non-zero, the fsverity
> +	 * page_cache_write() path enters f2fs_write_begin() via
> +	 * aops->write_begin without going through f2fs_write_iter(),
> +	 * so preallocation from f2fs_write_iter() is skipped.  In that
> +	 * case, if FI_PREALLOCATED_ALL is not set, we must preallocate
> +	 * the write blocks here.
> +	 */
> +	if (!is_inode_flag_set(inode, FI_PREALLOCATED_ALL)) {
> +		struct f2fs_map_blocks map = {};
> +
> +		map.m_lblk = F2FS_BYTES_TO_BLK(pos);
> +		map.m_len = F2FS_BLK_ALIGN(pos + len) - map.m_lblk;
> +
> +		if (!IS_DEVICE_ALIASING(inode))
> +			map.m_may_create = true;
> +		map.m_seg_type = NO_CHECK_TYPE;
> +
> +		err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_PRE_AIO);
> +		if (err)
> +			return err;
> +	}
> +
> +	/*
> +	 * Skip read and ffs allocation if the folio is already fully
> +	 * uptodate or the write covers the entire folio.
> +	 */
> +	if (folio_test_uptodate(folio) || len == folio_size(folio))
> +		return 0;

Do we need to adopt fsverity like we did in f2fs_write_begin()?

	if (!(pos & (PAGE_SIZE - 1)) && (pos + len) >= i_size_read(inode) &&
	    !f2fs_verity_in_progress(inode)) {
		folio_zero_segment(folio, len, folio_size(folio));
		return 0;
	}

> +
> +	ffs = f2fs_ffs_find_or_alloc(folio);

f2fs_ffs_find_or_alloc() will never fail.

> +	if (!ffs)
> +		return -ENOMEM;
> +
> +	/* Inline data must have been converted before reaching here. */
> +	f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
> +
> +	while (find_next_valid_block(folio, ori_off,
> +				     &need_off, len)) {
> +		struct dnode_of_data dn;
> +		pgoff_t index = folio->index + (need_off >> PAGE_SHIFT);
> +		block_t blkaddr;
> +		bool get_dn = false;
> +
> +		if (!f2fs_lookup_read_extent_cache_block(inode, index,
> +							&blkaddr)) {
> +			if (IS_DEVICE_ALIASING(inode))
> +				return -ENODATA;
> +
> +			set_new_dnode(&dn, inode, NULL, NULL, 0);
> +			err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
> +			if (err)
> +				return err;
> +			get_dn = true;
> +			blkaddr = dn.data_blkaddr;
> +
> +			if (blkaddr == NEW_ADDR) {
> +				size_t off = offset_in_folio(folio,
> +							     index << PAGE_SHIFT);
> +
> +				folio_zero_segment(folio, off, off + PAGE_SIZE);
> +				f2fs_ffs_mark_subrange_uptodate(folio, off,
> +							       PAGE_SIZE);
> +				goto out;
> +			}
> +
> +			if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
> +						  DATA_GENERIC_ENHANCE_READ)) {
> +				err = -EFSCORRUPTED;
> +				goto out;
> +			}
> +		}
> +
> +		err = f2fs_submit_page_read_sync(inode, folio, index, blkaddr);
> +out:
> +		if (get_dn)
> +			f2fs_put_dnode(&dn);
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
>  static int f2fs_write_begin(const struct kiocb *iocb,
>  			    struct address_space *mapping,
>  			    loff_t pos, unsigned len, struct folio **foliop,
> @@ -3986,6 +4222,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
>  	pgoff_t index = pos >> PAGE_SHIFT;
>  	bool need_balance = false;
>  	block_t blkaddr = NULL_ADDR;
> +	fgf_t fgp = FGP_LOCK | FGP_WRITE | FGP_CREAT;
>  	int err = 0;
>  
>  	trace_f2fs_write_begin(inode, pos, len);
> @@ -4033,9 +4270,9 @@ static int f2fs_write_begin(const struct kiocb *iocb,
>  	 * Do not use FGP_STABLE to avoid deadlock.
>  	 * Will wait that below with our IO control.
>  	 */
> -	folio = f2fs_filemap_get_folio(mapping, index,
> -				FGP_LOCK | FGP_WRITE | FGP_CREAT,
> -				mapping_gfp_mask(mapping));
> +	fgp |= fgf_set_order(len);
> +	folio = __filemap_get_folio(mapping, index, fgp,
> +				    mapping_gfp_mask(mapping));

It detaches from fault injection, why we need to change to use
__filemap_get_folio()?

>  	if (IS_ERR(folio)) {
>  		err = PTR_ERR(folio);
>  		goto fail;
> @@ -4048,7 +4285,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
>  	if (f2fs_is_atomic_file(inode))
>  		err = prepare_atomic_write_begin(sbi, folio, pos, len,
>  					&blkaddr, &need_balance);
> -	else
> +	else if (!folio_test_large(folio))
>  		err = prepare_write_begin(sbi, folio, pos, len,
>  					&blkaddr, &need_balance);
>  	if (err)
> @@ -4069,6 +4306,14 @@ static int f2fs_write_begin(const struct kiocb *iocb,
>  
>  	f2fs_folio_wait_writeback(folio, DATA, false, true);
>  
> +	if (folio_test_large(folio)) {
> +		err = prepare_large_folio_write_begin(inode,
> +					folio, pos, len);
> +		if (!err)
> +			return 0;
> +		goto put_folio;
> +	}
> +
>  	if (len == folio_size(folio) || folio_test_uptodate(folio))
>  		return 0;
>  
> @@ -4129,15 +4374,20 @@ static int f2fs_write_end(const struct kiocb *iocb,
>  	trace_f2fs_write_end(inode, pos, len, copied);
>  
>  	/*
> -	 * This should be come from len == PAGE_SIZE, and we expect copied
> -	 * should be PAGE_SIZE. Otherwise, we treat it with zero copied and
> -	 * let generic_perform_write() try to copy data again through copied=0.
> +	 * If a short copy happens on a folio that isn't uptodate, we treat
> +	 * it with zero copied and let generic_perform_write() try to copy
> +	 * data again through copied=0.
>  	 */
>  	if (!folio_test_uptodate(folio)) {
> -		if (unlikely(copied != len))
> +		if (unlikely(copied != len)) {
>  			copied = 0;
> -		else
> +		} else if (folio_test_large(folio)) {
> +			f2fs_ffs_mark_subrange_uptodate(folio,
> +					offset_in_folio(folio, pos), len);
> +		} else {
> +			/* This should be come from len == PAGE_SIZE */
>  			folio_mark_uptodate(folio);
> +		}
>  	}
>  
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
> @@ -4156,6 +4406,9 @@ static int f2fs_write_end(const struct kiocb *iocb,
>  	if (!copied)
>  		goto unlock_out;
>  
> +	if (folio_test_large(folio))
> +		f2fs_ffs_mark_subrange_dirty(folio, offset_in_folio(folio, pos),
> +								   copied);
>  	folio_mark_dirty(folio);
>  
>  	if (f2fs_is_atomic_file(inode))
> @@ -4218,8 +4471,22 @@ static bool f2fs_dirty_data_folio(struct address_space *mapping,
>  
>  	trace_f2fs_set_page_dirty(folio, DATA);
>  
> -	if (!folio_test_uptodate(folio))
> -		folio_mark_uptodate(folio);
> +	if (!folio_test_uptodate(folio)) {
> +		bool uptodate = true;
> +
> +		if (f2fs_folio_has_ffs(folio)) {
> +			struct f2fs_folio_state *ffs =
> +				(struct f2fs_folio_state *)folio->private;
> +			unsigned long flags;
> +
> +			spin_lock_irqsave(&ffs->state_lock, flags);
> +			uptodate = bitmap_full(ffs->state, folio_nr_pages(folio)) &&
> +				   !ffs->read_pages_pending;
> +			spin_unlock_irqrestore(&ffs->state_lock, flags);

f2fs_ffs_mark_subrange_uptodate(folio, 0, folio_size(folio)); ?

> +		}
> +		if (uptodate)
> +			folio_mark_uptodate(folio);
> +	}
>  	BUG_ON(folio_test_swapcache(folio));
>  
>  	if (filemap_dirty_folio(mapping, folio)) {
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 31ddd321daf6..ae6031693700 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4342,6 +4342,7 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
>  				struct writeback_control *wbc,
>  				enum iostat_type io_type,
>  				int compr_blocks, bool allow_balance);
> +bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index);
>  void f2fs_write_failed(struct inode *inode, loff_t to);
>  void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length);
>  bool f2fs_release_folio(struct folio *folio, gfp_t wait);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index d440231b8cb9..e40285d4f9c2 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -5405,9 +5405,20 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
>  			return ret;
>  	}
>  
> -	/* Do not preallocate blocks that will be written partially in 4KB. */
> -	map.m_lblk = F2FS_BLK_ALIGN(pos);
> -	map.m_len = F2FS_BYTES_TO_BLK(pos + count);
> +	if (mapping_large_folio_support(inode->i_mapping)) {
> +		/*
> +		 * Preallocate all blocks touched by a large-folio buffered write so
> +		 * the regular write_begin path does not need to unlock the folio for
> +		 * f2fs_balance_fs().  Rechecking large-folio state after unlock is
> +		 * unreliable since partial truncation can split the folio.

You mean buffered io case, right? so we need to check !dio as well?

Thanks,

> +		 */
> +		map.m_lblk = F2FS_BYTES_TO_BLK(pos);
> +		map.m_len = F2FS_BLK_ALIGN(pos + count);
> +	} else {
> +		/* Do not preallocate blocks that will be written partially in 4KB. */
> +		map.m_lblk = F2FS_BLK_ALIGN(pos);
> +		map.m_len = F2FS_BYTES_TO_BLK(pos + count);
> +	}
>  	if (map.m_len > map.m_lblk)
>  		map.m_len -= map.m_lblk;
>  	else

