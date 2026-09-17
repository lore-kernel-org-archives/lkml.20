Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6FA3911D5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632591; cv=none; b=k901ngL7A9ACb+u3MxgkebKGdeQg8fI0/k/FpTuLz8ptK/KUnYvXnq+gfGzCQVbSMLiM0AaDYFNgm34fgmifIg/b1iPe2vua/X/tiIzQ4BUpUk2+c6GEcEa4pmfHKXUiFTzTfj1sCn+ytJsOJJnVNgOiFAO9Ru6NshS34SBlbLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632591; c=relaxed/simple;
	bh=thxTlFDiUn5m3b2TgEqlNjeAfPL8lcYYZNd7JPe5Uzc=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tXL1EdA5jluFOTQJMsoXoh+iiPjqyVi+9QaQFQ0XXT5s5m0WciTlBCcmrlfMPRQilXD5wdng7K0hgJ+X/B0h4sh1RzUfery6CfopbvCoE/urMCTS7ZLjTesNzHXiLyM9qeVnClsBYTAnru8whNOgHbgwYXUl8iandja/gFY3Hww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V61j4DCj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V61j4DCj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BFE41F000FF;
	Thu, 17 Sep 2026 08:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789632589;
	bh=UykKVWBqmzlyI8cYgHwt51rpqVmLZ/BwoeZDabajYo4=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=V61j4DCj4ah5LSOTCOFsmvR14tPiPu89KoJFUT7ZafNL3UgbTIapTqu9c4t0gxT0N
	 KmhP7HU9NKjSkanSpLbGGaY72xrtuws9ZnRQPywE38umtaTDQVj+FdX6vaImJKi+6z
	 QW1c9rZjNS1SpRxACgIUsCUeExwhe2f1cvHHrql1nADuXe5g3AhjGqYJMZLYq9XwHU
	 MSmZ/R0r09tKlz/ZGWwRAugiXAdA0uLvb38xX1ym5yvlCOSJP4k+H+Xy0BD08EEJXz
	 ajq2SGoOyD3P8J3laf/mYZtWi1tv7lPd67pXeFHs+Kt0lLOuhDlEOqoAUhSupL3Maj
	 5inw+7e0j5v4A==
Message-ID: <6045b4b3-26ef-4d12-b832-7affc9574df0@kernel.org>
Date: Thu, 17 Sep 2026 16:09:45 +0800
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
Subject: Re: [PATCH v2 08/14] f2fs: optimize small block size large folio read
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260915041909.2903887-1-zhaonanzhe@xiaomi.com>
 <20260915041909.2903887-9-zhaonanzhe@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260915041909.2903887-9-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/15/26 12:19, Nanzhe Zhao wrote:
> The original f2fs_read_data_large_folio() implementation has limited
> benefit with a 4KB block size, mainly because updating
> read_pages_pending greatly increases the number of spinlock
> operations.
> 
> Use len_blks to batch read_pages_pending and iostat updates for
> contiguous mapped blocks. If the contiguous mapping covers the whole
> folio, skip f2fs_folio_state allocation for that folio.
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> ---
>  fs/f2fs/data.c | 65 ++++++++++++++++++++++++++++++++++----------------
>  1 file changed, 45 insertions(+), 20 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 287d83debf95..09ad5cf0d9aa 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -173,8 +173,9 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
>  			continue;
>  		}
>  
> -		if (folio_test_large(folio)) {
> -			struct f2fs_folio_state *ffs = folio->private;
> +		if (f2fs_folio_has_ffs(folio)) {
> +			struct f2fs_folio_state *ffs =
> +				(struct f2fs_folio_state *)folio->private;

I just notice that in somewhere, we missed to cast the private field to
f2fs_folio_state pointer as below, please take a look.

ffs = folio->private;

>  
>  			spin_lock_irqsave(&ffs->state_lock, flags);
>  			ffs->read_pages_pending -= nr_pages;
> @@ -2844,8 +2845,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>  	pgoff_t index, offset, next_pgofs = 0;
>  	unsigned max_nr_pages = rac ? readahead_count(rac) :
>  				folio_nr_pages(folio);
> -	unsigned int nrpages;
> -	struct f2fs_folio_state *ffs;
> +	unsigned int nrpages, len_blks;
>  	int ret = 0;
>  	bool folio_in_bio = false;
>  
> @@ -2868,11 +2868,17 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>  	folio_in_bio = false;
>  	index = folio->index;
>  	offset = 0;
> -	ffs = NULL;
>  	nrpages = folio_nr_pages(folio);
>  
> -	for (; nrpages; nrpages--, max_nr_pages--, index++, offset++) {
> +	for (; nrpages;
> +	     nrpages -= len_blks, max_nr_pages -= len_blks,
> +	     index += len_blks, offset += len_blks) {
>  		sector_t block_nr;
> +		bool whole_folio_in_bio;
> +		unsigned int i;
> +
> +		len_blks = 1;
> +
>  		/*
>  		 * Map blocks using the previous result first.
>  		 */
> @@ -2901,13 +2907,31 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>  got_it:
>  		if ((map.m_flags & F2FS_MAP_MAPPED)) {
>  			block_nr = map.m_pblk + index - map.m_lblk;
> -			if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), block_nr,
> +
> +			len_blks = min_t(unsigned int, nrpages, max_nr_pages);
> +			len_blks = min_t(unsigned int, len_blks,
> +					(unsigned int)(map.m_lblk + map.m_len - index));
> +
> +			for (i = 0; i < len_blks; i++) {
> +				if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode),
> +						block_nr + i,
>  						DATA_GENERIC_ENHANCE_READ)) {
> -				ret = -EFSCORRUPTED;
> -				goto err_out;
> +					ret = -EFSCORRUPTED;
> +					goto err_out;
> +				}
>  			}
> +
> +			/*
> +			 * If an entire folio is added to one bio,
> +			 * folio_end_read() can complete the folio read status
> +			 * without relying on f2fs_folio_state.
> +			 */
> +			whole_folio_in_bio = offset == 0 &&
> +					len_blks == folio_nr_pages(folio);
> +
>  		} else {
>  			size_t page_offset = offset << PAGE_SHIFT;
> +
>  			folio_zero_range(folio, page_offset, PAGE_SIZE);
>  			if (vi && !fsverity_verify_blocks(vi, folio, PAGE_SIZE, page_offset)) {
>  				ret = -EIO;
> @@ -2917,15 +2941,13 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>  		}
>  
>  		/* We must increment read_pages_pending before possible BIOs submitting
> -		 * to prevent from premature folio_end_read() call on folio
> +		 * to prevent from premature folio_end_read() call on folio.
>  		 */
> -		if (folio_test_large(folio)) {
> -			ffs = f2fs_ffs_find_or_alloc(folio);
> +		if (folio_test_large(folio) && !whole_folio_in_bio) {
> +			f2fs_ffs_find_or_alloc(folio);

Need to check return value?

Thanks,

>  
>  			/* set the bitmap to wait */
> -			spin_lock_irq(&ffs->state_lock);
> -			ffs->read_pages_pending++;
> -			spin_unlock_irq(&ffs->state_lock);
> +			f2fs_update_read_folio_pending(folio, len_blks);
>  		}
>  
>  		/*
> @@ -2949,17 +2971,20 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>  		 * If the page is under writeback, we need to wait for
>  		 * its completion to see the correct decrypted data.
>  		 */
> -		f2fs_wait_on_block_writeback(inode, block_nr);
> +		for (i = 0; i < len_blks; i++)
> +			f2fs_wait_on_block_writeback(inode, block_nr + i);
>  
> -		if (!bio_add_folio(bio, folio, F2FS_BLKSIZE(F2FS_I_SB(inode)),
> +		if (!bio_add_folio(bio, folio,
> +				len_blks * F2FS_BLKSIZE(F2FS_I_SB(inode)),
>  				offset << PAGE_SHIFT))
>  			goto submit_and_realloc;
>  
>  		folio_in_bio = true;
> -		inc_page_count(F2FS_I_SB(inode), F2FS_RD_DATA);
> +		for (i = 0; i < len_blks; i++)
> +			inc_page_count(F2FS_I_SB(inode), F2FS_RD_DATA);
>  		f2fs_update_iostat(F2FS_I_SB(inode), NULL, FS_DATA_READ_IO,
> -				F2FS_BLKSIZE(F2FS_I_SB(inode)));
> -		last_block_in_bio = block_nr;
> +				len_blks * F2FS_BLKSIZE(F2FS_I_SB(inode)));
> +		last_block_in_bio = block_nr + len_blks - 1;
>  	}
>  	trace_f2fs_read_folio(folio, DATA);
>  err_out:

