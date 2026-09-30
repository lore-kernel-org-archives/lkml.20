Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665085650F9
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789871; cv=none; b=P+BilCHWVZghU6kvIRuKwTkzAuwQcLC5CBF4MMOR/GX/+L7LmvXUFnCgzKKEDpRKf4QO2V8vmDrfZ42T7FypWZaCicHPhWwvDZwVPPdsQ/Vo6L4H85bDvQOqkVosAv/DdOF+f29Ahtspuh9Lpkpd7djpzvIPyulVBWhlZQoFVMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789871; c=relaxed/simple;
	bh=9r+OHm9DlFonvOVVhj/8E5FoBYwiO0EHG05zhxJhkAo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tcz5JPEiW/UIfguwv0Pg63HXsTElqq7AapXbr7zf3litTRo9rRpb9PCV+81LGKRfYBqpOQFE85dSTESQSDyxlt3ntzu82a0N7a/G4kf6MHS2l70ZBJv0nsJiMWcyKnptEpWnDndOUZYYWRaDEXLAJUOPrhwLBPWXxkN82rLy3Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HVzgNlEb; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HVzgNlEb"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1bbd7d6e6so3990236a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790789870; x=1791394670; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=823+cDqxF3fs1MYJJdK8snZdvCyqsxRsqXVEm3durZk=;
        b=HVzgNlEb1TMcBp3jrMk8aYbWyIUBHDv+IrSzacb5+FZUMS0qe/32e+qgeXqwgkt+qT
         YOc+c2B8CreVKV7QhMVg3QQ2wNozuX2zR1yxchDSmjhZlfvW+x0qVIG21zmxofVT4c15
         DuPvd7PEGis81TeQoFRcH4MiVC/k92xWGQt3alcXCMq7tr5G1XxKUD1090WDRkFwHDc/
         69jYD17xIysH8/DmDBaYy9gFjt+3U3yf3xYc5iLI8YfMsvNV0se7mdeonAzH97oOVQGo
         f5Dq8wuJyfCmIXbqQxFN0jkx7W34P3vfsk5t5MhESdE07pT2FpdgWMHOi0XfRxVqGkJI
         iMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790789870; x=1791394670;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=823+cDqxF3fs1MYJJdK8snZdvCyqsxRsqXVEm3durZk=;
        b=VvQYpjyFl9sitcJMmUC3UYhM5JlrvwHrLHS31X8f3YlCjmEq1rBTdDB1elNBzezCFX
         l9+t2QwYicfkjp51a5pStTC0vIPVJmQJd6br2VpIVx7YUS2jehWVrUpcM9Mf1UZvd3yy
         h+epJo1O+cgY9WXVgQ5PvRmztpK5Z6MYgA+db2b4zQFKtJajTv2wIw+rm8pseyH2GC64
         AgnVWFwPBzE3LtyN3yuV7y8kKcq+kuJ+BULyFpm/+3l+xkYkQvkipf1S3q1iUbIrG4+w
         +ysRpFrAL+Q/a9fKU1wvhDIQvktlDHbAzLNN8OiVPUrlbL9fkEXUGfxeIbHCCAh9FCRP
         EHCw==
X-Forwarded-Encrypted: i=1; AKwUvBwFce8PsmBuyFvzmQe68Hor8pe2tiir7ffhW2b/Wn27sAfVYCOeoToOtjfOl3U4lcNRFqTrVW/CwAibv6M=@vger.kernel.org
X-Gm-Message-State: AFuF++mzlgrwcDtvdoqhL1KKbhVyqSR4ukCZCeZok94PhTJpkvmXobfn
	OmE8Kd9oiwEjkCg7BFHxZ4QXIcmaFg2RmotDROa2xFKtomfrIFlojdCiE0UdP83rqy5NV8xehvO
	ZCRxIeA==
X-Received: from pgbds10.prod.google.com ([2002:a05:6a02:430a:b0:cc7:5d8d:bdcc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7d9f:b0:3de:7bad:a366
 with SMTP id adf61e73a8af0-3de9e70b1bamr2113842637.32.1790789869493; Wed, 30
 Sep 2026 10:37:49 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 30 Sep 2026 10:36:24 -0700
In-Reply-To: <20260930173635.3362655-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930173635.3362655-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930173635.3362655-11-seanjc@google.com>
Subject: [PATCH v3 10/21] KVM: selftests: Track L2 multiplier, not scale-up
 factor, in nested TSC test
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>, Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Track L2's multiplier, not just the non-fractional scale-up factor, so that
the nested TSC scaling test can also validate scaling L2's frequency *down*.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../kvm/x86/nested_tsc_scaling_test.c          | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c b/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
index d3208b57eafc..af85fd469ef4 100644
--- a/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
+++ b/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
@@ -16,8 +16,8 @@
 #include "svm_util.h"
 #include "kselftest.h"
 
-/* L2 is scaled up (from L1's perspective) by this factor */
-static u64 l2_scale_factor;
+/* L2's TSC multiplier, relative to L1. */
+static u64 l2_multiplier;
 
 #define TSC_OFFSET_L2 ((u64)-33125236320908)
 
@@ -80,7 +80,7 @@ static void l1_svm_code(struct svm_test_data *svm)
 	generic_svm_setup(svm, l2_guest_code);
 
 	/* enable TSC scaling for L2 */
-	wrmsr(MSR_AMD64_TSC_RATIO, l2_scale_factor << 32);
+	wrmsr(MSR_AMD64_TSC_RATIO, l2_multiplier);
 
 	/* launch L2 */
 	run_guest(svm->vmcb, svm->vmcb_gpa);
@@ -115,7 +115,7 @@ static void l1_vmx_code(struct vmx_pages *vmx_pages)
 	vmwrite(SECONDARY_VM_EXEC_CONTROL, control);
 
 	vmwrite(TSC_OFFSET, TSC_OFFSET_L2);
-	vmwrite(TSC_MULTIPLIER, l2_scale_factor << 48);
+	vmwrite(TSC_MULTIPLIER, l2_multiplier);
 
 	/* launch L2 */
 	vmlaunch();
@@ -135,20 +135,22 @@ static void l1_guest_code(void *data)
 		l1_svm_code(data);
 }
 
-static void test_tsc_scaling(u64 l0_tsc_freq, u64 l1_scale_factor, u64 l2_scale)
+static void test_tsc_scaling(u64 l0_tsc_freq, u64 l1_scale_factor, u64 l2_scale_factor)
 {
 	u64 tsc_khz, l1_tsc_freq, l2_tsc_freq;
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
 	gva_t guest_gva;
-
-	l2_scale_factor = l2_scale;
+	u8 frac_bits;
 
 	printf("L1's scale down factor is: %lu\n", l1_scale_factor);
 	printf("L2's scale up factor is: %lu\n", l2_scale_factor);
 
+	frac_bits = kvm_cpu_has(X86_FEATURE_VMX) ? 48 : 32;
+	l2_multiplier = l2_scale_factor << frac_bits;
+
 	vm = vm_create_with_one_vcpu(&vcpu, l1_guest_code);
-	sync_global_to_guest(vm, l2_scale_factor);
+	sync_global_to_guest(vm, l2_multiplier);
 
 	if (kvm_cpu_has(X86_FEATURE_VMX))
 		vcpu_alloc_vmx(vm, &guest_gva);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

