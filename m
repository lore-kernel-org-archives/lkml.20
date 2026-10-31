Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793468943;
	b=EpRzeduni9DIgGDuk47lh/6k45aRL6wDbRrErnSAgKTJoWZ6Gp1cmGnCinPmC3TAoHoL
	 J4csC7PIufICet7/PwD+O0XzXzjxC+GezyV/Qpdtk92Mdz0JGL++XaIP1X/5zCNxVmKGy
	 dnKBiyJjY3/faKNgPJcHbNCuGVGvgmSKTGksoEamLQ9fyYnfbVyux8COI/q1ecNzrkHIW
	 CByP7q8vV2I3aWy7Zv0DBOknTzL9Ucf2pMhezT0vvGD83aTZcj65a8Q2ljgvHS1GC4eQ1
	 1IOUn2F8uH6RoPTPgt7M5x8soy/jIXrbuztnZUEeBW0G9CGze6MHM3XfpwJgcFXQYnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793468943;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=NSB2PecxKZRZZ5SWAtMykPl3XsNqbNX6cSidiyaczIU=;
	b=Ng580eCcEJndUWgWZLJsr5LnYGIONBSpkyRkhZwBLOzDxM5xhK2f8hwjQualVJxA7exi
	 NjVoGKpzUb2L6u7D11eD+zFTB/g/V3axTp6xHVR2Z76wpMXFpHmZomZUTR6voA5htzvoT
	 yPx2PibkMXC4WLPUdnCEX2wrFlGreq0WafWPib/cDAPhzlOF0c4gNt0fj9EJxF0cmcRDq
	 AU24lMUuLR3Pdyfocm9/jrdrphlOzb6nxgPVeyaTQnZP5RVZpE38+x2Tz5COzU1XZ95Dq
	 Nsq/aGNhKvKxWhT52CittP/a9Jn+P2g/3c+x7MAkk5M4Xuubd/cVj286bgQ1JhG/34g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eDjONVRi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC0D606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 17:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eDjONVRi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBCF91F000C1
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 17:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793468942;
	bh=NSB2PecxKZRZZ5SWAtMykPl3XsNqbNX6cSidiyaczIU=;
	h=From:Date:Subject:To:Cc;
	b=eDjONVRiwjQwK1VbumLMFeYJdZickLy1CHmK8vHiPyhEOOOerTKoNtka5r91Ov/xb
	 tKYnyTpca8EF6JEbtcwFyMM10kzI24/ms0TJNu+XwMgYhy6uPknNpz2XE15gKUglzY
	 r8mzBuG01L1SZ9ok/LIt1N9ukY92Z6kZ1lRnNxBtx6VR+Y2JL0T7XqIENkfXnzzc3M
	 wfZ5YzAyoRxIlMISWPXfD3oK8WMLkSuBvsjeEawezb0ZxCCPMnTy06FvJam9tPt85d
	 pGQyZ1SiOThyO1mMX8mVjtpHozLQCVFc7J3n5rJrsn7x++ZE9Leh3rJSf4xbT7SnUP
	 /Jkc/EdpAqFTw==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6acb57c2b88so2156033a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:49:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz4u+vHssoq+4UqaaGNu6BX1ojmx8Mu6j53K4dzJ+pYZGW0EfcS0J0IbklFPVLtzfM4kbjuP5/lmMdi6pw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLetSWRTZ41eKvOCxgm3BmDERq+SZMiKdfPDwV/tdQSJhO1m8p8
	D0Ibdb819x6oE0x+ZbyrSbFwcT9PNLrypvXTig23RM7/PmbbYmotGGkPVaoy5XTc7fpeDsmjyRz
	rRDxpyr8uH9gSjfMYllj7Uz7BqFLbGh4=
X-Received: by 2002:a05:6402:42cf:b0:6b4:20bc:fa0 with SMTP id
 4fb4d7f45d1cf-6b4d428ea8amr4354672a12.13.1793468941878; Sat, 31 Oct 2026
 10:49:01 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Len Brown <lenb@kernel.org>
Date: Sat, 31 Oct 2026 14:48:50 -0300
X-Gmail-Original-Message-ID: <CAJvTdKk8oCKTDyzyyaruaTRQoNLeKnZJofiN6va3=fm9VRmGNQ@mail.gmail.com>
X-Gm-Features: AclHuK8OLaxdAq5Xgp_oDOiMWDGtiU142ig2W2hDUl-OKh8WDJohcgx8MRKTJXM
Message-ID: <CAJvTdKk8oCKTDyzyyaruaTRQoNLeKnZJofiN6va3=fm9VRmGNQ@mail.gmail.com>
Subject: [GIT PULL] power utilities update for Linux-7.4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux PM list <linux-pm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Please pull these power-utilities-2026.10.31 patches.

thanks!
Len Brown, Intel Open Source Technology Center

The following changes since commit c03c1a14507dfaf8b856c2608f9ac216021fc222:

  Linux 7.3 (2026-10-18 13:14:58 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lenb/linux.git
tags/power-utilities-2026.10.31

for you to fetch changes up to 8969e647d0322939512041b9685cc5f27753dd8c:

  Merge branches 'turbostat' and 'x86_energy_perf_policy' into
utilities (2026-10-31 14:29:22 -0300)

----------------------------------------------------------------
power utilities 2026.10.31

turbostat 2026.10.31

Fix --cpu option to work more than once.
Fix --Joules option to work with --show power.
Remove hard-coded 8192-CPU limit.
Decode Uncore Frequency Agent Types.
Dump RDT (Resource Director Technology) config.
Dump RP (Resource Priority) config.
Recognize Rugged Panther Lake.
Fix PMT mmap size, bounds check, and mask computation.
Misc cleanups and minor fixes.

x86_energy_perf_policy 2026.10.31

Harden input parsing and bounds checks.
Fix optarg keyword matching.
Rewrite MSR device path discovery.
Misc cleanups and minor fixes.

----------------------------------------------------------------
Hemanth Selam (1):
      tools/power turbostat: Fix comment typo

Kaushlendra Kumar (2):
      tools/power turbostat: Fix undefined behavior in pmt_gen_value_mask()
      tools/power turbostat: Fix PMT mmap size and bounds check

Kuppuswamy Sathyanarayanan (1):
      tools/power turbostat: Add rugged Panther Lake support

Len Brown (39):
      tools/power turbostat: Decode Uncore Frequency Agent Types
      tools/power turbostat: Cleanup: Delete unused flags
      tools/power turbostat: Rename: Differentiate counter and CPU sets
      tools/power turbostat: Cleanup: Remove hard-coded 8192 CPU limit
      tools/power turbostat: Cleanup: Delete duplicate table entry
      tools/power turbostat: Cleanup: Remove useless assert()
      tools/power turbostat: Cleanup: Unify comparisons to max_cpu_num
      tools/power turbostat: Cleanup counter sets debug code
      tools/power turbostat: Cleanup add_counter declaration
      tools/power turbostat: Cleanup: consistently use warn/err, not perror
      tools/power turbostat: Fix typo: MHz, not Mhz
      tools/power turbostat: Cleanup: bool force_load
      tools/power turbostat: pmt: Improve sscanf() hygiene
      tools/power turbostat: Dump RDT CPUID.7 Support
      tools/power turbostat: Dump RDT CPUID.0xF,0x10,0x27,0x28 Support
      tools/power turbostat: Dump RP-Enable MSRs
      tools/power turbostat: Cleanup: Use one cpu_setsize for all purposes
      tools/power turbostat: Allow multiple --cpu on cmdline
      tools/power turbostat: Rename cpu_subset to cpuset_cmdline
      x86_energy_perf_policy: Rewrite Linux/Android MSR path discovery
      x86_energy_perf_policy: Harden update_cpufreq_scaling_freq()
      x86_energy_perf_policy: Harden with strtol()
      x86_energy_perf_policy: Cleanup: Use snprintf() for platform-profile
      x86_energy_perf_policy: Fix optarg keyword matching
      x86_energy_perf_policy: Harden against potential ratio overflow
      x86_energy_perf_policy: Bound package iteration
      x86_energy_perf_policy: Cleanup: Define HWP_WINDOW_MAX_USEC
      x86_energy_perf_policy: Cleanup: Define BCLK_MHZ
      x86_energy_perf_policy: Cleanup: Check fseek() in VM path
      x86_energy_perf_policy: Document MSRHEADER
      x86_energy_perf_policy: Cleanup: Drop unused signal.h
      x86_energy_perf_policy: Cleanup: Constify read only parameters
      x86_energy_perf_policy: Use calloc to initialize string buffer
      x86_energy_perf_policy: Simplify write_sysfs() return type
      MAINTAINERS: Add x86_energy_perf_policy
      tools/power turbostat: Fix --Joules when used with --show power
      tools/power turbostat: Version 2026.10.31
      tools/power x86_energy_perf_policy: Version 2026.10.31
      Merge branches 'turbostat' and 'x86_energy_perf_policy' into utilities

 MAINTAINERS                                        |   9 +
 tools/power/x86/turbostat/turbostat.8              |   6 +-
 tools/power/x86/turbostat/turbostat.c              | 818 +++++++++++----------
 .../x86_energy_perf_policy.c                       | 234 +++---
 4 files changed, 587 insertions(+), 480 deletions(-)
