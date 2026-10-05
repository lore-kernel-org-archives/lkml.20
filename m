Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DD8326945
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 05:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791179874; cv=none; b=V5YbMGWOzn9a9RBRFUPP2ngX61TRV65wXoCBxZiQoul/tNK4uHz7YsttzYGTNp10XhE2w87ocs44m+gnCDKJIim+7NnGPCjMjnC/uHyk39sNbBdcCvmbgz54bxqeZDhZY5326dan947DNw24TGWrr5DnGxvgGsNF6bbQE+qSP/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791179874; c=relaxed/simple;
	bh=ebBNGzTMs/3OKjPlmmAKn/C44x/a5gbS37Hc/XVKUrk=;
	h=From:Message-Id:Cc:Subject:To:Mime-Version:Date:Content-Type; b=Zd2neEmwKAjcY06RyOldGZborKa09axgMrF0z8RGRnCxUhvOq0sAo26Uxo2nVJIHU28NUtskM34PuQnpLpB0SLpDnTrepiMeyn5v3g2qfXvAe+8CLGAGRzdwQpvysbGK35EA+ndJLClwR00exhhXsLUswtCJzL053a0/7EQ555U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=BIxIi+7Q; arc=none smtp.client-ip=209.127.230.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="BIxIi+7Q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791179858; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=kRrgxa+7uSpmpvMNoNVIRFSXPd/vUIv1LEHBM1Ninqw=;
 b=BIxIi+7QEfcKB/pyWpNfhaMXG9WZzU9MgpMa2Sx/aJxZ0l4jlXs9F8FOR7gbD7Z9hChqLr
 lhP4OvB4fBiGBXpJ2+a1SQec4JuN9ciY17Kz0D/ygco5cHRCNDPa5wcf+APiZF9KYEiVpt
 HfwHLVuvuflPPPt+2ux6amGZqLATcm3lL5u5SzgiPPfAMbvpwBrx367fjtXbIfGxUzhiFF
 39wgiehKNZAbaqeo3iHtsgg8o+gP0KtzLYrMgsyIsSHEu9K0g6KFZaLdc9cH60XEMYrueT
 3xIcu3rwZ+AmTanAusT4G5HhIYOxU3PnstVKbETv2EqkSBLPHgrFtqlll9ferA==
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
Message-Id: <cover.1791179421.git.zhouchuyi@bytedance.com>
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>
Subject: [PATCH v2 0/5] x86/mm: Allow preemption while waiting for kernel TLB flushes
To: <tglx@kernel.org>, <mingo@redhat.com>, <luto@kernel.org>, 
	<peterz@infradead.org>, <paulmck@kernel.org>, <muchun.song@linux.dev>, 
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <pbonzini@redhat.com>, 
	<bigeasy@linutronix.de>, <clrkwllms@kernel.org>, <rostedt@goodmis.org>, 
	<nadav.amit@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon,  5 Oct 2026 13:57:09 +0800
X-Mailer: git-send-email 2.20.1
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26ac33c50+b0a14a+vger.kernel.org+zhouchuyi@bytedance.com>

Changes in v2:
  - Patch 2: Reuse flush_tlb_all() for kernel ranges promoted to a full
    flush and remove kernel_tlb_flush_all() (Sebastian).
  - Patch 4: Drop the explicit TLB_FLUSH_ALL check on the end argument.
    Callers pass actual address ranges and can use flush_tlb_all() for
    unconditional full flushes (Sebastian).

v1: https://lore.kernel.org/20260921095359.3784458-1-zhouchuyi@bytedance.com/

This series follows up on the IPI completion preemption work [1] and
addresses the deferred flush_tlb_kernel_range() changes. The generic SMP
completion waits are already preemptible, and commit a5a162fe1ae1
("x86/mm: Re-enable preemption before flush_tlb_multi()") allows the mm
flush paths to use them. The kernel-range change was deferred during
review [2].

Container teardown and BPF map destruction can trigger kernel TLB
flushes through reclamation of unused per-CPU memory. Services that
spawn and reap many workers can also trigger flushes when vmalloc-backed
kernel stacks are reclaimed.

On the IPI backend, flush_tlb_kernel_range() flushes the local CPU,
sends flush requests to all other online CPUs, and waits synchronously
for completion. The target set is system-wide even when the container
or application is confined to a small subset of CPUs.

The synchronous wait can become longer as the number of online CPUs
grows. Completion depends on the slowest participating CPU, so a remote
CPU with interrupts disabled can delay the entire operation.
flush_tlb_kernel_range() keeps preemption disabled throughout that wait,
delaying higher-priority tasks on the initiating CPU.

The kernel path still uses init_flush_tlb_info(), which initializes
initiating_cpu with smp_processor_id(). Simply removing the outer
preemption guard would allow that initialization to run in a preemptible
context and could trigger a CONFIG_DEBUG_PREEMPT warning. The earlier
version used raw_smp_processor_id() to suppress that warning, but this
also removed the CPU-pinning check from the shared initializer used by
the mm paths.

A smaller change could keep preemption disabled only around the
init_flush_tlb_info() call in flush_tlb_kernel_range() and restore it
before dispatching the flush. With separate protection for INVLPGB and
TLBSYNC, this would also allow the final IPI wait to be preempted while
preserving the smp_processor_id() check.

Kernel flushes do not use initiating_cpu or the other mm-specific
fields. This series separates their data from flush_tlb_info to remove
the unused initialization and its preemption requirement. Full flushes
need no descriptor, and range flushes need only start/end. The
smp_processor_id() check remains in the initializer for the mm paths.

Removing the outer preemption guard then lets higher-priority tasks
preempt the final IPI completion wait when the calling context permits
it. Both flush backends remain synchronous, and the INVLPGB helpers
keep their required preemption protection.

The changes are split into five patches:

  1. Account for kernel TLB flush requests in NR_TLB_REMOTE_FLUSH,
     including ranges promoted to full flushes and both IPI and INVLPGB
     backends.

  2. Remove kernel_tlb_flush_all() and use flush_tlb_all() for kernel
     ranges promoted to a full flush, sharing backend dispatch and
     accounting while counting each request once.

  3. Extract the range-to-full-flush threshold predicate without changing
     its arithmetic or the existing flush policy.

  4. Decouple kernel flushes from flush_tlb_info. Full flushes need no
     descriptor, and range flushes need only start/end. Use a private
     stack descriptor for IPI callbacks, preserving its lifetime through
     the synchronous wait. Keep the smp_processor_id() check in the mm
     descriptor initializer.

  5. Remove the outer preemption guard from flush_tlb_kernel_range().
     Keep the INVLPGB range loop and TLBSYNC protected inside their
     backend helper; the full INVLPGB helper already has that protection.

[1] https://lore.kernel.org/lkml/20260709122933.4021501-1-zhouchuyi@bytedance.com/
[2] https://lore.kernel.org/9cd743e8-4d60-4a5b-906f-07e4ae82dafb@bytedance.com/

Chuyi Zhou (5):
  x86/mm: Account for remote kernel TLB flush requests
  x86/mm: Share the full TLB flush dispatch
  x86/mm: Extract the TLB range flush threshold check
  x86/mm: Decouple kernel TLB flushes from flush_tlb_info
  x86/mm: Re-enable preemption before waiting for kernel TLB flushes

 arch/x86/mm/tlb.c | 63 +++++++++++++++++++++++++++++++------------------------
 1 file changed, 36 insertions(+), 27 deletions(-)

base-commit: e81ee06308379a5f2ededf997bcf17551bce5db7
