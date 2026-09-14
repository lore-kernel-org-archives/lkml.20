Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EE54052D9;
	Mon, 14 Sep 2026 13:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392724; cv=none; b=uKAR0BCd3sm8DDZ0eDL21M2IQDOca0k6aXlTZqy4+VqAyEzw5uvbWRlWlNSSv30mzeEdlbgWd2HVjPbGjpeQeURYopvRr/P0XS+n9WMnyx14PM0CiWN8xVD/CHz+YNg+lebol053rH01lHfASqQHTuBhxNghYMYPNBHlITik3u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392724; c=relaxed/simple;
	bh=yN6frNFI9YSItNuRWkUJAT4mMFL0kjF+BisseYeNbdc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RgK7h8PX3KJgaOJVHILuVHYQrTabxziyS1T+D5fEX41LTgfmrE1Ap413MF+hF3Yhkg5QErxHjKx5dr3vtVLBAFcbCVIW9iP8JJ8fr7b9MADC8WVbz4/ka2Zm00algvaYoqhlAnPLK/bwFKXPb+wM9tZfDDpoWeq5IU7HJJXMFIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7B8EvWz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7B8EvWz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E68D21F000FF;
	Mon, 14 Sep 2026 13:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789392722;
	bh=N+sM8wRsWqqkRu9oA4S/pvIXAWvFOGn7YnNOSNB6quc=;
	h=Date:From:To:Cc:Subject;
	b=G7B8EvWz3K0ixQ1tjDHVGqSbWDOYSX33N5GXnfFDR61rf+oaS2+FO3qKq1F4qs5Mw
	 hCDhOfStXyRomXOwo/LTwP3qL3JTEpORzBfbL3DHVaMvmEfdcBHbBh3PrRoWcwPH+r
	 F/xHI5gR4gh0HQSbB9irju1YBcBAXJb1ozOkbTLM9hdOzExqol29S4+b5cK+rK3IXg
	 BU/67BQohk1839dlpz7JlU2h+FLEZkfVHDKyruS6SagTtdGAjP3gLsQvBqeLob3msj
	 bGPmFNPzJpF3CMRFX0CCsEeJpnSkL4NTXq3v///4QT90ttOspGj/yP5dmnBCy14EoB
	 5Daf/MMe47Wqw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id D17551AC52F1; Mon, 14 Sep 2026 14:31:59 +0100 (BST)
Date: Mon, 14 Sep 2026 14:31:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
	Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Tom Chung <chiahsuan.chung@amd.com>
Subject: linux-next: manual merge of the amdgpu tree with the drm-misc tree
Message-ID: <aqf3T0-GiqaMsBF6@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7GgmGZOlPCnaCd+q"
Content-Disposition: inline


--7GgmGZOlPCnaCd+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_crtc_test.c

between commits:

  3a2c4d55e32ad ("treewide: refresh kmalloc_obj() conversions")
  32fbec62a3e9f ("drm/amdgpu: dm: Convert to atomic_create_state")

=66rom the drm-misc tree and commits:

  29d303de7669a ("drm/amd/display: Cover crtc duplicate_state stream and nu=
ll guard")
  b40f65c12577b ("drm/amd/display: Cover crtc destroy callback")
  fa67092e4674c ("drm/amd/display: Add reset_state existing-state branch te=
st")

=66rom the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_crtc_test.c
index 17bd64611a823,544445fbc7706..0000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_crtc_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_crtc_test.c
@@@ -1404,18 -1504,118 +1504,118 @@@ static void dm_test_crtc_duplicate_stat
  	amdgpu_dm_crtc_destroy_state(crtc, dup);
  }
 =20
 +/* Tests for amdgpu_dm_crtc_create_state() */
 +
+ /**
+  * dm_test_crtc_duplicate_state_retains_stream - Test duplicate retains t=
he stream
+  * @test: The KUnit test context
+  *
+  * When the current CRTC state carries a DC stream, duplicating the state=
 must
+  * copy the stream pointer and take an additional reference on it. Destro=
ying
+  * the duplicate then drops that reference back to the KUnit-managed one.
+  */
+ static void dm_test_crtc_duplicate_state_retains_stream(struct kunit *tes=
t)
+ {
+ 	struct dc_stream_state *stream;
+ 	struct drm_crtc *crtc;
+ 	struct dm_crtc_state *cur;
+ 	struct drm_crtc_state *dup;
+ 	struct dm_crtc_state *dm_dup;
+ 	struct dc_link *link;
+=20
+ 	crtc =3D kunit_kzalloc(test, sizeof(*crtc), GFP_KERNEL);
+ 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
+ 	cur =3D kunit_kzalloc(test, sizeof(*cur), GFP_KERNEL);
+ 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cur);
+=20
+ 	link =3D dm_kunit_alloc_link(test);
+ 	stream =3D dm_kunit_alloc_stream(test, link);
+=20
+ 	cur->stream =3D stream;
+ 	crtc->state =3D &cur->base;
+=20
+ 	dup =3D amdgpu_dm_crtc_duplicate_state(crtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, dup);
+=20
+ 	dm_dup =3D to_dm_crtc_state(dup);
+ 	KUNIT_EXPECT_PTR_EQ(test, dm_dup->stream, stream);
+ 	/* The duplicate took a second reference on top of the managed one. */
+ 	KUNIT_EXPECT_EQ(test, kref_read(&stream->refcount), 2);
+=20
+ 	/* Destroying the duplicate drops back to the KUnit-managed reference. */
+ 	amdgpu_dm_crtc_destroy_state(crtc, dup);
+ 	KUNIT_EXPECT_EQ(test, kref_read(&stream->refcount), 1);
+ }
+=20
+ /**
+  * dm_test_crtc_duplicate_state_null_state_returns_null - Test guard on m=
issing state
+  * @test: The KUnit test context
+  *
+  * Duplicating a CRTC whose current state is NULL must trip the WARN_ON g=
uard
+  * and return NULL without allocating a new state.
+  */
+ static void dm_test_crtc_duplicate_state_null_state_returns_null(struct k=
unit *test)
+ {
+ 	struct drm_crtc *crtc;
+=20
+ 	crtc =3D kunit_kzalloc(test, sizeof(*crtc), GFP_KERNEL);
+ 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
+ 	crtc->state =3D NULL;
+=20
+ 	KUNIT_EXPECT_NULL(test, amdgpu_dm_crtc_duplicate_state(crtc));
+ }
+=20
 -/* Tests for amdgpu_dm_crtc_destroy() */
 -
+ /**
+  * dm_test_crtc_destroy_cleans_up_and_frees - Test destroy tears down the=
 CRTC
+  * @test: The KUnit test context
+  *
+  * amdgpu_dm_crtc_destroy() is the drm_crtc .destroy callback: it must run
+  * drm_crtc_cleanup() and free the CRTC. Initialise a CRTC with a primary=
 plane
+  * so it is registered on the device (num_crtc =3D=3D 1), then destroy it=
 and verify
+  * the CRTC was unregistered (num_crtc back to 0). The CRTC is a plain (u=
nmanaged)
+  * allocation because amdgpu_dm_crtc_destroy() kfree()s it.
+  */
+ static void dm_test_crtc_destroy_cleans_up_and_frees(struct kunit *test)
+ {
+ 	struct amdgpu_device *adev;
+ 	struct amdgpu_crtc *acrtc;
+ 	struct drm_plane *plane;
+ 	int ret;
+=20
+ 	adev =3D dm_kunit_alloc_adev(test);
+ 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+=20
+ 	plane =3D drm_kunit_helper_create_primary_plane(test, &adev->ddev,
+ 						      NULL, NULL, NULL, 0, NULL);
+ 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane);
+=20
+ 	/* amdgpu_dm_crtc_destroy() kfree()s the CRTC, so use a plain alloc. */
+ 	acrtc =3D kzalloc_obj(*acrtc, GFP_KERNEL);
+ 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, acrtc);
+=20
+ 	ret =3D drm_crtc_init_with_planes(&adev->ddev, &acrtc->base, plane,
+ 					NULL, &dm_test_crtc_funcs, NULL);
+ 	KUNIT_ASSERT_EQ(test, ret, 0);
+ 	KUNIT_EXPECT_EQ(test, adev->ddev.mode_config.num_crtc, 1);
+=20
+ 	amdgpu_dm_crtc_destroy(&acrtc->base);
+=20
+ 	/* drm_crtc_cleanup() ran: the CRTC was unregistered from the device. */
+ 	KUNIT_EXPECT_EQ(test, adev->ddev.mode_config.num_crtc, 0);
+ }
+=20
 -/* Tests for amdgpu_dm_crtc_reset_state() */
++/* Tests for amdgpu_dm_crtc_destroy() */
+=20
  /**
 - * dm_test_crtc_reset_state_allocates_state - Test reset installs a fresh=
 state
 + * dm_test_crtc_create_state_allocates_state - Test create_state allocate=
s a fresh state
   * @test: The KUnit test context
   *
 - * Resetting a CRTC with no existing state must allocate and install a new
 - * drm_crtc_state.
 + * Creating state for a CRTC must allocate a new drm_crtc_state.
   */
 -static void dm_test_crtc_reset_state_allocates_state(struct kunit *test)
 +static void dm_test_crtc_create_state_allocates_state(struct kunit *test)
  {
  	struct amdgpu_device *adev =3D dm_kunit_alloc_adev(test);
 +	struct drm_crtc_state *crtc_state;
  	struct drm_crtc *crtc;
 =20
  	crtc =3D kunit_kzalloc(test, sizeof(*crtc), GFP_KERNEL);
@@@ -1423,13 -1623,56 +1623,55 @@@
  	crtc->dev =3D &adev->ddev;
  	crtc->state =3D NULL;
 =20
 -	amdgpu_dm_crtc_reset_state(crtc);
 +	crtc_state =3D amdgpu_dm_crtc_create_state(crtc);
 +	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, crtc_state);
 =20
 -	KUNIT_EXPECT_NOT_NULL(test, crtc->state);
 -
 -	if (crtc->state)
 -		amdgpu_dm_crtc_destroy_state(crtc, crtc->state);
 +	if (!IS_ERR(crtc_state))
 +		amdgpu_dm_crtc_destroy_state(crtc, crtc_state);
  }
 =20
+ /**
+  * dm_test_crtc_reset_state_replaces_existing - Test reset frees the old =
state
+  * @test: The KUnit test context
+  *
+  * Resetting a CRTC that already carries a state must destroy the existing
+  * state before installing a fresh one. The old state holds a stream refe=
rence,
+  * so a successful reset drops that reference (via amdgpu_dm_crtc_destroy=
_state)
+  * and leaves the CRTC with a new, non-NULL state.
+  */
+ static void dm_test_crtc_reset_state_replaces_existing(struct kunit *test)
+ {
+ 	struct amdgpu_device *adev =3D dm_kunit_alloc_adev(test);
+ 	struct dc_stream_state *stream;
+ 	struct dm_crtc_state *old;
+ 	struct drm_crtc *crtc;
+ 	struct dc_link *link;
+=20
+ 	crtc =3D kunit_kzalloc(test, sizeof(*crtc), GFP_KERNEL);
+ 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
+ 	crtc->dev =3D &adev->ddev;
+=20
+ 	link =3D dm_kunit_alloc_link(test);
+ 	stream =3D dm_kunit_alloc_stream(test, link);
+ 	/* Extra ref so destroying the old state drops back to the managed one. =
*/
+ 	kref_get(&stream->refcount);
+=20
+ 	/* reset_state kfree()s the old state, so use a plain (unmanaged) alloc.=
 */
+ 	old =3D kzalloc_obj(*old, GFP_KERNEL);
+ 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old);
+ 	old->stream =3D stream;
+ 	crtc->state =3D &old->base;
+=20
+ 	amdgpu_dm_crtc_reset_state(crtc);
+=20
+ 	/* Old state was destroyed (stream ref dropped) and a new one installed.=
 */
+ 	KUNIT_EXPECT_EQ(test, kref_read(&stream->refcount), 1);
+ 	KUNIT_EXPECT_NOT_NULL(test, crtc->state);
+=20
+ 	if (crtc->state)
+ 		amdgpu_dm_crtc_destroy_state(crtc, crtc->state);
+ }
+=20
  /* Tests for amdgpu_dm_crtc_destroy_state() */
 =20
  /**
@@@ -1906,8 -2634,13 +2633,12 @@@ static struct kunit_case amdgpu_dm_crtc
  	KUNIT_CASE(dm_test_count_crtc_active_planes_mixed),
  	/* amdgpu_dm_crtc_duplicate_state */
  	KUNIT_CASE(dm_test_crtc_duplicate_state_copies_fields),
 +	/* amdgpu_dm_crtc_create_state */
 +	KUNIT_CASE(dm_test_crtc_create_state_allocates_state),
+ 	KUNIT_CASE(dm_test_crtc_duplicate_state_retains_stream),
+ 	KUNIT_CASE(dm_test_crtc_duplicate_state_null_state_returns_null),
+ 	/* amdgpu_dm_crtc_destroy */
+ 	KUNIT_CASE(dm_test_crtc_destroy_cleans_up_and_frees),
 -	/* amdgpu_dm_crtc_reset_state */
 -	KUNIT_CASE(dm_test_crtc_reset_state_allocates_state),
 -	KUNIT_CASE(dm_test_crtc_reset_state_replaces_existing),
  	/* amdgpu_dm_crtc_destroy_state */
  	KUNIT_CASE(dm_test_crtc_destroy_state_no_stream),
  	KUNIT_CASE(dm_test_crtc_destroy_state_releases_stream),

--7GgmGZOlPCnaCd+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqn908ACgkQJNaLcl1U
h9A3VQf5AX8nh2wntOAyO5xZ4a3W7exUJIshgpFDg719xZx3WDthGLUrsy+d7ZPl
ddkZEncce+TlqMwKvZkMGh4f8FJeief9A9ViUeSSwO80cJQWU7PUExD557QkpgCw
xKCM+TZFIsDSdsPk3maQaznB7Kwyj/nCe0thCMUMeNWv1D7ru/H5BKcj4odHDHdF
v+ht13HiF8MRvSWcxwiGuiP4RSGv7kU04aqY7Rdsp5w0Pui4ATMemT6VlKa6+677
0JdLlU92jFfsq6MGFyQvoUg9yH7gb3eRqIWKIgbPiP7Az4Jiq11ZRvNOyWfhbYrH
TJJDb7kuKbf0UwpJuesMamedUljS5w==
=7KBl
-----END PGP SIGNATURE-----

--7GgmGZOlPCnaCd+q--
