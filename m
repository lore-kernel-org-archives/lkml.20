Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822F2320CBE
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789089237; cv=none; b=PmBLzvyy+DeJvpWhSfuC9sqvlRQ50efZRSGuG3/ZDkfmQsbPhC5WTcP20p0luDUwpH2UCJMlxesKIoEKSXng+KxP/CWp8BS3k+/hgMLZpmKkYlfsF7a6JcbKAoIbxfU+AeRJ1JWK3ysA/GPD175qa9fs47T2aEApFM5BtCmDtKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789089237; c=relaxed/simple;
	bh=JAbBn6+hxGfOvulMZwM4FolY1xiD0MrV74k9F72MQzk=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bs7hlIK5kvqKq+B3NVPYyos86sAsmQdoXGSXtiQXfBEZHWXwk7rG4RUd92AyREKFPqERLu3TdTxj5Bab54jWAz0dmr0kwwpG7R3GRdLAOEPiN38m331eXqROTfP4LvXw4Kj8yRDoRSrSOt5OA6XMUIiyo/um9qRZRzoF/oWqgEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MpOwWAOa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MpOwWAOa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8F991F000FF;
	Fri, 11 Sep 2026 01:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789089231;
	bh=BieisaAQyLrvXLmQaVGGS1nqBTmDs9Q9Xm2RQGwma2c=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=MpOwWAOakyFPXQUylSmPrH+JP7ID1p0sKzffYfvMFZXzz4y9uNB9DbapkHc36mpd5
	 tRPPIY72fUmEofrSznpEGb9BVLCzjfnuLp6ePF9RiW+lqEkOcBsMlskbyK8tV3XfNX
	 QWbxmjYaFYDPgjnOhW6KBIa3O6Ldx/tVXianHXusBaICoCK7/JJJ0j8GxCRkT6Vh1r
	 9Sjo/j3lnekaiXvJbA1QY4rNVa/LzfzddzVBIb4qbFPicalSFJbMOuCSkhY8sFmyH0
	 A0bcDRJ5t2P3iFj1hGyk3LW9SrL93BaOGlAFGtJU0wFGootyxyW6yXMyblzpQQsv/s
	 xTm4PtcnjNtOg==
Message-ID: <e9ba1c73-430f-482b-bf6d-f6f77139f52d@kernel.org>
Date: Fri, 11 Sep 2026 09:13:47 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Zhiguo Niu <zhiguo.niu@unisoc.com>, stable@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid folio->mapping dereference
 in is_{meta, node}_folio()
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260910022026.3301257-1-chao@kernel.org>
 <aqMgnpBYj0zBpioI@google.com>
 <9c47a6fb-93b3-459b-8f90-ab89ab3e2ce4@kernel.org>
 <aqNUWanfyje0_PNr@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <aqNUWanfyje0_PNr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/26 09:07, Jaegeuk Kim wrote:
> On 09/11, Chao Yu wrote:
>> On 9/11/26 05:26, Jaegeuk Kim wrote:
>>> Can you rebase on -dev?
>>
>> Jaegeuk, this patch is based on "[PATCH] f2fs: parameterize node helpers and macros",
>>
>> Can we apply that fix first and then current one? or do you prefer the reversed order?
> 
> Ok, I applied, but it has conflicts with your previous metadata cache patches

Thanks,

> due to is_meta_folio and is_node_folio changes. Let me know, once you have next
> version, so that I can apply on top of dev-test.

Yes, I have a rebased version locally, let me refactor the patchset w/ your cleanup
patches as v7, will update soon.

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>> On 09/10, Chao Yu via Linux-f2fs-devel wrote:
>>>> From: Chao Yu <chao@kernel.org>
>>>>
>>>> Otherwise, it may cause NULL pointer dereference in race condition:
>>>>
>>>> Thread A			Thread B
>>>> 				- f2fs_setattr
>>>> 				 - f2fs_truncate
>>>> 				  - f2fs_truncate_blocks
>>>> 			    	   - f2fs_do_truncate_blocks
>>>> 				    - f2fs_truncate_inode_blocks
>>>> 				     - truncate_dnode
>>>> 				      - truncate_node
>>>> 				       - invalidate_mapping_pages
>>>> 				        - folio->mapping = NULL
>>>> - folio_lock
>>>> - is_node_folio
>>>>    - F2FS_F_SB(folio): dereference on folio->mapping
>>>>
>>>> Cc: stable@kernel.org
>>>> Fixes: 019a8912425e ("f2fs: introduce is_{meta,node}_folio")
>>>> Reported-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
>>>> Closes: https://lore.kernel.org/linux-f2fs-devel/c5d29b31-e764-4782-9639-be84b1b2bfc2@kernel.org
>>>> Signed-off-by: Chao Yu <chao@kernel.org>
>>>> ---
>>>>    fs/f2fs/checkpoint.c |  4 ++--
>>>>    fs/f2fs/data.c       |  7 ++++---
>>>>    fs/f2fs/f2fs.h       | 10 +++++-----
>>>>    fs/f2fs/gc.c         |  2 +-
>>>>    fs/f2fs/node.c       | 22 +++++++++++-----------
>>>>    fs/f2fs/segment.c    |  2 +-
>>>>    6 files changed, 24 insertions(+), 23 deletions(-)
>>>>
>>>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>>>> index 712c4508f38c..dfbfe42086f2 100644
>>>> --- a/fs/f2fs/checkpoint.c
>>>> +++ b/fs/f2fs/checkpoint.c
>>>> @@ -291,7 +291,7 @@ static struct folio *__get_meta_folio(struct f2fs_sb_info *sbi, pgoff_t index,
>>>>    	f2fs_update_iostat(sbi, NULL, FS_META_READ_IO, F2FS_BLKSIZE(sbi));
>>>>    	folio_lock(folio);
>>>> -	if (unlikely(!is_meta_folio(folio))) {
>>>> +	if (unlikely(!is_meta_folio(sbi, folio))) {
>>>>    		f2fs_folio_put(folio, true);
>>>>    		goto repeat;
>>>>    	}
>>>> @@ -638,7 +638,7 @@ long f2fs_sync_meta_pages(struct f2fs_sb_info *sbi, long nr_to_write,
>>>>    			folio_lock(folio);
>>>> -			if (unlikely(!is_meta_folio(folio))) {
>>>> +			if (unlikely(!is_meta_folio(sbi, folio))) {
>>>>    continue_unlock:
>>>>    				folio_unlock(folio);
>>>>    				continue;
>>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>>> index 93ed8416a289..0da78bf05ac0 100644
>>>> --- a/fs/f2fs/data.c
>>>> +++ b/fs/f2fs/data.c
>>>> @@ -172,7 +172,8 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
>>>>    			dec_page_count(F2FS_F_SB(folio), __read_io_type(folio));
>>>>    		if (bio->bi_status == BLK_STS_OK &&
>>>> -			F2FS_F_SB(folio)->node_inode && is_node_folio(folio) &&
>>>> +			F2FS_F_SB(folio)->node_inode &&
>>>> +			is_node_folio(F2FS_F_SB(folio), folio) &&
>>>>    			f2fs_sanity_check_node_footer(F2FS_F_SB(folio),
>>>>    				folio, folio->index, NODE_TYPE_REGULAR, true))
>>>>    			bio->bi_status = BLK_STS_IOERR;
>>>> @@ -359,12 +360,12 @@ static void f2fs_write_end_bio(struct bio *bio)
>>>>    			}
>>>>    		}
>>>> -		if (is_node_folio(folio)) {
>>>> +		if (is_node_folio(sbi, folio)) {
>>>>    			f2fs_sanity_check_node_footer(sbi, folio,
>>>>    				folio->index, NODE_TYPE_REGULAR, true);
>>>>    			f2fs_bug_on(sbi, folio->index != nid_of_node(sbi, folio));
>>>>    		}
>>>> -		if (f2fs_in_warm_node_list(folio))
>>>> +		if (f2fs_in_warm_node_list(sbi, folio))
>>>>    			f2fs_del_fsync_node_entry(sbi, folio);
>>>>    		dec_page_count(sbi, type);
>>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>>> index 693153cbd8a0..ebc621f302e1 100644
>>>> --- a/fs/f2fs/f2fs.h
>>>> +++ b/fs/f2fs/f2fs.h
>>>> @@ -2371,14 +2371,14 @@ static inline struct address_space *NODE_MAPPING(struct f2fs_sb_info *sbi)
>>>>    	return sbi->node_inode->i_mapping;
>>>>    }
>>>> -static inline bool is_meta_folio(struct folio *folio)
>>>> +static inline bool is_meta_folio(struct f2fs_sb_info *sbi, struct folio *folio)
>>>>    {
>>>> -	return folio->mapping == META_MAPPING(F2FS_F_SB(folio));
>>>> +	return folio->mapping == META_MAPPING(sbi);
>>>>    }
>>>> -static inline bool is_node_folio(struct folio *folio)
>>>> +static inline bool is_node_folio(struct f2fs_sb_info *sbi, struct folio *folio)
>>>>    {
>>>> -	return folio->mapping == NODE_MAPPING(F2FS_F_SB(folio));
>>>> +	return folio->mapping == NODE_MAPPING(sbi);
>>>>    }
>>>>    static inline bool is_sbi_flag_set(struct f2fs_sb_info *sbi, unsigned int type)
>>>> @@ -4063,7 +4063,7 @@ enum node_type;
>>>>    int f2fs_check_nid_range(struct f2fs_sb_info *sbi, nid_t nid);
>>>>    bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type);
>>>> -bool f2fs_in_warm_node_list(struct folio *folio);
>>>> +bool f2fs_in_warm_node_list(struct f2fs_sb_info *sbi, struct folio *folio);
>>>>    void f2fs_init_fsync_node_info(struct f2fs_sb_info *sbi);
>>>>    void f2fs_del_fsync_node_entry(struct f2fs_sb_info *sbi, struct folio *folio);
>>>>    void f2fs_reset_fsync_node_info(struct f2fs_sb_info *sbi);
>>>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>>>> index aedb45c8ee4a..c70deac9f1a3 100644
>>>> --- a/fs/f2fs/gc.c
>>>> +++ b/fs/f2fs/gc.c
>>>> @@ -1431,7 +1431,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
>>>>    						F2FS_BLKSIZE(fio.sbi));
>>>>    		folio_lock(mfolio);
>>>> -		if (unlikely(!is_meta_folio(mfolio) ||
>>>> +		if (unlikely(!is_meta_folio(fio.sbi, mfolio) ||
>>>>    			     !folio_test_uptodate(mfolio))) {
>>>>    			err = -EIO;
>>>>    			f2fs_folio_put(mfolio, true);
>>>> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
>>>> index 8c150d4966e5..f16144b75d11 100644
>>>> --- a/fs/f2fs/node.c
>>>> +++ b/fs/f2fs/node.c
>>>> @@ -332,10 +332,10 @@ static unsigned int __gang_lookup_nat_set(struct f2fs_nm_info *nm_i,
>>>>    							start, nr);
>>>>    }
>>>> -bool f2fs_in_warm_node_list(struct folio *folio)
>>>> +bool f2fs_in_warm_node_list(struct f2fs_sb_info *sbi, struct folio *folio)
>>>>    {
>>>> -	return is_node_folio(folio) && IS_DNODE(F2FS_F_SB(folio), folio) &&
>>>> -					is_cold_node(F2FS_F_SB(folio), folio);
>>>> +	return is_node_folio(sbi, folio) && IS_DNODE(sbi, folio) &&
>>>> +					is_cold_node(sbi, folio);
>>>>    }
>>>>    void f2fs_init_fsync_node_info(struct f2fs_sb_info *sbi)
>>>> @@ -1296,7 +1296,7 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from)
>>>>    			goto fail;
>>>>    		if (offset[1] == 0 && get_nid(sbi, folio, offset[0], true)) {
>>>>    			folio_lock(folio);
>>>> -			BUG_ON(!is_node_folio(folio));
>>>> +			BUG_ON(!is_node_folio(sbi, folio));
>>>>    			set_nid(sbi, folio, offset[0], 0, true);
>>>>    			folio_unlock(folio);
>>>>    		}
>>>> @@ -1612,7 +1612,7 @@ static struct folio *__get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid,
>>>>    	folio_lock(folio);
>>>> -	if (unlikely(!is_node_folio(folio))) {
>>>> +	if (unlikely(!is_node_folio(sbi, folio))) {
>>>>    		f2fs_folio_put(folio, true);
>>>>    		goto repeat;
>>>>    	}
>>>> @@ -1731,7 +1731,7 @@ static struct folio *last_fsync_dnode(struct f2fs_sb_info *sbi, nid_t ino)
>>>>    			folio_lock(folio);
>>>> -			if (unlikely(!is_node_folio(folio))) {
>>>> +			if (unlikely(!is_node_folio(sbi, folio))) {
>>>>    continue_unlock:
>>>>    				folio_unlock(folio);
>>>>    				continue;
>>>> @@ -1841,7 +1841,7 @@ static bool __write_node_folio(struct folio *folio, bool atomic, bool do_fsync,
>>>>    				f2fs_need_dentry_mark(sbi, ino_of_node(sbi, folio)));
>>>>    	/* should add to global list before clearing PAGECACHE status */
>>>> -	if (f2fs_in_warm_node_list(folio)) {
>>>> +	if (f2fs_in_warm_node_list(sbi, folio)) {
>>>>    		seq = f2fs_add_fsync_node_entry(sbi, folio);
>>>>    		if (seq_id)
>>>>    			*seq_id = seq;
>>>> @@ -1965,7 +1965,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>>>>    			folio_lock(folio);
>>>> -			if (unlikely(!is_node_folio(folio))) {
>>>> +			if (unlikely(!is_node_folio(sbi, folio))) {
>>>>    continue_unlock:
>>>>    				folio_unlock(folio);
>>>>    				continue;
>>>> @@ -2023,7 +2023,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>>>>    		f2fs_debug(sbi, "Retry to write fsync mark: ino=%u, idx=%lx",
>>>>    			   ino, last_folio->index);
>>>>    		folio_lock(last_folio);
>>>> -		if (unlikely(!is_node_folio(last_folio))) {
>>>> +		if (unlikely(!is_node_folio(sbi, last_folio))) {
>>>>    			f2fs_folio_put(last_folio, true);
>>>>    			ret = -EAGAIN;
>>>>    			goto out;
>>>> @@ -2101,7 +2101,7 @@ void f2fs_flush_inline_data(struct f2fs_sb_info *sbi)
>>>>    			folio_lock(folio);
>>>> -			if (unlikely(!is_node_folio(folio)))
>>>> +			if (unlikely(!is_node_folio(sbi, folio)))
>>>>    				goto unlock;
>>>>    			if (!folio_test_dirty(folio))
>>>>    				goto unlock;
>>>> @@ -2173,7 +2173,7 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
>>>>    			else if (!folio_trylock(folio))
>>>>    				continue;
>>>> -			if (unlikely(!is_node_folio(folio))) {
>>>> +			if (unlikely(!is_node_folio(sbi, folio))) {
>>>>    continue_unlock:
>>>>    				folio_unlock(folio);
>>>>    				continue;
>>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>>> index 0b6267d0354e..ffdd2c510b3c 100644
>>>> --- a/fs/f2fs/segment.c
>>>> +++ b/fs/f2fs/segment.c
>>>> @@ -4161,7 +4161,7 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
>>>>    			__func__, fio->ino, folio->index, type,
>>>>    			fio->old_blkaddr, fio->new_blkaddr, err);
>>>>    		folio_end_writeback(folio);
>>>> -		if (f2fs_in_warm_node_list(folio))
>>>> +		if (f2fs_in_warm_node_list(fio->sbi, folio))
>>>>    			f2fs_del_fsync_node_entry(fio->sbi, folio);
>>>>    		f2fs_bug_on(fio->sbi, !is_set_ckpt_flags(fio->sbi,
>>>>    							CP_ERROR_FLAG));
>>>> -- 
>>>> 2.49.0
>>>>
>>>>
>>>>
>>>> _______________________________________________
>>>> Linux-f2fs-devel mailing list
>>>> Linux-f2fs-devel@lists.sourceforge.net
>>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>>

