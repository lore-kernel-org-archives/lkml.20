Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801752;
	b=ZCI3IyZb+PN78oXO4Pt4+2qkwVIE6xWD2v6hLJgG46Cuiq9Mh54uNTci/XtvXY+wOGFF
	 2nOPHxI0kEj1Sasa/qkTXyl1xwgWhEBn8MEKbQ2TST0pDvk4i5GhO6MlCEM20ts8vpmY2
	 /Zl70b8zjTz7OUTqswB3b74wA6yN/l8/xXQnp5OshNlI5so8OSgCdB8l1YEh/lN5n2e5P
	 4GdoCM5c3ESoq+crv1JHBjq74wi2dp7VSHpNSQTkB3B35tL/l/Aj7ECkZy8ArOUduLjd5
	 XK6g4aqwfIXG3WpR6smtpYTj3kHnpUyATle64WA1T3qX+rMyFJxFzyYlZ1m3LEAk7hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801752;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Rspamd-Queue-Id;
	bh=pK5t0q/gxE1Nu6Fm0VfdXEgog8ffotRhenMS/ypUv9s=;
	b=HC7eoUICs89gKo0q02J/Qz1uNXDC4WLWoqhzQiS+SfT+5raTS3DASXZ8hCwJ785rYWxE
	 A32Ch5shj9StqMHdPSabDjohjWykYuvymcd8RQ0Uo6GbammfEPVEsrt/euk8bS6juDcbq
	 FbjGNqUS1uLcah/aTOz+YXn2PAADVGEBRdZGGjPOU3OoX3V7MTO7giJk8rJornMZBZ0sn
	 WobaLDPAehuwaELceHSImo9sI4LmGhVbfZ2FG1BPL/elZThfKncJimaLgOsyp6uyoJ6bj
	 Qt5+neD+eAyc+VDakHlGw0LruOfoWJ1XRixSUjpy2buMV9eRv2IiEgkUoJHSICo3MIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hsal.es;
	spf=pass smtp.mailfrom=hsal.es;
	dkim=pass header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=CT4aCEtT;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606D6606A338
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 606D6606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hsal.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=CT4aCEtT
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jKSCT28bczMlrQ;
	Wed, 04 Nov 2026 15:15:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hsal.es; s=MBO0001;
	t=1793801749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pK5t0q/gxE1Nu6Fm0VfdXEgog8ffotRhenMS/ypUv9s=;
	b=CT4aCEtTiUWpzH3g0EUczSoM2OBOJlYKcRXkP/DVOD26X6NlpRLxMG5uUjmfLHLVtkcKoU
	NqOP8B1zPhtHknGwA6VipdyRcNCFm0emqAJcYze/C5QvE+odJL33Z4j8z6WFCU7kbswXBS
	+cgFR1JZg8pnb1fNy5l7OFo2Ybrv66yiiK70bZKHiufP0Zu03LP4FepXeT40aqjELXzwQp
	HvuWFEhOrdIqD4nPbUR9PQkO/av2JQY5kqwuge8Ei5q0fKImg+t2eeaymXMFQqkHYQXEhR
	SyApSRH3npe70qpGySqxI3sJWmGSqQgqE8W4fYBcXoS6QFU7E7hV0A9NU+ts6g==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hugo@hsal.es designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=hugo@hsal.es
From: Hugo Sales <hugo@hsal.es>
Date: Tue,  3 Nov 2026 13:15:59 +0000
Subject: [PATCH RFT 3/3] drm/amd/display: Add a KUnit test for the custom
 curve minimum
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
Message-Id: <20261103-amdgpu-aux-curve-min-v1-3-62119efdcc6d@hsal.es>
References: <20261103-amdgpu-aux-curve-min-v1-0-62119efdcc6d@hsal.es>
In-Reply-To: <20261103-amdgpu-aux-curve-min-v1-0-62119efdcc6d@hsal.es>
To: alexander.deucher@amd.com, siqueira@igalia.com, harry.wentland@amd.com, 
 amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com
Cc: Hugo Sales <hugo@hsal.es>, alex.hung@amd.com, roman.li@amd.com, 
 mario.limonciello@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
 linux-kernel@vger.kernel.org, bhawanpreet.lakha@amd.com, 
 dri-devel@lists.freedesktop.org, ray.wu@amd.com, simona@ffwll.ch
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3143; i=hugo@hsal.es;
 h=from:subject:message-id; bh=fwMloafcOCb62tF/mTB0iLUFV8bG+uqiU3emqEw7j9A=;
 b=owJ4nJvAy8zAJVbLU7f+5A3TBYyn1ZIYsl7ea97/zJmlxP/AzZzTJ1+YhB740LS9g+PAw0Zr/
 VOv/s6os+vtKGVhEONikBVTZNG94cnAMnHyzJyi50tg5rAygQxh4OIUgIlcbGX47zWh/8OKe7sE
 JswJvvtDftr/vs+75/ZP+cHaIS8vcEzwuA4jwxaxdSynCjXnZ3HwTX7u+CNg8mnbq47vj+uyssz
 8Ei9SzAQA4HRPIA==
X-Developer-Key: i=hugo@hsal.es; a=openpgp;
 fpr=193D095149CF7E8737B39064D912B0DB205A91C1
X-Rspamd-Queue-Id: 4jKSCT28bczMlrQ

Check that convert_brightness_from_user() adds the minimum once with a
custom curve: a request for 0 gives user_min on the AUX and the PWM
range, and half the AUX range matches a value worked out by hand

Signed-off-by: Hugo Sales <hugo@hsal.es>
---
KUnit on UML with PROVE_LOCKING: amdgpu_dm_backlight passes 74 of 74.
Without patch 1 the new test fails with 1998, 131999 and 6023
---
 .../amdgpu_dm/tests/amdgpu_dm_backlight_test.c     | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c
index f1a558516cd8b..3d00cde8c77bc 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c
@@ -1383,6 +1383,45 @@ static void dm_test_brightness_from_user_midrange(struct kunit *test)
 	KUNIT_EXPECT_LE(test, result, max);
 }
 
+/**
+ * dm_test_brightness_from_user_curve_min - Test Custom curve adds the minimum once
+ * @test: The KUnit test context
+ *
+ * On the AUX range of 1..512 nits with points (50, 20%) and (200, 80%), a
+ * request for 0 must give the 1000 millinit minimum, where adding the
+ * minimum twice gave 1998. Half the scale is signal 128, luminance 51%,
+ * so 51 * 128 / 101 = 65 of 255, which is 1000 + 511000 * 65 / 255 =
+ * 131255. A request for 0 on the PWM range with min_input_signal 12 must
+ * give 12 * 0x101
+ */
+static void dm_test_brightness_from_user_curve_min(struct kunit *test)
+{
+	struct amdgpu_dm_backlight_caps caps = {};
+	uint saved_mask = amdgpu_dm_get_dc_debug_mask();
+
+	amdgpu_dm_set_dc_debug_mask(amdgpu_dm_get_dc_debug_mask() &
+				    ~DC_DISABLE_CUSTOM_BRIGHTNESS_CURVE);
+
+	caps.aux_support = true;
+	caps.aux_min_input_signal = 1;
+	caps.aux_max_input_signal = 512;
+	caps.min_input_signal = 12;
+	caps.max_input_signal = AMDGPU_DM_DEFAULT_MAX_BACKLIGHT;
+	caps.data_points = 2;
+	caps.luminance_data[0].input_signal = 50;
+	caps.luminance_data[0].luminance = 20;
+	caps.luminance_data[1].input_signal = 200;
+	caps.luminance_data[1].luminance = 80;
+
+	KUNIT_EXPECT_EQ(test, convert_brightness_from_user(&caps, 0), 1000U);
+	KUNIT_EXPECT_EQ(test, convert_brightness_from_user(&caps, 256000), 131255U);
+
+	caps.aux_support = false;
+	KUNIT_EXPECT_EQ(test, convert_brightness_from_user(&caps, 0), 12U * 0x101);
+
+	amdgpu_dm_set_dc_debug_mask(saved_mask);
+}
+
 /**
  * dm_test_brightness_from_user_with_curve - Test Brightness from user with custom curve active
  * @test: The KUnit test context
@@ -1976,6 +2015,7 @@ static struct kunit_case dm_backlight_test_cases[] = {
 	KUNIT_CASE(dm_test_brightness_to_user_above_max),
 	KUNIT_CASE(dm_test_brightness_from_user_midrange),
 	KUNIT_CASE(dm_test_brightness_from_user_with_curve),
+	KUNIT_CASE(dm_test_brightness_from_user_curve_min),
 	KUNIT_CASE(dm_test_brightness_range_zero_signals),
 	/* amdgpu_dm_backlight_fill_props */
 	KUNIT_CASE(dm_test_backlight_fill_props_ac_linear),

-- 
2.56.0

