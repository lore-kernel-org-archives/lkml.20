Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792708259;
	b=dBqH4orucmZmuvJRAfNdNQJUHaYtIQH3RQUEguWdbD+PDA4cISq1FO+t0uWB3h//4Ncf
	 DwNfCtx6TvmExDeIP1EM3xjTZMQEtt4mR9bhj1lLEAO3Pm1Tmf9Rw4f8zjrjGmWESpltF
	 tgpMroQ3ROKdSvp0N7J7USNnUnPmyC/nbjl55lMthT+6nB7vreWMFn91+gl6T3eLUIopE
	 NpNIWRZCduthCzoe5zjPxlmkmARaD6+0OiwNQuQ/Xc658ZMeR296YbJ2vT3Kd6h5lh0ez
	 i3yBlwZK1csivAHekyw7hOjADxYtcp+dDueNWVhBunwods25xQ/hl3AnrfVYB3H7unA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792708259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=V5Z5GxAUSxf95HmfpK3F+lfXYV/+28XPGEi30XXC9Mw=;
	b=unh+s/nUXtT0U7uhWQZkkiDZzwEWZ3mc6tS7q1xFPG2wJ0yaMJVJyUBHzlcRFsrVUqQb
	 yvHlBv0UczDI/FMeokzNcAscvS8KF+hEHy9kB9qYAllKi45Ic8iRUSMs9V+mJ1UppIKiq
	 DKXCQyDjtRUdD7adq2GGiFhbAaGNXE/hHZ/D0Q2bG37O0mw2VxGoMmCnELFpgIB56PFPQ
	 4D9EcBPzS0Ui0MRzdwe8jmQjEG1cprRWxNPnVhEYR/9UMUFhXy2pE9nMWLK5nFpFKn8lc
	 O+jkPTI5lPcxN808Kf0wwoo24Szt93cMPWM8iD1nTGwO/PQSM6AS+tUYJYhyzJBtbEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=fbGvWp+e;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F39760A2604
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:30:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F39760A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=fbGvWp+e
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso236965a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792708259; x=1793313059; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=V5Z5GxAUSxf95HmfpK3F+lfXYV/+28XPGEi30XXC9Mw=;
        b=fbGvWp+e87THwE5KAq/nPprRW5bgWFjkiUJCeyGn78VM/REnztIrWsLlbWcjVn8SYa
         jXJahVUOmFtXIPM+J7yXemsew6L38nwLXVb68V1F2J/iG56MAoIo2QawftjGojZ5O4al
         FGd/+M4qdPi+99jh3d72wprBigd/qIWy6hcAmL9MbRfC4gNbyELuYyEYYbl301E9PRiL
         uthbOWcETfFueGDiUx461gyF4Z8w5FbIxmgP6cg1zsvh2HuzZWRm0B1oDtwekmRiQ4nk
         TwvJRNkQ2HEEf+1sL7oAC9UaBdwr5Rny009nBhsInwjF57q0SPNcgay6Zs30iyCNnx6g
         rUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792708259; x=1793313059;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V5Z5GxAUSxf95HmfpK3F+lfXYV/+28XPGEi30XXC9Mw=;
        b=PzYbZty9hn12iAS82skvFgiI4o+vTkIygQWB4pGjTib9FuojYaH0TeYp1igsR4eD2X
         gKct48yqR4Td7Og44SkDQJ74zbCZHyoUYfuFWcfvVuDBswu6CH4+qGD6EneHvK77xF2b
         4R6kaCU0hhPUnQj/DELvy6CYucFcrM+6c0Mad1jRwlbfOtEcvZJEQ+VEKXeeLm1g70VZ
         cYiHG9Oj8vpvsWWtnrIMziul6k94gtcgQoCpx/f+0acDSjFz37diYc5PG4tBWcvCUnW0
         gv5VXR1Wb29noBduQFgzjjs/n0QFHC62rRZ99EtrKCdaChgy9+CHJBZedlfS5DH/FCD2
         NBMg==
X-Forwarded-Encrypted: i=1; AKwUvBxodSuWRSObrTrZajWiDZcLMS9U96EBTjLXOZUGEa8KRt+MukxZc9FTOwImhRhQPwPv4k2vsUWtieGyKZ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzw7m9BkmEOcaUXRfgbL4lPqcv92UKPtXPwe8l/TMsyvTBqoE4
	TdYWRf5RlQuZ1GagNfjmOx+p9U6XGXtfanEHDzZRT5FLT5YRWgkZSSpx9R20Rd2mrgFAFhX0Z+b
	L+IJ3HQ==
X-Received: from pjor7.prod.google.com ([2002:a17:90a:9407:b0:3ad:8673:d3c9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:224a:b0:3ab:9f89:e1b3
 with SMTP id 98e67ed59e1d1-3adce08500dmr242140a91.40.1792708258533; Thu, 22
 Oct 2026 15:30:58 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 Oct 2026 15:30:52 -0700
In-Reply-To: <20261022223052.646891-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022223052.646891-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022223052.646891-5-seanjc@google.com>
Subject: [PATCH 4/4] KVM: selftests: Update nSVM EFER test to expect #GP when
 clearing SVME in L2
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Adjust the nSVM EFER test to expect a #GP on WRMSR if L2 attempts to clear
EFER.SVME to match KVM's new behavior (synthesizing #GP is safer for KVM as
it doesn't require yanking the vCPU out of L2, and is fully synchronous).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/x86/svm_nested_efer_test.c  | 65 +++++++++++--------
 1 file changed, 37 insertions(+), 28 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/svm_nested_efer_test.c b/tools/testing/selftests/kvm/x86/svm_nested_efer_test.c
index fa0d76a9c390..f612146d23ac 100644
--- a/tools/testing/selftests/kvm/x86/svm_nested_efer_test.c
+++ b/tools/testing/selftests/kvm/x86/svm_nested_efer_test.c
@@ -15,13 +15,18 @@ static bool l2_ran;
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
+		       "Expected #GP when clearing EFER.LME in L2, got %s",
+		       ex_str(vector));
+
+	l2_ran = true;
+	vmmcall();
 }
 
 static void l1_clear_efer_svme(struct svm_test_data *svm)
@@ -29,8 +34,7 @@ static void l1_clear_efer_svme(struct svm_test_data *svm)
 	generic_svm_setup(svm, l2_clear_efer_svme);
 	run_guest(svm->vmcb, svm->vmcb_gpa);
 
-	/* Unreachable, L1 should be shutdown */
-	GUEST_ASSERT(0);
+	GUEST_DONE();
 }
 
 static void l2_lmsle(void)
@@ -130,31 +134,10 @@ static void test_enumeration(void)
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
 
@@ -166,6 +149,32 @@ static void test_lmsle(bool lmsle_mbz)
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
@@ -248,7 +257,7 @@ int main(int argc, char *argv[])
 		test_clear_efer_svme();
 		test_lmsle(true);
 	} else {
-		ksft_test_result_skip("L2 clearing EFER.SVME shuts down L1\n");
+		ksft_test_result_skip("L2 clearing EFER.SVME gets #GP\n");
 		ksft_test_result_skip("Guest EFER_LMSLE_MBZ=1\n");
 	}
 
-- 
2.56.0.257.gf7497c7d27-goog

