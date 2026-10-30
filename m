Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356115;
	b=dt7smZ+nrHzyaoc2pO+I9WOKtZQBchvx3UP4TzBm3ve8+qRyWE+DDFgsz/WXC7WhhnUe
	 nvk8RaB0iY52lp8TKs+bkSYFMflg3nQt134Giztx8XORB1tGR6SJAfBYMbtMe2RocEe4x
	 gI/e+4iyfP1d0srmRzKOZMo7gt+jJ/zUWc1c1kj1Hbmn3sSBq+4vXmAdqJb6baGPPR2qz
	 HSuA+LBWyiluwjn0MP0b083BSGYCAHFOGSDT3o1BclV4BbVEwXY2/ayV7YiA08EA4WKTz
	 lSwldhhvJNVag5TVzIPd4a8IxkZulV3T4frOeHSnYlJqMasB6gNMY6rUqnUskZRTq7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356115;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=rXcxTxNBWwy/kWAc4+5gvgz7Qwjmbu+dR6mg5XTAMeM=;
	b=GlKeqilfjpssuFK+bBywnF51hSGbdMN2roU7NuQVZS41b93rL67WiL1ns5VwaUKb3uoy
	 qI+J3J2fCnsLBJrimtvz643Kx4m3JEsVuL4/HXdeu+f807W0xw53IvZ1V40cOG7Hwe/JR
	 N5NfzgtROzN1uccmp2Gl9Uk+pYRWFu71oTp8fKU8g2WabuCxA+IfmpBDy28H5+m5RfbDa
	 8CtNNfeTemNopP4WF7HJY3wUC5RhUGUqAAlk/uzdO7rmmjfew18w+DHraSHWOGk/VYZ3Z
	 kvBsL3Jn9tF2K80l9lJ1ZiRCN5ybATHy8qMa8T5elvj/DKXmJZw9DF6t1GLlnleWdig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SiWy6t8C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1FB606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SiWy6t8C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A031F0093A;
	Fri, 30 Oct 2026 10:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793356114;
	bh=rXcxTxNBWwy/kWAc4+5gvgz7Qwjmbu+dR6mg5XTAMeM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SiWy6t8CFJYaAz10gPw0bp7SDUO5gQQMM5T4ErxEzfGOYpjZImgZF/v06r2uHRKS/
	 aHfGOVZ7Sg/I/ALwCkhhVSwqi1rlrocZ03wRqjvHaTw1wfERJL1PB7WByoIHDLNeEf
	 V/AMPKhr2rO+cV6Vh/M/ejqM5zNQGUUURVu9rXe7xjPUsvP7sp1JMG2VHUQHYgP/sf
	 127PkC23gwsaHcyJRpvVq6ngv+ydHkfjqS+AaizLDHaTNXOlmEvSLUu2HBztQmLrBl
	 3KaPpwFZx159mHZsnUSkDcXdjRQbO7RyNYHpxCvOGgs5gG9jthLH7rcT0sC3RFPwYo
	 pgHuGqTmGIJmQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 30 Oct 2026 11:27:45 +0100
Subject: [PATCH v7 13/16] drm/tests: atomic: Add tests for
 drm_atomic_commit_fill_with_defaults()
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-drm-reset-state-flag-v7-13-4e55eaeae683@kernel.org>
References: <20261030-drm-reset-state-flag-v7-0-4e55eaeae683@kernel.org>
In-Reply-To: <20261030-drm-reset-state-flag-v7-0-4e55eaeae683@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: Daniel Stone <daniels@collabora.com>, 
 Harry Wentland <harry.wentland@amd.com>, 
 Jocelyn Falempe <jfalempe@redhat.com>, 
 =?utf-8?q?Jonas_=C3=85dahl?= <jadahl@redhat.com>, 
 =?utf-8?q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 Sebastian Wick <sebastian.wick@redhat.com>, Simon Ser <contact@emersion.fr>, 
 Victoria Brekenfeld <victoria@system76.com>, 
 Xaver Hugl <xaver.hugl@kde.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
 Daniel Stone <daniel@fooishbar.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=11528; i=mripard@kernel.org;
 h=from:subject:message-id; bh=JMLCc9z4Vw9KB6i+P0XefHJ3rOdSe+xuKk86HWtSDBU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlPCmUuuEo/ld1gpnN349o9Phe+mT6d/lektKeO/Ujp3
 m3LXrF+7pjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATUcxnbFjZOul2I9cZU85w
 uTkGzA8PLXvbPXeV5Ls1EyXsCreZ39qy4lJt9ix3w+oG2ab/ya+ZMhgbPke6/83wmdDtNG26d9z
 u0DVPtKpCfkg8O7Ftl1+ekk/c1JkSDTtZ3qh5va7iO/991osdAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_atomic_commit_fill_with_defaults() is used by the
DRM_MODE_ATOMIC_RESET flag to bring all objects back to their pristine
state. However, it has no dedicated test coverage.

Add two tests that verify the reset cycle. The first enables a CRTC,
plane, and connector, then calls drm_atomic_commit_fill_with_defaults()
and verifies all objects return to their disabled state: CRTC inactive,
plane disabled with no framebuffer, and connector unbound. The second
goes further and commits the default-filled state to verify the
init -> enable -> reset -> commit sequence completes without errors.

Suggested-by: Daniel Stone <daniel@fooishbar.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_atomic_test.c | 313 +++++++++++++++++++++++++++++++-
 1 file changed, 311 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_atomic_test.c b/drivers/gpu/drm/tests/drm_atomic_test.c
index 5e156d09e56f..160de1aa3ec2 100644
--- a/drivers/gpu/drm/tests/drm_atomic_test.c
+++ b/drivers/gpu/drm/tests/drm_atomic_test.c
@@ -9,4 +9,5 @@
 #include <drm/drm_kunit_helpers.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_property.h>
 
 #include <kunit/test.h>
@@ -143,5 +144,4 @@ static struct kunit_case drm_atomic_get_connector_for_encoder_tests[] = {
 };
 
-
 static struct kunit_suite drm_atomic_get_connector_for_encoder_test_suite = {
 	.name = "drm_test_atomic_get_connector_for_encoder",
@@ -149,5 +149,314 @@ static struct kunit_suite drm_atomic_get_connector_for_encoder_test_suite = {
 };
 
-kunit_test_suite(drm_atomic_get_connector_for_encoder_test_suite);
+/*
+ * Test that after enabling a CRTC and connector, filling with defaults
+ * produces a state where all objects are disabled: CRTC is inactive,
+ * plane is disabled, and connector is unbound.
+ *
+ * This is done without any lease, so all objects are expected to be
+ * reset.
+ *
+ * The plane is not explicitly enabled with a framebuffer here, so
+ * this validates that fill_with_defaults produces a consistent
+ * disabled state rather than testing an active plane teardown.
+ */
+static void drm_test_check_fill_with_defaults(struct kunit *test)
+{
+	struct drm_atomic_test_priv *priv;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_connector_state *new_conn_state;
+	struct drm_crtc_state *new_crtc_state;
+	struct drm_plane_state *new_plane_state;
+	struct drm_atomic_commit *state;
+	struct drm_display_mode *mode;
+	struct drm_device *drm;
+	int ret;
+
+	priv = create_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+
+	drm = &priv->drm;
+
+	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 16);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mode);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+retry_enable:
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     priv->crtc,
+						     &priv->connector,
+						     mode, &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_enable;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+retry_fill:
+	ret = drm_atomic_commit_fill_with_defaults(NULL, state);
+	if (ret == -EDEADLK) {
+		drm_atomic_commit_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_fill;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	new_crtc_state = drm_atomic_get_new_crtc_state(state, priv->crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_crtc_state);
+	KUNIT_EXPECT_FALSE(test, new_crtc_state->enable);
+	KUNIT_EXPECT_FALSE(test, new_crtc_state->active);
+
+	new_plane_state = drm_atomic_get_new_plane_state(state, priv->plane);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_plane_state);
+	KUNIT_EXPECT_NULL(test, new_plane_state->crtc);
+	KUNIT_EXPECT_NULL(test, new_plane_state->fb);
+
+	new_conn_state = drm_atomic_get_new_connector_state(state, &priv->connector);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
+	KUNIT_EXPECT_NULL(test, new_conn_state->crtc);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
+/*
+ * Test that after enabling a CRTC and connector, fill_with_defaults
+ * produces a state that can be successfully committed.
+ *
+ * This is done without any lease, so all objects are reset.
+ *
+ * The plane is not explicitly enabled with a framebuffer, so this
+ * validates that fill_with_defaults produces a consistent disabled
+ * state rather than testing an active plane teardown.
+ */
+static void drm_test_check_fill_with_defaults_commit(struct kunit *test)
+{
+	struct drm_atomic_test_priv *priv;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_atomic_commit *state;
+	struct drm_display_mode *mode;
+	struct drm_device *drm;
+	int ret;
+
+	priv = create_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+
+	drm = &priv->drm;
+
+	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 16);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mode);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+retry_enable:
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     priv->crtc,
+						     &priv->connector,
+						     mode, &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_enable;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+retry_fill:
+	ret = drm_atomic_commit_fill_with_defaults(NULL, state);
+	if (ret == -EDEADLK) {
+		drm_atomic_commit_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_fill;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state->allow_modeset = true;
+
+	ret = drm_atomic_commit(state);
+	if (ret == -EDEADLK) {
+		drm_atomic_commit_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_fill;
+	}
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
+/*
+ * Test that filling with defaults reports the color management changes
+ * on the new states through color_mgmt_changed, so that drivers
+ * reprogram the color management hardware when a LUT is being cleared
+ * by the reset.
+ */
+static void drm_test_check_fill_with_defaults_color_mgmt(struct kunit *test)
+{
+	struct drm_atomic_test_priv *priv;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_crtc_state *new_crtc_state;
+	struct drm_plane_state *new_plane_state;
+	struct drm_atomic_commit *state;
+	struct drm_property_blob *gamma_lut;
+	struct drm_device *drm;
+	u32 lut = 0;
+	int ret;
+
+	priv = create_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+
+	drm = &priv->drm;
+
+	gamma_lut = drm_property_create_blob(drm, sizeof(lut), &lut);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gamma_lut);
+
+	/*
+	 * Attach a gamma LUT to the current CRTC state, like userspace
+	 * setting the GAMMA_LUT property would. The state takes ownership
+	 * of the blob reference.
+	 */
+	priv->crtc->state->gamma_lut = gamma_lut;
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+retry_fill:
+	ret = drm_atomic_commit_fill_with_defaults(NULL, state);
+	if (ret == -EDEADLK) {
+		drm_atomic_commit_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_fill;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	new_crtc_state = drm_atomic_get_new_crtc_state(state, priv->crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_crtc_state);
+	KUNIT_EXPECT_NULL(test, new_crtc_state->gamma_lut);
+	KUNIT_EXPECT_TRUE(test, new_crtc_state->color_mgmt_changed);
+
+	new_plane_state = drm_atomic_get_new_plane_state(state, priv->plane);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_plane_state);
+	KUNIT_EXPECT_FALSE(test, new_plane_state->color_mgmt_changed);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
+/*
+ * Test that a reset on which userspace re-applies the exact same
+ * configuration doesn't need a modeset, and thus doesn't require the
+ * DRM_MODE_ATOMIC_ALLOW_MODESET flag.
+ */
+static void drm_test_check_fill_with_defaults_no_modeset(struct kunit *test)
+{
+	struct drm_atomic_test_priv *priv;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_crtc_state *new_crtc_state;
+	struct drm_connector_state *new_conn_state;
+	struct drm_atomic_commit *state;
+	struct drm_display_mode *mode;
+	struct drm_device *drm;
+	int ret;
+
+	priv = create_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+
+	drm = &priv->drm;
+
+	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 16);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mode);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+retry_enable:
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     priv->crtc,
+						     &priv->connector,
+						     mode, &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_enable;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+retry:
+	ret = drm_atomic_commit_fill_with_defaults(NULL, state);
+	if (ret == -EDEADLK) {
+		drm_atomic_commit_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/* Re-apply the exact same configuration on top of the reset */
+	new_conn_state = drm_atomic_get_new_connector_state(state, &priv->connector);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
+
+	ret = drm_atomic_set_crtc_for_connector(new_conn_state, priv->crtc);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	new_crtc_state = drm_atomic_get_new_crtc_state(state, priv->crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_crtc_state);
+
+	ret = drm_atomic_set_mode_for_crtc(new_crtc_state, mode);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	new_crtc_state->enable = true;
+	new_crtc_state->active = true;
+
+	/* Modesets aren't allowed and shouldn't be needed */
+	state->allow_modeset = false;
+
+	ret = drm_atomic_check_only(state);
+	if (ret == -EDEADLK) {
+		drm_atomic_commit_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry;
+	}
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_FALSE(test, new_crtc_state->active_changed);
+	KUNIT_EXPECT_FALSE(test, new_crtc_state->connectors_changed);
+	KUNIT_EXPECT_FALSE(test, new_crtc_state->mode_changed);
+	KUNIT_EXPECT_FALSE(test, drm_atomic_crtc_needs_modeset(new_crtc_state));
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
+static struct kunit_case drm_atomic_fill_with_defaults_tests[] = {
+	KUNIT_CASE(drm_test_check_fill_with_defaults),
+	KUNIT_CASE(drm_test_check_fill_with_defaults_commit),
+	KUNIT_CASE(drm_test_check_fill_with_defaults_color_mgmt),
+	KUNIT_CASE(drm_test_check_fill_with_defaults_no_modeset),
+	{ }
+};
+
+static struct kunit_suite drm_atomic_fill_with_defaults_test_suite = {
+	.name = "drm_atomic_commit_fill_with_defaults",
+	.test_cases = drm_atomic_fill_with_defaults_tests,
+};
+
+kunit_test_suites(&drm_atomic_get_connector_for_encoder_test_suite,
+		  &drm_atomic_fill_with_defaults_test_suite);
 
 MODULE_AUTHOR("Maxime Ripard <mripard@kernel.org>");

-- 
2.55.0

