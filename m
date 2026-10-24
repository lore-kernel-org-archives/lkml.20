Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792805629;
	b=vITTpZmKlkbfCu1qu837powDHd/KOB6Vf8REREB/eeMkvF3mAtaOJDrWQnNIYupI6O/U
	 DOgQ8mS6EksIj2ax0tfQWrhh8dxaj2qTZC6WL6WQkq/3hTt5x8uoEDaF9nvTgsarmAkiH
	 VKlWl/fAvHYP/LB2aJwyuxwf8GQIGntvLLYYUaY1UQ97jWvHyQqxFjpG0pNnzOHDHkZNF
	 ozw65QiioiU+kTf+xuKralz6D/cJFuSCdfDM+3kaXV33iL5ynviyKoUF1AlFb3qEfx3hP
	 4aUwnodiAZMlwqi7GNDtNhGc5EeHpp6obbL+boyR70DwTNnn6uFT18CLOTgQ1VbXj+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792805629;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=b4pf2WxrjoiB/I5SjNfdoKPGcUXYjRelg0jICQe0YCg=;
	b=RUTGc/nXvm+7BEtTK7PJHNkSLGDiElRETJhL2J31cWYQHgufa/ZiJXhQlGkob6xwgaIK
	 B2brhxB7mfoTT02nuuqj4HW2EhfHaBepoeLiGWbPW92pYXoJu0dPt/f2IdoBqgBr/BZQf
	 +OiPIvYEZHCgnj82F1V3WGa71zxyAaaqUzUlbbyssDBXUYUqqLhPonXCIsD+OZFSUEl0d
	 nWSKvFzSryJ2ROKirLlxh9ZI68JiRQb0C5ZcAg0oIBkOOJPxJ05ggjsfQrWVB8ugP8Tcd
	 oGpVAQnJAMETsUQo3+mSdbO0R0zDq3QrzrXTszcaLktNDcQrKiYkUsuG7C5W4eT7N7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=empyreal.works;
	spf=pass smtp.mailfrom=empyreal.works;
	dkim=pass header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b="djI+/Fs1";
	arc=none smtp.remote-ip=109.224.244.21
Received: from mail-24421.protonmail.ch (mail-24421.protonmail.ch [109.224.244.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3735606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3735606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=empyreal.works
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=empyreal.works
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b=djI+/Fs1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=empyreal.works;
	s=protonmail2; t=1792805626; x=1793064826;
	bh=b4pf2WxrjoiB/I5SjNfdoKPGcUXYjRelg0jICQe0YCg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=djI+/Fs11uQr5FDYnD2fmQojAZfuukbUEH8KfXAcQV7MRkyaz5GQBZkeOnTU3qcll
	 2kWoiReWMi3iz02I9Twt4GoZdcXtmA/J3ncn2snl7OlQmloaYUgPaZQFfI+qN3TV0T
	 a2+G/u7ZYKLljhqKNW7mF/q3Dz2q/07PMpnAm9dTYMbUnGd7QPEucFrIs5n6OHVqZX
	 nZ/ycQ/A8OY4aH73ndDVvMDQV3fqNgkMAXgFucWpAHWV4ri/nH2pAVuF6yV/kvQdYM
	 nEM+bHowjU1zZaEzmqAkHhPC4gFUJGs8+5r0c93V69fdGatwAXFNm1xTrKX43ndnPJ
	 oTEE7hV1HInog==
Date: Sat, 24 Oct 2026 01:33:43 +0000
To: amd-gfx@lists.freedesktop.org
From: Andrei Rusu de Castro <arc@empyreal.works>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, alex.hung@amd.com, roman.li@amd.com, mario.limonciello@amd.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, chen-yu.chen@amd.com, ray.wu@amd.com
Subject: [PATCH v3 2/2] drm/amd/display: test custom brightness with non-zero minimum
Message-ID: <a896f516c52d247653ef35720719b9bc06c0ce68.1792805565.git.arc@empyreal.works>
In-Reply-To: <cover.1792805565.git.arc@empyreal.works>
References: <20260902-brightness-cover-abf809f2@empyreal.works> <cover.1788388049.git.arc@empyreal.works> <cover.1792805565.git.arc@empyreal.works>
Feedback-ID: 182420409:user:proton
X-Pm-Message-ID: 8b5a122c0615c4049cec610c88e4b908b4bb1caf
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The existing custom-curve tests use min_input_signal =3D=3D 0. In that
configuration the firmware minimum is zero and an extra [0..max] to
[min..max] conversion is an identity, so the output-side double scaling
cannot be observed.

Add a curve using the default non-zero PWM minimum. Cover the helper's
userspace-domain result, zero and maximum endpoints, interpolation,
monotonicity, range bounds, zero round-trip, agreement with the linear
path at zero, and the unchanged no-curve path.

Six of the nine new cases fail against the pre-fix arithmetic. The other
three retain endpoint and linear-path invariants around the repair.

The cases were verified under UML KUnit.

Assisted-by: LLM
Signed-off-by: Andrei Rusu de Castro <arc@empyreal.works>
---
 .../tests/amdgpu_dm_backlight_test.c          | 264 ++++++++++++++++++
 1 file changed, 264 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backligh=
t_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_=
test.c
index 5ff074497..a24991e3a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.=
c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.=
c
@@ -1419,6 +1419,261 @@ static void dm_test_brightness_from_user_with_curve=
(struct kunit *test)
 =09amdgpu_dm_set_dc_debug_mask(saved_mask);
 }
=20
+/*
+ * The custom curve cases above all use min_input_signal =3D=3D 0.  There =
the
+ * firmware minimum is zero and the [0..max] to [min..max] span is the ide=
ntity,
+ * so an extra application of that mapping cannot be observed.  The cases =
below
+ * use the default firmware range instead, where min is 0x101 * 12 =3D=3D =
3084 and
+ * max is 0x101 * 255 =3D=3D 65535.
+ */
+static void dm_test_curve_caps_init(struct amdgpu_dm_backlight_caps *caps)
+{
+=09caps->aux_support =3D false;
+=09caps->min_input_signal =3D AMDGPU_DM_DEFAULT_MIN_BACKLIGHT;
+=09caps->max_input_signal =3D AMDGPU_DM_DEFAULT_MAX_BACKLIGHT;
+=09caps->data_points =3D 3;
+=09caps->luminance_data[0].input_signal =3D 50;
+=09caps->luminance_data[0].luminance =3D 20;
+=09caps->luminance_data[1].input_signal =3D 128;
+=09caps->luminance_data[1].luminance =3D 50;
+=09caps->luminance_data[2].input_signal =3D 255;
+=09caps->luminance_data[2].luminance =3D 100;
+}
+
+/**
+ * dm_test_custom_brightness_user_domain - Curve output is a userspace val=
ue
+ * @test: The KUnit test context
+ *
+ * convert_custom_brightness() reshapes a value inside the userspace [0..m=
ax]
+ * domain.  Its caller owns the single conversion to the firmware [min..ma=
x]
+ * domain, so the firmware minimum must not appear in this result.
+ */
+static void dm_test_custom_brightness_user_domain(struct kunit *test)
+{
+=09struct amdgpu_dm_backlight_caps caps =3D {};
+=09uint saved_mask =3D amdgpu_dm_get_dc_debug_mask();
+=09unsigned int min, max;
+=09u32 brightness;
+
+=09amdgpu_dm_set_dc_debug_mask(saved_mask & ~DC_DISABLE_CUSTOM_BRIGHTNESS_=
CURVE);
+=09dm_test_curve_caps_init(&caps);
+=09get_brightness_range(&caps, &min, &max);
+
+=09/* Zero stays zero; it is not lifted to the firmware minimum here. */
+=09brightness =3D 0;
+=09convert_custom_brightness(&caps, max, &brightness);
+=09KUNIT_EXPECT_EQ(test, brightness, (u32)0);
+
+=09/* The top of the curve stays inside the userspace range. */
+=09brightness =3D max;
+=09convert_custom_brightness(&caps, max, &brightness);
+=09KUNIT_EXPECT_LE(test, brightness, (u32)max);
+
+=09amdgpu_dm_set_dc_debug_mask(saved_mask);
+}
+
+/**
+ * dm_test_curve_from_user_zero_is_min - Zero maps to the firmware minimum
+ * @test: The KUnit test context
+ *
+ * Zero is the darkest level userspace can ask for and must reach the dark=
est
+ * level the firmware accepts.
+ */
+static void dm_test_curve_from_user_zero_is_min(struct kunit *test)
+{
+=09struct amdgpu_dm_backlight_caps caps =3D {};
+=09uint saved_mask =3D amdgpu_dm_get_dc_debug_mask();
+=09unsigned int min, max;
+
+=09amdgpu_dm_set_dc_debug_mask(saved_mask & ~DC_DISABLE_CUSTOM_BRIGHTNESS_=
CURVE);
+=09dm_test_curve_caps_init(&caps);
+=09get_brightness_range(&caps, &min, &max);
+
+=09KUNIT_EXPECT_EQ(test, convert_brightness_from_user(&caps, 0), (u32)min)=
;
+
+=09amdgpu_dm_set_dc_debug_mask(saved_mask);
+}
+
+/**
+ * dm_test_curve_from_user_matches_linear_at_zero - Curve keeps the lower =
endpoint
+ * @test: The KUnit test context
+ *
+ * The curve reshapes the interior of the range.  It does not move either
+ * endpoint, so the curved and linear paths must agree at zero.
+ */
+static void dm_test_curve_from_user_matches_linear_at_zero(struct kunit *t=
est)
+{
+=09struct amdgpu_dm_backlight_caps caps =3D {};
+=09uint saved_mask =3D amdgpu_dm_get_dc_debug_mask();
+=09u32 with_curve, without_curve;
+
+=09dm_test_curve_caps_init(&caps);
+
+=09amdgpu_dm_set_dc_debug_mask(saved_mask & ~DC_DISABLE_CUSTOM_BRIGHTNESS_=
CURVE);
+=09with_curve =3D convert_brightness_from_user(&caps, 0);
+
+=09amdgpu_dm_set_dc_debug_mask(saved_mask | DC_DISABLE_CUSTOM_BRIGHTNESS_C=
URVE);
+=09without_curve =3D convert_brightness_from_user(&caps, 0);
+
+=09KUNIT_EXPECT_EQ(test, with_curve, without_curve);
+
+=09amdgpu_dm_set_dc_debug_mask(saved_mask);
+}
+
+/**
+ * dm_test_curve_from_user_round_trip_zero - Zero survives a conversion ro=
und trip
+ * @test: The KUnit test context
+ */
+static void dm_test_curve_from_user_round_trip_zero(struct kunit *test)
+{
+=09struct amdgpu_dm_backlight_caps caps =3D {};
+=09uint saved_mask =3D amdgpu_dm_get_dc_debug_mask();
+=09u32 level;
+
+=09amdgpu_dm_set_dc_debug_mask(saved_mask & ~DC_DISABLE_CUSTOM_BRIGHTNESS_=
CURVE);
+=09dm_test_curve_caps_init(&caps);
+
+=09level =3D convert_brightness_from_user(&caps, 0);
+=09KUNIT_EXPECT_EQ(test, convert_brightness_to_user(&caps, level), (u32)0)=
;
+
+=09amdgpu_dm_set_dc_debug_mask(saved_mask);
+}
+
+/**
+ * dm_test_curve_from_user_interpolation - Interpolated point with a non-z=
ero min
+ * @test: The KUnit test context
+ */
+static void dm_test_curve_from_user_interpolation(struct kunit *test)
+{
+=09struct amdgpu_dm_backlight_caps caps =3D {};
+=09uint saved_mask =3D amdgpu_dm_get_dc_debug_mask();
+
+=09amdgpu_dm_set_dc_debug_mask(saved_mask & ~DC_DISABLE_CUSTOM_BRIGHTNESS_=
CURVE);
+=09dm_test_curve_caps_init(&caps);
+
+=09/*
+=09 * scale_input_to_fw(65535, 25700) =3D DIV_ROUND_CLOSEST(25700 * 255, 6=
5535)
+=09 * =3D 100, which falls between the (50, 20) and (128, 50) points:
+=09 *   lum =3D 20 + DIV_ROUND_CLOSEST((50 - 20) * (100 - 50), 128 - 50) =
=3D 39
+=09 * The curved firmware level is DIV_ROUND_CLOSEST(39 * 100, 101) =3D 39=
,
+=09 * which is DIV_ROUND_CLOSEST(39 * 65535, 255) =3D 10023 in the userspa=
ce
+=09 * domain and 3084 + DIV_ROUND_CLOSEST(62451 * 10023, 65535) =3D 12635
+=09 * once converted to the firmware domain.
+=09 */
+=09KUNIT_EXPECT_EQ(test, convert_brightness_from_user(&caps, 25700), (u32)=
12635);
+
+=09amdgpu_dm_set_dc_debug_mask(saved_mask);
+}
+
+/**
+ * dm_test_curve_from_user_max - The top of the range stays inside the ran=
ge
+ * @test: The KUnit test context
+ */
+static void dm_test_curve_from_user_max(struct kunit *test)
+{
+=09struct amdgpu_dm_backlight_caps caps =3D {};
+=09uint saved_mask =3D amdgpu_dm_get_dc_debug_mask();
+=09unsigned int min, max;
+
+=09amdgpu_dm_set_dc_debug_mask(saved_mask & ~DC_DISABLE_CUSTOM_BRIGHTNESS_=
CURVE);
+=09dm_test_curve_caps_init(&caps);
+=09get_brightness_range(&caps, &min, &max);
+
+=09/*
+=09 * scale_input_to_fw(65535, 65535) =3D 255 matches the last point exact=
ly,
+=09 * so lum =3D 100 and the curved firmware level is
+=09 * DIV_ROUND_CLOSEST(100 * 255, 101) =3D 252.  That is
+=09 * DIV_ROUND_CLOSEST(252 * 65535, 255) =3D 64764 in the userspace domai=
n
+=09 * and 3084 + DIV_ROUND_CLOSEST(62451 * 64764, 65535) =3D 64800 in the
+=09 * firmware domain.
+=09 */
+=09KUNIT_EXPECT_EQ(test, convert_brightness_from_user(&caps, max), (u32)64=
800);
+=09KUNIT_EXPECT_LE(test, convert_brightness_from_user(&caps, max), (u32)ma=
x);
+
+=09amdgpu_dm_set_dc_debug_mask(saved_mask);
+}
+
+/**
+ * dm_test_curve_from_user_monotonic - A rising curve gives a rising level
+ * @test: The KUnit test context
+ */
+static void dm_test_curve_from_user_monotonic(struct kunit *test)
+{
+=09struct amdgpu_dm_backlight_caps caps =3D {};
+=09uint saved_mask =3D amdgpu_dm_get_dc_debug_mask();
+=09unsigned int min, max, i;
+=09u32 previous =3D 0;
+
+=09amdgpu_dm_set_dc_debug_mask(saved_mask & ~DC_DISABLE_CUSTOM_BRIGHTNESS_=
CURVE);
+=09dm_test_curve_caps_init(&caps);
+=09get_brightness_range(&caps, &min, &max);
+
+=09for (i =3D 0; i <=3D max; i +=3D 1023) {
+=09=09u32 level =3D convert_brightness_from_user(&caps, i);
+
+=09=09KUNIT_ASSERT_GE(test, level, previous);
+=09=09previous =3D level;
+=09}
+
+=09KUNIT_EXPECT_GE(test, convert_brightness_from_user(&caps, max), previou=
s);
+
+=09amdgpu_dm_set_dc_debug_mask(saved_mask);
+}
+
+/**
+ * dm_test_curve_from_user_within_range - Curved levels never leave [min..=
max]
+ * @test: The KUnit test context
+ *
+ * The firmware level is programmed through a 16-bit path, so a converted =
value
+ * above max would wrap and darken the panel.
+ */
+static void dm_test_curve_from_user_within_range(struct kunit *test)
+{
+=09struct amdgpu_dm_backlight_caps caps =3D {};
+=09uint saved_mask =3D amdgpu_dm_get_dc_debug_mask();
+=09unsigned int min, max, i;
+
+=09amdgpu_dm_set_dc_debug_mask(saved_mask & ~DC_DISABLE_CUSTOM_BRIGHTNESS_=
CURVE);
+=09dm_test_curve_caps_init(&caps);
+=09get_brightness_range(&caps, &min, &max);
+
+=09for (i =3D 0; i <=3D max; i +=3D 1023) {
+=09=09u32 level =3D convert_brightness_from_user(&caps, i);
+
+=09=09KUNIT_ASSERT_GE(test, level, (u32)min);
+=09=09KUNIT_ASSERT_LE(test, level, (u32)max);
+=09}
+
+=09KUNIT_EXPECT_LE(test, convert_brightness_from_user(&caps, max), (u32)ma=
x);
+
+=09amdgpu_dm_set_dc_debug_mask(saved_mask);
+}
+
+/**
+ * dm_test_from_user_no_curve_unchanged - The linear path is untouched
+ * @test: The KUnit test context
+ *
+ * Without luminance data the conversion is the plain
+ * min + DIV_ROUND_CLOSEST((max - min) * brightness, max) mapping.
+ */
+static void dm_test_from_user_no_curve_unchanged(struct kunit *test)
+{
+=09struct amdgpu_dm_backlight_caps caps =3D {};
+=09unsigned int min, max;
+
+=09caps.aux_support =3D false;
+=09caps.min_input_signal =3D AMDGPU_DM_DEFAULT_MIN_BACKLIGHT;
+=09caps.max_input_signal =3D AMDGPU_DM_DEFAULT_MAX_BACKLIGHT;
+=09caps.data_points =3D 0;
+
+=09get_brightness_range(&caps, &min, &max);
+
+=09KUNIT_EXPECT_EQ(test, convert_brightness_from_user(&caps, 0), (u32)3084=
);
+=09KUNIT_EXPECT_EQ(test, convert_brightness_from_user(&caps, 16383), (u32)=
18696);
+=09KUNIT_EXPECT_EQ(test, convert_brightness_from_user(&caps, 32767), (u32)=
34309);
+=09KUNIT_EXPECT_EQ(test, convert_brightness_from_user(&caps, max), (u32)65=
535);
+}
+
 /**
  * dm_test_brightness_range_zero_signals - Test Brightness range with zero=
 min and max signals
  * @test: The KUnit test context
@@ -1976,6 +2231,15 @@ static struct kunit_case dm_backlight_test_cases[] =
=3D {
 =09KUNIT_CASE(dm_test_brightness_to_user_above_max),
 =09KUNIT_CASE(dm_test_brightness_from_user_midrange),
 =09KUNIT_CASE(dm_test_brightness_from_user_with_curve),
+=09KUNIT_CASE(dm_test_custom_brightness_user_domain),
+=09KUNIT_CASE(dm_test_curve_from_user_zero_is_min),
+=09KUNIT_CASE(dm_test_curve_from_user_matches_linear_at_zero),
+=09KUNIT_CASE(dm_test_curve_from_user_round_trip_zero),
+=09KUNIT_CASE(dm_test_curve_from_user_interpolation),
+=09KUNIT_CASE(dm_test_curve_from_user_max),
+=09KUNIT_CASE(dm_test_curve_from_user_monotonic),
+=09KUNIT_CASE(dm_test_curve_from_user_within_range),
+=09KUNIT_CASE(dm_test_from_user_no_curve_unchanged),
 =09KUNIT_CASE(dm_test_brightness_range_zero_signals),
 =09/* amdgpu_dm_backlight_fill_props */
 =09KUNIT_CASE(dm_test_backlight_fill_props_ac_linear),
--=20
2.56.0


