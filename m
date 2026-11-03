Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801750;
	b=cxzmcJVGufrU1QlDXdqim36u6l9B+0p/cFoiV5crHhEBG45d8sNil/SAWgNEEHRgsbue
	 kqRJ7BZGB5Zc2OlFB2p8dD5j2Vyw8/YxzNIY8nsFpVNxHvFzAWCAOdeQyEWrwRk31fqdi
	 iQRu1ZFwp/SIYjmf6qE2K0SHH282Fcz8WHVVK/cCyL2+CfgHmA3r2TYfkr7TVaQO8cv8c
	 PB05l6bMOoRve+tZEj4F5a1YAlpSG9vbzs61Ef5WHW3U2thgawDT0IK/NfqCfJw3q7YHK
	 l64JpBVyh4URmsOSopqDqqgMfqfpgitqsxqaBOissYDr045Ta6wEKvEfIAgd619vFng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801750;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Rspamd-Queue-Id;
	bh=zVi93CQ//2euCCyPaFsK8UkBI2G8pXdx8HSh695art4=;
	b=Mn57xRm9J5KZeqm59l8IpxYQpJyyOAXTYp9zGMzhf+ddvklFeKxqyIlHSI+cEoSR0gHP
	 Aqnq7WFDsQchbGCZzvHJg6hQt4GnKyUSxcZt9eL5NAZBb4HbeX94Tvni07JoNerGGlDHX
	 74rZwPQS3FMXvyczNoRbF9l2HnjOoy6uOL5gkX0I6dzlmpsSbyHJWxqdXi/nEhKwxbs3r
	 0rnZi9j8liKSnczI4qGBFJ+8yfUXA+FB5SUXHFl2Vr71sg71ZdFJZgOsawN+R1CzS8zc8
	 nv4Aq8aR4nobe7nWrwTi8wfsh5JN+wnSBYjzuPUNJa1gCULctJyrdD7ceBbxMdMPm+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hsal.es;
	spf=pass smtp.mailfrom=hsal.es;
	dkim=pass header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=MwhdiGBv;
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421F4606A335
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 421F4606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hsal.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=MwhdiGBv
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jKSCR23GHzKsmf;
	Wed, 04 Nov 2026 15:15:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hsal.es; s=MBO0001;
	t=1793801747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zVi93CQ//2euCCyPaFsK8UkBI2G8pXdx8HSh695art4=;
	b=MwhdiGBvuUxo5PE8IxLcZgme49NogT73Vk4A2wsFg5DttJbibzw536dTAqkD3wN+4Y9oq5
	jSVjw1rK5CAnl5SzbZ8uPJnXlNRdxpaC8pl/7ak0+oUeI/3q3F+t0NFwhLMyE0wC6Oj5OF
	5OrkI+efi13TWeXTVLFsGq7TRyKQyiDcf1ima0s5AISfJRczpLsKh6muLDqTgWQ5pWi3pZ
	MuquHR5XsFBI6ISGx2FzQdHqGd5JiS02/CUiCGm2nvsmbOz/NtrFtsmXMfNdBmCu/jloHy
	T/WdQ6Mmqzf0kGwLuRj2tqqmXlyn8TrffLuusvpP9bcl5/D0fm46/v0O0StV3w==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hugo@hsal.es designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=hugo@hsal.es
From: Hugo Sales <hugo@hsal.es>
Date: Tue,  3 Nov 2026 13:15:57 +0000
Subject: [PATCH RFT 1/3] drm/amd/display: Add the AUX backlight minimum
 once on the custom curve
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
Message-Id: <20261103-amdgpu-aux-curve-min-v1-1-62119efdcc6d@hsal.es>
References: <20261103-amdgpu-aux-curve-min-v1-0-62119efdcc6d@hsal.es>
In-Reply-To: <20261103-amdgpu-aux-curve-min-v1-0-62119efdcc6d@hsal.es>
To: alexander.deucher@amd.com, siqueira@igalia.com, harry.wentland@amd.com, 
 amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com
Cc: Hugo Sales <hugo@hsal.es>, alex.hung@amd.com, roman.li@amd.com, 
 mario.limonciello@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
 linux-kernel@vger.kernel.org, bhawanpreet.lakha@amd.com, 
 dri-devel@lists.freedesktop.org, ray.wu@amd.com, simona@ffwll.ch
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4951; i=hugo@hsal.es;
 h=from:subject:message-id; bh=S1PGp9r4Q3l/5GOSMK/I4o0ZnP86M0ymnis45ePDhss=;
 b=owJ4nJvAy8zAJVbLU7f+5A3TBYyn1ZIYsl7eazapMs5JWPSrR2j9mySbF1+Ndnwo/v8ltf3sI
 4Gaon/v5l7sKGVhEONikBVTZNG94cnAMnHyzJyi50tg5rAygQxh4OIUgImwdDMyvNn1fmOm/K9T
 nquf7d6trrVgweKvNxdYnpjCdmtT39N9F2UY/hf1bWQ0CKuc+zWGWexFv8KUn2/a1k8vCTC7OyX
 c956fBBsAXppSkQ==
X-Developer-Key: i=hugo@hsal.es; a=openpgp;
 fpr=193D095149CF7E8737B39064D912B0DB205A91C1
X-Rspamd-Queue-Id: 4jKSCR23GHzKsmf

On an AUX backlight, convert_brightness_from_user() maps the user level
through the ATIF custom brightness curve with
convert_custom_brightness(), which rescales the result to
user_min..user_max. convert_brightness_from_user() then rescales it
again, from 0..user_max to user_min..user_max, so the minimum goes in
twice. On the 1..512 nits AUX fallback range, a request for 0 gives
1998 millinits instead of 1000

Rescale the curve's output to 0..user_max and leave the offset to the
caller

Fixes: 16dc8bc27c2aa ("drm/amd/display: Export full brightness range to userspace")
Signed-off-by: Hugo Sales <hugo@hsal.es>
---
I saw this on my laptop, an ASUS ROG Flow X13 GV301QH, with 7.2.9, when
PWM still went through this code: the amdgpu_dm_brightness trace showed
requested=0 converted=6023, where 3084 is the minimum. Commit
d422a66847a9 ("drm/amd/display: map PWM brightness through custom
backlight curve"), in 7.2.10, moved PWM off this path, but on current
kernels it still hits an AUX panel with an ATIF curve. On older stable
kernels this fixes PWM too

With amdgpu.backlight=1, which forces AUX, the GV301QH uses the 1..512
nits fallback range. There the floor goes from 1998 to 1000 millinits,
the midpoint from 159999 to 159310 and the top from 496000 to 495968.
The rounding of the level to 8 bits and of the luminance to a whole
percent stays as it is

No existing test changes: they all run with a minimum of 0, where adding
it twice makes no difference. Patch 3 adds one with a non-zero minimum
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c    |  9 ++++-----
 .../amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c | 14 +++++++-------
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
index 27546febf90d3..8b49cbcde91cd 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
@@ -122,10 +122,10 @@ static inline u32 scale_input_to_fw(int max, u64 input)
 	return DIV_ROUND_CLOSEST_ULL(input * AMDGPU_MAX_BL_LEVEL, max);
 }
 
-/* Rescale from [0..AMDGPU_MAX_BL_LEVEL] to [min..max] */
-static inline u32 scale_fw_to_input(int min, int max, u64 input)
+/* Rescale from [0..AMDGPU_MAX_BL_LEVEL] to [0..max] */
+static inline u32 scale_fw_to_input(int max, u64 input)
 {
-	return min + DIV_ROUND_CLOSEST_ULL(input * (max - min), AMDGPU_MAX_BL_LEVEL);
+	return DIV_ROUND_CLOSEST_ULL(input * max, AMDGPU_MAX_BL_LEVEL);
 }
 
 static u32 backlight_signal_to_luminance(const struct amdgpu_dm_backlight_caps *caps,
@@ -251,8 +251,7 @@ void convert_custom_brightness(const struct amdgpu_dm_backlight_caps *caps,
 						    (brightness - lower_signal),
 						    upper_signal - lower_signal);
 scale:
-	*user_brightness = scale_fw_to_input(min, max,
-					     DIV_ROUND_CLOSEST(lum * brightness, 101));
+	*user_brightness = scale_fw_to_input(max, DIV_ROUND_CLOSEST(lum * brightness, 101));
 }
 
 EXPORT_IF_KUNIT(convert_custom_brightness);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c
index c6d15fb8ad989..2d7a07d9ad874 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c
@@ -1125,10 +1125,10 @@ static void dm_test_custom_brightness_exact_match(struct kunit *test)
 
 	/*
 	 * Exact match: lum=50, brightness_scaled=128
-	 * result = scale_fw_to_input(min, max, DIV_ROUND_CLOSEST(50*128, 101))
-	 *        = scale_fw_to_input(0, 65535, DIV_ROUND_CLOSEST(6400, 101))
-	 *        = scale_fw_to_input(0, 65535, 63)
-	 *        = 0 + DIV_ROUND_CLOSEST(63 * 65535, 255) = 16191 (approx)
+	 * result = scale_fw_to_input(max, DIV_ROUND_CLOSEST(50*128, 101))
+	 *        = scale_fw_to_input(65535, DIV_ROUND_CLOSEST(6400, 101))
+	 *        = scale_fw_to_input(65535, 63)
+	 *        = DIV_ROUND_CLOSEST(63 * 65535, 255) = 16191 (approx)
 	 */
 	KUNIT_EXPECT_TRUE(test, brightness != 32896);
 	KUNIT_EXPECT_TRUE(test, brightness < 32896);
@@ -1171,9 +1171,9 @@ static void dm_test_custom_brightness_below_first(struct kunit *test)
 
 	/*
 	 * Below first data point: lum = DIV_ROUND_CLOSEST(40 * 50, 100) = 20
-	 * Then: scale_fw_to_input(0, 65535, DIV_ROUND_CLOSEST(20 * 50, 101))
-	 *      = scale_fw_to_input(0, 65535, DIV_ROUND_CLOSEST(1000, 101))
-	 *      = scale_fw_to_input(0, 65535, 10)
+	 * Then: scale_fw_to_input(65535, DIV_ROUND_CLOSEST(20 * 50, 101))
+	 *      = scale_fw_to_input(65535, DIV_ROUND_CLOSEST(1000, 101))
+	 *      = scale_fw_to_input(65535, 10)
 	 * The output should be significantly less than input.
 	 */
 	KUNIT_EXPECT_TRUE(test, brightness < 12850);

-- 
2.56.0

