Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794684734;
	b=eSnlBbcJJGXe5332+2deUjsh6L8kvz3YZlWRX3mhv8ABoB1IZZCjcxWE1NTTcfevZyum
	 wJsKLwtmvxLAej8VEIxWkVdzQZGJZ0cSud3LqyGklBVH0LL5L/DzhpK5sK20cc9Yu6j21
	 MadM84hcd93ZKsQKdTOztzYNfA5Nvc/uzbOmeaV+QAgfpWVYHG0rQsgVRI669RpkD5ZfX
	 WcEyM7sMGWCeiO99DaWwdbk6f7e8dUV7wiJDbIA85Lg4M0kc2cUu/hDWsMP73buBx/hUi
	 VClse4xXxBzUVUBhXWUDsRnMXTLUpIPy0CsAfrGxaKDM1g4ubg/U+mDCyjUv19ej04g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794684734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=sI3Abw782ICodBFXVcAkqffcR+yD9cYQ88bcpAcT5c4=;
	b=4TlljfN8N4qYVPy23hE1VJNme0KNex+lT8p3C5Z8zOJGbnHAZqCEm44nxhAC73ksEiSr
	 nY3Tae2+nN38o2ao6h6xWCOc6l0XjLqFvKPg6yf2B8hhgH2KAB4HQwRrekf22ytNzcZwY
	 ef7vDaRZToohe5BwpQ6gJxGnWAYWCuLOjDHIK9i1679FuBmrU8xszuWwCgx7HroTQ2W2e
	 +kQwa3ik/NDNe+EJU4weFoMYqGtxkDZE2xTOrE+OeYlcUy17KJUj4eYbbIh94FgWdr4q4
	 DXawh+lk069JNYTMfMmsUbYrgFUlhbePI1uRaiaUdZsjBgd9rYD9b9pr8JxDkoNCLbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="RHfS3/wJ";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60453606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60453606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RHfS3/wJ
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1006875f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794684733; x=1795289533; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sI3Abw782ICodBFXVcAkqffcR+yD9cYQ88bcpAcT5c4=;
        b=RHfS3/wJrDol4DI0TKgyihIk55dxyGpQap0d2Z4BDmNp3VkaVlH3TiL+6xQz59jHAw
         lCVBWOr1Bw6XSEUHid+u5OJyueRH3NcgI5mG2gA9ZF21PVWoBkZtt/DOzgZNArZigG2d
         IJkhAUgF+7AcqkJU+jIRIjWAJlWIv1SFHzP6CPlh18yOCEZu6VYqWb6Lu59K+KofkKBh
         KycobUARTCdV7oK6CpDj8r9qASzhFylctJE+28ev6gngAy0RHqbfVJI6qYz7cyLTzvZ9
         lEy+MxFBnI/Wh0ryWvSPsg09z9CvIvCHmOU3sPsO7ZEODt8YNXU1NvUuM/1PirvD0UOJ
         yTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794684733; x=1795289533;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sI3Abw782ICodBFXVcAkqffcR+yD9cYQ88bcpAcT5c4=;
        b=SbH8Cbq7nesG8LS3/GV5YJEOhAOz6xCrsowcJQDH3d/pxEkiwoKDxvXFnY5akMMTxH
         0y5bO/7IoMQYz26PBxvKpiz8/pEa7VxGfFHjLJGusgPBHovZHwrmGJCd+JkMP75c+Snr
         9CvQVQvTQJUyL7dFSUgBd25AJYinFp0/KYew8qOlYP27xqvmG0wCQx0mQQGQdkPDxHxq
         hDy+H5lC0swvEPFviKMzG2kK0uKTHdb96O2x21lAf5Qxh4S6J9mmjDDq/w5XiUxXKtiz
         wvzfAfwggPs2VjcPaof/xLtDwYcmU9xe88I3TTz4xSYo7i0jzXwlFT1VxBzwQjVpC8zM
         y8yQ==
X-Forwarded-Encrypted: i=1; AL+hErEjuX8Jq3GFugIgqDXlGASkocSb+39MiYUHvsJ2BugJRojzP84JM+YWDV4UwoU6/9tdw+w6CbP3m3FSAWc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WLsZ7MHqMEgtOTjP4SHIfLldi5ZTMACBQLL3G8CqZly4ST/eu
	gRqk7urGPRPBu/xZq6KD9xAi5CCqlcdB5R+fW3COK2yulKfZSW4AF+m/
X-Gm-Gg: AYBFou3l+JrejP34bY1zQu4pFkaJSfs+1NYF+rafiBk7Y/ws2Bj+CZQwQXWRjczCmu0
	cuMICZooYRBF70+0ls+hyBSIywy67Q+iMMlvMPDqQntckbihO2pQ8RJLy03FU+mYkCfkKvkrQxf
	rnsevBjsByU3hTtWclzmB7WW+6D6tBq3koqBB3KK/WQ2PBhigwjKOmg3isvGbpd/8hOERBMgy1v
	I8Tk6JbgKc5zNDUf0rXjI9Oqdo8mwY3mHlBSagX+il7Ne7l4W6L9L5MWTci98/+zuH4E3cS5/dL
	U5E+g+BfWh2ftwiDOjWu8cDJfCl08QaXmcy+5GjQi0Kuv4ODv4GA1YAMjMQ/a8nVADfJqpx0VuB
	Sy/J3jRkXOMoTstfT69CMxA20jFdt59d30qT7FcD/lgfR8K5uzUetg9iEu+Pwnwz5bl1wMZfsQG
	FWnKZCaZdzqTWyWs1aM85kgDK2aE2fG9tdKrFcp8EiRsXqGnZPuEGckAPT+WxqWyySr81yoWyVe
	Sbgm61wqE09KJ6VYCZ/mM0L1OqTLCU4P8h8FIzkWh0xaL7rXPHrsL9V+JErhM6R76kTuz/bwwIN
	t7uEblvjSQqpkFU3CxkClhBKP4TMHxjWRdHLmVKFLA==
X-Received: by 2002:a05:6000:29c9:b0:493:1004:96f7 with SMTP id ffacd0b85a97d-49c747700f2mr8953180f8f.54.1794684732494;
        Sat, 14 Nov 2026 11:32:12 -0800 (PST)
Received: from [10.111.176.198] ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608cf46dsm12965021f8f.43.2026.11.14.11.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:32:11 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Sat, 14 Nov 2026 20:32:02 +0100
Subject: [PATCH] drm/tests: bridge: check the bridge chain callback order
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
Message-Id: <20261114-bridge-order-v1-1-4f11d1c21937@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ5AMBCE4VeRPWuiiIhXEQdtp6wDskUk4t0Vx
 2+S+S8KEEagJrlIcHDgZY7QaUJ27OcBil005Vleaa0LZYRdXBdxEIXal/AmM7UHxcsq8Hx+ubb
 7HXYzwW5vg+77AeKZY3dwAAAA
X-Change-ID: 20261113-bridge-order-e8f4efb0b8fe
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Daniel Stone <daniel@fooishbar.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Oarora Etimis <oaroraetimis@gmail.com>
X-Mailer: b4 0.15.2

drm_atomic_bridge_chain_pre_enable() and
drm_atomic_bridge_chain_post_disable() document the order in which a
chain's bridges get their callback called, but nothing tests it. That
order has been wrong before: commit e18aeeda0b69 had to fix both
directions at once.

Add a KUnit test for the example those comments give, and for the chain
where no bridge sets @pre_enable_prev_first.

Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>
---
 drivers/gpu/drm/tests/drm_bridge_test.c | 112 ++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_bridge_test.c b/drivers/gpu/drm/tests/drm_bridge_test.c
index 15583ade8494..e910f22ee581 100644
--- a/drivers/gpu/drm/tests/drm_bridge_test.c
+++ b/drivers/gpu/drm/tests/drm_bridge_test.c
@@ -20,6 +20,9 @@
 
 #include "drm_kunit_edid.h"
 
+/* Chain length of the callback order test, and size of its call log. */
+#define DRM_TEST_BRIDGE_CHAIN_LEN 5
+
 /*
  * Mimick the typical "private" struct defined by a bridge driver, which
  * embeds a bridge plus other fields.
@@ -31,6 +34,8 @@ struct drm_bridge_priv {
 	unsigned int enable_count;
 	unsigned int disable_count;
 	struct drm_bridge bridge;
+	/* Position in the chain, as an index into test_bridges */
+	unsigned int chain_index;
 	void *data;
 };
 
@@ -59,6 +64,11 @@ struct drm_bridge_chain_priv {
 	 *                of which the first @num_bridges entries are valid.
 	 */
 	struct drm_bridge_priv **test_bridges;
+
+	/** @call_log: @test_bridges indices of the bridges whose function was called, in order */
+	unsigned int call_log[DRM_TEST_BRIDGE_CHAIN_LEN];
+	/** @call_log_len: number of calls logged, may exceed the size of @call_log */
+	unsigned int call_log_len;
 };
 
 static struct drm_bridge_priv *bridge_to_priv(struct drm_bridge *bridge)
@@ -99,6 +109,27 @@ static const struct drm_bridge_funcs drm_test_bridge_atomic_funcs = {
 	.atomic_create_state	= drm_atomic_helper_bridge_create_state,
 };
 
+/* @data points to the drm_bridge_chain_priv for bridges using these funcs */
+static void drm_test_bridge_chain_atomic_log(struct drm_bridge *bridge,
+					     struct drm_atomic_commit *state)
+{
+	struct drm_bridge_priv *bridge_priv = bridge_to_priv(bridge);
+	struct drm_bridge_chain_priv *priv = bridge_priv->data;
+
+	if (priv->call_log_len < ARRAY_SIZE(priv->call_log))
+		priv->call_log[priv->call_log_len] = bridge_priv->chain_index;
+
+	priv->call_log_len++;
+}
+
+static const struct drm_bridge_funcs drm_test_bridge_chain_funcs = {
+	.atomic_pre_enable	= drm_test_bridge_chain_atomic_log,
+	.atomic_post_disable	= drm_test_bridge_chain_atomic_log,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_create_state	= drm_atomic_helper_bridge_create_state,
+};
+
 static int dummy_clear_infoframe(struct drm_bridge *bridge)
 {
 	return 0;
@@ -459,6 +490,7 @@ drm_test_bridge_chain_init(struct kunit *test, unsigned int num_bridges,
 		return ERR_PTR(-ENOMEM);
 
 	priv->num_bridges = num_bridges;
+	priv->call_log_len = 0;
 
 	for (i = 0; i < num_bridges; i++) {
 		priv->test_bridges[i] = devm_drm_bridge_alloc(dev, struct drm_bridge_priv,
@@ -467,6 +499,7 @@ drm_test_bridge_chain_init(struct kunit *test, unsigned int num_bridges,
 			return ERR_CAST(priv->test_bridges[i]);
 
 		priv->test_bridges[i]->data = priv;
+		priv->test_bridges[i]->chain_index = i;
 	}
 
 	priv->plane = drm_kunit_helper_create_primary_plane(test, drm, NULL, NULL,
@@ -1357,6 +1390,84 @@ static void drm_test_bridge_rgb_yuv_no_path(struct kunit *test)
 	drm_modeset_acquire_fini(&ctx);
 }
 
+/* B, D and E ask for prev first: the example the documentation gives. */
+static const bool bde_prev_first[DRM_TEST_BRIDGE_CHAIN_LEN] = { false, true, false, true, true };
+static const unsigned int bde_pre_enable[DRM_TEST_BRIDGE_CHAIN_LEN] = { 2, 3, 4, 0, 1 };
+static const unsigned int bde_post_disable[DRM_TEST_BRIDGE_CHAIN_LEN] = { 1, 0, 4, 3, 2 };
+
+/* No bridge does: both walks are plain reversals. */
+static const bool none_prev_first[DRM_TEST_BRIDGE_CHAIN_LEN] = { false };
+static const unsigned int none_pre_enable[DRM_TEST_BRIDGE_CHAIN_LEN] = { 4, 3, 2, 1, 0 };
+static const unsigned int none_post_disable[DRM_TEST_BRIDGE_CHAIN_LEN] = { 0, 1, 2, 3, 4 };
+
+/* Order documented by drm_atomic_bridge_chain_pre_enable()/_post_disable(). */
+static void drm_test_bridge_chain_order(struct kunit *test,
+					const bool *prev_first,
+					const unsigned int *expected_pre_enable,
+					const unsigned int *expected_post_disable)
+{
+	static const struct drm_bridge_funcs *funcs[DRM_TEST_BRIDGE_CHAIN_LEN] = {
+		&drm_test_bridge_chain_funcs,
+		&drm_test_bridge_chain_funcs,
+		&drm_test_bridge_chain_funcs,
+		&drm_test_bridge_chain_funcs,
+		&drm_test_bridge_chain_funcs,
+	};
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_bridge_chain_priv *priv;
+	struct drm_atomic_commit *state;
+	unsigned int i;
+
+	priv = drm_test_bridge_chain_init(test, ARRAY_SIZE(funcs), funcs);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+
+	for (i = 0; i < ARRAY_SIZE(funcs); i++)
+		priv->test_bridges[i]->bridge.pre_enable_prev_first = prev_first[i];
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+	/* The chain helpers skip the callbacks when @state is NULL. */
+	state = drm_kunit_helper_atomic_state_alloc(test, &priv->drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	drm_atomic_bridge_chain_pre_enable(&priv->test_bridges[0]->bridge, state);
+	KUNIT_ASSERT_EQ(test, priv->call_log_len, DRM_TEST_BRIDGE_CHAIN_LEN);
+	KUNIT_EXPECT_MEMEQ(test, priv->call_log, expected_pre_enable,
+			   sizeof(priv->call_log));
+
+	priv->call_log_len = 0;
+	drm_atomic_bridge_chain_post_disable(&priv->test_bridges[0]->bridge, state);
+	KUNIT_ASSERT_EQ(test, priv->call_log_len, DRM_TEST_BRIDGE_CHAIN_LEN);
+	KUNIT_EXPECT_MEMEQ(test, priv->call_log, expected_post_disable,
+			   sizeof(priv->call_log));
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
+static void drm_test_bridge_chain_callback_order(struct kunit *test)
+{
+	drm_test_bridge_chain_order(test, bde_prev_first, bde_pre_enable,
+				    bde_post_disable);
+}
+
+static void drm_test_bridge_chain_callback_order_no_flags(struct kunit *test)
+{
+	drm_test_bridge_chain_order(test, none_prev_first, none_pre_enable,
+				    none_post_disable);
+}
+
+static struct kunit_case drm_bridge_chain_tests[] = {
+	KUNIT_CASE(drm_test_bridge_chain_callback_order),
+	KUNIT_CASE(drm_test_bridge_chain_callback_order_no_flags),
+	{ }
+};
+
+static struct kunit_suite drm_bridge_chain_test_suite = {
+	.name = "drm_bridge_chain",
+	.test_cases = drm_bridge_chain_tests,
+};
+
 static struct kunit_case drm_bridge_bus_fmt_tests[] = {
 	KUNIT_CASE(drm_test_bridge_rgb_yuv_rgb),
 	KUNIT_CASE(drm_test_bridge_must_convert_to_yuv444),
@@ -1376,6 +1487,7 @@ kunit_test_suites(
 	&drm_bridge_helper_reset_crtc_test_suite,
 	&drm_bridge_alloc_test_suite,
 	&drm_bridge_bus_fmt_test_suite,
+	&drm_bridge_chain_test_suite,
 );
 
 MODULE_AUTHOR("Maxime Ripard <mripard@kernel.org>");

---
base-commit: c88084027d0e922dd925b96e5a0d184ba04a8f43
change-id: 20261113-bridge-order-e8f4efb0b8fe

Best regards,
--  
Oarora Etimis <oaroraetimis@gmail.com>

