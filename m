Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8629936F90C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 01:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788483849; cv=none; b=UpNpygxqs0ZTevsU8iZkVKayFIhEHuFbK+QznO/dQhVsmtktp0bWU3VC045f9V5R6KLlu6hgnaBa9S2byi+q4of3UYOILBztHiv/PRhXj4gTFEa6to/2cuy/joGcLAUnRuQ8lhVU4DtjWH33UNstBSAPuzLwDIWE5hy3D4JkVXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788483849; c=relaxed/simple;
	bh=l4kUd/yWDPJzl0Cfuv69NdJUn93tzn+b1PJKjxDHVIY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lZmVPIAdtpybdfKWKMH8Mb6PDNlPEYTRoFn4TG8Rm+ZMlHHi+X1y2Ndog7ooWy/UZFblGAYB1hJIzSxpzBVm47OLnfoCw9lA2raGyzpMKz4USh3hTuJtCQ4Bqh8Bk+BHwiumJyozsw3PCCF5SuMUbYLZt1WdJheIAK1K/gOjm4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X93mITEA; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X93mITEA"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-851992f22ccso289459b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 18:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788483844; x=1789088644; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Sl/i6fy4LSsllHV3Bhew/nOEKF0l8TqNOkYiE2Q8/uw=;
        b=X93mITEA8o6ow1iTBtPwPCyuP5r23OZZogzxVmHGc9ayy+I3egpDsRQf+Yi2AIdRx2
         BRBdg8+LKYewHBey6qNs+MFM686+tP3WW1aDtSmthbkM2fWG7ULViekaRxIFW/sF5eQO
         tfEzjAF1JLsd4eo/MPCBWGJO384zufxVSQVDUj8s2FWaG7kp/eA57ntWjeY1RAIlBUpl
         0KCTc8UNvHxXdimHhuhBEKQpzW5FTY94u5s5iQjKleJF9rjg62doq5SkyeO3v68EYy3N
         0rLAw4XTja+eWZ5uRftc6MEEBVMsuNPFRciK++g/RTEs905Z8+GChDAD//0pCWcsiBWk
         AAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788483844; x=1789088644;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sl/i6fy4LSsllHV3Bhew/nOEKF0l8TqNOkYiE2Q8/uw=;
        b=NhTY03Ic2dpatEj8KfcbQcB3tlJ4oztyhVuritQxkxtm0kgOKQU8IMCV13sI2C3RE4
         Btt/kMEkcWPdhP4COmt9E3ffUnBlQSNMofV2IVL0RjjdOC428E8Vlk0Bk453ZBypaZMK
         wxFM3biHmF0qJ61koYG6xZZO1OvkRyq5XRwj9xHU2QEboyvN3L6F6elPnGbUZ1jpF8K2
         iTHrLpERxsHOmQoylHwxz2nlpgSzI8VYQOtQ0JjrRyKMShtaHtrdTt0lXJl3Ql9JuQLG
         YXrqIrI4WiTBe3/mM1eRHWOLypkt/fuxo7StWzJUXlC564AlPHYgHHGfMON1LXAKHiOc
         jkhw==
X-Forwarded-Encrypted: i=1; AKwUvBzmxXsPxPEY1I0wBR57KsanKlu9nkEkSAXmgo+nGh5727wa5Yq/A2PLfNUWv+IhlsIMz8q+YvJ9GYIwHmg=@vger.kernel.org
X-Gm-Message-State: AFuF++nvqf7yQT0czWPcxWLCH3IuUGvgXYSyw+kcrnqheIqS/LD/x2wV
	HK6tLZVnYYU53qGTcWzLVypBZNiBTw2M86gIwVX81WGGE3lhyHSOikTYU5Q4AkbznHabuTXqG2h
	AFrZZ6w==
X-Received: from pfj21.prod.google.com ([2002:a05:6a00:a415:b0:84e:a25:1e6b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2885:b0:860:507d:503e
 with SMTP id d2e1a72fcca58-8616a26965emr3667088b3a.20.1788483843524; Thu, 03
 Sep 2026 18:04:03 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  3 Sep 2026 18:03:52 -0700
In-Reply-To: <20260904010353.3175819-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260904010353.3175819-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904010353.3175819-8-seanjc@google.com>
Subject: [PATCH v3 7/8] KVM: VMX: Move common VT getters/converters to common.h
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

Move the "to" vCPU converters and common exit information getters from
vmx.h to common.h to capture that they are indeed common VT code.  Defer
renaming their prefixes to isolate the code movement from the massive
churn that will result from said renaming.

No functional change intended.

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Tested-by: Kai Huang <kai.huang@intel.com>
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
2.55.0.979.g7e5102b832-goog

