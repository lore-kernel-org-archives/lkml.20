Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F28D390CBF
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787805965; cv=none; b=FtWfBpLM7t7u8hG56mOOAoIEjyX8FsVw5Cno5pegM7Dt2FYIcv/6jtcGtJ0XcWM0itbSXQn3m5KxHnwN0Slcw/QfP/F0rOBhAOPcwNa/rXUOn4YikQvn5D1f2a9+iCAYdDLeXE3ZFZ4DSKK0j63VEwjGASrXguJnM1/j5j/etKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787805965; c=relaxed/simple;
	bh=wni/gdqNYjH6EHVDgouLtJx3/7zkJMxUoU3e/kmIOy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mFMrqOXxM1KZbNIfEWQ5HtjnPk2K8Yc6zeib6wvuQB70l9WK0JE+G+W3KuikCahGaG8xjKuAd33xB+vedFwtQlLj7rD9bLbv50qq7m46v9HxogXIOjm4IhY72euedgkXvvTs7LlZQy1UrId9epP+t7LmXBPHgTKHYLBrMCOqbZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MC79qChj; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MC79qChj"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3964e480f76so2340890a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787805963; x=1788410763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1I+EG9o+WscjAZPY2e61wmmiFBvV5FXVeqxFAMLmVA=;
        b=MC79qChj8tH2tSEjzIAUeKlw0q72ksBE1n7gLZNyQa/pXJbvTmLBCrUyDaWLE4ALqu
         bnV8NTgnjqnryheGjT6QYK7eEaI9u0oo6k2g0B1MgUgoix939iUAuLbL3ef6NM2QhVb2
         BzN+vyD3H1iS9qS3rZfxNJhQL/SiEgoLLlvrlsIDwDkMknyUOuCIiXR+h9p6Q3eWhPJg
         kiX3EdyFAdKJcuzYqnUmcr+e1hr+KIjM3jdj9t8Lx/wDv/LsAt9UVx7jJNj6HNcgBTjO
         zkOgh1BQgnfTT4mmZGo33N7F1A+ScFGG4B0TWLW33j3VsrXNhYpr4pFp7ZowzEuSwpnp
         eIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787805963; x=1788410763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d1I+EG9o+WscjAZPY2e61wmmiFBvV5FXVeqxFAMLmVA=;
        b=fHDweUwzYC5hV+yd3silHTuWjZKKifinI0z/DC3Yod2VhGdyK8uqcwdOmy0UVZ7wTr
         rTJtcX3cD1GFpmAL/hQJFCjf0MZWmmj6vXFXqqoCFPPz8E2u78ClkNEsUvXTn+5anted
         fkLcpKH3p4l+5pvAGZIpMh3RNgYEJ2VQLP6uw6Kmt0KIZ3ghrntUHXE/JQrQP0B69gwr
         hOp5sunuzixMp2/V+xAy2rzzseNGXFAErfxD4nRUImch2g+HSuzyZcFoVigcI5V23U1C
         1/mJMDPteY5NHC1bvzVxj/jEMlP5JlngK3XCy/Z6Ms7ehxvJljXpyQrnV4JTap33pCKN
         5Ing==
X-Forwarded-Encrypted: i=1; AHgh+Rrk0qIO8pLKLRwnBzr9U8hp6KQknxcAOwQU2wZBo6KGKLo+2qsqSz+irPI7W2I2MGSZKskkW/YTN1/VF1c=@vger.kernel.org
X-Gm-Message-State: AFuF++mKjZrQ1G0EKWVobgJ06G+080Xo1ahhC3Y6+6udGYzBdTVCJOTF
	3Y6SUCCoiXQNZJg4xJOLAKhjDHmpZM4NpYlqUHZZY8bgZ7C2XVzDzZVs
X-Gm-Gg: AR+sD12zUivW+5XNoUgu5bdjpMy+XMZwd5c3UQ30Tgt5iwF8pVW4QJwSIxpwWLUUotf
	LHqB5Y18PDgPy1D8kML0oqva37NJrRiyaxB02w/n9ueL910FAVE17oWMVfrENGR8ZLRacFW8cRD
	dUE9LBEc1GRIb3URf98eK3pQ2GXFyM8AsOTU5KCNJO7AL6zGWXYx1VfOO/SoT/3B9ScvbOyRuFH
	n4H3SSmwtxoSZkHyKTRQ/nRO55wgWw4L7uIZCwSzbjG9CVodDvXRxRuDdM+Vz0M4K+VSg0c+ElT
	r5NJUwU1blNeR2MxQc1L7Zaum+9z4FH7SEI/EMipUj5tlKugSbOiYGHCrEwcdKnVP7+iiiKZoQs
	HdCyyq4Y7E1pcGieEz1UdGxRPaW0W3OwSiSYBExvaT+eUAmIfOOhp9zf0LoKmx9unUszVp+Ecr3
	AweJj4xgE6XWXAm7osMTBCW7r6zcxlhjMrdl9je24TVARwYCjZCPuxe3o+ap1zcjrwL6aIKU09y
	Ew7XYoO0Jro
X-Received: by 2002:a17:90a:d44c:b0:396:5f7f:52f5 with SMTP id 98e67ed59e1d1-3966d366aa3mr25418355a91.3.1787805963458;
        Wed, 26 Aug 2026 21:46:03 -0700 (PDT)
Received: from volcano9f8e-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3285a5f96efsm2270583eec.11.2026.08.26.21.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 21:46:03 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: seanjc@google.com,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] KVM: selftests: Test the PV_UNHALT feature, not just its CPUID bit
Date: Thu, 27 Aug 2026 10:15:34 +0530
Message-ID: <20260827044534.2900285-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260827044534.2900285-1-hemanth.selam@gmail.com>
References: <20260827044534.2900285-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

test_pv_unhalt() only checks that KVM clears KVM_FEATURE_PV_UNHALT from
guest CPUID when HLT-exiting is disabled.  The feature itself has never
been exercised, hence the FIXME.

Add a two vCPU test for it.  One vCPU halts with interrupts disabled, so
nothing except the KVM_HC_KICK_CPU issued by the other can resume it: KVM
delivers the kick as APIC_DM_REMRD, which sets pv_unhalted and makes the
vCPU runnable without injecting an interrupt.  Reaching the instruction
after HLT is therefore proof that the kick arrived.

Give the halting vCPU a non-zero APIC ID, so that a kick aimed at the
wrong vCPU fails the test instead of hitting the halter by chance, and
enable its APIC as a guest using PV spinlocks would, since KVM only routes
the kick once the vCPU's APIC is in the map.

Wait for the halter's halt_exits to tick before kicking so that the kick
lands on a vCPU that has actually halted, and bound the wait so a vCPU
that never halts fails the test instead of hanging it.

The kicking vCPU runs with KVM_CAP_ENFORCE_PV_FEATURE_CPUID enabled and
PV_UNHALT advertised, so that KVM services the hypercall because the
feature is exposed rather than because enforcement is off.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/testing/selftests/kvm/x86/kvm_pv_test.c | 97 ++++++++++++++++++-
 1 file changed, 96 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/x86/kvm_pv_test.c b/tools/testing/selftests/kvm/x86/kvm_pv_test.c
index 8ed5fa635021..120d08ac25ce 100644
--- a/tools/testing/selftests/kvm/x86/kvm_pv_test.c
+++ b/tools/testing/selftests/kvm/x86/kvm_pv_test.c
@@ -6,8 +6,10 @@
  */
 #include <asm/kvm_para.h>
 #include <linux/kvm_para.h>
+#include <pthread.h>
 #include <stdint.h>
 
+#include "apic.h"
 #include "test_util.h"
 #include "kvm_util.h"
 #include "processor.h"
@@ -193,7 +195,99 @@ static void test_pv_unhalt(void)
 	TEST_ASSERT(!vcpu_cpuid_has(vcpu, X86_FEATURE_KVM_PV_UNHALT),
 		    "PV_UNHALT set in guest CPUID when HLT-exiting is disabled");
 
-	/* FIXME: actually test KVM_FEATURE_PV_UNHALT feature */
+	kvm_vm_free(vm);
+}
+
+static void pv_unhalt_halter_guest_code(void)
+{
+	/*
+	 * Enable the local APIC, as a guest that uses PV spinlocks would.  KVM
+	 * only routes the kick to this vCPU once its APIC is in the map.
+	 */
+	xapic_enable();
+
+	/*
+	 * Interrupts are disabled, so nothing except the KVM_HC_KICK_CPU from
+	 * the other vCPU can end the halt, i.e. reaching GUEST_DONE() proves
+	 * the kick was delivered.
+	 */
+	asm volatile("cli; hlt");
+
+	GUEST_DONE();
+}
+
+static void pv_unhalt_kicker_guest_code(u32 halter_apic_id)
+{
+	/* KVM takes flags in a0 and the APIC ID to kick in a1. */
+	GUEST_ASSERT_EQ(kvm_hypercall(KVM_HC_KICK_CPU, 0, halter_apic_id, 0, 0), 0);
+	GUEST_DONE();
+}
+
+static void run_guest_to_done(struct kvm_vcpu *vcpu)
+{
+	struct ucall uc;
+	u64 cmd;
+
+	vcpu_run(vcpu);
+	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
+
+	cmd = get_ucall(vcpu, &uc);
+	if (cmd == UCALL_ABORT)
+		REPORT_GUEST_ASSERT(uc);
+	TEST_ASSERT_EQ(cmd, UCALL_DONE);
+}
+
+static void *pv_unhalt_halter_thread(void *vcpu)
+{
+	run_guest_to_done(vcpu);
+	return NULL;
+}
+
+static void test_pv_unhalt_kick(void)
+{
+	struct kvm_vcpu *halter, *kicker;
+	struct timespec start;
+	struct kvm_vm *vm;
+	pthread_t thread;
+	int r;
+
+	pr_info("testing KVM_HC_KICK_CPU\n");
+
+	/*
+	 * Give the halter a non-zero APIC ID, so that a kick sent to the wrong
+	 * vCPU fails the test instead of hitting the halter by chance.
+	 */
+	vm = vm_create_with_one_vcpu(&kicker, pv_unhalt_kicker_guest_code);
+	halter = vm_vcpu_add(vm, 1, pv_unhalt_halter_guest_code);
+	virt_pg_map(vm, APIC_DEFAULT_GPA, APIC_DEFAULT_GPA);
+
+	/*
+	 * Enforce the PV CPUID so that KVM services the hypercall because
+	 * PV_UNHALT is advertised to the kicker, and not because enforcement
+	 * is off.  KVM advertises PV_UNHALT by default while HLT-exiting is
+	 * enabled; set it explicitly so that the test keeps testing the
+	 * feature if that ever changes.
+	 */
+	vcpu_enable_cap(kicker, KVM_CAP_ENFORCE_PV_FEATURE_CPUID, 1);
+	vcpu_set_cpuid_feature(kicker, X86_FEATURE_KVM_PV_UNHALT);
+	vcpu_args_set(kicker, 1, vcpu_get_apic_id(halter));
+
+	r = pthread_create(&thread, NULL, pv_unhalt_halter_thread, halter);
+	TEST_ASSERT(!r, "pthread_create halter failed, error=%d", r);
+
+	/* Kick only once the halter has taken its HLT exit. */
+	clock_gettime(CLOCK_MONOTONIC, &start);
+	while (!vcpu_get_stat(halter, halt_exits)) {
+		TEST_ASSERT(timespec_elapsed(start).tv_sec < 10,
+			    "vCPU never halted");
+		usleep(100);
+	}
+
+	run_guest_to_done(kicker);
+
+	/* Nothing except the kick can get the halter to GUEST_DONE(). */
+	r = pthread_join(thread, NULL);
+	TEST_ASSERT(!r, "pthread_join halter failed, error=%d", r);
 
 	kvm_vm_free(vm);
 }
@@ -215,4 +309,5 @@ int main(void)
 	kvm_vm_free(vm);
 
 	test_pv_unhalt();
+	test_pv_unhalt_kick();
 }
-- 
2.43.7

