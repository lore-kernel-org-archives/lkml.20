Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE80C30F95A
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 20:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791749922; cv=none; b=ujohnClgR2ZfDKnI0ABWN/LUyfPdNyqwRVD5y5gJIeTKblaBm19CyvjQVfWuEhM0r4QV5X0Y6/MYzYwI07xJ5lmnFCO32lKEc0KLXh0xh0nFc8QgaclSYfeVZQyiK26QeVXmYcRGYE8MVHLfmRD+kUk+iX/DXONcQic5LgTfS/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791749922; c=relaxed/simple;
	bh=HG66h51UdANrn0GRTiwQP7lTC/RZ9hPF2wtAAEhgp0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oUol3Ay5+cXp5oiazyDLKMgjVdUzGD93/zUO1R2rkRZOQh+Y+UwN88nJ6dB6yQHggdBpqU48N5FyKmVaHd7mvXLhVBfTKLOWinFZ8bh8uFWFuePeQeSpasimiEny6bZCeEed5AXP7UHTg2EkO+w59K/7cNeRDl6WNUGqx34bD5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVvyu7oo; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVvyu7oo"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso9740775e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791749919; x=1792354719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4r0SiIrdQL6I+if2NfEB+Q+sc22abdmSIZUKGGUGERQ=;
        b=mVvyu7oos0YqpJBWp9DdWBE8s4wUhgThrCq3pzQrQYiuOsISeFPCFL+z/uWU36t9qg
         tLD1nGBJHEk9s+BoM6UEjiK7Y3yLuHeWMvqYj6bviidYm/KZcM5F4oXnIUvcoc46cIlv
         FvjaKgB8/HW8u2N9r4Tjl8gWaOcatMSVauPZQzdoMtgxFG4nt55xCq21RBzCdETmdXLE
         O5NYbF4Y75MVW1A9RHZhnEmqsc3TDqpwt+lkJ4z9sq9YROEf2d4mW+bhqMzsAIWHPmLf
         99YnfXZGN7uTTdQdelj8OGl5MfBLFkETqx8walQhmlS131z2kG7Q1LNR5TveI1oG2zV6
         QqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791749919; x=1792354719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4r0SiIrdQL6I+if2NfEB+Q+sc22abdmSIZUKGGUGERQ=;
        b=ILHrDhlJ34WNobdno2KUJbOBt2AJK7fqltNmj9WEAUdM/wDCE7cNQ3AGRqu4OYFNR2
         HOKrKclfWCUBkJjC5D2uQIjxqtN1NlLsNV7LravWVm+WDgaiggSugtT+TCE+gZO+mYAC
         QPdLsZLA3fad7CTRZ1QW/M+Dwylp06UcDaX9940Ia7rIkLxu5ovhUVEQc8WVWkg9hDvS
         Evpf8uV2ea4T51TBTMqMX9GUrbLaI6Ng72t2rwjhYCu7e+z5viPjiYDbhUJt3z5v4Am3
         aH8YvBk/pJvmyip/Je3E6L0suvnoXE1HGhSqXHkr1glzIdKLR6Ebvjo1uwoJFgAEEBOJ
         undg==
X-Forwarded-Encrypted: i=1; AKwUvBy4ye0ng57n+HMijRBDaKwBrm1nhid3IXKzfSj/GIP2T4f9Ne1kfpjvC62nrXpUXgd5/Y4EXDqvswXl/LY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9jm9EdxXcITEehYxikl4tEKsBW4dyShs0oBKmqTqpYciwhZR/
	T8ljH7GHEyB8yrwmFpQt0032effO4t91tLR2e6XMYOYaIfAbn+XHbe85eCScEvd1jPcgte+m
X-Gm-Gg: AYBFou2EtiLi8SUXn2aO+D7UIoOaQfrzkFrJ6JJ5uyW3LMoK5NcXk6onGzm16SnO2GJ
	GN7uaAXCDN8H0ySViOWwU+FW/25tUAE9rBBmqkHNqZVK5I3BtZTeWA4mFzVFKwiI8KWC0TIwWlN
	1pUk054CbsWKEe2XYhEyIt0iG9yXH8nt+GheVNldiSD7xtt8X8mFQ5+QwhBaifwuqqmMeNKBYlX
	+s+cMUdMfGIKrppUKsTHl/qmnW+kAIsJOcwG1zTaJmpkK5VNISiNw0MsExvb/zVbckh4kfqWgDq
	VZX0ufquZL4XvKFRcd3K9jIaTW8zP3/5+w3/xmLSzQptFVw9GFBD4E9x4oRmsAmVmyjAAuEbiqa
	kAnp3v4rt1CwBY1VuLUO7S3yYUC3Fch/SpuPSCDYIXdUhn7/8kbv5p8UvmIVOCvNaVSFblpjVIN
	+cXj7lFTCs3u5LoMe7M//2uUk0Uugwr2MYnoZcnmKSTtmaBlBiRuD0hXLmXRJ8tUW7syieeQatH
	TPY0MSgsbBLFJD42HLEBRFTQPB36wEXaYZgZBkElrc7QQzH+gBRht18K2swuPKUfQVLjLY=
X-Received: by 2002:a05:600c:3e8d:b0:4a1:7701:f863 with SMTP id 5b1f17b1804b1-4a18e4aeae4mr132796155e9.15.1791749918639;
        Sun, 11 Oct 2026 13:18:38 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf1358asm237348495e9.4.2026.10.11.13.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 13:18:37 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Fangzhi Zuo <Jerry.Zuo@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	George Zhang <george.zhang@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION 7.3] drm/amd/display: single-frame scanout corruption on DCN32 at 120 Hz since a637a140ab86
Date: Mon, 12 Oct 2026 01:18:33 +0500
Message-ID: <20261011201833.853907-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260919200820.799243-1-mikhail.v.gavrilov@gmail.com>
References: <20260919200820.799243-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The band appears while DC switches the memory clock through
sub-viewport (SubVP).  When SubVP is not in use, a kernel that contains
a637a140ab86 shows the same low rate as that commit's parent.  On my
display, whether SubVP is used at 120 Hz is decided by a TV setting,
which also gives affected users a workaround.

Two runs on the same kernel (7.3-rc6), the same TV setting and ordinary
desktop use, differing only in the refresh rate.  SubVP state and the
memory clock were read once a minute from amdgpu_dm_capabilities and
pp_dpm_mclk.  SubVP never changed state within a run; the memory clock
stayed at 1249 MHz for the whole 120 Hz run and moved through all four
levels at 100 Hz:

  mode     SubVP  memory clock    events   eligible  per 1000 (95%)
  4K@120   no     1249 MHz            5   1,582,072  0.0032 (0.0010-0.0074)
  4K@100   yes    96..1249 MHz      139     712,333  0.195  (0.164-0.230)

138 of the 139 events at 100 Hz carry CRC triples that occur nowhere
else in the capture; the remaining one recurs seven times.  All twenty
DTN snapshots taken after events show watermark set A at the register
maximum and a calculated DCFCLK of 400 MHz: the SubVP override in
dcn20_optimize_bandwidth() and MIN_SUBVP_DCFCLK_KHZ.

With SubVP in use the commit matters.  The parent/commit pair I
reported earlier ran at 120 Hz in HDMI VRR mode, where DC uses SubVP
(the revert kernel's DTN snapshots carry the same two values), and
measured 0.0023 against 0.0807 per 1000.  Without SubVP, the kernel
with the commit is at 0.0032.


Why a TV setting decides it
---------------------------

The LG OLED42C3 offers "VRR & G-Sync" (HDMI Forum VRR) and "AMD FreeSync
Premium".  With the first, the EDID carries the HF-VSDB VRR range 40-120
Hz and no AMD VSDB; with the second, the HF-VSDB VRR range is zero and
an AMD VSDB v2 with 40-120 Hz appears.  amdgpu_dm_update_freesync_caps()
takes FreeSync on HDMI only from the AMD VSDB, so:

  - HDMI VRR mode: the stream has allow_freesync = false, and
    dcn32_allow_subvp_high_refresh_rate() permits SubVP for a single
    display at 120 Hz.  amdgpu_dm_capabilities reports sub-viewport
    enabled at 120 and 100 Hz; visual confirm 16 draws red at 120 Hz.

  - FreeSync mode: SubVP is not permitted at 120 Hz.  DC finds no
    p-state method (watermark set A p-state 0, no visual confirm colour)
    and keeps UCLK at its maximum, which pp_dpm_mclk showed for six
    hours.  At 100 Hz, below the 120 Hz threshold in
    dcn32_assign_subvp_pipe(), SubVP is used in this mode too.

  - 60 Hz, either mode: the switch happens in vactive without DMUB
    (visual confirm 16: magenta).  My 60 Hz runs measured between 0
    and 0.025 per 1000, one of them 0 in 1,290,588 eligible frames.

All my earlier measurements were taken in HDMI VRR mode.  The line
"FreeSync: enabled, range 40-120" in my original report was wrong: in
that mode amdgpu does not enable FreeSync.

For affected users with such a TV, selecting FreeSync instead of HDMI
VRR avoids SubVP at 120 Hz, at the cost of the memory clock staying at
its maximum.  I have not tried amdgpu.dcdebugmask=0x20000
(DC_DISABLE_SUBVP_FAMS) in HDMI VRR mode; I can if that would help.


The question
------------

SubVP is carried out by the DMUB firmware, and DC budgets the
firmware's reaction time when it sizes the phantom pipe's MALL region:
subvp_fw_processing_delay_us = 15 and subvp_pstate_allow_width_us = 20
in dcn32_resource.c, used in dcn32_fpu.c.  a637a140ab86 moves every DMUB
window -- instruction constants, stack, BSS data, mailbox, firmware
state and the rest -- from VRAM to GTT.  Is the firmware's SubVP timing
sensitive to where its memory lives?  Asking, not claiming.

DMCUB firmware here is 0x07003300 (7.0.51).


Also
----

A second user reports the same on an RX 7900 XT with two TVs over HDMI
at 120 Hz and above: from 7.3 on, not on a DisplayPort monitor, and gone
when he locks the GPU clocks.  If the lock includes the memory clock, it
stops memory clock switching, which fits the above; I have asked which
VRR mode his TVs use:

  https://gitlab.freedesktop.org/drm/amd/-/work_items/5714#note_3692576

Two more corrections to my original report.  The DTN "CALCULATED
Clocks" line prints DC's calculated requirements, not the clocks the SMU
is running at, so it says nothing about clock transitions.  And a
snapshot taken seconds after an event cannot exclude what the firmware
does around a switch: with SubVP it lowers watermark set A when the
switch starts, so "the watermark sets are configuration, not
instantaneous state" was wrong as well.

The GitLab issue has the same data:

  https://gitlab.freedesktop.org/drm/amd/-/work_items/5714

-- 
Thanks,
Mikhail
