Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA39B4A92E3
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789552416; cv=none; b=HNaAfV0iv2FyclXQpqgD8+cvExLlIPTI55Wx+XnsjEM35zqJANhBzArv4v4sRZsKdmmK0Syvjlog5N/AnzuH9IyV1c30EUUmsnHansPe6y+QyaPPQg0RldoKwjHlMvtidnqEcyevOyOP6Oi5TrNjqJ8A2yWEO4hDPQjw6IZpsU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789552416; c=relaxed/simple;
	bh=KamppkLXO5AaRNdLgOR0WJSpOAx5JIzVjpNyoHCIECw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SkkuYhWe1cF5dJj2ZG5/5nmr5bvAYkYv+9k9cxAE9zBzb0AyDIzTrv9DZZ4EqILwBWXPCy4088wqMwz1gOdFkXACCiv4BSZc4qmXbo8x4F93dHYnUGZ7HgaAgAtkqsODKvTZoYklDECYr/FiKTHYjXEpDHxNT+RfB53xl7XDQxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DnrOtzrm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DnrOtzrm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 322041F000FF;
	Wed, 16 Sep 2026 09:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789552402;
	bh=oVtHS12aSYjr1jgyMmWQV/aQxb3KwkW02FDlSAlu2eA=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=DnrOtzrm/56/KACWOoSorzDB/MgTeIGjAotWVnWzuKP0xbRDhV7WN1GPcl+zsoqMo
	 rVoTK67RsdxadaS2FCI44D6C91+ayvX0oSdbQ1zVVtw2ex1wO1yFQuBS+j88vR2HqC
	 3hh3leYn5v7b4aX9vWOHbDH0DumpV/LflDPVvDkbmAbfy3o8B2GujCIbRyn2X0Lu2j
	 k+Tf/5VikoiwdsrGRvngW/npj3EOnPoDm6V1PjzJ7PaSyOn4k5IAIeMCoPhubnE5B5
	 IwWRMIZ9TRFAY2pkQ19h3yZ1GEzzAlTdbwFjT2LcDFSQ/kzQsznYQ4CcjH9vqOpby+
	 FOlvBBeRg01rQ==
Message-ID: <27535bb7-35b1-49a1-bdd6-a6f750366f55@kernel.org>
Date: Wed, 16 Sep 2026 17:53:18 +0800
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
Subject: Re: [PATCH v2 01/14] f2fs: extend folio state for large folio write
 path
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260915041909.2903887-1-zhaonanzhe@xiaomi.com>
 <20260915041909.2903887-2-zhaonanzhe@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260915041909.2903887-2-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/15/26 12:18, Nanzhe Zhao wrote:
> Large folio write path needs a subpage status bitmap and write
> pages pending counter, while keeping compatible with f2fs private
> flags.
> 
> Move struct f2fs_folio_state to f2fs.h, add private_flags and
> subpage state bitmap, and change PAGE_PRIVATE functions to be
> compatible with f2fs_folio_state. Allocate f2fs_folio_state via kzalloc
> instead of kmem_cache, since the state size depends on the folio order.
> 
> Note: Now if a path wants to use f2fs_folio_state, it must call
> `folio_has_ffs` instead of `folio_test_large`` to make check.
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> ---
>  fs/f2fs/data.c | 72 ++++++++++++++++++++++++++++++++------------------
>  fs/f2fs/f2fs.h | 70 +++++++++++++++++++++++++++++++++++-------------
>  2 files changed, 98 insertions(+), 44 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index a3b02c067e89..b3303109a696 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -32,15 +32,9 @@
>  
>  static struct kmem_cache *bio_post_read_ctx_cache;
>  static struct kmem_cache *bio_entry_slab;
> -static struct kmem_cache *ffs_entry_slab;
>  static mempool_t *bio_post_read_ctx_pool;
>  static struct bio_set f2fs_bioset;
>  
> -struct f2fs_folio_state {
> -	spinlock_t		state_lock;
> -	unsigned int		read_pages_pending;
> -};
> -
>  struct f2fs_bio {
>  	struct work_struct work;
>  	struct bio bio;
> @@ -125,6 +119,9 @@ struct bio_post_read_ctx {
>  	block_t fs_blkaddr;
>  };
>  
> +static bool __ffs_mark_subrange_uptodate(struct folio *folio,
> +		struct f2fs_folio_state *ffs, size_t offset, size_t len);
> +
>  /*
>   * Update and unlock a bio's pages, and free the bio.
>   *
> @@ -139,6 +136,23 @@ struct bio_post_read_ctx {
>   * called (i.e., I/O error or decryption error, but *not* verity error), and
>   * release the bio's reference to the decompress_io_ctx of the page's cluster.
>   */
> +/*
> + * Update read_pages_pending.
> + */
> +static inline void f2fs_update_read_folio_pending(struct folio *folio, int nr)
> +{
> +	struct f2fs_folio_state *ffs;
> +	unsigned long flags;
> +
> +	if (!f2fs_folio_has_ffs(folio))
> +		return;
> +
> +	ffs = (struct f2fs_folio_state *)folio->private;
> +	spin_lock_irqsave(&ffs->state_lock, flags);
> +	ffs->read_pages_pending += nr;
> +	spin_unlock_irqrestore(&ffs->state_lock, flags);
> +}
> +
>  static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
>  {
>  	struct folio_iter fi;
> @@ -147,7 +161,7 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
>  
>  	bio_for_each_folio_all(fi, bio) {
>  		struct folio *folio = fi.folio;
> -		unsigned nr_pages = fi.length >> PAGE_SHIFT;
> +		unsigned int nr_pages = fi.length >> PAGE_SHIFT;

No needed? it's trivial though.

>  		bool finished = true;
>  
>  		if (!folio_test_large(folio) &&
> @@ -2487,17 +2501,31 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>  }
>  #endif
>  
> -static struct f2fs_folio_state *ffs_find_or_alloc(struct folio *folio)
> +struct f2fs_folio_state *f2fs_ffs_find_or_alloc(struct folio *folio)
>  {
> -	struct f2fs_folio_state *ffs = folio->private;
> +	struct f2fs_folio_state *ffs;
> +	unsigned int nr_subpages = folio_nr_pages(folio);
> +	unsigned long private = (unsigned long)folio->private;
> +
> +	f2fs_bug_on(F2FS_F_SB(folio), !folio_test_large(folio));
> +	f2fs_bug_on(F2FS_F_SB(folio),
> +		    test_bit(PAGE_PRIVATE_NOT_POINTER, &private));
>  
> -	if (ffs)
> -		return ffs;
> +	if (f2fs_folio_has_ffs(folio))
> +		return (struct f2fs_folio_state *)folio->private;
>  
> -	ffs = f2fs_kmem_cache_alloc(ffs_entry_slab,
> -			GFP_NOIO | __GFP_ZERO, true, NULL);
> +	ffs = f2fs_kmalloc(F2FS_F_SB(folio),
> +			struct_size(ffs, state, BITS_TO_LONGS(2 * nr_subpages)),
> +			GFP_NOFS | __GFP_ZERO);
> +	if (!ffs)
> +		return NULL;
>  
>  	spin_lock_init(&ffs->state_lock);
> +	if (folio_test_uptodate(folio))
> +		bitmap_set(ffs->state, 0, nr_subpages);
> +	if (folio_test_dirty(folio))
> +		bitmap_set(ffs->state, nr_subpages, nr_subpages);
> +
>  	folio_attach_private(folio, ffs);
>  	return ffs;
>  }
> @@ -2506,7 +2534,7 @@ static void ffs_detach_free(struct folio *folio)
>  {
>  	struct f2fs_folio_state *ffs;
>  
> -	if (!folio_test_large(folio)) {
> +	if (!f2fs_folio_has_ffs(folio)) {
>  		folio_detach_private(folio);
>  		return;
>  	}
> @@ -2516,7 +2544,8 @@ static void ffs_detach_free(struct folio *folio)
>  		return;
>  
>  	WARN_ON_ONCE(ffs->read_pages_pending != 0);
> -	kmem_cache_free(ffs_entry_slab, ffs);
> +	WARN_ON_ONCE(atomic_read(&ffs->write_pages_pending));
> +	kfree(ffs);
>  }
>  
>  static int f2fs_read_data_large_folio(struct inode *inode,
> @@ -2529,7 +2558,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>  	pgoff_t index, offset, next_pgofs = 0;
>  	unsigned max_nr_pages = rac ? readahead_count(rac) :
>  				folio_nr_pages(folio);
> -	unsigned nrpages;
> +	unsigned int nrpages;

No needed? it's trivial though.

>  	struct f2fs_folio_state *ffs;
>  	int ret = 0;
>  	bool folio_in_bio = false;
> @@ -2605,7 +2634,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>  		 * to prevent from premature folio_end_read() call on folio
>  		 */
>  		if (folio_test_large(folio)) {
> -			ffs = ffs_find_or_alloc(folio);
> +			ffs = f2fs_ffs_find_or_alloc(folio);

Do we need to handle no memory case?

Thanks,

>  
>  			/* set the bitmap to wait */
>  			spin_lock_irq(&ffs->state_lock);
> @@ -4522,21 +4551,12 @@ int __init f2fs_init_bio_entry_cache(void)
>  	if (!bio_entry_slab)
>  		return -ENOMEM;
>  
> -	ffs_entry_slab = f2fs_kmem_cache_create("f2fs_ffs_slab",
> -			sizeof(struct f2fs_folio_state));
> -
> -	if (!ffs_entry_slab) {
> -		kmem_cache_destroy(bio_entry_slab);
> -		return -ENOMEM;
> -	}
> -
>  	return 0;
>  }
>  
>  void f2fs_destroy_bio_entry_cache(void)
>  {
>  	kmem_cache_destroy(bio_entry_slab);
> -	kmem_cache_destroy(ffs_entry_slab);
>  }
>  
>  static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index ebc621f302e1..9a2366a6c113 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1618,6 +1618,18 @@ static inline void f2fs_clear_bit(unsigned int nr, char *addr);
>   * Layout B: lowest bit should be 0
>   * page.private is a wrapped pointer.
>   */
> +
> +struct f2fs_folio_state {
> +	spinlock_t		state_lock;
> +	unsigned int		read_pages_pending;
> +	atomic_t		write_pages_pending;
> +	unsigned long		private_flags;
> +	/* state[0..nr_subpages - 1] tracks uptodate subpages.
> +	 * state[nr_subpages..2 * nr_subpages - 1] tracks dirty subpages.
> +	 */
> +	unsigned long		state[];
> +};
> +
>  enum {
>  	PAGE_PRIVATE_NOT_POINTER,		/* private contains non-pointer data */
>  	PAGE_PRIVATE_ONGOING_MIGRATION,		/* data page which is on-going migrating */
> @@ -1627,6 +1639,13 @@ enum {
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
> @@ -2738,13 +2757,35 @@ static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
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
> @@ -2756,14 +2797,10 @@ static inline bool page_private_##name(struct page *page) \
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
> @@ -2776,13 +2813,10 @@ static inline void set_page_private_##name(struct page *page) \
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
> @@ -2808,7 +2842,7 @@ PAGE_PRIVATE_CLEAR_FUNC(atomic, ATOMIC_WRITE);
>  
>  static inline unsigned long folio_get_f2fs_data(struct folio *folio)
>  {
> -	unsigned long data = (unsigned long)folio->private;
> +	unsigned long data = f2fs_folio_get_private_flags(folio);
>  
>  	if (!test_bit(PAGE_PRIVATE_NOT_POINTER, &data))
>  		return 0;

