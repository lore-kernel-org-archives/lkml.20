Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E5C3C5DC3
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791579905; cv=none; b=JoI2Mjb7ozXbOdCda8Z1TJyKbBVQv8T2hVHAecxGmWUifdXpz0ZQUwhUSuL9OuvB5e6BKuUnhw+s/ipUxR1wVlUEoFBuh/5pUozxcyyqDrnXAi7NqPZTB80lGuNXQ3+hjt+mVZTr0Dm2Fit26B1HMtvmUGJZ9t93tiGOv1L1K6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791579905; c=relaxed/simple;
	bh=ZrIm0FbVyIb93EOmlC67uG1pIp4DF/ss8CXlnbc1Tgc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GaT2NXgyxut/zJYKI8qY87U4UX3tIPGO2G1aNkfKx9tIgu+iNIUayipc9wwKxlXvJSKF2lKl1di1UnLUaRZgwCOvSYN242Sv+oeAx30Wd/HTQBkT3SwVCDyoypIHT2+ZPZzZIfrAS3xALcucV6yHfB4l5CtbkPT4WLujIGenorM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRvPO+8o; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRvPO+8o"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2533d83e3bso39426366b.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791579902; x=1792184702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WK97snvQVX0vL8wT+4bDs4NsD6bvvq3qKHYPIL7cmH0=;
        b=JRvPO+8oJxCmkn+S9Dkclkzm7n3ZQFMjSEbd7yjtAM49yiGWA9tCAIISK0rVB2rTUJ
         MfL0n4XXlH34hvJRl7v5sZpmtJRFGT1YwNmZhentLzd7BVTviHsBu6oEB7zRg6qFtgPH
         LlOwbfMGEQ1rAZwjFdj228ErsTqw0Yoa0DHhGOYFzq4VB/diwqdR7iwWlZ7JNPsUyGw5
         Scvreg6hJBAF+4A9net4eCMePilNo2P+uqucLDxaFfT3CvBWMdOf29ilLhesAntRNqP7
         UB8q+SBimcq8iq6bducMl29LLkKXiKYdkITfQhoTzkN33eznSUTEkXLu5d5cAE44dTYW
         EtSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791579902; x=1792184702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WK97snvQVX0vL8wT+4bDs4NsD6bvvq3qKHYPIL7cmH0=;
        b=gNG3eQhyyoBplfdtkVDtxfgxKOmSVrws47nMGsP6rG+5sCwAobg+DAoJ5Svn2VbbdS
         7/KfbdZKNWMJE/rd+Xw1LXNa8/zfT84KHBPc06R3Utn+KgdDSx+4FmAU5f0POANstqxQ
         HtbNPuxliHaBdhsrrknXLbXUemOcEtMS3NDPZITQXEUOKtlXqemFc7A+7xoNrH3ZiyC7
         Sixq+Rv3IfHgc97C+2m46SZiqcfSiF8y0Ou8ueE/+LQegRiP9A+XHPOoxSY4OXw9dlV1
         vp4owM+RJgS6v+LAGWWe4HcqZlofOOai6LmUmcaK1yUAPLeEkhwJ2WcKLEV0ukBKNGrV
         rFYA==
X-Forwarded-Encrypted: i=1; AKwUvBxy2zRttpcWIaardib8e5s7JPjaNGRurvhx/5I0I9y8YTEkhdltYQDR0Nbu9caQN7A3mjsMM352WdpqPvY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnHRO8sFFRDWs6l49oiikmorLr8L7jXHboYBAgZASfLe98v/cq
	aUrXYVNeXQb4Dj6joJLKrLIG/PupZI+Te1BWRJp5BIUFEMsq4aOdemQ9
X-Gm-Gg: AYBFou26jzF7jR5ewPz1txgnr6QoKLJky/nJLjVqJhr0ajHChSJT2Ud9oaJMBDeOaEW
	dWNHhHBXD75er2MhwQDGw70UmxH6mSK40CuqkIWJcNLGRi4srzg8UxY160opCQfsJufpx2qwNe7
	IB7SG7SXPjzfkXeKpo0MEggXvRAOt9MbtJ4YPooRSFq+AXZjUEBXAkoLdLMiHccVBVajulrBW6l
	Up4vQ+o5zLQD4rhX9V5weklf3Q4HG3WS+rRBCDkRG06IrvZxJIfTyw/CeI5SNLfDG0ToU1/ubPP
	sTruGD8v6349SAqGPq9ZRZUM4kCgFJhWD/y34RC/sHjxqxSbckPyX5kc6Ojy+QwjicQMUCdAcVI
	FrisdW1pdgxh8GAf6DGKtAKEKl96/uyOuVfbBz3SaTX+6bQ4bZl89ZOBR6AOa+9Mj3ER/PvFj/b
	hxHICooVF933VAeYEWolX2rhyVnWuUhlmPWAIHrvu0fvGY8v+KeMQ6DGaRtIlj7anTkByKTWu8q
	tqbcWaS6fYPU4QZ5bXMMJ9i11C0AFMTsy1y+XYD
X-Received: by 2002:a17:907:6e90:b0:c2d:ca32:2176 with SMTP id a640c23a62f3a-c31a9fd2ca0mr331989766b.8.1791579901389;
        Fri, 09 Oct 2026 14:05:01 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9765d1asm142141266b.8.2026.10.09.14.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:05:00 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v4 0/8] alpha: fix stale TLB translations breaking copy-on-write and writeback
Date: Fri,  9 Oct 2026 23:03:45 +0200
Message-ID: <20261009210449.971057-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Alpha, stale TLB translations can break copy-on-write and shared-mapping
writeback: a multi-threaded process can lose its own stores, read data
belonging to its child, or lose writes through a shared file mapping. The
copy-on-write failures need more than one CPU; the writeback failure also
happens on a uniprocessor.

This is the first of two series, based on for-next at 33465f6ab697
("alpha: support the remaining kernel compression formats"). Apply all
eight patches here, then the two patches in "alpha: complete the direct-mm
shootdown fixes" v3. There is no interleaving or external prerequisite for
this first series.

Patch 1 moves here from v2 of the direct-switch series:

  https://lore.kernel.org/linux-alpha/20261008195608.965266-2-linmag7@gmail.com/

It loads the context when switch_mm() is called directly for current,
before kthread_use_mm() can reach the hook added by patch 2. This closes
the dependency that previously required applying one patch from the other
series first. Its code and Matt's review and test tags are unchanged.

Patch 2 completes the deferred-ASN handshake from
finish_arch_post_lock_switch(), including the first switch to a newly
created task. Its old location after alpha_switch_to() was bypassed when
a new task reached schedule_tail(), leaving asn_lock set.

The hook runs after interrupts are enabled. Set need_new_asn whether
switch_mm() reused or allocated an ASN, so a deferred IPI cannot leave
a live hardware context with a zero slot. This is also required before
the second series uses those slots to decide whether to skip shootdowns.
Drop the preemptible() guard: Alpha has no kernel preemption and the
direct-switch callers do not sleep before the hook, including when
RCU_STRICT_GRACE_PERIOD enables PREEMPT_COUNT.

Patches 3, 5 and 6 test current->mm before issuing targeted tbi(), since
a lazy active_mm does not establish which ASN is actually loaded. Patches
4, 7 and 8 retire the calling CPU's context when the local current-context
test fails; smp_call_function() only visits the other CPUs.

Patch 4 deliberately precedes patch 5. The missing else branch must be
present before lazy callers are routed to it, so no intermediate commit
loses their local invalidate. This matters on EV7 where a foreign-context
tbi() appeared to work. The full-mm and icache callers retain their
active_mm tests because those paths load a new context instead of using
a targeted tbi(). The second series separately changes their IPI handlers
to retire slots on lazy CPUs rather than keeping those slots visible.

Testing

Cross-build validation for this revision covers arch/alpha/kernel/,
arch/alpha/mm/, kernel/sched/core.o and kernel/kthread.o with GCC 15.0.1:
ALPHA_GENERIC SMP and UP with COMPACTION=n, and SMP with COMPACTION=y,
RCU_STRICT_GRACE_PERIOD=y, PREEMPT_COUNT=y and NR_CPUS=4. These are compile
checks; all three passed. All ten patches pass checkpatch without warnings,
and sequential application reproduces the committed trees at both series
boundaries. No new boot or hardware runtime results are claimed.

Historical results from the earlier stale-TLB series, on an ES40,
EV68AL (21264C) Tsunami with three CPUs, v7.2-rc2 and v7.2-rc6:

                                      before          after
  smoke test, stale-read check        7 of 9 rounds   0 of 9
  lost stores                        11 of 40        0 of 400
  writeback (mkclean4), SMP [*]       10 of 10        0 of 10
  writeback (mkclean4), UP  [*]       every round     0 of 8
  tst-malloc-fork-deadlock-
    malloc-check                     8 of 10 fail    25/25 pass

  [*] CONFIG_COMPACTION=n.

alpha-cow-smoketest.c uses pthreads and forked children. Each thread owns
its slot, and the main thread reads only after joining. Slots are 128
bytes apart so threads share a page; writing once and reading repeatedly
avoids hiding stale translations with another faulting write. It does
not fail when restricted to one CPU.

mkclean4.c exercises patches 4 and 5 together on SMP, and patch 6 on UP.
It compares a small MAP_SHARED mapping with its backing file after
background writeback, with the writer and flusher pinned to the same CPU
on SMP. It needs root and COMPACTION=n. With COMPACTION=y, Alpha overrides
ptep_clear_flush() to use migrate_flush_tlb_page(), so folio_mkclean() does
not exercise flush_tlb_page(). Earlier unpatched COMPACTION=y runs passed
103 rounds; separate regression runs under continuous compaction migrated
368522 folios without failures.

Matt's earlier ES47 (EV7) testing on v7.3-rc1 with one CPU online found no
regressions in fork/COW, writeback and gdb breakpoint tests on SMP and UP
builds. He could not reproduce the unpatched writeback failure despite
counters showing foreign-context targeted invalidates. The fix rests on
the tbi() contract, not on every implementation exhibiting the failure.

Patches 7 and 8 still have no isolated reproducer. A gdb breakpoint
exerciser covered patch 8's path for regressions. Matt suggested
move_pages() on another process's hugetlb mapping, with the caller pinned
to the CPU the target last ran on, as a possible reproducer for patch 7.
That is unverified; the proposed hugetlb support is not in this base.

Changes since v3:

  - Move patch 1 of the v2 "alpha: load the MMU context on a direct mm
    switch" series here as patch 1, so the stale-TLB series can be
    applied first, followed by the remaining MMU fixes.
  - Drop the post-switch hook's preemptible() guard.
  - Set need_new_asn on both reused and newly allocated ASN paths.
  - Put the missing local flush_tlb_page() else branch before changing
    the current->mm test, as requested by Matt.
  - Rebase on for-next and update numbering and dependency descriptions.
  - Mention the proposed hugetlb caller without claiming a new reproducer.
  - Drop the old review tag from the materially changed hook patch;
    retain tags on the other patches.

Thanks to Matt Turner for the review and EV7 testing.

v3: https://lore.kernel.org/linux-alpha/20260923074903.862898-1-linmag7@gmail.com/

Magnus Lindholm (8):
  alpha: load the MMU context when switch_mm() switches the current task
  alpha: run check_mmu_context() from finish_arch_post_lock_switch()
  alpha: only use a targeted tbi() when the target mm is really current
  alpha: invalidate the local context in flush_tlb_page()
  alpha: fix the local TLB invalidate in flush_tlb_page()
  alpha: fix the local TLB invalidate in the UP flush_tlb_page()
  alpha: invalidate the local context in flush_tlb_mm()
  alpha: invalidate the local context in flush_icache_user_page()

 arch/alpha/include/asm/mmu_context.h | 23 ++++++++++++++++++++---
 arch/alpha/include/asm/switch_to.h   |  1 -
 arch/alpha/include/asm/tlbflush.h    |  3 ++-
 arch/alpha/kernel/smp.c              | 15 +++++++++++++--
 4 files changed, 35 insertions(+), 7 deletions(-)


base-commit: 33465f6ab697abceafd9a340067a544d551c4412
-- 
2.43.0

