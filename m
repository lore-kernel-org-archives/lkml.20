Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793996341;
	b=jVEHlELEtm06xVCc5QhIXmjj7fFc5sOy/8dOcClPR3FNndACbQwGYz+D1sSe9aFMNXJ+
	 riwq8GndryRApOx2qWrK+bs/97/tkf3aZu1syuC/NiSpdauDD87j0UkC7WJw16M7CgrMv
	 w4yA70xBvr2jY0hq3r0+N+0BvF7MbWX5CO3lxSq++8nPofJHxTtHbLnzc86nhsJ7ePgUt
	 7nPMfaKT1S3jq9hK07rHiL94fw0Yr8f5JxwHsHbZjRDcEZIu0ze6ej/bJ89imlhe8JRUR
	 G8JTrMkgg1kHv5TOWIlvarRWBg8PR4ulGNH0jxsDqvfK+GVwO7fPi76xBDybdy+anKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793996341;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=X2BxeNhllfRH6L5WRegbMnPCb2g3AUY4Z8BZB+S312E=;
	b=dQKr0bBb98qk8X+JYGJCwcA+VsENvwbXdC8tuRpAmfr1lMexE5GV3qy+CEnh05RytqHT
	 Sb5RY1XuFv8uQf6TSAv12V1Bjo8Fssy6PWnsnUSXZq2GIvHpC59GJoFjvETuAk3CbnpyD
	 oz+C39TlxiWekzlzskMuBq4rSS7lUXrLxvDE4K2v6jT1SzvbhNyTOrfz3Jssf/DkOehi/
	 ggPgVQVzpk2MjbYkVna4g36Lkx4aPyp+Ymp9x6pAVQeiavNRX9Ku1xULS1pKEQQPz8GqB
	 EGpAqBoaKC2iEzDS4XYqeczkHVTfVdsX2ndjWUn/mLc/hUtxehnym71V3Eo85sBrJng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=VJmA5S2i;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D54606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69D54606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=VJmA5S2i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793996338;
	bh=+qaehktjH1TRurnQUB45IY+MTI8NWLyDc82TPymYJHk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VJmA5S2iXqN1L9dGh1NcbxIuZf8bf8H8Pq0G97rksuS3xpBS3UZeS25uk4lW0K877
	 01HfQg/s+HoXNkwV+YRS+sD/MRRHLO0lpFIURwwc/rNojwRCMZ+wE+qzv/Z6S9Pmd8
	 GhgfzuvKF0AXgMsFLDjJB8So7bQWcn69Z32AkBnP61iMgX4YyWwtek/Mux26cdF2bh
	 8CUMWAkEbFJMW0akJBSpdb6VUPvr9yW0POddCaAEVMjI3rkphLK56l5o8ZUTuB1q8v
	 tsn114NUaGw/XefsCgfFKxLeUJIvC00CXb/BW0g8t8zQg+QwmbThSeMKG7XeYlnWuq
	 vJzCPoe3qQGzw==
Received: from archlinux (unknown [100.64.1.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: leandrohrb)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 229D417E00AF;
	Fri, 06 Nov 2026 21:18:53 +0100 (CET)
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
Subject: [PATCH v2 04/12] drm/vkms: remove TEST_LUT_SIZE
Date: Fri,  6 Nov 2026 17:18:05 -0300
Message-ID: <20261106201813.129911-5-leandro.ribeiro@collabora.com>
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

This can be replaced by ARRAY_SIZE(), so drop it.

Reviewed-by: Robert Mader <robert.mader@collabora.com>
Tested-by: Robert Mader <robert.mader@collabora.com>
Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
---
 drivers/gpu/drm/vkms/tests/vkms_color_test.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_test.c b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
index 18e73a8a5c31..3489513af352 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_color_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
@@ -8,11 +8,9 @@
 #include "../vkms_drv.h"
 #include "../vkms_luts.h"
 
-#define TEST_LUT_SIZE 16
-
 MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 
-static struct drm_color_lut test_linear_array[TEST_LUT_SIZE] = {
+static struct drm_color_lut test_linear_array[] = {
 	{ 0x0, 0x0, 0x0, 0 },
 	{ 0x1111, 0x1111, 0x1111, 0 },
 	{ 0x2222, 0x2222, 0x2222, 0 },
@@ -84,7 +82,7 @@ static const struct vkms_color_test_lerp_params color_test_lerp_cases[] = {
 
 static const struct vkms_color_lut test_linear_lut = {
 	.base = test_linear_array,
-	.lut_length = TEST_LUT_SIZE,
+	.lut_length = ARRAY_SIZE(test_linear_array),
 	.channel_value2index_ratio = 0xf000fll
 };
 
@@ -96,7 +94,7 @@ static void vkms_color_test_get_lut_index(struct kunit *test)
 	lut_index = get_lut_index(&test_linear_lut, test_linear_array[0].red);
 	KUNIT_EXPECT_EQ(test, drm_fixp2int(lut_index), 0);
 
-	for (i = 0; i < TEST_LUT_SIZE; i++) {
+	for (i = 0; i < test_linear_lut.lut_length; i++) {
 		lut_index = get_lut_index(&test_linear_lut, test_linear_array[i].red);
 		KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(lut_index), i);
 	}
-- 
2.56.0

