Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ACC5038ED;
	Thu, 15 Oct 2026 11:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792063804; cv=none; b=kKuwmGTX5xUD6bYYq+ic7Xx0yTXvnKQtQeVPYQEEKkwpLoIJPyziJR7T/Bhx3RoEAQBIEerVYu5J7Tx7Kz9rDJ8/vANqYO12f2EygjZnrmwJUDnxxDFoailjxwU03gMmyqDfjFhMCx/KJqw0lXVHD3BsM9X/4bDK3k2sbE4FNik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792063804; c=relaxed/simple;
	bh=HMaYFO72Ds9CYZXbf+wTftDXYra/c5EFO5/hs+Aszqw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s26/aB/zLo5Qk22ThxO3l5LXIWw9P4M1g/BAbeHqgzH0LH5FdOUjmI2v8DWRPdnPNpc8lmCOqPYuQHyF2whH1+rBSPU4p8KMQ/ZcjiPYYUee+I6AUmp5ckpzwStQJkcB74gP53f/s2beGHJKvTCKXU8u4CW1aiak7nfkYZSepUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQLMp1k1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQLMp1k1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33EB81F000C4;
	Thu, 15 Oct 2026 11:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792063802;
	bh=dqRNo4LCVXXpbG5ZKjfaqRpdf/8c4vdQVojtmFkWAbo=;
	h=Date:From:To:Cc:Subject;
	b=OQLMp1k1NT9ywmaJzTVLDyKPk2r78BQAWz9sH2Si41+IV6lZuv4Dj7k6/VTME5Af+
	 dMZDi3t7JFGUwjQLtQMAd7hIOGfk4qa5vcxpxeblrQVDL4uZbZ2qRoG+wxtGM12iQu
	 7zFqe1tylwPXPQ/miAZNbMHEfbNHvuHJWx9OP+tLDV2o+bhuzaAOwOSz/Dwr3gSS4e
	 clViIMC7XOldrcWgJ8hG3TwXXu2dPs7+7NjIHllo39WBz8YyCsjucb2zlOiY4nH3+p
	 KdAE/D7qrzCVXT4pbfxdOs5xYF3/nYRwiSbKcWfkvNmB5P7h9lqhyxhHx2o9gc7Npm
	 r61k+vMWOsbCg==
Date: Thu, 15 Oct 2026 12:29:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Christian Brauner <brauner@kernel.org>, Jimmy Zuber <jamz@amazon.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Miklos Szeredi <mszeredi@redhat.com>
Subject: linux-next: manual merge of the fuse tree with the vfs-brauner-fixes
 tree
Message-ID: <atC5NhpLac79NEpU@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cibiqodwXguocxKB"
Content-Disposition: inline


--cibiqodwXguocxKB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fuse tree got a conflict in:

  tools/testing/selftests/filesystems/fuse/.gitignore

between commit:

  ea1302e285ed7 ("selftests/filesystems: test walks racing the unlink of co=
vered names")

=66rom the vfs-brauner-fixes tree and commit:

  a6ca1a573e1fd ("selftests/fuse: add test for FUSE_HAS_SYNCFS privilege ga=
ting")

=66rom the fuse tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc tools/testing/selftests/filesystems/fuse/.gitignore
index 59739a6e5b99b,b5b03db1118ce..0000000000000
--- a/tools/testing/selftests/filesystems/fuse/.gitignore
+++ b/tools/testing/selftests/filesystems/fuse/.gitignore
@@@ -1,5 -1,5 +1,6 @@@
  # SPDX-License-Identifier: GPL-2.0-only
  fuse_mnt
  fusectl_test
+ test_syncfs
 +unlink_reval_test
  write_extend_eof_test

--cibiqodwXguocxKB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrQuTUACgkQJNaLcl1U
h9CUuwf9ET/VjMbnBjDbMH1DgYpRm51DpgvpXbxLjLEoWJJi4tfk6rwcZoGoP+kZ
0AR1WCdl+H6pzjPFZHfjWH8XxP68V8bTWfynFr59TxyKVWhD4m9Vw2i7NK/Pwge+
AhtZgIC/80tB22X7R8LPMniVFxbyuW3Bqlp78NmjyhY21IME2n9pBToZjVaCwTx2
U+ZaQJhkWoPuNxPanuQi8YIOkLpPv+E/Iy8ScTHcB2E4dGg8fjxga4b+f+85TJIp
RuwWhUnTXmF6EljPc6noFJhFJNpioKFssXGKr2hmHZQDL5drrM5K+sAotfrwMul4
mqeorEPAWNcrudHF0Vyj8xrqGVFVyw==
=U1RY
-----END PGP SIGNATURE-----

--cibiqodwXguocxKB--
