Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C10370D79
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 21:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787867228; cv=none; b=DnH/e9wdQb1fdg4EXSnob7npwkQxMz+1l6LE095YjYJ34lhuOfU5Rl/TyzlECFmLalN8hM9LcTwob7tBPXFVwxLLnT+MqKhgYyMXWSRcJAVUsB3dXhAW0MKtCh7opi5j67RZ+aPewpi5NgP2ujgWzy/JoucNetRBIJSHrpBpVSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787867228; c=relaxed/simple;
	bh=I0VgLOL5Qe8t57bn8Q/qooHVwtH4oXqjs5VOqtZrJoY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iEUXEgPBQ9i8Wrc7Vv2QjuMgVGNE0vhapyEbEaML0m/xB6GgMlyhPwy7PkRPQpIRRSg7zHsGyFLa92LQguHWqSB1SBB3wxifvsTA41MYf5YEmak4vp4SqHEC3+yGi++VEqdqEruf4aO4pKSlGiN12jyLClUlHHpMDmIFDzuIq1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U621Bk1D; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U621Bk1D"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1c5810451so464390a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787867225; x=1788472025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KKVRP5ShTJ66rB1F0RhQ4pfiaW2WP8xldc0sTEsUpIY=;
        b=U621Bk1Dm3Gy4bJfFU4ziw8DvDYu74exPM8aR74/rBD/hDEUMGslTdu5BTPqCRdQqw
         YtqNU0eSoa3eVoos/4FJHwuGzHPpvvg638nsNG/grntIbwrwWeh0Ix1xDdcS6Ub4T+oW
         cTR/iR89ked/wGlvFixsgBH0UobuqWAEqwXZED5btdj+H7xq3GG3MvEBm6H4Oko/bx5a
         0PBI4aaoBf0pG6dwyHa1mstyxM1xBcVkPa1Js8UoG2avvgzxWY2VMEpkNUPd73+QhXkp
         dSuUkSlHX613vtNP+krEc6ChQ+XNyPD82S39ITPwv/GoX9egBKwAIRLRc5ByvMayR9cH
         3Yww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787867225; x=1788472025;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KKVRP5ShTJ66rB1F0RhQ4pfiaW2WP8xldc0sTEsUpIY=;
        b=ceONkXjtyAXcH+dDyIR3QpigzEm0Xkf3+7LqocwIYz5GYS4qlFFGWLKryekZczITFl
         M+XrXbx8sH7MrRvXY35QXZcA3jupGqtWSzTrTk7lP2fIPusS4hzAZE05sD5ZpQ9HbsI2
         vHGwEbj23nHgjS1KQucd/XEdyqqEkOCI1IgvlME36pZQ+CLHMldGoJy4i8eVZq+KD//8
         g/yQOIy7d3ETJryyLUafyzeAtPszVfziBVx4u8aO9NTR1ISe8TOPYPcie4k8yjfk/LCU
         OJ40zW+1WIc+DeIO53nM+uqzGWV6GfoEQ+WSKMFqI1eeJ7O4nGb5oiiGuQ+8NjreY3H8
         ZOaQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr7g3FEHV5muejTH5sUUa/gFRB7XemNIl6Li8uHe9mv/DG/xHDzjw3wnekc4EAzuUSvhI/VO7MNAh30rIw=@vger.kernel.org
X-Gm-Message-State: AFuF++l4TrkUg83sghxFOZRfiYyjH4ZoxsdKnlvJD41UwHsPQT4kdSQZ
	VwbiK9209Q4YVD6f4D37na+kllGIsnku4UrG1TMM14shGYsfn4GHVQDlmv2Zqi5hqI6GoikTfAR
	E69v33Q==
X-Received: from pfqf3.prod.google.com ([2002:aa7:9d83:0:b0:847:9540:3064])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3021:b0:853:2ca8:c42d
 with SMTP id d2e1a72fcca58-856297300f5mr4357552b3a.2.1787867224460; Thu, 27
 Aug 2026 14:47:04 -0700 (PDT)
Date: Thu, 27 Aug 2026 14:47:03 -0700
In-Reply-To: <8d47b43e1829ac92703723e6a1a4afc7a2eaacb5.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <8d47b43e1829ac92703723e6a1a4afc7a2eaacb5.camel@infradead.org>
Message-ID: <apCwV7xenDh2qmr7@google.com>
Subject: Re: KVM: x86/mmu: __kvm_rmap_lock() preemption assert trips on PREEMPT_RT
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: James Houghton <jthoughton@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, kvm@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026, David Woodhouse wrote:
> While soaking unrelated KVM changes on a PREEMPT_RT + lockdep kernel
> I hit this, which I don't believe has been reported before:

Heh, not on-list.  I've hit it the few times I've run PREEMPT_RT, but I (ob=
viously)
haven't cared enough to fix it, especially given the lack of external repor=
ts.
Which makes sense; I know people run KVM with PREEMPT_RT, but running neste=
d,
memory-overcommitted VMs with PREEMPT_RT seems beyond crazy.

>   WARNING: arch/x86/kvm/mmu/mmu.c:920 at __kvm_rmap_lock+0x1a7/0x1e0 [kvm=
], CPU#16: vmx_apic_update/3708
>   CPU: 16 UID: 0 PID: 3708 Comm: vmx_apic_update Not tainted 7.2.0-rc7 #5=
2 PREEMPT_{RT,LAZY}
>   RIP: 0010:__kvm_rmap_lock+0x1a7/0x1e0 [kvm]
>   Call Trace:
>    pte_list_add+0x67/0x4d0 [kvm]
>    __link_shadow_page+0x249/0x480 [kvm]
>    ept_fetch+0x4d5/0x1220 [kvm]
>    ept_page_fault+0x60b/0x850 [kvm]
>    kvm_mmu_do_page_fault+0x252/0x690 [kvm]
>=20
> That's the lockdep_assert_preemption_disabled() in __kvm_rmap_lock(),
> from commit 4834eaded91e ("KVM: x86/mmu: Add infrastructure to allow
> walking rmaps outside of mmu_lock").
>=20
> I don't think this one is just lockdep vs. PREEMPT_RT causing false
> positives =E2=80=94 the rmap lock is a hand-crafted bit-spinlock, and if =
a lock
> holder is preempted that leaves every other walker of that rmap
> spinning and waiting for it (with no tracked owner for PI to boost).
>
> On PREEMPT_RT we genuinely get here without preemption disabled,
> because kvm->mmu_lock is a sleeping lock now. Any shadow-MMU fault
> on an RT kernel should trip it =E2=80=94 this one is the !TDP nested EPT =
path
> (ept_fetch()), and it fires within seconds of running a nested guest
> with lockdep enabled.

Yep.

> I guess we fix it by turning the assertion into a preempt_disable() of
> its own? Not sufficiently confident in that conclusion to send it in
> 'diff -up' form though...

Or in the spirit of PREEMPT_RT, make the aging code acquire mmu_lock?  As a=
bove,
I have a hard time believing anyone cares about aging throughput of nested =
VMs
when running PREEMPT_RT, certainly not enough to want to disable preemption=
 for
any amount of time.

Not the prettiest code, but it does seem like the right thing to do for PRE=
EMPT_RT.
Compile-tested only at this point.  I'll take it for a spin, unless someone=
 has a
better idea.

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 81c30e2c74f3..31a372d0697c 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -913,11 +913,15 @@ static struct kvm_memory_slot *gfn_to_memslot_dirty_b=
itmap(struct kvm_vcpu *vcpu
  */
 #define KVM_RMAP_LOCKED	BIT(1)
=20
-static unsigned long __kvm_rmap_lock(struct kvm_rmap_head *rmap_head)
+static unsigned long __kvm_rmap_lock(struct kvm *kvm,
+				     struct kvm_rmap_head *rmap_head)
 {
 	unsigned long old_val, new_val;
=20
-	lockdep_assert_preemption_disabled();
+	if (IS_ENABLED(CONFIG_PREEMPT_RT))
+		lockdep_assert_preemption_disabled();
+	else
+		lockdep_assert_held(&kvm->mmu_lock);
=20
 	/*
 	 * Elide the lock if the rmap is empty, as lockless walkers (read-only
@@ -973,7 +977,7 @@ static unsigned long kvm_rmap_lock(struct kvm *kvm,
 {
 	lockdep_assert_held_write(&kvm->mmu_lock);
=20
-	return __kvm_rmap_lock(rmap_head);
+	return __kvm_rmap_lock(kvm, rmap_head);
 }
=20
 static void __kvm_rmap_unlock(struct kvm_rmap_head *rmap_head,
@@ -1008,14 +1012,17 @@ static unsigned long kvm_rmap_get(struct kvm_rmap_h=
ead *rmap_head)
  * actual locking is the same, but the caller is disallowed from modifying=
 the
  * rmap, and so the unlock flow is a nop if the rmap is/was empty.
  */
-static unsigned long kvm_rmap_lock_readonly(struct kvm_rmap_head *rmap_hea=
d)
+static unsigned long kvm_rmap_lock_readonly(struct kvm *kvm,
+					    struct kvm_rmap_head *rmap_head)
 {
 	unsigned long rmap_val;
=20
-	preempt_disable();
-	rmap_val =3D __kvm_rmap_lock(rmap_head);
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+		preempt_disable();
=20
-	if (!rmap_val)
+	rmap_val =3D __kvm_rmap_lock(kvm, rmap_head);
+
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT) && !rmap_val)
 		preempt_enable();
=20
 	return rmap_val;
@@ -1030,7 +1037,9 @@ static void kvm_rmap_unlock_readonly(struct kvm_rmap_=
head *rmap_head,
 	KVM_MMU_WARN_ON(old_val !=3D kvm_rmap_get(rmap_head));
=20
 	__kvm_rmap_unlock(rmap_head, old_val);
-	preempt_enable();
+
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+		preempt_enable();
 }
=20
 /*
@@ -1745,11 +1754,15 @@ static bool kvm_rmap_age_gfn_range(struct kvm *kvm,
 	gfn_t gfn;
 	int level;
=20
+#ifdef CONFIG_PREEMPT_RT
+	guard(read_lock)(&kvm->mmu_lock);
+#endif
+
 	for (level =3D PG_LEVEL_4K; level <=3D KVM_MAX_HUGEPAGE_LEVEL; level++) {
 		for (gfn =3D range->start; gfn < range->end;
 		     gfn +=3D KVM_PAGES_PER_HPAGE(level)) {
 			rmap_head =3D gfn_to_rmap(gfn, level, range->slot);
-			rmap_val =3D kvm_rmap_lock_readonly(rmap_head);
+			rmap_val =3D kvm_rmap_lock_readonly(kvm, rmap_head);
=20
 			for_each_rmap_spte_lockless(rmap_val, &iter, sptep, old_spte) {
 				if (!is_accessed_spte(old_spte))

