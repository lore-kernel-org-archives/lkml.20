Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AA73537CD
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790730820; cv=none; b=B/jvgDtPFSMCUaLFWfzW9gl+CkvQZiDVMxyY1vIBFm5UKRnLPi9cdpVtat7cQFKeZTQubX+jerFe+uvxI52c00n3mLzNEoqJP+k2lHPYfrP6mef3u8EexydoiuHanvliOcTNoVoeUkn2tDjUHS4xezmdhXKrJS280KTWtmqTujw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790730820; c=relaxed/simple;
	bh=Jgndf1FLVPtw1RjeBvHSK/j9YvB+rS6M1T9+7Mb9Hxw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=f427qvU/q0W5R7B/2VHg9a0LkVcprWYuij1uBVfpGNtwhTWCWjkdk3ThfO50QvKssbrqJ4khJJuFUXLpMW8aIeF6Y2OzsIKKb0PfxEqw/M25u8hslQjlA2Ql2b2Lb5jOlBuzfsV2iK4zWorSAP9oMJkD6ayamV1CqU2TjaC9z6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qxe1AGu3; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qxe1AGu3"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d9057fab9eso50174835ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790730810; x=1791335610; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5ZPdaAVKbCuct+Drs4hq/dXnJoZKDoPUJjaVzhPw8KY=;
        b=Qxe1AGu3uEYvykLfsD39MKXS9LGYd+PO6Mg+pUNKg6KyLJIBGJc6aWXKExkMNmfF1F
         +VZ18HDcJPvNgsV99So3An9IXqbVV/cJ8JJrj3zQCxH6HvNkRVix6aQCNOUeuB3PRAlY
         V1s1yezXLt5WzdDJ2FX9MYjfDYnGzKujCKjUfC+pHi335X1TVpaObu4+5QcuoEZAR1NF
         QljGiMxUJdCFYTlH7N0cn1PkW5WAZvECvORfoSO60Qt/uUN3gQWszo6UBFAVm7gopzBJ
         DDAOAS3YDJS7ngikymLr8iycL5S6LjNo5DSBjHgQyBoJEiBiS6BjAJIw7nVmqoTI3Nhf
         6mig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790730810; x=1791335610;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5ZPdaAVKbCuct+Drs4hq/dXnJoZKDoPUJjaVzhPw8KY=;
        b=X2/R5+47d9K8gc9ouOlZXlCF1ivDqtd9ikU51husvtYQnUcoD+crg4Pp5VgsOnFsod
         G9sJhSifjZMWO1eIRhinu3KgIfaqYBorYsue3yqV67rv1z6n1UDqL3jQodczmnDUCLVS
         LadBbToH1LofbTLyJcD1/oHBZwruWgJy5FEgOvLh6CNKVHsWC84qcrn7drJ83Bu0XIb+
         qKnMwC2pSMfVS+Q5wHLA1h15KXrmeN1kFzFc7luuyWHGFU3eQrXZTnR790BCBE50QL4L
         7+1JcxZWsZ5UP4CL8etINBzdCnLmyzvA7f12g/VLpQKa3yhtd/+r1VZf0K6Mo6/QAtd2
         ygrw==
X-Forwarded-Encrypted: i=1; AKwUvBxw2c1Dp1ppG9wH6iPaO46h6554wWjht3Yfz/06NpyZp7Y7yyHTRSJvp9HnPSTdt9xtQs9790DCzg9BcSU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHYbXd4xFubCH3eEcBZ1xxTPF6ONRFCXhG4AjxTZ51NsEjb1Is
	IYDkyF9D1sk9gYiCBilLfIKZtd6UGYyh2lFmYpInn7w026DauAWNaT2iWg/EMds840CFfjlPMqu
	+8xq2cg==
X-Received: from plba12.prod.google.com ([2002:a17:903:100c:b0:2e2:cb64:1086])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f710:b0:2df:9a29:aeb2
 with SMTP id d9443c01a7336-2e2de40518emr7268025ad.3.1790730809858; Tue, 29
 Sep 2026 18:13:29 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 29 Sep 2026 18:13:13 -0700
In-Reply-To: <20260930011313.3197688-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930011313.3197688-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930011313.3197688-13-seanjc@google.com>
Subject: [PATCH v5 12/12] KVM: SVM: Add support for virtualizating Bus Lock Detect
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Shivansh Dhiman <shivansh.dhiman@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

From: Ravi Bangoria <ravi.bangoria@amd.com>

Advertise support for virtualizing Bus Lock Detect and allow the guest to
enable BUS_LOCK_DETECT if LBR Virtualization is enabled (Bus Lock Detect is
enabled through MSR_IA32_DEBUGCTLMSR, which context-switched if and only if
LBR Virtualization is enabled).

Signed-off-by: Ravi Bangoria <ravi.bangoria@amd.com>
Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
Co-developed-by: Shivansh Dhiman <shivansh.dhiman@amd.com>
Signed-off-by: Shivansh Dhiman <shivansh.dhiman@amd.com>
[sean: massage changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/svm.c | 12 ++++++++++--
 arch/x86/kvm/svm/svm.h |  7 ++++++-
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 1e58ad8691e9..e7c296c52591 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -879,7 +879,7 @@ static bool svm_need_lbr_virtualization(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_svm *svm = to_svm(vcpu);
 
-	if (svm->vmcb->save.dbgctl & DEBUGCTLMSR_LBR)
+	if (svm->vmcb->save.dbgctl & (DEBUGCTLMSR_LBR | DEBUGCTLMSR_BUS_LOCK_DETECT))
 		return true;
 
 	return is_guest_mode(vcpu) &&
@@ -5712,9 +5712,17 @@ static __init void svm_set_cpu_caps(void)
 	 * Clear capabilities that are automatically configured by common code,
 	 * but that require explicit SVM support (that isn't yet implemented).
 	 */
-	kvm_cpu_cap_clear(X86_FEATURE_BUS_LOCK_DETECT);
 	kvm_cpu_cap_clear(X86_FEATURE_MSR_IMM);
 
+	/*
+	 * LBR Virtualization must be enabled to support BusLockTrap inside the
+	 * guest, since BusLockTrap is enabled through MSR_IA32_DEBUGCTLMSR and
+	 * MSR_IA32_DEBUGCTLMSR is virtualized only if LBR Virtualization is
+	 * enabled.
+	 */
+	if (!lbrv)
+		kvm_cpu_cap_clear(X86_FEATURE_BUS_LOCK_DETECT);
+
 	kvm_setup_xss_caps();
 	kvm_finalize_cpu_caps();
 }
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index c3380d865b75..6d0242966dc8 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -789,7 +789,12 @@ BUILD_SVM_MSR_BITMAP_HELPERS(void, set, __set)
 
 static inline u64 svm_get_supported_debugctl(struct kvm_vcpu *vcpu)
 {
-	return DEBUGCTLMSR_LBR;
+	u64 debugctl = DEBUGCTLMSR_LBR;
+
+	if (guest_cpu_cap_has(vcpu, X86_FEATURE_BUS_LOCK_DETECT))
+		debugctl |= DEBUGCTLMSR_BUS_LOCK_DETECT;
+
+	return debugctl;
 }
 
 /* svm.c */
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

