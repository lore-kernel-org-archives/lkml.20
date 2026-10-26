Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018494;
	b=bJ2jbzFk9i4d0u/Kx31cLiebHSRo/NHesDCzo+ELkClUdLQhININWeWiZalyd2lFKh2e
	 x1wjDVjR8+7BhHnSt6+chA/voEZAWy+j9icAeq8gDj53J3uLfv0nOAVnBRDnfQCrtWYr0
	 KpQYBRMyiDJ74GPaHjm9tNFPu0/CcQO0G1t/tIkUc/66Xjw3uASRS3cVv3bzJ2IbG/nck
	 kC9QKz9Q1EmnOGuT8ci/0HA5FRziHlmCS4kWdtG5C/fBus1WAmhaEQlhQwPKSPAqqxz3D
	 vWVIuWvXVfaJOQoWFlxdvz4XJ8LLrI/SWpYpvp3Nz9yjxv+r8zzbMZSVkWH/Agq/nXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018494;
	h=DMARC-Filter:DKIM-Signature:X-Lms-Return-Path:From:Date:
	 X-Original-From:In-Reply-To:To:Subject:Mime-Version:References:
	 Content-Transfer-Encoding:Cc:Message-Id:User-Agent:Content-Type;
	bh=bfKz2LxTA3K6vTqKb6dgTZ3xqIa3eVEfof0MhTPQKCo=;
	b=Tb+GKxvZEBP9n5ULgPRMteo8nk20eNHzG9Y1CgpOfYKq/XDeT9/oaxsUJhzg9nGcF2G+
	 E/98em/+1yVNQ83rb0FuCu0P0CPDVEq5x/qyD7FLT7P4M1uy8VV/VhoPOfnp1Iv74cSvO
	 KuLEn0VoiC1LUdrfYJCBYSoqn5tAA8qo5povmuYJMmsM6eauc3T+9V7OQCHzfVCBxqSqU
	 zkhdTQX25yxOGqYytqEcy4fN5zH5PL/x89kTv/OlT1Rl8GC/u07JQteULgHXyWtqxYqZB
	 3Et2ANcgC5hCwagb18pQGsIfRzYpJpIafI9lGC6ZzlbFtRFwOHiRncvATWtg3JmvlEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=XFs59VEL;
	arc=none smtp.remote-ip=209.127.230.111
Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BC2606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:41:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97BC2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=XFs59VEL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793018486; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=bfKz2LxTA3K6vTqKb6dgTZ3xqIa3eVEfof0MhTPQKCo=;
 b=XFs59VELD1O9hcqHaxRK5QYh0A0R/OAoTnERBo/++HSvrgBEjXV2E1B9g9cozZOFOGp4TZ
 VYxO9B5kUSoshk6naHkt9x6aNCRylZbKGi1pXTb4iGFyMcWWnb0DDNABhjp0we9faTnwsj
 LwJJatbbkIvgW4UGWTUaN2cCLnRF6aZK021gxFxrRqoRGjYZJqc/qHmBhqIwmIydEaXEB3
 2JLGLvXKHoFtC4eQll6oQObIf7muiPcdUvMJqmljZCIDDzPe3F4T76qhkkrtRtyGq1vfGn
 aTRP6/HjfToXsewlEKPc/fa0brraJI7qfuopizu39JaK6oh60OL+UrYQUWocSg==
X-Lms-Return-Path: <lba+26adf4a74+659d92+vger.kernel.org+zhouchuyi@bytedance.com>
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
Date: Mon, 26 Oct 2026 20:41:05 +0800
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
In-Reply-To: <cover.1791443164.git.zhouchuyi@bytedance.com>
To: <tglx@kernel.org>, <mingo@redhat.com>, <luto@kernel.org>, 
	<peterz@infradead.org>, <paulmck@kernel.org>, <muchun.song@linux.dev>, 
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <pbonzini@redhat.com>, 
	<bigeasy@linutronix.de>, <clrkwllms@kernel.org>, <rostedt@goodmis.org>, 
	<nadav.amit@gmail.com>
Subject: Re: [PATCH v3 0/5] x86/mm: Allow preemption while waiting for kernel TLB flushes
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <cover.1791443164.git.zhouchuyi@bytedance.com>
Content-Transfer-Encoding: 7bit
Cc: <linux-kernel@vger.kernel.org>
Message-Id: <641f6906-5f8f-4cc0-8768-cfff2131d47c@bytedance.com>
User-Agent: Mozilla Thunderbird
Content-Type: text/plain; charset=UTF-8

friendly ping...

On 2026-10-12 11:41 a.m., Chuyi Zhou wrote:
> Changes in v3:
>    - Patch 4: Retain struct flush_tlb_info in the kernel range helpers and
>      initialize start/end directly, keeping the shared descriptor for
>      future consolidation of the kernel and user paths (Nadav).
> 
> v2: https://lore.kernel.org/cover.1791179421.git.zhouchuyi@bytedance.com/
> 
> Changes in v2:
>    - Patch 2: Reuse flush_tlb_all() for kernel ranges promoted to a full
>      flush and remove kernel_tlb_flush_all() (Sebastian).
>    - Patch 4: Drop the explicit TLB_FLUSH_ALL check on the end argument.
>      Callers pass actual address ranges and can use flush_tlb_all() for
>      unconditional full flushes (Sebastian).
> 
> v1: https://lore.kernel.org/20260921095359.3784458-1-zhouchuyi@bytedance.com/
> 
> This series follows up on the IPI completion preemption work [1] and
> addresses the deferred flush_tlb_kernel_range() changes. The generic SMP
> completion waits are already preemptible, and commit a5a162fe1ae1
> ("x86/mm: Re-enable preemption before flush_tlb_multi()") allows the mm
> flush paths to use them. The kernel-range change was deferred during
> review [2].
> 
> Container teardown and BPF map destruction can trigger kernel TLB
> flushes through reclamation of unused per-CPU memory. Services that
> spawn and reap many workers can also trigger flushes when vmalloc-backed
> kernel stacks are reclaimed.
> 
> On the IPI backend, flush_tlb_kernel_range() flushes the local CPU,
> sends flush requests to all other online CPUs, and waits synchronously
> for completion. The target set is system-wide even when the container
> or application is confined to a small subset of CPUs.
> 
> The synchronous wait can become longer as the number of online CPUs
> grows. Completion depends on the slowest participating CPU, so a remote
> CPU with interrupts disabled can delay the entire operation.
> flush_tlb_kernel_range() keeps preemption disabled throughout that wait,
> delaying higher-priority tasks on the initiating CPU.
> 
> The kernel path still uses init_flush_tlb_info(), which initializes
> initiating_cpu with smp_processor_id(). Simply removing the outer
> preemption guard would allow that initialization to run in a preemptible
> context and could trigger a CONFIG_DEBUG_PREEMPT warning. An earlier
> revision of the IPI preemption work used raw_smp_processor_id() to
> suppress that warning, but this also removed the CPU-pinning check from
> the shared initializer used by the mm paths.
> 
> The kernel callbacks consume only start and end. This series initializes
> those fields directly in struct flush_tlb_info and selects full or range
> flushes with the shared threshold predicate. This removes the unused
> initiating_cpu initialization while retaining the shared descriptor for
> future consolidation of the kernel and user TLB invalidation paths.
> The smp_processor_id() check remains in the initializer for the mm paths.
> 
> Removing the outer preemption guard then lets higher-priority tasks
> preempt the final IPI completion wait when the calling context permits
> it. Both flush backends remain synchronous, and the INVLPGB helpers
> keep their required preemption protection.
> 
> The changes are split into five patches:
> 
>    1. Account for kernel TLB flush requests in NR_TLB_REMOTE_FLUSH,
>       including ranges promoted to full flushes and both IPI and INVLPGB
>       backends.
> 
>    2. Remove kernel_tlb_flush_all() and use flush_tlb_all() for kernel
>       ranges promoted to a full flush, sharing backend dispatch and
>       accounting while counting each request once.
> 
>    3. Extract the range-to-full-flush threshold predicate without changing
>       its arithmetic or the existing flush policy.
> 
>    4. Initialize start/end directly in struct flush_tlb_info for kernel
>       range flushes and use the shared threshold predicate to select full
>       or range flushes. Keep the outer preemption guard and the existing
>       kernel helper interfaces.
> 
>    5. Remove the outer preemption guard from flush_tlb_kernel_range().
>       Keep the INVLPGB range loop and TLBSYNC protected inside their
>       backend helper; the full INVLPGB helper already has that protection.
> 
> [1] https://lore.kernel.org/lkml/20260709122933.4021501-1-zhouchuyi@bytedance.com/
> [2] https://lore.kernel.org/9cd743e8-4d60-4a5b-906f-07e4ae82dafb@bytedance.com/
> 
> Chuyi Zhou (5):
>    x86/mm: Account for remote kernel TLB flush requests
>    x86/mm: Share the full TLB flush dispatch
>    x86/mm: Extract the TLB range flush threshold check
>    x86/mm: Initialize kernel TLB flush requests directly
>    x86/mm: Re-enable preemption before waiting for kernel TLB flushes
> 
>   arch/x86/mm/tlb.c | 34 ++++++++++++++++++----------------
>   1 file changed, 18 insertions(+), 16 deletions(-)
> 
> 
> base-commit: e81ee06308379a5f2ededf997bcf17551bce5db7
