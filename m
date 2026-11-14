Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794620640;
	b=fgjBXjFQRUm6pN58NVxdBFXf+LTZXat0esK2haq+iEIwdtF7nietZcvfhQIB/NFlc7AZ
	 s+1MSFHVonUpTjQLwpbWsBUihOQWvJDgdTGa98bYL23znom3RPDnGXdTDsulMOXc6B5H9
	 o12JK/CKPBbgHr/fczv41mNd0qvKF9iDxpprVzTbTLR53KhePLbE/r150N2fQrHz9DpDW
	 4DP0/sdlPJhthfQJ3tZ4W2KnMyQ67JHB3EDkaM6jy9oP5I+4Z/UBL3vLY8i5u++7LFFao
	 JdyEmgANOI/N4IcPjedG6gkaWq2FxWEDYxU7dQdg5+rkoDlcsBQnaj6tptTYgNSnWxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794620640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pqbc+Iv+L3kyD9FoDQGOW1amYeE8uWPjW4ipo2/GpSE=;
	b=Q+79F5xeMlgruK2o0+1TIn7N9EdlsrN/6QlakEUpZoqQryT5zNp1ssH6MNwYps8lr0ui
	 Am7rqxRDslWb+BRXRzyvQIRy7o7vb8uTi6T8CZk3kki/4YhAG15xQR/TLJ1bGA/gHHsRn
	 +1japNIknJghxPRNqlv9T9FbsUmfF0prcIGQ1Lc7XlOXFsa9NOxkuzG4lij5QBH3m+Gf2
	 ciz6ybmqo1H79N/TCZW7Q789DKhaoY9tvPKJ+iyVwZgN1KucSPPVleN0Bjmfh2oBV5TEO
	 hKOp7UKM1k4wRPFj7Z2Kh3Jd4NHLRmNz02vGSYNILHbKlseCrFHNEnh/g2x4LknfnBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UynO5Kgw;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD575606A334
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD575606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UynO5Kgw
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c50aaad19fbso89220766b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794620636; x=1795225436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pqbc+Iv+L3kyD9FoDQGOW1amYeE8uWPjW4ipo2/GpSE=;
        b=UynO5Kgwo/nddHS4lutv+Wkw4/V2WDXMKTekqV3XVZomrnXS7WY5UKmo52l/tryhCf
         KSH4MiIJ+219Nztb46ZoNik7/MH/rp0ZHAGfYrLvO98M4QBSNC1+JkIPuTFg6DGiNpOQ
         sRHXznfaRXx29DsfbxNG0NwWm5fWlCOh/lTVf0ID3dZkrVRQTXUCglNc0teuzimQddDI
         GJvxmy0woG1lcYD5kyDghqaiFGeHrt8oAA0ym1U6PvbzhsziKfL813EsFAHOUiZcgXmB
         hF0J+wutbwUl9lKTIgwmADqpmNEIZxXqRPSyl6cb4RioagoZ1fXYjPvqrWrfs6dD1ckg
         atrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794620636; x=1795225436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pqbc+Iv+L3kyD9FoDQGOW1amYeE8uWPjW4ipo2/GpSE=;
        b=wo8e9pRnN1oUVMjho8eDn+qJNb3LlH7oBcPbtxoSSRYcU6v6I4CO++fM2E3t2Vy/LB
         1XMCSBy5u4DnCFobCzzuSthKyKBZqudx1UuxyAwV7J6gMxRhbF4olsJ7HuKaEz80QeKY
         G89KrKtIhWD7wXRVoI2v6Tl850gEehQp5GtctDs6YQQ11YcW5P89XIsCodQnhobvQMXa
         vtWzaOgTr3JxtSWHA+OMAIbjKvE6L84td2FAsFAWEUJLVhp+Mf1I9pwCEdFprBPtqckf
         XdfFRSM9551X2su3MvE5eJqXyCPdlm4BviS7tAUZuSotjKoIF6byJFDG+OnWlIpUoKcE
         TJLg==
X-Forwarded-Encrypted: i=1; AL+hErEJsrW57ags2N8kcIuUtKy7L13lPLoM3FlVryQc0t0uChRXIIDZ5ztpP6QfwIXD7CZUlpzvQ5fba1PoNAs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IpF/0Jl4Z3UZW9U06lpBvQkVa9jfIi/e0fZaxNTy3Y7ynFhX8
	OLwUEXsfqJMLRI1VZiFUq6mY2zYLhgDlRNrCTv/TyW28doT9n71MHE7k
X-Gm-Gg: AYBFou10dWpgglC8K6tn65tA9NnX/i5YDMa1yFP3p7d2t0PKAOMezkCVOBgwCjsj2Lm
	EKlAeci/EnoLS/0BhKNxhfx0zWX5kr/IwWXXtxTxeueYXu82Bafm6XdmucuRikRniipinb5NHqe
	3TTe84U65hfeEA53tgb5F87bv9InlisFNFFAWKDo5o7TNm2sQD4iPMQI0hHELSzE3fTBk0197Za
	ICfeOV5MOaJrhWy51f0GSZ142Y9XDQ+OZf01hfp+Q3Lg825cfBJDmRibrT3AokZ9cPRV++o9CQ5
	/k6kC6i8lO7eUL/Msxv/56Q8x8oqRalQRLok/Mu/UzFbmrALGWZOqKibH6Ak3eMuWh+axr/MQtH
	KWBRJV4vQZr7Sv4OiA9oXDkrxHAH1nHEalq0apaeXkD3BrbeHa8JK/ujhMFmhQbHCxgn5e8INbU
	Ji9Uqqac4a24S1lIYx0kd8QENfXtxCnDi/jCCrzEHhd4gIn/GqqLqA9FqC08ATVtbSLmTU9FVoZ
	UCbV0/xV/KUKXYz1dQSsBmCkbC2e/kLTvmNVGJcdj6Vzni87Ubs+Wt4X8oea60MNN6oaHPHuuR6
	7w2kfsEc8tBgb3OMKfkyeNOzNYfjK7A0RgdJQ6XBTMaHgPVj8JnbYeMN6S2vNXC3wYk+0wvpqhe
	id0u1TQlxbGe6mLe4fQmzRFk=
X-Received: by 2002:a17:907:1611:b0:c50:564b:c63 with SMTP id a640c23a62f3a-c50961d365bmr338389066b.6.1794620636011;
        Fri, 13 Nov 2026 17:43:56 -0800 (PST)
Received: from SMOK.angora-ide.ts.net (mm-156-219-126-178.vitebsk.dynamic.pppoe.byfly.by. [178.126.219.156])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b5a4c1sm161402666b.48.2026.11.13.17.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 17:43:55 -0800 (PST)
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
Subject: [PATCH 0/7] drm/i915: VRR with the pipe joiner
Date: Sat, 14 Nov 2026 04:43:28 +0300
Message-ID: <20261114014335.2132756-1-elxreno@gmail.com>
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

This series allows VRR on modes that need the pipe joiner, such as
3840x2400@240 on the eDP panels of current 18" laptops. So far such
modes are kept on the fixed refresh rate timing generator.

What was missing is the sequencing of the transcoder level VRR
operations (timings, enable, disable, push) against the pipe level
updates of the joined pipes [1][2]; joiner + fixed_rr went in as the
first step [3], commit 0ec46988ae6c ("drm/i915/vrr: Allow fixed_rr
with pipe joiner"). Here the sequencing is done on the MMIO path: all
joined pipes are armed inside one vblank evasion critical section on
the primary, which then sends the push.

Tested on one machine (BOE NE180QA1-MM1 on Arrow Lake-HX, DSC, pipes
A+B) with a backport to 7.3.4. On drm-tip it is build tested only.

 - patches 1 and 2 fix two int overflows that a 2342.4 MHz pixel
   clock runs into
 - patch 3 leaves the VRR timings, enable, disable and push to the
   joiner primary
 - patches 4 and 5 arm all joined pipes inside one vblank evasion
   critical section when VRR is in use, with the push at its end
 - patch 6 makes the per pipe vblank evasion that is left look at the
   scanline counter of the primary
 - patch 7 allows VRR with the joiner and keeps such commits off the
   DSB

Why not the DSB: each pipe runs its own DSB and nothing orders them
against the push. A port that only skips the push on the secondaries
gave "DSB 0 timed out waiting for idle" on the secondary 13 times in
27 minutes, details in patch 7. I don't know whether the DSB of the
primary could write the plane registers of the other pipes, which
would allow one DSB for all joined pipes. If it can, that is the
better end state and I'd be glad to hear it.

Why one critical section: with one evasion per pipe the secondary can
latch at the vmax boundary a frame ahead of the primary. Sampling
PLANE_SURFLIVE of both pipes through MMIO, the halves of the screen
showed different frames for one frame in 9 of 20777 frames over
three runs with the per pipe sections forced.

With the series, same machine and method:

 - no such frame in 18028 frames of plain flips with VRR on, no DSB,
   vblank evasion or push errors
 - the joined critical section takes 15 us on average for the two
   pipes, against the 100 us the evasion allows; 49 of 71983 took 60
   to 188 us on a stalled MMIO write, which the per pipe sections
   without VRR show as well (patch 5)
 - the flip event follows the new surface going live by a median
   12 us, and content at a steady 240 fps is paced at 4.17 ms at p50,
   p95 and p99
 - VRR can be toggled at run time. With LUTs loaded, as here, turning
   it off is a joined commit with the colour DSBs, turning it on
   takes the per pipe sections with the vblank worker

Still on the per pipe sections with VRR and the joiner, and so still
able to latch the pipes a frame apart: modesets, the atomic fallback
of a legacy cursor update, async flips, DDB changes, and commits that
need the vblank worker for the LUT load. On the platforms with double
buffered LUTs the latter stay joined and load the LUTs of all joined
pipes with MMIO inside the critical section, which I could not
measure. LRR and DC balance are kept off with the joiner. The commit
sequence of a joined configuration without VRR and the guardband
computation are not changed.

Not tested: IGT, anything on drm-tip beyond the build (i915 and xe),
LNL and later (PSR/Panel Replay with VRR and their guardband terms,
double buffered LUTs, the always on VRR timing generator), PSR2/Panel
Replay with the joiner, the ultrajoiner, anything but eDP, a colour
update that changes the LUTs while VRR stays on, and the refresh
rate change that patch 1 fixes. Suspend/resume was only run on an
earlier version.

The base EDID range of the panel ends at 120 Hz, 240 Hz is only in
its DisplayID Adaptive-Sync block, so testing this needs "drm/edid:
Read the monitor range from the DisplayID Adaptive-Sync block", sent
separately to dri-devel [4].

On tooling, per Documentation/process/generated-content.rst: this
series was written with an LLM coding assistant (Claude Code). It did
the source and mailing list archive analysis, wrote the patches, the
changelogs and the measurement scripts, and ran the measurements on my
machine under my direction. The scripts are in [5]. I have reviewed
all of it and take responsibility for the result.

[1] https://lore.kernel.org/intel-gfx/20250224061717.1095226-14-ankit.k.nautiyal@intel.com/
[2] https://lore.kernel.org/intel-gfx/Z7N9RHhQDltsygA_@intel.com/
[3] https://lore.kernel.org/intel-gfx/Z78vx24DwelqHTc9@intel.com/
[4] https://lore.kernel.org/r/20261114010749.1949247-1-elxreno@gmail.com
[5] https://gist.github.com/ElXreno/c2e6e6f34b056efaf99c238772cf74a3

ElXreno (7):
  drm/i915/panel: Fix the pixel clock overflow in the VRR vtotal
  drm/i915/vrr: Fix the pixel clock overflow in the vmax computation
  drm/i915/vrr: Leave the transcoder to the joiner primary
  drm/i915: Split intel_update_crtc() into its stages
  drm/i915: Arm joined pipes within one vblank evasion for VRR
  drm/i915: Evade the vblank on the scanline of the joiner primary
  drm/i915/vrr: Allow VRR with the pipe joiner

 drivers/gpu/drm/i915/display/intel_color.c   |   4 +
 drivers/gpu/drm/i915/display/intel_crtc.c    |   2 +-
 drivers/gpu/drm/i915/display/intel_crtc.h    |   1 +
 drivers/gpu/drm/i915/display/intel_display.c | 189 +++++++++++++++----
 drivers/gpu/drm/i915/display/intel_panel.c   |   4 +-
 drivers/gpu/drm/i915/display/intel_vblank.c  |  12 +-
 drivers/gpu/drm/i915/display/intel_vblank.h  |   2 +-
 drivers/gpu/drm/i915/display/intel_vrr.c     |  56 ++++--
 drivers/gpu/drm/i915/display/intel_vrr.h     |   1 +
 9 files changed, 217 insertions(+), 54 deletions(-)


base-commit: f40cc5e715fe9e7a5e61f7cd44f63f68c1625f2c
prerequisite-patch-id: c7f9956bca76130b71364377ca611051a16f466c
-- 
2.56.0

