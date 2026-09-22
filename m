Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50E035950
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790035317; cv=none; b=TV0s1c2VamDWZ4hu9kTXW3+6MSF1u8r3jytCUQaBHtaQXyCzD01erU04C8yYFsP+K9P3XSqmtEVD4l1EL0v3L441tBpAOE7mJezp4zKAp4hwHVbat3gyZjC+JkKVIsnXWLDupcOjtAupgOlQxftBXZcprh50JxZ8+d1UlVGTx8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790035317; c=relaxed/simple;
	bh=qi84eELfBHzq8Gtxf2nmLjCYzLq7UX87oLUR/SOg6jI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=OryLDhf4SXJvV8qXSMPA/h0BwvT0AVXfMgW1facxTLe75ddbp8so9VvXS2FgdIzALOp33mQ4eVzC+LDgSVyspTj3ZdoawENSPLnlbzGLpRi9sMMsz46hRj+gMY6RVqWypurx/0uU8vfsl6gIu+IDOC+jmCFpEW+3wfek5g1Vww0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nrQky3Fm; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nrQky3Fm"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so4893559a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 17:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790035315; x=1790640115; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=or4BumuwV4xPEQU58uCMLkiO/gDvhjBy7N2q2FLMj1g=;
        b=nrQky3Fmk0OfyyhhdhAUtsuArt39Vnxzwe/AGPlEctNRt+wKuGLiYCEhp3mDdjncRL
         YTo83FiUQgsobAfKeInB9rlnDEArNOXNuo1XomMBId9xstokkuim6Lzt7PcLuwwMEqdj
         JhBeBm7ph1OBWnCgqPEaKU+h1bMCp4qYo5UgjuFRWDjCJ0/IpxiaI4S3AuhFrES0Vg7j
         sBW/IqXVkVk2F16+z5ns98g0ku4jK4Mp07TQGOX6gftk6knwLijnY4RE84QTaadlZyds
         qXMCaE4of23AAyKb9Ps1ql4tCgcVqvsygzOgzIFM68qmmZNKgnWQjxIejUBQLa6hMH2n
         rulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790035315; x=1790640115;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=or4BumuwV4xPEQU58uCMLkiO/gDvhjBy7N2q2FLMj1g=;
        b=BqzS4yfBJ/tMX5afBrrOz7pTgrVdZYZ2CXCo1N06QgrmZvfxtV2H5k9YLApmju/gIQ
         x5d4LC9LzJUiU5aYBtrcA2hAln+lkFMXZX48EurRU+q60H0/As5OARz8cLm4F5Ut5eW6
         eML1CMJEqrcyximIzfzHykKQs6bbK/2yWK960w17OlKS26Btgz0EdYlHqJ9PU/7oyugY
         Jjagk9nJOhBlBjyS8wMkVNG7wQNMyXc0yOahjsEkkWy031hfJf/u1clwgqvIVpj+3p8r
         /HtCWoRv+1wDCwMEmZp/fSfI0a+MVqRG/EnBoMrThoCgxoMvoCrLs7R/wh/n2X3i9B0F
         VPDw==
X-Forwarded-Encrypted: i=1; AKwUvBwaMj9IJFApu94niJXN+Vqsrw8g5BZxCXmsVMMUIEe7l5G5y8DUM7BsnsJB6HLsXI6q0FTFj7rEpUCDt4c=@vger.kernel.org
X-Gm-Message-State: AFuF++kZ5jkKgwxtbXI1YCaH3yrow8exRKcTbv1rN07QwPDYLTh4Tdgv
	wVWP2+K1Qw9C5q6hd2B409LCP/1NW7+ynei7b/OyZD88CLSKVKx1NGBlSiZbWuB6AuO4IuUW+Z/
	rhXwrdQ==
X-Received: from pgfd21-n1.prod.google.com ([2002:a05:6a02:6555:10b0:cc7:513b:37d9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:ce49:b0:3da:755f:a031
 with SMTP id adf61e73a8af0-3dd8c4412fbmr22065373637.12.1790035314862; Mon, 21
 Sep 2026 17:01:54 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 21 Sep 2026 17:01:52 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922000152.1113202-1-seanjc@google.com>
Subject: [PATCH] KVM: VMX: Move bus lock handler from main.c => common.h
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Move the bus lock VM-Exit handler, which is basically a one-liner, from
main.c to vmx.h now that to_vt() is usable in common.h.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---

This applies on top of kvm-x86/next + Xiayao's series.  I.e. actually applying
it will be painful for anyone but me at this point, but I'm really just posting
for posterity.

 arch/x86/kvm/vmx/common.h | 11 ++++++++++-
 arch/x86/kvm/vmx/main.c   | 11 -----------
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kvm/vmx/common.h b/arch/x86/kvm/vmx/common.h
index e22c159c3b84..b2905335a2d2 100644
--- a/arch/x86/kvm/vmx/common.h
+++ b/arch/x86/kvm/vmx/common.h
@@ -254,6 +254,15 @@ static inline int __vt_handle_notify(struct kvm_vcpu *vcpu,
 	return 1;
 }
 
-int vt_handle_bus_lock_vmexit(struct kvm_vcpu *vcpu);
+static inline int vt_handle_bus_lock_vmexit(struct kvm_vcpu *vcpu)
+{
+	/*
+	 * Hardware may or may not set the BUS_LOCK_DETECTED flag on BUS_LOCK
+	 * VM-Exits. Unconditionally set the flag here and leave the handling
+	 * to .handle_exit() callback.
+	 */
+	to_vt(vcpu)->exit_reason.bus_lock_detected = true;
+	return 1;
+}
 
 #endif /* __KVM_X86_VMX_COMMON_H */
diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
index c11732cfadf0..2985742e20f1 100644
--- a/arch/x86/kvm/vmx/main.c
+++ b/arch/x86/kvm/vmx/main.c
@@ -872,17 +872,6 @@ static int vt_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
 #define vt_op_tdx_only(name) NULL
 #endif /* CONFIG_KVM_INTEL_TDX */
 
-int vt_handle_bus_lock_vmexit(struct kvm_vcpu *vcpu)
-{
-	/*
-	 * Hardware may or may not set the BUS_LOCK_DETECTED flag on BUS_LOCK
-	 * VM-Exits. Unconditionally set the flag here and leave the handling
-	 * to .handle_exit() callback.
-	 */
-	to_vt(vcpu)->exit_reason.bus_lock_detected = true;
-	return 1;
-}
-
 noinstr void vt_handle_nmi(struct kvm_vcpu *vcpu)
 {
 	if ((u16)vt_get_exit_reason(vcpu).basic != EXIT_REASON_EXCEPTION_NMI ||

base-commit: e1d8e13452eea815042f79244bb649536e3689f5
-- 
2.55.0.1082.g2b9226bbc0-goog

