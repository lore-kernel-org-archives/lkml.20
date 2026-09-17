Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6003E3AD535
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789626785; cv=none; b=WlicFAZ3hMZm/mv7xmJ8KGFIfzRab6cc4nPexIC9pe0uGAVQk5GxJiMS5PZHqQQ6s/q+rgf6gRsnQFYtMJvPS1vepfnnqAcSSmOTNfpjR4BHCwK9lx2Ou9Mp7ue52b89x2cHEVzQKhnmdQYNEV8cqVwVBceSVWWOtZ60PKQuda8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789626785; c=relaxed/simple;
	bh=40RpOI6eQ6pMToFVmx2s6mJoJrtUm/iy4XjgWvXzQ/o=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UvZMMz/+E83Ba83gZKq7csK6ko4RMbC7Q4T6jzIrJ8wN5B+qoGuqLRxGaJEHE/rYYfF2YLunuTFcxSShGDe9ZOPi1Iw5LtLv0OtXL7Qk/VuWWze4x7Qb/bCX82Hq7xlBoCPeg+NnV/ukZ0F6ntioHdeMFEEHMiYindTv8tUNHQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bQAZYBLC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQAZYBLC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B66811F000FF;
	Thu, 17 Sep 2026 06:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789626784;
	bh=2Dkf6N5LkZEVeQLvEwSSS0z/qszvyO+arKERtyYiiCc=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=bQAZYBLCXtKHUFc//cySnC8WUPfX8kyL60sJp1kHjOfYQPPCf5C9lL2HMC+mtndZn
	 nPIrCrEG0+ermm8Q1w4W3u+CrgyjgCOwseS4sW5a0mb/pvSwIkSvcLtntba+SKT+PC
	 m47vNGF3vTYuddU5cRPC4LMkvIyT+8/2y1kADAd7vmA9wJ4GvCDhUtd0yEXP1L6fV4
	 nRj5xRBt0vbstNL9KFTxpJO3Lchr3RWweT8wKL8Zl20oSmIS6HCR9ue4vIZ7mvYzBs
	 F0XJvQpgI68NQ/N3mvJeZzOO62s4g0bVt2MIEHWPfKAV85yZDM0RLeGmQlETN66xOA
	 47L6pq1gpTpgQ==
Message-ID: <fe99e57f-20e4-4975-b7ed-f6e16ed331ed@kernel.org>
Date: Thu, 17 Sep 2026 14:32:59 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Barry Song <baohua@kernel.org>,
 Juan Yescas <jyescas@google.com>, Dev Jain <Dev.Jain@arm.com>,
 linux-kernel@vger.kernel.org, David Hildenbrand <David.Hildenbrand@arm.com>,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Nanzhe Zhao <nzzhao@126.com>, Pengfei Li <lipengfei28@xiaomi.com>,
 Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [PATCH v2 06/14] f2fs: prepare mmap write faults for large folios
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260915041909.2903887-1-zhaonanzhe@xiaomi.com>
 <20260915041909.2903887-7-zhaonanzhe@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260915041909.2903887-7-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/15/26 12:19, Nanzhe Zhao wrote:
> Now write protect `mmap` also need to support large folio,
> Change `f2fs_vm_page_mkwrite` to acheive that.
> 
> Note it currently marks the whole large folio dirty
> to avoid data loss which causes write amplification.
> Further optimization is welcome.
> 
> PG_mappedtodisk is useless in f2fs, so drop the
> folio_test_mappedtodisk() check and its goto out_sem
> shortcut in f2fs_vm_page_mkwrite().  We extend the
> folio_zero_segment() in mkwrite to zero the post-EOF part
> of the faulted folio for both order-0 and large folios, so
> the f2fs_zero_post_eof_page() call added to cover that
> shortcut is no longer needed.
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> ---
>  fs/f2fs/f2fs.h |   4 ++
>  fs/f2fs/file.c | 107 ++++++++++++++++++++++++++++++-------------------
>  2 files changed, 70 insertions(+), 41 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 8eccca6e5d27..f48e2627d90a 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4393,6 +4393,10 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
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
> index 9071bd23e57b..738a751c3903 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -118,13 +118,47 @@ static vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
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
> +	f2fs_folio_wait_writeback(folio, DATA, false, true);
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
> +	loff_t isize;
> +	loff_t folio_start;
> +	loff_t valid_end;
> +	size_t dirty_len;
> +	size_t subpage_off;

pgoff_t i, nr;

>  	int err = 0;
>  	vm_fault_t ret;
>  
> @@ -161,7 +195,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>  
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>  	if (f2fs_compressed_file(inode)) {
> -		int ret = f2fs_is_compressed_cluster(inode, folio->index);
> +		int ret = f2fs_is_compressed_cluster(inode, pidx);
>  
>  		if (ret < 0) {
>  			err = ret;
> @@ -179,72 +213,63 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
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
>  	folio_lock(folio);
> +	isize = i_size_read(inode);
> +	folio_start = folio_pos(folio);
> +	subpage_off = offset_in_folio(folio, pos);
> +	valid_end = min_t(loff_t, folio_start + folio_size(folio), isize);
> +	dirty_len = valid_end > folio_start ? valid_end - folio_start : 0;

valid_end <= folio_start, is this a possible case? if the folio is post EOF,
can it be dirtied via mmap?

> +
>  	if (unlikely(folio->mapping != inode->i_mapping ||
> -			folio_pos(folio) > i_size_read(inode) ||
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
> +	pgoff_t i, nr = DIV_ROUND_UP(dirty_len, PAGE_SIZE);
>  
> -	if (err) {
> -		folio_unlock(folio);
> -		goto out_sem;
> +	for (i = 0; i < nr; i++) {
> +		err = f2fs_get_block_mkwrite(inode, folio, folio->index + i,
> +					     need_alloc);
> +		if (err) {
> +			folio_unlock(folio);
> +			goto out_sem;
> +		}
>  	}
>  
> -	f2fs_folio_wait_writeback(folio, DATA, false, true);
> -
> -	/* wait for GCed page writeback via META_MAPPING */
> -	f2fs_wait_on_block_writeback(inode, dn.data_blkaddr);
> -
> -	/*
> -	 * check to see if the page is mapped already (no holes)
> -	 */
> -	if (folio_test_mappedtodisk(folio))
> -		goto out_sem;

I think we'd better to drop this logic in a separated patch, it doesn't
belong to current patch?

Thanks,

> -
>  	/* page is wholly or partially inside EOF */
> -	if (((loff_t)(folio->index + 1) << PAGE_SHIFT) >
> -						i_size_read(inode)) {
> -		loff_t offset;
> +	if (folio_start + folio_size(folio) > isize) {
> +		size_t offset = offset_in_folio(folio, isize);
>  
> -		offset = i_size_read(inode) & ~PAGE_MASK;
>  		folio_zero_segment(folio, offset, folio_size(folio));
>  	}
> +
> +	if (folio_test_large(folio)) {
> +		if (!f2fs_ffs_find_or_alloc(folio)) {
> +			folio_unlock(folio);
> +			err = -ENOMEM;
> +			goto out_sem;
> +		}
> +		f2fs_ffs_mark_subrange_dirty(folio, 0, dirty_len);
> +	}
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

