Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299397;
	b=1QWFA87qdRtBPYKK/V8NE1ORYNo2ZrAA03hq/AygMDeN7sfKWfKRogRwqjadlFUX7rVm
	 PFUcoL9pYHQs+E5SdCseRTeXqd2KryDG87effK97E18n7OrDSUYluT3ZXirynF4RGTSHA
	 b4UntN0MLLQz+oGlKddH+fIf+IECHdMK3yaH2SMPjvL/N68VMCznTNGI/WO3zAMI1PBYS
	 mf/8UwgkISoSnivdD/kIpm6vTdSyLBoY1zcw2qvtUVH/ZDJtzS5huchAqIMfSjlVtZ9p+
	 rITs+v3/9dnf12fuXeW6fhSNCrMk59gQYNFkQ3CxO/3M8VAO9Mc27AEfAV+axMhP0Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299397;
	h=DMARC-Filter:DKIM-Signature:In-Reply-To:References:
	 Content-Transfer-Encoding:Cc:Subject:Message-Id:Mime-Version:X-Mailer:
	 Content-Type:To:From:Date:X-Original-From:X-Lms-Return-Path;
	bh=2CYxudwwYtM6ibJQTIQhvoAdpBbI0AK70SNX0oRVBD8=;
	b=I0l3WFEtigdIvZrhmh7hHtFakhhcubPDcacheXFEcxrf1uR38SkAHu4+DOH8OLPicSRM
	 m2NQGJy7TeoVW0BO8BKPPDfs6Gf/WUuYiNXwB6rFPYRFPOm8hjs0gvjqBL8d/0M1bjZGa
	 dDq2SlaGDCWfOEDydWjooUKKLfqOzv0AGcOqn7gPDZZTuiQ3AoIeVKuVsbBheKw7BNMsb
	 iOa/AOFGXshpU45MlKlAE24VCMT76xhp+rWhQXUh/kwPh5Ucf2DslhwxKe4730XBgTo5d
	 ktOs/4xHiWdDCdG1NXQ43isa3JJawE7jxnFR3STihm+XzOQ3noKMF13hZ0/zj+7bq+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=nMsbCmTS;
	arc=none smtp.remote-ip=209.127.230.111
Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B74760A263C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B74760A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=nMsbCmTS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794299391; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=2CYxudwwYtM6ibJQTIQhvoAdpBbI0AK70SNX0oRVBD8=;
 b=nMsbCmTSze+qaJwSdDUMepms1wN6q617LKilruKmX2dxKv7aExm/wR11g8WsTm76Mv2Jdn
 rHzthDyKx8knkktvljX1xe1J+PsrHx7s8d/f+GTG3BdPoqX9HyEi7oUKLOm0Bn+gDIEmYk
 OYIpapkrSgtpdNuttMqdX2sGrC3ZYSnpWb0LhvqwqrgMK2YduiJbFxDVPiG4bJBeDZJcUS
 sFfyCspt8MUe9xIV5sox22pQrFXC5NsPgYmDA4XgHPy7U9pGpwPml7bxMZt5CjRKy4gZWn
 3v85PQ9L13lCkQWwNkSsmkgOd+0b81QqHYRx4WS4iYgwIVVp3Z5qs2F8aj1h9A==
In-Reply-To: <cover.1794235715.git.zhouchuyi@bytedance.com>
References: <cover.1794235715.git.zhouchuyi@bytedance.com>
Content-Transfer-Encoding: 7bit
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>
Subject: [PATCH RESEND v3 5/5] x86/mm: Re-enable preemption before waiting for kernel TLB flushes
Message-Id: <7d7ddfa8e7dfe4e3d8923545929b632688442fb0.1794235715.git.zhouchuyi@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.20.1
Content-Type: text/plain; charset=UTF-8
To: <tglx@kernel.org>, <mingo@redhat.com>, <luto@kernel.org>, 
	<peterz@infradead.org>, <paulmck@kernel.org>, <muchun.song@linux.dev>, 
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <pbonzini@redhat.com>, 
	<bigeasy@linutronix.de>, <clrkwllms@kernel.org>, <rostedt@goodmis.org>, 
	<nadav.amit@gmail.com>
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
Date: Tue, 10 Nov 2026 16:28:06 +0800
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
X-Lms-Return-Path: <lba+26af2d5fd+7b5e2b+vger.kernel.org+zhouchuyi@bytedance.com>

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
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/x86/mm/tlb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 97a53a6ce50d..1631ef370e91 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1474,6 +1474,9 @@ static void invlpgb_kernel_range_flush(struct flush_tlb_info *info)
 {
 	unsigned long addr, nr;
 
+	/* Keep the INVLPGB operations and TLBSYNC on the same CPU. */
+	guard(preempt)();
+
 	for (addr = info->start; addr < info->end; addr += nr << PAGE_SHIFT) {
 		nr = (info->end - addr) >> PAGE_SHIFT;
 
@@ -1515,8 +1518,6 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end)
 		.end = end,
 	};
 
-	guard(preempt)();
-
 	if (tlb_range_exceeds_ceiling(start, end, PAGE_SHIFT))
 		flush_tlb_all();
 	else
