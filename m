Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793141366;
	b=0eylSlmVhalBa1EXcQ072CNmR0rYUIra+JfiRoH2Y1Acji4UCfq73pqRXuwV61PU4MoQ
	 jCaKz7LLyBmZBXxWrYADI/PTeckFPd714iLgWv4oggEEIrYOp2njfct5fvn9J+L3OdjIx
	 7fi/TiZ5YVbgjTkXjuYia7L06uRruobaHBYvHy0ScPUmfjphAEWoRzn+PSc8sIQSdB0/a
	 OklRji+IbqhFgQL2aZ1dB1gXTiJ/pjz6AoWT6eDuml7lgdzNec8PnnQ36A2ofZQTWsADM
	 ccZb25bEDQTFFbkeHpeCqUeiPINyD0i6J+as6uwTMuyDN15D/fDthNe1Whiriwd2GHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793141366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=rOkPtWVSW1j6H8I5rspLbvj2xB0DWyNEyqjlPetgUS4=;
	b=wfUAe19kAQxb7XaLuyz6C7fG/7RxYylKvQZKUIW3eoU2KkBSsp9qyyVEhGjVKLP00Me2
	 Bb1h6iHkZosWG0IsDo3vVm/g5OkW9/7VwqOrZpHBVrebgfEo/F7EUxx1PjxG3uIj67rgp
	 0nxvd1GQLiy6YreQaUVtgVF5km/7jQgZ9TMBvKzrHe0DyGVmKDO6yj24c3JaqZqWl7h9M
	 Xgj+IIE8RCDu2g70EmsGhIcFHqQRAOPDkZdXs3WudP4nAEfdaGuKQlV2Ekiuk/wQdv43s
	 q2ht2o8Y9TYzpzaxOnLagBPok/PXRjhxB3pvq0nZhtz+CpfgnZrmE8XTPXIt3OLFZ7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WzBfKbeY;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473E5606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:49:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 473E5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WzBfKbeY
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a06bc723b1so467248b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793141365; x=1793746165; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rOkPtWVSW1j6H8I5rspLbvj2xB0DWyNEyqjlPetgUS4=;
        b=WzBfKbeYUwp2lyqoF/22fnY+zuNeV3VaEdioF0xmAIh1o5jOly3KZ+7TXiNluEJRS1
         IKypoKVfHjjxDZBui6+mbi5N/6Y5MvKubKV5UhPTsRhnM4APCkrAHHU2jtf3SMohRy4P
         OB1opReImQhwYHHr+XhoJdbQ9kXwTQ2ZBxuPTxIB7aEmT+Uq3kpewq9AdLfgpIvWacXK
         aYrdTxt2KB2gLE0XgY87in0ILdSB9lDKmw4TKcMnkNrixNL20/KoKlq5GXFF6MRg554d
         bJ0cl8ers+Vnc4U3VHZQiDskDfcb3BwUELyZen+mdiTGfQ8OAWVL1OdDC/QjP+V7KwFt
         JAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793141365; x=1793746165;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rOkPtWVSW1j6H8I5rspLbvj2xB0DWyNEyqjlPetgUS4=;
        b=BT+1QzDnE6V2rAxqz0QIpA3oDgvGLKa6XtdzVJEWOy/lbLvQFMHVZ8xMyMqyLlSzcM
         OV2cd0i4piyluYIr3wyhK0FiZtxrZoxNMR9Isxe2x77CRbLFVhKZ03CiGpSjZnSoPatx
         MCmumROAylBq4H4i2G7LveOYJ62xsLrWEO3z+1h0hH9DPzTAvlkYkLDbmmh/yGQjQyiB
         1UAdFIPPqfelL1ajKVOTNlwQs8TSgomKadNYji2AGCUv/TqN7aytoDDx/OPL1Q1BpZgm
         WRllOo/42I6Wi0h/VD+YJwHq7f/45fC/zy9rSTXNxOae4oJUR/7m8YpF8qxFRMLZqCeL
         DfZA==
X-Forwarded-Encrypted: i=1; AKwUvBxJDCTpufmZFIsBT/dtGFQu/FQK9HrYfifuUDahZ20MAis511OD6YXupAuGKeMnvt+mcanrlDsAOndlMxI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/QGOz5ojCMxOR0RfWu9Jp135Qs+yKSAniL2lgLx6Mf4eGPj/L
	995Yau19DGGXg71gaX5pjGU9uw1M9HTaG2FfsXBiO33qJodXVGnT9bx4nGnvBFUi/G5kPrqSt63
	LnCe8Jg==
X-Received: from pfff18.prod.google.com ([2002:a05:6a00:bd12:b0:8a2:1bc3:8884])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4085:b0:89f:c71e:aba5
 with SMTP id d2e1a72fcca58-8a6e74d735dmr516308b3a.37.1793141365470; Tue, 27
 Oct 2026 15:49:25 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 27 Oct 2026 15:49:13 -0700
In-Reply-To: <20261027224914.1574319-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261027224914.1574319-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261027224914.1574319-6-seanjc@google.com>
Subject: [PATCH v2 5/6] KVM: selftests: Update nSVM EFER test to expect #GP
 when clearing SVME in L2
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Adjust the nSVM EFER test to expect a #GP on WRMSR if L2 attempts to clear
EFER.SVME to match KVM's new behavior (synthesizing #GP is safer for KVM as
it doesn't require yanking the vCPU out of L2, and is fully synchronous).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/x86/svm_nested_efer_test.c  | 75 ++++++++++++-------
 1 file changed, 46 insertions(+), 29 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/svm_nested_efer_test.c b/tools/testing/selftests/kvm/x86/svm_nested_efer_test.c
index fa0d76a9c390..fa9cfe8b1242 100644
--- a/tools/testing/selftests/kvm/x86/svm_nested_efer_test.c
+++ b/tools/testing/selftests/kvm/x86/svm_nested_efer_test.c
@@ -15,22 +15,34 @@ static bool l2_ran;
 static void l2_clear_efer_svme(void)
 {
 	u64 efer = rdmsr(MSR_EFER);
+	u8 vector;
 
 	/* generic_svm_setup() initializes EFER_SVME set for L2 */
 	GUEST_ASSERT(efer & EFER_SVME);
-	wrmsr(MSR_EFER, efer & ~EFER_SVME);
 
-	/* Unreachable, L1 should be shutdown */
-	GUEST_ASSERT(0);
+	vector = wrmsr_safe(MSR_EFER, efer & ~EFER_SVME);
+	__GUEST_ASSERT(vector == GP_VECTOR,
+		       "Expected #GP when clearing EFER.SVME in L2, got %s",
+		       ex_str(vector));
+
+	efer = rdmsr(MSR_EFER);
+	GUEST_ASSERT(efer & EFER_SVME);
+
+	l2_ran = true;
+	vmmcall();
 }
 
 static void l1_clear_efer_svme(struct svm_test_data *svm)
 {
+	struct vmcb *vmcb = svm->vmcb;
+
 	generic_svm_setup(svm, l2_clear_efer_svme);
-	run_guest(svm->vmcb, svm->vmcb_gpa);
+	run_guest(vmcb, svm->vmcb_gpa);
 
-	/* Unreachable, L1 should be shutdown */
-	GUEST_ASSERT(0);
+	GUEST_ASSERT_EQ(vmcb->control.exit_code, SVM_EXIT_VMMCALL);
+	GUEST_ASSERT(l2_ran);
+	GUEST_ASSERT(vmcb->save.efer & EFER_SVME);
+	GUEST_DONE();
 }
 
 static void l2_lmsle(void)
@@ -130,31 +142,10 @@ static void test_enumeration(void)
 	ksft_test_result_pass("KVM enumerates EFER_LMSLE_MBZ=%d\n", lmsle_mbz);
 }
 
-static void test_clear_efer_svme(void)
+static void test_efer_in_guest(struct kvm_vcpu *vcpu)
 {
-	struct kvm_vcpu *vcpu;
-	struct kvm_vm *vm;
-
-	vcpu = create_l1_vcpu(&vm, l1_clear_efer_svme);
-
-	vcpu_run(vcpu);
-	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_SHUTDOWN);
-
-	kvm_vm_free(vm);
-	ksft_test_result_pass("L2 clearing EFER.SVME shuts down L1\n");
-}
-
-static void test_lmsle(bool lmsle_mbz)
-{
-	struct kvm_vcpu *vcpu;
-	struct kvm_vm *vm;
 	struct ucall uc;
 
-	vcpu = create_l1_vcpu(&vm, l1_lmsle);
-
-	vcpu_set_or_clear_cpuid_feature(vcpu, X86_FEATURE_EFER_LMSLE_MBZ,
-					lmsle_mbz);
-
 	vcpu_run(vcpu);
 	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
 
@@ -166,6 +157,32 @@ static void test_lmsle(bool lmsle_mbz)
 	default:
 		TEST_FAIL("Unexpected ucall: %lu", uc.cmd);
 	}
+}
+
+static void test_clear_efer_svme(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+
+	vcpu = create_l1_vcpu(&vm, l1_clear_efer_svme);
+
+	test_efer_in_guest(vcpu);
+
+	kvm_vm_free(vm);
+	ksft_test_result_pass("L2 clearing EFER.SVME gets #GP\n");
+}
+
+static void test_lmsle(bool lmsle_mbz)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+
+	vcpu = create_l1_vcpu(&vm, l1_lmsle);
+
+	vcpu_set_or_clear_cpuid_feature(vcpu, X86_FEATURE_EFER_LMSLE_MBZ,
+					lmsle_mbz);
+
+	test_efer_in_guest(vcpu);
 
 	kvm_vm_free(vm);
 	ksft_test_result_pass("Guest EFER_LMSLE_MBZ=%d\n", lmsle_mbz);
@@ -248,7 +265,7 @@ int main(int argc, char *argv[])
 		test_clear_efer_svme();
 		test_lmsle(true);
 	} else {
-		ksft_test_result_skip("L2 clearing EFER.SVME shuts down L1\n");
+		ksft_test_result_skip("L2 clearing EFER.SVME gets #GP\n");
 		ksft_test_result_skip("Guest EFER_LMSLE_MBZ=1\n");
 	}
 
-- 
2.56.0.307.g5fe7bd680c-goog

