Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098545;
	b=m2gCLQAssg8DWE81N/sVlpTSv/7N1qnV9Q+EOPtRbdGNmOpQzK47gSv7HVayMvbCBgXd
	 WFtzpYqfETzcqFO92qj+JBwklE/RLifI0LTpmj4C0bB2CSa3g0UjXQwiAICzQnxGtS91z
	 nAdhxfJzw9WrepsMbFBKpmgbz5XoMw8vCRXdevnSeRRpPS7KA2TywRZjJsMHOnjQdE6cH
	 r0/tsOP6rITuQoFH8vT3w6vIYgyAE+7LwWmP7lA/ciLZtimC7sxmKJ40djnG/g0vDjMQh
	 HwrNNptV4N/1vjp1bNas1QoNLces/v3ehWb+LhP4ixyivSZPHEmY6xoZLNGA8lhMuRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098545;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=uAGZu5SCmBqK7hylxL2VkEb+fk+/R3kUUa7vIsGgEXQ=;
	b=VeX1ero0+KskJuT/Xw3t2dTXnDmSeGCS3WfmeSQda6eeSLI1Id62OwBCc9ye3jN/1BR7
	 F6YRWPLvmpPBdE4tzPhYTkmDVW15aRFrHdC0QUptmYY19EPei6AwVsHXpYV+AqIx9QINw
	 u/2Glx8sqIQzoNoz38/6jEjjvd5EdTzMg1hQ3NEy4DsAHPP3l0/tg6vlKXLEi67wh/a3C
	 PlicSvkYnDfXUom2fU6di5rIGycM076UcBUOYvwjv/QGl4WYjdT9oIFZrEpTzmU/gyd52
	 NLlLpAirS+2IstPskodgv2TpKHaD/6kFLsCRomCL1+4PwriPatjEXJ2FGAy2eL4XHyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Shzpbu1F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4958606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Shzpbu1F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE401F01205;
	Tue, 27 Oct 2026 10:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793098544;
	bh=uAGZu5SCmBqK7hylxL2VkEb+fk+/R3kUUa7vIsGgEXQ=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=Shzpbu1F+d6apNVTvLEiVZa8Ms90UJcdktuCJEZGxG/WC36z8etZZUUD0ISM511q/
	 F3pA2f5DHR8xKMElTR5Gc+STSqEcrw4PY4wKmz7Yiby/Ry0VDRLVAd8lJG3VdpUb2S
	 4Tv3iK/lVU7SOa5UbwLrxBjYHjkgSmwySbaG0GAFZFTi88Y+D1sI8/RdSoWPrKDPl7
	 bo0O6K+7TzLPek0GuJCnU80sZ2Od2QwL74K2iaZK0jKxoFLgcCktpZEkiD/UOSpmto
	 XgHptSO8xD1nIYloO8meuaunSYpHGORjzEC3su3GAIZInPPuwprxf7Uhgk2chm+PXM
	 fvGONeJpkiNXw==
Message-ID: <386ee5e4-d4f4-4040-aa4d-0ced9d992e3e@kernel.org>
Date: Tue, 27 Oct 2026 18:55:40 +0800
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
Cc: chao@kernel.org, Nanzhe Zhao <nzzhao.sigma@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>,
 Daeho Jeong <daehojeong@google.com>, Pengfei Li <lipengfei28@xiaomi.com>,
 Dev Jain <Dev.Jain@arm.com>, David Hildenbrand <David.Hildenbrand@arm.com>,
 linux-kernel@vger.kernel.org, Bo Zhang <zhangbo56@xiaomi.com>,
 Kalesh Singh <kaleshsingh@google.com>, Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [PATCH v7 08/15] f2fs: make GC migration large-folio aware
To: Nanzhe Zhao <nzzhao@126.com>
References: <20261026033745.784107-1-nzzhao.sigma@gmail.com>
 <20261026033745.784107-9-nzzhao.sigma@gmail.com>
 <0e93d246-ba73-4e8a-af95-328c22570339@kernel.org>
 <1c285a51.7734.1a17cd80c16.Coremail.nzzhao@126.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1c285a51.7734.1a17cd80c16.Coremail.nzzhao@126.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/27/26 18:11, Nanzhe Zhao wrote:
> At 2026-10-27 17:37:22, "Chao Yu" <chao@kernel.org> wrote:
>> On 10/26/26 11:37, Nanzhe Zhao wrote:
>>> From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
>>>
>>> GC can operate on a 4K block that is cached inside a large folio.
>>> The data lookup helpers therefore need to test and update uptodate
>>> state for the addressed subpage instead of rejecting large folios or
>>> treating the whole folio as the target block.
>>>
>>> Let f2fs_get_read_data_folio() and f2fs_get_lock_data_folio() to use
>>> subpage uptodate state. Submit single-block reads at the requested
>>> folio offset and zero only the addressed 4K range for NEW_ADDR.
>>>
>>> Also update `move_data_page` to mark, clear, and restore dirty
>>> state for the target subpage, and submit write I/O with the subpage
>>> offset recorded in f2fs_io_info.
>>>
>>> The write_pages_pending reference is taken by f2fs_do_write_data_page()
>>> and dropped from its common error path, so a block that is truncated
>>> concurrently no longer leaks the counter.
>>>
>>> Reported-by: kernel test robot <yi1.lai@intel.com>
>>> Closes: https://lore.kernel.org/oe-lkp/202610081027.b13dcf10-lkp@intel.com
>>> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
>>> ---
>>>  fs/f2fs/data.c    | 70 +++++++++++++++++++++++++++++++++--------------
>>>  fs/f2fs/f2fs.h    |  1 +
>>>  fs/f2fs/gc.c      | 28 +++++++++++++++----
>>>  fs/f2fs/segment.c |  2 +-
>>>  4 files changed, 75 insertions(+), 26 deletions(-)
>>>
>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>> index d027c949823b..b3ada22cb0cb 100644
>>> --- a/fs/f2fs/data.c
>>> +++ b/fs/f2fs/data.c
>>> @@ -1679,20 +1679,16 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
>>>  	struct dnode_of_data dn;
>>>  	struct folio *folio;
>>>  	int err;
>>> -retry:
>>> +
>>>  	folio = f2fs_grab_cache_folio(mapping, index, for_write);
>>>  	if (IS_ERR(folio))
>>>  		return folio;
>>>  
>>>  	if (folio_test_large(folio)) {
>>> -		pgoff_t folio_index = mapping_align_index(mapping, index);
>>> -		unsigned long nr_pages = folio_nr_pages(folio);
>>> -
>>> -		f2fs_folio_put(folio, true);
>>> -		invalidate_inode_pages2_range(mapping, folio_index,
>>> -				folio_index + nr_pages - 1);
>>> -		f2fs_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
>>> -		goto retry;
>>> +		if (!f2fs_ffs_find_or_alloc(folio)) {
>>> +			err = -ENOMEM;
>>> +			goto put_err;
>>> +		}
>>>  	}
>>>  
>>>  	if (f2fs_lookup_read_extent_cache_block(inode, index,
>>> @@ -1728,7 +1724,7 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
>>>  		goto put_err;
>>>  	}
>>>  got_it:
>>> -	if (folio_test_uptodate(folio)) {
>>> +	if (f2fs_ffs_test_blk_uptodate(folio, index)) {
>>>  		folio_unlock(folio);
>>>  		return folio;
>>>  	}
>>> @@ -1741,9 +1737,11 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
>>>  	 * f2fs_init_inode_metadata.
>>>  	 */
>>>  	if (dn.data_blkaddr == NEW_ADDR) {
>>> -		folio_zero_segment(folio, 0, folio_size(folio));
>>> -		if (!folio_test_uptodate(folio))
>>> -			folio_mark_uptodate(folio);
>>> +		size_t offset = offset_in_folio(folio,
>>> +						(loff_t)index << PAGE_SHIFT);
>>> +
>>> +		folio_zero_segment(folio, offset, offset + PAGE_SIZE);
>>> +		f2fs_ffs_mark_subrange_uptodate(folio, offset, PAGE_SIZE);
>>>  		folio_unlock(folio);
>>>  		return folio;
>>>  	}
>>> @@ -1803,7 +1801,6 @@ struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
>>>  
>>>  	/* wait for read completion */
>>>  	folio_lock(folio);
>>> -
>>>  	if (unlikely(folio->mapping != mapping)) {
>>>  		f2fs_folio_put(folio, true);
>>>  		return ERR_PTR(-EIO);
>>> @@ -1812,7 +1809,7 @@ struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
>>>  	/*
>>>  	 * ffs can be released while the folio was unlocked above.  Rebuild it
>>>  	 * for a fully uptodate folio; a partially uptodate one cannot be
>>> -	 * rebuilt and will fail the uptodate check below.
>>> +	 * rebuilt and will fail the subpage check below.
>>>  	 */
>>>  	if (folio_test_large(folio) && !f2fs_folio_has_ffs(folio)) {
>>>  		if (!f2fs_ffs_find_or_alloc(folio)) {
>>> @@ -1821,7 +1818,7 @@ struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
>>>  		}
>>>  	}
>>>  
>>> -	if (unlikely(!folio_test_uptodate(folio))) {
>>> +	if (unlikely(!f2fs_ffs_test_blk_uptodate(folio, index))) {
>>>  		f2fs_folio_put(folio, true);
>>>  		return ERR_PTR(-EIO);
>>>  	}
>>> @@ -2970,6 +2967,22 @@ static void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
>>>  		folio_mark_uptodate(folio);
>>>  }
>>>  
>>> +bool f2fs_ffs_test_blk_dirty(const struct folio *folio, pgoff_t index)
>>> +{
>>> +	struct f2fs_folio_state *ffs;
>>> +	unsigned int idx, nr_subpages;
>>> +
>>> +	f2fs_bug_on(F2FS_F_SB(folio), !folio_contains(folio, index));
>>> +
>>> +	if (!f2fs_folio_has_ffs(folio))
>>> +		return folio_test_dirty(folio);
>>> +
>>> +	ffs = (struct f2fs_folio_state *)folio->private;
>>> +	nr_subpages = folio_nr_pages(folio);
>>> +	idx = index - folio->index;
>>> +	return test_bit(nr_subpages + idx, ffs->state);
>>> +}
>>> +
>>>  static unsigned int __ffs_mark_subrange_dirty(struct folio *folio,
>>>  			struct f2fs_folio_state *ffs, size_t offset, size_t len)
>>>  {
>>> @@ -3063,7 +3076,6 @@ bool f2fs_ffs_clear_subrange_dirty_and_test(struct folio *folio, size_t offset,
>>>  
>>>  	return dirty;
>>>  }
>>> -
>>>  static unsigned int ffs_next_dirty_subpage(struct f2fs_folio_state *ffs,
>>>  			const struct folio *folio, unsigned int start,
>>>  			unsigned int end)
>>> @@ -3561,7 +3573,7 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
>>>  		return true;
>>>  
>>>  	if (fio) {
>>> -		if (page_private_gcing(fio->page))
>>> +		if (folio_test_f2fs_gcing(fio->folio))
>>>  			return true;
>>>  		if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
>>>  			f2fs_is_checkpointed_data(sbi, fio->old_blkaddr)))
>>> @@ -3587,8 +3599,11 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>>>  	struct dnode_of_data dn;
>>>  	struct node_info ni;
>>>  	struct f2fs_lock_context lc;
>>> +	struct f2fs_folio_state *ffs;
>>>  	bool ipu_force = false;
>>>  	bool atomic_commit;
>>> +	bool pending_added = false;
>>> +	bool submitted = false;
>>>  	int err = 0;
>>>  
>>>  	/* Use COW inode to make dnode_of_data for atomic write */
>>> @@ -3617,8 +3632,11 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>>>  		return -EINVAL;
>>>  
>>>  	/* Deadlock due to between page->lock and f2fs_lock_op */
>>> -	if (fio->need_lock == LOCK_REQ && !f2fs_trylock_op(fio->sbi, &lc))
>>> +	if (fio->need_lock == LOCK_REQ && !f2fs_trylock_op(fio->sbi, &lc)) {
>>> +		if (!f2fs_ffs_has_dirty_subpage(folio))
>>> +			folio_clear_f2fs_gcing(folio);
>>>  		return -EAGAIN;
>>> +	}
>>>  
>>>  	err = f2fs_get_dnode_of_data(&dn, F2FS_FIO_LBLK(fio),
>>>  				     LOOKUP_NODE);
>>> @@ -3630,7 +3648,6 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>>>  	/* This page is already truncated */
>>>  	if (fio->old_blkaddr == NULL_ADDR) {
>>>  		folio_clear_uptodate(folio);
>>> -		folio_clear_f2fs_gcing(folio);
>>>  		goto out_writepage;
>>>  	}
>>>  got_it:
>>> @@ -3680,6 +3697,11 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>>>  	fio->version = ni.version;
>>>  
>>>  	__folio_start_writeback(folio, folio_test_dirty(folio));
>>> +	if (f2fs_folio_has_ffs(folio)) {
>>> +		ffs = (struct f2fs_folio_state *)folio->private;
>>> +		atomic_inc(&ffs->write_pages_pending);
>>> +		pending_added = true;
>>> +	}
>>>  
>>>  	if (fio->compr_blocks && fio->old_blkaddr == COMPRESS_ADDR)
>>>  		f2fs_i_compr_blocks_update(inode, fio->compr_blocks - 1, false);
>>> @@ -3694,6 +3716,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>>>  		err = -EIO;
>>>  		goto out_writepage;
>>>  	}
>>> +	submitted = true;
>>>  	set_inode_flag(inode, FI_APPEND_WRITE);
>>>  	if (atomic_commit)
>>>  		folio_clear_f2fs_atomic(folio);
>>> @@ -3702,6 +3725,13 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>>>  out:
>>>  	if (fio->need_lock == LOCK_REQ)
>>>  		f2fs_unlock_op(fio->sbi, &lc);
>>> +	if (!submitted) {
>>> +		if (pending_added) {
>>> +			f2fs_ffs_put_write_pending(folio, 1);
>>> +		} else if (!f2fs_ffs_has_dirty_subpage(folio)) {
>>> +			folio_clear_f2fs_gcing(folio);
>>
>> If f2fs_trylock_op() failed:
>>
>> 	if (fio->need_lock == LOCK_RETRY) {
>> 		if (!f2fs_trylock_op(fio->sbi, &lc)) {
>> 			err = -EAGAIN;
>> 			goto out_writepage;
>> 		}
>> 		fio->need_lock = LOCK_REQ;
>> 	}
>>
>> For order-0 folio, we may loss gcing flag becuase f2fs_ffs_has_dirty_subpage()
>> return false?
>>
> 
> But GC path which calls move_data_page will clear f2fs gcing whatever error code
> f2fs_do_write_page returns right？ I think we may need to having an parameter,

I think you mean FGGC, if it f2fs_do_write_data_page() failed, we will drop both
dirty bit and gcing flag, and then we can expect to migrate this block in later GC.

But, for BGGC, if we failed to f2fs_do_write_data_page(), we will redirty the folio,
and then we should keep gcing flag, otherwise, it won't guaranteed by checkpoint (see
f2fs_is_cp_guaranteed), we may lose the data once checkpoint only persist its metadata
rather than its data.

Thanks,

> or some infomation carried in fio to judge whether we call f2fs_do_write_data_page
> in gc context?

