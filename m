Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D2E23504B
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 16:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788106634; cv=none; b=rcqhpj9ij8awwimPzRehfjIwxDuKHDUkzhjmZIpncVA7RZCSdRVGDT8LNgUT53PSyycL+Nrra4cxPGKOXDoelYxBZvvIsAycFQme+isUwwBqzvZqRhDfY5nP2I3fpQdITvpDy8ePWUPyYpnztRv7i7Bd9Tb4Ypt6CI0V93tW5Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788106634; c=relaxed/simple;
	bh=jG4p12G/CQ1ZjG5NQAlKtx3LeyZRrem6V1EyN8Sp7lE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bh+NZDUJE3O9zxzHl0w7TKo8E5q+IRfAHin8avFLUWD2PTesd7Sy1sm1wiKOWO//6r0FbpsmGkZWD9Zz7u9Zi1HamCcj62zrglf4ic2USqxS+Ui2tQulUxj7ofd9Asm1vmgBpOvMmX39wm2MBPcTrhmlm5W+dxNarUyyULTB2gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dgz4FpD2; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dgz4FpD2"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8541875f596so1120202b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 09:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788106632; x=1788711432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=54C0fnQ3Auto948vkBDj75sqdB7k3c+Pc38gSCW7U00=;
        b=Dgz4FpD2d67P5aH/KpxwfdP9j3Ivf7Vxmg1n7cb4c0NlKN7vW5HwyvofzB37CHYZeB
         pql8LkKkrE+vyJO/eJb0moQ5P71XYTDZskPYipTU4dM+Oo6AS2+HZiYsDEfo+AanH27B
         tbLHBuAye2X80xRgORK24tsLwjZEqPhI9X7Z6zaOYydbr5L1qmLgeOGp1RfTlTLdhMON
         Jxm4o8Go6VIy1dXjALvIDvEsybBPA8qAcTqibBogvLOVBIJWNdfIuGGGr9TLV+NOAobk
         Tw4LP1mbFvlAtkGm9AterOse5o8GhGrFmiz7+boYbVcFIwmzsPWq7s7eMvy29VkoF/ye
         Pa2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788106632; x=1788711432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54C0fnQ3Auto948vkBDj75sqdB7k3c+Pc38gSCW7U00=;
        b=HcLPEkkq/y4kqlNhNTZJOQCMtaT1a7PbrFt/7/XImhyVlHz6YzfaHXJ/f8A0FwZkm+
         25nd8v+cugsPJBrACW6+d9MTdMz6pmAkpmSN5b6tuvbTLVioCHLVAYsHBd4NS96I3LUO
         XCVmkEHedvkXZKQvHIzuBO7QjiF2SU/QMtGfqAtkl9lnMIGYIHY4W4L5JL2JfoUknqBs
         X1MTWxX6rQDCicdWhoB+igqnS9otqJIixtG7Ma70VZuxF3cNUIyOTjqK6wL1P0Bl9cIx
         I993qd52pzidMEnB8z3y2rq8ulop5glQVjF9PaEFg3YyifSjIDk60SHBrbyb2/nw3Xw5
         /blg==
X-Forwarded-Encrypted: i=1; AHgh+RpXE6djB6OiMMbGoc9NKr29SdQpBZKHesONq7wpo5S1znqIXqZcU964nTY3y693D6G4V8+MRTDMvwJIC+A=@vger.kernel.org
X-Gm-Message-State: AFuF++kKk/YmurCV4PknohnNRDToeeJFpfo0sOL9Cf4icue7AIeLZOHi
	rXh3o4J3hko+wFy2EFQKZ7/VB0xXF5g+Vckhzx1I8NWRZfLaqhsCv1k=
X-Gm-Gg: AR+sD11CyWaXQXTFzP+9WGCO4RppK1jZNgIIQ/AjMeIpMGaa9+uR/UdqgdqiPsEw7yO
	nvYy6GqADLoJmIhJQ3UQdatggmN5oiD2li60otQ2IB5JatCRQSo5boCkl7OF47dpQpiZrm7t75N
	1C+YtiuYhhAmqMywFu8FJ/zxhqTksHLIXCCUfy7gL653eT+KxzKfM50krHejkdtihl6pYGNmzQc
	h64+va6MTrUGfyFevbpHgSqrY1/enil2dtpvVL16r5FtdqrAbaDcKxKVkMEIF/LlcsF6ct1Yb3Y
	xlB8Puqs267d9nB2eII7OTdBSWE2FyZtxhbGTHIrcnhixJaqkYvoXBPFobHTtdy8bHiEEoCZJq9
	ze24dO0pV/U+tIMn8EDCFvsI9/lWL6UxCV7prziCZB/5Q864hN+7pWPgiAZ9ix/fjoHcN8wj70M
	2VWK2LYqXhtviO3LPCHYs0n4s8cq8OAvL7eFUhqZZThm5/RFOtlqE+tBeBPEpRFajS
X-Received: by 2002:a05:6a00:a118:b0:847:8449:2bb6 with SMTP id d2e1a72fcca58-8562953d5e9mr34140137b3a.4.1788106632245;
        Sun, 30 Aug 2026 09:17:12 -0700 (PDT)
Received: from fedora ([2601:602:867e:54e0::bc1f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f32f727bsm3008661a12.7.2026.08.30.09.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 09:17:11 -0700 (PDT)
From: Eduardo Diaz <iamedu@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Eduardo Diaz <iamedu@gmail.com>
Subject: [PATCH] drm/i915/cdclk: Don't trust boot readout for per-pipe cdclk/voltage tracking
Date: Sun, 30 Aug 2026 09:17:03 -0700
Message-ID: <20260830161703.11570-1-iamedu@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Panther Lake (xe3lpd) laptops, cold boot reliably corrupts the
internal eDP panel: pipe A gets a "Selective fetch area calculation
failed in pipe A" warning immediately followed by a CPU pipe A FIFO
underrun, and the panel stays corrupted for the rest of the session.
A subsequent suspend/resume cycle (or any other full re-modeset)
"fixes" it, which pointed at cdclk/voltage-level tracking rather than
a genuine hardware race.

intel_modeset_readout_hw_state() runs once at driver probe (and again
on resume) to figure out what firmware/GOP left the display in. For
each already-active pipe it calls intel_cdclk_update_hw_state(),
which seeds cdclk_state->min_cdclk[]/min_voltage_level[] directly
from the freshly read-out crtc_state. That treats "firmware left this
pipe active with mode X" as proof that this driver's own cdclk,
voltage-level and DBUF setup for mode X is already established in
hardware. It isn't -- only firmware's own, entirely separate code
path has ever touched those registers.

The OS driver's first real modeset for an inherited pipe typically
targets the same native panel mode, so the freshly computed
crtc_state->min_cdclk/min_voltage_level trivially match this
readout-seeded baseline. intel_cdclk_update_crtc_min_cdclk() and
intel_cdclk_update_crtc_min_voltage_level() then conclude nothing
changed and skip the recalculation, on the one commit where it
actually matters: taking a pipe from firmware ownership to being
correctly configured by this driver.

Fix this in two parts:

 - Invalidate the per-pipe min_cdclk[]/min_voltage_level[] tracking
   right after boot-time readout, so the first real atomic commit is
   guaranteed to see a difference.

 - Stop early-returning in intel_cdclk_update_crtc_min_cdclk() and
   intel_cdclk_update_crtc_min_voltage_level() based on the crtc_state
   comparison alone. That comparison is unreliable for exactly the
   same reason (it's derived from the same readout), and skips the
   real, tracked-state check below it.

Bisected on real hardware (Lenovo Yoga 9i 14IPH11, Panther Lake) down
to a narrow window between v6.19.10 (clean on every cold boot) and
v7.1.10 (broken on every cold boot); confirmed via live kernel
tracing that the skip path fires unconditionally on this platform
from the very first post-boot atomic commit onward. This fix
eliminates the FIFO underrun across many consecutive cold boots on
the same hardware, with no regression observed across suspend/resume.

The investigation and this fix were developed with the assistance of
Claude (Anthropic), driven and verified end to end on the affected
hardware by the Signed-off-by below.

Signed-off-by: Eduardo Diaz <iamedu@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c    | 45 ++++++++++++++-----
 drivers/gpu/drm/i915/display/intel_cdclk.h    |  1 +
 .../drm/i915/display/intel_modeset_setup.c    |  1 +
 3 files changed, 36 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index a53d887271..209a2373d1 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2981,11 +2981,14 @@ static int intel_cdclk_update_crtc_min_cdclk(struct intel_atomic_state *state,
 	bool allow_cdclk_decrease = intel_any_crtc_needs_modeset(state);
 	int ret;
 
-	if (new_min_cdclk == old_min_cdclk)
-		return 0;
-
-	if (!allow_cdclk_decrease && new_min_cdclk < old_min_cdclk)
-		return 0;
+	/*
+	 * old_min_cdclk comes from the previous crtc_state, which after
+	 * boot-time readout reflects whatever firmware/GOP left running,
+	 * not what this driver has programmed. For an inherited pipe it
+	 * equals new_min_cdclk by construction (same mode, same formula),
+	 * so an early return here would skip the recalculation that
+	 * matters. Always continue on to the cdclk_state check below.
+	 */
 
 	cdclk_state = intel_atomic_get_cdclk_state(state);
 	if (IS_ERR(cdclk_state))
@@ -3026,12 +3029,10 @@ static int intel_cdclk_update_crtc_min_voltage_level(struct intel_atomic_state *
 	bool allow_voltage_level_decrease = intel_any_crtc_needs_modeset(state);
 	int ret;
 
-	if (new_min_voltage_level == old_min_voltage_level)
-		return 0;
-
-	if (!allow_voltage_level_decrease &&
-	    new_min_voltage_level < old_min_voltage_level)
-		return 0;
+	/*
+	 * old_min_voltage_level is unreliable for the same reason; see
+	 * intel_cdclk_update_crtc_min_cdclk().
+	 */
 
 	cdclk_state = intel_atomic_get_cdclk_state(state);
 	if (IS_ERR(cdclk_state))
@@ -3705,6 +3706,28 @@ void intel_cdclk_update_hw_state(struct intel_display *display)
 	cdclk_state->dbuf_bw_min_cdclk = intel_dbuf_bw_min_cdclk(display, dbuf_bw_state);
 }
 
+/*
+ * intel_cdclk_update_hw_state() seeds min_cdclk[]/min_voltage_level[]
+ * from readout's crtc_state, i.e. from whatever firmware/GOP left
+ * running, not from anything this driver has programmed. A pipe's
+ * first real modeset usually targets the same native mode, so the
+ * freshly computed value matches this seeded baseline and
+ * intel_cdclk_update_crtc_min_cdclk()/_min_voltage_level() conclude
+ * nothing changed, skipping the recalculation that matters. Call
+ * this after readout so the first real commit sees a difference.
+ */
+void intel_cdclk_invalidate_min_tracking(struct intel_display *display)
+{
+	struct intel_cdclk_state *cdclk_state =
+		to_intel_cdclk_state(display->cdclk.obj.state);
+	enum pipe pipe;
+
+	for_each_pipe(display, pipe) {
+		cdclk_state->min_cdclk[pipe] = 0;
+		cdclk_state->min_voltage_level[pipe] = 0;
+	}
+}
+
 void intel_cdclk_crtc_disable_noatomic(struct intel_crtc *crtc)
 {
 	struct intel_display *display = to_intel_display(crtc);
diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.h b/drivers/gpu/drm/i915/display/intel_cdclk.h
index a60cbf745e..1517d3605a 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.h
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.h
@@ -46,6 +46,7 @@ int intel_cdclk_state_set_joined_mbus(struct intel_atomic_state *state, bool joi
 struct intel_cdclk_state *
 intel_atomic_get_cdclk_state(struct intel_atomic_state *state);
 void intel_cdclk_update_hw_state(struct intel_display *display);
+void intel_cdclk_invalidate_min_tracking(struct intel_display *display);
 void intel_cdclk_crtc_disable_noatomic(struct intel_crtc *crtc);
 int intel_cdclk_update_dbuf_bw_min_cdclk(struct intel_atomic_state *state,
 					 int old_min_cdclk, int new_min_cdclk,
diff --git a/drivers/gpu/drm/i915/display/intel_modeset_setup.c b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
index 6aed881737..c7be6e63e7 100644
--- a/drivers/gpu/drm/i915/display/intel_modeset_setup.c
+++ b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
@@ -880,6 +880,7 @@ static void intel_modeset_readout_hw_state(struct intel_display *display)
 	intel_bw_update_hw_state(display);
 	intel_dbuf_bw_update_hw_state(display);
 	intel_cdclk_update_hw_state(display);
+	intel_cdclk_invalidate_min_tracking(display);
 
 	intel_pmdemand_init_pmdemand_params(display, pmdemand_state);
 }
-- 
2.55.0

