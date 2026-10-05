Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87026326945
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 05:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791179930; cv=none; b=eiFvgiRx65hyBzXA8DeRR0HsWOEAAW+Fg0DHUAXgav15QLUeccDKeGLMAZ6hnFOaPxs9WkC5GaGIkWiscIbS7EVI1VuE+yHLjilfLklZ8dcjwJb9F4CqSDTpC+57tkH3hilION8bWcdx7tvaMmlrcq+6ikk7QhuRGAmeKQJEzws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791179930; c=relaxed/simple;
	bh=9IHfhsfXBDhotYYIZAd3/a0+rQ0NxNOflF2v1zjaMrg=;
	h=To:Subject:Message-Id:Content-Type:Cc:Date:Mime-Version:From:
	 References:In-Reply-To; b=VUAiqM0ZCVwZmJ0xKMTqxMb0jDXX3xu34gNptjyWBVlnMcoQlwtQRV+FT4xVfx38y7IaJHmZhJEnCPNmceanhe076uvE8ee/C0wDyeQ1VZT8hPgLYvNgUvcki9mvz4xfoBSgWXPZ6WngAP1YSji9JbEt9reJ8w2KX8iyBHgMqmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=cQZHBD2A; arc=none smtp.client-ip=209.127.230.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="cQZHBD2A"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791179924; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=IMfyplaZ0Ee7ekg2IU5XeX/FDciIU3f0e+pKkC9zpYg=;
 b=cQZHBD2AqhRJp6GpgvN8bADEwrzM+u9s0Pp52oemFdFmPIPVMO3rY5AJUlysi2nDjOu8IZ
 XN9ZxpP8T/lIFGDKAqhK00IFg+RPCm6LVhzsubwV46mZt8MFhHAyIyQspU3gJY6Yz2Txgd
 IGNIPVj5uFdQ7uXJeFmeGFo/q6mzhw6+jlfIkcBXr8D8SdOZAm/A80K15+ORRk8mrqG6R2
 Ob8TIY4QG+yqriZF8kmkWnko8EU8PY3VO9qQ1LFedngr9QvPtkBMO9xhlSLUwM4Ri2BGDu
 HbDrC3tf03tAEwpwHiLkkWZBofH0pqKkUddOpPOwQu3gDcb/8PaXXA57MIqGjg==
To: <tglx@kernel.org>, <mingo@redhat.com>, <luto@kernel.org>, 
	<peterz@infradead.org>, <paulmck@kernel.org>, <muchun.song@linux.dev>, 
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <pbonzini@redhat.com>, 
	<bigeasy@linutronix.de>, <clrkwllms@kernel.org>, <rostedt@goodmis.org>, 
	<nadav.amit@gmail.com>
Subject: [PATCH v2 5/5] x86/mm: Re-enable preemption before waiting for kernel TLB flushes
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 7bit
Message-Id: <398b8b24bdbbc175476de5d48aa7326aae7af8ae.1791179421.git.zhouchuyi@bytedance.com>
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>
Date: Mon,  5 Oct 2026 13:57:14 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26ac33c92+d1494f+vger.kernel.org+zhouchuyi@bytedance.com>
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
References: <cover.1791179421.git.zhouchuyi@bytedance.com>
In-Reply-To: <cover.1791179421.git.zhouchuyi@bytedance.com>

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
index b55495765da8..8bfcd66b639d 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1468,6 +1468,9 @@ static void invlpgb_kernel_range_flush(unsigned long start, unsigned long end)
 {
 	unsigned long addr, nr;
 
+	/* Keep the INVLPGB operations and TLBSYNC on the same CPU. */
+	guard(preempt)();
+
 	for (addr = start; addr < end; addr += nr << PAGE_SHIFT) {
 		nr = (end - addr) >> PAGE_SHIFT;
 
@@ -1516,8 +1519,6 @@ static void kernel_tlb_flush_range(unsigned long start, unsigned long end)
 
 void flush_tlb_kernel_range(unsigned long start, unsigned long end)
 {
-	guard(preempt)();
-
 	if (tlb_range_exceeds_ceiling(start, end, PAGE_SHIFT))
 		flush_tlb_all();
 	else
-- 
2.20.1
