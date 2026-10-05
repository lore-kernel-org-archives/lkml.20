Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564942264A7
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 05:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791179918; cv=none; b=d/x1/2VLZGxmlIt/cy7iY/YJmK3LSeQlss0f4IB0sQk9hJqdBAU1dtzKDZfRaiBp8AdYN0N9sqfaO7i8KaVY95tnu5fYZOyBTrAJ8LWHPGeLdB46KKYZgCwQ/NtgCZ0fWFlJjOFpyhgi4UulBBB+hBvDh3nLkC316tUKWRkuKks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791179918; c=relaxed/simple;
	bh=XhM2ed6P0+m9ZkVGG1tSkuVCtV5u74kQ+mxSfE9WOvI=;
	h=Cc:From:Subject:Date:Mime-Version:In-Reply-To:To:References:
	 Content-Type:Message-Id; b=avRlV9WQQ81vBw7VmBMcf5UqtdNbJGbBxLYNSQew1zNQhp3dunoDz0bZOvbOM7fL32R9Ixwf/vvdfGqdjTWl+kmWRRqNMGJfwh9cuu89rBTvH2nDgG79XPFn5zoZI9408kmJsIuuZ8zwDS2fXFfre3OeQjEn0PgbRDu9/5JPU8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=kKy2SbMO; arc=none smtp.client-ip=209.127.230.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="kKy2SbMO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791179911; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=DPwSIXivw4JTRcaAh2+SSREgVLK9bwyzA3S+zb+8nDE=;
 b=kKy2SbMOEx/vlzVN/Q/khFviLJexsFsX/vD7JnhRv0Lvu/RniirUlZ1nYRy6yT/FdYKjei
 y5YqAr0Rjeazd00dYQm1gPXsqaHtXH2K7tN1QCvNAy7Pgjaio7twU7WN9PObawgR8JG0Fw
 LZbiCTFj7Oo9WvHsi3etsvPFiA39x8bMfmdCyS3UqXRCKLmNL4mVqkB3u65wj7iKpKdv+y
 4wmIfgD6nvUWHX1s1qRjy3tuZ3BD8aA4fysSqTbgFuyroOrklYcJca6HpSUEe+ZJ66Py0s
 zBVpfZJPdB5Qp+PwcE7gNl1pZNp5430KmldZP7OgA7m7Q64L9MwwQnZUOeOt/g==
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
Subject: [PATCH v2 4/5] x86/mm: Decouple kernel TLB flushes from flush_tlb_info
Date: Mon,  5 Oct 2026 13:57:13 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
In-Reply-To: <cover.1791179421.git.zhouchuyi@bytedance.com>
X-Lms-Return-Path: <lba+26ac33c85+3aa4c4+vger.kernel.org+zhouchuyi@bytedance.com>
To: <tglx@kernel.org>, <mingo@redhat.com>, <luto@kernel.org>, 
	<peterz@infradead.org>, <paulmck@kernel.org>, <muchun.song@linux.dev>, 
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <pbonzini@redhat.com>, 
	<bigeasy@linutronix.de>, <clrkwllms@kernel.org>, <rostedt@goodmis.org>, 
	<nadav.amit@gmail.com>
X-Mailer: git-send-email 2.20.1
References: <cover.1791179421.git.zhouchuyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
Content-Transfer-Encoding: 7bit
Message-Id: <6c44fd268bf18d1b3947df2d3dee3068a5cc3c67.1791179421.git.zhouchuyi@bytedance.com>

Kernel range flushes only need the start and end addresses, but reuse
flush_tlb_info and its initialization of mm state, TLB generations and
the initiating CPU. None of those fields is consumed by the kernel
flush callbacks. In particular, initializing initiating_cpu imposes a
CPU-pinning requirement on a path that does not use it.

Select the full or range flush directly in flush_tlb_kernel_range()
using the shared threshold predicate. The interface accepts actual
address ranges; callers requesting an unconditional full flush can use
flush_tlb_all(). Keep init_flush_tlb_info() and its smp_processor_id()
check for the mm paths.

Pass start and end directly through the kernel range helpers. Package
them in a private kernel_tlb_range only for the IPI callback, retaining
the existing payload alignment. The synchronous on_each_cpu() call
keeps the stack descriptor alive until all callbacks have completed.

Retain the outer preemption guard in flush_tlb_kernel_range() so the
descriptor refactoring does not change the preemption behavior.

Signed-off-by: Chuyi Zhou <zhouchuyi@bytedance.com>
Link: https://lore.kernel.org/20260522104818.CbT5fyN8@linutronix.de/
---
 arch/x86/mm/tlb.c | 40 ++++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 0d03011c6825..b55495765da8 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1464,12 +1464,12 @@ void flush_tlb_all(void)
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
@@ -1482,38 +1482,46 @@ static void invlpgb_kernel_range_flush(struct flush_tlb_info *info)
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
+	if (tlb_range_exceeds_ceiling(start, end, PAGE_SHIFT))
 		flush_tlb_all();
 	else
-		kernel_tlb_flush_range(&info);
+		kernel_tlb_flush_range(start, end);
 }
 
 /*
-- 
2.20.1
