Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8470047CC78;
	Thu,  8 Oct 2026 09:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450347; cv=none; b=IKeShb0OXCKjGp+6BWO4aAe4Cq4cnAyBhWv/CHKGITZeiAaoJRin1KXJw8tM1MWoJsRdo5wt0tslz9dTGBLdhNf4vLw4GczSy2Yyustezh2pJRlLaN0i2WUoMxs7nFEZNfGdbEHFQ4xyTIy8otKWzYlmg/Do8JKfvJZVtorJeek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450347; c=relaxed/simple;
	bh=IjsxDyx9eiEQMVb4ujZpphHQ1W7+BmFGXUvnhVHHQHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lmAHBInRLGgHvDNtnS/1CrT3oB+lKZmZosI8noMJMM4PWTe4i4JYtTpAODWJyc28SeS4iQd4OuJq4EIvLGH+nvqyurqdkCrIsSn1XNXqULKErlpK2S2vYwjm9MdBgi04xG3KyMJeP8X5DAwY1JujZ8mxLijp8MJ4934KYM1EsY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XjI53OhT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XjI53OhT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4E6A1F000FF;
	Thu,  8 Oct 2026 09:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791450345;
	bh=YukIs24ku5eXMFyDrQgCz9IpX8rOpx/Ss8mK/NLt3mY=;
	h=Date:From:To:Cc:Subject;
	b=XjI53OhTtmFpr35J/lOLX+7bINETHnWnTQoN10AjG3lT5xcEOUmqLx20KboiTl4Pb
	 g9zhIGhaa0YeiFUhnyi0gNdJZhJTtVjokHOZddoZlUdxsbQOyeQrmMzjYH7hxa7WKo
	 //E4ZaKx5td7ntsvEVf0ccNPYKLewPxjTb5uUexYRWqTmJVrzXlyObdX74bbxPsU2I
	 dBnFIeSOuHJhqPjrlRr1Enk/NDXI5olAWLB4dDWVpgg+Y2JgkPn9K+QSIXYxddWNCM
	 WnzfbC2D1fgJDd6imOMIcR7TsTTo4FFyOSCQrsH7WDXhHkVzwtRNJ8hvAza8ZJpvrY
	 mSb7a2vvN3tSA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id EA02F1AC57CE; Thu, 08 Oct 2026 10:05:41 +0100 (BST)
Date: Thu, 8 Oct 2026 11:05:41 +0200
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	DRI <dri-devel@lists.freedesktop.org>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: linux-next: manual merge of the amdgpu tree with the drm-misc tree
Message-ID: <asdc5fk-KcV74jnx@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q9xfQlstLeq8UYA1"
Content-Disposition: inline


--q9xfQlstLeq8UYA1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c

between commit:

  6ccc5b5fc1d36 ("drm/fbdev: Move fbdev helpers into client library")

=66rom the drm-misc tree and commit:

  51a4359f7431a ("drm/amdgpu: serialize vblank counter reads against GPU re=
set")

=66rom the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 51a7a4091376b,f34150d20a2f2..0000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@@ -28,8 -28,9 +28,9 @@@
 =20
  #include "amdgpu.h"
  #include <drm/amdgpu_drm.h>
 +#include <drm/clients/drm_fbdev_helper.h>
  #include <drm/drm_drv.h>
 -#include <drm/drm_fb_helper.h>
+ #include <drm/drm_vblank.h>
  #include "amdgpu_uvd.h"
  #include "amdgpu_vce.h"
  #include "atom.h"

--q9xfQlstLeq8UYA1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasdc4gAKCRAv73Ows9A4
iY/qAQDmwHMMWeRccgRE+tTVCTmNuMzLFIdc1NEMD0DF9yctVAEAhB70yDiLSRlv
IUx3V+JGlvl1BTztsQHThX0+M+KplQc=
=eM/5
-----END PGP SIGNATURE-----

--q9xfQlstLeq8UYA1--
