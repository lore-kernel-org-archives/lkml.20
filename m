Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9B739183A;
	Mon, 12 Oct 2026 16:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820823; cv=none; b=XC4V7Sa6dURvmI1uzvAn9WRbtNfiMso3gNFaU6rfXmA4ebOwujzzjzz/WneZdvg/FGUoQPTd/rmpYjTFmJD5KejnprFCQxSlzg2j9QdIzHCPY8bczXcu1gxZhWttxNEgiIQ0jBQE27pE7z3NmJeTghbcdS0+OyxpGCaRMTVA7+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820823; c=relaxed/simple;
	bh=NnkVAo4Akq1f5Fral+BdfpPvEPPVtiJM26YpzvaeahE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cJTf46DLHdf9SBt1YPr0x1AzxC2hxsm50c9Q6H4FqHzAdXWBH1bHTeb12n83c1yzN7n8qhs0mCfUiDbOFFqMQOPpS7pMVXoCeHbghrTEvwUCaOY2aDdRG8cr8GUy6vnGc83zZ6WIQ+6FkZvjnFO5yoznvPxWb0OnM4civ8Kkipw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PtTAqcyY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PtTAqcyY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048A11F0089B;
	Mon, 12 Oct 2026 16:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791820822;
	bh=DhtZIfuIEvlpkDK7brRoFcw85bcJ/156Vb80F9BAqjg=;
	h=Date:From:To:Cc:Subject;
	b=PtTAqcyY+HZj4VkCHU8oGAbpmAlWwEY+wWvyhjsY8LvnX6fNli5mKyG1psRWlm4fj
	 FrpW+VT45tsTa2HZQSU3U4S2fWAK9/hg8gHWkYGw85Zao9o6dyrRZhuKjl3r3VQDjt
	 KUwtZyiKn42jVQIsH/J0Xb/jjGcHeS2BktJVABxK5w9AxxnMIDFewSYpEz8x3NsWO7
	 YlM9Cng5xZe+ABWLucE29LYLWO47O4OQ7rRm0lhnA8pB2pJe2qprAuPAc1jRTirQVQ
	 7yTslF8DMiGo14YDDEYt2CqC0hAzJ2h5/yTnqQJeZsQ7o+xM0iT+igGyXc1Y/HVv0s
	 TovV58Fc1Z1FA==
Date: Mon, 12 Oct 2026 17:00:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	Alex Deucher <alexander.deucher@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: linux-next: manual merge of the drm tree with the origin tree
Message-ID: <as0EDOeG2YMPsccN@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lQXESTPYKYxWp4AU"
Content-Disposition: inline


--lQXESTPYKYxWp4AU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c

between commit:

  1a6023edfbb56 ("drm/amdgpu: serialize vblank counter reads against GPU re=
set")

=66rom the origin tree and commit:

  51a4359f7431a ("drm/amdgpu: serialize vblank counter reads against GPU re=
set")
  6ccc5b5fc1d36 ("drm/fbdev: Move fbdev helpers into client library")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 7c081b338fe2e,8e15b204f117f..0000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@@ -28,8 -28,8 +28,8 @@@
 =20
  #include "amdgpu.h"
  #include <drm/amdgpu_drm.h>
+ #include <drm/clients/drm_fbdev_helper.h>
  #include <drm/drm_drv.h>
- #include <drm/drm_fb_helper.h>
  #include <drm/drm_vblank.h>
  #include "amdgpu_uvd.h"
  #include "amdgpu_vce.h"
@@@ -48,6 -48,7 +48,7 @@@
  #include "amd_pcie.h"
  #include "amdgpu_userq.h"
  #include "amdgpu_video_codecs.h"
+ #include "amdgpu_ras_mgr.h"
 =20
  void amdgpu_unregister_gpu_instance(struct amdgpu_device *adev)
  {
@@@ -285,6 -286,10 +286,10 @@@ static int amdgpu_firmware_info(struct=20
  		fw_info->ver =3D adev->pm.fw_version;
  		fw_info->feature =3D 0;
  		break;
+ 	case AMDGPU_INFO_FW_MP5:
+ 		fw_info->ver =3D adev->pm.mp5_fw_version;
+ 		fw_info->feature =3D 0;
+ 		break;
  	case AMDGPU_INFO_FW_TA:
  		switch (query_fw->index) {
  		case TA_FW_TYPE_PSP_XGMI:
@@@ -349,8 -354,8 +354,8 @@@
  		fw_info->feature =3D adev->psp.toc.feature_version;
  		break;
  	case AMDGPU_INFO_FW_CAP:
- 		fw_info->ver =3D adev->psp.cap_fw_version;
- 		fw_info->feature =3D adev->psp.cap_feature_version;
+ 		fw_info->ver =3D adev->psp.cap.fw_version;
+ 		fw_info->feature =3D adev->psp.cap.feature_version;
  		break;
  	case AMDGPU_INFO_FW_MES_KIQ:
  		fw_info->ver =3D adev->mes.kiq_version & AMDGPU_MES_VERSION_MASK;
@@@ -1291,7 -1296,11 +1296,11 @@@ int amdgpu_info_ioctl(struct drm_devic
 =20
  		if (!ras)
  			return -EINVAL;
- 		ras_mask =3D (uint64_t)adev->ras_enabled << 32 | ras->features;
+=20
+ 		if (amdgpu_uniras_enabled(adev))
+ 			ras_mask =3D amdgpu_uniras_get_ras_caps(adev);
+ 		else
+ 			ras_mask =3D (uint64_t)adev->ras_enabled << 32 | ras->features;
 =20
  		return copy_to_user(out, &ras_mask,
  				min_t(u64, size, sizeof(ras_mask))) ?
@@@ -1937,6 -1946,14 +1946,14 @@@ static int amdgpu_debugfs_firmware_info
  	seq_printf(m, "SMC feature version: %u, program: %d, firmware version: 0=
x%08x (%d.%d.%d)\n",
  		   fw_info.feature, smu_program, fw_info.ver, smu_major, smu_minor, smu=
_debug);
 =20
+ 	/* MP5 */
+ 	query_fw.fw_type =3D AMDGPU_INFO_FW_MP5;
+ 	ret =3D amdgpu_firmware_info(&fw_info, &query_fw, adev);
+ 	if (ret)
+ 		return ret;
+ 	seq_printf(m, "MP5 feature version: %u, firmware version: 0x%08x\n",
+ 		   fw_info.feature, fw_info.ver);
+=20
  	/* SDMA */
  	query_fw.fw_type =3D AMDGPU_INFO_FW_SDMA;
  	for (i =3D 0; i < adev->sdma.num_instances; i++) {

--lQXESTPYKYxWp4AU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrNBAsACgkQJNaLcl1U
h9DHQQf+JTTBFbYHT/DL9onPYh6cI3z8rIK0mjV7PkkTU7RmodLCbCT9PlHerA0g
Zb8bt16hQnza+irpH49ARFdPuvPoPXDGS4KEXxnnR/ggSCMUZgQmKU2ciTeWQQ51
Q9DH4JnNpQCyapEwIncAyFQaYnKfh9d4s6yMQcAliQv+6wI1NbDREijXqKJ0wone
F4yJG/zo1m1GRTgqzdVafrSmZMQDBgOmkGrRBPl5LEZjjbQB6SRSnzv0YP10KJwz
xhe/ZciEFfqZ8CEfnQFh8NxG2hXBfPo1vvCY9BsOYuIUJ/zaMRsh9dw3XOVU41wf
hUMNCojq7XlJYTgky4+h279x1t7m5Q==
=Horb
-----END PGP SIGNATURE-----

--lQXESTPYKYxWp4AU--
