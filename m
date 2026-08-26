Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0A937EFF3
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787764393; cv=none; b=tftJaOdmo02DnuDRVdcMGzMZQAy//G5FhAJIP7KA2O+Rd5iPeU0pgObl0djrTivAPUfJ6JDJfBd8z49sehE4HNMRllW8yYrHSFTfMPO7dq4rLxLxTuIwm5N41C6h4mKAuUUH3Pf/yyGx90b1mbk/cLpnZxMys7nt86EGAGWnfUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787764393; c=relaxed/simple;
	bh=Xy9bUPMo10wPx+hGK64PejVqPjCe+tnmlzShZBrttKE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oHoeZEUwnJB76EQspI0wqOvyk66rkhNPNtPPRxfXkY/2Qfnk3bUz2f4DzCCDzr5UWvwsuzGPQDDxkG9l2ofg5VVj3uxZAsHXnERRml09YIQOLL1lFeq4xF6xt75gr7033fX/7QoIv+zypA3RSUnisZ5nZQIjlLw3pLB6olaVT5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EVOa9PuD; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EVOa9PuD"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so1552141a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787764371; x=1788369171; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Df0A62BBX5SuQrh9wZqWxjT6F0PSRl8xPi6joM+3RXg=;
        b=EVOa9PuDXIcKd8pWFzPPRfhwscpTp5J5uV0C9i6uDlTIsNNgp9mkp86qgsSHpnP7bn
         sQV5+/L2nu5sk3r0Q+NIVXDsvnwtB3htXkfdEKvIDX59bq9nEvASBhFFPNsq8vLVimBL
         uELfI3JKLHeMkaoiWEzZxf0aE8t9HwUcwHP3Ywfx4v1vKEXBoem/OdS3BACsiUtJMvzK
         s4tIKYplTOGhgOX1sT/FVrnQcYm7J9U7A4Yc2UJRysqu+tIgUpVueX0VW1KH3diiXLEj
         Dsi9Mxn/tHLxrgBwdsX83PfdRxCgtpnhuV0y0yp12z/eRdvNUS/oOYC9/+0lxHDV7SOg
         wQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787764371; x=1788369171;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Df0A62BBX5SuQrh9wZqWxjT6F0PSRl8xPi6joM+3RXg=;
        b=jHUfhyRbZh2uqdOv05SUXIHW95uN+woJmjgsjf5XfXvkHnWZVNwDUnT6ZoXLH6Ywb+
         Z0XnCGcDzy/rH6Ne3QsgFdW+91nC4SB95j8tdfD7Rd4z7vRHs9n5NLgBtINj8vTMWpGl
         DHjrBvoKVnDVab08yHM/qybPXZD/EHtPXqcM06J0f0iv+7Ndp80t2n4Ybsu1Htt4ljvq
         S7ahjZww/C1WFE8jCkRqo41y8KO2uNI6h7Q85ipgcp9RHcqjRLM62nj+5aiSLXiMsCfn
         mQ/niQ3UMLGwvbhur7c2j5+chs42y1Ge0O5FMVcmluUQdfz1AvtNIbX4X0s+cA56BoS4
         7C6w==
X-Forwarded-Encrypted: i=1; AHgh+RrZvlyrdTt96YyxjUlkNpeXA9u9johhPV+qRAqyIvqHtT0cSfzm7gKcR1kOVlriPtPmzYaznnDwB3+giek=@vger.kernel.org
X-Gm-Message-State: AFuF++kH/+HkaklgYPwuRuNpblw8b5qCAMMoez72X97yM6w9h4n4WRpP
	9LRqNy2FnpZZdr0cH3oWXmAlPTa7OfMLepoqTSckkZm+jsAzyuXOakDVYRdgEP3hRGmQTofCE+F
	ltqqzWw==
X-Received: from pgby7-n2.prod.google.com ([2002:a05:6a02:6507:20b0:cbe:948f:d640])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3926:b0:848:46a0:3d74
 with SMTP id d2e1a72fcca58-8537499bb90mr14451563b3a.9.1787764370966; Wed, 26
 Aug 2026 10:12:50 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 10:12:40 -0700
In-Reply-To: <20260826171246.777729-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826171246.777729-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826171246.777729-3-seanjc@google.com>
Subject: [PATCH v2 2/8] KVM: VMX: Move the shared NMI handler/trampoline to
 common code
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Kai Huang <kai.huang@intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

Move vmx_handle_nmi() to main.c to capture that it's a common handler and
to allow guarding against incorrectly using to_vmx().

Opportunistically use a "vt" prefix instead of "vmx" to communicate that
it's a shared handler.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/common.h |  2 +-
 arch/x86/kvm/vmx/main.c   | 11 +++++++++++
 arch/x86/kvm/vmx/tdx.c    |  2 +-
 arch/x86/kvm/vmx/vmx.c    | 13 +------------
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kvm/vmx/common.h b/arch/x86/kvm/vmx/common.h
index 88f637c81353..4b1d46eafd0f 100644
--- a/arch/x86/kvm/vmx/common.h
+++ b/arch/x86/kvm/vmx/common.h
@@ -189,6 +189,6 @@ static inline void __vmx_deliver_posted_interrupt(struct kvm_vcpu *vcpu,
 	kvm_vcpu_trigger_posted_interrupt(vcpu, POSTED_INTR_VECTOR);
 }
 
-noinstr void vmx_handle_nmi(struct kvm_vcpu *vcpu);
+noinstr void vt_handle_nmi(struct kvm_vcpu *vcpu);
 
 #endif /* __KVM_X86_VMX_COMMON_H */
diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
index 274200b0a307..684b87692864 100644
--- a/arch/x86/kvm/vmx/main.c
+++ b/arch/x86/kvm/vmx/main.c
@@ -945,6 +945,17 @@ static void vt_handle_exit_irqoff(struct kvm_vcpu *vcpu)
 	}
 }
 
+noinstr void vt_handle_nmi(struct kvm_vcpu *vcpu)
+{
+	if ((u16)vmx_get_exit_reason(vcpu).basic != EXIT_REASON_EXCEPTION_NMI ||
+	    !is_nmi(vmx_get_intr_info(vcpu)))
+		return;
+
+	kvm_before_interrupt(vcpu, KVM_HANDLING_NMI);
+	x86_entry_from_kvm(EVENT_TYPE_NMI, NMI_VECTOR);
+	kvm_after_interrupt(vcpu);
+}
+
 #define VMX_REQUIRED_APICV_INHIBITS				\
 	(BIT(APICV_INHIBIT_REASON_DISABLED) |			\
 	 BIT(APICV_INHIBIT_REASON_ABSENT) |			\
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index b272c20586a7..46b0e798f8b9 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -974,7 +974,7 @@ static noinstr void tdx_vcpu_enter_exit(struct kvm_vcpu *vcpu)
 	tdx->exit_gpa = tdx->vp_enter_args.r8;
 	vt->exit_intr_info = tdx->vp_enter_args.r9;
 
-	vmx_handle_nmi(vcpu);
+	vt_handle_nmi(vcpu);
 
 	guest_state_exit_irqoff();
 }
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index adf2bc13bed2..a06dd2d77f10 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7363,17 +7363,6 @@ static fastpath_t vmx_exit_handlers_fastpath(struct kvm_vcpu *vcpu,
 	}
 }
 
-noinstr void vmx_handle_nmi(struct kvm_vcpu *vcpu)
-{
-	if ((u16)vmx_get_exit_reason(vcpu).basic != EXIT_REASON_EXCEPTION_NMI ||
-	    !is_nmi(vmx_get_intr_info(vcpu)))
-		return;
-
-	kvm_before_interrupt(vcpu, KVM_HANDLING_NMI);
-	x86_entry_from_kvm(EVENT_TYPE_NMI, NMI_VECTOR);
-	kvm_after_interrupt(vcpu);
-}
-
 static noinstr void vmx_vcpu_enter_exit(struct kvm_vcpu *vcpu,
 					unsigned int flags)
 {
@@ -7406,7 +7395,7 @@ static noinstr void vmx_vcpu_enter_exit(struct kvm_vcpu *vcpu,
 	if (likely(!vmx_get_exit_reason(vcpu).failed_vmentry))
 		vmx->idt_vectoring_info = vmcs_read32(IDT_VECTORING_INFO_FIELD);
 
-	vmx_handle_nmi(vcpu);
+	vt_handle_nmi(vcpu);
 
 out:
 	guest_state_exit_irqoff();
-- 
2.55.0.887.g758fc8c411-goog

