Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786133;
	b=iaCcleo2CRznbUxJL1ybg+RUMXYxt10Pk59Gcy8sz6Fkjy8dNZW6vrWN14PDW/HZreYA
	 BfDxpZ3Y8kSZsxtZNtAKQHczJzowiWIbF5wGYfntPngxedac20NogEAbYCW8REkM+BwEC
	 +Ba0HegRk+SFKatqOq95bbZRUXiQiXiY223m7TtpKpWBpTSM8VoznSLZRvcy4xzbIbyzy
	 synF+UIOiD2ozIFx0N7mpFKhEzIjNTaUCgqeDsoeP3MWJEmfiRPTynRph0268pjulJgQO
	 KmrLZWpNO4VFxIR60kFYZFks3vpU9klEq+j5Ihv4QsUGKn983z+cThNiGd1hiXTcOeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786133;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=nEzm0f9wIfJEdapVfEq9CE/LOLIcXbtblnU6tynrdyA=;
	b=AKUTZyQjr8Q3wjxTnWbPfEM1NWqrr6rOg4JXQI1Ft9nHNL7r0u3viuD0FCoBpnhtv/EV
	 5xGRKIwiQfCmmnrCHJwU1770T6h60sIlRO6+ZiUFqo93kFtsvcjNIeZVq5GXLvJk3jH0t
	 8AgEBahpLiLKaloYj+VOWKA76xPPeJmNV8CzifE16+kx9abtQ9SBXspcspInnqMRFfVEn
	 hYsNVZFY+QiQasxIVxqMetdgyYZ8PjiA+UZ9n4snoXOitlf8tqgKCr15eOgyQvQ2wmCXP
	 AJ5M2C8029gT+hbEPYt+VJCBbAGtqg5j3jHP+w2so/A6BN7qGZmP5Dy3k9Ri8UsAArw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hsal.es;
	spf=pass smtp.mailfrom=hsal.es;
	dkim=pass header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=G5ShxsmN;
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80B2606A33F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C80B2606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hsal.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=G5ShxsmN
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jKLR00h0wzKshv;
	Wed, 04 Nov 2026 10:55:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hsal.es; s=MBO0001;
	t=1793786124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nEzm0f9wIfJEdapVfEq9CE/LOLIcXbtblnU6tynrdyA=;
	b=G5ShxsmNKBATmZQRW7cTRdHK9/895xLoBX1VdSxG/340BxyJxgWwRjKETQodNCklUtGJp4
	1w92++pVtctxvUdByOzxMBD77aCaCRo4vBSPvFBOcb7+eLej5V12pCooGLGb17d6oV/gKp
	1jiu3IJV/nAmMwgQI9sBp1NUAH9sHcKtm2y+t6dAuR6+6wCkoZ6jCR2uq7FUDU2+wGu1vg
	IIpAmZnv858fMLkbOPUWHsI2vqKCMjlSwDaYwoYLw7sfw010zbueoGIo8kZeM7/Bm1m2dO
	cqiRC6QYECtHnN7ELAKX2/l0hBFcaW0+siClsfujBrB4CSU/bXi3boUgvOpR+w==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hugo@hsal.es designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=hugo@hsal.es
From: Hugo Sales <hugo@hsal.es>
To: alexander.deucher@amd.com,
	sunpeng.li@amd.com,
	harry.wentland@amd.com,
	siqueira@igalia.com,
	amd-gfx@lists.freedesktop.org
Cc: Hugo Sales <hugo@hsal.es>,
	ray.wu@amd.com,
	simona@ffwll.ch,
	alex.hung@amd.com,
	mario.limonciello@amd.com,
	linux-kernel@vger.kernel.org,
	lohita.mudimela@amd.com,
	bhawanpreet.lakha@amd.com,
	dri-devel@lists.freedesktop.org,
	roman.li@amd.com,
	airlied@gmail.com,
	christian.koenig@amd.com
Subject: [PATCH RFC RFT 3/8] drm/amd/display: Interpolate when reading PWM back as a percentage
Date: Wed,  4 Nov 2026 09:55:11 +0000
Message-ID: <20261103-backlight-curve-rfc-v1-3-6e4813a8f2eb@hsal.es>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103-backlight-curve-rfc-v1-0-6e4813a8f2eb@hsal.es>
References: <20261103-backlight-curve-rfc-v1-0-6e4813a8f2eb@hsal.es>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3255; i=hugo@hsal.es; h=from:subject:message-id; bh=HyET8yh6KxhaLvP97OZzQMRmQctJKYkCURBLUwScGt8=; b=owJ4nJvAy8zAJVbLU7f+5A3TBYyn1ZIYsl7xRPkEltiWRfG0eHOvYXr55tJb30cnH2xJlFj40 +ixave1zBkdpSwMYlwMsmKKLLo3PBlYJk6emVP0fAnMHFYmkCEMXJwCMBEOM4a/Iu+2PsqboXo7 ISDn0OXpZ1QLos9NtDewPxg5JWVTsYDIAUaGqawdHdVKYTeWz+K6LW45f9KStTs27p657GHbvFn XSm/c4AcAZWJMKQ==
X-Developer-Key: i=hugo@hsal.es; a=openpgp; fpr=193D095149CF7E8737B39064D912B0DB205A91C1
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jKLR00h0wzKshv

backlight_pwm_to_millipercent_legacy() finds the closest backlight_lut
entry and returns its whole percent. That was the exact inverse while
backlight_millipercent_to_pwm_legacy() only returned LUT entries. Now
that it interpolates, a request of 1.5% programs a PWM halfway between
two entries, which reads back as 1% or 2%, and setting the value read
back moves the backlight by up to half a LUT step

Interpolate between the two entries around the PWM instead. A PWM equal
to a LUT entry still reads back as that entry's whole percent

Signed-off-by: Hugo Sales <hugo@hsal.es>
---
Converting a percentage to PWM, back, and to PWM again now moves the
PWM by about a two-thousandth of the LUT step around it, plus rounding.
On the GV301QH LUT, whose steps are at most 1799, that keeps every PWM
within 1 of where it started. A curve with much wider steps can move
further, but by far less than the half step it could before

KUnit: dm_test_pwm_lut_readback from patch 6 fails without this patch
and passes with it
---
 .../gpu/drm/amd/display/modules/power/power_abm.c  | 33 ++++++++--------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/power/power_abm.c b/drivers/gpu/drm/amd/display/modules/power/power_abm.c
index d9c1f1401b604..83d79c20281ec 100644
--- a/drivers/gpu/drm/amd/display/modules/power/power_abm.c
+++ b/drivers/gpu/drm/amd/display/modules/power/power_abm.c
@@ -409,34 +409,23 @@ static unsigned int backlight_pwm_to_millipercent_legacy(
 			break;
 	}
 
-	/* In this case, exact match is not found. Check if mid/min/max
-	 * value is actually closer.
-	 */
+	/* No exact match, so on a sorted LUT lut[max] < pwm < lut[min] */
 	if (max < min) {
-		unsigned int min_delta;
-		unsigned int mid_delta;
-		unsigned int max_delta;
-
-		min_delta = (core_power->bl_prop[inst].backlight_lut[min] > pwm) ?
-				core_power->bl_prop[inst].backlight_lut[min] - pwm :
-				pwm - core_power->bl_prop[inst].backlight_lut[min];
-
-		mid_delta = (core_power->bl_prop[inst].backlight_lut[mid] > pwm) ?
-				core_power->bl_prop[inst].backlight_lut[mid] - pwm :
-				pwm - core_power->bl_prop[inst].backlight_lut[mid];
+		unsigned int lower = core_power->bl_prop[inst].backlight_lut[max];
+		unsigned int upper = core_power->bl_prop[inst].backlight_lut[min];
+		unsigned long long span, den;
 
-		max_delta = (core_power->bl_prop[inst].backlight_lut[max] > pwm) ?
-				core_power->bl_prop[inst].backlight_lut[max] - pwm :
-				pwm - core_power->bl_prop[inst].backlight_lut[max];
+		if (pwm <= lower || pwm >= upper)
+			return BACKLIGHT_MILLIPERCENT_MAX * mid / max_index;
 
-		if ((min_delta < mid_delta) && (min_delta < max_delta))
-			mid = min;
+		span = upper - lower;
+		den = span * max_index;
 
-		if ((max_delta < mid_delta) && (max_delta < min_delta))
-			mid = max;
+		/* LUT entries fit in 16 bits, so this stays far below 2^64 */
+		return (unsigned int)div64_u64((max * span + pwm - lower) *
+					       BACKLIGHT_MILLIPERCENT_MAX + den / 2, den);
 	}
 
-	/* No interpolation, just take closest index */
 	millipercent = BACKLIGHT_MILLIPERCENT_MAX * mid / max_index;
 
 	return millipercent;

-- 
2.56.0

