Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A2148664F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984534; cv=none; b=Fo+WoYXmazxEp7vFIN4NT/y9fTEj59CoyHqC7kYR5ke7/tdv6ryp+3wz9KofXhwjA+03ZOmoEDrsf2LjPTs7sZ/BQ+gO/Ker4TMorRMD7CLZOiq1o5/hO+7+gAIXBHHcrpVMiw3HTSi4JIEps038yFB/Jl5KZbuALwtzHWJtrJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984534; c=relaxed/simple;
	bh=tdJ4y6W831MfrcRxzWcbmDc9h7zfEQgucTZ56tqe1KY=;
	h=In-Reply-To:References:Date:Message-Id:Mime-Version:Content-Type:
	 Cc:From:Subject:To; b=GO+MGWMlciBsdVjr6hvMIDiESwuhOtj/UCP24twaqnDfGuAg97auNcHSJv0U052WbHsPVW+Z6x7+dnzWnRnGe1J6WXQvh2DXAUX+aA9QUpE7QRRvVkJbItVrP1KRf6GWNIAhZKcBbaLtHqN9CyRaRLIBBzeKtDFWPRkH0aM5u1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=WKSB034A; arc=none smtp.client-ip=209.127.230.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="WKSB034A"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1789984523; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=pYrQpTWYHD0kCaq3gvxtuTIuMINfoyz5/m2rYD7GMAg=;
 b=WKSB034ALjcT2M3oZVB41lwzw63UGV4NDZ1DVBq0SEgsxhUOUWROepyweO67MbqCsLP2st
 NfbUkk5/1jcMz0bVVcjTf9YDbBz4SfThACuuRs6yu/Mkza99sysG5Q1XQydmIohVQ4Va2F
 87s9OgeU9Z31hkb+aZYyvhJEv8qa2Y8o7phcQl5jOTnNjwdAqohK+D/tVoTBvO+Y9XW/UA
 LoEM4YIueYoiDskgzxu4rscYx+2m+E3wkJ/HC3c++ZEXZkzQ7wHjExaz48f2nbpdXq7g/8
 mPB57TP6cmKY865MxoVyTCmppTUFZkn0sibfOoZNlZS0SEqgqJaHPASPTqB0lQ==
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
In-Reply-To: <20260921095359.3784458-1-zhouchuyi@bytedance.com>
References: <20260921095359.3784458-1-zhouchuyi@bytedance.com>
X-Mailer: git-send-email 2.20.1
Date: Mon, 21 Sep 2026 17:53:58 +0800
Message-Id: <20260921095359.3784458-5-zhouchuyi@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
Subject: [PATCH 4/5] x86/mm: Decouple kernel TLB flushes from flush_tlb_info
Content-Transfer-Encoding: 7bit
To: <tglx@kernel.org>, <mingo@redhat.com>, <luto@kernel.org>, 
	<peterz@infradead.org>, <paulmck@kernel.org>, <muchun.song@linux.dev>, 
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <pbonzini@redhat.com>, 
	<bigeasy@linutronix.de>, <clrkwllms@kernel.org>, <rostedt@goodmis.org>, 
	<nadav.amit@gmail.com>
X-Lms-Return-Path: <lba+26ab0ff0a+db09ae+vger.kernel.org+zhouchuyi@bytedance.com>

Kernel range flushes only need the start and end addresses, but reuse
flush_tlb_info and its initialization of mm state, TLB generations and
the initiating CPU. None of those fields is consumed by the kernel
flush callbacks. In particular, initializing initiating_cpu imposes a
CPU-pinning requirement on a path that does not use it.

Select the full or range flush directly in flush_tlb_kernel_range(),
using the shared threshold predicate and an explicit TLB_FLUSH_ALL
check. Keep init_flush_tlb_info() and its smp_processor_id() check for
the mm paths.

Pass start and end directly through the kernel range helpers. Package
them in a private kernel_tlb_range only for the IPI callback, retaining
the existing payload alignment. The synchronous on_each_cpu() call
keeps the stack descriptor alive until all callbacks have completed.

Retain the outer preemption guard in flush_tlb_kernel_range() so the
descriptor refactoring does not change the preemption behavior.

Signed-off-by: Chuyi Zhou <zhouchuyi@bytedance.com>
Link: https://lore.kernel.org/20260522104818.CbT5fyN8@linutronix.de/
---
 arch/x86/mm/tlb.c | 41 +++++++++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index f0dfeb271c66..4f9f0a18dbbc 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1469,12 +1469,12 @@ void flush_tlb_all(void)
 }
 
 /* Flush an arbitrarily large range of memory with INVLPGB. */
-static void invlpgb_kernel_range_flush(struct flush_tlb_info *info)
+static void invlpgb_kernel_range_flush(unsigned long start, unsigned long end)
 {
 	unsigned long addr, nr;
 
-	for (addr = info->start; addr < info->end; addr += nr << PAGE_SHIFT) {
-		nr = (info->end - addr) >> PAGE_SHIFT;
+	for (addr = start; addr < end; addr += nr << PAGE_SHIFT) {
+		nr = (end - addr) >> PAGE_SHIFT;
 
 		/*
 		 * INVLPGB has a limit on the size of ranges it can
@@ -1487,38 +1487,47 @@ static void invlpgb_kernel_range_flush(struct flush_tlb_info *info)
 	__tlbsync();
 }
 
+/* Preserve the alignment of the IPI payload shared with remote CPUs. */
+struct kernel_tlb_range {
+	unsigned long start;
+	unsigned long end;
+} __aligned(FLUSH_TLB_INFO_ALIGN);
+
 static void do_kernel_range_flush(void *info)
 {
-	struct flush_tlb_info *f = info;
+	const struct kernel_tlb_range *range = info;
 	unsigned long addr;
 
 	/* flush range by one by one 'invlpg' */
-	for (addr = f->start; addr < f->end; addr += PAGE_SIZE)
+	for (addr = range->start; addr < range->end; addr += PAGE_SIZE)
 		flush_tlb_one_kernel(addr);
 }
 
-static void kernel_tlb_flush_range(struct flush_tlb_info *info)
+static void kernel_tlb_flush_range(unsigned long start, unsigned long end)
 {
 	count_vm_tlb_event(NR_TLB_REMOTE_FLUSH);
 
-	if (cpu_feature_enabled(X86_FEATURE_INVLPGB))
-		invlpgb_kernel_range_flush(info);
-	else
-		on_each_cpu(do_kernel_range_flush, info, 1);
+	if (cpu_feature_enabled(X86_FEATURE_INVLPGB)) {
+		invlpgb_kernel_range_flush(start, end);
+	} else {
+		struct kernel_tlb_range range = {
+			.start = start,
+			.end = end,
+		};
+
+		on_each_cpu(do_kernel_range_flush, &range, 1);
+	}
 }
 
 void flush_tlb_kernel_range(unsigned long start, unsigned long end)
 {
-	struct flush_tlb_info info;
-
 	guard(preempt)();
-	init_flush_tlb_info(&info, NULL, start, end, PAGE_SHIFT, false,
-			    TLB_GENERATION_INVALID);
 
-	if (info.end == TLB_FLUSH_ALL)
+	if (end == TLB_FLUSH_ALL ||
+	    tlb_range_exceeds_ceiling(start, end, PAGE_SHIFT))
 		kernel_tlb_flush_all();
 	else
-		kernel_tlb_flush_range(&info);
+		kernel_tlb_flush_range(start, end);
 }
 
 /*
-- 
2.20.1
