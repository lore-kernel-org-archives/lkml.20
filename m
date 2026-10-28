Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793204987;
	b=PWkBlHSSRqlK9S+Cwt1Xw4y88/Ej1vxER9YZDATzCXxO6Psy3DA4+nFUDJdRK1NyULLY
	 uqNt8hYleMVGZVk4QmnPxoVETyIjqWJaoD8iB9SQy/SUpeO18UDjR5gSd2LmCaC9HBgSA
	 yBmOto//s0QZq3x2tmzqiaZCw513FvzP2uqME2IvxxkZtX/lUIXGvkpbILbgz0QGAcWRn
	 3owfCtRD6ukNiG7zYxtdGpOx0Rb8dnwm76xMG8yUrTjqvT7KtmFCCtX6NKDEuc3Di2dhN
	 mUCnG2kiJVIbxBRzAUnQeEBnrKWuDe2FIhr6ZLY44kpXf4vpU9sdmIuNRN4ZIw0AWhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793204987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gJQN1372r+5iUBD7obTGjY7/PAv9KAvuyEMPwJZ9IXA=;
	b=lpy1vMPr3CqF/E3vimPD7bj5ke/RRYRuo7Y5dkNyO2pJxns8Io+Q82YXMgZ1rQqee94w
	 ZM9Y4NXcaBS8STRyat3IVkNqiLUxsGwoHtEHxOmjetreQi0eFJiSf0IQyRbwd0iE3tfXD
	 XvnRlx2+KyUGcsZb9KJxVHqrDslC6UgxnHRbPBWwbRyocN/B7OScYELfQmHHuV7HRMzXI
	 k9YP2pqYS1UwxQJnMh3Wf4GMY5kXlG4gbfBwhnUkw8eVfOkUs8qXygG24ykmCW67TxHut
	 +tkS8k+Q6Vp6MQQPIR4zoqhgsqhEbiNGNg34MOqg7J6mmPbB+12i2YrZzZKjUS+rEcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GQNGnpWc;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0224F606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0224F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GQNGnpWc
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6afafc89b48so2048844a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793204985; x=1793809785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gJQN1372r+5iUBD7obTGjY7/PAv9KAvuyEMPwJZ9IXA=;
        b=GQNGnpWcoHd9r7ztcQs461+NGEAlK3sHGJdV7Hb1uvUyA7TDkr5t0AIR5H1XDib9qe
         o4hW+5WGM2G653F43+5Q9qstez1OHOHIEpzFYMmZyjRaDc6HJ//xnQMwHyt6/6c/P7Wo
         Q9Ui0rf5ZwGZrV9eEdEUx//fHJh0N1wa3pa59HQGITmUu7fiEHdA3+Va+rAPoDZcH9A4
         WZksxjtGxfFzB53DLlrH/kk6RhuPPEim9yJmuVrsKA2EWShwBDBS3yYUASOB0iyJ6y8V
         Ha3oykvKGrAvrTcXM1cpcLRZrvK3ELZ3WIr2BECV9awXx0hOxvIw8dSsIDAzUTiW4Myg
         iyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793204985; x=1793809785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJQN1372r+5iUBD7obTGjY7/PAv9KAvuyEMPwJZ9IXA=;
        b=1hIrTJpRkuRUXRQajO9CZQ5JAcQsxjE48wZx1cMiVtSU/p6y7AtQPXBWRb+cHN/XMw
         0YsvbX2wSptKyWMt/ceNSkJB+9wIvkKK91XvpAUAFb47N6wHSBUH1glWWLcaWar8hxTG
         HwDCtAcgiEsaS48uA/lN8POtG3zGV2n791S5Bbg4PZxAURhIPlWt1LLCHr1SCvKcglpi
         y6CZ3lHdoXOIQ3riba0EyXY0V3rzSHAvgQQ4u7Lh/yLPPo3fk1JpEKku3GCFT6x+fQbJ
         JQb+ngWccPMWDbelegk54ZxlX1yIbEYdJPIAXyRE3P9ZvLxOqUUR6RZ4gg7tVng2TWvh
         SiBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxojpDxqBrciB5UV9uYTggGQ/LeE42ozSZ+kGoSLxcTTaoPW4HBZA/wdDQxlSrrF3o6hCqL85w6AqyTKEs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUMmul8VaslmAWxuwScV5mrB/v+esg/9yPdTisOTarAh4jMkh7
	Du8SVMthijhx8An9uFx2TKOj4RGVkq0B4NOUD0h7FthEpmDx5fXMg5TH
X-Gm-Gg: AYBFou17pRBi1p2/NF05DWrGDVN2U0Kc5iurBZRJbooAaZ40asePXnCIHZuRsNiUZro
	5gZm0/o/lsL89RVn7kv2Wt4COZZXNVA8kKmNvQnhlqMbAfCnp4/MZRDdcPqwYMFuJeIKdwhhSS0
	w9uVdGpgMwZgFuZL4CBy3Sx0GMdgr5UdQQpdXCbA3izInWQezcVJWXAio5cwQZfg98R0v700Wcf
	fe9xlvMZDkWif/ojo5jbisq3fA7cF01ui3AOnRHnIfLZfzCo9RFssQRK/MTSVCJwVAyX5eARHYx
	veF4kaorYgbFtmjXm2mhvNBFOy6AZAx1mQUrJMkOm1jlqpaAKl2YaKFgUSkEe7pUoY9ecnrt08a
	k4AVhAFnEkFXC5GOGPW6HYwP8yJi6+bywi6icJHc326SL6kAte0P6yoWqRVc7Npgz5wube67e5C
	tVWvZHV30sv3eJ3q6E+6pdxpjmjm+YCtYPjGgamUiG2N2m1GTvO3xnDgTaJljaRZvgsUs8A3ps6
	Azri6s796x4D7duNotdHsSkpVJ4Jf3BIu7GpAIzqiuB8FgV+Mi/jWqUyUIjNorcJ3Nc5TqYU4yh
	ICZZelALbatIUolj24PuElPHqx029k7RfVvDQ65GDVYWemZ4USkpyAyN963PA0Zg
X-Received: by 2002:a05:6402:234b:b0:6b4:1701:569c with SMTP id 4fb4d7f45d1cf-6b49cb594d2mr2127015a12.3.1793204984885;
        Wed, 28 Oct 2026 09:29:44 -0700 (PDT)
Received: from localhost.localdomain ([46.205.195.0])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b496435babsm1655823a12.28.2026.10.28.09.29.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 09:29:42 -0700 (PDT)
From: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	intel-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
Subject: [PATCH] drm/dp: Keep base enhanced framing cap from extended DPCD caps
Date: Wed, 28 Oct 2026 17:29:41 +0100
Message-ID: <20261028162941.62762-1-dmitrymalovanyy@gmail.com>
X-Mailer: git-send-email 2.50.1
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

Some sinks set DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT and advertise
DP_ENHANCED_FRAME_CAP in the base receiver caps, but clear it in the
extended receiver caps at 0x2200. drm_dp_read_extended_dpcd_caps()
replaces the base caps with the extended ones, so the link is trained
without enhanced framing.

The Xiaomi Monitor A24i (P24FBA-RAGL) is one such sink:

  base:     12 0a c4 01 01 00 01 80 02 00 06 00 00 00 81
  extended: 14 0a 44 00 01 00 01 80 02 02 06 00 00 00 81

Without enhanced framing all lanes train (0x202-0x204: 77 77 81), but
the sink never syncs to the stream (SINK_STATUS 0x205: 00) and shows
"No signal" until it is power cycled. The same monitor works on macOS.

DP 1.4 section 2.9.3.1, as quoted in the commit that added extended
caps support, says the extended caps match the base caps except for
DPCD_REV, MAX_LINK_RATE and DOWN_STREAM_PORT_PRESENT. Keep the base
value of DP_ENHANCED_FRAME_CAP.

With this change the link uses enhanced framing (0x101: 84) and the
sink syncs (0x205: 03).

Tested on i915 (Arrow Lake-U) through a USB4 dock.

Fixes: a1d926527b79 ("drm/i915: implement EXTENDED_RECEIVER_CAPABILITY_FIELD_PRESENT")
Cc: stable@vger.kernel.org
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17719
Signed-off-by: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index e623ccb4c..205b6cc89 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -1219,6 +1219,9 @@ static int drm_dp_read_extended_dpcd_caps(struct drm_dp_aux *aux,
 
 	drm_dbg_kms(aux->drm_dev, "%s: Base DPCD: %*ph\n", aux->name, DP_RECEIVER_CAP_SIZE, dpcd);
 
+	/* Keep the base enhanced framing cap if the extended caps drop it */
+	dpcd_ext[DP_MAX_LANE_COUNT] |= dpcd[DP_MAX_LANE_COUNT] & DP_ENHANCED_FRAME_CAP;
+
 	memcpy(dpcd, dpcd_ext, sizeof(dpcd_ext));
 
 	return 0;

base-commit: feaa32dc98090b2f45f7b6f179711a6640169c1a
-- 
2.50.1 (Apple Git-155)

