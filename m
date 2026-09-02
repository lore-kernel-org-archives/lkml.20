Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0EF40F731
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788383889; cv=none; b=hV9aPygPqbKW7uUVH8Fs6hdQehTWo+BM50Z2TQKc1KuEnSD+gaD3+OK3Quf7d/cbdELYunCWelmkDlqbr9ofKIJlol/N129kxwvzPG5w7xs2Folg884hqLilG1WkLG7+lnc0M9K2KnuuPwdGoweRxLtsYdKoAry+zbysZmeypqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788383889; c=relaxed/simple;
	bh=eYvevfxDnAxcmy44UUuZzmZ9wB5AFgyZP1RXBL1JECg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=cvs5JJrAniEOkJCbd5ChDpne3HtCst+zyzTyg+j2dQAAX1MtcrvPAPopa7nFukFbp+bJ5EAn4Mw8nSluawwqwG97uXuXMPNRmjG0HiI6NAciqGnD2gbzj/8kG2UsSv/0fXMQM22xUKr5e5Y52o8UAWBBa7F90kYvfaWHE3+NPrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=St087wfT; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="St087wfT"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfe48ca1efso19624885ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788383881; x=1788988681; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6y9fwvpjUYJt1hBuBQzU6qlITBbfBdcaCvq8FbYjsUY=;
        b=St087wfTYqglTrqIKprWEIaR0pVGx2FcIAUOMM13rpvv0Fw+Co30J1PMdms6iBZBhW
         Unec3nJf6xAFhE1+nvQIXl9MPBJecQMGCN7C1oFZRxeC6d8jzxrj0ngzOqD5znbjsYKG
         u71+e0MOxfvQXLBs0hL4clQ+S8GHnu3mPEceIvJNlomUi8j9n+xnjfSB7mcsG9jR/av8
         q9FM8imHRofBkJdVNcB0sjzTgG0jJdwhG0fdDVqbhF/vyCj6rdzeLgVqruAxLreKIrPP
         qRCsOZ6Pt9JfRQYIdbeOZCgJWLqHBManNNk5LX6H+LN/w+Tw0raDzKs7KbUs+fYdVKA+
         3t5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788383881; x=1788988681;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6y9fwvpjUYJt1hBuBQzU6qlITBbfBdcaCvq8FbYjsUY=;
        b=DEGfs+7fAtG5iUcHkiqHevwGKGBm/EEWZHJh1LMBW7pTIMrC0qnhQNojsMQoN8Cw7t
         4yVULWVGXphprjSMxs51UnxKoQuroStVqW6K165zIV5dFXis8jatZ9JitAQMOPYI/7Xx
         rD+sEqMUb+fKb7j8nmk/jn+2Zgt4x47A3G50LuPssD3tf3ufXpHbvY7oHqYS2a1UkU1R
         OXeadMO2xiSHuuzH00x7BxUADg7sO7j9BEtiJ5az9cyoK4xSxh5Z56Si91wkKLGf9O5e
         ZhWzo2G3wHrVtiRDLseOlmgIWtkWBLDfyeFzb/ayItSJlx/bA52ZaoyFak4yUaL17JI+
         K1gg==
X-Forwarded-Encrypted: i=1; AKwUvBxpZRBBUAqZlIjUE2GzyQ2XY7fqtanZXN9ivYUkX6CeXvxhpi4ijuJsTBNIMo+TVVTIy8/DhZ9fBfdtxjM=@vger.kernel.org
X-Gm-Message-State: AFuF++mrkiqVGmYVjJ8oLKCeQye+OFghRZRX1t9El+pidFdUG8sinGSQ
	8tGl8YOvmjJr3Y8CKbmZ1CAgcrfyKJ0tUNOqZuh+q80jD47OqktYF5vRDlYbAALCMW8RU+j+bik
	DJymHZA==
X-Received: from pjqo10.prod.google.com ([2002:a17:90a:ac0a:b0:396:1f9d:c3c7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5384:b0:398:ceef:edbd
 with SMTP id 98e67ed59e1d1-39aee1bbae0mr11888078a91.18.1788383880600; Wed, 02
 Sep 2026 14:18:00 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Sep 2026 14:17:59 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902211759.2700289-1-seanjc@google.com>
Subject: [PATCH] KVM: x86/mmu: Always guard rmaps with mmu_lock on
 PREEMPT_RT=y kernels
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"

For all intents and purposes, revert KVM's ability to walk rmaps outside of
mmu_lock when running on a realtime (PREEMPT_RT=y) kernel.  I.e. don't use
a non-sleepable bit-spinlock to protect rmap entries, as realtime kernels
are highly unlikely to benefit from increased aging throughput and reduced
jitter for memory-overcommitted nested VMs, whereas using a non-sleepable
lock is currently buggy and goes against the spirit of realtime kernels.

Because KVM's rmap locks are hand-crafted bit-spinlocks, preemption must be
disabled before acquiring the lock, otherwise a preempted lock holder will
result in all other walkers of the locked rmap to spin and wait, with no
tracked owner for PI to boost.  For non-RT kernels, acquiring mmu_lock
suffices, as mmu_lock is a non-sleepable rwlock.  But on RT, where mmu_lock
becomes sleepable, preemption is left enabled for rmap writers:

  WARNING: arch/x86/kvm/mmu/mmu.c:920 at __kvm_rmap_lock+0x1a7/0x1e0 [kvm], CPU#16: vmx_apic_update/3708
  CPU: 16 UID: 0 PID: 3708 Comm: vmx_apic_update Not tainted 7.2.0-rc7 #52 PREEMPT_{RT,LAZY}
  RIP: 0010:__kvm_rmap_lock+0x1a7/0x1e0 [kvm]
  Call Trace:
   pte_list_add+0x67/0x4d0 [kvm]
   __link_shadow_page+0x249/0x480 [kvm]
   ept_fetch+0x4d5/0x1220 [kvm]
   ept_page_fault+0x60b/0x850 [kvm]
   kvm_mmu_do_page_fault+0x252/0x690 [kvm]

Alternatively, KVM could manually disable preemption when grabbing an rmap
lock, but as above, that isn't what RT kernels generally want, and it's
actually more complex to implement (cleanly).

To not completely lose the scaling advantage of per-rmap locks, take
mmu_lock for read in the aging path, i.e. allow multiple concurrent aging
tasks, as the aging code needs to use atomic SPTE accesses no matter what,
i.e. no extra code/work is required to guard against concurrent aging of
SPTEs.

Reported-by: David Woodhouse <dwmw2@infradead.org>
Closes: https://lore.kernel.org/all/8d47b43e1829ac92703723e6a1a4afc7a2eaacb5.camel@infradead.org
Fixes: 4834eaded91e ("KVM: x86/mmu: Add infrastructure to allow walking rmaps outside of mmu_lock")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 064ecc33b926..5bf833550f84 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -895,6 +895,7 @@ static struct kvm_memory_slot *gfn_to_memslot_dirty_bitmap(struct kvm_vcpu *vcpu
  */
 #define KVM_RMAP_MANY	BIT(0)
 
+#ifndef CONFIG_PREEMPT_RT
 /*
  * rmaps and PTE lists are mostly protected by mmu_lock (the shadow MMU always
  * operates with mmu_lock held for write), but rmaps can be walked without
@@ -1008,7 +1009,8 @@ static unsigned long kvm_rmap_get(struct kvm_rmap_head *rmap_head)
  * actual locking is the same, but the caller is disallowed from modifying the
  * rmap, and so the unlock flow is a nop if the rmap is/was empty.
  */
-static unsigned long kvm_rmap_lock_readonly(struct kvm_rmap_head *rmap_head)
+static unsigned long kvm_rmap_lock_readonly(struct kvm *kvm,
+					    struct kvm_rmap_head *rmap_head)
 {
 	unsigned long rmap_val;
 
@@ -1032,6 +1034,35 @@ static void kvm_rmap_unlock_readonly(struct kvm_rmap_head *rmap_head,
 	__kvm_rmap_unlock(rmap_head, old_val);
 	preempt_enable();
 }
+#else
+static unsigned long kvm_rmap_get(struct kvm_rmap_head *rmap_head)
+{
+	return atomic_long_read(&rmap_head->val);
+}
+static unsigned long kvm_rmap_lock(struct kvm *kvm,
+				   struct kvm_rmap_head *rmap_head)
+{
+	lockdep_assert_held_write(&kvm->mmu_lock);
+	return kvm_rmap_get(rmap_head);
+}
+
+static void kvm_rmap_unlock(struct kvm *kvm,
+			    struct kvm_rmap_head *rmap_head,
+			    unsigned long new_val)
+{
+	atomic_long_set_release(&rmap_head->val, new_val);
+}
+
+static unsigned long kvm_rmap_lock_readonly(struct kvm *kvm,
+					    struct kvm_rmap_head *rmap_head)
+{
+	lockdep_assert_held_read(&kvm->mmu_lock);
+	return kvm_rmap_get(rmap_head);
+}
+
+static void kvm_rmap_unlock_readonly(struct kvm_rmap_head *rmap_head,
+				     unsigned long old_val) { }
+#endif
 
 /*
  * Returns the number of pointers in the rmap chain, not counting the new one.
@@ -1745,11 +1776,15 @@ static bool kvm_rmap_age_gfn_range(struct kvm *kvm,
 	gfn_t gfn;
 	int level;
 
+#ifdef CONFIG_PREEMPT_RT
+	guard(read_lock)(&kvm->mmu_lock);
+#endif
+
 	for (level = PG_LEVEL_4K; level <= KVM_MAX_HUGEPAGE_LEVEL; level++) {
 		for (gfn = range->start; gfn < range->end;
 		     gfn += KVM_PAGES_PER_HPAGE(level)) {
 			rmap_head = gfn_to_rmap(gfn, level, range->slot);
-			rmap_val = kvm_rmap_lock_readonly(rmap_head);
+			rmap_val = kvm_rmap_lock_readonly(kvm, rmap_head);
 
 			for_each_rmap_spte_lockless(rmap_val, &iter, sptep, old_spte) {
 				if (!is_accessed_spte(old_spte))

base-commit: 76671054f9a1ff6abb976583cd8da37650acdc97
-- 
2.55.0.970.g62bdec98f9-goog

