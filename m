Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792539948;
	b=Z7XIkJ4j/+J8Y5BuQiNeb44y+sdpdiMDrq0fZzZdYxmPqZCKvtM6rmsxMIpxHe+fQWEe
	 hmqrc+eoKejowEqCENdwOC2hUrbECiBL2F78AnmKlE8Tmz4OOzBZ2BhN8rJhM6FOYoyuJ
	 isB/qtXFSek5Sr6gaatI0iac+zJrg04t4AzNg/RUQppFjuFhDJ1qLtiAQCDRWYyOFMxNO
	 0+kI/Km7IXq7zZVI1IG/rYMMGAHDn+5DKInzlHZLLhARaW72q29YUEizDpVRRaSETFKce
	 1m4c3HH1KugPXY6bLloPfOIYJBdLEpr0+YScQBHTYBIZPt2+KTuuBMM9+xQyA/2xU+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792539948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=yDeUrlP+9V6t8Szn1Kr0YDnDSBUM+zoUIo+daTEsHVM=;
	b=fzo+fhHI7VHuQwFid6iyLlQGSgcNi+klvFjFHvtvxDqvlOBccBFceZe5FaD4jHTzDogQ
	 PJsTmX76G3+kQSUYE/X3+7Y9NAqpTuTQ/EkeRdVbPbNp1k4iJBUwoBtdcSS+C1WH+LRiJ
	 Zxun4r12b4QOCBAV6FseMVmtyZyCK6DlOSG8bfsgV/GegSkvuX/gi36WQhaHE/l4sPSeQ
	 CmBGJ+KF5B43M0Su3QV8iPz467cLSIiGMwI/5R69zDEdUZKqqJFPovR4RbadVJFqDskzw
	 tmZQV0IDF9YwpLe/DJxDaBxFDUyIDspnINlprCJEuiCnvord+L+Ow1tFVnasimPy3zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=vJxmDvlF;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17DF606A335
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D17DF606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=vJxmDvlF
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a4a0017549so532828a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792539947; x=1793144747; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yDeUrlP+9V6t8Szn1Kr0YDnDSBUM+zoUIo+daTEsHVM=;
        b=vJxmDvlFA3TrD1gTBnYYf8cXIxkD7t/43sVyli+/GcdVFzkprsLocSzqWTWMEwxl7K
         ogefd5RSDXIZTPonAzRKCBg4uEIBE8T6T8FJCwLI7mi3O1f05BbL6iq1ai2JFAcRTf4o
         pJP1ZEs9pZePtmuE/DjYNBY1rCJ/C4NbL4717HO2qW95TNTk/u42Q9vyDCXdBFJpKRX6
         3X6WJZoUph6odJgH03SidP8s6UignQzPA33lIoRqa7ezh0TPIHtwaJ+kZRq95QTcccAH
         SyEa2kYotxot111VChJWiNPWSFa0N+84RJxgS/kO6mfQq3zJS4dnTRA5dB1ogdIIaGQw
         D1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792539947; x=1793144747;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yDeUrlP+9V6t8Szn1Kr0YDnDSBUM+zoUIo+daTEsHVM=;
        b=VzeFuFY2BwvbM3LWrCJbbA4RC/uYK8GnKp3mgD0TwJf8D5/jnF6ImJtIlUuaBr3Cts
         aJMLiIxcqsFuk1kZVY2+cT76Wafn5ouv0/miLaT99OvmB+6B2wtyVQCC3ttfQDt7X/XQ
         HkqBYgy/4O4drsTUWX1LClgPh9uZ1p0YtNOfPQcj40/u+uhehPja3NKr/E2s6pkoPEVk
         RIuKF7vPyiDnR6VpKId22NXzHWj/x8TZ7AyGumAO4S75qDDEbqtaLJSOv1nCZ8JP0dF9
         HJCnw0RZDuukgPiWgCMJQc8d+RnRcjO48GxymIaRbCcYf8h6LCLEUVBw5oLL0C37hWeq
         7ceQ==
X-Forwarded-Encrypted: i=1; AKwUvByiV2A0/ieK47mqTzQHIku1XBfC2JINZegy6S9oLuEL5axbzOFTjQJ3AbVCyg3uZ/3aeF3v1Pz4nH/fuqE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/QfxLc0m9Zi9ffUH1CIWxPm/a+nkXpY3TGBA7zAnlrEfOtI3f
	u601r6g9HoreA+pJWUjokK0UFibVMIB5SvYNCSjZGrALLtjnB9VyFMqM0Y8V4P5JyD2HV7sRvnd
	eB/OhwCYQvMytwQ==
X-Received: from pjbfa23.prod.google.com ([2002:a17:90a:f0d7:b0:3a8:4f60:e802])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:35cd:b0:3ac:a6a5:5743 with SMTP id 98e67ed59e1d1-3ad86f0bd1dmr382782a91.32.1792539946954;
 Tue, 20 Oct 2026 16:45:46 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:45:28 -0700
In-Reply-To: <20261020234535.3182385-1-jmattson@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020234535.3182385-1-jmattson@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020234535.3182385-3-jmattson@google.com>
Subject: [PATCH 2/4] KVM: VMX: Refresh LBR MSR intercepts on full MSR
 intercept recalc
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Jim Mattson <jmattson@google.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Like Xu <likexu@tencent.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Re-apply the LBR MSR intercepts in vmx_recalc_msr_intercepts() if the
LBRs are currently passed through, so that changes to userspace MSR
filters are reflected in the MSR bitmap.  Unlike SVM, which can simply
rewrite the intercepts in either direction, leave the bitmap alone if
the LBRs aren't passed through, as a filter can only force interception,
never prevent it, i.e. the bitmap is already correct.  Note, clearing
msr_passthrough to force vmx_passthrough_lbr_msrs() to re-apply the
intercepts on the next VM-Enter isn't an option, as doing so would
leave stale passthrough bits behind if the guest LBR event is no longer
active.

vmx_recalc_msr_intercepts() is invoked in response to
KVM_REQ_RECALC_INTERCEPTS, which is raised on MSR filter updates, but it
skips the LBR MSRs, and vmx_enable_lbr_msrs_passthrough() does nothing
if lbr_desc->msr_passthrough is already set.  If the LBR MSRs are passed
through when userspace installs a filter that denies them, they remain
passed through, and the guest can access them without exiting to
userspace.  Conversely, if a filter forced interception when the guest
LBR event became active, relaxing the filter leaves the MSRs needlessly
intercepted.  Either way, the bitmap remains stale until the guest LBR
event is torn down and recreated.

Only x2APIC MSRs are exempt from userspace filtering (see
kvm_msr_allowed() and the KVM_X86_SET_MSR_FILTER documentation), and the
filter is honored when LBR passthrough is first enabled, so KVM's
behavior shouldn't depend on whether the filter is set before or after
the guest enables LBRs.  Drop the LBR MSRs from the comment claiming
that they can't be filtered by userspace, and clarify that
lbr_desc.msr_passthrough tracks KVM's desired interception, which may
not match the MSR bitmap when userspace filters are in play.

Fixes: 9254beaafd12 ("KVM: vmx/pmu: Reduce the overhead of LBR pass-through or cancellation")
Cc: stable@vger.kernel.org
Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/vmx/pmu_intel.c | 20 +++++++++++++++++++-
 arch/x86/kvm/vmx/pmu_intel.h |  7 ++++++-
 arch/x86/kvm/vmx/vmx.c       |  6 ++++--
 arch/x86/kvm/vmx/vmx.h       |  1 +
 4 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
index 70a8c4816135..b945213f0b68 100644
--- a/arch/x86/kvm/vmx/pmu_intel.c
+++ b/arch/x86/kvm/vmx/pmu_intel.c
@@ -517,7 +517,8 @@ static void intel_pmu_refresh(struct kvm_vcpu *vcpu)
 	memset(&lbr_desc->records, 0, sizeof(lbr_desc->records));
 
 	/*
-	 * Setting passthrough of LBR MSRs is done only in the VM-Entry loop,
+	 * LBR MSRs are initially passed through only in the VM-Entry loop (a
+	 * full MSR intercept recalc merely refreshes an existing passthrough),
 	 * and PMU refresh is disallowed after the vCPU has run, i.e. this code
 	 * should never be reached while KVM is passing through MSRs.
 	 */
@@ -704,6 +705,23 @@ static inline void vmx_enable_lbr_msrs_passthrough(struct kvm_vcpu *vcpu)
 	lbr_desc->msr_passthrough = true;
 }
 
+/*
+ * Refresh the LBR MSR intercepts if the LBRs are passed through, so that
+ * changes to userspace MSR filters are reflected in the MSR bitmap.  There's
+ * nothing to do if the LBRs are intercepted, as a filter can only force
+ * interception, never prevent it.
+ */
+void vmx_recalc_lbr_msr_intercepts(struct kvm_vcpu *vcpu)
+{
+	struct lbr_desc *lbr_desc = vcpu_to_lbr_desc(vcpu);
+
+	if (WARN_ON_ONCE(!lbr_desc))
+		return;
+
+	if (lbr_desc->msr_passthrough)
+		vmx_update_intercept_for_lbr_msrs(vcpu, false);
+}
+
 /*
  * Higher priority host perf events (e.g. cpu pinned) could reclaim the
  * pmu resources (e.g. LBR) that were assigned to the guest. This is
diff --git a/arch/x86/kvm/vmx/pmu_intel.h b/arch/x86/kvm/vmx/pmu_intel.h
index 5d9357640aa1..b553f63e19a6 100644
--- a/arch/x86/kvm/vmx/pmu_intel.h
+++ b/arch/x86/kvm/vmx/pmu_intel.h
@@ -34,7 +34,12 @@ struct lbr_desc {
 	 */
 	struct perf_event *event;
 
-	/* True if LBRs are marked as not intercepted in the MSR bitmap */
+	/*
+	 * True if KVM wants the LBR MSRs to be passed through, i.e. not
+	 * intercepted.  Note, userspace MSR filters may force interception of
+	 * some or all LBR MSRs regardless, i.e. this doesn't necessarily
+	 * reflect the state of the MSR bitmap.
+	 */
 	bool msr_passthrough;
 };
 
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 612ab07d4100..1c190a6303a3 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -4347,11 +4347,13 @@ static void vmx_recalc_msr_intercepts(struct kvm_vcpu *vcpu)
 		vmx_set_intercept_for_msr(vcpu, MSR_IA32_S_CET, MSR_TYPE_RW, intercept);
 	}
 
+	vmx_recalc_lbr_msr_intercepts(vcpu);
+
 	vmx_recalc_pmu_msr_intercepts(vcpu);
 
 	/*
-	 * x2APIC and LBR MSR intercepts are modified on-demand and cannot be
-	 * filtered by userspace.
+	 * x2APIC intercepts are modified on-demand and cannot be filtered by
+	 * userspace.
 	 */
 }
 
diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
index dc8517f15bc4..ec6104b66009 100644
--- a/arch/x86/kvm/vmx/vmx.h
+++ b/arch/x86/kvm/vmx/vmx.h
@@ -667,6 +667,7 @@ static __always_inline struct vcpu_vmx *to_vmx(struct kvm_vcpu *vcpu)
 void intel_pmu_cross_mapped_check(struct kvm_pmu *pmu);
 int intel_pmu_create_guest_lbr_event(struct kvm_vcpu *vcpu);
 void vmx_passthrough_lbr_msrs(struct kvm_vcpu *vcpu);
+void vmx_recalc_lbr_msr_intercepts(struct kvm_vcpu *vcpu);
 
 struct vmcs *alloc_vmcs_cpu(bool shadow, int cpu, gfp_t flags);
 void free_vmcs(struct vmcs *vmcs);
-- 
2.56.0.212.g129ede20d9-goog

