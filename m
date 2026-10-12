Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A4A437448
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788652; cv=none; b=M1uilLQgYmXPgMF1eDRnj8cjguYWRRGsieI67XT4DNKJ8Ihv5MM/BLCDtIMQPq3T982nteXVfUosfrP5ClS6TRqp43wrdTdwtZlEanVqa/LrZjfp9bOh2vCZMFTYV3df7KAThf77axsaUqX2MPmWIGNHx9QyGf9ski7DZeUlWNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788652; c=relaxed/simple;
	bh=WcnB2um1H9pVv0xHDJMpuje9BWJkoedAkp2uOsBdJ4w=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UmtlJM2TMvjzYCufrlN85Z7Mhc8uiv7wn3Dn7fJ5mfRnZdxAdDpM5qR7OhWrbYpjgL/DC1j3xlrcJL7X2Fn+axVZx1AUDpVzazOcvXYSdE8fEbNl0YYkPUpaR9NprA9LzK01z3YjHjNMwK8GR0JhBxKEOLuKwv6frbmsMCNl7kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C0ID0Pp6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0ID0Pp6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8691F0089B;
	Mon, 12 Oct 2026 07:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791788651;
	bh=iHPc9noxhd63rd41CVHU5eVdztT5EDmfh56KyaO4ybA=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=C0ID0Pp6/BEYUKz/LDKKQ516W8hD0MvkSmzjb4Jq93PRM7QkBPUWaMpNLu/aBKYCS
	 sFulN1eLptiyFAVAfE7faNQgrR2PNh5JdzWEeVM55B7bCJEVIQiJOWtLcF0Kvup1EO
	 cvBaQNX0VAt2z+YF8OdkTOQV/EKYHXaTENzDlKDwb2BY+h+6Ejp1KpRAX7VQvrrU8D
	 NWrdYZDz8TMO8E4yQvr84RTtuV9Znj0niAt4wDRBfj0ZhBWJGNropWc01I0tUU3VNb
	 se4oMLGEnOW7mV4C0tfckBUS1CiqS860VczTlRzhxsq/DO1AuriB7iRI65M+twUS8k
	 eH7p6NUmw+hDA==
Message-ID: <c08a6a2c-123f-4bbe-81c2-f294d8bb6214@kernel.org>
Date: Mon, 12 Oct 2026 15:04:05 +0800
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
Subject: Re: [PATCH v3 08/17] f2fs: prepare mmap write faults for large folios
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261009161224.4163796-1-zhaonanzhe@xiaomi.com>
 <20261009161224.4163796-9-zhaonanzhe@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261009161224.4163796-9-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/26 00:12, Nanzhe Zhao wrote:
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
>   fs/f2fs/f2fs.h |   4 ++
>   fs/f2fs/file.c | 102 ++++++++++++++++++++++++++++++++-----------------
>   2 files changed, 71 insertions(+), 35 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 2cf98f49c876..a78c69b6abb0 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4488,6 +4488,10 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
>   				enum iostat_type io_type,
>   				int compr_blocks, bool allow_balance);
>   bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index);
> +struct f2fs_folio_state *f2fs_ffs_find_or_alloc(struct folio *folio);
> +void f2fs_ffs_mark_subrange_dirty(struct folio *folio, size_t offset, size_t len);
> +bool f2fs_ffs_clear_subrange_dirty_and_test(struct folio *folio, size_t offset,
> +					    size_t len);
>   void f2fs_write_failed(struct inode *inode, loff_t to);
>   void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length);
>   bool f2fs_release_folio(struct folio *folio, gfp_t wait);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index e7471949faf2..6eb0c8e05b66 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -118,13 +118,48 @@ static vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
>   	return ret;
>   }
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
>   static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>   {
>   	struct folio *folio = page_folio(vmf->page);
>   	struct inode *inode = file_inode(vmf->vma->vm_file);
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> -	struct dnode_of_data dn;
>   	bool need_alloc = !f2fs_is_pinned_file(inode);
> +	pgoff_t pidx = folio->index + folio_page_idx(folio, vmf->page);
> +	loff_t pos = (loff_t)pidx << PAGE_SHIFT;
> +	loff_t isize;
> +	loff_t folio_start;
> +	loff_t valid_end;
> +	size_t dirty_len;
> +	size_t subpage_off;
> +	pgoff_t i, nr;
>   	int err = 0;
>   	vm_fault_t ret;
>   
> @@ -161,7 +196,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>   
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
>   	if (f2fs_compressed_file(inode)) {
> -		int ret = f2fs_is_compressed_cluster(inode, folio->index);
> +		int ret = f2fs_is_compressed_cluster(inode, pidx);
>   
>   		if (ret < 0) {
>   			err = ret;
> @@ -179,66 +214,63 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>   
>   	f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
>   
> -	err = f2fs_zero_post_eof_page(inode,
> -		(folio->index + 1) << PAGE_SHIFT, true, false);
> -	if (err)
> -		goto out_pagefault;
> -
>   	file_update_time(vmf->vma->vm_file);
>   	filemap_invalidate_lock_shared(inode->i_mapping);
>   
>   	folio_lock(folio);
> +	isize = i_size_read(inode);
> +	folio_start = folio_pos(folio);
> +	subpage_off = offset_in_folio(folio, pos);
> +	valid_end = min_t(loff_t, folio_start + folio_size(folio), isize);
> +	dirty_len = valid_end - folio_start;
> +
>   	if (unlikely(folio->mapping != inode->i_mapping ||
> -			folio_pos(folio) > i_size_read(inode) ||
> -			!folio_test_uptodate(folio))) {
> +			pos >= isize ||
> +			!f2fs_ffs_test_blk_uptodate(folio,
> +			folio->index + (subpage_off >> PAGE_SHIFT)))) {
>   		folio_unlock(folio);
>   		err = -EFAULT;
>   		goto out_sem;
>   	}
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
> +	nr = DIV_ROUND_UP(dirty_len, PAGE_SIZE);
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
>   	}
>   
> -	f2fs_folio_wait_writeback(folio, false, true);
> -
> -	/* wait for GCed page writeback via generic cache */
> -	f2fs_wait_on_block_writeback(inode, dn.data_blkaddr);
> -
>   	/* page is wholly or partially inside EOF */
> -	if (((loff_t)(folio->index + 1) << PAGE_SHIFT) >
> -						i_size_read(inode)) {
> -		loff_t offset;
> +	if (folio_start + folio_size(folio) > isize) {
> +		size_t offset = offset_in_folio(folio, isize);
>   
> -		offset = i_size_read(inode) & ~PAGE_MASK;
>   		folio_zero_segment(folio, offset, folio_size(folio));
>   	}
> +
> +	if (folio_test_large(folio)) {
> +		if (!f2fs_ffs_find_or_alloc(folio)) {

Can we call f2fs_ffs_find_or_alloc() after f2fs_convert_inline_inode()? I feel
it's so later to fail due to -ENOMEM.

Thanks,

> +			folio_unlock(folio);
> +			err = -ENOMEM;
> +			goto out_sem;
> +		}
> +		f2fs_ffs_mark_subrange_dirty(folio, 0, dirty_len);
> +	}
>   	folio_mark_dirty(folio);
>   
> -	f2fs_update_iostat(sbi, inode, APP_MAPPED_IO, F2FS_BLKSIZE(sbi));
> +	f2fs_update_iostat(sbi, inode, APP_MAPPED_IO, dirty_len);
>   	f2fs_update_time(sbi, REQ_TIME);
>   
>   out_sem:
>   	filemap_invalidate_unlock_shared(inode->i_mapping);
> -out_pagefault:
>   	sb_end_pagefault(inode->i_sb);
>   out:
>   	ret = vmf_fs_error(err);
>   
> -	trace_f2fs_vm_page_mkwrite(inode, folio->index, vmf->vma->vm_flags, ret);
> +	trace_f2fs_vm_page_mkwrite(inode, pidx, vmf->vma->vm_flags, ret);
>   	return ret;
>   }
>   

