Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CB638E8BF;
	Fri, 18 Sep 2026 12:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734728; cv=none; b=alw+5aq/MGrPJaaWdMrjbFUSfIwdQg8lrKI9mLdWl31vTLclkhjdOZdxI7+YtiV7Z0NEti/dp3RwyJv/r77e2PO7mF8RjHOfZ20JxJjEW0+STgeSD13mzYzQcewvbeHxW8XwNICxq0yXq7Umw7D7wn/nmSFCL+wO6Oj6/j98DrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734728; c=relaxed/simple;
	bh=KFAeqhtTXyKa4gFhQrg06ju+1iUL6ti3QWzmDq2VQ9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=INMZ0376yacJQqzzZxZ14IQlZscIgcS3uf2PO32w+EsKwBMBj8Mm37lDS092yYg/P/zqrbnB3TLNlF3CzRQuchrXlM5wntmpq5DL9pSuVKqfOXXys3XJX6x6uVgHHtdtkAY0iUsLF/w9ml98EtRsQTEnTLfx1mvGTBiNRfKgPhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mO043iGq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mO043iGq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C811F1F000FF;
	Fri, 18 Sep 2026 12:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789734726;
	bh=mbzg/UEbf+MOm1966a9nICHfjUQV4C0eJW77QxZqSAQ=;
	h=Date:From:To:Cc:Subject;
	b=mO043iGqb0RgTq+djNkEb/ok1b0YcTmtk0zZOKtlj/twI+pglLjmBHpoezO4IYxz+
	 Xe3DC4E6jyotlfaDPHodW/iXolSp+rmMp4nmJQwz2BTv5UTpP0OjXis2IFPYetaOtp
	 V4VMJMaQ3bx7ePwQT+mU8GW/QS3OH9kUiPVt30/JcD/qXbW2bWOuU1RyZ52pU6FVH0
	 Zxtb+4JURTpZkTtDrRbF3f4TB41fwn9nlD1n2drbBaR9y00j9w+t0DBJyeWsxv+pY6
	 h4DnI/QHHAZNwIHaXmW5fPWNT2ALxwaEvsPorRnAjHV6l28z6CEE2olfAtaOzcJOli
	 rZhJa6i16qNvg==
Date: Fri, 18 Sep 2026 13:32:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Alex Hung <alex.hung@amd.com>,
	Chenyu Chen <chen-yu.chen@amd.com>, James Lin <pinglei.lin@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: linux-next: manual merge of the amdgpu tree with the drm-misc tree
Message-ID: <aq0vQtb0cXTGuPxJ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uNkFzDPxWkscMViP"
Content-Disposition: inline


--uNkFzDPxWkscMViP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got conflicts in:

  drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_plane_test.c
  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c

between commits:

  2bcec01cf1055 ("drm/amdgpu_dm: Convert to atomic_create_state")
  87882cd6debd9 ("drm/amdgpu_dm: tests: Fix wrong variable declaration afte=
r merge conflict")
  b8bc58515ac49 ("drm/panic: Display panic screen via per-plane callback")

=66rom the drm-misc tree and commits:

  123f78c8fa9c1 ("drm/amd/display: Attach only plane updates that actually =
changed")
  055593492a1f7 ("drm/amd/display: Test optional plane property creation")
  48c78d2199c0f ("drm/amd/display: Test panic flush DCC teardown")
  7352d162d0401 ("drm/amd/display: Test cursor update without DC stream")
  128cf6682d2d3 ("drm/amd/display: Test accepted plane atomic check")
  567aadce7e28a ("drm/amd/display: Test pre-GFX9 plane buffer attributes")
  9e7ed95bfdd9f ("drm/amd/display: Test modifier list growth failure")
  80065ab5bcf25 ("drm/amd/display: Test DCC reject for multi-plane format")

=66rom the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index cf39db90dfe0a,dcf72ff438889..0000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
diff --cc drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index d357afcb0e93a,ab674a32279f3..0000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
diff --cc drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_plane_test.c
index 1b0d3f16ef1a9,1001cbc334b09..0000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_plane_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_plane_test.c
@@@ -3755,10 -4110,12 +4102,12 @@@ static struct kunit_case amdgpu_dm_plan
  	KUNIT_CASE(dm_test_atomic_check_helper_failure),
  	KUNIT_CASE(dm_test_atomic_check_color_pipeline_conflict),
  	KUNIT_CASE(dm_test_atomic_check_scaling_failure),
+ 	KUNIT_CASE(dm_test_atomic_check_success),
  	/* amdgpu_dm_plane_panic_flush() */
  	KUNIT_CASE(dm_test_panic_flush_no_dc_state),
 +	/* amdgpu_dm_plane_drm_plane_create_state() */
 +	KUNIT_CASE(dm_test_plane_create_state_initializes_state),
+ 	KUNIT_CASE(dm_test_panic_flush_disables_dcc),
 -	/* amdgpu_dm_plane_drm_plane_reset() */
 -	KUNIT_CASE(dm_test_plane_reset_initializes_state),
  	/* amdgpu_dm_plane_drm_plane_duplicate_state() */
  	KUNIT_CASE(dm_test_plane_duplicate_state_copies_fields),
  	KUNIT_CASE(dm_test_plane_duplicate_state_copies_resources),
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drive=
rs/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 233447dcf6b30..0124d1e7eb0b6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -842,7 +842,6 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *=
dm,
 	return 0;
=20
 error_ism_fini:
-	amdgpu_dm_ism_fini(&acrtc->ism);
 	drm_crtc_cleanup(&acrtc->base);
 fail:
 	kfree(acrtc);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_crtc_tes=
t.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_crtc_test.c
index ade20e6506780..45a7a35bd5ff5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_crtc_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_crtc_test.c
@@ -1666,8 +1666,6 @@ static void dm_test_crtc_reset_state_replaces_existin=
g(struct kunit *test)
 	old->stream =3D stream;
 	crtc->state =3D &old->base;
=20
-	amdgpu_dm_crtc_reset_state(crtc);
-
 	/* Old state was destroyed (stream ref dropped) and a new one installed. =
*/
 	KUNIT_EXPECT_EQ(test, kref_read(&stream->refcount), 1);
 	KUNIT_EXPECT_NOT_NULL(test, crtc->state);

--uNkFzDPxWkscMViP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqtL0EACgkQJNaLcl1U
h9ASxwf+Lqz0taae78o3god7qB2eBXr3AJprmMhyZ9wKpz8BTcxvLk8ISGZSOcUD
2Uu8aOIXCBV3Wz+ebUjAG2lPvvhFQX8+VTKBWOgOaPAPQWgstp30fy+eX6tMkzVq
H/0thFS6T94jXa/8mnCDCVjeHvihregqwgQN8rJU7ydRym61Cb/xIZVOYTxI/yZd
J8g7x4jkJkZcjqiUGLnTx9uTDEzgTE4s24nbD9GTfeMSPcSlImFU9aZ74L0eTwdY
JYYkzjNnJjss4Ozsq9JPqIWMrXqK7bQ/VTDym1h+sPQA/id5dQ7OE/nxftPPQh4Q
5kwsntnqrMeRKznhgHa2NvD07Kyxzw==
=8TcT
-----END PGP SIGNATURE-----

--uNkFzDPxWkscMViP--
