Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A4C135A53
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791776543; cv=none; b=ULZOTmSKqp/rWZ6lBqtlk3oxdVpoqisxbQOOqya1KTv4t2e9lROTEQQcuuiiEqSkW+DdldlqOldGvnCUtiXFBOB//yI9cRtQQ+Ya1FStrRvScbThwlZXp5HXx/JJpAt2Zd+W2mANA509jfZGDFJYv91qVPbnqu7OKqbgR3v1Em4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791776543; c=relaxed/simple;
	bh=riWAIIgmjfyIo7UvYFVqWE67r8+bf7kP7qFR13SrGtk=;
	h=Subject:To:Mime-Version:Content-Type:Message-Id:Cc:From:Date; b=Bt4tTQHlPFSOwn1hnMySDr63i1xymSWrGKIeuQmTq8bKmUr3FsluL0yb5BdWFzMgJk5fMHC9AVhLiNn9rHpXS8gs6saK1Ngcu0ZkyXJ54wHhs5H2OQ2TbEgcQtKvPENpW+z4EJpbnrptkzxqNFdj94yqB0PMuyn3f/D/tHxwK/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=X2u5Jz1D; arc=none smtp.client-ip=209.127.230.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="X2u5Jz1D"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791776529; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=+3+jWRMAqd1rPN3dzQJTRt8hWJmA0r3m4uDDg4X7pJU=;
 b=X2u5Jz1DIVQ3ziBu3OmwYjY2Z2YHX4BHAnfogDQ0UJ00r00AdEArAeP3x7VPRsPoJghrtE
 0w668TBtyrJrP4wnnvlVO1djNKLmRV7eREnWcLjLShd+tvi8wGvwrvxUfwwE7B7SwI20DY
 ySw28WduHhNK7oI5xNhludBRuGggS9UrabGoeqiO6AY7fejeoGzdT1dO513xvM6vBfHGjg
 LupHSPVK1TsLyMPX8wOrVVQDjGzV5ENvm8qOY2gZawwtM/GpfcqxnOUbI27JafdVYOZLuz
 MDLmImyrjZS3TZCrk/UFa6tVsLyZM0iNoZeusn/YHIm8T2LO7XMIESMaVHCewQ==
Subject: [PATCH v3 0/5] x86/mm: Allow preemption while waiting for kernel TLB flushes
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
Content-Type: text/plain; charset=UTF-8
Message-Id: <cover.1791443164.git.zhouchuyi@bytedance.com>
X-Mailer: git-send-email 2.20.1
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+26acc570f+64ac87+vger.kernel.org+zhouchuyi@bytedance.com>
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
Date: Mon, 12 Oct 2026 11:41:20 +0800

Changes in v3:
  - Patch 4: Retain struct flush_tlb_info in the kernel range helpers and
    initialize start/end directly, keeping the shared descriptor for
    future consolidation of the kernel and user paths (Nadav).

v2: https://lore.kernel.org/cover.1791179421.git.zhouchuyi@bytedance.com/

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
context and could trigger a CONFIG_DEBUG_PREEMPT warning. An earlier
revision of the IPI preemption work used raw_smp_processor_id() to
suppress that warning, but this also removed the CPU-pinning check from
the shared initializer used by the mm paths.

The kernel callbacks consume only start and end. This series initializes
those fields directly in struct flush_tlb_info and selects full or range
flushes with the shared threshold predicate. This removes the unused
initiating_cpu initialization while retaining the shared descriptor for
future consolidation of the kernel and user TLB invalidation paths.
The smp_processor_id() check remains in the initializer for the mm paths.

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

  4. Initialize start/end directly in struct flush_tlb_info for kernel
     range flushes and use the shared threshold predicate to select full
     or range flushes. Keep the outer preemption guard and the existing
     kernel helper interfaces.

  5. Remove the outer preemption guard from flush_tlb_kernel_range().
     Keep the INVLPGB range loop and TLBSYNC protected inside their
     backend helper; the full INVLPGB helper already has that protection.

[1] https://lore.kernel.org/lkml/20260709122933.4021501-1-zhouchuyi@bytedance.com/
[2] https://lore.kernel.org/9cd743e8-4d60-4a5b-906f-07e4ae82dafb@bytedance.com/

Chuyi Zhou (5):
  x86/mm: Account for remote kernel TLB flush requests
  x86/mm: Share the full TLB flush dispatch
  x86/mm: Extract the TLB range flush threshold check
  x86/mm: Initialize kernel TLB flush requests directly
  x86/mm: Re-enable preemption before waiting for kernel TLB flushes

 arch/x86/mm/tlb.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)


base-commit: e81ee06308379a5f2ededf997bcf17551bce5db7
