Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793791484;
	b=B7AHfkxXRP0xe4aLOyN+O9kcU86b53Alow60/oJCPmPpqCIkTcJAo/X1inO2sgBlmpWf
	 p0im4gWvCXctpjM4QbNkCWqT/B6LHkmEbX6heIcQOPsOBJHcvCeN/rO/4PhD14+q8LuGg
	 9iMFGbCMO7uViT5kNfOln+XvygIqzjZ+lwdneN/q+RrjPn/h1MHca0NydHtIqG22qmYY3
	 9R+kpYDZJk9N4pdc9EKlvmMr9cdEYUx8bk4cwapsTVzmQn3K7r9Ll34izqFD86pF1iSEe
	 9oljtA6Xf6yjlCC1hjIK0vGckrwKq+RyUt4DJas7o8pgw7MMp+qMB6m/8TQhiY5V5Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791484;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yYfc6qIJf0zgcdugxMKsYNadr8ul1ATfMksRxunTrnw=;
	b=XgHlRTCfmYj7H1K3WapOS113Eh0imbYv66U0RYt8KIxEHhhXobitHT/qXV0rbuaRj3Lb
	 xlJHuLYXi+Y51fF/1FSjV+O6krNOqqfGxTtg8GAFnVtGCAW8SPFlv+AS37qrMJqDSTAeF
	 +NfqCAeB69yJxjeeD2dlxIZ5yZtFPIKPqL3lUU0JDctZ8TMVmwKcTW5urZzcoAf6e9dqU
	 hRfphlVYFAgH7ABGUihO5y0Z7L37XOjarqJw5iLRU19dtp+nWAgffXiSgfnwU1MoJE3/I
	 WNMih89DrENBoWL4GuyXQooBOgMe1qHgPNtr63qeiSR6hOvxyyWdGXkFhlB6gYGxHrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WCjOtnvW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98AD606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WCjOtnvW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB801F000C1;
	Wed,  4 Nov 2026 11:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793791483;
	bh=yYfc6qIJf0zgcdugxMKsYNadr8ul1ATfMksRxunTrnw=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=WCjOtnvWIqUi4yXdLPDoE0incKouGPh9h+P9i/Ag2kcmXHRuz1CCDJBhAF1FKZnlF
	 GRDCHHGdOzeWgxgWbO/lInlkR6lcyevU2LqNw0R6v3MRMS6DJG+Kbv/O9sgQgENGsR
	 GDOLcHryJuQ5wY0zhTpq7ADIBNKE8CD1XwcJ7BazYCaWMZxbNzBI/Ivl9BR5VtxGZS
	 aRbnzV0nwNZrYKUKfDIbKEbKAk3r//ziPeSfEmf7u6b4Z00fodEnVJpq59h3OOoHp4
	 6GGapbIclPAU3OnhcDZtC0YSG2CbVy03sbznS+0XAmurz53nmy+4IirJ/+OG0B4t2b
	 nlvCfN4VUZP0g==
Message-ID: <c9338038-0eae-457a-a04e-06615354ddd4@kernel.org>
Date: Wed, 4 Nov 2026 19:24:40 +0800
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
Subject: Re: [f2fs-dev] [PATCH 05/20] f2fs: convert inode dirty page counters
 to dirty block counters
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261102193952.3002018-1-daeho43@gmail.com>
 <20261102193952.3002018-6-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261102193952.3002018-6-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/26 03:39, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> The per-inode dirty counter is compared against block based thresholds
> such as min_fsync_blocks and BLKS_PER_SEG, so with subpage blocks it
> has to count blocks instead of pages. Rename it to dirty_blocks, make
> its helpers take block counts, and convert to pages where it is
> compared with page based values. The conversions are no-ops when the
> block size equals PAGE_SIZE.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  fs/f2fs/checkpoint.c |  4 ++--
>  fs/f2fs/data.c       | 13 +++++++------
>  fs/f2fs/f2fs.h       | 36 +++++++++++++++++-------------------
>  fs/f2fs/file.c       | 16 ++++++++--------
>  fs/f2fs/inode.c      |  2 +-
>  fs/f2fs/node.c       |  3 ++-
>  fs/f2fs/super.c      |  2 +-
>  7 files changed, 38 insertions(+), 38 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 158d97fc349a..1060ee651756 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1316,7 +1316,7 @@ static void __remove_dirty_inode(struct inode *inode, enum inode_type type)
>  {
>  	int flag = (type == DIR_INODE) ? FI_DIRTY_DIR : FI_DIRTY_FILE;
>  
> -	if (get_dirty_pages(inode) || !is_inode_flag_set(inode, flag))
> +	if (get_dirty_blocks(inode) || !is_inode_flag_set(inode, flag))
>  		return;
>  
>  	list_del_init(&F2FS_I(inode)->dirty_list);
> @@ -1325,7 +1325,7 @@ static void __remove_dirty_inode(struct inode *inode, enum inode_type type)
>  }
>  
>  /*
> - * Account @nr dirty pages (negative when dirtiness is cleared) for @inode.
> + * Account @nr dirty blocks (negative when dirtiness is cleared) for @inode.
>   */
>  void f2fs_account_dirty_blocks(struct inode *inode, int nr)
>  {
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index e983b59e4a65..f2254e872a3d 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -4282,7 +4282,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  
>  	folio_batch_init(&fbatch);
>  
> -	if (get_dirty_pages(mapping->host) <=
> +	if (get_dirty_blocks(mapping->host) <=
>  				SM_I(F2FS_M_SB(mapping))->min_hot_blocks)
>  		set_inode_flag(mapping->host, FI_HOT_DATA);
>  	else
> @@ -4527,7 +4527,7 @@ static int f2fs_write_cache_folios(struct address_space *mapping,
>  	bool op_locked = false;
>  	bool retry = false;
>  
> -	if (get_dirty_pages(inode) <= SM_I(sbi)->min_hot_blocks)
> +	if (get_dirty_blocks(inode) <= SM_I(sbi)->min_hot_blocks)
>  		set_inode_flag(inode, FI_HOT_DATA);
>  	else
>  		clear_inode_flag(inode, FI_HOT_DATA);
> @@ -4791,7 +4791,7 @@ static inline bool __should_serialize_io(struct inode *inode,
>  		return true;
>  	if (wbc->sync_mode != WB_SYNC_ALL)
>  		return true;
> -	if (get_dirty_pages(inode) >= SM_I(F2FS_I_SB(inode))->min_seq_blocks)
> +	if (get_dirty_blocks(inode) >= SM_I(F2FS_I_SB(inode))->min_seq_blocks)
>  		return true;
>  	return false;
>  }
> @@ -4830,7 +4830,7 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
>  	bool locked = false;
>  
>  	/* skip writing if there is no dirty page in this inode */
> -	if (!get_dirty_pages(inode) && wbc->sync_mode == WB_SYNC_NONE)
> +	if (!get_dirty_blocks(inode) && wbc->sync_mode == WB_SYNC_NONE)
>  		return 0;
>  
>  	/* during POR, we don't need to trigger writepage at all. */
> @@ -4839,7 +4839,7 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
>  
>  	if ((S_ISDIR(inode->i_mode) || IS_NOQUOTA(inode)) &&
>  			wbc->sync_mode == WB_SYNC_NONE &&
> -			get_dirty_pages(inode) < nr_caches_to_skip(sbi, DATA) &&
> +			get_dirty_blocks(inode) < nr_caches_to_skip(sbi, DATA) &&
>  			f2fs_available_free_memory(sbi, DIRTY_DENTS))
>  		goto skip_write;
>  
> @@ -4898,7 +4898,8 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
>  	return ret;
>  
>  skip_write:
> -	wbc->pages_skipped += get_dirty_pages(inode);
> +	wbc->pages_skipped += get_dirty_blocks(inode) >>
> +					F2FS_LOG_BLKS_PER_PAGE(sbi);

It seems not accurate here? because all dirty blocks can locates in one page or spread
in several pages? not sure, it's worth to keep both dirty_{pages,blocks}, it's complicate
to maintain both of them, or can we add a comments here at least to describe the issue,
if no further issue was found w/ current approach.

>  	update_skipped_write(sbi, wbc);
>  	trace_f2fs_writepages(mapping->host, wbc, DATA);
>  	return 0;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 3822824326d7..bc67416a6663 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -957,7 +957,7 @@ struct f2fs_inode_info {
>  	unsigned long flags[BITS_TO_LONGS(FI_MAX)];	/* use to pass per-file flags */
>  	unsigned int ioprio_hint;	/* hint for IO priority */
>  	struct f2fs_rwsem i_sem;	/* protect fi info */
> -	atomic_t dirty_pages;		/* # of dirty pages */
> +	atomic_t dirty_blocks;		/* # of dirty blocks */
>  	f2fs_hash_t chash;		/* hash value of given file name */
>  	unsigned int clevel;		/* maximum level of given file name */
>  	struct task_struct *task;	/* lookup and create consistency */
> @@ -2336,6 +2336,8 @@ static inline unsigned int f2fs_blocks_per_folio(struct f2fs_sb_info *sbi,
>  	return folio_size(folio) >> sbi->log_blocksize;
>  }
>  
> +#define F2FS_LOG_BLKS_PER_PAGE(sbi)	(PAGE_SHIFT - (sbi)->log_blocksize)
> +
>  static inline bool f2fs_has_subpage_blocks(struct f2fs_sb_info *sbi)
>  {
>  	return F2FS_BLKSIZE(sbi) < PAGE_SIZE;
> @@ -2979,40 +2981,36 @@ static inline void dec_cache_count(struct f2fs_sb_info *sbi, int count_type)
>  	sub_cache_counts(sbi, count_type, 1);
>  }
>  
> -/*
> - * Account @nr dirty pages for @inode; one page is
> - * (PAGE_SIZE >> log_blocksize) filesystem blocks.
> - */
> -static inline void inode_add_dirty_blocks(struct inode *inode, int nr)
> +static inline void inode_add_dirty_blocks(struct inode *inode,
> +					  unsigned int nr_blocks)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> -	int blocks = nr * (PAGE_SIZE >> sbi->log_blocksize);
>  
> -	atomic_add(blocks, &F2FS_I(inode)->dirty_pages);
> +	atomic_add(nr_blocks, &F2FS_I(inode)->dirty_blocks);
>  	if (S_ISDIR(inode->i_mode))
> -		add_cache_counts(sbi, F2FS_DIRTY_DENTS, blocks);
> +		add_cache_counts(sbi, F2FS_DIRTY_DENTS, nr_blocks);
>  	else
> -		add_cache_counts(sbi, F2FS_DIRTY_DATA, blocks);
> +		add_cache_counts(sbi, F2FS_DIRTY_DATA, nr_blocks);
>  	if (IS_NOQUOTA(inode))
> -		add_cache_counts(sbi, F2FS_DIRTY_QDATA, blocks);
> +		add_cache_counts(sbi, F2FS_DIRTY_QDATA, nr_blocks);
>  }
>  
> -static inline void inode_sub_dirty_blocks(struct inode *inode, int nr)
> +static inline void inode_sub_dirty_blocks(struct inode *inode,
> +					  unsigned int nr_blocks)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> -	int blocks = nr * (PAGE_SIZE >> sbi->log_blocksize);
>  
>  	if (!S_ISDIR(inode->i_mode) && !S_ISREG(inode->i_mode) &&
>  			!S_ISLNK(inode->i_mode))
>  		return;
>  
> -	atomic_sub(blocks, &F2FS_I(inode)->dirty_pages);
> +	atomic_sub(nr_blocks, &F2FS_I(inode)->dirty_blocks);
>  	if (S_ISDIR(inode->i_mode))
> -		sub_cache_counts(sbi, F2FS_DIRTY_DENTS, blocks);
> +		sub_cache_counts(sbi, F2FS_DIRTY_DENTS, nr_blocks);
>  	else
> -		sub_cache_counts(sbi, F2FS_DIRTY_DATA, blocks);
> +		sub_cache_counts(sbi, F2FS_DIRTY_DATA, nr_blocks);
>  	if (IS_NOQUOTA(inode))
> -		sub_cache_counts(sbi, F2FS_DIRTY_QDATA, blocks);
> +		sub_cache_counts(sbi, F2FS_DIRTY_QDATA, nr_blocks);
>  }
>  
>  static inline void inode_inc_dirty_block(struct inode *inode)
> @@ -3052,9 +3050,9 @@ static inline s64 get_nr_caches(struct f2fs_sb_info *sbi, int count_type)
>  	return atomic_read(&sbi->nr_caches[count_type]);
>  }
>  
> -static inline int get_dirty_pages(struct inode *inode)
> +static inline int get_dirty_blocks(struct inode *inode)
>  {
> -	return atomic_read(&F2FS_I(inode)->dirty_pages);
> +	return atomic_read(&F2FS_I(inode)->dirty_blocks);
>  }
>  
>  static inline int get_blocktype_secs(struct f2fs_sb_info *sbi, int block_type)
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index e339cfd84b27..97c052b98559 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -376,7 +376,7 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
>  		goto go_write;
>  
>  	/* if fdatasync is triggered, let's do in-place-update */
> -	if (datasync || get_dirty_pages(inode) <= SM_I(sbi)->min_fsync_blocks)
> +	if (datasync || get_dirty_blocks(inode) <= SM_I(sbi)->min_fsync_blocks)
>  		set_inode_flag(inode, FI_NEED_IPU);
>  	ret = file_write_and_wait_range(file, start, end);
>  	clear_inode_flag(inode, FI_NEED_IPU);
> @@ -2495,9 +2495,9 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
>  	 * Should wait end_io to count F2FS_WB_CP_DATA correctly by
>  	 * f2fs_is_atomic_file.
>  	 */
> -	if (get_dirty_pages(inode))
> -		f2fs_warn(sbi, "Unexpected flush for atomic writes: ino=%llu, npages=%u",
> -			  inode->i_ino, get_dirty_pages(inode));
> +	if (get_dirty_blocks(inode))
> +		f2fs_warn(sbi, "Unexpected flush for atomic writes: ino=%llu, nblocks=%u",
> +			  inode->i_ino, get_dirty_blocks(inode));
>  	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
>  	if (ret)
>  		goto out_unlock;
> @@ -2519,7 +2519,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
>  		F2FS_I(fi->cow_inode)->atomic_inode = inode;
>  	} else {
>  		/* Reuse the already created COW inode */
> -		f2fs_bug_on(sbi, get_dirty_pages(fi->cow_inode));
> +		f2fs_bug_on(sbi, get_dirty_blocks(fi->cow_inode));
>  
>  		invalidate_mapping_pages(fi->cow_inode->i_mapping, 0, -1);
>  
> @@ -4877,7 +4877,7 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
>  		goto out;
>  	}
>  
> -	if (f2fs_is_mmap_file(inode) || get_dirty_pages(inode)) {
> +	if (f2fs_is_mmap_file(inode) || get_dirty_blocks(inode)) {
>  		ret = -EBUSY;
>  		goto out;
>  	}
> @@ -5033,7 +5033,7 @@ static int f2fs_ioc_decompress_file(struct file *filp)
>  		if (ret < 0)
>  			break;
>  
> -		if (get_dirty_pages(inode) >= BLKS_PER_SEG(sbi)) {
> +		if (get_dirty_blocks(inode) >= BLKS_PER_SEG(sbi)) {
>  			ret = filemap_fdatawrite(inode->i_mapping);
>  			if (ret < 0)
>  				break;
> @@ -5123,7 +5123,7 @@ static int f2fs_ioc_compress_file(struct file *filp)
>  		if (ret < 0)
>  			break;
>  
> -		if (get_dirty_pages(inode) >= BLKS_PER_SEG(sbi)) {
> +		if (get_dirty_blocks(inode) >= BLKS_PER_SEG(sbi)) {
>  			ret = filemap_fdatawrite(inode->i_mapping);
>  			if (ret < 0)
>  				break;
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index f5a4dac98ef2..5c6a64b31b05 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -872,7 +872,7 @@ static void f2fs_pre_evict_inode(struct inode *inode)
>  	    test_opt(sbi, COMPRESS_CACHE) && f2fs_compressed_file(inode))
>  		f2fs_invalidate_compress_pages(sbi, inode->i_ino);
>  
> -	f2fs_bug_on(sbi, get_dirty_pages(inode));
> +	f2fs_bug_on(sbi, get_dirty_blocks(inode));
>  	f2fs_remove_dirty_inode(inode);
>  	f2fs_remove_donate_inode(inode);
>  
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index e53871f32c35..cb8affb2c1e0 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -85,7 +85,8 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
>  	} else if (type == DIRTY_DENTS) {
>  		if (bdi_wb_dirty_exceeded(sbi->sb->s_bdi))
>  			return false;
> -		mem_size = get_nr_caches(sbi, F2FS_DIRTY_DENTS);
> +		mem_size = get_nr_caches(sbi, F2FS_DIRTY_DENTS) >>
> +					F2FS_LOG_BLKS_PER_PAGE(sbi);

It loses accurate here as well.

Thanks,

>  		res = mem_size < ((avail_ram * nm_i->ram_thresh / 100) >> 1);
>  	} else if (type == INO_ENTRIES) {
>  		int i;
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index f34558b661eb..fa74564adcfb 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1855,7 +1855,7 @@ static struct inode *f2fs_alloc_inode(struct super_block *sb)
>  	init_once((void *) fi);
>  
>  	/* Initialize f2fs-specific inode info */
> -	atomic_set(&fi->dirty_pages, 0);
> +	atomic_set(&fi->dirty_blocks, 0);
>  	atomic_set(&fi->i_compr_blocks, 0);
>  	atomic_set(&fi->open_count, 0);
>  	atomic_set(&fi->writeback, 0);

