Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790787;
	b=DKnfEYQxkqka5wcUbmpKuFzZtBlOvfQLsOoQSXuXrbAOMBmS3VIbgMVtF5mdDQy9Sm2u
	 dan14oRmwch9yvTK0pbcK1P2i7RMzcxqP1rvSgx7zpTov5OgqoMqtZ8XHjGJ23XtBWJij
	 bItuOocezL0sZLkR/uWLAx7HZ77T0GXVIPi8e6/AWpZzi6y012TvYS2QA4is4Jl+7nduZ
	 3jvVrT/elj0sm13BhlpruPvkn7zy9OIJKoPomskyjFSbPdahW000YtLAWwlgFcZ//RLF2
	 wJcAvMO3VO4kUdXmw1uBqK8FP1J7UvXETPODQNayrhiQKEwfjqjcORc+4mnLu/djHbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790787;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=vyZpc5+vZeCU+0YbT+Y0OwhtiWtaEkOrtE7aWiCWgK4=;
	b=38zC8l31moSuTHkeyssrKVmgcbYQUtBcTt3Ov3m/uzkCc+vzKJdUxSpd4acJugnqZ6VK
	 yF1fbbh9WtwyBpZumxZasMY2fqzUnoPQFp9wnY5ALAntVy2p8JJyGmVgpMFfw7ciV7vgP
	 9G5ttvw9nGV/ucZ4laLv/qiozblTlxRFMbc8ZNtYoKiB7CD72YsjdNvUxoCX9KHWTXoxb
	 Skx0/mQda+cHp898mjeTGXw6UgLMr6tSVtVskrjFXofqBeRAPw0Z0acha6xPgaYKqvx2r
	 ybpBKxmbYya7yjLAhPd9R19ioR3lZ8ZWmWxC8J0M5TfVrGtPonQkcUMKvxnjzK6eIPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ItNIRzeU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77AC606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ItNIRzeU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 644FD1F000C1;
	Wed,  4 Nov 2026 11:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793790786;
	bh=vyZpc5+vZeCU+0YbT+Y0OwhtiWtaEkOrtE7aWiCWgK4=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=ItNIRzeUCfLh7VLRjA7RqFdH2THL2WsDuFALEBn1ViJ/UAmrzrjvuVduLgaHG9UGD
	 uLU7WrNMUrT8YZfIh/atL8ivqynj7BZJ4urPCLUr4hKCSRxem9IO8hBAzFh32CZYWD
	 lQUzMZgh6Uvb21AH9q5E/YEeZZ2p8GjqFgJaHcJW2IlxDjiiywIm+mGGv0ZL1VYrjV
	 +JM6pFnC6/RDh+GId69/Dim7/bfPjAX43zGioDxgZsNbk2m/9hdfn+wvRc26nB69oZ
	 1HX/uYRTV+TdqXNOvrA94drCkaDn8eUmTPnL6BEel7abtzvA+Iv063SsLiDPIzx9Cc
	 WCll3/KlTeDDw==
Message-ID: <37b8dccd-f15f-4f19-b07a-db6b04b627a1@kernel.org>
Date: Wed, 4 Nov 2026 19:13:03 +0800
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
Subject: Re: [f2fs-dev] [PATCH 04/20] f2fs: support subpage blocks in
 directory operations
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261102193952.3002018-1-daeho43@gmail.com>
 <20261102193952.3002018-5-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261102193952.3002018-5-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/26 03:39, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> With subpage blocks, a directory folio holds several dentry blocks.
> Address a dentry block within its folio by its block index, and mark
> only the modified dentry block dirty. When an empty dentry block is
> freed, clear only the state of that block and keep the folio dirty if
> other blocks in it are still dirty.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  fs/f2fs/dir.c    | 120 +++++++++++++++++++++++++++++++++--------------
>  fs/f2fs/f2fs.h   |   2 +
>  fs/f2fs/inline.c |   6 +--
>  3 files changed, 89 insertions(+), 39 deletions(-)
> 
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index 3eb0b7255951..aa3511c6f8fe 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -37,6 +37,31 @@ static inline bool f2fs_should_fallback_to_linear(struct inode *dir)
>  extern struct kmem_cache *f2fs_cf_name_slab;
>  #endif
>  
> +static inline pgoff_t f2fs_dentry_to_lblk(struct f2fs_sb_info *sbi,
> +					  struct folio *folio, void *de)
> +{
> +	size_t off = round_down((size_t)(de - folio_address(folio)),
> +				(size_t)F2FS_BLKSIZE(sbi));
> +
> +	return f2fs_folio_lblk(sbi, folio) + (off >> sbi->log_blocksize);

return f2fs_folio_lblk(sbi, folio) + F2FS_BYTES_TO_BLK(sbi, off);

> +}
> +
> +void f2fs_mark_dentry_folio_dirty(struct inode *dir, struct folio *folio,
> +				  pgoff_t bidx)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
> +
> +	if (f2fs_has_subpage_blocks(sbi)) {
> +		size_t off = f2fs_folio_byte_offset(sbi, folio, bidx);
> +
> +		f2fs_ffs_mark_subrange_uptodate(folio, off, F2FS_BLKSIZE(sbi));
> +		f2fs_ffs_mark_subrange_dirty(folio, off, F2FS_BLKSIZE(sbi));
> +	} else if (!folio_test_uptodate(folio)) {
> +		folio_mark_uptodate(folio);
> +	}
> +	folio_mark_dirty(folio);
> +}
> +
>  static unsigned long dir_blocks(struct inode *inode)
>  {
>  	return F2FS_BYTES_TO_BLK(F2FS_I_SB(inode),
> @@ -190,15 +215,16 @@ static unsigned long dir_block_index(unsigned int level,
>  }
>  
>  static struct f2fs_dir_entry *find_in_block(struct inode *dir,
> -				struct folio *dentry_folio,
> +				struct folio *dentry_folio, pgoff_t bidx,
>  				const struct f2fs_filename *fname,
>  				int *max_slots,
>  				bool use_hash)
>  {
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
>  	void *dentry_blk;
>  	struct f2fs_dentry_ptr d;
>  
> -	dentry_blk = folio_address(dentry_folio);
> +	dentry_blk = f2fs_folio_lblk_address(sbi, dentry_folio, bidx);
>  
>  	make_dentry_ptr_block(dir, &d, dentry_blk);
>  	return f2fs_find_target_dentry(&d, fname, max_slots, use_hash);
> @@ -289,7 +315,7 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
>  	unsigned int nbucket, nblock;
>  	unsigned int bidx, end_block, bucket_no;
>  	struct f2fs_dir_entry *de = NULL;
> -	pgoff_t next_pgofs;
> +	pgoff_t next_blkofs;
>  	bool room = false;
>  	int max_slots;
>  
> @@ -306,11 +332,11 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
>  	while (bidx < end_block) {
>  		/* no need to allocate new dentry pages to all the indices */
>  		struct folio *dentry_folio;
> -		dentry_folio = f2fs_find_data_folio(dir, bidx, &next_pgofs);
> +		dentry_folio = f2fs_find_data_folio(dir, bidx, &next_blkofs);
>  		if (IS_ERR(dentry_folio)) {
>  			if (PTR_ERR(dentry_folio) == -ENOENT) {
>  				room = true;
> -				bidx = next_pgofs;
> +				bidx = next_blkofs;
>  				continue;
>  			} else {
>  				*dentry_block = dentry_folio;
> @@ -318,7 +344,8 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
>  			}
>  		}
>  
> -		de = find_in_block(dir, dentry_folio, fname, &max_slots, use_hash);
> +		de = find_in_block(dir, dentry_folio, bidx, fname, &max_slots,
> +				   use_hash);
>  		if (IS_ERR(de)) {
>  			f2fs_folio_put(dentry_folio, false);
>  			*dentry_block = ERR_CAST(de);
> @@ -354,7 +381,7 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
>  					 const struct f2fs_filename *fname,
>  					 void **dentry_block)
>  {
> -	unsigned long npages = dir_blocks(dir);
> +	unsigned long nblocks = dir_blocks(dir);
>  	struct f2fs_dir_entry *de = NULL;
>  	unsigned int max_depth;
>  	unsigned int level;
> @@ -370,7 +397,7 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
>  		goto out;
>  	}
>  
> -	if (npages == 0)
> +	if (nblocks == 0)
>  		goto out;
>  
>  	max_depth = F2FS_I(dir)->i_current_depth;
> @@ -468,7 +495,8 @@ void f2fs_set_link(struct inode *dir, struct f2fs_dir_entry *de,
>  		f2fs_folio_wait_writeback(folio, true, true);
>  		de->ino = cpu_to_le32(inode->i_ino);
>  		de->file_type = fs_umode_to_ftype(inode->i_mode);
> -		folio_mark_dirty(folio);
> +		f2fs_mark_dentry_folio_dirty(dir, folio,
> +				f2fs_dentry_to_lblk(F2FS_I_SB(dir), folio, de));
>  	}
>  
>  	inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
> @@ -539,12 +567,12 @@ static int make_empty_dir(struct inode *inode,
>  	if (IS_ERR(dentry_folio))
>  		return PTR_ERR(dentry_folio);
>  
> -	dentry_blk = folio_address(dentry_folio);
> +	dentry_blk = f2fs_folio_lblk_address(F2FS_I_SB(inode), dentry_folio, 0);
>  
>  	make_dentry_ptr_block(inode, &d, dentry_blk);
>  	f2fs_do_make_empty_dir(inode, parent, &d);
>  
> -	folio_mark_dirty(dentry_folio);
> +	f2fs_mark_dentry_folio_dirty(inode, dentry_folio, 0);
>  	f2fs_folio_put(dentry_folio, true);
>  	return 0;
>  }
> @@ -737,7 +765,8 @@ int f2fs_add_regular_entry(struct inode *dir, const struct f2fs_filename *fname,
>  		if (IS_ERR(dentry_folio))
>  			return PTR_ERR(dentry_folio);
>  
> -		dentry_blk = folio_address(dentry_folio);
> +		dentry_blk = f2fs_folio_lblk_address(F2FS_I_SB(dir),
> +						     dentry_folio, block);
>  		make_dentry_ptr_block(dir, &d, dentry_blk);
>  		bit_pos = f2fs_room_for_filename(d.bitmap, slots, d.max);
>  		if (bit_pos < d.max)
> @@ -764,7 +793,7 @@ int f2fs_add_regular_entry(struct inode *dir, const struct f2fs_filename *fname,
>  	f2fs_update_dentry(ino, mode, &d, &fname->disk_name, fname->hash,
>  			   bit_pos);
>  
> -	folio_mark_dirty(dentry_folio);
> +	f2fs_mark_dentry_folio_dirty(dir, dentry_folio, block);
>  
>  	if (inode) {
>  		f2fs_i_pino_write(inode, dir->i_ino);
> @@ -902,25 +931,28 @@ void f2fs_delete_entry(struct f2fs_dir_entry *dentry, void *dentry_block,
>  	struct folio *folio;
>  	unsigned int bit_pos;
>  	int slots = GET_DENTRY_SLOTS(le16_to_cpu(dentry->name_len));
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
> +	size_t block_offset;
>  	pgoff_t index;
>  	int i;
>  
> -	f2fs_update_time(F2FS_I_SB(dir), REQ_TIME);
> +	f2fs_update_time(sbi, REQ_TIME);
>  
> -	if (F2FS_OPTION(F2FS_I_SB(dir)).fsync_mode == FSYNC_MODE_STRICT)
> -		f2fs_add_ino_entry(F2FS_I_SB(dir), dir->i_ino, TRANS_DIR_INO);
> +	if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_STRICT)
> +		f2fs_add_ino_entry(sbi, dir->i_ino, TRANS_DIR_INO);
>  
>  	if (f2fs_has_inline_dentry(dir))
>  		return f2fs_delete_inline_entry(dentry,
>  				f2fs_dentry_cache(dentry_block), dir, inode);
>  
>  	folio = f2fs_dentry_folio(dentry_block);
> -	index = folio->index;
>  
>  	folio_lock(folio);
>  	f2fs_folio_wait_writeback(folio, true, true);
>  
> -	dentry_blk = folio_address(folio);
> +	index = f2fs_dentry_to_lblk(sbi, folio, dentry);
> +	block_offset = f2fs_folio_byte_offset(sbi, folio, index);
> +	dentry_blk = folio_address(folio) + block_offset;

Use f2fs_folio_lblk_address() for cleanup?

Thanks,

>  	make_dentry_ptr_block(dir, &d, dentry_blk);
>  	bit_pos = dentry - d.dentry;
>  	for (i = 0; i < slots; i++)
> @@ -928,18 +960,31 @@ void f2fs_delete_entry(struct f2fs_dir_entry *dentry, void *dentry_block,
>  
>  	/* Let's check and deallocate this dentry page */
>  	bit_pos = find_next_bit_le(d.bitmap, d.max, 0);
> -	folio_mark_dirty(folio);
> +	f2fs_mark_dentry_folio_dirty(dir, folio, index);
>  
>  	if (bit_pos == d.max &&
>  	    !f2fs_truncate_hole(dir, index, index + 1)) {
> +		if (f2fs_has_subpage_blocks(sbi)) {
> +			bool dirty;
> +
> +			dirty = f2fs_ffs_clear_subrange_dirty_and_test(folio,
> +					block_offset, F2FS_BLKSIZE(sbi));
> +			f2fs_ffs_clear_subrange_uptodate(folio, block_offset,
> +							 F2FS_BLKSIZE(sbi));
> +			if (dirty)
> +				goto keep_dirty;
> +		}
>  		f2fs_clear_page_cache_dirty_tag(folio);
>  		folio_clear_dirty_for_io(folio);
> -		folio_clear_uptodate(folio);
> -		folio_detach_private(folio);
> +		if (!f2fs_has_subpage_blocks(sbi)) {
> +			folio_clear_uptodate(folio);
> +			folio_detach_private(folio);
> +			inode_dec_dirty_block(dir);
> +		}
>  
> -		inode_dec_dirty_block(dir);
>  		f2fs_remove_dirty_inode(dir);
>  	}
> +keep_dirty:
>  	f2fs_folio_put(folio, true);
>  
>  	inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
> @@ -961,20 +1006,21 @@ bool f2fs_empty_dir(struct inode *dir)
>  		return f2fs_empty_inline_dir(dir);
>  
>  	while (bidx < nblock) {
> -		pgoff_t next_pgofs;
> +		pgoff_t next_blkofs;
>  		struct folio *dentry_folio;
>  
> -		dentry_folio = f2fs_find_data_folio(dir, bidx, &next_pgofs);
> +		dentry_folio = f2fs_find_data_folio(dir, bidx, &next_blkofs);
>  		if (IS_ERR(dentry_folio)) {
>  			if (PTR_ERR(dentry_folio) == -ENOENT) {
> -				bidx = next_pgofs;
> +				bidx = next_blkofs;
>  				continue;
>  			} else {
>  				return false;
>  			}
>  		}
>  
> -		dentry_blk = folio_address(dentry_folio);
> +		dentry_blk = f2fs_folio_lblk_address(F2FS_I_SB(dir),
> +						     dentry_folio, bidx);
>  		make_dentry_ptr_block(dir, &d, dentry_blk);
>  		if (bidx == 0)
>  			bit_pos = 2;
> @@ -1080,7 +1126,7 @@ int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
>  static int f2fs_readdir(struct file *file, struct dir_context *ctx)
>  {
>  	struct inode *inode = file_inode(file);
> -	unsigned long npages = dir_blocks(inode);
> +	unsigned long nblocks = dir_blocks(inode);
>  	void *dentry_blk = NULL;
>  	struct file_ra_state *ra = &file->f_ra;
>  	loff_t start_pos = ctx->pos;
> @@ -1089,6 +1135,8 @@ static int f2fs_readdir(struct file *file, struct dir_context *ctx)
>  	unsigned int n = (unsigned long)ctx->pos / entries;
>  	struct f2fs_dentry_ptr d;
>  	struct fscrypt_str fstr = FSTR_INIT(NULL, 0);
> +	pgoff_t f_last = nblocks ? f2fs_lblk_to_folio_index(sbi, nblocks - 1) : 0;
> +	pgoff_t f_index, ra_pages;
>  	int err = 0;
>  
>  	if (IS_ENCRYPTED(inode)) {
> @@ -1106,9 +1154,9 @@ static int f2fs_readdir(struct file *file, struct dir_context *ctx)
>  		goto out_free;
>  	}
>  
> -	for (; n < npages; ctx->pos = n * entries) {
> +	for (; n < nblocks; ctx->pos = n * entries) {
>  		struct folio *dentry_folio;
> -		pgoff_t next_pgofs;
> +		pgoff_t next_blkofs;
>  
>  		/* allow readdir() to be interrupted */
>  		if (fatal_signal_pending(current)) {
> @@ -1118,23 +1166,25 @@ static int f2fs_readdir(struct file *file, struct dir_context *ctx)
>  		cond_resched();
>  
>  		/* readahead for multi pages of dir */
> -		if (npages - n > 1 && !ra_has_index(ra, n))
> -			page_cache_sync_readahead(inode->i_mapping, ra, file, n,
> -				min(npages - n, (pgoff_t)MAX_DIR_RA_PAGES));
> +		f_index = f2fs_lblk_to_folio_index(sbi, n);
> +		ra_pages = f_last - f_index + 1;
> +		if (nblocks - n > 1 && !ra_has_index(ra, f_index))
> +			page_cache_sync_readahead(inode->i_mapping, ra, file, f_index,
> +				min(ra_pages, (pgoff_t)MAX_DIR_RA_PAGES));
>  
> -		dentry_folio = f2fs_find_data_folio(inode, n, &next_pgofs);
> +		dentry_folio = f2fs_find_data_folio(inode, n, &next_blkofs);
>  		if (IS_ERR(dentry_folio)) {
>  			err = PTR_ERR(dentry_folio);
>  			if (err == -ENOENT) {
>  				err = 0;
> -				n = next_pgofs;
> +				n = next_blkofs;
>  				continue;
>  			} else {
>  				goto out_free;
>  			}
>  		}
>  
> -		dentry_blk = folio_address(dentry_folio);
> +		dentry_blk = f2fs_folio_lblk_address(sbi, dentry_folio, n);
>  
>  		make_dentry_ptr_block(inode, &d, dentry_blk);
>  
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 114d3d7bcd3e..3822824326d7 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4193,6 +4193,8 @@ void f2fs_delete_entry(struct f2fs_dir_entry *dentry, void *dentry_blk,
>  int f2fs_do_tmpfile(struct inode *inode, struct inode *dir,
>  					struct f2fs_filename *fname);
>  bool f2fs_empty_dir(struct inode *dir);
> +void f2fs_mark_dentry_folio_dirty(struct inode *dir, struct folio *folio,
> +				  pgoff_t bidx);
>  
>  static inline int f2fs_add_link(struct dentry *dentry, struct inode *inode)
>  {
> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> index 49905aa08418..ba0aff8e5643 100644
> --- a/fs/f2fs/inline.c
> +++ b/fs/f2fs/inline.c
> @@ -463,10 +463,6 @@ static int f2fs_move_inline_dirents(struct inode *dir,
>  	memcpy(dst.dentry, src.dentry, SIZE_OF_DIR_ENTRY * src.max);
>  	memcpy(dst.filename, src.filename, src.max * F2FS_SLOT_LEN);
>  
> -	if (!folio_test_uptodate(folio))
> -		folio_mark_uptodate(folio);
> -	folio_mark_dirty(folio);
> -
>  	/* clear inline dir and flag after data writeback */
>  	f2fs_truncate_inline_inode(dir, ientry, 0);
>  
> @@ -484,6 +480,8 @@ static int f2fs_move_inline_dirents(struct inode *dir,
>  	f2fs_i_depth_write(dir, 1);
>  	if (i_size_read(dir) < F2FS_BLKSIZE(F2FS_I_SB(dir)))
>  		f2fs_i_size_write(dir, F2FS_BLKSIZE(F2FS_I_SB(dir)));
> +
> +	f2fs_mark_dentry_folio_dirty(dir, folio, 0);
>  out:
>  	f2fs_folio_put(folio, true);
>  	return err;

