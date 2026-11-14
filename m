Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794620647;
	b=YqHjAlKui7YVhmn6q2WfujXsRFFiZzheZUfpRS932z2akx2QxK1o4QhPXdUne+jntqOW
	 eSy3P4zv1OggnzwORJ4GgBCB070CNFcpsAIRTBFMVZ0NGnV97T8vxhmO74w/sjM4rMLCX
	 Glbw8qQifCjdoD/30x2hMrs2YiH8WgLiwIrBSYNZJKPztdC6norum2SaB6kLJ2FbaSL2h
	 3/bYjeR7/fEFoWjIXOZMH/FwRWHB5hHldJEYYvlyZ/kYlvQ32Utuv9umUm8SXwKALAxKW
	 C0D/nNmfSr+8mMx3ZOLMmFJx5nFpn4uS7YAMiPaHkRrnL4yze/1t0K4QjVWSXt6wOOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794620647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VhzDk/0P7t86MVcw1NLuypzKVGHVFOfLDCe4I/LxAp8=;
	b=3ycsxPMN4OczEJkCxCKEFFFSdZVQMlh5nyF3gA4Z6z0sA5S37VfrqXRApsCofuLn9UAa
	 QFSsl/xRI14GYERW3yYU+krUGMAhuUcFTgZQoKfr//si7uDTB4ENSFQ29pvCPmsrXJYO+
	 bcDne0IANJnWITRgwfnw1QPo3hg+6eihO4UWje1lHgsH7NiPZv7ErgPSCMmGIbBcjvDK8
	 ieIerfJZVxD7B37BBIlwGLrGK8luLLQ0I3ialAUgaDDjMK2DeilGcNYO3+BhbUbo1C8Q2
	 w5FcDh9QI/oNJTURbmBd1uSB38pwCQJJLlqdjKHe67SvuslFkwDK7BYQlDp7yQcny6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V1IYs2nP;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3409A606A337
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3409A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V1IYs2nP
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4395d31228so322423766b.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794620644; x=1795225444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VhzDk/0P7t86MVcw1NLuypzKVGHVFOfLDCe4I/LxAp8=;
        b=V1IYs2nPEBxKLVQQWPSiI6GpZ6YAQqvrQkQcoOT6dCz8+TXoiwrnshKQ8ihIYCdyOu
         4nFn8AOTFonRST5FVlqK3vK8akDL2T5GzBVH0IWzQnzP6Lmd+FakrBShVfcD7PN9CmHy
         K3ztbYn3qDqE+kBQ+vIjepnNLEnXtA3FHrZEYfGOyXexJvvaWZBJgZGMcNEX6BoWJW3v
         rdNPcVjGadBiOmjdP2Zw/SpWuiVQOItZ3Q+8c6FgOTuz3/2hjV+ZC1Nu+oYrPHLgMcZx
         DEiB8JETqQv/E8eK1nqs6rWBwHLCDwUp78iLprGLkzQ4fHIz/w+U3aIgoFkjos51ppM0
         7QJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794620644; x=1795225444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VhzDk/0P7t86MVcw1NLuypzKVGHVFOfLDCe4I/LxAp8=;
        b=Uq53BtgK/ctTaxUxzPhVd7LWRKoZ1x54eltEMn+JhQ1qd9pw+jfSlaC7G02TyZSg+H
         B1CbXhowa9/At1Or+1kM18u7997FeSRFaKygG8QaVf3vqg5w+FNvrEm9ATEPiF4myvmA
         L+u77YUNbduLRNZssgwo04qbE2sTOHVfF3yCi/j2Sc8/+BlPVKlC9cIzROy4AZDrSEyY
         0xmmGzPsX9GW42ATWlMZmc1DSZxO8xlRMb8Y+O+H96f5HhTgHJzeS2JzdfSl4Yrnqj0W
         zR9hojbdIgmwfGJi8/iISwi4J5znbSYIrxMiE0SN9QxJRguJDPhIJvP95CMdXx4xfICr
         BRLA==
X-Forwarded-Encrypted: i=1; AL+hErFJpPhhRO/al8UDTZIKrjExt+F82OlkHE5xynlI4p6hxY+6CQSD8jvoja/EJY+YLah2apKorkNybpgPX3g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vBLA+yEah3exoeiACcT1lipY6B3z+AL4rST2BG1jzlo8tvn1S
	ksINeSNr0/bww7hiX/LPLRLEa2dp0x5o/ZvEOIkx4MFvxN7jSu3/yrkr
X-Gm-Gg: AYBFou35qE9sQPo7jewy4gTvfzqaPGcqBhWIe3jsvo0/vTPvWxROb4mE59MjrFFMZGq
	cLSfKXCv94DwaVCVeaVudfPgWSJSxBOYowHjakdWHGM6j8C5tWNNFgqeEdi9nqWGwxfkJ02F/D1
	N0gi5rC8BNH09UwUwzbREypQe6asIHu3vBPYcQWibt2z2vnuD5NruZhmGFv3a631GCP3te4NIN7
	oz1n57DmYf6hn7UQG2fpfk2jg/YuMXeN9sNxsrHLKgj5HEFH8hg4M85rWKwtQM0CAylOYHcwxua
	f4sdKNMuJ7D/wkM/UhD6FJZx2Y2PStgZrSSCTQpD/MP3B6ORMbElChuPBj2DVLcyVQSPBU060rL
	KqOfp32uwWrTDvx8fA1OaH1QHENLtX59EmXZTaMhgHJiDp5kbkOVjrBgOzgZWj6ftuM9ObPsgKj
	0VJz/PamHgchiHfQbGgDBPjJ8K8dPm8LqVhdtq5iqljvegMH5m/aQEHCNmkSTcGMgR8ssOxA8Pm
	bFf6NMd4Q6beC9GuaeH2X+l5OP6f88NNdZ+eljy36COvFU7nFYUJ0HKcX9NS4gA0rg5NiMSrfnX
	shQmxbKAHoW2A6u0Vv8FDVt4I5lWjkEkF3lIVpM8KMtN8R4X5GBb4qTr0adQIAqGBSf//vbQqWm
	80omxMuwsZptryXGbEQ5GZsg=
X-Received: by 2002:a17:907:3e07:b0:c4d:4d5b:849b with SMTP id a640c23a62f3a-c50963408demr386393866b.19.1794620644542;
        Fri, 13 Nov 2026 17:44:04 -0800 (PST)
Received: from SMOK.angora-ide.ts.net (mm-156-219-126-178.vitebsk.dynamic.pppoe.byfly.by. [178.126.219.156])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b5a4c1sm161402666b.48.2026.11.13.17.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 17:44:04 -0800 (PST)
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
Subject: [PATCH 7/7] drm/i915/vrr: Allow VRR with the pipe joiner
Date: Sat, 14 Nov 2026 04:43:35 +0300
Message-ID: <20261114014335.2132756-8-elxreno@gmail.com>
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

VRR has been limited to the fixed refresh rate timing generator with
the joiner, as the transcoder level VRR operations were not sequenced
against the pipe level updates of the joined pipes. That keeps VRR
away from every mode that needs the joiner, such as 3840x2400@240 on
the eDP panels of current 18" laptops.

The transcoder is now programmed only by the joiner primary, and on
the MMIO path all joined pipes are armed inside one vblank evasion
critical section, with the push sent at its end. Take that path for
VRR with the joiner and let VRR through.

A commit whose new state has VRR enabled with the joiner does not use
the DSB. The push must not be sent before every joined pipe has been
armed, but each pipe runs its own DSB and nothing orders them against
each other. Leaving the push to the DSB of the primary, on the
grounds that it is committed last, is not enough. The secondary's DSB
waits for the safe window after it has armed (DSB_OPCODE_WAIT_VBLANKS
with the safe window chicken bits, then the wait in
intel_dsb_wait_for_delayed_vblank()). When the primary's push ends
the safe window before the secondary's DSB gets there, that DSB waits
for the safe window of the next frame, and it is still busy when
intel_dsb_wait() gives it 1 ms after the flip of the primary has
completed:

 [CRTC:271:pipe B] DSB 0 timed out waiting for idle (current head=0x100, head=0x0, tail=0x140)

That is what a port which only skips the push on the secondaries
gives, 13 times in 27 minutes of desktop use on Arrow Lake. The DSB
of a secondary can't check on the push either: commit c3571a239e10
("drm/i915/vrr: Check that the push send bit is clear after delayed
vblank") notes that reading TRANS_PUSH from it ends in a DSB response
timeout.

The LUT load has the same ordering problem: a colour DSB either sends
the push itself or has to be ordered against the push that the CPU
sends, on each pipe. So no colour DSB is prepared for such a commit
either, and the LUTs are loaded the way they are without one: ahead
of the commit when they can be preloaded, by the vblank worker after
it otherwise, in which case the commit takes the per pipe critical
sections, or with MMIO inside the critical section on the platforms
with double buffered LUTs. The commit that turns VRR off has no VRR
push to order and keeps its colour DSBs, which are then started from
inside the joined critical section.

One thing changes for joined modes even while VRR is off, as it
follows vrr.in_range: the sink is told to ignore the MSA timing
parameters during link training, as for any other mode within the
VRR range.

intel_vrr_compute_config() does not ask for LRR with the joiner, and
DC balance is kept off, each with a FIXME. The vblank delay fastset
that reuses the LRR code is not touched: where it applies (inherited
state, or the always on VRR timing generator) it still writes the
transcoder timings from every joined pipe, with identical values.

Signed-off-by: ElXreno <elxreno@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_color.c   |  4 +++
 drivers/gpu/drm/i915/display/intel_display.c |  4 +++
 drivers/gpu/drm/i915/display/intel_vrr.c     | 31 ++++++++++++--------
 drivers/gpu/drm/i915/display/intel_vrr.h     |  1 +
 4 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 4070dc8d97d9..08d1c999637e 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -2023,6 +2023,10 @@ void intel_color_prepare_commit(struct intel_atomic_state *state,
 	if (!crtc_state->pre_csc_lut && !crtc_state->post_csc_lut)
 		return;
 
+	/* TODO sequence the LUT load vs. the VRR push for joined pipes via DSB */
+	if (intel_vrr_needs_mmio_commit(crtc_state))
+		return;
+
 	if (HAS_DOUBLE_BUFFERED_LUT(display))
 		crtc_state->dsb_color = intel_dsb_prepare(state, crtc, INTEL_DSB_0, 1024);
 	else
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 1fda1bb15674..8f30337c8967 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7681,6 +7681,10 @@ intel_atomic_commit_type(struct intel_atomic_state *state,
 	if (new_crtc_state->do_async_flip)
 		return INTEL_COMMIT_MMIO;
 
+	/* TODO sequence the VRR push for joined pipes via DSB */
+	if (intel_vrr_needs_mmio_commit(new_crtc_state))
+		return INTEL_COMMIT_MMIO;
+
 	/* TODO handle VRR with flip queue */
 	if (intel_flipq_supported(display) &&
 	    !new_crtc_state->vrr.enable &&
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 668c495e7407..6543c140e2b5 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -450,6 +450,10 @@ intel_vrr_dc_balance_compute_config(struct intel_crtc_state *crtc_state)
 	    !crtc_state->vrr.enable || !display->params.enable_dc_balance)
 		return;
 
+	/* FIXME figure out DC balance with joined pipes */
+	if (crtc_state->joiner_pipes)
+		return;
+
 	crtc_state->vrr.dc_balance.vmax = crtc_state->vrr.vmax;
 	crtc_state->vrr.dc_balance.vmin = crtc_state->vrr.vmin;
 	crtc_state->vrr.dc_balance.max_increase =
@@ -495,21 +499,11 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 	crtc_state->vrr.in_range =
 		intel_vrr_is_in_range(connector, drm_mode_vrefresh(adjusted_mode));
 
-	/*
-	 * Allow fixed refresh rate with VRR Timing Generator.
-	 * For now set the vrr.in_range to 0, to allow fixed_rr but skip actual
-	 * VRR and LRR.
-	 * #TODO For actual VRR with joiner, we need to figure out how to
-	 * correctly sequence transcoder level stuff vs. pipe level stuff
-	 * in the commit.
-	 */
-	if (crtc_state->joiner_pipes)
-		crtc_state->vrr.in_range = false;
-
 	vmin = intel_vrr_compute_vmin(crtc_state);
 
 	if (crtc_state->vrr.in_range) {
-		if (HAS_LRR(display))
+		/* FIXME sequence the LRR timing update for joined pipes */
+		if (HAS_LRR(display) && !crtc_state->joiner_pipes)
 			crtc_state->update_lrr = true;
 		vmax = intel_vrr_compute_vmax(connector, adjusted_mode);
 	} else {
@@ -832,6 +826,19 @@ void intel_vrr_check_push_sent(struct intel_dsb *dsb,
 	}
 }
 
+/*
+ * A VRR push latches all joined pipes at once, so it may be sent only
+ * after every one of them has been armed. Each pipe runs its own DSB
+ * and nothing orders the DSBs of the joined pipes against each other,
+ * so they can't sequence that between themselves. Such commits take
+ * the MMIO path, where the joined pipes are armed inside one vblank
+ * evasion critical section.
+ */
+bool intel_vrr_needs_mmio_commit(const struct intel_crtc_state *crtc_state)
+{
+	return crtc_state->vrr.enable && crtc_state->joiner_pipes;
+}
+
 bool intel_vrr_is_push_sent(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.h b/drivers/gpu/drm/i915/display/intel_vrr.h
index 19c7990be1b2..a72ffba47a80 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.h
+++ b/drivers/gpu/drm/i915/display/intel_vrr.h
@@ -32,6 +32,7 @@ void intel_vrr_check_push_sent(struct intel_dsb *dsb,
 			       const struct intel_crtc_state *crtc_state);
 void intel_vrr_dcb_increment_flip_count(struct intel_crtc_state *crtc_state,
 					struct intel_crtc *crtc);
+bool intel_vrr_needs_mmio_commit(const struct intel_crtc_state *crtc_state);
 bool intel_vrr_is_push_sent(const struct intel_crtc_state *crtc_state);
 void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state);
 void intel_vrr_psr_frame_change_enable(const struct intel_crtc_state *crtc_state);
-- 
2.56.0

