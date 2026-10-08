Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B4A3CA497
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791489389; cv=none; b=J4io44Voi40MA0xihdLRD3G6aL7XNqeT81RtfKSoY+Rs+vius5Apn1+1F0xutDSkw+F0aaDVxO6QWz5qJYSfyPW4qEtzjtaIQsm0vIOpHdW84bCAVulQwqYv4cqmW/xZ/UC7UlGJp4F2cH3Z3F2Exh0yfuIdVOglImAHTrX+jr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791489389; c=relaxed/simple;
	bh=9OvVOTmJE4Jfv3W+sVgQR3lslJm4kXRW8G06vKiuz5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZeS8XVyO6yJYBE/6Im3Qp0kaLVFVMazvtRBTxL6ERKrT2xF5uDa0ZSRM7yki4nvGF1VlP7gXoccpYCq8pOLDKDiCLrjBJqCaBaeeL38blpayXp7W8jQ4f+/PpodTS8tvpBDtGRIBSp5crOeqB8Cb4zgsVwJSsRqECQTVWAzSBug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o/TVvyaj; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o/TVvyaj"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2e43f3d1fdso781039966b.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791489385; x=1792094185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ez/BXjLJiek5uaxQe0RG/fa1yVbHE8qAgeJCa3EFBfg=;
        b=o/TVvyajYJ7F1lQoCJuGqHdtGBkdeePJfevCilc/XgXCqoe0IwUzQIJAROsi3vqUmn
         PxCP1GPnJ4jyRdAgxCMqrokq9Hibv9mI1LIgU/FE22ImHO5CVfUvoXF3M7GFJdogiqUM
         PD6XxohrMz4SIWSDteEb/LqZXb9MX/xSSnT0MvUubaqmtSVk6cCz/WuJrWIUSCuD3tk6
         JmfqfiHr9rGzN8TuzJv2rUK+MO9oXuieY3TyisfUHPOiD/k+ER2BMdZeaG5vBULaHcbT
         n7FbnIF40eoNad2aYXAZAdx+xsOQf0rSc4bMyW1hPAlKstRwGbnSrxVqjT7ywP1AsIwu
         /lRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791489385; x=1792094185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ez/BXjLJiek5uaxQe0RG/fa1yVbHE8qAgeJCa3EFBfg=;
        b=sVcqZ46N0Jtk9jMMyoOCi3blB+YLtwVMXSaYC0n7FXWfYsb2nSb8RmEzplwUS59ocw
         /0eFgbFeYWHR6gUSdSSPiZ6c9BnZNedQnuavBlGul8KuRti2nK7C9TjtwUbvJAPzqIyD
         I7v5B5XiHNbPwJcPFqrKbEQYUKVbbojapDmDNoVZ4ESaU/BY9vkdERw+TCWFNoVGeafK
         sVTNOwnvecSnCqXgZUMXkykcOhplVdauVM6eaSr9aO+L9yATwh9NxWSV6QhYTZdvyvo8
         gdRXuYgyqkttUNu15JKP4JbbxXlEYw5sVdhBWy9sdGedXT2tJzTcPBoN66m6lAkoPVTt
         xdkg==
X-Forwarded-Encrypted: i=1; AKwUvBwz68OgYr99G4E+guHmR15XY5JNyWPnETAl9ZwyrmAfXPFQzqq159QHV6abdWHst7zU9ShKyHhWlPcTvRc=@vger.kernel.org
X-Gm-Message-State: AFuF++njcMNradbi9srmKUTJ//ee2SpjG7Z1C/Nx8Y4IHNRdR7XWnP4u
	dT2OddtA1LQhQkOGErzoHTX9BnZtqi9p1ZM1vxZ7LkZ5126tg1x/vPns
X-Gm-Gg: AYBFou2FMnYjxDRCDmgOgokBIAYi5pyGWYRJrUY3+tUZrtDwW9URPIfrDnKaf+WhtXL
	ln6El+rsjkCfrZD29Tff3rn9Q1ZW3Lxx/N6ORo/CRa32CroeE0kE/cxViXOwLLIpb2c7HnGmhlH
	EeNmiwzcsZWuC5gYXHFY2VV9+LTNLleY69hCAGKlzZSMQ9SbdT4NHgwcjE6AAoYwGhOkwtVl3AQ
	32iWzwsnHLVpU2m8lpQW5Ve25JlevAzNtfBSeZrx0RANQ1XEUt+WDmhi23KoQa7i67vQ9PgmwmK
	5pNXoINXk4jIJHDyp7+rdwHU1EDXTB8kpJK3LB+9R4sU7cGl/RYHCvi9672nrBJbxdN+dZ2Rvbg
	U0iot5HudggPu/kYfIWuvv/A9bkkFhM1GOQIUNFhdpBqGO+9v8ri2uTRrL9J8N0t53bq5nS0zCj
	MKPNZ1gEQr7uHev0Vvf1TAJfmLfOTPUqNerBs4exY/q10MIhXVBQPl9oxhrEhk4CEF7jHeC2YkH
	Pcy3Vpmgi4lHby/F5pmYWGmEaNiiNnl1BtKZbmb
X-Received: by 2002:a17:907:60d0:b0:c2e:4652:852f with SMTP id a640c23a62f3a-c317c1773efmr648677466b.47.1791489385260;
        Thu, 08 Oct 2026 12:56:25 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a4d0c2efsm9906266b.26.2026.10.08.12.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:56:24 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2 3/3] alpha: do not skip TLB shootdown IPIs for kthread-borrowed mms
Date: Thu,  8 Oct 2026 21:55:18 +0200
Message-ID: <20261008195608.965266-4-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261008195608.965266-1-linmag7@gmail.com>
References: <20261008195608.965266-1-linmag7@gmail.com>
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

Those historical contexts do not cost an IPI forever. When the shootdown
reaches a CPU that no longer has the mm active, ipi_flush_tlb_mm() takes
the flush_tlb_other() path, which clears that CPU's own slot. Once the
stale slots are gone the shortcut is available again, as long as mm_users
stays at most one and no other CPU has since taken or kept a context.  A
CPU that does have the mm active keeps its slot, and that is the CPU the
IPI is there for.

Together with the preceding patch, dropping these clearing loops leaves
every runtime write to mm->context[] targeting the writing CPU's own slot,
so the array becomes a lockless publication of which CPUs may be using the
mm, with a single writer per slot. Mark the two stores that are now
observed from other CPUs; flush_tlb_other() already uses WRITE_ONCE().
The uniprocessor flush_icache_user_page() is left alone, as nothing reads
another CPU's slot there, and init_new_context() runs before the mm is
shared.

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

This depends on the preceding patch: while migrate_flush_tlb_page() still
zeroes remote slots, a CPU running a borrowed mm can be cleared out of the
array and skipped by exactly the test added here.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: <stable@vger.kernel.org>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/mmu_context.h |  2 +-
 arch/alpha/kernel/smp.c              | 48 ++++++++++++++--------------
 arch/alpha/mm/fault.c                |  2 +-
 3 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/alpha/include/asm/mmu_context.h b/arch/alpha/include/asm/mmu_context.h
index 6ecc8a0676cb..9cbcc4aa62e3 100644
--- a/arch/alpha/include/asm/mmu_context.h
+++ b/arch/alpha/include/asm/mmu_context.h
@@ -158,7 +158,7 @@ ev5_switch_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm,
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
2.43.0

