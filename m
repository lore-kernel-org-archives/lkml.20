Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299317;
	b=xtjMC+6AVjLP45WpnUxcsEoUxCOq7U5Xqi9K6zxOaGju4gMczwTcHsgsoMJE8ud+wV9z
	 M7uWPNe+jloDd9nOekAZ9VEp+wQFHuWpGrYJaEdyx0vap69G2yABB8x6WDUBvGhakcYwY
	 LmCXnOf6Z9c/st7w94Jpkw9BvDCZBGfo1dcrG+pmKH/EjEjdoE3/N6N2rvfH6OvxqLwYN
	 WFRVXis6zirx5pvbJWMi+slFo9jlStoXGdp3k95z9G+TjqzLdxOWxHKkez5KRKGx+SMy4
	 eYh4WcSxb9f4sGDIX92xA2y+Nfed4TN1lKbMAXesUATCNA4Rjb0uu/He9YBsjZa38mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299317;
	h=DMARC-Filter:DKIM-Signature:X-Mailer:X-Original-From:To:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Cc:From:Subject:Message-Id:
	 X-Lms-Return-Path:Date;
	bh=yZ9y+wWVNhxK2/TjJWeGSAm5ULB6ROdb4idQMsF4aRs=;
	b=dAkAlllvRfDmWOPIQwyV3Xmro5R4Xesbrv2eNdyPNnEE4aTleRotuNZWSQGSFvqqJXw2
	 Mrki1nMsC56ZQCHmg62/h5XLqkYo2XosSUhEbNK57D3WzOjQN7tFaK7IpR62NHgNDqyO8
	 Rq9AzT/ph5CXrJ2gZ9gXCGQu9MP8+VxIS+KFCWCqu0MBzdjQlgrnTQYJu/RZwChkKf72g
	 05vNVHomzvXkvlaLWs0P7CzmrblNggbqQo4rUw4+fRFx0kvLT/bwYBUFTYP9O1ZfxyvIc
	 g4E3/+C7dYjilw/dOb++yiUPR53IGuovRGxhjO88Raw7vBYvr9LN/DQ0VDCGEedWtvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=o6HF+l7n;
	arc=none smtp.remote-ip=209.127.230.113
Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D6F606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8D6F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=o6HF+l7n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794299310; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=yZ9y+wWVNhxK2/TjJWeGSAm5ULB6ROdb4idQMsF4aRs=;
 b=o6HF+l7nTdG2Dgy7WFilMDXZNpieNIvkKSE9sD7zRFl+K0yQwvMpYciNbFE1DoSXEcSmcJ
 ER9YIPZVPp/tOuO1muKAQCvoDrAs1s6iOyF/JGoFpcuq8HZym/UoHAj3SlSXaKWHfAQJsz
 DgslYJMkViXjGnY0SXvA5IhOZH7wqaXDz9TW6nhDJkUJ+59j2yv0blO92t98noFEahgv1D
 bdOL308gBxwNwAmFFMKVAM+Ob+RlD9v6XkKvJgrcf1ODWG7U6/X4/88WdyULKIPHncfTLf
 A4K2C06OO+v+wJmGSlzsy1hKe0RbA9UR84E2fbiBlvpEIleL1aEWvmFnASf5JA==
X-Mailer: git-send-email 2.20.1
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
To: <tglx@kernel.org>, <mingo@redhat.com>, <luto@kernel.org>, 
	<peterz@infradead.org>, <paulmck@kernel.org>, <muchun.song@linux.dev>, 
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <pbonzini@redhat.com>, 
	<bigeasy@linutronix.de>, <clrkwllms@kernel.org>, <rostedt@goodmis.org>, 
	<nadav.amit@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
Subject: [PATCH RESEND v3 0/5] x86/mm: Allow preemption while waiting for kernel TLB flushes
Message-Id: <cover.1794235715.git.zhouchuyi@bytedance.com>
X-Lms-Return-Path: <lba+26af2d5ac+76278d+vger.kernel.org+zhouchuyi@bytedance.com>
Date: Tue, 10 Nov 2026 16:28:01 +0800

Changes in this resend:
  - Rebase onto a v7.4-rc2-based tree.
  - Add Reviewed-by from Sebastian Andrzej Siewior to all five patches.

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


base-commit: d7e670601af6c564ccf6d3b2ddf70ee4f41a6d1c
