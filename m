Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7242D8DA8
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984841; cv=none; b=g19/XtdUfjPN2oWrdY8GS/Q62KFdpO7GYn0Y990qbnLU+ZMyipvhyCbX8JGEwDwGmrqilGGuE/4WHWDPabSeI1y3pZaIVeqnKqTnmHABQOZxCPWNUyqLL5h+YvzEH9QdoOruti0H7ZVMMuGVOaeWar5qlJil2P9DTGS4V7So6Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984841; c=relaxed/simple;
	bh=JMon/sqgQsJexCEWq8SVfFoEgmuxLqowCdCV90yuWac=;
	h=Cc:Date:Mime-Version:Subject:Message-Id:References:In-Reply-To:
	 Content-Type:To:From; b=OHUwadUvK6xK2A0tIle+FUs+2lBE+lbgzewuiZdp8UvF9cnKD9RPFfH7uaLAITU+1HhoVC/BSzbPveewqOISrAzkPl6q6rvcFB5w64kUW9qiQI8QoHqrMHVV+DI6vF4hAYaNwX7f4UjhaYqXDq+1lOMRRu6xa/rnGyJFTXJhJHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=PlgjNYoQ; arc=none smtp.client-ip=209.127.230.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="PlgjNYoQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1789984828; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=FEEUMLjS98DKCdGbmaNycCrOOVlmaBW7hZVkLLaDhkk=;
 b=PlgjNYoQVQagATxgJHR6AjdwljuXBBBZWWaWfBfVEWsLxPadn/z14hrfSc6h5IcoZmR4Vx
 m6PF7kc3V/PVDHrhespX0dahPIBeOY3XrzJH1ALoMYsEU4S6XPUzy+ozrowy+9en/ENcah
 j+KZrgF6PaFb0qKwwlEKqjX1P5sESw7iQ1KHa/sAMe3/4d8ZKyqvqPsbtOC+SeDmnOGLe7
 YxMAsEUZTHkguwLFQKwZxuJj3PDJ5HAtclOvgKbB1n9uGiq8zCecHiuhdcXIE2qMqGxqLZ
 jnyVf9u2zrDWaXv2qUnT6tH4sraXXH1dEn8RxnTCAH+7tBufbH9atJWi3TQ9Rw==
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>
Date: Mon, 21 Sep 2026 17:59:59 +0800
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26ab10035+f6b991+vger.kernel.org+zhouchuyi@bytedance.com>
Subject: [PATCH 5/5] x86/mm: Re-enable preemption before waiting for kernel TLB flushes
Message-Id: <20260921095959.3787573-1-zhouchuyi@bytedance.com>
Content-Transfer-Encoding: 7bit
References: <20260921095359.3784458-1-zhouchuyi@bytedance.com>
In-Reply-To: <20260921095359.3784458-1-zhouchuyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8
To: <tglx@kernel.org>, <mingo@redhat.com>, <luto@kernel.org>, 
	<peterz@infradead.org>, <paulmck@kernel.org>, <muchun.song@linux.dev>, 
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <pbonzini@redhat.com>, 
	<bigeasy@linutronix.de>, <clrkwllms@kernel.org>, <rostedt@goodmis.org>, 
	<nadav.amit@gmail.com>
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
X-Mailer: git-send-email 2.20.1

flush_tlb_kernel_range() uses on_each_cpu() to synchronously flush
kernel mappings on all online CPUs when using the IPI backend.

The synchronous wait can become longer as the number of online CPUs
grows, and a remote CPU with interrupts disabled can further delay
completion. Preemption remains disabled throughout this wait, delaying
higher-priority tasks on the initiating CPU. The outer guard prevents
the SMP layer from making its final completion wait preemptible.

The kernel range descriptor is private stack storage and remains valid
until on_each_cpu() returns. The SMP layer protects CPU selection, IPI
queueing and local callback execution, so the kernel flush caller does
not need to remain pinned while waiting for remote completion.

INVLPGB requires separate protection: TLBSYNC only waits for operations
issued on the same CPU. Disable preemption inside
invlpgb_kernel_range_flush() across the broadcast loop and TLBSYNC.
The full-flush helper invlpgb_flush_all() already provides this
protection.

Remove the outer preemption guard from flush_tlb_kernel_range() so the
IPI completion wait can be preempted when the caller's context allows
it. Keep both flush backends synchronous.

Signed-off-by: Chuyi Zhou <zhouchuyi@bytedance.com>
---
 arch/x86/mm/tlb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 4f9f0a18dbbc..f7773ba4a152 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1473,6 +1473,9 @@ static void invlpgb_kernel_range_flush(unsigned long start, unsigned long end)
 {
 	unsigned long addr, nr;
 
+	/* Keep the INVLPGB operations and TLBSYNC on the same CPU. */
+	guard(preempt)();
+
 	for (addr = start; addr < end; addr += nr << PAGE_SHIFT) {
 		nr = (end - addr) >> PAGE_SHIFT;
 
@@ -1521,8 +1524,6 @@ static void kernel_tlb_flush_range(unsigned long start, unsigned long end)
 
 void flush_tlb_kernel_range(unsigned long start, unsigned long end)
 {
-	guard(preempt)();
-
 	if (end == TLB_FLUSH_ALL ||
 	    tlb_range_exceeds_ceiling(start, end, PAGE_SHIFT))
 		kernel_tlb_flush_all();
-- 
2.20.1
