Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F34358360
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791776603; cv=none; b=B/lFNarY9nflYWL5xduEbHuk5SLddUEV90NPd98aA8mD+pO1DQc7CtMjtESCeT30XVLI6WF9hqUFjWhXrgpAxaP0N1tw9Ttj1AZSZcUaqQwzzuhui2Q7ssRxmV2ms7EZBG33q1sLy9o4MFfjcJ+mmSEMMutBIM0B/xzIPeHuXVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791776603; c=relaxed/simple;
	bh=rZjXaXl82Y2HJN74zObc/5o/IS1aFstrCNbN9VixXqA=;
	h=Message-Id:References:Cc:From:Mime-Version:Content-Type:To:Date:
	 In-Reply-To:Subject; b=gW/3Azkm7M7rkYLACHPSTprZOFDSoErApz9jWQKCevRHRH2vTS7DxD3z1X2r61BjMiDsZH6JR1/zSnIuzzmuKOhEDHrzAV5nS7oF1slbLJLJAVdEWrARtXQ78/yQGNN2M54UDQt3BZrZq+6McelonZ/+UzGIOGbzkwmDRZk6clw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=HLhdE2JX; arc=none smtp.client-ip=209.127.230.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="HLhdE2JX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791776590; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=GqqzHy7zsxi9FCl8L8b/F071+B4za4e8HRaobQ8ZVbM=;
 b=HLhdE2JXi64W7p+ViIqHiy+pkmhuTC2ptEi9eiND7fEpJfFRNiTzH37jmkdFPfHRU4x8XM
 w1zDaPiMidpJ9n64kyhsQS9kxhytU0YSiPHFauvr5VcvYXavHfWplmxM665adXKiFAzSfG
 0gg1+PHUboOh3RWAagj9bHrxANUYz5uwbAK0AJ+fMjOzz2EysYjPM/Ogcc1gx3XoA51qw3
 7Lp6yY9oD0g/zOr1RuC0JWqzHj2o0Yvy8zVNSzLSyeDiH7x40ZdZUdGe2i0NNVCpZjZdj1
 IpCk9PJjsnLhSzV7zdiC5m6SmIivhEnRar69KqZrnwaFgGQr+96yFuT/SK4F0Q==
Message-Id: <118c877f0db3b27d93321e9167ccf1bf63a44f7e.1791443164.git.zhouchuyi@bytedance.com>
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
References: <cover.1791443164.git.zhouchuyi@bytedance.com>
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: git-send-email 2.20.1
Content-Type: text/plain; charset=UTF-8
To: <tglx@kernel.org>, <mingo@redhat.com>, <luto@kernel.org>, 
	<peterz@infradead.org>, <paulmck@kernel.org>, <muchun.song@linux.dev>, 
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <pbonzini@redhat.com>, 
	<bigeasy@linutronix.de>, <clrkwllms@kernel.org>, <rostedt@goodmis.org>, 
	<nadav.amit@gmail.com>
Date: Mon, 12 Oct 2026 11:41:24 +0800
In-Reply-To: <cover.1791443164.git.zhouchuyi@bytedance.com>
Subject: [PATCH v3 4/5] x86/mm: Initialize kernel TLB flush requests directly
X-Lms-Return-Path: <lba+26acc574c+cbb9c1+vger.kernel.org+zhouchuyi@bytedance.com>

flush_tlb_kernel_range() uses init_flush_tlb_info(), which records
initiating_cpu with smp_processor_id(). The kernel flush callbacks do
not use this field, but initializing it in a preemptible context would
trigger the CPU-pinning check.

Prepare for allowing preemption during the IPI completion wait by
initializing start and end directly in struct flush_tlb_info and using
the shared threshold predicate to select full or range flushes. Keep the
outer preemption guard unchanged.

Signed-off-by: Chuyi Zhou <zhouchuyi@bytedance.com>
Link: https://lore.kernel.org/20260522104818.CbT5fyN8@linutronix.de/
---
 arch/x86/mm/tlb.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 0d03011c6825..2213f1a6f9e1 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1504,13 +1504,14 @@ static void kernel_tlb_flush_range(struct flush_tlb_info *info)
 
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
