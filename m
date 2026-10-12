Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED483612E2
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791776612; cv=none; b=gbGM0OYr9loWk7Ti1g4ksHmO0I47pgb0B+w+AEpI/ZTLhDbfXTzYOPdOYqHItqatvI4MhMsPhf5cqoe7FbergV9NiNNWQL6SjxL2mumLcWm49HUf1HpCn4hRHZXjTqAfxFn2uBG73U5fPU1mXXg0m2r1C2STRT/Q4O6raZNg/2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791776612; c=relaxed/simple;
	bh=U+UQAp7kh/x98hIsREfVhOUGHXS7swVH17fKKU0GUDM=;
	h=Cc:Message-Id:In-Reply-To:To:From:Content-Type:Subject:
	 Mime-Version:References:Date; b=QDH3BJv6mKGo6KHnIrldqQ5foFkfNvrdumBvxb5W6N8fVxtYvR6ySc4oS1AiLJMQqNoBU+gIQpHbGODSfr+tHoN1htFQha5+hYOtaVaH8Xh0ILIFcTlEwKv2YeUiOeJ15QoMTKGFt/KqgWR+rYnmX4BDdlKsH8dEX++zH3ShuQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=c2yys3v3; arc=none smtp.client-ip=209.127.230.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="c2yys3v3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791776605; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=QizeKpOU35qee0IxFSKyyUgNJ+iSR0wduoFJXf9eATQ=;
 b=c2yys3v3TmJT+MeKsUkCmEqVsxFI4R7C05IXeppAAgfvE2qY6Ss4RcxSI8pBjw9umJOOFF
 fPIP3tbtu160YuM/dEttKnlZaFp+6PUDeA1dIAgz6OUOe/UDL875lxkGt+0md+biDiTdNO
 ZcydWXHMm6RL9SDkUUNet4400DVU3MDqWWl0Evr1tonojOulA75FtXukFJZDzOSeasIo5C
 Mo/bwuw633fN9jlqndo4thFNlRqBVpMQ6kXqk0piuNN9xQgu/YnY6IBitJqaQMiGWQBn2t
 IkLettndh0PgPVV0IhAQZlfzwZ92Nm3054nnCTKGhQsw3obq/1jLfDKWf4pWeA==
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>
Message-Id: <cddb2fae2bf241316978aa7f4b3fc945560b7be7.1791443164.git.zhouchuyi@bytedance.com>
In-Reply-To: <cover.1791443164.git.zhouchuyi@bytedance.com>
Content-Transfer-Encoding: 7bit
To: <tglx@kernel.org>, <mingo@redhat.com>, <luto@kernel.org>, 
	<peterz@infradead.org>, <paulmck@kernel.org>, <muchun.song@linux.dev>, 
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <pbonzini@redhat.com>, 
	<bigeasy@linutronix.de>, <clrkwllms@kernel.org>, <rostedt@goodmis.org>, 
	<nadav.amit@gmail.com>
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
X-Lms-Return-Path: <lba+26acc575b+308d5f+vger.kernel.org+zhouchuyi@bytedance.com>
X-Mailer: git-send-email 2.20.1
Content-Type: text/plain; charset=UTF-8
Subject: [PATCH v3 5/5] x86/mm: Re-enable preemption before waiting for kernel TLB flushes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
References: <cover.1791443164.git.zhouchuyi@bytedance.com>
Date: Mon, 12 Oct 2026 11:41:25 +0800

flush_tlb_kernel_range() uses on_each_cpu() to synchronously flush
kernel mappings on all online CPUs when using the IPI backend.

The synchronous wait can become longer as the number of online CPUs
grows, and a remote CPU with interrupts disabled can further delay
completion. Preemption remains disabled throughout this wait, delaying
higher-priority tasks on the initiating CPU. The outer guard prevents
the SMP layer from making its final completion wait preemptible.

The flush_tlb_info descriptor is allocated on the caller's stack and
remains valid until on_each_cpu() returns. The SMP layer protects CPU
selection, IPI queueing and local callback execution, so the kernel
flush caller does not need to remain pinned while waiting for remote
completion.

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
index 2213f1a6f9e1..0deec9e664b8 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1468,6 +1468,9 @@ static void invlpgb_kernel_range_flush(struct flush_tlb_info *info)
 {
 	unsigned long addr, nr;
 
+	/* Keep the INVLPGB operations and TLBSYNC on the same CPU. */
+	guard(preempt)();
+
 	for (addr = info->start; addr < info->end; addr += nr << PAGE_SHIFT) {
 		nr = (info->end - addr) >> PAGE_SHIFT;
 
@@ -1509,8 +1512,6 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end)
 		.end = end,
 	};
 
-	guard(preempt)();
-
 	if (tlb_range_exceeds_ceiling(start, end, PAGE_SHIFT))
 		flush_tlb_all();
 	else
