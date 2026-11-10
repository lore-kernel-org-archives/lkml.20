Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299386;
	b=yIXCQ27ISUhQO/AXA8gBIe5P1vecG6V4yztdx2avZKX6ZcMc3FPyqMpiyURlqmGpZyCR
	 OwAcORCibSpbAK8Sg/o8wkT85F/r8g1Fxu4NN9v8g/a5BOKlCaHsmmhe9pMQ39SkYIcjM
	 ee4v5FG9dHViKbSbDrlzt9gz64nybSeVot6FF9saoMLNMP7oh+xxuDta1ToTK3HrIM6bX
	 dhLBF55ofj9c9/e+4A2VwOoH9Hd79zfsyLdEslMLh0NOVZubcemOvLTVZWEUn+VsLX+Gf
	 VBhZ8QLNi657CRu8bTCBUWHVoWkkw3cWEm09YClPzlx4BjnONHFw6TxFarh8sKhWrqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299386;
	h=DMARC-Filter:DKIM-Signature:Content-Transfer-Encoding:
	 X-Lms-Return-Path:Content-Type:Subject:References:X-Original-From:
	 In-Reply-To:Mime-Version:From:Message-Id:Cc:Date:X-Mailer:To;
	bh=lWbRAuqJdf1qhEyjUSJGRelCNDi+30ARRNUY3568XFs=;
	b=AUUAHo0vR3Q5na4cgHpiIjnGjPw1Juh9kCUj5DrQ5/8LiotwdFcwtJeGbx7v4aAO37rP
	 zO8YSDcIkOUhutfPUwLn3ik4LW0SMPjw5ivTu+fk5VHx5YRRXZTBAKx7k6Ps9saT7wrVC
	 X2WdHEmXaL9cqua+P+JUFk2WC+XKKARNn76SuSs7UjYT2VIJmlHISxOYTVRLoECvMa7Wr
	 fINEB1odtS+TzwRDm4UknPuIiLrTByy41gA/plvxRBlxXnRlDeDwoz4MinJdXbQqVJVAT
	 JlDV8eZ+UULdTpEHBJQYLXnlGX2GDJpYrtTghk0PxZt4kWMXpOB1Xxcg4M3WJYRf76g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b="eCd7i8i/";
	arc=none smtp.remote-ip=209.127.230.115
Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F78260A2630
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F78260A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=eCd7i8i/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794299376; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=lWbRAuqJdf1qhEyjUSJGRelCNDi+30ARRNUY3568XFs=;
 b=eCd7i8i/y3udiscGtxEb/2vehe2A4mrfHC2ff5wRYVGLWqVG3ML0uKbZCYkTQfEB5YZMXL
 EdxOjWB7ToKc4/bxH7poadJbW0x4Y6hsJNTIZdhqIZ/DqFb7hPw39EuDbEHzWU85cepUWy
 BCrFDQsE/3Yy/ct3c+lwrF+Lgwe7gwyw+Z9FJzLmuuXCqOM3ic2DBerMvOPlplOVieWhSo
 XnyOe5Pk8Noxl/CGjvhLCbpCg8U0XBZ8olkGgi1NuYn4/xsZxuZWgGAfudJsulb9EL6bzg
 Q5Lw18HCYEj0yeM1/NRK65hdrfinlEJ6zLKUT/ksJr3vvYbxwWo+cps44J1x8Q==
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+26af2d5ee+a03153+vger.kernel.org+zhouchuyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Subject: [PATCH RESEND v3 4/5] x86/mm: Initialize kernel TLB flush requests directly
References: <cover.1794235715.git.zhouchuyi@bytedance.com>
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
In-Reply-To: <cover.1794235715.git.zhouchuyi@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
Message-Id: <94d14cc291eaf039f838627d7ede31d9dfa07eaf.1794235715.git.zhouchuyi@bytedance.com>
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>
Date: Tue, 10 Nov 2026 16:28:05 +0800
X-Mailer: git-send-email 2.20.1
To: <tglx@kernel.org>, <mingo@redhat.com>, <luto@kernel.org>, 
	<peterz@infradead.org>, <paulmck@kernel.org>, <muchun.song@linux.dev>, 
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <pbonzini@redhat.com>, 
	<bigeasy@linutronix.de>, <clrkwllms@kernel.org>, <rostedt@goodmis.org>, 
	<nadav.amit@gmail.com>

flush_tlb_kernel_range() uses init_flush_tlb_info(), which records
initiating_cpu with smp_processor_id(). The kernel flush callbacks do
not use this field, but initializing it in a preemptible context would
trigger the CPU-pinning check.

Prepare for allowing preemption during the IPI completion wait by
initializing start and end directly in struct flush_tlb_info and using
the shared threshold predicate to select full or range flushes. Keep the
outer preemption guard unchanged.

Signed-off-by: Chuyi Zhou <zhouchuyi@bytedance.com>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Link: https://lore.kernel.org/20260522104818.CbT5fyN8@linutronix.de/
---
 arch/x86/mm/tlb.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 7ed4e5cbd563..97a53a6ce50d 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1510,13 +1510,14 @@ static void kernel_tlb_flush_range(struct flush_tlb_info *info)
 
 void flush_tlb_kernel_range(unsigned long start, unsigned long end)
 {
-	struct flush_tlb_info info;
+	struct flush_tlb_info info = {
+		.start = start,
+		.end = end,
+	};
 
 	guard(preempt)();
-	init_flush_tlb_info(&info, NULL, start, end, PAGE_SHIFT, false,
-			    TLB_GENERATION_INVALID);
 
-	if (info.end == TLB_FLUSH_ALL)
+	if (tlb_range_exceeds_ceiling(start, end, PAGE_SHIFT))
 		flush_tlb_all();
 	else
 		kernel_tlb_flush_range(&info);
