Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2131442373
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135963; cv=none; b=gRmlZZ5QJWNr5IfApZjc6A9vC/2yHfAJzMdwfPjkAss00pLbc+HBBvwNZ21wZCh/tkRhKwGB5+ZJadSxvll3HW3QLA72zJCFMBXPqUD+0+3ZgHZ91cseeISQlAl6svw7E82rmiuPYpPNVaCZhW+UpCxavbYIpk62TCSbbwAJtZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135963; c=relaxed/simple;
	bh=Tm1uc0up+Qt6r56WSvHastbOXE22yv0d7zxIuhbvTPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QGJ+cB/kOo8TLVYJ8PMkcQBeKZmp6czeBuP15dpmZbUMKomRu+/tTPKFOyIofNo2lJOSZIU0ZvOQ/cXnvTW4kJZWPW9ZMkpRbhKlKhk44nSVVNFOFJ+IMv96Koa8imPAuG9LEkAnAy/sU6A89c7GAMnpcXowNGxRypkfrz08Jpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TBLFnRlx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TBLFnRlx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83DB91F000C5;
	Fri, 16 Oct 2026 07:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792135961;
	bh=5oVa9LCRUS0KXVU0ZOXwsF7f7fEqP0z05JNyjQKy5ig=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TBLFnRlxbPS7M4ILfhHoOunfgauyeWAWzXrwPwhi4Bf60B9JQ9gDAiVwljpebvNCh
	 mLkFaTngCS1Z1KqB0Od54ZtI0/Phvy82xb7nZCl/VkrNusdGYFF67/oTwXMDNWwqfU
	 9mfNORbokmH6BaMc6wvXFKLY0J3l5QMPbf08Ute8T+XOWHbrVK3v0rhhsrSJ+rOg5b
	 Gub7HqIG2vUi5Peq9A6PCxc5jhB2l3mPu9+kXEx3TQYHgQs7X2vQsQXDHgDQ4bm4mr
	 03RC3NfwEYgHHS+FMV8HVhDnJRoWbzUD7VxtW/8NcRcCzFB0mOPnetQzp3oZ4X5S1z
	 VVLdlmUigceTw==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 16 Oct 2026 09:31:43 +0200
Subject: [PATCH v5 11/14] drm/tests: atomic: Add tests for
 drm_atomic_commit_fill_with_defaults()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-drm-reset-state-flag-v5-11-dad2d64b693b@kernel.org>
References: <20261016-drm-reset-state-flag-v5-0-dad2d64b693b@kernel.org>
In-Reply-To: <20261016-drm-reset-state-flag-v5-0-dad2d64b693b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5721; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Tm1uc0up+Qt6r56WSvHastbOXE22yv0d7zxIuhbvTPU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFkXLz3dvtRebdnSmRz3u4/FiK2Ly3EMncsULnXugQHDt
 eS36cpMHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BeAmOzLWmRfPT9+stkrU0fjv
 kdNnK7fM/FmpcGPVOu2vKzyOiLx3CWb4kDRPLIrhR8TixAfRJXsyGWtlsn9P4xP/aN0aOlt0lUa
 qy4U+dmfGdx+ryvOeBoclpWqJR52VvXztfdItUTPDWqlHwgA=
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
 drivers/gpu/drm/tests/drm_atomic_test.c | 128 +++++++++++++++++++++++++++++++-
 1 file changed, 126 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_atomic_test.c b/drivers/gpu/drm/tests/drm_atomic_test.c
index 0aca5c1bbeae..fe6477264c24 100644
--- a/drivers/gpu/drm/tests/drm_atomic_test.c
+++ b/drivers/gpu/drm/tests/drm_atomic_test.c
@@ -140,16 +140,140 @@ static void drm_test_drm_atomic_get_connector_for_encoder(struct kunit *test)
 static struct kunit_case drm_atomic_get_connector_for_encoder_tests[] = {
 	KUNIT_CASE(drm_test_drm_atomic_get_connector_for_encoder),
 	{ }
 };
 
-
 static struct kunit_suite drm_atomic_get_connector_for_encoder_test_suite = {
 	.name = "drm_test_atomic_get_connector_for_encoder",
 	.test_cases = drm_atomic_get_connector_for_encoder_tests,
 };
 
-kunit_test_suite(drm_atomic_get_connector_for_encoder_test_suite);
+/*
+ * Test that after enabling a CRTC, plane, and connector, filling with
+ * defaults produces a state where all objects are disabled: CRTC is
+ * inactive, plane has no framebuffer, and connector is unbound.
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
+	ret = drm_atomic_commit_fill_with_defaults(state);
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
+ * Test that fill_with_defaults produces a state that can be
+ * successfully committed, completing the full reset round-trip.
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
+	ret = drm_atomic_commit_fill_with_defaults(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state->allow_modeset = true;
+
+	ret = drm_atomic_commit(state);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
+static struct kunit_case drm_atomic_fill_with_defaults_tests[] = {
+	KUNIT_CASE(drm_test_check_fill_with_defaults),
+	KUNIT_CASE(drm_test_check_fill_with_defaults_commit),
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
 MODULE_DESCRIPTION("Kunit test for drm_atomic functions");
 MODULE_LICENSE("GPL");

-- 
2.55.0

