Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194122;
	b=2kkkoadlalOaqKFWhLKuFOy3id5gmM1Jm8MuUtsiTNAmXSYpk9D4Quc9miMdG2VcuhLJ
	 7fOhKLwBHbZOjDHYQFJb1GlH2nyYp5mUFte4aoHx0tAuWeRdDltjKOepFTTbrBHdiJcNA
	 TTCu6EvNBFsuconYsv6bjadtXetYiUfs0EfpRV+0qGcGpFsolMsfNCgaolWdIAW8+FuPe
	 cX1GF3Zrm2632GsLx/sqYjFkacctIJrbFr6yPREj+6I/qLOEvK8ig6Pz+mh0btv0tD9SW
	 KQc6g2othXR/+xTtsBudvsDZa/UJP8PfAdBuU9WPgTv2qkDpD+3hJmp9MqozOlGrW0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194122;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=Am+yQ1D/kk4cA2ZClof99fr05f5sVRBTj4yuy4s3N9I=;
	b=tjDdjL5qqeiS06m9pvKWHNGpjtzrIFPi2BrqlBYH1ieTW0mTFODhuaIQddKqc9Eg/gyU
	 A1dGdGTTNXEd2gcWSCM77i8eb+WiR4xAG+giWzP4xgzpFKWIMeVdpUsg8tt6BEPym8GRj
	 kDy+XOq6m8lEf+ovLHorZGH8OTi13VgKVlIIDPSTgrsFlp6Bdb63v8fTu4eII22JaZF4b
	 imKVshr8Xl3xYOSfrgSftA4Om8VWFs6gXFX7cgba7+RcXTa6t3i3MBaprQQR5CJK6n4nU
	 mqlDkNYPZlx/3JlqwzDKX9uYefLeVm7KoEdifuVvqr+oR4N4vGuX3eXYel5BgI/qk2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n1Jp4n2F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B52A606A31E;
	Wed, 28 Oct 2026 13:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n1Jp4n2F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2E321F01829;
	Wed, 28 Oct 2026 13:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793194122;
	bh=Am+yQ1D/kk4cA2ZClof99fr05f5sVRBTj4yuy4s3N9I=;
	h=Date:From:To:Cc:Subject;
	b=n1Jp4n2FpcrI6sNBRkLjz43lP3JkqTiszR9ANjPMa3kek3AGnuIVihI8dSmYKHzr6
	 LPeHY+/d5kIsiZT6ScXNk9LJ2xnFaaYckrVIG39AUVKuHVNebMc7XxYgihT/sjUQDP
	 WTwIfiQ031/nlSC83AtDPXG33KwMCO0nKc/ZvbCct+/cs1qs+nhVjIbW+FktvtU9a8
	 wxtjNBvL+neNI1JUT/I4upUtTIjWqw8h4H2PI7Xk7o52GqUWzObZ5y3ahujQK9E1ni
	 lrtstAdtdynKVpBnCWAVvcjsXbBGKUHZM4kJVo/pMhUn4hugpL+OOC1EfhKjnzeOuF
	 spaOC8ktjVTfQ==
Date: Wed, 28 Oct 2026 13:28:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Kenneth Feng <kenneth.feng@amd.com>,
	Kevin Wang <kevin.wang@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the amdgpu tree with the origin tree
Message-ID: <auH4hkxipwOwNz44@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="EkPOJFmyi10CFTlW"
Content-Disposition: inline


--EkPOJFmyi10CFTlW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c

between commit:

  a2eae9f4fa1b0 ("drm/amd/pm: add zero fan stop temperature support on smu =
14.0.2")

=66rom the origin tree and commits:

  f990c94a2633d ("drm/amd/pm: add zero fan stop temperature support on smu =
14.0.2")
  1b63bb397db20 ("drm/amd/pm:restate all customized OD features on every ta=
ble upload for smu 13.0.0/smu 14.0.2")
  d2c1e98658b6c ("drm/amd/pm: report smu energy accumulator updates")
  8d4ce79aff1cd ("drm/amd/pm: preserve committed OD features for SMU 14.0.2=
")

=66rom the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
index 6621e50de9651,62f16d17e22bc..0000000000000
--- a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
@@@ -91,6 -91,10 +91,10 @@@ static const struct smu_feature_bits sm
  #define PP_OD_FEATURE_FAN_ZERO_RPM_ENABLE		11
  #define PP_OD_FEATURE_FAN_ZERO_RPM_STOP_TEMP		12
 =20
+ #define SMU_14_0_2_OD_FAN_FEATURE_MASK \
+ 	(BIT(PP_OD_FEATURE_FAN_CURVE_BIT) | \
+ 	 BIT(PP_OD_FEATURE_FAN_LEGACY_BIT))
+=20
  static struct cmn2asic_msg_mapping smu_v14_0_2_message_map[SMU_MSG_MAX_CO=
UNT] =3D {
  	MSG_MAP(TestMessage,			PPSMC_MSG_TestMessage,                 1),
  	MSG_MAP(GetSmuVersion,			PPSMC_MSG_GetSmuVersion,               1),
@@@ -963,6 -967,84 +967,84 @@@ out
  	return feature_enabled;
  }
 =20
+ static u32
+ smu_v14_0_2_filter_od_feature_mask(struct smu_context *smu, u32 feature_m=
ask)
+ {
+ 	PPTable_t *pptable =3D smu->smu_table.driver_pptable;
+ 	u32 supported_mask =3D
+ 		pptable->SkuTable.OverDriveLimitsBasicMax.FeatureCtrlMask;
+=20
+ 	return feature_mask & supported_mask;
+ }
+=20
+ static u32
+ smu_v14_0_2_get_od_feature_mask(struct smu_context *smu, u32 pending_mask)
+ {
+ 	u32 supported_mask =3D smu_v14_0_2_filter_od_feature_mask(smu, ~0U);
+ 	u32 fan_mask =3D supported_mask & SMU_14_0_2_OD_FAN_FEATURE_MASK;
+ 	u32 mask =3D smu->smu_table.user_od_feature_mask;
+=20
+ 	if (pending_mask & fan_mask)
+ 		mask &=3D ~fan_mask;
+ 	mask |=3D pending_mask;
+=20
+ 	return smu_v14_0_2_filter_od_feature_mask(smu, mask);
+ }
+=20
+ static bool smu_v14_0_2_fan_is_default(const OverDriveTable_t *od,
+ 				       const OverDriveTable_t *boot)
+ {
+ 	return !memcmp(od->FanLinearPwmPoints, boot->FanLinearPwmPoints,
+ 			sizeof(od->FanLinearPwmPoints)) &&
+ 		!memcmp(od->FanLinearTempPoints, boot->FanLinearTempPoints,
+ 			sizeof(od->FanLinearTempPoints)) &&
+ 		od->AcousticTargetRpmThreshold =3D=3D boot->AcousticTargetRpmThreshold =
&&
+ 		od->AcousticLimitRpmThreshold =3D=3D boot->AcousticLimitRpmThreshold &&
+ 		od->FanTargetTemperature =3D=3D boot->FanTargetTemperature &&
+ 		od->FanMode =3D=3D boot->FanMode;
+ }
+=20
+ static bool smu_v14_0_2_legacy_fan_is_default(const OverDriveTable_t *od,
+ 					      const OverDriveTable_t *boot)
+ {
+ 	return od->FanMinimumPwm =3D=3D boot->FanMinimumPwm &&
+ 		od->FanMode =3D=3D boot->FanMode;
+ }
+=20
+ static bool smu_v14_0_2_zero_fan_is_default(const OverDriveTable_t *od,
+ 					    const OverDriveTable_t *boot)
+ {
+ 	return od->FanZeroRpmEnable =3D=3D boot->FanZeroRpmEnable &&
+ 		od->FanZeroRpmStopTemp =3D=3D boot->FanZeroRpmStopTemp;
+ }
+=20
+ static u32 smu_v14_0_2_normalize_feature_mask(const OverDriveTable_t *od,
+ 					      const OverDriveTable_t *boot,
+ 					      u32 feature_mask)
+ {
+ 	if (od->GfxclkFoffset =3D=3D boot->GfxclkFoffset)
+ 		feature_mask &=3D ~BIT(PP_OD_FEATURE_GFXCLK_BIT);
+ 	if (od->UclkFmin =3D=3D boot->UclkFmin &&
+ 	    od->UclkFmax =3D=3D boot->UclkFmax)
+ 		feature_mask &=3D ~BIT(PP_OD_FEATURE_UCLK_BIT);
+ 	if (!memcmp(od->VoltageOffsetPerZoneBoundary,
+ 		    boot->VoltageOffsetPerZoneBoundary,
+ 		    sizeof(od->VoltageOffsetPerZoneBoundary)))
+ 		feature_mask &=3D ~BIT(PP_OD_FEATURE_GFX_VF_CURVE_BIT);
+ 	if ((feature_mask & BIT(PP_OD_FEATURE_FAN_CURVE_BIT)) &&
+ 	    smu_v14_0_2_fan_is_default(od, boot))
+ 		feature_mask &=3D ~BIT(PP_OD_FEATURE_FAN_CURVE_BIT);
+ 	if ((feature_mask & BIT(PP_OD_FEATURE_FAN_LEGACY_BIT)) &&
+ 	    smu_v14_0_2_legacy_fan_is_default(od, boot))
+ 		feature_mask &=3D ~BIT(PP_OD_FEATURE_FAN_LEGACY_BIT);
+ 	if (smu_v14_0_2_zero_fan_is_default(od, boot))
+ 		feature_mask &=3D ~BIT(PP_OD_FEATURE_ZERO_FAN_BIT);
+ 	if (!od->Ppt)
+ 		feature_mask &=3D ~BIT(PP_OD_FEATURE_PPT_BIT);
+=20
+ 	return feature_mask;
+ }
+=20
  static void smu_v14_0_2_get_od_setting_limits(struct smu_context *smu,
  					      int od_feature_bit,
  					      int32_t *min,
@@@ -2195,8 -2277,11 +2277,11 @@@ static ssize_t smu_v14_0_2_get_gpu_metr
  					       metrics->Vcn1ActivityPercentage);
 =20
  	gpu_metrics->average_socket_power =3D metrics->AverageSocketPower;
- 	if (mp1_ver =3D=3D IP_VERSION(14, 0, 3) && smu->smc_fw_version >=3D 0x00=
685000)
- 	    gpu_metrics->energy_accumulator =3D metrics->EnergyAccumulator;
+ 	if ((mp1_ver =3D=3D IP_VERSION(14, 0, 2) &&
+ 	     smu->smc_fw_version >=3D 0x00664800) ||
+ 	    (mp1_ver =3D=3D IP_VERSION(14, 0, 3) &&
+ 	     smu->smc_fw_version >=3D 0x00685000))
+ 		gpu_metrics->energy_accumulator =3D metrics->EnergyAccumulator;
 =20
  	if (metrics->AverageGfxActivity <=3D SMU_14_0_2_BUSY_THRESHOLD)
  		gpu_metrics->average_gfxclk_frequency =3D metrics->AverageGfxclkFrequen=
cyPostDs;
@@@ -2317,6 -2402,38 +2402,38 @@@ static int smu_v14_0_2_upload_overdrive
  	return ret;
  }
 =20
+ static int
+ smu_v14_0_2_upload_ppt_overdrive_table(struct smu_context *smu, s16 ppt)
+ {
+ 	struct smu_table_context *table_context =3D &smu->smu_table;
+ 	OverDriveTableExternal_t *od_table =3D table_context->overdrive_table;
+ 	OverDriveTableExternal_t *user_od_table =3D table_context->user_overdriv=
e_table;
+ 	OverDriveTableExternal_t upload_table;
+ 	u32 next_mask =3D table_context->user_od_feature_mask;
+ 	int ret;
+=20
+ 	/* Do not commit OD settings staged after the last c operation. */
+ 	memcpy(&upload_table, user_od_table, sizeof(upload_table));
+ 	upload_table.OverDriveTable.Ppt =3D ppt;
+ 	if (ppt)
+ 		next_mask |=3D BIT(PP_OD_FEATURE_PPT_BIT);
+ 	else
+ 		next_mask &=3D ~BIT(PP_OD_FEATURE_PPT_BIT);
+ 	upload_table.OverDriveTable.FeatureCtrlMask =3D
+ 		smu_v14_0_2_filter_od_feature_mask(smu, next_mask);
+=20
+ 	ret =3D smu_v14_0_2_upload_overdrive_table(smu, &upload_table);
+ 	if (ret)
+ 		return ret;
+=20
+ 	table_context->user_od_feature_mask =3D
+ 		upload_table.OverDriveTable.FeatureCtrlMask;
+ 	od_table->OverDriveTable.Ppt =3D ppt;
+ 	user_od_table->OverDriveTable.Ppt =3D ppt;
+=20
+ 	return 0;
+ }
+=20
  static void smu_v14_0_2_set_supported_od_feature_mask(struct smu_context =
*smu)
  {
  	struct amdgpu_device *adev =3D smu->adev;
@@@ -2375,6 -2492,7 +2492,7 @@@ static int smu_v14_0_2_set_default_od_s
  	memcpy(od_table,
  	       boot_od_table,
  	       sizeof(OverDriveTableExternal_t));
+ 	od_table->OverDriveTable.FeatureCtrlMask =3D 0;
 =20
  	/*
  	 * For S3/S4/Runpm resume, we need to setup those overdrive tables again,
@@@ -2384,7 -2502,9 +2502,9 @@@
  		memcpy(user_od_table,
  		       boot_od_table,
  		       sizeof(OverDriveTableExternal_t));
+ 		user_od_table->OverDriveTable.FeatureCtrlMask =3D 0;
  		smu->user_dpm_profile.user_od =3D false;
+ 		smu->smu_table.user_od_feature_mask =3D 0;
  	} else if (smu->user_dpm_profile.user_od) {
  		memcpy(&user_od_table_bak,
  		       user_od_table,
@@@ -2419,6 -2539,14 +2539,14 @@@
  			user_od_table_bak.OverDriveTable.FanZeroRpmEnable;
  		user_od_table->OverDriveTable.FanZeroRpmStopTemp =3D
  			user_od_table_bak.OverDriveTable.FanZeroRpmStopTemp;
+ 		user_od_table->OverDriveTable.FanMode =3D
+ 			user_od_table_bak.OverDriveTable.FanMode;
+ 		user_od_table->OverDriveTable.FeatureCtrlMask =3D 0;
+ 	}
+ 	if (smu->adev->in_suspend) {
+ 		user_od_table->OverDriveTable.Ppt =3D 0;
+ 		smu->smu_table.user_od_feature_mask &=3D
+ 			~BIT(PP_OD_FEATURE_PPT_BIT);
  	}
 =20
  	smu_v14_0_2_set_supported_od_feature_mask(smu);
@@@ -2431,17 -2559,22 +2559,22 @@@ static int smu_v14_0_2_restore_user_od_
  	struct smu_table_context *table_context =3D &smu->smu_table;
  	OverDriveTableExternal_t *od_table =3D table_context->overdrive_table;
  	OverDriveTableExternal_t *user_od_table =3D table_context->user_overdriv=
e_table;
+ 	OverDriveTableExternal_t upload_table;
+ 	u32 next_mask;
  	int res;
 =20
- 	user_od_table->OverDriveTable.FeatureCtrlMask =3D BIT(PP_OD_FEATURE_GFXC=
LK_BIT) |
- 							BIT(PP_OD_FEATURE_UCLK_BIT) |
- 							BIT(PP_OD_FEATURE_GFX_VF_CURVE_BIT) |
- 							BIT(PP_OD_FEATURE_FAN_CURVE_BIT) |
- 							BIT(PP_OD_FEATURE_ZERO_FAN_BIT);
- 	res =3D smu_v14_0_2_upload_overdrive_table(smu, user_od_table);
- 	user_od_table->OverDriveTable.FeatureCtrlMask =3D 0;
- 	if (res =3D=3D 0)
+ 	next_mask =3D smu_v14_0_2_filter_od_feature_mask(smu,
+ 						       table_context->user_od_feature_mask);
+ 	memcpy(&upload_table, user_od_table, sizeof(upload_table));
+ 	upload_table.OverDriveTable.FeatureCtrlMask =3D next_mask;
+ 	res =3D smu_v14_0_2_upload_overdrive_table(smu, &upload_table);
+ 	if (res =3D=3D 0) {
+ 		table_context->user_od_feature_mask =3D next_mask;
+ 		smu->user_dpm_profile.user_od =3D
+ 			!!(next_mask & ~BIT(PP_OD_FEATURE_PPT_BIT));
  		memcpy(od_table, user_od_table, sizeof(OverDriveTableExternal_t));
+ 		od_table->OverDriveTable.FeatureCtrlMask =3D 0;
+ 	}
 =20
  	return res;
  }
@@@ -2465,43 -2598,30 +2598,35 @@@ static int smu_v14_0_2_od_restore_table
  					boot_overdrive_table->OverDriveTable.FanLinearPwmPoints[i];
  		}
  		od_table->OverDriveTable.FanMode =3D FAN_MODE_AUTO;
- 		od_table->OverDriveTable.FeatureCtrlMask |=3D BIT(PP_OD_FEATURE_FAN_CUR=
VE_BIT);
- 		od_table->OverDriveTable.FeatureCtrlMask &=3D ~BIT(PP_OD_FEATURE_FAN_LE=
GACY_BIT);
  		break;
  	case PP_OD_EDIT_FAN_ZERO_RPM_ENABLE:
  		od_table->OverDriveTable.FanZeroRpmEnable =3D
  					boot_overdrive_table->OverDriveTable.FanZeroRpmEnable;
- 		od_table->OverDriveTable.FeatureCtrlMask |=3D BIT(PP_OD_FEATURE_ZERO_FA=
N_BIT);
+ 		break;
+ 	case PP_OD_EDIT_FAN_ZERO_RPM_STOP_TEMP:
+ 		od_table->OverDriveTable.FanZeroRpmStopTemp =3D
+ 					boot_overdrive_table->OverDriveTable.FanZeroRpmStopTemp;
  		break;
 +	case PP_OD_EDIT_FAN_ZERO_RPM_STOP_TEMP:
 +		od_table->OverDriveTable.FanZeroRpmStopTemp =3D
 +					boot_overdrive_table->OverDriveTable.FanZeroRpmStopTemp;
 +		od_table->OverDriveTable.FeatureCtrlMask |=3D BIT(PP_OD_FEATURE_ZERO_FA=
N_BIT);
 +		break;
  	case PP_OD_EDIT_ACOUSTIC_LIMIT:
  		od_table->OverDriveTable.AcousticLimitRpmThreshold =3D
  					boot_overdrive_table->OverDriveTable.AcousticLimitRpmThreshold;
- 		od_table->OverDriveTable.FanMode =3D FAN_MODE_AUTO;
- 		od_table->OverDriveTable.FeatureCtrlMask |=3D BIT(PP_OD_FEATURE_FAN_CUR=
VE_BIT);
  		break;
  	case PP_OD_EDIT_ACOUSTIC_TARGET:
  		od_table->OverDriveTable.AcousticTargetRpmThreshold =3D
  					boot_overdrive_table->OverDriveTable.AcousticTargetRpmThreshold;
- 		od_table->OverDriveTable.FanMode =3D FAN_MODE_AUTO;
- 		od_table->OverDriveTable.FeatureCtrlMask |=3D BIT(PP_OD_FEATURE_FAN_CUR=
VE_BIT);
  		break;
  	case PP_OD_EDIT_FAN_TARGET_TEMPERATURE:
  		od_table->OverDriveTable.FanTargetTemperature =3D
  					boot_overdrive_table->OverDriveTable.FanTargetTemperature;
- 		od_table->OverDriveTable.FanMode =3D FAN_MODE_AUTO;
- 		od_table->OverDriveTable.FeatureCtrlMask |=3D BIT(PP_OD_FEATURE_FAN_CUR=
VE_BIT);
  		break;
  	case PP_OD_EDIT_FAN_MINIMUM_PWM:
  		od_table->OverDriveTable.FanMinimumPwm =3D
  					boot_overdrive_table->OverDriveTable.FanMinimumPwm;
- 		od_table->OverDriveTable.FanMode =3D FAN_MODE_AUTO;
- 		od_table->OverDriveTable.FeatureCtrlMask |=3D BIT(PP_OD_FEATURE_FAN_LEG=
ACY_BIT);
- 		od_table->OverDriveTable.FeatureCtrlMask &=3D ~BIT(PP_OD_FEATURE_FAN_CU=
RVE_BIT);
  		break;
  	default:
  		dev_info(adev->dev, "Invalid table index: %ld\n", input);
@@@ -2519,10 -2639,17 +2644,17 @@@ static int smu_v14_0_2_od_edit_dpm_tabl
  	struct smu_table_context *table_context =3D &smu->smu_table;
  	OverDriveTableExternal_t *od_table =3D
  		(OverDriveTableExternal_t *)table_context->overdrive_table;
+ 	OverDriveTableExternal_t *user_od_table =3D
+ 		(OverDriveTableExternal_t *)table_context->user_overdrive_table;
+ 	OverDriveTableExternal_t *boot_od_table =3D
+ 		(OverDriveTableExternal_t *)table_context->boot_overdrive_table;
+ 	OverDriveTableExternal_t upload_table;
+ 	OverDriveTable_t *od =3D &od_table->OverDriveTable;
+ 	OverDriveTable_t *boot =3D &boot_od_table->OverDriveTable;
  	struct amdgpu_device *adev =3D smu->adev;
  	uint32_t offset_of_voltageoffset;
  	int32_t minimum, maximum;
- 	uint32_t feature_ctrlmask;
+ 	u32 next_mask;
  	int i, ret =3D 0;
 =20
  	switch (type) {
@@@ -2694,6 -2821,7 +2826,7 @@@
  		od_table->OverDriveTable.AcousticLimitRpmThreshold =3D input[0];
  		od_table->OverDriveTable.FanMode =3D FAN_MODE_AUTO;
  		od_table->OverDriveTable.FeatureCtrlMask |=3D BIT(PP_OD_FEATURE_FAN_CUR=
VE_BIT);
+ 		od_table->OverDriveTable.FeatureCtrlMask &=3D ~BIT(PP_OD_FEATURE_FAN_LE=
GACY_BIT);
  		break;
 =20
  	case PP_OD_EDIT_ACOUSTIC_TARGET:
@@@ -2716,6 -2844,7 +2849,7 @@@
  		od_table->OverDriveTable.AcousticTargetRpmThreshold =3D input[0];
  		od_table->OverDriveTable.FanMode =3D FAN_MODE_AUTO;
  		od_table->OverDriveTable.FeatureCtrlMask |=3D BIT(PP_OD_FEATURE_FAN_CUR=
VE_BIT);
+ 		od_table->OverDriveTable.FeatureCtrlMask &=3D ~BIT(PP_OD_FEATURE_FAN_LE=
GACY_BIT);
  		break;
 =20
  	case PP_OD_EDIT_FAN_TARGET_TEMPERATURE:
@@@ -2738,6 -2867,7 +2872,7 @@@
  		od_table->OverDriveTable.FanTargetTemperature =3D input[0];
  		od_table->OverDriveTable.FanMode =3D FAN_MODE_AUTO;
  		od_table->OverDriveTable.FeatureCtrlMask |=3D BIT(PP_OD_FEATURE_FAN_CUR=
VE_BIT);
+ 		od_table->OverDriveTable.FeatureCtrlMask &=3D ~BIT(PP_OD_FEATURE_FAN_LE=
GACY_BIT);
  		break;
 =20
  	case PP_OD_EDIT_FAN_MINIMUM_PWM:
@@@ -2811,44 -2941,42 +2946,42 @@@
  			if (ret)
  				return ret;
  		} else {
- 			feature_ctrlmask =3D od_table->OverDriveTable.FeatureCtrlMask;
  			memcpy(od_table,
  		       table_context->boot_overdrive_table,
  		       sizeof(OverDriveTableExternal_t));
- 			od_table->OverDriveTable.FeatureCtrlMask =3D feature_ctrlmask;
+ 			od_table->OverDriveTable.FeatureCtrlMask =3D 0;
  		}
  		fallthrough;
  	case PP_OD_COMMIT_DPM_TABLE:
- 		/*
- 		 * The member below instructs PMFW the settings focused in
- 		 * this single operation.
- 		 * `uint32_t FeatureCtrlMask;`
- 		 * It does not contain actual informations about user's custom
- 		 * settings. Thus we do not cache it.
- 		 */
  		offset_of_voltageoffset =3D offsetof(OverDriveTable_t, VoltageOffsetPer=
ZoneBoundary);
- 		if (memcmp((u8 *)od_table + offset_of_voltageoffset,
- 			   table_context->user_overdrive_table + offset_of_voltageoffset,
- 			   sizeof(OverDriveTableExternal_t) - offset_of_voltageoffset)) {
- 			smu_v14_0_2_dump_od_table(smu, od_table);
+ 		next_mask =3D smu_v14_0_2_get_od_feature_mask(smu,
+ 							    od->FeatureCtrlMask);
+ 		next_mask =3D smu_v14_0_2_normalize_feature_mask(od, boot,
+ 							       next_mask);
 =20
- 			ret =3D smu_v14_0_2_upload_overdrive_table(smu, od_table);
+ 		if (memcmp((u8 *)od_table + offset_of_voltageoffset,
+ 			   (u8 *)user_od_table + offset_of_voltageoffset,
+ 			   sizeof(OverDriveTableExternal_t) - offset_of_voltageoffset) ||
+ 		    next_mask !=3D table_context->user_od_feature_mask) {
+ 			memcpy(&upload_table, od_table, sizeof(upload_table));
+ 			upload_table.OverDriveTable.FeatureCtrlMask =3D next_mask;
+ 			smu_v14_0_2_dump_od_table(smu, &upload_table);
+=20
+ 			ret =3D smu_v14_0_2_upload_overdrive_table(smu, &upload_table);
  			if (ret) {
  				dev_err(adev->dev, "Failed to upload overdrive table!\n");
  				return ret;
  			}
 =20
+ 			table_context->user_od_feature_mask =3D next_mask;
  			od_table->OverDriveTable.FeatureCtrlMask =3D 0;
- 			memcpy(table_context->user_overdrive_table + offset_of_voltageoffset,
+ 			memcpy((u8 *)user_od_table + offset_of_voltageoffset,
  			       (u8 *)od_table + offset_of_voltageoffset,
  			       sizeof(OverDriveTableExternal_t) - offset_of_voltageoffset);
+ 			user_od_table->OverDriveTable.FeatureCtrlMask =3D 0;
 =20
- 			if (!memcmp(table_context->user_overdrive_table,
- 				    table_context->boot_overdrive_table,
- 				    sizeof(OverDriveTableExternal_t)))
- 				smu->user_dpm_profile.user_od =3D false;
- 			else
- 				smu->user_dpm_profile.user_od =3D true;
+ 			smu->user_dpm_profile.user_od =3D
+ 				!!(next_mask & ~BIT(PP_OD_FEATURE_PPT_BIT));
  		}
  		break;
 =20
@@@ -2866,10 -2994,8 +2999,8 @@@ static int smu_v14_0_2_set_ppt_limit(st
  	PPTable_t *pptable =3D smu->smu_table.driver_pptable;
  	uint32_t msg_limit =3D pptable->SkuTable.MsgLimits.Power
  		[PPT_THROTTLER_PPT0][POWER_SOURCE_AC];
- 	struct smu_table_context *table_context =3D &smu->smu_table;
- 	OverDriveTableExternal_t *od_table =3D
- 		(OverDriveTableExternal_t *)table_context->overdrive_table;
  	OverDriveTableExternal_t current_od_table;
+ 	s16 ppt;
  	int ret =3D 0;
 =20
  	if (limit_type !=3D SMU_PPT_LIMIT_PPT0)
@@@ -2881,10 -3007,7 +3012,7 @@@
  			return ret;
 =20
  		if (current_od_table.OverDriveTable.Ppt) {
- 			od_table->OverDriveTable.Ppt =3D 0;
- 			od_table->OverDriveTable.FeatureCtrlMask |=3D 1U << PP_OD_FEATURE_PPT_=
BIT;
-=20
- 			ret =3D smu_v14_0_2_upload_overdrive_table(smu, od_table);
+ 			ret =3D smu_v14_0_2_upload_ppt_overdrive_table(smu, 0);
  			if (ret) {
  				dev_err(smu->adev->dev, "Failed to upload overdrive table!\n");
  				return ret;
@@@ -2896,10 -3019,8 +3024,8 @@@
  		if (ret)
  			return ret;
 =20
- 		od_table->OverDriveTable.Ppt =3D (limit * 100) / msg_limit - 100;
- 		od_table->OverDriveTable.FeatureCtrlMask |=3D 1U << PP_OD_FEATURE_PPT_B=
IT;
-=20
- 		ret =3D smu_v14_0_2_upload_overdrive_table(smu, od_table);
+ 		ppt =3D (limit * 100) / msg_limit - 100;
+ 		ret =3D smu_v14_0_2_upload_ppt_overdrive_table(smu, ppt);
  		if (ret) {
  		  dev_err(smu->adev->dev, "Failed to upload overdrive table!\n");
  		  return ret;

--EkPOJFmyi10CFTlW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrh+IUACgkQJNaLcl1U
h9AiGwf7BhvXcWjh17p+zXZomlmif1i+2t/PjLcc7o5fazUv0QPOx6DqoDARL2NW
lwSKRsIPrvSHsM2sJd0zavBWg6yQrKBE6NAd433rnQYi2GeXk0OOMbu1b9VrIsTc
Jab027M2pqnnsmEi8BTa57nh2iJ5I1XoEduqSC8JLnHui2cFe07c3I3tkkaBTKxI
lGffQitrNUU591pJFN8dOMQuLoer9Gf6dmZ/Y4Adw5ETA+So0uOJPBVX8NGo2CjA
YMYo5eh1yandcF05Xw7rcbNeJ2beaGx2Fqu+kIrAPQGgWiyZqr1Xt1V6MLXAsg/X
ZeTK075O5hxWv4D2pfQkZIfaIgqSZA==
=rySs
-----END PGP SIGNATURE-----

--EkPOJFmyi10CFTlW--
