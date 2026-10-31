Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793420343;
	b=gVK+wvSf4ckZtFnHHeo6U04uO+3I0u1lzKMld+AsldaiRsHAnyAdu16VFDW+/YQ1leOG
	 FvlSatFLO0Qh0/0iWeEgvSGVygSwy2vsZhuPvqIgtdQuSd8zSCwC/EEPSI2F/B2DYGuRo
	 XXHKifP8iTOchiZKrAysCdoLdzddRDxhNNEhKXvokotSnLN7OJa5SceIK+k5VA97iaWWm
	 ov13tIwkzMnjzK92jOfZB87r8C9vJqktjNJfT7BoG492C9hYx0e2r/9MNOSM0oDfSIAgh
	 ACTmDCY7nyRwTrySBDmj30OT0846tZ9/fm0RFtExqm1sFI1IGRPiIwIF1O2prTzmyaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793420343;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FjaprEqnq3Ht16aGLjLhtlHDEpAzHCzAXN2oS94TnPI=;
	b=QLQazBMqLTGMlfhIBoRHqIBOrviLJ4CjmizGQEcN6X3RmB2p6ZHR3kGJWvsFytUgb7d6
	 dFyZJFYB1SBZJ+lmK1dTsdCE90kOT95xYGbo2zxc7UxujgahlRKshVWH6KjPsE/fyWGVw
	 VVI5lGEI1SUqXqISEz3+wid0Qj4CQ/Z8a1uf+CTWgO9XbE9NsqcRxFs+nmLvK4a1qcVay
	 k2yzxncRXW+gEB9eiW0I0zDFfMOGAw8l7ZkUFkYYQk7wGZHllKdv1QoERQ0A7gxr7cZou
	 F6OS+eErC/JSqYrii/K1DzslLTN57bVFcLJjckDdE7I6xV2jK3+UlYRVeRfvgpjAd4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cwooper.dev;
	spf=pass smtp.mailfrom=cwooper.dev;
	dkim=pass header.d=cwooper.dev header.i=@cwooper.dev header.a=rsa-sha256 header.s=key1 header.b=qF7+ryy7;
	arc=none smtp.remote-ip=95.215.58.158
Received: from mta1.migadu.com (out-158.mta1.migadu.com [95.215.58.158])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6127F606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:19:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6127F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cwooper.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cwooper.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cwooper.dev header.i=@cwooper.dev header.a=rsa-sha256 header.s=key1 header.b=qF7+ryy7
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=W3RYCzdyOzDqvLgu9ozi/BTEzVvjp21rlibNduXqxDM=;
 c=simple/simple; d=cwooper.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793420340; v=1; x=1794025140;
 b=qF7+ryy7idi+OBG7zyUeuT4LOg+AR2MMpaBjhZon4BbMJL6O2rWrotJUqouXLi4MCQwuHKMa
 m/4zBm7Ve5VLR1ePH+iBPpXdIK4Gxc5dUCySIL3X8Mb8PCROieYx6QJGX8o4XnxPv+qpK3Gchry
 4j/DDtNhlNE3hGBwTVqsRadVJI3MMvmbbxkqBYkq1oNViyD4av/ljteuKf2Dxnui6Cha0rPnjpO
 H6q1i1ZwtHePl8yw3cbFu0jeQXZLNi2N3/h8nHI3DWe/ELXlZAuC/56lwtYmOHItzo3s8r1liIY
 4/OxJBlclfoGgQ/OC+V+b4ps3M1HICcrrbiWhsVWq6J5g==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d31f048f24ec9d98;
	Sat, 31 Oct 2026 04:19:00 +0000
X-Mizu-Trace-ID: d31f048f24ec9d98
X-Migadu-Flow: FLOW_OUT
From: Cooper Morgan <ext-github@cwooper.dev>
To: amd-gfx@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/amd/display: Saturate refresh rates in v1/v2 FreeSync infopackets
Date: Fri, 30 Oct 2026 21:18:25 -0700
Message-ID: <20261031041827.162730-2-ext-github@cwooper.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261031041827.162730-1-ext-github@cwooper.dev>
References: <20261031041827.162730-1-ext-github@cwooper.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v1 and v2 FreeSync infopackets carry the minimum and maximum
refresh rate in one byte each, and build_vrr_infopacket_data_v1() casts
the rate in Hz to unsigned char. On a sink whose range goes above
255 Hz the value wraps: a 320 Hz mode is advertised as a 64 Hz maximum.

Sinks that treat the field as authoritative misbehave once the wrapped
value lands inside their range. An MSI MAG 271QPX32 (48-320 Hz) over
native DP looks like a ~720p image upscaled to the full screen at 320 Hz
and runs its self-test pattern at 305-315 Hz, while 300 Hz (wrapping to
44 Hz, below its minimum) is fine. Capping the EDID range at 255 Hz, so
the packet says 255, gives a correct picture at 320 Hz.

Saturate the fields at 255 Hz instead of wrapping.

Capping v1 at 255 as a fallback was suggested by oystersuki in the linked
issue.

Fixes: 98e6436d3af5 ("drm/amd/display: Refactor FreeSync module")
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/5988
Cc: stable@vger.kernel.org
Signed-off-by: Cooper Morgan <ext-github@cwooper.dev>
---
 .../amdgpu_dm/tests/amdgpu_dm_freesync_test.c | 57 +++++++++++++++++++
 .../amd/display/modules/freesync/freesync.c   | 12 +++-
 2 files changed, 66 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_freesync_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_freesync_test.c
index 710cdc7f4..b603516e2 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_freesync_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_freesync_test.c
@@ -664,6 +664,62 @@ static void dm_test_update_freesync_state_pcon_default(struct kunit *test)
 	dm_test_update_freesync_state_pcon_version(test, 0);
 }
 
+/*
+ * Build the VRR infopacket for a non-PCON, non-Replay sink with VRR inactive
+ * over 48Hz to @mode_hz, the max that mod_freesync_build_vrr_params() clamps
+ * to the mode's rate.
+ */
+static struct dc_info_packet
+dm_test_freesync_packet(struct kunit *test, enum signal_type signal,
+			u8 vsdb_version, int sink_max_hz, int mode_hz)
+{
+	struct amdgpu_device *adev = dm_kunit_alloc_adev(test);
+	struct dc_link *link = dm_kunit_alloc_link(test);
+	struct dc_stream_state *stream = dm_kunit_alloc_stream(test, link);
+	struct amdgpu_dm_connector *aconnector;
+	struct mod_vrr_params *vrr;
+	struct amdgpu_crtc *acrtc;
+	struct dm_crtc_state crtc_state = { 0 };
+
+	acrtc = kunit_kzalloc(test, sizeof(*acrtc), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, acrtc);
+	aconnector = kunit_kzalloc(test, sizeof(*aconnector), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, aconnector);
+	crtc_state.base.crtc = &acrtc->base;
+	stream->timing.h_total = 2200;
+	stream->timing.v_total = 1125;
+	stream->signal = signal;
+	stream->dm_stream_context = aconnector;
+	aconnector->vsdb_info.amd_vsdb_version = vsdb_version;
+	aconnector->max_vfreq = sink_max_hz;
+	vrr = &acrtc->dm_irq_params.vrr_params;
+	vrr->send_info_frame = true;
+	vrr->state = VRR_STATE_INACTIVE;
+	vrr->min_refresh_in_uhz = 48000000;
+	vrr->max_refresh_in_uhz = mode_hz * 1000000;
+	adev->dm.adev = adev;
+
+	amdgpu_dm_update_freesync_state_on_stream(&adev->dm, &crtc_state, stream, NULL, 0);
+
+	return crtc_state.vrr_infopacket;
+}
+
+/**
+ * dm_test_update_freesync_state_dp_v2_saturates - Test v1 saturates above 255Hz
+ * @test: The KUnit test context
+ *
+ * A VSDB v2 sink keeps the v1 packet, which cannot carry 320Hz.
+ */
+static void dm_test_update_freesync_state_dp_v2_saturates(struct kunit *test)
+{
+	struct dc_info_packet p =
+		dm_test_freesync_packet(test, SIGNAL_TYPE_DISPLAY_PORT, 2, 320, 320);
+
+	KUNIT_EXPECT_EQ(test, p.hb3, 0x04);
+	KUNIT_EXPECT_EQ(test, p.sb[7], 255);
+	KUNIT_EXPECT_EQ(test, p.sb[8], 255);
+}
+
 /* Tests for amdgpu_dm_update_stream_irq_parameters() */
 
 /**
@@ -900,6 +956,7 @@ static struct kunit_case amdgpu_dm_freesync_tests[] = {
 	KUNIT_CASE(dm_test_update_freesync_state_pcon_v2),
 	KUNIT_CASE(dm_test_update_freesync_state_pcon_v3),
 	KUNIT_CASE(dm_test_update_freesync_state_pcon_default),
+	KUNIT_CASE(dm_test_update_freesync_state_dp_v2_saturates),
 	/* amdgpu_dm_update_stream_irq_parameters */
 	KUNIT_CASE(dm_test_update_stream_irq_parameters_no_stream),
 	KUNIT_CASE(dm_test_update_stream_irq_parameters_invalid_timing),
diff --git a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
index 4bd060e30..af7054668 100644
--- a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
+++ b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
@@ -571,6 +571,12 @@ static bool vrr_settings_require_update(struct core_freesync *core_freesync,
 	return false;
 }
 
+/* v1/v2 packets hold each rate in one byte; saturate instead of wrapping. */
+static unsigned char vrr_refresh_hz_u8(unsigned int refresh_in_uhz)
+{
+	return min((refresh_in_uhz + 500000) / 1000000, 255U);
+}
+
 static void build_vrr_infopacket_data_v1(const struct mod_vrr_params *vrr,
 		struct dc_info_packet *infopacket,
 		bool freesync_on_desktop)
@@ -614,15 +620,15 @@ static void build_vrr_infopacket_data_v1(const struct mod_vrr_params *vrr,
 	/* PB7 = FreeSync Minimum refresh rate (Hz) */
 	if (vrr->state == VRR_STATE_ACTIVE_VARIABLE ||
 			vrr->state == VRR_STATE_ACTIVE_FIXED) {
-		infopacket->sb[7] = (unsigned char)((vrr->min_refresh_in_uhz + 500000) / 1000000);
+		infopacket->sb[7] = vrr_refresh_hz_u8(vrr->min_refresh_in_uhz);
 	} else {
-		infopacket->sb[7] = (unsigned char)((vrr->max_refresh_in_uhz + 500000) / 1000000);
+		infopacket->sb[7] = vrr_refresh_hz_u8(vrr->max_refresh_in_uhz);
 	}
 
 	/* PB8 = FreeSync Maximum refresh rate (Hz)
 	 * Note: We should never go above the field rate of the mode timing set.
 	 */
-	infopacket->sb[8] = (unsigned char)((vrr->max_refresh_in_uhz + 500000) / 1000000);
+	infopacket->sb[8] = vrr_refresh_hz_u8(vrr->max_refresh_in_uhz);
 }
 
 static void build_vrr_infopacket_data_v3(const struct mod_vrr_params *vrr,
-- 
2.56.0

