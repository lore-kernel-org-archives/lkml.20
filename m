Received: from smtp-42af.mail.infomaniak.ch (smtp-42af.mail.infomaniak.ch [84.16.66.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C51470E8B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790322554; cv=none; b=ddr9CPVGLi6wxP75SH6UhVDyu8duxOJZhJXSTGqix13ebf94WoqXU+rk5kT2NQ8bruf99VaScrwmQWVUf6tLIMeMV1fcI7USCmtX2Z0D6loaI+49v2jKXT3yi0HirJfO3rM6r4xCP88tZhRTMm/LH3kwR9HyVCLZK90A21wxnA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790322554; c=relaxed/simple;
	bh=V7gc7tF93Kjw/NUZFe9KwOy0PjQiyQ89dQWxDRQ34ZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y2O0Y59LyJ1X3UvAys+Kr2d0Vq1XZ6Cb3QQYhd36NYoKlViUeKskjlw0tkvRSwGu6qVVzHwyyREHZ+nvgWSNcW8BSMZW3hacDMJO3CyUn60b1b8g9dtOFC1FwNJ7huvsJlLQiXF65wZU1sm+1by4MAaP0h8dptGAMLjTuYwKN4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cinemaone.ch; spf=pass smtp.mailfrom=cinemaone.ch; dkim=pass (2048-bit key) header.d=cinemaone.ch header.i=@cinemaone.ch header.b=ZvxFxCOy; arc=none smtp.client-ip=84.16.66.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cinemaone.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cinemaone.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cinemaone.ch header.i=@cinemaone.ch header.b="ZvxFxCOy"
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4hrjWc17qhzKPM;
	Fri, 25 Sep 2026 09:49:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cinemaone.ch;
	s=20250113; t=1790322539;
	bh=pJG7Ae2O4dVdTdH+3j1xRhaTZGtXxML8UCDGUBJItcU=;
	h=From:To:Cc:Subject:Date:From;
	b=ZvxFxCOyQeGVCrYxlFeeieiGE1TRzJBNkRcofN79aKlZU03jCgduwy+FIVzyA9bwC
	 K4gWj5mcSZN/5fzR0a6V0blBPXXzxCjv9BHW1c+02O4f+rW/f4Yfgad8h9k/XcI5IA
	 3gRWOL+okp3NKdkbqQjcZm+d4oEmnex1KUFcfxZB9qavX8K52mcBbxRNZWyk1uCqgS
	 Zfp9uwVrHdbtHL23GXaXPRSykbB1FFKrE44D5KPGNG3C1i9GPm84JnwKLdRLg8MEjb
	 4Q5hCJSzQjGQqZ8TQ5J/AkabIjITe2MtLiJ4aK/9gS+77eBUx/XupMJWevV8iVeGR1
	 iyYP1xPh1UiPg==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4hrjWZ1xfGzYwM;
	Fri, 25 Sep 2026 09:48:58 +0200 (CEST)
From: Adrian Betschart <adrian.betschart@cinemaone.ch>
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
Subject: [PATCH] drm/amd/display: Don't replace a sink mode that shares the native totals
Date: Fri, 25 Sep 2026 09:48:29 +0200
Message-ID: <20260925074829.92079-1-adrian.betschart@cinemaone.ch>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

decide_crtc_timing_for_drm_display_mode() copies the native mode's CRTC
timing into the requested mode when clock, htotal and vtotal match.
That is meant for the modes amdgpu inserts itself:
amdgpu_dm_create_common_mode() duplicates the native mode and changes
only hdisplay and vdisplay, so those are sent with the native timing
and scaled.

A sink can also offer a real mode with the same clock and totals as
its native mode. CTA-861 VIC 102 (4096x2160@60) and VIC 97
(3840x2160@60) both use 594 MHz and 4400x2250. With 3840x2160@60 as
the preferred mode, a 4096x2160@60 request goes out with the 3840x2160
timing and the framebuffer scaled into it (dst 3840x2025 at y=67),
while the AVI InfoFrame still carries VIC 102. A JVC projector then
reports 3840x2160 and shows a corrupted right edge. 4096x2160@24,
whose totals differ, is sent and displayed correctly.

Inserted modes keep the native sync positions; a real mode with its
own active width does not. Compare those too, so only inserted modes
are patched.

Fixes: 4562236b3bc0 ("drm/amd/dc: Add dc display driver (v2)")
Signed-off-by: Adrian Betschart <adrian.betschart@cinemaone.ch>
Assisted-by: Claude Code:claude-opus-5-5
---
Tested on an RX 7600 (7.2.4 backport) with a JVC projector behind an
HDFury VRROOM: 4096x2160@60 now arrives as 4096x2160 with a clean right
edge; 3840x2160@60 and 7680x4320@60 are unchanged. KUnit
amdgpu_dm_connector*: 360/360.

 .../display/amdgpu_dm/amdgpu_dm_connector.c   |  7 +++-
 .../tests/amdgpu_dm_connector_test.c          | 42 +++++++++++++++++++
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
index 7ebf7216b499..7db85bcebecd 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
@@ -996,10 +996,15 @@ decide_crtc_timing_for_drm_display_mode(struct drm_display_mode *drm_mode,
 					const struct drm_display_mode *native_mode,
 					bool scale_enabled)
 {
+	/* Inserted modes copy the native sync; a sink mode with equal totals may not */
 	if (scale_enabled || (
 	    native_mode->clock == drm_mode->clock &&
 	    native_mode->htotal == drm_mode->htotal &&
-	    native_mode->vtotal == drm_mode->vtotal)) {
+	    native_mode->vtotal == drm_mode->vtotal &&
+	    native_mode->hsync_start == drm_mode->hsync_start &&
+	    native_mode->hsync_end == drm_mode->hsync_end &&
+	    native_mode->vsync_start == drm_mode->vsync_start &&
+	    native_mode->vsync_end == drm_mode->vsync_end)) {
 		if (native_mode->crtc_clock)
 			copy_crtc_timing_for_drm_display_mode(native_mode, drm_mode);
 	} else {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.c
index bd55d943e4e5..04e0afd7aa71 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.c
@@ -1468,6 +1468,46 @@ static void dm_test_decide_crtc_timing_no_crtc_clock(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, drm_mode.crtc_hdisplay, 0);
 }
 
+static void dm_test_decide_crtc_timing_sink_mode_same_totals(struct kunit *test)
+{
+	struct drm_display_mode native_mode = {
+		DRM_MODE("3840x2160", DRM_MODE_TYPE_DRIVER, 594000, 3840, 4016, 4104,
+			 4400, 0, 2160, 2168, 2178, 2250, 0,
+			 DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) };
+	struct drm_display_mode drm_mode = {
+		DRM_MODE("4096x2160", DRM_MODE_TYPE_DRIVER, 594000, 4096, 4184, 4272,
+			 4400, 0, 2160, 2168, 2178, 2250, 0,
+			 DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) };
+
+	drm_mode_set_crtcinfo(&native_mode, 0);
+	drm_mode_set_crtcinfo(&drm_mode, 0);
+
+	decide_crtc_timing_for_drm_display_mode(&drm_mode, &native_mode, false);
+
+	KUNIT_EXPECT_EQ(test, drm_mode.crtc_hdisplay, 4096);
+	KUNIT_EXPECT_EQ(test, drm_mode.crtc_hsync_start, 4184);
+}
+
+static void dm_test_decide_crtc_timing_inserted_mode(struct kunit *test)
+{
+	struct drm_display_mode native_mode = {
+		DRM_MODE("3840x2160", DRM_MODE_TYPE_DRIVER, 594000, 3840, 4016, 4104,
+			 4400, 0, 2160, 2168, 2178, 2250, 0,
+			 DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) };
+	struct drm_display_mode drm_mode;
+
+	drm_mode_set_crtcinfo(&native_mode, 0);
+	drm_mode = native_mode;
+	drm_mode.hdisplay = 1920;
+	drm_mode.vdisplay = 1080;
+	drm_mode_set_crtcinfo(&drm_mode, 0);
+
+	decide_crtc_timing_for_drm_display_mode(&drm_mode, &native_mode, false);
+
+	KUNIT_EXPECT_EQ(test, drm_mode.crtc_hdisplay, 3840);
+	KUNIT_EXPECT_EQ(test, drm_mode.crtc_vdisplay, 2160);
+}
+
 /* Tests for amdgpu_dm_connector_funcs_reset() */
 
 static const struct drm_connector_funcs dm_test_connector_funcs = {
@@ -10342,6 +10382,8 @@ static struct kunit_case amdgpu_dm_connector_tests[] = {
 	KUNIT_CASE(dm_test_decide_crtc_timing_matching_mode),
 	KUNIT_CASE(dm_test_decide_crtc_timing_no_copy),
 	KUNIT_CASE(dm_test_decide_crtc_timing_no_crtc_clock),
+	KUNIT_CASE(dm_test_decide_crtc_timing_sink_mode_same_totals),
+	KUNIT_CASE(dm_test_decide_crtc_timing_inserted_mode),
 	/* amdgpu_dm_connector_funcs_reset */
 	KUNIT_CASE(dm_test_funcs_reset_sets_defaults),
 	KUNIT_CASE(dm_test_funcs_reset_edp_abm_level),
-- 
2.55.0

