Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794194290;
	b=sjQ2YzD/7FNtJ2tDQLL5QtMPbsouFp8tXB9evtmAEC8IhAmxAktqdttcMe6L9BZ68Xhv
	 EN+9FzAnUy4PGEyrfVQpBodDPrVRY7jtuJbTpYWQrlYvNEsq94LV3pBjriWoeQL98/WG9
	 a9z3+4hBKmdBT5RKsHwR13O80wqGIB3fHVsiVjGa3kPX4yq7YF68d+Q/csnqmYVZwdYMw
	 S0a7t7AcUeslraYTYVEE20nxsj7d80e4cFg3Cvpbavekj7cbu/wtmj7oUWZdY2V3pEBBT
	 VlG7YPmv+4iTQRZ9zqJnAt62CDqNmyYps39p0yX74UjH4r43JU+IM1z0GHsQ0jFQz1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794194290;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=WXlWHDUZdvRcJdaGkXE2tCCp1TJfdeXYbXIYIJVs0tA=;
	b=weG1lbroe3lugCFn2lACDjeVRNvteGDvWr0R9NopK7cJLNADMfl5G+ZjeYJwmL1m07Z8
	 u3283+U9nPOZ9427t6kQta5GaoS1X4CKEeyeY2MnOp/HC79f2TyVv+WNmWt0RYpboayAK
	 4+WEtkoG18RCNmaWFzEjV/tIaJJ2ebSogjgGmhgcoIls+8Be8qSj2M2hbzYFPty85mRZG
	 BV1KDjDkjg7j2ZkqrZkuGyn0Z9lI2GRIi8jOqTZCoQ/56FeOU8Vrg+8rVuC1OyqFLwjeF
	 qXidZfNINTabccfDjYYoSgNlHlRzEqnoCMPPdO5yxwTOriLXnbCHLQIHMe0uH2Yk/6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eqYhmRZX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA43F606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eqYhmRZX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408BB1F0089F;
	Mon,  9 Nov 2026 03:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794194289;
	bh=WXlWHDUZdvRcJdaGkXE2tCCp1TJfdeXYbXIYIJVs0tA=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=eqYhmRZXHXlheEs6f/1xIGsFp6mf+8alG+djq1BwnfS7i8ahEUmZOmXkyDnBPp7yN
	 tLl6c0dsAD/Y2v2oK6sE/Dau3+Q/3FLoDZ3qGtDD1kTmaMLIEdn5p4ujwtYGtW1FLu
	 JEJi1u5HMuolAce/SBKEBqwz+VvuB1erDG6WizvKlzREO7a+KfCTbcnMKQ1cIs16f5
	 eDIWa2G9MqiLv6SpNgYcZPYilrVfeixFoS4cx+xAKwW41aYQNLJtAnk1Knpjpz9RGw
	 xBriuvqWiTVqHIl/gbDCsv6ZxNzrjEco5UX+yMyJ2pxSj5qFyh3RMmnCGiesQOn/a2
	 034T9GqRoddpw==
Message-ID: <610e99a6-c622-4a2e-9c6d-a57367994c42@kernel.org>
Date: Mon, 9 Nov 2026 11:18:06 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH 16/20] f2fs: preserve inline data in subpage
 block mode
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261102193952.3002018-1-daeho43@gmail.com>
 <20261102193952.3002018-17-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261102193952.3002018-17-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 03:39, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> A write to an inline inode converted it to a regular inode whenever the
> folio held multiple blocks, allocating a block even for small files.
> Convert only when the write goes beyond MAX_INLINE_DATA; otherwise read
> the inline data into the folio and write it back to the inode block in
> f2fs_write_cache_folios().
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   fs/f2fs/data.c | 59 ++++++++++++++++++++++++++++++++++++++++++--------
>   1 file changed, 50 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 4e4d1b0d6004..a7cc7231b572 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -4732,6 +4732,21 @@ static int f2fs_write_cache_folios(struct address_space *mapping,
>   			}
>   		}
>   
> +		if (f2fs_has_inline_data(inode)) {
> +			err = f2fs_write_inline_data(inode, folio);
> +			if (!err) {
> +				f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
> +							folio_size(folio));
> +				inode_sub_dirty_blocks(inode, f2fs_blocks_per_folio(sbi, folio));
> +				goto retry_out;
> +			}
> +			if (err != -EAGAIN) {

IIUC, -EAGAIN should not happen here? because we only convert inline to non inline
inode after we hold folio lock and inode cache lock, since we have held folio lock,
so there is no way to convert?

Thanks,

> +				folio_redirty_for_writepage(wbc, folio);
> +				goto retry_out;
> +			}
> +			err = 0;
> +		}
> +
>   		folio_start_writeback(folio);
>   
>   		/*
> @@ -4913,8 +4928,7 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
>   	account_writeback(inode, true);
>   
>   	blk_start_plug(&plug);
> -	if (f2fs_has_multiblock_folios(inode) &&
> -	    !f2fs_has_inline_data(inode))
> +	if (f2fs_has_multiblock_folios(inode))
>   		ret = f2fs_write_cache_folios(mapping, wbc, io_type);
>   	else
>   		ret = f2fs_write_cache_pages(mapping, wbc, io_type);
> @@ -4981,6 +4995,16 @@ void f2fs_write_failed(struct inode *inode, loff_t to)
>   	}
>   }
>   
> +/* Fill @folio from the inline data for a write within the inline area */
> +static void prepare_inline_write_begin(struct inode *inode,
> +		struct folio *folio, struct f2fs_cached_block *ientry)
> +{
> +	f2fs_do_read_inline_data(folio, ientry);
> +	set_inode_flag(inode, FI_DATA_EXIST);
> +	if (inode->i_nlink)
> +		f2fs_cache_set_inline(ientry);
> +}
> +
>   static int prepare_write_begin(struct f2fs_sb_info *sbi,
>   			struct folio *folio, loff_t pos, unsigned int len,
>   			block_t *blk_addr, bool *node_changed)
> @@ -5034,10 +5058,7 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
>   
>   	if (f2fs_has_inline_data(inode)) {
>   		if (pos + len <= MAX_INLINE_DATA(inode)) {
> -			f2fs_do_read_inline_data(folio, ientry);
> -			set_inode_flag(inode, FI_DATA_EXIST);
> -			if (inode->i_nlink)
> -				f2fs_cache_set_inline(ientry);
> +			prepare_inline_write_begin(inode, folio, ientry);
>   			goto out;
>   		}
>   		err = f2fs_convert_inline_folio(&dn, folio);
> @@ -5454,7 +5475,8 @@ static int f2fs_write_begin(const struct kiocb *iocb,
>   	 * and #0 page. The locking rule for inline_data conversion should be:
>   	 * folio_lock(folio #0) -> folio_lock(inode_page)
>   	 */
> -	if (index != 0 || f2fs_has_subpage_blocks(sbi)) {
> +	if (index != 0 || (f2fs_has_subpage_blocks(sbi) &&
> +			   pos + len > MAX_INLINE_DATA(inode))) {
>   		err = f2fs_convert_inline_inode(inode);
>   		if (err)
>   			goto fail;
> @@ -5510,6 +5532,23 @@ static int f2fs_write_begin(const struct kiocb *iocb,
>   	blen = min_t(unsigned int, len,
>   		     folio_size(folio) - offset_in_folio(folio, pos));
>   
> +	if (f2fs_has_inline_data(inode) && f2fs_is_multiblock_folio(sbi, folio)) {
> +		struct f2fs_lock_context lc;
> +		struct f2fs_cached_block *ientry;
> +
> +		f2fs_map_lock(sbi, &lc, F2FS_GET_BLOCK_PRE_AIO);
> +		ientry = f2fs_get_inode_cache(sbi, inode->i_ino);
> +		if (IS_ERR(ientry)) {
> +			f2fs_map_unlock(sbi, &lc, F2FS_GET_BLOCK_PRE_AIO);
> +			err = PTR_ERR(ientry);
> +			goto put_folio;
> +		}
> +		prepare_inline_write_begin(inode, folio, ientry);
> +		f2fs_put_cache(ientry, true);
> +		f2fs_map_unlock(sbi, &lc, F2FS_GET_BLOCK_PRE_AIO);
> +		return 0;
> +	}
> +
>   	/*
>   	 * Flush the cached IO of this folio before touching it, especially
>   	 * for the large folio prepare below which reads and updates subpage
> @@ -5618,7 +5657,8 @@ static int f2fs_write_end(const struct kiocb *iocb,
>   	if (!folio_test_uptodate(folio)) {
>   		if (unlikely(copied != len)) {
>   			copied = 0;
> -		} else if (f2fs_is_multiblock_folio(F2FS_I_SB(inode), folio)) {
> +		} else if (f2fs_is_multiblock_folio(F2FS_I_SB(inode), folio) &&
> +			   !f2fs_has_inline_data(inode)) {
>   			f2fs_ffs_mark_subrange_uptodate(folio,
>   					offset_in_folio(folio, pos), len);
>   		} else {
> @@ -5645,7 +5685,8 @@ static int f2fs_write_end(const struct kiocb *iocb,
>   	if (!copied)
>   		goto unlock_out;
>   
> -	if (f2fs_is_multiblock_folio(F2FS_I_SB(inode), folio))
> +	if (f2fs_is_multiblock_folio(F2FS_I_SB(inode), folio) &&
> +	    !f2fs_has_inline_data(inode))
>   		f2fs_ffs_mark_subrange_dirty(folio, offset_in_folio(folio, pos),
>   								   copied);
>   	folio_mark_dirty(folio);

