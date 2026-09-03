Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C9837267E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419734; cv=none; b=jkpyA70o9Ob6J3wYN2EYDGp+5ouY5eLdHRwH8A+PwBTPcoCxrc054dj3yV6O7EutkiqW8xmp4rgWd2DymxNNAJyRH+3gjTvi/fmqJsQqzKBay5Xgm/6cGy44JN7RoR4blNknc+K+vS34l9iElcvoGQfCB3vhchlMbEXB1NYwNv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419734; c=relaxed/simple;
	bh=BjMVRTA8UC90hsYWRZEdJGJ70qvkV3t3ndu7MO7HR0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=l6Yhj9ZZ01umfHyF4usm+XUSmEnKVHtbLMK8IW3ovpdahGAo9RiK95oGO/kH0QJV1ysK63gsVqgGOI5EWMvgNVBo6oNLtbHcOQ4TvO34DcXrBh+oOnqFpFov7W7wWU5q9jEhhUqHezwtQ+plDg0dIT2dvXBB1TVTYJIt/EupkJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DmSv46yd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DmSv46yd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47C471F000E9;
	Thu,  3 Sep 2026 07:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788419730;
	bh=rwhPokwMzQRr+N5r5yimCYHQlzu2mfOtx1pFqJ5KG8c=;
	h=From:Date:Subject:To:Cc;
	b=DmSv46ydQKoZitzmzP8rdtUpUD7j5MPqKsdbqnIHsRFl7CgD0BAXOyB5+FSXoOZPH
	 7ljauXvR+iUrQ2OROHOpsINEhW4RZ9jD9iV1tPHsR8P2cMs2a8bS0MpTBL7ha7uHQR
	 pMk/UwX/gEugWOM+GNgXUUS7yvWDaqo+dBF0f7yAWf9SLmjrCcgj8ZlbGHs0JFTFxj
	 RGNpLT/3JeCKMQ9GVFyH7YZ8EJBU192IKqTctS/Srf0sFjc92j1zWwWxgike1IpvqD
	 XXnImIG24gRGBjU1dFQKDoLrY+edDND8pmOeLe+S8IpML4FTte/+ovpVThjHij3kzg
	 JJ9HHsiOjtJ3w==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 03 Sep 2026 00:15:18 -0700
Subject: [PATCH] drm/amd/ras: Adjust second parameter of
 mp1_v13_0_eeprom_send_msg()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-amdgpu-ras-wifpts-v1-1-7f3b4528f12c@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrDsQBw3Wq0gXMY52CtWQ8Q/Eu
 xvb5bd47wDlKKxQZwdEXkVlGhPyRwb+7caBUbpkIEPWPA2h+3ZDWDA6xU36MCv6ylJlC+LSlpC
 6ELmX/fdsXn/r0n7Yz/cIzvMCTDcf9XUAAAA=
X-Change-ID: 20260902-amdgpu-ras-wifpts-c8628642e565
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: YiPeng Chai <YiPeng.Chai@amd.com>, 
 Hawking Zhang <Hawking.Zhang@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2741; i=nathan@kernel.org;
 h=from:subject:message-id; bh=BjMVRTA8UC90hsYWRZEdJGJ70qvkV3t3ndu7MO7HR0s=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFkz5XraDmm4bl9UdiJoza4lrxNXXPX7Kx3cNbuWSVU29
 4K+0c66jlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRq+YM/+s1pJ892XTJPiPY
 x7PwxAHbqd4+jz84FBfGrLCe9CzTT5yR4c/+FIX9035fCr19P+DpyauNiiuT1b8Lzr7+XWxK3LU
 INhYA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

When building with -Wincompatible-function-pointer-types-strict, a
warning designed to catch kernel control flow integrity (kCFI) issues at
build time, there is an instance around mp1_v13_0_eeprom_send_msg():

  drivers/gpu/drm/amd/amdgpu/../ras/ras_mgr/amdgpu_ras_mp1_v13_0.c:157:25: error: incompatible function pointer types initializing 'int (*)(struct ras_core_context *, u32, uint32_t, uint32_t *)' (aka 'int (*)(struct ras_core_context *, unsigned int, unsigned int, unsigned int *)') with an expression of type 'int (struct ras_core_context *, enum ras_fw_eeprom_cmd, uint32_t, uint32_t *)' (aka 'int (struct ras_core_context *, enum ras_fw_eeprom_cmd, unsigned int, unsigned int *)') [-Werror,-Wincompatible-function-pointer-types-strict]
    157 |         .mp1_send_eeprom_msg = mp1_v13_0_eeprom_send_msg,
        |                                ^~~~~~~~~~~~~~~~~~~~~~~~~

While 'u32' and 'enum ras_fw_eeprom_cmd' are ABI compatible, hence no
regular warning from -Wincompatible-function-pointer-types, the mismatch
will trigger a kCFI violation when mp1_v13_0_eeprom_send_msg() is called
indirectly.

Update the second parameter of mp1_v13_0_eeprom_send_msg()' to be
'u32 msg_id' to match the prototype in 'struct ras_mp1_sys_func' (which
was recently changed to support mp1_v15_0), clearing up the warning and
kCFI violation.

Fixes: 11a948c7817b ("drm/amd/ras: Support retrieving bad page info from mp1_v15_0")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mp1_v13_0.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mp1_v13_0.c b/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mp1_v13_0.c
index 7aa818a433f6..548594373d0b 100644
--- a/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mp1_v13_0.c
+++ b/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mp1_v13_0.c
@@ -105,14 +105,14 @@ static int mp1_v13_0_dump_valid_bank(struct ras_core_context *ras_core,
 }
 
 static int mp1_v13_0_eeprom_send_msg(struct ras_core_context *ras_core,
-				enum ras_fw_eeprom_cmd index, uint32_t param, uint32_t *read_arg)
+				u32 msg_id, uint32_t param, uint32_t *read_arg)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)ras_core->dev;
 	int ret = 0;
 
 	if (down_read_trylock(&adev->reset_domain->sem)) {
 		ret = mp1_v13_send_smu_msg(adev,
-			pmfw_eeprom_msgs[index], param, read_arg);
+			pmfw_eeprom_msgs[msg_id], param, read_arg);
 		up_read(&adev->reset_domain->sem);
 	} else {
 		ret = -RAS_CORE_GPU_IN_MODE1_RESET;

---
base-commit: 8fad652e7235dbf3bebfab1460610b0b0e75b199
change-id: 20260902-amdgpu-ras-wifpts-c8628642e565

Best regards,
--  
Cheers,
Nathan

