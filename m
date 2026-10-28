Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793214189;
	b=ltHKU1ASYtIiWyubrXvA1unVsqWpycqkFl2Gf/8GdHrfgPYvvap23md4AEWf8ii4+D68
	 P3U9zSsOWu2tpS7y4k6dLSFZJADoDaaUas7bo9UnQOV2IEyNes7hf53zseoDMPLO/CmWD
	 D0NR1c0/LjdGPjSQ0dcPI4WARIm+d+AOW1uf3KLaN1FP90sewW0ouCRPk2qcZfKnde69d
	 +2oZsywPhdxaN7b3eBkji2OtCBdieCz361fZ3jUi6Xt7MnBVUyYg8qA3aQYoXdGE1wh1y
	 54oiH8mkmEzHGVJaY+Tubc9So/2sqtvSymF6OrvibaFFJom9VaxtPwRwUw2ocmdHtLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793214189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=Sl+Mk8tjT6q271G5BWlaeNMAilxi46BFejIwHYIwO+I=;
	b=jABIms7uijK9tepJmUhfaGHGJ6RGvQP+RVCCc6WoMoc3uPJNBZdQG+ZrFS4CHI8LRy4N
	 2ivwcHok+I94MhDjEu8yLibGybA4C1oy1AAH4CjEXRNwG3wqOXFws3sXgFoYcS166or2G
	 3xc6RKGNZEszH/K1vNG1ywSq+246WGYylEY4uEsGV/RZ+FfFKLExE22okvwDV8iuI54yP
	 dZyzRHIL7nsQECxCgpagyQCm5zAubDCV/BqSAkkjDuVqnE/WtFoK2J6d4t6WATNcR08vj
	 GV/S+WRCNSc014DVlQogXcFLhaXHinjmqg+RtDZWZJJmHkoJzUXllAGS0Lktuh2byxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c89WTL6Q;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F189660A3830
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:03:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F189660A3830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c89WTL6Q
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e954d87b48so19241815ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793214188; x=1793818988; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Sl+Mk8tjT6q271G5BWlaeNMAilxi46BFejIwHYIwO+I=;
        b=c89WTL6Q1VfS3hqiM24m1FNxUVrozlAPCo08/CKtqSI/idliI5d4rJtQJ/ybRttuef
         QMDqcgK4RKACHUCWolLRklqLiw5CiqULUz+KJzlQTXf5R7d0DvStLV+SIrQiUuFWxWLF
         tEQXFYkZZGraKzloMsBWN1eS1fsMLzD4gPEC+RnV5dhV0fpLfMKV0pXnrWUsCXh2dKeS
         zGPrEy/DOUYKuEGycO1RIaVo7a6ecxsnrFljkJaadwv/QXK65dXy9QmAlcC0kJbKeXgP
         iujfFtpjZwNZptrCNSOLC9l3KjmmjHZvlqL+fNs1xrmfwL/qzNUFvcJ530fCZ166TRKg
         qXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214188; x=1793818988;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sl+Mk8tjT6q271G5BWlaeNMAilxi46BFejIwHYIwO+I=;
        b=dFtAwP/Ag2dVzKUdV8u/+MfKjPhD0zNi7QN1s7x51WddcVgqQ2+C1xK2VCfshBKRRj
         4nbaRhMD/MZ5OFEInLfvvAqb+S7NlwCWZFnO6YBauy2Ugdv+aDZJ0Fp+qBp7Rr81FHLy
         DH7iGdqB/ZioWQTovg2OQaRqXD4dUPFMmpmas/DV0IkEeFOfItGTHUuyzkPrHms1kAC/
         FlN/ky4HV3UXUERCpqDfIl/Qlbw2YarAObEwck9lE6N7XuH9gDxtCM9gkIIXJsifSDGM
         ACvNBXSWTLIf+s1XsdB64Z5NJwVjDAfcuKDUoPZS1SbxAsqyk1kB1MLrjbfVlHjSpIc2
         9BrQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7POIBH+fnb5j41aaxlInk1VidhDoHVXUetkXx5ejWy2H5Xtc6cDin7pwiaQZ507qFgHjr2yVnzGLXEfE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAazfGza2KpeLMsX8s470qIDurKnNKoVZvgbshtiA5oFR1hBIx
	JZo6ShPVFzbYh9Y5q0yD3gUFxfwLJVOz34jG9rLnVZ2otCJjEhgmoJEMhqAoHDtAmU9PFHxzNCf
	jJYZhHQ==
X-Received: from plic8.prod.google.com ([2002:a17:903:3708:b0:2e8:4252:d40c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:40c9:b0:2cc:6018:f030
 with SMTP id d9443c01a7336-2eb0033e60cmr28999775ad.14.1793214188023; Wed, 28
 Oct 2026 12:03:08 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Oct 2026 12:02:57 -0700
In-Reply-To: <20261028190259.1819571-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261028190259.1819571-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261028190259.1819571-6-seanjc@google.com>
Subject: [PATCH 5/7] KVM: Move kvm_arch_vcpu_should_kick() to common code as kvm_vcpu_should_kick()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"

Dedup kvm_arch_vcpu_should_kick() now that all architectures except for PPC
have identical implementations.  PPC's implementation is unreachable as PPC
always invokes __kvm_vcpu_kick() with @force=true.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c       |  5 -----
 arch/loongarch/kvm/vcpu.c  |  5 -----
 arch/mips/kvm/mips.c       |  5 -----
 arch/powerpc/kvm/powerpc.c |  5 -----
 arch/riscv/kvm/vcpu.c      |  5 -----
 arch/x86/kvm/x86.c         |  5 -----
 include/linux/kvm_host.h   |  1 -
 virt/kvm/kvm_main.c        | 11 ++++++++---
 8 files changed, 8 insertions(+), 34 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 775d11f96813..99d540d67b5b 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -128,11 +128,6 @@ bool is_kvm_arm_initialised(void)
 	return kvm_arm_initialised;
 }
 
-int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
-{
-	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
-}
-
 int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 			    struct kvm_enable_cap *cap)
 {
diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index 4026b9bf9f2d..76afd386abd2 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -379,11 +379,6 @@ int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu)
 		vcpu->arch.mp_state.mp_state == KVM_MP_STATE_RUNNABLE;
 }
 
-int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
-{
-	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
-}
-
 bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
 {
 	unsigned long val;
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index c37e212bc0a3..273dd932d119 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -120,11 +120,6 @@ bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
 	return false;
 }
 
-int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
-{
-	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
-}
-
 int kvm_arch_enable_virtualization_cpu(void)
 {
 	return kvm_mips_callbacks->enable_virtualization_cpu();
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 09c94b849185..ac259fcd85c2 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -62,11 +62,6 @@ bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
 	return false;
 }
 
-int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
-{
-	return 1;
-}
-
 /*
  * Common checks before entering the guest world.  Call with interrupts
  * enabled.
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index dd786f758eb7..3981ba39ffc2 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -239,11 +239,6 @@ int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu)
 		!kvm_riscv_vcpu_stopped(vcpu) && !vcpu->arch.pause);
 }
 
-int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
-{
-	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
-}
-
 bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
 {
 	return (vcpu->arch.guest_context.sstatus & SR_SPP) ? true : false;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 32563a91fba9..d9fa2690153a 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10472,11 +10472,6 @@ unsigned long kvm_arch_vcpu_get_ip(struct kvm_vcpu *vcpu)
 	return kvm_rip_read(vcpu);
 }
 
-int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
-{
-	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
-}
-
 static inline u32 kvm_async_pf_hash_fn(gfn_t gfn)
 {
 	BUILD_BUG_ON(!is_power_of_2(ASYNC_PF_PER_VCPU));
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3b9844c3906d..9db42f58c561 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1694,7 +1694,6 @@ void kvm_arch_disable_virtualization_cpu(void);
 bool kvm_vcpu_has_events(struct kvm_vcpu *vcpu);
 int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu);
 bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu);
-int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu);
 bool kvm_arch_dy_runnable(struct kvm_vcpu *vcpu);
 bool kvm_arch_dy_has_pending_interrupt(struct kvm_vcpu *vcpu);
 bool kvm_arch_vcpu_preempted_in_kernel(struct kvm_vcpu *vcpu);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 67addb9e48a7..e1a9da8b43d7 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -191,7 +191,7 @@ void vcpu_put(struct kvm_vcpu *vcpu)
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(vcpu_put);
 
-/* TODO: merge with kvm_arch_vcpu_should_kick */
+/* TODO: merge with kvm_vcpu_should_kick */
 static bool kvm_request_needs_ipi(struct kvm_vcpu *vcpu, unsigned req)
 {
 	int mode = kvm_vcpu_exiting_guest_mode(vcpu);
@@ -209,6 +209,11 @@ static bool kvm_request_needs_ipi(struct kvm_vcpu *vcpu, unsigned req)
 	return mode == IN_GUEST_MODE;
 }
 
+static int kvm_vcpu_should_kick(struct kvm_vcpu *vcpu)
+{
+	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
+}
+
 static void ack_kick(void *_completed)
 {
 }
@@ -3930,7 +3935,7 @@ void __kvm_vcpu_kick(struct kvm_vcpu *vcpu, bool wait, bool force)
 
 	/*
 	 * Note, the vCPU could get migrated to a different pCPU at any point
-	 * after kvm_arch_vcpu_should_kick(), which could result in sending an
+	 * after kvm_vcpu_should_kick(), which could result in sending an
 	 * IPI to the previous pCPU.  But, that's ok because the purpose of the
 	 * IPI is to force the vCPU to leave IN_GUEST_MODE, and migrating the
 	 * vCPU also requires it to leave IN_GUEST_MODE
@@ -3939,7 +3944,7 @@ void __kvm_vcpu_kick(struct kvm_vcpu *vcpu, bool wait, bool force)
 	 * check also modifies vcpu->mode and KVM PPC needs to avoid that side
 	 * effect for unknown historical reasons.
 	 */
-	if (force || kvm_arch_vcpu_should_kick(vcpu)) {
+	if (force || kvm_vcpu_should_kick(vcpu)) {
 		cpu = READ_ONCE(vcpu->cpu);
 		if (cpu != me && (unsigned int)cpu < nr_cpu_ids && cpu_online(cpu)) {
 			/*
-- 
2.56.0.313.g2479322e68-goog

