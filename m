Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F68442B06;
	Tue, 13 Oct 2026 13:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897708; cv=none; b=pRyXdRMJbwklgSpvcQczgUG679gmn8ERAw7zk7vaDfQjo84GhXat6rrlGzGVbF6gsB+dAbenPGMODWaNDA5WMh5JAcIllz0KZkgCE34LPIrLvx1RmKc+8C4XnUdhlG7JrlmaB64dgg6g+k4B6nxKCy9Jcglmt/s8N5f7agZ0ZRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897708; c=relaxed/simple;
	bh=2ssqL6I1wA9w0BdNW3HOgiDIgw5/PeI3361KCKN5UHw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y5e2vXh4nzG/aM5uaq9NB/jwPJwXuVAGNcLVyIoUxe3k7qbRuALQXErXuPE+aK19lmYN4sCc/Q3jOfCTkzgBTURwyfv+ECSqAix5GF7RnkkPbQxERg1T2BmecSwHWAa91gR6fKwt5mx19ad2J8yORomjbFzbeVl3G8HdGTCnY4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FPc3H4Tk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FPc3H4Tk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17F0E1F00893;
	Tue, 13 Oct 2026 13:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897707;
	bh=BSgky8Vv5XUYn9IIBe0B5k7I1Q5euGrXMr/Evg+Iu0Q=;
	h=Date:From:To:Cc:Subject;
	b=FPc3H4Tkw3/CICkSWBIi3zWRtC+oJz3Plf/iYNbDIYsRbC5CT3NTViT65t4Vfzadu
	 DcVo6po2SuDKXyQfuUZD1c6Hl084PKT9NZnEOrcPg0fukQQEbsuJkHqQvnMRLhLUr/
	 3cpUYw47Bezw72SBpPkHOeAbYVtcTVm7cvAU6kwyzc6AiLyjnJnZjd+k3yKBtmzD6b
	 NxFM5vEHCuXqNtxqtG+F6gkBuidUwjweZ4ynqyESItcjG5EtzriC4f4sDI1q2fu2UB
	 VUY+1fhMKeDnDEUP+Gte1fT7Kdie9tJH/vT/gN+W89hr334HtHsHKccr74NKPiHVHK
	 4jirFadtBceKA==
Date: Tue, 13 Oct 2026 14:21:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Jiale Yao <yaojiale02@163.com>, Joanne Koong <joannelkoong@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the exfat tree
Message-ID: <as4wZyJGLZ-u1ldu@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="28zJca9bmH4iMu0J"
Content-Disposition: inline


--28zJca9bmH4iMu0J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/exfat/file.c

between commit:

  9965754d857fc ("exfat: drain in-flight DIO before buffered writes")

=66rom the exfat tree and commit:

  d874f8060847c ("iomap: pass iomap_iter_next_fn directly instead of struct=
 iomap_ops")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

The fixup below is obviously part done, and I had to do subsequent
fixups on top of that due to wider semantic changes.  Together with all
the other conflicts today this merge has been an absolute mess, it seems
like we could use better coordination here.

diff --cc fs/exfat/file.c
index f106db945d8dd,188d921aacd13..0000000000000
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@@ -712,42 -654,98 +712,102 @@@ int exfat_file_fsync(struct file *filp
  }
 =20
  /*
 - * exfat_zero_new_range - zero [start, end) without overwriting uptodate =
blocks
 + * exfat_prepare_valid_range - populate and dirty folios covering [start,=
 end)
   *
 - * Uptodate blocks may contain data written through a shared mapping beyo=
nd
 - * valid_size.
 + * Populate missing blocks via the read path, which zero-fills data
 + * beyond the current valid_size and skips uptodate blocks.
 + * Mark entire folios dirty so the newly valid range is written back.
 + *
 + * Call before advancing valid_size.
   */
 -static int exfat_zero_new_range(struct inode *inode, loff_t start, loff_t=
 end)
 +static int exfat_prepare_valid_range(struct inode *inode, loff_t start,
 +				    loff_t end)
  {
  	struct address_space *mapping =3D inode->i_mapping;
 -	unsigned int blocksize =3D i_blocksize(inode);
 -	loff_t pos =3D start;
 -	int err;
 +	loff_t next, pos =3D start;
 +	struct folio *folio;
 +	pgoff_t index;
 +
 +	if (pos >=3D end)
 +		return 0;
 =20
  	while (pos < end) {
 -		loff_t next =3D min_t(loff_t,
 -				round_down(pos, PAGE_SIZE) + PAGE_SIZE, end);
 -		struct folio *folio;
 -		loff_t bpos;
 +		index =3D pos >> PAGE_SHIFT;
 +		next =3D min(((loff_t)index + 1) << PAGE_SHIFT, end);
 =20
++<<<<<<< HEAD
 +		balance_dirty_pages_ratelimited(mapping);
++=3D=3D=3D=3D=3D=3D=3D
+ 		folio =3D filemap_get_folio(mapping, pos >> PAGE_SHIFT);
+ 		if (IS_ERR(folio)) {
+ 			err =3D iomap_zero_range(inode, pos, next - pos, NULL,
+ 					       exfat_iomap_next, NULL, NULL);
+ 			if (err < 0)
+ 				return err;
+ 			pos =3D next;
+ 			continue;
+ 		}
++>>>>>>> vfs-brauner/vfs.all
 =20
 -		if (folio_test_uptodate(folio)) {
 -			folio_lock(folio);
 -			if (folio->mapping =3D=3D mapping)
 -				folio_mark_dirty(folio);
 -			folio_unlock(folio);
 -			folio_put(folio);
 -			pos =3D next;
 -			continue;
 -		}
 +		folio =3D read_mapping_folio(mapping, index, NULL);
 +		if (IS_ERR(folio))
 +			return PTR_ERR(folio);
 =20
 -		/*
 -		 * Zero not-uptodate block runs. iomap_zero_range() requires an
 -		 * unlocked folio, so recheck ->mapping after each call.
 -		 */
  		folio_lock(folio);
++<<<<<<< HEAD
 +		if (folio->mapping =3D=3D mapping) {
++=3D=3D=3D=3D=3D=3D=3D
+ 		bpos =3D pos;
+ 		while (bpos < next) {
+ 			loff_t rstart, rend;
+=20
+ 			if (folio->mapping !=3D mapping) {
+ 				folio_unlock(folio);
+ 				err =3D iomap_zero_range(inode, bpos, next - bpos,
+ 						NULL, exfat_iomap_next, NULL, NULL);
+ 				if (err < 0) {
+ 					folio_put(folio);
+ 					return err;
+ 				}
+ 				folio_lock(folio);
+ 				break;
+ 			}
+=20
+ 			if (iomap_is_partially_uptodate(folio,
+ 					offset_in_folio(folio, bpos), blocksize)) {
+ 				bpos +=3D blocksize;
+ 				continue;
+ 			}
+=20
+ 			rstart =3D bpos;
+ 			rend =3D min_t(loff_t, bpos + blocksize, next);
+ 			while (rend < next &&
+ 			       !iomap_is_partially_uptodate(folio,
+ 					offset_in_folio(folio, rend), blocksize))
+ 				rend =3D min_t(loff_t, rend + blocksize, next);
+=20
+ 			folio_unlock(folio);
+ 			err =3D iomap_zero_range(inode, rstart, rend - rstart,
+ 					NULL, exfat_iomap_next, NULL, NULL);
+ 			if (err < 0) {
+ 				folio_put(folio);
+ 				return err;
+ 			}
+ 			folio_lock(folio);
+ 			bpos =3D rend;
+ 		}
+=20
+ 		/*
+ 		 * Dirty only a fully uptodate folio. Dirtying a partial folio could
+ 		 * write uninitialised cache contents over valid on-disk blocks.
+ 		 */
+ 		if (folio->mapping =3D=3D mapping && folio_test_uptodate(folio))
++>>>>>>> vfs-brauner/vfs.all
  			folio_mark_dirty(folio);
 +			pos =3D next;
 +		}
  		folio_unlock(folio);
  		folio_put(folio);
 -		pos =3D next;
  	}
 =20
  	return 0;
@@@ -813,9 -807,7 +873,9 @@@ static ssize_t exfat_fallback_buffered_
 =20
  	iocb->ki_flags &=3D ~IOCB_DIRECT;
 =20
 +	inode_dio_wait(file_inode(iocb->ki_filp));
 +
- 	written =3D iomap_file_buffered_write(iocb, from, &exfat_write_iomap_ops,
+ 	written =3D iomap_file_buffered_write(iocb, from, exfat_write_iomap_next,
  			NULL, NULL);
  	if (written < 0)
  		return written;
@@@ -894,21 -887,13 +954,22 @@@ static ssize_t exfat_file_write_iter(st
  		}
  		if (ret < 0)
  			goto unlock;
 +
 +		pos =3D valid_size;
  	}
 =20
 -	if (iocb->ki_flags & IOCB_DIRECT)
 +	if (iocb->ki_flags & IOCB_DIRECT) {
  		ret =3D exfat_dio_write_iter(iocb, iter);
 -	else
 +	} else {
 +		/*
 +		 * Prevent concurrent direct I/O and buffered I/O to the same file
 +		 * range. Wait for in-flight DIO to finish before dirtying pages.
 +		 */
 +		inode_dio_wait(inode);
  		ret =3D iomap_file_buffered_write(iocb, iter,
 +				&exfat_write_iomap_ops, NULL, NULL);
+ 				exfat_write_iomap_next, NULL, NULL);
 +	}
  	if (ret < 0)
  		goto unlock;
 =20

--28zJca9bmH4iMu0J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOMGYACgkQJNaLcl1U
h9CiCwf+Kn9+yS5j8CvAY/C6WGlkThncTAKUdeWok6NJzjN9vizbBc6CuCZmuDY4
xbnO33K7NSpCoeVIbpjPWDAdH8fD41Uc3vHx8aMGgnqUgdfElXRsE6FIgsVFPB3H
iYzOsaHeSB6ayNM6wELwDBu/55emRkqc1WV2xONO8KtZhjcha9JeEkXEqM/tHuFY
w9FVQGyboMOQf3EqlBfSesiMKiqDLlOHmS0uCYw7FMckM7dXkHbYP0ni55J34Tgn
XFjxCb8BKHfAcyiMQ6dmyMpM9exmwgGV/ZM0u6i4sX/txLhSm0oKr52johccqYdC
9JWvEkJ29cgwwNAsHaBh+5s4ugo1Uw==
=xMpk
-----END PGP SIGNATURE-----

--28zJca9bmH4iMu0J--
