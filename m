Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A83353A67
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790730806; cv=none; b=u3myX72jRiJEildgg3FjX7zavvFEso/si2z281KxUQOAX1L7pANuWwWrcuQyrc7dDnjxQrGw9pMEJMMuJCY2pE7phrj/b+I5M9nAZyyAhyymMqk4N9xd/OIm6L1/kNxAp24b/dSlAuUweAAhG36lKrpaR6d21wgTuLIq03BgoZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790730806; c=relaxed/simple;
	bh=tCrIlqLt20X+8QwPEakDZKkBLPFzZNWoPctoUpEuH7g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Az3gUgOTq//oidySI7vsC7MSLzXSFQcFxPGx53bcgD8nnTzUahM/9TXvrmmBT/cAk8iFs3vcTW5vy+3Jcy7eobqWDVfTHWnh0wj8MlldNIFYiTs/6lvQB7zfEaGesNBo9cuJgGt7k9YlFq6wFXjjaOGVLfjQ8Wq3/W2CLi7TvDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gxUiz5ic; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gxUiz5ic"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc489e7a701so5925749a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790730804; x=1791335604; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WJqez9q2tYMQl9vJL63He7+wJRl5rjTer8kQlPmkiLQ=;
        b=gxUiz5icTkKT5kEbOBrzL2imP7+3xaZws2stDHIoKqRrF1qDYWIOWMLZBcwHJnKRDU
         hnUJ4VEJNan0L7dLxL8E0XcCx2FxuOoM/b/1UU6ehyA/eLUg+PgW8zAnmT8c0UUO43eY
         NBkbG3Eyyj4TKAl3gxQ51f1qoFDaiJ+6XbIb25xrqSgZ4j5RegTIdYnAC4GpuveFoczJ
         gRZhTbzgRcSDKlgCH1nP+l9iVvFAi190Dp4CuoOgJUCvD6uC3ZqP1yxccfYx5mfn0g9h
         x/3IaLXzRb92fmyTNm9V5fwNHrpMl6E9BK/qxXKV/C+NUYundEjCqPzQU+yuNAKDK+ua
         UjOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790730804; x=1791335604;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WJqez9q2tYMQl9vJL63He7+wJRl5rjTer8kQlPmkiLQ=;
        b=QwQDtd7U5wPnUxp8CnHG1MCJFWcJkRhBCoIwABRr5y3a+tG2qwIJ8z+HCRsCbyo9ix
         jwahLbGP3hPV9mYqoZu49nXTa1sP+znKch3CkNIyo5VIt6vp3N2w+INggISlxkh5ohAO
         Tn5SPIo9q7QRBJMcXnmBoQ6s3qWwEsDjo1IT4XBenAushN5MjKkgIWJDt66CuT4mquUv
         L41fSIpBHn0KeLHS62GAZzs9riIS4qIvfJtCc34HMScLXvlUqSrhYHN3m5eQgRwk89ez
         n8/nC6gIo0ZVsZN3eX2rdtr0T667ya2ZJaEcOoI1nuYN6XHf7MZBCkalnVr9uDf6QJN1
         z2Zg==
X-Forwarded-Encrypted: i=1; AKwUvBzfVeFXdCICmui2FPJ/t2ypFQQbmMFtrQOYwVmQN6o2l4ueG2SqBNCN/LtatbGhPAISnxWG1pnLSBvlRlI=@vger.kernel.org
X-Gm-Message-State: AFuF++kLYy6jg1jcRVS2rNqFrrNQeT1x8gfivn+t/349pehiAcmL2XBD
	/7jBhe8nyURb4qepXq7qogK89Xjb1czrN69tlXZpaJEgcz/tKagB7hQYagu3LUlQR+HfD8m2EBl
	gAGwqNw==
X-Received: from pgdu12.prod.google.com ([2002:a05:6a02:2f4c:b0:cc4:c617:a4e5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:e8a:b0:3bf:5b7a:fc8b
 with SMTP id adf61e73a8af0-3de9492184fmr858747637.0.1790730803662; Tue, 29
 Sep 2026 18:13:23 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 29 Sep 2026 18:13:08 -0700
In-Reply-To: <20260930011313.3197688-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930011313.3197688-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930011313.3197688-8-seanjc@google.com>
Subject: [PATCH v5 07/12] KVM: SVM: Add helper to query if LBR virtualization
 needs to be enabled
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Shivansh Dhiman <shivansh.dhiman@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

Extract the logic for determining whether or not LBR virtualization needs
to be enabled into a helper in anticipation of growing the list of features
that depend on LBR virtualization.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/svm.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 0eb1623052c1..775eccfb7b24 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -875,13 +875,22 @@ static void __svm_disable_lbrv(struct kvm_vcpu *vcpu)
 	to_svm(vcpu)->vmcb->control.misc_ctl2 &= ~SVM_MISC2_ENABLE_V_LBR;
 }
 
+static bool svm_need_lbr_virtualization(struct kvm_vcpu *vcpu)
+{
+	struct vcpu_svm *svm = to_svm(vcpu);
+
+	if (svm->vmcb->save.dbgctl & DEBUGCTLMSR_LBR)
+		return true;
+
+	return is_guest_mode(vcpu) && guest_cpu_cap_has(vcpu, X86_FEATURE_LBRV) &&
+	       (svm->nested.ctl.misc_ctl2 & SVM_MISC2_ENABLE_V_LBR);
+}
+
 void svm_update_lbrv(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_svm *svm = to_svm(vcpu);
 	bool current_enable_lbrv = svm->vmcb->control.misc_ctl2 & SVM_MISC2_ENABLE_V_LBR;
-	bool enable_lbrv = (svm->vmcb->save.dbgctl & DEBUGCTLMSR_LBR) ||
-			    (is_guest_mode(vcpu) && guest_cpu_cap_has(vcpu, X86_FEATURE_LBRV) &&
-			    (svm->nested.ctl.misc_ctl2 & SVM_MISC2_ENABLE_V_LBR));
+	bool enable_lbrv = svm_need_lbr_virtualization(vcpu);
 
 	if (enable_lbrv && !current_enable_lbrv)
 		__svm_enable_lbrv(vcpu);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

