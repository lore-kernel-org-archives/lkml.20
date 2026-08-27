Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FA1223DE7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834171; cv=none; b=VdRdM24LKEasVai3lob1qCN/X89BL1RdUO/Yh0OP9plAKcpMn6XLNBvvlKROIpID/e7Hk761N3CtoHfOeZ4qeWXDPgdOCzTjTRy7H63rPy6Yg/224L9nx6HjlWFgd6BZNjWZheMZf6aAB8elP2LnOrV5xCzi7pqKaacJ8SawsSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834171; c=relaxed/simple;
	bh=ATDAhOfZZnlrlcsvyKLDT4FGIXGZJDEMA0sKKjzUFAI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=j4K9cRpPhiHGE6s+7ab5RpxNPPuR9hGaPHbZkLmzb8oxG001CkPGT2H7PkfayYyMO6F8Sweqvz/O2/GGnhxZnqTIsIiOLbzNeOfFOL86zZClDHNgOmkeIXZYVhWE+MJ+saomxTNhTwi0W6F1wOmy7o3Q8BtOXAgw8IGfEAGy1fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xw7NucEi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xw7NucEi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 514B81F000E9;
	Thu, 27 Aug 2026 12:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787834166;
	bh=hsQSocOw1V6LIZ0bZ5/AEmq7U0N0qqOB9IfyW0+PBaA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=Xw7NucEit5a9fn57CYlVKcqnM+3mVOvXgfMkpu/1ykyrdNsYj4rYOPpgAL4JnrStE
	 5mVOcsSidSYGLA/SqrgMgAbYCwBJnIBi+Rehx9BKb4yorKpcUa5oSkDh/Fj3hUwHJ+
	 ZywCIF38WZLrJCx/slrWCp7DFKi0xYAcrHRIX5V2VdOwx+cituNiqQ67jraw8iJUfI
	 1zdH4gs4MImN2W5nUk2kpRqJ5GuP0fKwja9Xw6LdaMIjX7RxROfSwdTMqLER8nEX1T
	 SspgrmU2IkN8iDm1nwfGUjXMSD99mU72pT/beoQqIRc4Qki+n46JDJpTlgFqfFXmlW
	 fgXyj13Tegt9w==
Message-ID: <eecd3a49-d252-4d36-9e5a-44ac3eb02108@kernel.org>
Date: Thu, 27 Aug 2026 20:36:02 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Chao Yu <chao@kernel.org>
Subject: Re: [PATCH 06/14] f2fs: prepare mmap write faults for large folios
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>, Barry Song <baohua@kernel.org>
Cc: chao@kernel.org, Nanzhe Zhao <nzzhao@126.com>,
 Juan Yescas <jyescas@google.com>, Dev Jain <Dev.Jain@arm.com>,
 linux-kernel@vger.kernel.org, David Hildenbrand <David.Hildenbrand@arm.com>,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Ryan Roberts <Ryan.Roberts@arm.com>, Pengfei Li <lipengfei28@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260826082641.2007658-1-zhaonanzhe@xiaomi.com>
 <20260826082641.2007658-7-zhaonanzhe@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20260826082641.2007658-7-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/26/26 16:26, Nanzhe Zhao wrote:
> Now write protect `mmap` also need to support large folio,
> Change `f2fs_vm_page_mkwrite` to acheive that.
> 
> Note it currently marks the whole large folio dirty
> to avoid data loss which causes write amplification.
> Further optimization is welcome.
> 
> PG_mappedtodisk is useless in f2fs, so drop the
> folio_test_mappedtodisk() check and its goto out_sem

Can you send a separated patch to clean up logic on mappedtodisk flag?

> shortcut in f2fs_vm_page_mkwrite().  We extend the
> folio_zero_segment() in mkwrite to zero the post-EOF part
> of the faulted folio for both order-0 and large folios, so
> the f2fs_zero_post_eof_page() call added to cover that
> shortcut is no longer needed.
> > Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> ---
>  fs/f2fs/f2fs.h |  5 +++++
>  fs/f2fs/file.c | 59 +++++++++++++++++++++++++++++++-------------------
>  2 files changed, 42 insertions(+), 22 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index ae6031693700..71e6d7e34c7b 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4343,6 +4343,11 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
>  				enum iostat_type io_type,
>  				int compr_blocks, bool allow_balance);
>  bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index);
> +struct f2fs_folio_state *f2fs_ffs_find_or_alloc(struct folio *folio);
> +void f2fs_ffs_mark_subrange_dirty(struct folio *folio, size_t offset, size_t len);
> +bool f2fs_ffs_clear_subrange_dirty_and_test(struct folio *folio, size_t offset,
> +					size_t len);
> +void f2fs_ffs_clear_subrange_dirty(struct folio *folio, size_t offset, size_t len);
>  void f2fs_write_failed(struct inode *inode, loff_t to);
>  void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length);
>  bool f2fs_release_folio(struct folio *folio, gfp_t wait);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index e40285d4f9c2..02d687527241 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -124,6 +124,13 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>  	struct dnode_of_data dn;
>  	bool need_alloc = !f2fs_is_pinned_file(inode);
> +	pgoff_t pidx = folio->index + folio_page_idx(folio, vmf->page);
> +	loff_t pos = (loff_t)pidx << PAGE_SHIFT;
> +	loff_t isize;
> +	loff_t folio_start;
> +	loff_t valid_end;
> +	size_t dirty_len;
> +	size_t subpage_off;
>  	int err = 0;
>  	vm_fault_t ret;
>  
> @@ -160,7 +167,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>  
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>  	if (f2fs_compressed_file(inode)) {
> -		int ret = f2fs_is_compressed_cluster(inode, folio->index);
> +		int ret = f2fs_is_compressed_cluster(inode, pidx);
>  
>  		if (ret < 0) {
>  			err = ret;
> @@ -178,18 +185,20 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
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
> @@ -198,9 +207,19 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>  	set_new_dnode(&dn, inode, NULL, NULL, 0);
>  	if (need_alloc) {
>  		/* block allocation */
> -		err = f2fs_get_block_locked(&dn, folio->index);
> +		if (folio_test_large(folio)) {
> +			pgoff_t i, nr = DIV_ROUND_UP(dirty_len, PAGE_SIZE);
> +
> +			for (i = 0; i < nr; i++) {
> +				err = f2fs_get_block_locked(&dn, folio->index + i);
> +				if (err)
> +					break;

We only need to call f2fs_get_block_locked() for vmf->page?

Hi Barry, could you please help to confirm this? Only vmf->page contain dirty
data, rather than whole large folio contain dirty data?

Thanks,

> +			}
> +		} else {
> +			err = f2fs_get_block_locked(&dn, pidx);
> +		}
>  	} else {
> -		err = f2fs_get_dnode_of_data(&dn, folio->index, LOOKUP_NODE);
> +		err = f2fs_get_dnode_of_data(&dn, pidx, LOOKUP_NODE);
>  		f2fs_put_dnode(&dn);
>  		if (f2fs_is_pinned_file(inode) &&
>  		    !__is_valid_data_blkaddr(dn.data_blkaddr))
> @@ -217,20 +236,17 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>  	/* wait for GCed page writeback via META_MAPPING */
>  	f2fs_wait_on_block_writeback(inode, dn.data_blkaddr);
>  
> -	/*
> -	 * check to see if the page is mapped already (no holes)
> -	 */
> -	if (folio_test_mappedtodisk(folio))
> -		goto out_sem;
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
> +		f2fs_ffs_find_or_alloc(folio);
> +		f2fs_ffs_mark_subrange_dirty(folio, 0, dirty_len);
> +	}
>  	folio_mark_dirty(folio);
>  
>  	f2fs_update_iostat(sbi, inode, APP_MAPPED_IO, F2FS_BLKSIZE);
> @@ -238,12 +254,11 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
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

