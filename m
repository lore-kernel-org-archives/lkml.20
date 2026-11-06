Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793996372;
	b=iLu3hl+ksvvaVPAHZ2lKLBI0V4z6cbqf5en2XUYWVnGrtrc7PawZd/uOdEG7Kf8Z5Sr/
	 6mVMVpI/C0CO3Ajs4P42MzJqL+yZQMDdUoRf4vKwFt6x5WNWSaB/AzQl40cJdWj1/QCaP
	 iiN9KjYWNXGXhSDyVFVpeYL13trdx/7utnFlWX2JZMFMoHaljXkHKUWQZTMnaPGKOA9gq
	 cyJiS+L2S3NQUtOgJIeR9FARBXdpfFTGs7RT/UMDDJSIClf2okbi/swbplKsKrcaVE8a+
	 dPwdrjJ7wB5vXvaaDAPCm3gRPCLJ5GqyjRu3u9+nPN7o+e8H5QrruIgiAdeDbu9pqSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793996372;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1jk/V3b/fgmaqqTNsKaHGajieQM0siDwt5PN+w7HAaM=;
	b=ycKsHST9A/MjNB3FpTaBIhGqc9M9mz/aNv0TjPQri/1N3SqBtGwU+0dT/LTeWdej6nQG
	 9rW77/f3oKSgdUJSQ6UM3Kp71Hk2Tmmg1X/9zSRBEJSpxSdGGvkeGoQ88ntOm1q7nUq5E
	 wPnM9Qu8sbj6NCqo7ln1Sx8FuI/KEOBWi25vklYveIRciIrwYkNNtmw3/CaYjyBUYs/Fx
	 AHg13Gp6okdHul3Dkvaw4D+rhT7RtwkpCMZIw36+X7s35CIf9IlZbmSFFmtff19RCiiI8
	 QUN44YZBjDRy1uw3w2g2ZGFW2XpwZnaCODyea5XWYzxoWxdbtZw0/P5g+mZAaCl8wzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=SV6fsh71;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E061606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E061606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=SV6fsh71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793996370;
	bh=2/Ga56h/DR/xKTT7FlBHJ6QUFChcm7dTb0PVTI7+a18=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SV6fsh71pClwNSw2U91vBc9B1JX+voODnTfaoDQSDV2d0QqKyaoXBmRuMbwnCNFz8
	 9wCC+PfwyK1u4hCuPA4+ug16mjmPUa2sB4INgCr/ZJK44La5fhWifcPah7N61mV1UD
	 jo8bNqq/KdSEKK4tHJNESNNT0GZEVJ8jHWfZ3kwEStEBOsbjxVw8SuzzUe5/vYgujR
	 bE5f2ytPffKQeHxHC3XLgNr8oL950hbO7ltwQOo2xp0tjyNR0Keh7QcsGtWBmEir1z
	 cfftUtdpEB0N0AZMUCnqrmquDhW/n2zUgFHtZh/yn9N+B4uGx1aHsh0GyNViucFK3u
	 zoVwoKv4kOtYg==
Received: from archlinux (unknown [100.64.1.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: leandrohrb)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D8FBC17E066C;
	Fri, 06 Nov 2026 21:19:25 +0100 (CET)
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
Subject: [PATCH v2 10/12] drm/vkms: test sRGB and inverse sRGB LUTs using more samples
Date: Fri,  6 Nov 2026 17:18:11 -0300
Message-ID: <20261106201813.129911-11-leandro.ribeiro@collabora.com>
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

We're currently using srgb_eotf.lut_length samples in
vkms_color_srgb_inv_srgb(). This does not exercise any points that are
not in the forward sRGB LUT, although it exercises points that are not
in its inverse.

Let's test with more samples, to also exercise points that are not in
the forward sRGB LUT.

We chose 4096 samples. LUT inputs are u16, so we could have up to 65536
samples. LUT sizes are usually not higher than 512, so with 4096 we have
at least 8 samples between each LUT point.

We can see a minor error bump with this change. In the next commits we
replace such LUTs with non-uniform optimal ones to reduce the error.

Reviewed-by: Robert Mader <robert.mader@collabora.com>
Tested-by: Robert Mader <robert.mader@collabora.com>
Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
---
 drivers/gpu/drm/vkms/tests/vkms_color_test.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_test.c b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
index 238f4d21ebc8..86d9b14f847b 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_color_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
@@ -123,14 +123,16 @@ static void vkms_color_test_linear(struct kunit *test)
 static void vkms_color_srgb_inv_srgb(struct kunit *test)
 {
 	u16 srgb, final;
-	u16 tolerance = 119;
+	u16 tolerance = 122;
+	u32 x;
 
-	for (int i = 0; i < srgb_eotf.lut_length; i++) {
-		srgb = apply_lut_to_channel_value(&srgb_eotf, srgb_eotf.x[i], LUT_RED);
+	for (u32 i = 0; i <= 4095; i++) {
+		x = i * U16_MAX / 4095;
+		srgb = apply_lut_to_channel_value(&srgb_eotf, x, LUT_RED);
 		final = apply_lut_to_channel_value(&srgb_inv_eotf, srgb, LUT_RED);
 
-		KUNIT_EXPECT_GE(test, final, (int)srgb_eotf.x[i] - tolerance);
-		KUNIT_EXPECT_LE(test, final, (int)srgb_eotf.x[i] + tolerance);
+		KUNIT_EXPECT_GE(test, final, (int)x - tolerance);
+		KUNIT_EXPECT_LE(test, final, (int)x + tolerance);
 	}
 }
 
-- 
2.56.0

