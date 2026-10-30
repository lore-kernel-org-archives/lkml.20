Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395651;
	b=WR11/OYNA/PI7FWrgSl8cPm6n7lOGNz85nUHwD/4pcWieiHSAdD0tV4R7CwqUC/rG/XV
	 +SxZ+soE71R3IgAc9TbYffDkRlIjCoTz6pWJdveotwR0Kapo5UVLrkdh4alhGJnRTKGR9
	 2L43abdjS+m0DkAN51KiJumFPe++o2ezIR+cAqYfRgvZNvsLOtmkvo/S/0a4iMiW0Vit3
	 f8ohviAMflYT6MaJO+wO5qsF0gRaPx15sKQeBYTIG6hNAHH2Gf0v/76P/aajk616bb+gU
	 zcE7PuxGxxTACbFHwVM1IhF5LGhU1wK4OeAP+GvCBOty+AV/QX+U/JnoZljuHwaFC3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=66IqIrBfwo5WMPMLokb6YoWU0Hm+wJ3Nk517lP1OQNE=;
	b=KnYwfBDvnYtmKfdGGpLNhTHWL6LNxUHYzQ+h3dbB8u3y4mZ/P6AtcVEhJufw3yYmmAik
	 /wGZ6KUXjUU6l8tymIjD0cGoTit5K8p3tylAiTcuRnbBDGLPLt0rQnnFdTE2wHUzy7112
	 kCKZnbAi2qnrVA5IxkMyInVX0go1A0tI82Ko7n1G6eQFv6ELDw6hhNeQJkj5RxaFY9pjz
	 sZLwRRAyGf2KRI8zindksoOvJ2Uvuk8RnzLW+28wMhFV7E7UJsyxSIxM2uQsDBkFzEUkQ
	 a9sJ2yLZx+b+qi/iFliPdPXPXNTdz5h2bed09cBDgw2cXxpSNRzYH+nM+8nYaxTrUmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AcOiyo5E;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B2B60A3820
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16B2B60A3820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AcOiyo5E
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e601800e58so19399455ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793395650; x=1794000450; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=66IqIrBfwo5WMPMLokb6YoWU0Hm+wJ3Nk517lP1OQNE=;
        b=AcOiyo5E9GkGygu5mXE/IeoqsoH6A8VY6sZhz/zIkUrUjYXZaaL7yp0fC3tPKcxJhW
         b9EuNKu2AVIj14VLN760JdUSdDqc0cF8q8m0SbdgDN5h/mDW3RqQgfyw/h+/w150IiPt
         spBBFi28XM81xa4ow9z4/Avl55Txeu4gQymxeIfwl4eT0BM1UEhAD8KVYCTfvebccvv6
         M8/2bYyAcejRG6zy/OOXYGoBO+Qw/lr4X2q57fVcABS5NlmItLkoj9sNavnkJzDhx5U7
         P6GZxdvSACfITho8tiIOtqUe+WzUbzUYixF4MJt3B/48ArDXoM1mlTYCeocLkizT/dIU
         Bq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395650; x=1794000450;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=66IqIrBfwo5WMPMLokb6YoWU0Hm+wJ3Nk517lP1OQNE=;
        b=b3842J1ETP0J9EDlXAWeRH3PowM+d3YkbzcWDzW+8tS9gZHmMam4IU+z+o+O0qvSpL
         xDcSNGgGsoIWgejh4dLXOj+W+gvQpHKRKccAFfjBG1OgEDQ7EtfZMO6WW8g3xFwYEPF4
         pIHXjLquD3645UvMRmxE6Rx/lNFW4gX5khyCkEOVD2uRMomzDGXGNeGdMFDFMvkf1YbD
         +Ug+9gXfHa+gmKMJSf1ZaZowR2kuBAk9lI8tN2Vw3aoMzjFiTrxPmFlVfoNZJlorXUJh
         y5K2zLi1NdR65uLTh0nmMQonndetywBjq0VcynMHDNkFy0KyIkS0XvIO1H52GtoKQQpt
         W/Cg==
X-Forwarded-Encrypted: i=1; AKwUvBw0hs//RvCNBaoyz1tiDLFLlp7eFLipgOG/O/uTanoFfSIETks5Su8tfyO1Yqgzi/g+9QvC8AsWnrOu+Oc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRMuefwG0nWqs3Fq6aXDlpguyW/WvA/ONht4Bf+/G0kXyFXucK
	aA0bZ/5dMADegqS3Wn6w1RT07UOaqzpSQQu/7G/WA0iEncwdWeKVWjgdoa5e+H1XkG5wUja4E7M
	elRniCA==
X-Received: from plgk3.prod.google.com ([2002:a17:902:ce03:b0:2ea:775d:de30])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:f87:b0:2e9:5507:b532
 with SMTP id d9443c01a7336-2eb364f650fmr33677365ad.43.1793395650059; Fri, 30
 Oct 2026 14:27:30 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 30 Oct 2026 14:27:20 -0700
In-Reply-To: <20261030212721.2606393-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030212721.2606393-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261030212721.2606393-7-seanjc@google.com>
Subject: [PATCH v3 6/7] KVM: selftests: Update nSVM EFER test to expect #GP
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
2.56.0.385.gac671c819a-goog

