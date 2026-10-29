Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269112;
	b=efPlNYINl3kz8IuLxeyuICG0UaQ+JYQQHaCJeF36uajcUsBqr5FJUojNmZlm5bxI6NKW
	 l5lbx26xOIzOxGPtYffRPMiJbjm4aVtWh7zJtQy5TNQzwwhIT7F06y76EQKG/MD0YH8Vd
	 E8JzCDGvUmQQ+ECQwNg3TPhAe6Wyyl8m3LEnLYfnGvdXrBcugdXjoP3zBBwKb9f2m1RWy
	 kYntx/JyuFXW0QU7dl+lZ7yU1oYWOQ5P921kb4Y7XZpECyQ8Ky72A5d7QRUQ3LLGl+EqL
	 q9Y42DzZY7H+dDli5oQGAWlUu9PaZq6RZbw0g10cP6I3OQ9OAw+70p1+llQmGqjLWUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dOEmoLrkij3HmYBFR+Syf3gWz1S3EKgtiAPD6c4+pN8=;
	b=yJxsTXGPhMY48AiTqLWWx62bCE1S5h5Fzg7tnDgIXrNyInvuV9kxqDKr/CNNVV+GyC6p
	 LcPoVxrzjv2I5zUEJxT9+cT1TmbMz1dpjkmNjt2xagEpw2tmRkgGupxDV/x8kFcyhV+x3
	 j1Rg64vLNfS+EcmziTm+dFEDjXZTTGWNKesZ3wsqtTAOnIpw+hHqd6PvlPdkYXSCAArgV
	 SP42PPpIN3c1+a4u6GN9dNUTWCS64Hy0iqBbSbEbv2+uIyi6XX9+A7hmMlJtUjAsLgFHk
	 P8l9wHxzX8vRbLuuhDVbIhYRtkTQ0TwI23VuIclI6jPfQcXRvHqwnd5x52kuMgi/G9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=alJU0dY5;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5A5606A329
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C5A5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=alJU0dY5
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso305365466b.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793269111; x=1793873911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dOEmoLrkij3HmYBFR+Syf3gWz1S3EKgtiAPD6c4+pN8=;
        b=alJU0dY5Up8q33aAiFmliFZ394iZjePCOI4oeMOgfSlICfOsSeWeutUa8xzrlvTgbk
         UUN0LgE5XH/qi18S+NHpbhWLPfBvA/qZ8ziatluePe7lrIXo3liI4xOKVRZRLLOw0Mk4
         Ru6QVSCSko7JMevFqhvFeAlltR2wDjUzcp+ScvUyDt7yJmky8dA7tiSopOeKRXxz2B/1
         PLDMRaLBtktIY0PhcbycDppHusd2OKFZrzzKOtIpf7/le83rv4A74CSuV5Pf48DsSeJR
         6/VMJMJP/golCJQlnsM1PADkGmybfSpCPL0EHtx1jUFfaX/mF429w+lwdFElSdkYy00e
         E5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269111; x=1793873911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dOEmoLrkij3HmYBFR+Syf3gWz1S3EKgtiAPD6c4+pN8=;
        b=QSCRVzumCqkVCanMG35NNn3cTGntsWSN+BKLmBupv2c0q5WpsWL9DM+4niRKFA79X3
         qAqOytYceq9q3TPb13FlY4X4vug4CWOXTV2OiSO+3CCblo1nYJqPnP2pprbXzCuXcX6i
         71n/oXOELxLKMxd0z9TfczwHX71gS2C9xSAAvF2lE0MROsDFj55GQbC7H0GOtD9N4DUl
         w2hmGQbieDePChAuDbPvMKVioNtQVTI3NXAjXli/ytgmjax7G/0S4NHVxFgRSM2kgNfX
         iceclN1RVeyZ+vCHzpPBLNEc/UFmm6raIgH+kTMz3Z4VHox4LdUwXk9E61E7sU2k6USc
         gJjQ==
X-Forwarded-Encrypted: i=1; AKwUvByKjHKCB1NRgFw0Qu4IXO+k6F+dW1wX21VBrsll1kQJa+Op1owuBW9t+MMdsrqb5esE2HrX13XYtbgBZd0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCHhgqE8TOpauLXhg9RPLQJcsOiVbjVjl2Wme3DyYG8TRtLvEL
	J1JRVVIkXcY27lqRz1MqcNX3N8Fw+o8SuTPYn+xXBCBpZa2D2MviQdV9
X-Gm-Gg: AYBFou26RUe027s2JD6Cu2Db7dueVv1oI7gKTQLhl9m9Mmfp+knL/Pf7wp/728Mjqeo
	OCnsPXTlOrk+Q91nUGzPJ5JUHPsHQ0xWUVL1CvocOWkBxbGH/F9ZHCey/zg889OCAYv3AjO1BUP
	qtBGaMwAlPBZ5ur1pMrJnEVdjdMhZqmfHcySA7QBW/0IsoRUhUPVjSpUYlqVBTLuhVXCK2mzKAp
	4zWQwUAj2SNmz+eonbrC17UmZMCNF0ubl3xsJL7dfmEH98A1XPNPpVD9Ivo9bt6EhNeViOA1mme
	68i9crebKZzB3aMOWMcUg8Lf0+cHyuRzK71YRZ9VY5uHZ5oNGh/PyRzllsx26at2zeCpOoRKMkM
	IyiopVQJGFjqYRjD8OcRoCuoYng1qTXEhqOPpYz+/cfTy6Zg2iqFuvdRsZvkm951gtormMm0Y39
	BurGBpk7ocv6GVVFVM64A4d2tWJ8n0PVGxsYYlqNO7JGnAWPCaOzTaxZaa9SBS8/JLPohtrUhht
	0TsdxaQ3KoV9SxZ9fiXDJV544Fov9tnral2hNx3zqemXZ/d7OMrCdCQtKIijtjKwBqrmEuBHVjz
	bEhsIQ6xtuXtsBRwyqQMDVI+1n16vLE8W7O2TV2JgTxbdbtiyWEqxl9pLkQ9+8I=
X-Received: by 2002:a17:907:930a:b0:c46:a5bb:5740 with SMTP id a640c23a62f3a-c49bdb64c4dmr397674666b.5.1793269110523;
        Thu, 29 Oct 2026 03:18:30 -0700 (PDT)
Received: from localhost.localdomain ([46.205.195.0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66c6dbsm712145966b.59.2026.10.29.03.18.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 03:18:30 -0700 (PDT)
From: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	nouveau@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
Subject: [PATCH v2 1/5] drm/dp: Always use enhanced framing for DPCD r1.2+
Date: Thu, 29 Oct 2026 11:18:22 +0100
Message-ID: <20261029101826.72773-2-dmitrymalovanyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
References: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
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

DP 1.2 section 2.2.1.1 says "An upstream device interoperating with a
downstream device with DPCD Revision of 1.2 or higher must enable
Enhanced Framing Mode". So for r1.2+ the DPCD revision is enough, the
DP_ENHANCED_FRAME_CAP bit does not need to be checked.

Some sinks get this bit wrong. The Xiaomi Monitor A24i (P24FBA-RAGL)
sets it in the base receiver caps, but clears it in the extended
receiver caps at 0x2200, which are the ones we use:

  base:     12 0a c4 01 01 00 01 80 02 00 06 00 00 00 81
  extended: 14 0a 44 00 01 00 01 80 02 02 06 00 00 00 81

Through a USB4 dock (CalDigit Element 5) the link trains without
enhanced framing (0x202-0x204: 77 77 81), but the sink never syncs to
the stream (SINK_STATUS 0x205: 00) and shows "No signal". Forcing RBR
does not change it. Connected directly to the laptop the same sink
syncs without enhanced framing, at RBR, HBR and HBR2.

Make drm_dp_enhanced_frame_cap() return true for DPCD r1.2+. This
changes behaviour for every driver using the helper, but only for sinks
which already violate the spec by not setting the bit.

Tested on i915 (Arrow Lake-U), with the dock the link now uses enhanced
framing (0x101: 84) and the sink syncs (0x205: 03).

Fixes: a1d926527b79 ("drm/i915: implement EXTENDED_RECEIVER_CAPABILITY_FIELD_PRESENT")
Cc: stable@vger.kernel.org
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17719
Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
---
 include/drm/display/drm_dp_helper.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 5b05a7fbe..4f20f60db 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -160,6 +160,10 @@ drm_dp_max_lane_count(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 static inline bool
 drm_dp_enhanced_frame_cap(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 {
+	/* DP 1.2 2.2.1.1: enhanced framing is mandatory for DPCD r1.2+ */
+	if (dpcd[DP_DPCD_REV] >= 0x12)
+		return true;
+
 	return dpcd[DP_DPCD_REV] >= 0x11 &&
 		(dpcd[DP_MAX_LANE_COUNT] & DP_ENHANCED_FRAME_CAP);
 }
-- 
2.50.1 (Apple Git-155)

