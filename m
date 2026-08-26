Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74383FADFD
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787764404; cv=none; b=IvXcL5ro82GGudxfCiHCBBwr89p1UxnJ0Rb8TTB1EbNSd7BgC01eNDm2UHzUhye/n4a2bi7WReI/DYJWPh1CyIBZ94RK5rwEpCUA5emnQ33FEdz9dd7OfC/+anDZehh1OWt0duqxRB6i2J6UAdIDLPG5HTyswNEXcn3DUdnFx+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787764404; c=relaxed/simple;
	bh=nOGiS9Ti/nKAmQSYb61HTD1CEUtTMs2x1FOM2r5GOl8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iV68J/DdLICRUpxyBdMgG6kbqis6+cGUL76Y8ELgJGqKYgxI2G+pC5BhEGzzUlCDXEcLM2qmm/dm0A40BtJYLyT+qo9aXTNKK8WUeyeCiMF9B7UeLHzhuLAuoxZDYW3r1zX7VOdJHwtzDU9GWLOVk2caNMcomtlVFFfh169iyT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HfBmG2sZ; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HfBmG2sZ"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfa55c9430so14228115ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787764386; x=1788369186; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZF+rhrplp7F9IM2HmvOv45+iUbuMSUncaYHQg1vJT4U=;
        b=HfBmG2sZIM+ybQpySFgklaD9EShNFcuYekLZM9MSvUFh4e17JlkXjXAKahId55krzK
         uBzsByKqz2E0vyZtkJ2KQMpaFi8If3n/7Ct1uZxHxfmolDN9bSbMEw0wo6IG0q736KNl
         cf/pmD0/IuCiDVV0lQGpWtL/mBhSkYNHNKGFPIeSsxN+HzJL1nGdF1eiUbJUbLVgNt/j
         pJDP3rryqiXLX+sc+at77tQJPzEFQm2mbg9WrAFHTsxC4HCc21THjExGONUbL23W3QHu
         8FxNWS3JTPpIeuyzP0Q3qcRzlxeHB+6gCYVMZE1tEhi5kK1Jjic3XvGdK5qOWKoZWVNt
         i2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787764386; x=1788369186;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZF+rhrplp7F9IM2HmvOv45+iUbuMSUncaYHQg1vJT4U=;
        b=lBg3sF0fRO5yWJsQvbDsZ+ZIMmf3oahBrroZCHOQx9j58+vaNnsap2NbiFGKVsTCle
         0H1W5NEMfWp75gm3kMY3ZICORprNshij0NwnjA70Uo5UGY/6240EKR8rkqM/+AsEpiQ8
         lMwU6XZ+yKH7qOhlWKGnxrlcM6EnjPd6FLFL/jhvDHy530pIl2Ml78yFs2f9zVWG6gAm
         0nipG620yOj+Asp/UiIh0vd+mnZI9Fk7T3UKI8RpVD1l5+GPRbiLqEatL06lOiIjR/Bn
         9b9xaOWMIBJRJ38KIZvyiIA3lv0wChLDPv5+kzBMj6ynuJOMD9mA6/wLlP0+utdfCrIr
         WdoA==
X-Forwarded-Encrypted: i=1; AHgh+RpJwjgJD0MSj5oNvf29XfwEFzFeuGe6CsxtBlh3FVeN1hWSUh0iSYnp8OgzHFBRtKW8m77r6ylkFeuJ/ZM=@vger.kernel.org
X-Gm-Message-State: AFuF++kXDj3Mq5iEwi7DUQyWBKuRrcVAR/SvE+7gkLjNxDIfwsMKVmt2
	j9iqkpLD69qk0JfJmkmwVCGt7dX2xJV9gf67sZZki4uNVZV7XUufu1mG2jWh8r369tjdHHej34w
	3MIqhxA==
X-Received: from plbko13.prod.google.com ([2002:a17:903:7cd:b0:2c7:f22f:54d6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:28d:b0:2d7:11d2:1455
 with SMTP id d9443c01a7336-2d711d21807mr118795855ad.4.1787764385182; Wed, 26
 Aug 2026 10:13:05 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 10:12:45 -0700
In-Reply-To: <20260826171246.777729-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826171246.777729-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826171246.777729-8-seanjc@google.com>
Subject: [PATCH v2 7/8] KVM: VMX: Move common VT getters/converters to common.h
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Kai Huang <kai.huang@intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

Move the "to" vCPU converters and common exit information getters from
vmx.h to common.h to capture that they are indeed common VT code.  Defer
renaming their prefixes to isolate the code movement from the massive
churn that will result from said renaming.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/common.h | 44 +++++++++++++++++++++++++++++++++++++++
 arch/x86/kvm/vmx/vmx.h    | 42 -------------------------------------
 2 files changed, 44 insertions(+), 42 deletions(-)

diff --git a/arch/x86/kvm/vmx/common.h b/arch/x86/kvm/vmx/common.h
index 35b54938a5f5..c9ca0824734a 100644
--- a/arch/x86/kvm/vmx/common.h
+++ b/arch/x86/kvm/vmx/common.h
@@ -2,10 +2,12 @@
 #ifndef __KVM_X86_VMX_COMMON_H
 #define __KVM_X86_VMX_COMMON_H
 
+#include <linux/container_of.h>
 #include <linux/kvm_host.h>
 #include <asm/posted_intr.h>
 
 #include "mmu.h"
+#include "vmx_ops.h"
 
 union vmx_exit_reason {
 	struct {
@@ -74,6 +76,48 @@ static __always_inline bool is_td_vcpu(struct kvm_vcpu *vcpu) { return false; }
 
 #endif
 
+struct vcpu_vmx_tdx {
+	struct kvm_vcpu vcpu;
+	struct vcpu_vt vt;
+};
+
+static __always_inline struct vcpu_vt *to_vt(struct kvm_vcpu *vcpu)
+{
+	return &(container_of(vcpu, struct vcpu_vmx_tdx, vcpu)->vt);
+}
+
+static __always_inline struct kvm_vcpu *vt_to_vcpu(struct vcpu_vt *vt)
+{
+	return &(container_of(vt, struct vcpu_vmx_tdx, vt)->vcpu);
+}
+
+static __always_inline union vmx_exit_reason vmx_get_exit_reason(struct kvm_vcpu *vcpu)
+{
+	return to_vt(vcpu)->exit_reason;
+}
+
+static __always_inline unsigned long vmx_get_exit_qual(struct kvm_vcpu *vcpu)
+{
+	struct vcpu_vt *vt = to_vt(vcpu);
+
+	if (!kvm_register_test_and_mark_available(vcpu, VCPU_REG_EXIT_INFO_1) &&
+	    !WARN_ON_ONCE(is_td_vcpu(vcpu)))
+		vt->exit_qualification = vmcs_readl(EXIT_QUALIFICATION);
+
+	return vt->exit_qualification;
+}
+
+static __always_inline u32 vmx_get_intr_info(struct kvm_vcpu *vcpu)
+{
+	struct vcpu_vt *vt = to_vt(vcpu);
+
+	if (!kvm_register_test_and_mark_available(vcpu, VCPU_REG_EXIT_INFO_2) &&
+	    !WARN_ON_ONCE(is_td_vcpu(vcpu)))
+		vt->exit_intr_info = vmcs_read32(VM_EXIT_INTR_INFO);
+
+	return vt->exit_intr_info;
+}
+
 static inline bool is_xfd_nm_fault(struct kvm_vcpu *vcpu)
 {
 	return vcpu->arch.guest_fpu.fpstate->xfd &&
diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
index 0415d328e1a5..3247b55b3484 100644
--- a/arch/x86/kvm/vmx/vmx.h
+++ b/arch/x86/kvm/vmx/vmx.h
@@ -304,48 +304,6 @@ struct kvm_vmx {
 	u64 *pid_table;
 };
 
-struct vcpu_vmx_tdx {
-	struct kvm_vcpu vcpu;
-	struct vcpu_vt vt;
-};
-
-static __always_inline struct vcpu_vt *to_vt(struct kvm_vcpu *vcpu)
-{
-	return &(container_of(vcpu, struct vcpu_vmx_tdx, vcpu)->vt);
-}
-
-static __always_inline struct kvm_vcpu *vt_to_vcpu(struct vcpu_vt *vt)
-{
-	return &(container_of(vt, struct vcpu_vmx_tdx, vt)->vcpu);
-}
-
-static __always_inline union vmx_exit_reason vmx_get_exit_reason(struct kvm_vcpu *vcpu)
-{
-	return to_vt(vcpu)->exit_reason;
-}
-
-static __always_inline unsigned long vmx_get_exit_qual(struct kvm_vcpu *vcpu)
-{
-	struct vcpu_vt *vt = to_vt(vcpu);
-
-	if (!kvm_register_test_and_mark_available(vcpu, VCPU_REG_EXIT_INFO_1) &&
-	    !WARN_ON_ONCE(is_td_vcpu(vcpu)))
-		vt->exit_qualification = vmcs_readl(EXIT_QUALIFICATION);
-
-	return vt->exit_qualification;
-}
-
-static __always_inline u32 vmx_get_intr_info(struct kvm_vcpu *vcpu)
-{
-	struct vcpu_vt *vt = to_vt(vcpu);
-
-	if (!kvm_register_test_and_mark_available(vcpu, VCPU_REG_EXIT_INFO_2) &&
-	    !WARN_ON_ONCE(is_td_vcpu(vcpu)))
-		vt->exit_intr_info = vmcs_read32(VM_EXIT_INTR_INFO);
-
-	return vt->exit_intr_info;
-}
-
 void vmx_vcpu_load_vmcs(struct kvm_vcpu *vcpu, int cpu);
 int allocate_vpid(void);
 void free_vpid(int vpid);
-- 
2.55.0.887.g758fc8c411-goog

