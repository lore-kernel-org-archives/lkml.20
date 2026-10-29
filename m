Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305713;
	b=29Lk3+Wy2UcarQSs2hxG7SYdZMyKWmNva8LNoP6jNTLNar3Q0FlLvE2fmzgt7VXh0V99
	 qJ0+iJTT4Y6Xm1MEXw1szjn1FhibDnejmPDkoOMwct2iCYhRwy4eeCAaEN1qdtLkLP7vV
	 zePMVOtFrUK+0551iDD5gh5f7IzLcK9E2jcKafmP4lEMTeF9Klo/taqlVqI9kBN7iK9so
	 DgcYqOF60Davb5Lq2pJFbockx2tb9OLnu3rl6lU2vBxnzr3NtC9elzyfIR4MmJkTAgAYo
	 wqm0TMzbPoKnmocP01KKVF3AnpstnyM7I+c7PxG7es3eohIvECMCLh5Z3JYQjkeZcSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=WBQG1kRzc1MG3XyfIpGKUQ/5qovhNNIvq9ssmN1H3QY=;
	b=QlZRD2n548pquYxNqKc/1UlMfC46HGWnZf8YI+qzKOBJBOJ81vfb5PmsaB++odbGDrF1
	 kY6JiVs+2mepVPo0/R5zR7i4WrsiM4ph3YEVqCA65Ju03wotHsReSlUmF29Lrj1ZzTCI3
	 UFB9GRcnNdljkdHq/Dr9yIR/LcRdE5HrBnw87mrsFmv99nNYYef0aD03rT8fNWmBgnjLh
	 fHbfvKyPeEap2WweFQ7W0ztNru+MHRUhm5pKWEbjXe6wozC8uSyFqwAp+6hK7iw0w+5PZ
	 +ZK+M0CILPJ6VTRKad0Us1U4S1bsm0ui0c0ueFxlp7IAlqAb1hD6tzUiloVR6i/1mOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c4FUsAGn;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9919606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9919606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c4FUsAGn
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ade5b3ae97so25971a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793305712; x=1793910512; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WBQG1kRzc1MG3XyfIpGKUQ/5qovhNNIvq9ssmN1H3QY=;
        b=c4FUsAGnHwdyBbmSxKfn1V+GDfbct7dDqX1pYZ+xmL+18MJyNwBOxrEInEDnp1Yx40
         bnO6TFNacAcTcu63vsOaYuE/KWTWoDJVBxLjVF/vgfj9lfjXvzXTNraT3nCTloMXnKeo
         KlW6xRjgF4qa0LA3vp/GN/wci4jfxFXc9K9yaGqvf07ZzDoIMvMWjz4q4PVlNWJpYUZE
         mZVsKxcmDMuo4ZJBdLUZiwIRQ/EeCt/m+2C2JPyYkVnadoO0/leq5vmdAvZLhcKizH1A
         Qlzkrw0okdkfd9QbS1/zfhiYVHlLeToynqXXT8HuWd/gclTbiKsRzu+Citc/vCjCr6EI
         5pkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305712; x=1793910512;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WBQG1kRzc1MG3XyfIpGKUQ/5qovhNNIvq9ssmN1H3QY=;
        b=h0AyhNLmMdtUpk/G2Vu6rgAl0/tf/zepz5ayjN9y6q4LszgVoZ35UzIKWeYHI/NctU
         H1vMW4Oxp29B/N0PqGDqQLyCrE1LVExL1Lzul2uYAgAk/xNO1fVjmjbvUVgNKRv9VCy6
         Rs4c1srjHVIK/jux+aD1Urt+ZXENYpupe6D711hxxWs0raIt8BmLWF7iHXnGJi9vEZ58
         gSWhtNtLGN7/vyH2wuQvdjkcW0pcuFLUDk5rChI20d5uguN1Dd+CHq9xhU4lYZuPlOgo
         eGRzYHqA40p3yQ9yRUk5s//CtGt9HPLTGoWR5H5Q696EQX3vpDPIx6frp0+tH4BH+kNi
         VQbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzK2ZeWuGkW7pFsRHMT+K6SL69xJscFcGkkZQtCJiSvbwrQYrz34LOvgXmkKNxeEnUcrowq5iga3tycgs=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8WeSpPwQJe7NGoU2rkTlnEmDZguLXl6S80/+ohjZGdozAFvtl
	YdGsGtfaSyY3mB0BwXm9ZKMwirkhWyngxOC0FaQaswbCZ5o74bfgNTwey7nQ52m64oQrH3/wPoN
	WcIqUQCYxQ2I0KA==
X-Received: from pjbpv16.prod.google.com ([2002:a17:90b:3c90:b0:3ac:a379:dc7c])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4a4d:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3ae89542f3dmr76140a91.3.1793305711476;
 Thu, 29 Oct 2026 13:28:31 -0700 (PDT)
Date: Thu, 29 Oct 2026 13:28:16 -0700
In-Reply-To: <20261029202817.901145-1-jmattson@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261029202817.901145-1-jmattson@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261029202817.901145-3-jmattson@google.com>
Subject: [PATCH 3/3] KVM: selftests: Add MSR_VM_CR tests to svm_msrs_test
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry@kernel.org>, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Add sub-tests to svm_msrs_test to verify KVM's emulation of guest and
host-initiated writes to MSR_VM_CR:

  - Writing reserved bits 63:5 faults with #GP(0) (or fails KVM_SET_MSRS)
    without modifying MSR_VM_CR.
  - Guest WRMSR setting SVMDIS while EFER.SVME=1 faults with #GP(0)
    without modifying MSR_VM_CR.
  - Guest WRMSR setting SVMDIS while EFER.SVME=0 succeeds, after which
    guest writes to LOCK and SVMDIS are silently ignored while bits 2:0
    remain writable.
  - Host-initiated writes via KVM_SET_MSRS can set any valid MSR_VM_CR
    bit regardless of EFER.SVME and can clear SVMDIS and LOCK.

Signed-off-by: Jim Mattson <jmattson@google.com>
---
 .../testing/selftests/kvm/x86/svm_msrs_test.c | 167 ++++++++++++++++--
 1 file changed, 153 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/svm_msrs_test.c b/tools/testing/selftests/kvm/x86/svm_msrs_test.c
index fa0d76a9c390..e1f386ee0e7e 100644
--- a/tools/testing/selftests/kvm/x86/svm_msrs_test.c
+++ b/tools/testing/selftests/kvm/x86/svm_msrs_test.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Tests for KVM's handling of EFER bits whose behavior is tied to nested SVM.
+ * Tests for KVM's handling of SVM MSRs (EFER and VM_CR).
  *
  * Copyright (C) 2026, Google LLC.
  */
@@ -33,6 +33,74 @@ static void l1_clear_efer_svme(struct svm_test_data *svm)
 	GUEST_ASSERT(0);
 }
 
+static void guest_wrmsr_vm_cr(u64 val, u64 expected_val, bool expect_gp)
+{
+	u8 expected_vec = expect_gp ? GP_VECTOR : 0;
+	u64 actual_val;
+	u8 vec;
+
+	vec = wrmsr_safe(MSR_VM_CR, val);
+	__GUEST_ASSERT(vec == expected_vec,
+		       "Wanted %s on WRMSR(MSR_VM_CR, 0x%lx), got %s",
+		       ex_str(expected_vec), val, ex_str(vec));
+
+	actual_val = rdmsr(MSR_VM_CR);
+	__GUEST_ASSERT(actual_val == expected_val,
+		       "Wanted MSR_VM_CR == 0x%lx after WRMSR(0x%lx), got 0x%lx",
+		       expected_val, val, actual_val);
+}
+
+static void guest_vm_cr(void)
+{
+	const u64 svme_valid_mask = SVM_VM_CR_VALID_MASK & ~SVM_VM_CR_SVM_DIS_MASK;
+	const u64 unlocked_mask = SVM_VM_CR_VALID_MASK &
+				  ~(SVM_VM_CR_SVM_LOCK_MASK | SVM_VM_CR_SVM_DIS_MASK);
+	u64 efer, val, expected = 0;
+	bool valid;
+	int bit;
+
+	GUEST_ASSERT_EQ(rdmsr(MSR_VM_CR), 0);
+
+	efer = rdmsr(MSR_EFER);
+	wrmsr(MSR_EFER, efer | EFER_SVME);
+
+	/*
+	 * With EFER.SVME=1, setting non-SVMDIS bits in MSR_VM_CR is allowed,
+	 * whereas setting SVMDIS or reserved bits must fault with #GP(0)
+	 * without modifying MSR_VM_CR.
+	 */
+	guest_wrmsr_vm_cr(SVM_VM_CR_VALID_MASK, 0, true);
+
+	for (bit = 0; bit < BITS_PER_LONG; bit++) {
+		val = BIT_ULL(bit);
+		valid = val & svme_valid_mask;
+		if (valid)
+			expected = val;
+
+		guest_wrmsr_vm_cr(val, expected, !valid);
+	}
+
+	/*
+	 * Verify that prior faulting attempts to set SVMDIS while EFER.SVME=1
+	 * did not latch SVMDIS and cause subsequent valid writes to fault.
+	 */
+	guest_wrmsr_vm_cr(0, 0, false);
+
+	/*
+	 * With EFER.SVME=0, setting SVMDIS succeeds.  Once set, guest writes
+	 * to LOCK and SVMDIS are silently ignored while bits 2:0 remain
+	 * writable.
+	 */
+	wrmsr(MSR_EFER, efer & ~EFER_SVME);
+
+	guest_wrmsr_vm_cr(SVM_VM_CR_SVM_DIS_MASK, SVM_VM_CR_SVM_DIS_MASK, false);
+	guest_wrmsr_vm_cr(svme_valid_mask,
+			  SVM_VM_CR_SVM_DIS_MASK | unlocked_mask, false);
+	guest_wrmsr_vm_cr(0, SVM_VM_CR_SVM_DIS_MASK, false);
+
+	GUEST_DONE();
+}
+
 static void l2_lmsle(void)
 {
 	GUEST_ASSERT(rdmsr(MSR_EFER) & EFER_LMSLE);
@@ -144,17 +212,10 @@ static void test_clear_efer_svme(void)
 	ksft_test_result_pass("L2 clearing EFER.SVME shuts down L1\n");
 }
 
-static void test_lmsle(bool lmsle_mbz)
+static void run_vcpu_to_done(struct kvm_vcpu *vcpu)
 {
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
 
@@ -166,6 +227,79 @@ static void test_lmsle(bool lmsle_mbz)
 	default:
 		TEST_FAIL("Unexpected ucall: %lu", uc.cmd);
 	}
+}
+
+static void test_vm_cr(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_vm_cr);
+
+	run_vcpu_to_done(vcpu);
+
+	kvm_vm_free(vm);
+	ksft_test_result_pass("Guest writes to MSR_VM_CR\n");
+}
+
+static void test_host_initiated_vm_cr(void)
+{
+	u64 efer, val, actual, expected = 0;
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	int bit, rc;
+	bool valid;
+
+	vm = vm_create_with_one_vcpu(&vcpu, NULL);
+
+	/*
+	 * Host-initiated writes must be able to set SVMDIS even when
+	 * EFER.SVME=1 (e.g. when restoring MSR_VM_CR before MSR_EFER), and
+	 * must be able to modify and clear SVMDIS and LOCK after SVMDIS has
+	 * been set.
+	 */
+	TEST_ASSERT_EQ(vcpu_get_msr(vcpu, MSR_VM_CR), 0);
+
+	efer = vcpu_get_msr(vcpu, MSR_EFER);
+	vcpu_set_msr(vcpu, MSR_EFER, efer | EFER_SVME);
+
+	for (bit = 0; bit < BITS_PER_LONG; bit++) {
+		val = BIT_ULL(bit);
+		valid = val & SVM_VM_CR_VALID_MASK;
+
+		rc = _vcpu_set_msr(vcpu, MSR_VM_CR, val);
+		TEST_ASSERT(valid ? rc == 1 : !rc,
+			    "Expected KVM_SET_MSRS(MSR_VM_CR, 0x%lx) to %s, got rc=%d",
+			    val, valid ? "succeed" : "fail", rc);
+		if (valid)
+			expected = val;
+		actual = vcpu_get_msr(vcpu, MSR_VM_CR);
+		TEST_ASSERT(actual == expected,
+			    "Wanted MSR_VM_CR == 0x%lx after KVM_SET_MSRS(0x%lx), got 0x%lx",
+			    expected, val, actual);
+	}
+
+	vcpu_set_msr(vcpu, MSR_VM_CR, SVM_VM_CR_VALID_MASK);
+	TEST_ASSERT_EQ(vcpu_get_msr(vcpu, MSR_VM_CR), SVM_VM_CR_VALID_MASK);
+
+	vcpu_set_msr(vcpu, MSR_VM_CR, 0);
+	TEST_ASSERT_EQ(vcpu_get_msr(vcpu, MSR_VM_CR), 0);
+
+	kvm_vm_free(vm);
+	ksft_test_result_pass("Host-initiated writes to MSR_VM_CR\n");
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
+	run_vcpu_to_done(vcpu);
 
 	kvm_vm_free(vm);
 	ksft_test_result_pass("Guest EFER_LMSLE_MBZ=%d\n", lmsle_mbz);
@@ -225,15 +359,16 @@ int main(int argc, char *argv[])
 	bool has_nested_svm, has_lmsle;
 
 	ksft_print_header();
-	ksft_set_plan(6);
+	ksft_set_plan(8);
 
 	test_enumeration();
 
 	/*
-	 * The sub-tests below need to actually run a nested guest, and the
-	 * EFER.LMSLE sub-tests additionally need KVM to allow EFER.LMSLE.
-	 * It's KVM's view of the world, not raw CPUID, that dictates whether
-	 * EFER.LMSLE is allowed, i.e. whether the defeature is emulated.
+	 * The sub-tests below need to actually run a nested guest or set
+	 * EFER.SVME, and the EFER.LMSLE sub-tests additionally need KVM to
+	 * allow EFER.LMSLE.  It's KVM's view of the world, not raw CPUID, that
+	 * dictates whether EFER.LMSLE is allowed, i.e. whether the defeature is
+	 * emulated.
 	 */
 	has_nested_svm = kvm_cpu_has(X86_FEATURE_SVM);
 	has_lmsle = has_nested_svm &&
@@ -246,9 +381,13 @@ int main(int argc, char *argv[])
 
 	if (has_nested_svm) {
 		test_clear_efer_svme();
+		test_vm_cr();
+		test_host_initiated_vm_cr();
 		test_lmsle(true);
 	} else {
 		ksft_test_result_skip("L2 clearing EFER.SVME shuts down L1\n");
+		ksft_test_result_skip("Guest writes to MSR_VM_CR\n");
+		ksft_test_result_skip("Host-initiated writes to MSR_VM_CR\n");
 		ksft_test_result_skip("Guest EFER_LMSLE_MBZ=1\n");
 	}
 
-- 
2.56.0.317.g454f8302e1-goog

