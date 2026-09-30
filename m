Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8A951DE18
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790803120; cv=none; b=PaSB1SEIWIjcBVXxSw3PQNxr28pRYH18w6lVayyDXAv7gzeoCNcw1TCSfrml4ykG9KfjISQu1ObTG2x7TUkrp8katvA1LGVWHDA0Dh6xeJDp+5EG3Ag4koFVLMJ+dfvWldIQm+P5QvnChnB8+M1Fb+g3RhAWpBps/N56FrVgLds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790803120; c=relaxed/simple;
	bh=D4RW4eqr7X/vrgI4ObQ8n39ajzCRfOk16wd5+OQqtL0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WxU8rGJStroIFhHUFvGnw6zxmXt9OChaDRA1L47bM9OdG7hpBnYwH77qjMXTgUcNi/NqHpWKtpCEiOkPOEW1Etymz3w64w8W735ryuFl6uSRVdX+yRM1ucP+WuBt4pssIESqaYDRqrw1uooAz6Q98Ty9VMhjHAX4nYkRZHTbMWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IkILSlu8; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IkILSlu8"
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4cc89e86e4dso8825527b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790803117; x=1791407917; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o3da3ndZkq5JxsBN5E/e/pVYoGrUCtX487+oH/FKdMc=;
        b=IkILSlu8YyhvoTbVxfCrq7DGhnU0kBgDYRKCZwRt+j7NavDgr7K67TsB2Si0q5vvaK
         bgmHyrzbRe+fDJ7OF6sQieHYNxTPavk0RqJdb093yRwic7sr0CdMGplJ2OoI4ieWiRMA
         kc3Cvf70+iOVXJ5Yz2r0su7367fbZ4wQaz2Dg1dHi7rI/Vdq04inwttpykb7IO2dZRwz
         IJjG2+JkXUxTcxSZurFPnEdC8t4xF/I2ceKTllMPuVPz1JBS7jJMCD+4Bw7YI8FGjRm3
         lzk5OMheny3RVctusW6szzGYuVgoA4ewahUFYAjoizRyKwUeVTRDnpF4Z4wh+SIfzwW7
         dbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790803117; x=1791407917;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o3da3ndZkq5JxsBN5E/e/pVYoGrUCtX487+oH/FKdMc=;
        b=swUqslpEJgdj+8fSacPQrU5fiGihQkCKPJBQBIlmD0pUnF0baAnYX2R0DE/aVx7E1N
         clsJNjSs6Nls+mXV8l1TAU+SgJdE1zoFh7VII33MdGiezH2oOWAVtbhmSkMhnkaJmX57
         ENP5klnFp5XZ5hMEtJdNxKub7LKMzcw1v2VgcppMeTRUsnFehyMq9/3TfZWxnrbHdpXt
         jnGkW75N3ffZARDZRn8t5OA8w0HGKewQfN35Qbnou9fEiJLtovEyl+cs5egyRzeA7aTI
         ZeuMhk/pTWDrZ0KOVl6S2OUTfMkKUXmNt27vAd4vgh9AZzMA7EYsfwF8txwO4TV//FOv
         YUaA==
X-Forwarded-Encrypted: i=1; AKwUvBxjfQIKJMksHKsreKEYDuBKL25zBX8cq2X29zddGUH4DffGr3FK2lgV7IVSWTAYiVjpB1ejaqMqWEHjaQE=@vger.kernel.org
X-Gm-Message-State: AFuF++nD2LqcOQdEG+MTfaXPsiNRJmaM/VtzSxjlXpctxT7bCxlPW8tM
	irKTigjVLUx/rjFhIR6LiTRJTbx+We2RCOYzwBc/bRJLBx/MXIm94OC0oZb2O2sIVGmcvInczOX
	PCOJJdz2dWqPmeOlDrsn5mCibFw==
X-Received: from iobir24.prod.google.com ([2002:a05:6602:7158:b0:9c3:8b15:2c82])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:138b:b0:4e8:d530:daf6 with SMTP id 5614622812f47-4f1b6c6e13fmr3792236b6e.26.1790803116491;
 Wed, 30 Sep 2026 14:18:36 -0700 (PDT)
Date: Wed, 30 Sep 2026 21:18:34 +0000
In-Reply-To: <20260930211834.2773546-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930211834.2773546-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930211834.2773546-3-coltonlewis@google.com>
Subject: [PATCH v2 2/2] KVM: arm64: Check ID_AA64DFR0_EL1.PMUVer in pmu_visibility()
From: Colton Lewis <coltonlewis@google.com>
To: kvmarm@lists.linux.dev
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, pbonzini@redhat.com, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

pmu_visibility() currently checks kvm_vcpu_has_pmu(), which only tests
whether the vCPU was initialized with KVM_ARM_VCPU_PMU_V3. If userspace
initializes a vCPU with KVM_ARM_VCPU_PMU_V3 and subsequently hides
FEAT_PMUv3 via ID_AA64DFR0_EL1.PMUVer, KVM continues to expose the PMU
system registers instead of emulating guest accesses as UNDEF.

Check ID_AA64DFR0_EL1.PMUVer directly via kvm_has_feat() in
pmu_visibility() so that PMU system registers are marked REG_HIDDEN
whenever FEAT_PMUv3 is not advertised in the ID registers.

Suggested-by: Oliver Upton <oupton@kernel.org>
Assisted-by: LLM
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/sys_regs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index e4ad9c171c7ca..46dd6e16de28e 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1029,7 +1029,7 @@ static unsigned int hidden_visibility(const struct kvm_vcpu *vcpu,
 static unsigned int pmu_visibility(const struct kvm_vcpu *vcpu,
 				   const struct sys_reg_desc *r)
 {
-	if (kvm_vcpu_has_pmu(vcpu))
+	if (kvm_has_feat(vcpu->kvm, ID_AA64DFR0_EL1, PMUVer, IMP))
 		return 0;
 
 	return REG_HIDDEN;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

