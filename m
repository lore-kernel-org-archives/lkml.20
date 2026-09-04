Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A7342589D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788539085; cv=none; b=ej/CKLreljue0YODRxSOLfRxxgOgLMzmf55tIfctME8sUou8IMRI5Hsgvuw9ylp1OgSG2nS7HIpN82dnlPwz38wvO0O9G391Vw6R5+B2xNomLUgIztnTRUnStLh6/RFvIQHFcnqZbv2bVd+O/1YZ92+IiAw3584hays1iN1qZWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788539085; c=relaxed/simple;
	bh=HlN5YnDweCOpG8VQXjHy6qDm1MuEvX6Cee/9GSUDnxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EuEM6RrYDCBO8OVeoAbr/GnKLRJVnPEJ2wcPENq8PeS36zn1pDJ8OD+HZRQerNzSJol0JFtoJ0u18xX2852WRw6muG+skpV0J8uJJlKsI56P9oaN2+Jg9uX/RkYQ3zV7XmcHL9pvVDVSNZS89tDAfszXU6jjr906qmKe6oS4RyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BaAcFSOQ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BaAcFSOQ"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c25366c9b42so127300466b.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788539082; x=1789143882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szgZspOqVLf1TpMBmBC0uz+tJr/w1CZGHEmGR/wZqIY=;
        b=BaAcFSOQHG8HzkO3nzTnWCMR6L7p+pg4wKj4lbPaAkrlZifcVGvLMA4upMwHAhV7Zn
         43UfZzsKQDUfKzWl/+vywjfBAPtCmuRbNWL4fkaljQNrG7Mf6zRhs2mX4FUkVNccNXNc
         7Kfyz311Y/l/zIcRr0K2J2BXTNp/6l01LerVMg5Gm5sxpUzk0VKq2EhtV6U0doSbZJBB
         xDplbkUECxwLfJucvyQVFn1mLpz3kKDnmnJyPYg9UYheXGIytmCWXIJJCrZN70rbKWAL
         S9t/aLqZnQ9gGK1kjoewrjhYaqAigOTLHqGoMYxcDbEHKYhHSjxihXttoArZyxaNQAml
         JTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788539082; x=1789143882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=szgZspOqVLf1TpMBmBC0uz+tJr/w1CZGHEmGR/wZqIY=;
        b=m6ZZ3VeR0kJygTNiinDkre/QQ1AJ4nHZjiZYfBGbGBaYnDQf2+LL2E8CIr5W2yEZsm
         3WLUNENAqFuEVk3pyJNLFFW9/u68hCntYakT077+q0cQ18VpYc3PK1UmF4Q86yEXW/gD
         B72si363BQv3Zv0UxZ/JAujtyD3lIUGkMZ+yBIncBQXnj8/17lsDjvH+WaKCv18lu87W
         +rUtAGrfvE5HLjTEszc33mjkHNw6geJ3xJzGm0BE0lKpX1zInWkmH38BqFnj7W64qPEb
         4jakqrOvwwO+r0+bRrmCXIgkoFTHamPzGXLJILIxOBNuI2wqSnoE0yQ1MQirZrkuZbmo
         BeBg==
X-Forwarded-Encrypted: i=1; AKwUvBzRFLE+LSDkemO4+3sTSgHbmhYNTrCu+rN3i41wNOpErCp7YEKLXyAUXnnKdangczT97a0A6UJL8NOJzXw=@vger.kernel.org
X-Gm-Message-State: AFuF++nWysoY2zlFcawm6u5bkfHByiF6iE4kxLV5aDTPt6v/NfGJ2p1A
	K2M9OUiGLDqFZv4qi6+9q3WXlIWPWXHHCwxDLktw0QhczM6z0KH21sN8
X-Gm-Gg: AYBFou1qrp1QjY4eY+FEgIMsgG4uASDmDdbVXCC1za2301eo6FO3YL5y/jVQSxBTKsa
	r48P86ygLh/UdXIgpFl6XZBG+FfoyCQNYmFdt0uCnr7IHrLWdEJJNoqTevipBfe/nVCjetUngDc
	DXdlC1dmJSCwDxxtlOSdtkNzExW5dLAF1qont/FSPg0U+6yL/37wr7o7XIZLsoBBaH5hv5v5Ekt
	EhAaoJP5Ltfe4Tae6/NMET0vicQHgQJFLTu09PAPpLCRLAoBTvijeAMNts6KPhDs3YWPep/W8W6
	mZs9bbGMWYL8EHsAxDJvsGzqKwsSXB67ld7e+rcLoNOI9lcON3ZOnQsQtfJLR23vfhsSWaPzhRJ
	GYI7cfvB+N6UNrjUbaIGko13N0iOTxCg4MMSEXOKvq9dWgemsuLg1mflfjuC/QOL2AfG5TMrM8F
	SSURqdcXAecs+VgrwEvm7/lrZBwxOp0MJAFeceDDc1r4ApuCBLMUjC9sLXKEqpgv2zTMAcMpQtL
	acvJNEdlkU+GamW7iRQLVQczc3ku47yHSLS6woUQKr1dEL4OxMn1w==
X-Received: by 2002:a17:906:6a1d:b0:c26:19de:912f with SMTP id a640c23a62f3a-c2619dea1f8mr161210366b.34.1788539081535;
        Fri, 04 Sep 2026 09:24:41 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4a8bacsm132556766b.17.2026.09.04.09.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:24:40 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH 2/3] alpha: do not skip TLB shootdown IPIs for kthread-borrowed mms
Date: Fri,  4 Sep 2026 18:23:30 +0200
Message-ID: <20260904162424.376504-3-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904162424.376504-1-linmag7@gmail.com>
References: <20260904162424.376504-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

flush_tlb_mm(), flush_tlb_page() and flush_icache_user_page() skip the
shootdown IPI when mm_users <= 1, on the assumption that no other CPU can
be running the mm. A task that borrows an mm through kthread_use_mm()
takes mmgrab() rather than mmget(), so it never appears in mm_users, and
kthread_use_mm() may be handed an mm that is already the caller's
active_mm and loaded on that CPU. Such a CPU was not only left without
an IPI, its mm->context[cpu] was cleared from under it.

mm->context[cpu] is already the record of which CPUs hold an ASN for the
mm. Test it rather than clearing it: take the shortcut only when no
other CPU has one, and otherwise fall through to the IPI, which
invalidates those CPUs properly. A CPU that merely ran the mm in the
past also holds a context and now costs an IPI, which errs in the safe
direction.

Dropping that clearing loop leaves every runtime write to mm->context[]
targeting the writing CPU's own slot, so the array becomes a lockless
publication of which CPUs may be using the mm, with a single writer per
slot. Mark the two stores that are now observed from other CPUs;
flush_tlb_other() already uses WRITE_ONCE(). The uniprocessor
flush_icache_user_page() is left alone, as nothing reads another CPU's
slot there, and init_new_context() runs before the mm is shared.

The reads also need ordering against the changes that led to the flush.
A CPU that publishes a context is in turn ordered before it goes on to
access the mm, by two different barriers: kthread_use_mm() issues one
through mmdrop_lazy_tlb() for the initial direct switch, and if the task
later migrates, the context published from ev5_switch_mm() is followed by
the scheduler's post-switch barrier, on alpha the mb() in
arch_spin_unlock() from finish_lock_switch(), as described in
Documentation/scheduler/membarrier.rst. So a CPU either already holds a
context and is seen here, or it allocates a fresh one before going on to
use the mm, and a fresh ASN carries nothing over from the previous
context.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/mmu_context.h |  2 +-
 arch/alpha/kernel/smp.c              | 48 ++++++++++++++--------------
 arch/alpha/mm/fault.c                |  2 +-
 3 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/alpha/include/asm/mmu_context.h b/arch/alpha/include/asm/mmu_context.h
index 825d3b9605c9..a829f557396d 100644
--- a/arch/alpha/include/asm/mmu_context.h
+++ b/arch/alpha/include/asm/mmu_context.h
@@ -147,7 +147,7 @@ ev5_switch_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm,
 	mmc = next_mm->context[cpu];
 	if ((mmc ^ asn) & ~HARDWARE_ASN_MASK) {
 		mmc = __get_new_mm_context(next_mm, cpu);
-		next_mm->context[cpu] = mmc;
+		WRITE_ONCE(next_mm->context[cpu], mmc);
 	}
 #ifdef CONFIG_SMP
 	else
diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index e21bc3920bec..c4d12d8312a7 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -631,6 +631,24 @@ ipi_flush_tlb_mm(void *x)
 		flush_tlb_other(mm);
 }
 
+/* True if a CPU other than this one holds an ASN for MM.  */
+static bool
+mm_context_elsewhere(struct mm_struct *mm)
+{
+	int cpu, this_cpu = smp_processor_id();
+
+	/* Pairs with the barrier the publishing CPU issues before using MM.  */
+	smp_mb();
+
+	for_each_online_cpu(cpu) {
+		if (cpu == this_cpu)
+			continue;
+		if (READ_ONCE(mm->context[cpu]))
+			return true;
+	}
+	return false;
+}
+
 void
 flush_tlb_mm(struct mm_struct *mm)
 {
@@ -638,14 +656,8 @@ flush_tlb_mm(struct mm_struct *mm)
 
 	if (mm == current->active_mm) {
 		flush_tlb_current(mm);
-		if (atomic_read(&mm->mm_users) <= 1) {
-			int cpu, this_cpu = smp_processor_id();
-			for (cpu = 0; cpu < NR_CPUS; cpu++) {
-				if (!cpu_online(cpu) || cpu == this_cpu)
-					continue;
-				if (mm->context[cpu])
-					mm->context[cpu] = 0;
-			}
+		if (atomic_read(&mm->mm_users) <= 1 &&
+		    !mm_context_elsewhere(mm)) {
 			preempt_enable();
 			return;
 		}
@@ -690,14 +702,8 @@ flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 	/* As in ipi_flush_tlb_page(): a targeted tbi() needs MM current.  */
 	if (mm == current->mm) {
 		flush_tlb_current_page(mm, vma, addr);
-		if (atomic_read(&mm->mm_users) <= 1) {
-			int cpu, this_cpu = smp_processor_id();
-			for (cpu = 0; cpu < NR_CPUS; cpu++) {
-				if (!cpu_online(cpu) || cpu == this_cpu)
-					continue;
-				if (mm->context[cpu])
-					mm->context[cpu] = 0;
-			}
+		if (atomic_read(&mm->mm_users) <= 1 &&
+		    !mm_context_elsewhere(mm)) {
 			preempt_enable();
 			return;
 		}
@@ -747,14 +753,8 @@ flush_icache_user_page(struct vm_area_struct *vma, struct page *page,
 
 	if (mm == current->active_mm) {
 		__load_new_mm_context(mm);
-		if (atomic_read(&mm->mm_users) <= 1) {
-			int cpu, this_cpu = smp_processor_id();
-			for (cpu = 0; cpu < NR_CPUS; cpu++) {
-				if (!cpu_online(cpu) || cpu == this_cpu)
-					continue;
-				if (mm->context[cpu])
-					mm->context[cpu] = 0;
-			}
+		if (atomic_read(&mm->mm_users) <= 1 &&
+		    !mm_context_elsewhere(mm)) {
 			preempt_enable();
 			return;
 		}
diff --git a/arch/alpha/mm/fault.c b/arch/alpha/mm/fault.c
index a9816bbc9f34..7bbba9010dac 100644
--- a/arch/alpha/mm/fault.c
+++ b/arch/alpha/mm/fault.c
@@ -45,7 +45,7 @@ __load_new_mm_context(struct mm_struct *next_mm)
 	struct pcb_struct *pcb;
 
 	mmc = __get_new_mm_context(next_mm, smp_processor_id());
-	next_mm->context[smp_processor_id()] = mmc;
+	WRITE_ONCE(next_mm->context[smp_processor_id()], mmc);
 
 	pcb = &current_thread_info()->pcb;
 	pcb->asn = mmc & HARDWARE_ASN_MASK;
-- 
2.55.0

