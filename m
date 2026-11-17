Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794878498;
	b=o8gaMaUsmhFLB56N5YYVwU4BXZ7htxcXEAPxn6x0WWGJ71UHSt0N+y0f9SGyrot0DkmC
	 Zb+nmZih4hIM4z15jhqS4cR5mPxCtGftWzBTZ8UNPW0CeShKzh/ridPdz+Kd+NmsvW525
	 bp2pQCDNhHJ2LcA9CayxW2zJXnWVVImStnf395QdOK8G8oIdV21L7sotIxp/zdQexBJ6X
	 IYsjOD9aggoVbdb2bw7ip7rYPLlJFdJjsSxRY4p/tbf/6z2BeQoXXBdjlHkmYRGPAj/0v
	 BfKw+dR780eUyu28s1gtSBCDCbhDDjtSBSj8UC4rDxLD/QduwO1J3J283MQXlCAUR1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794878498;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fKpv9cH4CGPPxMvg9AIuevrHQ/81EROLPmayC0kdwUg=;
	b=bIm5S2M9zm0iZLPQUtt2K260UIssPuQ5i8sr47KcWrg5lzgFgWhyLuB+2UuSKoFTTBhl
	 8/Uc7DCbA7v3PztIDIE/rkm9yutIgdmNRQ8lxf65cqFw9pioo9p4E756lHHtA6w7rLYOI
	 lXHT/xf5KQBGLxBFy0r0M7V0Dhh0bQtBv16Oj5MUfT6xbGgd7FhXhrqbt+UbmUg7jH/0h
	 Xe+aKne9nD0cAM4Md5HWlM9w/cKT1HhXcJ+/sIKnhVbl5Y/DQQYBXrYtShGwM9CZaDzRh
	 06L8F13foG28eXlBd+zeX/YnZjqafume+TAlXUX35OhLOfWE3KDArRRu8koO3G1uMyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cRos+xgE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F3B606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cRos+xgE
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794878497;
	b=Rq1g3r/LeyDw6+nUYP+m3Uf3b4NFBvLsgCdhe8QcVLRuNcQizi1QBBVfExNIMpU1qOtI
	 eEKcLDYIRHULOKZUSdbFffOna1hljOczOlpeOwcAMcwqmirv8vPFj1feAGZYNa8zX3qyb
	 FJj/EOs15oYrxl7VoCIProwktqBP2Ja+bFcS5gBqsiJPiBeRR+7lNV1Nd1c+phZBqWUcr
	 TU5BBxKvmtTIX/29D6vHvqt7ZpjIt0X1ulzZIuo3QgQX6E6nq/9i/VtPOq6OeF0UZl9ad
	 pM5EtpaLCC4K0KrrcAL68Jj8XU/oUk6hnp5NgZKRofabx/cxmBs35FzjqJRBSM2yCsw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794878497;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fKpv9cH4CGPPxMvg9AIuevrHQ/81EROLPmayC0kdwUg=;
	b=YQbqpOpq0xxn1oekRZlR3e46OCM0qRWF2rBMUXHgUGXlUs0pOEDmYwXDqouxZijjAKeM
	 izupHdqRpR5J3C79tQYcUupjd7wRwhQv7PEZRKif8OZ8EEQrVOv+tkINiSED/DZtlKvOr
	 VhGlNUnvos+H/bsu13G5MvlHpI/wxq36r+e0DmXN8MnI1W3uibUDc+bB//SRDy7LNqPR/
	 NVgVRZ0drQdUMyUvikwkwqU9I47wJcOh65ykoxHIopJL84W6Wq7gltgDdXBadKDzfGAwK
	 4i64EZDITZT3IpXgiqXmtoeCBWq2iHMfi2QGBcvP7wWjqN47X7oxiJxqCkAddY8Q/fg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A87701F000C6;
	Tue, 17 Nov 2026 01:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794878497;
	bh=fKpv9cH4CGPPxMvg9AIuevrHQ/81EROLPmayC0kdwUg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cRos+xgEw1jb5YtKH64ym8Va84YMzpbDHJ1ssaFEF3K7y3IGWklmzM9ADbUJXZSx9
	 IycQp4wNnTEozpkgAxhjg917u3VvyggujRJbjd9cndM1KFvxnIuvSbvhvlw3nzKvjI
	 7mTJAF+V7HZ3ne8apoIhYFp1qBWUA4l6ZP9U5WobKL2rB5+GjyLHzeV7CEn5kVrhe/
	 y7eidaNoUog6MP1ZHP9uBvrKR5nnrgGGTbfOw0VgdY9YUFVDJaULYp28xzZGB1CA0w
	 uvEqY3vHKcnMZ2l7rDGrsQNVBaz4ywfWic/llAqSlzQi+pbba3W7oEwLn4C3DUu1Bf
	 YTtIAQ2Ld04vw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 34D9D4A66A;
	Tue, 17 Nov 2026 01:21:36 +0000 (UTC)
From: Sidharth Saha via B4 Relay <devnull+ssaha2000.gmail.com@kernel.org>
Date: Mon, 16 Nov 2026 18:21:33 -0700
Subject: [PATCH 2/5] drm/vkms: Add KUnit test for BGR565 writeback
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
Message-Id: <20261116-rgb565-test-v1-2-27f49c1aa694@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794878495; l=3359;
 i=ssaha2000@gmail.com; s=20261116; h=from:subject:message-id;
 bh=ApQ0qFyySZKS61HvfyzyTc22Ok4qXCkPkweSnnzwWLQ=;
 b=rFZn7J1E2fICdkDrUX/l0Yga74w+TpX6b2Vdxbt2OAZKrgpeMNbj3+s0DzXIwf3tXzxxRIGH5
 7j35k1Klxp0CA5/NS69KmsWLTXGYJ7x26IupXwwzv/W10mifPb59hQQ
X-Developer-Key: i=ssaha2000@gmail.com; a=ed25519;
 pk=wMWW9xOklVZkO7Yh4yIXvhVVRs/3ROsqgjTt8XBGybI=
X-Endpoint-Received: by B4 Relay for ssaha2000@gmail.com/20261116 with
 auth_id=1541
X-Original-From: Sidharth Saha <ssaha2000@gmail.com>
Reply-To: ssaha2000@gmail.com
Content-Transfer-Encoding: 7bit

From: Sidharth Saha <ssaha2000@gmail.com>

Reuse the RGB565 writeback cases to test argb_u16_to_BGR565(), which
packs the same 5/6/5-bit channels with red and blue swapped. The
distinct-channel case checks that red and blue land in the right bits.

Make argb_u16_to_BGR565() visible to KUnit so the test can call it.

Signed-off-by: Sidharth Saha <40047656+Sidharth-Saha@users.noreply.github.com>
---
 drivers/gpu/drm/vkms/tests/vkms_format_test.c | 15 +++++++++++++++
 drivers/gpu/drm/vkms/vkms_formats.c           |  3 ++-
 drivers/gpu/drm/vkms/vkms_formats.h           |  1 +
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_format_test.c b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
index a8ef93b9c806..e7836664c788 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_format_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
@@ -301,9 +301,24 @@ static void vkms_format_test_argb_u16_to_RGB565(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, v & 0x1f, c->b);
 }
 
+static void vkms_format_test_argb_u16_to_BGR565(struct kunit *test)
+{
+	const struct rgb565_case *c = test->param_value;
+	__le16 out;
+	u16 v;
+
+	argb_u16_to_BGR565((u8 *)&out, &c->in);
+	v = le16_to_cpu(out);
+
+	KUNIT_EXPECT_EQ(test, v & 0x1f, c->r);		/* red: low bits */
+	KUNIT_EXPECT_EQ(test, (v >> 5) & 0x3f, c->g);
+	KUNIT_EXPECT_EQ(test, (v >> 11) & 0x1f, c->b);	/* blue: high bits */
+}
+
 static struct kunit_case vkms_format_test_cases[] = {
 	KUNIT_CASE_PARAM(vkms_format_test_yuv_u16_to_argb_u16, yuv_u16_to_argb_u16_gen_params),
 	KUNIT_CASE_PARAM(vkms_format_test_argb_u16_to_RGB565, rgb565_gen_params),
+	KUNIT_CASE_PARAM(vkms_format_test_argb_u16_to_BGR565, rgb565_gen_params),
 };
 
 static struct kunit_suite vkms_format_test_suite = {
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index c5ee2d6a920f..7950751c4890 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -696,7 +696,7 @@ VISIBLE_IF_KUNIT void argb_u16_to_RGB565(u8 *out_pixel, const struct pixel_argb_
 }
 EXPORT_SYMBOL_IF_KUNIT(argb_u16_to_RGB565);
 
-static void argb_u16_to_BGR565(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
+VISIBLE_IF_KUNIT void argb_u16_to_BGR565(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
 {
 	__le16 *pixel = (__le16 *)out_pixel;
 	u16 r, g, b;
@@ -705,6 +705,7 @@ static void argb_u16_to_BGR565(u8 *out_pixel, const struct pixel_argb_u16 *in_pi
 
 	*pixel = cpu_to_le16(b << 11 | g << 5 | r);
 }
+EXPORT_SYMBOL_IF_KUNIT(argb_u16_to_BGR565);
 
 static void argb_u16_to_RGB332(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
 {
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
index 2b8a1c4a5d46..135bb60a554b 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.h
+++ b/drivers/gpu/drm/vkms/vkms_formats.h
@@ -17,6 +17,7 @@ void get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encod
 struct pixel_argb_u16 argb_u16_from_yuv161616(const struct conversion_matrix *matrix,
 					      u16 y, u16 channel_1, u16 channel_2);
 void argb_u16_to_RGB565(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel);
+void argb_u16_to_BGR565(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel);
 #endif
 
 #endif /* _VKMS_FORMATS_H_ */

-- 
2.53.0


