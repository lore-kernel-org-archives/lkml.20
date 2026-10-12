Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE5343B3C0
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788987; cv=none; b=Sp1bPflsmyNGV8vIhihfB+0bKqb3XiA92MJEqQ6Eoy+E71tgCnE6NbEDhbN51BUVBhxmFgkGqm9I4d57MRtYQZinnhCGjsePEDbgqAtEEaya8r2lhj/IBas2X8yt2bHB9yo/JuPM3dcsUb+pCxDqVBOiQ+X7ls5RBnNbm+RY7og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788987; c=relaxed/simple;
	bh=ZK1PiyAElATAllrlPJJL1FflFfqMAwTRknwhS3TR0Wo=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=q/SO1y8sEnGtgeHp7uohf2QVhnFQgfKvafs/nDJ/hNqaWYDmA3Ex9iBfyQ/8ryflyIu4qX/WQZuiO1VYD0ohnV7RNf3vSOHQe3QBbfiJ7yLcF0x2fGtifxCVHLMz226hs0+4smOoidw//UwaFguGEOPkAmgrNfJzM39eWyNAUGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fVqnTNcO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fVqnTNcO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946DE1F0089B;
	Mon, 12 Oct 2026 07:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791788986;
	bh=vc+vo3tyDqzu0eoQG/JEUgM2Kj8/FZF1XersPkE/WXE=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=fVqnTNcOp1/ajoMRkZ5iOpQq88dUh6+wM/qFcjTsLpzAYpGYU974UREaMZ/789dIL
	 B3jjZqAP8jeMdSPb2VAjHAF5GmZTC+/Tfzo/vKS9d00kaESxdTt6rXBmet88puoF0c
	 7HDckpFqad39fYFInFpzYNilwV/rm9goupo4JII7e2oZ5MOwsAdDD9wl1esxImSPXn
	 1g4Q1EZFBtiOGvQ7ZOHH88LQJ/72s0qsoNIe2csakqKPU9A5GeqkyslrJ0jJB1qaYA
	 PoWE13GBDhtDKDBMma/34+8bPvpPFJxQJARfu5TCMFApNsqpp7mpFM5tMpLcDvkx10
	 cNHL8DLGf+5eA==
Message-ID: <3be99fcf-86c1-44de-a354-0292646dd1b7@kernel.org>
Date: Mon, 12 Oct 2026 15:09:38 +0800
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
Subject: Re: [PATCH v3 10/17] f2fs: optimize small block size large folio read
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261009161224.4163796-1-zhaonanzhe@xiaomi.com>
 <20261009161224.4163796-11-zhaonanzhe@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261009161224.4163796-11-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/26 00:12, Nanzhe Zhao wrote:
> The original f2fs_read_data_large_folio() implementation has limited
> benefit with a 4KB block size, mainly because updating
> read_pages_pending greatly increases the number of spinlock
> operations.
> 
> Use len_blks to batch read_pages_pending and iostat updates for
> contiguous mapped blocks.
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> ---
>   fs/f2fs/data.c | 48 ++++++++++++++++++++++++++++++++----------------
>   1 file changed, 32 insertions(+), 16 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 171b6a38e5cc..6f6f5223951d 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -158,7 +158,7 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
>   			continue;
>   		}
>   
> -		if (folio_test_large(folio)) {
> +		if (f2fs_folio_has_ffs(folio)) {
>   			struct f2fs_folio_state *ffs =
>   				(struct f2fs_folio_state *)folio->private;
>   
> @@ -3081,7 +3081,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>   	pgoff_t index, offset, next_pgofs = 0;
>   	unsigned max_nr_pages = rac ? readahead_count(rac) :
>   				folio_nr_pages(folio);
> -	unsigned nrpages;
> +	unsigned nrpages, len_blks;
>   	struct f2fs_folio_state *ffs;
>   	int ret = 0;
>   	bool folio_in_bio = false;
> @@ -3105,11 +3105,16 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>   	folio_in_bio = false;
>   	index = folio->index;
>   	offset = 0;
> -	ffs = NULL;
>   	nrpages = folio_nr_pages(folio);
>   
> -	for (; nrpages; nrpages--, max_nr_pages--, index++, offset++) {
> +	for (; nrpages;
> +	     nrpages -= len_blks, max_nr_pages -= len_blks,
> +	     index += len_blks, offset += len_blks) {
>   		sector_t block_nr;
> +		unsigned int i;
> +
> +		len_blks = 1;
> +
>   		/*
>   		 * Map blocks using the previous result first.
>   		 */
> @@ -3138,13 +3143,23 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>   got_it:
>   		if ((map.m_flags & F2FS_MAP_MAPPED)) {
>   			block_nr = map.m_pblk + index - map.m_lblk;
> -			if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), block_nr,
> +
> +			len_blks = min_t(unsigned int, nrpages, max_nr_pages);
> +			len_blks = min_t(unsigned int, len_blks,
> +					(unsigned int)(map.m_lblk + map.m_len - index));
> +
> +			for (i = 0; i < len_blks; i++) {
> +				if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode),
> +						block_nr + i,
>   						DATA_GENERIC_ENHANCE_READ)) {
> -				ret = -EFSCORRUPTED;
> -				goto err_out;
> +					ret = -EFSCORRUPTED;
> +					goto err_out;
> +				}
>   			}
> +
>   		} else {
>   			size_t page_offset = offset << PAGE_SHIFT;
> +
>   			folio_zero_range(folio, page_offset, PAGE_SIZE);
>   			if (vi && !fsverity_verify_blocks(vi, folio, PAGE_SIZE, page_offset)) {
>   				ret = -EIO;
> @@ -3154,7 +3169,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>   		}
>   
>   		/* We must increment read_pages_pending before possible BIOs submitting
> -		 * to prevent from premature folio_end_read() call on folio
> +		 * to prevent from premature folio_end_read() call on folio.

It's not worth to change this line only by adding a "."

>   		 */
>   		if (folio_test_large(folio)) {
>   			ffs = f2fs_ffs_find_or_alloc(folio);
> @@ -3164,9 +3179,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>   			}
>   
>   			/* set the bitmap to wait */
> -			spin_lock_irq(&ffs->state_lock);
> -			ffs->read_pages_pending++;
> -			spin_unlock_irq(&ffs->state_lock);
> +			f2fs_update_read_folio_pending(folio, len_blks);
>   		}
>   
>   		/*
> @@ -3190,17 +3203,20 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>   		 * If the page is under writeback, we need to wait for
>   		 * its completion to see the correct decrypted data.
>   		 */
> -		f2fs_wait_on_block_writeback(inode, block_nr);
> +		for (i = 0; i < len_blks; i++)
> +			f2fs_wait_on_block_writeback(inode, block_nr + i);

f2fs_wait_on_block_writeback_range()

>   
> -		if (!bio_add_folio(bio, folio, F2FS_BLKSIZE(F2FS_I_SB(inode)),
> +		if (!bio_add_folio(bio, folio,
> +				len_blks * F2FS_BLKSIZE(F2FS_I_SB(inode)),
>   				offset << PAGE_SHIFT))
>   			goto submit_and_realloc;
>   
>   		folio_in_bio = true;
> -		inc_cache_count(F2FS_I_SB(inode), F2FS_RD_DATA);
> +		for (i = 0; i < len_blks; i++)
> +			inc_cache_count(F2FS_I_SB(inode), F2FS_RD_DATA);
>   		f2fs_update_iostat(F2FS_I_SB(inode), NULL, FS_DATA_READ_IO,
> -				F2FS_BLKSIZE(F2FS_I_SB(inode)));
> -		last_block_in_bio = block_nr;
> +				len_blks * F2FS_BLKSIZE(F2FS_I_SB(inode)));
> +		last_block_in_bio = block_nr + len_blks - 1;
>   	}
>   	trace_f2fs_read_folio(folio, DATA);
>   err_out:

