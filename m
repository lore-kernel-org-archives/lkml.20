Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3809B353A71
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790730806; cv=none; b=crrLhaiqnndFQ3GE30tT04kngG30vb+xpM3mDNp47GO8m5mRmz/ivqs+ekzqdclYWq3TU50P2423AlAknFu9COczC09FKp1x1VRjFHFNCgLFxDK9YDxinx+VyAcMv8+nSBpm1yy0I8gnUyt5wZgcPmmnIiaODPk6WpTQkkXd6Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790730806; c=relaxed/simple;
	bh=MDASNbgoJfxIWQptpUPAjqRzqDBOHMVhcmtonFQohYk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AKBwagciPFlFGl0FFrDExdveZTdYI+hy5NzQIyNsrgq7AT/4doX/pZk3zwJ0HODR8IXbPjaqvbRcmxsIyvIN25mikXJfLm0NEOrzxp7TS2kry1R9x5DalnvXn9XP7gPQYWAp55jrAkkH6gMzp1v38Z/JSjn4aRDzuhikyBMxeTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I1NVx+ap; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I1NVx+ap"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso3966812a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790730802; x=1791335602; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TO3xUvtUv8iOIewFINcG0bzeMMV0ynS9Llc7pxoXl7U=;
        b=I1NVx+aprNI7/YYU+QTxiu9juXQ3XsAyKLx01+MCa9zEFNbVK3oRdRvNwlyA6NNVl4
         C99hdHUFzcv8jzVCW1R0+Evmzrhpz9ma0ILeJMEiTtuoIygns8SEUWrU3hTrhcCaBp0n
         RjPEUl6nzOpnOOGaHNri3ZY4VyoRLDGkw3+2PXgfEBvBKejcvD9O1TYLlDuFZKW590NN
         xIt1Pcn+khu5wIMzwMsAA4JAJiMHqO2jQXueV9bMtdDBG/bZl7V5b/fNVql9fBtWYTlO
         y2KBNkAPWB/fOGcZgoqg9vmazlAdRt0d0OSN01KQaLVniJ6w/c6M90iU0eD+RrlZ1Out
         qEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790730802; x=1791335602;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TO3xUvtUv8iOIewFINcG0bzeMMV0ynS9Llc7pxoXl7U=;
        b=Q5hs3Pi4UsN4GMpz5qVNRPFT+kEt1ibGt2jG16oqyk+ZjqlxWkf9jVR1XBJs7yj1VB
         lsUkAZh11WJ5/8HgYQlPqOIetje3699IzteA+iLDBNI1LiEpCwSTGIYDC+LdcYorlV9u
         r/HjuBxHRIFm8bqc0Up7zPkRkJqo4Rs0x6hVBJDgqWg6bCflAdHXZOVSdjitbqBmZAf6
         WRCj4QftcA8x/NpExgfPvRcASiteLvvLY0Z+fUr6Uza3m1OPwe4DNVkcottTdK2jipvP
         reKwMcxpVXXRaUl2PXPqvopnT3AaL9G6b7EO2flb+QrK0QDr7qWZoVydMIAomxbdYKdc
         Rzjg==
X-Forwarded-Encrypted: i=1; AKwUvBzGW82pQvX2gpi9n/XE4+6LEmrmivUu9SYtXUf3SckH6A6WSvFIhbrFWALn819EVIsfjIv52XuJBKh0BUI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUaGojJfQ6XCix7wjeh73aRNqF5zhlga2guWGI2SYSzjyahBVK
	biAGmMO+ZwF7pjew7+dmWLrb975i9XKKPUWHgRkYYmHPh1TCvLLKFkaAPfD/Nq7CfBOGY5/abd0
	IEOiqFg==
X-Received: from pgdf7.prod.google.com ([2002:a05:6a02:5147:b0:cc7:d161:7ede])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:538f:b0:3a4:b8fd:5d67
 with SMTP id 98e67ed59e1d1-3a4c007afb9mr605851a91.50.1790730802390; Tue, 29
 Sep 2026 18:13:22 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 29 Sep 2026 18:13:07 -0700
In-Reply-To: <20260930011313.3197688-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930011313.3197688-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930011313.3197688-7-seanjc@google.com>
Subject: [PATCH v5 06/12] KVM: x86: Kill off DR6_FIXED_1 to prevent future misuse
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Shivansh Dhiman <shivansh.dhiman@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

Now that the only user of DR6_FIXED_1 is kvm_get_dr6_fixed_1(), drop the
hardcoded macro to force all references to fixed-1 bits to use the vCPU-
aware helper.

Opportunistically reword the comment about DR6_ACTIVE_LOW to explain why
treating fixed-1 bits as active-low is correct (barring a *very* egregious
architectural goof).

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/regs.c |  2 +-
 arch/x86/kvm/regs.h | 10 ++++------
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/regs.c b/arch/x86/kvm/regs.c
index db43ade8ceb1..0c76cf17e884 100644
--- a/arch/x86/kvm/regs.c
+++ b/arch/x86/kvm/regs.c
@@ -774,7 +774,7 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_update_dr7);
 
 unsigned long kvm_get_dr6_fixed_1(struct kvm_vcpu *vcpu)
 {
-	unsigned long fixed = DR6_FIXED_1;
+	unsigned long fixed = DR6_ACTIVE_LOW & ~DR6_VOLATILE;
 
 	if (!guest_cpu_cap_has(vcpu, X86_FEATURE_RTM))
 		fixed |= DR6_RTM;
diff --git a/arch/x86/kvm/regs.h b/arch/x86/kvm/regs.h
index 3ca5cd8a8d95..97c17b120a57 100644
--- a/arch/x86/kvm/regs.h
+++ b/arch/x86/kvm/regs.h
@@ -38,16 +38,14 @@ static_assert(!(KVM_POSSIBLE_CR0_GUEST_BITS & X86_CR0_PDPTR_BITS));
 #define DR6_BT		(1 << 15)
 #define DR6_RTM		(1 << 16)
 /*
- * DR6_ACTIVE_LOW combines fixed-1 and active-low bits.
- * We can regard all the bits in DR6_FIXED_1 as active_low bits;
- * they will never be 0 for now, but when they are defined
- * in the future it will require no code change.
+ * DR6_ACTIVE_LOW combines fixed-1 and active-low bits (bits that are currently
+ * fixed-1 are guaranteed to have active-low semantics if they are ever used to
+ * support a new feature).
  *
- * DR6_ACTIVE_LOW is also used as the init/reset value for DR6.
+ * Note, DR6_ACTIVE_LOW is also the INIT/RESET value for DR6.
  */
 #define DR6_ACTIVE_LOW	0xffff0ff0
 #define DR6_VOLATILE	0x0001e80f
-#define DR6_FIXED_1	(DR6_ACTIVE_LOW & ~DR6_VOLATILE)
 
 #define DR7_BP_EN_MASK	0x000000ff
 #define DR7_GE		(1 << 9)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

