Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794620645;
	b=cQ87+kC5OOjkh/WIayR4O06wYAY8Wn7n9RzuWGo5ww6LHmY0epBhucF0mDLeGddnuxL2
	 6dLlhI2qkrPjN+lQE7pF5sgMq6mdwngeXlpXm0BdKVnkhm4FCd/aOC+4pxy79eHHbSC23
	 5CE1cGhcNa61d2m2J0+lFYFbniosN3SPqTZ5kIpeyg4gFnHgrDFt4Q3iZT766UIL48+uC
	 CUwzIYjxKkfR68nEcdYChevRvSptYjkRgDBplmSWfl8GwFVs/HbVl51H9n72S7nWteHE6
	 qx+MjJANgiljl1U+wGLyr6veK4/TNz1WXNhIo27g5lY/T9jV9jk6EzB7W3uLFXUoNvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794620645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uLsjaTn65LaFIAzBSRyBBq8jlmudpJnh9O4lsKxLsso=;
	b=uv+eDuBmzKGAWoLz2uO2vtNx7XzPWWdMWqIVDF9fLuGgsWCSzT2Hw8z4/aNo7lJck2GQ
	 t4lQ/68Ebt09RQ6mLRw2JKc3D7uG75Z/LxM0UKJaCFMcKdRU4MxqwT6fA/0zVAX7ZoanQ
	 YxfOW4sVby8ymPdP9C2B0ogupMV0UfgKyWbUyAZV7h52tSO6zia/3JPhLoSrP3gk7/iOK
	 HwO14b8hXkuevAapezxOnH3BLaLU5JAPXVBypObJtHBwNuDCS+e5G3kqWxXvx7DxsT71A
	 hZh2iOgM8j7US12Xt2C307YeH8LExJ5kDj/9qY/asJnGfn1wszoFPQvDux8X8q1SJSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="pi1i/dYE";
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53895606A8BF
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53895606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pi1i/dYE
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c468bd799ecso283408266b.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794620643; x=1795225443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLsjaTn65LaFIAzBSRyBBq8jlmudpJnh9O4lsKxLsso=;
        b=pi1i/dYElVeOk7HB321zgauWJLoTicSZsA6k0Ju5nda1fZLAnymGRULOz4U1zaT9UC
         mudWXUEKH5BEITKNx5ykUR1/o6F4HhnmqQfRC1CWahCq8bR8g1NOHP+Z45dy1i+i7x2h
         A3l1nUm6DHhasuMo7FlM7LkKJnpWp6UGYS8JdrZJh1IHaBIjjBViYiATPOJtVCCI0D9M
         zgq0wQWpXAUxIyj0jLwi0z9UHAF3oP0YfCZQmDdsTfMfA19r6jWIBN4lxtPDxR9MLOFJ
         qX2y7q59FH/n6csl0PdKWE4ODc4h2iIPhXTn/f+HKgKKX3r4/EJaR7CAVjE77/JeOltV
         +vIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794620643; x=1795225443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uLsjaTn65LaFIAzBSRyBBq8jlmudpJnh9O4lsKxLsso=;
        b=Lv7KxCZmWiYuftoc3AnhDq/tc/y3P0nORhjA2v1m5uUXyxrfhkXRIdj1C2wuMXN3Zh
         oR0a0sfAEAWHoCsPUNBVxEKVFkuh20w91bOsaQDKzQuQ5aKOXldK8R8lmd/goTYc2YjM
         JDikzdWHiaLZMMKFia6paVxtCatrOr6ai8iaiJF00KIEek9LN0hB/uWQTFo4eu6gsVrI
         slL9IxWbtExO+EdPmAVat6ZL4TQ3Ipur6GMLGlTGzORVeDSiEm71Bw2zZDXIUFyHnH0D
         0vmotsQGqQOlRsYWSTz1n99q4eOabdN7zNqDagZnvt3lf5RyRO7zf3czAzmFX6M3My14
         l5ig==
X-Forwarded-Encrypted: i=1; AL+hErGtHG6REWS5JFRujz+E/8h0sE7ESFiuVBcn1EhzzwC1vNYCpCqXd/NfkkvIFTKjzYCgQmU9730DBVIOO58=@vger.kernel.org
X-Gm-Message-State: APuU4Z8450sL8K6QuFBF9hU+2vCLLCVsRzDM0sFZllkz1aIrK/WZWYxa
	mc0CNuTtfluEE93AS5cheqMZRIDjymjmdTNnJdt/Leo3b64F4Exu4sp9
X-Gm-Gg: AYBFou2OhcnJYmROu6Wfa9kOYfT4rexcj8EyW1+3Ocyz2hCsqw7AhvSrjkjDKyjRuK+
	cCmqFn1n+ZWvsIrppl3UQVSo8HOvqLy6Unwa5XV7PHjqQYT5xvMMJscCxKC7L/ttFBCuWMKehAe
	fczmSTzwcd4cAOS9p6XRZX2xHfl8OoptR1LR2mY19auYAOqs2q9a45ah093sN2TIqR3eQLEuBzm
	3UpxjXgy9vdTfLfyeKoNxFAHGtkuJ62MQzG482ezIYLHsuLybYqbaaqxmTDc/CaqugF7G6G5A/J
	dskX8/Wzj98Hfauq8snj9LUNsA9KHMBkiiRJ04VP3Ae03PT2qJ4Jz6JA2Q6xqOULjDAyFnj/bOe
	egN8dkiiZnO6YO5LIaBramRuBDKjYz21o/s8j67D4lj+h/5+PLAYxXWLAV3xcLFckq/UAzWgw94
	tANKtmRsZs9I48ijrDyOvhewwzGFpXv+rvVIYg++Id0QH9I+P8YqNFLNJ8fZAfXtTDOa1SeoFdj
	A4jKZYNWILyc2O2wdF7JgvCslg3wYMMje5wNhqaV0yOkkmgaoV14UtSEmPeP7H//lINaky2+duT
	CpVf43RRp+T1zYlzxxE7YdgUl6Q3u3COCqacTJCNkUrmKCzyQGdzrPVsZI+AT5GD1Qnd5sz4E6Z
	EZlhxhZTl6tGkS7vmqvajKXU=
X-Received: by 2002:a17:907:3f23:b0:c50:93b6:52fa with SMTP id a640c23a62f3a-c509614e782mr364785766b.2.1794620643332;
        Fri, 13 Nov 2026 17:44:03 -0800 (PST)
Received: from SMOK.angora-ide.ts.net (mm-156-219-126-178.vitebsk.dynamic.pppoe.byfly.by. [178.126.219.156])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b5a4c1sm161402666b.48.2026.11.13.17.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 17:44:03 -0800 (PST)
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
Subject: [PATCH 6/7] drm/i915: Evade the vblank on the scanline of the joiner primary
Date: Sat, 14 Nov 2026 04:43:34 +0300
Message-ID: <20261114014335.2132756-7-elxreno@gmail.com>
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

The scanline counter of a joiner secondary pipe was observed to wrap
at 8192 lines on Arrow Lake, with pipes A and B joined. Sampling
PIPEDSL of both pipes, they agree up to line 8191, which is the
largest value pipe B ever returns, while pipe A counts on up to the
vmax vtotal. From line 8192 on pipe B reads 8192 lines less than
pipe A. This comes from measurement only, I have no documentation for
it, and I could not check whether it is a property of the joiner
secondary or of that pipe.

It is harmless as long as vtotal stays below 8192, which every fixed
refresh rate mode that needs the joiner does. With VRR the vmax
vtotal can be larger, 12200 for a 3840x2400@240 mode with a 48 Hz
lower limit. The vmax vblank start at line 12160 then reads as 3968
on the secondary, vblank evasion on that pipe never sees its evasion
window, and the pipe gets armed across the vblank:

 Atomic update failure on pipe B (start=48480 end=48481) time 8 us, min 12101, max 12159, scanline start 3965, end 3969

All joined pipes run off the timings of the primary, so look at the
scanline counter of the primary when evading the vblank on a
secondary. This matters for the commits that still take the per pipe
critical sections with the joiner.

Only the evasion is changed. The vblank timestamps of a secondary
still come from its own counter, and so does the end scanline in the
message above, while the start scanline is now the primary's.

Signed-off-by: ElXreno <elxreno@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_vblank.c | 12 ++++++++++--
 drivers/gpu/drm/i915/display/intel_vblank.h |  2 +-
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index fc9d1e14ec87..6654ef590da6 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -11,6 +11,7 @@
 #include "intel_color.h"
 #include "intel_crtc.h"
 #include "intel_de.h"
+#include "intel_display.h"
 #include "intel_display_jiffies.h"
 #include "intel_display_regs.h"
 #include "intel_display_types.h"
@@ -683,6 +684,13 @@ void intel_vblank_evade_init(const struct intel_crtc_state *old_crtc_state,
 	/* TODO: maybe just use the active timings here? */
 	crtc_state = pre_commit_crtc_state(old_crtc_state, new_crtc_state);
 
+	/*
+	 * The scanline counter of a joiner secondary pipe has been
+	 * seen to wrap at 8192 lines (on ARL), which the VRR vmax can
+	 * exceed. The primary runs off the same timings and counts on.
+	 */
+	evade->scanline_crtc = intel_primary_crtc(crtc_state);
+
 	adjusted_mode = &crtc_state->hw.adjusted_mode;
 
 	if (crtc->mode_flags & I915_MODE_FLAG_VRR) {
@@ -738,7 +746,7 @@ int intel_vblank_evade(struct intel_vblank_evade_ctx *evade)
 		 */
 		prepare_to_wait(wq, &wait, TASK_UNINTERRUPTIBLE);
 
-		scanline = intel_get_crtc_scanline(crtc);
+		scanline = intel_get_crtc_scanline(evade->scanline_crtc);
 		if (scanline < evade->min || scanline > evade->max)
 			break;
 
@@ -774,7 +782,7 @@ int intel_vblank_evade(struct intel_vblank_evade_ctx *evade)
 	 * FIXME figure out if BXT+ DSI suffers from this as well
 	 */
 	while (evade->need_vlv_dsi_wa && scanline == evade->vblank_start)
-		scanline = intel_get_crtc_scanline(crtc);
+		scanline = intel_get_crtc_scanline(evade->scanline_crtc);
 
 	return scanline;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_vblank.h b/drivers/gpu/drm/i915/display/intel_vblank.h
index 98d04cacd65f..28b4c458fa18 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.h
+++ b/drivers/gpu/drm/i915/display/intel_vblank.h
@@ -16,7 +16,7 @@ struct intel_crtc;
 struct intel_crtc_state;
 
 struct intel_vblank_evade_ctx {
-	struct intel_crtc *crtc;
+	struct intel_crtc *crtc, *scanline_crtc;
 	int min, max, vblank_start;
 	bool need_vlv_dsi_wa;
 };
-- 
2.56.0

