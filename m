Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792539947;
	b=2EqNzAwRpWBym60MOSbhOuKESPPEvBvSMaEJWyIKaV+grbBjbot82ldzHzrLnHwSXa1t
	 IqvEXv2j3ORJzDfwqbgpPy2AqMP5e7mnPoJzbUrnM+j7s2S8Pt3sd/W4IA3PeZB5/U9Ck
	 K4h9vaIWs5dSjKb7Q8PJQbCwfaDQLrL3Uudw3IwlAw4BfJbc9RS+3wnNq5UaFNeHG2v0Q
	 V6I/glzH7saiDw+rZLxhhr7dvo8mZs14i/7n3/wAQkGvzQe/djqSA91Pj14VJ1jU+mzZQ
	 N6hY8bt3rcTF51ITfOKNf4ce3wKwHufaWsKZvqOzHApC+gFuA0Td/oVedDayjnpA+sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792539947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=W+TfMg64jOFPKI8BrWsSCAubaYF+Edkz42TVHe5mp54=;
	b=XiItah+sETYbN+YXNsK0Xz59Vvs/0pCQO02+DoiNd3Zy2BVhuTXa2L4JjnMUEXWkt3oo
	 gIfpPr1JNvSOgcq8HdvIemxR7ZWztTsfIi/9vWmRQyYAYZH0ed1GgT8Xo6cUKQ2xx0qVO
	 PcnE+upOsemX5zq1gfceUArYKSpVUsmJkbfis9z0jHNGNIZY4FkUYL9O0H//mHTgFSsKI
	 DL9IfTP/6PGKngHzr7agFGhn/eSMwpVvpUQjy422q23f3q1vJEWisimHQMXWOq4a4vfze
	 7plQWnksvYH/FDKkgcgn0o573t8y2doHkMEcIz6eMTq7+mn+7aglWDGo64FCh/NT86Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=fNqBYri7;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9976606A324
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9976606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=fNqBYri7
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d02df2bf09so950765ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792539946; x=1793144746; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W+TfMg64jOFPKI8BrWsSCAubaYF+Edkz42TVHe5mp54=;
        b=fNqBYri7Wtk5slO02Y5jEVgsAVAgpJfH3SIXMDKq6j1HcMVW+ULbdTgjbkIcJSYQCQ
         05HAmnLteeAvznFgbI+yJ2vBw3pgiAmuMlN41PN191jMcloX12swGd6ECKfdliVkHwA1
         PfDzPOV3FTzYCVlze+cfeLCmkL/EB99hoMZZlRZcPRc3FINNWRj0B095geK0pvoGjfmy
         CXFvagXTgxiDdvbHbD8DfaKBNXUbt3QyWzW9kId4pTaN/tQEDubpaNsm4yk/IgskZ9lf
         gs95ghKGf8WiXViAnmRS9T1YF2t72wPQdUqVgHYi342SR3Ew40CCwmj0j4iuu+5/kGFF
         dgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792539946; x=1793144746;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W+TfMg64jOFPKI8BrWsSCAubaYF+Edkz42TVHe5mp54=;
        b=YZJWWElzGyDVKH+IP788AiooR6K6+aE2QuznRDQhPaRTfZLV4Kkr1MCWvYSFR53SeS
         TWyQP3Fq4tYMhDTBn3MVLXjBoO2r8mXkQTWw6P+1nXyhoS65baesyR8zn6/8ISMaSOSz
         FWkX0qJCIB2wgJxwNWri+capVV82DJLU7R2VAVkfKg35X97yuEnkiPr7Vs+Lvo5XbXtK
         mTrYXAFMDNGViuJuM3JufXGxs7O2k8ONUB6Bkg0HzUINZ6AESNUomI3tY6Xeyc+AAIhu
         vprAM2zSCJ1d3Neba0fNR1Ek+lSUQwyFik9eIFC68cRwcs2vKceZfRNVpGJPR9jsc1WE
         F6Gw==
X-Forwarded-Encrypted: i=1; AKwUvByy5hv56dr1ERB2lCcXvwC58qrCHx4WYJ/dLLnkmM8wX1UCC0n+gGQwNmI3qn7C4Sh9PSJ4HLhcPOBoQkc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLU7+OlcVLU8jE0Py8uOidbO/xqz6y1hbTsxqG52NhJua5hNzyP
	+5GPmznWJmb7wBYFgXu/+j0aGv70+pSa6MDGv8sOEgkfGcRsGONixm9KCDhr3xGXYpxTAebJZAl
	jprnziPd3UzSNiQ==
X-Received: from plbkk5.prod.google.com ([2002:a17:903:705:b0:2e9:7e8e:b72e])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ebc6:b0:2dd:ad73:c98b with SMTP id d9443c01a7336-2ea43f928abmr2553835ad.35.1792539945981;
 Tue, 20 Oct 2026 16:45:45 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:45:27 -0700
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
Message-ID: <20261020234535.3182385-2-jmattson@google.com>
Subject: [PATCH 1/4] KVM: SVM: Always update LBR MSR intercepts on full MSR
 intercept recalc
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Jim Mattson <jmattson@google.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Like Xu <likexu@tencent.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Split the "already up-to-date" check out of the code that writes the LBR
MSR intercepts, and write the intercepts unconditionally from
svm_recalc_msr_intercepts(), so that changes to userspace MSR filters are
reflected in the MSR permissions map.

svm_recalc_msr_intercepts() is invoked in response to
KVM_REQ_RECALC_INTERCEPTS, which is raised on MSR filter updates.  But
svm->lbr_msrs_intercepted tracks only the interception KVM wants, not
what is actually in the bitmap after the filter is applied.  If the LBR
MSRs are passed through when userspace installs a filter that denies
them, the early return leaves them passed through, and the guest can
access them without exiting to userspace.  Conversely, if a filter
forced interception when LBR virtualization was enabled, relaxing the
filter leaves the MSRs needlessly intercepted.  Either way, the bitmap
remains stale until the next change to LBR_CTL.

Full intercept recalculations are rare (e.g. on RESET/INIT, EFER.SVME
toggles, and CPUID, PERF_CAPABILITIES, and MSR filter updates), and
never happen on nested VMRUN or #VMEXIT, so writing the intercepts there
does not reintroduce the redundant per-VMRUN bitmap updates that the
check was added to avoid.  And because svm_recalc_msr_intercepts()
already unconditionally writes the intercepts for many other MSRs (and
thus marks Hyper-V's nested enlightenments dirty), writing the LBR MSR
intercepts there doesn't introduce any new invalidations.

Add a comment to clarify that lbr_msrs_intercepted reflects KVM's
desired interception, not necessarily the state of the bitmap.

Fixes: 3fa05f96fc08 ("KVM: SVM: Fix redundant updates of LBR MSR intercepts")
Cc: stable@vger.kernel.org
Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/svm/svm.c | 28 +++++++++++++++++++++++-----
 arch/x86/kvm/svm/svm.h |  6 ++++++
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index fe0cba4731b2..55b3ee840365 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -721,14 +721,11 @@ void *svm_alloc_permissions_map(unsigned long size, gfp_t gfp_mask)
 	return pm;
 }
 
-static void svm_recalc_lbr_msr_intercepts(struct kvm_vcpu *vcpu)
+static void svm_set_lbr_msr_intercepts(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_svm *svm = to_svm(vcpu);
 	bool intercept = !(svm->vmcb->control.misc_ctl2 & SVM_MISC2_ENABLE_V_LBR);
 
-	if (intercept == svm->lbr_msrs_intercepted)
-		return;
-
 	svm_set_intercept_for_msr(vcpu, MSR_IA32_LASTBRANCHFROMIP, MSR_TYPE_RW, intercept);
 	svm_set_intercept_for_msr(vcpu, MSR_IA32_LASTBRANCHTOIP, MSR_TYPE_RW, intercept);
 	svm_set_intercept_for_msr(vcpu, MSR_IA32_LASTINTFROMIP, MSR_TYPE_RW, intercept);
@@ -740,6 +737,22 @@ static void svm_recalc_lbr_msr_intercepts(struct kvm_vcpu *vcpu)
 	svm->lbr_msrs_intercepted = intercept;
 }
 
+static void svm_recalc_lbr_msr_intercepts(struct kvm_vcpu *vcpu)
+{
+	struct vcpu_svm *svm = to_svm(vcpu);
+	bool intercept = !(svm->vmcb->control.misc_ctl2 & SVM_MISC2_ENABLE_V_LBR);
+
+	/*
+	 * Skip redundant updates from svm_update_lbrv(), e.g. on every nested
+	 * VMRUN and #VMEXIT.  Note, svm_recalc_msr_intercepts() updates the
+	 * bitmap unconditionally, as userspace MSR filters may have changed.
+	 */
+	if (intercept == svm->lbr_msrs_intercepted)
+		return;
+
+	svm_set_lbr_msr_intercepts(vcpu);
+}
+
 void svm_vcpu_free_msrpm(void *msrpm)
 {
 	__free_pages(virt_to_page(msrpm), get_order(MSRPM_SIZE));
@@ -795,8 +808,13 @@ static void svm_recalc_msr_intercepts(struct kvm_vcpu *vcpu)
 	svm_disable_intercept_for_msr(vcpu, MSR_SYSCALL_MASK, MSR_TYPE_RW);
 #endif
 
+	/*
+	 * Unconditionally refresh the LBR MSR intercepts, as userspace MSR
+	 * filters may have changed, in which case the bitmap may be stale even
+	 * if KVM's desired interception hasn't changed.
+	 */
 	if (lbrv)
-		svm_recalc_lbr_msr_intercepts(vcpu);
+		svm_set_lbr_msr_intercepts(vcpu);
 
 	if (cpu_feature_enabled(X86_FEATURE_IBPB))
 		svm_set_intercept_for_msr(vcpu, MSR_IA32_PRED_CMD, MSR_TYPE_W,
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 84f19026d3e8..62e08d6d4706 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -364,6 +364,12 @@ struct vcpu_svm {
 
 	bool avic_irq_window;
 	bool x2avic_msrs_intercepted;
+
+	/*
+	 * True if KVM wants the LBR MSRs to be intercepted.  Note, userspace MSR
+	 * filters may force interception regardless, i.e. this doesn't
+	 * necessarily reflect the state of the MSR bitmap.
+	 */
 	bool lbr_msrs_intercepted;
 
 	/* Guest GIF value, used when vGIF is not enabled */
-- 
2.56.0.212.g129ede20d9-goog

