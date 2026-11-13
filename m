Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794531959;
	b=jgDADWOfbyO86741Fux5+73/5w5m2IBo0goM1LLlLXNkYP8wtgpNGl+nooAzHdTZ93hH
	 0aEr5xpnxX15U/r9FR2aHNuVIq2ot5+lkRiqBrVYd7QyZuFDX1aD3ds8pjRA75qIJsd2U
	 IgqPrh6rwB7D/kIwMO0XzVm2J8zfXU4TTj9LJ8jP5cN9hcaQU32KGvcMnK3corJ+p1ype
	 P4fZR/u9+X+/McvDoL0RUhqh/5kiotPJ11YQn3H/yzF3/cROV5auNlASrBAPRqwmA0XAW
	 2Zdca1vdnjfTEOFfx7ZNElOtusbjc9PCi4rERNcLslyKAE5mAr6RF1azNZx/2A4wakA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794531959;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=76Y01j2VJB9rS6JmSAaKRMaCQFaDN5HsL+B4MKXf8fM=;
	b=hsvEydyIoiTnXja40cHQRGNpIs6nrdHkS4FCCYUQWtzNKbnJOT/u5Sy2KNt4+Cj8glqk
	 rfCtba1UmuiVyHO7LfrhDv+RSJZczC3QT+t2mnl/Xod+6+m+0CjEgDgo04wfd4Rj1v5wi
	 HIEibM992NCp/TIHHGSjGzFVhcKmCpOmztOxUnqP5HbtSsgb6941qZ6BnwfL8s+d5nvn3
	 CgLfwDpIzeB+bYvIVHQuwO+GZQCllCorajXzbib++ogZsTueSCdpCFJAVd5eLZxAqVUp1
	 tc5s8f5aKwl1o8kdK9MbK0TtNEjRt+WbpH+b1PraJgXYbXEYgr1k58iHB8CvS6piqJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cwooper.dev;
	spf=pass smtp.mailfrom=cwooper.dev;
	dkim=pass header.d=cwooper.dev header.i=@cwooper.dev header.a=rsa-sha256 header.s=key1 header.b=hJabWBbZ;
	arc=none smtp.remote-ip=91.218.175.176
Received: from mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246C5606A888
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 246C5606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cwooper.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cwooper.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cwooper.dev header.i=@cwooper.dev header.a=rsa-sha256 header.s=key1 header.b=hJabWBbZ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UmlN0riGm1m4GmoCpnKaPIAfWVTagNinzHYTLEKOkvA=;
 c=simple/simple; d=cwooper.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794531957; v=1; x=1795136757;
 b=hJabWBbZqKaATaSVSXnnz86bkJtLHu7lYgKfoLoVuwUnTYGf4Vr/WDjkyA4Y1pEDNj5nLBsP
 wCDPpispTXygBf0xi+RHh0jR1SA6rXUhAZfrVz0C2LvX2SJ20XLEoSD7GgEMnwv+a+2PWQ5DJ5i
 h72LZYnSXUJMEIPfTZFYql5GB/5QSC7rva71h+PKzvXn7FsdGd3rt5VvW/+qx3wP07IOjaLDly6
 S6lg1C8/4YUiTl1ulleDlUGsGOQ679C33PNsO8S7b+/CPnXmb+OJ2QhySgYMSPCa5dFowIPtB8H
 qTZDOgRgWaDBt9droPr4ztwj5sXVrRRgyw0t7xxCL4tMA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7c6023a2babafab5;
	Fri, 13 Nov 2026 01:05:56 +0000
X-Mizu-Trace-ID: 7c6023a2babafab5
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
	linux-kernel@vger.kernel.org,
	oystersuki <oss@oysterdaisuki.com>
Subject: [PATCH v2 2/2] drm/amd/display: Use FreeSync v3 infopacket for sinks above 255 Hz
Date: Thu, 12 Nov 2026 17:05:28 -0800
Message-ID: <20261113010529.11514-3-ext-github@cwooper.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113010529.11514-1-ext-github@cwooper.dev>
References: <20261113010529.11514-1-ext-github@cwooper.dev>
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

Native DP, eDP, and HDMI sinks get the v1 FreeSync infopacket unless
they are a whitelisted PCON or support Replay. v1 holds each refresh
rate in one byte, so a sink whose range goes above 255 Hz cannot be
told its real maximum. The v3 packet carries the high bits in
PB11/PB12.

The AMD VSDB version was stored for DP and eDP sinks only when they
support Replay. Store it for every DP and eDP sink, as the HDMI path
already does, and send v3 when the sink advertises AMD VSDB v3 and its
maximum refresh rate is above 255 Hz. The choice follows the sink's
maximum rather than the current mode, so such a sink gets v3 at every
mode and the packet version stays fixed per sink. Sinks whose maximum
is 255 Hz or less are unchanged.

Storing the VSDB version for DP sinks and selecting v3 from it follows
sunryze's approach in the linked issue.

Tested with this series backported to v7.2.13 on an MSI MAG 271QPX32
(AMD VSDB v3, 48-320 Hz) over DP 1.4 on an RX 9070 XT: 320 Hz shows a
correct picture, and with VRR active the refresh rate tracks frame
caps of 300, 270, and 100 Hz. At 240 Hz, where the sink now gets v3
instead of v1, the picture is correct and VRR tracks a 100 Hz cap.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/5988
Signed-off-by: Cooper Morgan <ext-github@cwooper.dev>
Tested-by: oystersuki <oss@oysterdaisuki.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
---
 .../display/amdgpu_dm/amdgpu_dm_connector.c   |  2 +-
 .../display/amdgpu_dm/amdgpu_dm_freesync.c    |  7 +++
 .../tests/amdgpu_dm_connector_test.c          | 25 ++++++++
 .../amdgpu_dm/tests/amdgpu_dm_freesync_test.c | 59 +++++++++++++++++++
 4 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
index e8f050feb6e3..dd0438ee70c9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
@@ -3908,10 +3908,10 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 		}
 
 		get_amd_vsdb(amdgpu_dm_connector, &vsdb_info);
+		amdgpu_dm_connector->vsdb_info.amd_vsdb_version = vsdb_info.amd_vsdb_version;
 
 		if (vsdb_info.replay_mode) {
 			amdgpu_dm_connector->vsdb_info.replay_mode = vsdb_info.replay_mode;
-			amdgpu_dm_connector->vsdb_info.amd_vsdb_version = vsdb_info.amd_vsdb_version;
 			amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_EDP;
 		}
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_freesync.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_freesync.c
index 40f1dd8af21c..de7f04bb0445 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_freesync.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_freesync.c
@@ -290,6 +290,13 @@ void amdgpu_dm_update_freesync_state_on_stream(
 
 		mod_build_adaptive_sync_infopacket(new_stream, aconn->as_type, NULL,
 					&new_stream->adaptive_sync_infopacket);
+	} else if (aconn && aconn->vsdb_info.amd_vsdb_version == 3 &&
+		   aconn->max_vfreq > 255) {
+		/*
+		 * v1 saturates at 255 Hz. Keyed on the sink's max, not the mode's
+		 * rate, so the packet version stays fixed per sink.
+		 */
+		packet_type = PACKET_TYPE_FS_V3;
 	}
 
 	app_tf = dm_dp_in_hdr_mode(new_stream) ?
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.c
index addc407841a2..a99c2d21e627 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.c
@@ -9858,6 +9858,30 @@ static void dm_test_fs_caps_edp_replay_mode(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, (int)ctx->aconnector->as_type, (int)ADAPTIVE_SYNC_TYPE_EDP);
 }
 
+/**
+ * dm_test_fs_caps_dp_vsdb_version - Test a DP sink's VSDB version without replay
+ * @test: The KUnit test context
+ *
+ * The version selects the FreeSync infopacket, so it is kept for every DP sink,
+ * and a later sink without the VSDB clears it.
+ */
+static void dm_test_fs_caps_dp_vsdb_version(struct kunit *test)
+{
+	struct dm_test_fs_caps_ctx *ctx =
+		dm_test_fs_caps_ctx_alloc(test, SIGNAL_TYPE_DISPLAY_PORT);
+
+	amdgpu_dm_update_freesync_caps(&ctx->aconnector->base,
+				       dm_test_fs_edid_amd_vsdb(test, 0, 0, 0), false);
+
+	KUNIT_EXPECT_FALSE(test, ctx->aconnector->vsdb_info.replay_mode);
+	KUNIT_EXPECT_EQ(test, ctx->aconnector->vsdb_info.amd_vsdb_version, 3);
+
+	amdgpu_dm_update_freesync_caps(&ctx->aconnector->base,
+				       dm_test_fs_edid_displayid(test, 40, 144), false);
+
+	KUNIT_EXPECT_EQ(test, ctx->aconnector->vsdb_info.amd_vsdb_version, 0);
+}
+
 /**
  * dm_test_fs_caps_hdmi_vsdb - Test the HDMI AMD VSDB refresh range
  * @test: The KUnit test context
@@ -10739,6 +10763,7 @@ static struct kunit_case amdgpu_dm_connector_tests[] = {
 	KUNIT_CASE(dm_test_fs_caps_dp_narrow_range),
 	KUNIT_CASE(dm_test_fs_caps_dp_msa_not_allowed),
 	KUNIT_CASE(dm_test_fs_caps_edp_replay_mode),
+	KUNIT_CASE(dm_test_fs_caps_dp_vsdb_version),
 	KUNIT_CASE(dm_test_fs_caps_hdmi_vsdb),
 	KUNIT_CASE(dm_test_fs_caps_hdmi_no_vsdb),
 	KUNIT_CASE(dm_test_fs_caps_pcon_whitelist),
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_freesync_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_freesync_test.c
index b603516e2244..b1a414445a82 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_freesync_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_freesync_test.c
@@ -720,6 +720,61 @@ static void dm_test_update_freesync_state_dp_v2_saturates(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, p.sb[8], 255);
 }
 
+/**
+ * dm_test_update_freesync_state_dp_v3_above_255 - Test v3 for a VSDB v3 sink above 255Hz
+ * @test: The KUnit test context
+ */
+static void dm_test_update_freesync_state_dp_v3_above_255(struct kunit *test)
+{
+	struct dc_info_packet p =
+		dm_test_freesync_packet(test, SIGNAL_TYPE_DISPLAY_PORT, 3, 320, 320);
+
+	KUNIT_EXPECT_EQ(test, p.hb3, 3 << 2);
+	KUNIT_EXPECT_EQ(test, p.sb[8], 320 & 0xff);
+	KUNIT_EXPECT_EQ(test, p.sb[12], 320 >> 8);
+}
+
+/**
+ * dm_test_update_freesync_state_dp_v3_mode_240 - Test v3 follows the sink max, not the mode
+ * @test: The KUnit test context
+ */
+static void dm_test_update_freesync_state_dp_v3_mode_240(struct kunit *test)
+{
+	struct dc_info_packet p =
+		dm_test_freesync_packet(test, SIGNAL_TYPE_DISPLAY_PORT, 3, 320, 240);
+
+	KUNIT_EXPECT_EQ(test, p.hb3, 3 << 2);
+	KUNIT_EXPECT_EQ(test, p.sb[8], 240);
+	KUNIT_EXPECT_EQ(test, p.sb[12], 0);
+}
+
+/**
+ * dm_test_update_freesync_state_dp_v3_at_255 - Test a VSDB v3 sink at 255Hz keeps v1
+ * @test: The KUnit test context
+ */
+static void dm_test_update_freesync_state_dp_v3_at_255(struct kunit *test)
+{
+	struct dc_info_packet p =
+		dm_test_freesync_packet(test, SIGNAL_TYPE_DISPLAY_PORT, 3, 255, 255);
+
+	KUNIT_EXPECT_EQ(test, p.hb3, 0x04);
+	KUNIT_EXPECT_EQ(test, p.sb[8], 255);
+}
+
+/**
+ * dm_test_update_freesync_state_hdmi_v3_above_255 - Test v3 for a VSDB v3 HDMI sink
+ * @test: The KUnit test context
+ */
+static void dm_test_update_freesync_state_hdmi_v3_above_255(struct kunit *test)
+{
+	struct dc_info_packet p =
+		dm_test_freesync_packet(test, SIGNAL_TYPE_HDMI_TYPE_A, 3, 320, 320);
+
+	KUNIT_EXPECT_EQ(test, p.hb1, 3);
+	KUNIT_EXPECT_EQ(test, p.sb[8], 320 & 0xff);
+	KUNIT_EXPECT_EQ(test, p.sb[12], 320 >> 8);
+}
+
 /* Tests for amdgpu_dm_update_stream_irq_parameters() */
 
 /**
@@ -957,6 +1012,10 @@ static struct kunit_case amdgpu_dm_freesync_tests[] = {
 	KUNIT_CASE(dm_test_update_freesync_state_pcon_v3),
 	KUNIT_CASE(dm_test_update_freesync_state_pcon_default),
 	KUNIT_CASE(dm_test_update_freesync_state_dp_v2_saturates),
+	KUNIT_CASE(dm_test_update_freesync_state_dp_v3_above_255),
+	KUNIT_CASE(dm_test_update_freesync_state_dp_v3_mode_240),
+	KUNIT_CASE(dm_test_update_freesync_state_dp_v3_at_255),
+	KUNIT_CASE(dm_test_update_freesync_state_hdmi_v3_above_255),
 	/* amdgpu_dm_update_stream_irq_parameters */
 	KUNIT_CASE(dm_test_update_stream_irq_parameters_no_stream),
 	KUNIT_CASE(dm_test_update_stream_irq_parameters_invalid_timing),
-- 
2.56.0

