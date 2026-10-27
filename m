Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793141367;
	b=1nIjS5KowKT/ZcWD7Zgenhxkgj2kvgpAWyaEZtu7h5zFTwuSWfhIqFiEInqvvZ68M8EU
	 ET+BeLBh7TwUJOHqp1VJbTO3yh3pcDJQy+X/LjqzeaacarGVEIwkR5t43ePGyqlnlUpl9
	 mtkWEDCNn7PG0lg4jtmuZefBIJ4WQVJwMZqQsMCRcS1f7A5IK4pxVBKai6jvDCoLOqxyi
	 BzsZ2CA+jQuWW3RhkYnOpmY6L8dN9QYgo6q/3Az0IzRoTjEb5jUdSGKc5PkKlwK5WLb0a
	 ML1jjdDtBvXr/lNzWk8h2n9HuGWIbObup+migNC+KO8zdsqJuLSaO1vm/M7RP61j+Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793141367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=MDAiMek2MBhrFqFzjIIabNRz2rV6IIbw6asreozihSA=;
	b=ZsGe+pYgAD1K6eQzOrqURLxvRcyBDfK/JpkC2F6kDZtlz1rGNyYKsfkqhxCFlhgJlGI5
	 oTWML5NvhwhHebYgNbB9eg4FbKv8vrsXNJjBDgCQBt5vGtQYcoTHl/pd6+5IlkVvcyKCD
	 p3/TtEqPHY4rcL+2plNfnBGnwvVqWOuJE9VT6v2mtqbvzj45ELsyF1r+IUxtJBtScVopj
	 Ip/6VLYbqlXmvZ+VZQGPLMqdHLJvhzvAHShtuWSqkjl0JaiGVhyso6CRF73/kW39Hl1vq
	 zuK7BnPpFmcwIIlR26uz+nuYN4R6JQsvlzwqyXFsUBS6mBFb7/OOl8fFN/Ds/mO4fAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ixrOyOOH;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C38760A2602
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C38760A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ixrOyOOH
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a0522cdaf3so301613b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793141367; x=1793746167; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MDAiMek2MBhrFqFzjIIabNRz2rV6IIbw6asreozihSA=;
        b=ixrOyOOHCdDEujl6kGi28CiFUnBzHCN280AGhBM34NnrNdWWDh0+Q0xM7jYx459pdF
         na/5cyvS1XpqxJUbnmGrjbgIE6De8xPRSO3pyeql502TNrk+m1jSIslCmOUPRMObuwoi
         oPm90OuRznGo2Du/PnI/wCm7A8igEfhr9e04Vm+RZ1V9tMZy/Y5Ah6pBWf5V7zI08pu4
         Ck+X4pMdcwugDgY6cnSlh8Dvr1IKEfNcc6RHEewE+obzjQZlZjmwmaOhmQotyaXyNAHi
         Zscf5ERUhzV4jWMhPh+qGNjmXo1QAHHrJBJUmQ4DMNSSdQSbUH169kU4SfN3wLm0be3h
         d3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793141367; x=1793746167;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MDAiMek2MBhrFqFzjIIabNRz2rV6IIbw6asreozihSA=;
        b=fNx5+HlyPWATyWT9/iY5//oIKF0VSEQQeQA5xEknGn1GwzVmf61FNEizAbGO6E6nWf
         wcRdZBSJxzu38wyJqhpBnqW+r7wIVGyXFiP7OnPRiGdkfQVNpaQ7Yq/C90Qh/Q+OWXVx
         2/uU2X/LWxoP/TRQWX8VphoeVr6TiqAeEs1wCaX+FjGxbjv+/RSbzDRKwPlYYV4ZIUwX
         O0t9YmITu6+doRFP8DfNbnLpOrWHwcf8zcUoTULDBmYqWRMeWSQfFeCso9NyYIoGdJwi
         z66N1gfdceA37bB30jChQZ3y2rXc//rqswMw4cdUhTzS+leWEPP6Tt0ieDCMUqxjrhRq
         ujEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRv5U98Ua4SZY3AY/1weop8ybzGnE1JDcVxX2/Zi2n6vnKBBTA6iPneqJ0e6xDr9bB2pdks6xY/Vc+7Ak=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWy93VfGqri6aqsQpXcbzwTw+oKc67q3QXNtz1XMuoWxPb4GRD
	bsQYed7TtFx1s+P9mb9anaaIoSXWHyDYDx6rOnDEurTSEuXsjKpLAN/JJDWbZ9739OOF1L5BE7O
	irZnDbQ==
X-Received: from pfop4.prod.google.com ([2002:a05:6a00:b44:b0:890:3943:6267])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:6bdc:b0:3e1:e757:205e
 with SMTP id adf61e73a8af0-3e90234d14amr401818637.42.1793141366625; Tue, 27
 Oct 2026 15:49:26 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 27 Oct 2026 15:49:14 -0700
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
Message-ID: <20261027224914.1574319-7-seanjc@google.com>
Subject: [PATCH v2 6/6] KVM: selftests: Expect failure when trying to set EFER
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
 .../selftests/kvm/x86/svm_nested_efer_test.c  | 20 ++++++-------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/svm_nested_efer_test.c b/tools/testing/selftests/kvm/x86/svm_nested_efer_test.c
index fa9cfe8b1242..bdec7cdb3714 100644
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
@@ -222,11 +219,6 @@ static void test_sregs_lmsle(void)
 	vm = vm_create_with_one_vcpu(&vcpu, NULL);
 	vcpu_set_cpuid_feature(vcpu, X86_FEATURE_EFER_LMSLE_MBZ);
 
-	/*
-	 * Unlike KVM_SET_MSRS, KVM_SET_SREGS runs the full set of guest CPUID
-	 * checks, i.e. rejects EFER.LMSLE even though it's host-initiated.
-	 */
-	vcpu_sregs_get(vcpu, &sregs);
 	TEST_ASSERT(!(sregs.efer & EFER_LMSLE), "EFER.LMSLE unexpectedly set");
 
 	sregs.efer |= EFER_LMSLE;
@@ -275,7 +267,7 @@ int main(int argc, char *argv[])
 		test_sregs_lmsle();
 	} else {
 		ksft_test_result_skip("Guest EFER_LMSLE_MBZ=0\n");
-		ksft_test_result_skip("Host-initiated EFER.LMSLE=1 is allowed\n");
+		ksft_test_result_skip("KVM_SET_MSRS rejects EFER.LMSLE=1 with EFER_LMSLE_MBZ\n");
 		ksft_test_result_skip("KVM_SET_SREGS rejects EFER.LMSLE=1\n");
 	}
 
-- 
2.56.0.307.g5fe7bd680c-goog

