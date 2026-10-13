Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916BA38F62F;
	Tue, 13 Oct 2026 13:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898040; cv=none; b=hnGHDnCaRmSxVf/3bvixYeIuKlO2cKt9eeLx8BIWRQfL3DRb+PXeRcAINS976QlWeuwwWHavr/scH4b34gFpsMTNXtZUfOMxCkNBy5MZ04PY6jr7RgwmGhGJ2FCYOcRsZ0h+k2webLlBpiA3NeWpJmz8m9us7Vhh5WrWIn5Kadg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898040; c=relaxed/simple;
	bh=U5tmZUCkksdz7Ug0vuRdt+p+gBOof4picvbKNR/3eYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pt9Iy/n7NZHkydXprN/2B96wJMmYvuF5HTNI/rVYxjQnH9PPJUiPcs/z3qgK2z3XOjfqGDRasfFVaohtFydgPx3mZjF71TaZq0TjFMh2MNEnUyt02/2WhK5BU+Ee+12fZrAn+zKZBIHHEduCZ5DJvN6IPySb9C4epDljnU1I+7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g8m0nAOV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g8m0nAOV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF8F41F000FF;
	Tue, 13 Oct 2026 13:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791898039;
	bh=q+WgYjbunRd1bo3RdDcmm7nlsCNzSb5QYBCBrotQ/xA=;
	h=Date:From:To:Cc:Subject;
	b=g8m0nAOVJZK63pBzMzVDE5YXTF0HomvDgSCO6Uzkgo8PlTyXbnarcRxqmI1cdFxoH
	 JSY/LByhaaPHorJF4fwQTcUY7kBY+mDLejpgXPZV2toKJ02F3VnPYnU8ah9NKmbk8t
	 Eyeky7wP4OmCqstLkyqlrw42rCDPpoKT2h97m7XnUM5UNxVknZkKDsc2CAYd5jjSLA
	 tKLezAOY3CnB46e8tGHWZz7SSusSARIE3MLN1EjLsn440flSB3acpNzFM+y2RMgc1z
	 W+37MXU2rbmpsvWVYjabPUgJ9MGFAPn5CGDt70bT2+aYuifgJvjn8vOwf+mlYdvnFm
	 7naN63FdfbcfA==
Date: Tue, 13 Oct 2026 14:27:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Joanne Koong <joannelkoong@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Theodore Ts'o <tytso@mit.edu>, Zhang Yi <yi.zhang@huawei.com>
Subject: linux-next: manual merge of the vfs-brauner tree with the ext4 tree
Message-ID: <as4xs78VP3JWt9-B@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HWaeAAvGOmF6p4jE"
Content-Disposition: inline


--HWaeAAvGOmF6p4jE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/ext4/ext4.h

between commit:

  8dccd9f0a1a93 ("ext4: implement buffered write path using iomap")

=66rom the ext4 tree and commit:

  d874f8060847c ("iomap: pass iomap_iter_next_fn directly instead of struct=
 iomap_ops")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/ext4/ext4.h
index e6db5a687a5fe,1576c703d96d1..0000000000000
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@@ -4105,11 -4041,8 +4106,11 @@@ static inline void ext4_clear_io_unwrit
  		io_end->flag &=3D ~EXT4_IO_END_UNWRITTEN;
  }
 =20
- extern const struct iomap_ops ext4_iomap_ops;
- extern const struct iomap_ops ext4_iomap_report_ops;
- extern const struct iomap_ops ext4_iomap_buffered_write_ops;
- extern const struct iomap_ops ext4_iomap_buffered_da_write_ops;
+ DECLARE_IOMAP_ITER_NEXT(ext4_iomap_next);
+ DECLARE_IOMAP_ITER_NEXT(ext4_iomap_next_report);
++DECLARE_IOMAP_ITER_NEXT(ext4_iomap_buffered_write_next);
++DECLARE_IOMAP_ITER_NEXT(ext4_iomap_buffered_da_write_next);
 +extern const struct iomap_write_ops ext4_iomap_write_ops;
 =20
  int ext4_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
  		unsigned flags, struct iomap *iomap, struct iomap *srcmap);

--HWaeAAvGOmF6p4jE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOMbIACgkQJNaLcl1U
h9A8Wwf+NyECQdjaCrPqMOqodhqLISYzoSrHIwEne+3tIyPQyatxDHvB83X1t0BX
5qh3H13D8+6k9bHAQ3IbwlhaQKO4MTLZQZ6kBgMNYIkqlwU8zyZtpzM5ZrExgtQ3
Cpnttop0T6cmEuEIRGXkHvr4g5tn5YrzM5E+uuZDVcIdsVZNdKn8ukoUrGuw87VR
rlveqv0J5c4mNo8NuGldfLZoMo89iuvf2Erycq0c9RC91uzEmptC1+MupMZIg+3C
UyRA3fr75toS8CBop5dsM0YvV7xPMzm8GXnJD8zH/mOAId11AYccgP9PLv2jHJAk
RvzEnt/aK2asRhLCRy49tZtFGAb+FQ==
=wu2+
-----END PGP SIGNATURE-----

--HWaeAAvGOmF6p4jE--
