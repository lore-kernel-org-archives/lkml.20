Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146F54ED19E;
	Tue, 13 Oct 2026 13:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897646; cv=none; b=slvsaT6khl8m7VHgeUTGT9V5DL4WJM6TOxQOK81Vqk21IBkKxZFUdWfJOi352xxe6onK3WRhBWw0C4WOEGd/dQxmWOo4hvPjIj11g2doxLfKPXkOIgxncS/4Cz1AdKwlMgJ/nK0wrENRpCVNcCMBfaj1e78F0l8RxbbVC/bb8Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897646; c=relaxed/simple;
	bh=ejnjcy3AxsX2ui/tXwYrcPRdx/DyV3oRuth8ikzUK/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P63VZOEVPxf1gO0wCT8Q7oJcRXoIBMNzAcLSyZgNt1sm66GA/Yo7TD/ioRlb3sXC6duKMnBjD5Pvzb+Y8z6B2HBYDmIJ9YjR4hZ74IT/GLn5LVkq6Q0zgUpAiht8rV49JrQTNcKvJwUL+mRbuyZO5nyY3GDIZSjmR1E3S15q6cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S6tX51HR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S6tX51HR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85B01F000FF;
	Tue, 13 Oct 2026 13:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897645;
	bh=t0Sakcu0MPeQFn0CFQnaU8zXRpEje8K8KSFdYwTsn20=;
	h=Date:From:To:Cc:Subject;
	b=S6tX51HRq8dZCpP/Dd9idvTIRn5g9Tx9XCYbfFVRpgSbBBtN9HIlElQR2ZkvBI3zg
	 no4QUSfSL+JkG9KLhFo/3Hz/tXWGFLkEvbKS2gkuxKlOedz3/CEP+vbZ/w1UaGiqac
	 /5VBcI3SeVBXLEFgX/sso2oys5rUYVSJSOzF4AP07EBUdkY3/Lt7cWQFkqr25iwPRW
	 LfWWDbi+3jxQP1+T13SrjNdjdAzgTafueDWHhBwPOBjjhd9g/tLi08Y1rJxYmmGiNf
	 lEFQJwese7GfzKbWi1hgn5Rl/Qnh+YBqtTDgyoOJ/7EiDt/BKAcR1kGLCy1WLG8icn
	 ux1VyBFNjxgHg==
Date: Tue, 13 Oct 2026 14:20:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
	Joanne Koong <joannelkoong@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the f2fs tree
Message-ID: <as4wKTfgH6Ez0Sc2@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="evHsjh9hILwanQ+L"
Content-Disposition: inline


--evHsjh9hILwanQ+L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/f2fs/file.c

between commit:

  49e9feb15def9 ("f2fs: rename page_count with cache_count")

=66rom the f2fs tree and commit:

  d874f8060847c ("iomap: pass iomap_iter_next_fn directly instead of struct=
 iomap_ops")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/f2fs/file.c
index 1e693f6028474,bd345615956eb..0000000000000
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@@ -5232,8 -5229,8 +5232,8 @@@ static ssize_t f2fs_dio_read_iter(struc
  	 * the higher-level function iomap_dio_rw() in order to ensure that the
  	 * F2FS_DIO_READ counter will be decremented correctly in all cases.
  	 */
 -	inc_page_count(sbi, F2FS_DIO_READ);
 +	inc_cache_count(sbi, F2FS_DIO_READ);
- 	dio =3D __iomap_dio_rw(iocb, to, &f2fs_iomap_ops,
+ 	dio =3D __iomap_dio_rw(iocb, to, f2fs_iomap_next,
  			     &f2fs_iomap_dio_read_ops, 0, NULL, 0);
  	if (IS_ERR_OR_NULL(dio)) {
  		ret =3D PTR_ERR_OR_ZERO(dio);

--evHsjh9hILwanQ+L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOMCgACgkQJNaLcl1U
h9BMHQf/XdkqHrpQuUO0+Z1vCyoIJvu4LRTVunuXtsmD7fCUX1JMDk21BLSs8bnc
HgCAS1WdxCw0+Lh65UihpicRoaVwChgg41ctTzk0CGFFlzYIpGYykxmaiLmfkcyQ
51SSxJ+CMHe+iCGv5yXIWUai+gjFGP9aMtfDTCk2vD4CqGJPXU5uTdnfbAwluYjC
xbOgUunqnCbLBltAbDRTOplHh16Krpz6QBreUdCGhGfYxNKxaMR8tfdnE4s3tMQV
ijYIoQ4H9LGlZGAfc+PSUqryPNAvQJEXOCGHSyI6PBvFW4oEThIb7e5c0J+SFR8C
z9TW3OOoa3eKcPnf6T7Mb7BM3hZE2A==
=ps9n
-----END PGP SIGNATURE-----

--evHsjh9hILwanQ+L--
