Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793669215;
	b=L0u5Qwaxs8QA5O9bogty5OEzSslBLQy3Fdw4aikXmlyccJqkb1QDy4ORYRAWqPLczOJt
	 Hgv3jNv8FbbI82oJmFDwt9x2JvfwRL3Ezo7OyL9Dfbgab8duhOjEes4FMPeW9W4ToFreu
	 0LlAQUNP76byc9PWfOjwWqE/64YugtWIsqsStZweCSqNTkFr7PJCRdCVhLw6T4Z/54bFt
	 eNnr3K1lN/R1QFFaGxLnCEdwfmVJ0fcx3bneMeEF+SsqZyWx87WgDO64vtVAmkQQfFaxf
	 nJ3tLWb7CziyPvaZEw1NSI3WhIDxNBGZ0bdV79k9DQRFy1SB91B+eMXmbr3o7X9dh/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793669215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=T7D6YYqUkQHDitGcevsXkUUkt65mK09YII27r9MSsFk=;
	b=rZBQBvd4tI6QO0oO+S7KFMpv4yDUoewEHsQrVmyv1pXeiY0ZPt/Iq1sMFWqzUHJL6KUd
	 IqPdodaDN3aeeLVL+m++BcSE4aYw2wdZiLRhqakdAgtepCIs3AEP7KQjov2b88VyhhG93
	 hB/CzE6nffwKj00ElfeenGyrKyg+FJQAtWBhJuBMVfZj/glXUGQfhC3m2TbW38T/4Q6UJ
	 nWtd1M931BGNLyl5DJY8hef1XFpZXrBKFWcRyTNRqcl3thamOSI1xt/nN1T92a96ywk2P
	 xipkLLfI8VVAQOvleMVX7ZjAn1YoAcecDaLYxtl4lfVpz+2IODJL0934nlaquapkO9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--bingjiao.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m0+I7Ka2;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD1C606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BD1C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bingjiao.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m0+I7Ka2
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3552883bd19so4712142eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793669214; x=1794274014; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T7D6YYqUkQHDitGcevsXkUUkt65mK09YII27r9MSsFk=;
        b=m0+I7Ka2t8HIip6PqjChfjSj5HgcQ/Sb8kfd8c1KimLxoPJM4AoFldsNWB6mrtHvKP
         8iu9TN0astmhHmwYqF4MEVYAbXfA8UG7gtQHoqrM4in3hozG3romDAb94Fno4Nm7cz60
         SArotvH2Vsx+8kLFkACTQyHjpEqG+BrhsFcy3l48DZi12eHMwApSyb0WDfPsNftR70q5
         fabOSd6bfnB0+LmUfcCh2LPtETh/ORfbgjHZDPdLCdd4NDTpaTC7eUNJnrPynC3c2AzY
         ejCH0+rXwb3OsBc2BuyC7Vf2ethJbNo1l3V8o+TRJIWgbWsMKka5TrhgoO/gzqkv4q+6
         7ntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793669214; x=1794274014;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T7D6YYqUkQHDitGcevsXkUUkt65mK09YII27r9MSsFk=;
        b=vtBWEoGqAr3iHtfjgorZrUj/boRPYH1CTysxyB2PG3rpdcdFSelBPY26cHZpqtxyVm
         v3/WQW0I4G/PMmbSrB81L/IhUD+fcvG7kmV2T4UBpx7yQwivhPcAjS25uok+ExVdkrOK
         5i1Ir9DV+aR9jxDCU9F9LF//QpHlNeOhANPLcKOeKOKyx3V4bZs4rmkupN8IwZRvDlVJ
         z38tpsclEUH3WN+fIjP4rhRszBlJte5TdpYWEDJCYWmBU3UFtppehyGvEewB4+lYC7J6
         rwOcNazXqwvh7YuANgbL3D9SmBNS0Q23rHSGs8qXecorgC9GLgndWtn/HxyCwr5ohz0I
         j0Wg==
X-Forwarded-Encrypted: i=1; AKwUvBzGArXAfGtMnxd7shplyqVB+0Vx4oFwav8uvEb74Sf7Is0RVhV4qbU4s01KblVqZFAxQrAxqoYqLA+e494=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMeHg2LNuqYxzrR5DE3EOWbu/8QgvbukZ7WH0d4dAh31MARlfl
	dF4lhbFypX7Icm47JeZMfinTjOeFbxiAwfo5V1kkecdfLPUUHA+d5FaGFjseUMyILCjtdZ0+m5p
	i5iLOkPzI5qN65w==
X-Received: from dldz2-n1.prod.google.com ([2002:a05:701b:4182:10b0:1a1:da78:f9b9])
 (user=bingjiao job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:f90c:b0:14f:505d:813 with SMTP id a92af1059eb24-1ac5cb195a0mr16787382c88.41.1793669213882;
 Mon, 02 Nov 2026 17:26:53 -0800 (PST)
Date: Tue,  3 Nov 2026 01:26:26 +0000
In-Reply-To: <20261103012626.2699661-1-bingjiao@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103012626.2699661-1-bingjiao@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103012626.2699661-3-bingjiao@google.com>
Subject: [RFC PATCH 2/2] x86/mm/tlb: Skip stale and lazy CPUs in arch_tlbbatch_flush()
From: Bing Jiao <bingjiao@google.com>
To: x86@kernel.org, linux-mm@kvack.org, 
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Bing Jiao <bingjiao@google.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Rik van Riel <riel@surriel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Huang Ying <ying.huang@linux.alibaba.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Juergen Gross <jgross@suse.com>, 
	Hou Wenlong <houwenlong.hwl@antgroup.com>, Chuyi Zhou <zhouchuyi@bytedance.com>, 
	Xie Yuanbin <qq570070308@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Commit 209954cbc7d0 ("x86/mm/tlb: Update mm_cpumask lazily") and
commit 6db2526c1d69 ("x86/mm/tlb: Only trim the mm_cpumask once a second")
stopped clearing outgoing CPUs from mm_cpumask(prev) on context switch.
For per-mm flushes, should_flush_tlb() skips CPUs where loaded_mm !=
info->mm, and flush_tlb_func() periodically trims stale bits from
mm_cpumask(f->mm).

Batched TLB flushes used by page reclaim, migration, and page demotion do
not benefit from this. arch_tlbbatch_add_pending() ORs the full
mm_cpumask(mm) into batch->cpumask, and arch_tlbbatch_flush() calls
flush_tlb_multi() with info.mm = NULL because a batch can span multiple
mm_structs. With !info->mm, should_flush_tlb() returns true for every
non-lazy CPU, and flush_tlb_func() cannot clear stale bits from
mm_cpumask(mm). As a result, every batch repeatedly sends IPIs to all
CPUs where the process previously ran if they are now running other
userspace tasks.

To fix this, record up to ARCH_TLBBATCH_MAX_MMS (8) unique mm_struct
pointers in arch_tlbbatch_add_pending() and filter batch->cpumask once
per batch in arch_tlbbatch_flush() via should_flush_tlb_batch(). Keeping
the array at 8 entries fits within a single 64-byte cache line in
task_struct->tlb_ubc, and batches spanning more than 8 mms fall back to
the unfiltered cpumask.

Tested on 112-CPU Intel Skylake, 384-CPU AMD EPYC Genoa, and 512-CPU AMD
EPYC Turin with CXL memory, all using IPI-based TLB shootdowns (5-run
mean). Following the setup in commit ed15468787dd ("x86/mm: Move
flush_tlb_info back to the stack") and commit 7e12beb8ca2a
("migrate_pages: batch flushing TLB"), a task with all CPUs set in its
mm_cpumask runs on 1 CPU (2 CPUs in test 4) while the other CPUs run
unrelated userspace tasks:

1. Pageout reclaim (81,920 4K pages reclaimed to zram):

   Platform          Metric        Baseline       Patched        Change
   --------------------------------------------------------------------
   112-CPU Skylake   Remote IPIs   9,092,156          191       -99.99%
                     Time (ms)       2,974.6        763.0  -74.3% (3.9x)
   384-CPU Genoa     Remote IPIs  31,377,184          157       -99.99%
                     Time (ms)       1,652.6        483.1  -70.8% (3.4x)
   512-CPU Turin     Remote IPIs  41,859,670          119       -99.99%
                     Time (ms)       1,695.7        476.3  -71.9% (3.6x)

2. Page demotion (81,876 4K pages demoted from top-tier to CXL):

   Platform          Metric        Baseline       Patched        Change
   --------------------------------------------------------------------
   512-CPU Turin     Remote IPIs     958,699          526        -99.9%
                     Time (ms)         213.0        168.2        -21.0%

3. Single-threaded move_pages() (331,600 4K pages migrated):

   Platform          Metric        Baseline       Patched        Change
   --------------------------------------------------------------------
   112-CPU Skylake   Remote IPIs      73,370        4,964        -93.2%
                     Time (ms)         702.4        699.7         -0.4%
   384-CPU Genoa     Remote IPIs     252,899       13,899        -94.5%
                     Time (ms)         392.4        347.1        -11.6%
   512-CPU Turin     Remote IPIs     337,426       18,193        -94.6%
                     Time (ms)         370.1        368.1         -0.5%

4. Multi-threaded migrate_pages() + active memory access (656,940 4K
   pages migrated, 2 active threads):

   Platform          Metric        Baseline       Patched        Change
   --------------------------------------------------------------------
   112-CPU Skylake   Remote IPIs     144,610        3,362        -97.7%
                     Pages/sec       386,385      391,050         +1.2%
   384-CPU Genoa     Remote IPIs     493,035        7,730        -98.4%
                     Pages/sec       673,166      725,680         +7.8%
   512-CPU Turin     Remote IPIs     658,193        9,685        -98.5%
                     Pages/sec       670,288      733,020         +9.4%

Fixes: 209954cbc7d0 ("x86/mm/tlb: Update mm_cpumask lazily")
Fixes: 6db2526c1d69 ("x86/mm/tlb: Only trim the mm_cpumask once a second")
Signed-off-by: Bing Jiao <bingjiao@google.com>
---
 arch/x86/include/asm/tlbbatch.h | 14 +++++++++++++
 arch/x86/include/asm/tlbflush.h | 16 ++++++++++++++-
 arch/x86/mm/tlb.c               | 36 +++++++++++++++++++++++++++++++++
 3 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/tlbbatch.h b/arch/x86/include/asm/tlbbatch.h
index 80aaf64ff25f..aac4fc5cba3a 100644
--- a/arch/x86/include/asm/tlbbatch.h
+++ b/arch/x86/include/asm/tlbbatch.h
@@ -4,12 +4,26 @@

 #include <linux/cpumask.h>

+struct mm_struct;
+
+#define ARCH_TLBBATCH_MAX_MMS	8
+
 struct arch_tlbflush_unmap_batch {
 	/*
 	 * Each bit set is a CPU that potentially has a TLB entry for one of
 	 * the PFNs being flushed..
 	 */
 	struct cpumask cpumask;
+
+	/*
+	 * Unique mm_struct pointers unmapped in this batch. Used only for
+	 * pointer equality against per-CPU loaded_mm in arch_tlbbatch_flush()
+	 * and never dereferenced there. nr_mms > ARCH_TLBBATCH_MAX_MMS
+	 * indicates overflow.
+	 */
+	struct mm_struct *mms[ARCH_TLBBATCH_MAX_MMS];
+	unsigned short nr_mms;
+
 	/*
 	 * Set if pages were unmapped from any MM, even one that does not
 	 * have active CPUs in its cpumask.
diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index 4ec71ea0943f..0e86ade83ebc 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -379,8 +379,22 @@ static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *b
 		struct mm_struct *mm, unsigned long start, unsigned long end)
 {
 	inc_mm_tlb_gen(mm);
-	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB))
+	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB)) {
+		unsigned short i, nr = batch->nr_mms;
+
 		cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
+
+		if (likely(nr <= ARCH_TLBBATCH_MAX_MMS)) {
+			for (i = nr; i > 0; i--) {
+				if (batch->mms[i - 1] == mm)
+					goto out;
+			}
+			if (likely(nr < ARCH_TLBBATCH_MAX_MMS))
+				batch->mms[nr] = mm;
+			batch->nr_mms = nr + 1;
+		}
+	}
+out:
 	batch->unmapped_pages = true;
 	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
 }
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 0c4da320831c..10b8e839e964 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1679,12 +1679,48 @@ void __flush_tlb_all(void)
 }
 EXPORT_SYMBOL_FOR_KVM(__flush_tlb_all);

+static bool should_flush_tlb_batch(int cpu,
+				    const struct arch_tlbflush_unmap_batch *batch)
+{
+	struct mm_struct *loaded_mm = READ_ONCE(per_cpu(cpu_tlbstate.loaded_mm, cpu));
+	unsigned short i;
+
+	if (loaded_mm != LOADED_MM_SWITCHING) {
+		for (i = 0; i < batch->nr_mms; i++) {
+			if (loaded_mm == batch->mms[i])
+				goto check_lazy;
+		}
+		return false;
+	}
+
+check_lazy:
+	/*
+	 * Order 'loaded_mm' and 'is_lazy' against their write ordering in
+	 * switch_mm_irqs_off(). Ensure 'is_lazy' is at least as new as
+	 * 'loaded_mm'.
+	 */
+	smp_rmb();
+
+	return !READ_ONCE(per_cpu(cpu_tlbstate_shared.is_lazy, cpu));
+}
+
 void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
 {
 	struct flush_tlb_info info;
 	bool remote_flush = false;
 	int cpu = get_cpu();

+	if (likely(!cpu_feature_enabled(X86_FEATURE_INVLPGB) &&
+		   batch->nr_mms && batch->nr_mms <= ARCH_TLBBATCH_MAX_MMS)) {
+		int target_cpu;
+
+		for_each_cpu(target_cpu, &batch->cpumask) {
+			if (!should_flush_tlb_batch(target_cpu, batch))
+				__cpumask_clear_cpu(target_cpu, &batch->cpumask);
+		}
+	}
+	batch->nr_mms = 0;
+
 	init_flush_tlb_info(&info, NULL, 0, TLB_FLUSH_ALL, 0, false,
 			    TLB_GENERATION_INVALID);
 	/*
--
2.56.0.385.gac671c819a-goog

