Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395294;
	b=HOLc3aRy97NlXM1jme6as2q7ksHHE15CWSwEJlFM6YwCJi6E+c9xzhVf8pvZpmsqx1nT
	 X61qstVUaj0ZJ5Z82lMhQOSLXShVkvLik+vUwrOjH033/ISooL2LqUpP7D3afZCf3W9eh
	 kpPXW8joXLF8TKIXLCzybvZxatA9Dr0xLeIgPHfhQTf8dO8Lsb32gJax887lPq/XNFBHd
	 gfCLJccsy5e90C2WezkOVECkc5LKQceTypVkLPlgp5eogmjZr7LOp+4uRkiMVTGuhjbzt
	 8pBsnmcPCXF6bHrUrWfMkwZe/C5kjg2R5OVePC8unV+sDktZlHsp8vbKILkTsejRGZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=ThXh/PpZVawaCwOY2TL0ZJCsO7ZffHOqKGZR+ZoMMAE=;
	b=qRZgGNtU37dKuJUL10aZQwLCqqOtnIJHOrNjAJSr1CpSg8rtp6VxmDjhFokXyaMsShe6
	 H52/iCe+vcGrgtFpQ7zW9x4tXHZ1tOKVQuTa+QsHZpGWcAlBJSdRYUWKGxbki85wdh6r/
	 E1ktilSQ6Z8h7/3g9ypQSRVgaHweUNa0HDWdXvVWj135P6VNrHhV2mzVcUP18ZOZidg3y
	 rfXrdoApr9jkmSkebwDZHiVHDj6wu5zdeX+EHVXdmbvaYqIkkC5zyDbXCqyaMgWFjV3nc
	 g/dA0IWeCv3MJjkyF/Us//BLeXz2pF8HwEaWnP0nHmIA0v1JZtf2B0AjjRKqRF+8TWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RkmU8gSO;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C98F606CE71
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C98F606CE71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RkmU8gSO
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eb362d1f5eso12109005ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793395293; x=1794000093; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ThXh/PpZVawaCwOY2TL0ZJCsO7ZffHOqKGZR+ZoMMAE=;
        b=RkmU8gSO0fKC8a0ylR/zmMRN0+f1wOiV0ZSK9VQM48njxcic4M/Me1oWDqfYvvbBHT
         kuO/BM3dAYhHqXPA5SOULgl7mb1qfhuRSbD9wkzqa918qY/KPFSeb9mA0fLrYQPYP7dl
         x1Vb0NCuzNtN2PgI02VTN3G6YLlSKbgHpvi5/vdDxLJ5AZKZ9nCuvAsOrvVsdNGAUsst
         KY7SagjkwMgxtazTZJvFM1kmjZ+WgXzgYaZ1yVN3HQPTfPRuHgriB8GrezRdMx4wmA+y
         Q9/M09AEIiEktcNS1QfXI3bh9URB4XP1wKWofO2hrK0pu6mgTV/lfR7bUM0cozNtI8iM
         OmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395293; x=1794000093;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ThXh/PpZVawaCwOY2TL0ZJCsO7ZffHOqKGZR+ZoMMAE=;
        b=TGslpxjD3akIr/SXwonBWBDZvFej9i2HzAsgE64hL1BaKRjoKDPrWCSPhqlx04XiGI
         HH8epeOL8mL0imaCWtnnKd5yUD8XVTgPhjlkz7NkWErDAdu2agwUpp2cjx14ngg85z2s
         1BFkUztspRijE0Kxe3g5aTWzQcBzB0Iq30anHIifFBdjD+7TeVgM8jdATcunw1NbyAfL
         FWvCBg7B5UylM6LWMBlsQz8VbnusBaD3QeivwI8FT8V/yCrr72ojU3nw1mDRWXtpE1la
         Gh6uDxUQrBxJQjwWw2p2u9loy/k2RzEHmB6p+WDse/E7OFYu4h/VXzmkjbmoOgAAr+AD
         S5ag==
X-Forwarded-Encrypted: i=1; AKwUvBxk8ZvxGy+TZOArJyKqhG2QXAsaUYLK2sEEZVBVjzh3PzAPaqtPcbOafrmOeR83fxCfFKiMLnCB8qosdgc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJulwJO18bIkI/MX13AfQfYEEcQTs0inrxf1zaUBrZ+mgbeS5pk
	WBrVud5sAH3GtxQ3TLp3AHhxyKOO0N9tqJOY20JZE8luS2UVXszoBgkhyxdHCUWXbSu/CdQLiHE
	F3AnoYA==
X-Received: from pjbir4.prod.google.com ([2002:a17:90b:4684:b0:3a8:74c5:5a5c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2741:b0:3a0:e4ce:31fd
 with SMTP id 98e67ed59e1d1-3ae896f8304mr3027164a91.10.1793395293218; Fri, 30
 Oct 2026 14:21:33 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 30 Oct 2026 14:21:04 -0700
In-Reply-To: <20261030212112.2598640-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030212112.2598640-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261030212112.2598640-17-seanjc@google.com>
Subject: [PATCH v4 16/23] KVM: VMX: Explicility free vmcs01, not the current
 VMCS, in vCPU free paths
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>, 
	James Houghton <jthoughton@google.com>, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Explicitly free vmcs01 instead of the currently loaded VMCS when freeing a
vCPU, as relying on loaded_vmcs to point at vmcb01 is unnecessarily risky
and confusing.  E.g. during vCPU creation, the error path relies on setting
loaded_vmcs and obfuscates that it should be impossible for vmcb02 to be
allocated, let alone active.  Similarly, if KVM were buggy and left vmcb02
as the current vCPU when freeing a vCPU, operating on loaded_vmcs would hit
a use-after-free *and* leak vmcs01.

Because KVM isn't buggy, no functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index d433cd846ac4..2ef1f634e7ec 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7515,7 +7515,7 @@ void vmx_vcpu_free(struct kvm_vcpu *vcpu)
 		vmx_destroy_pml_buffer(vcpu);
 	free_vpid(vmx->vpid);
 	nested_vmx_free_vcpu(vcpu);
-	free_loaded_vmcs(vmx->loaded_vmcs);
+	free_loaded_vmcs(&vmx->vmcs01);
 	free_page((unsigned long)vmx->ve_info);
 
 	if (vmx_can_use_ipiv(vcpu))
@@ -7614,7 +7614,7 @@ int vmx_vcpu_create(struct kvm_vcpu *vcpu)
 	return 0;
 
 free_vmcs:
-	free_loaded_vmcs(vmx->loaded_vmcs);
+	free_loaded_vmcs(&vmx->vmcs01);
 free_pml:
 	vmx_destroy_pml_buffer(vcpu);
 free_vpid:
-- 
2.56.0.385.gac671c819a-goog

