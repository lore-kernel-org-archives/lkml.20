Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB1939A4C4;
	Thu, 17 Sep 2026 14:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789656516; cv=none; b=ZQzMySM4Q0Whw6+lY389ZljmRoa8eU1rP/T169oSIvRH1VFIFK3TS6lV4UYxSDalwF5JM07t8GuVhgJJufItwiaNM71HcUts7w2wRjacNeuJIqZxGmdxFJryCpeY97ua8uajy5rAEJcpQwfrY/0gfnhddrhYYcia12k4XCajnY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789656516; c=relaxed/simple;
	bh=x1xt3FKB2GBxfgxovyztLTahMcDtZpfVSUl+Vup9CEI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oDgB9+wyNoGsWyvSVP26f+PyRUWLtJHUcY5MjG7gMONpsUM9OPe5seYzMIYKSK10csU7+IEH5szByKP2B2Tk9WOQav0dq54E/RVhHrBEWGj2PllMnuunV9APUwjGSmoCa3IzXy4m924cZSxdw10s3ukz3azNyLFcS8cRYvdl8L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tk71oll6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tk71oll6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF3E1F000FF;
	Thu, 17 Sep 2026 14:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789656494;
	bh=OR7E3eqIWJjRx0XsNQ8qMRCEOewqVTb71+SqYJaLchM=;
	h=Date:From:Cc:Subject;
	b=Tk71oll6fFdK5oOo/pFVu/9PCgs12Hv9c2uh5/14FJ+ilEHnpX0rMtP4sYY+6RDXh
	 0dEgW9iDZo1D+jEVCuXpLlERfEK3eXy1t0KElqygqGv9HT8bKPJnDkvvInB0MGWX2h
	 CTX+lTzyWcPsi78+Uj4grS81TfRpIyzPDyCdbYUmh0+oTaKH35s1DX2RFX6jpVQR84
	 GpXiyZc6/EjS+51+DC/pSdybzEDMezRBm25JEysZHtbmNGRv0KfGQBM4Typu4lrNga
	 srEZMIleCFn/w9/L//LQ1ukYPZ6QEXbD69EoPHZl6za288hytPzKUyMqLCLSZIn4s8
	 ORG5etV75gpcw==
Date: Thu, 17 Sep 2026 15:48:10 +0100
From: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Zi Yan <ziy@nvidia.com>
Subject: linux-next: manual merge of the fs-next tree with the mm tree
Message-ID: <aqv9gg4J1n0sB0GU@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l3P87aLFzyo968kN"
Content-Disposition: inline


--l3P87aLFzyo968kN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,


Today's linux-next merge of the fs-next tree got a conflict in:

  fs/f2fs/f2fs.h

between commit:

  08071592211dc ("f2fs: stop using PG_private")
  32e05e39cb443 ("f2fs: convert the ->private flag helpers to folio-only")

=66rom the mm tree and commit:

  60105162524e9 ("f2fs: stop using PG_private")

=66rom the fs-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined fs/f2fs/f2fs.h
index 85937de3d7016,ebc621f302e14..0000000000000
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@@ -466,6 -466,7 +466,7 @@@ struct discard_entry=20
  #define MAX_PLIST_NUM		512
  #define plist_idx(blk_num)	((blk_num) >=3D MAX_PLIST_NUM ?		\
  					(MAX_PLIST_NUM - 1) : ((blk_num) - 1))
+ #define MAX_DISCARD_DROP_COUNT	512
 =20
  enum {
  	D_PREP,			/* initial */
@@@ -602,8 -603,9 +603,9 @@@ static inline int update_sits_in_cursum
  #define DEF_INLINE_RESERVED_SIZE	1
  static inline int get_extra_isize(struct inode *inode);
  static inline int get_inline_xattr_addrs(struct inode *inode);
+ static inline unsigned int cur_addrs_per_inode(struct inode *inode);
  #define MAX_INLINE_DATA(inode)	(sizeof(__le32) *			\
- 				(CUR_ADDRS_PER_INODE(inode) -		\
+ 				(cur_addrs_per_inode(inode) -		\
  				get_inline_xattr_addrs(inode) -	\
  				DEF_INLINE_RESERVED_SIZE))
 =20
@@@ -669,17 -671,6 +671,6 @@@ struct f2fs_dentry_ptr=20
  	int nr_bitmap;
  };
 =20
- static inline void make_dentry_ptr_block(struct inode *inode,
- 		struct f2fs_dentry_ptr *d, struct f2fs_dentry_block *t)
- {
- 	d->inode =3D inode;
- 	d->max =3D NR_DENTRY_IN_BLOCK;
- 	d->nr_bitmap =3D SIZE_OF_DENTRY_BITMAP;
- 	d->bitmap =3D t->dentry_bitmap;
- 	d->dentry =3D t->dentry;
- 	d->filename =3D t->filename;
- }
-=20
  static inline void make_dentry_ptr_inline(struct inode *inode,
  					struct f2fs_dentry_ptr *d, void *t)
  {
@@@ -1357,7 -1348,10 +1348,7 @@@ struct f2fs_io_info=20
  	blk_opf_t op_flags;	/* req_flag_bits */
  	block_t new_blkaddr;	/* new block address to be written */
  	block_t old_blkaddr;	/* old block address before Cow */
 -	union {
 -		struct page *page;	/* page to be written */
 -		struct folio *folio;
 -	};
 +	struct folio *folio;	/* folio to be written */
  	struct page *encrypted_page;	/* encrypted page */
  	struct page *compressed_page;	/* compressed page */
  	struct list_head list;		/* serialize IOs */
@@@ -1610,27 -1604,27 +1601,27 @@@ static inline void f2fs_set_bit(unsigne
  static inline void f2fs_clear_bit(unsigned int nr, char *addr);
 =20
  /*
 - * Layout of f2fs page.private:
 + * Layout of f2fs folio->private:
   *
   * Layout A: lowest bit should be 1
   * | bit0 =3D 1 | bit1 | bit2 | ... | bit MAX | private data .... |
 - * bit 0	PAGE_PRIVATE_NOT_POINTER
 - * bit 1	PAGE_PRIVATE_ONGOING_MIGRATION
 - * bit 2	PAGE_PRIVATE_INLINE_INODE
 - * bit 3	PAGE_PRIVATE_REF_RESOURCE
 - * bit 4	PAGE_PRIVATE_ATOMIC_WRITE
 + * bit 0	F2FS_FOLIO_PRIVATE_NOT_POINTER
 + * bit 1	F2FS_FOLIO_PRIVATE_ONGOING_MIGRATION
 + * bit 2	F2FS_FOLIO_PRIVATE_INLINE_INODE
 + * bit 3	F2FS_FOLIO_PRIVATE_REF_RESOURCE
 + * bit 4	F2FS_FOLIO_PRIVATE_ATOMIC_WRITE
   * bit 5-	f2fs private data
   *
   * Layout B: lowest bit should be 0
 - * page.private is a wrapped pointer.
 + * folio->private is a wrapped pointer.
   */
  enum {
 -	PAGE_PRIVATE_NOT_POINTER,		/* private contains non-pointer data */
 -	PAGE_PRIVATE_ONGOING_MIGRATION,		/* data page which is on-going migratin=
g */
 -	PAGE_PRIVATE_INLINE_INODE,		/* inode page contains inline data */
 -	PAGE_PRIVATE_REF_RESOURCE,		/* dirty page has referenced resources */
 -	PAGE_PRIVATE_ATOMIC_WRITE,		/* data page from atomic write path */
 -	PAGE_PRIVATE_MAX
 +	F2FS_FOLIO_PRIVATE_NOT_POINTER,		/* private contains non-pointer data */
 +	F2FS_FOLIO_PRIVATE_ONGOING_MIGRATION,		/* data page which is on-going mi=
grating */
 +	F2FS_FOLIO_PRIVATE_INLINE_INODE,		/* inode page contains inline data */
 +	F2FS_FOLIO_PRIVATE_REF_RESOURCE,		/* dirty page has referenced resources=
 */
 +	F2FS_FOLIO_PRIVATE_ATOMIC_WRITE,		/* data page from atomic write path */
 +	F2FS_FOLIO_PRIVATE_MAX
  };
 =20
  /* For compression */
@@@ -1859,6 -1853,15 +1850,15 @@@ struct f2fs_sb_info=20
  	unsigned int log_sectors_per_block;	/* log2 sectors per block */
  	unsigned int log_blocksize;		/* log2 block size */
  	unsigned int blocksize;			/* block size */
+ 	unsigned int nat_entries_per_block;	/* NAT entries in a block */
+ 	unsigned int addrs_per_inode;		/* addresses in an inode block */
+ 	unsigned int addrs_per_block;		/* addresses in a direct node block */
+ 	unsigned int nids_per_block;		/* node IDs in an indirect node block */
+ 	unsigned int sit_entries_per_block;	/* SIT entries in a block */
+ 	unsigned int orphans_per_block;	/* orphan inodes in a block */
+ 	unsigned int dentries_per_block;	/* dentries in a block */
+ 	unsigned int dentry_bitmap_size;	/* dentry bitmap size in bytes */
+ 	unsigned int dentry_reserved_size;	/* dentry reserved bytes */
  	unsigned int root_ino_num;		/* root inode number*/
  	unsigned int node_ino_num;		/* node inode number*/
  	unsigned int meta_ino_num;		/* meta inode number*/
@@@ -2247,6 -2250,47 +2247,47 @@@ static inline struct f2fs_sb_info *F2FS
  	return F2FS_M_SB(folio->mapping);
  }
 =20
+ #define SIT_ENTRY_PER_BLOCK(sbi)	((sbi)->sit_entries_per_block)
+ #define NAT_ENTRY_PER_BLOCK(sbi)	((sbi)->nat_entries_per_block)
+ #define DEF_ADDRS_PER_INODE(sbi)	((sbi)->addrs_per_inode)
+ #define DEF_ADDRS_PER_BLOCK(sbi)	((sbi)->addrs_per_block)
+ #define NIDS_PER_BLOCK(sbi)		((sbi)->nids_per_block)
+ #define F2FS_ORPHANS_PER_BLOCK(sbi)	((sbi)->orphans_per_block)
+ #define GET_ORPHAN_BLOCKS(sbi, n)	DIV_ROUND_UP((n), \
+ 					F2FS_ORPHANS_PER_BLOCK(sbi))
+ #define CP_CHKSUM_OFFSET(sbi)		(F2FS_BLKSIZE(sbi) - sizeof(__le32))
+=20
+ #define NODE_DIR1_BLOCK(sbi)		(DEF_ADDRS_PER_INODE(sbi) + 1)
+ #define NODE_DIR2_BLOCK(sbi)		(DEF_ADDRS_PER_INODE(sbi) + 2)
+ #define NODE_IND1_BLOCK(sbi)		(DEF_ADDRS_PER_INODE(sbi) + 3)
+ #define NODE_IND2_BLOCK(sbi)		(DEF_ADDRS_PER_INODE(sbi) + 4)
+ #define NODE_DIND_BLOCK(sbi)		(DEF_ADDRS_PER_INODE(sbi) + 5)
+=20
+ static inline struct f2fs_orphan_footer *
+ f2fs_orphan_footer(void *orphan_block, struct f2fs_sb_info *sbi)
+ {
+ 	return (struct f2fs_orphan_footer *)
+ 		((char *)orphan_block + sbi->blocksize -
+ 		 sizeof(struct f2fs_orphan_footer));
+ }
+=20
+ static inline void make_dentry_ptr_block(struct inode *inode,
+ 				struct f2fs_dentry_ptr *d, void *t)
+ {
+ 	struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
+ 	unsigned int entries =3D sbi->dentries_per_block;
+ 	unsigned int bitmap_size =3D sbi->dentry_bitmap_size;
+ 	unsigned int reserved_size =3D sbi->dentry_reserved_size;
+=20
+ 	d->inode =3D inode;
+ 	d->max =3D entries;
+ 	d->nr_bitmap =3D bitmap_size;
+ 	d->bitmap =3D t;
+ 	d->dentry =3D t + bitmap_size + reserved_size;
+ 	d->filename =3D t + bitmap_size + reserved_size +
+ 					SIZE_OF_DIR_ENTRY * entries;
+ }
+=20
  static inline struct f2fs_super_block *F2FS_RAW_SUPER(struct f2fs_sb_info=
 *sbi)
  {
  	return (struct f2fs_super_block *)(sbi->raw_super);
@@@ -2267,6 -2311,13 +2308,13 @@@ static inline struct f2fs_checkpoint *F
  	return (struct f2fs_checkpoint *)(sbi->ckpt);
  }
 =20
+ static inline struct node_footer *F2FS_NODE_FOOTER(struct f2fs_sb_info *s=
bi,
+ 						const struct folio *folio)
+ {
+ 	return folio_address(folio) + F2FS_BLKSIZE(sbi) -
+ 		sizeof(struct node_footer);
+ }
+=20
  static inline struct f2fs_node *F2FS_NODE(const struct folio *folio)
  {
  	return (struct f2fs_node *)folio_address(folio);
@@@ -2277,6 -2328,14 +2325,14 @@@ static inline struct f2fs_inode *F2FS_I
  	return &((struct f2fs_node *)folio_address(folio))->i;
  }
 =20
+ static inline __le32 *F2FS_INODE_NIDS(struct f2fs_sb_info *sbi,
+ 						const struct folio *folio)
+ {
+ 	return folio_address(folio) + F2FS_BLKSIZE(sbi) -
+ 		sizeof(struct node_footer) -
+ 		SIZE_OF_I_NID;
+ }
+=20
  static inline struct f2fs_nm_info *NM_I(struct f2fs_sb_info *sbi)
  {
  	return (struct f2fs_nm_info *)(sbi->nm_info);
@@@ -2312,14 -2371,14 +2368,14 @@@ static inline struct address_space *NOD
  	return sbi->node_inode->i_mapping;
  }
 =20
- static inline bool is_meta_folio(struct folio *folio)
+ static inline bool is_meta_folio(struct f2fs_sb_info *sbi, struct folio *=
folio)
  {
- 	return folio->mapping =3D=3D META_MAPPING(F2FS_F_SB(folio));
+ 	return folio->mapping =3D=3D META_MAPPING(sbi);
  }
 =20
- static inline bool is_node_folio(struct folio *folio)
+ static inline bool is_node_folio(struct f2fs_sb_info *sbi, struct folio *=
folio)
  {
- 	return folio->mapping =3D=3D NODE_MAPPING(F2FS_F_SB(folio));
+ 	return folio->mapping =3D=3D NODE_MAPPING(sbi);
  }
 =20
  static inline bool is_sbi_flag_set(struct f2fs_sb_info *sbi, unsigned int=
 type)
@@@ -2563,7 -2622,8 +2619,8 @@@ static inline int F2FS_HAS_BLOCKS(struc
  {
  	block_t xattr_block =3D F2FS_I(inode)->i_xattr_nid ? 1 : 0;
 =20
- 	return (inode->i_blocks >> F2FS_LOG_SECTORS_PER_BLOCK) > xattr_block;
+ 	return (inode->i_blocks >>
+ 		F2FS_LOG_SECTORS_PER_BLOCK(F2FS_I_SB(inode))) > xattr_block;
  }
 =20
  static inline bool f2fs_has_xattr_block(unsigned int ofs)
@@@ -2678,68 -2738,86 +2735,68 @@@ release_quota
  	return -ENOSPC;
  }
 =20
 -#define PAGE_PRIVATE_GET_FUNC(name, flagname) \
 +#define F2FS_FOLIO_PRIVATE_GET_FUNC(name, flagname) \
  static inline bool folio_test_f2fs_##name(const struct folio *folio)	\
  {									\
  	unsigned long priv =3D (unsigned long)folio->private;		\
 -	unsigned long v =3D (1UL << PAGE_PRIVATE_NOT_POINTER) |		\
 -			     (1UL << PAGE_PRIVATE_##flagname);		\
 +	unsigned long v =3D (1UL << F2FS_FOLIO_PRIVATE_NOT_POINTER) |	\
 +			     (1UL << F2FS_FOLIO_PRIVATE_##flagname);	\
  	return (priv & v) =3D=3D v;						\
 -}									\
 -static inline bool page_private_##name(struct page *page) \
 -{ \
 -	return page_private(page) && \
 -		test_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)) && \
 -		test_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
  }
 =20
 -#define PAGE_PRIVATE_SET_FUNC(name, flagname) \
 +#define F2FS_FOLIO_PRIVATE_SET_FUNC(name, flagname) \
  static inline void folio_set_f2fs_##name(struct folio *folio)		\
  {									\
 -	unsigned long v =3D (1UL << PAGE_PRIVATE_NOT_POINTER) |		\
 -			     (1UL << PAGE_PRIVATE_##flagname);		\
 +	unsigned long v =3D (1UL << F2FS_FOLIO_PRIVATE_NOT_POINTER) |	\
 +			     (1UL << F2FS_FOLIO_PRIVATE_##flagname);	\
  	if (!folio->private)						\
  		folio_attach_private(folio, (void *)v);			\
  	else {								\
  		v |=3D (unsigned long)folio->private;			\
  		folio->private =3D (void *)v;				\
  	}								\
 -}									\
 -static inline void set_page_private_##name(struct page *page) \
 -{ \
 -	if (!page_private(page)) \
 -		attach_page_private(page, \
 -				(void *)BIT(PAGE_PRIVATE_NOT_POINTER)); \
 -	set_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
  }
 =20
 -#define PAGE_PRIVATE_CLEAR_FUNC(name, flagname) \
 +#define F2FS_FOLIO_PRIVATE_CLEAR_FUNC(name, flagname) \
  static inline void folio_clear_f2fs_##name(struct folio *folio)		\
  {									\
  	unsigned long v =3D (unsigned long)folio->private;		\
  									\
 -	v &=3D ~(1UL << PAGE_PRIVATE_##flagname);				\
 -	if (v =3D=3D (1UL << PAGE_PRIVATE_NOT_POINTER))			\
 +	v &=3D ~(1UL << F2FS_FOLIO_PRIVATE_##flagname);			\
 +	if (v =3D=3D (1UL << F2FS_FOLIO_PRIVATE_NOT_POINTER))		\
  		folio_detach_private(folio);				\
  	else								\
  		folio->private =3D (void *)v;				\
 -}									\
 -static inline void clear_page_private_##name(struct page *page) \
 -{ \
 -	clear_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
 -	if (page_private(page) =3D=3D BIT(PAGE_PRIVATE_NOT_POINTER)) \
 -		detach_page_private(page); \
  }
 =20
 -PAGE_PRIVATE_GET_FUNC(nonpointer, NOT_POINTER);
 -PAGE_PRIVATE_GET_FUNC(inline, INLINE_INODE);
 -PAGE_PRIVATE_GET_FUNC(gcing, ONGOING_MIGRATION);
 -PAGE_PRIVATE_GET_FUNC(atomic, ATOMIC_WRITE);
 +F2FS_FOLIO_PRIVATE_GET_FUNC(nonpointer, NOT_POINTER);
 +F2FS_FOLIO_PRIVATE_GET_FUNC(inline, INLINE_INODE);
 +F2FS_FOLIO_PRIVATE_GET_FUNC(gcing, ONGOING_MIGRATION);
 +F2FS_FOLIO_PRIVATE_GET_FUNC(atomic, ATOMIC_WRITE);
 =20
 -PAGE_PRIVATE_SET_FUNC(reference, REF_RESOURCE);
 -PAGE_PRIVATE_SET_FUNC(inline, INLINE_INODE);
 -PAGE_PRIVATE_SET_FUNC(gcing, ONGOING_MIGRATION);
 -PAGE_PRIVATE_SET_FUNC(atomic, ATOMIC_WRITE);
 +F2FS_FOLIO_PRIVATE_SET_FUNC(reference, REF_RESOURCE);
 +F2FS_FOLIO_PRIVATE_SET_FUNC(inline, INLINE_INODE);
 +F2FS_FOLIO_PRIVATE_SET_FUNC(gcing, ONGOING_MIGRATION);
 +F2FS_FOLIO_PRIVATE_SET_FUNC(atomic, ATOMIC_WRITE);
 =20
 -PAGE_PRIVATE_CLEAR_FUNC(reference, REF_RESOURCE);
 -PAGE_PRIVATE_CLEAR_FUNC(inline, INLINE_INODE);
 -PAGE_PRIVATE_CLEAR_FUNC(gcing, ONGOING_MIGRATION);
 -PAGE_PRIVATE_CLEAR_FUNC(atomic, ATOMIC_WRITE);
 +F2FS_FOLIO_PRIVATE_CLEAR_FUNC(reference, REF_RESOURCE);
 +F2FS_FOLIO_PRIVATE_CLEAR_FUNC(inline, INLINE_INODE);
 +F2FS_FOLIO_PRIVATE_CLEAR_FUNC(gcing, ONGOING_MIGRATION);
 +F2FS_FOLIO_PRIVATE_CLEAR_FUNC(atomic, ATOMIC_WRITE);
 =20
  static inline unsigned long folio_get_f2fs_data(struct folio *folio)
  {
  	unsigned long data =3D (unsigned long)folio->private;
 =20
 -	if (!test_bit(PAGE_PRIVATE_NOT_POINTER, &data))
 +	if (!test_bit(F2FS_FOLIO_PRIVATE_NOT_POINTER, &data))
  		return 0;
 -	return data >> PAGE_PRIVATE_MAX;
 +	return data >> F2FS_FOLIO_PRIVATE_MAX;
  }
 =20
  static inline void folio_set_f2fs_data(struct folio *folio, unsigned long=
 data)
  {
 -	data =3D (1UL << PAGE_PRIVATE_NOT_POINTER) | (data << PAGE_PRIVATE_MAX);
 +	data =3D (1UL << F2FS_FOLIO_PRIVATE_NOT_POINTER) |
 +	       (data << F2FS_FOLIO_PRIVATE_MAX);
 =20
  	if (!folio_test_private(folio))
  		folio_attach_private(folio, (void *)data);
@@@ -2751,7 -2829,7 +2808,7 @@@ static inline void dec_valid_block_coun
  						struct inode *inode,
  						block_t count)
  {
- 	blkcnt_t sectors =3D count << F2FS_LOG_SECTORS_PER_BLOCK;
+ 	blkcnt_t sectors =3D count << F2FS_LOG_SECTORS_PER_BLOCK(sbi);
 =20
  	spin_lock(&sbi->stat_lock);
  	if (unlikely(sbi->total_valid_block_count < count)) {
@@@ -2903,7 -2981,7 +2960,7 @@@ static inline void *__bitmap_ptr(struc
  		if (flag =3D=3D NAT_BITMAP)
  			return tmp_ptr;
  		else
- 			return (unsigned char *)ckpt + F2FS_BLKSIZE;
+ 			return (unsigned char *)ckpt + F2FS_BLKSIZE(sbi);
  	} else {
  		offset =3D (flag =3D=3D NAT_BITMAP) ?
  			le32_to_cpu(ckpt->sit_ver_bitmap_bytesize) : 0;
@@@ -3229,13 -3307,11 +3286,11 @@@ static inline void f2fs_radix_tree_inse
  		cond_resched();
  }
 =20
- #define RAW_IS_INODE(p)	((p)->footer.nid =3D=3D (p)->footer.ino)
-=20
- static inline bool IS_INODE(const struct folio *folio)
+ static inline bool IS_INODE(struct f2fs_sb_info *sbi, const struct folio =
*folio)
  {
- 	struct f2fs_node *p =3D F2FS_NODE(folio);
+ 	struct node_footer *footer =3D F2FS_NODE_FOOTER(sbi, folio);
 =20
- 	return RAW_IS_INODE(p);
+ 	return footer->nid =3D=3D footer->ino;
  }
 =20
  static inline int offset_in_addr(struct f2fs_inode *i)
@@@ -3244,16 -3320,22 +3299,22 @@@
  			(le16_to_cpu(i->i_extra_isize) / sizeof(__le32)) : 0;
  }
 =20
- static inline __le32 *blkaddr_in_node(struct f2fs_node *node)
+ static inline __le32 *blkaddr_in_node(struct f2fs_sb_info *sbi,
+ 						const struct folio *folio)
  {
- 	return RAW_IS_INODE(node) ? node->i.i_addr : node->dn.addr;
+ 	struct f2fs_node *node =3D F2FS_NODE(folio);
+=20
+ 	return IS_INODE(sbi, folio) ? node->i.i_addr : node->dn.addr;
  }
 =20
  static inline int f2fs_has_extra_attr(struct inode *inode);
  static inline unsigned int get_dnode_base(struct inode *inode,
  					struct folio *node_folio)
  {
- 	if (!IS_INODE(node_folio))
+ 	struct f2fs_sb_info *sbi =3D inode ? F2FS_I_SB(inode) :
+ 					F2FS_F_SB(node_folio);
+=20
+ 	if (!IS_INODE(sbi, node_folio))
  		return 0;
 =20
  	return inode ? get_extra_isize(inode) :
@@@ -3263,7 -3345,10 +3324,10 @@@
  static inline __le32 *get_dnode_addr(struct inode *inode,
  					struct folio *node_folio)
  {
- 	return blkaddr_in_node(F2FS_NODE(node_folio)) +
+ 	struct f2fs_sb_info *sbi =3D inode ? F2FS_I_SB(inode) :
+ 					F2FS_F_SB(node_folio);
+=20
+ 	return blkaddr_in_node(sbi, node_folio) +
  			get_dnode_base(inode, node_folio);
  }
 =20
@@@ -3578,20 -3663,26 +3642,26 @@@ static inline bool f2fs_need_compress_d
  static inline unsigned int addrs_per_page(struct inode *inode,
  							bool is_inode)
  {
- 	unsigned int addrs =3D is_inode ? (CUR_ADDRS_PER_INODE(inode) -
- 			get_inline_xattr_addrs(inode)) : DEF_ADDRS_PER_BLOCK;
+ 	unsigned int addrs =3D is_inode ? (cur_addrs_per_inode(inode) -
+ 			get_inline_xattr_addrs(inode)) :
+ 			DEF_ADDRS_PER_BLOCK(F2FS_I_SB(inode));
 =20
  	if (f2fs_compressed_file(inode))
  		return ALIGN_DOWN(addrs, F2FS_I(inode)->i_cluster_size);
  	return addrs;
  }
 =20
+ static inline unsigned int cur_addrs_per_inode(struct inode *inode)
+ {
+ 	return DEF_ADDRS_PER_INODE(F2FS_I_SB(inode)) - get_extra_isize(inode);
+ }
+=20
  static inline
  void *inline_xattr_addr(struct inode *inode, const struct folio *folio)
  {
  	struct f2fs_inode *ri =3D F2FS_INODE(folio);
 =20
- 	return (void *)&(ri->i_addr[DEF_ADDRS_PER_INODE -
+ 	return (void *)&(ri->i_addr[DEF_ADDRS_PER_INODE(F2FS_I_SB(inode)) -
  					get_inline_xattr_addrs(inode)]);
  }
 =20
@@@ -3951,7 -4042,7 +4021,7 @@@ void f2fs_inode_synced(struct inode *in
  int f2fs_dquot_initialize(struct inode *inode);
  int f2fs_enable_quota_files(struct f2fs_sb_info *sbi, bool rdonly);
  int f2fs_do_quota_sync(struct super_block *sb, int type);
- loff_t max_file_blocks(struct inode *inode);
+ loff_t max_file_blocks(struct f2fs_sb_info *sbi, struct inode *inode);
  void f2fs_quota_off_umount(struct super_block *sb);
  void f2fs_save_errors(struct f2fs_sb_info *sbi, unsigned char flag);
  void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error);
@@@ -3972,7 -4063,7 +4042,7 @@@ enum node_type
 =20
  int f2fs_check_nid_range(struct f2fs_sb_info *sbi, nid_t nid);
  bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type);
- bool f2fs_in_warm_node_list(struct folio *folio);
+ bool f2fs_in_warm_node_list(struct f2fs_sb_info *sbi, struct folio *folio=
);
  void f2fs_init_fsync_node_info(struct f2fs_sb_info *sbi);
  void f2fs_del_fsync_node_entry(struct f2fs_sb_info *sbi, struct folio *fo=
lio);
  void f2fs_reset_fsync_node_info(struct f2fs_sb_info *sbi);
@@@ -4043,6 -4134,8 +4113,8 @@@ void f2fs_reserve_device_alias(struct f
  bool f2fs_is_checkpointed_data(struct f2fs_sb_info *sbi, block_t blkaddr);
  int f2fs_start_discard_thread(struct f2fs_sb_info *sbi);
  void f2fs_drop_discard_cmd(struct f2fs_sb_info *sbi);
+ void f2fs_drop_discard_cmd_range(struct f2fs_sb_info *sbi,
+ 					block_t start, block_t len);
  void f2fs_stop_discard_thread(struct f2fs_sb_info *sbi);
  bool f2fs_issue_discard_timeout(struct f2fs_sb_info *sbi, bool need_check=
);
  void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
@@@ -5197,8 -5290,9 +5269,9 @@@ static inline void f2fs_truncate_meta_i
  							NULL, 0, DATA);
 =20
  	truncate_inode_pages_range(META_MAPPING(sbi),
- 			F2FS_BLK_TO_BYTES((loff_t)blkaddr),
- 			F2FS_BLK_END_BYTES((loff_t)(blkaddr + cnt - 1)));
+ 			F2FS_BLK_TO_BYTES(sbi, (loff_t)blkaddr),
+ 			F2FS_BLK_END_BYTES(sbi,
+ 					    (loff_t)(blkaddr + cnt - 1)));
  }
 =20
  static inline void f2fs_invalidate_internal_cache(struct f2fs_sb_info *sb=
i,

--l3P87aLFzyo968kN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqr/akACgkQJNaLcl1U
h9A0BAf7BYv2yO4YyjukX5c2gQfCdx/Ek0XHS8a2j0jQuHYH8sNsZMlZjKWQ08t9
BAfHBdqI6SDig3d2fHg7m4iI86NKJXLNLoOd+Fb0o/OXZiQVBVjnvviFi9kk+QFs
IcEOJcWqF1JOeZSRaiVk2mp3ElxWGduuHOrYC7GRetKH5F5BJAcs/tUH8PTK5BCX
O9fuKnMdbpwmsBVAEHwiImvRgvW0bySWZtKqvCtB4B5hGy4idBPOz8CBTVZyJ/fN
OfEhehErafW3ay/XVxxQTOA8+CzgqdyZnDHkMqLz71AqqJD9kAPAf/FsU8mNP/OU
4Y341NbvrRGSw2UNTfH25aGn/zH8mg==
=+Fq7
-----END PGP SIGNATURE-----

--l3P87aLFzyo968kN--
