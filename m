Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5853F475357
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790201531; cv=none; b=PpvnoYZoj56rhljl/Of2cholPLVmEPT9avN3iDCkTdcUCW4w8szjfyyRsrqmDZ4ygawSeY0y99iGxoiim6dIhMXMY+OLBza8QDZmC8jdIZFJr4N3H2abymlvAJCw4OUYHWd1GhG/d0OVmmf3bZxGQWV1yhWSk4hjhvpsInMNN14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790201531; c=relaxed/simple;
	bh=0J3P6qvjQVxdDdI1pZ1afZKyws9kpPkqptmywna2umw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PoN3Eu6Hijyg1U1d0BGRYP/PGoNGWQLrbZTMlc70QXrF6NWOrbyiyVgrAcXWah6x77q6BdDTI3xBle6hed669wp8SBGWr4Al7DcA1q+2X7LFBl5sJDjdFujkiwNECjCzfrco8PdAa8rxoPZlC5uS11jqAbEt8R3DQRiYSHMdxtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hC2PMmzV; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hC2PMmzV"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e66390995so9020605e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790201528; x=1790806328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=14msH1DLW+vh/dJJ1llExxyOzbLsmiOUyZtaLlxkEYY=;
        b=hC2PMmzVV7ffnGjOcW0yVItO81T+lHUIvr4HoCKh+/sOIKgQqnC5Qr5vNsYgtS/P4W
         FhyhLsa9EveAN9zFKGYKpGMx6AcFNSNQ+KtzdJjIeYflpmAlVTgq7NNNy6AltT9GQhPN
         /2L7xHLY28TFr+eDlCbdoHTpySWJVsg4IgXvBJrphD90JdcRJ1TMFJRx3uBCzLDQozzL
         gHEIa3J1gOUbREgChQ8VujgXgIXmrEZ4R7NF7Zr3Qi1Onxy2Bx+S7h/BVMzlMXL8es2Y
         /GS8IWvw6awJGHk+5C54rzAFDewIwsYi2OrMUVhpyR5WWkUgF8YcNZ5FflvtefkDvMPV
         fa0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790201528; x=1790806328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=14msH1DLW+vh/dJJ1llExxyOzbLsmiOUyZtaLlxkEYY=;
        b=ZbteiOS1VuK5poahe2wExi19tvlpVz04BstxgJdlt/UlYU7Nrq0Ulg4TuU/SmTzZMT
         yz9J8/tZ7LoSK2hLg59YdFSg0XOUSHupnaSdMK6xYwkM7VfzIdQn19/7nItnzPYiEHxu
         5rfWdWpN2NtZ4g3eOL/xzX3wvdO5b4EC0B7S3o3zwTwur3CrIUWfmq5EPE6NAoSXwmHd
         3qAuiwfLG1DFPTdXns+r4jgVf8YygAWE4odi4ah8C0K6RvuROoQQsySq8Xl3iz2/+RZK
         b7R9wpJdFRKC0PicXKuZ85kF4udFQtS6YODHwmR+Kkeix4FxHJANygcBD5CsZhXIRmhP
         eY4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxgZPmZWgg7cQuMr1Ax2Uo1NS1yIaPcMnGGVdfPfayiu7+cAiIMIiCIp9PgWSv1GsfHMx8XPVEWj8OTMXs=@vger.kernel.org
X-Gm-Message-State: AFuF++m+H6sCvFwMQBuZ3IRWssIGld8cAkXGCd0g9RQTfui4dutbiy2M
	Ezs/d8qbYBm2d9+tC1cI7vaan7pNdM3D/yYQ5P7xyKY9b/4e9ZGQk+EC
X-Gm-Gg: AYBFou3D8FI41O0ufKIzUwX+E1KXL18Q9fEp7qDAQ68IRqpyF8HyYemocn1lSGwCbBx
	/6r7nXsshuTaS6eASIkE3MfRcsVbIqxU0qu6DqbfC0W5HjyxSjCCxbelSyqeU6xKEm3BtwsKa3g
	FGTGT2LoWczsY0UDvznaYjHNrewnLaBm/rlwN+sG9Njt5hgrT/O+uGTXC6KfYX+VTSwlOFoxep/
	3tsAcojMmf2bIAnrzUlu/yUQJJ9p/RJ5gxUseCzUEIFUoCMDuEckrQ1iFJkLpo/ejQEYcpAEuTn
	Nh85yNGpC+TGvNVyTVkJHzgFL1Cb2gmfvPUHi1uwp7i/Bcv5pCoA361QPcHvhWBTuqswPONY1jH
	e6WtbqvXXINHKmVNsWJw2RgfCnIBFJ45Zw8QDglk9+smrnH2t0c45tWDTWJGnisQESpEzdD19bb
	cQm3hcGWYNJN3opbZpfucs8b9bDE6WwiUUbbOABvnjTGEW9xPq3qxaigbmGWN+TO5owXLMZsECn
	3Rzrb2uEeWJKzC2jDsm04ofazsDNXu0ewvVMfEpCOOT7bIuiL8ubUjt/OnbVkll4R2wPk/RiJii
	2c8aH6bK7JpFhNn1Aholk5e7TEgyb275TysfqJ8iAQcXgjg=
X-Received: by 2002:a05:600c:a00d:b0:49f:ce73:7ab with SMTP id 5b1f17b1804b1-49fe6708b23mr9674415e9.34.1790201528357;
        Wed, 23 Sep 2026 15:12:08 -0700 (PDT)
Received: from tulkas.localdomain (95f12971.skybroadband.com. [149.241.41.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm24977495e9.14.2026.09.23.15.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:12:07 -0700 (PDT)
From: Conor Svensson <conor10@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: Conor Svensson <conor10@gmail.com>,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com,
	joonas.lahtinen@linux.intel.com,
	tursulin@ursulin.net,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] drm/i915/dp: Ignore inconsistent TMDS limits on an Anker DP branch
Date: Wed, 23 Sep 2026 23:07:50 +0100
Message-ID: <20260923221018.42133-1-conor10@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reconnecting an Anker 565 A8388 USB-C hub with a DisplayPort monitor
attached can leave the branch reporting a DVI downstream descriptor
with 25-165 MHz TMDS limits. On a ThinkPad L14 Gen 4 Intel with a Dell
S3422DWG, this removes the native 3440x1440 mode from the connector's
mode list even though the EDID still contains it. An explicit native
modeline works with the same hardware state.

Ignore the derived TMDS limits only for the captured branch identity,
firmware and downstream descriptor when EDID 1.4 identifies a digital
DisplayPort input. Retain the raw descriptor and other mode checks.
Do not restrict the match to a particular monitor or laptop model.

With otherwise matching upstream Linux 7.2.5 control/patched builds,
the control loses native modes after USB-C reconnect, while the patched
kernel selects 3440x1440 at 59.973 Hz automatically. Repeated reconnects,
both USB-C ports, suspend/resume, undocking while asleep and docked boot
pass. HDMI also works and does not activate the workaround. Periodic
picture cycling observed on the control stops with the patch.

The branch identity is not proven unique to this retail adapter. This
is an experimental workaround for review, not an explanation of why the
branch reports inconsistent capabilities. Other adapters and monitors
have not been tested.

Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17180
Assisted-by: LLM
Signed-off-by: Conor Svensson <conor10@gmail.com>
---
RFC: is this best handled as a branch quirk here, or in the common DP
helpers? The captured identity and descriptor match is deliberately narrow;
there is no monitor/laptop model restriction. The informational log marker
is retained to show exactly when this experimental workaround executes.
The commit introducing the underlying problem has not been identified, so
there is no speculative Fixes tag.

Hardware A/B testing used upstream Linux 7.2.5 with otherwise identical
configurations. This RFC applies the same 48 added lines to drm-tip at the
base commit below. This drm-tip revision has not been boot-tested. The affected intel_dp.o
compiles successfully here with no compiler warnings; strict checkpatch
passes (human sign-off pending), and 426 predicate boundary cases pass
with ASan/UBSan. These predicate tests are not DRM integration tests.

Results: three USB-C reconnects, alternate USB-C port, docked s2idle
resume plus reconnect, undock while asleep/wake/reconnect, and docked
DisplayPort reboot all passed. HDMI also passed without activating the
workaround. The control lost native modes and showed periodic picture
cycling; that cycling stopped on the patched kernel. No custom modeline
was used in either test kernel. Other hardware and higher refresh rates
remain untested.

AI assistance: Codex (GPT-6) helped investigate the reported hotplug
failure, wrote the match/limit-clearing change, prepared the predicate
tests, collected diagnostics and drafted this message. The human reporter
performed the physical reconnect, suspend and reboot tests and confirmed
the visible results. The assistance arose from an extended troubleshooting
session, rather than a single code-generation prompt.

Evidence and detailed test results:
https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17180#note_3677750

This is my first kernel patch submission. I'd appreciate feedback on
whether this belongs here or in the common DP helpers, and whether the
matching criteria are appropriate.

Thanks,
Conor

 drivers/gpu/drm/i915/display/intel_dp.c | 48 +++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index ffddf4b33..6d6767ca7 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6153,6 +6153,39 @@ intel_dp_get_edid(struct intel_dp *intel_dp)
 	return drm_edid_read_ddc(&connector->base, &intel_dp->aux.ddc);
 }
 
+static bool
+intel_dp_has_anker_tmds_mismatch(struct intel_dp *intel_dp,
+				 const struct drm_edid *drm_edid)
+{
+	static const struct drm_dp_dpcd_ident branch = {
+		.oui = { 0x90, 0xcc, 0x24 },
+		.device_id = { 'S', 'Y', 'N', 'A', 'b', 0x10 },
+		.hw_rev = 0x10,
+		.sw_major_rev = 0x06,
+		.sw_minor_rev = 0x05,
+	};
+	static const u8 downstream_ports[] = {
+		0x0a, 0x42, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	};
+	const struct edid *edid = drm_edid_raw(drm_edid);
+
+	if (intel_dp_is_edp(intel_dp) || intel_dp->is_mst ||
+	    !drm_dp_is_branch(intel_dp->dpcd) || !edid)
+		return false;
+
+	/* HDMI and DVI inputs must retain their downstream limits. */
+	if (edid->version != 1 || edid->revision < 4 ||
+	    !(edid->input & DRM_EDID_INPUT_DIGITAL) ||
+	    (edid->input & DRM_EDID_DIGITAL_TYPE_MASK) != DRM_EDID_DIGITAL_TYPE_DP)
+		return false;
+
+	return !memcmp(&intel_dp->desc.ident, &branch, sizeof(branch)) &&
+		!memcmp(intel_dp->downstream_ports, downstream_ports,
+			sizeof(downstream_ports)) &&
+		intel_dp->dfp.min_tmds_clock == 25000 &&
+		intel_dp->dfp.max_tmds_clock == 165000;
+}
+
 static void
 intel_dp_update_dfp(struct intel_dp *intel_dp,
 		    const struct drm_edid *drm_edid)
@@ -6181,6 +6214,21 @@ intel_dp_update_dfp(struct intel_dp *intel_dp,
 		drm_dp_get_pcon_max_frl_bw(intel_dp->dpcd,
 					   intel_dp->downstream_ports);
 
+	/*
+	 * Experimental workaround for the branch observed in an Anker A8388.
+	 * USB-C hotplug can expose a DVI descriptor for the DP output. The
+	 * monitor's native timing works when requested explicitly, despite
+	 * the reported 165 MHz limit. Keep the captured identity and failure
+	 * signature checks narrow until the underlying cause is understood.
+	 */
+	if (intel_dp_has_anker_tmds_mismatch(intel_dp, drm_edid)) {
+		intel_dp->dfp.min_tmds_clock = 0;
+		intel_dp->dfp.max_tmds_clock = 0;
+		drm_info(display->drm,
+			 "[CONNECTOR:%d:%s] experimental Anker DP TMDS limit workaround\n",
+			 connector->base.base.id, connector->base.name);
+	}
+
 	drm_dbg_kms(display->drm,
 		    "[CONNECTOR:%d:%s] DFP max bpc %d, max dotclock %d, TMDS clock %d-%d, PCON Max FRL BW %dGbps\n",
 		    connector->base.base.id, connector->base.name,

base-commit: 703cd271db3a35088460ab3fec0a96bd48e7fe04
-- 
2.55.0

