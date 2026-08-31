Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EA939D6F6
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788162386; cv=none; b=aiArguPYBhllHK49csC5AtgVUzZ3LqJJ3WkqtkIJ0GgRhNklb7fEW0Jr6R8kesoX3z/9a+umfVb2MtCZMNvobtHKGVSR3HN0yw6GyC1BfSXmzG1JZn1J9WHOE4sC5XZe6J6nfHgvEArYJd9/DJLi8M9Gjl5rTnhAVa49LVNV/7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788162386; c=relaxed/simple;
	bh=aIaZgPsVBhLkD4VFDu19TSH7Egql2U/u0HunY/L61bw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FdsHlwfj29PZKQyL43+Iya8SzWwSOg66UFJz8WqRfu06+ZzRVDSeBPbTaoNZwQy/Y8EXHUBEi1xxYl1VYjteid2Lo/H0ZJ1ih0qmO0177ugyQyGtjanWn1uZbNOH10vdnn/CR3z6kw8IBbA+7dsEuxpPdOi0U6YpZ2io2ulsTeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oLQry5P8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oLQry5P8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C428E1F000E9;
	Mon, 31 Aug 2026 07:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788162385;
	bh=VsPmteMgnqcVdcLhtU+19faUBqt6fMPz0Emib+Jo0kw=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=oLQry5P8smWmfIAGXsHLVdtag7oTjwjxrlgyLqUKWYK4Z7+fWcFfy7M1BxBW/KTux
	 JZFIpBNAmqwf66QJHCY0nV2coIl/eyEm7EK3voBc6QwcFFHmENbE7aj/AdqOjffWvr
	 j1D5I0ygP2eq5qCwuhJ4QLGdeayj1Y7U/aaibkUhMYo4h3sUah1LhlN8uZIGgnt7dw
	 QEl4dN8b5RyQ73MtoFHoTSxQB1/BRC+CQB2Q2/GHV2h4vLx/aFco2F+S4613rVjK3V
	 iXBz7RG0ZgBx3qP+v+S6M57Glp/6Ugla5K+oV8ZwLDiQwDNUkGKhrsyYYdzpkG1QcZ
	 A5V47NwLm60XA==
Message-ID: <404d2f2b-c8b6-43de-a6e4-9e4989ae5d44@kernel.org>
Date: Mon, 31 Aug 2026 15:46:21 +0800
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
Subject: Re: [PATCH 10/14] f2fs: handle partial truncate of large folio dirty
 subpages
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260826082641.2007658-1-zhaonanzhe@xiaomi.com>
 <20260826082641.2007658-11-zhaonanzhe@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260826082641.2007658-11-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/26/26 16:26, Nanzhe Zhao wrote:
> A large folio can be partial truncated and stays in folio mapping, we
> need to clear the subrange dirty bits and uptodate bits that the partial
> truncate covers. If this partial truncate happens to clear the last
> subrange dirty bits, then cancel the whole folio dirty state.
> 
> Also add a guard in f2fs_write_single_data_folio() so a large folio
> subpage whose disk block was already truncated (NULL_ADDR) is skipped
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> ---
>   fs/f2fs/data.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 73 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 59b07b83b216..15774e8e8795 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2693,6 +2693,34 @@ static void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
>   		folio_mark_uptodate(folio);
>   }
>   
> +static void ffs_clear_subrange_uptodate(struct folio *folio,
> +					size_t offset, size_t len)
> +{
> +	struct f2fs_folio_state *ffs;
> +	unsigned int nr_subpages, start, end;
> +	unsigned long flags;
> +
> +	f2fs_bug_on(F2FS_F_SB(folio), offset + len > folio_size(folio));
> +
> +	if (!f2fs_folio_has_ffs(folio)) {
> +		if (folio_test_uptodate(folio))
> +			folio_clear_uptodate(folio);
> +		return;
> +	}
> +
> +	ffs = (struct f2fs_folio_state *)folio->private;
> +	nr_subpages = folio_nr_pages(folio);
> +	start = offset >> PAGE_SHIFT;
> +	end = (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
> +	end = min(end, nr_subpages);
> +
> +	spin_lock_irqsave(&ffs->state_lock, flags);
> +	bitmap_clear(ffs->state, start, end - start);
> +	spin_unlock_irqrestore(&ffs->state_lock, flags);
> +	if (folio_test_uptodate(folio))
> +		folio_clear_uptodate(folio);
> +}
> +
>   bool f2fs_ffs_test_blk_dirty(const struct folio *folio, pgoff_t index)
>   {
>   	struct f2fs_folio_state *ffs;
> @@ -3599,6 +3627,21 @@ static int f2fs_write_single_data_folio(struct folio *folio, int *submitted,
>   
>   		fio.old_blkaddr = dn.data_blkaddr;
>   
> +		/* This page is already truncated */
> +		if (fio.old_blkaddr == NULL_ADDR) {
> +			ffs_clear_subrange_uptodate(folio,
> +					i << PAGE_SHIFT, PAGE_SIZE);
> +			folio_clear_f2fs_gcing(folio);
> +			f2fs_put_dnode(&dn);
> +			if (f2fs_folio_has_ffs(folio)) {
> +				struct f2fs_folio_state *ffs =
> +					(struct f2fs_folio_state *)folio->private;
> +
> +				atomic_dec(&ffs->write_pages_pending);
> +			}
> +			continue;
> +		}
> +
>   got_it:
>   		if (__is_valid_data_blkaddr(fio.old_blkaddr) &&
>   		    !f2fs_is_valid_blkaddr(sbi, fio.old_blkaddr,
> @@ -5075,8 +5118,37 @@ void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   
>   	if (inode->i_ino >= F2FS_ROOT_INO(sbi) &&
> -				(offset || length != folio_size(folio)))
> +				(offset || length != folio_size(folio))) {
> +		size_t clear_start = ALIGN(offset, PAGE_SIZE);

round_up(offset, PAGE_SIZE) will be more efficient?

> +		size_t clear_end = round_down(offset + length, PAGE_SIZE);
> +		size_t clear_length = 0;
> +
> +		/*
> +		 * If the truncated range falls within a single subpage, no
> +		 * subpage state needs to be cleared.
> +		 */
> +		if (clear_start < clear_end && f2fs_folio_has_ffs(folio)) {

How about cleaning up to avoid long line w/

if (clear_start >= clear_end || !f2fs_folio_has_ffs(folio))
	return;

> +			bool dirty;
> +
> +			clear_length = clear_end - clear_start;
> +			dirty = f2fs_ffs_clear_subrange_dirty(folio,
> +							clear_start, clear_length);
> +			ffs_clear_subrange_uptodate(folio, clear_start,
> +							clear_length);
> +
> +			/*
> +			 * If the truncated subrange happens to clear the
> +			 * remaining dirty bitmap of the whole folio, cancel
> +			 * the folio-level dirty state.
> +			 */
> +			if (!dirty && folio_test_dirty(folio)) {
> +				inode_dec_dirty_pages(inode);
> +				f2fs_remove_dirty_inode(inode);
> +				folio_cancel_dirty(folio);
> +			}
> +		}
>   		return;
> +	}
>   
>   	if (folio_test_dirty(folio)) {
>   		if (inode->i_ino == F2FS_META_INO(sbi)) {

