Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A218A4BD373;
	Wed, 30 Sep 2026 12:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790770428; cv=none; b=lMt7NpV2DjlYB/VxuCqkMtki2KFx4sWzOnSnpi3R4aS7ViQOLySmNyqR+Ix9IYWV5NJrBpBom7+gcbl4JMwj3KBRbyGJtUxpm8qNRZ+BEcyJ1SJsTITd7u8wEGqHMQ8fQcFxNbQ4iddSaPd6LGuM5DXcayzUkHASUvCb2fwgFIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790770428; c=relaxed/simple;
	bh=9FpGNfTFf1S/Ukozb67nQJXbP8V2TJQFVE0zX2bbHBY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OeLvC4rPn0HKeXs9nW8ZmpDpxVixq9YtnWrtbdxF2mFuFfIAmkzGwRA9fRwBk0+ZKqsuiFG5VPmYCvN97cJqPb30MtLILlfIvgRs3hINpjUUqLo8X0AyZ1IYZJm7yBiwONjIDJzGDP1misn03poClmbvy1CWl8VMNVs4G+hX5mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y+ExrBuL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y+ExrBuL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC491F000FF;
	Wed, 30 Sep 2026 12:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790770427;
	bh=gEn//jDKdqgWTRAHO+zQ8xWN0dXBaFIBswswlPw/Wz4=;
	h=Date:From:To:Cc:Subject;
	b=Y+ExrBuL9okLGt9u0+nXvwi0E5uSMFG18nKoa13dFHyynoVzXh79GFdxLJJsL8xm+
	 Qph5z70wXr+8ljRqoMqYNdcQpSUyFKPu08nQ+P2Grqq3nP7s/xU9+LM4UDiK9t8jSP
	 LwKjMQEH0eI+30U1U5CvjEQC+iKvSrp2n2lIyLyxEMPvMaPUxhbz4gq2kP4+OilQjh
	 879nZxR/f9yR0VEOX7pAjL/r/sQgDqJlF8BS5q4YTiRystM3WdD4dS6Kc8ZU4QPyCB
	 3y253WTA+8Wl2Uf5S0qd46g/LaQ6GII6G4+UZF7qgSBpNo16HqXQ3HzZNrFetP2fma
	 q0PS1ddp+YY2w==
Date: Wed, 30 Sep 2026 13:13:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Norbert Szetei <norbert@doyensec.com>
Subject: linux-next: manual merge of the rdma tree with the origin tree
Message-ID: <arz896tY_DVOs8sP@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W6xSrHRgh371D+3u"
Content-Disposition: inline


--W6xSrHRgh371D+3u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/infiniband/sw/rxe/rxe_verbs.c

between commit:

  ae36a5b609ae7 ("RDMA/rxe: validate access flags before swapping the MR's =
PD")

=66rom the origin tree and commit:

  2dac7006b9fb4 ("RDMA/rxe: Reject IB_ACCESS_ON_DEMAND changes after MR cre=
ation")

=66rom the rdma tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/infiniband/sw/rxe/rxe_verbs.c
index 3864284522ebc,21855274f63ae..0000000000000
--- a/drivers/infiniband/sw/rxe/rxe_verbs.c
+++ b/drivers/infiniband/sw/rxe/rxe_verbs.c
@@@ -1331,12 -1331,12 +1331,18 @@@ static struct ib_mr *rxe_rereg_user_mr(
  	if (err)
  		return ERR_PTR(err);
 =20
 +	if ((flags & IB_MR_REREG_ACCESS) &&
 +	    (access & ~RXE_ACCESS_SUPPORTED_MR)) {
 +		rxe_err_mr(mr, "access =3D %#x not supported\n", access);
 +		return ERR_PTR(-EOPNOTSUPP);
 +	}
 +
+ 	if ((flags & IB_MR_REREG_ACCESS) &&
+ 	    ((access ^ mr->access) & IB_ACCESS_ON_DEMAND)) {
+ 		rxe_err_mr(mr, "cannot change IB_ACCESS_ON_DEMAND\n");
+ 		return ERR_PTR(-EOPNOTSUPP);
+ 	}
+=20
  	if (flags & IB_MR_REREG_PD) {
  		rxe_put(old_pd);
  		rxe_get(pd);

--W6xSrHRgh371D+3u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq8/PYACgkQJNaLcl1U
h9BzjQf+NpglwU/5aamvKtH8YhZ+FSlYuNu+K31DH4vvDDnJCtoAe2j/07gZMu1s
Y2nay3sUeivZ5Nhqxfqe/1KQoinvL5SLuahRaW671VNjIq7zU/K+P5Sna32LXev7
jbjmiWIvKHUtEqa/IIuymUkBAUHfFKzyIGoLIMe8IkffzIK+DH4MgKPq6iJGMWzr
Mn1K41ui87ABuY48o01dz1+FysFqrD+Q9E90R7x/nHm2pbR6ZnivWS81/rf1TjcO
Cq+eOjLmaCyTf+S5suXSVnQ05mu2aVL/b1gNb1PCBYmlQRrJM3yVu4YaB81SjYIE
H+vBuCNtFZw7qv+fgYnrCFu4Fp4U/w==
=88iT
-----END PGP SIGNATURE-----

--W6xSrHRgh371D+3u--
