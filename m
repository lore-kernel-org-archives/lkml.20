Received: from mail-yx2-f10.google.com (mail-yx2-f10.google.com [74.125.224.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B0237F730
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 21:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791061705; cv=none; b=E7ZF+idGmciVSnDUyNBK0EVcrNrMyRuEQo/3RjNGjVdsl3XNvCnay9KKVb5w5QA1LFRE7GVrIrkNVOs62tzpaOJOkBTWf2jRa8+ZkeL452q3phf0yS8MiYe+PYt8BMvuCWsWLoUHARN5XhfEgLXmcLjA7ehsrwIQEfiEaVQ1Dsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791061705; c=relaxed/simple;
	bh=TfIjYzx4uyzFf5IeYedoVkGeMtAJOee6EeAPAmog+RU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kuhdeiQpd/x8Np9ylZXxDduQapNMgxpXZu4HOeXTMjNk0lzDSmby0Xdd+f+YwBRGJpBqPOv4aErxbBGIgZJedpFDwetIATFRcFqDygV+yW5uk2qlHiHoMtJJLEch0yLrud5N6hP0hHhwXmkXKm5wsLe+MHhMJoIogbP+xV6DbCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IdI4yL9u; arc=none smtp.client-ip=74.125.224.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdI4yL9u"
Received: by mail-yx2-f10.google.com with SMTP id 00721157ae682-88b9012eaa4so1248777b3.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 14:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791061703; x=1791666503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cTXzKyPAYLSKTuAayh1igoCj2XMMyLRIxo66Ogyyd0s=;
        b=IdI4yL9u0FJfghU8T1KqjQQZNgQr8gG41NP9s909hYihl0ir154014WiwmZrGlkwFA
         FF+acsGzEgvGzPBaXzXbQ3oZj1E01wnMf17wDjGUQ857Iwtm0Dkds01yXDJkrXtktRtu
         DbLamvpyJoTPgNzavcgRyPvMzCNU9g016DAQhnSNZ1QfEGmMImWc7h2WM0U5MaHJMJF8
         0/PVl2atq2jqzGwyU2UHYY6S+4qgptxz4pk4Q1qv7egCSIMlPG3t+FpEAnkoB6sP6/Nh
         7ambzuxHESywJ+Z8wwYoz9J/whXSRd2yRzRFligIJOQ/QtlEci/B2PkN8yb2nwLOHAkP
         Y6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791061703; x=1791666503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cTXzKyPAYLSKTuAayh1igoCj2XMMyLRIxo66Ogyyd0s=;
        b=DIuvofqV75ww6SPcqL9VRnjLuyPljBMmfk92cGNCA7SFbiYTQsLtkcyLeZJgtVmege
         b5fLtNhz9S8W/hotEqblGhmm5Mvd2IbAebHS754XFD87xVljPbGclI4ay6bVFJWj2UYc
         4AI/vf4N6A04sENvVqIgn54BTqRxoJXg3tcKwTxYvob+/dhQEJelHFnX+YWpZ/kIBLaT
         naIQy2IJUooIuE6jyaUUUacIXi0kz6LfMX/qZcKvjds9eAlgJlSXpamMgoEBaZ+GJqaH
         snm9D7ToxqzTk6gjsA4On9V1EvTPfZ3jjP98UX3TNyvClV4vPLetJl8/PbWwLU1A9C8e
         0JkA==
X-Forwarded-Encrypted: i=1; AKwUvBwNiIrddob2qy6v06gqKZgxZjcztqFwW7KoFaDgIN+zTMUseQ+KT55g6EN17Zwi4q0wQsnDTbA5UGhq3FI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIf0n7Sc/uH0bFRN0kMhHqzqlT8929e1uCpTxX/zGJzuqkOg8tY
	j011ELSu5ZV19G8KOPrLx2pQ6cJ+sZKVVeH5Nn+AKnoduc/PlM8PPV4=
X-Gm-Gg: AYBFou06rKoxLQb+dAPCEVefhHnBAcuLnAlk3lTKFh1qB5HJ8MFoIbDu1WPdv4N64/h
	iIUqZKe413dY1d2VrCLp1pxRYH/ZQiuCLu3RD9/sW4LKSJuO/7yg7UJM3uAdv3+kcyd9HQoFA5N
	yJM0YmEsKV6zabDBxxnU9K2hgusxJ6df/CpJqTnUCUQnamTRKL1g7zJ1Z5kAMCXsoI0SwNE3qtF
	B8OTJS3NFZ/644oSA2snkMQRij5uXTH2R+QpvRvrhBEBEQOqOUa9Pk17jLfc6UJZbveUe/6WulP
	/7e248cVqg76LIvsfyZVZ6pgC7yPFkUPmXvspEnY/FBavfz5IGxTdPXxmzEWJcQzUvJ0bIU4iHs
	Xjv2EAzN0eoxbNbUkpkbSblfY2eq2U1gN4nYaru8ETSwcXetuWdv+ZNHndBG1aN1bps7zjE+dRX
	vBfz2HbsBvM6Mkgx42WGnolfYtOhPjfuetivMMvgeB+aagiT9LVOrHzS+WNZyNkYr1BSG0ZlAzp
	03ejyYAjet7xWXl3Gtt2Hqgf6amR53wlNsXN0LkIBbSXy/RHTl5Bu/Zl/QfZjQ6aofAQHisO51u
	t7+Wef5UHslkpIie09VQwPIZ7vlH9Xx8/g==
X-Received: by 2002:a05:690c:47c4:b0:884:c83d:d182 with SMTP id 00721157ae682-8ae33de4fbfmr27023737b3.0.1791061702821;
        Sat, 03 Oct 2026 14:08:22 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:1700:4577:1050:550f:9551:5468:60f1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8af0d179d3bsm743537b3.40.2026.10.03.14.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 14:08:21 -0700 (PDT)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Sat, 03 Oct 2026 14:07:54 -0700
Subject: [RFC PATCH v3 1/9] mm/damon/paddr: remove page_fault access check
 primitive
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-damon-perf-rfc-v3-send-2026-10-03-v3-1-0f00417b41bc@gmail.com>
References: <20261003-damon-perf-rfc-v3-send-2026-10-03-v3-0-0f00417b41bc@gmail.com>
In-Reply-To: <20261003-damon-perf-rfc-v3-send-2026-10-03-v3-0-0f00417b41bc@gmail.com>
To: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Gregory Price <gourry@gourry.net>, David Rientjes <rientjes@google.com>, 
 Wei Xu <weixugc@google.com>, Jonathan Corbet <corbet@lwn.net>, 
 Bijan Tabatabai <bijan311@gmail.com>, Ajay Joshi <ajayjoshi@micron.com>, 
 Honggyu Kim <honggyu.kim@sk.com>, Yunjeong Mun <yunjeong.mun@sk.com>, 
 Akinobu Mita <akinobu.mita@gmail.com>, Lian Wang <lianux.mm@gmail.com>, 
 Kunwu Chan <kunwu.chan@linux.dev>, 
 Ravi Jonnalagadda <ravis.opensrc@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.16.0

The page_fault access check primitive reports faults through
damon_report_page_fault() into the global, mutex-protected
damon_access_reports[] buffer.  A later patch in this series replaces that
buffer with per-context rings fed only by perf-event probes, which leaves
the page-fault producer with nowhere to report.  Remove the producer here
so no report is silently dropped.

Remove damon_pa_prepare_access_checks_faults() and its supporting
damon_pa_change_protection()/damon_pa_change_protection_one() helpers,
and the page_fault dispatch in damon_pa_prepare_access_checks().  Remove
damon_report_page_fault() and its sole caller, do_damon_page(), along
with the two page-fault-handler dispatch sites in mm/memory.c that
selected it over the ordinary NUMA-hinting fault path.

Both removed pieces predate this series and are unrelated to the
perf-event probe infrastructure it adds.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 include/linux/damon.h | 10 ---------
 mm/damon/core.c       | 20 ------------------
 mm/damon/paddr.c      | 57 ---------------------------------------------------
 mm/memory.c           | 53 -----------------------------------------------
 4 files changed, 140 deletions(-)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index 3d0c05df3258..10582f669673 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -1299,13 +1299,6 @@ int damon_call(struct damon_ctx *ctx, struct damon_call_control *control);
 int damos_walk(struct damon_ctx *ctx, struct damos_walk_control *control);
 
 void damon_report_access(struct damon_access_report *report);
-#ifdef CONFIG_MMU
-void damon_report_page_fault(struct vm_fault *vmf, bool huge_pmd);
-#else
-static inline void damon_report_page_fault(struct vm_fault *vmf, bool huge_pmd)
-{
-}
-#endif
 
 int damon_set_region_system_rams_default(struct damon_target *t,
 				unsigned long *start, unsigned long *end,
@@ -1323,9 +1316,6 @@ unsigned long damon_alloced_bytes(void);
 static inline void damon_report_access(struct damon_access_report *report)
 {
 }
-static inline void damon_report_page_fault(struct vm_fault *vmf, bool huge_pmd)
-{
-}
 
 #endif	/* CONFIG_DAMON */
 
diff --git a/mm/damon/core.c b/mm/damon/core.c
index ddf9c08aa6c1..886e068e7844 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -2544,26 +2544,6 @@ void damon_report_access(struct damon_access_report *report)
 	mutex_unlock(&damon_access_reports_lock);
 }
 
-#ifdef CONFIG_MMU
-void damon_report_page_fault(struct vm_fault *vmf, bool huge_pmd)
-{
-	struct damon_access_report access_report = {
-		.vaddr = vmf->address,
-		.size = 1,	/* todo: set appripriately */
-		.cpu = smp_processor_id(),
-		.tid = task_pid_vnr(current),
-		.is_write = vmf->flags & FAULT_FLAG_WRITE,
-	};
-
-	if (huge_pmd)
-		access_report.paddr = PFN_PHYS(pmd_pfn(vmf->orig_pmd));
-	else
-		access_report.paddr = PFN_PHYS(pte_pfn(vmf->orig_pte));
-
-	damon_report_access(&access_report);
-}
-#endif
-
 /*
  * Reset the aggregated monitoring results ('nr_accesses' of each region).
  */
diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
index f4fa7c231e55..65a5b3269d1d 100644
--- a/mm/damon/paddr.c
+++ b/mm/damon/paddr.c
@@ -67,67 +67,10 @@ static void damon_pa_prepare_access_checks_abit(struct damon_ctx *ctx)
 	}
 }
 
-static bool damon_pa_change_protection_one(struct folio *folio,
-		struct vm_area_struct *vma, unsigned long addr, void *arg)
-{
-	/* todo: batch or remove tlb flushing */
-	struct mmu_gather tlb;
-
-	if (!vma_is_accessible(vma))
-		return true;
-
-	tlb_gather_mmu(&tlb, vma->vm_mm);
-
-	change_protection(&tlb, vma, addr, addr + PAGE_SIZE, MM_CP_DAMON);
-
-	tlb_finish_mmu(&tlb);
-	return true;
-}
-
-static void damon_pa_change_protection(unsigned long paddr)
-{
-	struct folio *folio = damon_get_folio(PHYS_PFN(paddr));
-	struct rmap_walk_control rwc = {
-		.rmap_one = damon_pa_change_protection_one,
-		.anon_lock = folio_lock_anon_vma_read,
-	};
-	bool need_lock;
-
-	if (!folio)
-		return;
-	if (!folio_mapped(folio) || !folio_raw_mapping(folio))
-		return;
-
-	need_lock = !folio_test_anon(folio) || folio_test_ksm(folio);
-	if (need_lock && !folio_trylock(folio))
-		return;
-
-	rmap_walk(folio, &rwc);
-
-	if (need_lock)
-		folio_unlock(folio);
-}
-
-static void damon_pa_prepare_access_checks_faults(struct damon_ctx *ctx)
-{
-	struct damon_target *t;
-	struct damon_region *r;
-
-	damon_for_each_target(t, ctx) {
-		damon_for_each_region(r, t) {
-			r->sampling_addr = damon_rand(ctx, r->ar.start,
-					r->ar.end);
-			damon_pa_change_protection(r->sampling_addr);
-		}
-	}
-}
-
 static void damon_pa_prepare_access_checks(struct damon_ctx *ctx)
 {
 	if (ctx->sample_control.primitives_enabled.page_table)
 		damon_pa_prepare_access_checks_abit(ctx);
-	if (ctx->sample_control.primitives_enabled.page_fault)
-		damon_pa_prepare_access_checks_faults(ctx);
 }
 
 static bool damon_pa_young(phys_addr_t paddr)
diff --git a/mm/memory.c b/mm/memory.c
index 41278e32dde6..44034d5b32ab 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6565,54 +6565,6 @@ static void fix_spurious_fault(struct vm_fault *vmf,
 	}
 }
 
-/*
- * NOTE: This is only poc purpose "hack" that will not be upstreamed as is.
- * More discussions between all stakeholders including maintainers of MM core,
- * NUMA balancing, and DAMON should be made to make this upstreamable.
- * (https://lore.kernel.org/20251128193947.80866-1-sj@kernel.org)
- *
- * This function is called from page fault handler, for page faults on
- * P{TE,MD}-protected but vma-accessible pages.  DAMON is making the fake
- * protection for access sampling purpose.  This function simply clear the
- * protection and report this access to DAMON, by calling
- * damon_report_page_fault().
- *
- * The protection clear code is copied from NUMA fault handling code for PTE.
- * Again, this is only poc purpose "hack" to show what information DAMON want
- * from page fault events, rather than an upstream-aimed version.
- */
-static vm_fault_t do_damon_page(struct vm_fault *vmf, bool huge_pmd)
-{
-	struct vm_area_struct *vma = vmf->vma;
-	struct folio *folio;
-	pte_t pte, old_pte;
-	bool writable = false, ignore_writable = false;
-	bool pte_write_upgrade = vma_wants_manual_pte_write_upgrade(vma);
-
-	spin_lock(vmf->ptl);
-	old_pte = ptep_get(vmf->pte);
-	if (unlikely(!pte_same(old_pte, vmf->orig_pte))) {
-		pte_unmap_unlock(vmf->pte, vmf->ptl);
-		return 0;
-	}
-	pte = pte_modify(old_pte, vma->vm_page_prot);
-	writable = pte_write(pte);
-	if (!writable && pte_write_upgrade &&
-			can_change_pte_writable(vma, vmf->address, pte))
-		writable = true;
-	folio = vm_normal_folio(vma, vmf->address, pte);
-	if (folio && folio_test_large(folio))
-		numa_rebuild_large_mapping(vmf, vma, folio, pte,
-				ignore_writable, pte_write_upgrade);
-	else
-		numa_rebuild_single_mapping(vmf, vma, vmf->address, vmf->pte,
-				writable);
-	pte_unmap_unlock(vmf->pte, vmf->ptl);
-
-	damon_report_page_fault(vmf, huge_pmd);
-	return 0;
-}
-
 /*
  * These routines also need to handle stuff like marking pages dirty
  * and/or accessed for architectures that don't do it in hardware (most
@@ -6686,8 +6638,6 @@ static vm_fault_t handle_pte_fault(struct vm_fault *vmf)
 		 */
 		if (userfaultfd_pte_rwp(vmf->vma, vmf->orig_pte))
 			return do_uffd_rwp(vmf);
-		if (sysctl_numa_balancing_mode == NUMA_BALANCING_DISABLED)
-			return do_damon_page(vmf, false);
 		return do_numa_page(vmf);
 	}
 
@@ -6806,9 +6756,6 @@ static vm_fault_t __handle_mm_fault(struct vm_area_struct *vma,
 		if (pmd_protnone(vmf.orig_pmd) && vma_is_accessible(vma)) {
 			if (userfaultfd_huge_pmd_rwp(vma, vmf.orig_pmd))
 				return do_huge_pmd_uffd_rwp(&vmf);
-			if (sysctl_numa_balancing_mode ==
-					NUMA_BALANCING_DISABLED)
-				return do_damon_page(&vmf, true);
 			return do_huge_pmd_numa_page(&vmf);
 		}
 

-- 
Git-157)

