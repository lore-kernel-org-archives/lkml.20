Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155234F4733
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560457; cv=none; b=RAHpHoFz/9ATuGvAPW7Yw9n4xPuEZkbO9eic56ay5bjrwjaulJieLB6D2wYYKtljedTGlU/SN/mByWtvtfWXbUpGZiX5xJ0gLHZDQYYpIY3bVBHMFASxhZrTu2X8UDlRfIDVWX+XD2ohx8UPzXFKIEX97xrpyl7a0mMZGND9LMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560457; c=relaxed/simple;
	bh=95bUyCXLrjAs825q+QrBuAkWVKnhvhgvg+mG6UW9kDs=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OjzIPBLEztzdIf2QJdzaAbftvz6XUi4ZuHwSqap+orYpQwrTU3NmFDCfjUht4rFt2KQYW+ZVFcXs3l4gxQawZYZEfty28IZg4zjg9XfAX5R7bnBuh7K9RmfqGv6vYhw5bDyWlvDcKPRgM+PBCy2bXP/wGlUiwRP+3WuC+q6WixE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m8B2gB/P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m8B2gB/P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 619281F000FF;
	Wed, 16 Sep 2026 12:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789560441;
	bh=cXx2XndakrQF6L0r//qBtUy8tWLc5FZpfFzhIY8tJC4=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=m8B2gB/PIjeLdlbegwHeGUgsRbp1OS3nYTh99UnghWK5kSe2XzfYDjn2xRC3mX2B+
	 SGrcg84eKjVMKH8KJs9g4BfQn3YLFf7rEm9XfBQrqHE229JNnuBKoHqd2oJNSeOO46
	 jkm5iK39TpkdNfpxCqrVOZ0NL2q1y2aFKFHxHLj82WTmoQoLWT1Yu1JiY6QVwLuwty
	 m06gFhGV+3T4WmA2YX4Vxuc4LzJK1/eCLfXNzgiTruLM7VlyEwSf/XdLDwCye1mhC+
	 9/+ZEaSg0FT7UcxoXHFZPB5z1XZdaXB3lVWA03itDLiFo+kljkqfwg5f8mPYqBKPRA
	 GDm+61ki1Y3bw==
Message-ID: <51c3f1f9-7e91-4f9a-9f22-d1ba8df357c6@kernel.org>
Date: Wed, 16 Sep 2026 20:07:17 +0800
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
Subject: Re: [PATCH v2 04/14] f2fs: support atomic file large folios buffered
 write
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260915041909.2903887-1-zhaonanzhe@xiaomi.com>
 <20260915041909.2903887-5-zhaonanzhe@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260915041909.2903887-5-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/15/26 12:18, Nanzhe Zhao wrote:
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
>  fs/f2fs/data.c | 88 ++++++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 81 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index a490df4f50b3..eb5fb8e52851 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -4016,18 +4016,16 @@ static int __reserve_data_block(struct inode *inode, pgoff_t index,
>  }
>  
>  static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
> -			struct folio *folio, loff_t pos, unsigned int len,
> +			struct inode *inode, pgoff_t index,
>  			block_t *blk_addr, bool *node_changed)
>  {
> -	struct inode *inode = folio->mapping->host;
>  	struct inode *cow_inode = F2FS_I(inode)->cow_inode;
> -	pgoff_t index = folio->index;
>  	int err = 0;
>  	block_t ori_blk_addr = NULL_ADDR;
>  	bool cow_has_reserved_block = false;
>  
>  	/* If pos is beyond the end of file, reserve a new block in COW inode */

              ^^^

Need to update comments here? there is no @pos in the function.

> -	if ((pos & PAGE_MASK) >= i_size_read(inode))
> +	if ((index << PAGE_SHIFT) >= i_size_read(inode))
>  		goto reserve_block;
>  
>  	/* Look for the block in COW inode first */
> @@ -4168,6 +4166,74 @@ static int prepare_large_folio_write_begin(struct inode *inode,
>  	return 0;
>  }
>  
> +static int prepare_large_folio_atomic_write_begin(struct inode *inode,
> +		struct address_space *mapping, struct folio *folio, loff_t pos,
> +		unsigned int len)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	size_t ori_off = offset_in_folio(folio, pos);
> +	pgoff_t start, end, index;
> +	unsigned int orig_order;
> +	int err = 0;
> +
> +	len = min_t(unsigned int, len, folio_size(folio) - ori_off);
> +
> +	if (!f2fs_ffs_find_or_alloc(folio))
> +		return -ENOMEM;
> +
> +	/* Inline data must have been converted before reaching here. */
> +	f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
> +
> +	start = folio->index + (ori_off >> PAGE_SHIFT);
> +	end = folio->index + ((ori_off + len - 1) >> PAGE_SHIFT);
> +
> +	for (index = start; index <= end; index++) {
> +		block_t blkaddr = NULL_ADDR;
> +		bool node_changed = false;
> +		size_t off = (index - folio->index) << PAGE_SHIFT;
> +
> +		err = prepare_atomic_write_begin(sbi, inode, index,
> +						&blkaddr, &node_changed);
> +		if (err)
> +			return err;
> +
> +		if (f2fs_ffs_test_blk_uptodate(folio, index))
> +			goto balance;
> +
> +		if (blkaddr == NEW_ADDR) {
> +			folio_zero_segment(folio, off, off + PAGE_SIZE);
> +			f2fs_ffs_mark_subrange_uptodate(folio, off, PAGE_SIZE);
> +			goto balance;
> +		}
> +
> +		if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
> +					   DATA_GENERIC_ENHANCE_READ))
> +			return -EFSCORRUPTED;
> +
> +		err = f2fs_submit_page_read_sync(inode, folio, index,
> +						blkaddr);
> +		if (err)
> +			return err;
> +balance:
> +		/*
> +		 * Expand the 4K-page balance decision per subpage: check
> +		 * right after each preallocated block.
> +		 */
> +		if (node_changed && !IS_NOQUOTA(inode) &&

!IS_NOQUOTA(inode) is not needed.

> +		    has_not_enough_free_secs(sbi, 0, 0)) {
> +			orig_order = folio_order(folio);
> +			folio_unlock(folio);
> +			f2fs_balance_fs(sbi, true);
> +			folio_lock(folio);
> +			if (unlikely(folio->mapping != mapping ||
> +				     folio_order(folio) != orig_order))
> +				return -EAGAIN;
> +		}

Why can't we merge this logic w/ others? it seems duplicated.

Thanks,

> +	}
> +
> +	return 0;
> +}
> +
>  static int f2fs_write_begin(const struct kiocb *iocb,
>  			    struct address_space *mapping,
>  			    loff_t pos, unsigned len, struct folio **foliop,
> @@ -4245,8 +4311,8 @@ static int f2fs_write_begin(const struct kiocb *iocb,
>  
>  	*foliop = folio;
>  
> -	if (f2fs_is_atomic_file(inode))
> -		err = prepare_atomic_write_begin(sbi, folio, pos, len,
> +	if (f2fs_is_atomic_file(inode) && !folio_test_large(folio))
> +		err = prepare_atomic_write_begin(sbi, inode, folio->index,
>  					&blkaddr, &need_balance);
>  	else if (!folio_test_large(folio))
>  		err = prepare_write_begin(sbi, folio, pos, len,
> @@ -4270,10 +4336,18 @@ static int f2fs_write_begin(const struct kiocb *iocb,
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

