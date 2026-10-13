Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359E554705F;
	Tue, 13 Oct 2026 13:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897721; cv=none; b=YViActl/oMJTvuEd8QtzQ6oYid9J/n2JNAqnSCpXr0furPxMdUSES374x6hjYfCEWTpvsKzRRb9J1gN64kl7hOMf94p7dU3yuwAyTgioyvpTZ+tq/uajthYIkPxvLJu54uGo8WbmzuqdPmGrAtUz3heQog/H912wufpoBlRJKg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897721; c=relaxed/simple;
	bh=upOhK9I2FFT8UzgMZ11d/W/epZw3p7iY4vHTwOHESmA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cju/oII8OyHOX5L/UBJrZAMdE/cTlOGktm/w9bm8Fulgv5YkBUO7fshlp2wYbfdROQKROY1kD7/QBqrU0XUYFDrMf+bG4XGnzw+mkrTE4C/e76tKyc6Mcxd0/BhKpqQbxVD0LlyqMA19/enHz7fbiRT6DMkCDhH9FeFlyjE7elo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cqyl+Klq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cqyl+Klq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 940421F000FF;
	Tue, 13 Oct 2026 13:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897719;
	bh=Gd5Ye9VKlB7pDN3VUn110+GQBWGOuZ252LR22fN+nek=;
	h=Date:From:To:Cc:Subject;
	b=Cqyl+KlqrvpSxkl7uMertb107OIeN4080pGqlQpXv+hyFhMoT9OyDN1JqiiJycDhS
	 yZOJTjiJ/Nb49g8oHKQR7VOqcNnmYeJ8BswOgrBoqBcW49x7ljRSK/ARLwsz7sVdVB
	 RrimzLRo/sKtMA1G2yxq75G2jptrdmvyvtqBuxtwJbuuSw7BPUulsmiQzxgXpYEmxf
	 FoM3G8L+JrfQioP8RFiZ0LoYc9Y3HKYkp6AkIoRzUJkZ6Kgxdqww3PTUr5jcWS6mBA
	 EzMpTbvuAXQ4gTXpySc0gBwWGBHvuS+iLjoYDwK1nxgGzMj8BJIuruUkbu05RFj2UF
	 QUzcV4PN+t3lg==
Date: Tue, 13 Oct 2026 14:21:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Joanne Koong <joannelkoong@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the exfat tree
Message-ID: <as4wdHTj_PDybbSd@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HuNoyPpTwxhQLah9"
Content-Disposition: inline


--HuNoyPpTwxhQLah9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/exfat/iomap.c

between commit:

  80e764ecaf029 ("exfat: map allocated extents for swap activation")

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

diff --cc fs/exfat/iomap.c
index e50ecbfbfbe0f,72cdfe37bcf91..0000000000000
--- a/fs/exfat/iomap.c
+++ b/fs/exfat/iomap.c
@@@ -160,56 -148,11 +160,52 @@@ static int exfat_iomap_begin(struct ino
  static int exfat_write_iomap_begin(struct inode *inode, loff_t offset, lo=
ff_t length,
  		unsigned int flags, struct iomap *iomap, struct iomap *srcmap)
  {
 -	return __exfat_iomap_begin(inode, offset, length, flags, iomap, true);
 +	struct exfat_inode_info *ei =3D EXFAT_I(inode);
 +	loff_t valid_size =3D exfat_get_valid_size(ei);
 +	loff_t end;
 +	int err;
 +
 +	err =3D __exfat_iomap_begin(inode, offset, length, flags, iomap, true);
 +	if (err || flags & (IOMAP_DIRECT | IOMAP_FAULT) ||
 +	    iomap->flags & IOMAP_F_NEW)
 +		return err;
 +
 +	end =3D iomap->offset + iomap->length;
 +	if (end >=3D valid_size ||
 +	    round_up(end, i_blocksize(inode)) <=3D valid_size)
 +		return 0;
 +
 +	/*
 +	 * Zero the invalid bytes from valid_size to the end of the block
 +	 * to prevent stale data from being exposed through the page cache.
 +	 */
 +	return iomap_truncate_page(inode, valid_size, NULL, &exfat_iomap_ops,
 +				   NULL, NULL);
  }
 =20
- static DEFINE_IOMAP_ITER_NEXT(exfat_iomap_next, exfat_iomap_begin);
-=20
- const struct iomap_ops exfat_iomap_ops =3D {
- 	.iomap_next =3D exfat_iomap_next,
- };
+ DEFINE_IOMAP_ITER_NEXT(exfat_iomap_next, exfat_iomap_begin);
 =20
 +#ifdef CONFIG_SWAP
 +static int exfat_swap_iomap_begin(struct inode *inode, loff_t offset,
 +		loff_t length, unsigned int flags, struct iomap *iomap,
 +		struct iomap *srcmap)
 +{
 +	/*
 +	 * Swap activation needs the physical mappings of preallocated
 +	 * ranges. Do not report the VDL tail as a hole.
 +	 */
 +	return __exfat_iomap_begin(inode, offset, length,
 +			flags & ~IOMAP_REPORT, iomap, false);
 +}
 +
 +static DEFINE_IOMAP_ITER_NEXT(exfat_swap_iomap_next,
 +		exfat_swap_iomap_begin);
 +
 +static const struct iomap_ops exfat_swap_iomap_ops =3D {
 +	.iomap_next =3D exfat_swap_iomap_next,
 +};
 +#endif
 +
  /*
   * exfat_write_iomap_end - Update the state after write
   *
@@@ -325,10 -267,5 +317,9 @@@ const struct iomap_read_ops exfat_iomap
  int exfat_iomap_swap_activate(struct swap_info_struct *sis,
  			       struct file *file, sector_t *span)
  {
 +#ifdef CONFIG_SWAP
- 	return iomap_swapfile_activate(sis, file, span,
- 				       &exfat_swap_iomap_ops);
+ 	return iomap_swapfile_activate(sis, file, span, exfat_iomap_next);
 +#else
 +	return -EIO;
 +#endif
  }

--HuNoyPpTwxhQLah9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOMHMACgkQJNaLcl1U
h9Dbzgf/eSZ3ZXajlvyE7i4yfPVgxisnpMx/SWHt4F50dDZ8rEdtEEvB3oT6HsZ5
uhvovThz6ujKChLUXw704oVNs1BEQw8CnXf7DToG2Q+avXvpE3iSv7zE9FE9oyWJ
jmNvVRy/wS8F9GdtRo2wMbTQiz8HRczfoDt2QrARNjaELmXkx9D8Tndw6/udw0Qd
Pag96oeNhx7et6B1PRq3ksA4eeTSsSq0BHV9J2tjRf7ZDliIoRHb/Mqr986uj/eA
qeQrut4bFLJqt/12CZRY3Hf00ttuP7Y5WpHrXxz1X3jlqQJzgE7MIkn6WissBw+i
TJsz9P/5e1/nuzuakaKhQ2QLLrmc8A==
=54ll
-----END PGP SIGNATURE-----

--HuNoyPpTwxhQLah9--
