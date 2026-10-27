Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093721;
	b=hq7voQbp2sTdvgGskFMX9NsD38mP7OincrfrTPe5RkKAHIX3Z9QRDmMLat1NbGNJ/fOs
	 Rgg/IzJmJqECBh/D9Rrcad8FGxQhCzoy/hh7dPR7D0TTdzh2DrNtubRSsx+6+oOHNXF/y
	 pGX3YCbLe2IUMwiohVCvNBOWl42KHoNny+IB6N6vj1CYI03nYiX1dlI4GkzLsC149oYNj
	 gxW84kQ6UTfT24MX3s+4BCsrTCc2J3i4UcxX7vmPgmThl/KX+G3d+kBcS8VexRw7zJF5+
	 OMQJCssLyP7Pul1SYN2FPEogHUF11DuuTE81ODkD+rjO2bkIi3jqb2rMi/pR3Ub9pog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093721;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=8cClHpn4QcRtRIEg08pjD1RQp0MconW84frXjCAs5kI=;
	b=0F4ECdT705H9+nP4RpETB+I7iNKNaoBAxm/Iu0JmGlJIMdESWVfsBhbR4fchbaZTj9qw
	 rLW4Oqg1QzM7ASNmk7FTx1/rVn4sBIunav4X5KE386JE6GlrHmdmw7hyDR1xL9tjEnQM9
	 Rjk9Fp5qcjOIz+1VCwIxw4brN7d1hpbz1O82z0FWYf2zwxMBnrqeNVMyLxIikxKQkFTf5
	 gKexmEPwr1T1ecfA5QA3B5k/ere+dqrtRcUEHmGzAQwl+AJNrkkFKQq3WVt/XKd0IlbC9
	 klXFVaclglnobBfhmCtrcwyyGPQxaMmXZ2S2Mwfd19j8FJW6AnFW+CY7DuSXdxvUskQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oLSdHlm4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A752C606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oLSdHlm4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D47A1F031E0;
	Tue, 27 Oct 2026 09:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793093720;
	bh=8cClHpn4QcRtRIEg08pjD1RQp0MconW84frXjCAs5kI=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=oLSdHlm41Z7IPbn9DzDXOCfqPTOuEQJRBonriYWllIN4wDWohCFP42PQLIVnoAYgf
	 rWSXzkGeevOfBL9Ko8Rjf3ex7iVnag8HpStv0ojTWa2Y/E5nh62ZzAwEAxRcaBRXTZ
	 zJUmrokbHVqAspfpWbyLcHQDjocmmxOJfvX83K5UAn7QK+6CSEY+mIspwt9K0Q6l/O
	 KkjUSfd7ypTJvxgjONrpoi9eJ++pjuzW9frq2xV9Yw5LU3urF/I/6Y8JWZgIKa7DrH
	 Lr2UcX3UkQDfoclU58dDwWFLuew9grdZTWdrIW9mgKk2BNgQ+ZQIeFbnOzdGt1v5cj
	 AKpGM8Bm+DY3g==
Message-ID: <8c731d5a-d000-4faf-a5d2-76f7c17d82ec@kernel.org>
Date: Tue, 27 Oct 2026 17:35:15 +0800
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
Subject: Re: [PATCH v7 07/15] f2fs: prepare mmap write faults for large folios
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261026033745.784107-1-nzzhao.sigma@gmail.com>
 <20261026033745.784107-8-nzzhao.sigma@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261026033745.784107-8-nzzhao.sigma@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/26/26 11:37, Nanzhe Zhao wrote:
> From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> 
> Now write protect `mmap` also need to support large folio,
> Change `f2fs_vm_page_mkwrite` to achieve that.
> 
> Note it currently marks the whole large folio dirty
> to avoid data loss which causes write amplification.
> Further optimization is welcome.
> 
> The folio_zero_segment() in mkwrite is extended to zero the
> post-EOF part of the faulted folio for both order-0 and large
> folios, so the f2fs_zero_post_eof_page() call that was added
> to cover the removed shortcut is no longer needed.
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> ---
>  fs/f2fs/f2fs.h |  4 +++
>  fs/f2fs/file.c | 96 ++++++++++++++++++++++++++++++++------------------
>  2 files changed, 65 insertions(+), 35 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index b89664e28a92..915ca72cf276 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4492,6 +4492,10 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
>  				enum iostat_type io_type,
>  				int compr_blocks, bool allow_balance);
>  bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index);
> +struct f2fs_folio_state *f2fs_ffs_find_or_alloc(struct folio *folio);
> +void f2fs_ffs_mark_subrange_dirty(struct folio *folio, size_t offset, size_t len);
> +bool f2fs_ffs_clear_subrange_dirty_and_test(struct folio *folio, size_t offset,
> +					    size_t len);
>  void f2fs_write_failed(struct inode *inode, loff_t to);
>  void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length);
>  bool f2fs_release_folio(struct folio *folio, gfp_t wait);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 85b4f1a2ff0d..808b72d3d78a 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -118,14 +118,48 @@ static vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
>  	return ret;
>  }
>  
> +static int f2fs_get_block_mkwrite(struct inode *inode, struct folio *folio,
> +				  pgoff_t index, bool need_alloc)
> +{
> +	struct dnode_of_data dn;
> +	int err;
> +
> +	set_new_dnode(&dn, inode, NULL, NULL, 0);
> +	if (need_alloc) {
> +		err = f2fs_get_block_locked(&dn, index);
> +	} else {
> +		err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
> +		f2fs_put_dnode(&dn);
> +		if (f2fs_is_pinned_file(inode) &&
> +		    !__is_valid_data_blkaddr(dn.data_blkaddr))
> +			err = -EIO;
> +	}
> +
> +	if (err)
> +		return err;
> +
> +	f2fs_folio_wait_writeback(folio, false, true);
> +
> +	/* wait for GCed page writeback via META_MAPPING */
> +	f2fs_wait_on_block_writeback(inode, dn.data_blkaddr);
> +
> +	return 0;
> +}
> +
>  static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>  {
>  	struct folio *folio = page_folio(vmf->page);
>  	struct inode *inode = file_inode(vmf->vma->vm_file);
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> -	struct dnode_of_data dn;
>  	bool need_alloc = !f2fs_is_pinned_file(inode);
> +	pgoff_t pidx = folio->index + folio_page_idx(folio, vmf->page);
> +	loff_t pos = (loff_t)pidx << PAGE_SHIFT;
>  	loff_t isize;
> +	loff_t folio_start;
> +	loff_t valid_end;
> +	size_t dirty_len;
> +	size_t subpage_off;
> +	pgoff_t i, nr;
>  	int err = 0;
>  	vm_fault_t ret;
>  
> @@ -162,7 +196,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>  
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>  	if (f2fs_compressed_file(inode)) {
> -		int ret = f2fs_is_compressed_cluster(inode, folio->index);
> +		int ret = f2fs_is_compressed_cluster(inode, pidx);
>  
>  		if (ret < 0) {
>  			err = ret;
> @@ -180,11 +214,6 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>  
>  	f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
>  
> -	err = f2fs_zero_post_eof_page(inode,
> -		(folio->index + 1) << PAGE_SHIFT, true, false);
> -	if (err)
> -		goto out_pagefault;
> -
>  	file_update_time(vmf->vma->vm_file);
>  	filemap_invalidate_lock_shared(inode->i_mapping);
>  
> @@ -200,62 +229,59 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>  	}
>  
>  	folio_lock(folio);

It needs to add below check to avoid racing w/ COLLAPSE_RANGE or INSERT_RANGE ->
f2fs_invalidate_folio()? there is no ffs in large folio after folio_lock().

    if (folio_test_large(folio) && !folio_test_uptodate(folio)) {
        folio_unlock(folio);
        err = -EFAULT;          /* VM_FAULT_NOPAGE, refault */
        goto out_sem;
    }

Thanks,

> -	/*
> -	 * A concurrent buffered write can extend isize, so we store isize in a
> -	 * local variable to let the zeroing offset match the EOF check below.
> -	 */
>  	isize = i_size_read(inode);
> +	folio_start = folio_pos(folio);
> +	subpage_off = offset_in_folio(folio, pos);
> +	valid_end = min_t(loff_t, folio_start + folio_size(folio), isize);
> +	dirty_len = valid_end - folio_start;
>  
>  	if (unlikely(folio->mapping != inode->i_mapping ||
> -			folio_pos(folio) > isize ||
> -			!folio_test_uptodate(folio))) {
> +			pos >= isize ||
> +			!f2fs_ffs_test_blk_uptodate(folio,
> +			folio->index + (subpage_off >> PAGE_SHIFT)))) {
>  		folio_unlock(folio);
>  		err = -EFAULT;
>  		goto out_sem;
>  	}
>  
> -	set_new_dnode(&dn, inode, NULL, NULL, 0);
> -	if (need_alloc) {
> -		/* block allocation */
> -		err = f2fs_get_block_locked(&dn, folio->index);
> -	} else {
> -		err = f2fs_get_dnode_of_data(&dn, folio->index, LOOKUP_NODE);
> -		f2fs_put_dnode(&dn);
> -		if (f2fs_is_pinned_file(inode) &&
> -		    !__is_valid_data_blkaddr(dn.data_blkaddr))
> -			err = -EIO;
> -	}
> -
> -	if (err) {
> +	if (folio_test_large(folio) && !f2fs_ffs_find_or_alloc(folio)) {
>  		folio_unlock(folio);
> +		err = -ENOMEM;
>  		goto out_sem;
>  	}
>  
> -	f2fs_folio_wait_writeback(folio, false, true);
> +	nr = DIV_ROUND_UP(dirty_len, PAGE_SIZE);
>  
> -	/* wait for GCed page writeback via generic cache */
> -	f2fs_wait_on_block_writeback(inode, dn.data_blkaddr);
> +	for (i = 0; i < nr; i++) {
> +		err = f2fs_get_block_mkwrite(inode, folio, folio->index + i,
> +					     need_alloc);
> +		if (err) {
> +			folio_unlock(folio);
> +			goto out_sem;
> +		}
> +	}
>  
>  	/* page is wholly or partially inside EOF */
> -	if (((loff_t)(folio->index + 1) << PAGE_SHIFT) > isize) {
> -		loff_t offset;
> +	if (folio_start + folio_size(folio) > isize) {
> +		size_t offset = offset_in_folio(folio, isize);
>  
> -		offset = isize & ~PAGE_MASK;
>  		folio_zero_segment(folio, offset, folio_size(folio));
>  	}
> +
> +	if (folio_test_large(folio))
> +		f2fs_ffs_mark_subrange_dirty(folio, 0, dirty_len);
>  	folio_mark_dirty(folio);
>  
> -	f2fs_update_iostat(sbi, inode, APP_MAPPED_IO, F2FS_BLKSIZE(sbi));
> +	f2fs_update_iostat(sbi, inode, APP_MAPPED_IO, dirty_len);
>  	f2fs_update_time(sbi, REQ_TIME);
>  
>  out_sem:
>  	filemap_invalidate_unlock_shared(inode->i_mapping);
> -out_pagefault:
>  	sb_end_pagefault(inode->i_sb);
>  out:
>  	ret = vmf_fs_error(err);
>  
> -	trace_f2fs_vm_page_mkwrite(inode, folio->index, vmf->vma->vm_flags, ret);
> +	trace_f2fs_vm_page_mkwrite(inode, pidx, vmf->vma->vm_flags, ret);
>  	return ret;
>  }
>  

