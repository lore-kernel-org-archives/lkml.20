Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B338949739D;
	Fri, 18 Sep 2026 11:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789730045; cv=none; b=P9yQ2rTNUf3s2xOl57tzt8wNCdx7vAjkRdh3ixdpkg6jkwlRJckVdJpCa/m2qXudGfMFZ8HHxQqcrz3lvCaRU5Tvh1fG64Spd7GuIayax9QUlj568MtHtWddDjak7DBvQ4Vy5AM0rsgLcPzdeOZbtUztEPioY/BskazgN8ZeFL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789730045; c=relaxed/simple;
	bh=H5yzkz+dkPYLh2DG1ZiYdMk8sU9gWephHtuWvkfIVfA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xvf2cOpJThX/o1ytU6NSoWKG+99Y4sA8G5ibe1Js3oK3ftICvCYdlzY/pj9usXP2EgNMmnx/fHBF/tbsyqi8mhMfj+bevxZ6tl2SGhhkh1ZhnBN1zIn29T6kI8UeIFIyKYsf8+v8l7UqqJy8O+8CujFNyoCByuaAhzjD2VAthaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RRCgdpXY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RRCgdpXY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7971F000FF;
	Fri, 18 Sep 2026 11:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789730044;
	bh=KjJFsXZM286zFUj1yae5n7e3PNhdPVUj3C8Z8tDcazU=;
	h=Date:From:To:Cc:Subject;
	b=RRCgdpXYu2QpK21gH8A+0E82CVTWP0QBneCza3Z81FXVoLer0eDeDPhho5pVRb8nh
	 2mK1EU3tGyR83+sIwU89NVEdiidGCVtL2q/9+I/+0E9pBjI7MdP3DYfQFzLzvKWBDe
	 seTRD36TOhRh/9CyI3FuKL6mbZqJ7COG1Hc5j5VLbpIG1yZatle+sfXPAUW3ZrK2CX
	 D4MTLi+6H6szneBsBK7cMk+4KOoHKtM/soSZYNPxa3XXf3iTCVvg98RP1Ev1VTM1jg
	 y3yCDsDw+5ivPiPKiFfBJ/egSfE4d/c2k+xbBwDo2DL+vzSjesAnorC6nE+1ITNPK0
	 3oKGFGKVhxoWA==
Date: Fri, 18 Sep 2026 12:14:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Chenyu Chen <chen-yu.chen@amd.com>, Leo Li <sunpeng.li@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <aq0c-DBzXfUxY79u@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BlfRqiQYzSjxFV2l"
Content-Disposition: inline


--BlfRqiQYzSjxFV2l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c

between commit:

  63e19ef3ddab8 ("drm/amd/display: Atomize IRQ register read/modify/write o=
ps")

=66rom the drm-fixes tree and commit:

  63e19ef3ddab8 ("drm/amd/display: Atomize IRQ register read/modify/write o=
ps")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
index 74a8735168aaa,f997a50c1293e..0000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
@@@ -728,7 -713,12 +731,12 @@@ STATIC_IFN_KUNIT int amdgpu_dm_irq_hand
  			entry->src_id,
  			entry->src_data[0]);
 =20
+ 	if (!DAL_VALID_IRQ_SRC_NUM(src)) {
+ 		DRM_ERROR("DM_IRQ: invalid irq_source:%d!\n", src);
+ 		return 0;
+ 	}
+=20
 -	dc_interrupt_ack(adev->dm.dc, src);
 +	amdgpu_dm_irq_ack(adev, src);
 =20
  	/* Call high irq work immediately */
  	amdgpu_dm_irq_immediate_work(adev, src);

--BlfRqiQYzSjxFV2l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqtHPcACgkQJNaLcl1U
h9BB1Qf9ESoLYk+wAEYMBi/xWYm/G+v7lp0LyTTX4BU6iGryeViG/QsfgBeepj2D
8BbF2vnsO85h9wHtkUKIaPUE6zYUSXH3v0ZTKcGAG1p1nxxrnJ4KO/gubB8Iw6JV
vKyw6QAgl8mbQ/6v2j9MjMrMDmepZNdIyNv2mvt/PKHs0iKKje1uZJhjQV5gZ7sF
HOV5gkBghFY7YQBe7oKUjBRJhT+RYFHkCN0H1eRHidD+4LKNY95XaJ+X2GiCnH1M
hoeFctTcdf/DOXLfr8v9DFtHWqOW7IaOSiYs+AGeXWQRRpbOSP1v/yFqqq53Kh9b
iK1mfHKbSFI1ASnUY4YTH8Kv3GaGfw==
=5UX0
-----END PGP SIGNATURE-----

--BlfRqiQYzSjxFV2l--
