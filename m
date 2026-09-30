Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8B0568523
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789875; cv=none; b=mtCw+9ltsWZxqwF0WejYsiW3ZDC7RJjdAh8wviOXM5oSvJJoTk2CVQ6aT7DA8Jq++lRDm5ETORMr2ccjojaPjkAfqSL5jZAcgkdCHZd3Fq7tAvAKywSge4Rm5is0sI0kuKeKikv1Z7yGy70fPrtOLaIJhDUl6tP3gU6SFW6L4uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789875; c=relaxed/simple;
	bh=GuntnwRXKVkVYMnvmsXDelolcHcx29GtLDky+Ast2Mc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZDrxTIFrr47gbxFuhkTtaKSGramvDjw6f2aRplKnmGEgChjLSH72k+7Lt3qnAPuPAZbxpd5jF82GWU7+4T0b2YKudkwhjj2ZawVOS8hpHFiZ85ttTakcxzTlRlqDhnr15eOTOXoxsvG9iWUzN1iaUK8XKw1NfREeMm/JI27Ch38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jBqbX7Pz; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jBqbX7Pz"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cee1ec30f2so53815885ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790789873; x=1791394673; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LQqrdCZTBp1fEKTHlVc1Buh/u5nZ1BC5WuNFitW3emg=;
        b=jBqbX7PzC/Oq815bd4IshYJI70RDkOQufZwInG9pClz3djf6lnFFJKiUOftKq7eilY
         WgjFfgKQhJHa1YMFxOwzzcIoCy8HE/aqD5yF4gssc5SEJvZz00y1WJTd5wrKt49JRKj2
         GF8aRJOfflw2tqTY/hRPnZOIyafp5HukZbDXgZyKZ9R6fAlc1MbQOEuLlCun0AYOFxym
         NU1mwcuOZNtUR/9z9dUQKo60KS2SVdzE2YiG+GXW2IaeH3si+hXffXtnFAnJK+px62SX
         FwX2DKV4GEN8uOYLL+SA3uEYkxFm6bIlx5waaIK0fF8+y/8OW5n1p+kNZIweEcvkrrw7
         KkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790789873; x=1791394673;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LQqrdCZTBp1fEKTHlVc1Buh/u5nZ1BC5WuNFitW3emg=;
        b=h2e+b4F7wsQl1sxSCmGyhTpMKTFFVs+uQvuidIhPRNEDSe+2QbroYlagmXs/ozqSzC
         Vlrub4gnMWwYW5xCe14OU087bM6MDJ/R3E4OmJLDfV88KgGT+txHX8s+d1fMfS+FPWPC
         2+hvz2JJ3TYxlEF93kXL2Gb78WHM+p664F9m7x5K3H8bv7QIJrcNLMHWjvb2Qd44D6Ex
         h4BJxGbcAcDavyBFsrSe9CIyYfn6nMoif2aK6dKcCDl8wJf5x1VDdMd4qQkv+FdXYSJy
         W8xDlHecS9FlYjsErrEjgAiiiXeZwJ/IbkqiG+350fdh+hCGuiqru1QYOQ3y0QxxkiMi
         X89A==
X-Forwarded-Encrypted: i=1; AKwUvBwE3Ay7TkP37RpwbCJ5rJmyXst/Me8dolrcBSNSViN/PVIfC3kTIpeKfuBgqOGLyM0eDn2in08QAWDGjFI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIS/O3DUsAPd6ekr9OMmRwfJvRdzF3y7Bd9K24bZ6o4/kDT9m3
	I1l+LXKdBq/KsLcaDMVsvqpmOVAjLI0wdW4aM5H3hWCOwAae2UEhRiJJwn7ziHEzb0U5Zp+bRQZ
	g1g17rw==
X-Received: from plov13.prod.google.com ([2002:a17:902:8d8d:b0:2df:6fff:3dad])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f603:b0:2bf:7b62:a038
 with SMTP id d9443c01a7336-2e2e4a0066bmr17158235ad.9.1790789873038; Wed, 30
 Sep 2026 10:37:53 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 30 Sep 2026 10:36:27 -0700
In-Reply-To: <20260930173635.3362655-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930173635.3362655-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930173635.3362655-14-seanjc@google.com>
Subject: [PATCH v3 13/21] KVM: selftests: Use KVM's reported TSC KHz as L0's
 frequency (sanity checked)
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>, Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Use KVM's reported default TSC frequency as L0's frequency instead of
calibrating L0's frequency using RDTSC.  Trying to calibrate the frequency
in userspace is all but guaranteed to be wildly inaccurate, e.g. due to
interrupts, preemption, etc, and no known CPU supports TSC scaling without
also having a constant TSC.  I.e. there's no need to calibrate the current
frequency, as it should also be the same as KVM's default frequency.

Opportunistically sanity check KVM's reported frequency against what is
observed via RDTSC, e.g. so that KVM_GET_TSC_KHZ or platform issues show up
much earlier in the test, before VMs get involved.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../kvm/x86/nested_tsc_scaling_test.c         | 25 +++++++++++++------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c b/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
index d790ab36a198..a78585af0ffd 100644
--- a/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
+++ b/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
@@ -137,7 +137,7 @@ static void l1_guest_code(void *data)
 
 static void test_tsc_scaling(u64 l0_tsc_freq, u64 l1_scale_factor, u64 l2_scale_factor)
 {
-	u64 tsc_khz, l1_tsc_freq, l2_tsc_freq;
+	u64 l1_tsc_freq, l2_tsc_freq;
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
 	gva_t guest_gva;
@@ -159,11 +159,8 @@ static void test_tsc_scaling(u64 l0_tsc_freq, u64 l1_scale_factor, u64 l2_scale_
 
 	vcpu_args_set(vcpu, 1, guest_gva);
 
-	tsc_khz = __vcpu_ioctl(vcpu, KVM_GET_TSC_KHZ, NULL);
-	TEST_ASSERT(tsc_khz != -1, "vcpu ioctl KVM_GET_TSC_KHZ failed");
-
 	/* scale down L1's TSC frequency */
-	vcpu_ioctl(vcpu, KVM_SET_TSC_KHZ, (void *) (tsc_khz / l1_scale_factor));
+	vcpu_ioctl(vcpu, KVM_SET_TSC_KHZ, (void *) (l0_tsc_freq / l1_scale_factor));
 
 	/* L1 will communicate its frequency before the L2 check.*/
 	l1_tsc_freq = 0;
@@ -212,18 +209,30 @@ static void test_tsc_scaling(u64 l0_tsc_freq, u64 l1_scale_factor, u64 l2_scale_
 int main(int argc, char *argv[])
 {
 	u64 l0_tsc_freq, tsc_start, tsc_end, l1_scale, l2_scale;
+	struct kvm_vm *vm;
 
 	TEST_REQUIRE(kvm_cpu_has(X86_FEATURE_VMX) ||
 		     kvm_cpu_has(X86_FEATURE_SVM));
 	TEST_REQUIRE(kvm_has_cap(KVM_CAP_TSC_CONTROL));
 	TEST_REQUIRE(sys_clocksource_is_based_on_tsc());
 
+	/*
+	 * Create a dummy VM to get KVM's default TSC frequency.  All CPUs that
+	 * support TSC scaling should have a constant TSC, i.e. there's no need
+	 * to calibrate the "real" TSC.  But do sanity check that the observed
+	 * TSC is within range of KVM's reported TSC frequency.
+	 */
+	vm = vm_create_barebones();
+	l0_tsc_freq = (u64)__vm_ioctl(vm, KVM_GET_TSC_KHZ, NULL) * 1000;
+	TEST_ASSERT(l0_tsc_freq, "vcpu ioctl KVM_GET_TSC_KHZ failed");
+	kvm_vm_free(vm);
+
+	printf("L0 TSC frequency is: %lu\n", l0_tsc_freq);
+
 	tsc_start = rdtsc();
 	sleep(1);
 	tsc_end = rdtsc();
-
-	l0_tsc_freq = tsc_end - tsc_start;
-	printf("real TSC frequency is around: %lu\n", l0_tsc_freq);
+	host_check_tsc_freq(0, tsc_end - tsc_start, l0_tsc_freq);
 
 	/* Scale L1 "down" and L2 "up" at a random factor from 2 to 10. */
 	l1_scale = (kvm_random_u32(&kvm_rng) % 9) + 2;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

