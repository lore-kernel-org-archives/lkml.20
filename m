Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124D5276050
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984478; cv=none; b=nuBJ0oD0oFzsA0/yzHAzB1C9PDSZCqGNyOk/EGpzcy62bilraMzxs2L7VN58lGMcDi5Fmtd7SbKaJv1Ze0TBRPdNykeT0HhbonymbMI/OpL/JDqx94MijICBENICm51+sZnYOkaewIE0xAX9W4LuXddXoMLTlrNvxzoHbKqL18I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984478; c=relaxed/simple;
	bh=d4jtbExCLc+aioYOAZPMs0UpCGo0VE2UG0UB2bCsuLI=;
	h=To:Date:Cc:Message-Id:Content-Type:From:Subject:Mime-Version; b=UjG8vigPxS3WTgRMPS36DkOZkA5DpfKsMuwoJchrAWX9cEwn8YG/LEWWnJdkZKpjS2Eo+kpTqfbIrztLuokInhV+ut/CYpeyHeX4A29y/g8BTVfLbKYcOuaP7MJQklpdXkL2gwNpveMFdNfy+xj7I9Wpfa6PE4+UjIZM9n9ZN0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=lCtCIkfe; arc=none smtp.client-ip=209.127.230.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="lCtCIkfe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1789984462; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=jB7dOy2BGlPKcT4AvTjH8qh3lpiLavE7Sh1Dp6DJ+4w=;
 b=lCtCIkfe4d+usYVPJPpqafIze8+xIJ4IrSoTbD7xgN9zIrxu+vF9DT9xaZZ1GyXi2dikZG
 GgLX9XZ0pmvOaNIgGdICgX50DJF0CwXWKYenqqCuA0pKhWLnu5oBgJ2bK9pjh2ESokPW5M
 iJA7Qp+GSob6pWpJB2P3Lmm3wWUz+SKUtsx/XSHRyOizytqyFRWTYrnVrWuM2gdXvbyeXk
 TSIoGgQhfTI7R9cmqRnBAfoeBAB3TdgJj1H9H3/xuQIMruvV5KPA8NdSFMl1+rpU+j0fyR
 zzpckQ/yGSPr7RmnhD3prQnJllwkSfndD3O6ROiyJQ/S8ySS0mIPMcYSG0XjUg==
To: <tglx@kernel.org>, <mingo@redhat.com>, <luto@kernel.org>, 
	<peterz@infradead.org>, <paulmck@kernel.org>, <muchun.song@linux.dev>, 
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <pbonzini@redhat.com>, 
	<bigeasy@linutronix.de>, <clrkwllms@kernel.org>, <rostedt@goodmis.org>, 
	<nadav.amit@gmail.com>
Date: Mon, 21 Sep 2026 17:53:54 +0800
Content-Transfer-Encoding: 7bit
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>
Message-Id: <20260921095359.3784458-1-zhouchuyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
Subject: [PATCH 0/5] x86/mm: Allow preemption while waiting for kernel TLB flushes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
X-Mailer: git-send-email 2.20.1
X-Lms-Return-Path: <lba+26ab0fecc+e30d18+vger.kernel.org+zhouchuyi@bytedance.com>

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

  2. Make flush_tlb_all() use kernel_tlb_flush_all(), sharing backend
     dispatch and accounting while counting each request once.

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

 arch/x86/mm/tlb.c | 71 +++++++++++++++++++++++++++++++++----------------------
 1 file changed, 43 insertions(+), 28 deletions(-)

base-commit: e81ee06308379a5f2ededf997bcf17551bce5db7
