Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0462F60B2;
	Fri, 11 Sep 2026 15:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139402; cv=none; b=E1pjcOgxpZTovmLGxSwETC2uKV8+q4nPZXrJ3kmnGMk7zYX/miUYzZ2K1XmyXEkznt+dLJ9jd5NVH8tvdpGlwJ1xDVnPuevRdYUO2F4wkdeS0OoqWCJww1cQJRvDbJfXghaoCR5fy0XPim7ueAFVr4RVxCUEzq81sOhJhd3jyiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139402; c=relaxed/simple;
	bh=NEbPSZ2t00eU18Z5kxCrMQCqugRoIk0GDnvLDMI8x/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GC0LkJWhBpOmSgc761V8M1j4OxbQyeUwl1vQNmCgfUlA98eHzeSlGIZSswXfUQ1W0QIozlvArvrBKnei6XQzpeCLI48Y3/F2VePPKdon+uxQGeON10y+PVqV2hsIBZI0laBAeOLwmumyuBuAcjiid8BC0EMHK8mE2JVFp1PPp7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AMkcoDsT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AMkcoDsT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E151F000FF;
	Fri, 11 Sep 2026 15:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789139400;
	bh=OZM5g0rSgwoNM6soW2oPcrS1vpn8S3mwVUqbQA7qr34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AMkcoDsThp6Kp6zr/xdcXcsyslcanXAulZRLL33UUkq1kKY8UO5zBKCSooqpUwhT2
	 KINgu3P/IRe4Tij8ksdF7V0GRVaKGq344q/tw/pr0LZ9Di3/X3f3NC7ZgRmVSKIhGz
	 jsROJGEMwvuOpxxK7mMxbXPl1OtUMDdOWP8rMcxMIoFpX2YC+cAzA0aDTdgyyWPmIv
	 VyChy5FgjUbaiaA9I+Oh5kdMMVscMgTfQDhfvO3Nl0xUXdBOyC8PTYYzFYaMbdc3w2
	 XxlXDH63hSDMP7guUg6SLvu4bBcbnS3XFgHC+wQpf8bJ0U31nS5WG1zjMfRyOGbZqc
	 4pwshBpJsXesQ==
Date: Fri, 11 Sep 2026 16:09:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Alex Huang <Alex.Huang2@amd.com>, Alex Hung <alex.hung@amd.com>,
	Alvin Lee <Alvin.Lee2@amd.com>,
	Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
	Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
	Dillon Varone <Dillon.Varone@amd.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Fangzhi Zuo <jerry.zuo@amd.com>, Feifei Xu <Feifei.Xu@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Ivan Lipski <ivan.lipski@amd.com>, James Lin <pinglei.lin@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Maarten Lankhorst <dev@lankhorst.se>,
	Mario Limonciello <superm1@kernel.org>,
	Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
	Ray Wu <ray.wu@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Satyajit Roy <sroy14@alum.utk.edu>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>,
	Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
	Tom Chung <chiahsuan.chung@amd.com>,
	Wenjing Liu <wenjing.liu@amd.com>,
	YiPeng Chai <YiPeng.Chai@amd.com>
Subject: Re: linux-next: manual merge of the amdgpu tree with the
 drm-misc,drm-fixes tree
Message-ID: <b727a292-7d88-457f-ad7f-e0149d9777ab@sirena.org.uk>
References: <aqQBUuTVpgnTkQ8k@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0mf8J3IckdF05zKY"
Content-Disposition: inline
In-Reply-To: <aqQBUuTVpgnTkQ8k@sirena.org.uk>
X-Cookie: Piece of cake!


--0mf8J3IckdF05zKY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 02:25:38PM +0100, Mark Brown wrote:
> Hi all,
>=20
> Today's linux-next merge of the amdgpu tree got conflicts in:
>=20
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.h
>   drivers/gpu/drm/amd/display/dc/clk_mgr/dcn60/dcn60_clk_mgr.c

*sigh*  This isn't the right fixup in a similar way to what happened
earlier this week.  In this case it looks like whatever you are doing
has massively confused git too, there's horrible messes in files that
didn't show up as needing merge resolutions.  I've done something that
builds but I'm confident it doesn't work, especially given that it's
layered on top of the cleanup of the earlier fallout which I'm also
confident didn't work.

Please, could you have a look at your processes so that you are not
continually introducing noisy conflicts with your own work so that when
there is an actual conflict like seems to be happening here it's
actually visible when doing the resolution rather than showing up as
build failures like this. =20

One thing that would be very helpful if you have a super invasive change
would be to actively merge up branches that conflict so they're not so
visible externally, this looks a lot like something we went through the
entire last release cycle with *huge* conflicts caused by splitting up a
big file needing to be redone every time either your fixes or new work
touched that file, when there's a change in a conflict I have to redo
the whole merge.

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 2db5fd0e72d16..0c19188df3755 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2941,7 +2941,7 @@ STATIC_IFN_KUNIT bool modereset_required(struct drm_c=
rtc_state *crtc_state)
 EXPORT_IF_KUNIT(modereset_required);
=20
 STATIC_IFN_KUNIT int
-fill_plane_color_attributes(struct drm_atomic_commit *state,
+fill_plane_color_attributes(const struct drm_atomic_commit *state,
 			    const struct drm_plane_state *plane_state,
 			    const enum surface_pixel_format format,
 			    enum dc_color_space *color_space)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 27753bf50b706..256d2c0e5fba3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -1242,7 +1242,8 @@ bool update_planes_and_stream_adapter(struct dc *dc,
 				      struct dc_stream_state *stream,
 				      struct dc_stream_update *stream_update,
 				      struct dc_surface_update *array_of_surface_update);
-int fill_plane_color_attributes(const struct drm_plane_state *plane_state,
+int fill_plane_color_attributes(const struct drm_atomic_commit *state,
+				const struct drm_plane_state *plane_state,
 				const enum surface_pixel_format format,
 				enum dc_color_space *color_space);
 bool modereset_required(struct drm_crtc_state *crtc_state);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
index d3d362a99674e..d76ebf145dfc3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
@@ -3666,42 +3666,6 @@ STATIC_IFN_KUNIT bool parse_edid_cea_dmcu(struct amd=
gpu_display_manager *dm,
 		u8 *edid_ext, int len,
 		struct amdgpu_hdmi_vsdb_info *vsdb_info)
 {
-	int i;
-
-	/* send extension block to DMCU for parsing */
-	for (i =3D 0; i < len; i +=3D 8) {
-		bool res;
-		int offset;
-
-		/* send 8 bytes a time */
-		if (!dc_edid_parser_send_cea(dm->dc, i, len, &edid_ext[i], 8))
-			return false;
-
-		if (i+8 =3D=3D len) {
-			/* EDID block sent completed, expect result */
-			int version, min_rate, max_rate;
-
-			res =3D dc_edid_parser_recv_amd_vsdb(dm->dc, &version, &min_rate, &max_=
rate);
-			if (res) {
-				/* amd vsdb found */
-				vsdb_info->freesync_supported =3D 1;
-				vsdb_info->amd_vsdb_version =3D version;
-				vsdb_info->min_refresh_rate_hz =3D min_rate;
-				vsdb_info->max_refresh_rate_hz =3D max_rate;
-				/* Not enabled on DMCU*/
-				vsdb_info->freesync_mccs_vcp_code =3D 0;
-				return true;
-			}
-			/* not amd vsdb */
-			return false;
-		}
-
-		/* check for ack*/
-		res =3D dc_edid_parser_recv_cea_ack(dm->dc, &offset);
-		if (!res)
-			return false;
-	}
-
 	return false;
 }
 EXPORT_IF_KUNIT(parse_edid_cea_dmcu);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connecto=
r_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_=
test.c
index 8107be27d324e..19ead11b5e73c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.c
@@ -6140,57 +6140,16 @@ static bool dm_test_dmcu_is_init(struct dmcu *dmcu)
 	return true;
 }
=20
-static bool dm_test_dmcu_send_cea(struct dmcu *dmcu, int offset,
-				  int total_length, u8 *data, int length)
-{
-	return true;
-}
-
-static bool dm_test_dmcu_recv_ack_ok(struct dmcu *dmcu, int *offset)
-{
-	*offset =3D 0;
-	return true;
-}
-
-static bool dm_test_dmcu_recv_ack_fail(struct dmcu *dmcu, int *offset)
-{
-	return false;
-}
-
-static bool dm_test_dmcu_recv_vsdb_found(struct dmcu *dmcu, int *version,
-					 int *min_frame_rate, int *max_frame_rate)
-{
-	*version =3D 2;
-	*min_frame_rate =3D 24;
-	*max_frame_rate =3D 60;
-	return true;
-}
-
-static bool dm_test_dmcu_recv_vsdb_none(struct dmcu *dmcu, int *version,
-					int *min_frame_rate, int *max_frame_rate)
-{
-	return false;
-}
-
 static const struct dmcu_funcs dm_test_dmcu_funcs_vsdb =3D {
 	.is_dmcu_initialized =3D dm_test_dmcu_is_init,
-	.send_edid_cea =3D dm_test_dmcu_send_cea,
-	.recv_edid_cea_ack =3D dm_test_dmcu_recv_ack_ok,
-	.recv_amd_vsdb =3D dm_test_dmcu_recv_vsdb_found,
 };
=20
 static const struct dmcu_funcs dm_test_dmcu_funcs_novsdb =3D {
 	.is_dmcu_initialized =3D dm_test_dmcu_is_init,
-	.send_edid_cea =3D dm_test_dmcu_send_cea,
-	.recv_edid_cea_ack =3D dm_test_dmcu_recv_ack_ok,
-	.recv_amd_vsdb =3D dm_test_dmcu_recv_vsdb_none,
 };
=20
 static const struct dmcu_funcs dm_test_dmcu_funcs_ackfail =3D {
 	.is_dmcu_initialized =3D dm_test_dmcu_is_init,
-	.send_edid_cea =3D dm_test_dmcu_send_cea,
-	.recv_edid_cea_ack =3D dm_test_dmcu_recv_ack_fail,
-	.recv_amd_vsdb =3D dm_test_dmcu_recv_vsdb_none,
 };
=20
 /*
@@ -6295,37 +6254,6 @@ static void dm_test_parse_cea_dmcu_empty(struct kuni=
t *test)
  */
 static void dm_test_parse_cea_dmcu_no_dmcu(struct kunit *test)
 {
-	struct amdgpu_display_manager *dm =3D dm_test_alloc_dm_dmcu(test, NULL);
-	struct amdgpu_hdmi_vsdb_info vsdb =3D {0};
-	u8 ext[DMUB_EDID_CEA_DATA_CHUNK_BYTES] =3D {0};
-	bool ret;
-
-	/* res_pool->dmcu is NULL, so the CEA send returns false. */
-	ret =3D parse_edid_cea_dmcu(dm, ext, DMUB_EDID_CEA_DATA_CHUNK_BYTES,
-				  &vsdb);
-	KUNIT_EXPECT_FALSE(test, ret);
-}
-
-/**
- * dm_test_parse_cea_dmcu_vsdb_found - Test the DMCU reports an AMD VSDB
- * @test: KUnit test context
- */
-static void dm_test_parse_cea_dmcu_vsdb_found(struct kunit *test)
-{
-	struct amdgpu_display_manager *dm =3D
-		dm_test_alloc_dm_dmcu(test, &dm_test_dmcu_funcs_vsdb);
-	struct amdgpu_hdmi_vsdb_info vsdb =3D {0};
-	u8 ext[DMUB_EDID_CEA_DATA_CHUNK_BYTES] =3D {0};
-	bool ret;
-
-	ret =3D parse_edid_cea_dmcu(dm, ext, DMUB_EDID_CEA_DATA_CHUNK_BYTES,
-				  &vsdb);
-	KUNIT_EXPECT_TRUE(test, ret);
-	KUNIT_EXPECT_TRUE(test, vsdb.freesync_supported);
-	KUNIT_EXPECT_EQ(test, vsdb.amd_vsdb_version, 2);
-	KUNIT_EXPECT_EQ(test, vsdb.min_refresh_rate_hz, 24);
-	KUNIT_EXPECT_EQ(test, vsdb.max_refresh_rate_hz, 60);
-	KUNIT_EXPECT_EQ(test, vsdb.freesync_mccs_vcp_code, 0);
 }
=20
 /**
@@ -9159,7 +9087,6 @@ static struct kunit_case amdgpu_dm_connector_tests[] =
=3D {
 	KUNIT_CASE(dm_test_send_cea_dmub_unavailable),
 	KUNIT_CASE(dm_test_parse_cea_dmcu_empty),
 	KUNIT_CASE(dm_test_parse_cea_dmcu_no_dmcu),
-	KUNIT_CASE(dm_test_parse_cea_dmcu_vsdb_found),
 	KUNIT_CASE(dm_test_parse_cea_dmcu_vsdb_none),
 	KUNIT_CASE(dm_test_parse_cea_dmcu_multi_chunk),
 	KUNIT_CASE(dm_test_parse_cea_dmcu_ack_fail),
diff --git a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h b/drivers/gpu/=
drm/amd/display/dmub/inc/dmub_cmd.h
index 45385f9eb8932..58826291827b1 100644
--- a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
+++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
@@ -1957,6 +1957,10 @@ enum dmub_cmd_type {
 	 * Command type used for interfacing with DPIA.
 	 */
 	DMUB_CMD__DPIA =3D 77,
+        /**
+         * Command type used for EDID CEA parsing
+         */
+        DMUB_CMD__EDID_CEA =3D 79,
 	/**
 	 * Command type used for getting usbc cable ID
 	 */
@@ -6926,6 +6930,72 @@ struct dmub_rb_cmd_transmitter_set_phy_fsm {
 	struct dmub_rb_cmd_transmitter_set_phy_fsm_data data; /**< payload */
 };
=20
+/**
+ * Maximum number of bytes a chunk sent to DMUB for parsing
+ */
+#define DMUB_EDID_CEA_DATA_CHUNK_BYTES 8
+
+/**
+ *  Represent a chunk of CEA blocks sent to DMUB for parsing
+ */
+struct dmub_cmd_send_edid_cea {
+        uint16_t offset;        /**< offset into the CEA block */
+        uint8_t length; /**< number of bytes in payload to copy as part of=
 CEA block */
+        uint16_t cea_total_length;  /**< total length of the CEA block */
+        uint8_t payload[DMUB_EDID_CEA_DATA_CHUNK_BYTES]; /**< data chunk o=
f the CEA block */
+        uint8_t pad[3]; /**< padding and for future expansion */
+};
+
+/**
+ * Result of VSDB parsing from CEA block
+ */
+struct dmub_cmd_edid_cea_amd_vsdb {
+        uint8_t vsdb_found;             /**< 1 if parsing has found valid =
AMD VS
+DB */
+        uint8_t freesync_supported;     /**< 1 if Freesync is supported */
+        uint16_t amd_vsdb_version;      /**< AMD VSDB version */
+        uint16_t min_frame_rate;        /**< Maximum frame rate */
+        uint16_t max_frame_rate;        /**< Minimum frame rate */
+        uint8_t freesync_mccs_vcp_code; /**< Freesync MCCS VCP code */
+};
+
+/**
+ * Result of sending a CEA chunk
+ */
+struct dmub_cmd_edid_cea_ack {
+        uint16_t offset;        /**< offset of the chunk into the CEA bloc=
k */
+        uint8_t success;        /**< 1 if this sending of chunk succeeded =
*/
+        uint8_t pad;            /**< padding and for future expansion */
+};
+
+/**
+ * Specify whether the result is an ACK/NACK or the parsing has finished
+ */
+enum dmub_cmd_edid_cea_reply_type {
+        DMUB_CMD__EDID_CEA_AMD_VSDB     =3D 1, /**< VSDB parsing has finis=
hed */
+        DMUB_CMD__EDID_CEA_ACK          =3D 2, /**< acknowledges the CEA s=
ending i
+s OK or failing */
+};
+
+/**
+ * Definition of a DMUB_CMD__EDID_CEA command.
+ */
+struct dmub_rb_cmd_edid_cea {
+        struct dmub_cmd_header header;  /**< Command header */
+        union dmub_cmd_edid_cea_data {
+                struct dmub_cmd_send_edid_cea input; /**< input to send CE=
A chun
+ks */
+                struct dmub_cmd_edid_cea_output { /**< output with results=
 */
+                        uint8_t type;   /**< dmub_cmd_edid_cea_reply_type =
*/
+                        union {
+                                struct dmub_cmd_edid_cea_amd_vsdb amd_vsdb;
+                                struct dmub_cmd_edid_cea_ack ack;
+                        };
+                } output;       /**< output to retrieve ACK/NACK or VSDB p=
arsing results */
+        } data; /**< Command data */
+
+};
+
 /**
  * struct dmub_cmd_cable_id_input - Defines the input of DMUB_CMD_GET_USBC=
_CABLE_ID command.
  */
@@ -7797,6 +7867,12 @@ union dmub_rb_cmd {
 	 * Definition of a DMUB_CMD__DPIA_SET_TPS_NOTIFICATION command.
 	 */
 	struct dmub_rb_cmd_set_tps_notification set_tps_notification;
+
+        /**
+         * Definition of a DMUB_CMD__EDID_CEA command.
+         */
+        struct dmub_rb_cmd_edid_cea edid_cea;
+
 	/**
 	 * Definition of a DMUB_CMD_GET_USBC_CABLE_ID command.
 	 */

--0mf8J3IckdF05zKY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqkGcAACgkQJNaLcl1U
h9CW6gf9GHms+yasklG7FQQzdJducRyDgb1f4HH7nxpZgyUbhJGiDHTkEKvXCPwU
e0mWbUHFzq8DJg1ZwUKMaf+exp7bmMX7bRDUqMWLKxbRZIx0+Gq8yW/PFOc4/GSc
jwFwOCbX9nJT7Kcro+jguD7l/P56SSFHxU4LCNtjXvfkRcCbNznzpSk3D11yVedh
atA2pha5swCG2TGPgf/KKWkg+ISZgbL2p9mfo1LtvueqkrVRjk0DAuhuZzTZtlKi
lI1vbxaQtJN1x0WHJmaapThL4ONZ3/onawq30qhtgP88ZrmMlmM06K0Bp0VYF7xB
+OHej55NVBSqZ7uijuiHD3QIGt1Lkg==
=BtXi
-----END PGP SIGNATURE-----

--0mf8J3IckdF05zKY--
