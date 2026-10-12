Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483B9255F52
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789539; cv=none; b=CoK46TZZ3puEgV2qHk1rzkF1qkR3jwb40nAN2FSE6lsKlybwTyrsh0MbeyPm+Sy6i7aAAj1CA654LYG5WaurBF+UbQMeGnWPndiSVGdXUpT4AZ09dlKHqnNoMk8GOQIFEVMUFfFqFYhDWg6d/oRH/6OBMsanrRSqgXGrI5naOxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789539; c=relaxed/simple;
	bh=sgPObT2NiNxyMT+xutTH3F+8nZI2mNOeTVmYXY0U/B8=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bcLW6cqK6CZOdnyizUcbhIr/iZlZyAGSSkbfgtbJVn2hB5w9F9c8NpIQwTQnmzt5DmYYebbLb8pOzfhd5813GmH3FJITne5bWfdApjAEoEpsAzT1N3KdPvvzLsAoAeubiGpZr5Oeiyso144tId8b5KhYqsrq0ErfIUQWnOlE66c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NrMNadbC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NrMNadbC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA531F0089B;
	Mon, 12 Oct 2026 07:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791789537;
	bh=AdPqNpZXmNQ43AQ3xgOVf01mH+/LX9E+Jqxlk12JjDk=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=NrMNadbCP95GjDmY/kQ46xpmUzNaYnUbZ+Z0r80BX2zwl9Q2OGp69N9jogVH+weFP
	 rBnbXZ/A0Irm01uu1dzRoQhEoCVBz97z6PzrLrBjszuaIl3lEvpDPVfmSazXsKEnyy
	 S7A2JJzD+AZ10T0pSRdzWHQyOdS2R05AVXC7aFGN1pN8UMBB5w6YQWMXnyu5oVoxCk
	 4yrNRtv8MrAsvXxhkML7ltTUCSG+s5SoRaF5AcEtX9JPS3HZzdRkPn43Vixd9tNcaN
	 T6vrvU3g4SZhA5XIS/Di7O8USiQ3v4/pYScRLVZ6MyYXRRb5TxiT9dZXeeBE8o3UPT
	 1XAOIs06Wi5gw==
Message-ID: <fdaf1bef-3d10-4d54-a8c3-087804ca57cf@kernel.org>
Date: Mon, 12 Oct 2026 15:18:52 +0800
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
Subject: Re: [PATCH v3 11/17] f2fs: support partial uptodate large folio read
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261009161224.4163796-1-zhaonanzhe@xiaomi.com>
 <20261009162828.4188050-1-zhaonanzhe@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261009162828.4188050-1-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/26 00:28, Nanzhe Zhao wrote:
> Buffered write can have write bytes smaller than folio
> size for cases when folio minimum order is not zero.
> This can left partially uptodate folio in page cache.
> So we skip uptodate subpage read in read_data_large_folio.
> Also mark hole subpage uptodate in uptodate bitmap.
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> ---
>   fs/f2fs/data.c | 70 +++++++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 69 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 6f6f5223951d..21c43019167a 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -148,6 +148,7 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
>   		struct folio *folio = fi.folio;
>   		unsigned nr_pages = fi.length >> PAGE_SHIFT;
>   		bool finished = true;
> +		bool uptodate = bio->bi_status == BLK_STS_OK;
>   
>   		if (!folio_test_large(folio) &&
>   		    f2fs_is_compressed_page(folio)) {
> @@ -163,6 +164,9 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
>   				(struct f2fs_folio_state *)folio->private;
>   
>   			spin_lock_irqsave(&ffs->state_lock, flags);
> +			if (bio->bi_status == BLK_STS_OK)
> +				uptodate = __ffs_mark_subrange_uptodate(folio, ffs,
> +						fi.offset, fi.length);
>   			ffs->read_pages_pending -= nr_pages;
>   			finished = !ffs->read_pages_pending;
>   			spin_unlock_irqrestore(&ffs->state_lock, flags);
> @@ -172,7 +176,8 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
>   			dec_cache_count(F2FS_F_SB(folio), F2FS_RD_DATA);
>   
>   		if (finished)
> -			folio_end_read(folio, bio->bi_status == BLK_STS_OK);
> +			folio_end_read(folio,
> +				bio->bi_status == BLK_STS_OK && uptodate);

Looks weird, can we initial uptodate to true directly? and only update it according
to __ffs_mark_subrange_uptodate(), rather than (bio->bi_status == BLK_STS_OK)?

>   	}
>   
>   	if (ctx)
> @@ -3071,6 +3076,56 @@ static bool find_next_valid_block(const struct folio *folio,
>   	return false;
>   }
>   
> +static unsigned int ffs_next_uptodate_subpage(struct f2fs_folio_state *ffs,
> +			unsigned int start, unsigned int end)
> +{
> +	return find_next_bit(ffs->state, end + 1, start);
> +}
> +
> +static unsigned int ffs_next_nonuptodate_subpage(struct f2fs_folio_state *ffs,
> +			unsigned int start, unsigned int end)
> +{
> +	return find_next_zero_bit(ffs->state, end + 1, start);
> +}
> +
> +static void f2fs_skip_fully_uptodate_front(struct folio *folio,
> +			pgoff_t *index, pgoff_t *offset, unsigned int *nrpages,
> +			unsigned int *max_nr_pages)
> +{
> +	struct f2fs_folio_state *ffs;
> +	unsigned int next, skipped;
> +
> +	if (!f2fs_folio_has_ffs(folio) || !*nrpages)
> +		return;
> +
> +	ffs = (struct f2fs_folio_state *)folio->private;
> +	next = ffs_next_nonuptodate_subpage(ffs, *offset,
> +					    *offset + *nrpages - 1);
> +	skipped = next - *offset;
> +	if (!skipped)
> +		return;
> +
> +	*index += skipped;
> +	*offset += skipped;
> +	*nrpages -= skipped;
> +	*max_nr_pages -= skipped;
> +}
> +
> +static void f2fs_truncate_read_extent(struct folio *folio, pgoff_t offset,
> +				     unsigned int *len_blks)
> +{
> +	struct f2fs_folio_state *ffs;
> +	unsigned int next, end;
> +
> +	if (!f2fs_folio_has_ffs(folio) || *len_blks <= 1)
> +		return;
> +
> +	ffs = (struct f2fs_folio_state *)folio->private;
> +	end = offset + *len_blks - 1;
> +	next = ffs_next_uptodate_subpage(ffs, offset + 1, end);
> +	if (next <= end)
> +		*len_blks = next - offset;
> +}

Blank line.

Thanks,

>   static int f2fs_read_data_large_folio(struct inode *inode,
>   		struct fsverity_info *vi,
>   		struct readahead_control *rac, struct folio *folio)
> @@ -3115,6 +3170,11 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>   
>   		len_blks = 1;
>   
> +		f2fs_skip_fully_uptodate_front(folio, &index, &offset,
> +					       &nrpages, &max_nr_pages);
> +		if (!nrpages)
> +			break;
> +
>   		/*
>   		 * Map blocks using the previous result first.
>   		 */
> @@ -3147,6 +3207,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>   			len_blks = min_t(unsigned int, nrpages, max_nr_pages);
>   			len_blks = min_t(unsigned int, len_blks,
>   					(unsigned int)(map.m_lblk + map.m_len - index));
> +			f2fs_truncate_read_extent(folio, offset, &len_blks);
>   
>   			for (i = 0; i < len_blks; i++) {
>   				if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode),
> @@ -3165,6 +3226,13 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>   				ret = -EIO;
>   				goto err_out;
>   			}
> +			if (folio_test_large(folio)) {
> +				ffs = f2fs_ffs_find_or_alloc(folio);
> +				spin_lock_irq(&ffs->state_lock);
> +				__ffs_mark_subrange_uptodate(folio, ffs,
> +						page_offset, PAGE_SIZE);
> +				spin_unlock_irq(&ffs->state_lock);
> +			}
>   			continue;
>   		}
>   

