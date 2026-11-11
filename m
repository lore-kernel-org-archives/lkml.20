Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397064;
	b=qvsVaUAIrFc+wnfEaGnhDPRMDcwEIjGlppgkgRbECThpYaegBjDpACuclAClcf03bPvW
	 WyTITTPVusqjA0gGgELbylZzLOf7tlI1hAy77P1e/bfWRWgm5waaFB7TpuO5r6rXRI0ST
	 zSMnX6/p6mxHbU1EKOb3K3g6ksmKJZr8YJXpYbLj7yAQcRHFEamZeDpEE8+htnrugaFWr
	 RDTQHLUeKWpNE22R7J3gm3O8X9xc2KrLQu058tuw5ul55qB9ig+HTehL0UAEM7kC+yATd
	 xlq84rI21nOip5Dmr9E1mL1wInryKe7UXBE/XDeyov7Vm3LilTk1enXxJPdAw2hFy2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397064;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=Ga2X0qPsI+w5/v8YrtZC6CMmMrZ3XeriRteESk78XfM=;
	b=rTQzK74OexhNlSqbIKlEy7sMmwwZehnGy5vqIBZV7Al0ZysGux5d7YflhGdyXxReiGtZ
	 4xb/bTu3SC0yg0Gsx8uvCEsrNHzgw43SVaJK8mHvjfM1pEuj4zPzAIuXy1ggc1Ys10KOJ
	 cPdvgIXL5KapGJCoj3B/pJJDmSvUerjNxd97J877RdNEVaGy4WGZ50gsnIH2FRt5m1cMi
	 STY+nk3ouaft6bWBEjz2c2WdcRco7E4xiDHydUTOBD2mPNaEVOUyaXX0K/Jar0Jbh4je0
	 oioo8pCOfKWW7fAP7I/QIxUsedpf14zJbNrVy4oa/VrOxb4bIN1owXbqXAPp/VjTDtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E7F1606A880
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E7F1606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8AxX9OEU_RqQ4ceAA--.22385S3;
	Wed, 11 Nov 2026 19:37:41 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJAxFs2DU_RqNLczAA--.47862S2;
	Wed, 11 Nov 2026 19:37:39 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: Fix preemptible warnings in cacheinfo and local TLB flush
Date: Wed, 11 Nov 2026 19:37:38 +0800
Message-ID: <20261111113738.862-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxFs2DU_RqNLczAA--.47862S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxCw4kAFy8CFyrAF47Wr4kGrX_yoWruF4rpF
	yxuF18Jr4rXw1kGw1xtw4UXry3Jr95Xa1xtanxAa4rZa1Yvrn8Xrn3Kas7ZF1Uu34kWr4S
	939Iqw1Y9a1UAagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcVc_UUUUU

When CONFIG_DEBUG_PREEMPT is enabled on a Non-SMP kernel, calls to
smp_processor_id() (including via current_cpu_data) in preemptible
contexts trigger many "BUG: using smp_processor_id() in preemptible"
warnings during cacheinfo setup and local TLB flushes.

Moreover, accessing current CPU data without preemption disabled in
local TLB flushes is also unsafe on SMP systems.

Fix the callers properly:
- Use the passed-in 'cpu' parameter to index cpu_data[cpu] directly
  in init_cache_level() and populate_cache_leaves().
- Protect the critical sections with get_cpu()/put_cpu() and reuse
  cpu_data[cpu] in local_flush_tlb_{range, page}().
- Also convert local_flush_tlb_mm() to use get_cpu()/put_cpu() for
  consistency.

This eliminates the warnings on Non-SMP builds while ensuring strict
preemption safety on SMP systems.

Fixes: b61a40afca16 ("LoongArch: Refactor cache probe and flush methods")
Fixes: 09cfefb7fa70 ("LoongArch: Add memory management")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/cacheinfo.c |  8 ++++----
 arch/loongarch/mm/tlb.c           | 22 +++++++++++-----------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/loongarch/kernel/cacheinfo.c b/arch/loongarch/kernel/cacheinfo.c
index 8e231b0d2cd6..334d116e4c29 100644
--- a/arch/loongarch/kernel/cacheinfo.c
+++ b/arch/loongarch/kernel/cacheinfo.c
@@ -11,11 +11,11 @@
 
 int init_cache_level(unsigned int cpu)
 {
-	int cache_present = current_cpu_data.cache_leaves_present;
+	int cache_present = cpu_data[cpu].cache_leaves_present;
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
 
 	this_cpu_ci->num_levels =
-		current_cpu_data.cache_leaves[cache_present - 1].level;
+		cpu_data[cpu].cache_leaves[cache_present - 1].level;
 	this_cpu_ci->num_leaves = cache_present;
 
 	return 0;
@@ -67,10 +67,10 @@ static void cache_cpumap_setup(unsigned int cpu)
 
 int populate_cache_leaves(unsigned int cpu)
 {
-	int i, cache_present = current_cpu_data.cache_leaves_present;
+	int i, cache_present = cpu_data[cpu].cache_leaves_present;
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
 	struct cacheinfo *this_leaf = this_cpu_ci->info_list;
-	struct cache_desc *cd, *cdesc = current_cpu_data.cache_leaves;
+	struct cache_desc *cd, *cdesc = cpu_data[cpu].cache_leaves;
 
 	for (i = 0; i < cache_present; i++) {
 		cd = cdesc + i;
diff --git a/arch/loongarch/mm/tlb.c b/arch/loongarch/mm/tlb.c
index aaf7d685cc2a..ea52a55ca85e 100644
--- a/arch/loongarch/mm/tlb.c
+++ b/arch/loongarch/mm/tlb.c
@@ -40,25 +40,21 @@ EXPORT_SYMBOL(local_flush_tlb_kernel);
  */
 void local_flush_tlb_mm(struct mm_struct *mm)
 {
-	int cpu;
-
-	preempt_disable();
-
-	cpu = smp_processor_id();
+	int cpu = get_cpu();
 
 	if (asid_valid(mm, cpu))
 		drop_mmu_context(mm, cpu);
 	else
 		cpumask_clear_cpu(cpu, mm_cpumask(mm));
 
-	preempt_enable();
+	put_cpu();
 }
 
 void local_flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 	unsigned long end)
 {
 	struct mm_struct *mm = vma->vm_mm;
-	int cpu = smp_processor_id();
+	int cpu = get_cpu();
 
 	if (asid_valid(mm, cpu)) {
 		unsigned long size, flags;
@@ -67,9 +63,9 @@ void local_flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 		start = round_down(start, PAGE_SIZE << 1);
 		end = round_up(end, PAGE_SIZE << 1);
 		size = (end - start) >> (PAGE_SHIFT + 1);
-		if (size <= (current_cpu_data.tlbsizestlbsets ?
-			     current_cpu_data.tlbsize / 8 :
-			     current_cpu_data.tlbsize / 2)) {
+		if (size <= (cpu_data[cpu].tlbsizestlbsets ?
+			     cpu_data[cpu].tlbsize / 8 :
+			     cpu_data[cpu].tlbsize / 2)) {
 			int asid = cpu_asid(cpu, mm);
 
 			while (start < end) {
@@ -83,6 +79,8 @@ void local_flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 	} else {
 		cpumask_clear_cpu(cpu, mm_cpumask(mm));
 	}
+
+	put_cpu();
 }
 
 void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
@@ -112,7 +110,7 @@ void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
 
 void local_flush_tlb_page(struct vm_area_struct *vma, unsigned long page)
 {
-	int cpu = smp_processor_id();
+	int cpu = get_cpu();
 
 	if (asid_valid(vma->vm_mm, cpu)) {
 		int newpid;
@@ -123,6 +121,8 @@ void local_flush_tlb_page(struct vm_area_struct *vma, unsigned long page)
 	} else {
 		cpumask_clear_cpu(cpu, mm_cpumask(vma->vm_mm));
 	}
+
+	put_cpu();
 }
 
 /*
-- 
2.42.0

