Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269115;
	b=w3sKwinyBvuUvOiMW+zdQTRMdfkNb3VT4WIn05IAhlnXI+d0kJmXb4YaJk3XyOb75Q4r
	 +6lQTx/cwQbiRpxmiX/92b42+vrCAO/4aXUnjKdYwjxDdWEf/V/EpeVMNMAE5c4FS1Sxd
	 sAYq9f7CLIMgKiM0TChCxdroFvvEN65TvF065DunaGV5KDjEaJiBiHCMT8c7AEPvhL+rH
	 frQOCNZuyZH/oySVT7Pf+GR0oAPhcwcej0kJR4ItBXw9A/WBVPHlRTT/B/8i0Fa3zSpRh
	 DUnEzpOQm1bYIuCOt7FCOdHAs/PASTJXUopURo9mY0mmdF4RJgQQS2s32vjyJbH53vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7eDSUJln09vjqS6fT78Hrmt4ANao45wYJuBLIsNkp4w=;
	b=xAs8fJjT3owT3VV+vEMzXg91Aydjy/hFrYrhB8iXefte00R6MAcTveS6n3QaLGn5THyx
	 IvLSuvqZKIShJTua1Dpwl4/9w+kdPGFRPUzRkRqmgrFh4o/6V/cjU4PR2NXTjQlGRdj7g
	 QZjE3i7JHCC3Dh79/h0gQmoAGEpgcNY/wyroXIl6KuWWfQmQEZuBc8EEywL7/go0YNO3Z
	 ZT/qk1XrnOSrNZQYSAHB/pbrtZ18rb6PpJZqobYGENKvwjU12qBU9tLlKcDgTT22mTms5
	 FOd+S8XgFnKFbECojK8S2L6BH/3Q87UmNKrVJBuL7vEH/RAyXqElyYMk5H1/nwammEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uNZnN6Os;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29727606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29727606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uNZnN6Os
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c418e215671so249523766b.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793269113; x=1793873913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7eDSUJln09vjqS6fT78Hrmt4ANao45wYJuBLIsNkp4w=;
        b=uNZnN6OsRy8OUFlf01ab+vmNA3++DAfLZmOAKwEoel+ddDKGH29fDh7V4VAajEwdfQ
         rx+hzw9i4A1bEOVE7GXS2ZbrfFRf6KeDEJjfSO8ApWK7TL/b1ERc+zi2e4oThNuzUZ4S
         Gcc84KdqiBjIxQO170+akD5Grc5R+uRbMcV8sD6DDEuxGaIT85OAQz1NFrnY+TGmS7FX
         8xuzx0MA12osWtHgayDyuBOzVs42WjilGxIyGuX2J5DXUP2DUsfwAkTrDbaeKVz3D+Br
         STjkEsCQnEKFgsqqnuXhWvxgxhU/tVPd/d2NWlnO/1bLFgcx/vRVzTsFGUhhzRB5Py9G
         9YrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269113; x=1793873913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7eDSUJln09vjqS6fT78Hrmt4ANao45wYJuBLIsNkp4w=;
        b=VixPMteM6PLYqm5kQmAdR/M2pZgLgDC2HjHrWq40WYHMi+ihI6P0Boh+Yx3j8kqprc
         nhSCs8eIzl4Nj+Jtq6Ltpfh2Bp8vex2QL2BL6YtPBptCyJRGtiBIqMxZoVmYPnbPP2Mv
         +q9MLOd4uV+IacWaNHlK+a1Z79sX/P4ACsIANB6oyJTs+UX833EhYxe6OKT3WQh7UAhj
         ehrilz5DJi+SdLPjf6j0GOxeK+T6xZCrv9/rQHSfGbC+avwKD+T5tOBtNlUwYhoWZ032
         6FejQP8oa9p3j8jqR3P87KYZ0xPyEpb+elw3XcpG/GV/krYu5w8NC7Xq4AtPulziXj3q
         Qmrw==
X-Forwarded-Encrypted: i=1; AKwUvBzIqQMnqYjN5qjSzhXezjaCuy2+WwL92o52m9+HFhFgSdiuyddgYpjNa6Q5/s96FZt4DnoArArkqJhzGZ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlIbYRl2TEdFP39SJqUDPAVufh+RjZXf0vqglQxXES1ctQ9jDJ
	AKlFbiRPEOdItjZ1p0a3ZzCC8BYsENEVoQ4MBPCTRgo4VvZob/8Umvzm
X-Gm-Gg: AYBFou3RLpI6C9vgt6t/XXAT5Y7ipTwWSiEqg6xZWUUwmXlRBXdcEYPBh1m3jResbQW
	56jxPczoNKWhKyG0O0SI9WGcLBzdx8JzyMDonMJOiidYXte/c5RJ1V9beyPB1Mye6vsiR6hvusB
	niP15mqyI4gKVmKoG5C7z5PX7b+0JfEws6Z6kl7bhCx/K6G4ih/JR9KbWnQ8iu/BCqEpyRSjg7d
	7F7lg9u5enVsoAkriEIc4p5AHpB68dJm3VgI8qshG92st9auoPSo9CwGA45vlF+AQUlWWOWxTyX
	WrHXsYMZqD0uh0CobzBQKq5RpQnnsg+OdZB/+ZtM3VY5uKBUws2yIYos9GESQNwEAbk996RYVwm
	+WMz2bfBxOHkt16V2+eMYN5iZTZM8xgJnlcVtbrlfm4ZQrhk576nozVIEWJ+jd6CzR7NXVM2Nmg
	kLNGgtyqb29D5y8jgdu3xOSpvMW2jGhVJETkqLUdN/GDcwko8AVdmb6gT5u7Mo5CxdhyOGPA0rU
	WuVmPi0v0ac7BhXIPCWxFsbzU7wDw5yk2LFYyzp40UXbl9h2Pb5qwIFB/BVTUisUFALN1ihqOLX
	Y0fui9HcBpz1L7O+oHWqnPiqWu8khxDm3yOb4B9ZNb0cRSRxs8hVujLd5SkZd0k=
X-Received: by 2002:a17:906:f581:b0:c49:8fa2:4a22 with SMTP id a640c23a62f3a-c49bdf569b3mr418814266b.41.1793269113505;
        Thu, 29 Oct 2026 03:18:33 -0700 (PDT)
Received: from localhost.localdomain ([46.205.195.0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66c6dbsm712145966b.59.2026.10.29.03.18.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 03:18:33 -0700 (PDT)
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
Subject: [PATCH v2 3/5] drm/bridge: it6505: Use drm_dp_enhanced_frame_cap()
Date: Thu, 29 Oct 2026 11:18:24 +0100
Message-ID: <20261029101826.72773-4-dmitrymalovanyy@gmail.com>
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

Use the helper instead of checking DP_ENHANCED_FRAME_CAP directly, so
enhanced framing is used for all DPCD r1.2+ sinks as the spec requires.

Compile tested only.

Signed-off-by: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index e136ac71e..d798a3db7 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -1651,7 +1651,7 @@ static void it6505_parse_link_capabilities(struct it6505 *it6505)
 	link->rate = drm_dp_bw_code_to_link_rate(it6505->dpcd[1]);
 	link->num_lanes = it6505->dpcd[2] & DP_MAX_LANE_COUNT_MASK;
 
-	if (it6505->dpcd[2] & DP_ENHANCED_FRAME_CAP)
+	if (drm_dp_enhanced_frame_cap(it6505->dpcd))
 		link->capabilities = DP_ENHANCED_FRAME_CAP;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "DPCD Rev.: %d.%d",
-- 
2.50.1 (Apple Git-155)

