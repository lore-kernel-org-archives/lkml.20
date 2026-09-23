Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D285208B1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178680; cv=none; b=sCb0PZdJV/Z5h2kK/Lp94tMnB0fd37iD6zlgqS+w8CK4snhJxJOXqI/zfaXu5kQCwOssC2NXAWlyhus2i+rp4VpL/8Rdu90eySEwCaRyNhGI5vWHpX21ngtDOIrUm0vi1WgaRlIYZUgEqGCwHZ17/Z73Y2E5ycG+Cvn92uymRVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178680; c=relaxed/simple;
	bh=YltGBX65BN3apS6Op67TDxRjOTDL3Nv6GkYEJt56dNI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RLXL6x1Khd/S+aVVxTJKQPRFSXbRwN1dtWxNyM0z/07viDKmW1yuTbLzM7/beC21IGjfssPFOGI9lR16HRmTGsuA2Thr4pOXph+BdHu9YgDOlOg20Nh09MUQ6rPxZKvfyv9xeKJUd0XRmqjtY0Xbo3O3FlDGD7ueJ787Sp0CUK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m84d6++H; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m84d6++H"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8623e5d4279so1654040b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790178672; x=1790783472; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xpOXPyZtLg83VF0R6mkL6Bp5HwN6yDRFCZL9glrow7k=;
        b=m84d6++HkQhbS27vocvK8O41j89M5+ahN34Mtp/mn54clYeSPpI27pS0fOWYO3ZMj2
         EJrdl2hun/TsCOnrH8cI3JR/bV0XuHERU+lCkOyzyxmMxZ1a7UWJVmlLFsGjrIWGMxOd
         h/yVvPfperDXvGzqiW/Y+9HZ3LjKsVeWbTGE06VI1+a4NNMeyIc0aPxyr6SVe2DxsyD3
         bxp0iqZLK8qb6UttMpiKmqoYK7kJj5PDoe7nR+RAKSDN2vqtIkBCGj48lWNtWLVH8ARR
         PEq4TUxxEc4vwQi+SOPY08Ngv1ywOeUqGzgWZkU0HJlgjxgf86e04Pn9sZgFZ+LfkpK0
         OMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178672; x=1790783472;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xpOXPyZtLg83VF0R6mkL6Bp5HwN6yDRFCZL9glrow7k=;
        b=CW/iE4RaAfzHidhiDTCmeGWE3Mvh0yi15PRrDF5Qr5IWwfLXHKtEADltLMgzSBJ8t1
         nC3s588+0bj7LbKPZYVoq9B22+QXP0zwMBxmeGJe3NYVO8dWg8wMhdGVRY7OUtRlPA6H
         aesBloQR/BeV3rIyKIZXBesok7HMX4pjV4YWpc84FmC0ksFdO9GwtkKwlPJYNchUjl2/
         Zjokthd6DFnvlDuvGq4RvWr2AdTQqqIk0EBMjxWjkZidBQ3QVDSkBxbQRYQyaav8EPnG
         IGYxeh2QLtI2vt9ernkDN+uYXL2KjaXxJxA5Ddc/eJBcTTDhRXJAXdB2RtnXHVkL5Cbb
         RPAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxtU0jvZDk79OozrghwtdNf1RJakzTKLVAuyu+q4BlGTC6YL5H8BYkydt0CrxM93Y1OkSS2kMFtL6fbBA0=@vger.kernel.org
X-Gm-Message-State: AFuF++nlhRZmS7FoYQkS5UOrLvUH9lPbLDxnv9rYzwm5IZKLYKBi/uy0
	IVccvHKm/q6xkkTReyn99oIs0wyqjXgyOCbdxYVm++jlEJkfyvUEeKkl7yrYqI5uaNb7Mw1Pdin
	WQEs/Jg==
X-Received: from pfbgd10.prod.google.com ([2002:a05:6a00:830a:b0:863:cabd:d30d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:99a:b0:878:34f8:fb6
 with SMTP id d2e1a72fcca58-87d1c9c6e2amr2676193b3a.54.1790178671607; Wed, 23
 Sep 2026 08:51:11 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 23 Sep 2026 08:51:06 -0700
In-Reply-To: <20260923155108.1550622-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260923155108.1550622-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260923155108.1550622-2-seanjc@google.com>
Subject: [PATCH v2 1/3] KVM: SVM: Add paranoid helper for checking if vCPU is AVIC-addressable
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Naveen N Rao <naveen@kernel.org>, Atish Patra <atishp@meta.com>
Content-Type: text/plain; charset="UTF-8"

Add a helper to check if a vCPU is addressable by AVIC hardware, i.e. has
an APIC ID that fits in the physical ID table, and use the more paranoid
helper when determining if a vCPU is compatible with AVIC when initializing
the vCPU.  KVM is supposed to reject vCPU creation if the vCPU's ID is
greater than or equal to max_vcpu_ids, i.e. simply checking the
architectural maximum *should* suffice.  But piecing together why this is
safe is unnecessarily difficult, and there is no meaningful downside to
being extra cautious.

Suggested-by: Naveen N Rao (AMD) <naveen@kernel.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 3b037e385523..0e4b5eb6ac82 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -395,6 +395,11 @@ static phys_addr_t avic_get_backing_page_address(struct vcpu_svm *svm)
 	return __sme_set(__pa(svm->vcpu.arch.apic->regs));
 }
 
+static bool avic_is_addressable_vcpu(struct kvm_vcpu *vcpu)
+{
+	return vcpu->vcpu_id <= __avic_get_max_physical_id(vcpu->kvm, NULL);
+}
+
 void avic_init_vmcb(struct vcpu_svm *svm, struct vmcb *vmcb)
 {
 	struct kvm_svm *kvm_svm = to_kvm_svm(svm->vcpu.kvm);
@@ -412,7 +417,6 @@ void avic_init_vmcb(struct vcpu_svm *svm, struct vmcb *vmcb)
 
 static int avic_init_backing_page(struct kvm_vcpu *vcpu)
 {
-	u32 max_id = x2avic_enabled ? x2avic_max_physical_id : AVIC_MAX_PHYSICAL_ID;
 	struct kvm_svm *kvm_svm = to_kvm_svm(vcpu->kvm);
 	struct vcpu_svm *svm = to_svm(vcpu);
 	u32 id = vcpu->vcpu_id;
@@ -425,7 +429,7 @@ static int avic_init_backing_page(struct kvm_vcpu *vcpu)
 	 * avic_vcpu_load() expects to be called if and only if the vCPU has
 	 * fully initialized AVIC.
 	 */
-	if (id > max_id) {
+	if (!avic_is_addressable_vcpu(vcpu)) {
 		kvm_set_apicv_inhibit(vcpu->kvm, APICV_INHIBIT_REASON_PHYSICAL_ID_TOO_BIG);
 		vcpu->arch.apic->apicv_active = false;
 		return 0;
-- 
2.55.0.1082.g2b9226bbc0-goog

