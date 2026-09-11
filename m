Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10D139022A;
	Fri, 11 Sep 2026 13:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133155; cv=none; b=alBy8l9OXKL0DBmc1nxBibPyXT1Qpqss1FRqyxH/I8SoJ7eVtRqxc2Twt3JyQ97GZtK5zr+zYOEQfB3kFBRmhVL3Y5t/XtTqFXt2dfKKbLCARuNW9muUlYkpduAps57+9WCbT/R0K7NJCnyILKH7HfplKAoXdnkxLKdOrmXc33U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133155; c=relaxed/simple;
	bh=gu7upPOG4hlz/kv5UXXrOclnt8mPjJNMpA4+aXsDh/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lh3at9wJWEE5omXty4eYlsvc+y9vYI6j6lhF3WcLLKZ8C8kCvRaKtyw8oH83AOtPdGIzj7JJMYekMM46xJkHYwV6bEoVjtDsp8j2GMJ58E83DzUnKaODHYSKJi/OHe03LYGg3sXJC6gknEqa5L5n+vzTqEfY2Qjmf/FHE3FZEyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B9wskWpp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B9wskWpp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54E11F000FF;
	Fri, 11 Sep 2026 13:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789133145;
	bh=2d4r3VHRQmgYBwHRCy8gMha+5LuVm+feNz9NctvM7do=;
	h=Date:From:To:Cc:Subject;
	b=B9wskWpprZaGp4xY7b1q1wA07T8lU+xSE3AT+V1FAfdA8coNQYRLjp9IgB6NltbQv
	 tns/6sNZru4oRYAd5D6y0aQtvfQvcqhyaa2GG31mfmaqjo0owtCBnAtju4wWUfZGAf
	 mc7rCrxvtM/4mKKO9KoqcMc86dhC2w1b2XUTk/R910z/lAWjq8vxZF4h7Pjz7Vn+F9
	 6knMWpzquSr5Evn6JJSYcbGcjwdSYmJRz5nUdyD9C85xW/E6QOMX8tURd9IygMIJC7
	 ew9bIStr8TC7sIn/R8wymz34piVv/mJKj3SfDZRQB6t/u+KlvVVAn30gFuLlwKzorv
	 MtJG55FCm/WoQ==
Date: Fri, 11 Sep 2026 14:25:38 +0100
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
Subject: linux-next: manual merge of the amdgpu tree with the
 drm-misc,drm-fixes tree
Message-ID: <aqQBUuTVpgnTkQ8k@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WxgIsQnhghkXxs0V"
Content-Disposition: inline


--WxgIsQnhghkXxs0V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got conflicts in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.h
  drivers/gpu/drm/amd/display/dc/clk_mgr/dcn60/dcn60_clk_mgr.c

between commits:

  cfdcf5571c310 ("drm/amd/display: Consult MCCS FreeSync cap only if reques=
ted & supported")
  87ceb8cba73d0 ("drm/amdgpu: skip the VMID 0 flush for VRAM")
  7fca7acd60a22 ("drm/amd/display: Honor Broadcast RGB for BT.2020 RGB outp=
ut")
  bd4f284df04d7 ("drm/amdgpu: Wire up dmem cgroup reclaim for VRAM manager")
  f65198b3d0738 ("drm/amd/display: Use HDMI FreeSync range from common EDID=
 parser")
  ee28f3446dde3 ("drm/amd/display: Clean up FreeSync capability detection")
  ef2e8220c9644 ("drm/amd/display: Check actual state during commit_tail")
  730c6d8072d8d ("drm/amd/display: Drop KUnit tests for removed parse_hdmi_=
amd_vsdb()")

=66rom the drm-misc,drm-fixes tree and commits:

  7ea37c0f06787 ("drm/amd/display: Force FreeSync range minimum on quirky p=
anels")
  dd7f86c389aea ("drm/amd/display: Update dcn60 clkmgr interfaces")
  ab07c95defdd9 ("drm/amd/display: Apply workaround to limit SopCount for n=
ow")
  48c4aaeef6219 ("drm/amdgpu/ttm: Make buffer copy source readonly")
  762e89c63a388 ("drm/amd/display: Guard against empty DCN6 UTM QoS table")
  b5b05ce478a10 ("drm/amd/display: Rename carried dce clock manager functio=
ns for dcn10")
  ecaca20be81ce ("drm/amdgpu: Remove is_idle (trivial cases)")
  b7146153a6754 ("drm/amdgpu: Add bad page preloading and pre-reservation s=
upport")
  e3d5618d4dad3 ("drm/amd/display: Test GPU memory allocation")
  985c7177f630c ("drm/amd/display: Cover amdgpu_dm_encoder_init")
  01678168f9d55 ("drm/amd/display: Cover amdgpu_dm_connector_atomic_check")
  0d3ff9e9bbbc7 ("drm/amd/display: Cover amdgpu_dm_connector_get_modes")
  889f15060c3da ("drm/amd/display: Cover amdgpu_set_panel_orientation")
  5113a08a4ba47 ("drm/amd/display: Cover amdgpu_dm_prune_primary_tile_modes=
")
  11b7722b8ac69 ("drm/amd/display: Refactor hdmi_frl_status_polling_work fo=
r Kunit testing")
  4827661d374b9 ("drm/amd/display: Cover hdmi_frl_status_polling_work")
  8dade94422319 ("drm/amd/display: Cover amdgpu_dm_create_i2c")
  2eee94d2e09e4 ("drm/amdgpu: query the reserved info with get_fw_reserved_=
info")
  1f47aaf3ff0d8 ("drm/amd/display: Add HDMI 2.1 FreeSync support for AMD VS=
DB")
  fa3389c713799 ("drm/amd/display: Add HDMI 2.1 VRR support for HF-VSDB")
  8982d9555267a ("drm/amd/display: Guard DAL port idle optimizations by ASI=
C rev")
  9f915dcc9f1a7 ("drm/amd/display: Test DM atomic private state helpers")
  c8130c0538f08 ("drm/amd/display: Test affected MST DSC CRTC selection")
  1903ffbca1b1b ("drm/amd/display: Test cursor commit")
  b56e334dbd557 ("drm/amd/display: Test vblank event arming")
  0e956130a2705 ("drm/amd/display: Test page flip interrupt state update")
  3bc69baf5e153 ("drm/amd/display: Test CRTC memory domain change detection=
")
  9885f7d5bd6fb ("drm/amd/display: Test PSR dirty rectangle filling")
  d0f8af4787d0a ("drm/amd/display: Test plane reset decision")
  334a9a3bf317e ("drm/amd/display: Test link and sink dump")
  448defc23908c ("drm/amd/display: Test HDCP update")
  00eaae7bca217 ("drm/amd/display: Add override capability for UTM table pa=
rams")
  094901372adc0 ("drm/amd/display: Dump clock registers in HW init instead =
of SW init")
  022236eaa63bb ("drm/amd/display: Honor Broadcast RGB for BT.2020 RGB outp=
ut")
  0412b1064a3bd ("drm/amd/display: Cover EDID CEA parsing helpers")

=66rom the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 016957cac1f29,0e313d7916a4b..0000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
diff --cc drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 774028dd9ff48,c99a84bb040e5..0000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
diff --cc drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
index e2e76e56edb5b,676046ea2da1d..0000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
@@@ -3717,43 -3902,95 +3872,111 @@@ void amdgpu_dm_update_freesync_caps(str
  	     connector->display_info.monitor_range.max_vfreq =3D=3D 0))
  		parse_edid_displayid_vrr(connector, edid);
 =20
 -	if (edid && (sink->sink_signal =3D=3D SIGNAL_TYPE_DISPLAY_PORT ||
 -		     sink->sink_signal =3D=3D SIGNAL_TYPE_EDP)) {
 -		if (amdgpu_dm_connector->dc_link &&
 -		    amdgpu_dm_connector->dc_link->dpcd_caps.allow_invalid_MSA_timing_pa=
ram) {
 -			amdgpu_dm_connector->min_vfreq =3D connector->display_info.monitor_ran=
ge.min_vfreq;
 -			amdgpu_dm_connector->max_vfreq =3D connector->display_info.monitor_ran=
ge.max_vfreq;
 -			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > =
10)
 -				freesync_capable =3D true;
 -		}
 +	has_vsdb =3D get_amd_vsdb(amdgpu_dm_connector, &vsdb_info) !=3D 0;
 =20
 -		get_amd_vsdb(amdgpu_dm_connector, &vsdb_info);
 +	if (has_vsdb) {
 +		amdgpu_dm_connector->vsdb_info =3D vsdb_info;
 +
 +		/* copy refresh rate info as long as VSDB advertises FreeSync */
 +		if (vsdb_info.freesync_supported) {
 +			amdgpu_dm_connector->min_vfreq =3D vsdb_info.min_refresh_rate_hz;
 +			amdgpu_dm_connector->max_vfreq =3D vsdb_info.max_refresh_rate_hz;
 +
 +			connector->display_info.monitor_range.min_vfreq =3D
 +				vsdb_info.min_refresh_rate_hz;
 +			connector->display_info.monitor_range.max_vfreq =3D
 +				vsdb_info.max_refresh_rate_hz;
 +		}
 +	} else {
 +		/* fall back to the base EDID range when there is no VSDB */
 +		amdgpu_dm_connector->min_vfreq =3D connector->display_info.monitor_rang=
e.min_vfreq;
 +		amdgpu_dm_connector->max_vfreq =3D connector->display_info.monitor_rang=
e.max_vfreq;
 +	}
 +
 +	if (sink->sink_signal =3D=3D SIGNAL_TYPE_DISPLAY_PORT ||
 +	    sink->sink_signal =3D=3D SIGNAL_TYPE_EDP) {
 +		if (amdgpu_dm_connector->dc_link &&
 +		    amdgpu_dm_connector->dc_link->dpcd_caps.allow_invalid_MSA_timing_pa=
ram &&
 +		    amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 1=
0)
 +			freesync_capable =3D true;
 =20
  		if (vsdb_info.replay_mode) {
 -			amdgpu_dm_connector->vsdb_info.replay_mode =3D vsdb_info.replay_mode;
 -			amdgpu_dm_connector->vsdb_info.amd_vsdb_version =3D vsdb_info.amd_vsdb=
_version;
  			amdgpu_dm_connector->as_type =3D ADAPTIVE_SYNC_TYPE_EDP;
  		}
 +	} else if (has_vsdb && sink->sink_signal =3D=3D SIGNAL_TYPE_HDMI_TYPE_A)=
 {
 +		sink->edid_caps.freesync_vcp_code =3D vsdb_info.freesync_mccs_vcp_code;
 =20
- 		if (vsdb_info.freesync_supported &&
- 		    amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 1=
0)
- 			freesync_capable =3D true;
+ 	} else if (drm_edid &&
+ 		  (sink->sink_signal =3D=3D SIGNAL_TYPE_HDMI_TYPE_A ||
+ 		   sink->sink_signal =3D=3D SIGNAL_TYPE_HDMI_FRL)) {
+ 		i =3D parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
+ 		if (i >=3D 0) {
+ 			amdgpu_dm_connector->vsdb_info =3D vsdb_info;
+ 			sink->edid_caps.freesync_vcp_code =3D vsdb_info.freesync_mccs_vcp_code;
+=20
+ 			if (vsdb_info.freesync_supported) {
+ 				amdgpu_dm_connector->min_vfreq =3D vsdb_info.min_refresh_rate_hz;
+ 				amdgpu_dm_connector->max_vfreq =3D vsdb_info.max_refresh_rate_hz;
+ 				if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq >=
 10)
+ 					freesync_capable =3D true;
+=20
+ 				connector->display_info.monitor_range.min_vfreq =3D vsdb_info.min_ref=
resh_rate_hz;
+ 				connector->display_info.monitor_range.max_vfreq =3D vsdb_info.max_ref=
resh_rate_hz;
+ 			}
+ 		}
+=20
+ 		drm_dbg_driver(adev_to_drm(adev),
+ 			       "VRR: amd_vsdb i=3D%d fs_sup=3D%d min=3D%d max=3D%d fs_capable=
=3D%d\n",
+ 			       i, vsdb_info.freesync_supported,
+ 			       vsdb_info.min_refresh_rate_hz,
+ 			       vsdb_info.max_refresh_rate_hz, freesync_capable);
+=20
+ 		/*
+ 		 * If AMD VSDB didn't provide a valid FreeSync range, fall back to
+ 		 * the HDMI 2.1 VRR capability parsed from the HF-VSDB.
+ 		 */
+ 		if (!freesync_capable && connector->display_info.hdmi.vrr_cap.supported=
) {
+ 			struct drm_hdmi_vrr_cap *vrr_cap =3D
+ 				&connector->display_info.hdmi.vrr_cap;
+=20
+ 			drm_dbg_driver(adev_to_drm(adev),
+ 				       "VRR: HF-VSDB fallback: hdmi_vrr=3D1 vrr_cap[sup=3D%d min=3D%d=
 max=3D%d] mrange_max=3D%d\n",
+ 				       vrr_cap->supported, vrr_cap->vrr_min, vrr_cap->vrr_max,
+ 				       connector->display_info.monitor_range.max_vfreq);
+=20
+ 			if (vrr_cap->supported && vrr_cap->vrr_min > 0) {
+ 				amdgpu_dm_connector->min_vfreq =3D vrr_cap->vrr_min;
+ 				amdgpu_dm_connector->max_vfreq =3D vrr_cap->vrr_max ?
+ 					vrr_cap->vrr_max :
+ 					connector->display_info.monitor_range.max_vfreq;
+=20
+ 				/*
+ 				 * VRRMAX =3D 0 in the HF-VSDB means "up to the Base
+ 				 * Refresh Rate". If the EDID also did not provide a
+ 				 * monitor range max, fall back to the Base Refresh
+ 				 * Rate (the highest refresh rate of the preferred
+ 				 * timing) so a valid VRR range is still reported to
+ 				 * userspace.
+ 				 */
+ 				if (!amdgpu_dm_connector->max_vfreq) {
+ 					struct drm_display_mode *brr_mode =3D
+ 						amdgpu_dm_get_highest_refresh_rate_mode(amdgpu_dm_connector, true);
+=20
+ 					if (brr_mode)
+ 						amdgpu_dm_connector->max_vfreq =3D
+ 							drm_mode_vrefresh(brr_mode);
+ 				}
+=20
+ 				if (amdgpu_dm_connector->max_vfreq -
+ 				    amdgpu_dm_connector->min_vfreq > 10)
+ 					freesync_capable =3D true;
+=20
+ 				connector->display_info.monitor_range.min_vfreq =3D
+ 					amdgpu_dm_connector->min_vfreq;
+ 				connector->display_info.monitor_range.max_vfreq =3D
+ 					amdgpu_dm_connector->max_vfreq;
+ 			}
+ 		}
  	}
 =20
  	if (amdgpu_dm_connector->dc_link)
diff --cc drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.h
index ce900844602e5,e42a0d53b549b..0000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.h
diff --cc drivers/gpu/drm/amd/display/dc/clk_mgr/dcn60/dcn60_clk_mgr.c
index 7dd88d90eba2f,138afa7afc861..0000000000000
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn60/dcn60_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn60/dcn60_clk_mgr.c

--WxgIsQnhghkXxs0V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqkAVEACgkQJNaLcl1U
h9B18wf+O4BnhT7H/aO8cuSri6Ola9XQp3+sbtNbQwxMjgUJHj3IXJAu4Xs0vYn7
WKsSrqxlr0dUYBcPbSYJzDWtBOOolWDS0CMId3au7CImqenyiqFWt5UI7vAhp4l+
Qs4vUjeG1KAKnbZA/p9/bGKchb3PnvivT4bn5HiMRbsIcWhtTbfp0gNfuUS8BHGz
zmkT3cJ5dZq5m0X7fv4i7KMq9VObxVILkWwFnCFC+cR5hlaFdicn1ZCa4FIuQLID
nzUYOUXiyj9SkStsYASGhDbpN7p6Q4zwHHcggfxw38B3XXVPLeSqP4eZhz0TYQWg
R3LP3ic7ZxCEPoIwHq7aNndi+VklwQ==
=VuTo
-----END PGP SIGNATURE-----

--WxgIsQnhghkXxs0V--
