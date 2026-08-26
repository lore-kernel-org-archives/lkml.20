Received: from sg-2-3.ptr.blmpb.com (sg-2-3.ptr.blmpb.com [71.18.227.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52133FE645
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=71.18.227.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787764027; cv=none; b=OOPPwIqh5niVG5E6T4aLmNpwFywxsPdkLFUjrVoeoA5qv+Nes331gnTPPjsgGwbYGNya6wvIDZNhKyXmKqIuBhX1sfk45NaU/ue0Gf0m7NyCh5ffWkuRJTAd5OQEdp1ZTXkgi5KviKj1sXyk1wyr1L6QcTT5MUonSr2acbkCCBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787764027; c=relaxed/simple;
	bh=dSsOoJv0Bwl7zyu91B10LIw1eowJ01jHsBJIrSpVYqA=;
	h=Content-Type:Cc:From:Date:Mime-Version:To:Subject:Message-Id; b=Y3wcbbv4PZBRldBNh/wA+9fWNMV70x2BPKd5YoA9+Q4g6jQ68K8GLw+F+AUMEt8ebQFI81tLBJNmO8Sj4pESYsa+UeUMhUV6y04yt9iiq9g4V76up1l60ob+ctRb2EQjxemmvmrAUH0YgSLBFL/i6nt50d9NS+8s69j4cDwcKq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=imm0nv1nhtv.is-a.dev; spf=pass smtp.mailfrom=imm0nv1nhtv.is-a.dev; dkim=pass (2048-bit key) header.d=imm0nv1nhtv.is-a.dev header.i=@imm0nv1nhtv.is-a.dev header.b=du85JHmS; arc=none smtp.client-ip=71.18.227.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=imm0nv1nhtv.is-a.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imm0nv1nhtv.is-a.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imm0nv1nhtv.is-a.dev header.i=@imm0nv1nhtv.is-a.dev header.b="du85JHmS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=lark2602131731; d=imm0nv1nhtv.is-a.dev; t=1787764001;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=66y2Z7+kgSTbg4mCZlouNLKSz7scqmRDaXjCfMaqlng=;
 b=du85JHmSYcDkuzdzsYfgCoLmcUV3I+vqRhC2Or6t0zaEu5M2krygiJMmiaO2GBAbUNynTN
 Rz7YZwO8Upb0fjMzbDZYNowTpcBNVuWaNX6azlxD30f4JYGdaOvQxnZaPjZnChrtsfQXB1
 OFPp9Y0Kp2r57zI6/+yC36Tl+PA7db+OvBkMgIhPh15a/HP/bsGaAdB/Ifm9rCNnY7rq99
 jI8QTiie0KuHHde/QUhGErSBS6jxsd+TxdxJweqVwJo7k43TRoQ2MzHyR/012x0hQJUVws
 jHej9n0xvYIsfBf3O/NXMkksCukAFRdBxTRLJ3nRd4kFA8JQia1CvQrlxlhHwQ==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: git-send-email 2.47.3
X-Lms-Return-Path: <lba+26a8f1d20+9c9868+vger.kernel.org+neptune@imm0nv1nhtv.is-a.dev>
Cc: "Rodrigo Siqueira" <siqueira@igalia.com>, 
	"David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, 
	<amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, 
	<linux-kernel@vger.kernel.org>, 
	"NepNep7601" <neptune@imm0nv1nhtv.is-a.dev>
From: "NepNep7601" <neptune@imm0nv1nhtv.is-a.dev>
Date: Thu, 27 Aug 2026 00:05:49 +0700
X-Original-From: NepNep7601 <neptune@imm0nv1nhtv.is-a.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Received: from Neptune-PC.kiko-royal.ts.net ([58.186.164.158]) by smtp.larksuite.com with ESMTPS; Wed, 26 Aug 2026 17:06:40 +0000
To: "Harry Wentland" <harry.wentland@amd.com>, "Leo Li" <sunpeng.li@amd.com>, 
	"Alex Deucher" <alexander.deucher@amd.com>, 
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/amd/display: fall back to software I2C on hardware engine failure
Message-Id: <20260826170549.21985-1-neptune@imm0nv1nhtv.is-a.dev>

dce_i2c_submit_command() returns the hardware I2C engine's result
directly, so a failed transfer is reported to the caller even though a
bit-banging software engine is available. That engine is only reachable
when the hardware engine cannot be acquired, never when its transfer
fails.

On DCE6 the hardware engine acknowledges a slave address but fails to
complete a 128 byte EDID block read. On an Oland-based GPU (Radeon
R7 430, rebranded R7 240, 1002:6611) driving a monitor through a
passive DP to HDMI to DVI chain, this leaves
dm_helpers_read_local_edid() with EDID_NO_RESPONSE:

  [    6.684221] [drm:dm_helpers_read_local_edid [amdgpu]] *ERROR* EDID err: 2, on connector: DP-1
  [    6.684726] amdgpu 0000:01:00.0: [drm] *ERROR* No EDID read.

The connector is then left with no modes and falls back to 640x480
instead of the display's native 1600x900. The DDC bus itself is fine:
i2cdetect sees the EDID EEPROM acknowledge at 0x50, while a real block
read with "i2ctransfer -y 1 w1@0x50 0x00 r128" fails with EIO. Short
transfers work, long ones do not.

dce_i2c_submit_command_hw() clears i2c_hw_buffer_in_use, releases the
engine and closes the DDC line on every exit path, so the software
engine can safely re-acquire it. Retry there rather than failing
outright. Behaviour is unchanged whenever the hardware engine
succeeds, and the fallback only runs where the transfer had already
failed.

Assisted-by: Claude:claude-opus-5
Signed-off-by: NepNep7601 <neptune@imm0nv1nhtv.is-a.dev>
---
Tested on 7.1.8 on an Oland (Radeon R7 430, rebranded R7 240, 1002:6611)
with a passive DP to HDMI to DVI chain: with this patch the EDID reads
256 bytes and the display comes up at its native 1600x900 instead of
640x480. Without it, dm_helpers_read_local_edid() returns
EDID_NO_RESPONSE.

On amd-staging-drm-next this is compile-tested only.
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_i2c.c b/drivers/gpu/drm/amd/display/dc/dce/dce_i2c.c
index f5261e8d7678..238c17e6f51d 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_i2c.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_i2c.c
@@ -72,9 +72,16 @@ bool dce_i2c_submit_command(
 
 	dce_i2c_hw = acquire_i2c_hw_engine(pool, ddc);
 
-	if (dce_i2c_hw)
-		return dce_i2c_submit_command_hw(pool, ddc, cmd, dce_i2c_hw);
+	if (dce_i2c_hw && dce_i2c_submit_command_hw(pool, ddc, cmd, dce_i2c_hw))
+		return true;
 
+	/*
+	 * The hardware I2C engine on DCE6 can fail to complete longer
+	 * transfers, such as a 128 byte EDID block read, even when the slave
+	 * acknowledges its address. dce_i2c_submit_command_hw() releases the
+	 * engine and closes the DDC line on every exit path, so retry the
+	 * transfer on the bit-banging software engine instead of giving up.
+	 */
 	dce_i2c_sw.ctx = ddc->ctx;
 	if (dce_i2c_engine_acquire_sw(&dce_i2c_sw, ddc)) {
 		return dce_i2c_submit_command_sw(pool, ddc, cmd, &dce_i2c_sw);
-- 
2.47.3
