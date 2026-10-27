Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140243;
	b=NhIrVEJi644QI97he5bI+QHZjh0fBJXJ/vBpvW4WxZxiaWHKjD8jDj0fJ+Hiob1B/Lke
	 smXn7mHWGbFqp4rTKiUt3ELEt6Kg9wKdD2Lk7WWIP9u3Zfk3EWnhqI3SPuWQ8hbI26DSj
	 lT6BvbV2sxQs8nQAZkKUnEVx895LfXmoh7KofMQbOaOYREO+la6m0iH6OVknXqGUJtZLw
	 FQmUzwUAUr5Eg3UNhkhSJOepI8KQqRnilrw2O4lViha4A5Dz8sMG5QNmY/Iuxudf7rlsL
	 sf3wMh+FcALpR5WKdRQUKLGeNkjXERLen543HteJ3cikITqKGEgjm2sGL+Zcm+gwMfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=BoPUymxOglcKvNzSLxc2ZHRNuJgwJeLzW+FbyED8JEk=;
	b=pr0skDRzD3mEg7jbjhCegigjRWanWEUydfTwmaY4+qSOp7aczOGIX8uOz8bwYezTG4Py
	 0bCDvuEy51dGlqQBhMeuPuYFxGtZ7LyzUFPxssFiFbuJrb3mTY7Xn8z5edx6m524E40+T
	 JLTV7xOo8DiOwfZqm70K1b/PyU/Uf7iFNaz1Kf+sMqrXlTg1C61U0fwHiC6BJ5widYX4Y
	 e1th5ajbhnKxRzF1ehboBwRZ6k/lrpwqCk98e8TD6c+g+bAOTl/w+k+Kfl0KxCJnlwcu9
	 BaFn/C4omDkBsitUDXq2JZ6uxbJULDuk3xxNPDOi6OtIELJMQr95zv+c6joF+Sciwzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jyAK7mlt;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558A1606A329
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 558A1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jyAK7mlt
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so368168a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793140243; x=1793745043; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BoPUymxOglcKvNzSLxc2ZHRNuJgwJeLzW+FbyED8JEk=;
        b=jyAK7mltDDLF55BUGL0gZ9XgqjgHYfNVYN3pF5fCNlieCcjG/7JJ0V4SDgyIpBiN/n
         JZBLPqzWj+8ufNC6pVei+0NAo0hcDQU1X2lhURVxkUZZtns4+EBZgzwD60y536vG15fz
         GgQ1NQ1wrFFpOJe+gP0MEV0vUxyiYDe+MWbPeoY5URJaLTvzInzMrOKWcKIg58DQ95uS
         pVJcz8G8lbXia6lLQ4Qir86ZI1PAJ4sV16ff3yfqxaVv5JDGddVmfZGxrEbqQIZWcf+f
         3gAIIcZz/Hdwl1u4rplelobWDcMfqW+wmqSPY8huaHpK2CyAbSkFzWStyal15HwwLNPm
         feDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140243; x=1793745043;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BoPUymxOglcKvNzSLxc2ZHRNuJgwJeLzW+FbyED8JEk=;
        b=IwUHHl6smXbV9q+Fusi18oarfzXR6c2J/wHWoUBghYKLm/Y/o7GKUEsyLOJXZMQVmN
         x4X2ynv1jm/f/IFdQUQMSYYCBwB22lsGy5OmNFZy6enYWj3JBITDpBw1SoDxfjce6mmw
         mFCTyAxMjVwelQPxDSBNhIPE3ctOwd2M6XjDs74GANl49w3AS1SCwYHpEWkDVwwSQyLb
         Fvo0B3vleiwNOkJZI18+QHZFwN4qN/s7YL0zpKt6ZuDOOOjqVo+kEswJye/pxFBAOekp
         80ohPKG6mApoZ3hu82nj+frOqtW54xyJBMBzATQ6qJ1u1E3Ge4XrY7/QM0O6L2DCddtv
         Jybg==
X-Forwarded-Encrypted: i=1; AKwUvBxtkRVtgPVDq/1fuxgYbK9ict7Iym/WN3GE5gwLiEBeKV391zxNBG3BF6qSuMFax/C/ctyozGT+zpmp1LU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvzth4lN27TX1RFbEbnFOKnsNo5JghngnYF8odzxl+oN/NCgns
	sLMbzIKVDkxOCOPAKhWqr1FjWxzyW10BBRc3y8TNxH8H6JiXx2ZawvY8IxRsrmFaFCmiTyAJMre
	xeJ5J5A==
X-Received: from pgp3-n1.prod.google.com ([2002:a05:6a02:62c3:10b0:cc4:aa77:305b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6f91:b0:3e2:a0a4:8ab2
 with SMTP id adf61e73a8af0-3e9020cfb89mr533497637.2.1793140242552; Tue, 27
 Oct 2026 15:30:42 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 27 Oct 2026 15:30:36 -0700
In-Reply-To: <20261027223038.1566931-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261027223038.1566931-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261027223038.1566931-2-seanjc@google.com>
Subject: [PATCH v3 1/3] KVM: VMX: Update EOI bitmaps even if APICv is
 (temporarily) inhibited
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>, 
	Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
Content-Type: text/plain; charset="UTF-8"

As KVM does with IRTEs for device posted interrupts, update the EOI bitmaps
if APICv *can* be enabled for the vCPU, not just if APICv is *currently*
enabled and active.  I.e. keep the bitmaps up-to-date at all times so that
KVM doesn't need to refresh the bitmaps if APICv is unhibited in the future.

In the worst case scenario, failure to update the EOI bitmaps means KVM
could miss an EOI and effectively break level-triggered IRQs, e.g. if a GSI
routing change occurred while APICv was inhibitied.

Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-180887@kernel.org
Fixes: d62caabb41f3 ("kvm/x86: per-vcpu apicv deactivation support")
Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index b341af4c6057..d8e66d67138f 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7079,7 +7079,7 @@ int vmx_sync_pir_to_irr(struct kvm_vcpu *vcpu)
 
 void vmx_load_eoi_exitmap(struct kvm_vcpu *vcpu, u64 *eoi_exit_bitmap)
 {
-	if (!kvm_vcpu_apicv_active(vcpu))
+	if (!lapic_in_kernel(vcpu) || !enable_apicv)
 		return;
 
 	vmcs_write64(EOI_EXIT_BITMAP0, eoi_exit_bitmap[0]);
-- 
2.56.0.307.g5fe7bd680c-goog

