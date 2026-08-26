Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2936D3A875B
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787764392; cv=none; b=Caaam8ljfaPkCs6ajpbgzdCe5HwvVT/WRYwXCiILI+qVjvvAVuiRMTudbV36iBPDaz5IdUPd9qzm9XNw9eZXPL09P4RcEZxCW46gc2V2ZPtLq/EANkVpn3PF+3Y4WWPKxeZq4LcxXrFyr+ZNmOb9ish8LWm/6wSxbgOumlrVuNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787764392; c=relaxed/simple;
	bh=OnWNgS5GkQLgB67W1dU5Fp3RGNOLcQQhdr3j6o1TAdA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fnyNHMxmUXNlwx+e3ywAg4o0A10xpaLqvp876ZqwwH6wPu1NJ1qlp+wFxp7rZzJUEkY7lv3BwBml0ZDcPcyzO811uzgq2RziyP9Vv6tZ9BYD22d+mLskvNFJEOQX1zFalkgCb5PuIeHQfaFlQidZ/TYCAARe8B3cDz6mJ44+wEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Sb1cbiz8; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Sb1cbiz8"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so1513329a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787764381; x=1788369181; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fWg/bgPEAtiQApk4BQrFPqwBWOStWg6MEXtjNvUfbyI=;
        b=Sb1cbiz80RnlbqEAXgiDazLN2iomEeiJI5ydfjklLHVma8h0/Ss2XPBXP2PgW1JDxQ
         JMGVNueif1HjqF5rTxeKhfx2NS8dMJa5VusRsKoqAT0h2FBe01KxeRGVlH55xEis0ahY
         bgbOWYrC3Iw8t8JW1ILW+6D8Z8SP8PnhxTeEuYiqfpYyN5CWN0gOhqLdeOIj2zX+9EeP
         xOEaGajaaXHvRPwssaSKKmjAMYlCGHl2/aiyhzrQRqMSSEl7p8bAUdHsiPVudmA/O3GT
         SMzrku3txUzG39KtzdMqMKmfzEvWa9DDYmI+ed5PYqhtTDotL8UUtqXTOcu9aIaQUB2B
         cAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787764381; x=1788369181;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fWg/bgPEAtiQApk4BQrFPqwBWOStWg6MEXtjNvUfbyI=;
        b=VvrBBUzQ0Bm6bf5ZcmsLueyqv6+n2rbLDkrRNWrFedFsF4y7pbWIbH5P+tFthgYZPk
         wQezdJZhrZ9AIn2vcHkuD8EBA6njts7DlOZH9F6CizgBNsbTjysZfHBGVMJJlfORfgwu
         R2Mq3LAE4QXnZmAvW9LAe8/SL8xqSSWROG6D0p7vfBjeKULFPHv5+h1sQiEsXnYy3ttO
         XnfG0EJX0EGDJ53I9EkqvX91xVAiyUzHl4YLkhloMa8Yh6b67XZSyhceN/ZtUU3TafPE
         YA2EEwpSENVT731uKtASUitwim69cF8uwSCK5bReU5E+4Cq1ngUvirAzSboZn6vX31Az
         GpNw==
X-Forwarded-Encrypted: i=1; AHgh+RpkOFJtwiI2KH99O/scMizUi8KIGa/DDRSgdtgptwCNG52xFmQi7mn+ia0Q7T/y4Ej9kiMunhg5kWJK2Gw=@vger.kernel.org
X-Gm-Message-State: AFuF++m5AQ2+k7zMWfr7kMLtVR1HOYQc9xgV8hDmGr7SK7oyDH6Rb/5S
	2qbp/k1mIYKafWurXBPD8bO2jKG+TfJg5JXs0KyUUKjHdGAY+TbyQ4cKjUdRw9hZO8EmKIphmoK
	RZ/KKrQ==
X-Received: from pgbaz9.prod.google.com ([2002:a05:6a02:49:b0:cbe:95c8:8245])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:2013:b0:3d1:3c2:85b6
 with SMTP id adf61e73a8af0-3d103c28dfdmr523373637.5.1787764374218; Wed, 26
 Aug 2026 10:12:54 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 10:12:42 -0700
In-Reply-To: <20260826171246.777729-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826171246.777729-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826171246.777729-5-seanjc@google.com>
Subject: [PATCH v2 4/8] KVM: VMX: Rename posted interrupt prefixes from "vmx"
 to "vt"
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Kai Huang <kai.huang@intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

Rename all common posted interrupt APIs that use a "vmx" prefix to instead
use a "vt" prefix to capture that they are used for both VMX and TDX vCPUs.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/common.h      |  4 ++--
 arch/x86/kvm/vmx/main.c        |  4 ++--
 arch/x86/kvm/vmx/posted_intr.c | 18 +++++++++---------
 arch/x86/kvm/vmx/posted_intr.h |  8 ++++----
 arch/x86/kvm/vmx/tdx.c         |  6 +++---
 arch/x86/kvm/vmx/vmx.c         |  6 +++---
 6 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/arch/x86/kvm/vmx/common.h b/arch/x86/kvm/vmx/common.h
index 4b1d46eafd0f..ff4f6a2b6402 100644
--- a/arch/x86/kvm/vmx/common.h
+++ b/arch/x86/kvm/vmx/common.h
@@ -170,8 +170,8 @@ static inline void kvm_vcpu_trigger_posted_interrupt(struct kvm_vcpu *vcpu,
  * Post an interrupt to a vCPU's PIR and trigger the vCPU to process the
  * interrupt if necessary.
  */
-static inline void __vmx_deliver_posted_interrupt(struct kvm_vcpu *vcpu,
-						  struct pi_desc *pi_desc, int vector)
+static inline void __vt_deliver_posted_interrupt(struct kvm_vcpu *vcpu,
+						 struct pi_desc *pi_desc, int vector)
 {
 	if (pi_test_and_set_pir(vector, pi_desc))
 		return;
diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
index b1069a8e30a7..8ac6ea58b481 100644
--- a/arch/x86/kvm/vmx/main.c
+++ b/arch/x86/kvm/vmx/main.c
@@ -1086,8 +1086,8 @@ struct kvm_x86_ops vt_x86_ops __initdata = {
 
 	.update_cpu_dirty_logging = vt_op(update_cpu_dirty_logging),
 
-	.pi_update_irte = vmx_pi_update_irte,
-	.pi_start_bypass = vmx_pi_start_bypass,
+	.pi_update_irte = vt_pi_update_irte,
+	.pi_start_bypass = vt_pi_start_bypass,
 
 #ifdef CONFIG_X86_64
 	.set_hv_timer = vt_op(set_hv_timer),
diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index 24221ba553be..359ef3e6ebbe 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -56,7 +56,7 @@ static int pi_try_set_control(struct pi_desc *pi_desc, u64 *pold, u64 new)
 	return 0;
 }
 
-void vmx_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
+void vt_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
 {
 	struct pi_desc *pi_desc = vcpu_to_pi_desc(vcpu);
 	struct vcpu_vt *vt = to_vt(vcpu);
@@ -146,11 +146,11 @@ void vmx_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
 		pi_set_on(pi_desc);
 }
 
-static bool vmx_can_use_vtd_pi(struct kvm *kvm)
+static bool vt_can_use_vtd_pi(struct kvm *kvm)
 {
 	/*
 	 * Note, reading the number of possible bypass IRQs can race with a
-	 * bypass IRQ being attached to the VM.  vmx_pi_start_bypass() ensures
+	 * bypass IRQ being attached to the VM.  vt_pi_start_bypass() ensures
 	 * blockng vCPUs will see an elevated count or get KVM_REQ_UNBLOCK.
 	 */
 	return irqchip_in_kernel(kvm) && kvm_arch_has_irq_bypass() &&
@@ -219,10 +219,10 @@ static bool vmx_needs_pi_wakeup(struct kvm_vcpu *vcpu)
 	 * back to the pi_wakeup_handler() function.
 	 */
 	return (vmx_can_use_ipiv(vcpu) && !is_td_vcpu(vcpu)) ||
-		vmx_can_use_vtd_pi(vcpu->kvm);
+		vt_can_use_vtd_pi(vcpu->kvm);
 }
 
-void vmx_vcpu_pi_put(struct kvm_vcpu *vcpu)
+void vt_vcpu_pi_put(struct kvm_vcpu *vcpu)
 {
 	struct pi_desc *pi_desc = vcpu_to_pi_desc(vcpu);
 
@@ -294,17 +294,17 @@ bool pi_has_pending_interrupt(struct kvm_vcpu *vcpu)
 /*
  * Kick all vCPUs when the first possible bypass IRQ is attached to a VM, as
  * blocking vCPUs may scheduled out without reconfiguring PID.NV to the wakeup
- * vector, i.e. if the bypass IRQ came along after vmx_vcpu_pi_put().
+ * vector, i.e. if the bypass IRQ came along after vt_vcpu_pi_put().
  */
-void vmx_pi_start_bypass(struct kvm *kvm)
+void vt_pi_start_bypass(struct kvm *kvm)
 {
-	if (WARN_ON_ONCE(!vmx_can_use_vtd_pi(kvm)))
+	if (WARN_ON_ONCE(!vt_can_use_vtd_pi(kvm)))
 		return;
 
 	kvm_make_all_cpus_request(kvm, KVM_REQ_UNBLOCK);
 }
 
-int vmx_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
+int vt_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 		       unsigned int host_irq, uint32_t guest_irq,
 		       struct kvm_vcpu *vcpu, u32 vector)
 {
diff --git a/arch/x86/kvm/vmx/posted_intr.h b/arch/x86/kvm/vmx/posted_intr.h
index a4af39948cf0..c5860ea828ae 100644
--- a/arch/x86/kvm/vmx/posted_intr.h
+++ b/arch/x86/kvm/vmx/posted_intr.h
@@ -8,16 +8,16 @@
 
 #include <asm/posted_intr.h>
 
-void vmx_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu);
-void vmx_vcpu_pi_put(struct kvm_vcpu *vcpu);
+void vt_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu);
+void vt_vcpu_pi_put(struct kvm_vcpu *vcpu);
 void pi_wakeup_handler(void);
 void __init pi_init_cpu(int cpu);
 void pi_apicv_pre_state_restore(struct kvm_vcpu *vcpu);
 bool pi_has_pending_interrupt(struct kvm_vcpu *vcpu);
-int vmx_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
+int vt_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 		       unsigned int host_irq, uint32_t guest_irq,
 		       struct kvm_vcpu *vcpu, u32 vector);
-void vmx_pi_start_bypass(struct kvm *kvm);
+void vt_pi_start_bypass(struct kvm *kvm);
 
 static inline int pi_find_highest_vector(struct pi_desc *pi_desc)
 {
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 46b0e798f8b9..36578d4c00ff 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -716,7 +716,7 @@ void tdx_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 {
 	struct vcpu_tdx *tdx = to_tdx(vcpu);
 
-	vmx_vcpu_pi_load(vcpu, cpu);
+	vt_vcpu_pi_load(vcpu, cpu);
 	if (vcpu->cpu == cpu || !is_hkid_assigned(to_kvm_tdx(vcpu->kvm)))
 		return;
 
@@ -826,7 +826,7 @@ static void tdx_prepare_switch_to_host(struct kvm_vcpu *vcpu)
 
 void tdx_vcpu_put(struct kvm_vcpu *vcpu)
 {
-	vmx_vcpu_pi_put(vcpu);
+	vt_vcpu_pi_put(vcpu);
 	tdx_prepare_switch_to_host(vcpu);
 }
 
@@ -1895,7 +1895,7 @@ void tdx_deliver_interrupt(struct kvm_lapic *apic, int delivery_mode,
 	struct vcpu_tdx *tdx = to_tdx(vcpu);
 
 	/* TDX supports only posted interrupt.  No lapic emulation. */
-	__vmx_deliver_posted_interrupt(vcpu, &tdx->vt.pi_desc, vector);
+	__vt_deliver_posted_interrupt(vcpu, &tdx->vt.pi_desc, vector);
 
 	trace_kvm_apicv_accept_irq(vcpu->vcpu_id, delivery_mode, trig_mode, vector);
 }
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index a06dd2d77f10..506be74e3e0f 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -1577,12 +1577,12 @@ void vmx_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 
 	vmx_vcpu_load_vmcs(vcpu, cpu);
 
-	vmx_vcpu_pi_load(vcpu, cpu);
+	vt_vcpu_pi_load(vcpu, cpu);
 }
 
 void vmx_vcpu_put(struct kvm_vcpu *vcpu)
 {
-	vmx_vcpu_pi_put(vcpu);
+	vt_vcpu_pi_put(vcpu);
 
 	vmx_prepare_switch_to_host(to_vmx(vcpu));
 }
@@ -4424,7 +4424,7 @@ static int vmx_deliver_posted_interrupt(struct kvm_vcpu *vcpu, int vector)
 	if (!vcpu->arch.apic->apicv_active)
 		return -1;
 
-	__vmx_deliver_posted_interrupt(vcpu, &vt->pi_desc, vector);
+	__vt_deliver_posted_interrupt(vcpu, &vt->pi_desc, vector);
 	return 0;
 }
 
-- 
2.55.0.887.g758fc8c411-goog

