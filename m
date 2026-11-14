Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794620639;
	b=4oSBx9z2YCO5/YvCQoLOmQVt6/41GRvYkSy9pAxyF1Q5KGmcYBN65T7rBrtYbVz57lau
	 B+C1pTPQR/cJXhzpD346sFzhO0qj3pzKTwgtlWwMx005QgyUbmReMyqfJ4/hSIkTiDKDO
	 DbGiaA+Nw1eYeA9eC/AYyVAxGbdX3rGwmqpJ4+Rm9GC2luTmB9wrxRfJvndusp5kPIHLh
	 KkwODFPV+bsMgBSPgos2NBiyKOns+Re8IglMWooA17gfngL9JmiVtvCCfrs+jaUQ9Iei/
	 M8ezBg4e5gA2KFVkqsl7yqTNk2Pay0VXDOa1uu0sqBRMOliUt0m5/KMWf9BwHNLyOzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794620639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ln/RngDaBKEnJFXqfKaXLiW2drDb5LIdcMJafwzjtfA=;
	b=KbdVsRihlumCnlbxhvTQ9pK//N8ZkXpdfDa+0Dv25k72U5xWWkVbwVxtWraqEwovrofR
	 9NzL1V269Dg19g4Sp6//q4/xBWhtH1fU2apNRS/1MJ6sQ9n1hILiXJxIYOA1uZ/D50Qzv
	 aI2WAJptNaprLjwytub/5Z0nGveMCho8/gYNy311wYfADo2NccJr/htYen6fMrP/XJFgo
	 DBNrz8pvoagVScHM2nzrrjeS4YiUtJHWP18EkkbuiLA0HF1gGCsr354yn4KHu4tefEvUm
	 yve2jjm5hWwJHxl5dlofiKeA/Sf0bkB06wcvy8Jk8q4AQGIp5iOg1w4W7WXxM9gV3yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YrcatVE4;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE3B606A330
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDE3B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YrcatVE4
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c169ae1cb26so352120466b.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794620637; x=1795225437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ln/RngDaBKEnJFXqfKaXLiW2drDb5LIdcMJafwzjtfA=;
        b=YrcatVE4GqmlN/HSOdaV6/olTGlvKTvmR4xHGiBfa18XOjhwtf8xBQdKir+l4WLGkE
         541JaHlcr06++U+sdG9Py2USTNSIp1cNoRSIhQ0IGs23ERkIMuZtQg98oIbIHL49h4dB
         E9AX9GTwHzcbB2CF6PNx2n88Va968Z53sHFYJsjdNOM3vdM0vEEWGrw25aG3ysD7Ci3+
         3BDGimU0XT2ht6ukGK4TI+Y+xrlsIAMPcD5xzV8woCwmt/gPJ2HwSM4KeocDeD7TMY22
         t4wiSVDUg597J09aP6LG2glBCAcuyF6KkRvZlR8ZRFP2KAmM8r5iU5Wf2DeukD5ylSp5
         dOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794620637; x=1795225437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ln/RngDaBKEnJFXqfKaXLiW2drDb5LIdcMJafwzjtfA=;
        b=SuTXQcKZi7WOEbr9T+aikwWwiZnsvalcOUayRCh0saIkrVrS8Wc+30PS0BDQwMEsLh
         2nu9uqlv8LTvkvrjSDi5qHT83dINKqLr3ns2G7z26qOvaVCQDZLFFYlxeHAtWFySO53O
         eHIfZPyGRnVixXANzH2mpPV0RN6ctV5yOsRGRkI8YZle6xK1XrFrgtS9XULrYzlWNMvE
         7143snAf1BJAY9pP5dKN/cYBniFGGSn407+dz9kLtZv2lwuxhOSwzC/QI3xB6haWpBCP
         laWjrpmMElm1bAPa0xY4YO7WpNYIej9JXNW8LcBepl0vF5Ata267DXAjMM/5dV6c2dZ8
         DNfQ==
X-Forwarded-Encrypted: i=1; AL+hErF8pvwjGM+VwwWWujavDVaQRCNPSeXyVXxiwyrC4Sve71HBc8ODCXdmQwHAy4mQ2SKLvB0iAXHDUtcynoE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q7rn2g5Pf/5F+8FHukNtq1VFizXp4oK5wMxPGvHRm3pJkBMC6
	Ib8TGF3db0a1D9MhEavtYPrYWpa/vebzsryG4KJAmVDwJ1uVFi8ZBgg+
X-Gm-Gg: AYBFou3sSIkIhMT2yOIfKSeB7HVGOLqQayU8Q4f/sqeNcsO8U4u0J4yqEcRYurte9Xb
	WslZ9VPWhIAxqVGhg10ThSvLMlp4Lt8XhpKtxCX3HOD1NwBCdPPXJbjdnghkL/8DzZOEb1x70I6
	YG9FTNo+8dXfojmCtQ41100+NXhjOotwwl6cEz5+cja+6qwYJyraQQ/b1dJbSpF1Yr30XJmPjyh
	m7FGNzov9xv4twp6QMTl46y3XTsc9VkiYFbfJZsyIBBXddX7NyoEoOwktFccjK40gtUp2OxCCPC
	M+70F+Fp7pi1crEH6Kgsvnt4sae8/K2FIpil9gfR2hiu8ytQmubw5lSHRGiv6CwYkBVkvLVj2Xa
	cozg0irFAmO2PIkYgx1ggijIqNDCbcBBvbIQSNLop740JP7YYPq2XXOvSwpw9Y98ezcYAxj3fUy
	O+ai3Fus8PjpncibJEbrYgFl66lPs5v/AjNk0yw0Pd0srFGseFQx1QOv7hzTFoyoaGulz+xd0S1
	ZkuLCnCQiwdf6DcNnn+Ds3HIsZHbqnIyutVkCb6ulqTYk8/DDVDV1dbrWm5T/p/Go1CvfgJEthM
	Ytiu3rqMFrHHDWBziZxJ1qoDGKknOPA2NysY/Nn0+WsZzCCcnGmWgWy2UUS7/9mr0elQXiF42vg
	g10HigzzrJ+AWzGY++c97Jlo=
X-Received: by 2002:a17:907:849:b0:c2e:7fe7:2898 with SMTP id a640c23a62f3a-c509634b3fcmr384987366b.12.1794620637178;
        Fri, 13 Nov 2026 17:43:57 -0800 (PST)
Received: from SMOK.angora-ide.ts.net (mm-156-219-126-178.vitebsk.dynamic.pppoe.byfly.by. [178.126.219.156])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b5a4c1sm161402666b.48.2026.11.13.17.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 17:43:56 -0800 (PST)
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
Subject: [PATCH 1/7] drm/i915/panel: Fix the pixel clock overflow in the VRR vtotal
Date: Sat, 14 Nov 2026 04:43:29 +0300
Message-ID: <20261114014335.2132756-2-elxreno@gmail.com>
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

intel_panel_compute_config_vrr() multiplies the pixel clock in kHz by
1000 in a signed int. A 3840x2400@240 timing has a 2342.4 MHz pixel
clock, the product overflows, and the vertical total computed for a
refresh rate other than that of the fixed mode comes out negative.

Do the multiplication in 64 bits.

This needs a fixed mode above 2147 MHz, so one that uses the joiner,
inside the VRR range of the panel, and a request for another refresh
rate that ends up on that fixed mode, as the allow_modeset=false path
does for a mode that is VRR compatible with the current one.

Fixes: a2da67028cd0 ("drm/i915: Allow arbitrary refresh rates with VRR eDP panels")
Signed-off-by: ElXreno <elxreno@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_panel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index 81e638d0c7b3..157be3153c7e 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -277,8 +277,8 @@ static int intel_panel_compute_config_vrr(struct intel_atomic_state *state,
 		int vsync_end_offset = adjusted_mode->vtotal - adjusted_mode->vsync_end;
 
 		adjusted_mode->vtotal =
-			DIV_ROUND_CLOSEST(adjusted_mode->clock * 1000,
-					  adjusted_mode->htotal * vrefresh);
+			DIV_ROUND_CLOSEST_ULL(mul_u32_u32(adjusted_mode->clock, 1000),
+					      adjusted_mode->htotal * vrefresh);
 
 		adjusted_mode->vsync_start = adjusted_mode->vtotal - vsync_start_offset;
 		adjusted_mode->vsync_end = adjusted_mode->vtotal - vsync_end_offset;
-- 
2.56.0

