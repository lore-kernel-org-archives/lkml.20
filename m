Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794878498;
	b=NBaJP/mQBG37OzXQmkHhswAf8W7tqkRuWIkQJLFhJiO/LJE39/GvXdlLuCudgra2Z3BS
	 O16rPHlBnmf8Pi8+ippNAEyr6B6mUKCoIt3gF1EGaE0pKptAizYh6JBVsvonUnPYAPEYD
	 urtoViKduhe6yEJ+AH6VEonZhUOSoKAo9ALAUk69LDYG2ID44Sd4OSd6pVtUX8IPzNktC
	 X0GNJMgYD+33rL6mCnaHLI9qj1UZD7InzCCftKcbDsaf6ZFtc1zG7BMn1PpcHJbxwwF9Q
	 zIvgruzlUUrotaXarO1S18X7tZDEuctobDzD/b8eMZuF3aPrxQXmEncutrSD/oq2t4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794878498;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=KdiKKEv64MBnyXMWUmh7FQYtdBo5fQdakg9q84b44AE=;
	b=HItUBVK0ibdQW/PkomNL5APLZbEGoQCRzinYOHd+p5jZKn32lcemZBGs3xMMHnUScL8Q
	 3Rb0LIv6JxBFPJMnkwk3ySD63ckf6jSXNYJwc0ZuT7TB9Pg1yxOKgyRwLJRPf6B40lmGk
	 +Q5kT76pKWLQWl8nDxUFUrKhlw9fv1+DoJhdmO1AoxQxCFUlhUHTOek1h1qSQqzeqOYa6
	 xtR72vIpdrigV7NZdipgbXeEndujLDU/7w4cU6pzRszd8zEkdGtGCCBkLRvZingOA11in
	 r3dsU4DHLz60x3kxBsp5iToJj8EBttkuNV6jxbpGJXjvyfQuG+vyfTDVJdePJUn7veQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AyZUPf5J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AF9606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AyZUPf5J
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794878498;
	b=mwVJsbvE7OSxuxMoa/G1O3KS30aSQWb64py9z4lsT2yS91MPI6kpBo0Drua0vDgphrrv
	 66mk2c1w4ZarAw47WM7Pun6EzdmFMJmC18g2p1uuEoioPrJ/zZZVkrbGU5QHvGanoV+0t
	 UINXIUc1SfGzSuvJ0CO9Y3s4fJcsl0fGDp61Sbdp5mcYhb2jbv1N3GOF9OdyvpRRmeOAh
	 hmuM8jHVSf/370rb27tyAuvpGGMqC1h+ORHz9ITbkd6LvuI0lUEAXlaOA39y99PtWVzEx
	 67ULEM1Fb3ofmS98GgWtzmyEOgVPb94VEMOgJtIzjfwDALSZsSgTWEF3U5mupSfo50A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794878498;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=KdiKKEv64MBnyXMWUmh7FQYtdBo5fQdakg9q84b44AE=;
	b=h2JsSabhcnHMXyXk5qCIyeVhPJJVqVltuCiv9pd8ZNBJf0UKOI8YcPeivVDBITlFmNrs
	 SheI2K7znwHgLVv5aKBxQCuGB/6u/xGulW34lCtF10dcq9o2cm12yyNTycGmy5euTVq3U
	 KuWwI1mVuvjsjCnSGVK6O5nT7kKhWNyM8KK1t09GK5w8M/9Lv+rpCBlZnWBzIOGTcJeFw
	 9jZtfblsqifwlSoLcj6y1K+y83BgP5wxYfp8waHcfQubLLqANAJIsLQ/vkAvRCQKj3GjS
	 jhXylDx2Drpt6xlPU6tODz2qQe5LKQ/YWFrUpvKjR9HIr8BaiHitt652AwwIP8RII2Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C11A31F000C7;
	Tue, 17 Nov 2026 01:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794878498;
	bh=KdiKKEv64MBnyXMWUmh7FQYtdBo5fQdakg9q84b44AE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AyZUPf5JXGr/vrE+qbj0OrZpMH4AKLPKP2ohg5knul+ZI3CKd95LeGJ2Rkrm3Fte7
	 prPp+v18TM7J4LkxkPRbVbonv6g3iDu/J9xBIkImxpYTE2DPdWAMaLrtTFMcheNC2j
	 VHlUJXdO9mEhYuQ63+JeJfwi/S4kkjIPG2tPc7MkJ/V1D8c7W/wa4zlbuh/x0i6BY6
	 eboUiakLwyZmMkqPr8TWDPgNJFi0Sh4YlGtELKjROuuruefWYPEgfKUZcYgax/hhqG
	 v73QaRXZkci9N41SLmDe8Che8z9LzHC6NOEJGjvqcX3TvNGUssnTcw+MrnQST7m7oC
	 4+YBA/YEFM+sw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4BDB94A66E;
	Tue, 17 Nov 2026 01:21:36 +0000 (UTC)
From: Sidharth Saha via B4 Relay <devnull+ssaha2000.gmail.com@kernel.org>
Date: Mon, 16 Nov 2026 18:21:34 -0700
Subject: [PATCH 3/5] drm/vkms: Add KUnit tests for RGB332 and BGR233 read
 conversion
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
Message-Id: <20261116-rgb565-test-v1-3-27f49c1aa694@gmail.com>
References: <20261116-rgb565-test-v1-0-27f49c1aa694@gmail.com>
In-Reply-To: <20261116-rgb565-test-v1-0-27f49c1aa694@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Sidharth Saha <40047656+Sidharth-Saha@users.noreply.github.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794878495; l=5355;
 i=ssaha2000@gmail.com; s=20261116; h=from:subject:message-id;
 bh=BzzSS01lRRAORcGhyQ44tyFvKj+4xyy3eKNDBMTs5Y0=;
 b=XOEwGPLUrfmGnzNQ8xD2l/PV0UVQlhyTzzJRcpGH+1ZJ+KUA8j7I+UgBboMzpNB/Ncgep7WYt
 HFBT6nIUhxrAPwxqFaYQYTWRuA0f51WKskP+IqjN+bGQNa+zqYSCtCL
X-Developer-Key: i=ssaha2000@gmail.com; a=ed25519;
 pk=wMWW9xOklVZkO7Yh4yIXvhVVRs/3ROsqgjTt8XBGybI=
X-Endpoint-Received: by B4 Relay for ssaha2000@gmail.com/20261116 with
 auth_id=1541
X-Original-From: Sidharth Saha <ssaha2000@gmail.com>
Reply-To: ssaha2000@gmail.com
Content-Transfer-Encoding: 7bit

From: Sidharth Saha <ssaha2000@gmail.com>

Test argb_u16_from_RGB332() and argb_u16_from_BGR233(), which expand
3/3/2-bit channels to 16 bits. Each case holds the same color packed
both ways, with expected values computed by hand, including channel
values 4-6, where the result must be rounded up.

Make both functions visible to KUnit so the tests can call them.

Signed-off-by: Sidharth Saha <40047656+Sidharth-Saha@users.noreply.github.com>
---
 drivers/gpu/drm/vkms/tests/vkms_format_test.c | 49 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_formats.c           |  6 ++--
 drivers/gpu/drm/vkms/vkms_formats.h           |  4 +++
 3 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_format_test.c b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
index e7836664c788..ab95d6c3d2d5 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_format_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
@@ -315,10 +315,59 @@ static void vkms_format_test_argb_u16_to_BGR565(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, (v >> 11) & 0x1f, c->b);	/* blue: high bits */
 }
 
+struct u8_read_case {
+	const char *name;
+	u8 rgb332, bgr233;	/* the same color packed both ways */
+	u16 r, g, b;		/* expected 16-bit outputs */
+};
+
+static struct u8_read_case u8_read_cases[] = {
+	/*  name          RGB332 BGR233   r       g       b     */
+	{ "zero",         0x00,  0x00,    0,      0,      0     },
+	{ "max",          0xff,  0xff,    65535,  65535,  65535 },
+	{ "red-only",     0xe0,  0x07,    65535,  0,      0     },
+	{ "green-only",   0x1c,  0x38,    0,      65535,  0     },
+	{ "blue-only",    0x03,  0xc0,    0,      0,      65535 },
+	{ "low-steps",    0x29,  0x51,    9362,   18724,  21845 },  /* r=1 g=2 b=1 */
+	{ "round-up",     0x96,  0xac,    37449,  46811,  43690 },  /* r=4 g=5 b=2 */
+	{ "mixed",        0xcc,  0x1e,    56173,  28086,  0     },  /* r=6 g=3 b=0 */
+};
+
+static void vkms_format_test_u8_read_case_desc(struct u8_read_case *t, char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s", t->name);
+}
+
+KUNIT_ARRAY_PARAM(u8_read, u8_read_cases, vkms_format_test_u8_read_case_desc);
+
+static void vkms_format_test_argb_u16_from_RGB332(struct kunit *test)
+{
+	const struct u8_read_case *c = test->param_value;
+	struct pixel_argb_u16 out = argb_u16_from_RGB332(c->rgb332);
+
+	KUNIT_EXPECT_EQ(test, out.r, c->r);
+	KUNIT_EXPECT_EQ(test, out.g, c->g);
+	KUNIT_EXPECT_EQ(test, out.b, c->b);
+	KUNIT_EXPECT_EQ(test, out.a, 0xffff);	/* no alpha channel: always opaque */
+}
+
+static void vkms_format_test_argb_u16_from_BGR233(struct kunit *test)
+{
+	const struct u8_read_case *c = test->param_value;
+	struct pixel_argb_u16 out = argb_u16_from_BGR233(c->bgr233);
+
+	KUNIT_EXPECT_EQ(test, out.r, c->r);
+	KUNIT_EXPECT_EQ(test, out.g, c->g);
+	KUNIT_EXPECT_EQ(test, out.b, c->b);
+	KUNIT_EXPECT_EQ(test, out.a, 0xffff);
+}
+
 static struct kunit_case vkms_format_test_cases[] = {
 	KUNIT_CASE_PARAM(vkms_format_test_yuv_u16_to_argb_u16, yuv_u16_to_argb_u16_gen_params),
 	KUNIT_CASE_PARAM(vkms_format_test_argb_u16_to_RGB565, rgb565_gen_params),
 	KUNIT_CASE_PARAM(vkms_format_test_argb_u16_to_BGR565, rgb565_gen_params),
+	KUNIT_CASE_PARAM(vkms_format_test_argb_u16_from_RGB332, u8_read_gen_params),
+	KUNIT_CASE_PARAM(vkms_format_test_argb_u16_from_BGR233, u8_read_gen_params),
 };
 
 static struct kunit_suite vkms_format_test_suite = {
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 7950751c4890..eccca25f51d4 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -267,17 +267,19 @@ static struct pixel_argb_u16 argb_u16_from_BGR565(const __le16 *pixel)
 				    (bgr_565 >> 11) & 0x1f, 0xffff, 5, 6, 5, 0);
 }
 
-static struct pixel_argb_u16 argb_u16_from_RGB332(u8 pixel)
+VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_RGB332(u8 pixel)
 {
 	return channels_to_argb_u16((pixel >> 5) & 0x7, (pixel >> 2) & 0x7,
 				    pixel & 0x3, 0xffff, 3, 3, 2, 0);
 }
+EXPORT_SYMBOL_IF_KUNIT(argb_u16_from_RGB332);
 
-static struct pixel_argb_u16 argb_u16_from_BGR233(u8 pixel)
+VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_BGR233(u8 pixel)
 {
 	return channels_to_argb_u16(pixel & 0x7, (pixel >> 3) & 0x7,
 				    (pixel >> 6) & 0x3, 0xffff, 3, 3, 2, 0);
 }
+EXPORT_SYMBOL_IF_KUNIT(argb_u16_from_BGR233);
 
 static struct pixel_argb_u16 argb_u16_from_gray8(u8 gray)
 {
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
index 135bb60a554b..90006325a87e 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.h
+++ b/drivers/gpu/drm/vkms/vkms_formats.h
@@ -18,6 +18,10 @@ struct pixel_argb_u16 argb_u16_from_yuv161616(const struct conversion_matrix *ma
 					      u16 y, u16 channel_1, u16 channel_2);
 void argb_u16_to_RGB565(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel);
 void argb_u16_to_BGR565(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel);
+void argb_u16_to_RGB565(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel);
+void argb_u16_to_BGR565(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel);
+struct pixel_argb_u16 argb_u16_from_RGB332(u8 pixel);
+struct pixel_argb_u16 argb_u16_from_BGR233(u8 pixel);
 #endif
 
 #endif /* _VKMS_FORMATS_H_ */

-- 
2.53.0


