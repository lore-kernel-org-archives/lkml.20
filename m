Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786132;
	b=PUewWZxSet44olRShU4B/zusthnpEA112Eie+YA9+WkNK22QATKPy4mB9+zmxi4ilGMP
	 Y6X/XB+90z7oXeI5eMziu1abOjc297ZdDph6HVGDDXCkrg190mbsrJgvheqqX7VqyFJ4h
	 bwqt71Hln7pUWo+Tc873CwNtn8Ezm5xGiAd60WhX8Tok9PybvHSYgoESNgD6SxnYbpi+m
	 VXCYpjn0qs44RrWhbdsrVQLo8lh8QHGRlFd0v8poSUenMG8adHfBNheZQGz/OOhuUf4LD
	 DSno2xV8vgI/Wf+Ymxd9VhM+qNdBRKPi4HhpHQhUcHcKiMZ3lfDpMNqCzmLjM7walNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786132;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=i2FCQmEXZxDKQqcnu9pkHrDLOEfTmGF5gpWGt15wdhI=;
	b=Z1yFXSdNjfEY3gjwDUxJhB9OOjQ6jbpYLpMmqN8pzHRyuRlL1I4AfXCWobBPRC/Ja+V4
	 qLae6SQXnS5B/m5YO89I9Q61UKofN0lkSg2L8BXc2mo8QaxyFw+VO9B5YEkq1YcYZHisI
	 6hVojQnyvrY74Wgii06g2p4n2X9V2L2oSYB1KE2wyUgr3BBUnDA342UiM0vx5NI9qBe/g
	 VGaEI6GYEyHT/Rbm/gR/98OV+YsxyJK2ue+KcSg4hYxcZj47ix3U1oZLTyZERuJQVKPns
	 TTKtMSBd815c4A6vnLTL1vxczg7SNerMWF9RbUCT1lB38s6D3UTXRfXTa8CGKomOntQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hsal.es;
	spf=pass smtp.mailfrom=hsal.es;
	dkim=pass header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=H3W4IZre;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC00606A32E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEC00606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hsal.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=H3W4IZre
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jKLQy3jftzKp5C;
	Wed, 04 Nov 2026 10:55:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hsal.es; s=MBO0001;
	t=1793786122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i2FCQmEXZxDKQqcnu9pkHrDLOEfTmGF5gpWGt15wdhI=;
	b=H3W4IZreX+st8oDtTRlUnsvZVZN7KIZ2Kc9R7msnEuNKIJ+sWxJ/OjAFEWrB4YRh+/HSUF
	sIduUMUukfvKj4drqZ55hzIF96IXeIvDXE9920GUmG4Pe53Yo6aK+OcE17u+Tnaq73YFDL
	ZKz5YPBc/0icxTGwNNOCz9XTscz4lDeZExQgkhXo/f0z6Z7Z9zvirxQCghWnshd1pd9icz
	BcQNqyFZ7lSMWAziiX/is1Q6R7Kg+1nA/GJS5Q1gvAtdyFiZOyON4xLcVCMiOCxxyrXLCU
	6ZlkrAb7eN6hLSIMMDf3tfeCpXMEyRr1F7LjC/9N9/iEKLVdEjRfC8Yhj2I44g==
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
Subject: [PATCH RFC RFT 2/8] drm/amd/display: Interpolate between backlight LUT entries
Date: Wed,  4 Nov 2026 09:55:10 +0000
Message-ID: <20261103-backlight-curve-rfc-v1-2-6e4813a8f2eb@hsal.es>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3956; i=hugo@hsal.es; h=from:subject:message-id; bh=ZSz/RMblfQ0zJlVinD3vgNgodrBoJz7mNpa5XoTpSXU=; b=owJ4nJvAy8zAJVbLU7f+5A3TBYyn1ZIYsl7xRL1dtzwqReOLy8lXF20XvvQvtDuVk+Vbs2JL0 umWFQf7nu3pKGVhEONikBVTZNG94cnAMnHyzJyi50tg5rAygQxh4OIUgIkEXWT4Z+imfsGnWEuW z+C73OQ/vRPMT4nGf5faUd6sKR+1xGpdFiPDtqDC16yRK5TW7WGdc/NFiMX3jKTeTlVHc5E1vJO 4RbcxAAA5pEjS
X-Developer-Key: i=hugo@hsal.es; a=openpgp; fpr=193D095149CF7E8737B39064D912B0DB205A91C1
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jKLQy3jftzKp5C

backlight_millipercent_to_pwm_legacy() takes the floor index into
backlight_lut, which has one entry per percent of luminance. Any request
between two whole percents gets the PWM of the lower one, so a PWM panel
has at most 101 brightness levels however fine the request is

Interpolate linearly between the entries on each side of the request.
Whole percents still give the LUT entry. The result never decreases as
the request grows, since validate_ext_backlight_caps() only accepts a
curve whose signals and luminances strictly increase, so the LUT never
decreases either. The linear curve bypass and the 100% case are
unchanged

Signed-off-by: Hugo Sales <hugo@hsal.es>
---
amdgpu_dm only hands the power module whole percents until patch 4, so
on its own this patch changes no PWM for it. Coming first keeps patch 4
from dropping a level to the whole percent below

With patch 4 too, on the GV301QH curve with minimum 12, the 62452 levels
from user_min to user_max reach the panel as 57821 different PWM values.
Without the series they give 99, and patch 4 without this patch would
give 100. The bottom tenth of the scale goes from 18 PWM values to 5434

BACKLIGHT_MILLIPERCENT_MAX is defined at the top of power_abm.c as
100 * 1000. mod_power_create() sets num_backlight_levels to at least
101 and allocates backlight_lut with that many entries, and nothing
changes it afterwards, so index + 1 stays within the LUT. The function
still returns early with fewer than 2 levels, as
backlight_pwm_to_millipercent_legacy() already does

KUnit: dm_test_pwm_lut_between_percents, dm_test_pwm_lut_monotonic and
dm_test_pwm_lut_min_input_signal from patch 6 fail without this patch
and pass with it
---
 .../gpu/drm/amd/display/modules/power/power_abm.c  | 29 ++++++++++++++++++----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/power/power_abm.c b/drivers/gpu/drm/amd/display/modules/power/power_abm.c
index 5e86889eaa841..d9c1f1401b604 100644
--- a/drivers/gpu/drm/amd/display/modules/power/power_abm.c
+++ b/drivers/gpu/drm/amd/display/modules/power/power_abm.c
@@ -524,6 +524,9 @@ static unsigned int backlight_millipercent_to_pwm_legacy(
 {
 	unsigned int pwm = (unsigned int)-1;
 	unsigned int index = 0;
+	unsigned int lower, upper;
+	unsigned long long scaled;
+	unsigned int remainder;
 
 	if (core_power == NULL)
 		return 0;
@@ -541,17 +544,33 @@ static unsigned int backlight_millipercent_to_pwm_legacy(
 		return pwm;
 	}
 
-	if (millipercent >= (100 * 1000))
+	if (millipercent >= BACKLIGHT_MILLIPERCENT_MAX)
 		return core_power->bl_prop[inst].backlight_lut[core_power->bl_prop[inst].num_backlight_levels - 1];
 
-	/* This will give the floor index. */
-	index = ((core_power->bl_prop[inst].num_backlight_levels - 1) *
-						millipercent) / 100000;
 	/* Null check otherwise eDP doesn't lightup when connected to DP1 */
 	if (core_power->bl_prop[inst].backlight_lut == NULL)
 		return pwm;
 
-	pwm = core_power->bl_prop[inst].backlight_lut[index];
+	if (core_power->bl_prop[inst].num_backlight_levels < 2)
+		return pwm;
+
+	/*
+	 * Interpolate between the two LUT entries around millipercent.
+	 * backlight_lut has num_backlight_levels entries, and millipercent is
+	 * below BACKLIGHT_MILLIPERCENT_MAX here, so index + 1 stays within it
+	 */
+	scaled = (unsigned long long)(core_power->bl_prop[inst].num_backlight_levels - 1) *
+		 millipercent;
+	index = (unsigned int)div_u64_rem(scaled, BACKLIGHT_MILLIPERCENT_MAX, &remainder);
+	lower = core_power->bl_prop[inst].backlight_lut[index];
+	upper = core_power->bl_prop[inst].backlight_lut[index + 1];
+
+	if (upper <= lower)
+		return lower;
+
+	pwm = lower + (unsigned int)div_u64((unsigned long long)(upper - lower) * remainder +
+					    BACKLIGHT_MILLIPERCENT_MAX / 2,
+					    BACKLIGHT_MILLIPERCENT_MAX);
 
 	return pwm;
 }

-- 
2.56.0

