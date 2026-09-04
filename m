Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F69F3A5445
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 05:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788501260; cv=none; b=fJTrazfbB4+AjiHCKwxMvQ/R2wZDgtT4G/Wan6RYuUjm31qFHPGhL0Wc7Au9+Cm8+ElVjoqc2MTL2mqklIQ8aA+tTi7z6pVWRDU/A6SNasRX8EEVoR7UpfKyDU5UaoSERwWUCF2M6u/X54C5NzOyELxIO+kqmf5sMppzrUu3VhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788501260; c=relaxed/simple;
	bh=QyvMWDW5a6pk85KIRcVBo2wDMSYN9t6gSZyQZcpgK9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PImNVEyVk9Ku6fVPtF9SBO191Pxczw663R1m0ZIKyd+2Wr/7SSH/4gjkqULtFSWkUwYxvmWbcuk2OcRc5IqIrQ9e1JhTxBMp9y2zj+WKcMsgTT7QimoAoWfASDrLmmpVrG9MzuE2vDFOJk9eLMfhLKD87UtD5mapnSrg5K7QrM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNMlntqX; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNMlntqX"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c25ed8a8a43so69813266b.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 22:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788501255; x=1789106055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/nCzaH+VBH73QFOwzl+E2+lVtQSLhEJF7/ywmSzJVrk=;
        b=JNMlntqXWkKO3F+m/+YAaXhKi3N9xaTXvBfXh5BNdWnA358yB7Lcdj/OksF5l9CI+P
         uu0ot48j7hsuLxAYPBQ7WhFcRa2b/e9l00y7lLyZHGS3MILEsbM8feIlx74SMKPjV0FU
         zGj7y89ZQ4kErgg+dXqjLBjUxNS6dDCRaL/1sNurbKnaAD6xRn7sVsDO1pePI96eHM+Z
         voe9YNnmTGAou1zLFhsQ11nITiuwM7agalFcWFYgvlb7F1pHR37YlD/PlGUUIoKluEWB
         hUQYMJzVjL0gals8Cdkyyqbd1teLN96Vh7/U6th5CjoZeygxlWlPtXirC7dxWEL1NMDw
         FnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788501255; x=1789106055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/nCzaH+VBH73QFOwzl+E2+lVtQSLhEJF7/ywmSzJVrk=;
        b=FTcm1SX19/PJybV7nYGHdyLSzxq+6xPWS0+ycc54nBfWBQoQp4U4gPpuJ/+GZ0kQ5A
         a7gts0hEEu/naBWE5/jE1WMl0BxVOOSs/yMjSd5En2DxH0hrNvDyO2mmbGkSc2NcWT36
         0P3binOrGWM2Bj2jkKLQ56IHcrejNqREPF2i6uuDYFEV4nOlEuNqt5C6aW8nxO2Pc3Vp
         oMf5X04R91PJFHURjzckH+bPm0Kuxjy5PnBk3DoH+ngcH+kiDVG1uPVrFAXI+AJKlD0l
         DW5WtVxRjt+fqQtWvMrCai9wxU5q+IKixTAFR+HfxKGigzAiX04Zj2KbffR2Z+DTpdj0
         HyPg==
X-Forwarded-Encrypted: i=1; AKwUvBzqO8tZL06lH2H04EQ/c4w/WQz6sIa+eO4Sozxh/+gCOWmQmMVw4BPWwvtczp/0MjUAzaMhhIAHakIegFc=@vger.kernel.org
X-Gm-Message-State: AFuF++lQvsKVK91Yi95930gMd541Z40gQUUBWXLSIJ7cNf3npuDWKXbT
	W9AwmAPBEpQbq+sfwXACabzQRwiBI8LUs9QjeOUYVcIJblYoMKiAA8+b
X-Gm-Gg: AYBFou1wIV5q3NRh0hPZSkCVFY8gZfcQ9AysdBZxNGZa33SAQ8Y3HmsaCuk6y+k7dcO
	Vv9InU4daoz4DsOtbCFXn0Z2eu8jBQYFqHeu/2mrK81q7dxIF7jpO3Aa6XOHIZCcRuzlyPolwWp
	0yXRfnowdcLIViq7KyUy3pDyGRA0bJo4pZpRB86KawRD7QBNWStXWzDJGE5Zl14Lmv7KGyHbm0K
	oeaJcGwXxnn2jVkI1Vb1xmSgCuypSeL0YE328irIhaOhNBg0uy2S44PGvTOFzry4DQYwhlR43Ey
	gy1uctV5WyavK9gg8zBH0Da2vfiQKVODgpoz9GxnSrBx7cu0y5vKOejEsoE25yIURvUdaX0YpiK
	rdECrapUzV6duDj5yNEVal7k9b3rCpOjtvlrcVOdR+uifAtqUeHlm2LjOIVRZ/7qtNyqPIcCt1i
	+C0yHsuExWeHaTpyA+6Q403Wyvj4wHQhYeXKG6HSE0VHcAAo7iZ/3BueSedgcJAqXWRgg9/83Ck
	qGz8kmx7bCDAJj/mcCp9lRDcBbbvyM=
X-Received: by 2002:a17:906:c102:b0:c25:c662:7e31 with SMTP id a640c23a62f3a-c260cb46b11mr182514766b.23.1788501255277;
        Thu, 03 Sep 2026 22:54:15 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d6e1c01sm55918466b.62.2026.09.03.22.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 22:54:14 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH 1/2] sparc32: serialize SuperSPARC demap operations
Date: Fri,  4 Sep 2026 07:53:05 +0200
Message-ID: <20260904055359.327050-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904055359.327050-1-linmag7@gmail.com>
References: <20260904055359.327050-1-linmag7@gmail.com>
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
index 1b24c5e8d73d..3b87e6f53fca 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -1642,6 +1642,33 @@ static void smp_flush_tlb_all(void)
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
@@ -1669,6 +1696,25 @@ static void smp_flush_tlb_mm(struct mm_struct *mm)
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
@@ -1697,6 +1743,24 @@ static void smp_flush_tlb_range(struct vm_area_struct *vma,
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
@@ -1719,6 +1783,23 @@ static void smp_flush_tlb_page(struct vm_area_struct *vma, unsigned long page)
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
@@ -1773,6 +1854,13 @@ void __init load_mmu(void)
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

