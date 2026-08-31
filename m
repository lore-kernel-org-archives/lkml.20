Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286823B47E2
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788162970; cv=none; b=cy8lUH5FCrXo0nYOzImSIsmtD8KvLr+gvUAe0ipCI+WIc73QxpF51suJ2vb1uSYrtQoYUhb0Ym2m6FI8HkhUoEpFH0LXsq82lJFZg6zCVYkzS0irnGQACtvvwmy0BRbCmYSh8PhBeRaYAechjI7XLrcTZii8L6jUEoE0ivu2wBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788162970; c=relaxed/simple;
	bh=Nt29CVbN6FuaEnvjwGWl76u4tOHrWz1SaL98VU6juBY=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=stIYVvFdLMj64LcR8qTEhZ0Df2I5Lx++41ABRRSti2lB6EbpT2jSzeGb4KPQkLqBktjeY7M60uH2dw00jSx4Sf/4ltBQNO+GbiYEbcARZheAxhHXk52ikgI+IsUWfRzmuBkgNn36hdqtl5926YRxxfkjsa/FeiyCPtpaaEiOyLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XCySky3l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XCySky3l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB831F000E9;
	Mon, 31 Aug 2026 07:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788162968;
	bh=WtnlcabzBd5labaxDNizhCNpcST68xNLPAhymML9Lz4=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=XCySky3lNMkqbs2vZ59XrVar8gX7QzRiamivgmyQCbUN4DZq2eTONk79z9hsx3EgN
	 Cy9D4ioLOz/2rk0gRFYIhTvzzsziyRaGybLL99QBaeBjtqzXWx2gtJPo0WT2dkA7q2
	 EYckA9Dz5ohFPaOpY56yWsHVi4jeLjEUsQOb5RbwYQBv1skCgLYfIARIuFPf6n43Hl
	 ojWno2Qrgiq608oEZQWMNPFsS2TLcZ+J9aRhMEgUwaA7S1N99KScqFnZl04/HXSCqZ
	 Z5yLY3kkjA6R9Q3tcA1uNYP5VDShYEElU74VkXOy5ociQvqu1TT2M514zc9VkpQg2V
	 0uRFnE0WRlN8w==
Message-ID: <3409f516-13a1-4489-ac7d-501936bc0dce@kernel.org>
Date: Mon, 31 Aug 2026 15:56:04 +0800
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
Subject: Re: [PATCH 11/14] f2fs: fix zeroing paths for large folios
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260826082641.2007658-1-zhaonanzhe@xiaomi.com>
 <20260826130916.2231342-1-zhaonanzhe@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260826130916.2231342-1-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/26/26 21:09, Nanzhe Zhao wrote:
> Several f2fs zeroing paths still use PAGE_SIZE based offsets after
> a file mapping can contain large folios.  This is fine for order-0
> folios, but it zeros the wrong range once the target block is not at
> offset 0 in a large folio.
> 
> Use offset_in_folio() to translate the file block index to the folio
> offset before zeroing data in truncate_partial_data_page(), fill_zero(),
> and f2fs_get_new_data_folio().
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> ---
>   fs/f2fs/data.c | 13 ++++++++++---
>   fs/f2fs/f2fs.h |  1 +
>   fs/f2fs/file.c | 27 ++++++++++++++++++++++-----
>   3 files changed, 33 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 15774e8e8795..0b167b14a9a5 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1582,9 +1582,16 @@ struct folio *f2fs_get_new_data_folio(struct inode *inode,
>   		goto got_it;
>   
>   	if (dn.data_blkaddr == NEW_ADDR) {
> -		folio_zero_segment(folio, 0, folio_size(folio));
> -		if (!folio_test_uptodate(folio))
> +		size_t off = offset_in_folio(folio,
> +					(loff_t)index << PAGE_SHIFT);
> +
> +		folio_zero_segment(folio, off, off + PAGE_SIZE);
> +		if (folio_test_large(folio)) {
> +			f2fs_ffs_find_or_alloc(folio);
> +			f2fs_ffs_mark_subrange_uptodate(folio, off, PAGE_SIZE);
> +		} else if (!folio_test_uptodate(folio)) {
>   			folio_mark_uptodate(folio);
> +		}
>   	} else {
>   		f2fs_folio_put(folio, true);
>   
> @@ -2670,7 +2677,7 @@ static bool __ffs_mark_subrange_uptodate(struct folio *folio,
>   	return bitmap_full(ffs->state, nr_subpages);
>   }
>   
> -static void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
> +void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
>   				       size_t len)
>   {
>   	struct f2fs_folio_state *ffs;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 0ffbe2bd04c8..6ae249bf9aa1 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4330,6 +4330,7 @@ struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
>   			bool for_write);
>   struct folio *f2fs_get_new_data_folio(struct inode *inode,
>   			struct folio *ifolio, pgoff_t index, bool new_i_size);
> +void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset, size_t len);
>   int f2fs_do_write_data_page(struct f2fs_io_info *fio);
>   int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag);
>   int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 02d687527241..4272013dbe38 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -811,12 +811,12 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
>   static int truncate_partial_data_page(struct inode *inode, u64 from,
>   								bool cache_only)
>   {
> -	loff_t offset = from & (PAGE_SIZE - 1);
>   	pgoff_t index = from >> PAGE_SHIFT;
>   	struct address_space *mapping = inode->i_mapping;
>   	struct folio *folio;
> +	size_t folio_off;
>   
> -	if (!offset && !cache_only)
> +	if (!(from & (PAGE_SIZE - 1)) && !cache_only)
>   		return 0;
>   
>   	if (cache_only) {
> @@ -834,12 +834,21 @@ static int truncate_partial_data_page(struct inode *inode, u64 from,

Actually, I think it tries to truncate partial *data block* post EOF.

>   		return PTR_ERR(folio) == -ENOENT ? 0 : PTR_ERR(folio);
>   truncate_out:
>   	f2fs_folio_wait_writeback(folio, DATA, true, true);
> -	folio_zero_segment(folio, offset, folio_size(folio));
> +	folio_off = offset_in_folio(folio, from);
> +	folio_zero_segment(folio, folio_off, folio_size(folio));
>   
>   	/* An encrypted inode should have a key and truncate the last page. */
>   	f2fs_bug_on(F2FS_I_SB(inode), cache_only && IS_ENCRYPTED(inode));
> -	if (!cache_only)
> +	if (!cache_only) {
> +		if (folio_test_large(folio)) {
> +			f2fs_ffs_find_or_alloc(folio);
> +			f2fs_ffs_mark_subrange_uptodate(folio, folio_off,
> +					folio_size(folio) - folio_off);
> +			f2fs_ffs_mark_subrange_dirty(folio, folio_off,
> +					folio_size(folio) - folio_off);

So I guess we can only mark uptodate/dirty in ffs in extent of (folio_off, PAGE_SIZE)?

> +		}
>   		folio_mark_dirty(folio);
> +	}
>   	f2fs_folio_put(folio, true);
>   	return 0;
>   }
> @@ -1310,6 +1319,7 @@ static int fill_zero(struct inode *inode, pgoff_t index,
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   	struct folio *folio;
>   	struct f2fs_lock_context lc;
> +	size_t folio_off;
>   
>   	if (!len)
>   		return 0;
> @@ -1324,7 +1334,14 @@ static int fill_zero(struct inode *inode, pgoff_t index,
>   		return PTR_ERR(folio);
>   
>   	f2fs_folio_wait_writeback(folio, DATA, true, true);
> -	folio_zero_range(folio, start, len);
> +	folio_off = offset_in_folio(folio,
> +				   (loff_t)index << PAGE_SHIFT) + start;
> +	folio_zero_range(folio, folio_off, len);
> +	if (folio_test_large(folio)) {
> +		f2fs_ffs_find_or_alloc(folio);
> +		f2fs_ffs_mark_subrange_uptodate(folio, folio_off, len);
> +		f2fs_ffs_mark_subrange_dirty(folio, folio_off, len);

Ditto,

Thanks,

> +	}
>   	folio_mark_dirty(folio);
>   	f2fs_folio_put(folio, true);
>   	return 0;

