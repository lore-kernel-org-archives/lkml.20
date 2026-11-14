Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794620642;
	b=28wH3Dj4tsqU4q7qthv+Qnh3rhZKxyGlDPsKaqaRM/MS1rp8QRdYYgGRQuyT0pItQFTo
	 HJ38K5+zuSCBkKneGmEQhJxpgBeH7rSteyn1YPDFnGJ2yxfAkLADnrqIIDFj6e7L0in1S
	 6I5QhlP+xGWNx4PtUYNzihM4RMfx+xT5mRzFv2oE0rR6XLqG3gPYhZ3wBVo74aQLw+Vbo
	 TiqpHiWr808rfBUHuNFvm+xuwRNHm5KnzTjm8YjF/D1Owj9UVyC7lBgV47cH033s/hf2l
	 BG/UiyaS3FJyU4r4I866wkTJ4uweisRu/fPelmmcv5+7bLcnXZvIQqrdmwIt2GqAF2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794620642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tn87j8WCS61Gao2LJeMNy/CQlTMoWJ0AG+YUO7C/2pc=;
	b=pz32LiYIakGXjPeHR2V3dEUA3qmO7QTd12zVWkb0DD0oCyu64pIQ3u42otftW/IsBtEI
	 uXSOGPR9bbgAS7cWfQCJGkgnHVAbOaYi+Dss3gbmvt/YFVie+Q+aTrI6x1FW8g+RxfrsC
	 n4aJOG8vkK/+ZQpb+z5veHW6ml6CkY4F2bxNVrkWEQNa31f/f4YMZ6Ub9KUBYjSmCmlEf
	 2qt8JoFA+PZmKEZQjFZYn3owyjcGtjtK98NZwv2+QfUThrkAx60P0/R0ehQEIhGe2BABv
	 H9khZDF969SKNZXzIusb3CEijj7bY/VUFrGO1OYbApYd2bz9qjWztb0c0pYEQP3t9Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U6elsQCx;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61158606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61158606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U6elsQCx
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c5067a2411bso291399666b.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794620641; x=1795225441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tn87j8WCS61Gao2LJeMNy/CQlTMoWJ0AG+YUO7C/2pc=;
        b=U6elsQCx54tNWEWdX0ILQWoyLjaPcHkodhUl2tRnHSVdK81u0gn+vVHPX8hd9YPKl9
         e3ePlqYdLbGTlq2EkntgQZnnusRg2OWwxKZpaAH1eqET9F7U60kkUI0gnNaTMOb2BiDi
         i09eL7Ex+eu9xjUwjv02vhvHSUsB448Se/7wOxUEiwsc26jcYPVbIHsuEBbFIqvxA2Z/
         eYHmThFJA4/+rVfpKtQZ00gPPQXAhx3xgccaBsnVeD+8sQM+6OoALiIGzXEkRdH198NJ
         9r7eRw+CxaYc/UwWhreqAIbspbPoszYZ+dH/0U8/U4m7ctdAM2Ov3cn4dyaj1a/Bzpbz
         M8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794620641; x=1795225441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tn87j8WCS61Gao2LJeMNy/CQlTMoWJ0AG+YUO7C/2pc=;
        b=jIKX24THk7LshC99GxMTqOmEgPe8J0638mypGVTaYSGM8vXA9IML3Z3uXpkk+I5SZH
         PosrJRbANBS8Ckp2C64MdPwmQrO3pWtJJy5ybStZv2+U/oO2jMlCHb0ghb4aFO13EuBK
         5yJpn5t8DL4H+fBLi14YYWOu0VmEr4vnM5Lnjl5O79b4ZGVgJQbKZIzK6BRBAXrxcbU2
         uM8zsimxYNm95N0yYeTdibpMSFGtVLZiFSUAfRvtMbuhkNj4w9Pr4bDmGRvzCSBb06Zs
         gmWmxcWmRI4Q5G/6Shb0aQbsNcHVqq1Cr2lQCn/A73vb4qqIyw7vcbbjTPftQASsgnS/
         fYcw==
X-Forwarded-Encrypted: i=1; AL+hErE7N5l2Eo+rP/D8o2iKRvJ2l//IgtJI8KstU4uEqNBJ5ef5GTxSeX4icohBiLTe76EC6ELdKCrNrLm7FoU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GY0GuxY/xPC82v9RPjSivh7OLrMUKWRln5t1hD1/eE/KlunTD
	BTIN57QnqufhHNQdNELG96yr63ZoW46e+MjvqNbQVUBFZvVLXDr1/pMu
X-Gm-Gg: AYBFou3vpUQuamey7GUg9DERCRUAfo8CCF790DmXXEvcpO6uitRNHuqWQpt/ehqElYy
	XReQFvTjTpJLkKxf4UBg9F3TUY0XQC3u+MzjrMG+6UbGaxBDUKQrBMiTuoqyXiJy7aT7w6mmCgK
	RejylIxaJ9Qk9hBYgsCkNwB6FB3kyoxg4o33abDLSHLznu7q/ndog+1d4jvlp2PavSv8d2dn9yc
	yhuS1BOYTdN6O8EmTTWcu6L0aolYblHrkoeousPcLM2PJ2nRH9xussfTkBpvMw5my0ifefBQ7io
	w+OoBityGfjseSLX61Awd9jQBO9SvxlWfpkjMu+2X/Np8bs8YvgxSigZ8jJbmktpFW80KVIyFAS
	+Ud3ymNv9/pTmY3V0Iiv3V9EKmFNVBjSJf3pxcgU6s9viVuO8Zl0+J6fuD03x5V0EaGwnp61S8l
	QRlxwz4O1nBafVOx3o15g6I8q41mzLkc9mE1y/mPn8eUpziF6WQyrQBEJGvGVnEEZoYoIGb/Umr
	TQ/yPZgdXUVleqbAQXMyp3K4wAOpqHUc97vCTbmRR/vkKKC6/4FH3rzWrrj4y6OdoFYvAQR7+DG
	3AERM/PI/ImYM4dMjdB0UTtdIfB7FLyleLMTUWLjsaUn6cYKz56cXP14wJHWK0MMnJxdN6vzTWM
	arEeH+CiZrpndB2Fj0q/c+wE=
X-Received: by 2002:a17:906:9f92:b0:c40:9e84:942a with SMTP id a640c23a62f3a-c509684d88cmr391927766b.48.1794620640864;
        Fri, 13 Nov 2026 17:44:00 -0800 (PST)
Received: from SMOK.angora-ide.ts.net (mm-156-219-126-178.vitebsk.dynamic.pppoe.byfly.by. [178.126.219.156])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b5a4c1sm161402666b.48.2026.11.13.17.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 17:44:00 -0800 (PST)
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
Subject: [PATCH 4/7] drm/i915: Split intel_update_crtc() into its stages
Date: Sat, 14 Nov 2026 04:43:32 +0300
Message-ID: <20261114014335.2132756-5-elxreno@gmail.com>
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

Pull the arming of a pipe on the MMIO path and the bookkeeping that
follows the commit of a pipe out of intel_update_crtc(), into
commit_pipe_arm() and intel_post_update_crtc(). The next patch arms
several joined pipes inside one vblank evasion critical section and
needs them separately.

No functional change.

Signed-off-by: ElXreno <elxreno@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 82 ++++++++++++--------
 1 file changed, 50 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 20b1103e3de4..aa03f674d93b 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7087,46 +7087,29 @@ static void intel_pre_update_crtc(struct intel_atomic_state *state,
 	}
 }
 
-static void intel_update_crtc(struct intel_atomic_state *state,
-			      struct intel_crtc *crtc)
+static void commit_pipe_arm(struct intel_atomic_state *state,
+			    struct intel_crtc *crtc)
 {
-	const struct intel_crtc_state *old_crtc_state =
-		intel_atomic_get_old_crtc_state(state, crtc);
-	struct intel_crtc_state *new_crtc_state =
+	const struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 
-	switch (new_crtc_state->commit_type) {
-	case INTEL_COMMIT_FLIPQ:
-		intel_flipq_enable(new_crtc_state);
-
-		intel_crtc_prepare_vblank_event(new_crtc_state, &crtc->flipq_event);
-
-		intel_flipq_add(crtc, INTEL_FLIPQ_PLANE_1, 0, INTEL_DSB_0,
-				new_crtc_state->dsb_commit);
-		break;
-
-	case INTEL_COMMIT_DSB:
-		intel_crtc_prepare_vblank_event(new_crtc_state, &crtc->dsb_event);
-
+	if (new_crtc_state->dsb_commit)
 		intel_dsb_commit(new_crtc_state->dsb_commit);
-		break;
 
-	case INTEL_COMMIT_MMIO:
-		/* Perform vblank evasion around commit operation */
-		intel_pipe_update_start(state, crtc);
-
-		if (new_crtc_state->dsb_commit)
-			intel_dsb_commit(new_crtc_state->dsb_commit);
+	commit_pipe_pre_planes(state, crtc);
 
-		commit_pipe_pre_planes(state, crtc);
+	intel_crtc_planes_update_arm(NULL, state, crtc);
 
-		intel_crtc_planes_update_arm(NULL, state, crtc);
-
-		commit_pipe_post_planes(state, crtc);
+	commit_pipe_post_planes(state, crtc);
+}
 
-		intel_pipe_update_end(state, crtc);
-		break;
-	}
+static void intel_post_update_crtc(struct intel_atomic_state *state,
+				   struct intel_crtc *crtc)
+{
+	const struct intel_crtc_state *old_crtc_state =
+		intel_atomic_get_old_crtc_state(state, crtc);
+	struct intel_crtc_state *new_crtc_state =
+		intel_atomic_get_new_crtc_state(state, crtc);
 
 	/*
 	 * VRR/Seamless M/N update may need to update frame timings.
@@ -7168,6 +7151,41 @@ static void intel_update_crtc(struct intel_atomic_state *state,
 	}
 }
 
+static void intel_update_crtc(struct intel_atomic_state *state,
+			      struct intel_crtc *crtc)
+{
+	struct intel_crtc_state *new_crtc_state =
+		intel_atomic_get_new_crtc_state(state, crtc);
+
+	switch (new_crtc_state->commit_type) {
+	case INTEL_COMMIT_FLIPQ:
+		intel_flipq_enable(new_crtc_state);
+
+		intel_crtc_prepare_vblank_event(new_crtc_state, &crtc->flipq_event);
+
+		intel_flipq_add(crtc, INTEL_FLIPQ_PLANE_1, 0, INTEL_DSB_0,
+				new_crtc_state->dsb_commit);
+		break;
+
+	case INTEL_COMMIT_DSB:
+		intel_crtc_prepare_vblank_event(new_crtc_state, &crtc->dsb_event);
+
+		intel_dsb_commit(new_crtc_state->dsb_commit);
+		break;
+
+	case INTEL_COMMIT_MMIO:
+		/* Perform vblank evasion around commit operation */
+		intel_pipe_update_start(state, crtc);
+
+		commit_pipe_arm(state, crtc);
+
+		intel_pipe_update_end(state, crtc);
+		break;
+	}
+
+	intel_post_update_crtc(state, crtc);
+}
+
 static void intel_old_crtc_state_disables(struct intel_atomic_state *state,
 					  struct intel_crtc *crtc)
 {
-- 
2.56.0

