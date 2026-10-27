Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793139152;
	b=3B4kAPI2wR/oybSfQaoi/WeUjjM9FOxJtzG7OiObnxTA+h3qizjT4t3bW6h+64MGQCbc
	 X5d4Uv3ZvdwJBfpl2izF729xxzJzv/+4Rxle4MSVz3ycMq4TayV7V9UqHw5pvBOI+kEtD
	 0adrRWYGRB1kdlVrboZNeyby1UokLcscSUn191OTsznntyosu62z+GDrmhZg9ZMJiMMyZ
	 +Iu8wFrS4e1EjN5CqFT2W4FB9z39dgvpXXIdm2rlXGerwdwJu8S0zpdvzuO2MXVTqpbzx
	 6Tu4AkuYNLtRbE1PMeE9R1eZ48Rb0wK0eMYS/F53lmgMYP/3A+lQrpXuxPhLdbZ2doQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793139152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=uF+GZpKK7NjsO1exIpL/wQvgd3ehG85WpQ6BvbS1JDc=;
	b=F4CZFHsD6/HRvPiv3LFMNbs2AJtY6qroRwmwdUAf2zPCxh2KnNatLJ8ytMefuiVXHvgI
	 S/OtKt+aSLeuUwJ+m+D+QbxEVNhi+747uo59LB17hWcaHqmCbEYrO1IWE+EJ/FY5DXMIR
	 gFuGZ+Pj0pY+ZbXqgnpl/y6ue81TRjFzFlrG/vgaGgh953/JIZ1lND59R0+hDpoN2sYrD
	 43gRDwD61+RBM0FAo3CkZPyxDcbE6nHBfVJF5beuNzYocCiZB8O4NSho74j2joh9uRot4
	 cby8HVn3RsZgQg7MZUWyJ3XA4rSLMkFEEqa3uibkLBnMjMfefH2IZxB/JA7LIdd8Vcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p6UGDPh9;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE5C60A5BCD
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CE5C60A5BCD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p6UGDPh9
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac77c3ff6aso472587a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793139152; x=1793743952; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uF+GZpKK7NjsO1exIpL/wQvgd3ehG85WpQ6BvbS1JDc=;
        b=p6UGDPh9Ftza9g+YHhU9n44XQ4T6B4w6NuwLgO3M/Gq8IqHJ4mI4SJrSSxuEI1QS3o
         dOPsUJTwqH1Q4XGF8l7vNqurH/zycd6eILmoSohEK5A3zikP2SPPBNKn8hVS0aUKQRN6
         YigAUAQzOOgWBQ7BKUlAwU9tFu/sKbDEyVKUkL6Ez9dsN1r0jjifgVU+coS9nAz8+pZV
         LtBrtPMYSrkIm7VUtsKbLdf1xA4P84RsW2GZWzg3Q4v6bfCtaibM2hS3m5IiN36ptHuH
         to8VyrO1JJXlUQuSxg9Y5JxL0gSXzLdz2fp5x2bq2YtWT/jaIUT5IS5a8bSwgPRqkJNf
         vOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793139152; x=1793743952;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uF+GZpKK7NjsO1exIpL/wQvgd3ehG85WpQ6BvbS1JDc=;
        b=2OtGQ1Fuu4UCIQ97GQKdR1mAEgN/FeO/S0QwlfvkhdUVbCrEtCFspCTCYxLqdm6r3M
         TcPusXle1ydqGnPH2D7NZTSbLk8GwYhbLGHQtfnKQqdx209Ydfopj1YSI9ul11pFLKHp
         9VRiq5mGUVbJ9Lugei7bvdyUJ7wol1NGwIZ2Fs2sGkkpGnTXsq8TySgIZ1HANNtXVKaY
         4aiBoJlQjzU8i6sVW2MJwlRRqoqbE9DWQR0GfNa9T5jQ9CdeNwM4VlefN7vY0r/fDDHE
         BUXvTlRUCuVQPXfF0yXhWkt/iaOXzEQRe96zixhRhW/1lB+qy+ggsvZllAgfKymsdcw8
         wYxA==
X-Forwarded-Encrypted: i=1; AKwUvBxNB7dLdAmcmAqQvtPuwpEcz6XLGjctD5WqpmCYj4NVr9j98pzQwnZeLz7hWHJ5+f/ImlLCVIOXPctLhs4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYEoOZAqerrygsnWVG48/aFG2lHLAeZUfASRvWlr5Q80yIOgKD
	SWLgsex7XaCbCnYrBNIBETnDLZ61rOmAChC7ABfZNsuQyhIsU2d77qEEqE9SnNvIuvS8XvN+bD3
	lBvJ4MQ==
X-Received: from pjyp3.prod.google.com ([2002:a17:90a:e703:b0:3a8:28d0:2510])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:17c5:b0:3ad:50a2:9abf
 with SMTP id 98e67ed59e1d1-3ae582adce0mr350233a91.38.1793139151657; Tue, 27
 Oct 2026 15:12:31 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 27 Oct 2026 15:12:08 -0700
In-Reply-To: <20261027221209.1560865-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261027221209.1560865-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261027221209.1560865-16-seanjc@google.com>
Subject: [PATCH v3 15/15] KVM: nVMX: Don't load+put the vCPU when freeing
 nested state for a dying vCPU
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>, 
	James Houghton <jthoughton@google.com>, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Drop the vcpu_{load,put}() pair when freeing nested state for a dying vCPU,
as nothing in what was free_nested() requires the vCPU to be loaded, common
x86 doesn't require the vCPU to be loaded when it's dying (because SVM
never loads the vCPU), KVM now explicitly handles taking the vCPU off the
PI wakeup list (was subtly being handled by vt_vcpu_pi_load()), and the
rest of vmx_vcpu_load() has no effects outside of loading/modifying the
VMCS or vCPU-specific metadata.

As for put(), because the vCPU obviously can't be loaded at the start of
nested_vmx_free_vcpu(), "guest_state_loaded" can't be true and thus
vmx_prepare_switch_to_host() must be a nop.  Similarly, the vCPU can't be
blocking when it's dying, and so vt_vcpu_pi_put() is also a nop (and if
it's not, that would be a fatal bug as it means the vCPU would be left on
the PI wakeup list after being freed).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 4a8f57eb3277..51183520f64a 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -330,7 +330,7 @@ static void nested_put_vmcs12_pages(struct kvm_vcpu *vcpu)
 	vmx->nested.pi_desc = NULL;
 }
 
-static void free_nested(struct kvm_vcpu *vcpu)
+void nested_vmx_free_vcpu(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
 
@@ -390,14 +390,7 @@ static void nested_vmx_do_vmxoff(struct kvm_vcpu *vcpu)
 		free_vmcs(shadow_vmcs);
 	}
 
-	free_nested(vcpu);
-}
-
-void nested_vmx_free_vcpu(struct kvm_vcpu *vcpu)
-{
-	vcpu_load(vcpu);
-	free_nested(vcpu);
-	vcpu_put(vcpu);
+	nested_vmx_free_vcpu(vcpu);
 }
 
 #define EPTP_PA_MASK   GENMASK_ULL(51, 12)
-- 
2.56.0.307.g5fe7bd680c-goog

