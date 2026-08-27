Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31E4288C2C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787822652; cv=none; b=GTKxCEZfcdUxdAGFjTu3kldyZABbfDesyFwdriCBR686r6yQ7q3SNeg2F+MVckZcllSF6Lr3QHw+zF5MwRvjBYUqe7vi/j2c4M3gSusHQPh44Tq0jDSA97nUoEwRoEdVHR2qaeAfGhUPOVfPWAKnDyRVjGIK7Py6mstVZa9JapI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787822652; c=relaxed/simple;
	bh=LJ7FoPoM0Xq7zl/aUHi8cBwYMcUebxRUiYMgFNgcNdg=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=A+ytdpt1WSk4vefz0flOp2k6krIMbFQBZv9UY5aeabhUoOkcvhHQV00Ye/U/RyV90XpZX01VVU/3Wpnvk1rLZFmdqSlPljE9Xm8NfUz7P0DWbkMJCH0snrevKY76PO9ZlZJdv0tOIxmb2atSKKED3goopN1uwhS9XUdwJNnZg1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=enbT/nO0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="enbT/nO0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C031F00A3A;
	Thu, 27 Aug 2026 09:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787822650;
	bh=hOkytZV0Gmu3k8FlxDUznDi0+0beZnhW5bCwVj5T1M8=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=enbT/nO0/4dO16FcQ4Nz8RezCHgVYKqKhKw+PFcv4AwINaeysKuPqPY/zYEe5L/py
	 sZqIA6olQEKFqd/YW0Wr6Tm40f5kqi1u65f9+WCiRyqu56ww/leeCXR/8Fb01+pgeK
	 9Mf3MX7lq4PX2pJc/b+2jXnah7Y5mdoYxZsZOjnvHS2IyNHi8/UnsUAD8s+DKmrv4E
	 eMVcJCls5rTEjuhy1ur5+mHTV9Q61kGTuy9UfprVFPkeeLTtoLjnEH8d1cwjTriZZU
	 3SQl8TqC2+hi4G8kbwkdmta6a9V7W85LJ22YwO5IWMOpXbNZHvbRh6PTjtTqyaemnn
	 KhEX5WLqM0M/A==
Message-ID: <9a00f46d-1fc6-454d-9c77-89ae51266c01@kernel.org>
Date: Thu, 27 Aug 2026 17:24:06 +0800
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
Subject: Re: [PATCH 04/14] f2fs: support atomic file large folios buffered
 write
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260826082641.2007658-1-zhaonanzhe@xiaomi.com>
 <20260826082641.2007658-5-zhaonanzhe@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260826082641.2007658-5-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/26/26 16:26, Nanzhe Zhao wrote:
> ioctl can convert an inode with large folio support into an atomic
> file. Support large folio buffered writes for atomic files as well.
> 
> Add a large folio atomic write_begin helper that reserves COW mappings
> for the write range. For partial head and tail subpages, read the
> existing data from either the COW inode or the original inode before
> marking the subpage uptodate.
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> ---
>  fs/f2fs/data.c | 123 ++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 121 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 7ce96ae02cfc..dff802725544 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -4211,6 +4211,117 @@ static int prepare_large_folio_write_begin(struct inode *inode,
>  	return 0;
>  }
>  
> +static int prepare_large_folio_atomic_write_begin(struct inode *inode,
> +		struct address_space *mapping, struct folio *folio, loff_t pos,
> +		unsigned int len)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	struct inode *cow_inode = F2FS_I(inode)->cow_inode;
> +	size_t ori_off = offset_in_folio(folio, pos);
> +	size_t need_off = ori_off;
> +	pgoff_t index;
> +	int err = 0;
> +	unsigned int orig_order;
> +	bool need_balance = false;
> +
> +	len = min_t(unsigned int, len, folio_size(folio) - ori_off);
> +
> +	f2fs_ffs_find_or_alloc(folio);
> +
> +	/* Inline data must have been converted before reaching here. */
> +	f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
> +
> +	/* Reserve COW blocks for all covered 4K subpages first. */
> +	pgoff_t start_index = folio->index + (ori_off >> PAGE_SHIFT);
> +	pgoff_t end_index = folio->index +
> +		((ori_off + len - 1) >> PAGE_SHIFT);
> +
> +	for (index = start_index; index <= end_index; index++) {
> +		block_t cow_blkaddr = NULL_ADDR;
> +		bool node_changed = false;
> +		int ret;
> +
> +		ret = __find_data_block(cow_inode, index, &cow_blkaddr);
> +		if (ret)
> +			return ret;
> +		if (cow_blkaddr != NULL_ADDR)
> +			continue;
> +
> +		ret = __reserve_data_block(cow_inode, index, &cow_blkaddr,
> +					   &node_changed);
> +		if (ret)
> +			return ret;
> +
> +		inc_atomic_write_cnt(inode);

In order to not miss any logic in prepare_atomic_write_begin(), can you reuse
prepare_atomic_write_begin() as much as possible? needs to change parameters
a bit there.

	for (...) {
		err = prepare_atomic_write_begin(sbi, inode, index, pos, len, ...);
		...
	}

> +		need_balance |= node_changed;
> +	}
> +
> +	if (need_balance && !IS_NOQUOTA(inode) &&
> +				       has_not_enough_free_secs(sbi, 0, 0)) {
> +		orig_order = folio_order(folio);
> +		folio_unlock(folio);
> +		f2fs_balance_fs(sbi, true);
> +		folio_lock(folio);
> +		if (unlikely(folio->mapping != mapping ||
> +			     folio_order(folio) != orig_order))
> +			return -EAGAIN;
> +	}
> +
> +	if (folio_test_uptodate(folio) || len == folio_size(folio))
> +		return 0;
> +
> +	/* Then read partial 4K subpages. */
> +	while (find_next_valid_block(folio, ori_off, &need_off, len)) {

Can we record first and last blkaddr in first loop of
prepare_large_folio_atomic_write_begin(), and then we can avoid lot of complexity
below to find target blkaddr?

We really don't want to miss any corner case of atomic write + large folio, please
consider that.

Thanks,

> +		size_t off;
> +		block_t cow_blkaddr = NULL_ADDR;
> +		block_t ori_blkaddr = NULL_ADDR;
> +		struct inode *read_inode = NULL;
> +		block_t read_blkaddr = NULL_ADDR;
> +
> +		index = folio->index + (need_off >> PAGE_SHIFT);
> +		off = offset_in_folio(folio, index << PAGE_SHIFT);
> +
> +		err = __find_data_block(cow_inode, index, &cow_blkaddr);
> +		if (err)
> +			return err;
> +
> +		if (__is_valid_data_blkaddr(cow_blkaddr)) {
> +			if (!f2fs_is_valid_blkaddr(sbi, cow_blkaddr,
> +						  DATA_GENERIC_ENHANCE_READ))
> +				return -EFSCORRUPTED;
> +			read_inode = cow_inode;
> +			read_blkaddr = cow_blkaddr;
> +		} else if (is_inode_flag_set(inode, FI_ATOMIC_REPLACE)) {
> +			folio_zero_segment(folio, off, off + PAGE_SIZE);
> +			f2fs_ffs_mark_subrange_uptodate(folio, off, PAGE_SIZE);
> +			continue;
> +		} else {
> +			err = __find_data_block(inode, index, &ori_blkaddr);
> +			if (err)
> +				return err;
> +
> +			if (!__is_valid_data_blkaddr(ori_blkaddr)) {
> +				folio_zero_segment(folio, off, off + PAGE_SIZE);
> +				f2fs_ffs_mark_subrange_uptodate(folio, off, PAGE_SIZE);
> +				continue;
> +			}
> +
> +			if (!f2fs_is_valid_blkaddr(sbi, ori_blkaddr,
> +						  DATA_GENERIC_ENHANCE_READ))
> +				return -EFSCORRUPTED;
> +			read_inode = inode;
> +			read_blkaddr = ori_blkaddr;
> +		}
> +
> +		err = f2fs_submit_page_read_sync(read_inode, folio,
> +						 index, read_blkaddr);
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
> @@ -4282,7 +4393,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
>  
>  	*foliop = folio;
>  
> -	if (f2fs_is_atomic_file(inode))
> +	if (f2fs_is_atomic_file(inode) && !folio_test_large(folio))
>  		err = prepare_atomic_write_begin(sbi, folio, pos, len,
>  					&blkaddr, &need_balance);
>  	else if (!folio_test_large(folio))
> @@ -4307,10 +4418,18 @@ static int f2fs_write_begin(const struct kiocb *iocb,
>  	f2fs_folio_wait_writeback(folio, DATA, false, true);
>  
>  	if (folio_test_large(folio)) {
> -		err = prepare_large_folio_write_begin(inode,
> +		if (f2fs_is_atomic_file(inode))
> +			err = prepare_large_folio_atomic_write_begin(inode,
> +					mapping, folio, pos, len);
> +		else
> +			err = prepare_large_folio_write_begin(inode,
>  					folio, pos, len);
>  		if (!err)
>  			return 0;
> +		if (err == -EAGAIN) {
> +			f2fs_folio_put(folio, true);
> +			goto repeat;
> +		}
>  		goto put_folio;
>  	}
>  

