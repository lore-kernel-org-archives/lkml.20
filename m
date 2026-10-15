Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF67C42125A;
	Thu, 15 Oct 2026 13:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069425; cv=none; b=ktD7cSUv3kny8Ij6PT5a+a1QAs1hNp6lGGfoadUAN9+1hHZUPLa0kuXX03dpXBtmjxIZLLoEegJKGwt7VAbSgOiA8tkxF7Sd4UTzbXphCuvMPMt3c+zrz6eXy6MpXYjLOlTdOvwpitkmHvXFkbzgliSXmKvInXZOL3xe0cchdSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069425; c=relaxed/simple;
	bh=tQvnPHmIgzcRK8h2t9lSqTK8xX5/TK+pMi3oHQb3Trc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QEVWuGIvaGI73ybxTqB/iAMsq88vCEIwhByJ/jnttrHFJUxMinFmkQ8RTBqtxPwRzwsDvx9QUHvifFFdxwzk20ovOE6F/bj7Rz9qgKmp9EHfMdvfjUazUxxfXVa/j/G4IGTxlVMGPbRpnyBBU1JkiA3sAHBgVwLCTvqmhOGJvUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tqsdf07X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tqsdf07X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6171B1F000C4;
	Thu, 15 Oct 2026 13:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792069424;
	bh=bunlwajOetrmnYf9ny1hT1imCQsIXnS2QyI1vpqiq1w=;
	h=Date:From:To:Cc:Subject;
	b=Tqsdf07X9753O1QUzh+kv8KBS/cPQyZDV2pjmmXigiYrQmHsa1oTnwuFimJNJ/5BF
	 j0+vvjn9txn9d1T5AMY/Mkd3BQEb6obFayftHXamtcrHbJvh1SFaSx/H/Bx60GBPev
	 pUhEXU/RHvMh8ulQkgA3bFnIk+4QooEmWkRSCxTD6zM0MDn3Y2uKuVxKcbVFbFlU4e
	 +IxSLb5Bn/Gqut6i9rXEVuPzXn06LF5FqXrJVxFgUZjcEp1eleY/2/ne5oXpQghCBL
	 5VBl3UJR43uWQ5TtAq4CriH4lVAvyAqI59Xa2Yo1WhSZzfaKrgsZG1k5w7VMVYwDEz
	 OQ+glv61gXNBQ==
Date: Thu, 15 Oct 2026 14:03:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Zhanjun Dong <zhanjun.dong@intel.com>
Subject: linux-next: manual merge of the modules tree with the drm-xe tree
Message-ID: <atDPK3Tz7cNWdtDA@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="voOosfS5jhpgDEb8"
Content-Disposition: inline


--voOosfS5jhpgDEb8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the modules tree got a conflict in:

  drivers/gpu/drm/xe/xe_guc_log.c

between commit:

  149f81d8a73ea ("drm/xe/guc: Compress GuC log and CTB dump with zstd")

=66rom the drm-xe tree and commit:

  291a8fe5d999c ("drm/xe: Include error-injection.h for ALLOW_ERROR_INJECTI=
ON()")

=66rom the modules tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/xe_guc_log.c
index 90aeaccea596c,6f0739204d9e2..0000000000000
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@@ -5,10 -5,7 +5,10 @@@
 =20
  #include "xe_guc_log.h"
 =20
- #include <linux/fault-inject.h>
+ #include <linux/error-injection.h>
 +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
 +#include <linux/zstd.h>
 +#endif
 =20
  #include <linux/utsname.h>
  #include <drm/drm_managed.h>

--voOosfS5jhpgDEb8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrQzysACgkQJNaLcl1U
h9DZfggAg7Qc6hNRbd/owvc1n0nx24w/nGSMUKsrBni0a6RCgAdP7z1V0+IjxjgL
++LsePYhSEXNyvDEpn716iICad5GVLklF2hF5Ir/bE60bk+VjhEzBZLfvjLTmHem
cupuSVKNh9+vqO/du+5oARnslXvb8DeSEYB3AMwJwL1tplAFUPq0Ze5fIWp8V3+M
avQZF8+s0nHanCAHxW4ETsA/oZd63VUqULma7bM+fboezhxxFEkliNY5rJg+VlcB
8CPvAOz/cj5K9gxItDTBZBaX3PQkj/zeGP/iKDomxJ/axyRJSbLriTCsQbYZSJDZ
MdrBTa+gX61fVSdzS3deh2ftEGApCw==
=gwOq
-----END PGP SIGNATURE-----

--voOosfS5jhpgDEb8--
