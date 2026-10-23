Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792716921;
	b=UuAB3DnLHu4Cv2UQXRXlogFdQa1hn4BQiVoerzU/iQI9J4uJt9XLznkr/kKe+HkdUYQH
	 KSiiYk3XqQnMUr6D8r+uKke04+NzLDAsOSbUgIBAhCO5OgOqD2mCWg89RsHTqQFddNUVk
	 rPPxWihNnUhb6Lz4wVIc5J2E903sN0DnDryraMVUTo4grholB6nJMkpQU1GL0IQNQKuwQ
	 N4KVnKRwBSDBJtfdaOY6H+kRYKGqIjegXKHYbILsjBBIhuYoDs6eX9I/zyu8Ctp3S4UGn
	 DVV141uNgSnDB4XPsMO1ximbVO5NnbI+wdYcHPCPH6W+7Nz7LQJskiL26gIXlP9n8pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792716921;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=NR5kB8VmlaXGGcp/en7S2pq3Q/umlGcyMjoDCOwj4mg=;
	b=kg1LDNeVZ0n5R11K03uL9K4racdIqtM73Wp2xdP98YwEaSfDEZwooBQpocXciOiaABVw
	 iQuP3KXCrW01VSNyEV04n6ccnu3uQ8bMXqKy+NEU34eGGr0atVAcq9aFhqmp0AKKPYa5Y
	 gLdQhpA0VMQsFPve3LszpNhL+E7WnAMrYIoXUYSsj2bjB/4GqkHjKXYsrnBx8XTxqyva/
	 H1vB5Hu3pEC6PxzUKN6StyECEf9AluNGp4TTOVAeLHFvqvmz01Tpe88M05N/uXDGiXWCR
	 at3ggA1Y8QwzdqMfIClFzsovcgU692KTVWCpvFtxZo6ua3Wv4crR270ctvEXb0YMw5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KL1AhS/e";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A70B606A322
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KL1AhS/e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40CB1F01825;
	Fri, 23 Oct 2026 00:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792716920;
	bh=NR5kB8VmlaXGGcp/en7S2pq3Q/umlGcyMjoDCOwj4mg=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=KL1AhS/e0RtZ8VlfCxnT0ztv9wOcNnvP2rftZMkbWqqZUkThuYV+KYx07rF0mu9US
	 mRMimV2f985UJGem5eSNb0tR0KHZ43AYTQZo5r88L68ueOzc7V5wdn/oA7tpsTbtUT
	 RfDH8Nzm8LYd7nH0ROJ4cPnMtbWJRLmssY8L4kClevYvrr4RCX/ZhqnbCGjoWKqnzj
	 VcNMBN7gm4kYFdz31+HoTh+I4zLoZnWZPSjweOXPDrrxL/rMO58gqQqMQqjN9Evcz2
	 YCZMp+b57L/tYWoiLN1KhyPewlW8/FHnw+69MbVIjcAXa4TaN3QkWDxW2B7IqB3XRI
	 HioAZMbJy+/8g==
Message-ID: <6667c6de-af4b-42b1-8bd6-65c4232bf86e@kernel.org>
Date: Fri, 23 Oct 2026 08:55:16 +0800
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
Cc: chao@kernel.org, Barry Song <baohua@kernel.org>,
 Juan Yescas <jyescas@google.com>, Daeho Jeong <daehojeong@google.com>,
 Pengfei Li <lipengfei28@xiaomi.com>, Dev Jain <Dev.Jain@arm.com>,
 David Hildenbrand <David.Hildenbrand@arm.com>, linux-kernel@vger.kernel.org,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Nanzhe Zhao <nzzhao@126.com>, Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [PATCH v6 00/15] f2fs: support & optimize large folios for
 writable files
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261022075343.3043003-1-nzzhao.sigma@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261022075343.3043003-1-nzzhao.sigma@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Nanzhe,

FYI, this is from my local sashiko, please take a look to see if there is any
valid review comment.

Patch 1: f2fs: extend folio state for large folio write path
Result:
Critical: 1 · High: 0 · Medium: 0 · Low: 0
Reviewed
▼ Inline Review
Copy
commit 8845b499928f22b0f7dcf2d87614719b304cb8d8
Author: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
f2fs: extend folio state for large folio write path
Large folio write path needs a subpage status bitmap and write pages
pending counter, while keeping compatible with f2fs private flags.
This patch moves struct f2fs_folio_state to f2fs.h and updates
PAGE_PRIVATE functions to be compatible with it.
 > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
 > index e9f8b31d5dab..c4778e5f5925 100644
 > --- a/fs/f2fs/f2fs.h
 > +++ b/fs/f2fs/f2fs.h
[ ... ]
 > @@ -1629,6 +1641,13 @@ enum {
 >  	PAGE_PRIVATE_MAX
 >  };
 >
 > +static inline bool f2fs_folio_has_ffs(const struct folio *folio)
 > +{
 > +	unsigned long private = (unsigned long)folio->private;
 > +
 > +	return folio_test_large(folio) && private;
 > +}
 > +
Should this check also exclude the PAGE_PRIVATE_NOT_POINTER bit?
If a large folio has no ffs structure attached, but has an integer stored in
folio->private with the PAGE_PRIVATE_NOT_POINTER bit set, this function will
incorrectly return true.
[ ... ]
 > @@ -2769,13 +2788,35 @@ static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
[ ... ]
 > +static inline unsigned long *f2fs_folio_flags_addr(struct folio *folio)
 > +{
 > +	if (f2fs_folio_has_ffs(folio))
 > +		return &((struct f2fs_folio_state *)folio->private)->private_flags;
 > +
 > +	return (unsigned long *)&folio->private;
 > +}
 > +
If f2fs_folio_has_ffs() returns true because an integer with the
PAGE_PRIVATE_NOT_POINTER bit is stored in folio->private, does this code cast
that raw integer into a struct f2fs_folio_state pointer?
This would return an invalid out-of-bounds address for the private_flags
field, leading to a crash when it gets dereferenced.
[ ... ]
 > @@ -2787,14 +2828,10 @@ static inline bool page_private_##name(struct page *page) \
 >  #define PAGE_PRIVATE_SET_FUNC(name, flagname) \
 >  static inline void folio_set_f2fs_##name(struct folio *folio)		\
 >  {									\
 > -	unsigned long v = (1UL << PAGE_PRIVATE_NOT_POINTER) |		\
 > -			     (1UL << PAGE_PRIVATE_##flagname);		\
 >  	if (!folio->private)						\
 > -		folio_attach_private(folio, (void *)v);			\
 > -	else {								\
 > -		v |= (unsigned long)folio->private;			\
 > -		folio->private = (void *)v;				\
 > -	}								\
 > +		folio_attach_private(folio,				\
 > +				(void *)BIT(PAGE_PRIVATE_NOT_POINTER));	\
 > +	set_bit(PAGE_PRIVATE_##flagname, f2fs_folio_flags_addr(folio));	\
 >  }									\
 >  static inline void set_page_private_##name(struct page *page) \
 >  { \
Can this sequence trigger an invalid pointer dereference and a kernel panic?
If PAGE_PRIVATE_SET_FUNC (e.g., folio_set_f2fs_gcing) is called on a large
folio without an ffs structure:
1. folio->private is set to BIT(PAGE_PRIVATE_NOT_POINTER) (which is 1).
2. f2fs_folio_flags_addr() is called.
3. f2fs_folio_has_ffs() sees folio_test_large() and private != 0, returning
    true.
4. f2fs_folio_flags_addr() casts the integer 1 to a struct f2fs_folio_state
    pointer, returning a memory address based off this invalid pointer.
5. set_bit() attempts to write to this invalid unmapped memory address.
To: None    Cc: None    Status: Disabled (SMTP not configured)
Tokens used: In: 1376k · Cached: 7798k · Out: 22k
View Review Map·View Raw Log
↑ Back to Summary

Patch 2: f2fs: carry subpage offset and count in write IO
Result:
No regressions
Reviewed
▶ Inline Review
To: None    Cc: None    Status: Disabled (SMTP not configured)
Tokens used: In: 1891k · Cached: 28375k · Out: 43k
View Review Map·View Raw Log
↑ Back to Summary

Patch 3: f2fs: support regular file buffered writes on large folios
Result:
Critical: 0 · High: 2 · Medium: 0 · Low: 0
Reviewed
▼ Inline Review
Copy
commit 0f231c7061b3be0f1eb6bb222db57bfbcdc48ecb
Author: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
f2fs: support regular file buffered writes on large folios
This commit introduces large folio support for f2fs regular buffered
writes. It preallocates partial blocks for inodes that use large folios
to avoid complex unlocking during write_begin. During write_begin, it
only reads the partial head and tail 4K subpages that require
read-before-write.
 > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
 > --- a/fs/f2fs/data.c
 > +++ b/fs/f2fs/data.c
[ ... ]
 > @@ -4158,6 +4335,151 @@ static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
[ ... ]
 > +static int prepare_large_folio_write_begin(struct inode *inode,
 > +					  struct folio *folio, loff_t pos,
 > +					  unsigned int len)
 > +{
 > +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 > +	struct f2fs_folio_state *ffs;
 > +	size_t ori_off = offset_in_folio(folio, pos);
 > +	size_t need_off = ori_off;
 > +	int err = 0;
 > +
 > +	/*
 > +	 * when the write did not come through f2fs_write_iter, we preallocate all
 > +	 * blocks in the write range here.
 > +	 */
 > +	if (!is_inode_flag_set(inode, FI_PREALLOCATED_ALL) &&
 > +	    !IS_DEVICE_ALIASING(inode)) {
 > +		pgoff_t first = F2FS_BYTES_TO_BLK(sbi, pos);
 > +		pgoff_t last = F2FS_BLK_ALIGN(sbi, pos + len);
 > +		pgoff_t idx;
 > +
 > +		for (idx = first; idx < last; idx++) {
 > +			block_t blkaddr = NULL_ADDR;
 > +			bool node_changed = false;
 > +
 > +			err = __reserve_data_block(inode, idx, &blkaddr,
 > +						   &node_changed);
 > +			if (err)
 > +				return err;
 > +			if (f2fs_balance_fs_folio_locked(folio, folio->mapping,
 > +						   node_changed))
 > +				return -EAGAIN;
 > +		}
 > +	}
[ ... ]
 > +		/*
 > +		 * The read extent cache only validates the first and last
 > +		 * block of i_ext, so check both the cached and dnode paths.
 > +		 */
 > +		if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
 > +					  DATA_GENERIC_ENHANCE_READ))
 > +			return -EFSCORRUPTED;
Can this result in a spurious -EFSCORRUPTED error during a direct I/O
fallback?
In f2fs_preallocate_blocks(), FI_PREALLOCATED_ALL is set unconditionally
when f2fs_map_blocks() returns 0. However, for direct I/O, the allocation
exits early on physically unmergeable extents, meaning map.m_len might be
smaller than requested.
If a partial direct I/O write falls back to buffered I/O via
f2fs_buffered_write_iter(), this new prepare_large_folio_write_begin()
path will see FI_PREALLOCATED_ALL and skip block reservation for the
unallocated tail.
Will reading the unallocated hole then yield a NULL_ADDR and trigger the
-EFSCORRUPTED failure here?
[ ... ]
 > @@ -4395,8 +4744,22 @@ static bool f2fs_dirty_data_folio(struct address_space *mapping,
 >
 >  	trace_f2fs_set_page_dirty(folio, DATA);
 >
 > -	if (!folio_test_uptodate(folio))
 > -		folio_mark_uptodate(folio);
 > +	if (!folio_test_uptodate(folio)) {
 > +		bool uptodate = true;
 > +
 > +		if (f2fs_folio_has_ffs(folio)) {
 > +			struct f2fs_folio_state *ffs =
 > +				(struct f2fs_folio_state *)folio->private;
 > +			unsigned long flags;
 > +
 > +			spin_lock_irqsave(&ffs->state_lock, flags);
 > +			uptodate = bitmap_full(ffs->state, folio_nr_pages(folio)) &&
 > +				   !ffs->read_pages_pending;
 > +			spin_unlock_irqrestore(&ffs->state_lock, flags);
 > +		}
 > +		if (uptodate)
 > +			folio_mark_uptodate(folio);
 > +	}
 >  	BUG_ON(folio_test_swapcache(folio));
 >
 >  	if (filemap_dirty_folio(mapping, folio)) {
Does this miss updating the ffs dirty bitmap for large folios modified via
external paths like get_user_pages?
Modifications made to an mmapped f2fs large folio via external subsystems
(like direct I/O or device DMA using get_user_pages) call
folio_mark_dirty() when unpinning. This triggers f2fs_dirty_data_folio()
which sets the generic PG_dirty flag.
However, because the subpages are not marked dirty in the ffs bitmap,
when writeback later runs f2fs_write_cache_folios(), it relies on
ffs_find_dirty_range(). If the ffs dirty bitmap is empty, it appears the
loop will skip the I/O entirely and discard the data.
Should we be updating the ffs dirty bitmap here after a successful
filemap_dirty_folio() for large folios?
To: None    Cc: None    Status: Disabled (SMTP not configured)
Tokens used: In: 1542k · Cached: 14448k · Out: 36k
View Review Map·View Raw Log
↑ Back to Summary

Patch 4: f2fs: support atomic file large folios buffered write
Result:
Critical: 0 · High: 0 · Medium: 1 · Low: 0
Reviewed
▼ Inline Review
Copy
commit 53688cad23a91b76f64efcd823a6c489381ac485
Author: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
f2fs: support atomic file large folios buffered write
This commit adds support for large folio buffered writes to f2fs atomic files.
It introduces a helper to reserve COW mappings for the write range and handle
partial head and tail subpages.
 > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
 > --- a/fs/f2fs/data.c
 > +++ b/fs/f2fs/data.c
[ ... ]
 > @@ -4480,6 +4478,61 @@ static int prepare_large_folio_write_begin(struct inode *inode,
 > +static int prepare_large_folio_atomic_write_begin(struct inode *inode,
 > +		struct address_space *mapping, struct folio *folio, loff_t pos,
 > +		unsigned int len)
 > +{
[ ... ]
 > +	for (index = start; index <= end; index++) {
 > +		block_t blkaddr = NULL_ADDR;
 > +		bool node_changed = false;
 > +		size_t off = (index - folio->index) << PAGE_SHIFT;
 > +
 > +		err = prepare_atomic_write_begin(sbi, inode, index,
 > +						&blkaddr, &node_changed);
 > +		if (err)
 > +			return err;
[ ... ]
 > +balance:
 > +		if (f2fs_balance_fs_folio_locked(folio, mapping, node_changed))
 > +			return -EAGAIN;
Can returning -EAGAIN here cause atomic write counts to be double counted for
prior subpages?
If f2fs_balance_fs_folio_locked() requires balance, it returns -EAGAIN. This
causes the outer loop in f2fs_write_begin() to restart the folio preparation,
which re-runs prepare_large_folio_atomic_write_begin() starting from the
first subpage.
On this retry, prepare_atomic_write_begin() will be called again for subpages
that have already been processed. For append writes, the COW lookup is skipped
and it goes straight to block reservation:
fs/f2fs/data.c:prepare_atomic_write_begin() {
     ...
	if (((loff_t)index << PAGE_SHIFT) >= i_size_read(inode))
		goto reserve_block;
     ...
reserve_block:
	if (!cow_has_reserved_block) {
		err = __reserve_data_block(...);
         ...
		inc_atomic_write_cnt(inode);
	}
}
Because cow_has_reserved_block defaults to false and the COW lookup was
skipped, inc_atomic_write_cnt() will be incremented a second time for every
subpage already processed before the abort. Could this corrupt the atomic
write statistics?
 > +	}
 > +
 > +	return 0;
 > +}
To: None    Cc: None    Status: Disabled (SMTP not configured)
Tokens used: In: 1041k · Cached: 12285k · Out: 31k
View Review Map·View Raw Log
↑ Back to Summary

Patch 5: f2fs: support large folio writeback
Result:
Critical: 0 · High: 3 · Medium: 0 · Low: 0
Reviewed
▼ Inline Review
Copy
commit 5beb2c47fdab941c94ce2dbf16d7119ff73077df
Author: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
f2fs: support large folio writeback
This commit adds a folio-based writeback path for large-folio mapping files
to handle multiple dirty ranges within a large folio. It introduces
f2fs_write_cache_folios() for large folios while keeping the legacy
f2fs_write_cache_pages() path for non-large-folio files.
 > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
 > index e3d6e3087bb9..74583f0f1833 100644
 > --- a/fs/f2fs/data.c
 > +++ b/fs/f2fs/data.c
[ ... ]
 > @@ -358,6 +358,49 @@ static void f2fs_cache_write_end_bio(struct bio *bio)
 >  	bio_put(bio);
 >  }
 >
 > +static bool f2fs_ffs_has_dirty_subpage(struct folio *folio)
[ ... ]
 > +static void f2fs_ffs_put_write_pending(struct folio *folio, unsigned int nr)
 > +{
 > +	struct f2fs_folio_state *ffs;
 > +
 > +	if (!f2fs_folio_has_ffs(folio))
 > +		goto release;
 > +
 > +	ffs = (struct f2fs_folio_state *)folio->private;
 > +	if (!atomic_sub_and_test(nr, &ffs->write_pages_pending))
 > +		return;
 > +release:
 > +	if (!f2fs_ffs_has_dirty_subpage(folio))
 > +		folio_clear_f2fs_gcing(folio);
 > +	if (folio_test_writeback(folio))
 > +		folio_end_writeback(folio);
 > +}
Does this prematurely end writeback for the entire large folio when it lacks FFS
state?
If a large folio is dirtied without an attached f2fs_folio_state (FFS), it
bypasses the write_pages_pending reference counter during background writeback.
When the first I/O block completes, f2fs_ffs_put_write_pending() will
immediately call folio_end_writeback(). This clears the page cache writeback
state while other blocks from the same folio might still be undergoing active
DMA, which could lead to data corruption or a use-after-free if the page
cache frees the folio or userspace modifies it.
A Time-Of-Check to Time-Of-Use (TOCTOU) race exists when retrieving a folio
using f2fs_get_lock_data_folio(). It calls f2fs_get_read_data_folio(), which
allocates FFS but then unlocks the folio if it is already up-to-date. Before
f2fs_get_lock_data_folio() re-acquires the lock, a concurrent memory reclaim
can call f2fs_release_folio() on the clean folio, freeing its FFS state. Once
successfully re-locked, callers like move_data_page() or
truncate_partial_data_page() dirty the folio, silently falling back to
folio_mark_dirty() and inserting a dirty large folio without FFS into the
writeback path.
[ ... ]
 > @@ -3523,6 +3668,144 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 >  	return err;
 >  }
 >
 > +static int f2fs_write_folio_dirty_range(struct folio *folio, int *submitted,
 > +					struct writeback_control *wbc,
 > +					enum iostat_type io_type,
 > +					u64 *pos, u64 len)
 > +{
[ ... ]
 > +		err = f2fs_get_dnode_of_data(&dn, data_idx, LOOKUP_NODE);
 > +		if (err)
 > +			goto block_done;
 > +		dn_held = true;
 > +
 > +		fio.old_blkaddr = dn.data_blkaddr;
 > +
 > +got_it:
 > +		if (__is_valid_data_blkaddr(fio.old_blkaddr) &&
 > +		    !f2fs_is_valid_blkaddr(sbi, fio.old_blkaddr,
 > +					   DATA_GENERIC_ENHANCE)) {
 > +			err = -EFSCORRUPTED;
 > +			goto block_done;
 > +		}
Can this crash the kernel via f2fs_bug_on() due to a missing NULL_ADDR check?
When f2fs_get_dnode_of_data() returns the dnode for a punched hole block, its
data_blkaddr is NULL_ADDR. This code assigns it to fio.old_blkaddr but
fails to check if fio.old_blkaddr is NULL_ADDR before unconditionally calling
f2fs_outplace_write_data().
The legacy f2fs_do_write_data_page() checks if the old block address is
NULL_ADDR to cleanly skip subpages that were hole-punched after being dirtied.
Without that check here, f2fs_outplace_write_data() will hit this assertion
and panic the kernel:
     f2fs_bug_on(sbi, dn->data_blkaddr == NULL_ADDR);
This could be triggered by overlapping mmap writes and fallocate hole punches.
[ ... ]
 > @@ -3972,6 +4255,226 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 >  	return ret;
 >  }
 >
 > +static int f2fs_write_cache_folios(struct address_space *mapping,
[ ... ]
 > +		/*
 > +		 * Large folios can be submitted as multiple bios, which may
 > +		 * complete while we are still submitting the remaining dirty
 > +		 * ranges.  Hold a bias on write_pages_pending to prevent
 > +		 * folio_end_writeback() from being called early.
 > +		 */
 > +		if (!bias_added && f2fs_folio_has_ffs(folio)) {
 > +			ffs = (struct f2fs_folio_state *)folio->private;
 > +			WARN_ON_ONCE(atomic_read(&ffs->write_pages_pending) != 0);
 > +			atomic_inc(&ffs->write_pages_pending);
 > +			bias_added = true;
 > +		}
If a large folio lacks FFS state (for instance, due to the reclaim race
mentioned above), this path skips incrementing the write_pages_pending bias
but will still loop over and submit I/O for all blocks in the folio. This
directly contributes to the premature writeback completion issue.
[ ... ]
 > +out:
 > +		/*
 > +		 * Clear the dirty state of the subranges that were written back.
 > +		 * If some subranges are still dirty (e.g. the folio was only
 > +		 * partially written back), or if the writeback failed, the
 > +		 * folio must stay dirty so that the remaining subranges are
 > +		 * written back later.
 > +		 */
 > +		if (f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
 > +					(err ? pos : end_pos) - folio_pos(folio)) || err)
 > +			folio_redirty_for_writepage(wbc, folio);
Does this logic trap the worker in an infinite writeback loop on truncated or
hole-punched large folios?
If a hole is punched, f2fs_get_dnode_of_data() returns -ENOENT, which is
propagated up to f2fs_write_cache_folios() as err. The || err condition
evaluates to true and unconditionally redirties the folio, causing it to be
retried endlessly.
Similarly, if the file is truncated such that the EOF splits the folio,
end_pos is clamped to isize. f2fs_ffs_clear_subrange_dirty_and_test() will
clear bits from 0 to end_pos, skipping the subpages beyond EOF. Because
those dirty bits remain, it returns true, which also triggers
folio_redirty_for_writepage() and leaves the folio dirty permanently.
To: None    Cc: None    Status: Disabled (SMTP not configured)
Tokens used: In: 1211k · Cached: 11018k · Out: 26k
View Review Map·View Raw Log
↑ Back to Summary

Patch 6: f2fs: account large folio dirty data at block granularity
Result:
No regressions
Reviewed
▶ Inline Review
To: None    Cc: None    Status: Disabled (SMTP not configured)
Tokens used: In: 698k · Cached: 5473k · Out: 14k
View Review Map·View Raw Log
↑ Back to Summary

Patch 7: f2fs: prepare mmap write faults for large folios
Result:
No regressions
Reviewed
▶ Inline Review
To: None    Cc: None    Status: Disabled (SMTP not configured)
Tokens used: In: 1435k · Cached: 6126k · Out: 20k
View Review Map·View Raw Log
↑ Back to Summary

Patch 8: f2fs: make GC migration large-folio aware
Result:
Critical: 0 · High: 0 · Medium: 1 · Low: 0
Reviewed
▼ Inline Review
Copy
commit 69c900aae91680bd5f0dda56fae4dc1617abe3a5
Author: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
     f2fs: make GC migration large-folio aware
This patch makes garbage collection migration large-folio aware by updating
data lookup helpers to test and update uptodate state for the addressed
subpage. It also modifies move_data_page() to track dirty state per subpage
and delegates write_pages_pending tracking and cleanup to
f2fs_do_write_data_page().
Link: https://lore.kernel.org/oe-lkp/202610081027.b13dcf10-lkp@intel.com
 > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
 > index f415c3eb4e78..5671395130b2 100644
 > --- a/fs/f2fs/data.c
 > +++ b/fs/f2fs/data.c
[ ... ]
 > @@ -3684,6 +3706,13 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 >  out:
 >  	if (fio->need_lock == LOCK_REQ)
 >  		f2fs_unlock_op(fio->sbi, &lc);
 > +	if (!submitted) {
 > +		if (pending_added) {
 > +			f2fs_ffs_put_write_pending(folio, 1);
 > +		} else if (!f2fs_ffs_has_dirty_subpage(folio)) {
 > +			folio_clear_f2fs_gcing(folio);
 > +		}
 > +	}
 >  	return err;
 >  }
 >
 > diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
 > index 8e80e857e220..04ed3d37c237 100644
 > --- a/fs/f2fs/gc.c
 > +++ b/fs/f2fs/gc.c
[ ... ]
 > @@ -1552,33 +1561,43 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
[ ... ]
 >  		folio_set_f2fs_gcing(folio);
 >
 >  		err = f2fs_do_write_data_page(&fio);
 >  		if (err) {
 > -			folio_clear_f2fs_gcing(folio);
 >  			if (err == -ENOMEM) {
 >  				memalloc_retry_wait(GFP_NOFS);
 >  				goto retry;
 >  			}
Is there a regression here where f2fs_do_write_data_page() bypasses the
newly added cleanup code on early errors, leaking the PG_f2fs_gcing flag on
the folio?
The removed cleanup relies on f2fs_do_write_data_page() performing it at the
out label added above, but f2fs_do_write_data_page() can return directly
without reaching that label. For example, it might fail on lock acquisition:
	/* Deadlock due to between page->lock and f2fs_lock_op */
	if (fio->need_lock == LOCK_REQ && !f2fs_trylock_op(fio->sbi, &lc))
		return -EAGAIN;
Could the folio permanently retain the PG_f2fs_gcing flag since the
caller-side cleanup was removed?
 > -			if (is_dirty)
 > +			if (is_dirty) {
 > +				if (large)
 > +					f2fs_ffs_mark_subrange_dirty(folio, foff, PAGE_SIZE);
 >  				folio_mark_dirty(folio);
 > +			}
 >  		}
 >  	}
To: None    Cc: None    Status: Disabled (SMTP not configured)
Tokens used: In: 1183k · Cached: 20602k · Out: 37k
View Review Map·View Raw Log
↑ Back to Summary

Patch 9: f2fs: optimize small block size large folio read
Result:
No regressions
Reviewed
▶ Inline Review
To: None    Cc: None    Status: Disabled (SMTP not configured)
Tokens used: In: 886k · Cached: 7605k · Out: 20k
View Review Map·View Raw Log
↑ Back to Summary

Patch 10: f2fs: support partial uptodate large folio read
Result:
No regressions
Reviewed
▶ Inline Review
To: None    Cc: None    Status: Disabled (SMTP not configured)
Tokens used: In: 613k · Cached: 1023k · Out: 12k
View Review Map·View Raw Log
↑ Back to Summary

Patch 11: f2fs: handle partial truncate of large folio dirty subpages
Result:
No regressions
Reviewed
▶ Inline Review
To: None    Cc: None    Status: Disabled (SMTP not configured)
Tokens used: In: 1417k · Cached: 16831k · Out: 28k
View Review Map·View Raw Log
↑ Back to Summary

Patch 12: f2fs: fix zeroing paths for large folios
Result:
Critical: 0 · High: 1 · Medium: 0 · Low: 0
Reviewed
▼ Inline Review
Copy
commit 506953384e1ed7cc966a73a775ee46b38f01377e
Author: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
f2fs: fix zeroing paths for large folios
This commit updates several f2fs zeroing paths to use folio offsets instead
of PAGE_SIZE based offsets to properly handle large folios.
 > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
 > index 808b72d3d78a..439e84a4aec3 100644
 > --- a/fs/f2fs/file.c
 > +++ b/fs/f2fs/file.c
[ ... ]
 > @@ -856,12 +857,22 @@ static int truncate_partial_data_page(struct inode *inode, u64 from,
 >  		return PTR_ERR(folio) == -ENOENT ? 0 : PTR_ERR(folio);
 >  truncate_out:
 >  	f2fs_folio_wait_writeback(folio, true, true);
 > -	folio_zero_segment(folio, offset, folio_size(folio));
 > +	folio_off = offset_in_folio(folio, from);
Does this code skip zeroing valid subpages of partially up-to-date large
folios?
Just above this hunk in truncate_partial_data_page(), the cache_only block
checks the uptodate status of the folio:
     if (cache_only) {
         folio = filemap_lock_folio(mapping, index);
         if (IS_ERR(folio))
             return 0;
         if (folio_test_uptodate(folio))
             goto truncate_out;
         f2fs_folio_put(folio, true);
         return 0;
     }
For large folios, folio_test_uptodate() returns true only if the entire
folio is up-to-date. If the folio is only partially up-to-date, but the
specific subpage being truncated is valid, this check returns false.
This causes the function to exit without jumping to truncate_out,
skipping the zeroing and leaking stale pre-truncation data in the page
cache.
Should this check be converted to f2fs_ffs_test_blk_uptodate(folio, index)
to match the changes made in f2fs_get_new_data_folio()?
 > +	blk_end = min_t(size_t, round_up(folio_off, PAGE_SIZE),
 > +					folio_size(folio));
 > +	folio_zero_segment(folio, folio_off, blk_end);
To: None    Cc: None    Status: Disabled (SMTP not configured)
Tokens used: In: 1446k · Cached: 13715k · Out: 21k
View Review Map·View Raw Log
↑ Back to Summary

Patch 13: f2fs: handle block cloning within the same large folio
Result:
Critical: 0 · High: 1 · Medium: 0 · Low: 0
Reviewed
▼ Inline Review
Copy
commit e71bedd5f33b6f06c04e1ac6a7f0f828fabd0fc0
Author: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
f2fs: handle block cloning within the same large folio
This commit modifies __clone_blkaddrs() to correctly handle block cloning
when source and destination blocks belong to the same large folio. It
detects the same-folio case and explicitly reserves the destination block
to avoid self-deadlocks.
 > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
 > index 439e84a4aec3..f621d5e65023 100644
 > --- a/fs/f2fs/file.c
 > +++ b/fs/f2fs/file.c
[ ... ]
 > @@ -1598,25 +1598,70 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
 >  			f2fs_put_dnode(&dn);
 >  		} else {
 >  			struct folio *fsrc, *fdst;
[ ... ]
 > +			same_folio = src_inode == dst_inode &&
 > +				     folio_contains(fsrc, dst + i);
 > +			if (same_folio) {
 > +				struct dnode_of_data dn;
 > +
 > +				/* Reserve block for dst before copying */
 > +				set_new_dnode(&dn, dst_inode, NULL, NULL, 0);
 > +				ret = f2fs_reserve_block(&dn, dst + i);
 > +				if (ret) {
 > +					f2fs_folio_put(fsrc, true);
 > +					return ret;
 > +				}
 > +				fdst = fsrc;
 > +			} else {
 > +				fdst = f2fs_get_new_data_folio(dst_inode, NULL,
 > +							      dst + i, true);
[ ... ]
 >  			f2fs_folio_wait_writeback(fdst, true, true);
 > -
 > -			memcpy_folio(fdst, 0, fsrc, 0, PAGE_SIZE);
 > +			memcpy_folio(fdst, dst_off, fsrc, src_off,
 > +				    PAGE_SIZE);
 > +			if (folio_test_large(fdst)) {
 > +				if (!f2fs_ffs_find_or_alloc(fdst)) {
 > +					f2fs_folio_put(fdst, true);
 > +					if (!same_folio)
 > +						f2fs_folio_put(fsrc, true);
 > +					return -ENOMEM;
 > +				}
Does returning -ENOMEM here leave the page cache corrupted?
Before this check, memcpy_folio() has already copied the data into the
destination folio. If f2fs_ffs_find_or_alloc() fails and we return -ENOMEM,
the page cache modification is not reverted.
If the cloning operation is aborted, would userspace read the incorrectly
modified page cache? Could this corrupted data also be persisted to disk if
the folio is later dirtied?
Additionally, when same_folio is true, the block reserved earlier with
f2fs_reserve_block() does not appear to be reverted on this error path.
 > +				f2fs_ffs_mark_subrange_uptodate(fdst,
 > +							dst_off, PAGE_SIZE);
 > +				f2fs_ffs_mark_subrange_dirty(fdst, dst_off,
 > +							    PAGE_SIZE);
 > +			}
 >  			folio_mark_dirty(fdst);
To: None    Cc: None    Status: Disabled (SMTP not configured)
Tokens used: In: 418k · Cached: 3283k · Out: 15k
View Review Map·View Raw Log
↑ Back to Summary

Patch 14: f2fs: allow large folio support to writeable files
Result:
Critical: 0 · High: 1 · Medium: 1 · Low: 0
Reviewed
▼ Inline Review
Copy
commit 2533e48a3606c7c0d5518871039a69a5277636bd
Author: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
f2fs: allow large folio support to writeable files
This commit enables large folio mappings for writable files in f2fs by removing
runtime restrictions. It attempts to restrict them using an IS_IMMUTABLE check
at inode initialization as a transitional safety measure.
 > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
 > index d0297730c07f..288edc1a688f 100644
 > --- a/fs/f2fs/f2fs.h
 > +++ b/fs/f2fs/f2fs.h
[ ... ]
 > @@ -5358,6 +5358,23 @@ static inline bool f2fs_quota_file(struct f2fs_sb_info *sbi, nid_t ino)
 >  	return false;
 >  }
 >
 > +static inline void f2fs_mapping_set_large_folio(struct inode *inode)
 > +{
 > +	if (!S_ISREG(inode->i_mode) ||
 > +	    f2fs_compressed_file(inode) ||
 > +	    f2fs_quota_file(F2FS_I_SB(inode), inode->i_ino))
 > +		return;
 > +
 > +	/*
 > +	 * Keep the folio order range at 0 as a transitional step; large
 > +	 * folios will be enabled once the whole write path is audited.
 > +	 */
 > +	if (IS_IMMUTABLE(inode))
 > +		mapping_set_folio_min_order(inode->i_mapping, 0);
Can this check be bypassed using FS_IOC_SETFLAGS?
If a user creates a file, sets it immutable (chattr +i), and drops caches to
force an inode reload, the mapping is configured with MAX_PAGECACHE_ORDER. The
user can then clear the immutable flag (chattr -i).
Since f2fs_setflags_common() clears S_IMMUTABLE but does not downgrade the VFS
mapping limits, this now-mutable file can be opened for writing and populate
the page cache with large folios.
 > +	else
 > +		mapping_set_folio_order_range(inode->i_mapping, 0, 0);
 > +}
 > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
 > index f621d5e65023..3d621a20766d 100644
 > --- a/fs/f2fs/file.c
 > +++ b/fs/f2fs/file.c
 > @@ -163,17 +163,8 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 >  	int err = 0;
 >  	vm_fault_t ret;
 >
 > -	/*
 > -	 * We only support large folio on the read case.
 > -	 * Don't make any dirty pages.
 > -	 */
 > -	if (unlikely(IS_IMMUTABLE(inode)) ||
 > -	    mapping_large_folio_support(inode->i_mapping)) {
 > -		f2fs_err(sbi, "Not expected: immutable: %d large_folio: %d",
 > -				IS_IMMUTABLE(inode),
 > -				mapping_large_folio_support(inode->i_mapping));
 > +	if (unlikely(IS_IMMUTABLE(inode)))
 >  		return VM_FAULT_SIGBUS;
 > -	}
Because this patch removes the runtime mapping_large_folio_support() safety
checks here (and in f2fs_file_open and f2fs_setattr), the folios from the
bypass described above will enter the unaudited write paths.
Does this cause O(N^2) complexity and massive stat inflation for large folios?
When a large folio is mapped into a writable VMA, the core MM generates page
faults for each 4KB subpage independently. In f2fs_vm_page_mkwrite(), the code
calculates dirty_len as the size of the entire valid portion of the folio up
to EOF, rather than the size of the faulting subpage.
It then loops over all blocks in the folio:
     for (i = 0; i < nr; i++) {
         err = f2fs_get_block_mkwrite(inode, folio, folio->index + i,
                                      need_alloc);
and increments the IO stats by the full folio size:
     f2fs_update_iostat(sbi, inode, APP_MAPPED_IO, dirty_len);
For a 2MB large folio, sequentially writing to all 512 subpages will trigger
this page fault handler 512 times. Each invocation processes all 512 blocks
and increments the IO stats by 2MB, resulting in 262,144 block iterations and
a 1GB inflation to APP_MAPPED_IO.
To: None    Cc: None    Status: Disabled (SMTP not configured)
Tokens used: In: 1573k · Cached: 22463k · Out: 34k
View Review Map·View Raw Log
↑ Back to Summary

Patch 15: f2fs: make compressed files compatible with large folio
Result:
No regressions
Reviewed
▶ Inline Review
To: None    Cc: None    Status: Disabled (SMTP not configured)
Tokens used: In: 743k · Cached: 15590k · Out: 28k
View Review Map·View Raw Log
↑ Back to Summary
