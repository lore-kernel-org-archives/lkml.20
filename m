Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4D623F40D;
	Mon,  7 Sep 2026 22:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788821502; cv=none; b=ctUGlX7SjjjwSaKomfSDgENR59TuEo0i6Ev4U1A0gymtOry4+Vd/ZaEYGUWPtHm81RHUyVJWTioUT+0nDn7vv2zkWPxirLfhgSLS5EAtWwhlmnPSXJMoPF/IiXKwySxoDB78S0zt0bdIlzQxWk4EN9gwIdhXUf0bSGI3AZfwb+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788821502; c=relaxed/simple;
	bh=qhi1/SdR8F2a+D4aMKBklD5eUTul/GG3aF1xAlDzG10=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=czzMeJuiMPP1Aqdt7VIBKmFHYynVjRdtOIHxZdyFof1YwKXyKlDA2dQ7z0aFx49MIwnNwqGObAOPUJcEOKaOjMfxdCwxkAptNqu48PpJqoysv92NHwAn4qAYIYIBY+iRRNyoVc88SnP9BDA/Oqm02w1rCPnUIWrsYxm0qa1wo5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0B+V7JH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0B+V7JH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D461F00A3A;
	Mon,  7 Sep 2026 22:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788821500;
	bh=gKYvaWo8YIOsojGwd7yskSU15Da7s7dAiZ5OotT1/Ls=;
	h=Date:From:To:Cc:Subject;
	b=i0B+V7JHE0K4Dv/fbOyJIN1bH+78heVWxQ1nyGMPbp/1CHXLYS9I6/IIBm+sKT8hS
	 24pjgjh2Gw52E7nk2RJXKsKPFtqBvr7EWw/QSsOqdwQhAcK4GNOiQx9vkpnUW4MClu
	 PtO8GE2SlRufcAIr36+vnp+3qSNGzj0R534XRpcRlKmS/sdnAesohvMwqSmlZrpvgc
	 hNFEMUhrm1clfovm35IE981FeHWLB/w0ct3ogmh80nkcx5MFq7JIUtA2AcYwo//Fu8
	 00lFmE37HgrIK2JsFsH0sqmurjA59S1l9frAuBWqzBNc0Ct3z9QBUlIBJtkb/84pUL
	 OeI1FuKoCVv5A==
Date: Mon, 7 Sep 2026 23:51:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Kees Cook <kees@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	YiPeng Chai <YiPeng.Chai@amd.com>
Subject: linux-next: manual merge of the amdgpu tree with the origin tree
Message-ID: <ap8_-LStOpEV7zIx@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x9MjyTZ37eYRdqvG"
Content-Disposition: inline


--x9MjyTZ37eYRdqvG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/ras/core/cmd.c

between commit:

  3a2c4d55e32ad ("treewide: refresh kmalloc_obj() conversions")

=66rom the origin tree and commits:

  cb6996164ccb4 ("drm/amd/ras: fix ras cmd returning incorrect cper count")
  49452ca7a7f5a ("drm/amd/ras: Add dedicated interface to obtain cper info")

=66rom the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/amd/ras/core/cmd.c
index 446b935c1fc91,9f874800f38df..0000000000000
--- a/drivers/gpu/drm/amd/ras/core/cmd.c
+++ b/drivers/gpu/drm/amd/ras/core/cmd.c
@@@ -43,7 -43,8 +43,8 @@@ static int ras_get_block_ecc_info(struc
  		return RAS_CMD__ERROR_INVALID_INPUT_SIZE;
 =20
  	memset(&err_data, 0, sizeof(err_data));
- 	ret =3D ras_aca_get_block_ecc_count(ras_core, input_data->block_id, &err=
_data);
+ 	ret =3D ras_core_query_block_ecc_data(ras_core,
+ 				input_data->block_id, &err_data, false);
  	if (ret)
  		return RAS_CMD__ERROR_GENERIC;
 =20
@@@ -143,13 -144,8 +144,8 @@@ static int ras_cmd_clear_bad_page_info(
  	if (cmd->input_size !=3D sizeof(struct ras_cmd_dev_handle))
  		return RAS_CMD__ERROR_INVALID_INPUT_SIZE;
 =20
- 	if (ras_fw_eeprom_supported(ras_core)) {
- 		if (ras_fw_eeprom_reset_table(ras_core))
- 			return RAS_CMD__ERROR_GENERIC;
- 	} else {
- 		if (ras_eeprom_reset_table(ras_core))
- 			return RAS_CMD__ERROR_GENERIC;
- 	}
+ 	if (ras_eeprom_mgr_reset_table(ras_core))
+ 		return RAS_CMD__ERROR_GENERIC;
 =20
  	if (ras_umc_clean_badpage_data(ras_core))
  		return RAS_CMD__ERROR_GENERIC;
@@@ -178,16 -174,18 +174,18 @@@ static int ras_cmd_get_cper_snapshot(st
  	struct ras_cmd_cper_snapshot_rsp *output_data =3D
  			(struct ras_cmd_cper_snapshot_rsp *)cmd->output_buff_raw;
  	struct ras_log_batch_overview overview;
+ 	u64 latest_cper_id;
 =20
  	if ((cmd->input_size !=3D sizeof(struct ras_cmd_cper_snapshot_req)) ||
  		(cmd->output_buf_size < sizeof(*output_data)))
  		return RAS_CMD__ERROR_INVALID_INPUT_SIZE;
 =20
  	ras_log_ring_get_batch_overview(ras_core, &overview);
+ 	latest_cper_id =3D overview.logged_batch_count ? overview.last_batch_id =
- 1 : 0;
 =20
  	output_data->total_cper_num =3D overview.logged_batch_count;
  	output_data->start_cper_id =3D overview.first_batch_id;
- 	output_data->latest_cper_id =3D overview.last_batch_id;
+ 	output_data->latest_cper_id =3D latest_cper_id;
 =20
  	output_data->version =3D 0;
 =20
@@@ -202,13 -200,13 +200,13 @@@ static int ras_cmd_get_cper_records(str
  			(struct ras_cmd_cper_record_req *)cmd->input_buff_raw;
  	struct ras_cmd_cper_record_rsp *rsp =3D
  			(struct ras_cmd_cper_record_rsp *)cmd->output_buff_raw;
- 	struct ras_log_info *trace =3D NULL;
- 	uint32_t trace_count =3D MAX_RECORD_PER_BATCH;
+ 	struct ras_log_info *batch_logs =3D NULL;
+ 	uint32_t nr_batch_logs =3D MAX_RECORD_PER_BATCH;
  	struct ras_log_batch_overview overview;
  	uint32_t offset =3D 0, real_data_len =3D 0;
- 	uint64_t batch_id;
- 	uint8_t *buffer =3D NULL;
- 	int ret =3D 0, i, count;
+ 	u64 batch_id, start_batch_id;
+ 	uint8_t *buf_ptr =3D (uint8_t *)(uintptr_t)req->buf_ptr;
+ 	int ret =3D 0, i, count, read_batch_count =3D 0;
 =20
  	if ((cmd->input_size !=3D sizeof(struct ras_cmd_cper_record_req)) ||
  		(cmd->output_buf_size < sizeof(*rsp)))
@@@ -218,42 -216,50 +216,50 @@@
  	    req->buf_size > RAS_CMD_MAX_CPER_BUF_SZ)
  		return RAS_CMD__ERROR_INVALID_INPUT_DATA;
 =20
- 	buffer =3D kzalloc(req->buf_size, GFP_KERNEL);
- 	if (!buffer)
- 		return RAS_CMD__ERROR_GENERIC;
-=20
- 	trace =3D kzalloc_objs(*trace, trace_count);
- 	if (!trace) {
+ 	batch_logs =3D kcalloc(nr_batch_logs, sizeof(*batch_logs), GFP_KERNEL);
+ 	if (!batch_logs) {
  		ret =3D RAS_CMD__ERROR_GENERIC;
  		goto out;
  	}
 =20
  	ras_log_ring_get_batch_overview(ras_core, &overview);
+=20
+ 	start_batch_id =3D req->cper_start_id;
+=20
  	for (i =3D 0; i < req->cper_num; i++) {
- 		batch_id =3D req->cper_start_id + i;
+ 		batch_id =3D start_batch_id + i;
  		if (batch_id >=3D overview.last_batch_id)
  			break;
 =20
- 		count =3D ras_log_ring_get_batch_records(ras_core, batch_id, trace,
- 					trace_count);
+ 		count =3D ras_log_ring_get_batch_records(ras_core, batch_id, batch_logs,
+ 					nr_batch_logs);
  		if (count > 0) {
- 			ret =3D ras_cper_generate_cper(ras_core, trace, count,
- 					&buffer[offset], req->buf_size - offset, &real_data_len);
+ 			if (offset >=3D req->buf_size) {
+ 				ret =3D -ENOMEM;
+ 				break;
+ 			}
+=20
+ 			ret =3D ras_cper_generate_batch_cper(ras_core, batch_logs, count,
+ 					&buf_ptr[offset], req->buf_size - offset, &real_data_len);
  			if (ret)
  				break;
 =20
  			offset +=3D real_data_len;
  		}
+=20
+ 		/* The caller resumes at cper_start_id + real_cper_num, so an id
+ 		 * that held nothing still has to be counted here.
+ 		 */
+ 		read_batch_count++;
  	}
 =20
- 	if ((ret && (ret !=3D -ENOMEM)) ||
- 		copy_to_user(u64_to_user_ptr(req->buf_ptr), buffer, offset)) {
+ 	if ((ret && (ret !=3D -ENOMEM))) {
  		ret =3D RAS_CMD__ERROR_GENERIC;
  		goto out;
  	}
 =20
  	rsp->real_data_size =3D offset;
- 	rsp->real_cper_num =3D i;
+ 	rsp->real_cper_num =3D read_batch_count;
  	rsp->remain_num =3D (ret =3D=3D -ENOMEM) ? (req->cper_num - i) : 0;
  	rsp->version =3D 0;
 =20
@@@ -261,8 -267,7 +267,7 @@@
  	ret =3D RAS_CMD__SUCCESS;
 =20
  out:
- 	kfree(trace);
- 	kfree(buffer);
+ 	kfree(batch_logs);
  	return ret;
  }
 =20
@@@ -316,7 -321,7 +321,7 @@@ static int ras_cmd_get_batch_trace_reco
  	    (input_data->start_batch_id >=3D overview.last_batch_id))
  		return RAS_CMD__ERROR_INVALID_INPUT_SIZE;
 =20
 -	trace_arry =3D kcalloc(trace_count, sizeof(*trace_arry), GFP_KERNEL);
 +	trace_arry =3D kzalloc_objs(*trace_arry, trace_count);
  	if (!trace_arry)
  		return RAS_CMD__ERROR_GENERIC;
 =20
@@@ -337,8 -342,8 +342,8 @@@
  				record->seqno =3D trace_arry[j].seqno;
  				record->timestamp =3D trace_arry[j].timestamp;
  				record->event =3D trace_arry[j].event;
- 				memcpy(&record->aca_reg,
- 					&trace_arry[j].aca_reg, sizeof(trace_arry[j].aca_reg));
+ 				memcpy(&record->body, &trace_arry[j].body,
+ 				       sizeof(record->body));
  			}
  		} else {
  			count =3D 0;
@@@ -362,48 -367,6 +367,6 @@@
  	return RAS_CMD__SUCCESS;
  }
 =20
- static enum ras_ta_block __get_ras_ta_block(enum ras_block_id block)
- {
- 	switch (block) {
- 	case RAS_BLOCK_ID__UMC:
- 		return RAS_TA_BLOCK__UMC;
- 	case RAS_BLOCK_ID__SDMA:
- 		return RAS_TA_BLOCK__SDMA;
- 	case RAS_BLOCK_ID__GFX:
- 		return RAS_TA_BLOCK__GFX;
- 	case RAS_BLOCK_ID__MMHUB:
- 		return RAS_TA_BLOCK__MMHUB;
- 	case RAS_BLOCK_ID__ATHUB:
- 		return RAS_TA_BLOCK__ATHUB;
- 	case RAS_BLOCK_ID__PCIE_BIF:
- 		return RAS_TA_BLOCK__PCIE_BIF;
- 	case RAS_BLOCK_ID__HDP:
- 		return RAS_TA_BLOCK__HDP;
- 	case RAS_BLOCK_ID__XGMI_WAFL:
- 		return RAS_TA_BLOCK__XGMI_WAFL;
- 	case RAS_BLOCK_ID__DF:
- 		return RAS_TA_BLOCK__DF;
- 	case RAS_BLOCK_ID__SMN:
- 		return RAS_TA_BLOCK__SMN;
- 	case RAS_BLOCK_ID__SEM:
- 		return RAS_TA_BLOCK__SEM;
- 	case RAS_BLOCK_ID__MP0:
- 		return RAS_TA_BLOCK__MP0;
- 	case RAS_BLOCK_ID__MP1:
- 		return RAS_TA_BLOCK__MP1;
- 	case RAS_BLOCK_ID__FUSE:
- 		return RAS_TA_BLOCK__FUSE;
- 	case RAS_BLOCK_ID__MCA:
- 		return RAS_TA_BLOCK__MCA;
- 	case RAS_BLOCK_ID__VCN:
- 		return RAS_TA_BLOCK__VCN;
- 	case RAS_BLOCK_ID__JPEG:
- 		return RAS_TA_BLOCK__JPEG;
- 	default:
- 		return RAS_TA_BLOCK__UMC;
- 	}
- }
-=20
  static enum ras_ta_error_type __get_ras_ta_err_type(enum ras_ecc_err_type=
 error)
  {
  	switch (error) {
@@@ -431,7 -394,6 +394,6 @@@ static int ras_cmd_inject_error(struct=20
  		(struct ras_cmd_inject_error_rsp *)cmd->output_buff_raw;
  	int ret =3D 0;
  	struct ras_ta_trigger_error_input block_info =3D {
- 		.block_id =3D __get_ras_ta_block(req->block_id),
  		.sub_block_index =3D req->subblock_id,
  		.inject_error_type =3D __get_ras_ta_err_type(req->error_type),
  		.address =3D req->address,
@@@ -442,6 -404,12 +404,12 @@@
  		(cmd->output_buf_size < sizeof(*output_data)))
  		return RAS_CMD__ERROR_INVALID_INPUT_SIZE;
 =20
+ 	ret =3D ras_psp_get_block_ta_id(ras_core, req->block_id, &block_info.blo=
ck_id);
+ 	if (ret =3D=3D -RAS_CORE_NOT_SUPPORTED)
+ 		return RAS_CMD__ERROR_UNSUPPORT;
+ 	else if (ret)
+ 		return ret;
+=20
  	ret =3D ras_psp_trigger_error(ras_core, &block_info, req->instance_mask);
  	if (!ret) {
  		output_data->version =3D 0;
@@@ -455,6 -423,34 +423,34 @@@
  	return ret;
  }
 =20
+ static int ras_cmd_get_ras_cap(struct ras_core_context *ras_core,
+ 	struct ras_cmd_ctx *cmd, void *data)
+ {
+ 	struct ras_cmd_get_ras_cap_rsp *output_data =3D
+ 			(struct ras_cmd_get_ras_cap_rsp *)cmd->output_buff_raw;
+=20
+ 	output_data->version =3D 0;
+ 	output_data->poison =3D ras_core_poison_supported(ras_core);
+ 	output_data->flex_mca =3D ras_psp_flex_mca_enabled(ras_core);
+ 	output_data->ras_block_mask =3D ras_core_get_ras_caps(ras_core);
+=20
+ 	output_data->ecc_type =3D 0;
+ 	if (output_data->poison)
+ 		output_data->ecc_type |=3D BIT_ULL(RAS_ECC_TYPE_POISON);
+=20
+ 	if (output_data->ras_block_mask & BIT_ULL(RAS_BLOCK_ID__UMC))
+ 		output_data->ecc_type |=3D BIT_ULL(RAS_ECC_TYPE_MEM);
+=20
+ 	if (output_data->ras_block_mask &
+ 		(BIT_ULL(RAS_BLOCK_ID__GFX) | BIT_ULL(RAS_BLOCK_ID__SDMA)))
+ 		output_data->ecc_type |=3D BIT_ULL(RAS_ECC_TYPE_SRAM);
+=20
+=20
+ 	cmd->output_size =3D sizeof(struct ras_cmd_get_ras_cap_rsp);
+=20
+ 	return 0;
+ }
+=20
  static struct ras_cmd_func_map ras_cmd_maps[] =3D {
  	{RAS_CMD__INJECT_ERROR, ras_cmd_inject_error},
  	{RAS_CMD__GET_BLOCK_ECC_STATUS, ras_get_block_ecc_info},
@@@ -465,6 -461,7 +461,7 @@@
  	{RAS_CMD__GET_CPER_RECORD, ras_cmd_get_cper_records},
  	{RAS_CMD__GET_BATCH_TRACE_SNAPSHOT, ras_cmd_get_batch_trace_snapshot},
  	{RAS_CMD__GET_BATCH_TRACE_RECORD, ras_cmd_get_batch_trace_records},
+ 	{RAS_CMD__GET_RAS_CAP, ras_cmd_get_ras_cap},
  };
 =20
  int rascore_handle_cmd(struct ras_core_context *ras_core,

--x9MjyTZ37eYRdqvG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqfP/cACgkQJNaLcl1U
h9DHagf/evf9xp7jR3cCxoFVRisCaMkT5zglLVLQhg5vj73qLBfqSiN2jyV2LQVz
BMpwj5ssgbMylOQS7lLyipfdXJDXbduv/S/vfExmmj5nG7T2nYFfjPax2GNZ3yq2
80vdR6SgVX+FVJ3zqZEn7IDa/7ri7dGRmA+VXN35l5Sq752M6hZ9TIVRH6BMvtzd
odBr0132BVTDy9SSU0JlnDGwgA0ChgupgpTLzmKojopOsOP/GsDUEjwPwk9iB/Fn
GtYRqB1ca75iQIBHhwhCN5kFFH3tE+l08WCBwOzvahEjRlC8PnxZGlALL6ZE1+zl
MToZuZEf/xyNVxmj+3ElwjSQ/E8o3Q==
=IJVG
-----END PGP SIGNATURE-----

--x9MjyTZ37eYRdqvG--
