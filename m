Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395299;
	b=4t2p/2rE2s1BuZnjKPbG3JcH91XkehA8YN44mG4N7A85LrvuwVVJ9g4GsplKi/J4N5OI
	 ZARfxgMNdYoSWIpCg540EtA9Q1waoQRLcpHt2lDOVbIdO+MKyDX3PIpdRElCkIFkTSmbo
	 I/BpoZfhp0US2UUOpxUHEXpDAW5OrH6v/scsVoBfjFWDdSb9L+lKSU1fn1hfC+ogKIxDN
	 WqFr89Wu5aTETAsTOsI6RnLNxcCiIDDw+GwNj+YSRXj7B8HyE59HwFCY9HpyjlbF9qmmb
	 fba9c/KbUdTIsa6r4zfYKYG9SoezkpN9Zi16Wh6TkMLnJnNQd7J/lVqZstQCUqQ/xQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=8PE43LpzTPSR1zzdd4igy9DBsWKBaooNuQb+N+z+Bpc=;
	b=psku+5YArzPl4SJfg/w01H6TF6bkRxIiiY9QpD+thzDfv43OZkMXTuCpVGx55wUJEx+o
	 gCcSjdKvGbZOAccAqvcYvhynRtnzPiKjdQf3Ub3dD1nildcVYAQZL+ii4RqBrgNchT0yv
	 YxuUTL6BtcdzE2U0p/OZHOjQbIfuuFCzKJBwmrrfa/xVgn/l1h0/T1rTy6BRP2rXb4yt6
	 9O7zX+ZInI33o1Mk3ssvUaAYA/VXF7+m41h3JfIYz/2T7BYd3pzX3JaEZcqznDBMuV9tW
	 N2ocU9FRZ9jr9K2TM2oQ9qGxsoPYG9o0lhECvefvpbot9TosKpa3VxxAi2ol6hNlRYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="RQxehEg/";
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC0A606F745
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECC0A606F745
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RQxehEg/
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a06bc723b1so1242744b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793395298; x=1794000098; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8PE43LpzTPSR1zzdd4igy9DBsWKBaooNuQb+N+z+Bpc=;
        b=RQxehEg/XWHFP9rTtr8cvtxUqkFzjkIGzaRovCJx1pqUuFcKs7CglKM65s7IcJJ4RL
         +9YtSRlU+MW+gr0G+GKRY1hae1zm2SMso8HidOJJZTbenUe1A6ZVAi1lXQE/9lB5Wi6J
         4Ot0xwnF9jx8A70DbF2QIsHNzX157MtO8jy2i1kX/2/0G4m/hfKioRWFSksizWrjdsAW
         RYFVQWtVeN12H/1fISegz09wQo1i2tIXWNJEai2wDrmV0YjWrGVI3oTGq817QJu9BRry
         X5MclJt5uBIhh9Q7IbUsFgV8W8bwNGkC68f35nz9upOHz5Q5ofC2quHMSoNTUvYxCG7G
         J1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395298; x=1794000098;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8PE43LpzTPSR1zzdd4igy9DBsWKBaooNuQb+N+z+Bpc=;
        b=ZH+vZ4qYeBNYkbbxwt4hJzrc9UyNtNM7k+T7kbQckS35iWv00WWlfrJuzW9xYl8UyP
         jGWO4TLK819lRQfDXRjWjghcugWZFlsG4BJxgaxiNlXdraKWYkmR85Oh7dior7cnl1H+
         LAHR6FxQj9aF01I22ZMKXA5qSbu0nNQwKT6PauzkYWGvoK7K4CJqTG4+4IG+Wnx+azrK
         K9FQpkL1ex9NoJC4VopezYi4Nefp2QpZCVCWljkX7qAHqmNIDZwga7VejzSKaxxX8Miu
         JpMiiHfY3fsnpVyOAOwlvsFV/qTZaqcrfOYXFTmvpuBOVfQdxKfE/K25PBJ9w8wrfRSv
         +Nkg==
X-Forwarded-Encrypted: i=1; AKwUvBy4W7xwsYdlIWv8cD7An6lmYyGO2EGGgRXZ8u4kjDKYKkJvopg4IwD7nqfyQEgIIHtHH0ZK2PkNm0OkmUo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGhuEcBkuw2h/Je6+H5qagB7vw9oBDZ3UU8htGqEL0DCi+R5rE
	Ks/CPMj7b8081B9mWBf+gKUzhjei74vHGkUWR0mimus+gwYE06Klg4NTuaxMWbKhfcSb4uJQs1p
	ZfE1eJw==
X-Received: from pfbjw38.prod.google.com ([2002:a05:6a00:92a6:b0:8a0:afff:6594])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:600d:b0:892:e080:4ed8
 with SMTP id d2e1a72fcca58-8a9bd7dc8bfmr2989556b3a.47.1793395298189; Fri, 30
 Oct 2026 14:21:38 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 30 Oct 2026 14:21:08 -0700
In-Reply-To: <20261030212112.2598640-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030212112.2598640-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261030212112.2598640-21-seanjc@google.com>
Subject: [PATCH v4 20/23] KVM: VMX: Explicitly remove dying vCPUs from the PI
 wakeup list
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>, 
	James Houghton <jthoughton@google.com>, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Explicitly remove dying vCPUs that were blocking when the VM was released
from the Posted Interrupts wakeup list instead of very, very subtly relying
on the vcpu_load() in nested_vmx_free_vcpu() to take the vCPU off said list.
In addition to helping avoid future regressions, e.g. if an enterprising
developer were to optimize nested_vmx_free_vcpu() by bailing early if
"nested" is completely disabled, this will allow dropping the load+put pair
from nested_vmx_free_vcpu().

Provide a dedicated API to remove a vCPU from the wakeup list, i.e. don't
_completely_ abuse vt_vcpu_pi_load(), but do reuse the core logic for
updating the PID control word.  Using a CMPXCHG8B _should_ be unnecessary
as IRQ routing has already been torn down, i.e. no IRTEs should be pointing
at updating the PID, and there are obviously no other references to the VM
or vCPU, and so concurrently modifications of the PID should be impossible.
For the same reasons, updating the destination should also be unnecessary,
as nothing should ever send an IRQ.  However, relying on those assumptions
begs for WARNs to ensure they hold, along with fallback code to avoid the
worst case scenario, at which point trying to take advantage of the fact
that the PID is unreachable would be *more* complex than what is now
__vt_vcpu_pi_load(), not to mention KVM would have two paths to maintain.

Reviewed-by: James Houghton <jthoughton@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/posted_intr.c | 68 +++++++++++++++++++++-------------
 arch/x86/kvm/vmx/posted_intr.h |  1 +
 arch/x86/kvm/vmx/vmx.c         |  2 +
 3 files changed, 45 insertions(+), 26 deletions(-)

diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index 2644add54b76..4406e344ae6a 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -56,35 +56,13 @@ static int pi_try_set_control(struct pi_desc *pi_desc, u64 *pold, u64 new)
 	return 0;
 }
 
-void vt_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
+static void __vt_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
 {
 	struct pi_desc *pi_desc = vcpu_to_pi_desc(vcpu);
-	struct vcpu_vt *vt = to_vt(vcpu);
 	struct pi_desc old, new;
-	unsigned long flags;
 	unsigned int dest;
 
-	/*
-	 * To simplify hot-plug and dynamic toggling of APICv, keep PI.NDST and
-	 * PI.SN up-to-date even if there is no assigned device or if APICv is
-	 * deactivated due to a dynamic inhibit bit, e.g. for Hyper-V's SyncIC.
-	 */
-	if (!enable_apicv || !lapic_in_kernel(vcpu))
-		return;
-
-	/*
-	 * If the vCPU wasn't on the wakeup list and wasn't migrated, then the
-	 * full update can be skipped as neither the vector nor the destination
-	 * needs to be changed.  Clear SN even if there is no assigned device,
-	 * again for simplicity.
-	 */
-	if (pi_desc->nv != POSTED_INTR_WAKEUP_VECTOR && vcpu->cpu == cpu) {
-		if (pi_test_and_clear_sn(pi_desc))
-			goto after_clear_sn;
-		return;
-	}
-
-	local_irq_save(flags);
+	guard(irqsave)();
 
 	/*
 	 * If the vCPU was waiting for wakeup, remove the vCPU from the wakeup
@@ -103,7 +81,7 @@ void vt_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
 		 */
 		raw_spin_lock(spinlock);
 		spin_acquire(&spinlock->dep_map, PI_LOCK_SCHED_OUT, 0, _RET_IP_);
-		list_del(&vt->pi_wakeup_list);
+		list_del(&to_vt(vcpu)->pi_wakeup_list);
 		spin_release(&spinlock->dep_map, _RET_IP_);
 		raw_spin_unlock(spinlock);
 	}
@@ -129,8 +107,33 @@ void vt_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
 		 */
 		new.nv = POSTED_INTR_VECTOR;
 	} while (pi_try_set_control(pi_desc, &old.control, new.control));
+}
 
-	local_irq_restore(flags);
+void vt_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
+{
+	struct pi_desc *pi_desc = vcpu_to_pi_desc(vcpu);
+
+	/*
+	 * To simplify hot-plug and dynamic toggling of APICv, keep PI.NDST and
+	 * PI.SN up-to-date even if there is no assigned device or if APICv is
+	 * deactivated due to a dynamic inhibit bit, e.g. for Hyper-V's SyncIC.
+	 */
+	if (!enable_apicv || !lapic_in_kernel(vcpu))
+		return;
+
+	/*
+	 * If the vCPU wasn't on the wakeup list and wasn't migrated, then the
+	 * full update can be skipped as neither the vector nor the destination
+	 * needs to be changed.  Clear SN even if there is no assigned device,
+	 * again for simplicity.
+	 */
+	if (pi_desc->nv != POSTED_INTR_WAKEUP_VECTOR && vcpu->cpu == cpu) {
+		if (pi_test_and_clear_sn(pi_desc))
+			goto after_clear_sn;
+		return;
+	}
+
+	__vt_vcpu_pi_load(vcpu, cpu);
 
 after_clear_sn:
 
@@ -146,6 +149,19 @@ void vt_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
 		pi_set_on(pi_desc);
 }
 
+void vt_vcpu_pi_remove_from_wakeup_list(struct kvm_vcpu *vcpu)
+{
+	kvm_lockdep_assert_vcpu_is_unreachable(vcpu);
+
+	if (!enable_apicv || !lapic_in_kernel(vcpu) ||
+	    vcpu_to_pi_desc(vcpu)->nv != POSTED_INTR_WAKEUP_VECTOR)
+		return;
+
+	__vt_vcpu_pi_load(vcpu, get_cpu());
+
+	put_cpu();
+}
+
 static bool vt_can_use_vtd_pi(struct kvm *kvm)
 {
 	/*
diff --git a/arch/x86/kvm/vmx/posted_intr.h b/arch/x86/kvm/vmx/posted_intr.h
index c5860ea828ae..1d9ccbc2bb6f 100644
--- a/arch/x86/kvm/vmx/posted_intr.h
+++ b/arch/x86/kvm/vmx/posted_intr.h
@@ -10,6 +10,7 @@
 
 void vt_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu);
 void vt_vcpu_pi_put(struct kvm_vcpu *vcpu);
+void vt_vcpu_pi_remove_from_wakeup_list(struct kvm_vcpu *vcpu);
 void pi_wakeup_handler(void);
 void __init pi_init_cpu(int cpu);
 void pi_apicv_pre_state_restore(struct kvm_vcpu *vcpu);
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 292001bbcbff..1f9e43c5b4c4 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7514,6 +7514,8 @@ void vmx_vcpu_free(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
 
+	vt_vcpu_pi_remove_from_wakeup_list(vcpu);
+
 	if (enable_pml)
 		vmx_destroy_pml_buffer(vcpu);
 	free_vpid(vmx->vpid);
-- 
2.56.0.385.gac671c819a-goog

