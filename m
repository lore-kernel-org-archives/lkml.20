Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBDA4FB9A3
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057440; cv=none; b=NfsCKR7N5vtSpksyZUUFtJ+8YfVdPrhn9DlxNHkBEcm8pQxOXwVlL7TW6mWlQW8R0WmssZ1Hr49xlwNuG0A7hlvwWSFiOvdR/XbmRYQVXWmHiO7ZaxaKYNozl7ehDF0oW/fV5yeEl2f9+AquyD9BDEyoFINFsDaH0sAbfuFzXYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057440; c=relaxed/simple;
	bh=vLBwpA/W09CA4nuBN8wyhZ23eWcSQH6kAchso1GU80E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pICupHP3D8UAaY5ecAC0WpcKLkzY2m4nRcoLYx2yvb9OScmF3DaVt5Ts64u3SCb4YCVXHHT6K0aXIqApgcNBPJBSQP5u3SDLIhfUF0LIXH4LXIljk4XqAXZJ0eDwYSWdpFD41x8ny1ZKKSsJC4pFstOwOZnEXHgsQC5xwKpPy2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wf0Nuwce; arc=none smtp.client-ip=209.85.208.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wf0Nuwce"
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6a5d682e372so1235124a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789057436; x=1789662236; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i8SjnCZzsDgkEIH+7JYFlN1mRbLf5pSXtHbHm73zeYY=;
        b=Wf0NuwceSdk8Nu0ieEuDi/TN6+n2hk9pksr19hSpCfWRU/7FJSJsbmp+/ZMAV1Z8KF
         HJNnFxlalgIojjE0agHcme/zMEXSBEnsCUsVFESc6UVAo8uNqK4cee1tSr+EgHUiM7WC
         1KaQU+gF+vHy/qjTprBpIDPjYkqLCLBRl2vHCgI5ZuFyre3dxKHnSno4SwRh8nFjBnUu
         saAsQakwmwytf2ff2NQwMefZeUOMFNQrZOd1BjIkPIcf3EUTKccnnVWsYu4cRAr7tIX2
         E2X/MKwqptK89JGwN7EoKcGp2t7wOdV7RB6xT7jWH2QcuK/cYTos0vJyTKs88mxqVjuz
         4Ghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789057436; x=1789662236;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i8SjnCZzsDgkEIH+7JYFlN1mRbLf5pSXtHbHm73zeYY=;
        b=X1WMb/jT5uYZOK+kr56JyMG2c3G8WsQBusL3jb4uoGw4znfgzzzrtkGJHkD6ldjC0X
         c/lTkBQCYzQGyHPr6BO/tKQyFDxTudcWMr4mSx5WsdRpvheP437pWp/Vo8X33JM54R0U
         b0WXUU/SNIDfHXzeZ8Ly1uvfvSB/3gpAWrEuXTE7mOasgTi2yAZHpAvDJhLwDqaHZIAZ
         e+WnUcWNtT5ajvT3jQS6OTd58ch7zhTupi4OWLuZ3eBmddU/C5vojAeP7/gVemyRLxnu
         eeAIY75S3Lm/ZN6gAjD4UVLAkhIMsIM7PKFPmP/KhFAqOH1ktvbFJQ8qCd24dQJAIJnq
         MeuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUehfzJUZssjNno/nHqLZSmLPG2v/29c7UWHyYN1tDyj5h9srI7PvTIBWxPTQg+arGA30BAm8xfBH+XK4=@vger.kernel.org
X-Gm-Message-State: AFuF++kmpD2G3kC8qOg4wi+8QLK5a8d3P5YRqNBlCbwLvRyoBnwG7vfc
	uFSR3xKfGofzq05wQSqnpUgOWl/EuqXaHE1LzTBTG/vUfWYbAtoaoUV+Q/VOZLg7NHvBqFnVpSt
	INg==
X-Received: from edqr4.prod.google.com ([2002:aa7:d584:0:b0:6a9:853c:f2bd])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:c28e:b0:6a6:75b7:4ff6
 with SMTP id 4fb4d7f45d1cf-6a9a3136f44mr1906127a12.8.1789057435775; Thu, 10
 Sep 2026 09:23:55 -0700 (PDT)
Date: Thu, 10 Sep 2026 16:21:34 +0000
In-Reply-To: <20260910162343.4092060-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260910162343.4092060-1-elver@google.com>
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260910162343.4092060-2-elver@google.com>
Subject: [PATCH RFC 01/10] KVM: x86/pmu: Acquire SRCU in pmc_is_event_allowed()
 to protect filter lookup
From: Marco Elver <elver@google.com>
To: elver@google.com
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dereferencing kvm->arch.pmu_event_filter via srcu_dereference() requires
holding kvm->srcu to guard against concurrent filter replacement and
freeing by kvm_vm_ioctl_set_pmu_event_filter().

Counter reprogramming can reach pmc_is_event_allowed() without holding
kvm->srcu. Specifically, on AMD SVM, toggling EFER.SVME via KVM_SET_SREGS
or KVM_SET_SREGS2 triggers synchronous counter reprogramming outside of
any SRCU read-side critical section:

  kvm_vcpu_ioctl(KVM_SET_SREGS{,2})
    kvm_vcpu_ioctl_x86_set_sregs{,2}()
      __set_sregs_common()
        kvm_x86_call(set_efer)()
          svm_set_efer()
            svm_pmu_handle_nested_transition()
              __svm_pmu_handle_nested_transition(..., defer=false)
                __kvm_pmu_reprogram_counters()
                  kvm_pmu_handle_event()
                    reprogram_counter()
                      pmc_is_event_allowed()
                        srcu_dereference(kvm->arch.pmu_event_filter, &kvm->srcu)

If userspace concurrently updates the filter (KVM_SET_PMU_EVENT_FILTER),
a concurrent free and subsequent use-after-free is possible.

Protect filter lookups directly in pmc_is_event_allowed():
1. check rcu_access_pointer() first for the common fast path;
2. acquire guard(srcu)(&kvm->srcu) only when a filter is present;
3. drop redundant outer srcu_read_lock() in kvm_pmu_trigger_event().

Found with Clang context analysis.

Fixes: a02a25a65246 ("KVM: x86/pmu: Reprogram Host/Guest-Only counters on nested transitions")
Signed-off-by: Marco Elver <elver@google.com>
---
 arch/x86/kvm/pmu.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index a7d60c8785cd..3ad1e696edca 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -536,6 +536,11 @@ static bool pmc_is_event_allowed(struct kvm_pmc *pmc)
 	struct kvm_x86_pmu_event_filter *filter;
 	struct kvm *kvm = pmc->vcpu->kvm;
 
+	if (!rcu_access_pointer(kvm->arch.pmu_event_filter))
+		return true;
+
+	guard(srcu)(&kvm->srcu);
+
 	filter = srcu_dereference(kvm->arch.pmu_event_filter, &kvm->srcu);
 	if (!filter)
 		return true;
@@ -1132,7 +1137,7 @@ static void kvm_pmu_trigger_event(struct kvm_vcpu *vcpu,
 	DECLARE_BITMAP(bitmap, X86_PMC_IDX_MAX);
 	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
 	struct kvm_pmc *pmc;
-	int i, idx;
+	int i;
 
 	BUILD_BUG_ON(sizeof(pmu->global_ctrl) * BITS_PER_BYTE != X86_PMC_IDX_MAX);
 
@@ -1145,14 +1150,12 @@ static void kvm_pmu_trigger_event(struct kvm_vcpu *vcpu,
 			     (unsigned long *)&pmu->global_ctrl, X86_PMC_IDX_MAX))
 		return;
 
-	idx = srcu_read_lock(&vcpu->kvm->srcu);
 	kvm_for_each_pmc(pmu, pmc, i, bitmap) {
 		if (!pmc_is_event_allowed(pmc) || !cpl_is_matched(pmc))
 			continue;
 
 		kvm_pmu_incr_counter(pmc);
 	}
-	srcu_read_unlock(&vcpu->kvm->srcu, idx);
 }
 
 void kvm_pmu_instruction_retired(struct kvm_vcpu *vcpu)
-- 
2.55.0.1003.g10538fe699-goog

