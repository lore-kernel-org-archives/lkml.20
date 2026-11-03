Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801752;
	b=jg1Adx3dCR5QBAPUgrQiYE6QrPvbBbWL1v7lMUjG9mKsoUF6xZmw0QyWNRqCh2xgGMEr
	 w4nwhEtij2u4ecw8pNinLdtj+1HqnDeUYM3QRi3WkuSuY4cxdigSH544ph4Ytq6G5syIP
	 SXijtD/boXYhje54K7qdL+VsGR0/wvH+6VBrlI6XGC3KpRbpcHeLaBzDIe42HBV8r2aDW
	 /l17PyKAoTl3ji1/rmO4W8BGp+X0d9mR2KRGa8SdPCHthpgbo+PuBEO3QzAKcNzbyaVt5
	 QpmZUalq6LRnZ4aAw4ouet32Jpv7SGDZ2G2Z0qLk8bwXos/oIFmDfmuqLes7PrPSITA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801752;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Rspamd-Queue-Id;
	bh=61OBeqiFBu30MiaeAKFOZife1aseAGNq84UZZcG7jsA=;
	b=4a5lqAv4TuI7/ERZbqTtDZJw4ZEmiWcU8Q9mUdAeq1HouK/Liht58twQ0CiNxTUd3Sn3
	 LQJaUkDflHqJupGxb85SWSCdmSngN9rhBDWCr+SmXjrH7hEjuBna1qJd38Fl8G86cSd08
	 m48buXgtA3xb6B/4yW5F+WmueKX7xS1lQ5HKh9WvZQ36Px4jGXTGzySSQf3GjxLctpW3x
	 wKxnpD8TeARwGywPkoGtlo2RMsW0wtRt00jY/2oBrCmK/KpwnyVHjBvMUkRRGCi3vP4PK
	 JOLIj4sw2n0Oojt6g+UHhu/SoySv9MST5lqqOuy5+1EVnjv6dhFjfE8NZoijuwREoAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hsal.es;
	spf=pass smtp.mailfrom=hsal.es;
	dkim=pass header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=s4OLVzoQ;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6409E606A339
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6409E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hsal.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=s4OLVzoQ
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jKSCS2MbLzKpBT;
	Wed, 04 Nov 2026 15:15:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hsal.es; s=MBO0001;
	t=1793801748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=61OBeqiFBu30MiaeAKFOZife1aseAGNq84UZZcG7jsA=;
	b=s4OLVzoQcDygH2ICHwQ2wouk35suwUbWHy3geF8twx3B5xGiMQjqdHcUjjYMS4fkGHQw3v
	m4OiqnrsopcTNt1x2imlj+gsiochXcUo3oc10uc7a4PElvL1Egpoy1fRJKTT9wGkW2shqi
	XPqwnrishbiOe1FhbfKcOnrvPBxqmjS+fdtEHousSacORVFMZcl8N88O7U6R1e/S/RIVoP
	LVBrdYta6pswAfQ3HQywjN3vNGlTFFqNZZYHnvrC4/lZgLbt1iELQz7QuBfckLdPGYIkkd
	Tsi63couOhG5eU1m2XDLUj/lCr0izoaew4/xqxadugLGrUU8Ee1SjolPD8D57g==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hugo@hsal.es designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=hugo@hsal.es
From: Hugo Sales <hugo@hsal.es>
Date: Tue,  3 Nov 2026 13:15:58 +0000
Subject: [PATCH RFT 2/3] drm/amd/display: Drop the unused min argument of
 convert_custom_brightness()
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-amdgpu-aux-curve-min-v1-2-62119efdcc6d@hsal.es>
References: <20261103-amdgpu-aux-curve-min-v1-0-62119efdcc6d@hsal.es>
In-Reply-To: <20261103-amdgpu-aux-curve-min-v1-0-62119efdcc6d@hsal.es>
To: alexander.deucher@amd.com, siqueira@igalia.com, harry.wentland@amd.com, 
 amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com
Cc: Hugo Sales <hugo@hsal.es>, alex.hung@amd.com, roman.li@amd.com, 
 mario.limonciello@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
 linux-kernel@vger.kernel.org, bhawanpreet.lakha@amd.com, 
 dri-devel@lists.freedesktop.org, ray.wu@amd.com, simona@ffwll.ch
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5639; i=hugo@hsal.es;
 h=from:subject:message-id; bh=/7p+iESSZHE/QMZNc977HAfsEuJmUySb0GH+smRVVSc=;
 b=owJ4nJvAy8zAJVbLU7f+5A3TBYyn1ZIYsl7ea95e3fo8WzOitj5Tx/awceSFa9V24crZ3Bkhp
 vZx5mnrz3SUsjCIcTHIiimy6N7wZGCZOHlmTtHzJTBzWJlAhjBwcQrARNI5GBn+7VxquGRu7NO8
 k/vWVd67Lvah5KtV46bWtkZN14Wy/348YGT4uqWgu047r/p1q87LZx0Hzl+TnyPl2vbsvdMDiWN
 PrzZxAgCFJU68
X-Developer-Key: i=hugo@hsal.es; a=openpgp;
 fpr=193D095149CF7E8737B39064D912B0DB205A91C1
X-Rspamd-Queue-Id: 4jKSCS2MbLzKpBT

convert_custom_brightness() rescales the curve's output to 0..max since
the previous patch and no longer reads min

Signed-off-by: Hugo Sales <hugo@hsal.es>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c  |  5 ++---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.h  |  3 +--
 .../display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c   | 16 ++++++++--------
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
index 8b49cbcde91cd..cef2ad8fea74d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
@@ -192,8 +192,7 @@ static u32 convert_brightness_to_millipercent(const struct amdgpu_dm_backlight_c
 
 STATIC_IFN_KUNIT
 void convert_custom_brightness(const struct amdgpu_dm_backlight_caps *caps,
-			       unsigned int min, unsigned int max,
-			       uint32_t *user_brightness)
+			       unsigned int max, uint32_t *user_brightness)
 {
 	u32 brightness = scale_input_to_fw(max, *user_brightness);
 	u8 lower_signal, upper_signal, upper_lum, lower_lum, lum;
@@ -265,7 +264,7 @@ u32 convert_brightness_from_user(const struct amdgpu_dm_backlight_caps *caps,
 	if (!get_brightness_range(caps, &min, &max))
 		return brightness;
 
-	convert_custom_brightness(caps, min, max, &brightness);
+	convert_custom_brightness(caps, max, &brightness);
 
 	/* Rescale 0..max to min..max */
 	return min + DIV_ROUND_CLOSEST_ULL((u64)(max - min) * brightness, max);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.h
index 9ad888d3ae7b2..32ba2f8efb33b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.h
@@ -68,8 +68,7 @@ ssize_t panel_power_savings_store(struct device *device,
 int get_brightness_range(const struct amdgpu_dm_backlight_caps *caps,
 			 unsigned int *min, unsigned int *max);
 void convert_custom_brightness(const struct amdgpu_dm_backlight_caps *caps,
-			       unsigned int min, unsigned int max,
-			       uint32_t *user_brightness);
+			       unsigned int max, uint32_t *user_brightness);
 u32 convert_brightness_from_user(const struct amdgpu_dm_backlight_caps *caps,
 				 uint32_t brightness);
 u32 convert_brightness_to_user(const struct amdgpu_dm_backlight_caps *caps,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c
index 2d7a07d9ad874..f1a558516cd8b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c
@@ -1054,7 +1054,7 @@ static void dm_test_custom_brightness_no_data_points(struct kunit *test)
 
 	caps.data_points = 0;
 
-	convert_custom_brightness(&caps, 3084, 65535, &brightness);
+	convert_custom_brightness(&caps, 65535, &brightness);
 
 	/* No data points → no-op */
 	KUNIT_EXPECT_EQ(test, brightness, saved);
@@ -1078,7 +1078,7 @@ static void dm_test_custom_brightness_debug_mask_disables(struct kunit *test)
 	/* Set the disable flag */
 	amdgpu_dm_set_dc_debug_mask(amdgpu_dm_get_dc_debug_mask() | DC_DISABLE_CUSTOM_BRIGHTNESS_CURVE);
 
-	convert_custom_brightness(&caps, 3084, 65535, &brightness);
+	convert_custom_brightness(&caps, 65535, &brightness);
 
 	/* Should be no-op due to debug mask */
 	KUNIT_EXPECT_EQ(test, brightness, saved);
@@ -1121,7 +1121,7 @@ static void dm_test_custom_brightness_exact_match(struct kunit *test)
 	 */
 	brightness = 32896;
 
-	convert_custom_brightness(&caps, min, max, &brightness);
+	convert_custom_brightness(&caps, max, &brightness);
 
 	/*
 	 * Exact match: lum=50, brightness_scaled=128
@@ -1167,7 +1167,7 @@ static void dm_test_custom_brightness_below_first(struct kunit *test)
 	 */
 	brightness = 12850;
 
-	convert_custom_brightness(&caps, min, max, &brightness);
+	convert_custom_brightness(&caps, max, &brightness);
 
 	/*
 	 * Below first data point: lum = DIV_ROUND_CLOSEST(40 * 50, 100) = 20
@@ -1211,7 +1211,7 @@ static void dm_test_custom_brightness_interpolation(struct kunit *test)
 	 */
 	brightness = 32125;
 
-	convert_custom_brightness(&caps, min, max, &brightness);
+	convert_custom_brightness(&caps, max, &brightness);
 
 	/*
 	 * The function should interpolate between data points and produce
@@ -1254,7 +1254,7 @@ static void dm_test_custom_brightness_above_last(struct kunit *test)
 	 */
 	brightness = 56533;
 
-	convert_custom_brightness(&caps, min, max, &brightness);
+	convert_custom_brightness(&caps, max, &brightness);
 
 	/* Output should differ from input (remapped via curve) */
 	KUNIT_EXPECT_TRUE(test, brightness != 56533);
@@ -1292,7 +1292,7 @@ static void dm_test_custom_brightness_single_data_point(struct kunit *test)
 	 */
 	brightness = 16448;
 
-	convert_custom_brightness(&caps, min, max, &brightness);
+	convert_custom_brightness(&caps, max, &brightness);
 
 	KUNIT_EXPECT_TRUE(test, brightness < 16448);
 
@@ -1330,7 +1330,7 @@ static void dm_test_custom_brightness_lower_lum_zero(struct kunit *test)
 	 */
 	brightness = 32125;
 
-	convert_custom_brightness(&caps, min, max, &brightness);
+	convert_custom_brightness(&caps, max, &brightness);
 
 	/* Should remap; result should differ from input */
 	KUNIT_EXPECT_TRUE(test, brightness != 32125);

-- 
2.56.0

