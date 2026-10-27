Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094435;
	b=ZtHd/hdXSNki0lj2BmrZ2ylk6QRBsrmJr4+yU1Kpo4h0ociFVCDpBlgj0FXEGkbtcRUc
	 kTJA0JYheoAseJPGf2Q0CUDnpT7Viw8Obh4OLjrUvTZDKb71MrkImGhvAPqVOyor8OpMh
	 tb1HieToBw/bFUGUxAb5ZzjMvdZqwAe/BQfRWwON8twwezdNO4D1X1bcRAYVYql5shCFw
	 0DXQW3HtkFFfx9+unWSymx6xhLWg/wYG9vxn9qr6nryZs1n+ZFi+d878FUYdi60t5pIRV
	 601QFBV94H/6hxBYXm7niwOmF3ftBDkhML8EVegrUrE3StPDcOtDaaFvSv8YDuGx2Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094435;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qnLAdzuM7A4/UK6/DeoKuY93kQs0FO7h6c1nB+vHrzU=;
	b=pAjZwiEnYgyNkslrKyMcoAJ7xUi52MuQuzg8aTtM5aC3HG/k132cgoFEQO27a+vXxxDJ
	 0XdGhrhdcrCCzpqbXSoMCoXwPnZzbHLlrv8a03Nkbu6zE2ysJM23kAgjZN0gII9e1zD4g
	 tAO4GHM0XnK9wzUfvIibokPnhPy5/CiwUSbXmQAMk+XS+X/IF+Rd5JDf2llqCROOXfIh4
	 hJ8GQFdpRr0mcHMYrYXppbYfgM1QMlprL95HJNwck9J5KSaCcNjiGkF+ji1bpWykbveIo
	 1o/y76HgyWE4QHZ1MRHlcQcUwLl725wW5oO/wmRUicmrciAIzlKekw6udT6dOdwSS0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c+68XpNs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201A6606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c+68XpNs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF4F01F01825;
	Tue, 27 Oct 2026 09:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793094433;
	bh=qnLAdzuM7A4/UK6/DeoKuY93kQs0FO7h6c1nB+vHrzU=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=c+68XpNspOM9p+5chlmZVENQGXRj+Iom7LVFvYIp900qRSdPP3lAUXYXZvfJvW9XM
	 iorkaayBViOzoPesxlMKOW8kCGuAlzj+HKfcLkFNoBJxjDswklZATNLMsh9A+KkEOX
	 0VCriS1/Y758AsfCWO+DgSle9vk4697dmBLnBvXm11R/rKeVWDnpbFnp6qWm7D/C+g
	 3++JMIqlhunhNWR/5hgwxDPR/Nf1c1KSMw8TsN/BrDhwGHdoxsYi45xMQmFIO8ENV4
	 Rl/9swDZdqaQj3mcVdEWOUJoLFkIqr7FHIuDawpiL2mRZCSO0Z9ZwZuP1bnTB1kBML
	 N7b8KXnjCNxtg==
Message-ID: <f895f1bd-db2f-4f04-9072-be999afc1d38@kernel.org>
Date: Tue, 27 Oct 2026 17:47:09 +0800
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
Subject: Re: [PATCH v7 00/15] f2fs: support & optimize large folios for
 writable files
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261026033745.784107-1-nzzhao.sigma@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261026033745.784107-1-nzzhao.sigma@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/26/26 11:37, Nanzhe Zhao wrote:
> From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> 
> This series supports large folios for most readable/writable files
> in buffered I/O paths, including normal files, block-layer encrypted
> files, and atomic files except for inline-data files, compressed files,
> and quota files.
> 
> It also extends f2fs_folio_state to coexist with f2fs page-private
> flags and to handle large folio write path and partial truncate of
> large folios correctly.  A valid large folio always carries a
> f2fs_folio_state at its folio->private in the current implementation.
> 
> Benchmark details can be found in the RFC v2 cover letter:
> https://lore.kernel.org/r/20260622160830.324455-1-zhaonanzhe@xiaomi.com
Nanzhe,

Well, I still see several comments are valid, can you please take a look, let's
just ignore false alarm one in last v6.

Patch 1: f2fs: extend folio state for large folio write path
Result:
Critical: 1 · High: 1 · Medium: 0 · Low: 0
Reviewed
▼ Inline Review
Copy
commit 5dc0bed5a4117aeba7c4f3561339538114aa9720
Author: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
f2fs: extend folio state for large folio write path
This commit moves struct f2fs_folio_state to fs/f2fs/f2fs.h, adds a
private_flags field and a subpage state bitmap, and updates the
PAGE_PRIVATE helper functions to work with f2fs_folio_state. It also
switches f2fs_folio_state allocation from kmem_cache to kzalloc since the
structure size now depends on the folio order.
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index aedba8b79baa9..abb0c0caed917 100644
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
>  /* For compression */
>  enum compress_algorithm_type {
>  	COMPRESS_LZO,
> @@ -2759,13 +2778,35 @@ static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
>  	return -ENOSPC;
>  }
>
> +static inline unsigned long f2fs_folio_get_private_flags(const struct folio *folio)
> +{
> +	unsigned long private = (unsigned long)folio->private;
> +
> +	if (f2fs_folio_has_ffs(folio)) {
> +		struct f2fs_folio_state *ffs = (struct f2fs_folio_state *)private;
> +
> +		return READ_ONCE(ffs->private_flags);
> +	}
> +
> +	if (test_bit(PAGE_PRIVATE_NOT_POINTER, &private))
> +		return private;
> +
> +	return 0;
> +}
> +
> +static inline unsigned long *f2fs_folio_flags_addr(struct folio *folio)
> +{
> +	if (f2fs_folio_has_ffs(folio))
> +		return &((struct f2fs_folio_state *)folio->private)->private_flags;
> +
> +	return (unsigned long *)&folio->private;
> +}
> +
>  #define PAGE_PRIVATE_GET_FUNC(name, flagname) \
>  static inline bool folio_test_f2fs_##name(const struct folio *folio)	\
>  {									\
> -	unsigned long priv = (unsigned long)folio->private;		\
> -	unsigned long v = (1UL << PAGE_PRIVATE_NOT_POINTER) |		\
> -			     (1UL << PAGE_PRIVATE_##flagname);		\
> -	return (priv & v) == v;						\
> +	return f2fs_folio_get_private_flags(folio) &			\
> +				(1UL << PAGE_PRIVATE_##flagname);	\
>  }									\
>  static inline bool page_private_##name(struct page *page) \
>  { \
> @@ -2777,14 +2818,10 @@ static inline bool page_private_##name(struct page *page) \
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
Can this cause a near-NULL pointer dereference when a PAGE_PRIVATE_SET_FUNC
helper (such as folio_set_f2fs_reference(), folio_set_f2fs_gcing(), or
folio_set_f2fs_atomic()) is called on a large folio whose folio->private is
NULL?
A large folio in the page cache can have folio->private == NULL when
populated over a hole in f2fs_read_data_large_folio() (which skips
f2fs_ffs_find_or_alloc() for unmapped blocks), or after
f2fs_release_folio() calls ffs_detach_free() on a clean large folio while
it remains in the page cache.
When one of the PAGE_PRIVATE_SET_FUNC helpers is called on such a folio
(for example via folio_mark_dirty() -> f2fs_dirty_data_folio() ->
f2fs_update_dirty_folio() -> folio_set_f2fs_reference(), or
redirty_blocks() -> folio_set_f2fs_gcing()), !folio->private is true, so it
attaches (void *)BIT(PAGE_PRIVATE_NOT_POINTER) (0x1) to folio->private.
On the next statement:
    set_bit(PAGE_PRIVATE_##flagname, f2fs_folio_flags_addr(folio));
f2fs_folio_flags_addr(folio) calls f2fs_folio_has_ffs(folio), which checks
only folio_test_large(folio) && private without checking
PAGE_PRIVATE_NOT_POINTER. Because folio->private is now 0x1,
f2fs_folio_has_ffs(folio) returns true, f2fs_folio_flags_addr(folio)
returns &((struct f2fs_folio_state *)0x1)->private_flags, and set_bit()
dereferences that invalid address.
Furthermore, even if f2fs_folio_has_ffs() checked PAGE_PRIVATE_NOT_POINTER,
attaching non-pointer bitmask flags directly to folio->private on a large
folio conflicts with f2fs_ffs_find_or_alloc() in fs/f2fs/data.c:
    f2fs_bug_on(F2FS_F_SB(folio),
                test_bit(PAGE_PRIVATE_NOT_POINTER, &private));
    ...
    folio_attach_private(folio, ffs);
which triggers f2fs_bug_on() and overwrites folio->private via an unpaired
folio_attach_private(), losing the flags and leaking a folio reference
count. Similarly, without checking PAGE_PRIVATE_NOT_POINTER,
ffs_detach_free() in fs/f2fs/data.c would treat a non-pointer bitmask on a
large folio as a struct f2fs_folio_state pointer and pass it to kfree().
>  static inline void set_page_private_##name(struct page *page) \
>  { \
> @@ -2797,13 +2834,10 @@ static inline void set_page_private_##name(struct page *page) \
>  #define PAGE_PRIVATE_CLEAR_FUNC(name, flagname) \
>  static inline void folio_clear_f2fs_##name(struct folio *folio)		\
>  {									\
> -	unsigned long v = (unsigned long)folio->private;		\
> -									\
> -	v &= ~(1UL << PAGE_PRIVATE_##flagname);				\
> -	if (v == (1UL << PAGE_PRIVATE_NOT_POINTER))			\
> +	clear_bit(PAGE_PRIVATE_##flagname,				\
> +		  f2fs_folio_flags_addr(folio));			\
> +	if (folio->private == (void *)BIT(PAGE_PRIVATE_NOT_POINTER))	\
>  		folio_detach_private(folio);				\
> -	else								\
> -		folio->private = (void *)v;				\
>  }									\
>  static inline void clear_page_private_##name(struct page *page) \
>  { \
> @@ -2826,7 +2860,7 @@ PAGE_PRIVATE_CLEAR_FUNC(atomic, ATOMIC_WRITE);
>
>  static inline unsigned long folio_get_f2fs_data(struct folio *folio)
>  {
> -	unsigned long data = (unsigned long)folio->private;
> +	unsigned long data = f2fs_folio_get_private_flags(folio);
>
>  	if (!test_bit(PAGE_PRIVATE_NOT_POINTER, &data))
>  		return 0;
Because neither f2fs_ffs_find_or_alloc() (which allocates ffs with
__GFP_ZERO) nor PAGE_PRIVATE_SET_FUNC ever sets PAGE_PRIVATE_NOT_POINTER in
ffs->private_flags, won't PAGE_PRIVATE_NOT_POINTER always be 0 in
f2fs_folio_get_private_flags(folio) whenever f2fs_folio_has_ffs(folio) is
true?
This appears to cause several issues for large folios with ffs attached:
1. folio_test_f2fs_nonpointer(folio) always returns false. In
fs/f2fs/compress.c, f2fs_is_compressed_page() checks:
    if (!folio->private)
        return false;
    if (folio_test_f2fs_nonpointer(folio))
        return false;
    f2fs_bug_on(F2FS_F_SB(folio),
        *((u32 *)folio->private) != F2FS_COMPRESSED_PAGE_MAGIC);
    return true;
When CONFIG_F2FS_FS_COMPRESSION is enabled and large folio writes are
enabled in later commits in this series ("f2fs: make GC migration
large-folio aware" and "f2fs: allow large folio support to writeable
files"), __has_merged_page() and f2fs_write_end_bio() call
f2fs_is_compressed_page(folio) on large folios with ffs. Because
folio_test_f2fs_nonpointer(folio) returns false, f2fs_is_compressed_page()
triggers f2fs_bug_on() (setting SBI_NEED_FSCK) and returns true, causing
f2fs_write_end_bio() to call f2fs_compress_write_end_io() and cast
folio->private (struct f2fs_folio_state *) to struct compress_io_ctx *.
Although a later commit in the series ("f2fs: make compressed files
compatible with large folio") adds an explicit f2fs_folio_has_ffs(folio)
check to f2fs_is_compressed_page(), the broken invariant affects the
intermediate commits and leaves folio_test_f2fs_nonpointer() broken for
large folios.
2. folio_get_f2fs_data(folio) checks
!test_bit(PAGE_PRIVATE_NOT_POINTER, &data) on the value returned by
f2fs_folio_get_private_flags(folio), so it will always return 0 when ffs is
attached. Meanwhile, folio_set_f2fs_data() right below it was not updated
for ffs and still bitwise-ORs data directly into folio->private, which
would corrupt the ffs pointer if called on a large folio.
Should PAGE_PRIVATE_NOT_POINTER and the data helpers be handled consistently
with ffs->private_flags?
>[!NOTE]
>Please ayudan-rate this review via `git notes` (see https://git.kernel.org/pub/scm/linux/kernel/git/mason/ai-review-prompts.git/tree/README.md):
>`git notes --ref=refs/notes/ai-review add -f -m "review-rating: <helpful|mostly-helpful|neutral|unhelpful|wrong>" 5dc0bed5a4117aeba7c4f3561339538114aa9720`
>If you have thoughts you'd like to share, add `comment: <free text>` on a new line in the note body.
>We scrape relationships between patches and notes from the mailing lists, so feel free to include the note text in your reply or push the notes ref to a public tree.
>
>🤖 AI review engine: google/gemini-3.1-pro-preview | 💬 Prompts: https://git.kernel.org/pub/scm/linux/kernel/git/mason/ai-review-prompts.git/tree/ (ef3d8ff5c6eb)
To: None    Cc: None    Status: Disabled (SMTP not configured)
Tokens used: In: 1834k · Cached: 9447k · Out: 58k
View Review Map·View Raw Log
↑ Back to Summary
Patch 2: f2fs: carry subpage offset and count in write IO
Result:
No regressions
Reviewed
▶ Inline Review
To: None    Cc: None    Status: Disabled (SMTP not configured)
Tokens used: In: 1465k · Cached: 15035k · Out: 54k
View Review Map·View Raw Log
↑ Back to Summary
Patch 3: f2fs: support regular file buffered writes on large folios
Result:
Critical: 0 · High: 1 · Medium: 0 · Low: 0
Reviewed
▼ Inline Review
Copy
commit 928ef87eb1284ddf44f56c2de4f7b745e3348066
Author: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
f2fs: support regular file buffered writes on large folios
This commit adds buffered write support for regular files backed by large
folios by preallocating partial blocks and synchronously reading only the
unaligned head and tail 4K subpages during write_begin.
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 3a3852566a2a2..f01bf06a77b05 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
[ ... ]
> @@ -1457,6 +1496,40 @@ static void f2fs_submit_page_read(struct inode *inode, struct fsverity_info *vi,
>  	f2fs_submit_read_bio(sbi, bio, DATA);
>  }
>
> +/*
> + * Synchronously read a single 4K subpage by reusing f2fs_submit_page_read()
> + * so that iostat, trace, blk-crypto and post-read handling are all preserved.
> + * The caller must have already allocated ffs for the folio.
> + */
> +static int f2fs_submit_page_read_sync(struct inode *inode, struct folio *folio,
> +				      pgoff_t index, block_t blkaddr)
> +{
> +	struct f2fs_folio_state *ffs =
> +		(struct f2fs_folio_state *)folio->private;
> +
> +	/* Add bias so end_io does not call folio_end_read(). */
> +	f2fs_update_read_folio_pending(folio, 1);
> +
> +	/*
> +	 * We are holding the folio lock, so use GFP_NOIO for the bio
> +	 * allocation to avoid entering mm reclaim.
> +	 */
> +	f2fs_submit_page_read(inode, NULL, folio, index, blkaddr,
> +			      REQ_OP_READ, true);
> +
> +	/* Wait until all bios have completed (pending drops back to our bias). */
> +	while (READ_ONCE(ffs->read_pages_pending) != 1)
> +		f2fs_io_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
> +
> +	/* Remove the bias. */
> +	f2fs_update_read_folio_pending(folio, -1);
Can waking up here as soon as ffs->read_pages_pending reaches 1 race with
f2fs_finish_read_bio() in fs/f2fs/data.c and cause a NULL pointer
dereference or use-after-free on the folio?
In f2fs_finish_read_bio(), ffs->read_pages_pending is decremented before
dec_cache_count() accesses the folio's mapping:
	if (folio_test_large(folio)) {
		struct f2fs_folio_state *ffs =
			(struct f2fs_folio_state *)folio->private;
		spin_lock_irqsave(&ffs->state_lock, flags);
		ffs->read_pages_pending -= nr_pages;
		finished = !ffs->read_pages_pending;
		spin_unlock_irqrestore(&ffs->state_lock, flags);
	}
	while (nr_pages--)
		dec_cache_count(F2FS_F_SB(folio), F2FS_RD_DATA);
Because f2fs_submit_page_read_sync() biases read_pages_pending by +1,
finished is false, so f2fs_finish_read_bio() does not hold the folio lock via
folio_end_read(). Once read_pages_pending is decremented to 1 and
ffs->state_lock is dropped, the waiting task in
f2fs_write_begin() -> prepare_large_folio_write_begin() ->
f2fs_submit_page_read_sync() can immediately wake up, remove the bias, and
unlock and release the folio (for example on an error path into
f2fs_write_failed(), or after f2fs_write_end() followed by truncation or
eviction).
If the folio is truncated or freed before f2fs_finish_read_bio() executes
dec_cache_count(F2FS_F_SB(folio), F2FS_RD_DATA), won't F2FS_F_SB(folio)
dereference a NULL folio->mapping or a freed folio?
> +
> +	if (!f2fs_ffs_test_blk_uptodate(folio, index))
> +		return -EIO;
> +
> +	return 0;
> +}
[ ... ]
To: None    Cc: None    Status: Disabled (SMTP not configured)
Tokens used: In: 1787k · Cached: 21762k · Out: 47k
View Review Map·View Raw Log
↑ Back to Summary
Patch 4: f2fs: support atomic file large folios buffered write
Result:
Critical: 0 · High: 1 · Medium: 1 · Low: 0
Reviewed
▼ Inline Review
Copy
commit 421c38a2fd718b3ee600d299fc93a8b83ea493ee
Author: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
f2fs: support atomic file large folios buffered write
This commit adds buffered write support for atomic files backed by large
folios by introducing prepare_large_folio_atomic_write_begin() and updating
prepare_atomic_write_begin() and f2fs_write_begin().
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index f01bf06a77b05..126cad81227f0 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -4305,18 +4305,22 @@ static int __reserve_data_block(struct inode *inode, pgoff_t index,
>  }
>
>  static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
> -			struct folio *folio, loff_t pos, unsigned int len,
> -			block_t *blk_addr, bool *node_changed)
> +			struct inode *inode, pgoff_t index,
> +			block_t *blk_addr, bool *node_changed,
> +			bool check_reserved)
>  {
> -	struct inode *inode = folio->mapping->host;
>  	struct inode *cow_inode = F2FS_I(inode)->cow_inode;
> -	pgoff_t index = folio->index;
>  	int err = 0;
>  	block_t ori_blk_addr = NULL_ADDR;
>  	bool cow_has_reserved_block = false;
> +	bool append = ((loff_t)index << PAGE_SHIFT) >= i_size_read(inode);
>
> -	/* If pos is beyond the end of file, reserve a new block in COW inode */
> -	if ((pos & PAGE_MASK) >= i_size_read(inode))
> +	/*
> +	 * On the first attempt, an append write can skip the COW lookup and
> +	 * reserve directly.  On retry, check the COW block first so the same
> +	 * block is not reserved and accounted twice.
> +	 */
> +	if (append && !check_reserved)
>  		goto reserve_block;
Can skipping __find_data_block() on cow_inode when check_reserved is false
still double-increment F2FS_I(inode)->atomic_write_cnt and
sbi->current_atomic_write?
At reserve_block in prepare_atomic_write_begin(), when cow_has_reserved_block
is false, __reserve_data_block() calls f2fs_reserve_block():
    if (!cow_has_reserved_block) {
        err = __reserve_data_block(cow_inode, index, blk_addr,
                       node_changed);
        if (err)
            return err;
        inc_atomic_write_cnt(inode);
    }
If cow_inode already has NEW_ADDR at index, f2fs_reserve_block() returns 0
without allocating a new block, and inc_atomic_write_cnt(inode) increments
atomic_write_cnt and sbi->current_atomic_write a second time.
Since retried in f2fs_write_begin() is a local variable initialized to false
on each f2fs_write_begin() call, cow_inode can already hold NEW_ADDR at an
index >= (i_size_read(inode) >> PAGE_SHIFT) with check_reserved == false in
several cases:
1. In generic_perform_write(), if prepare_large_folio_atomic_write_begin()
reserves NEW_ADDR for multiple subpages in [start, end], and
copy_folio_from_iter_atomic() copies only the first subpage before faulting on
the next user page, f2fs_write_end() advances i_size only by the copied bytes.
The next loop iteration in generic_perform_write() calls f2fs_write_begin()
again with retried == false for the remaining subpages where
((loff_t)index << PAGE_SHIFT) >= i_size_read(inode) is still true.
2. If copy_folio_from_iter_atomic() returns 0 (or performs a short copy on a
non-uptodate folio so f2fs_write_end() sets copied = 0 without advancing
i_size), generic_perform_write() retries f2fs_write_begin() at the same offset
with retried == false.
3. If prepare_large_folio_atomic_write_begin() reserves NEW_ADDR in cow_inode
for earlier subpages in [start, end] and fails on a subsequent subpage,
f2fs_write_failed() only truncates inode and leaves the reserved NEW_ADDR
blocks in cow_inode beyond i_size.
4. On the order-0 read path in f2fs_write_begin(), if folio->mapping !=
mapping after f2fs_submit_page_read() and folio_lock(), it jumps to repeat
without setting retried = true.
>
>  	/* Look for the block in COW inode first */
> @@ -4330,7 +4334,7 @@ static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
>  	if (*blk_addr == NEW_ADDR)
>  		cow_has_reserved_block = true;
>
> -	if (is_inode_flag_set(inode, FI_ATOMIC_REPLACE))
> +	if (append || is_inode_flag_set(inode, FI_ATOMIC_REPLACE))
>  		goto reserve_block;
>
>  	/* Look for the block in the original inode */
> @@ -4498,6 +4502,62 @@ static int prepare_large_folio_write_begin(struct inode *inode,
>  	return 0;
>  }
>
> +static int prepare_large_folio_atomic_write_begin(struct inode *inode,
> +		struct address_space *mapping, struct folio *folio, loff_t pos,
> +		unsigned int len, bool retried)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	size_t ori_off = offset_in_folio(folio, pos);
> +	pgoff_t start, end, index;
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
> +						&blkaddr, &node_changed,
> +						retried);
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
> +		if (f2fs_balance_fs_folio_locked(folio, mapping, node_changed))
> +			return -EAGAIN;
> +	}
Does zeroing, reading, and marking every subpage in [start, end] uptodate
during prepare_large_folio_atomic_write_begin() cause premature uptodate state
and unnecessary reads of full subpages?
The commit message notes that existing data should be read for partial head
and tail subpages, and prepare_large_folio_write_begin() uses
find_next_valid_block() to only zero or read unaligned boundary blocks. Here,
the loop processes every block in [start, end]:
1. For full 4KB subpages in [start, end] that are about to be completely
overwritten by copy_folio_from_iter_atomic(), existing blocks are
synchronously read from disk via f2fs_submit_page_read_sync().
2. For NEW_ADDR blocks (or existing blocks read in), every subpage in
[start, end] is marked uptodate in ffs->state (and via folio_mark_uptodate()
if all subpages in the folio become uptodate) before generic_perform_write()
copies user data into the folio:
fs/f2fs/data.c:f2fs_write_end() {
    if (!folio_test_uptodate(folio)) {
        if (unlikely(copied != len)) {
            copied = 0;
        } else if (folio_test_large(folio)) {
            f2fs_ffs_mark_subrange_uptodate(folio,
                    offset_in_folio(folio, pos), len);
        } else {
            /* This should be come from len == PAGE_SIZE */
            folio_mark_uptodate(folio);
        }
    }
}
If all subpages of the folio become uptodate inside
prepare_large_folio_atomic_write_begin(), f2fs_ffs_mark_subrange_uptodate()
marks the entire folio uptodate before user data is copied. Then at the
balance label, f2fs_balance_fs_folio_locked() can unlock the uptodate folio
with zeroed data visible to concurrent readers, and if
copy_folio_from_iter_atomic() faults part-way through (copied != len),
f2fs_write_end() sees folio_test_uptodate(folio) == true and skips resetting
copied = 0, leaving unwritten zeroed bytes marked uptodate.
Similarly, if [start, end] covers only part of a large folio (so
folio_test_uptodate(folio) stays false while ffs->state bits for [start, end]
are set) and copy_folio_from_iter_atomic() performs a short copy and faults,
f2fs_write_end() sets copied = 0 but does not clear the uptodate bits in
ffs->state, leaving partially modified subpages marked uptodate in ffs->state.
Also, at this commit in the series, f2fs_submit_page_read_sync() adds a bias
of 1 to ffs->read_pages_pending and checks f2fs_ffs_test_blk_uptodate(folio,
index) before returning, which fails with -EIO until later commit bca3a5fa0cb1
("f2fs: support partial uptodate large folio read") updates
f2fs_finish_read_bio() to set per-block uptodate bits in ffs->state.
Should prepare_large_folio_atomic_write_begin() only read or zero partial
head and tail subpages like prepare_large_folio_write_begin() does, leaving
the written range to be marked uptodate in f2fs_write_end() after
copy_folio_from_iter_atomic() succeeds?
[ ... ]
To: None    Cc: None    Status: Disabled (SMTP not configured)
Tokens used: In: 1362k · Cached: 18575k · Out: 51k
View Review Map·View Raw Log
↑ Back to Summary
Patch 5: f2fs: support large folio writeback
Result:
Critical: 0 · High: 2 · Medium: 3 · Low: 0
Reviewed
▼ Inline Review
Copy
commit d81e66fccee4d6cf0692abb255b15a1dacb65d07
Author: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
f2fs: support large folio writeback
This commit introduces a folio-based writeback path via
f2fs_write_cache_folios() and f2fs_write_folio_dirty_range() for mappings
that support large folios, while keeping f2fs_write_cache_pages() for
non-large-folio mappings.
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 126cad81227f0..a0822d06e3bc9 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
[ ... ]
> @@ -3541,6 +3686,144 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>  	return err;
>  }
>
> +static int f2fs_write_folio_dirty_range(struct folio *folio, int *submitted,
> +					struct writeback_control *wbc,
> +					enum iostat_type io_type,
> +					u64 *pos, u64 len)
> +{
> +	struct inode *inode = folio->mapping->host;
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	bool atomic_commit = f2fs_is_atomic_file(inode) &&
> +				folio_test_f2fs_atomic(folio);
> +	struct inode *dn_inode = atomic_commit ?
> +				F2FS_I(inode)->cow_inode : inode;
> +	struct f2fs_folio_state *ffs = NULL;
> +	u64 folio_start = folio_pos(folio);
> +	pgoff_t start_idx = (*pos - folio_start) >> PAGE_SHIFT;
> +	pgoff_t end_idx = (*pos - folio_start + len - 1) >> PAGE_SHIFT;
> +	int err = 0;
> +
> +	for (pgoff_t i = start_idx; i <= end_idx && !err; i++) {
[ ... ]
> +		if (ipu_force ||
> +		    (__is_valid_data_blkaddr(fio.old_blkaddr) &&
> +					    need_inplace_update(&fio))) {
> +			f2fs_put_dnode(&dn);
> +			dn_held = false;
> +			err = f2fs_inplace_write_data(&fio);
> +			trace_f2fs_do_write_data_page(folio, IPU);
> +			if (err)
> +				goto block_done;
> +
> +			if (submitted)
> +				(*submitted)++;
> +			submitted_blk = true;
> +			set_inode_flag(inode, FI_UPDATE_WRITE);
> +			goto block_done;
> +		}
> +
> +		err = f2fs_get_node_info(sbi, dn.nid, &ni, false);
> +		if (err)
> +			goto block_done;
> +
> +		fio.version = ni.version;
> +
> +		f2fs_outplace_write_data(&dn, &fio);
> +		/*
> +		 * The outplace write path failed to submit this block.
> +		 */
> +		if (!fio.submitted) {
> +			err = -EIO;
> +			goto block_done;
> +		}
> +		if (submitted)
> +			(*submitted)++;
> +		submitted_blk = true;
> +		set_inode_flag(inode, FI_APPEND_WRITE);
> +		trace_f2fs_do_write_data_page(folio, OPU);
> +block_done:
[ ... ]
> +	return err;
> +}
> +
>  int f2fs_write_single_data_page(struct folio *folio, int *submitted,
>  				struct bio **bio,
>  				sector_t *last_block,
> @@ -3990,6 +4273,226 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  	return ret;
>  }
>
> +static int f2fs_write_cache_folios(struct address_space *mapping,
> +				   struct writeback_control *wbc,
> +				   enum iostat_type io_type)
> +{
> +	struct folio *folio = NULL;
> +	struct inode *inode = mapping->host;
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	struct f2fs_lock_context lc;
> +	u64 pos = 0;
> +	u64 end_pos = 0;
> +	u32 r_len = 0;
> +	int err = 0;
> +	int submitted = 0;
> +	int nwritten = 0;
> +	bool op_locked = false;
> +	bool retry = false;
> +
> +	if (get_dirty_pages(inode) <= SM_I(sbi)->min_hot_blocks)
> +		set_inode_flag(inode, FI_HOT_DATA);
> +	else
> +		clear_inode_flag(inode, FI_HOT_DATA);
> +
> +	while ((folio = writeback_iter(mapping, wbc, folio, &err))) {
Can calling writeback_iter() here deadlock during WB_SYNC_ALL writeback if
a folio has both PG_writeback and PG_dirty set while its bio is still
cached in sbi->write_io[DATA]?
In f2fs, out-of-place writes set PG_writeback and stage the folio into
sbi->write_io[DATA] without immediately submitting the bio to the block
layer. Because of this, f2fs_write_cache_pages() and the internal retry
path in f2fs_write_cache_folios() call f2fs_folio_wait_writeback(), which
flushes cached bios via f2fs_submit_merged_write_folio() and
f2fs_submit_merged_ipu_write() before calling folio_wait_writeback().
However, writeback_iter() -> writeback_get_folio() ->
folio_prepare_writeback() calls raw folio_wait_writeback() under
folio_lock() when wbc->sync_mode == WB_SYNC_ALL and both PG_writeback and
PG_dirty are set, without flushing sbi->write_io[DATA].
For example, during foreground GC (do_garbage_collect() ->
gc_data_segment() -> move_data_page()) migrating one block of a large
folio that has another dirty subpage, move_data_page() sees remaining
dirty subpages via f2fs_ffs_clear_subrange_dirty_and_test(), calls
folio_mark_dirty(), stages the block in sbi->write_io[DATA][COLD].bio via
f2fs_do_write_data_page() (setting PG_writeback), and unlocks the folio.
If a concurrent WB_SYNC_ALL thread enters writeback_iter(), it locks the
folio and sleeps in folio_wait_writeback() waiting for the unsubmitted
bio, while gc_data_segment() blocks on folio_lock() when it encounters the
next block of that large folio before do_garbage_collect() can submit the
cached bio.
A similar stall can occur if f2fs_write_folio_dirty_range() submits one
subpage into sbi->write_io[DATA], hits an error on a later subpage,
redirties and unlocks the folio at out: with PG_writeback still held by
the pending subpage, and then stalls on a subsequent folio before reaching
f2fs_submit_merged_write_cond() at the end of f2fs_write_cache_folios().
> +		struct f2fs_folio_state *ffs = NULL;
> +		u64 isize;
> +		size_t poff;
> +		pgoff_t end_index;
> +		bool verity_in_progress;
> +		int folio_submitted = 0;
> +		bool bias_added = false;
> +
> +		submitted = 0;
> +		retry = false;
> +
> +		if (err) {
> +			folio_redirty_for_writepage(wbc, folio);
> +			goto retry_out;
> +		}
> +
> +		if (atomic_read(&sbi->wb_sync_req[DATA]) &&
> +		    wbc->sync_mode == WB_SYNC_NONE) {
> +			folio_redirty_for_writepage(wbc, folio);
> +			/*
> +			 * A WB_SYNC_ALL writeback is in progress, so defer
> +			 * this writeback.  Mark the error as -EBUSY to let
> +			 * writeback_iter() stop iterating.
> +			 */
> +			err = -EBUSY;
> +			goto retry_out;
> +		}
> +
> +		/*
> +		 * If cp_error is set, all subpages of this folio are not written
> +		 * back unless the filesystem is mounted with errors=remount-ro.
> +		 */
> +		if (unlikely(f2fs_cp_error(sbi))) {
> +			mapping_set_error(folio->mapping, -EIO);
> +			if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_READONLY) {
> +				folio_redirty_for_writepage(wbc, folio);
> +			} else {
> +				if (f2fs_folio_has_ffs(folio))
> +					f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
> +									folio_size(folio));
> +				inode_dec_dirty_pages(inode);
> +			}
> +			goto retry_out;
> +		}
> +
> +		/*
> +		 * Writing back one large folio performs multiple block allocations, so
> +		 * best-effort balance the filesystem before writing it back.
> +		 */
> +		if (!F2FS_I(inode)->wb_task && has_not_enough_free_secs(sbi, 0, 0)) {
> +			folio_redirty_for_writepage(wbc, folio);
> +			retry = true;
> +			folio_unlock(folio);
> +			f2fs_balance_fs(sbi, true);
> +			folio_lock(folio);
> +			goto retry;
> +		}
> +retry:
Should the retry label be placed before the f2fs_cp_error(sbi) check (or
recheck f2fs_cp_error(sbi) under the retry block)?
When the folio is unlocked for f2fs_balance_fs() or during the
f2fs_io_schedule_timeout() backoff when f2fs_trylock_op() fails on
WB_SYNC_ALL, a concurrent checkpoint or GC can fail and set CP_ERROR_FLAG.
Jumping to retry: bypasses the f2fs_cp_error(sbi) check above, so instead
of recording -EIO via mapping_set_error() and handling the dirty state for
cp_error (as f2fs_write_single_data_page() does on every retry in
f2fs_write_cache_pages()), writeback proceeds into block allocation or
redirties the folio on error without setting the mapping error.
> +		pos = folio_pos(folio);
> +		end_pos = pos + folio_size(folio);
> +		isize = i_size_read(inode);
> +		verity_in_progress = f2fs_verity_in_progress(inode);
> +		poff = 0;
> +		end_index = 0;
> +
> +		if (retry) {
> +
> +			if (unlikely(folio->mapping != mapping))
> +				goto retry_out;
> +
> +			if (!folio_test_dirty(folio))
> +				goto retry_out;
> +
> +			if (folio_test_writeback(folio)) {
> +				if (wbc->sync_mode == WB_SYNC_NONE)
> +					goto retry_out;
> +				f2fs_folio_wait_writeback(folio, true, true);
> +			}
> +
> +			if (!folio_clear_dirty_for_io(folio))
> +				goto retry_out;
> +		}
> +
> +		/* To avoid dealing with the complexity for one subrange is in bio
> +		 * while we trylock_op failed before writing another subrange.
> +		 * Try to lock_op before any subrange write for the folio.
> +		 */
> +		if (!op_locked) {
> +			if (!f2fs_trylock_op(sbi, &lc)) {
> +				folio_redirty_for_writepage(wbc, folio);
> +				err = 0;
> +				if (wbc->sync_mode != WB_SYNC_ALL)
> +					goto retry_out;
> +
> +				retry = true;
> +				folio_unlock(folio);
> +				f2fs_io_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
> +				folio_lock(folio);
> +				goto retry;
> +			}
> +			op_locked = true;
> +		}
> +
> +		if (!verity_in_progress) {
> +			poff = offset_in_folio(folio, isize);
> +			end_index = isize >> PAGE_SHIFT;
> +
> +			if (folio->index > end_index ||
> +			    (folio->index == end_index && poff == 0))
> +				goto out;
Does jumping to out: here (as well as jumping to retry_out: in the
f2fs_cp_error(sbi) branch when errors != MOUNT_ERRORS_READONLY) leave
stale PAGECACHE_TAG_DIRTY and PAGECACHE_TAG_TOWRITE tags in
mapping->i_pages?
writeback_iter() (via folio_prepare_writeback() ->
folio_clear_dirty_for_io()) and the retry path clear PG_dirty on the folio
while leaving PAGECACHE_TAG_DIRTY and PAGECACHE_TAG_TOWRITE set in the
xarray until folio_start_writeback() or folio_redirty_for_writepage() is
called.
When a folio is at or beyond isize and jumps to out: before
folio_start_writeback() is called, or when f2fs_cp_error(sbi) drops the
dirty state and jumps to retry_out:, the folio is unlocked with
PG_dirty == 0 without ever calling folio_start_writeback() /
folio_end_writeback(). That leaves PAGECACHE_TAG_DIRTY and
PAGECACHE_TAG_TOWRITE set on a clean folio in mapping->i_pages, causing
VFS writeback (__writeback_single_inode()) to see
mapping_tagged(mapping, PAGECACHE_TAG_DIRTY) and repeatedly requeue the
inode via redirty_tail_locked() while __f2fs_write_data_pages() immediately
returns 0 on WB_SYNC_NONE because get_dirty_pages(inode) is 0.
> +
> +			if (end_pos > isize) {
> +				folio_zero_segment(folio, poff, folio_size(folio));
> +				end_pos = isize;
> +			}
> +		}
> +
> +		folio_start_writeback(folio);
> +
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
> +
> +		while ((r_len = ffs_find_dirty_range(folio, &pos, end_pos))) {
> +			err = f2fs_write_folio_dirty_range(folio, &submitted,
> +					wbc, io_type, &pos, r_len);
> +			folio_submitted += submitted;
> +			nwritten += submitted;
> +			if (err)
> +				goto out;
> +		}
Does this loop overcount folio_submitted and nwritten when a large folio
contains multiple discontiguous dirty ranges?
submitted is initialized to 0 once per folio before the loop, and
f2fs_write_folio_dirty_range() increments (*submitted)++ for each submitted
block without resetting *submitted = 0 on entry. When
ffs_find_dirty_range() finds a second dirty range in the same folio,
submitted still holds the count from the previous range(s), so
folio_submitted += submitted and nwritten += submitted add the earlier
ranges' counts again on each subsequent iteration (including when a later
range errors out before submitting any block). This remains present at the
end of the series (commit 1bb0e14154a5).
> +
> +		/* If none of the subpages of a folio is submitted, keep the atomic flag */
> +		if (folio_submitted &&
> +		    f2fs_is_atomic_file(inode) &&
> +		    folio_test_f2fs_atomic(folio))
> +			folio_clear_f2fs_atomic(folio);
> +
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
> +		else
> +			inode_dec_dirty_pages(inode);
When a large folio straddles isize and err == 0, can passing
end_pos - folio_pos(folio) to f2fs_ffs_clear_subrange_dirty_and_test()
leave post-EOF subpage dirty bits set and livelock writeback?
When pos < isize < end_pos and !verity_in_progress, the code earlier clamps
end_pos = isize so ffs_find_dirty_range() only writes subpages up to isize.
At out:, when err == 0, f2fs_ffs_clear_subrange_dirty_and_test() is called
with length end_pos - folio_pos(folio) (i.e. isize - folio_pos(folio))
rather than folio_size(folio).
If any subpage past round_up(isize, PAGE_SIZE) in that straddling folio has
its dirty bit set in ffs->state (for instance via f2fs_zero_range() ->
fill_zero() with FALLOC_FL_KEEP_SIZE, via f2fs_ffs_find_or_alloc() marking
all nr_subpages dirty when PG_dirty is set, or after a partial truncate),
f2fs_ffs_clear_subrange_dirty_and_test() will not clear those post-EOF
bits, will return true, and will call folio_redirty_for_writepage() on
every writeback pass without ever writing or clearing them, preventing
inode_dec_dirty_pages() from ever being reached.
Should the !err case clear up to folio_size(folio) instead of
end_pos - folio_pos(folio)?
> +
> +		/*
> +		 * Release the bias taken above and we end writeback here if
> +		 * no write bio is in flight.
> +		 */
[ ... ]
完美 — wait no extra text! Let me make sure I don't output anything after the last line! Let me re-check the response!
Wait: I just wrote "完美 — wait no extra text!" in the response! Let me NOT do that!
Wait: why did I write that outside the thought block?! Because the thought block ended early!
Wait: I cannot edit already emitted tokens, or wait—is this the final response? Yes! Let me stop immediately.
To: None    Cc: None    Status: Disabled (SMTP not configured)
Tokens used: In: 2240k · Cached: 35326k · Out: 93k
View Review Map·View Raw Log
↑ Back to Summary
Patch 6: f2fs: account large folio dirty data at block granularity
Result:
No regressions
Reviewed
▶ Inline Review
To: None    Cc: None    Status: Disabled (SMTP not configured)
Tokens used: In: 1571k · Cached: 15211k · Out: 36k
View Review Map·View Raw Log
↑ Back to Summary
Patch 7: f2fs: prepare mmap write faults for large folios
Result:
Critical: 0 · High: 1 · Medium: 0 · Low: 0
Reviewed
▼ Inline Review
Copy
commit 1dfe17de2abebed79ba1f0219bc9168714a92b0c
Author: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
f2fs: prepare mmap write faults for large folios
This commit updates f2fs_vm_page_mkwrite() to handle large folios by
allocating blocks across the valid portion of the folio, zeroing any
post-EOF segment, and marking the subrange dirty in f2fs_folio_state.
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 85b4f1a2ff0dc..808b72d3d78a9 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
[ ... ]
> @@ -200,62 +229,59 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>  	}
>
>  	folio_lock(folio);
> -	/*
> -	 * A concurrent buffered write can extend isize, so we store isize in a
> -	 * local variable to let the zeroing offset match the EOF check below.
> -	 */
>  	isize = i_size_read(inode);
> +	folio_start = folio_pos(folio);
> +	subpage_off = offset_in_folio(folio, pos);
> +	valid_end = min_t(loff_t, folio_start + folio_size(folio), isize);
> +	dirty_len = valid_end - folio_start;
>
>  	if (unlikely(folio->mapping != inode->i_mapping ||
> -			folio_pos(folio) > isize ||
> -			!folio_test_uptodate(folio))) {
> +			pos >= isize ||
> +			!f2fs_ffs_test_blk_uptodate(folio,
> +			folio->index + (subpage_off >> PAGE_SHIFT)))) {
>  		folio_unlock(folio);
>  		err = -EFAULT;
>  		goto out_sem;
>  	}
>
> -	set_new_dnode(&dn, inode, NULL, NULL, 0);
> -	if (need_alloc) {
> -		/* block allocation */
> -		err = f2fs_get_block_locked(&dn, folio->index);
> -	} else {
> -		err = f2fs_get_dnode_of_data(&dn, folio->index, LOOKUP_NODE);
> -		f2fs_put_dnode(&dn);
> -		if (f2fs_is_pinned_file(inode) &&
> -		    !__is_valid_data_blkaddr(dn.data_blkaddr))
> -			err = -EIO;
> -	}
> -
> -	if (err) {
> +	if (folio_test_large(folio) && !f2fs_ffs_find_or_alloc(folio)) {
>  		folio_unlock(folio);
> +		err = -ENOMEM;
>  		goto out_sem;
>  	}
>
> -	f2fs_folio_wait_writeback(folio, false, true);
> +	nr = DIV_ROUND_UP(dirty_len, PAGE_SIZE);
>
> -	/* wait for GCed page writeback via generic cache */
> -	f2fs_wait_on_block_writeback(inode, dn.data_blkaddr);
> +	for (i = 0; i < nr; i++) {
> +		err = f2fs_get_block_mkwrite(inode, folio, folio->index + i,
> +					     need_alloc);
> +		if (err) {
> +			folio_unlock(folio);
> +			goto out_sem;
> +		}
> +	}
>
>  	/* page is wholly or partially inside EOF */
> -	if (((loff_t)(folio->index + 1) << PAGE_SHIFT) > isize) {
> -		loff_t offset;
> +	if (folio_start + folio_size(folio) > isize) {
> +		size_t offset = offset_in_folio(folio, isize);
>
> -		offset = isize & ~PAGE_MASK;
>  		folio_zero_segment(folio, offset, folio_size(folio));
>  	}
> +
> +	if (folio_test_large(folio))
> +		f2fs_ffs_mark_subrange_dirty(folio, 0, dirty_len);
>  	folio_mark_dirty(folio);
Can f2fs_vm_page_mkwrite() allocate blocks for and mark dirty non-uptodate
subpages of a large folio here?
f2fs_vm_page_mkwrite() replaces !folio_test_uptodate(folio) with a check on
only the single faulted subpage via f2fs_ffs_test_blk_uptodate(folio,
folio->index + (subpage_off >> PAGE_SHIFT)), but then proceeds to call
f2fs_get_block_mkwrite() across all nr subpages in [0, dirty_len) and marks
the entire [0, dirty_len) range dirty via f2fs_ffs_mark_subrange_dirty().
However, f2fs_ffs_mark_subrange_dirty() in fs/f2fs/data.c requires all
subpages in the range to already be uptodate:
/*
 * Mark the given range dirty for writeback.
 *
 * Callers must guarantee that the corresponding subpages are already
 * uptodate: a dirty subpage always holds the latest data, whose
 * on-disk copy may be stale.
 */
void f2fs_ffs_mark_subrange_dirty(struct folio *folio,
				    size_t offset, size_t len)
In both do_shared_fault() and wp_page_shared(), the folio is unlocked and
mapping->invalidate_lock is not held before calling do_page_mkwrite() ->
f2fs_vm_page_mkwrite(). In that window, a concurrent hole punch
(f2fs_punch_hole() -> truncate_pagecache_range() ->
truncate_inode_partial_folio() -> f2fs_invalidate_folio()) or truncation on
another subpage of the same large folio can clear the uptodate bits in
ffs->state for the invalidated subpages and call folio_clear_uptodate(folio).
Because the faulting thread holds a folio reference (or another subpage is
dirty), folio_split() in truncate_inode_partial_folio() fails and leaves the
folio in inode->i_mapping with !folio_test_uptodate(folio) and cleared
per-block uptodate bits in ffs->state. Similarly,
f2fs_write_folio_dirty_range() -> f2fs_clear_truncated_page_state() can clear
a subpage's uptodate bit in ffs->state and clear folio uptodate.
When f2fs_vm_page_mkwrite() then locks the folio, checking only the faulted
subpage at pidx succeeds if that subpage is still uptodate in ffs->state. It
then re-allocates blocks over the invalidated hole via
f2fs_get_block_mkwrite(), marks the non-uptodate subpages dirty in ffs->state,
and returns VM_FAULT_LOCKED while !folio_test_uptodate(folio) (allowing
do_shared_fault() -> finish_fault() to install PTEs for the non-uptodate
folio).
Since f2fs_vm_page_mkwrite() dirties the entire [0, dirty_len) range, should
it still verify that the folio (or every subpage in [0, dirty_len)) is
uptodate before allocating blocks and marking the range dirty?
[ ... ]
To: None    Cc: None    Status: Disabled (SMTP not configured)
Tokens used: In: 1601k · Cached: 22742k · Out: 39k
View Review Map·View Raw Log
↑ Back to Summary
Patch 8: f2fs: make GC migration large-folio aware
Result:
Critical: 0 · High: 2 · Medium: 1 · Low: 0
Reviewed
▼ Inline Review
Copy
commit df5d46a34919fb05bfd186e84d3c1b6847
Author: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
f2fs: make GC migration large-folio aware
This commit updates f2fs data lookup helpers and garbage collection to
operate on addressed 4K subpages within large folios rather than
invalidating or rejecting large folios. It also adjusts subpage dirty
tracking in move_data_page() and write_pages_pending / gcing flag
handling in f2fs_do_write_data_page().
Closes: https://lore.kernel.org/oe-lkp/202610081027.b13dcf10-lkp@intel.com
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index d027c949823b0..b3ada22cb0cbe 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1679,20 +1679,16 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
>  	struct dnode_of_data dn;
>  	struct folio *folio;
>  	int err;
> -retry:
> +
>  	folio = f2fs_grab_cache_folio(mapping, index, for_write);
>  	if (IS_ERR(folio))
>  		return folio;
>
>  	if (folio_test_large(folio)) {
> -		pgoff_t folio_index = mapping_align_index(mapping, index);
> -		unsigned long nr_pages = folio_nr_pages(folio);
> -
> -		f2fs_folio_put(folio, true);
> -		invalidate_inode_pages2_range(mapping, folio_index,
> -				folio_index + nr_pages - 1);
> -		f2fs_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
> -		goto retry;
> +		if (!f2fs_ffs_find_or_alloc(folio)) {
> +			err = -ENOMEM;
> +			goto put_err;
> +		}
>  	}
With the large-folio invalidation loop removed from
f2fs_get_read_data_folio(), callers of f2fs_get_lock_data_folio() now
receive large folios with struct f2fs_folio_state (ffs) attached. While
subsequent patches in this series update truncate_partial_data_page(),
fill_zero(), and __clone_blkaddrs() to mark subpages dirty via
f2fs_ffs_mark_subrange_dirty(), what happens when f2fs_defragment_range()
or f2fs_migrate_blocks() encounters a large folio?
In fs/f2fs/file.c:f2fs_defragment_range():
	folio = f2fs_get_lock_data_folio(inode, idx, true);
	if (IS_ERR(folio)) {
		err = PTR_ERR(folio);
		goto clear_out;
	}
	f2fs_folio_wait_writeback(folio, true, true);
	folio_mark_dirty(folio);
	folio_set_f2fs_gcing(folio);
and in fs/f2fs/data.c:f2fs_migrate_blocks():
	folio = f2fs_get_lock_data_folio(inode, blkidx, true);
	if (IS_ERR(folio)) {
		f2fs_up_write(&sbi->pin_sem);
		ret = PTR_ERR(folio);
		goto done;
	}
	folio_mark_dirty(folio);
Neither f2fs_ioc_defragment() nor f2fs_defragment_range() checks
IS_IMMUTABLE(inode) or requires FMODE_WRITE, so F2FS_IOC_DEFRAGMENT can be
invoked directly on an immutable file with cached large folios. Similarly,
if a file had large folios populated while immutable and then had
FS_IMMUTABLE_FL cleared via f2fs_fileattr_set() (which leaves
AS_LARGE_FOLIO_SUPPORT and cached large folios in inode->i_mapping), both
f2fs_defragment_range() and f2fs_swap_activate() -> check_swap_activate()
-> f2fs_migrate_blocks() can receive a large folio with ffs attached.
Because f2fs_folio_has_ffs(folio) is true and neither caller invokes
f2fs_ffs_mark_subrange_dirty(), f2fs_update_dirty_folio() skips
f2fs_account_dirty_blocks() and f2fs_write_cache_folios() finds no dirty
subpages in ffs->state via ffs_find_dirty_range(), completing writeback
without writing any blocks. In check_swap_activate(), f2fs_migrate_blocks()
returns 0 without migrating the unaligned extent and jumps to goto retry,
resulting in an unbounded loop. Should f2fs_defragment_range() and
f2fs_migrate_blocks() also mark the target subpage dirty in ffs?
[ ... ]
> @@ -3587,8 +3599,11 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>  	struct dnode_of_data dn;
>  	struct node_info ni;
>  	struct f2fs_lock_context lc;
> +	struct f2fs_folio_state *ffs;
>  	bool ipu_force = false;
>  	bool atomic_commit;
> +	bool pending_added = false;
> +	bool submitted = false;
>  	int err = 0;
>
>  	/* Use COW inode to make dnode_of_data for atomic write */
> @@ -3617,8 +3632,11 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>  		return -EINVAL;
>
>  	/* Deadlock due to between page->lock and f2fs_lock_op */
> -	if (fio->need_lock == LOCK_REQ && !f2fs_trylock_op(fio->sbi, &lc))
> +	if (fio->need_lock == LOCK_REQ && !f2fs_trylock_op(fio->sbi, &lc)) {
> +		if (!f2fs_ffs_has_dirty_subpage(folio))
> +			folio_clear_f2fs_gcing(folio);
>  		return -EAGAIN;
> +	}
>
>  	err = f2fs_get_dnode_of_data(&dn, F2FS_FIO_LBLK(fio),
>  				     LOOKUP_NODE);
> @@ -3630,7 +3648,6 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>  	/* This page is already truncated */
>  	if (fio->old_blkaddr == NULL_ADDR) {
>  		folio_clear_uptodate(folio);
> -		folio_clear_f2fs_gcing(folio);
>  		goto out_writepage;
>  	}
>  got_it:
> @@ -3680,6 +3697,11 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>  	fio->version = ni.version;
>
>  	__folio_start_writeback(folio, folio_test_dirty(folio));
> +	if (f2fs_folio_has_ffs(folio)) {
> +		ffs = (struct f2fs_folio_state *)folio->private;
> +		atomic_inc(&ffs->write_pages_pending);
> +		pending_added = true;
> +	}
>
>  	if (fio->compr_blocks && fio->old_blkaddr == COMPRESS_ADDR)
>  		f2fs_i_compr_blocks_update(inode, fio->compr_blocks - 1, false);
> @@ -3694,6 +3716,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>  		err = -EIO;
>  		goto out_writepage;
>  	}
> +	submitted = true;
>  	set_inode_flag(inode, FI_APPEND_WRITE);
>  	if (atomic_commit)
>  		folio_clear_f2fs_atomic(folio);
> @@ -3702,6 +3725,13 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
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
Can this error path clear the gcing flag prematurely or leave it set when
it shouldn't be?
In fs/f2fs/data.c:f2fs_ffs_has_dirty_subpage():
	if (!f2fs_folio_has_ffs(folio))
		return false;
For order-0 folios, f2fs_ffs_has_dirty_subpage() always returns false. When
f2fs_write_single_data_page() writes back an order-0 folio that had gcing
set (by BG_GC or f2fs_defragment_range()), it first calls
f2fs_do_write_data_page() with fio.need_lock = LOCK_RETRY:
	if (err == -EAGAIN) {
		err = f2fs_do_write_data_page(&fio);
		if (err == -EAGAIN) {
			f2fs_bug_on(sbi, compr_blocks);
			fio.need_lock = LOCK_REQ;
			err = f2fs_do_write_data_page(&fio);
		}
	}
If f2fs_trylock_op() fails under cp_rwsem contention in the LOCK_RETRY
attempt, f2fs_do_write_data_page() jumps to out_writepage -> out and clears
gcing on the folio before the LOCK_REQ retry or the redirty_out path runs.
For a large folio where the migrating subpage was the only dirty subpage,
its dirty bit in ffs->state was already cleared before calling
f2fs_do_write_data_page(), so f2fs_ffs_has_dirty_subpage() also returns
false and clears gcing before the retry or redirty_out path.
Similarly, in move_data_page() (FG_GC), if f2fs_do_write_data_page() fails
and no other subpage is dirty, f2fs_do_write_data_page() clears gcing, and
move_data_page() then redirties the subpage when is_dirty is true without
restoring gcing (or if an unrelated subpage in the large folio is dirty
from a normal write, f2fs_ffs_has_dirty_subpage() returns true and leaves
gcing set on the folio even when FG_GC fails, while early returns like
FAULT_SKIP_WRITE bypass out: altogether).
Losing the gcing flag on a migrating folio allows f2fs_should_update_outplace()
to permit in-place writes back to the victim segment, changes segment routing
in __get_segment_type_6(), and alters F2FS_WB_CP_DATA accounting in
f2fs_is_cp_guaranteed().
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index c66ca03d0d5a3..c3e01f6811b4a 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
[ ... ]
> @@ -1558,28 +1567,37 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
>  			.need_lock = LOCK_REQ,
>  			.io_type = FS_GC_DATA_IO,
>  		};
> -		bool is_dirty = folio_test_dirty(folio);
> +		bool is_dirty = f2fs_ffs_test_blk_dirty(folio, bidx);
>
>  retry:
>  		f2fs_folio_wait_writeback(folio, true, true);
>
> +		if (large)
> +			f2fs_ffs_mark_subrange_dirty(folio, foff, PAGE_SIZE);
>  		folio_mark_dirty(folio);
>  		if (folio_clear_dirty_for_io(folio)) {
> -			inode_dec_dirty_block(inode);
> -			f2fs_remove_dirty_inode(inode);
> +			if (!large) {
> +				inode_dec_dirty_block(inode);
> +				f2fs_remove_dirty_inode(inode);
> +			} else if (f2fs_ffs_clear_subrange_dirty_and_test(folio,
> +							foff, PAGE_SIZE)) {
> +				folio_mark_dirty(folio);
> +			}
>  		}
>
>  		folio_set_f2fs_gcing(folio);
>
>  		err = f2fs_do_write_data_page(&fio);
Could re-marking the large folio dirty here while queueing a single subpage
into sbi->write_io cause an AB-BA deadlock between foreground GC and a
concurrent WB_SYNC_ALL writeback thread?
Consider a large folio with multiple dirty subpages where at least two
blocks reside in a victim segment being migrated by FG_GC
(do_garbage_collect() -> gc_data_segment() -> move_data_page()):
1. For the first subpage, move_data_page() calls
   f2fs_ffs_clear_subrange_dirty_and_test(), which returns true because
   another subpage is still dirty, and then calls folio_mark_dirty(folio).
2. f2fs_do_write_data_page() calls
   __folio_start_writeback(folio, folio_test_dirty(folio)) with keep_write
   true (leaving both PG_dirty / PAGECACHE_TAG_DIRTY / PAGECACHE_TAG_TOWRITE
   and PG_writeback set on the folio) and queues the block into the cached
   BIO in sbi->write_io[DATA][COLD] via f2fs_outplace_write_data() ->
   f2fs_submit_page_write().
3. move_data_page() unlocks the folio via f2fs_folio_put(folio, true)
   without submitting the merged BIO in sbi->write_io[DATA][COLD] (which is
   normally flushed either when move_data_page() calls
   f2fs_folio_wait_writeback() on the next subpage under folio_lock, or at
   the end of do_garbage_collect() via f2fs_submit_merged_write()).
4. Before GC locks the folio for the second subpage, a concurrent
   WB_SYNC_ALL writeback (such as fsync() or sync()) enters
   f2fs_write_cache_folios() -> writeback_iter() -> writeback_get_folio()
   -> folio_prepare_writeback(), which locks the folio and sees both
   folio_test_dirty(folio) and folio_test_writeback(folio) set.
5. folio_prepare_writeback() calls generic folio_wait_writeback(folio)
   while holding folio_lock(folio). Unlike f2fs_folio_wait_writeback(),
   generic folio_wait_writeback() does not call
   f2fs_submit_merged_write_folio() to flush the cached BIO in
   sbi->write_io[DATA][COLD].
6. When gc_data_segment() moves to the next block of the same folio,
   move_data_page() -> f2fs_get_lock_data_folio() blocks on folio_lock(folio)
   held by the writeback thread, while the writeback thread waits
   indefinitely in folio_wait_writeback(folio) for the GC thread to submit
   the cached BIO.
>  		if (err) {
> -			folio_clear_f2fs_gcing(folio);
>  			if (err == -ENOMEM) {
>  				memalloc_retry_wait(GFP_NOFS);
>  				goto retry;
>  			}
> -			if (is_dirty)
> +			if (is_dirty) {
> +				if (large)
> +					f2fs_ffs_mark_subrange_dirty(folio, foff, PAGE_SIZE);
>  				folio_mark_dirty(folio);
> +			}
>  		}
>  	}
>  out:
[ ... ]
To: None    Cc: None    Status: Disabled (SMTP not configured)
Tokens used: In: 1894k · Cached: 22026k · Out: 76k
View Review Map·View Raw Log
↑ Back to Summary
Patch 9: f2fs: optimize small block size large folio read
Result:
Critical: 0 · High: 1 · Medium: 0 · Low: 0
Reviewed
▼ Inline Review
Copy
commit ec87e8e9211921ee45324f3294d311bcd0175dad
Author: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
f2fs: optimize small block size large folio read
This commit batches read_pages_pending and iostat updates across contiguous
mapped blocks in f2fs_read_data_large_folio() and switches
f2fs_finish_read_bio() and f2fs_read_data_large_folio() to check
f2fs_folio_has_ffs().
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index b3ada22cb0cbe..b805dbe2c1875 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -158,7 +158,7 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
>  			continue;
>  		}
>
> -		if (folio_test_large(folio)) {
> +		if (f2fs_folio_has_ffs(folio)) {
>  			struct f2fs_folio_state *ffs =
>  				(struct f2fs_folio_state *)folio->private;
>
Can f2fs_folio_has_ffs() treat a non-pointer PAGE_PRIVATE_NOT_POINTER flag
value on folio->private as a struct f2fs_folio_state pointer?
In fs/f2fs/f2fs.h, f2fs_folio_has_ffs() only checks that the folio is large
and folio->private is non-NULL, without checking
!test_bit(PAGE_PRIVATE_NOT_POINTER, &private):
fs/f2fs/f2fs.h:f2fs_folio_has_ffs() {
	unsigned long private = (unsigned long)folio->private;
	return folio_test_large(folio) && private;
}
A large folio in the page cache can have folio->private == NULL, for example
when f2fs_read_data_large_folio() reads a hole-backed large folio and skips
f2fs_ffs_find_or_alloc(), or after f2fs_release_folio() detaches ffs on a
clean large folio while an external reference such as a GUP pin keeps the
folio in the page cache.
If that folio is subsequently dirtied through folio_mark_dirty() ->
f2fs_dirty_data_folio() -> f2fs_update_dirty_folio():
fs/f2fs/checkpoint.c:f2fs_update_dirty_folio() {
	...
	if (f2fs_folio_has_ffs(folio)) {
		folio_set_f2fs_reference(folio);
		return;
	}
	f2fs_account_dirty_blocks(inode, 1);
	folio_set_f2fs_reference(folio);
}
folio_set_f2fs_reference() sees folio->private == NULL and attaches
(void *)BIT(PAGE_PRIVATE_NOT_POINTER) (0x1), and then calls
f2fs_folio_flags_addr(folio):
fs/f2fs/f2fs.h:f2fs_folio_flags_addr() {
	if (f2fs_folio_has_ffs(folio))
		return &((struct f2fs_folio_state *)folio->private)->private_flags;
	return (unsigned long *)&folio->private;
}
#define PAGE_PRIVATE_SET_FUNC(name, flagname) \
static inline void folio_set_f2fs_##name(struct folio *folio)		\
{									\
	if (!folio->private)						\
		folio_attach_private(folio,				\
				(void *)BIT(PAGE_PRIVATE_NOT_POINTER));	\
	set_bit(PAGE_PRIVATE_##flagname, f2fs_folio_flags_addr(folio));	\
}
Because folio->private is now 0x1, f2fs_folio_has_ffs(folio) returns true,
and set_bit() dereferences &((struct f2fs_folio_state *)0x1)->private_flags
(and any subsequent f2fs_folio_has_ffs() check in f2fs_finish_read_bio() or
f2fs_update_read_folio_pending() would likewise cast 0x1 to struct
f2fs_folio_state *).
Should f2fs_folio_has_ffs() also verify
!test_bit(PAGE_PRIVATE_NOT_POINTER, &private), or should large folios always
allocate a struct f2fs_folio_state instead of attaching
BIT(PAGE_PRIVATE_NOT_POINTER)?
[ ... ]
> @@ -3250,9 +3265,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>  			}
>
>  			/* set the bitmap to wait */
> -			spin_lock_irq(&ffs->state_lock);
> -			ffs->read_pages_pending++;
> -			spin_unlock_irq(&ffs->state_lock);
> +			f2fs_update_read_folio_pending(folio, len_blks);
>  		}
>
>  		/*
[ ... ]
To: None    Cc: None    Status: Disabled (SMTP not configured)
Tokens used: In: 1391k · Cached: 15987k · Out: 51k
View Review Map·View Raw Log
↑ Back to Summary
Patch 10: f2fs: support partial uptodate large folio read
Result:
No regressions
Reviewed
▶ Inline Review
To: None    Cc: None    Status: Disabled (SMTP not configured)
Tokens used: In: 777k · Cached: 6841k · Out: 15k
View Review Map·View Raw Log
↑ Back to Summary
Patch 11: f2fs: handle partial truncate of large folio dirty subpages
Result:
No regressions
Reviewed
▶ Inline Review
To: None    Cc: None    Status: Disabled (SMTP not configured)
Tokens used: In: 1521k · Cached: 22356k · Out: 33k
View Review Map·View Raw Log
↑ Back to Summary
Patch 12: f2fs: fix zeroing paths for large folios
Result:
Critical: 0 · High: 1 · Medium: 0 · Low: 0
Reviewed
▼ Inline Review
Copy
commit 00b3236a0bd96c8d085d8918e5158c9f634b5731
Author: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
f2fs: fix zeroing paths for large folios
This commit updates f2fs data zeroing paths in truncate_partial_data_page(),
fill_zero(), and f2fs_get_new_data_folio() to compute folio-relative offsets
with offset_in_folio() and track per-block uptodate and dirty state on large
folios.
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 808b72d3d78a9..439e84a4aec39 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -833,12 +833,13 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
>  static int truncate_partial_data_page(struct inode *inode, u64 from,
>  								bool cache_only)
>  {
> -	loff_t offset = from & (PAGE_SIZE - 1);
>  	pgoff_t index = from >> PAGE_SHIFT;
>  	struct address_space *mapping = inode->i_mapping;
>  	struct folio *folio;
> +	size_t folio_off;
> +	size_t blk_end;
>
> -	if (!offset && !cache_only)
> +	if (!(from & (PAGE_SIZE - 1)) && !cache_only)
>  		return 0;
>
>  	if (cache_only) {
> @@ -856,12 +857,22 @@ static int truncate_partial_data_page(struct inode *inode, u64 from,
>  		return PTR_ERR(folio) == -ENOENT ? 0 : PTR_ERR(folio);
>  truncate_out:
>  	f2fs_folio_wait_writeback(folio, true, true);
> -	folio_zero_segment(folio, offset, folio_size(folio));
> +	folio_off = offset_in_folio(folio, from);
> +	blk_end = min_t(size_t, round_up(folio_off, PAGE_SIZE),
> +					folio_size(folio));
> +	folio_zero_segment(folio, folio_off, blk_end);
When cache_only is true, truncate_partial_data_page() can be called with a
page-aligned from value, such as from == 0 when truncating an inline-data
inode via f2fs_do_truncate_blocks() -> truncate_partial_data_page():
fs/f2fs/file.c:f2fs_do_truncate_blocks() {
	...
	if (f2fs_has_inline_data(inode)) {
		f2fs_truncate_inline_inode(inode, ientry, from);
		f2fs_put_cache(ientry, true);
		truncate_page = true;
		goto out;
	}
	...
free_partial:
	/* lastly zero out the first data page */
	if (!err)
		err = truncate_partial_data_page(inode, from, truncate_page);
}
When from is 0 (or any multiple of PAGE_SIZE), folio_off is also a multiple
of PAGE_SIZE, so round_up(folio_off, PAGE_SIZE) returns folio_off unchanged.
Doesn't this make blk_end == folio_off and cause folio_zero_segment() to zero
0 bytes instead of zeroing the target block, leaving stale data in the cached
folio?
>
>  	/* An encrypted inode should have a key and truncate the last page. */
>  	f2fs_bug_on(F2FS_I_SB(inode), cache_only && IS_ENCRYPTED(inode));
> -	if (!cache_only)
> +	if (!cache_only) {
> +		/*
> +		 * The folio was read back above, so the subpage is
> +		 * already uptodate and dirty data stays valid.
> +		 */
> +		f2fs_ffs_mark_subrange_dirty(folio, folio_off,
> +				blk_end - folio_off);
>  		folio_mark_dirty(folio);
> +	}
>  	f2fs_folio_put(folio, true);
>  	return 0;
>  }
[ ... ]
To: None    Cc: None    Status: Disabled (SMTP not configured)
Tokens used: In: 825k · Cached: 7310k · Out: 21k
View Review Map·View Raw Log
↑ Back to Summary
Patch 13: f2fs: handle block cloning within the same large folio
Result:
No regressions
Reviewed
▶ Inline Review
To: None    Cc: None    Status: Disabled (SMTP not configured)
Tokens used: In: 754k · Cached: 8486k · Out: 17k
View Review Map·View Raw Log
↑ Back to Summary
Patch 14: f2fs: allow large folio support to writeable files
Result:
Critical: 0 · High: 1 · Medium: 2 · Low: 0
Reviewed
▼ Inline Review
Copy
commit d11b563f16eebcbe4ad3b2699ccc519e8d766169
Author: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
f2fs: allow large folio support to writeable files
This patch removes write-path restrictions on large folio mappings in f2fs,
introduces f2fs_mapping_set_large_folio() for newly created and loaded
inodes, and adds an order-0 check in f2fs_convert_inline_inode().
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 2c9343eb6b5e9..53914629c604f 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -5348,6 +5348,23 @@ static inline bool f2fs_quota_file(struct f2fs_sb_info *sbi, nid_t ino)
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
> +	else
> +		mapping_set_folio_order_range(inode->i_mapping, 0, 0);
> +}
Should the non-immutable branch in f2fs_mapping_set_large_folio() also call
mapping_set_folio_min_order(inode->i_mapping, 0) rather than setting the
order range to (0, 0)?
In include/linux/pagemap.h, mapping_large_folio_support() requires the
maximum folio order to be greater than zero:
    static inline bool mapping_large_folio_support(const struct address_space *mapping)
    {
        ...
        return mapping_max_folio_order(mapping) > 0;
    }
Because F2FS_IMMUTABLE_FL is not in F2FS_FL_INHERITED, newly created files in
f2fs_new_inode() and normal writeable files loaded via f2fs_iget() always
take the !IS_IMMUTABLE(inode) branch. Calling
mapping_set_folio_order_range(inode->i_mapping, 0, 0) leaves the max order at
0 and keeps large folio support disabled for writeable files even at the end
of the series (after commit "f2fs: make compressed files compatible with
large folio").
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index f621d5e65023a..3d621a20766d0 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
[ ... ]
> @@ -720,9 +711,6 @@ static int f2fs_file_open(struct inode *inode, struct file *filp)
>  	if (!f2fs_is_compress_backend_ready(inode))
>  		return -EOPNOTSUPP;
>
> -	if (mapping_large_folio_support(inode->i_mapping) &&
> -	    filp->f_mode & FMODE_WRITE)
> -		return -EOPNOTSUPP;
>
>  	err = fsverity_file_open(inode, filp);
>  	if (err)
With f2fs_file_open() now permitting writable file descriptors on mappings
with large folio support (such as an inode loaded with F2FS_IMMUTABLE_FL set
and later made writeable via f2fs_fileattr_set()), what happens when
F2FS_IOC_DEFRAGMENT or swapon runs on a file containing large folios?
Both fs/f2fs/file.c:f2fs_defragment_range():
    folio = f2fs_get_lock_data_folio(inode, idx, true);
    if (IS_ERR(folio)) {
        err = PTR_ERR(folio);
        goto clear_out;
    }
    f2fs_folio_wait_writeback(folio, true, true);
    folio_mark_dirty(folio);
    folio_set_f2fs_gcing(folio);
and fs/f2fs/data.c:f2fs_migrate_blocks() (called from
f2fs_swap_activate()->check_swap_activate()):
    folio = f2fs_get_lock_data_folio(inode, blkidx, true);
    if (IS_ERR(folio)) {
        f2fs_up_write(&sbi->pin_sem);
        ret = PTR_ERR(folio);
        goto done;
    }
    folio_mark_dirty(folio);
    f2fs_folio_put(folio, true);
fetch the folio via f2fs_get_lock_data_folio(), which attaches struct
f2fs_folio_state (ffs) to large folios, and then call folio_mark_dirty(folio)
without calling f2fs_ffs_mark_subrange_dirty().
Because f2fs_folio_has_ffs(folio) is true,
f2fs_dirty_data_folio()->f2fs_update_dirty_folio() skips
f2fs_account_dirty_blocks() and leaves the per-subpage dirty bitmap in
ffs->state all zero. When filemap_fdatawrite() subsequently runs
f2fs_write_cache_folios(), ffs_find_dirty_range() finds no dirty subpages and
skips writing the blocks.
Doesn't this cause f2fs_defragment_range() to silently skip migrating blocks
in large folios, cause check_swap_activate() to loop on goto retry until free
sections are exhausted (-ENOSPC), and leave PG_dirty large folios with zero
dirty subpage bits and unincremented inode->dirty_pages if the loop exits on
error before filemap_fdatawrite()?
[ ... ]
> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> index 49905aa084186..0dca6c3d58fb3 100644
> --- a/fs/f2fs/inline.c
> +++ b/fs/f2fs/inline.c
> @@ -239,6 +239,12 @@ int f2fs_convert_inline_inode(struct inode *inode)
>  	if (IS_ERR(folio))
>  		return PTR_ERR(folio);
>
> +	/*
> +	 * Inline data is only supported in an order-0 index #0 folio; the
> +	 * inline write and mmap fault paths never request a larger order.
> +	 */
> +	f2fs_bug_on(sbi, folio_test_large(folio));
> +
>  	f2fs_lock_op(sbi, &lc);
>
>  	ientry = f2fs_get_inode_cache(sbi, inode->i_ino);
Can a race between f2fs_vm_page_mkwrite() and a concurrent write trigger this
f2fs_bug_on() and set SBI_NEED_FSCK on a valid filesystem?
In fs/f2fs/file.c:f2fs_vm_page_mkwrite(), f2fs_convert_inline_inode() is
called before acquiring filemap_invalidate_lock_shared() or the folio lock,
and without holding inode_lock:
    err = f2fs_convert_inline_inode(inode);
    if (err)
        goto out;
In fs/f2fs/inline.c:f2fs_convert_inline_inode(), the initial
f2fs_has_inline_data(inode) check is unlocked:
    if (!f2fs_has_inline_data(inode))
        return 0;
    ...
    folio = f2fs_grab_cache_folio(inode->i_mapping, 0, false);
    if (IS_ERR(folio))
        return PTR_ERR(folio);
    f2fs_bug_on(sbi, folio_test_large(folio));
    f2fs_lock_op(sbi, &lc);
    ...
    if (f2fs_has_inline_data(inode))
        err = f2fs_convert_inline_folio(&dn, folio);
If thread A enters f2fs_vm_page_mkwrite()->f2fs_convert_inline_inode() on an
inline file whose mapping supports large folios and passes the initial
!f2fs_has_inline_data(inode) check, thread B can concurrently convert the
inline inode (clearing FI_INLINE_DATA), truncate or evict index 0, and
perform a buffered write via f2fs_write_begin() that allocates a large folio
at index 0:
    fgp |= fgf_set_order(f2fs_has_inline_data(inode) ? PAGE_SIZE : len);
    folio = f2fs_filemap_get_folio(mapping, index, fgp,
                                  mapping_gfp_mask(mapping));
When thread A then calls f2fs_grab_cache_folio(inode->i_mapping, 0, false),
it gets the newly installed large folio at index 0 and hits
f2fs_bug_on(sbi, folio_test_large(folio)) before reaching the serialized
f2fs_has_inline_data(inode) check under f2fs_get_inode_cache(). Should the
folio_test_large(folio) check be moved inside the
if (f2fs_has_inline_data(inode)) block?
[ ... ]
To: None    Cc: None    Status: Disabled (SMTP not configured)
Tokens used: In: 1558k · Cached: 19139k · Out: 56k
View Review Map·View Raw Log
↑ Back to Summary
Patch 15: f2fs: make compressed files compatible with large folio
Result:
No regressions
Reviewed
▶ Inline Review
To: None    Cc: None    Status: Disabled (SMTP not configured)
Tokens used: In: 964k · Cached: 10088k · Out: 22k
View Review Map·View Raw Log
↑ Back to Summary
