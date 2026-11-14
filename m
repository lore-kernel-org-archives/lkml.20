Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794620641;
	b=aBOLd/+ybmJL5pjqat5KwDcDW6pm0OEFRweXpKYdB6177Lu7Nwn6UZMK0wT69+exK4d8
	 GLUSw0tVBxbe7QdsCBpz62hGjFyM0e55l6IfGa1ro4Xca13Vyn+7CLDehzj/ov+mkHO1F
	 Bh2eGpcy5IgiWR7t5sI1yrDKPrHBK6tHJdy/Jx4aszEic2VuGqkR6fIKin9miHHqJR5mt
	 kJ90cdQfE4cy1j0Nn8mblMEloHM33Nn8S1L9AN2qMDnObiHpBY7sWj4yep2xqRIroiFVM
	 N6LDoOCrdLaYyr0iTHmWItuQH56QuOt7lgShCUaURjuMI2AjsSm171yOy+HWjbFxt4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794620641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0Pz+qENIdDsgTiQZzFFYd3dQorXrNLOkeSm/a1z1K+E=;
	b=t1WtSmggfynJLaxjgAjGLHWMTlB8KqmXwEq27E4pYH0b4qfXs2hDiEo0GNgofNLYoJ2l
	 kuVFtfgqcJr/FePpnTci3i5yl8h676OGBHslKJX0jXpcKhjPqi8RDPp4bvTkIuMHZEzL4
	 ze+96eMDpp5kCu5QvKmSXWqZxLgDR6lwamyw5AiSt/CMWTTMey6jvKexghYQQ2KPJCmA3
	 qk9xZRXoJbGBYL53tT6SgOjqLwgUC3utGMOFwFswZZYqSEwy8gknNzkDcd+LlUn3tTfJ9
	 nnjgoGsicIOcmil2SSgsCsAZ0DMB0Ry4mZROybS5dkXJ/kRYVj2p5JEQjhTeOinV10g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PTlw4GW7;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD855606A33B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD855606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PTlw4GW7
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c40f29667e6so346272466b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794620638; x=1795225438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Pz+qENIdDsgTiQZzFFYd3dQorXrNLOkeSm/a1z1K+E=;
        b=PTlw4GW7OyWuYHEl4SEkNC+QMfmwa86BOUHq6LYi7dwqO+8P9INgH7VUCEasBTtwSS
         KWH5NlH4uEbbliJgb7QO+bwHRCRm6a+CEzm5UiFo0M/BNdbradHL1jFk4amXmeZwCxjK
         zS58rlYfF1RrKHyHE6PwPTgDXQfZP/El0BafVnYCYKNdZLZfxg25gYuOoGXtUOWVgs9i
         +5rJtVdTz1OG0eDJYibcTyjmSI6vSS+SM6tw7iRPv/PfzOMbf5zMVMAS3zMT5a7g3o6A
         +aGZUObgTkjcY1tCzDQb2/Zwbdzbyy7T9LM6ys37i7vsUMYdblm46MkwOuh5pEq02Z72
         jznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794620638; x=1795225438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Pz+qENIdDsgTiQZzFFYd3dQorXrNLOkeSm/a1z1K+E=;
        b=hrwj33geyjTBNqE+DXKokFOXsmji+s1PxBsiiaTyIRrfIjoMEk2lVp999FarRppIei
         vaJkZxV4EfcV+yGnN06MSPpBNIOkp3KQQiNgymRZqW28dUTq8EPdi620W6ok9My8WR5O
         mDt26ABE1LPqaHYVD13YK7OOquOBXUsX7zBa9HAMtbACwB8Fr9fFROBmJZdoq1HvUx3l
         IS14zUQE36s9/uDZf+Fw5jF2NKt6EW3NDjOoNYuk4A92xew39qi1KxtuxMhUTg6BuY4R
         H7chuHcVmpb04vMcUZym6XqtOrxDP9DzZWZREufoQdwYLHP4DskTrqzq06fdd3A+VYT6
         zADA==
X-Forwarded-Encrypted: i=1; AL+hErHDVRixP8HbTxbIAVSO0pCtazAHfZBvOj1+qFzNXWS2xkJc9rk5jQvc6m5si06Lwg4pZkBGuN1J3GRemCE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rkqgwi9jLxp2K6czcYRilYNrytwEEl0jNvcOPKV6HYgCr9tCi
	EuxzTlhrYKfsjdItkdOCbv5FodL9ACUc7A/XS4GtxnKVKKqQS3gxcUdq
X-Gm-Gg: AYBFou1Hku/0GhzxKKYT5F60k7pRnir9AI3Znim4nzyA7rK38LoAVP2QdPDYH25lrwX
	X9vmWjdKjBZA9yAG10OYH4uWkvF0622XiPy0Eh+v0MoQe+ImzWFMwJZNKqPPfy3361KNQ70GRIv
	BAjQ2vmh0+PSOzLgIDuaVMiMBtP9Tpfxv2h0R1X8u6b8ryi+tPbDiZU6WExD76bHoPXcynDmquP
	4qpbJjT326w/1X+WGJNPiPJp3X111auB8dAC2nyEergOMH9ccILxierkrmm/iEIGPE0ARNmW/cY
	Q1Wbx+ol9yt/PpqLFrSaAXtr0+ZzPtnzuYTwTmxrfhEk4uvK0/b7o61IdBlLL4KqQZDyxGy8Zup
	B8cjLbdkZCf8OgKGc37m1tMAvgXKr8XBj6vu36gz+5sjl026bTSryT2lryi/tHIpXNxgQLftd+c
	YX9DQ0u782V1ZaKXZIwo9GwUmjy8ubg9a42r3BxicubBjtOI4PLaqEaCAux1sBhWXWxxIr3boxb
	5tJGOCuwP3R2fe2K5Sw6q76xLMp0RlAoEP3qXT9JJE/EaZOkuoFxBMsITPoBKosmyWTpEpt6+uT
	8SiqOxExS1FkQr+Tb214LiOga7Bc+Rl4vylFy2aVCgs6vr+86Lu+tHm8QWWAToMqYAVgVYoCnug
	rSodLlDcpidGwPTUEcaxx1o4=
X-Received: by 2002:a17:907:7b85:b0:c46:a72:e0c3 with SMTP id a640c23a62f3a-c5096398905mr356309566b.16.1794620638353;
        Fri, 13 Nov 2026 17:43:58 -0800 (PST)
Received: from SMOK.angora-ide.ts.net (mm-156-219-126-178.vitebsk.dynamic.pppoe.byfly.by. [178.126.219.156])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b5a4c1sm161402666b.48.2026.11.13.17.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 17:43:58 -0800 (PST)
From: ElXreno <elxreno@gmail.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com,
	joonas.lahtinen@linux.intel.com,
	tursulin@ursulin.net,
	ville.syrjala@linux.intel.com,
	ankit.k.nautiyal@intel.com,
	mitulkumar.ajitkumar.golani@intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	ElXreno <elxreno@gmail.com>
Subject: [PATCH 2/7] drm/i915/vrr: Fix the pixel clock overflow in the vmax computation
Date: Sat, 14 Nov 2026 04:43:30 +0300
Message-ID: <20261114014335.2132756-3-elxreno@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114014335.2132756-1-elxreno@gmail.com>
References: <20261114014335.2132756-1-elxreno@gmail.com>
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

intel_vrr_compute_vmax() multiplies crtc_clock, which is in kHz, by
1000 in a signed int. A 3840x2400@240 timing has a 2342.4 MHz pixel
clock, so the product overflows, the quotient turns negative and vmax
is clamped to crtc_vtotal. vmin then equals vmax and VRR is never
enabled for the mode, although it is within the range of the panel.

Do the multiplication in 64 bits.

No Fixes tag: intel_vrr_compute_vmax() is only called for a mode
within the VRR range, such a pixel clock needs the joiner, and
intel_vrr_compute_config() takes joined modes out of the range so
far.

Signed-off-by: ElXreno <elxreno@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index e59345bd1d33..a5a5d11380a4 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -416,8 +416,8 @@ int intel_vrr_compute_vmax(struct intel_connector *connector,
 	const struct drm_display_info *info = &connector->base.display_info;
 	int vmax;
 
-	vmax = adjusted_mode->crtc_clock * 1000 /
-		(adjusted_mode->crtc_htotal * info->monitor_range.min_vfreq);
+	vmax = div_u64(mul_u32_u32(adjusted_mode->crtc_clock, 1000),
+		       adjusted_mode->crtc_htotal * info->monitor_range.min_vfreq);
 	vmax = max_t(int, vmax, adjusted_mode->crtc_vtotal);
 
 	return vmax;
-- 
2.56.0

