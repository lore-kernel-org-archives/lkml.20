Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793219178;
	b=LdQ/Lit3y15QtYbcllhqRV+y8WLaadJnDnR+K5DqqIBCm3YTGo+G/m2uu33s8WH09iiP
	 AAfOikSMNfhCW+IMqaqM2Nkqdp6GpM0edaG+tn++SJwXuooBFEDxHOi99fuaH13t1gk4r
	 Ryo7X9wqkVvofncECAelEwrHA9y2Uyks7UK4olo9tYtke5EtXc04LyzumYa2gkIPbjlED
	 bbbCKQGp6Tmk7fYnTSCmx/QHXQ3wG+PIvn+7vgKMwz4eaep6B1i+5XGOBLaphkKR3fo3o
	 eq4c+jpRrYvaq7wOngLVjLhJMSssV1a9LvXRKlhxX4rFnImJur+m2kGaw2xe2oEn8mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793219178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=DQPRF1RqEpntROrXpO4DTcTkPcIgq3OBHakNhIQaiCc=;
	b=4h6fvFvMdykRgXo1c/+Uhes2CwEWQK53rPs4PawBLMXr7m0qkXQnGZGS9zxRFtNPR0dI
	 r7xIHrci1QU/9BdYhJpfdAJbLryd+sa2ddf0nataEYdBomHVV2XNh4qVkFYWl2fsHvaeH
	 XqgSHTqmH1HPaCeMxqYgeHFMBMfnz/QnZ4wtRnZSS47FLfK1W4YQe2wM9/dZR0sZbR9GS
	 t/XhM2sFa80PIaa8unTc8DLTbDV2xJDGWNmEmMrqnh8LChCb+0cVK21cYz0C+bFjql58r
	 UwVzXq5OdiyM4dRo/yRd89RQWqwGunFm95cNlzY1iekqxLS5MK66ugUNPf9pMmJb9Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KhxD6YW7;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1AC60A2610
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A1AC60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KhxD6YW7
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd6532dbd7bso860047a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793219177; x=1793823977; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DQPRF1RqEpntROrXpO4DTcTkPcIgq3OBHakNhIQaiCc=;
        b=KhxD6YW7jsi2Rkd1zG7UJKzhHhXhWOkvdBGECq6LhP9JvIxx9OQP2ZgqXCibHf4Bv5
         B9ykKc/+47Dztkc7bvyNC7rglGN91slqpUXescK7j0coO5QbU65JeU7Ar7h1ZPjJxpE+
         XCv2mVF4MpqFolk9nr+B6Qd8GOmJRXgMlYEAHeJSgSDIPnNg1B3fL6UwM8gHOtklYtIl
         FMcxIgzRNlwo1ngeibPOFQwIQTXGWLNrrgLCKSBEduMFl7ltQ5OfdHc4hfwxJdRiDkNS
         to3p/Zz5uutSrNl/WMWLG/FJ2oWSkYLw5mOj5enzBkrImlCm24CUAoWk0w/ajJohMLzO
         SWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793219177; x=1793823977;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DQPRF1RqEpntROrXpO4DTcTkPcIgq3OBHakNhIQaiCc=;
        b=iCv4EogbfYp/SPf3lIhRI5x/DPL7AUmICRbohws2Cnq23PD3ogoVtPa6mSmQeWi29w
         EGtGQHKXiIBBpljaeln+QCbZg/zLVx/sUdIBzN/chwn/w/nQvlkP+N9gddl12Kyk12Qc
         KdO8U9aO+5arB8FL4blEOTusDyhyZxXpgXTtfwOFPyFNt8wz8sTknzpfJNldhDzlspag
         Xm3q3SaaVA0dee222pngL598dxmrt3Zt0cRt0Ko/LFgn8Ed7M96j4R3Sw7PhtldS5Slq
         iHCO/wFzfu5ex9aMT5P8vhn81gvj/UEN0cKhbk0fCjDrZGwHdXEdoO3vS1pzxa41q7Sb
         wkhw==
X-Forwarded-Encrypted: i=1; AKwUvBwnRXd9BkZERht1VSrUQ3rCDpywx81LXjW4FylLeey+7rqL83sj3MlbF11q+TGQuh5dbsMmbUICJSIglcE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJI6DldlL0Zhys0lDvs5ka4jKLvloykBu6u71ijYuc42JN9j8EE
	S0yJGwXw0pIldsxBlmZNMWqDVivgkuEhYNQGbYSJvdXedzZtSyPA8Jfysfgg5iPa3Ob9kdaL582
	4HrXtYg==
X-Received: from pgbm25-n1.prod.google.com ([2002:a05:6a02:6199:10b0:cca:c02e:bfe5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:4303:b0:3e1:5086:35cc
 with SMTP id adf61e73a8af0-3e9023258c6mr2732929637.39.1793219177098; Wed, 28
 Oct 2026 13:26:17 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Oct 2026 13:26:07 -0700
In-Reply-To: <20261028202607.1844883-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261028202607.1844883-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261028202607.1844883-5-seanjc@google.com>
Subject: [PATCH 4/4] KVM: x86/mmu: Use the generic auto-prefaulting to do
 prefetch for direct MMUs
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Marco Marangoni <mamarang@amazon.com>
Content-Type: text/plain; charset="UTF-8"

Use generic auto-prefaulting for direct shadow MMUs and drop the small bit
of custom prefetching that is unique to direct MMUs.  Direct shadow MMUs
are basically on life support, and the generic approach provides comparable
performance, plus it supported guest_memfd and PFN-backed memory.

Note!  Deliberately keep the core direct PTE prefetching logic, as it's
still needed to prefetch PTEs for direct shadow pages in indirect MMUs,
i.e. when the guest is using hugepages but KVM is not.

Opportunistically drop the double-underscores from direct_pte_prefetch()
now that only the version used by indirect MMUs exists.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c         | 48 ++++++----------------------------
 arch/x86/kvm/mmu/paging_tmpl.h |  2 +-
 2 files changed, 9 insertions(+), 41 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index c56a2eaa4646..7f8beb1b307b 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -123,8 +123,8 @@ static int tdp_root_level __read_mostly;
 static int max_tdp_level __read_mostly;
 
 /*
- * The exact number of PTEs that can be prefetched for the shadow MMU, and the
- * default number of pages to prefault/prefetch pages for the TDP MMU.
+ * The exact number of PTEs that can be prefetched for indirect MMUs, and the
+ * default number of pages to prefault/prefetch pages for direct MMUs.
  */
 #define PTE_PREFETCH_NUM		8
 
@@ -3275,8 +3275,8 @@ static bool direct_pte_prefetch_many(struct kvm_vcpu *vcpu,
 	return kvm_mmu_prefetch_sptes(vcpu, gfn, start, end - start, access);
 }
 
-static void __direct_pte_prefetch(struct kvm_vcpu *vcpu,
-				  struct kvm_mmu_page *sp, u64 *sptep)
+static void direct_pte_prefetch(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
+				u64 *sptep)
 {
 	u64 *spte, *start = NULL;
 	int i;
@@ -3301,33 +3301,6 @@ static void __direct_pte_prefetch(struct kvm_vcpu *vcpu,
 		direct_pte_prefetch_many(vcpu, sp, start, spte);
 }
 
-static void direct_pte_prefetch(struct kvm_vcpu *vcpu, u64 *sptep)
-{
-	struct kvm_mmu_page *sp;
-
-	sp = sptep_to_sp(sptep);
-
-	/*
-	 * Without accessed bits, there's no way to distinguish between
-	 * actually accessed translations and prefetched, so disable pte
-	 * prefetch if accessed bits aren't available.
-	 */
-	if (sp_ad_disabled(sp))
-		return;
-
-	if (sp->role.level > PG_LEVEL_4K)
-		return;
-
-	/*
-	 * If addresses are being invalidated, skip prefetching to avoid
-	 * accidentally prefetching those addresses.
-	 */
-	if (unlikely(vcpu->kvm->mmu_invalidate_in_progress))
-		return;
-
-	__direct_pte_prefetch(vcpu, sp, sptep);
-}
-
 /*
  * Lookup the mapping level for @gfn in the current mm.
  *
@@ -3562,8 +3535,8 @@ static int direct_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 {
 	struct kvm_shadow_walk_iterator it;
 	struct kvm_mmu_page *sp;
-	int ret, access;
 	gfn_t base_gfn = fault->gfn;
+	int access;
 
 	kvm_mmu_hugepage_adjust(vcpu, fault);
 
@@ -3594,13 +3567,8 @@ static int direct_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 	if (KVM_BUG_ON(it.level != fault->goal_level, vcpu->kvm))
 		return -EIO;
 
-	ret = mmu_set_spte(vcpu, fault->slot, it.sptep, access,
-			   base_gfn, fault->pfn, fault);
-	if (ret == RET_PF_SPURIOUS)
-		return ret;
-
-	direct_pte_prefetch(vcpu, it.sptep);
-	return ret;
+	return mmu_set_spte(vcpu, fault->slot, it.sptep, access, base_gfn,
+			    fault->pfn, fault);
 }
 
 static void kvm_send_hwpoison_signal(struct kvm_memory_slot *slot, gfn_t gfn)
@@ -6685,7 +6653,7 @@ static void kvm_mmu_auto_prefault(struct kvm_vcpu *vcpu, gpa_t start,
 	if (error_code & (PFERR_RSVD_MASK | PFERR_PRESENT_MASK))
 		return;
 
-	if (!tdp_mmu_enabled || vcpu->arch.mmu->page_fault != kvm_tdp_page_fault)
+	if (vcpu->arch.mmu->page_fault != kvm_tdp_page_fault)
 		return;
 
 	nr_pages = min(nr_pages, KVM_PAGES_PER_HPAGE(PG_LEVEL_1G));
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index 8e350095508c..baaab791f107 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -631,7 +631,7 @@ static void FNAME(pte_prefetch)(struct kvm_vcpu *vcpu, struct guest_walker *gw,
 		return;
 
 	if (sp->role.direct)
-		return __direct_pte_prefetch(vcpu, sp, sptep);
+		return direct_pte_prefetch(vcpu, sp, sptep);
 
 	i = spte_index(sptep) & ~(PTE_PREFETCH_NUM - 1);
 	spte = sp->spt + i;
-- 
2.56.0.313.g2479322e68-goog

