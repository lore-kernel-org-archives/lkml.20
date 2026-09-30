Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E45634E774
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790730817; cv=none; b=n4DW1ktdScXTqPppH+77assqK5RjK2RpklsmAIAkbJ3AY9fLoGmOPsGmp8xHaELzGX5U1caQbr0B1Jz+Rc6oxsLhjHKFLPrlxNKAdOmrLFgHDZDg0E52+5lsPjfvg+Biacg7uP+PVc+b1Lp/B2SuNU7X1QtSJHh07SgUj+nz8No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790730817; c=relaxed/simple;
	bh=qNaxT1lfEbT1LPSsEVh5+AezcCglRx9kPOdT2poCI4Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NQe0DT6Ky2LjWmsLH8815faBK5Syj8rNha8A8GVk2gxwq8Vp4jeLAyL5nB4nIpayu1KLOoIx+qv0aC4xZbZGZlEbxA87VSB13FsFbomRVemH9G2dPrqEUxY2Av9z7OWQS3EHhYiHeKABr3dmJLj8lM16Ymr77fgHZZb3RUimELU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hxt/4maw; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hxt/4maw"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2df8cffbdbaso32503665ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790730805; x=1791335605; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vlcl2f6ewwzrBjcQFC4aq+Z9uRrmySkT+V2ro3tMTk0=;
        b=Hxt/4mawJYjl3cUtn9/4R7/pV8adjVj12k9hjy/nnH3kQXwxnvrbhtrrbNqc1poZpb
         1Tzhhi9p4rXFC3xxUFBMy0uUxfjhvFvvmP7DZyzmiPizBhS8r6eRgdqJ8kNHrI9BGzzC
         a02FzqwsychuqMHWPuMtNyJWFEUNEch2TuuVGm3FCE6woHQkhp9hoQWyDJpp+GsgBuSZ
         jzqFekOhP3tADLohTxtC2faAtJDlm/hVProkACiQGREKJNQt56gZZ+OUFnGxnAn1hkTI
         ZRcGJXdwTQqbizXMkcBIVHBpsBRiYSB9C7RIQd//el2vZ0XyYMLiv/4NM56jtaqOlh8i
         E5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790730805; x=1791335605;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vlcl2f6ewwzrBjcQFC4aq+Z9uRrmySkT+V2ro3tMTk0=;
        b=0SY1PJR79ifEx0GV9Je+YqQPNUuHI0gGh3RU0aXbld7n6k7nQP7o5yRuEi7mol9LVd
         NU1YdPpuW5oefX6nr9qBY/1EmsLrB5RGSePFZX6of+C7NEwujDQKg2U2EWtDrKjoYwT4
         Yq1JoLRzVAXeE9A5Fa0tPCXsD35R4E9TyrpRFFl/6v/feWGr9f5EPwka0lX+9Z7KgKHj
         Nf1AuxzZTNf4GFHc/3zSJ5FqHnJT3HcXLQMlyzE8Wno6U6E9cG/wGMnXzWKV3wCoJlKa
         Kkksjq/n195WHyMjLxj555vjwPVxpddCozLBLVWqHJHb0f/na0qGU7avCYDVBwnQHtEa
         D21g==
X-Forwarded-Encrypted: i=1; AKwUvBx+VbqQSuFvEXzELFY7NwPCvyxBPc4/4/ltBe8REWoka9+BlWLMTTPExKLjOYYeFt6ufGh+h73Cqg1+uO0=@vger.kernel.org
X-Gm-Message-State: AFq9FYImt2nGusitmPsLtsjHl68VRmMV5OdMIEnyyU4a7hd2eU+DJl9u
	RAOEGzGbd2/fmfwCTgLLHumjRYCss5tJ2StaF/oa1DhnU5fvvKqPtbp5XUE6sy9mE/KNQ1cZfWg
	ftR6KnA==
X-Received: from pldu15.prod.google.com ([2002:a17:903:108f:b0:2e1:2a71:d15b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:37cd:b0:2e2:de62:2b22
 with SMTP id d9443c01a7336-2e2de622b87mr6202935ad.49.1790730804937; Tue, 29
 Sep 2026 18:13:24 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 29 Sep 2026 18:13:09 -0700
In-Reply-To: <20260930011313.3197688-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930011313.3197688-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930011313.3197688-9-seanjc@google.com>
Subject: [PATCH v5 08/12] KVM: nSVM: Disable LBRV in nested control cache when unsupported
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Shivansh Dhiman <shivansh.dhiman@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

From: Shivansh Dhiman <shivansh.dhiman@amd.com>

Clear SVM_MISC2_ENABLE_V_LBR in __nested_copy_vmcb_control_to_cache() when
the vCPU does not support LBR Virtualization. This lets the cached value be
consumed directly instead of re-checking X86_FEATURE_LBRV on every access.

Suggested-by: Yosry Ahmed <yosry@kernel.org>
Signed-off-by: Shivansh Dhiman <shivansh.dhiman@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/nested.c | 8 +++++---
 arch/x86/kvm/svm/svm.c    | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index b61149814acc..aca2bbc66f47 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -527,12 +527,16 @@ void __nested_copy_vmcb_control_to_cache(struct kvm_vcpu *vcpu,
 
 	/* Always clear misc_ctl bits that the guest cannot use */
 	to->misc_ctl = from->misc_ctl;
+	to->misc_ctl2 = from->misc_ctl2;
 	if (!guest_cpu_cap_has(vcpu, X86_FEATURE_NPT))
 		to->misc_ctl &= ~SVM_MISC_ENABLE_NP;
 
 	if (!gmet_enabled || !guest_cpu_cap_has(vcpu, X86_FEATURE_GMET))
 		to->misc_ctl &= ~SVM_MISC_ENABLE_GMET;
 
+	if (!guest_cpu_cap_has(vcpu, X86_FEATURE_LBRV))
+		to->misc_ctl2 &= ~SVM_MISC2_ENABLE_V_LBR;
+
 	to->iopm_base_pa        = from->iopm_base_pa & PAGE_MASK;
 	to->msrpm_base_pa       = from->msrpm_base_pa & PAGE_MASK;
 	to->tsc_offset          = from->tsc_offset;
@@ -550,7 +554,6 @@ void __nested_copy_vmcb_control_to_cache(struct kvm_vcpu *vcpu,
 	to->event_inj_err       = from->event_inj_err;
 	to->next_rip            = from->next_rip;
 	to->nested_cr3          = from->nested_cr3;
-	to->misc_ctl2		= from->misc_ctl2;
 	to->pause_filter_count  = from->pause_filter_count;
 	to->pause_filter_thresh = from->pause_filter_thresh;
 
@@ -737,8 +740,7 @@ static int nested_svm_load_cr3(struct kvm_vcpu *vcpu, unsigned long cr3,
 
 static bool nested_vmcb12_has_lbrv(struct kvm_vcpu *vcpu)
 {
-	return guest_cpu_cap_has(vcpu, X86_FEATURE_LBRV) &&
-		(to_svm(vcpu)->nested.ctl.misc_ctl2 & SVM_MISC2_ENABLE_V_LBR);
+	return to_svm(vcpu)->nested.ctl.misc_ctl2 & SVM_MISC2_ENABLE_V_LBR;
 }
 
 static void nested_vmcb02_prepare_save(struct vcpu_svm *svm)
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 775eccfb7b24..5253c0143666 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -882,7 +882,7 @@ static bool svm_need_lbr_virtualization(struct kvm_vcpu *vcpu)
 	if (svm->vmcb->save.dbgctl & DEBUGCTLMSR_LBR)
 		return true;
 
-	return is_guest_mode(vcpu) && guest_cpu_cap_has(vcpu, X86_FEATURE_LBRV) &&
+	return is_guest_mode(vcpu) &&
 	       (svm->nested.ctl.misc_ctl2 & SVM_MISC2_ENABLE_V_LBR);
 }
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

