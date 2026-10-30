Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395653;
	b=Mrj94Th7g+lNNwCX6Y6eqQCd1piTwIwbND0KLpK9fvDYeJVQkdTt7uaNfcbQk/Auy08r
	 ASI67q6E+c0MXzICwEW7pMpb6L85uKtQp+4y0sWPGPT6l+MqR+04LMg2icKTF1qyp7H1X
	 sx8F96D23Z+kfd1mbcId5bGGsrVU9zE5aprXMoohjBaejLmpJxHXPEInpqAWStZdt0e1r
	 FnpuLICA2bXde4NrG09f+XpxJU37tijShjIwHtXPADbYX54NzS9pMYabLQSo3LaYnCI8r
	 JhnHsxQ4ANY5wSuCwDcMFxg06T5JJ2qXCxQq1pQzoksBCXGAT1hTTd0Bx+EtdDSxeEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=HeDTQ03pI5t02YnngoAj9iApBg9D2x8DKS/xIEI0dis=;
	b=HPfCDLWnBaTE0U47/Pl4hqE1FcqON0v7lR9Vk9ySu5gVo6nv/NFESyruq6W/MkNKvtZ/
	 kPUFybGAqW4/l1jBlVMle8athx7h9SsWfgJuJepm9Wlb9Af8haXRuwrRbU9v0dcJh7ueH
	 T1f8eNtFjfSylAgzHC1GaC2H7aeZgc1VvljyoO4qHlkLrW1gZPnygrSV/Z/YSEPb6mcBf
	 Ws+94gGVOaZq/9bRKvqzsL7Z7uJesebmOCbSRMC62VBHZR482djp1bIMK1t7CYCzdP++T
	 byoOt5AI2cSDT0Elcpy5bTrbAxX+1RnZLO/ASn6/1N1P+5aom+Pm9tnhQV2P5Qwv9QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m3+iuEkv;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A525606A331
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:27:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A525606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m3+iuEkv
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e95f8543c9so11774985ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793395651; x=1794000451; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HeDTQ03pI5t02YnngoAj9iApBg9D2x8DKS/xIEI0dis=;
        b=m3+iuEkvRngL6Ssph6agCysmDZ/gsyVxX3IkknmEjbuUZ9rL9LAHROMU4wHbqMAcPg
         7QmmBnGzrVI6uMSPfV5DG2IluYml5Di8rNshxd/GaRRdBL+Wkql6op2bffUBp1gKvYIW
         vr5yFpFhcejrZ9aWzZq7pcUxJG8MRtDzuGQjnuA2I8Eik9DCyiwAUoiXagYPRedE5e+v
         N5Z3pufLLr/6VnIOY4+uaxapXkWwXZ44ykAGzGCA9dK2nMgrk15aYXtj/77ifuLg28Pj
         J17Q/sl28d5CA/KMLPIG8V00C80A2Tz/ChE44bS6N7TvO0Qx7JXjfoNyVz3UiI9XiL7c
         DC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395652; x=1794000452;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HeDTQ03pI5t02YnngoAj9iApBg9D2x8DKS/xIEI0dis=;
        b=0o/7Y1x/E+00gxmrFicQzff1wNhle+ModNX8+V3sxKd7FetayUcl7P4nzI/gxsYhRO
         PF0Nfg5C3N5iJFxBs2AvCxWLF5QXcXC7xa/K1DG9AGAnHzD5rYJYLjwkotA70KuwRA82
         Nd2oDKX5mLwKCJgxdZ/OVDU3PJ340P2UkoZQR06jql3sXsgmmCEysZhCoTmRUnPxRx8b
         ExCaeeep6qMLMBuBV1rdB3BazOm5jTy18Pwb2eSJ3FHALZFLY2uKfXHnQc+3NdL78HVR
         YwUTDyTht0w/eKt2tmgPFFI1cNxicUvGrL/jXB7PTBFRH70gxgG5DJaMW6b0M3AKD151
         HzxA==
X-Forwarded-Encrypted: i=1; AKwUvBzqBhCV8B0qXRmMoGE36XsLtcwnN06yDX9KxHkm50iiZL2s8DkOG/QWLIj4ygKrDcv0PTX8heq+b6OUQ90=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJ9WJlEZclzxYRhntpC98UKXpPINjl4PKcblzcVzs78ZNgdX/4
	bvlDfxXbwDlymhTPx7dD405QXqRRDcVsF3SkF1zDIGBFweESvlFZwEBUx9qhwQH2PgAjResQPGl
	U0gKVwQ==
X-Received: from plgw5.prod.google.com ([2002:a17:902:e885:b0:2e8:486b:aed])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1209:b0:2e9:5829:9b48
 with SMTP id d9443c01a7336-2eb3649be66mr33001425ad.20.1793395651474; Fri, 30
 Oct 2026 14:27:31 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 30 Oct 2026 14:27:21 -0700
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
Message-ID: <20261030212721.2606393-8-seanjc@google.com>
Subject: [PATCH v3 7/7] KVM: selftests: Expect failure when trying to set EFER
 that violates vCPU model
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Adjust the EFER.LMSLE testcases to expect failure, not success, when
attempting to stuff EFER.LMSLE=1 even when the guest CPUID model is
configured with EFER_LMSLE_MBZ enabled, i.e. when it should be impossible
to set EFER.LMSLE=1.  KVM's ABI is that userspace *must* set CPUID and
feature MSRs before restoring (or stuffing) vCPU state, i.e. before writing
normal MSRs.  The previous KVM behavior of allowing usersepace to stuff
garbage was a KVM bug (that has since been fixed).

Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-182135@kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/x86/svm_nested_efer_test.c  | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/svm_nested_efer_test.c b/tools/testing/selftests/kvm/x86/svm_nested_efer_test.c
index fa9cfe8b1242..141ef035a8c4 100644
--- a/tools/testing/selftests/kvm/x86/svm_nested_efer_test.c
+++ b/tools/testing/selftests/kvm/x86/svm_nested_efer_test.c
@@ -193,23 +193,20 @@ static void test_host_initiated_lmsle(void)
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
 	u64 efer;
+	int r;
 
 	vm = vm_create_with_one_vcpu(&vcpu, NULL);
 	vcpu_set_cpuid_feature(vcpu, X86_FEATURE_EFER_LMSLE_MBZ);
 
-	/*
-	 * EFER_LMSLE_MBZ is a guest CPUID consistency check, not a host
-	 * capability, i.e. must not be enforced against host-initiated writes,
-	 * so that userspace can set MSRs before it sets guest CPUID.
-	 */
 	efer = vcpu_get_msr(vcpu, MSR_EFER);
 	TEST_ASSERT(!(efer & EFER_LMSLE), "EFER.LMSLE unexpectedly set");
 
-	vcpu_set_msr(vcpu, MSR_EFER, efer | EFER_LMSLE);
-	TEST_ASSERT_EQ(vcpu_get_msr(vcpu, MSR_EFER), efer | EFER_LMSLE);
+	r = _vcpu_set_msr(vcpu, MSR_EFER, efer | EFER_LMSLE);
+	TEST_ASSERT_EQ(r, 0);
+	TEST_ASSERT_EQ(vcpu_get_msr(vcpu, MSR_EFER), efer);
 
 	kvm_vm_free(vm);
-	ksft_test_result_pass("Host-initiated EFER.LMSLE=1 is allowed\n");
+	ksft_test_result_pass("KVM_SET_MSRS rejects EFER.LMSLE=1 with EFER_LMSLE_MBZ\n");
 }
 
 static void test_sregs_lmsle(void)
@@ -222,10 +219,6 @@ static void test_sregs_lmsle(void)
 	vm = vm_create_with_one_vcpu(&vcpu, NULL);
 	vcpu_set_cpuid_feature(vcpu, X86_FEATURE_EFER_LMSLE_MBZ);
 
-	/*
-	 * Unlike KVM_SET_MSRS, KVM_SET_SREGS runs the full set of guest CPUID
-	 * checks, i.e. rejects EFER.LMSLE even though it's host-initiated.
-	 */
 	vcpu_sregs_get(vcpu, &sregs);
 	TEST_ASSERT(!(sregs.efer & EFER_LMSLE), "EFER.LMSLE unexpectedly set");
 
@@ -275,7 +268,7 @@ int main(int argc, char *argv[])
 		test_sregs_lmsle();
 	} else {
 		ksft_test_result_skip("Guest EFER_LMSLE_MBZ=0\n");
-		ksft_test_result_skip("Host-initiated EFER.LMSLE=1 is allowed\n");
+		ksft_test_result_skip("KVM_SET_MSRS rejects EFER.LMSLE=1 with EFER_LMSLE_MBZ\n");
 		ksft_test_result_skip("KVM_SET_SREGS rejects EFER.LMSLE=1\n");
 	}
 
-- 
2.56.0.385.gac671c819a-goog

