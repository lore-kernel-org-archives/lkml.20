Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793937292;
	b=V8yPrpIXg8xtyE23mBqj6E6QGjU4wAy2dw74XMwy5Ku+JlWpiX8I7i7o4FurV2Dz2Zge
	 Oc3D6P9JUWlnnDz/OzodCFuaOiyRG6lKnrjxGqq4RCzxCYGV2C7r/r74VcHlxPO310PVF
	 71ueeF/6+bT6zjBd1Cb/NGGlEdDBi8cGOOPho12RQCPtBy5Uw5KV3BhdyY37dJvTC/ZHc
	 QBTobBLVgPOa4kOqvd7pRxmQ3j7tLHuaXmIIVZC0TX38Qfu0pQygVv3Rpvca411D22F4G
	 VY4deE9Q/PjXP9sYwqTlhO2bbA4yzYl/5ALjBoNmfKz0eQ4JsDWb28NrcxElIPVMXtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793937292;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Wo+U7tZm1O/9g1FtQojmGc28SKGLLrtaIZFZnhNRIR0=;
	b=2GOxfPsmw2quj6i6Iltagor/VbAfAYRIktP6HxPXEgUe2bQ0XX/cyROjLnfnbt9aPVwG
	 0jwT318zrcGQNjLvXqUdFuygSFwriuFJHi+HFLPNmq5e0appVJAfMVEAy4WBr4Rt4SPjM
	 PYtA5eqgX79YlngMXyh6FcPoTkwW4/yZdPVm/EcPJdEXU6TbXv9wdg95JimQN9ZuxK2q2
	 38SgUWUHGA00O4/DPM8WHzS5R1UsNbhZnhL1HVZMIYOyirI8GzCn8zX8NLA3nnb/iHhqh
	 AnwCcIXjmB0K4Gxbx/gA9T249LkCDNws9pK8L0W0yEdNezC92kSdWdxV2TFj71Jc36Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dEwuZNEj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A1D606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 03:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dEwuZNEj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927021F0089F;
	Fri,  6 Nov 2026 03:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793937291;
	bh=Wo+U7tZm1O/9g1FtQojmGc28SKGLLrtaIZFZnhNRIR0=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=dEwuZNEjvMqXG5ttD9ZvpeLY7N4d18U6N9gpe+P2Ta6iT5yUbzKnE+v2/Ggoxyd8Z
	 1c/KC7pTuDtGtP84C8LMSPP1zlHKgqlPMFkN6B1IBGXua0+M8UK2zZm++iABYnTeaR
	 NLQ/uH6RLeaUlVR2pNplW3wCMVMbUxRaG7qZcE44RlhGZzpauTgQpjZsd3bDusG0xu
	 6uaSc9gJaDaal6iKA3CMV0PRzwX7Snmipk0t44psEA/jdWBvwwy/pxgU/scPJPLN6Q
	 R9iE6ZPRlpyNk3Tu3P87BtX/ZBt6jjm8DQUqOMZIefhGj1C7dzPreYZjBJdYG2U46T
	 viBgk4gAOv2oA==
Message-ID: <c5f90170-90b9-485f-852c-b85e9638f741@kernel.org>
Date: Fri, 6 Nov 2026 11:54:47 +0800
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
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH 08/20] f2fs: adapt range operations and mmap
 for subpage blocks
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261102193952.3002018-1-daeho43@gmail.com>
 <20261102193952.3002018-9-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261102193952.3002018-9-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 03:39, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> - A writable PTE covers the whole folio, so page_mkwrite prepares
>    every block of the folio up to EOF and dirties only those blocks.
> - Align zero range, punch hole, preallocation and truncation to the
>    block size instead of PAGE_SIZE. When i_size grows, write-protect the
>    folio straddling the old EOF so that stores to its new blocks fault
>    into page_mkwrite.
> - Unmap every base page overlapping a punched or zeroed range, and
>    truncate the page cache without truncate_pagecache_range(), whose
>    unmap underflows for a range ending in the first page.
> - For SEEK_DATA, treat a NEW_ADDR block as data only if the block
>    itself is dirty.
> - When truncation zeroes the tail of a page, mark only the block
>    holding the new EOF dirty, not the blocks after it.

IIUC, we will call pagecache_isize_extended() after i_size updates.

Will f2fs_zero_post_eof_page() cover this case? if it missed anything after we
enable subpage block feature, how about fixing inside f2fs_zero_post_eof_page()?

Minor cleanup comments below.

> 
> The SEEK_DATA change also applies to large folios when the block size
> equals PAGE_SIZE.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   fs/f2fs/data.c |  58 +++++++++--
>   fs/f2fs/f2fs.h |   4 +-
>   fs/f2fs/file.c | 263 ++++++++++++++++++++++++++++++++-----------------
>   3 files changed, 228 insertions(+), 97 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 41246f83b31d..77915a2eb190 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3198,7 +3198,7 @@ bool f2fs_ffs_dirty_blk_range(struct folio *folio, unsigned int from,
>   
>   static bool find_next_valid_block(const struct folio *folio,
>   				  size_t orig_off, size_t *need_off,
> -				  size_t len)
> +				  size_t len, bool read_full)
>   {
>   	struct f2fs_sb_info *sbi = F2FS_M_SB(folio->mapping);
>   	size_t start = orig_off;
> @@ -3206,6 +3206,20 @@ static bool find_next_valid_block(const struct folio *folio,
>   	size_t head, tail;
>   	pgoff_t index;
>   
> +	/* Find every block that is not uptodate, not only the partial ones. */
> +	if (read_full) {
> +		for (head = round_down(*need_off, F2FS_BLKSIZE(sbi)); head < end;
> +		     head += F2FS_BLKSIZE(sbi)) {
> +			index = f2fs_folio_lblk(sbi, folio) +
> +				F2FS_BYTES_TO_BLK(sbi, head);
> +			if (!f2fs_ffs_test_blk_uptodate(folio, index)) {
> +				*need_off = head;
> +				return true;
> +			}
> +		}
> +		return false;
> +	}
> +
>   	if (start & (F2FS_BLKSIZE(sbi) - 1)) {

F2FS_BLKSIZE_MASK(sbi)

>   		head = round_down(start, F2FS_BLKSIZE(sbi));
>   		index = f2fs_folio_lblk(sbi, folio) +
> @@ -5222,7 +5236,8 @@ static bool f2fs_balance_fs_folio_locked(struct folio *folio,
>   
>   static int prepare_large_folio_write_begin(struct inode *inode,
>   					  struct folio *folio, loff_t pos,
> -					  unsigned int len, bool *need_balance)
> +					  unsigned int len, bool read_full,
> +					  bool preallocated, bool *need_balance)
>   {
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   	struct f2fs_folio_state *ffs;
> @@ -5238,8 +5253,7 @@ static int prepare_large_folio_write_begin(struct inode *inode,
>   	 * Reserve blocks without f2fs_balance_fs() since the folio is locked;
>   	 * the caller balances after unlocking it if *need_balance is set.
>   	 */
> -	if (!is_inode_flag_set(inode, FI_PREALLOCATED_ALL) &&
> -	    !IS_DEVICE_ALIASING(inode)) {
> +	if (!preallocated && !IS_DEVICE_ALIASING(inode)) {
>   		pgoff_t first = F2FS_BYTES_TO_BLK(sbi, pos);
>   		pgoff_t last = F2FS_BLK_ALIGN(sbi, pos + len);
>   		pgoff_t idx;
> @@ -5261,14 +5275,15 @@ static int prepare_large_folio_write_begin(struct inode *inode,
>   	/* Skip read if the folio is already fully uptodate or the write
>   	 * covers the entire folio.
>   	 */
> -	if (folio_test_uptodate(folio) || len == folio_size(folio))
> +	if (folio_test_uptodate(folio) ||
> +	    (!read_full && len == folio_size(folio)))
>   		return 0;
>   
>   	/*
>   	 * Skip read if the write starts at a block boundary and reaches EOF,
>   	 * and zero the rest of the folio instead.
>   	 */
> -	if (!f2fs_verity_in_progress(inode) &&
> +	if (!read_full && !f2fs_verity_in_progress(inode) &&
>   	    !(pos & (F2FS_BLKSIZE(sbi) - 1)) && (pos + len) >= i_size_read(inode)) {

F2FS_BLKSIZE_MASK(sbi)

>   		size_t zoff = ori_off + len;
>   
> @@ -5281,7 +5296,7 @@ static int prepare_large_folio_write_begin(struct inode *inode,
>   	f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
>   
>   	while (find_next_valid_block(folio, ori_off,
> -				     &need_off, len)) {
> +				     &need_off, len, read_full)) {
>   		struct dnode_of_data dn;
>   		pgoff_t index = f2fs_folio_lblk(sbi, folio) +
>   				F2FS_BYTES_TO_BLK(sbi, need_off);
> @@ -5382,6 +5397,20 @@ static int prepare_large_folio_atomic_write_begin(struct inode *inode,
>   	return 0;
>   }
>   
> +int f2fs_prepare_subpage_mkwrite(struct inode *inode, struct folio *folio,
> +				 loff_t pos, unsigned int len)
> +{
> +	bool need_balance = false;
> +
> +	/*
> +	 * mkwrite runs without inode_lock, so FI_PREALLOCATED_ALL may have
> +	 * been set by a concurrent write() for a different range. It calls
> +	 * f2fs_balance_fs() before locking the folio, so ignore need_balance.
> +	 */
> +	return prepare_large_folio_write_begin(inode, folio, pos, len, true,
> +					       false, &need_balance);
> +}
> +
>   static int f2fs_write_begin(const struct kiocb *iocb,
>   			    struct address_space *mapping,
>   			    loff_t pos, unsigned len, struct folio **foliop,
> @@ -5490,7 +5519,9 @@ static int f2fs_write_begin(const struct kiocb *iocb,
>   					mapping, folio, pos, len, retried);
>   	} else {
>   		err = prepare_large_folio_write_begin(inode, folio, pos, blen,
> -						      &need_balance);
> +				false,
> +				is_inode_flag_set(inode, FI_PREALLOCATED_ALL),
> +				&need_balance);
>   	}
>   	if (err) {
>   		if (err == -EAGAIN) {
> @@ -5566,6 +5597,7 @@ static int f2fs_write_end(const struct kiocb *iocb,
>   			struct folio *folio, void *fsdata)
>   {
>   	struct inode *inode = folio->mapping->host;
> +	loff_t old_size = i_size_read(inode);
>   
>   	trace_f2fs_write_end(inode, pos, len, copied);
>   
> @@ -5595,6 +5627,8 @@ static int f2fs_write_end(const struct kiocb *iocb,
>   		if (pos + copied > i_size_read(inode) &&
>   				!f2fs_verity_in_progress(inode))
>   			f2fs_i_size_write(inode, pos + copied);
> +		if (i_size_read(inode) > old_size)
> +			pagecache_isize_extended(inode, old_size, pos);
>   		return copied;
>   	}
>   #endif
> @@ -5620,6 +5654,14 @@ static int f2fs_write_end(const struct kiocb *iocb,
>   unlock_out:
>   	f2fs_folio_put(folio, true);
>   	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
> +
> +	/*
> +	 * The folio straddling the old EOF may still be mapped writable, and
> +	 * the blocks between the old EOF and pos in it are not prepared.
> +	 * Write-protect it so that mmap stores to them fault.
> +	 */
> +	if (i_size_read(inode) > old_size)
> +		pagecache_isize_extended(inode, old_size, pos);
>   	return copied;
>   }
>   
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index aab1095ad5ff..8e3224eacdb5 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4094,7 +4094,7 @@ int f2fs_getattr(const struct mnt_idmap *idmap, const struct path *path,
>   		 struct kstat *stat, u32 request_mask, unsigned int flags);
>   int f2fs_setattr(const struct mnt_idmap *idmap, struct dentry *dentry,
>   		 struct iattr *attr);
> -int f2fs_truncate_hole(struct inode *inode, pgoff_t pg_start, pgoff_t pg_end);
> +int f2fs_truncate_hole(struct inode *inode, pgoff_t blk_start, pgoff_t blk_end);
>   void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count);
>   int f2fs_do_shutdown(struct f2fs_sb_info *sbi, unsigned int flag,
>   						bool readonly, bool need_lock);
> @@ -4539,6 +4539,8 @@ void f2fs_ffs_clear_subrange_uptodate(struct folio *folio, size_t offset,
>   				      size_t len);
>   bool f2fs_ffs_dirty_blk_range(struct folio *folio, unsigned int from,
>   			      unsigned int to, unsigned int *start, unsigned int *count);
> +int f2fs_prepare_subpage_mkwrite(struct inode *inode, struct folio *folio,
> +				 loff_t pos, unsigned int len);
>   void f2fs_write_failed(struct inode *inode, loff_t to);
>   void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length);
>   bool f2fs_release_folio(struct folio *folio, gfp_t wait);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index be548f39e33e..e68553cef777 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -41,18 +41,19 @@ static int fill_zero(struct inode *inode, pgoff_t index,
>   
>   static int do_zero_post_eof_page(struct inode *inode, loff_t new_size)
>   {
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   	loff_t old_size = i_size_read(inode);
>   	unsigned int offset, len;
> -	pgoff_t index;
> +	pgoff_t bidx;
>   	int err;
>   
> -	offset = old_size & (PAGE_SIZE - 1);
> +	offset = old_size & (F2FS_BLKSIZE(sbi) - 1);

F2FS_BLKSIZE_MASK(sbi)

>   
>   	if (!offset)
>   		return 0;
>   
> -	len = min_t(loff_t, PAGE_SIZE - offset, new_size - old_size);
> -	index = old_size >> PAGE_SHIFT;
> +	len = min_t(loff_t, F2FS_BLKSIZE(sbi) - offset, new_size - old_size);
> +	bidx = F2FS_BYTES_TO_BLK(sbi, old_size);
>   
>   	if (f2fs_has_inline_data(inode)) {
>   		/* data post eof should be always zero */
> @@ -63,7 +64,7 @@ static int do_zero_post_eof_page(struct inode *inode, loff_t new_size)
>   			return err;
>   	}
>   
> -	err = fill_zero(inode, index, offset, len);
> +	err = fill_zero(inode, bidx, offset, len);
>   	if (err)
>   		return err;
>   	return filemap_write_and_wait_range(inode->i_mapping,
> @@ -144,11 +145,11 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>   	bool need_alloc = !f2fs_is_pinned_file(inode);
>   	pgoff_t pidx = folio->index + folio_page_idx(folio, vmf->page);
>   	loff_t pos = (loff_t)pidx << PAGE_SHIFT;
> +	pgoff_t bidx = F2FS_BYTES_TO_BLK(sbi, pos + offset_in_page(vmf->address));
>   	loff_t isize;
>   	loff_t folio_start;
>   	loff_t valid_end;
>   	size_t dirty_len;
> -	size_t subpage_off;
>   	pgoff_t i, nr;
>   	int err = 0;
>   	vm_fault_t ret;
> @@ -212,14 +213,12 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>   	folio_lock(folio);
>   	isize = i_size_read(inode);
>   	folio_start = folio_pos(folio);
> -	subpage_off = offset_in_folio(folio, pos);
>   	valid_end = min_t(loff_t, folio_start + folio_size(folio), isize);
>   	dirty_len = valid_end - folio_start;
>   
>   	if (unlikely(folio->mapping != inode->i_mapping ||
>   			pos >= isize ||
> -			!f2fs_ffs_test_blk_uptodate(folio,
> -			folio->index + (subpage_off >> PAGE_SHIFT)))) {
> +			!f2fs_ffs_test_blk_uptodate(folio, bidx))) {
>   		folio_unlock(folio);
>   		err = -EFAULT;
>   		goto out_sem;
> @@ -240,6 +239,24 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>   
>   	nr = DIV_ROUND_UP(dirty_len, PAGE_SIZE);
>   
> +	if (f2fs_has_subpage_blocks(sbi)) {
> +		/*
> +		 * A writable PTE covers the whole base folio.  Like ext4's
> +		 * block_page_mkwrite(), prepare every filesystem block through EOF
> +		 * before returning it writable, but dirty only those blocks.  This
> +		 * prevents a later store in a sibling 4K block from bypassing block
> +		 * allocation while also keeping blocks beyond i_size clean.
> +		 */
> +		f2fs_folio_wait_writeback(folio, false, true);
> +		err = f2fs_prepare_subpage_mkwrite(inode, folio,
> +						   folio_pos(folio), dirty_len);
> +		if (err) {
> +			folio_unlock(folio);
> +			goto out_sem;
> +		}
> +		goto zero_tail;
> +	}
> +
>   	for (i = 0; i < nr; i++) {
>   		err = f2fs_get_block_mkwrite(inode, folio, folio->index + i,
>   					     need_alloc);
> @@ -249,6 +266,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>   		}
>   	}
>   
> +zero_tail:
>   	/* page is wholly or partially inside EOF */
>   	if (folio_start + folio_size(folio) > isize) {
>   		size_t offset = offset_in_folio(folio, isize);
> @@ -256,8 +274,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>   		folio_zero_segment(folio, offset, folio_size(folio));
>   	}
>   
> -	if (folio_test_large(folio))
> -		f2fs_ffs_mark_subrange_dirty(folio, 0, dirty_len);
> +	f2fs_ffs_mark_subrange_dirty(folio, 0, dirty_len);
>   	folio_mark_dirty(folio);
>   
>   	f2fs_update_iostat(sbi, inode, APP_MAPPED_IO, dirty_len);
> @@ -503,7 +520,9 @@ static bool __found_offset(struct address_space *mapping,
>   {
>   	block_t blkaddr = f2fs_data_blkaddr(dn);
>   	struct inode *inode = mapping->host;
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   	bool compressed_cluster = false;
> +	bool dirty = false;
>   
>   	if (f2fs_compressed_file(inode)) {
>   		block_t first_blkaddr = data_blkaddr(dn->inode, dn->node_entry,
> @@ -512,12 +531,37 @@ static bool __found_offset(struct address_space *mapping,
>   		compressed_cluster = first_blkaddr == COMPRESS_ADDR;
>   	}
>   
> +	if (blkaddr == NEW_ADDR) {
> +		pgoff_t f_index = f2fs_lblk_to_folio_index(sbi, index);
> +
> +		if (xa_get_mark(&mapping->i_pages, f_index, PAGECACHE_TAG_DIRTY)) {
> +			struct folio *folio = filemap_get_folio(mapping, f_index);
> +
> +			if (!IS_ERR(folio)) {
> +				/*
> +				 * ffs is freed under the folio lock. We hold the
> +				 * dnode, so only trylock the folio, and take the
> +				 * block as dirty, as the dirty tag says, if the
> +				 * folio is busy.
> +				 */
> +				if (folio_trylock(folio)) {
> +					if (folio->mapping == mapping)
> +						dirty = f2fs_ffs_test_blk_dirty(folio,
> +									index);
> +					folio_unlock(folio);
> +				} else {
> +					dirty = true;
> +				}
> +				f2fs_folio_put(folio, false);
> +			}
> +		}
> +	}
> +
>   	switch (whence) {
>   	case SEEK_DATA:
>   		if (__is_valid_data_blkaddr(blkaddr))
>   			return true;
> -		if (blkaddr == NEW_ADDR &&
> -		    xa_get_mark(&mapping->i_pages, index, PAGECACHE_TAG_DIRTY))
> +		if (dirty)
>   			return true;
>   		if (compressed_cluster)
>   			return true;
> @@ -815,20 +859,23 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
>   					 dn->ofs_in_node, nr_free);
>   }
>   
> -static int truncate_partial_data_page(struct inode *inode, u64 from,
> +static int truncate_partial_data_block(struct inode *inode, u64 from,
>   								bool cache_only)
>   {
> -	pgoff_t index = from >> PAGE_SHIFT;
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	pgoff_t bidx = F2FS_BYTES_TO_BLK(sbi, from);
> +	pgoff_t f_index = f2fs_has_subpage_blocks(sbi) ?
> +		f2fs_lblk_to_folio_index(sbi, bidx) : (from >> PAGE_SHIFT);
>   	struct address_space *mapping = inode->i_mapping;
>   	struct folio *folio;
>   	size_t folio_off;
>   	size_t blk_end;
>   
> -	if (!(from & (PAGE_SIZE - 1)) && !cache_only)
> +	if (!(from & (F2FS_BLKSIZE(sbi) - 1)) && !cache_only)

F2FS_BLKSIZE_MASK(sbi)

>   		return 0;
>   
>   	if (cache_only) {
> -		folio = filemap_lock_folio(mapping, index);
> +		folio = filemap_lock_folio(mapping, f_index);
>   		if (IS_ERR(folio))
>   		       return 0;
>   		if (folio_test_uptodate(folio))
> @@ -837,7 +884,7 @@ static int truncate_partial_data_page(struct inode *inode, u64 from,
>   		return 0;
>   	}
>   
> -	folio = f2fs_get_lock_data_folio(inode, index, true);
> +	folio = f2fs_get_lock_data_folio(inode, bidx, true);
>   	if (IS_ERR(folio))
>   		return PTR_ERR(folio) == -ENOENT ? 0 : PTR_ERR(folio);
>   truncate_out:
> @@ -848,14 +895,15 @@ static int truncate_partial_data_page(struct inode *inode, u64 from,
>   	folio_zero_segment(folio, folio_off, blk_end);
>   
>   	/* An encrypted inode should have a key and truncate the last page. */
> -	f2fs_bug_on(F2FS_I_SB(inode), cache_only && IS_ENCRYPTED(inode));
> +	f2fs_bug_on(sbi, cache_only && IS_ENCRYPTED(inode));
>   	if (!cache_only) {
>   		/*
>   		 * The folio was read back above, so the subpage is
> -		 * already uptodate and dirty data stays valid.
> +		 * already uptodate and dirty data stays valid. Mark only
> +		 * the block holding the new EOF dirty.
>   		 */
>   		f2fs_ffs_mark_subrange_dirty(folio, folio_off,
> -				blk_end - folio_off);
> +			round_up(folio_off, F2FS_BLKSIZE(sbi)) - folio_off);
>   		folio_mark_dirty(folio);
>   	}
>   	f2fs_folio_put(folio, true);
> @@ -944,9 +992,9 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
>   	if (lock)
>   		f2fs_unlock_op(sbi, &lc);
>   free_partial:
> -	/* lastly zero out the first data page */
> +	/* lastly zero out the first data block */
>   	if (!err)
> -		err = truncate_partial_data_page(inode, from, truncate_page);
> +		err = truncate_partial_data_block(inode, from, truncate_page);

s/truncate_page/truncate_block ?

Thanks,

>   out_err:
>   	trace_f2fs_truncate_blocks_exit(inode, err);
>   	return err;
> @@ -1310,7 +1358,7 @@ const struct inode_operations f2fs_file_inode_operations = {
>   	.fileattr_set	= f2fs_fileattr_set,
>   };
>   
> -static int fill_zero(struct inode *inode, pgoff_t index,
> +static int fill_zero(struct inode *inode, pgoff_t bidx,
>   					loff_t start, loff_t len)
>   {
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> @@ -1324,15 +1372,14 @@ static int fill_zero(struct inode *inode, pgoff_t index,
>   	f2fs_balance_fs(sbi, true);
>   
>   	f2fs_lock_op(sbi, &lc);
> -	folio = f2fs_get_new_data_folio(inode, NULL, index, false);
> +	folio = f2fs_get_new_data_folio(inode, NULL, bidx, false);
>   	f2fs_unlock_op(sbi, &lc);
>   
>   	if (IS_ERR(folio))
>   		return PTR_ERR(folio);
>   
>   	f2fs_folio_wait_writeback(folio, true, true);
> -	folio_off = offset_in_folio(folio,
> -				   (loff_t)index << PAGE_SHIFT) + start;
> +	folio_off = f2fs_folio_byte_offset(sbi, folio, bidx) + start;
>   	folio_zero_range(folio, folio_off, len);
>   	/*
>   	 * This subpage must be uptodate here, which is guaranteed by
> @@ -1344,41 +1391,68 @@ static int fill_zero(struct inode *inode, pgoff_t index,
>   	return 0;
>   }
>   
> -int f2fs_truncate_hole(struct inode *inode, pgoff_t pg_start, pgoff_t pg_end)
> +int f2fs_truncate_hole(struct inode *inode, pgoff_t blk_start, pgoff_t blk_end)
>   {
>   	int err;
>   
> -	while (pg_start < pg_end) {
> +	while (blk_start < blk_end) {
>   		struct dnode_of_data dn;
>   		pgoff_t end_offset, count;
>   
>   		set_new_dnode(&dn, inode, NULL, NULL, 0);
> -		err = f2fs_get_dnode_of_data(&dn, pg_start, LOOKUP_NODE);
> +		err = f2fs_get_dnode_of_data(&dn, blk_start, LOOKUP_NODE);
>   		if (err) {
>   			if (err == -ENOENT) {
> -				pg_start = f2fs_get_next_block_offset(&dn,
> -								pg_start);
> +				blk_start = f2fs_get_next_block_offset(&dn,
> +								blk_start);
>   				continue;
>   			}
>   			return err;
>   		}
>   
>   		end_offset = ADDRS_PER_PAGE(dn.node_entry, inode);
> -		count = min(end_offset - dn.ofs_in_node, pg_end - pg_start);
> +		count = min(end_offset - dn.ofs_in_node, blk_end - blk_start);
>   
>   		f2fs_bug_on(F2FS_I_SB(inode), count == 0 || count > end_offset);
>   
>   		f2fs_truncate_data_blocks_range(&dn, count);
>   		f2fs_put_dnode(&dn);
>   
> -		pg_start += count;
> +		blk_start += count;
>   	}
>   	return 0;
>   }
>   
> +/*
> + * unmap_mapping_range() computes page count solely from holelen, which causes
> + * under-unmapping when start is not PAGE_SIZE aligned. Outward-align to PAGE_SIZE
> + * to guarantee all overlapping base pages are unmapped.
> + *
> + * Then truncate the page cache without truncate_pagecache_range(), whose own
> + * unmap underflows when the range ends in the first page and unmaps the rest
> + * of the file.
> + */
> +static void f2fs_truncate_pagecache_range(struct inode *inode,
> +					  loff_t start, loff_t end)
> +{
> +	struct address_space *mapping = inode->i_mapping;
> +	loff_t unmap_start, unmap_len;
> +
> +	if (!f2fs_has_subpage_blocks(F2FS_I_SB(inode))) {
> +		truncate_pagecache_range(inode, start, end - 1);
> +		return;
> +	}
> +
> +	unmap_start = round_down(start, PAGE_SIZE);
> +	unmap_len = round_up(end, PAGE_SIZE) - unmap_start;
> +	unmap_mapping_range(mapping, unmap_start, unmap_len, 0);
> +	truncate_inode_pages_range(mapping, start, end - 1);
> +}
> +
>   static int f2fs_punch_hole(struct inode *inode, loff_t offset, loff_t len)
>   {
> -	pgoff_t pg_start, pg_end;
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	pgoff_t blk_start, blk_end;
>   	loff_t off_start, off_end;
>   	int ret;
>   
> @@ -1390,47 +1464,46 @@ static int f2fs_punch_hole(struct inode *inode, loff_t offset, loff_t len)
>   	if (ret)
>   		return ret;
>   
> -	pg_start = ((unsigned long long) offset) >> PAGE_SHIFT;
> -	pg_end = ((unsigned long long) offset + len) >> PAGE_SHIFT;
> +	blk_start = F2FS_BYTES_TO_BLK(sbi, offset);
> +	blk_end = F2FS_BYTES_TO_BLK(sbi, offset + len);
>   
> -	off_start = offset & (PAGE_SIZE - 1);
> -	off_end = (offset + len) & (PAGE_SIZE - 1);
> +	off_start = offset & F2FS_BLKSIZE_MASK(sbi);
> +	off_end = (offset + len) & F2FS_BLKSIZE_MASK(sbi);
>   
> -	if (pg_start == pg_end) {
> -		ret = fill_zero(inode, pg_start, off_start,
> +	if (blk_start == blk_end) {
> +		ret = fill_zero(inode, blk_start, off_start,
>   						off_end - off_start);
>   		if (ret)
>   			return ret;
>   	} else {
>   		if (off_start) {
> -			ret = fill_zero(inode, pg_start++, off_start,
> -						PAGE_SIZE - off_start);
> +			ret = fill_zero(inode, blk_start++, off_start,
> +						F2FS_BLKSIZE(sbi) - off_start);
>   			if (ret)
>   				return ret;
>   		}
>   		if (off_end) {
> -			ret = fill_zero(inode, pg_end, 0, off_end);
> +			ret = fill_zero(inode, blk_end, 0, off_end);
>   			if (ret)
>   				return ret;
>   		}
>   
> -		if (pg_start < pg_end) {
> -			loff_t blk_start, blk_end;
> -			struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +		if (blk_start < blk_end) {
> +			loff_t byte_start, byte_end;
>   			struct f2fs_lock_context lc;
>   
>   			f2fs_balance_fs(sbi, true);
>   
> -			blk_start = (loff_t)pg_start << PAGE_SHIFT;
> -			blk_end = (loff_t)pg_end << PAGE_SHIFT;
> +			byte_start = F2FS_BLK_TO_BYTES(sbi, blk_start);
> +			byte_end = F2FS_BLK_TO_BYTES(sbi, blk_end);
>   
>   			f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>   			filemap_invalidate_lock(inode->i_mapping);
>   
> -			truncate_pagecache_range(inode, blk_start, blk_end - 1);
> +			f2fs_truncate_pagecache_range(inode, byte_start, byte_end);
>   
>   			f2fs_lock_op(sbi, &lc);
> -			ret = f2fs_truncate_hole(inode, pg_start, pg_end);
> +			ret = f2fs_truncate_hole(inode, blk_start, blk_end);
>   			f2fs_unlock_op(sbi, &lc);
>   
>   			filemap_invalidate_unlock(inode->i_mapping);
> @@ -1621,7 +1694,7 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
>   			f2fs_folio_wait_writeback(fdst, true, true);
>   			memcpy_folio(fdst, dst_off, fsrc, src_off,
>   				    F2FS_BLKSIZE(sbi));
> -			if (folio_test_large(fdst)) {
> +			if (f2fs_is_multiblock_folio(sbi, fdst)) {
>   				f2fs_ffs_mark_subrange_uptodate(fdst,
>   						dst_off, F2FS_BLKSIZE(sbi));
>   				f2fs_ffs_mark_subrange_dirty(fdst, dst_off,
> @@ -1830,7 +1903,7 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
>   {
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   	struct address_space *mapping = inode->i_mapping;
> -	pgoff_t index, pg_start, pg_end;
> +	pgoff_t blk_start, blk_end;
>   	loff_t new_size = i_size_read(inode);
>   	loff_t off_start, off_end;
>   	int ret = 0;
> @@ -1851,31 +1924,33 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
>   	if (ret)
>   		return ret;
>   
> -	pg_start = ((unsigned long long) offset) >> PAGE_SHIFT;
> -	pg_end = ((unsigned long long) offset + len) >> PAGE_SHIFT;
> +	blk_start = F2FS_BYTES_TO_BLK(sbi, offset);
> +	blk_end = F2FS_BYTES_TO_BLK(sbi, offset + len);
>   
> -	off_start = offset & (PAGE_SIZE - 1);
> -	off_end = (offset + len) & (PAGE_SIZE - 1);
> +	off_start = offset & F2FS_BLKSIZE_MASK(sbi);
> +	off_end = (offset + len) & F2FS_BLKSIZE_MASK(sbi);
>   
> -	if (pg_start == pg_end) {
> -		ret = fill_zero(inode, pg_start, off_start,
> +	if (blk_start == blk_end) {
> +		ret = fill_zero(inode, blk_start, off_start,
>   						off_end - off_start);
>   		if (ret)
>   			return ret;
>   
>   		new_size = max_t(loff_t, new_size, offset + len);
>   	} else {
> +		pgoff_t index;
> +
>   		if (off_start) {
> -			ret = fill_zero(inode, pg_start++, off_start,
> -						PAGE_SIZE - off_start);
> +			ret = fill_zero(inode, blk_start++, off_start,
> +						F2FS_BLKSIZE(sbi) - off_start);
>   			if (ret)
>   				return ret;
>   
>   			new_size = max_t(loff_t, new_size,
> -					(loff_t)pg_start << PAGE_SHIFT);
> +					F2FS_BLK_TO_BYTES(sbi, blk_start));
>   		}
>   
> -		for (index = pg_start; index < pg_end;) {
> +		for (index = blk_start; index < blk_end;) {
>   			struct dnode_of_data dn;
>   			struct f2fs_lock_context lc;
>   			unsigned int end_offset;
> @@ -1884,9 +1959,9 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
>   			f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>   			filemap_invalidate_lock(mapping);
>   
> -			truncate_pagecache_range(inode,
> -				(loff_t)index << PAGE_SHIFT,
> -				((loff_t)pg_end << PAGE_SHIFT) - 1);
> +			f2fs_truncate_pagecache_range(inode,
> +				F2FS_BLK_TO_BYTES(sbi, index),
> +				F2FS_BLK_TO_BYTES(sbi, blk_end));
>   
>   			f2fs_lock_op(sbi, &lc);
>   
> @@ -1900,7 +1975,7 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
>   			}
>   
>   			end_offset = ADDRS_PER_PAGE(dn.node_entry, inode);
> -			end = min(pg_end, end_offset - dn.ofs_in_node + index);
> +			end = min(blk_end, end_offset - dn.ofs_in_node + index);
>   
>   			ret = f2fs_do_zero_range(&dn, index, end);
>   			f2fs_put_dnode(&dn);
> @@ -1916,11 +1991,11 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
>   
>   			index = end;
>   			new_size = max_t(loff_t, new_size,
> -					(loff_t)index << PAGE_SHIFT);
> +					F2FS_BLK_TO_BYTES(sbi, index));
>   		}
>   
>   		if (off_end) {
> -			ret = fill_zero(inode, pg_end, 0, off_end);
> +			ret = fill_zero(inode, blk_end, 0, off_end);
>   			if (ret)
>   				goto out;
>   
> @@ -1930,10 +2005,14 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
>   
>   out:
>   	if (new_size > i_size_read(inode)) {
> -		if (mode & FALLOC_FL_KEEP_SIZE)
> +		if (mode & FALLOC_FL_KEEP_SIZE) {
>   			file_set_keep_isize(inode);
> -		else
> +		} else {
> +			loff_t old_size = i_size_read(inode);
> +
>   			f2fs_i_size_write(inode, new_size);
> +			pagecache_isize_extended(inode, old_size, new_size);
> +		}
>   	}
>   	return ret;
>   }
> @@ -2034,7 +2113,7 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
>   			.should_migrate_blocks = false,
>   			.err_gc_skipped = true,
>   			.nr_free_secs = 0 };
> -	pgoff_t pg_start, pg_end;
> +	pgoff_t blk_start, blk_end;
>   	loff_t new_size;
>   	loff_t off_end;
>   	block_t expanded = 0;
> @@ -2054,12 +2133,12 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
>   
>   	f2fs_balance_fs(sbi, true);
>   
> -	pg_start = ((unsigned long long)offset) >> PAGE_SHIFT;
> -	pg_end = ((unsigned long long)offset + len) >> PAGE_SHIFT;
> -	off_end = (offset + len) & (PAGE_SIZE - 1);
> +	blk_start = F2FS_BYTES_TO_BLK(sbi, offset);
> +	blk_end = F2FS_BYTES_TO_BLK(sbi, offset + len);
> +	off_end = (offset + len) & F2FS_BLKSIZE_MASK(sbi);
>   
> -	map.m_lblk = pg_start;
> -	map.m_len = pg_end - pg_start;
> +	map.m_lblk = blk_start;
> +	map.m_len = blk_end - blk_start;
>   	if (off_end)
>   		map.m_len++;
>   
> @@ -2071,9 +2150,9 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
>   		block_t sec_len;
>   
>   		if (map.m_lblk % sec_blks) {
> -			pg_start = rounddown(map.m_lblk, sec_blks);
> -			map.m_lblk = pg_start;
> -			map.m_len = pg_end - pg_start;
> +			blk_start = rounddown(map.m_lblk, sec_blks);
> +			map.m_lblk = blk_start;
> +			map.m_len = blk_end - blk_start;
>   			if (off_end)
>   				map.m_len++;
>   		}
> @@ -2089,7 +2168,7 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
>   				f2fs_warn_ratelimited(sbi,
>   					"ino:%llu, start:%lu, end:%lu, need to trigger GC to "
>   					"reclaim enough free segment when checkpoint is enabled",
> -					inode->i_ino, pg_start, pg_end);
> +					inode->i_ino, blk_start, blk_end);
>   				goto out_err;
>   			}
>   		}
> @@ -2135,20 +2214,24 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
>   		if (!expanded)
>   			return err;
>   
> -		last_off = pg_start + expanded - 1;
> +		last_off = blk_start + expanded - 1;
>   
>   		/* update new size to the failed position */
> -		new_size = (last_off == pg_end) ? offset + len :
> -					(loff_t)(last_off + 1) << PAGE_SHIFT;
> +		new_size = (last_off == blk_end) ? offset + len :
> +					F2FS_BLK_TO_BYTES(sbi, last_off + 1);
>   	} else {
> -		new_size = ((loff_t)pg_end << PAGE_SHIFT) + off_end;
> +		new_size = F2FS_BLK_TO_BYTES(sbi, blk_end) + off_end;
>   	}
>   
>   	if (new_size > i_size_read(inode)) {
> -		if (mode & FALLOC_FL_KEEP_SIZE)
> +		if (mode & FALLOC_FL_KEEP_SIZE) {
>   			file_set_keep_isize(inode);
> -		else
> +		} else {
> +			loff_t old_size = i_size_read(inode);
> +
>   			f2fs_i_size_write(inode, new_size);
> +			pagecache_isize_extended(inode, old_size, new_size);
> +		}
>   	}
>   
>   	return err;
> @@ -5758,8 +5841,12 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
>   
>   	if (ret < 0)
>   		goto out;
> -	if (pos + ret > inode->i_size)
> +	if (pos + ret > inode->i_size) {
> +		loff_t old_size = inode->i_size;
> +
>   		f2fs_i_size_write(inode, pos + ret);
> +		pagecache_isize_extended(inode, old_size, pos + ret);
> +	}
>   	if (!do_opu)
>   		set_inode_flag(inode, FI_UPDATE_WRITE);
>   

