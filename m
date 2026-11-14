Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794620645;
	b=i14SvgI6hG294u+iVSLI7qIj+FyuRuw/CpjMGTDvPeotJcdVWs/mZZOY5zCKCX/wfRCp
	 sN4HKyM4vAFKPuL0emJIGk3JFniB4R2kuIdxAQEieMfi5FSo3qdODxncwOKl04zb/zscl
	 tCAtHTm/jeF5u+i+TS5dhIT1wvzxfDQ83RgvOVRzfjptO2wZttzZF659EqOxQ7W+b8gt6
	 00VqL0lg5kJZhuCilCMysKxegPJysA4TnKuvo3JZ8rrBwc4fBTki77CZV3oxeUiQ56th4
	 KBeCUYGPGSRiFNpDNYOSCaZE72hUAsyLsVu1jjFz43y5pZGyRSYSXSx9kGxTo+8Mwew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794620645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gVcYrHxuKjjRDsavX/u54wCI8Z5NBBro/KfpNW0Hgew=;
	b=oijc+YbpvwGrj3z2iGtcn3y9fg32AHL+KiapNIHMiL8gHf+yDhYUN59jg4Fbv1sEEi4+
	 0KZc6VsTc3iZIilUONz22f/K8F4HwMgoioNDoEr4jCskjjjXzfmyqMLbdhSgaafzsd/5r
	 uw/jr8s2EKfmetQGcnCazZTqvarXjk27TLvq7ZVB0d1m1Ombf77yu7ALO+UyxnhieZ3ks
	 D3eU1I0qaZBKCXVUi+7wfsTOk05y2E27DI5LUjU0iet6MH1OU0Ylaf2gIV4hFxW+ND0dp
	 +/OVxLHaynv2BqRxn36edHN0Tam7EGIuMvPByPB24jFx7Q32YsefxaqXNE5oS526mYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RXzirdB4;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBBF606A8B8
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BBBF606A8B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RXzirdB4
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d473cfff6so256699566b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794620642; x=1795225442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gVcYrHxuKjjRDsavX/u54wCI8Z5NBBro/KfpNW0Hgew=;
        b=RXzirdB4/lzGo1FWFzbeU8jyI7qQ1H5YVJ6w8stZJUyRwqrurdyToSfuEBFNtGBYOo
         BJcAYe8K0CV6DZEu7OysWE8tRiBg1r5Eh7B0Ry8DBIwUAc7b44alwBpN+fDgxPDBd0cr
         MTkPrXS8WpCiTVHi/pSH3QMqYrVIBY2b/cAusB+7/UJ0XaK7o89LoUwBcbhTJHAmtxHp
         e/x4jxT2Q4S71GXBL4RAYB63YZS9W7nF+LryeQrpBoeLDyt77NqpG4NDh6j0mUrSlnBd
         //ssqvCIX0PRpZWIbU4h1L02s8UDj51QWbB1uiyUtxZ2Xbd86VXS73J7I7vQlNLy5DZo
         xdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794620642; x=1795225442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gVcYrHxuKjjRDsavX/u54wCI8Z5NBBro/KfpNW0Hgew=;
        b=r7WTgm2+wIQNxloq3zXDkT7974qmElzERYvLLzT5QZDrlW6CIU+3sx8KKGp9mpuD6H
         qyH5ePk0sc06OEhWu13aU+JnL7frpcRwMeKzW4IUVhss0/R46u+oVDM255BsIAM6J8dv
         AaGRVdFXW+zB/ksfE132pWlXcZh/Vhv8pTOeTzkbzGxfTXXgcSuqjkmvctCdYXuwPXqG
         bOZMMdhCwUcN1UExLO/H6gWKxwTT0jex1+SrkoSQqT8jO/sIGywJse8dVJkSfiDtHMbP
         diCMFqUUU7+6jwDIbSqrTi8bFG9kbIdew/guoTdxe9GUKKUWFF/IgEhMJkXAI4EyEP2I
         uDbQ==
X-Forwarded-Encrypted: i=1; AL+hErFbBDMEM9DeE9KWrWp1K1bX4Hc90K9t2ApfE29DkvITjcm+hwRQw0UQO/jN9Byg26wZbz698nvBHhniIPU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Z3+bbrzu+ivzWWPPDwa9fHBB+FChp1o5qRPQuhLAk7nhPYQSB
	mE/yok6K8ZciSo/3u8E6kmyeBk3vbOFui6oNI89vDsAHgUb3OAYvvGtm
X-Gm-Gg: AYBFou1h3UOh4xWSGrQ//E3CdzgS+8DFnbbWBTl8NY/uojidChDxnOVP6FYeGuuFwD5
	GPjAZl6FRiQrX3JD15VOySXC0I4n4YTfPcLIfKn9EJt7AaGj2daRpeBuGgAVoeLn6C6x9jP9Onv
	JNnUs95hPy/J5k8g8+Gj/CU8ct0ORGnxItUmko3sEjJDLFWPrjYAacEQ+VZ9cyEOfeh5iC60Igs
	tsOVkGRGIevbn+OcOtf0mKoEwlTELaMmh8mLjd5DRUqA8NbFQp9Yp73ieki61vnQbQmXpT7gyf/
	fcajt8hvUDRC5p/COOdTXzSDLV0gr/Znxlmxt7aY3y3tN4lr8EGEqUqD3xiW/JWl99zarLFHJXS
	b4J4pJSUJcBdFiaMYxNfAfNbCq1b2SRNGaPivNnJSDV19aUDtUBc9orF7LhnZ3ouWGZY5poBO6V
	ZyKprByqNvtZtvCwZatwZMKd1tXLkwc0br3vDhLrX8aKA28mFi58pGfkMyhYRnJsZtPVKP1BQwv
	r31leMVVkxdGdLobm+qlzDQHtpR6qfeU47kJton1hQm47yA+AJGWVakjYWSHZHHTkL9UwuK12zK
	ygJcFQd6nFFVEKl+6xmnlgpUyG0xKJGHYg0Pr5TAv62KN8JdW0Ye90MiqT0gNtG1AXwB9X0fs/u
	mMt4UV1hwzgUDai4JvolIau4=
X-Received: by 2002:a17:907:96ac:b0:c29:3c97:c994 with SMTP id a640c23a62f3a-c50963bd677mr349321366b.35.1794620642059;
        Fri, 13 Nov 2026 17:44:02 -0800 (PST)
Received: from SMOK.angora-ide.ts.net (mm-156-219-126-178.vitebsk.dynamic.pppoe.byfly.by. [178.126.219.156])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b5a4c1sm161402666b.48.2026.11.13.17.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 17:44:01 -0800 (PST)
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
Subject: [PATCH 5/7] drm/i915: Arm joined pipes within one vblank evasion for VRR
Date: Sat, 14 Nov 2026 04:43:33 +0300
Message-ID: <20261114014335.2132756-6-elxreno@gmail.com>
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

All joined pipes run off the transcoder of the primary, so one vblank
latches every one of them. On the MMIO path each pipe nevertheless
goes through its own intel_pipe_update_start()/intel_pipe_update_end()
critical section, one pipe after another. When the vblank falls
between two of them the earlier pipe latches its new state a frame
ahead of the later one, and for that frame the halves of the screen
come from different frames.

With VRR that gets worse, as the commit ends the frame itself: the
push at the end of the primary's section latches whatever has been
armed by then. Commit the joined pipes together when VRR is in use:
do the vblank evasion once, on the primary, arm all of them inside
that critical section and let the primary send the push at its end.
The evasion accounting, the trace events and the atomic update
failure check then run once as well, for the primary.

Armed this way the critical section takes 15 us on average for two
pipes on Arrow Lake (71983 commits at 240 fps: 71918 under 30 us, 16
between 30 and 60 us, 49 between 60 and 188 us), against the 100 us
the evasion allows for. The window is not scaled with the number of
pipes. The 49 are single MMIO writes that stall, not more work: the
instruction count is that of an ordinary section, the CPU stays in
C0, there is no SMI or NMI, and the register differs from case to
case. The per pipe sections of the same mode without VRR and with
the DSB turned off show the same stalls (15 of 72002 sections over
60 us), so they do not come from arming two pipes in one section.
None of them ran into a vblank.

The per pipe sequence is kept where the critical section has per
pipe work attached or the pipes need sequencing against others:
modesets, the atomic fallback of a legacy cursor update, async flips,
commits that need the vblank worker for the LUT load and commits that
change the DDB allocation of a joined pipe. The vblank worker is
needed on the platforms without double buffered LUTs, when a colour
update or a fastset has LUTs to load that can neither be preloaded
nor be left to a colour DSB. Commits that go through the DSB or the
flip queue are not affected, and neither is the commit sequence of a
joined configuration without VRR. The latter has the same race
against the fixed vblank, it is left alone only to keep this change
to the case that can be tested with it.

On the platforms with double buffered LUTs there is no vblank worker.
Where no colour DSB is used the LUTs are loaded with MMIO inside the
critical section, which here is the joined one and then loads them
for all joined pipes. I have no such hardware and have not tested
that.

No functional change yet, VRR is not allowed with the joiner.

Signed-off-by: ElXreno <elxreno@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_crtc.h    |  1 +
 drivers/gpu/drm/i915/display/intel_display.c | 88 ++++++++++++++++++++
 3 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 139c9dae536e..f41616a060b5 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -487,7 +487,7 @@ int intel_crtc_get_pipe_from_crtc_id_ioctl(struct drm_device *dev, void *data,
 	return 0;
 }
 
-static bool intel_crtc_needs_vblank_work(const struct intel_crtc_state *crtc_state)
+bool intel_crtc_needs_vblank_work(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 
diff --git a/drivers/gpu/drm/i915/display/intel_crtc.h b/drivers/gpu/drm/i915/display/intel_crtc.h
index 12507b51ee77..0478394b01e8 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.h
+++ b/drivers/gpu/drm/i915/display/intel_crtc.h
@@ -50,6 +50,7 @@ void intel_pipe_update_start(struct intel_atomic_state *state,
 			     struct intel_crtc *crtc);
 void intel_pipe_update_end(struct intel_atomic_state *state,
 			   struct intel_crtc *crtc);
+bool intel_crtc_needs_vblank_work(const struct intel_crtc_state *crtc_state);
 void intel_wait_for_vblank_workers(struct intel_atomic_state *state);
 struct intel_crtc *intel_first_crtc(struct intel_display *display);
 struct intel_crtc *intel_crtc_for_pipe(struct intel_display *display,
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index aa03f674d93b..1fda1bb15674 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7151,12 +7151,100 @@ static void intel_post_update_crtc(struct intel_atomic_state *state,
 	}
 }
 
+/*
+ * All joined pipes run off the transcoder of the primary, so one
+ * vblank latches every one of them, and with VRR the commit itself
+ * ends the frame with a push. The arming registers of all joined
+ * pipes then have to be written within a single vblank evasion
+ * critical section, with the push at its end, or the pipes may
+ * latch in different frames.
+ */
+static bool intel_crtc_needs_joined_update(struct intel_atomic_state *state,
+					   struct intel_crtc *crtc)
+{
+	struct intel_display *display = to_intel_display(state);
+	const struct intel_crtc_state *old_crtc_state =
+		intel_atomic_get_old_crtc_state(state, crtc);
+	const struct intel_crtc_state *new_crtc_state =
+		intel_atomic_get_new_crtc_state(state, crtc);
+	struct intel_crtc *pipe_crtc;
+
+	if (!new_crtc_state->joiner_pipes)
+		return false;
+
+	/* FIXME do this for the fixed refresh rate case as well */
+	if (!old_crtc_state->vrr.enable && !new_crtc_state->vrr.enable)
+		return false;
+
+	/* FIXME the cursor unpin works are set up per pipe */
+	if (state->base.legacy_cursor_update)
+		return false;
+
+	for_each_intel_crtc_in_pipe_mask(display, pipe_crtc,
+					 intel_crtc_joined_pipe_mask(new_crtc_state)) {
+		const struct intel_crtc_state *old_pipe_crtc_state =
+			intel_atomic_get_old_crtc_state(state, pipe_crtc);
+		const struct intel_crtc_state *new_pipe_crtc_state =
+			intel_atomic_get_new_crtc_state(state, pipe_crtc);
+
+		/* The DSB and the flip queue do their own vblank evasion */
+		if (new_pipe_crtc_state->commit_type != INTEL_COMMIT_MMIO)
+			return false;
+
+		if (intel_crtc_needs_modeset(new_pipe_crtc_state) ||
+		    new_pipe_crtc_state->do_async_flip)
+			return false;
+
+		/* FIXME the vblank work is set up per pipe */
+		if (intel_crtc_needs_vblank_work(new_pipe_crtc_state))
+			return false;
+
+		/*
+		 * A changed DDB allocation must be sequenced
+		 * against the other pipes one pipe at a time.
+		 */
+		if (!skl_ddb_entry_equal(&old_pipe_crtc_state->wm.skl.ddb,
+					 &new_pipe_crtc_state->wm.skl.ddb))
+			return false;
+	}
+
+	return true;
+}
+
+static void intel_update_joined_crtcs(struct intel_atomic_state *state,
+				      struct intel_crtc *primary_crtc)
+{
+	struct intel_display *display = to_intel_display(state);
+	const struct intel_crtc_state *new_crtc_state =
+		intel_atomic_get_new_crtc_state(state, primary_crtc);
+	u8 pipe_mask = intel_crtc_joined_pipe_mask(new_crtc_state);
+	struct intel_crtc *pipe_crtc;
+
+	/* Perform vblank evasion around the commit of all joined pipes */
+	intel_pipe_update_start(state, primary_crtc);
+
+	for_each_intel_crtc_in_pipe_mask_reverse(display, pipe_crtc, pipe_mask)
+		commit_pipe_arm(state, pipe_crtc);
+
+	intel_pipe_update_end(state, primary_crtc);
+
+	for_each_intel_crtc_in_pipe_mask_reverse(display, pipe_crtc, pipe_mask)
+		intel_post_update_crtc(state, pipe_crtc);
+}
+
 static void intel_update_crtc(struct intel_atomic_state *state,
 			      struct intel_crtc *crtc)
 {
 	struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 
+	if (intel_crtc_needs_joined_update(state, crtc)) {
+		/* The secondaries are committed along with the primary */
+		if (intel_crtc_is_joiner_primary(new_crtc_state))
+			intel_update_joined_crtcs(state, crtc);
+		return;
+	}
+
 	switch (new_crtc_state->commit_type) {
 	case INTEL_COMMIT_FLIPQ:
 		intel_flipq_enable(new_crtc_state);
-- 
2.56.0

