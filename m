Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287076;
	b=LKRvJxXQG2zXYdONrN8WrHjDY1noXy4+hQpXtaAS4RWZ/t3ssImPlYMDxstdrhwytch3
	 p77esThYohQ0deDSnAmA34AuEwrvIYj38xWanhLmDbtsBelfREhoKT0pI9p/6+F2oNSpt
	 54XrupDfXpYbwCoXO0qPhnFQuUgLDF5vYfQF+5eUkPQCF3dG9Eqsp+NjqHW0ocYKdHWT+
	 Fv14UfKPfBrPFAO1gVyRj80mINAKSCSeu+CMzmcnlARXlEVFNq/O9gBmZyXpsWyKOcnlB
	 B5BwnylfzUujK71hkhl7lJmskOUnVFasPCYDUgeWcrCSlzyUTaTD1YyUR6XVcZXVVKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287076;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Ge93C1RewWf+EmgQPjq99nIgRg5xPU6pKnukx22zcKc=;
	b=cTpEeHOpiKiNnrFOIDIH6mkbvJA1G15AIjDZ2e6UsRoDTAyPc3KBalkzFYpfrT/6D2jO
	 9HW+MKvHoCzDZRLys8I6hR/Tx8wxG4/3qz23tVQv2IhXMx8WCu+oh+s3rAH6HrWXxliq3
	 m7Ph0xwg1eT8P+E4Owah/lGnF3tCO2W7ew4ZFsSTOe6aGjZOb5pn43r7Unobyr8xf630n
	 jBXFAQqYKyYYAPhKKIH1sEucH9vmOr5jQYLhDjmpYAqSeEUUouZe4VHayfAsOfg1Dnnh/
	 OxMK9XMxJKiWbeV69M6GAgoE59ZK9/p3cvmB7fdGWMwKF72ToMpoSZV500Gq8k2/nNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MuoJ1K9f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E22606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MuoJ1K9f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC7A31F01825;
	Thu, 29 Oct 2026 15:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793287075;
	bh=Ge93C1RewWf+EmgQPjq99nIgRg5xPU6pKnukx22zcKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MuoJ1K9f8LXP1eAxsLkwtMSGbYRUXNgpQqPqnYTKEJCsIWYVARl+4YvAcYiGfX0ND
	 T2ulwsD10UnQaj3xsocr5Qw5QbCpBU97BvAreu7rrwdNl1f5M+v6akalZvwEyfgCDs
	 qOpF+uHRk63eIi4bPcBzn+zqEGWqQKRq/ySh6/5RtRSXUluYFbdjwgANmnPengykA2
	 34wmrvQ8bCU/p27bhINFpSk/cz2dvXcBVGJxOjSZJLbzCgAwLC/IqAIACw7XvBlxGx
	 aQDszx2Az76Qnq8LKDHq+kIAmyckLwCGXwMAAddbczkCJsvtDsWPzRnWBrkk9snH8g
	 U+tqLhukqAEqg==
Date: Thu, 29 Oct 2026 15:17:53 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: Nanzhe Zhao <nzzhao.sigma@gmail.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org,
	Dev Jain <Dev.Jain@arm.com>,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>, Nanzhe Zhao <nzzhao@126.com>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [f2fs-dev] [PATCH v8 15/15] f2fs: make compressed files
 compatible with large folio
Message-ID: <auNjoREIU-cHswyw@google.com>
References: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
 <20261028154407.1601430-16-nzzhao.sigma@gmail.com>
 <54cbfb8a-c87e-4fea-9448-175706e22ac2@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54cbfb8a-c87e-4fea-9448-175706e22ac2@kernel.org>

Ok, I applied all including the below change in dev-test. Please take a look.

On 10/29, Chao Yu via Linux-f2fs-devel wrote:
> On 10/28/26 23:44, Nanzhe Zhao wrote:
> > From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> > 
> > The compression flag is the hint indicates that the inode can be
> > compressed, when the inode is using large folio, we expected it keeps
> > using the large folio read/write paths and its data stays uncompressed
> > on disk until the inode is evicted and re-read
> > 
> > Let f2fs_write_begin() skip the compression overwrite preparation for
> > such inodes and remove the compressed-file gate in
> > f2fs_read_data_large_folio() so the data is simply read/written as
> > regular blocks.
> > 
> > For the same reason, reject F2FS_IOC_COMPRESS_FILE with -EOPNOTSUPP
> > once the inode mapping is switched to large folios.
> > 
> > Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> > ---
> >  Documentation/filesystems/f2fs.rst | 10 ++++++++
> >  fs/f2fs/compress.c                 |  2 ++
> >  fs/f2fs/data.c                     |  9 ++-----
> >  fs/f2fs/file.c                     | 38 ++++++++++++++++++++++++++++++
> >  4 files changed, 52 insertions(+), 7 deletions(-)
> > 
> > diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> > index 55798421f2c4..b79bb67ee78e 100644
> > --- a/Documentation/filesystems/f2fs.rst
> > +++ b/Documentation/filesystems/f2fs.rst
> > @@ -942,6 +942,16 @@ Compression implementation
> >    reserved via ioctl(F2FS_IOC_RESERVE_COMPRESS_BLOCKS) or the file size is
> >    truncated to zero.
> >  
> > +- Compression and large folios are not effective at the same time on a file:
> > +  a compressed inode does not use large folios, while an inode which is
> > +  using large folios keeps its data uncompressed on disk.  If the compression
> > +  flag is set on an inode that is already using large folios, the flag works
> > +  as a hint until the inode is evicted: the inode keeps using the large folio
> > +  read/write paths, f2fs_write_begin() skips the compression overwrite
> > +  preparation, and ioctl(F2FS_IOC_COMPRESS_FILE) fails with -EOPNOTSUPP.
> > +  Once the inode is evicted and read back, it uses order-0 folios again and
> > +  compression is applied as usual.
> > +
> >  Compress metadata layout::
> >  
> >  				[Dnode Structure]
> > diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> > index 162bd8ef822a..721b01dd0d24 100644
> > --- a/fs/f2fs/compress.c
> > +++ b/fs/f2fs/compress.c
> > @@ -78,6 +78,8 @@ bool f2fs_is_compressed_page(struct folio *folio)
> >  		return false;
> >  	if (folio_test_f2fs_nonpointer(folio))
> >  		return false;
> > +	if (f2fs_folio_has_ffs(folio))
> > +		return false;
> >  
> >  	f2fs_bug_on(F2FS_F_SB(folio),
> >  		*((u32 *)folio->private) != F2FS_COMPRESSED_PAGE_MAGIC);
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index cc3c9e51db9c..ab8f5b44d63a 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -3288,12 +3288,6 @@ static int f2fs_read_data_large_folio(struct inode *inode,
> >  	int ret = 0;
> >  	bool folio_in_bio = false;
> >  
> > -	if (f2fs_compressed_file(inode)) {
> > -		if (folio)
> > -			folio_unlock(folio);
> > -		return -EOPNOTSUPP;
> > -	}
> > -
> >  	map.m_seg_type = NO_CHECK_TYPE;
> >  
> >  	if (rac)
> > @@ -5331,7 +5325,8 @@ static int f2fs_write_begin(const struct kiocb *iocb,
> >  	}
> >  
> >  #ifdef CONFIG_F2FS_FS_COMPRESSION
> > -	if (f2fs_compressed_file(inode)) {
> > +	if (f2fs_compressed_file(inode) &&
> > +	    !mapping_large_folio_support(inode->i_mapping)) {
> >  		int ret;
> >  		struct page *page;
> >  
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index 15bea642e986..cb7a9d4227f4 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -4907,6 +4907,7 @@ static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
> >  	struct address_space *mapping = inode->i_mapping;
> >  	struct folio *folio;
> >  	pgoff_t redirty_idx = page_idx;
> > +	pgoff_t end_idx = page_idx + len;
> >  	int page_len = 0, ret = 0;
> >  
> >  	filemap_invalidate_lock_shared(mapping);
> > @@ -4924,6 +4925,9 @@ static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
> >  	} while (page_len < len);
> >  
> >  	while (redirty_idx < page_idx) {
> > +		pgoff_t next_idx;
> > +		size_t off, dlen;
> > +
> >  		folio = filemap_lock_folio(mapping, redirty_idx);
> >  
> >  		/* It will never fail, when folio has pinned above */
> > @@ -4931,6 +4935,33 @@ static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
> >  
> >  		f2fs_folio_wait_writeback(folio, true, true);
> >  
> > +		/*
> > +		 * Only this cluster is rewritten, while a large folio can
> > +		 * cover more than one cluster, so mark the intersection of
> > +		 * the folio and [redirty_idx, end_idx).
> > +		 */
> > +		next_idx = min_t(pgoff_t, folio_next_index(folio), end_idx);
> > +		off = offset_in_folio(folio, (loff_t)redirty_idx << PAGE_SHIFT);
> > +		dlen = (size_t)(next_idx - redirty_idx) << PAGE_SHIFT;
> > +
> > +		if (folio_test_large(folio)) {
> > +			/*
> > +			 * A compressed inode can keep using large folios, in
> > +			 * which case the compression flag only works as a hint
> > +			 * until the inode is evicted.  Update the subpage dirty
> > +			 * bitmap as well, otherwise f2fs_write_cache_folios()
> > +			 * finds no dirty range and skips the whole folio.
> > +			 */
> > +			if (!f2fs_ffs_find_or_alloc(folio)) {
> > +				ret = -ENOMEM;
> > +				folio_unlock(folio);
> > +				folio_put_refs(folio, 2);
> > +				redirty_idx = folio_next_index(folio);
> 
> Jaegeuk, Nanzhe,
> 
> I missed this potential UAF, please fix this.
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 162b7f7aa6d4..3de67522beef 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4941,16 +4941,14 @@ static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
>                          */
>                         if (!f2fs_ffs_find_or_alloc(folio)) {
>                                 ret = -ENOMEM;
> -                               folio_unlock(folio);
> -                               folio_put_refs(folio, 2);
> -                               redirty_idx = folio_next_index(folio);
> -                               continue;
> +                               goto next;
>                         }
>                         f2fs_ffs_mark_subrange_dirty(folio, off, dlen);
>                 }
> 
>                 folio_mark_dirty(folio);
>                 folio_set_f2fs_gcing(folio);
> +next:
>                 redirty_idx = folio_next_index(folio);
>                 folio_unlock(folio);
>                 folio_put_refs(folio, 2);
> 
> Thanks,
> 
> > +				continue;
> > +			}
> > +			f2fs_ffs_mark_subrange_dirty(folio, off, dlen);
> > +		}
> > +
> >  		folio_mark_dirty(folio);
> >  		folio_set_f2fs_gcing(folio);
> >  		redirty_idx = folio_next_index(folio);
> > @@ -5037,6 +5068,13 @@ static int f2fs_ioc_compress_file(struct file *filp)
> >  	if (!(filp->f_mode & FMODE_WRITE))
> >  		return -EBADF;
> >  
> > +	/*
> > +	 * The mapping is already using large folios, where the data is kept
> > +	 * uncompressed, so refuse to start compressing the file.
> > +	 */
> > +	if (mapping_large_folio_support(inode->i_mapping))
> > +		return -EOPNOTSUPP;
> > +
> >  	f2fs_balance_fs(sbi, true);
> >  
> >  	ret = mnt_want_write_file(filp);
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
