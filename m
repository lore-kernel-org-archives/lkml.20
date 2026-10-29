Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283483;
	b=q7DKT1oY4/tAtzND+W6AxMuLEt/itJ5dz8vMLFc8QbL2BXulv9dVyWOlOy43LCtO3is4
	 EqRssv0Uo+jaAvCnPZvBnbknqaZpQJHoWndImgp6a+gQsNIsFtAS5R4wAopIGOF9LihuE
	 KdLgDCc5dUCA8qNxEv3842+fE62PrEC6CkzDwctrroqTGiURziw4/P5lG9mK9QGbmoMRE
	 VyaxRxgoTq032Adbf4aWgStD2g5NEMNMTndSjBhj4ghr7zPSmQivBHfVOg8xNM6A/aAl+
	 Tx3lqw7yATlWuApptT0/CKu8DO4YTEQeSPIh7iBP6fYZqbA9LQS9cgwcmqjLhb/LTvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283483;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=5wdswlpgIPm73M5NXJltXkhxIeKQQld4e4w2Kkn/Sig=;
	b=YjYkOYBgDHGuHz55P708OuKcoGPhSgtLxP9wSFhw3RirKO71z1eg2EbLBSflDtKYVpxR
	 KP7SkxLZbpXUlwb9SKOO/ue8q+DgDyH6FmeAKa5DrvJnTBKWHiW7LOqZT1RXYxExy/Hi6
	 8VRLyc+g7kImR+hpubbJeiuSV8XzqJFr9imMJOcSEqL4XvPlECfZCOoGvleUijPxidJX9
	 GGXdWIM3IZyVfoxpM6LPf9o7zEUIzj7sBhJFTTpmhTlWUqJp2LNxkstLD1IVoH5j/Y+9S
	 sRACTJGgp6A1+wnRHnc7q7UIJoI0QhiTuKLmDZVimUEdHoQCnszynXNx3YW/YcUhJTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MQ6tdmcI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AC9606A31C;
	Thu, 29 Oct 2026 14:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MQ6tdmcI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EE731F01825;
	Thu, 29 Oct 2026 14:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793283482;
	bh=5wdswlpgIPm73M5NXJltXkhxIeKQQld4e4w2Kkn/Sig=;
	h=Date:From:To:Cc:Subject;
	b=MQ6tdmcIye0vQt3oquwvQxlOyo4gMfM83g4u7QXgYVkiE6KY+W+qwotRFDSkR5Glv
	 cu4z7lRGMlrQAv2ME7+50Kimt5GA3OzKVZwzp/gYOccdHauNgNthNeOpQUq7UYQ3q0
	 4PkuW4mwSLrtk0/DZKxEkC5/MjortjX+jq5ieJ75PaHgqPGFKcYrNJcj+1nRo/qnTN
	 6BhQ0E4g5+MtIPjDpYKun/TyJauNrgQxMiSk0rP2/+X1XuZKv9adz7MXWMeD+Cjnz9
	 +guxF9Vc3hAi6I+MX0321QJD+YCdXz3rPnn6HWT9M5ynANVD+6AFuzKjIYEzOyYxfo
	 5BDrTTSZSq4Hw==
Date: Thu, 29 Oct 2026 14:17:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Kenneth Feng <kenneth.feng@amd.com>,
	Kevin Wang <kevin.wang@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the amdgpu tree with the origin tree
Message-ID: <auNVlhF6DGyFYx10@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="GjmgyIW3sNKLMh+h"
Content-Disposition: inline


--GjmgyIW3sNKLMh+h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c

between commits:

  a2eae9f4fa1b0 ("drm/amd/pm: add zero fan stop temperature support on smu =
14.0.2")
  44d0d3031e479 ("drm/amd/pm:restate all customized OD features on every ta=
ble upload for smu 13.0.0/smu 14.0.2")
  af52c8fd45fbd ("drm/amd/pm: add zero fan stop temperature support on smu =
14.0.2")
  9b0890e72d19b ("drm/amd/pm: preserve committed OD features for SMU 14.0.2=
")

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
index dda435f19ca66,62f16d17e22bc..0000000000000
--- a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
@@@ -2277,8 -2277,11 +2277,11 @@@ static ssize_t smu_v14_0_2_get_gpu_metr
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
@@@ -2600,14 -2603,9 +2603,10 @@@ static int smu_v14_0_2_od_restore_table
  		od_table->OverDriveTable.FanZeroRpmEnable =3D
  					boot_overdrive_table->OverDriveTable.FanZeroRpmEnable;
  		break;
- 	case PP_OD_EDIT_FAN_ZERO_RPM_STOP_TEMP:
- 		od_table->OverDriveTable.FanZeroRpmStopTemp =3D
- 					boot_overdrive_table->OverDriveTable.FanZeroRpmStopTemp;
- 		break;
  	case PP_OD_EDIT_FAN_ZERO_RPM_STOP_TEMP:
  		od_table->OverDriveTable.FanZeroRpmStopTemp =3D
  					boot_overdrive_table->OverDriveTable.FanZeroRpmStopTemp;
 +		od_table->OverDriveTable.FeatureCtrlMask |=3D BIT(PP_OD_FEATURE_ZERO_FA=
N_BIT);
  		break;
  	case PP_OD_EDIT_ACOUSTIC_LIMIT:
  		od_table->OverDriveTable.AcousticLimitRpmThreshold =3D

--GjmgyIW3sNKLMh+h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrjVZYACgkQJNaLcl1U
h9DQNAf/XthvlbgYgg+Kh3fJsNoe1uyNrHhyRfPzHF1kZULNke/Jr2kTzh6ewall
Wz3ECKhvmbMhuSn/0DKT+E2Ic1+uiNf08JndzzZqK3fGB8nq2xXWGuvsC/AUTUG6
7TW+NA0yQNnD9evmF4C4RQ084949nUjyLuGwjE9mWqtcYPPEwQyJSAAtQnr9zUdm
96aJYXFKg+KkUDD+pXOezfFZoJnJGXYPJgUoT9ysg8N2uwAWaMT/4v5un3ZkMJ/G
wAEJG8B/7jjPKPhbO9+HY7ZCGp15H67Z+hSyQTIwPubOeHzPBSkgwoixe7o4A77g
SBiKhADDMdphK404EMWy6Px10HIICA==
=6JAQ
-----END PGP SIGNATURE-----

--GjmgyIW3sNKLMh+h--
