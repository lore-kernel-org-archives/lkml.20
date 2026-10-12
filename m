Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D704BF94A;
	Mon, 12 Oct 2026 17:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791826747; cv=none; b=cTY7EziDT6h02srAebXcJyFiEuDi7ornM12/riJNNXoHJYtmsGZynTYGYy60k2EXeSClgjgxaH4qs5ccP0RZZS8BmZ4r0OA/57Fs1WSt+htXLhEdp71hyHFXP5rFdXq8NAKeVKQ4l4OHkiP59fL0StzOxz/TF0MA4fkPU0bLaHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791826747; c=relaxed/simple;
	bh=9kr14hqP/MsLV50vISvl7zva1ZMUdqxwn1HmrUmrUSc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ipxyT2v+zSI4aFOXpSzmH7FVuxZALdfMLPDWBZhTS1YKB0lLrqXR6afSfocNYzhKIh0xMWwDQUl5q8COorzBj/VjfpvhqGkAjfBMm1vOqMpC4lNhoeGZ0cgAgyvz/ovZw2I9zdpzVHbGZV+O3dLt39/991JUk+fYgnBo8N6w+T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LqgeYVBO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LqgeYVBO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22AEA1F0089B;
	Mon, 12 Oct 2026 17:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791826746;
	bh=QEsfTt2GcmjEVx5DanStcLHKAzcw1IrTfcBinks/8AA=;
	h=Date:From:To:Cc:Subject;
	b=LqgeYVBOoQJwP7EO/ewKuNdvcqm+JSI4V+E3sU6lYX2r94XCalnZ3kg4EO3PKSVFj
	 zHfWvOAuxTB9GNqoTim6y3VaHjARD8tVD91wykuecPzDZmhJH81qx1qUzv9XHjgut5
	 DHyBwb1z48SzthXMS0rcfHHViw8cJ5nJIQe5v2G5I7ki7hfm1IrhFUEwZ9tXEdRFrB
	 s9hcGc5aUqc30xUxXOwQ3nl+rNImvDQJBEqkFGnJKDccID4Xi/PeYiIgFldcd9dpQq
	 3uWoDryo9AhUuCTQqW7mhiSbyp2G6MNYSGAy7pLBUZ1JcLmGLBPd3/l0wYHKtzihhP
	 IvOuy7//tvPiA==
Date: Mon, 12 Oct 2026 18:39:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Johannes Berg <johannes.berg@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the kspp tree with the origin tree
Message-ID: <as0bNtcD02T75gKH@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kxloRsMI3+N9G/aE"
Content-Disposition: inline


--kxloRsMI3+N9G/aE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kspp tree got a conflict in:

  .get_maintainer.ignore

between commit:

  ad7265b29995f (".get_maintainer.ignore: add myself")

=66rom the origin tree and commit:

  e160c4481f60a (".get_maintainer.ignore: Add Kees Cook")

=66rom the kspp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc .get_maintainer.ignore
index d19b725fd803b,5c8b295d647f6..0000000000000
--- a/.get_maintainer.ignore
+++ b/.get_maintainer.ignore
@@@ -4,8 -4,7 +4,9 @@@ Alyssa Rosenzweig <alyssa@rosenzweig.io
  Askar Safin <safinaskar@gmail.com>
  Christoph Hellwig <hch@lst.de>
  Jeff Kirsher <jeffrey.t.kirsher@intel.com>
 +Johannes Berg <johannes.berg@intel.com>
 +Johannes Berg <johannes@sipsolutions.net>
+ Kees Cook <kees@kernel.org>
  Marc Gonzalez <marc.w.gonzalez@free.fr>
  Nathan Chancellor <nathan@kernel.org>
  Ralf Baechle <ralf@linux-mips.org>

--kxloRsMI3+N9G/aE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrNGzUACgkQJNaLcl1U
h9BzZAf+NovhnrJPyPY9k2BCfBTjcs1ejiEkIDaI39jOV754YYNCYo8Jue2xJEYQ
kCjbnrBdNmWrWrCXV9AAdkNzXWNk5om2M2ylpWx9z7QWqkiLtnWVMLbWayIxegyL
g8zY+3GcguB83ufUNwBNVB30lpG5LNEb6zEHphigi+cEmuMOhaZ9CaYS5486NQe8
m9jSCgp0XjbuTM9LdfsygBpeHWgbaHYuSBVGO2vt0zvcP4fY29RZfLIN485ADSl/
sUqgUv5oAaGhX2iR/AMr5tR9NTtvO2m9eX6u2tX7PGogsoRmPGJD8lgpHXVEr63j
elfjMH+MkbP/ZLjQlnaa+k0GGDN6Cg==
=hLix
-----END PGP SIGNATURE-----

--kxloRsMI3+N9G/aE--
