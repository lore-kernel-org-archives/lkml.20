Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558413CD8B5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789631954; cv=none; b=gVqmhKzP0Z3cSs1O3xAR0FRqg9m+DAgjM6SXIm8BIr2N2WMxnlnkD1Vn6PCnXZ1+GtAf1x5UwZlQu+9dkoC3Iw8AT3ZU9P0hBdBkbpzOHDwijq2FqNt8Wyv55o2BizEZLK4olrKEgpRQ/M2QkLUQSLNiIkL5YwxtGt0z1ignOs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789631954; c=relaxed/simple;
	bh=IfxzcSEtq1pgI6DFXYGLlGfpA7qo4ehpMPHvD1FGewQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T1NHCixpblww7S2rne/cbTGL4DO34wzBJsuGekeoIHVBXoVZ/qKXnoR9TAmmyAsWg7UiOsiogNvmsimHEAjl24OjfLOfZvicqFUgkhhzxTAx+S6lEtPVWvsl5QUV7bmchJXPjJ11flKx6i4b+bTv93CTwq0U4FTwufSALMbDyCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hUzpwnmD; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUzpwnmD"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a996c8adf3so959843a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789631950; x=1790236750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UATMPshT3EDYBa+P/NZwWbUVnJgOPrL98pDmUHIgP9M=;
        b=hUzpwnmDDBp2PCZfxCQci0uBD+uhso3cfJ/4rL7UPAQ4Tmwi67wyzLFMTOF8vXdNhN
         powdlcVwD8D8YdCCX1VcwHHyReQntGTZlqknbQvD80YTLJJc7qkVhFMFC8zfBhB7afNh
         CHYO/jJ6ZPwnk8D+TqMMgfIqLJXzNUxs92x0AIgYDFwimkdVbsBwmV3Lue3QU8JZt0eP
         HqlXh8HPWQg8TzqkE0KwlCfVynR2OR5Sko3INjx/744iQGEeuKVFG+abspJXbKiP5fPB
         iKSeVcY8PzXB6g0oaR3Su78vIaVMFI4aTL0xLUExa5bv261Jq1UE6b9EkzQKhvaQabpQ
         gBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789631950; x=1790236750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UATMPshT3EDYBa+P/NZwWbUVnJgOPrL98pDmUHIgP9M=;
        b=f62ICLeicPG/Cstq6lMBQcUtYjb2M56MLEVSwEezHMcTsJsJe9ZCeX09GznNALfAoC
         EU6KW2l0zQSIWhpfFi8j8DU+c4w4DCSi691uXxNJXvp796SP//fTzZuZgPjE5T8UsnEW
         9nI8WFEj1LUX/NWRDXntQ4GWor+JQgKIlI2Xxe8kI59a2o8KZXi9jcWtsIXxmx5O/nkN
         zp6B7inVO8wOSo7Cof5wbf+bjIrQAOwG/W7j6BNkzi5j8CQzzy9EBfVf98Ya4aMmed97
         mGT+oasHJWrIIvqLDUHr8odnBKMbwIYuS/OH8yDwPBoBR7RC/Z9X8NjEJQDuQKzNcAMP
         ewLg==
X-Forwarded-Encrypted: i=1; AKwUvBy6zOeFQA7LhPOgOdGr6m9nrY9TtRxGTjx8h7GO2G1L3Q6FVdG6+kIB0Iuf0JSc6xHf+HgbIsjWEZFt1FE=@vger.kernel.org
X-Gm-Message-State: AFuF++kHe4b+i/TFEQYPDBz8UY9ompKTqvReuit9GFXdUV3tkTfkcgVu
	Qca9lvKbjuWz4BLCQ8UQHy2mJVbeJ2KMUnKgumPpweYl8iQRUc0O8HLl
X-Gm-Gg: AYBFou0/Y1J0Dyofo7EmcAapzX1+118qAmmaTPkZIWm8dwvBe0lK23itR4PPReIki44
	ItZeVFQysZT6xkuO/ntHIxYVszyfFYgDu3C/hwGdj6OusKbKPDm5zmkVxUFsIlaO0wFRLuT0G6w
	9p1Xg5s7xB2afG7AiQrXoDVpd1nUCy/JB8vjKSWvdE57enhzUNZ3mFDUSXWs9hyf/LT0Nbp+aPU
	A1rlRMQJeRUczg2R0bjEbMoZSHRfz7ujHIXqWBQs6NsMoSg2ThYDquEIXiXJBpq3oB2OEP9tAeL
	/xiXsGM2vFCd00aPRJIzGcNCq4dW1+6XjtC7slGs/hNBe7oppKRXHhIhuy/g6DJFaBG+fI10vcE
	8+uDj2vORzv2emNHytyATMlAnwBoygQzydJXT0UncFEYQhoWWsWrWXArI68L1sbJ2TfBzOF9kOY
	TtJgqwpgHQlmDYwQJVdrsgJr8xDst1NN675OHn1LjNZv4sVE8hLB6gIWYCplCIauO11VpZSzwsl
	QWuqFzUVj+ZQ4hFfp7WDpJr8VsZ9qiiH+UmTsR3rNY=
X-Received: by 2002:a05:6402:2350:b0:6a6:58e:f84b with SMTP id 4fb4d7f45d1cf-6aa22391b30mr7746199a12.9.1789631950466;
        Thu, 17 Sep 2026 00:59:10 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de453ea0sm250287766b.11.2026.09.17.00.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 00:59:10 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [PATCH v2 1/2] sparc32: serialize SuperSPARC demap operations
Date: Thu, 17 Sep 2026 09:57:04 +0200
Message-ID: <20260917075842.784996-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917075842.784996-1-linmag7@gmail.com>
References: <20260917075842.784996-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SuperSPARC requires software to guarantee that only one Demap operation
is in progress across the system. On MBus, each processor which may
retain a stale translation must perform its own local Demap.

A lock around each local operation is not safe on sun4m. Cross-call
callbacks run at interrupt level 15, so they can interrupt a CPU even
while spin_lock_irqsave() protects its local Demap. If the callback then
takes the same lock, it deadlocks against the interrupted owner.

Serialize each complete shootdown at the initiating CPU instead. Invoke
remote CPUs one at a time with lock-free callbacks, perform the
initiator's local Demap last, and release the lock only after the entire
operation is complete.

sun4m_cross_call() waits for the target CPU to complete its callback.
Singleton cross-calls therefore serialize the actual Demap operations,
not merely their dispatch.

sun4d already serializes Viking TLB flushes around its broadcast Demap
operations, so this wrapper is needed only for sun4m.

This is independent of MBus cache coherence. MBus Level 2 and the MXCC
coherence protocol describe physical cache-block transactions; they do
not make an MBus peer discard a virtual TLB entry.

This follows SuperSPARC Family User's Manual sections 8.5.3 and 9.8.2;
Sun-4M System Architecture section 7.1.4; MBus Interface Specification,
Level 2 Overview; and MXCC Addendum section B.2, Multiprocessor Cache
Coherence Support.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/mm/srmmu.c | 88 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index 444295c20b94..ea0cc3683ad2 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -1590,6 +1590,33 @@ static void smp_flush_tlb_all(void)
 	local_ops->tlb_all();
 }
 
+/* Serialize complete sun4m Viking shootdowns; remote callbacks must not lock. */
+static DEFINE_SPINLOCK(viking_tlb_lock);
+
+static void smp_viking_flush_tlb_xcall(void *func, unsigned long arg1,
+					  unsigned long arg2,
+					  unsigned long arg3)
+{
+	int cpu;
+
+	for_each_online_cpu(cpu) {
+		if (cpu == smp_processor_id())
+			continue;
+		sparc32_ipi_ops->cross_call(func, *cpumask_of(cpu),
+					    arg1, arg2, arg3, 0);
+	}
+}
+
+static void smp_viking_flush_tlb_all(void)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&viking_tlb_lock, flags);
+	smp_viking_flush_tlb_xcall(local_ops->tlb_all, 0, 0, 0);
+	local_ops->tlb_all();
+	spin_unlock_irqrestore(&viking_tlb_lock, flags);
+}
+
 static bool any_other_mm_cpus(struct mm_struct *mm)
 {
 	return cpumask_any_but(mm_cpumask(mm), smp_processor_id()) < nr_cpu_ids;
@@ -1617,6 +1644,25 @@ static void smp_flush_tlb_mm(struct mm_struct *mm)
 	}
 }
 
+static void smp_viking_flush_tlb_mm(struct mm_struct *mm)
+{
+	unsigned long flags;
+
+	if (mm->context != NO_CONTEXT) {
+		spin_lock_irqsave(&viking_tlb_lock, flags);
+		if (any_other_mm_cpus(mm)) {
+			smp_viking_flush_tlb_xcall(local_ops->tlb_mm,
+						     (unsigned long)mm, 0, 0);
+			if (atomic_read(&mm->mm_users) == 1 &&
+			    current->active_mm == mm)
+				cpumask_copy(mm_cpumask(mm),
+					     cpumask_of(smp_processor_id()));
+		}
+		local_ops->tlb_mm(mm);
+		spin_unlock_irqrestore(&viking_tlb_lock, flags);
+	}
+}
+
 static void smp_flush_cache_range(struct vm_area_struct *vma,
 				  unsigned long start,
 				  unsigned long end)
@@ -1645,6 +1691,24 @@ static void smp_flush_tlb_range(struct vm_area_struct *vma,
 	}
 }
 
+static void smp_viking_flush_tlb_range(struct vm_area_struct *vma,
+				       unsigned long start,
+				       unsigned long end)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	unsigned long flags;
+
+	if (mm->context != NO_CONTEXT) {
+		spin_lock_irqsave(&viking_tlb_lock, flags);
+		if (any_other_mm_cpus(mm))
+			smp_viking_flush_tlb_xcall(local_ops->tlb_range,
+						     (unsigned long)vma,
+						     start, end);
+		local_ops->tlb_range(vma, start, end);
+		spin_unlock_irqrestore(&viking_tlb_lock, flags);
+	}
+}
+
 static void smp_flush_cache_page(struct vm_area_struct *vma, unsigned long page)
 {
 	struct mm_struct *mm = vma->vm_mm;
@@ -1667,6 +1731,23 @@ static void smp_flush_tlb_page(struct vm_area_struct *vma, unsigned long page)
 	}
 }
 
+static void smp_viking_flush_tlb_page(struct vm_area_struct *vma,
+				      unsigned long page)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	unsigned long flags;
+
+	if (mm->context != NO_CONTEXT) {
+		spin_lock_irqsave(&viking_tlb_lock, flags);
+		if (any_other_mm_cpus(mm))
+			smp_viking_flush_tlb_xcall(local_ops->tlb_page,
+						     (unsigned long)vma,
+						     page, 0);
+		local_ops->tlb_page(vma, page);
+		spin_unlock_irqrestore(&viking_tlb_lock, flags);
+	}
+}
+
 static void smp_flush_page_to_ram(unsigned long page)
 {
 	/* Current theory is that those who call this are the one's
@@ -1721,6 +1802,13 @@ void __init load_mmu(void)
 	}
 
 	if (poke_srmmu == poke_viking) {
+		if (sparc_cpu_model == sun4m) {
+			smp_cachetlb_ops.tlb_all = smp_viking_flush_tlb_all;
+			smp_cachetlb_ops.tlb_mm = smp_viking_flush_tlb_mm;
+			smp_cachetlb_ops.tlb_range = smp_viking_flush_tlb_range;
+			smp_cachetlb_ops.tlb_page = smp_viking_flush_tlb_page;
+		}
+
 		/* Avoid unnecessary cross calls. */
 		smp_cachetlb_ops.cache_all = local_ops->cache_all;
 		smp_cachetlb_ops.cache_mm = local_ops->cache_mm;
-- 
2.43.0

