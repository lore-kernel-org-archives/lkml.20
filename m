Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14309437455;
	Wed,  2 Sep 2026 10:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344414; cv=none; b=pt4CYpUWprwtL4Wy1k2Sm6TCLP9+uOI3vnN9hbsviBiJ2N3X822BhhVq90FkBioZDqAExOrr2DdppctbfI8Aiaaf5BtIL0qf28oDVxjyBsPKzM8d1ISvn2KwbQRszGfW+dy/skTZqAr0HzNZw0Og61ViNgC4xia23wmR66Ur4xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344414; c=relaxed/simple;
	bh=v/ptDHe5OsJI0JHF28Bpwbs5jehopDLhAkQs/UUB060=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gABGx4r2XK6kWjKehez0J/uhejdO79457m7z8v3oJVNXCqT5q53JKwK5lvBEmGBa3mrNwa5Iu4oaekWztL39tWDtzhLx9Cb3XbadGc2BaMslFlkWj/XRw4yI2rBjZcjQW4skEodW3oQJHxb2DWNszwqkXBhlhQicaZY4ZkVgBps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UTlPVTxu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UTlPVTxu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0CE91F000E9;
	Wed,  2 Sep 2026 10:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788344412;
	bh=vCQx0OdGoSxtqRyc7gfWb7PjWzwMf9vWt2ncPdZgeMI=;
	h=Date:From:To:Cc:Subject;
	b=UTlPVTxuzj/KMoiIn95NzIEZmtQYJDPbZ7PWHcJ6YjUTRwwYRXMEA4PFtPXHQdWHt
	 FfuvJI6aWEvQ9hQS/qcUVkauCed9nIusXgcld4xT507cXQW3U0MiVHemeVnSObuwn8
	 +CggO0bN09kEJOyrR8Es4Unn+RjWoOCZUxaasSdU0dD0HRfmW38acxdmq1GQvomu+C
	 LtI5hOppuXNtzFSAOo4zGC1AfsHyJgOIKDlTYlE6EN10rw2u6F6y58H6c/HgTrk29Y
	 SPN5YN+fVryFsAsNf0zzIsyEGmwKMiuaRlXKFpmR+A10N7Ak8OBmyl8BOHQbDIDubC
	 1gYBKzAt6FXrA==
Date: Wed, 2 Sep 2026 11:20:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Mike Rapoport <rppt@kernel.org>
Subject: linux-next: manual merge of the mm-nonmm-unstable tree with the
 mm,mm-fixes tree
Message-ID: <apf4WaZ8D0P6W-FX@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2b5CdR+jXzAUKIw6"
Content-Disposition: inline


--2b5CdR+jXzAUKIw6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm-nonmm-unstable tree got a conflict in:

  mm/secretmem.c

between commits:

  0d171c47f2be6 ("mm/secretmem: properly account locked pages")
  a31a4988ca3e8 ("set_memory: add number of pages parameter to set_direct_m=
ap APIs")

=66rom the mm,mm-fixes tree and commit:

  d2c5e077cbeaf ("mm/secretmem: properly account locked pages")

=66rom the mm-nonmm-unstable tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined mm/secretmem.c
index 6cbb8efc994a4,384f5cfc457f9..0000000000000
--- a/mm/secretmem.c
+++ b/mm/secretmem.c
@@@ -139,7 -139,7 +139,7 @@@ retry
  			goto out;
  		}
 =20
 -		err =3D set_direct_map_invalid_noflush(folio_page(folio, 0));
 +		err =3D set_direct_map_invalid_noflush(folio_page(folio, 0), 1);
  		if (err) {
  			secretmem_unaccount_folio(state, folio);
  			folio_put(folio);
@@@ -156,7 -156,7 +156,7 @@@
  			 * already happened when we marked the page invalid
  			 * which guarantees that this call won't fail
  			 */
 -			set_direct_map_default_noflush(folio_page(folio, 0));
 +			set_direct_map_default_noflush(folio_page(folio, 0), 1);
  			folio_put(folio);
  			if (err =3D=3D -EEXIST)
  				goto retry;
@@@ -228,7 -228,7 +228,7 @@@ static int secretmem_migrate_folio(stru
 =20
  static void secretmem_free_folio(struct folio *folio)
  {
 -	set_direct_map_default_noflush(folio_page(folio, 0));
 +	set_direct_map_default_noflush(folio_page(folio, 0), 1);
  	folio_zero_segment(folio, 0, folio_size(folio));
  }
 =20

--2b5CdR+jXzAUKIw6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqX+FgACgkQJNaLcl1U
h9B1rQf/e4fe1+vtHlOrU2eEL8PKe098YrRGrM+ZIqo15eHaBCKu9BYtLgNg9VBb
VV/SB5cXJPMd3rYUVs5AS9UpYY2SibImCtjFnU3w4BKXsdIBnXyLnKBXrFzkj9gv
B87V+1iOvRMYzXlpmUftMyN3ermG9rZBoNQVhXnQ3n4k+1pOKlGXAncR2rVam1nK
bAk81I4mi1L7uoMvmoPMKTe+x2SsDEyUF0YKidQPCSiFiHsDKSJqGoFhc18LGcx8
P+HXkH89ux1GXuveaB9khZxBldL7q6n7ijddrS2We0K64Uoi+WdiNkE/DHfLoHUg
fjPC3BMpQ3z+kqcHgEgCv89gSztRzw==
=ZjiY
-----END PGP SIGNATURE-----

--2b5CdR+jXzAUKIw6--
