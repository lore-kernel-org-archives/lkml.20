Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504185;
	b=QCCyXxhZnXXn0c5o1ChTmhD24uyPty7+piTkBBabk8JIOw8qLtxbS29yC7chSIFS8NhM
	 eYh+v0dQd5xoX8HLof9xSZ/lfzKqM69EyINL1FoTAf+9yDaH+isGK0x2Hk4wjf+U527lZ
	 g7QbVIKIj2PR1ygSHqHo6LiytlQoWojL371PzlS4Bx99T37CSfZ/GjIh6QIMhi1dUcZCX
	 72SBP0y4ryEiOJQ/9Mo3+Kq+CbZHve2WWjIII96to1hjHDwevNiOfkmKgJuD/mNF3actk
	 JGU7FgncnXFXMeGN8cjjeIdrLGaNXEERsyuYyiWdTtedxHV/ervy6jHnatSzZxiRowg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JoIbT4JqQMzKpOCz4KsxBI33UMCOAPIEksfMpvE0MPk=;
	b=Pc9Q99PVU2O+HijvDdezCu5cdYIgPBpwoxCTzKjX/VQrTYbyYXy3vIjvZGWEhopfmRdk
	 aDVY9ImCSWmbMYutVJTtIV+IpfYm2+EYoWtLri0141/KXkepglW1jlLg33QM7XYv0XjfD
	 9rY8td5xTo0iPvlLnsa1E1qi86iwvQqO1/neEoWZaZX9+lF0Cv9vby+jIi7HomCMV1aV4
	 MDcV4YurHh10H8JbQE3eb8RWxGKZjX8wZzaauD8uPs2iYUDzPsKcxbqfmkprQJ8fICjzG
	 nBJHzVckiKihOl/IbkCp4XGPXeHjgnDht0ymqU9FFq/eX7HQLqiTPrpaZd4k8WXYRmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=neat.no;
	spf=pass smtp.mailfrom=neat.no;
	dkim=pass header.d=neat.no header.i=@neat.no header.a=rsa-sha256 header.s=google header.b=INinuD+L;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98710606A333
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98710606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neat.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neat.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=neat.no header.i=@neat.no header.a=rsa-sha256 header.s=google header.b=INinuD+L
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so2761877f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neat.no; s=google; t=1792504183; x=1793108983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JoIbT4JqQMzKpOCz4KsxBI33UMCOAPIEksfMpvE0MPk=;
        b=INinuD+LKo+9OKOtdGjGbo7MWNbUAjjpsQG8E16D/TiUlQacaIn1Fyn4LNaJmPFP1y
         wwsjXgwrevLokg8J9WrMSe5iIRzSvK1BXvZmjG2xVXEYxXM5zsxB8Qly2u0sWdYpVK5l
         xgTrvJcal75fuMRTWiSAC0V3t78Tw7EYViQx11hid/9OiE15yw/RkTPUMP/zCK8IX54r
         +mLH81jCGC7Y8c3j0TYSjWZgjNG+b8I47pzqGzZnRnmtCMfy0vyottO7Oy1fjunB6N8u
         5Cs34jzs2UXFaOyAo2ZDKvz/7coumkCHF7XiRoPVZTU2OjX7TofBr5pDzgmIXPuk9QYO
         YsYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504183; x=1793108983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JoIbT4JqQMzKpOCz4KsxBI33UMCOAPIEksfMpvE0MPk=;
        b=EO/72JSH/ySzvl240tudfC35WvwaAtPEKyYnaTv19lSqGFNcl/F9lgJ4TPoP8L3OXb
         pL/y63aV0nT9ywfxyvz/nbVz7jigyf5EghHhzHLatPIpR8K3q7Az6anD3psaEsnPKK04
         wXUCuASXjZWhyC158V6+yujMh3xZ6fIJdfm3ROjoL/yAYHMKZ18+hx1W6gzziQ/uvHVc
         VS/GgbgHihf8G1ywC3XL4t2L4OsZIxcbJaWASEReTIksoAy4GiSGVF3aqnDM7Vvy3fHw
         Mhnlx9/CwheZmp2UUEKA3+jE+NOVkwsth9nUvA3Tb8v/u2y9VJ20dBUQgF8WzhHn1nO0
         8sdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlMk1EznMUp7BRU/PvWhyxJwX0Cd5eaLL6EAgDYBLw2BJOTaAxvCWsSpK6k3REApNlWCA1d1yq5M4ssUw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzbClNUf5GA47TfhUIZb7Qogvm9javp7T0BUeuMsIuna1OPxbE
	NjRAy9u+9xherRModkwh2idVuWKTbMVTnCjndiQWoMcsz4Mz3pK3qs8GitFcFW+OFkbj5SA0WjD
	fXXgKzK0v0rEVlfS/vuYDgoHcoaZeENBvSAPgsHqK5SDuNkDFeIGr3SbIHH0HOAjiyZchC8Qdgc
	Hye5shxuoO7q2YFaV6aaHSyErNZxzhfO1nVwqpgebLJM112J2D29Kq3c798Jg02PsHbB0C23z00
	orwVGkpoVVggS2z3eQ=
X-Gm-Gg: AYBFou1iZLLM9sIywOQTY6+d+k17iYSRSgm2y5v5YaaT0v5LTmDto741DWMrG0VLo+D
	u7ndhsgG7u4rexMof6EGuU+67nLvCOG1T2DU8MWD2mWZsEvY6Rw34SXARMCfcZpUSo5Sl6AWooM
	+H/QaImrK4jrdKZU6MqjgVUXLaQI9x3fGEDs7qmHONoyxQsaCmUWuymhsXL186ZyNXpeLsTZdYo
	BdGhnNJ2j5cDSJCMi1d2qTXgQR+jMLLwCARkvYEdX9n+ie8660hhtS2r8wIbsdPsjzALMWQYCkC
	KF2exVk31C2ErCJMdd6UoOayvGzWpzUwbZFUo4SCdQ33ZVhH1ZR1icmv28nnLZiB0TpIKv9yln2
	3ktY93nU124vosOJ6GyDHS2PVhnCpDstz41pjcoeuJfq1YdIIYbLG21sTInJ2ZmdZALlwewjMM1
	kvmM3Oxq4jwPG+yVyAPOgkpHwKbaqIF7l7WBCN7dPG24Gd+siUV7s7liRtJ6WtJt+iRHh2JqNVQ
	hjCimk=
X-Received: by 2002:a05:6000:29ca:b0:48d:f498:91e9 with SMTP id ffacd0b85a97d-48e07bb592fmr17075762f8f.9.1792504182888;
        Tue, 20 Oct 2026 06:49:42 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80fea2sm6589469f8f.10.2026.10.20.06.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:49:42 -0700 (PDT)
From: Lucas Tanure <lucas.tanure@neat.no>
To: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vc4: hdmi: write SCDC TMDS_Bit_Clock_Ratio before the TMDS clock starts
Date: Tue, 20 Oct 2026 14:49:41 +0100
Message-ID: <20261020134941.631907-1-lucas.tanure@neat.no>
X-Mailer: git-send-email 2.56.0
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

HDMI 2.0 requires a source to suspend the TMDS clock, write the
TMDS_Bit_Clock_Ratio bit in the sink's SCDC registers, wait at least
1 ms and only then resume the clock. vc4 does the opposite: the PHY
starts at the new rate first, and the SCDC bits are written tens of
milliseconds later from the post-enable step. On disable the bits are
cleared while the clock is still running.

Some sinks sample the bit only when the clock appears. One HDMI 2.0
sink we tested then sets up its receiver for a 1/10 clock and never
recovers: a Raspberry Pi 5 at 3840x2160@60 shows no picture, while
1080p60 and 4K30 work and other sources work at 4K60 on the same sink.
Writing the bit by hand before enabling the output makes the same mode
lock every time.

Fixes: c85695a2016e ("drm/vc4: hdmi: Enable the scrambler")
Link: https://github.com/raspberrypi/linux/issues/7693
Assisted-by: LLM
Signed-off-by: Lucas Tanure <lucas.tanure@neat.no>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 2cc46036f11d..abab7a10fa12 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -812,9 +812,6 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
-	drm_scdc_set_high_tmds_clock_ratio(connector, true);
-	drm_scdc_set_scrambling(connector, true);
-
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_SCRAMBLER_CTL, HDMI_READ(HDMI_SCRAMBLER_CTL) |
 		   VC5_HDMI_SCRAMBLER_CTL_ENABLE);
@@ -919,8 +916,6 @@ static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
 		spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 	}
 
-	vc4_hdmi_disable_scrambling(encoder);
-
 	drm_dev_exit(idx);
 
 out:
@@ -948,6 +943,8 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
 	if (vc4_hdmi->variant->phy_disable)
 		vc4_hdmi->variant->phy_disable(vc4_hdmi);
 
+	vc4_hdmi_disable_scrambling(encoder);
+
 	clk_disable_unprepare(vc4_hdmi->pixel_bvb_clock);
 	clk_disable_unprepare(vc4_hdmi->pixel_clock);
 
@@ -1555,6 +1552,13 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 		goto err_disable_pixel_clock;
 	}
 
+	if (vc4_hdmi_supports_scrambling(vc4_hdmi) &&
+	    vc4_hdmi_mode_needs_scrambling(mode, vc4_hdmi->output_bpc, vc4_hdmi->output_format)) {
+		drm_scdc_set_high_tmds_clock_ratio(connector, true);
+		drm_scdc_set_scrambling(connector, true);
+		usleep_range(1000, 2000);
+	}
+
 	if (vc4_hdmi->variant->phy_init)
 		vc4_hdmi->variant->phy_init(vc4_hdmi, conn_state);
 
-- 
2.56.0

