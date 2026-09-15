Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3134A8A05;
	Tue, 15 Sep 2026 12:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473976; cv=none; b=Sm3jOxYqgAGA5/mQOLDMKVqBSya2nbHqPmpCxJGXEprXBmKP2srXQQFX6nrc2wFDeM94/wkFeudSkxktPznYWRUsE+9pK4qJBZnOreaob35r3iU7yztk2LIL7cyON+uB7rQcuLHHZ78yydcnu/sCtVOfpYwGFamJZYLkZdsAWyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473976; c=relaxed/simple;
	bh=dQM1m4hbSEMVOd/GHWiXzfx4ChM2grqju0/Zj80/O30=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e4MEmAmgWLslr2OdwSfZ0P4iIxswgz3peUeLhD0ntV2j35Ndhn+1tkw1ZJzxKgwfB6ffEglnar92WoW+F7zGl0LLm5dh3zZvhFztGNfBCkNnwSJiOru5Cuq0ply3rGNYaSACuTiX+ocI05yA72romjwXRZHUonWueuLEftPLNBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLWuszfR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLWuszfR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 137741F000FF;
	Tue, 15 Sep 2026 12:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789473974;
	bh=kRqqIN5NY/K5FVQCSgtFO0X60MFSv3Wi0dGfDjHpfWU=;
	h=Date:From:To:Cc:Subject;
	b=gLWuszfRuhk7JM0zXUoTwSU4qZvz0gal6D5PLHbUr5AMaH5rTgdA9oXnuqMrNAPJE
	 +2VtK4tS0vS5WPlvbqXdjuRncQ2cM5SwHYXjVu5wgKsBHePVieqwEdDCRLMcsO71lU
	 tW7aMA7nd+ZzqSL4r4tqSMBNZUh/x2rZkAOsH+LWalr3vCijiYIVJ+7yM7v0rl0FZS
	 GocUhBjDi7nUi1fdnCtN30oiZHK3lWhbSCRCTbhqGtcOP2Q9e3tX5CPy6JU9v+Tq2X
	 t+DSppBeoXHz3jwghLlETSbK1FnrzpiDDnZTtMpq1usF+x6shtqp1K/TN1jGSdOeMH
	 qHCnmQU0lD/Ng==
Date: Tue, 15 Sep 2026 13:06:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, Kees Cook <kees@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the ntfs tree with the origin tree
Message-ID: <aqk0suRfSCjoZ3KW@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eberLla/3alX7Tas"
Content-Disposition: inline


--eberLla/3alX7Tas
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ntfs tree got a conflict in:

  fs/ntfs/mft.c

between commit:

  3a2c4d55e32ad ("treewide: refresh kmalloc_obj() conversions")

=66rom the origin tree and commits:

  107857fee6272 ("ntfs: write MFT folios through mapped I/O units")
  9ed2f188c8875 ("ntfs: write MFT records through containing I/O units")

=66rom the ntfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/ntfs/mft.c
index 98ab686a5ea2f,c565bec49c7dd..0000000000000
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@@ -2634,42 -3174,96 +3174,97 @@@ static int ntfs_write_mft_block(struct=
=20
  	struct inode *vi =3D mapping->host;
  	struct ntfs_inode *ni =3D NTFS_I(vi);
  	struct ntfs_volume *vol =3D ni->vol;
- 	u8 *kaddr;
 -	struct ntfs_inode **locked_nis __free(kfree) =3D
 -		kmalloc_array(PAGE_SIZE / NTFS_BLOCK_SIZE,
 -			      sizeof(struct ntfs_inode *), GFP_NOFS);
 -	struct inode **ref_inos __free(kfree) =3D kmalloc_array(
 -		PAGE_SIZE / NTFS_BLOCK_SIZE, sizeof(struct inode *), GFP_NOFS);
 +	struct ntfs_inode **locked_nis __free(kfree) =3D kmalloc_objs(struct ntf=
s_inode *,
 +								    PAGE_SIZE / NTFS_BLOCK_SIZE,
 +								    GFP_NOFS);
- 	int nr_locked_nis =3D 0, err =3D 0, mft_ofs, prev_mft_ofs;
 +	struct inode **ref_inos __free(kfree) =3D kmalloc_objs(struct inode *,
 +							     PAGE_SIZE / NTFS_BLOCK_SIZE,
 +							     GFP_NOFS);
- 	int nr_ref_inos =3D 0;
- 	struct bio *bio =3D NULL;
- 	u64 mft_no;
- 	struct ntfs_inode *tni;
- 	s64 lcn;
- 	s64 vcn =3D ntfs_pidx_to_cluster(vol, folio->index);
- 	s64 end_vcn =3D ntfs_bytes_to_cluster(vol, ni->allocated_size);
- 	unsigned int folio_sz;
- 	loff_t i_size =3D i_size_read(vi);
+ 	struct ntfs_mft_io_unit *units __free(kfree) =3D NULL;
+ 	struct bio *parent =3D NULL, *child =3D NULL;
+ 	struct ntfs_mft_write_ctx *ctx =3D NULL;
+ 	u8 *kaddr =3D NULL;
+ 	DECLARE_BITMAP(record_selected, PAGE_SIZE / NTFS_BLOCK_SIZE) =3D {};
+ 	u64 folio_byte, file_limit, folio_end, mirror_size;
+ 	unsigned int nr_records, nr_units =3D 0, max_units;
+ 	unsigned int nr_locked_nis =3D 0, nr_ref_inos =3D 0;
+ 	unsigned int record, unit_idx;
+ 	unsigned long flags;
+ 	loff_t i_size;
+ 	s64 allocated_size;
+ 	bool defer =3D false, redirty =3D false;
+ 	int err =3D 0;
 =20
- 	ntfs_debug("Entering for inode 0x%llx, attribute type 0x%x, folio index =
0x%lx.",
- 			ni->mft_no, ni->type, folio->index);
+ 	read_lock_irqsave(&ni->size_lock, flags);
+ 	i_size =3D i_size_read(vi);
+ 	allocated_size =3D ni->allocated_size;
+ 	read_unlock_irqrestore(&ni->size_lock, flags);
 =20
- 	if (!locked_nis || !ref_inos) {
- 		folio_redirty_for_writepage(wbc, folio);
- 		folio_unlock(folio);
- 		return -ENOMEM;
+ 	ntfs_debug("Entering for inode 0x%llx, folio index 0x%lx.", ni->mft_no,
+ 		   folio->index);
+ 	WARN_ON(!folio_test_locked(folio));
+=20
+ 	folio_byte =3D folio_pos(folio);
+ 	folio_end =3D folio_byte + PAGE_SIZE;
+ 	mirror_size =3D (u64)vol->mftmirr_size * vol->mft_record_size;
+=20
+ 	if (i_size <=3D folio_byte)
+ 		folio_zero_segment(folio, 0, PAGE_SIZE);
+ 	else if ((u64)i_size < folio_end)
+ 		folio_zero_segment(folio, i_size - folio_byte, PAGE_SIZE);
+=20
+ 	file_limit =3D min_t(u64, i_size, allocated_size);
+ 	nr_records =3D PAGE_SIZE / vol->mft_record_size;
+ 	max_units =3D PAGE_SIZE / min(vol->cluster_size, vol->mft_record_size);
+ 	units =3D kmalloc_array(max_units, sizeof(*units), GFP_NOFS);
+ 	if (!locked_nis || !ref_inos || !units) {
+ 		err =3D -ENOMEM;
+ 		goto out_noio;
  	}
 =20
- 	/* We have to zero every time due to mmap-at-end-of-file. */
- 	if (folio->index >=3D (i_size >> folio_shift(folio)))
- 		/* The page straddles i_size. */
- 		folio_zero_segment(folio,
- 				   offset_in_folio(folio, i_size),
- 				   folio_size(folio));
+ 	kaddr =3D kmap_local_folio(folio, 0);
+ 	folio_clear_uptodate(folio);
 =20
- 	lcn =3D lcn_from_index(vol, ni, folio->index);
- 	if (lcn <=3D LCN_HOLE) {
+ 	for (record =3D 0; record < nr_records; record++) {
+ 		struct ntfs_inode *tni =3D NULL;
+ 		struct inode *ref_vi =3D NULL;
+ 		u64 record_byte =3D
+ 			folio_byte + (u64)record * vol->mft_record_size;
+ 		u64 mft_no;
+=20
+ 		if (record_byte >=3D file_limit)
+ 			continue;
+ 		mft_no =3D record_byte >> vol->mft_record_size_bits;
+ 		if (!ntfs_may_write_mft_record(
+ 			    vol, mft_no,
+ 			    (struct mft_record *)(kaddr +
+ 						  record * vol->mft_record_size),
+ 			    &tni, &ref_vi)) {
+ 			if (ref_vi)
+ 				ref_inos[nr_ref_inos++] =3D ref_vi;
+ 			continue;
+ 		}
+ 		if (ref_vi)
+ 			ref_inos[nr_ref_inos++] =3D ref_vi;
+ 		if (tni) {
+ 			locked_nis[nr_locked_nis++] =3D tni;
+ 			if (tni->nr_extents < 0 &&
+ 			    tni->ext.base_ntfs_ino =3D=3D NTFS_I(vol->mft_ino))
+ 				continue;
+ 		}
+ 		__set_bit(record, record_selected);
+ 	}
+=20
+ 	err =3D ntfs_prepare_mft_folio_units(ni, folio_byte, file_limit,
+ 					   record_selected, units, &nr_units,
+ 					   max_units, &defer);
+ 	if (err)
+ 		goto out_noio;
+ 	if (!nr_units) {
+ 		if (defer)
+ 			goto out_noio;
+ 		folio_mark_uptodate(folio);
+ 		kunmap_local(kaddr);
  		folio_start_writeback(folio);
  		folio_unlock(folio);
  		folio_end_writeback(folio);

--eberLla/3alX7Tas
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqpNLEACgkQJNaLcl1U
h9CN7Af+O/Egcgr2QipxL/Z09rRHzLBcenc4meI8FQs1Yws3813x7D2uNVza5sxC
LtbboVTHpIBoZ1XUMhuxJnt503V9RKaFIf2uJYe1RaTWmdEYzCY/83g7R3nbhKy/
qM4S24To81e7Il8lckSfg+D0walshJrPt24SzndC0TZYNL+5xXeBdwhNYKjT198g
gwedIXm+2c2597uBYVsBNFRhlPDlReafFr9XmEES/58u+Zi3cldqIOgVtZMA7qAu
+vhGnCRdcPjcA4VKInz96awB0NhdPk5JD3tPLRbJI5W+3lbc9y2aYTM6beR4j5IZ
0FucTN37Do9w8RNBNAvlPm2uNWWRlQ==
=DFdC
-----END PGP SIGNATURE-----

--eberLla/3alX7Tas--
