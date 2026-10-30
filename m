Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793396272;
	b=ahRznvkf/ev7THAjo4Ji4PrD+QH2OFtDBIp085lptIC2fwgUnJwvv8L6TvPwLARcm1g6
	 5kM/1VarjJqxdtrQ9T816XI4KqG418dKC+lsuUbY0WLXxEK01HZGo9xGl5HabsJ1RH0lu
	 WICKda4tIrShXflsDr8dIJJxsX6QHbuVEtxCriK1eaw6vdDQZLW1QVHGou0lYUT5yfeJU
	 1zB5Z06C3Ph3bhfhtYhQEQWmNrLUEGn3zIsU11wURQX9wuPtRSs2dJib1PW9ZqXC8JvKg
	 xvyZQJeXGoojGQJtWz6TPlkWHU1dIGD/zSnvYr1ogkTf5bJmoiBCyqKsdrHaXAI4pkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793396272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=Xhyg5cGPtjP9AGfE0CLRkt6sDAb9YKw1TbZgcTvrTXs=;
	b=PvSD/dFESYGkJHJNVM/pKUGKEHDEwDQWKvwK2bfrqAj9JpvBeRLcx+TovXiPUqOm056m
	 Y6opS7cvzn/zof9Y544YlMryjV4mSPlEv4FtaXydPqKP5OmPGKWmSQ2eUf6tXz/KVJ8oA
	 DLpW1qAB6e5+UgFTl328L2a/2JgrLRsfq13+tyfqC4tToTEnnDxkD7FlT30kiI8HGyh4m
	 y6whwBb6yHEadHms/gsOLKIp/A3/8RB/blOS6XSLAczz5R0nM/sDlcLTXMIehvweDMjO9
	 js7XB5KrGqqvnOOIkydRsPjP5C4ZVyQOm1SSB6aZ9u+gJmxyFU6Tr3LgCj/IhiQ3R6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Vw1vGLMT;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410A2606A325
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 410A2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Vw1vGLMT
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e601800e58so19553995ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793396271; x=1794001071; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Xhyg5cGPtjP9AGfE0CLRkt6sDAb9YKw1TbZgcTvrTXs=;
        b=Vw1vGLMTR8+bHssxG0GuWmdPcNfepqY+zvTLx8HVdZ4SLSk8tKORppFrrA0gJ3hzCu
         OzYMuUZgcCTt8xYwDlyS5aUnnYjsK75dklz5Ccme+03XtJfkqDiuxzvEEYavCWY3lXyT
         9HNCfqEeqdhyU/tgmxRXkciLCkKmv/VvnSYyI/zv6EtEEQNxpElpP3Xsp+eeP1eUe3Us
         AZGUt/15ipd2mBOiJn9nybATlQy/P90RP+XGlMzo6+YbN55TqPmWGxfbyjwoozw0Ql0b
         zwCNij6O1cHFpfjk1z/5g6HSFFPe2vyIHrT5vvW0WDEtwGdcQZyV4Nl61t5+kSWCQbuZ
         ieSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793396271; x=1794001071;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xhyg5cGPtjP9AGfE0CLRkt6sDAb9YKw1TbZgcTvrTXs=;
        b=k8XytKHiMTEqeN0F7x2jHB8t0dAGrY9eRWY5Jrt3ALzcExiZncaWUZnYzW9ywhq/0t
         /oP7DF/fP19m9s3AnkSTNbtyCfaOkvr+sHO22hUn2futB/EjALCjVgdaR6Y4MHdcVxkZ
         K12rvPRE+QU4+w7qpc3WYdz1fYdA7ADuEaNKbut6DibuJsSGux8MwOzxkz0ph+2Lct9G
         1gBXDsJskMbl6/l/QjXha+c7diaks02dRghwT/F7+hSfa+YZM7MbQNqpUHLZp3/UX9hj
         akaysLXIdkap5V37DR4FZJOHoMA6FBh5ySw5gdxNtN67Yp7yEPElAFAXYostQ1b3rLV3
         DcOw==
X-Forwarded-Encrypted: i=1; AKwUvBxmVBbPxAd+9vre4cpK5/6pmC6b6ubwCXrryJWiLbvl+ytYMmHon20ztcV2/SCmzGv6jslnGYKuM8WrWRQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKh6EtbR+wYat+w6cPoVyqEyksHAOLi80xg8d2qVirsj/QyQXkT
	qjAzAUL5p4TzxlwobIVwxb6gEPUIkg8p1L4UVO9IkiFIgX7IMLldHY9Lrsp4FB+xLoLXpWMnRh+
	IaJEnkQ==
X-Received: from plfz5.prod.google.com ([2002:a17:902:d545:b0:2e2:f305:e980])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e5cc:b0:2df:accf:e873
 with SMTP id d9443c01a7336-2eb36415081mr41010915ad.4.1793396270447; Fri, 30
 Oct 2026 14:37:50 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 30 Oct 2026 14:37:43 -0700
In-Reply-To: <20261030213747.2611815-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030213747.2611815-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261030213747.2611815-2-seanjc@google.com>
Subject: [PATCH v3 1/5] KVM: nVMX: Preserve L1-owned bits in CR{0,4} read shadows
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mahmoud Abumandour <ma.mandourr@gmail.com>
Content-Type: text/plain; charset="UTF-8"

When emulating an intercepted MOV CR{0,4} for L2, i.e. when L2 is toggling
CR{0,4} bits that L0 intercepts but L1 does not, explicitly preserve
L1-owned bits in the vmcs02 read shadow instead of subtly relying on the
interception logic to preserve the bits.  For straight MOV instructions,
relying on the interception logic works, because KVM would have synthesized
a nested VM-Exit to L1 if L2 were toggling L1-owned bits, i.e. if L2 were
explicitly changing any of the shadowed bits.

However, for LMSW, which preserves bits 31:4, and conditionally preserves
CR0.PE (bit 0), the effective value being set by L2 can diverge from the
read shadow *without* triggering a nested VM-Exit.  E.g. if CR0.PE=1 in
"hardware", CR0_READ_SHADOW.PE=0, and CR0_GUEST_HOST_MASK.PE=1, then a LMSW
with CR0.PE=0 won't VM-Exit, but will preserve/set CR0.PE=1 in "hardware".

Explicitly preserving the shadowed bits will allow using handle_set_cr0()
to honor L1's guest/host mask when emulating LMSW.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index b341af4c6057..544b7840897c 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -5629,22 +5629,19 @@ static int handle_set_cr0(struct kvm_vcpu *vcpu, unsigned long val)
 {
 	if (is_guest_mode(vcpu)) {
 		struct vmcs12 *vmcs12 = get_vmcs12(vcpu);
-		unsigned long orig_val = val;
+		u64 mask = vmcs12->cr0_guest_host_mask;
 
 		/*
-		 * We get here when L2 changed cr0 in a way that did not change
-		 * any of L1's shadowed bits (see nested_vmx_exit_handled_cr),
-		 * but did change L0 shadowed bits. So we first calculate the
-		 * effective cr0 value that L1 would like to write into the
-		 * hardware. It consists of the L2-owned bits from the new
-		 * value combined with the L1-owned bits from L1's guest_cr0.
+		 * L2 is writing a CR0 value that isn't modifying any of L1's
+		 * shadowed bits (see nested_vmx_exit_handled_cr()), but *is*
+		 * modifying L0 shadowed bits.  Set the "hardware" CR0 and the
+		 * read shadow using the L2-owned bits from the new value,
+		 * combined with the L1-owned bits.
 		 */
-		val = (val & ~vmcs12->cr0_guest_host_mask) |
-			(vmcs12->guest_cr0 & vmcs12->cr0_guest_host_mask);
-
-		if (kvm_set_cr0(vcpu, val))
+		val &= ~mask;
+		if (kvm_set_cr0(vcpu, val | (vmcs12->guest_cr0 & mask)))
 			return 1;
-		vmcs_writel(CR0_READ_SHADOW, orig_val);
+		vmcs_writel(CR0_READ_SHADOW, val | (vmcs12->cr0_read_shadow & mask));
 		return 0;
 	} else {
 		return kvm_set_cr0(vcpu, val);
@@ -5655,14 +5652,13 @@ static int handle_set_cr4(struct kvm_vcpu *vcpu, unsigned long val)
 {
 	if (is_guest_mode(vcpu)) {
 		struct vmcs12 *vmcs12 = get_vmcs12(vcpu);
-		unsigned long orig_val = val;
+		u64 mask = vmcs12->cr4_guest_host_mask;
 
 		/* analogously to handle_set_cr0 */
-		val = (val & ~vmcs12->cr4_guest_host_mask) |
-			(vmcs12->guest_cr4 & vmcs12->cr4_guest_host_mask);
-		if (kvm_set_cr4(vcpu, val))
+		val &= ~mask;
+		if (kvm_set_cr4(vcpu, val | (vmcs12->guest_cr4 & mask)))
 			return 1;
-		vmcs_writel(CR4_READ_SHADOW, orig_val);
+		vmcs_writel(CR4_READ_SHADOW, val | (vmcs12->cr4_read_shadow & mask));
 		return 0;
 	} else
 		return kvm_set_cr4(vcpu, val);
-- 
2.56.0.385.gac671c819a-goog

