Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B281211A09
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031865; cv=none; b=BOw3Hh1OQLEJTD+uytvSFCpx0zW40lzq5Goi2wR/nmgCWpZ4A2nztWucXX4JkCEboZ3VgRUKQtuz/d7TNaD9lTNQNUIAjSlz31PFIOzzOCq4MD3buoP6c0CxTJFHMOJuivyXuUopwPS1G9xu8ddDMiYlzR98KZCYWOZAIaIskr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031865; c=relaxed/simple;
	bh=8SF6g/8C5xsWL9rO1JXLH8IoYxYDKHFbU49M0DHHuIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NxD5d+9LmF6Do4ymJ03XzG2nKRvltBcVy08k8OeBD8q3U+GBGvrde4J8LDMIqbS0N8W4i8OCWJvOGF5ml7w3SagY1G2eFOI1exlNeSxatJkqgSCAjSEKQb4fB5Se98HU8fwrC35vETCLgW0c0SXyCKZgsFDVEN9gpxRuTY9/vOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdOTYlF3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdOTYlF3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C38A31F000C4;
	Thu, 15 Oct 2026 02:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792031864;
	bh=Sr0u6wVPt1hjNUcUWLk504EZuBlXvMBHDZSeAxC33qE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MdOTYlF3Kd34N9xur0Y0XSPY5stHG1Okt7AFE8iRE3uLi5lYvwZDnYKBnW+aLs385
	 6WSK6+yFjevEkA7wpdLR1jZtIY+3X4anq+/9i48MvkAaFy0MTvdRRXQDMOxKXNZRdw
	 /xFflZOQauAXksAiXgHZgx7Sewv5y05jpjuIGTBq0LwN0KIwVzqdaPgph2EVXGEtxn
	 l/MN+uwA3U7cKYsu5o/VrIBzgBSAvOED/3JTILBE3mGzmXWW+LJQmkhbPYmJAgv3BT
	 /dxml3IZPHogavL52N1xE1USW2LQTTKhkA3PFInRMuGQUho4obp9feaqBPDRElMxeQ
	 H0XQJn+Jyc4SA==
Date: Thu, 15 Oct 2026 02:37:42 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, Chao Yu <chao@kernel.org>,
	Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>,
	Pengfei Li <lipengfei28@xiaomi.com>, Dev Jain <Dev.Jain@arm.com>,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	linux-kernel@vger.kernel.org, Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>, Nanzhe Zhao <nzzhao@126.com>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [f2fs-dev] [PATCH v5 02/16] f2fs: carry subpage offset and count
 in write IO
Message-ID: <atA8dsZ35E6wTMD6@google.com>
References: <20261014064445.2835813-1-zhaonanzhe@xiaomi.com>
 <20261014064445.2835813-3-zhaonanzhe@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014064445.2835813-3-zhaonanzhe@xiaomi.com>

On 10/14, Nanzhe Zhao wrote:
> Large folio write paths need to submit I/O for a range inside a
> folio instead of always submitting the whole folio from offset zero.
> Add folio_offset and folio_blkcnt to f2fs_io_info to describe the
> block offset inside the folio and the number of contiguous blocks
> covered by the I/O.
> 
> Apply the new fields to the bio submit paths that need the subpage
> offset or contiguous block count.
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> ---
>  fs/f2fs/checkpoint.c |  2 ++
>  fs/f2fs/compress.c   |  1 +
>  fs/f2fs/data.c       | 65 ++++++++++++++++++++++++++++++--------------
>  fs/f2fs/f2fs.h       | 11 ++++++++
>  fs/f2fs/gc.c         |  2 ++
>  fs/f2fs/inline.c     |  1 +
>  fs/f2fs/segment.c    |  3 +-
>  7 files changed, 64 insertions(+), 21 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 5c5b45d3c67b..3ad709f69893 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -264,6 +264,7 @@ static struct f2fs_cached_block *__get_meta_cache(struct f2fs_sb_info *sbi,
>  		.op_flags = REQ_META | REQ_PRIO,
>  		.old_blkaddr = index,
>  		.new_blkaddr = index,
> +		.folio_blkcnt = 1,
>  		.encrypted_page = NULL,
>  		.is_por = !is_meta ? 1 : 0,
>  		.is_cache = 1,
> @@ -462,6 +463,7 @@ int f2fs_ra_meta_caches(struct f2fs_sb_info *sbi, block_t start,
>  		.type = META,
>  		.op = REQ_OP_READ,
>  		.op_flags = sync ? (REQ_META | REQ_PRIO) : REQ_RAHEAD,
> +		.folio_blkcnt = 1,
>  		.encrypted_page = NULL,
>  		.in_list = 0,
>  		.is_por = (type == META_POR) ? 1 : 0,
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 747141c79900..c0e39f580993 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1282,6 +1282,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
>  		.op_flags = wbc_to_write_flags(wbc),
>  		.old_blkaddr = NEW_ADDR,
>  		.page = NULL,
> +		.folio_blkcnt = 1,
>  		.encrypted_page = NULL,
>  		.compressed_page = NULL,
>  		.io_type = io_type,
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 95212e60f09d..429fe8998ca3 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -849,6 +849,9 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
>  	struct folio *fio_folio = fio->folio;
>  	struct folio *data_folio = fio->encrypted_page ?
>  			page_folio(fio->encrypted_page) : fio_folio;
> +	pgoff_t fio_lblk = F2FS_FIO_LBLK(fio);
> +	size_t bio_offset = F2FS_FIO_BIO_OFFSET(fio);
> +	size_t bio_len = F2FS_FIO_BIO_SIZE(fio);
>  
>  	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
>  			fio->is_por ? META_POR : (__is_meta_io(fio) ?
> @@ -861,11 +864,11 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
>  	bio = __bio_alloc(fio, 1);
>  
>  	f2fs_set_bio_crypt_ctx(bio, fio_folio->mapping->host,
> -			fio_folio->index, fio, GFP_NOIO);
> -	bio_add_folio_nofail(bio, data_folio, folio_size(data_folio), 0);
> +			fio_lblk, fio, GFP_NOIO);
> +	bio_add_folio_nofail(bio, data_folio, bio_len, bio_offset);

	bio_len is coming from fio->folio. But, we need to get from data_folio?

>  
>  	if (fio->io_wbc && !is_read_io(fio->op))
> -		wbc_account_cgroup_owner(fio->io_wbc, fio_folio, PAGE_SIZE);
> +		wbc_account_cgroup_owner(fio->io_wbc, fio_folio, bio_len);
>  
>  	inc_cache_count(fio->sbi, is_read_io(fio->op) ?
>  			F2FS_RD_DATA : WB_DATA_TYPE(fio->folio, false));
> @@ -924,7 +927,8 @@ static bool io_is_mergeable(struct f2fs_sb_info *sbi, struct bio *bio,
>  }
>  
>  static void add_bio_entry(struct f2fs_sb_info *sbi, struct bio *bio,
> -				struct folio *folio, enum temp_type temp)
> +				struct folio *folio, size_t len, size_t offset,
> +				enum temp_type temp)
>  {
>  	struct f2fs_bio_info *io = sbi->write_io[DATA] + temp;
>  	struct bio_entry *be;
> @@ -933,7 +937,7 @@ static void add_bio_entry(struct f2fs_sb_info *sbi, struct bio *bio,
>  	be->bio = bio;
>  	bio_get(bio);
>  
> -	bio_add_folio_nofail(bio, folio, folio_size(folio), 0);
> +	bio_add_folio_nofail(bio, folio, len, offset);
>  
>  	f2fs_down_write(&io->bio_list_lock);
>  	list_add_tail(&be->list, &io->bio_list);
> @@ -950,6 +954,9 @@ static int add_ipu_page(struct f2fs_io_info *fio, struct bio **bio,
>  							struct folio *folio)
>  {
>  	struct folio *fio_folio = fio->folio;
> +	pgoff_t fio_lblk = F2FS_FIO_LBLK(fio);
> +	size_t bio_offset = F2FS_FIO_BIO_OFFSET(fio);
> +	size_t bio_len = F2FS_FIO_BIO_SIZE(fio);
>  	struct f2fs_sb_info *sbi = fio->sbi;
>  	enum temp_type temp;
>  	bool found = false;
> @@ -972,8 +979,8 @@ static int add_ipu_page(struct f2fs_io_info *fio, struct bio **bio,
>  							    fio->new_blkaddr));
>  			if (f2fs_crypt_mergeable_bio(*bio,
>  					fio_folio->mapping->host,
> -					fio_folio->index, fio) &&
> -			    bio_add_folio(*bio, folio, folio_size(folio), 0)) {
> +					fio_lblk, fio) &&
> +			    bio_add_folio(*bio, folio, bio_len, bio_offset)) {
>  				ret = 0;
>  				break;
>  			}
> @@ -1087,6 +1094,10 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
>  	struct folio *data_folio = fio->encrypted_page ?
>  			page_folio(fio->encrypted_page) : fio->folio;
>  	struct folio *folio = fio->folio;
> +	pgoff_t fio_lblk = F2FS_FIO_LBLK(fio);
> +	unsigned int fio_cnt = F2FS_FIO_BLKCNT(fio);
> +	size_t bio_offset = F2FS_FIO_BIO_OFFSET(fio);
> +	size_t bio_len = F2FS_FIO_BIO_SIZE(fio);
>  
>  	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
>  			__is_meta_io(fio) ? META_GENERIC : DATA_GENERIC))
> @@ -1101,20 +1112,21 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
>  	if (!bio) {
>  		bio = __bio_alloc(fio, BIO_MAX_VECS);
>  		f2fs_set_bio_crypt_ctx(bio, folio->mapping->host,
> -				folio->index, fio, GFP_NOIO);
> +				fio_lblk, fio, GFP_NOIO);
>  
> -		add_bio_entry(fio->sbi, bio, data_folio, fio->temp);
> +		add_bio_entry(fio->sbi, bio, data_folio, bio_len,
> +			     bio_offset, fio->temp);

This needs to be from data_folio?

>  	} else {
>  		if (add_ipu_page(fio, &bio, data_folio))
>  			goto alloc_new;
>  	}
>  
>  	if (fio->io_wbc)
> -		wbc_account_cgroup_owner(fio->io_wbc, folio, folio_size(folio));
> +		wbc_account_cgroup_owner(fio->io_wbc, folio, bio_len);
>  
>  	inc_cache_count(fio->sbi, WB_DATA_TYPE(folio, false));
>  
> -	*fio->last_block = fio->new_blkaddr;
> +	*fio->last_block = fio->new_blkaddr + fio_cnt - 1;
>  	*fio->bio = bio;
>  
>  	return 0;
> @@ -1177,6 +1189,10 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
>  	struct folio *bio_folio;
>  	struct f2fs_lock_context lc;
>  	enum count_type type;
> +	pgoff_t fio_lblk;
> +	unsigned int fio_cnt;
> +	size_t bio_offset;
> +	size_t bio_len;
>  
>  	f2fs_bug_on(sbi, is_read_io(fio->op));
>  
> @@ -1209,24 +1225,31 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
>  	/* set submitted = true as a return value */
>  	fio->submitted = 1;
>  
> +	fio_lblk = F2FS_FIO_LBLK(fio);
> +	fio_cnt = F2FS_FIO_BLKCNT(fio);
> +
>  	type = WB_DATA_TYPE(bio_folio, fio->compressed_page);
> -	inc_cache_count(sbi, type);
> +	for (unsigned int i = 0; i < fio_cnt; i++)
> +		inc_cache_count(sbi, type);
>  
>  	if (io->bio &&
>  	    (!io_is_mergeable(sbi, io->bio, io, fio, io->last_block_in_bio,
>  			      fio->new_blkaddr) ||
>  	     !f2fs_crypt_mergeable_bio(io->bio, fio_inode(fio),
> -				bio_folio->index, fio)))
> +				fio_lblk, fio)))

From bio_folio?

>  		__submit_merged_bio(io);
>  alloc_new:
>  	if (io->bio == NULL) {
>  		io->bio = __bio_alloc(fio, BIO_MAX_VECS);
>  		f2fs_set_bio_crypt_ctx(io->bio, fio_inode(fio),
> -				bio_folio->index, fio, GFP_NOIO);
> +				fio_lblk, fio, GFP_NOIO);

From bio_folio?

>  		io->fio = *fio;
>  	}
>  
> -	if (!bio_add_folio(io->bio, bio_folio, folio_size(bio_folio), 0)) {
> +	bio_offset = F2FS_FIO_BIO_OFFSET(fio);
> +	bio_len = F2FS_FIO_BIO_SIZE(fio);
> +
> +	if (!bio_add_folio(io->bio, bio_folio, bio_len, bio_offset)) {

bio_len/bio_offset need to be from bio_folio?

>  		__submit_merged_bio(io);
>  		goto alloc_new;
>  	}
> @@ -1234,10 +1257,9 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
>  	F2FS_BIO(io->bio)->entry_cnt++;
>  
>  	if (fio->io_wbc)
> -		wbc_account_cgroup_owner(fio->io_wbc, fio->folio,
> -				folio_size(fio->folio));
> +		wbc_account_cgroup_owner(fio->io_wbc, fio->folio, bio_len);
>  
> -	io->last_block_in_bio = fio->new_blkaddr;
> +	io->last_block_in_bio = fio->new_blkaddr + fio_cnt - 1;
>  
>  	trace_f2fs_submit_folio_write(fio->folio, fio);
>  #ifdef CONFIG_BLK_DEV_ZONED
> @@ -3213,7 +3235,8 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>  		set_new_dnode(&dn, inode, NULL, NULL, 0);
>  
>  	if (need_inplace_update(fio) &&
> -	    f2fs_lookup_read_extent_cache_block(inode, folio->index,
> +	    f2fs_lookup_read_extent_cache_block(inode,
> +						F2FS_FIO_LBLK(fio),
>  						&fio->old_blkaddr)) {
>  		if (!f2fs_is_valid_blkaddr(fio->sbi, fio->old_blkaddr,
>  						DATA_GENERIC_ENHANCE))
> @@ -3232,7 +3255,8 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>  	if (fio->need_lock == LOCK_REQ && !f2fs_trylock_op(fio->sbi, &lc))
>  		return -EAGAIN;
>  
> -	err = f2fs_get_dnode_of_data(&dn, folio->index, LOOKUP_NODE);
> +	err = f2fs_get_dnode_of_data(&dn, F2FS_FIO_LBLK(fio),
> +				     LOOKUP_NODE);
>  	if (err)
>  		goto out;
>  
> @@ -3335,6 +3359,7 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
>  		.op_flags = wbc_to_write_flags(wbc),
>  		.old_blkaddr = NULL_ADDR,
>  		.folio = folio,
> +		.folio_blkcnt = 1,
>  		.encrypted_page = NULL,
>  		.submitted = 0,
>  		.compr_blocks = compr_blocks,
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 2fb8ebfa1303..963cd2cdf7ba 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1350,6 +1350,8 @@ struct f2fs_io_info {
>  	blk_opf_t op_flags;	/* req_flag_bits */
>  	block_t new_blkaddr;	/* new block address to be written */
>  	block_t old_blkaddr;	/* old block address before Cow */
> +	pgoff_t folio_offset;	/* offset in large folio */
> +	unsigned int folio_blkcnt;	/* block count in large folio */
>  	union {
>  		struct page *page;	/* page to be written */
>  		struct folio *folio;
> @@ -1372,6 +1374,15 @@ struct f2fs_io_info {
>  	sector_t *last_block;		/* last block number in bio */
>  };
>  
> +#define F2FS_FIO_LBLK(fio)						\
> +	(((fio)->folio)->index + (fio)->folio_offset)
> +#define F2FS_FIO_BLKCNT(fio)						\
> +	((fio)->folio_blkcnt)
> +#define F2FS_FIO_BIO_OFFSET(fio)					\
> +	((fio)->folio_offset << PAGE_SHIFT)
> +#define F2FS_FIO_BIO_SIZE(fio)					\
> +	F2FS_BLK_TO_BYTES((fio)->sbi, F2FS_FIO_BLKCNT(fio))
> +
>  struct bio_entry {
>  	struct bio *bio;
>  	struct list_head list;
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 926e6976bc22..89e50f871b75 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1228,6 +1228,7 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
>  		.temp = COLD,
>  		.op = REQ_OP_READ,
>  		.op_flags = 0,
> +		.folio_blkcnt = 1,
>  		.encrypted_page = NULL,
>  		.in_list = 0,
>  		.is_cache = 1,
> @@ -1338,6 +1339,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
>  		.temp = COLD,
>  		.op = REQ_OP_READ,
>  		.op_flags = 0,
> +		.folio_blkcnt = 1,
>  		.encrypted_page = NULL,
>  		.in_list = 0,
>  		.is_cache = 1,
> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> index 273b6428c9f9..ab7537ff7ebd 100644
> --- a/fs/f2fs/inline.c
> +++ b/fs/f2fs/inline.c
> @@ -151,6 +151,7 @@ int f2fs_convert_inline_folio(struct dnode_of_data *dn, struct folio *folio)
>  		.op = REQ_OP_WRITE,
>  		.op_flags = REQ_SYNC | REQ_PRIO,
>  		.folio = folio,
> +		.folio_blkcnt = 1,
>  		.encrypted_page = NULL,
>  		.io_type = FS_DATA_IO,
>  	};
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 25785b7626bb..96bfb7d63692 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3876,7 +3876,8 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
>  		if (file_is_cold(inode) || f2fs_need_compress_data(inode))
>  			return CURSEG_COLD_DATA;
>  
> -		type = __get_age_segment_type(inode, fio->folio->index);
> +		type = __get_age_segment_type(inode,
> +					     F2FS_FIO_LBLK(fio));
>  		if (type != NO_CHECK_TYPE)
>  			return type;
>  
> -- 
> 2.43.0
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
