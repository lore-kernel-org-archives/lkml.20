Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793996335;
	b=YmxGlW0vQWczJS0QbaZhCkIybTeQZ8RxDRQOuFVQKw38pYnVZDAMVE0n5B3EN5FA+lri
	 l1UCB1U4H0ZW3HwOgIesx1krbigwotx5sGsE/zRNZtYDqLeGTSEc2yEYp8eYxvUpNNalO
	 EGd85sQ1jVzsNge4HpukFg0i23hmWRGZ/LDpjojLBZGCvFlcRfxuzMTxnEzDL4sm7eqjt
	 QJ9Ivq4+xYg4HR38ihW3ZKWW6vaoE/Vc8QqqAZjDCH0o7Kl91PhA0+Wl7UAGEOI0z0WFN
	 obbcogbCl3bV4wNxmXRYtVdl3XQo0y9inqFf01h6b0snSYx0a9hM3ubtNC7uaO/Oh+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793996335;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ndJ7g4pW8qs8GaRpq57JtCYsR4I6i+3Rq+Fi8tQ67uQ=;
	b=gpWdS9n2rCMQ6HX4EYlVKSGQNBgaZTu6QA8uSZzSqzC1LcaZCl/Xx7w3/XHPKYwOx/xi
	 EH6IscVi3jsEmv57XR0GuryW838aqtGnSdcPNSheUJ3JhyVmli+zMDHInea7Yh07cju+a
	 QAvtjylJOEHAgjYPvfnIARgUDCSnYFeCggLrkGRQJcJk2CaCp/l0tw002qiFyF3FAU9Al
	 VnVKGm3iR+tSSheEfv7RaWj9dQTXFsK2ffI2XZLjk/42dgeTnmQ35ZC2/Hal76ki+771m
	 uTWdaT5lJBB1ZRXjTemrk1tlCIHo5Z1TOZzG1zfTzWtogfeACcIOrC5n724imBliglg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=MkVMmTud;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B88A606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B88A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=MkVMmTud
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793996333;
	bh=oVMhuu8wDkT2uP6ojAQG+iyNORDuyd/6LXMBzjrRfkw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MkVMmTudlrqrbU+scnh6JsYnw+BcZDpL/spRYZeSi7jDIed2X96SnGc0Tspv7Xt8J
	 ICQcnrDsJ99aHhKmUMSkyhZmO9dfgZp0qa3dfe0jhXih3u8bVUVo9l+GluJUdw94Q8
	 KCymqFgELpHyqXxTgKaZPhxlsJGQifvk4efv4EFwVWzfS3xz+gu8Fe0xDQQXEF/kxC
	 x6NblO0Hi3tJ43X7Qx9R+Sb21y+IHPt2Gbn/nueR0dY7cJRwn0NyFGb+/V/ueoNyHX
	 +oy7dsWLQmt5NH59KoizBOc0rm6/MnglzoXFnMmCH+G1Xp0lzC8Sd7VE4SRb1e0y4n
	 hA1VzB+rfPYSg==
Received: from archlinux (unknown [100.64.1.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: leandrohrb)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0633717E092C;
	Fri, 06 Nov 2026 21:18:48 +0100 (CET)
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
Subject: [PATCH v2 03/12] drm/vkms: allow color curve LUTs to have different sizes
Date: Fri,  6 Nov 2026 17:18:04 -0300
Message-ID: <20261106201813.129911-4-leandro.ribeiro@collabora.com>
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

Instead of keeping a hardcoded size that all LUTs representing color
curves must use, use ARRAY_SIZE() instead.

Besides making the code clearer, this allows us to create optimal LUTs
for each color curve, and each of them can naturally have a different
size. In the next commits we introduce these optimal LUTs.

Reviewed-by: Robert Mader <robert.mader@collabora.com>
Tested-by: Robert Mader <robert.mader@collabora.com>
Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
---
 drivers/gpu/drm/vkms/tests/vkms_color_test.c |  4 ++--
 drivers/gpu/drm/vkms/vkms_luts.c             | 12 ++++++------
 drivers/gpu/drm/vkms/vkms_luts.h             |  2 --
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_test.c b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
index 1a1c7cac2f15..18e73a8a5c31 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_color_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
@@ -128,7 +128,7 @@ static void vkms_color_test_lerp(struct kunit *test)
 
 static void vkms_color_test_linear(struct kunit *test)
 {
-	for (int i = 0; i < LUT_SIZE; i++) {
+	for (int i = 0; i < linear_eotf.lut_length; i++) {
 		int linear = apply_lut_to_channel_value(&linear_eotf, i * 0x101, LUT_RED);
 
 		KUNIT_EXPECT_EQ(test, DIV_ROUND_CLOSEST(linear, 0x101), i);
@@ -139,7 +139,7 @@ static void vkms_color_srgb_inv_srgb(struct kunit *test)
 {
 	u16 srgb, final;
 
-	for (int i = 0; i < LUT_SIZE; i++) {
+	for (int i = 0; i < srgb_eotf.lut_length; i++) {
 		srgb = apply_lut_to_channel_value(&srgb_eotf, i * 0x101, LUT_RED);
 		final = apply_lut_to_channel_value(&srgb_inv_eotf, srgb, LUT_RED);
 
diff --git a/drivers/gpu/drm/vkms/vkms_luts.c b/drivers/gpu/drm/vkms/vkms_luts.c
index 82cb792f10d8..6dcdef26bda8 100644
--- a/drivers/gpu/drm/vkms/vkms_luts.c
+++ b/drivers/gpu/drm/vkms/vkms_luts.c
@@ -12,7 +12,7 @@
  * https://gitlab.freedesktop.org/hwentland/lutgen
  */
 
-static struct drm_color_lut linear_array[LUT_SIZE] = {
+static struct drm_color_lut linear_array[] = {
 	{ 0x0, 0x0, 0x0, 0 },
 	{ 0x101, 0x101, 0x101, 0 },
 	{ 0x202, 0x202, 0x202, 0 },
@@ -273,12 +273,12 @@ static struct drm_color_lut linear_array[LUT_SIZE] = {
 
 const struct vkms_color_lut linear_eotf = {
 	.base = linear_array,
-	.lut_length = LUT_SIZE,
+	.lut_length = ARRAY_SIZE(linear_array),
 	.channel_value2index_ratio = 0xff00ffll
 };
 EXPORT_SYMBOL(linear_eotf);
 
-static struct drm_color_lut srgb_array[LUT_SIZE] = {
+static struct drm_color_lut srgb_array[] = {
 	{ 0x0, 0x0, 0x0, 0 },
 	{ 0x13, 0x13, 0x13, 0 },
 	{ 0x27, 0x27, 0x27, 0 },
@@ -539,12 +539,12 @@ static struct drm_color_lut srgb_array[LUT_SIZE] = {
 
 const struct vkms_color_lut srgb_eotf = {
 	.base = srgb_array,
-	.lut_length = LUT_SIZE,
+	.lut_length = ARRAY_SIZE(srgb_array),
 	.channel_value2index_ratio = 0xff00ffll
 };
 EXPORT_SYMBOL(srgb_eotf);
 
-static struct drm_color_lut srgb_inv_array[LUT_SIZE] = {
+static struct drm_color_lut srgb_inv_array[] = {
 	{ 0x0, 0x0, 0x0, 0 },
 	{ 0xcc2, 0xcc2, 0xcc2, 0 },
 	{ 0x15be, 0x15be, 0x15be, 0 },
@@ -805,7 +805,7 @@ static struct drm_color_lut srgb_inv_array[LUT_SIZE] = {
 
 const struct vkms_color_lut srgb_inv_eotf = {
 	.base = srgb_inv_array,
-	.lut_length = LUT_SIZE,
+	.lut_length = ARRAY_SIZE(srgb_inv_array),
 	.channel_value2index_ratio = 0xff00ffll
 };
 EXPORT_SYMBOL(srgb_inv_eotf);
diff --git a/drivers/gpu/drm/vkms/vkms_luts.h b/drivers/gpu/drm/vkms/vkms_luts.h
index 925a4a7b84e2..8078ab33b83e 100644
--- a/drivers/gpu/drm/vkms/vkms_luts.h
+++ b/drivers/gpu/drm/vkms/vkms_luts.h
@@ -3,8 +3,6 @@
 #ifndef _VKMS_LUTS_H_
 #define _VKMS_LUTS_H_
 
-#define LUT_SIZE 256
-
 extern const struct vkms_color_lut linear_eotf;
 extern const struct vkms_color_lut srgb_eotf;
 extern const struct vkms_color_lut srgb_inv_eotf;
-- 
2.56.0

