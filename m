Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FE35452BA;
	Tue,  8 Sep 2026 16:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885290; cv=none; b=OyuNC8gbnltpY0uRPLIeoRSfjZbluXvAQa9FXrtLIExZuFW+Es7hmTvqboQCYpaCOkAUapvneS4AgBxtCIh6OszFd2ajw1ksDFrdrEhbiMBdGrCjT4vq5qeitUqozpT1swblBCO4PQlk5+nlppkXaxts/Worg5Tby5qBalnNR6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885290; c=relaxed/simple;
	bh=fYIA6kLYnyh8qS8STPRo12XNRLAbpjh3JpMBhR4hodM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KpLbcaOpBqtXJwk1EzL27sl7ODeYkSo/ZuRih28UuvkFYPy34t4yi5tzunq+WoQu1kVIJk/TaKR5qzLNE+pRdRC2TYMfo9fRA/Vx7jZcaYqD5LWEX1SEK5SLdd5NU1WRB/2Cess9mRRdzQpAAA6NzLJ/LAYuvh79Y4SGA0Wguiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AtjJlD9N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AtjJlD9N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ABEC1F00A3D;
	Tue,  8 Sep 2026 16:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788885288;
	bh=2d8MR64LL5Vq5Kp0QShpar22UBoRIMqV9NYUKDvoSrY=;
	h=Date:From:To:Cc:Subject;
	b=AtjJlD9NNCEItTsMY2kaQa4aUShFAyqeVSCKb1freUUmAssYHqOyuq0aOJ9PxCpgO
	 PGbVLG2r1P9VbvMIoAgCqjkkojpkFIxb2PIDE+quh9ZyEmPEUk70MIounJ1UJO7zm3
	 HZDXuJRfIpfvz8Elkb+jXNSkB/AQ8mGW2QSjsu5ZoAwutRszObK8IEqavgfvtpJvUU
	 GgBf+Ei14pKsNzXi+RAL+IPvgeMKBGUMIwAprnomRlv9zwlnDUpjrJjN2HSfY1PmjS
	 Ytgvm6tNPO4yaG8VIJnCwAoj0quTTPLUO/sPya102/vhQOqXsWHhcoyM6qKiUxbqZy
	 QktWaYrwYe+SA==
Date: Tue, 8 Sep 2026 17:34:42 +0100
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
Subject: linux-next: manual merge of the amdgpu tree with the drm-misc tree
Message-ID: <aqA5IjDLvW7ANQ3K@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0Z9PFWdMDDDn+iNP"
Content-Disposition: inline


--0Z9PFWdMDDDn+iNP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c

between commits:

  ee28f3446dde3 ("drm/amd/display: Clean up FreeSync capability detection")
  f65198b3d0738 ("drm/amd/display: Use HDMI FreeSync range from common EDID=
 parser")

=66rom the drm-misc tree and commits:

  fa3389c713799 ("drm/amd/display: Add HDMI 2.1 VRR support for HF-VSDB")
  1f47aaf3ff0d8 ("drm/amd/display: Add HDMI 2.1 FreeSync support for AMD VS=
DB")
  8dade94422319 ("drm/amd/display: Cover amdgpu_dm_create_i2c")
  4827661d374b9 ("drm/amd/display: Cover hdmi_frl_status_polling_work")
  11b7722b8ac69 ("drm/amd/display: Refactor hdmi_frl_status_polling_work fo=
r Kunit testing")
  5113a08a4ba47 ("drm/amd/display: Cover amdgpu_dm_prune_primary_tile_modes=
")
  889f15060c3da ("drm/amd/display: Cover amdgpu_set_panel_orientation")
  0d3ff9e9bbbc7 ("drm/amd/display: Cover amdgpu_dm_connector_get_modes")
  01678168f9d55 ("drm/amd/display: Cover amdgpu_dm_connector_atomic_check")
  985c7177f630c ("drm/amd/display: Cover amdgpu_dm_encoder_init")
  7ea37c0f06787 ("drm/amd/display: Force FreeSync range minimum on quirky p=
anels")

=66rom the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
index e7b555fa666fb,57c6b32b95167..0000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
@@@ -27,6 -27,7 +27,6 @@@
  #include "dm_services_types.h"
  #include "dc.h"
  #include "dc/dc_dmub_srv.h"
 -#include "dc/dc_edid_parser.h"
  #include "dc/dc_stat.h"
  #include "dc/dc_state.h"
  #include "dc/dc_stream.h"
@@@ -170,6 -171,7 +170,7 @@@ const struct drm_encoder_helper_funcs a
  	.disable =3D dm_encoder_helper_disable,
  	.atomic_check =3D dm_encoder_helper_atomic_check
  };
+ EXPORT_IF_KUNIT(amdgpu_dm_encoder_helper_funcs);
 =20
  int amdgpu_dm_get_encoder_crtc_mask(struct amdgpu_device *adev)
  {
@@@ -214,6 -216,7 +215,7 @@@ int amdgpu_dm_encoder_init(struct drm_d
 =20
  	return res;
  }
+ EXPORT_IF_KUNIT(amdgpu_dm_encoder_init);
 =20
  STATIC_IFN_KUNIT enum drm_mode_subconnector get_subconnector_type(struct =
dc_link *link)
  {
@@@ -253,7 -256,7 +255,7 @@@ STATIC_IFN_KUNIT void update_subconnect
  }
  EXPORT_IF_KUNIT(update_subconnector_property);
 =20
- static int amdgpu_dm_connector_get_modes(struct drm_connector *connector);
+ STATIC_IFN_KUNIT int amdgpu_dm_connector_get_modes(struct drm_connector *=
connector);
 =20
  STATIC_IFN_KUNIT void amdgpu_dm_fbc_init(struct drm_connector *connector)
  {
@@@ -2570,7 -2573,7 +2572,7 @@@ int amdgpu_dm_fill_hdr_info_packet(cons
  }
  EXPORT_IF_KUNIT(amdgpu_dm_fill_hdr_info_packet);
 =20
- static int
+ STATIC_IFN_KUNIT int
  amdgpu_dm_connector_atomic_check(struct drm_connector *conn,
  				 struct drm_atomic_commit *state)
  {
@@@ -2651,6 -2654,7 +2653,7 @@@
 =20
  	return 0;
  }
+ EXPORT_IF_KUNIT(amdgpu_dm_connector_atomic_check);
 =20
  static const struct drm_connector_helper_funcs
  amdgpu_dm_connector_helper_funcs =3D {
@@@ -2887,6 -2891,7 +2890,7 @@@ void amdgpu_set_panel_orientation(struc
  						       native_mode->hdisplay,
  						       native_mode->vdisplay);
  }
+ EXPORT_IF_KUNIT(amdgpu_set_panel_orientation);
 =20
  /*
   * The Apple Studio Display primary tile advertises both the full 5120x28=
80
@@@ -2895,7 -2900,7 +2899,7 @@@
   * per-tile timing from the primary connector so compositors only pick th=
e full
   * 5K mode.
   */
- static void amdgpu_dm_prune_primary_tile_modes(struct drm_connector *conn=
ector)
+ STATIC_IFN_KUNIT void amdgpu_dm_prune_primary_tile_modes(struct drm_conne=
ctor *connector)
  {
  	struct amdgpu_dm_connector *aconnector =3D to_amdgpu_dm_connector(connec=
tor);
  	struct drm_display_mode *mode, *t;
@@@ -2928,6 -2933,7 +2932,7 @@@
  		aconnector->num_modes--;
  	}
  }
+ EXPORT_IF_KUNIT(amdgpu_dm_prune_primary_tile_modes);
 =20
  STATIC_IFN_KUNIT void amdgpu_dm_connector_ddc_get_modes(struct drm_connec=
tor *connector,
  					      const struct drm_edid *drm_edid)
@@@ -3081,7 -3087,7 +3086,7 @@@ STATIC_IFN_KUNIT void amdgpu_dm_connect
  }
  EXPORT_IF_KUNIT(amdgpu_dm_connector_add_freesync_modes);
 =20
- static int amdgpu_dm_connector_get_modes(struct drm_connector *connector)
+ STATIC_IFN_KUNIT int amdgpu_dm_connector_get_modes(struct drm_connector *=
connector)
  {
  	struct amdgpu_dm_connector *amdgpu_dm_connector =3D
  			to_amdgpu_dm_connector(connector);
@@@ -3120,6 -3126,7 +3125,7 @@@
 =20
  	return amdgpu_dm_connector->num_modes;
  }
+ EXPORT_IF_KUNIT(amdgpu_dm_connector_get_modes);
 =20
  static const u32 supported_colorspaces =3D
  	BIT(DRM_MODE_COLORIMETRY_BT709_YCC) |
@@@ -3133,7 -3140,7 +3139,7 @@@ static const u32 supported_colorformat
  	BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422) |
  	BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
 =20
- static void hdmi_frl_status_polling_work(struct work_struct *work)
+ void hdmi_frl_status_polling_work(struct work_struct *work)
  {
  	struct amdgpu_display_manager *dm =3D
  		container_of(to_delayed_work(work), struct amdgpu_display_manager,
@@@ -3167,6 -3174,7 +3173,7 @@@
  			   &dm->hdmi_frl_status_polling_work,
  			   msecs_to_jiffies(dm->hdmi_frl_status_polling_delay_ms));
  }
+ EXPORT_IF_KUNIT(hdmi_frl_status_polling_work);
 =20
  void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
  				     struct amdgpu_dm_connector *aconnector,
@@@ -3392,6 -3400,7 +3399,7 @@@ amdgpu_dm_create_i2c(struct ddc_servic
 =20
  	return i2c;
  }
+ EXPORT_IF_KUNIT(amdgpu_dm_create_i2c);
 =20
  int amdgpu_dm_initialize_hdmi_connector(struct amdgpu_dm_connector *aconn=
ector)
  {
@@@ -3590,6 -3599,139 +3598,6 @@@ void dm_restore_drm_connector_state(str
  		dm_force_atomic_commit(&aconnector->base);
  }
 =20
 -static bool dm_edid_parser_send_cea(struct amdgpu_display_manager *dm,
 -		unsigned int offset,
 -		unsigned int total_length,
 -		u8 *data,
 -		unsigned int length,
 -		struct amdgpu_hdmi_vsdb_info *vsdb)
 -{
 -	bool res;
 -	union dmub_rb_cmd cmd;
 -	struct dmub_cmd_send_edid_cea *input;
 -	struct dmub_cmd_edid_cea_output *output;
 -
 -	if (length > DMUB_EDID_CEA_DATA_CHUNK_BYTES)
 -		return false;
 -
 -	memset(&cmd, 0, sizeof(cmd));
 -
 -	input =3D &cmd.edid_cea.data.input;
 -
 -	cmd.edid_cea.header.type =3D DMUB_CMD__EDID_CEA;
 -	cmd.edid_cea.header.sub_type =3D 0;
 -	cmd.edid_cea.header.payload_bytes =3D
 -		sizeof(cmd.edid_cea) - sizeof(cmd.edid_cea.header);
 -	input->offset =3D offset;
 -	input->length =3D length;
 -	input->cea_total_length =3D total_length;
 -	memcpy(input->payload, data, length);
 -
 -	res =3D dc_wake_and_execute_dmub_cmd(dm->dc->ctx, &cmd, DM_DMUB_WAIT_TYP=
E_WAIT_WITH_REPLY);
 -	if (!res) {
 -		drm_err(adev_to_drm(dm->adev), "EDID CEA parser failed\n");
 -		return false;
 -	}
 -
 -	output =3D &cmd.edid_cea.data.output;
 -
 -	if (output->type =3D=3D DMUB_CMD__EDID_CEA_ACK) {
 -		if (!output->ack.success) {
 -			drm_err(adev_to_drm(dm->adev), "EDID CEA ack failed at offset %d\n",
 -					output->ack.offset);
 -		}
 -	} else if (output->type =3D=3D DMUB_CMD__EDID_CEA_AMD_VSDB) {
 -		if (!output->amd_vsdb.vsdb_found)
 -			return false;
 -
 -		vsdb->freesync_supported =3D output->amd_vsdb.freesync_supported;
 -		vsdb->amd_vsdb_version =3D output->amd_vsdb.amd_vsdb_version;
 -		vsdb->min_refresh_rate_hz =3D output->amd_vsdb.min_frame_rate;
 -		vsdb->max_refresh_rate_hz =3D output->amd_vsdb.max_frame_rate;
 -		vsdb->freesync_mccs_vcp_code =3D output->amd_vsdb.freesync_mccs_vcp_cod=
e;
 -	} else {
 -		drm_warn(adev_to_drm(dm->adev), "Unknown EDID CEA parser results\n");
 -		return false;
 -	}
 -
 -	return true;
 -}
 -
 -static bool parse_edid_cea_dmcu(struct amdgpu_display_manager *dm,
 -		u8 *edid_ext, int len,
 -		struct amdgpu_hdmi_vsdb_info *vsdb_info)
 -{
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
 -			res =3D dc_edid_parser_recv_amd_vsdb(dm->dc, &version, &min_rate, &max=
_rate);
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
 -	return false;
 -}
 -
 -static bool parse_edid_cea_dmub(struct amdgpu_display_manager *dm,
 -		u8 *edid_ext, int len,
 -		struct amdgpu_hdmi_vsdb_info *vsdb_info)
 -{
 -	int i;
 -
 -	/* send extension block to DMCU for parsing */
 -	for (i =3D 0; i < len; i +=3D 8) {
 -		/* send 8 bytes a time */
 -		if (!dm_edid_parser_send_cea(dm, i, len, &edid_ext[i], 8, vsdb_info))
 -			return false;
 -	}
 -
 -	return vsdb_info->freesync_supported;
 -}
 -
 -static bool parse_edid_cea(struct amdgpu_dm_connector *aconnector,
 -		u8 *edid_ext, int len,
 -		struct amdgpu_hdmi_vsdb_info *vsdb_info)
 -{
 -	struct amdgpu_device *adev =3D drm_to_adev(aconnector->base.dev);
 -	bool ret;
 -
 -	mutex_lock(&adev->dm.dc_lock);
 -	if (adev->dm.dmub_srv)
 -		ret =3D parse_edid_cea_dmub(&adev->dm, edid_ext, len, vsdb_info);
 -	else
 -		ret =3D parse_edid_cea_dmcu(&adev->dm, edid_ext, len, vsdb_info);
 -	mutex_unlock(&adev->dm.dc_lock);
 -	return ret;
 -}
 -
  STATIC_IFN_KUNIT void parse_edid_displayid_vrr(struct drm_connector *conn=
ector,
  				     const struct edid *edid)
  {
@@@ -3641,15 -3783,44 +3649,15 @@@ STATIC_IFN_KUNIT int get_amd_vsdb(struc
 =20
  	vsdb_info->replay_mode =3D connector->display_info.amd_vsdb.replay_mode;
  	vsdb_info->amd_vsdb_version =3D connector->display_info.amd_vsdb.version;
 +	vsdb_info->freesync_supported =3D connector->display_info.amd_vsdb.frees=
ync_supported;
 +	vsdb_info->min_refresh_rate_hz =3D connector->display_info.amd_vsdb.min_=
frame_rate;
 +	vsdb_info->max_refresh_rate_hz =3D connector->display_info.amd_vsdb.max_=
frame_rate;
 +	vsdb_info->freesync_mccs_vcp_code =3D connector->display_info.amd_vsdb.f=
reesync_vcp_code;
 =20
  	return connector->display_info.amd_vsdb.version !=3D 0;
  }
  EXPORT_IF_KUNIT(get_amd_vsdb);
 =20
 -STATIC_IFN_KUNIT int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *acon=
nector,
 -			       const struct edid *edid,
 -			       struct amdgpu_hdmi_vsdb_info *vsdb_info)
 -{
 -	u8 *edid_ext =3D NULL;
 -	int i;
 -	bool valid_vsdb_found =3D false;
 -
 -	/*----- drm_find_cea_extension() -----*/
 -	/* No EDID or EDID extensions */
 -	if (edid =3D=3D NULL || edid->extensions =3D=3D 0)
 -		return -ENODEV;
 -
 -	/* Find CEA extension */
 -	for (i =3D 0; i < edid->extensions; i++) {
 -		edid_ext =3D (uint8_t *)edid + EDID_LENGTH * (i + 1);
 -		if (edid_ext[0] =3D=3D CEA_EXT)
 -			break;
 -	}
 -
 -	if (i =3D=3D edid->extensions)
 -		return -ENODEV;
 -
 -	/*----- cea_db_offsets() -----*/
 -	if (edid_ext[0] !=3D CEA_EXT)
 -		return -ENODEV;
 -
 -	valid_vsdb_found =3D parse_edid_cea(aconnector, edid_ext, EDID_LENGTH, v=
sdb_info);
 -
 -	return valid_vsdb_found ? i : -ENODEV;
 -}
 -EXPORT_IF_KUNIT(parse_hdmi_amd_vsdb);
 -
  /**
   * amdgpu_dm_update_freesync_caps - Update Freesync capabilities
   *
@@@ -3668,7 -3839,7 +3676,7 @@@
  void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
  				    const struct drm_edid *drm_edid, bool do_mccs)
  {
 -	int i =3D 0;
 +	bool has_vsdb =3D 0;
  	struct amdgpu_dm_connector *amdgpu_dm_connector =3D
  			to_amdgpu_dm_connector(connector);
  	struct dm_connector_state *dm_con_state =3D NULL;
@@@ -3705,6 -3876,15 +3713,15 @@@
  	if (!adev->dm.freesync_module || !dc_supports_vrr(sink->ctx->dce_version=
))
  		goto update;
 =20
+ 	drm_dbg_driver(adev_to_drm(adev),
+ 		       "VRR: enter signal=3D%d hdmi_vrr=3D%d mrange[%d-%d] hdmi.vrr_cap=
[sup=3D%d min=3D%d max=3D%d]\n",
+ 		       sink->sink_signal, connector->display_info.hdmi.vrr_cap.supporte=
d,
+ 		       connector->display_info.monitor_range.min_vfreq,
+ 		       connector->display_info.monitor_range.max_vfreq,
+ 		       connector->display_info.hdmi.vrr_cap.supported,
+ 		       connector->display_info.hdmi.vrr_cap.vrr_min,
+ 		       connector->display_info.hdmi.vrr_cap.vrr_max);
+=20
  	/* FIXME: Get rid of drm_edid_raw() */
  	edid =3D drm_edid_raw(drm_edid);
 =20
@@@ -3713,60 -3893,133 +3730,140 @@@
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
  		as_type =3D dm_get_adaptive_sync_support_type(amdgpu_dm_connector->dc_l=
ink);
 =20
 -	if (as_type =3D=3D FREESYNC_TYPE_PCON_IN_WHITELIST) {
 -		i =3D parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
 -		if (i >=3D 0) {
 -			amdgpu_dm_connector->vsdb_info =3D vsdb_info;
 -			sink->edid_caps.freesync_vcp_code =3D vsdb_info.freesync_mccs_vcp_code;
 +	if (has_vsdb && as_type =3D=3D FREESYNC_TYPE_PCON_IN_WHITELIST) {
 +		sink->edid_caps.freesync_vcp_code =3D vsdb_info.freesync_mccs_vcp_code;
 =20
 -			if (vsdb_info.freesync_supported && vsdb_info.amd_vsdb_version > 0) {
 -				amdgpu_dm_connector->pack_sdp_v1_3 =3D true;
 -				amdgpu_dm_connector->as_type =3D as_type;
 +		if (vsdb_info.freesync_supported && vsdb_info.amd_vsdb_version > 0) {
 +			amdgpu_dm_connector->pack_sdp_v1_3 =3D true;
 +			amdgpu_dm_connector->as_type =3D as_type;
 =20
 -				amdgpu_dm_connector->min_vfreq =3D vsdb_info.min_refresh_rate_hz;
 -				amdgpu_dm_connector->max_vfreq =3D vsdb_info.max_refresh_rate_hz;
 -				if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq >=
 10)
 -					freesync_capable =3D true;
 -
 -				connector->display_info.monitor_range.min_vfreq =3D vsdb_info.min_ref=
resh_rate_hz;
 -				connector->display_info.monitor_range.max_vfreq =3D vsdb_info.max_ref=
resh_rate_hz;
 -			}
 +			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > =
10)
 +				freesync_capable =3D true;
  		}
  	}
 =20
+ 	/*
+ 	 * Apply per-monitor FreeSync range quirks. Some panels report a
+ 	 * VRR minimum that does not operate reliably; force it when the
+ 	 * monitor is quirked (see apply_edid_quirks()).
+ 	 */
+ 	if (sink->edid_caps.panel_patch.force_freesync_min_hz && freesync_capabl=
e) {
+ 		amdgpu_dm_connector->min_vfreq =3D
+ 			sink->edid_caps.panel_patch.force_freesync_min_hz;
+ 		connector->display_info.monitor_range.min_vfreq =3D
+ 			amdgpu_dm_connector->min_vfreq;
+ 	}
+=20
  	/* Handle MCCS */
  	if (do_mccs)
  		dm_helpers_read_mccs_caps(adev->dm.dc->ctx, amdgpu_dm_connector->dc_lin=
k, sink);
@@@ -3784,6 -4037,11 +3881,11 @@@ update
  	if (dm_con_state)
  		dm_con_state->freesync_capable =3D freesync_capable;
 =20
+ 	drm_dbg_driver(adev_to_drm(adev),
+ 		       "VRR: caps result: freesync_capable=3D%d min_vfreq=3D%d max_vfre=
q=3D%d\n",
+ 		       freesync_capable, amdgpu_dm_connector->min_vfreq,
+ 		       amdgpu_dm_connector->max_vfreq);
+=20
  	if (connector->state && amdgpu_dm_connector->dc_link && !freesync_capabl=
e &&
  	    amdgpu_dm_connector->dc_link->replay_settings.config.replay_supporte=
d) {
  		amdgpu_dm_connector->dc_link->replay_settings.config.replay_supported =
=3D false;

--0Z9PFWdMDDDn+iNP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqgOSIACgkQJNaLcl1U
h9ADwgf+Mgi3LgaGFTH3j09htoMPm5KHVP7EUulsAYZwnQZYzQ3TnZMbz5JqnCRj
fzfous2sshP8t4DrVc+IWCkcnrMlHofmFkREOURqhzzUOoNOWh2nBYKf5NwqZYLL
Yv3O470otCwGoWmS0rgKMG9ioLLJsgHFBzkiLMPCaLsJenBBpQZImtSv79faztLk
WWy/2k7bHDt8naw5rzPCeaM2NiPVbslP2aCRyyLAiz//+ui8PBriEqTLLfjRjX3K
qYqLgYOuHxgxNl52Ns0FSAYcvVU2nWzGJp+/uXqnZZp0utqHLql2LDshnnDk9L86
YJf9M6xToPgBWAUCRQZHgbPXXkF5Fg==
=7/N1
-----END PGP SIGNATURE-----

--0Z9PFWdMDDDn+iNP--
