Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3346859C996;
	Tue,  8 Sep 2026 18:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788891738; cv=none; b=TOFIT2wYyLunvtxBTFezYpHEpfh4fxc7T/grU2rAsbvazhCj8TN9rXpM+5EMscLF3bcLvSBfZK12uO9cKfqcyMXNrbmTbbwnenut1HEZ4TagNRDBOWeC4EyQ3uHqG3iQOlqWM708cjcQTFm93mjOjjtbXbcvLWKe46X0Jm+qkus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788891738; c=relaxed/simple;
	bh=BM3fZl19IwFWW2VmP2bope9le0t3zCvilbHR6XjSCUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YYeN6QnmYEWbE48KGhHthRheTQK8MeyJ/iUJoA9fHP0FGen13xZqOYVxywxUhk3zIdNXUhhIihN6YdLDtWWFuQUaS52LT/MpGe3prehQVqMndTu4Krj6OdsRHDjuIXkIcswNl2YX3iMvu4TttlFCV9furGgf+8IPe/5ub6NT3+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FV0Q0PyA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FV0Q0PyA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D42FA1F00A3A;
	Tue,  8 Sep 2026 18:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788891737;
	bh=bBK+lkdc8WwiRkWcvS70bm/lr9IbN1ckG2JedwJWCmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FV0Q0PyAlsj3gQkYvccOjxyp+wPNNQG1o/rEV7PrXLd6ooywnFzhHawMwm7THW4bn
	 Fs407hAZxIWOsik+ISyaQA3IpJqwRtIuYOPDtCK4AOu1J9v7krVn8dCsj3TG0eSHWd
	 R57yUqiDllBWT7BraNBPDKy/Vkz5y76VabfYXqu7gaBUE0I9iwcpieLMM364QCzInf
	 PeF9WjHYW8Q/SE14yzpXEaBEdZI+t9Fl+9PHKtLVeJvjMzmnhopUWQXvCut6neZu8E
	 Us9ls+kXfbhk1+hYLilxEK3ssN+L/pr9C4x2DDRHhVVz7yFGK6dkZ1j0Xdwi0/kZGN
	 oWL9QLrbmFYCg==
Date: Tue, 8 Sep 2026 19:22:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Alex Huang <Alex.Huang2@amd.com>,
	Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
	Fangzhi Zuo <jerry.zuo@amd.com>, Ivan Lipski <ivan.lipski@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mario Limonciello <superm1@kernel.org>,
	Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
	Tom Chung <chiahsuan.chung@amd.com>
Subject: Re: linux-next: manual merge of the amdgpu tree with the drm-misc
 tree
Message-ID: <f28a4c40-dd14-4488-9a4d-68055713b262@sirena.org.uk>
References: <aqA5IjDLvW7ANQ3K@sirena.org.uk>
 <042afcca-18a6-4372-ad16-c2096c216b98@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/ERcDeG73J2zZuhT"
Content-Disposition: inline
In-Reply-To: <042afcca-18a6-4372-ad16-c2096c216b98@sirena.org.uk>
X-Cookie: The world is not octal despite DEC.


--/ERcDeG73J2zZuhT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2026 at 06:16:28PM +0100, Mark Brown wrote:
> On Tue, Sep 08, 2026 at 05:34:48PM +0100, Mark Brown wrote:

> The merge here is wrong, and there's more extensive conflicts including

> I'll get something that builds but no idea if it'll work.

Final fixup below which almost certainly will not work, this is a
semantic conflict which you probably want to resolve with a direct merge
yourselves.  If you've got a better fixup I can drop it in.

=46rom f9c146baa10ead28e3356fba8ff966ec15b5d32b Mon Sep 17 00:00:00 2001
=46rom: Mark Brown <broonie@kernel.org>
Date: Tue, 8 Sep 2026 17:42:52 +0100
Subject: [PATCH] drm: amd: Problematic merge fixup

Almost certainly broken, a semantic conflict after the rerere stage :(

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  5 +++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  5 ++++-
 .../display/amdgpu_dm/amdgpu_dm_connector.c   | 22 -------------------
 .../display/amdgpu_dm/tests/amdgpu_dm_test.c  |  4 ++--
 4 files changed, 9 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 7e5bc461f8839..09385cb53eca6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3076,6 +3076,7 @@ fill_dc_plane_info_and_addr(struct amdgpu_device *ade=
v,
 EXPORT_IF_KUNIT(fill_dc_plane_info_and_addr);
=20
 STATIC_IFN_KUNIT int fill_dc_plane_attributes(struct amdgpu_device *adev,
+					      struct drm_atomic_commit *state,
 					      struct dc_plane_state *dc_plane_state,
 					      struct drm_plane_state *plane_state,
 					      struct drm_crtc_state *crtc_state)
@@ -3095,7 +3096,7 @@ STATIC_IFN_KUNIT int fill_dc_plane_attributes(struct =
amdgpu_device *adev,
 	dc_plane_state->clip_rect =3D scaling_info.clip_rect;
 	dc_plane_state->scaling_quality =3D scaling_info.scaling_quality;
=20
-	ret =3D fill_dc_plane_info_and_addr(adev, plane_state->state, plane_state,
+	ret =3D fill_dc_plane_info_and_addr(adev, state, plane_state,
 					  &plane_info,
 					  &dc_plane_state->address,
 					  afb->tmz_surface);
@@ -5970,7 +5971,7 @@ static int dm_update_plane_state(struct dc *dc,
 				 plane->base.id, new_plane_crtc->base.id);
=20
 		ret =3D fill_dc_plane_attributes(
-			drm_to_adev(new_plane_crtc->dev),
+			drm_to_adev(new_plane_crtc->dev), state,
 			dc_new_plane_state,
 			new_plane_state,
 			new_crtc_state);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 18ee988251557..b4f677aceb60e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -1260,6 +1260,7 @@ void mmhub_read_system_context(struct amdgpu_device *=
adev,
 int amdgpu_dm_init_power_module(struct amdgpu_display_manager *dm);
 int dm_early_init(struct amdgpu_ip_block *ip_block);
 int fill_dc_plane_info_and_addr(struct amdgpu_device *adev,
+                                struct drm_atomic_commit *state,
 				const struct drm_plane_state *plane_state,
 				struct dc_plane_info *plane_info,
 				struct dc_plane_address *address, bool tmz_surface);
@@ -1272,7 +1273,9 @@ int amdgpu_dm_mode_config_init(struct amdgpu_device *=
adev);
 int initialize_plane(struct amdgpu_display_manager *dm, struct amdgpu_mode=
_info *mode_info,
 		     int plane_id, enum drm_plane_type plane_type,
 		     const struct dc_plane_cap *plane_cap);
-int fill_dc_plane_attributes(struct amdgpu_device *adev, struct dc_plane_s=
tate *dc_plane_state,
+int fill_dc_plane_attributes(struct amdgpu_device *adev,
+			     struct drm_atomic_commit *state,
+			     struct dc_plane_state *dc_plane_state,
 			     struct drm_plane_state *plane_state,
 			     struct drm_crtc_state *crtc_state);
 #endif
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
index 147459e48e136..738fee11d2678 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
@@ -3767,28 +3767,6 @@ void amdgpu_dm_update_freesync_caps(struct drm_conne=
ctor *connector,
 	} else if (drm_edid &&
 		  (sink->sink_signal =3D=3D SIGNAL_TYPE_HDMI_TYPE_A ||
 		   sink->sink_signal =3D=3D SIGNAL_TYPE_HDMI_FRL)) {
-		i =3D parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
-		if (i >=3D 0) {
-			amdgpu_dm_connector->vsdb_info =3D vsdb_info;
-			sink->edid_caps.freesync_vcp_code =3D vsdb_info.freesync_mccs_vcp_code;
-
-			if (vsdb_info.freesync_supported) {
-				amdgpu_dm_connector->min_vfreq =3D vsdb_info.min_refresh_rate_hz;
-				amdgpu_dm_connector->max_vfreq =3D vsdb_info.max_refresh_rate_hz;
-				if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > =
10)
-					freesync_capable =3D true;
-
-				connector->display_info.monitor_range.min_vfreq =3D vsdb_info.min_refr=
esh_rate_hz;
-				connector->display_info.monitor_range.max_vfreq =3D vsdb_info.max_refr=
esh_rate_hz;
-			}
-		}
-
-		drm_dbg_driver(adev_to_drm(adev),
-			       "VRR: amd_vsdb i=3D%d fs_sup=3D%d min=3D%d max=3D%d fs_capable=
=3D%d\n",
-			       i, vsdb_info.freesync_supported,
-			       vsdb_info.min_refresh_rate_hz,
-			       vsdb_info.max_refresh_rate_hz, freesync_capable);
-
 		/*
 		 * If AMD VSDB didn't provide a valid FreeSync range, fall back to
 		 * the HDMI 2.1 VRR capability parsed from the HF-VSDB.
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_test.c b=
/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_test.c
index ccc3fda7f3502..fc53b1bffe998 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_test.c
@@ -3628,7 +3628,7 @@ dm_test_plane_info_ctx_alloc(struct kunit *test, stru=
ct amdgpu_device *adev,
=20
 static int dm_test_fill_plane_info(struct dm_test_plane_info_ctx *ctx)
 {
-	return fill_dc_plane_info_and_addr(ctx->adev, ctx->plane_state,
+	return fill_dc_plane_info_and_addr(ctx->adev, NULL, ctx->plane_state,
 					   &ctx->plane_info, &ctx->address, false);
 }
=20
@@ -4110,7 +4110,7 @@ dm_test_plane_attr_ctx_alloc(struct kunit *test, u32 =
drm_format)
=20
 static int dm_test_fill_plane_attr(struct dm_test_plane_attr_ctx *ctx)
 {
-	return fill_dc_plane_attributes(ctx->adev, ctx->dc_plane,
+	return fill_dc_plane_attributes(ctx->adev, NULL, ctx->dc_plane,
 					ctx->plane->plane_state, &ctx->crtc_state->base);
 }
=20
--=20
2.47.3


--/ERcDeG73J2zZuhT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqgUlIACgkQJNaLcl1U
h9DJhgf/TBPCR9dWxlC6EIRDYh+BB7KDQGZ4wBZ1EWGOEWDcRJkPUAhGj/hWkIsm
ZqItK5jxtk8loKcCKQrtLP47W+rHsG8S5temSQjjQzhXPw/bmoDOPHDMnSoJZyq/
wHr0fTHW6PHgy8Up7aLO/V7MnSGKuV7qBijcC0cxMKl34Pt38CRgkw0M5PQz5KbQ
kCzdoU+Iqq1Ca6voChXrr9a7aVfguHZYHh0GJgX18/+faE8RtjQgwaj/JIorMamV
nbup9wk+3fy3qvsqUk9t86F49R0Tvespfr4pInJW7GpWWBfaXDaN0eSawfQcBGgT
zcGUrn38ruWU0obTp55UcrqwRqWRyQ==
=zKPw
-----END PGP SIGNATURE-----

--/ERcDeG73J2zZuhT--
