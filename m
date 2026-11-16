Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794837668;
	b=tQwwepP2gqAYQSIl4FdYh4GuIvAZZPTgO1x9mlNG5cGdgQt2FIkIh0f+v+fz/4Nda6Ch
	 EDL+76dsigZdgz1THYHFh+o3SRLOsm2LfqM8hrYysQHm8pDaCmgJZPrePHv/i7BhAaL0w
	 Ap1nYZpJ3GF/x80tdo77bWSfwb0EAzMe5tBE9XkCEfa+FQUgDidYDNnxXv1CHQ3vPxHIh
	 sAOUter5lcvmgjJ5DTRlpc8lrKpHVHVufv5f7NL7PDZotbxXZmY5NExulNdRPJXCTK9W3
	 JzTqpfb9vtgprx1dMpGS/JF79V9rQyQp2pc7wpfAImefwvROk9BjeYqcCMA6Z49qapg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837668;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=uBDvoboRAa+cGYhUjtvMfpt40qRD3+IUF0PMhyvPSyQ=;
	b=q+iPUBPpHXS6piZZ9fjKTxiUcgFhVCZNhwufUt/VRTIqs2+T5CrdvUxBSWQQktIYNr9H
	 GOutwo2KuS2Qvto31HoTwihBOuYAuZTu3WOxR3iBDKLPEdHg/03SOQlgJf4/YEYasgBbl
	 63wGVbwK9/Gvb1FZzZKpllkBBGp4LR+6K9bVFprFcyG5H4BugJrwM5tCHr/cR2VsXIIW2
	 diGc6iIb1YWblYk7v7vfHkoFVl/yh1Oatkbf/Zc6nyFNf8kEF6+MjgwQmGl8Ifcf0kaqn
	 4/BPX2aUcORumYRcej65Nw5sa1MNUZ2tcov7+Usvr6pfvLT7+5gKe6uqQqnJa8ra0hg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jgUGLxQw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D678A606A329;
	Mon, 16 Nov 2026 14:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jgUGLxQw
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794837668;
	b=ed4jGs+qGcStWVkfidr5ebWwuTwlf8hGfD9REFaZlyfr+gxvI9+8Dsdp+yXrFR/Q5mi3
	 xPS39PNuVhwPUGXKJg9RtIRjkTR8Ez1M69Mj7WLqFsxVZacSy5iN29oM479WfcdDYjiEB
	 JQCPhWk3hYF6O/bt+zmEXBA4zTvTbdB0g7iOCjLdXpHX2caITwJeKh0kTUPYH3I++qR3+
	 9M3vEGhJYvw/5eLcI/FA9PMHRM0xWV173QiY0BHDx7MLDRwXT3L+E2DjezdWflQMewoUW
	 nx+6FC93qNWKCj0KcyPx72mmOyHY4UYU8F63kvXg6Zv89pntwIrv4mKF3mv48h/lgzA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794837668;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=uBDvoboRAa+cGYhUjtvMfpt40qRD3+IUF0PMhyvPSyQ=;
	b=dPXOXxuCmi2aEKOcDxSH/UHIg/XGKgXOX9t8gquY4kTLU0rRe3vTOurCSLBgeHlUDFvd
	 g8k4h9tdtMimwo63MR674CfNdqanyh6MsXPQN0YC5U5SK9TlyKqFp2jpfbxNWbcRgalbS
	 1wACTSPxkL3AjLWcNa8QG86cjyrp8Jl0ZPZWBdfixOxV0BQXnMYj72s/Fa9NtHoEmAyvS
	 Okfj7VoFTS/Bsu1Z3YDsS9h3MuHcCvXA1sMkbDZt6brC9amMRF8P2JaLy7s2SN4DqYwrf
	 n8052uPpCHZ1nb8fpolOXjrni8NOfoZv1BaCSd1sdmG8o1pwjA757NQVXr1P4G+hNlA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4EC091F000CE;
	Mon, 16 Nov 2026 14:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837668;
	bh=uBDvoboRAa+cGYhUjtvMfpt40qRD3+IUF0PMhyvPSyQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=jgUGLxQwed2I+eZE54M/sHTAo/KPqGNJcpqXjrybRZfK53qebnZnGFxH1JJecJmm6
	 jZ+NkIoUS0t4ugbYW2cQ/88PFUd+h8tfchaftXw0MZB56zO4E5Ikcx6cUL4HP4m8iH
	 jI7hF+wSyWBUfppTLFRdRSuCGXMUwUMUIhAKiF9TKWN3Dd6UV6e8lMRb52gzjvFnVV
	 /oCbJWkC3/K/uEVyYiglFdcET3XQGGjkQP7sdbKaCuD8/D9NH5lZ9RWDQenE8Q/OoR
	 gBLqU2g0H5Y3fvFo3FRCqQu2qiWdA/wN+HGDkGLGTlqdpXuwZyxHhW6cX44bDQxu1g
	 PRQm7cNw0q6fg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C92504A4BC;
	Mon, 16 Nov 2026 14:01:04 +0000 (UTC)
From: Hugo Sales via B4 Relay <devnull+hugo.hsal.es@kernel.org>
Date: Mon, 16 Nov 2026 14:01:06 +0000
Subject: [PATCH v3 4/6] drm/amd/display: Give the panel_power_savings store
 tests a full pipe
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261116-abm-sysfs-commit-v3-4-7a3d84a5328e@hsal.es>
References: <20261116-abm-sysfs-commit-v3-0-7a3d84a5328e@hsal.es>
In-Reply-To: <20261116-abm-sysfs-commit-v3-0-7a3d84a5328e@hsal.es>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>, Ray Wu <ray.wu@amd.com>, 
 Alex Hung <alex.hung@amd.com>, 
 Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>, 
 Ivan Lipski <ivan.lipski@amd.com>, Chenyu Chen <chen-yu.chen@amd.com>, 
 David Weber <weber.aulendorf@gmail.com>, 
 Shivam Kalra <shivamkalra98@zohomail.in>, 
 Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hugo Sales <hugo@hsal.es>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5947; i=hugo@hsal.es;
 h=from:subject:message-id;
 bh=K2pniu0qwhYm7o7bR6OLXAX4Z6rHj8qzx+ZmC3CtWCQ=;
 b=owJ4nJvAy8zAJVbLU7f+5A3TBYyn1ZIYsn7zzP9ib6vsq5RpnZx8YrN7xYY11wtOp3PZf1RcH
 X7x0KTJ5gYdpSwMYlwMsmKKLLo3PBlYJk6emVP0fAnMHFYmkCEMXJwCMJFntxj+h+XuPnU88NYT
 huaP9z6u1T1yX2Huzr8ye66LdfRUhBw60cXwPzl995yKh+/dP0vP4fXh3WOvKXprex2vX7zUViH
 N5bv/cgEABh1NyA==
X-Developer-Key: i=hugo@hsal.es; a=openpgp;
 fpr=193D095149CF7E8737B39064D912B0DB205A91C1
X-Endpoint-Received: by B4 Relay for hugo@hsal.es/default with auth_id=1417
X-Original-From: Hugo Sales <hugo@hsal.es>
Reply-To: hugo@hsal.es
Content-Transfer-Encoding: 7bit

From: Hugo Sales <hugo@hsal.es>

An upcoming patch makes the store apply the level with an atomic commit.
The store tests allocate their connector with kunit_kzalloc() instead of
initialising it on the DRM device, and have no CRTC, plane or encoder, so
a commit can't run on it

Build a primary plane, a CRTC, an encoder and an eDP connector on the
KUnit device instead, with runtime PM enabled as on a probed device, and
move the two store tests onto it. They check the same results as before.
The connector reset already leaves the disable sentinel, so the disable
test sets level 2 before the write

Signed-off-by: Hugo Sales <hugo@hsal.es>
---
 .../amdgpu_dm/tests/amdgpu_dm_backlight_test.c     | 90 ++++++++++++++++++++--
 1 file changed, 84 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c
index c6d15fb8ad989..5133c8f251f53 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c
@@ -7,10 +7,14 @@
 
 #include <kunit/test.h>
 #include <linux/backlight.h>
+#include <linux/pm_runtime.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_connector.h>
+#include <drm/drm_kunit_helpers.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_mode_config.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_property.h>
 
 #include "dc.h"
@@ -544,6 +548,76 @@ static struct drm_connector *setup_panel_power_savings_connector(struct kunit *t
 	return connector;
 }
 
+static const struct drm_connector_funcs dm_test_pps_connector_funcs = {
+	.reset = amdgpu_dm_connector_funcs_reset,
+	.atomic_duplicate_state = amdgpu_dm_connector_atomic_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int dm_test_pps_get_modes(struct drm_connector *connector)
+{
+	return 0;
+}
+
+/* update_connector_routing() dereferences the helper funcs unconditionally */
+static const struct drm_connector_helper_funcs dm_test_pps_connector_helper_funcs = {
+	.get_modes = dm_test_pps_get_modes,
+};
+
+/*
+ * Build a primary plane, a CRTC, an encoder and an eDP connector that the
+ * store can commit to. The KUnit device uses the generic atomic helpers, so a
+ * commit runs drm_atomic_helper_check() and drm_atomic_helper_commit() rather
+ * than the DM implementations
+ */
+static struct drm_connector *
+setup_panel_power_savings_pipe(struct kunit *test, struct device **device_out)
+{
+	struct amdgpu_dm_connector *aconnector;
+	struct drm_connector *connector;
+	struct drm_encoder *encoder;
+	struct amdgpu_device *adev;
+	struct drm_plane *primary;
+	struct drm_crtc *crtc;
+	struct device *device;
+
+	adev = dm_kunit_alloc_adev(test);
+	KUNIT_ASSERT_EQ(test, pm_runtime_set_active(adev->ddev.dev), 0);
+	KUNIT_ASSERT_EQ(test, devm_pm_runtime_enable(adev->ddev.dev), 0);
+
+	primary = drm_kunit_helper_create_primary_plane(test, &adev->ddev, NULL,
+							NULL, NULL, 0, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, primary);
+	crtc = drm_kunit_helper_create_crtc(test, &adev->ddev, primary, NULL,
+					    NULL, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
+
+	encoder = drmm_kzalloc(&adev->ddev, sizeof(*encoder), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, encoder);
+	KUNIT_ASSERT_EQ(test, drmm_encoder_init(&adev->ddev, encoder, NULL,
+						DRM_MODE_ENCODER_TMDS, NULL), 0);
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	aconnector = drmm_kzalloc(&adev->ddev, sizeof(*aconnector), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, aconnector);
+	connector = &aconnector->base;
+	KUNIT_ASSERT_EQ(test, drmm_connector_init(&adev->ddev, connector,
+						  &dm_test_pps_connector_funcs,
+						  DRM_MODE_CONNECTOR_eDP, NULL), 0);
+	drm_connector_helper_add(connector, &dm_test_pps_connector_helper_funcs);
+	KUNIT_ASSERT_EQ(test, drm_connector_attach_encoder(connector, encoder), 0);
+
+	drm_mode_config_reset(&adev->ddev);
+	KUNIT_ASSERT_NOT_NULL(test, connector->state);
+
+	device = kunit_kzalloc(test, sizeof(*device), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, device);
+	dev_set_drvdata(device, connector);
+	*device_out = device;
+
+	return connector;
+}
+
 static void dm_test_free_sysfs_buf(void *data)
 {
 	free_page((unsigned long)data);
@@ -607,15 +681,17 @@ static void dm_test_panel_power_savings_show_reports_level(struct kunit *test)
  */
 static void dm_test_panel_power_savings_store_sets_disable(struct kunit *test)
 {
-	struct dm_connector_state *state;
+	struct drm_connector *connector;
 	struct device *device;
 	size_t count = strlen("0");
 
-	setup_panel_power_savings_connector(test, &device, &state);
+	connector = setup_panel_power_savings_pipe(test, &device);
+	to_dm_connector_state(connector->state)->abm_level = 2;
 
 	KUNIT_EXPECT_EQ(test, panel_power_savings_store(device, NULL, "0", count),
 			 (ssize_t)count);
-	KUNIT_EXPECT_EQ(test, state->abm_level, ABM_LEVEL_IMMEDIATE_DISABLE);
+	KUNIT_EXPECT_EQ(test, to_dm_connector_state(connector->state)->abm_level,
+			ABM_LEVEL_IMMEDIATE_DISABLE);
 }
 
 /**
@@ -624,11 +700,13 @@ static void dm_test_panel_power_savings_store_sets_disable(struct kunit *test)
  */
 static void dm_test_panel_power_savings_store_forbidden(struct kunit *test)
 {
-	struct dm_connector_state *state;
+	struct dm_connector_state *dm_state;
+	struct drm_connector *connector;
 	struct device *device;
 
-	setup_panel_power_savings_connector(test, &device, &state);
-	state->abm_sysfs_forbidden = true;
+	connector = setup_panel_power_savings_pipe(test, &device);
+	dm_state = to_dm_connector_state(connector->state);
+	dm_state->abm_sysfs_forbidden = true;
 
 	KUNIT_EXPECT_EQ(test, panel_power_savings_store(device, NULL, "1", 1), -EBUSY);
 }

-- 
2.56.0


