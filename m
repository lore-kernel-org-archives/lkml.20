Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857151;
	b=puatiTi/xQ2etQvT/EJpW73fgk+fC5pfx41mQgeb5lEouKJd8LMkm/8qUK9kBFWVTfWF
	 wn9lq6fvEd04n0iMj8pBJu30aMQxiz5Lcyus9wGB9jA1Ab3Ag+TkyvzcatYjy6XDVICan
	 sB3aBxAHhBrEb5qERMIvg3u3OJzfGxWsF3UMY6NxUQEKEuSek/guCCbBFV2Bw/4411N8E
	 OftM5amS7nzAxXGHb6zElppXxOuwWY9+79RKUwKYupgBuasuSIr/FCeoPWLExJkUw+Pwi
	 x3ojdntUtM/pm1nSoyic1jvykc//HApFYz0LZ7oIFbb4O8YnbTjJAqPZ8f0hoS5RD9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857151;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=hGIwThsEee4Yo1JiKlH6q1IsBKf9e7+VvtVlMSpT8+4=;
	b=t02fr48ZRphCvmDnVeMlERGmF18KiISeLfOBwBcjaAm+uHZf2cCsOxlKiprS/+poKs3P
	 EN7FyVzojucF4ICqhFobmC4l6tKNc37U5C+TB8UfahnOjgAQhlforA0BvpgbxfQEPOyhX
	 Q3CJQfctzdixvQen58kmaoNfzunWLJ3g9leurcBQDkIXJ6MljGnS5macvKRKAxPbHPvIU
	 jw/BLffH+bjrW/dY+aRMflmc6dLX7QJ47HTJuKuCvO+FK8xKI/b9zo7R00p9NdP+CjQKm
	 3joFvmxNitTbDwXCkRcDqtoy7iaCSn1zh+fHShHQ+MUozd/nYJB4AUZU68osbfrm4+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UNgz38Jm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9ACC606A322;
	Mon, 16 Nov 2026 19:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UNgz38Jm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3FE41F000C4;
	Mon, 16 Nov 2026 19:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794857151;
	bh=hGIwThsEee4Yo1JiKlH6q1IsBKf9e7+VvtVlMSpT8+4=;
	h=Date:From:To:Cc:Subject;
	b=UNgz38JmGtM5Of4z0gBRF8Kz/AlOiYuPdVJLAw8FnxLYZHTHR2oZC5a0l69eGkhWd
	 ORLj2mRiWo/S0jFMllUwEEnQnb8po/D9eRnXAcSsEehiVGHZoGnOK7Y/Oxol8GlrB6
	 t8D8yxR1CvAvGYJLGVdthfd2FHcJva9ZI1fTEWsI9knnOC9o5KcNus4dldR5f2AEE3
	 mhFcz5AbdrqEDbqn2hkzo3Z5BTbtgccR6hWQ7ys2Bf2f/u1igRxk5pinOi6u0OQACl
	 ImqZvmhOJdIpe0rlPQbVCAFlypKjoBNFzl/VjbPb4zBtS4zHM5g5DpaZJs2dICcR7y
	 AeSzXKToxE+5Q==
Date: Mon, 16 Nov 2026 19:25:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Daehyeon Ko <4ncienth@gmail.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the tpmdd-keys tree with the
 mm-fixes,rxarray tree
Message-ID: <avtYu0Ze50s_CtFu@sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H0zs3rcOiSUY9Zd4"
Content-Disposition: inline


--H0zs3rcOiSUY9Zd4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tpmdd-keys tree got a conflict in:

  lib/Kconfig

between commits:

  37ff457ec4679 ("assoc_array: discard shortcut when collapsing a leaf-only=
 node")
  29f1617aa1dbd ("rust: rxarray: add rust xarray support")

=66rom the mm-fixes,rxarray tree and commit:

  1dbbde3bc4b80 ("lib: Remove assoc_array")

=66rom the tpmdd-keys tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc lib/Kconfig
index 001ee3c064a5f,f70382dbb1595..0000000000000
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@@ -349,31 -349,6 +349,17 @@@ config XARRAY_MULT
  	  Support entries which occupy multiple consecutive indices in the
  	  XArray.
 =20
 +config XARRAY_RUST
 +	bool "Rust XArray (EXPERIMENTAL)"
 +	depends on RUST
 +	depends on EXPERT
 +	help
 +	  This builds the Rust implementation of the XArray (kernel::rxarray).
 +	  It is an experimental reference implementation under evaluation and do=
es
 +	  not yet cover every feature of the C XArray.
 +
 +	  If unsure, say N.
 +
- config ASSOCIATIVE_ARRAY
- 	bool
- 	help
- 	  Generic associative array.  Can be searched and iterated over whilst
- 	  it is being modified.  It is also reasonably quick to search and
- 	  modify.  The algorithms are non-recursive, and the trees are highly
- 	  capacious.
-=20
- 	  See:
-=20
- 		Documentation/core-api/assoc_array.rst
-=20
- 	  for more information.
-=20
  config CLOSURES
  	bool
 =20

--H0zs3rcOiSUY9Zd4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr7WLoACgkQJNaLcl1U
h9C+Kwf+IyCpTsykmkC3jAyGNBys7gqhyyPR8+7gLqrkFweV4Yz46kzEDt1obvtU
SuTEDbeQufIU2Bx66XIWqce5RGMB/NqbvQfIqCLsK6azKTluiNNTm4oGat6pI4ci
JWw40NGMK1LXZDycnpljTy32hnl27V/aLRfPNjW7WuvmnK9/kd8efbm0dyImy9jM
nUhJe8QjR6Eh5JR16/wiQtbhEn29QhYHS90QIxywPxLqU1KsIOdG5aJ+cL2J8y72
+dDgS3zq3HyGDj3QfxAvxJY4kM1hmdD89vrHvinXATArqnOFZbkx/tYvEMdZzCSs
OZ3F4PBdZQTvUjqdAiTiehDDScVrqA==
=AfNJ
-----END PGP SIGNATURE-----

--H0zs3rcOiSUY9Zd4--
