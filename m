Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CD44BEE2E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790798619; cv=none; b=Cuc3R+TB8vA3j/M3335kYKy3aE4nueXDSWtcxe8wAre1gEj/9ZYnTPCz7AQn9y/WXzkbtji8Fj42tw1Wfl6N5Q6xOoDvd2767vic01kyEj8kGpoaO4bRdOkhXwropKp82Yb2xXPpMeQcET2Wz/l43ldI8XHwhqk7vnUJjqrMGCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790798619; c=relaxed/simple;
	bh=HzpJAle6pBAY8l6gos2Yc4M7Ib785LpVEW1FvszVpRI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qX+cNCdnf5jevCvbEyDgZBQXX473qBcx7qsoZzAosr3TDqOZq8Z0YKpls8nG3e5ae4KEDRpc68/p3rAd23voyBcuH+59q6HcFgpsfSoplNMpqOECDcKHgB90yJfO+LoxpoGIInvtcMNhAtdJF2Wfav8cFpGX3RCBZurWTQXqY+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmAeNDRm; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmAeNDRm"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-1438e88300cso5857108c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790798617; x=1791403417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cASLx32ym87jdhS0h2FvPN2AduCc3BT2HfqD8zMngx0=;
        b=cmAeNDRmTyYkNhl57eoPedg99yjZ+7Ta9yOpHkfrOHB8Z+iRPlhea+07V6r252cN7A
         wppJgMTrfXopUE1IYR/9pvLg1ueh7h3AcasvA/p1arj9FfrGjybVLUaxtxwZhtKOdlHl
         12vkcdjk6QmVuS4yjplCxibu0Q5G4TEh6zirejYfIPg2thwmIEgpNucIg7ZI0LXx3u7L
         1kNp4Y6jCKalDbHE3JlzZ3JGHMmm4isVHUkkiQv79CLdykIuNwvzRGGh7rw1AmUAwkQC
         2yeiBQZYbUGwPBcluzWLf0wTGz4An/TXbOCI4yh99+plp+4+qsuBM2pthLTnnC2Vt3s+
         phLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790798617; x=1791403417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cASLx32ym87jdhS0h2FvPN2AduCc3BT2HfqD8zMngx0=;
        b=UsiwjdfM16P+rDnyKCHgmCkQQ0A8Sk2kRxvDCSq46rNima10bP6XAxWQVcWEfwPhj9
         HEWoz3+Kfn/XmJDoIS2xhTw5JwLGcfrkbXNOxJtbzP8a09orPlebEd+Y4q0BU2YhDeIZ
         81DM/Qo5cQolNr8GEh+MA0ibGzDPdASZQpMXSuOuv5WG4Cl8UOqFD7Sh0Ca+EESxZbAH
         8kbFuaKiSV+IPSJrPaUqUgVyC7J6CuKnQ+fbM9c33/KvgaKb3K5hkv+ThkLTSTZaGKG3
         OAHzwa3UQ2IuZQB15kLurlaJBI8cXlcYppcablzLvPKhyclbZFSeHN0P6ki3QNGvglBy
         2GiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHnIYr74PYxz3+W0I/WhGr9t9OcMzCH8zDIBYyx8lNgThq+1nmuwmSgmmkY6A8j9quIeh+63Mxs0xd6zA=@vger.kernel.org
X-Gm-Message-State: AFuF++nrCTj0sWeJlQaSzNrRpatOB1R7o9bqvIJtAYjpRXEkFq+JpfIh
	gryhQdOumVYPeym7KbgGCRkDcusm947aZifdyAJT/CutQomQVcbcisgg
X-Gm-Gg: AYBFou3ffE0VxuuDiMYYjpNz9pOsF7pucpu50J9FfyT28Z3MZQGKnjtTwZCrwXfPSWk
	X8J3cextZoe+AAdPJjiWnKn0qpgUY7MwfpoS8QG8IR/tDLGSIDegw81G+07+iTo/KToJl5Y+B26
	gmNPBO25QtRQFJ1NwEo/NvtdNAeeJ2CYrroi2j9emxzuFverE1+Kg3rpkyrMCx/4sPWoHvRNMqg
	7gC91wjOtNcJEHW41UUf8RTs5oY1CbsAWO/UoHmJYAbquym+l0yKQRwbKsYo8d9gpY2oShxH7zN
	/q159iHetLnMSMiXlCwcAsb1ZsnVNSgfArTxI90xAbLqKhDwId71CBrIgpysSTKtK2v7ti/kXiO
	GvNdyuAMF9XNKL+DzPNxZJLyTjOnXecx+5Hrv0KSehGnweMVlInMMKUlzEigJ6pZoSK3jvs9OBD
	gzfUqvb9Zk3juhecf9a05S+n/myLL1v6LCtREKbvJkKDXzHDVhGrbGjg0WlBb9tmEIANbYUwiLx
	CdXJUU=
X-Received: by 2002:a05:7022:158b:b0:141:5281:8a41 with SMTP id a92af1059eb24-14d33494dfamr2639297c88.9.1790798616734;
        Wed, 30 Sep 2026 13:03:36 -0700 (PDT)
Received: from G15-5520 ([36.255.19.64])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14df11858b3sm460601c88.2.2026.09.30.13.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 13:03:36 -0700 (PDT)
From: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Cc: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Subject: [PATCH] amdgpu: Use 2-argument strscpy() where destination size is known
Date: Wed, 30 Sep 2026 20:03:25 +0000
Message-ID: <20260930200326.42827-1-lalitshankarch@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify the code by dropping the explicit size argument from strscpy()
where the destination buffer has a compile-time known size.

No functional change.

Signed-off-by: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c   | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c       | 2 +-
 drivers/gpu/drm/amd/amdgpu/atom.c                | 2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c            | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
index 1e21e3444802..34defcfc563d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
@@ -327,7 +327,7 @@ static int amdgpu_atomfirmware_get_uma_carveout_info_v2_3(struct amdgpu_device *
 			uma_info->entries[i].memory_carved_mb = (uint32_t)opts[i].memoryCarvedGb << 10;
 
 		uma_info->entries[i].flags = opts[i].uma_carveout_option_flags.all8;
-		strscpy(uma_info->entries[i].name, opts[i].optionName, MAX_UMA_OPTION_NAME);
+		strscpy(uma_info->entries[i].name, opts[i].optionName);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index 92c98e999efe..40829d2f9c97 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -428,7 +428,7 @@ static void amdgpu_connector_add_common_modes(struct drm_encoder *encoder,
 		mode = drm_cvt_mode(dev, common_modes[i].w, common_modes[i].h, 60, false, false, false);
 		if (!mode)
 			return;
-		strscpy(mode->name, common_modes[i].name, DRM_DISPLAY_MODE_LEN);
+		strscpy(mode->name, common_modes[i].name);
 
 		drm_mode_probed_add(connector, mode);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 9269e780feb7..aafcd60d2107 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3591,7 +3591,7 @@ static int amdgpu_device_get_job_timeout_settings(struct amdgpu_device *adev)
 	 * remains intact for multi-GPU systems where this function is called
 	 * once per device.
 	 */
-	strscpy(buf, amdgpu_lockup_timeout, sizeof(buf));
+	strscpy(buf, amdgpu_lockup_timeout);
 
 	while ((timeout_setting = strsep(&input, ",")) &&
 	       strnlen(timeout_setting, AMDGPU_MAX_TIMEOUT_PARAM_LENGTH)) {
diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu/atom.c
index e0e585f280e2..9796eeab73bb 100644
--- a/drivers/gpu/drm/amd/amdgpu/atom.c
+++ b/drivers/gpu/drm/amd/amdgpu/atom.c
@@ -1410,7 +1410,7 @@ static void atom_get_vbios_name(struct atom_context *ctx)
 
 no_name:
 	/* do not know where to find name */
-	strscpy(ctx->name, na, sizeof(ctx->name));
+	strscpy(ctx->name, na);
 }
 
 static void atom_get_vbios_date(struct atom_context *ctx)
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index c3322058720f..a50d2885d786 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -2356,7 +2356,7 @@ static int gfx_v9_0_sw_init(struct amdgpu_ip_block *ip_block)
 		for (i = 0; i < GFX9_NUM_SW_GFX_RINGS; i++) {
 			ring = &adev->gfx.sw_gfx_ring[i];
 			ring->ring_obj = NULL;
-			strscpy(ring->name, amdgpu_sw_ring_name(i), sizeof(ring->name));
+			strscpy(ring->name, amdgpu_sw_ring_name(i));
 			ring->use_doorbell = true;
 			ring->doorbell_index = adev->doorbell_index.gfx_ring0 << 1;
 			ring->is_sw_ring = true;
-- 
2.53.0

