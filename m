Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9439047F3B3;
	Fri, 25 Sep 2026 16:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352631; cv=none; b=Dugc9jvHEIydX+zzRYmWYHKVxos+tIyvgZMJpgkzqfMJnAwFyZHlOyFhBs6zngYFvjKj0ISaQebVsB/b3mh6QfM+VyETPnZs8Rz4W+jlRWzqIZWmOQ/OS1X7r9ahft7Hu+UV2f0jB2KpFXzlpEtF5db0Q/xnV07RD8SUwwSsO1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352631; c=relaxed/simple;
	bh=2YilLW+Lf8321k8yEFum6pZCoezxNkPc9Kx7B4F3RCk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KG20S5mbAn3p+Poy3poJOTBETVdpw0ZnWdfQ43qDppxZwl4h0oPYbBnzJUoRRFoy6f46Uu4LZvsQGad8irXa0D/dqyxcL+P6sd14mGNi20isaS06lka/Qtv43F1djOxKj++7iHTAnjV+1NL0E9ZB8aNpFQ+wFd46WyUCOSfGAp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LC6ptWpv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LC6ptWpv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C6A1F000FF;
	Fri, 25 Sep 2026 16:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790352623;
	bh=nKizajAm4uaxbZtXZ+L6jUEviLS3NMBzS4jOIEjKk2E=;
	h=Date:From:To:Cc:Subject;
	b=LC6ptWpvDEKr6F1cO8B1wpo32etcZG6Cf7rMy/rjg5EMNUlGDQba78U0eLR+8aMla
	 pxYhSFua4PuIrywQxF1pJ7xplp5NFZOu8J8rIW9/V0U5MQCTi700/zaqAboIu9/i0B
	 SwpzPP4ZpG7RwQ1hLB9lPVftsx1GYTPJWXkbiHkJBz94TrITtn3i6BTlndSfoX8MKf
	 Yr9WPfB+C1lDkWic2u1gNvL5LcCwRetoqjKRPQYpQhDOr8EY9yVyBK6tSM/LAYYGm+
	 OcCOp17opysJzQlNSbuGaduFyTFPvrgE0O38TWFQb1nlMkbAcYXdkuoIbnlplwE9el
	 mDsg4MdocoXkg==
Date: Fri, 25 Sep 2026 17:10:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Alex Deucher <alexdeucher@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: linux-next: manual merge of the pagemap-headers tree with the amdgpu
 tree
Message-ID: <arac65PVqoKkB2gu@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V9TpppkKC00LJn5e"
Content-Disposition: inline


--V9TpppkKC00LJn5e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pagemap-headers tree got a conflict in:

  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c

between commit:

  ce23f00eb12b0 ("drm/amdgpu: Add amdgpu_sdma_types.h header")

=66rom the amdgpu tree and commit:

  54db4e00bf624 ("drm/amd: Remove pagemap.h includes")

=66rom the pagemap-headers tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 8b96e1fe741a1,460b289ddd4ef..0000000000000
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@@ -24,8 -24,7 +24,9 @@@
  #include <linux/dma-direction.h>
  #include <linux/dma-mapping.h>
  #include <linux/migrate.h>
+ #include <linux/pagemap.h>
 +#include "amdgpu.h"
 +#include "amdgpu_sdma.h"
  #include "amdgpu_sync.h"
  #include "amdgpu_object.h"
  #include "amdgpu_vm.h"

--V9TpppkKC00LJn5e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq2nOoACgkQJNaLcl1U
h9AbYgf9F2qXJCGLQ2gH3g50qTcTgLCuefPdcauyIjCAi2XuIN4aIMq+ByWuA6rX
NjJf0tsMgqzpJj47/hYtLVzEMS7OVRQMIa9xcGwEsAEb4amwSjTlhSFNubYn7Dxp
cQ0rLhiS3n983uPaZssBx86OnZKlfjgbrdFQijKoU1U2MQ8yS98YnbpBDZutYwgA
+wxPiRWsUx40N9IpyKRr/H6Nw+Xds0PWh7OTf0jWedkqa/gxvb7byChz8AbgQVyb
FtlruOc8bkGpvzwnFIMoCnxeE3czYqMBBA3BB5t5UhhsA5SWAoLrc/h79WgL37jg
cCWukCzY0ZjWzFOfluGPxJ1Ya0inlg==
=NoSx
-----END PGP SIGNATURE-----

--V9TpppkKC00LJn5e--
