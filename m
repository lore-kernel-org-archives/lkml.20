Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794928498;
	b=476YBB16E9Q5FudrYEqrO/9Qtl/5LLlYo4tZ8mGfioj1rXJNCpMqMGpd23odV7H2QhI+
	 /L6SblSI/fTDCdlUbEM6kZOiQhqdL1Mp1z9pY5mXpJ/+ON6YJFv4H3+RUwhjKWhOpk3xd
	 JOnaNSFrbBMUGHJo8MVh7GZ12p0P6kkg2CRJKcfOKsG0nfWlBE7mlpUWp8pH6utPBqDVg
	 O/aReghDbMPDDkzyDKSlsC7XwFC06nNkOCVZUA+q/XT1PQ+KBOvZGeaiJf1odu/MLsh3E
	 /K/jMSAlhj2KCMDJAx4S9yBFVH9Of3+4qZEkz28AyiV6SAfFqvhzVxDyU/sfWvrJyHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928498;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=O9xAKWwBB7u9FKZ3TGuNVV0f8tMOj2I6ZH8LKxjW0FY=;
	b=r5NEGhUinG73ySvslntloTpdKC/v00En6Hhn1lY71DLeWUvqxd5ZoeG6pRxn5xosupbY
	 iC6GNaWrWNxk57whh/iHWCeROLKZFotte5X2POEihG3YLcLSgKXiETZEEk5XZqFrCq6i1
	 u8m43Uwy1FKUBK/fADDhCLvs5h0yH2gQyqvOjK+uTboowvP6NpadUNDPQsMa2S5SaD0NT
	 EQ1aG3Vkhqpa9UqcBW5pLUMfZufUyGiL3ah3jvNHW+BxGUehp8hdezNNnR/GjnyBQly+4
	 tHkh0x14pngTlUqobWUPZCxmOsJsIo3Q9aQzvGS+2SHQodqGQapwDrNCBHyvv0ffU0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b9Shf1KY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCC5606A31C;
	Tue, 17 Nov 2026 15:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b9Shf1KY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C9DE1F000C5;
	Tue, 17 Nov 2026 15:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794928498;
	bh=O9xAKWwBB7u9FKZ3TGuNVV0f8tMOj2I6ZH8LKxjW0FY=;
	h=Date:From:To:Cc:Subject;
	b=b9Shf1KY/a3fy+Jqg/5hTSPi5h3cjvmI+TiUWZF5zxzV6N+GW9t4yHO3hlaF9pnS4
	 GJTngcyjdzLwyXy7EjMEYGW+g9NErsM0/KTKwkdRn22xEkv2OU3eZ/ZlhHAly8Q6Zz
	 Q92suuQZOHu3FiKx6T4zH+0bMBB3pAemRMb2+sc/WM1dWRLuUX2i3i+2Po/A5z1NSt
	 94/4ny2QJdlEhrLbZeQf0fKARqwqGo3M7NHh0B1FR4G0oGw2vkmpKt5ZZuf95pWp5m
	 lo8tuH5FU4t4emLw0LQSagbgPqI+XDO5+TrLiXbVzwCcdXnP8SuBpb8Jli2gboLnfI
	 KTgSasnWHJY8w==
Date: Tue, 17 Nov 2026 15:14:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Fei Yu <fei.yu@intel.com>, Kees Cook <kees@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-misc-fixes tree with the origin
 tree
Message-ID: <avxvbWBvcToSp_t4@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="/t8F7wjVNMCsMgCV"
Content-Disposition: inline


--/t8F7wjVNMCsMgCV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc-fixes tree got a conflict in:

  drivers/gpu/drm/drm_syncobj.c

between commit:

  0af298e62e5cf ("treewide: refresh kmalloc_obj() conversions")

=66rom the origin tree and commit:

  6ca87397aeebc ("drm/syncobj: Limit the number of handles and use kvmalloc=
 for user-sized arrays")

=66rom the drm-misc-fixes tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/drm_syncobj.c
index 137397972a98a,c8a8c49d12fb2..0000000000000
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@@ -1051,7 -1062,7 +1062,7 @@@ static signed long drm_syncobj_array_wa
  		lockdep_assert_none_held_once();
  	}
 =20
- 	points =3D kmalloc_objs(*points, count);
 -	points =3D kvmalloc_array(count, sizeof(*points), GFP_KERNEL);
++	points =3D kvmalloc_objs(*points, count);
  	if (points =3D=3D NULL)
  		return -ENOMEM;
 =20
@@@ -1238,7 -1249,10 +1249,10 @@@ static int drm_syncobj_array_find(struc
  	struct drm_syncobj **syncobjs;
  	int ret;
 =20
- 	handles =3D kmalloc_objs(*handles, count_handles);
+ 	if (count_handles > DRM_SYNCOBJ_MAX_HANDLES)
+ 		return -EINVAL;
+=20
 -	handles =3D kvmalloc_array(count_handles, sizeof(*handles), GFP_KERNEL);
++	handles =3D kvmalloc_objs(*handles, count_handles);
  	if (handles =3D=3D NULL)
  		return -ENOMEM;
 =20
@@@ -1572,7 -1586,8 +1586,7 @@@ drm_syncobj_timeline_signal_ioctl(struc
  	if (ret < 0)
  		return ret;
 =20
- 	points =3D kmalloc_objs(*points, args->count_handles);
 -	points =3D kvmalloc_array(args->count_handles, sizeof(*points),
 -				GFP_KERNEL);
++	points =3D kvmalloc_objs(*points, args->count_handles);
  	if (!points) {
  		ret =3D -ENOMEM;
  		goto out;

--/t8F7wjVNMCsMgCV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr8b20ACgkQJNaLcl1U
h9BEMQf/UETYc/GVfeKWjN70UYgneG1M5PaaR5xgxRmr1Igtg1qSNC5wTqsDsWNq
KaxZ97lg1C8Ji9qUrNHyAphP2gu6jekd82ULMaPQ/WvIbRFs/v6P6yJN3ztdN/SV
VnL6Q+oAdntNFALJEJvcYPtpcQenF5NkTH/j7BjEzfYT6L5a3DTrCtVgTzRw55li
BnLhGlVAeWrzGkrHKl7J5A7ImWKEzzTO4ljzcFCOQb5WK5XJgOXva7ed8c94cgvT
+fvch0krinQf5BNljg5yUnsSMxCnJP1cXCbFSBiZkjIxHJs583ubmO1BZ7y1ymur
Kxc+1LqzXjn5w+cSYRTawVs+GlyG9A==
=LSLI
-----END PGP SIGNATURE-----

--/t8F7wjVNMCsMgCV--
