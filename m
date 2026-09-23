Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF9A375F97;
	Wed, 23 Sep 2026 10:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158131; cv=none; b=gGD9Zm8Dt6uQStnhexgV6isykq3QnE/SO8dVCRygLQdWMsWfuH07wrscyGXqyC7YnZBwEZ9eZu3mPC7halhCna8YcCpMwJFQFeGRthKs3PgfnnnOjpNw6ESQsKnIw9Tc1+WVaFuHDy9Pz2RfHq7Hwa1znva9Z5HqswhCYgY3Whk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158131; c=relaxed/simple;
	bh=tucbGnQMaWf3BXpdZlA61MfeYjXP8Rf9jnrPVIgzgHk=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M5EAlQWvgm8XWzum3MtXWxTsHBB+XAVSrjYHZ+486Lqu1UtZbM1UU6i6gXv9AU2tNVGcUAbzQCMn6YlyWlejR5ESy5lXX2tr2Zy2bElpAzqVeCt0UD2crASLCfzOMm+r2wO+P/5lhxfP+OFx7eXk1RvU2p3WOm0siMxuHjzz4lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OS+iq8DG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OS+iq8DG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63E6D1F000FF;
	Wed, 23 Sep 2026 10:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790158128;
	bh=CsIkyBpF053K/t801f3jVUnqsTeOXM+B6O0PcJQ1QUg=;
	h=Date:From:Cc:Subject;
	b=OS+iq8DGwitai5kXlgMshpROFhyasFVdnBBN3aLLfvpNt9KS39wo8du2ANIoDEpcg
	 aAbcN/YFxB3/TTS/pFfWUv0J+v/M4PO0/z4faqGkC5i8wp48i3XH4y/zQ7CE9CaciO
	 +y1TAieqreG41f8d3hWrvlwMC7BWHYPT74kKDHhH37+ol0ZJ08IMUzVdviaG7zIx16
	 sxGRPEneyXLX9WR4XaP29iLgmP44hkqTbgbfW9k7e1bnsr8f1/l4JyFhjOjhP7Vit1
	 9pz/sn04eYHV3p0pehg862K4iI0+psjM7KoE1EyDw1d56dWLXru0sLogLYZgqv8Vbb
	 fUp1k1be+fYYg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 8152D1AC5738; Wed, 23 Sep 2026 11:08:44 +0100 (BST)
Date: Wed, 23 Sep 2026 12:08:44 +0200
From: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chao Yu <chao@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Zi Yan <ziy@nvidia.com>
Subject: linux-next: manual merge of the fs-next tree with the mm tree
Message-ID: <arOlLKx-29GNPJ-m@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IofQauRoSh6X4lKp"
Content-Disposition: inline


--IofQauRoSh6X4lKp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fs-next tree got a conflict in:

  fs/f2fs/f2fs.h

between commit:

  ae13569d02d0f ("f2fs: convert the ->private flag helpers to folio-only")

=66rom the mm tree and commit:

  493b9dc8b52ca ("f2fs: cache: use node cache")

=66rom the fs-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

Incidentally some of those flags don't seem to have users...

diff --cc fs/coredump.c
index 4d03826dd2498,f33ece836b10b..0000000000000
--- a/fs/coredump.c
+++ b/fs/coredump.c
@@@ -1608,10 -1846,12 +1846,12 @@@ static unsigned long vma_dump_size(stru
  	}
 =20
  	/* Hugetlb memory check */
 -	if (is_vm_hugetlb_page(vma)) {
 +	if (vma_is_hugetlb(vma)) {
- 		if ((vma->vm_flags & VM_SHARED) && FILTER(HUGETLB_SHARED))
+ 		if ((vma->vm_flags & VM_SHARED) &&
+ 		    COREDUMP_MEMORY_TYPE_INCLUDE(memory_types, HUGETLB_SHARED))
  			goto whole;
- 		if (!(vma->vm_flags & VM_SHARED) && FILTER(HUGETLB_PRIVATE))
+ 		if (!(vma->vm_flags & VM_SHARED) &&
+ 		    COREDUMP_MEMORY_TYPE_INCLUDE(memory_types, HUGETLB_PRIVATE))
  			goto whole;
  		return 0;
  	}
diff --cc fs/f2fs/f2fs.h
index 85937de3d7016,c1f1e339f0857..0000000000000
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@@ -1614,23 -1612,21 +1609,21 @@@ static inline void f2fs_clear_bit(unsig
   *
   * Layout A: lowest bit should be 1
   * | bit0 =3D 1 | bit1 | bit2 | ... | bit MAX | private data .... |
 - * bit 0	PAGE_PRIVATE_NOT_POINTER
 - * bit 1	PAGE_PRIVATE_ONGOING_MIGRATION
 - * bit 2	PAGE_PRIVATE_REF_RESOURCE
 - * bit 3	PAGE_PRIVATE_ATOMIC_WRITE
 + * bit 0	F2FS_FOLIO_PRIVATE_NOT_POINTER
 + * bit 1	F2FS_FOLIO_PRIVATE_ONGOING_MIGRATION
-  * bit 2	F2FS_FOLIO_PRIVATE_INLINE_INODE
-  * bit 3	F2FS_FOLIO_PRIVATE_REF_RESOURCE
-  * bit 4	F2FS_FOLIO_PRIVATE_ATOMIC_WRITE
-  * bit 5-	f2fs private data
++ * bit 2	F2FS_FOLIO_PRIVATE_REF_RESOURCE
++ * bit 3	F2FS_FOLIO_PRIVATE_ATOMIC_WRITE
+  * bit 4-	f2fs private data
   *
   * Layout B: lowest bit should be 0
 - * page.private is a wrapped pointer.
 + * folio->private is a wrapped pointer.
   */
  enum {
 -	PAGE_PRIVATE_NOT_POINTER,		/* private contains non-pointer data */
 -	PAGE_PRIVATE_ONGOING_MIGRATION,		/* data page which is on-going migratin=
g */
 -	PAGE_PRIVATE_REF_RESOURCE,		/* dirty page has referenced resources */
 -	PAGE_PRIVATE_ATOMIC_WRITE,		/* data page from atomic write path */
 -	PAGE_PRIVATE_MAX
 +	F2FS_FOLIO_PRIVATE_NOT_POINTER,		/* private contains non-pointer data */
 +	F2FS_FOLIO_PRIVATE_ONGOING_MIGRATION,		/* data page which is on-going mi=
grating */
- 	F2FS_FOLIO_PRIVATE_INLINE_INODE,		/* inode page contains inline data */
 +	F2FS_FOLIO_PRIVATE_REF_RESOURCE,		/* dirty page has referenced resources=
 */
 +	F2FS_FOLIO_PRIVATE_ATOMIC_WRITE,		/* data page from atomic write path */
 +	F2FS_FOLIO_PRIVATE_MAX
  };
 =20
  /* For compression */
@@@ -2710,22 -2801,25 +2785,19 @@@ static inline void folio_clear_f2fs_##n
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
 -PAGE_PRIVATE_GET_FUNC(gcing, ONGOING_MIGRATION);
 -PAGE_PRIVATE_GET_FUNC(atomic, ATOMIC_WRITE);
 +F2FS_FOLIO_PRIVATE_GET_FUNC(nonpointer, NOT_POINTER);
- F2FS_FOLIO_PRIVATE_GET_FUNC(inline, INLINE_INODE);
 +F2FS_FOLIO_PRIVATE_GET_FUNC(gcing, ONGOING_MIGRATION);
 +F2FS_FOLIO_PRIVATE_GET_FUNC(atomic, ATOMIC_WRITE);
 =20
 -PAGE_PRIVATE_SET_FUNC(reference, REF_RESOURCE);
 -PAGE_PRIVATE_SET_FUNC(gcing, ONGOING_MIGRATION);
 -PAGE_PRIVATE_SET_FUNC(atomic, ATOMIC_WRITE);
 +F2FS_FOLIO_PRIVATE_SET_FUNC(reference, REF_RESOURCE);
- F2FS_FOLIO_PRIVATE_SET_FUNC(inline, INLINE_INODE);
 +F2FS_FOLIO_PRIVATE_SET_FUNC(gcing, ONGOING_MIGRATION);
 +F2FS_FOLIO_PRIVATE_SET_FUNC(atomic, ATOMIC_WRITE);
 =20
 -PAGE_PRIVATE_CLEAR_FUNC(reference, REF_RESOURCE);
 -PAGE_PRIVATE_CLEAR_FUNC(gcing, ONGOING_MIGRATION);
 -PAGE_PRIVATE_CLEAR_FUNC(atomic, ATOMIC_WRITE);
 +F2FS_FOLIO_PRIVATE_CLEAR_FUNC(reference, REF_RESOURCE);
- F2FS_FOLIO_PRIVATE_CLEAR_FUNC(inline, INLINE_INODE);
 +F2FS_FOLIO_PRIVATE_CLEAR_FUNC(gcing, ONGOING_MIGRATION);
 +F2FS_FOLIO_PRIVATE_CLEAR_FUNC(atomic, ATOMIC_WRITE);
 =20
  static inline unsigned long folio_get_f2fs_data(struct folio *folio)
  {
diff --cc fs/fuse/dax.c
index a5994f1c637d9,32c88ef814340..0000000000000
--- a/fs/fuse/dax.c
+++ b/fs/fuse/dax.c
@@@ -826,7 -826,8 +826,8 @@@ int fuse_dax_mmap(struct file *file, st
  {
  	file_accessed(file);
  	vma->vm_ops =3D &fuse_dax_vm_ops;
 -	vm_flags_set(vma, VM_MIXEDMAP | VM_HUGEPAGE);
 +	vma_set_flags(vma, VMA_HUGEPAGE_BIT);
+ 	vma->vm_page_prot =3D pgprot_decrypted(vma->vm_page_prot);
  	return 0;
  }
 =20

--IofQauRoSh6X4lKp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqzpSsACgkQJNaLcl1U
h9C0Vgf9HzNNVvc/xic5C8/6pP+8CqIMD2ZY1vZMtJU5SWWI9CMpkjFNFtnWmcs6
r9favMZ53y2G7qdGgLKK5YauhbABlV416Wx+8OCggLuOoCu9ueNiL007zGQikIbG
rKLg60drUvFcfDR6Y+Endjmn/R7CDCZxaMj5TGdg71Hp/ovgfLA9Mx27RFyGCtHn
T/n1ysya56m5qRsnXW08xric9AWDd6qcoXXaVc5XHXODrDgTKHoKGQsU7Ba1oorl
fHX7Wz5MLFigfTB8XcooYvqGFUU51UQSUhY6e+5XkpL/VRVU0fLkT5NNV3GANoxh
2HBGjqzcoo0oA81hX1jwJ7leKnHQ2w==
=cYex
-----END PGP SIGNATURE-----

--IofQauRoSh6X4lKp--
