Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46784F7971
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788539084; cv=none; b=UrFEZ1KMMv20GqDPflkk8iVfmP51xtsZQfMrUtXRqiaTxfkSvan8OZSZKK+wEXJSbDJzJYIyF00WgNfCX8SHr06N6wJxbZD8yfv8VCTnXZWMpwSH6Boy5uEBSy9BV/lXCM3GZrnLzkv1Jsh2xLBJosQvv6EINkqm3PfLjMEm3CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788539084; c=relaxed/simple;
	bh=hf5dMmUnqPpzPdsGZVnBKf0db0q1BjhZ6EJ8ijLarCA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JYtksYlHZOcM4pihUfOXS3DSWIb4pk07x9KTwxjBUl5s1F1H0lHMY4l1I6pjDwzbkfYPym6AUN8RjycrJWFEDwJYgF2pnzLXKBi3OpZT0PJQ4ETlLG16Z3uBjFOPxVYvuWNec7COpSOS5g0H6WF3fSvG0iIAH8GTGtfqcl+iac8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2EQE3Kt; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2EQE3Kt"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c250c6a6a9aso198909566b.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788539079; x=1789143879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H2XRThQt67LCC120ZSHWxwuTYmoUdCWvzW9mqaIXjQA=;
        b=H2EQE3Ktymf3Tv+6ruWojbzYEF00JJbDVEzRsr7RWahOhROqEJGjYATkdeCyhs1zL0
         qASWLeGZJgJqiSw/1Ij8GGYfqJol5vxXUOqhj0AKLIMp57UQDanGZR4cL9Xzi6N+jm0Z
         hUxvqhdfH0x8jcGirUko0QjQr1aVbM4dWMo4uJha7a4iUvu5Dv7Geomy08Ld1RMS00cv
         GE0eovRvRZW2O2iY3ozKbDF3HoYuZlJbqtzEEgrxi/sUTCkkEaDPw0B75v+Pb2ABingO
         W9p0jf6ZX2AuM8+UTBg4x33psRaF/9UNa9eJnL99dFyfrhN59PR/Hx9ypXL8BEOdFnts
         lRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788539079; x=1789143879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H2XRThQt67LCC120ZSHWxwuTYmoUdCWvzW9mqaIXjQA=;
        b=LXL6TSChkfXCNM0ZVOu9XLC6WbrOayHrE1gjYcQeC6UPcigVsz1hD3QOzHF+kK3yw1
         XweBKQdfLWwNjPyBy0HtQe21xxRF+xUsMvSYa3TskL77mqUOuOfF/qcqpd7zyya8Bdhw
         bTfsvLCaTBxmh7IWtqMv5Jq+U8/N2ZXf7S9YLkXtq/o0kzl1Vbyqq3quoxXKDJwej4b+
         TA+ViUx3EBUQXosFL/4dtWYOcCYDSerjGh5uDpgQsjK3MllbGYX3RHO2/zSKEs/pCXKu
         fVqWfopsRuaerq91vst4difVNl6kF9TZrbFafi3NuIRa2JRlZw77povH6/574nFWK4q4
         QOiQ==
X-Forwarded-Encrypted: i=1; AKwUvByyCAOxzMfw9jCW3M+E27I76Wrr3kx35V/AUGbDFHGDHgXnd0vc9XNQyDi1gk1MTMh/Z6BzZjNhYZDLNtg=@vger.kernel.org
X-Gm-Message-State: AFuF++ngXu62FdlomATs5JOV/q4Bghmb4DOS9/dIV/DvC3Tckrs2gO9W
	YWnD/xVDDnnwsPdVn9xavKcK2RYcQkR2+qyMVMlZ+Q8qpjj3PVyQnH37g0mHjSqb
X-Gm-Gg: AYBFou0KB8WBdGMSHk/Fpv5kIfAYhFP3AUNnJI4l+iMyKADYPd/zq10VzImtrskV2UB
	QIL8Prq/J4NMrGwDjMY9vN+Do+oXPljWzyPFXIKggdIFyAKhhlLJYm3R4WenAIgoz7ctXRFbDid
	CSln4ENR7iYJczc1mVS5dYRBHz/rKhYHWG8Cds3b6F1MXPjCFhZtqT72LTd2Yiy9pR79biEc0J+
	RdxjeQuSdOI2FnxiMxmfmOMPKbbwmVv33YitTRbSMjyzpG89z7eMkHRLlbMDuIOJgi5x2dLUlFI
	DaRaQfRCiJh8BgJTb2Lm/IFhrhcYgrBzv2vkP13obi7i7mbiBYhwIiT43/vopbGKtmdR0i2osNN
	kjCUY31tfJKIt7BV6qCfRrIi5Juxx7ZsG6CicnHn0YdjAg3YkgCTgBJ+jHZwRKzndrZd9R5AaOB
	SSVWq6VjmijjXmBsKrtqIuAS1534MXfyT9b1iaxTT9U1NmVQKjt9OTv8iftubLa3JaDCQNcTiNh
	y+yGdv3Zt4GFaXJwGq8sYUhZ3VdOik=
X-Received: by 2002:a17:907:9724:b0:c12:b2db:873d with SMTP id a640c23a62f3a-c260c9715d3mr467427466b.5.1788539078783;
        Fri, 04 Sep 2026 09:24:38 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4a8bacsm132556766b.17.2026.09.04.09.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:24:37 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH 0/3] alpha: load the MMU context on a direct mm switch
Date: Fri,  4 Sep 2026 18:23:28 +0200
Message-ID: <20260904162424.376504-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three fixes for how alpha handles an mm that is switched in directly
rather than by the scheduler.

Patch 1 removes a stale clearing loop in migrate_flush_tlb_page() that
patch 2 depends on being gone. Patch 2 stops the TLB shootdown shortcut
from skipping a CPU that is borrowing an mm through kthread_use_mm(),
using mm->context[cpu] as a lockless publication of which CPUs may be
using the mm once patch 1 makes every write to it single-writer.  Patch 3
then makes those direct mm switches actually load the MMU context, which
they currently do not: kthread_use_mm() and sched_force_init_mm() call
switch_mm_irqs_off() directly rather than through the scheduler, so the
hardware context is never installed and the task keeps running under
whatever was loaded before.

Reproducing it. A KUnit test was written for patch 3; source can be made
available on request. It uses kunit_attach_mm(), which calls
kthread_use_mm(), and then compares the loaded context against current->mm:

	# alpha_use_mm_loads_context: EXPECTATION FAILED
	    Expected pcb->ptbr == mm_to_ptbr(current->mm), but
	        pcb->ptbr == 384 (0x180)
	        mm_to_ptbr(current->mm) == 12555 (0x310b)

  0x180 is swapper_pg_dir: the kernel thread is running on the page tables
  it had before the switch. The pcb.asn check in the same test passes,
  which is the signature - ev5_switch_mm() does write the ASN, so it is the
  load that is missing rather than the bookkeeping.

  Do not detect this by dereferencing the borrowed mm's user addresses.
  do_page_fault() resolves faults against current->mm and never reloads the
  context, so with a stale ptbr the same access faults indefinitely.

Testing. ES40, EV68AL (21264C) Tsunami, 3 CPUs, v7.2-rc6.

	                                  before        after
	  KUnit alpha_mmu_context         0 of 2 pass   2 of 2 pass

  Patch 2 was measured rather than argued. Dropping the shortcut outright
  is the obvious fix and costs far too much, so it tests mm->context[cpu]
  instead:

	  fork/s, single-threaded    shortcut as before   1360
	                             shortcut removed     1050   -23%
	                             patch 1              1360

  Medians of seven, seven and twelve runs, spread 1352-1367, 1046-1052 and
  1340-1366. The unchanged throughput shows the shortcut remains effective
  for this workload, and neither the barrier nor the context marking shows
  above the noise on this machine.

  No regressions in the wider suite: glibc malloc-check 25/25 and four
  related tests 10/10 each, the copy-on-write and writeback reproducers
  from the previous series clean, and the same again under continuous
  compaction with 359768 folios migrated during the run.

One adjacent problem is deliberately not addressed. enter_lazy_tlb() sets
pcb.ptbr for the borrowed mm without setting pcb.asn, so a kernel thread
switched in through PAL_swpctx loads one address space's page tables
against another's ASN. I have not found an observable failure from that
mismatch outside kernel-thread user accesses, which go through
kthread_use_mm() and are a matched pair after patch 2. Changing it would
mean touching the VPTB self-map behaviour on every lazy switch, with no
reproducer to justify the risk.

Patches 2 and 3 have no Cc: stable: kthread_use_mm() is the only
reachable caller on alpha through KUnit's kunit_attach_mm():
lib/tests/usercopy_kunit.c, lib/tests/kunit_iov_iter.c,
mm/kasan/kasan_test_c.c and drivers/android/tests/binder_alloc_kunit.c all
map user memory that way; sched_force_init_mm() and the driver callers
need configs or hardware alpha does not have. No ordinary alpha kernel
reaches either fix.

Patch 1 is different. migrate_flush_tlb_page() runs under plain
CONFIG_COMPACTION, and the clearing loop it removes can fire from ordinary
lazy-TLB retention on a single-threaded process's previous CPU, not just
kthread borrowing. The compaction stress testing above exercises that path
and has not caught it doing observable harm, so patch 1 also carries no Cc:
stable, but for that reason, not for being unreachable.

This applies on top of the "alpha: fix stale TLB translations breaking
copy-on-write and writeback" series and depends on it: patch 2 rewrites the
same flush_tlb_page() and flush_tlb_mm() shortcuts that series touches, and
does not apply without it.

  https://lore.kernel.org/linux-alpha/20260810193902.3286353-1-linmag7@gmail.com/

Magnus Lindholm (3):
  alpha: do not clear remote MMU contexts in migrate_flush_tlb_page()
  alpha: do not skip TLB shootdown IPIs for kthread-borrowed mms
  alpha: load the MMU context when switch_mm() switches the current task

 arch/alpha/include/asm/mmu_context.h | 11 +++++--
 arch/alpha/kernel/smp.c              | 48 ++++++++++++++--------------
 arch/alpha/mm/fault.c                |  2 +-
 arch/alpha/mm/tlbflush.c             | 16 ----------
 4 files changed, 34 insertions(+), 43 deletions(-)

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.55.0
