Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C3A5226A7
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789867; cv=none; b=cGj7XPExR+NDPPvYED4hbRnFlPreudPMCuVT8Hj4p5+qKIsRTYMBMZRDVtiVyru0NfTFWWnULyTnhQRRJvCOQKCm04lMMEbSdP8uuEyqKbEjrtfYi+oakKDNZZ1U++tlKavZTMxkIRXNUzRwhSqVdI7aj+vPh4Bycif86WYKU7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789867; c=relaxed/simple;
	bh=s/FNBAQBrrnZg52w3efCRljTv+0gOGrUiwNRnigXCdo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eZFsjFiTuXtxbgesu04/uoTuDWeLMfnMq5hQ0Qliet4j8QZLnkEU+JDQw+jFH6tc/pal13Vv6aL1ctngNB6gI7RU92lWeI29oh1Dhr58C2EG97IMfqGlaSWI4Eyc6YCcmYRsIa7k2NR97uR1aeQbc9QKhsa/k4nmoS4MIhKCmaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wMwONRm0; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wMwONRm0"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc435388657so6642311a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790789865; x=1791394665; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T8AuVVtYp6P4fxO8gL9VGm7P7TXbt4y5276FQCXYHVM=;
        b=wMwONRm0u+vDCe7IOgtfncztf9YBDLV85OkZe6ZQQYP5bXL0ejQwYhWjMw8MGAi7cW
         G8mjNtIk+JcItgcrmxaIKOSLHefXpV+TUckMtfYZyX7HeZaEHIMKJ3ZyJjbH6OXNghfh
         Uz1Xu6TKdOSHqR5xoTtovxP01dPHNV03YwjK4dDKhQwKYUPIuNbbiPnv3miX3530kS/z
         saTHIhYchO8NpUv/4qO0ERvbYrNF2EjIRCKOK+hukf0lYEsj1Qo6LRFJZFCjvU1DhAxU
         NmDtZG/7nVckzCTVAK2rrClBsJsYKu9RY7j1aGt43pog+OC2+9ObvdQLp3gxaeeG0Anc
         M+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790789865; x=1791394665;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T8AuVVtYp6P4fxO8gL9VGm7P7TXbt4y5276FQCXYHVM=;
        b=dsgfmTCWWSDq4OeBHgVM6gLE5s6dbmka3PS5g3YrAm3ByEw8C7lK1rzhT83Mr6Bthx
         2GFGlLLybSBIK4n7I/yPfh1SmzXn8GAw71obvOPYL7YDWsfQA9D53+HD8hKyDqwy7rcn
         /EFvkKkjTpXh8RnqUHIzSRW9GbRnrXQ1F/M6CQazgg5rm2a4r0TJ8ywkZBcZjXxzYovu
         t3DTs1TeaiLcPd4eUjPSmARvdoS7gDNSDLyLYzOioF+axkTzRBn9n/7E92rFgvswl1PY
         NAL3bsCbhrdHcqG+3n/3fhs8/7OHgtfWwrNB48m4yQ0xl5f1cgMUILUfZmG1Tpk/3dzu
         oajw==
X-Forwarded-Encrypted: i=1; AKwUvBxtMNpeehD9Vr8Z7s6QmL6+9cGkOe/h29XCAP0Cnd9Yh6CFbbaz0QizZ4I/thAGpPCcR+V7LEhzrsaLPb0=@vger.kernel.org
X-Gm-Message-State: AFuF++n+mC4gs0j/Hnk6IA01+hrDu8T67KxmGzlrFSngjWx4QlokgDQz
	jrNr4n3+LsjUu4Vr02Kpcwv50M7vM9lLIrsb1uW45REwm4dnHZJ9ItD/DbIErwfVBKp2V4Db0G9
	Ue89zww==
X-Received: from pgnn4.prod.google.com ([2002:a05:6a02:4f04:b0:cc7:4d12:8a9a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7344:b0:3dd:a196:69e5
 with SMTP id adf61e73a8af0-3de9eb9ea11mr2085012637.64.1790789865397; Wed, 30
 Sep 2026 10:37:45 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 30 Sep 2026 10:36:21 -0700
In-Reply-To: <20260930173635.3362655-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930173635.3362655-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930173635.3362655-8-seanjc@google.com>
Subject: [PATCH v3 07/21] KVM: selftests: Randomize L2's scale factor in
 nested TSC scaling test
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>, Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Randomize L2's scale factor in the nested TSC scaling test; the test's
comment that "using a global variable does not work" just means the author
didn't know how to use sync_global_to_guest().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../kvm/x86/nested_tsc_scaling_test.c         | 21 ++++++++-----------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c b/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
index b8b2217b9efa..84312146e93f 100644
--- a/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
+++ b/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
@@ -17,10 +17,9 @@
 #include "kselftest.h"
 
 /* L2 is scaled up (from L1's perspective) by this factor */
-#define L2_SCALE_FACTOR 4ULL
+static u64 l2_scale_factor;
 
 #define TSC_OFFSET_L2 ((u64)-33125236320908)
-#define TSC_MULTIPLIER_L2 (L2_SCALE_FACTOR << 48)
 
 enum { USLEEP, UCHECK_L1, UCHECK_L2 };
 #define GUEST_SLEEP(sec)         ucall(UCALL_SYNC, 2, USLEEP, sec)
@@ -81,7 +80,7 @@ static void l1_svm_code(struct svm_test_data *svm)
 	generic_svm_setup(svm, l2_guest_code);
 
 	/* enable TSC scaling for L2 */
-	wrmsr(MSR_AMD64_TSC_RATIO, L2_SCALE_FACTOR << 32);
+	wrmsr(MSR_AMD64_TSC_RATIO, l2_scale_factor << 32);
 
 	/* launch L2 */
 	run_guest(svm->vmcb, svm->vmcb_gpa);
@@ -116,7 +115,7 @@ static void l1_vmx_code(struct vmx_pages *vmx_pages)
 	vmwrite(SECONDARY_VM_EXEC_CONTROL, control);
 
 	vmwrite(TSC_OFFSET, TSC_OFFSET_L2);
-	vmwrite(TSC_MULTIPLIER, TSC_MULTIPLIER_L2);
+	vmwrite(TSC_MULTIPLIER, l2_scale_factor << 48);
 
 	/* launch L2 */
 	vmlaunch();
@@ -154,15 +153,12 @@ int main(int argc, char *argv[])
 	TEST_REQUIRE(kvm_has_cap(KVM_CAP_TSC_CONTROL));
 	TEST_REQUIRE(sys_clocksource_is_based_on_tsc());
 
-	/*
-	 * We set L1's scale factor to be a random number from 2 to 10.
-	 * Ideally we would do the same for L2's factor but that one is
-	 * referenced by both main() and l1_guest_code() and using a global
-	 * variable does not work.
-	 */
+	/* Scale L1 "down" and L2 "up" at a random factor from 2 to 10. */
 	l1_scale_factor = (kvm_random_u32(&kvm_rng) % 9) + 2;
 	printf("L1's scale down factor is: %lu\n", l1_scale_factor);
-	printf("L2's scale up factor is: %llu\n", L2_SCALE_FACTOR);
+
+	l2_scale_factor = (kvm_random_u32(&kvm_rng) % 9) + 2;
+	printf("L2's scale up factor is: %lu\n", l2_scale_factor);
 
 	tsc_start = rdtsc();
 	sleep(1);
@@ -172,6 +168,7 @@ int main(int argc, char *argv[])
 	printf("real TSC frequency is around: %lu\n", l0_tsc_freq);
 
 	vm = vm_create_with_one_vcpu(&vcpu, l1_guest_code);
+	sync_global_to_guest(vm, l2_scale_factor);
 
 	if (kvm_cpu_has(X86_FEATURE_VMX))
 		vcpu_alloc_vmx(vm, &guest_gva);
@@ -212,7 +209,7 @@ int main(int argc, char *argv[])
 				printf("L2's TSC frequency is around: %lu\n", l2_tsc_freq);
 
 				compare_tsc_freq(l2_tsc_freq,
-						 l1_tsc_freq * L2_SCALE_FACTOR);
+						 l1_tsc_freq * l2_scale_factor);
 				break;
 			}
 			break;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

