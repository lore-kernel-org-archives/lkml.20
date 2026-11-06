Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793996362;
	b=3gwuCxxzjOG1PITW9+uJD6kaf6Wn2hu5XS9GMhnT3glRqQfYKj9IFhoIDhfXxghBeLIO
	 JYh1eJxM3oXySl+TR9DxsjRan40Xh5X+d44fb1KmGiVAvIe3Le9gkzuIMss+7msc4hIw3
	 NqcPytJ9GFjV+n2wTkq8o8KBMG+/9J15ejA93tiKEAJztWin6HUrqH/fkc3ywAjqX12Zn
	 LFnlLqcDiQukRGjfe8Bib+WML8Jj9XzxxrBP5WAuyfiOaP0NGBPyG8ia19N3DdQ7OaHc8
	 mrXq8OIAC7sgcRwu2MnCV3efKfFjLKnblL++N6p8f10O2pCY8wXEFvWd5EEs9/RgFxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793996362;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VsvbvYM3x0gvT7i6FuBR31rPOQG+5GHE/tU4DV/oT9A=;
	b=iCeFLMV1jDloP0y9IPGq9N/6VyShsMkdst5OOI74GADLal7H6PwKYcusIf3vZKlqCwQE
	 bhNHu/6l/DXpOtP9SfQHIl9T/VB123IfNa5cR00+zkiKmwDvbCdYDTuYIyvekgrgTLV8m
	 LrcH7vvOqyHAKd0eGNMkZH0y7he1c6/tgJcFmnrzg3oDhFCspJfBswhdBXE+C4bdu7iAk
	 n2wDBpXWyKJv+ZYTeIpSyw/BVug+hBs7haHkgPfyruW9rkr9aZakdJFjpB7EdXHSfbIBj
	 UI9lB9V1Pdgxa7bE9bnOzpLF6HKyuFyrQ9Tdsg6UWs9WlX3ABzir4LZVVjY1JwiW9mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=CgI22PLL;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858C3606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 858C3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=CgI22PLL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793996359;
	bh=jTRfjTHQwFzePTWTpn2Hn3kL9tYktykIdD3T3ZCA0Bc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CgI22PLL80xReToIRaUmx90BQgyZxBIq/lS3Z4/RN9G/Xv7HKCLMwszitMumUYIR4
	 rqauRaJcn9/KSqiOLPP49y1ZWQy+dnUN4UgHklf1DO94gO3s4B+rCf1dVMOuM7/CRt
	 9jrDh0mLb0znDW6tvfVlUUcHnixVoimq5Vq+Yo1rqbroUYRMJUR5ZCLomr6/tC0hA/
	 C0KOmGy8BKNFU8mW/fvCTTWPuVA+46jT7VfkNDAopYPpSFHlH7Ue7XkRfId0dCaeFG
	 jcRLLnPx4fnPcawVhwLScwqyQjDDYWEp5sI81wrzK6XpfMOnmHTzCD79Sm1sSPhB+p
	 rvmxlYRummd4Q==
Received: from archlinux (unknown [100.64.1.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: leandrohrb)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2196617E05D6;
	Fri, 06 Nov 2026 21:19:14 +0100 (CET)
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com,
	alex.hung@amd.com,
	daniel@fooishbar.org,
	hamohammed.sa@gmail.com,
	harry.wentland@amd.com,
	maarten.lankhorst@linux.intel.com,
	melissa.srw@gmail.com,
	mripard@kernel.org,
	pekka.paalanen@collabora.com,
	robert.mader@collabora.com,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/12] drm/vkms: rename get_lut_index() to get_uniform_lut_index()
Date: Fri,  6 Nov 2026 17:18:09 -0300
Message-ID: <20261106201813.129911-9-leandro.ribeiro@collabora.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106201813.129911-1-leandro.ribeiro@collabora.com>
References: <20261106201813.129911-1-leandro.ribeiro@collabora.com>
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

In the next commits we'll add non-uniform LUTs, and this function will
be used exclusively by uniform LUTs. So rename it to make this clearer.

Reviewed-by: Robert Mader <robert.mader@collabora.com>
Tested-by: Robert Mader <robert.mader@collabora.com>
Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
---
 drivers/gpu/drm/vkms/tests/vkms_color_test.c | 28 ++++++++++----------
 drivers/gpu/drm/vkms/vkms_composer.c         |  6 ++---
 drivers/gpu/drm/vkms/vkms_composer.h         |  2 +-
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_test.c b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
index c223797a542a..06cec3591c5c 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_color_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
@@ -86,31 +86,31 @@ static const struct vkms_color_lut test_linear_lut = {
 	.channel_value2index_ratio = 0xf000fll
 };
 
-static void vkms_color_test_get_lut_index(struct kunit *test)
+static void vkms_color_test_get_uniform_lut_index(struct kunit *test)
 {
 	s64 lut_index;
 	int i;
 
-	lut_index = get_lut_index(&test_linear_lut, test_linear_array[0].red);
+	lut_index = get_uniform_lut_index(&test_linear_lut, test_linear_array[0].red);
 	KUNIT_EXPECT_EQ(test, drm_fixp2int(lut_index), 0);
 
 	for (i = 0; i < test_linear_lut.lut_length; i++) {
-		lut_index = get_lut_index(&test_linear_lut, test_linear_array[i].red);
+		lut_index = get_uniform_lut_index(&test_linear_lut, test_linear_array[i].red);
 		KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(lut_index), i);
 	}
 
-	KUNIT_EXPECT_EQ(test, drm_fixp2int(get_lut_index(&srgb_eotf, 0x0)), 0x0);
-	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0x0)), 0x0);
-	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0x101)), 0x1);
-	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0x202)), 0x2);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int(get_uniform_lut_index(&srgb_eotf, 0x0)), 0x0);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_uniform_lut_index(&srgb_eotf, 0x0)), 0x0);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_uniform_lut_index(&srgb_eotf, 0x101)), 0x1);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_uniform_lut_index(&srgb_eotf, 0x202)), 0x2);
 
-	KUNIT_EXPECT_EQ(test, drm_fixp2int(get_lut_index(&srgb_inv_eotf, 0x0)), 0x0);
-	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_inv_eotf, 0x0)), 0x0);
-	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_inv_eotf, 0x101)), 0x1);
-	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_inv_eotf, 0x202)), 0x2);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int(get_uniform_lut_index(&srgb_inv_eotf, 0x0)), 0x0);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_uniform_lut_index(&srgb_inv_eotf, 0x0)), 0x0);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_uniform_lut_index(&srgb_inv_eotf, 0x101)), 0x1);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_uniform_lut_index(&srgb_inv_eotf, 0x202)), 0x2);
 
-	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0xfefe)), 0xfe);
-	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0xffff)), 0xff);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_uniform_lut_index(&srgb_eotf, 0xfefe)), 0xfe);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_uniform_lut_index(&srgb_eotf, 0xffff)), 0xff);
 }
 
 static void vkms_color_test_lerp(struct kunit *test)
@@ -392,7 +392,7 @@ static void vkms_color_ctm_3x4_bt709(struct kunit *test)
 }
 
 static struct kunit_case vkms_color_test_cases[] = {
-	KUNIT_CASE(vkms_color_test_get_lut_index),
+	KUNIT_CASE(vkms_color_test_get_uniform_lut_index),
 	KUNIT_CASE(vkms_color_test_lerp),
 	KUNIT_CASE(vkms_color_test_linear),
 	KUNIT_CASE(vkms_color_srgb_inv_srgb),
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 640a1a03f06f..faf4515f024c 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -93,19 +93,19 @@ static inline u16 lut_channel_value(const struct drm_color_lut *lut,
 	return 0;
 }
 
-VISIBLE_IF_KUNIT s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
+VISIBLE_IF_KUNIT s64 get_uniform_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
 {
 	s64 color_channel_fp = drm_int2fixp(channel_value);
 
 	return drm_fixp_mul(color_channel_fp, lut->channel_value2index_ratio);
 }
-EXPORT_SYMBOL_IF_KUNIT(get_lut_index);
+EXPORT_SYMBOL_IF_KUNIT(get_uniform_lut_index);
 
 VISIBLE_IF_KUNIT u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
 						enum lut_channel channel)
 {
 	const struct drm_color_lut *lut_y_floor, *lut_y_ceil;
-	s64 lut_index = get_lut_index(lut, channel_value);
+	s64 lut_index = get_uniform_lut_index(lut, channel_value);
 	u16 floor_channel_value, ceil_channel_value;
 
 	/*
diff --git a/drivers/gpu/drm/vkms/vkms_composer.h b/drivers/gpu/drm/vkms/vkms_composer.h
index 04dd5646f672..fa003af12f85 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.h
+++ b/drivers/gpu/drm/vkms/vkms_composer.h
@@ -19,7 +19,7 @@ enum lut_channel {
 
 #if IS_ENABLED(CONFIG_KUNIT)
 u16 lerp_u16(u16 a, u16 b, s64 t);
-s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value);
+s64 get_uniform_lut_index(const struct vkms_color_lut *lut, u16 channel_value);
 u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
 			       enum lut_channel channel);
 void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_color_ctm_3x4 *matrix);
-- 
2.56.0

