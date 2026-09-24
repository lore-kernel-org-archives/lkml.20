Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06A14A3F32;
	Thu, 24 Sep 2026 16:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266423; cv=none; b=QYpd7aZGd1EAMrJoNOuqQX+cfYtvppt2rTppFMmaOeyUBCNfx7M2Ug0/v/DoRUBIJrHJSpt3Fy6JJeWiWhwp1LPntkUbipZiwoclhAQyudrra5k0ivuBGCDQJ08eF7xFKcuJVFwyOIAYGm726vWVdsrjGh2v0AN4Bva5GKkf2jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266423; c=relaxed/simple;
	bh=h/7DOHevF2/NkCqTLdqi4qDa/UuYk63f1lglheYMYts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VEV8mVp9R44wq8I8DNGvjq81JV+JhUmTPJXwzIiENwJO666AOqyNVCgHx+aikC/XIZJGuX/V4aQPpmUEp5q4aHhGe+HjDe28vl2Ogznuj2lJ+Lc2Phssm5e1G4TbRC6vQzktGd+WLL2NL3k3lTHUuqHrKlePnnB5TLNIWlPAj6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBSpSBnE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBSpSBnE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBFF31F000FF;
	Thu, 24 Sep 2026 16:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790266421;
	bh=smLtviV/wm1Z7WoJZ8T7qPQmwno53wQ7+ODFzUZYMz0=;
	h=Date:From:To:Cc:Subject;
	b=ZBSpSBnEzjc9iHl5WYfHc3RK5oXtZTEhi3j6MXzqmbyrNgf3UPTwb5O4M998ga1zA
	 UX0ewr08Dd98yssmqCVP4lacARkdZgeCDbwCK9cR8mb/bWr7zNilngZxHE0Dcx+M1L
	 xgNqDnX9wnS4Tsx8MeQoSpFwkAGvd3E8F1n7/Cfz8GESyPN9F5wlBIolaipP9Whpft
	 entumCZWYtX+yziKyfQgCdIA2Igca6ZNGpsm7Zv5x/6cCwZ4A3+4OzSw4k2CbOcs5c
	 9+mqwQ0+O7C6f0cww3ck8CjbGDXpcpkEU+cYbfTov2tvBzM0Q3EDGMu46y30yf/0D6
	 w5afUObvFgwxg==
Date: Thu, 24 Sep 2026 17:13:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Alex Hung <alex.hung@amd.com>,
	George Zhang <george.zhang@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the amdgpu tree with the drm,drm-misc
 tree
Message-ID: <arVMMQKr301Co9RF@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dJEfNwCmOjU/hvxD"
Content-Disposition: inline


--dJEfNwCmOjU/hvxD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_crtc_test.c

between commits:

  dae05bc4c8351 ("next-20260921/drm")
  02ac945db0d1e ("next-20260921/drm-misc")

=66rom the drm,drm-misc tree and commits:

  cbb329ca3b386 ("drm/amd/display: Fix KUnit CRTC warnings")
  a3e8dc37a616d ("drm/amd/display: Fix KUnit checkpatch warnings")

=66rom the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_crtc_=
test.c
index ade20e6506780,489dd56474b91..0000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_crtc_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_crtc_test.c
@@@ -42,10 -42,10 +42,10 @@@ static void dm_test_crtc_modeset_requir
  }
 =20
  /**
-  * dm_test_crtc_modeset_required_active_active_changed - Test Crtc modese=
t required active active changed
+  * dm_test_crtc_modeset_required_active_state_changed - Test modeset requ=
ired when the active state changes
   * @test: The KUnit test context
   */
- static void dm_test_crtc_modeset_required_active_active_changed(struct ku=
nit *test)
+ static void dm_test_crtc_modeset_required_active_state_changed(struct kun=
it *test)
  {
  	struct drm_crtc_state state =3D {};
 =20
@@@ -877,10 -877,39 +877,39 @@@ static bool dm_test_crtc_get_vblank_tim
  	return false;
  }
 =20
+ static int dm_test_crtc_enable_vblank(struct drm_crtc *crtc)
+ {
+ 	return 0;
+ }
+=20
+ static void dm_test_crtc_disable_vblank(struct drm_crtc *crtc)
+ {
+ }
+=20
+ static u32 dm_test_crtc_get_vblank_counter(struct drm_crtc *crtc)
+ {
+ 	return 0;
+ }
+=20
  static const struct drm_crtc_funcs dm_test_crtc_funcs =3D {
+ 	.destroy =3D amdgpu_dm_crtc_destroy,
+ 	.atomic_duplicate_state =3D amdgpu_dm_crtc_duplicate_state,
+ 	.atomic_destroy_state =3D amdgpu_dm_crtc_destroy_state,
+ 	.enable_vblank =3D dm_test_crtc_enable_vblank,
+ 	.disable_vblank =3D dm_test_crtc_disable_vblank,
+ 	.get_vblank_counter =3D dm_test_crtc_get_vblank_counter,
  	.get_vblank_timestamp =3D dm_test_crtc_get_vblank_timestamp,
  };
 =20
+ static void dm_test_crtc_cleanup(void *data)
+ {
+ 	struct amdgpu_crtc *acrtc =3D data;
+=20
+ 	if (acrtc->base.dev && drm_dev_has_vblank(acrtc->base.dev))
+ 		drm_crtc_vblank_off(&acrtc->base);
+ 	list_del_init(&acrtc->base.head);
+ }
+=20
  /*
   * dm_test_crtc_arm_irq_src - Prime an IRQ source so get()/put() short-ci=
rcuit.
   * @test: The KUnit test context
@@@ -947,8 -976,13 +976,13 @@@ dm_test_crtc_setup_enable(struct kunit=20
  	acrtc =3D kunit_kzalloc(test, sizeof(*acrtc), GFP_KERNEL);
  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, acrtc);
  	acrtc->base.dev =3D &adev->ddev;
+ 	acrtc->base.funcs =3D &dm_test_crtc_funcs;
  	acrtc->base.enabled =3D true;
  	acrtc->crtc_id =3D 0;
+ 	INIT_LIST_HEAD(&acrtc->base.head);
+ 	list_add_tail(&acrtc->base.head, &adev->ddev.mode_config.crtc_list);
+ 	KUNIT_ASSERT_EQ(test,
+ 			kunit_add_action_or_reset(test, dm_test_crtc_cleanup, acrtc), 0);
 =20
  	link =3D dm_kunit_alloc_link(test);
  	stream =3D dm_kunit_alloc_stream(test, link);
@@@ -1508,8 -1542,6 +1542,6 @@@ static void dm_test_crtc_duplicate_stat
  	amdgpu_dm_crtc_destroy_state(crtc, dup);
  }
 =20
- /* Tests for amdgpu_dm_crtc_create_state() */
-=20
  /**
   * dm_test_crtc_duplicate_state_retains_stream - Test duplicate retains t=
he stream
   * @test: The KUnit test context
@@@ -1569,6 -1601,8 +1601,6 @@@ static void dm_test_crtc_duplicate_stat
  	KUNIT_EXPECT_NULL(test, amdgpu_dm_crtc_duplicate_state(crtc));
  }
 =20
 -/* Tests for amdgpu_dm_crtc_destroy() */
 -
  /**
   * dm_test_crtc_destroy_cleans_up_and_frees - Test destroy tears down the=
 CRTC
   * @test: The KUnit test context
@@@ -1608,7 -1642,7 +1640,7 @@@ static void dm_test_crtc_destroy_cleans
  	KUNIT_EXPECT_EQ(test, adev->ddev.mode_config.num_crtc, 0);
  }
 =20
- /* Tests for amdgpu_dm_crtc_destroy() */
+ /* Tests for amdgpu_dm_crtc_create_state() */
 =20
  /**
   * dm_test_crtc_create_state_allocates_state - Test create_state allocate=
s a fresh state
@@@ -1666,7 -1700,7 +1698,7 @@@ static void dm_test_crtc_reset_state_re
  	old->stream =3D stream;
  	crtc->state =3D &old->base;
 =20
- 	amdgpu_dm_crtc_reset_state(crtc);
+ 	amdgpu_dm_crtc_create_state(crtc);
 =20
  	/* Old state was destroyed (stream ref dropped) and a new one installed.=
 */
  	KUNIT_EXPECT_EQ(test, kref_read(&stream->refcount), 1);
@@@ -1782,6 -1816,11 +1814,11 @@@ static void dm_test_crtc_handle_vblank_
  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, event);
 =20
  	acrtc->base.dev =3D &adev->ddev;
+ 	acrtc->base.funcs =3D &dm_test_crtc_funcs;
+ 	INIT_LIST_HEAD(&acrtc->base.head);
+ 	list_add_tail(&acrtc->base.head, &adev->ddev.mode_config.crtc_list);
+ 	KUNIT_ASSERT_EQ(test,
+ 			kunit_add_action_or_reset(test, dm_test_crtc_cleanup, acrtc), 0);
  	acrtc->event =3D event;
  	acrtc->pflip_status =3D AMDGPU_FLIP_SUBMITTED;
 =20
@@@ -1818,6 -1857,11 +1855,11 @@@ static void dm_test_crtc_handle_vblank_
  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, event);
 =20
  	acrtc->base.dev =3D &adev->ddev;
+ 	acrtc->base.funcs =3D &dm_test_crtc_funcs;
+ 	INIT_LIST_HEAD(&acrtc->base.head);
+ 	list_add_tail(&acrtc->base.head, &adev->ddev.mode_config.crtc_list);
+ 	KUNIT_ASSERT_EQ(test,
+ 			kunit_add_action_or_reset(test, dm_test_crtc_cleanup, acrtc), 0);
  	acrtc->event =3D event;
  	acrtc->pflip_status =3D AMDGPU_FLIP_NONE;
 =20
@@@ -2577,7 -2621,7 +2619,7 @@@ static void dm_test_crtc_atomic_check_i
  static struct kunit_case amdgpu_dm_crtc_tests[] =3D {
  	/* amdgpu_dm_crtc_modeset_required */
  	KUNIT_CASE(dm_test_crtc_modeset_required_active_mode_changed),
- 	KUNIT_CASE(dm_test_crtc_modeset_required_active_active_changed),
+ 	KUNIT_CASE(dm_test_crtc_modeset_required_active_state_changed),
  	KUNIT_CASE(dm_test_crtc_modeset_required_active_connectors_changed),
  	KUNIT_CASE(dm_test_crtc_modeset_required_inactive),
  	KUNIT_CASE(dm_test_crtc_modeset_required_no_changes),
@@@ -2637,12 -2681,13 +2679,13 @@@
  	KUNIT_CASE(dm_test_count_crtc_active_planes_mixed),
  	/* amdgpu_dm_crtc_duplicate_state */
  	KUNIT_CASE(dm_test_crtc_duplicate_state_copies_fields),
- 	/* amdgpu_dm_crtc_create_state */
- 	KUNIT_CASE(dm_test_crtc_create_state_allocates_state),
  	KUNIT_CASE(dm_test_crtc_duplicate_state_retains_stream),
  	KUNIT_CASE(dm_test_crtc_duplicate_state_null_state_returns_null),
  	/* amdgpu_dm_crtc_destroy */
  	KUNIT_CASE(dm_test_crtc_destroy_cleans_up_and_frees),
+ 	/* amdgpu_dm_crtc_create_state */
+ 	KUNIT_CASE(dm_test_crtc_create_state_allocates_state),
+ 	KUNIT_CASE(dm_test_crtc_reset_state_replaces_existing),
  	/* amdgpu_dm_crtc_destroy_state */
  	KUNIT_CASE(dm_test_crtc_destroy_state_no_stream),
  	KUNIT_CASE(dm_test_crtc_destroy_state_releases_stream),

--dJEfNwCmOjU/hvxD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq1TDAACgkQJNaLcl1U
h9AnIwf8CExcZ2wZEzGALk/y8btd4Qn4mLe9inuZeQ7iUZq3nU3ubKDzcRMBihYj
y2JL+HP6A0PONhhlpaLsa84k7b3xpTmY+zNAd+X9oFxn2zZvZ5RAVLq1ljXEgGXA
Y1bqqYd4ilFSpfbPmOXAOfh5lpsPG7e1tUlP4b3i3dQlInasSlmO4CP1LyeJW5Wv
CNY/Y/qb1WZWObIIKUjnWfD5sMuS3rAJg9y/Lsp83MPBGL35vcP5mliFtkYS17KO
MdlvYCA2qZJwcs9gcOug3eGpLgR857tCcZw52Xec8s2T8FLZMHlBKsSHOsvn2+Ws
GlTijTEiVjfVspXOTUB8UzR8BsmYbg==
=eqiI
-----END PGP SIGNATURE-----

--dJEfNwCmOjU/hvxD--
