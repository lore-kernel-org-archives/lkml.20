Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395300;
	b=ufQ9YU9RXbWSSd+BWF09i4AVAMDAtD8KELfQEm5hNGDVhlKqE71nLC1sFcu1s1ajPq2z
	 LIIN+Mw1rXaM2Xs5QWfstUIvfhICdLaPaPxLnDgyClPN0F1guMsiWLdmZpJc/dk3mGCY4
	 w7Y2FO2/riGB24JDItd5HMq8OXABs0zLpH9VXmXO3ewrmy4TZrhaTZ7el9Pgyp4Yo7tIO
	 3T0Pco0OMwninIUZZnhG54pkKSj4PXyo7dnpjv8n6cv4qNMdGUu9UAmuMORl78Hv9ZWPW
	 Qm3A2w3IxhzUWclUD53lGkqvb3aHiI+ThQJAceR+CXSZiOp9nLa3FmQaZdgWjMfPvpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=ceuCOM2fbzBxVJGWrb7TFjcOc/THvEWLPHPqQKuhuMg=;
	b=xolF1VSiuxcYn6ndx7+qqW+f95IVWVIG4Q6pnvvM9UfTUFE95cPuFZwaiZrw3+p28sR/
	 NOOZTHDAsZcu8Ci98y6HdDdGaGROKfum85ATEF29aKINbtHTXKjt4t8qTdAg4id66Wq24
	 qOSicSgCNX+HTpmMoBTMIjNZfcIvOtKNmSZgP2Rt0nUBY3klAvz5sHGc4EZtZDcsByQMh
	 O++k9vs19USbLn6V1ewgrFhcIcIKXOpystMM3LF0JmdfpfuXrheqkro3yAgDg81gSkZ7j
	 D3fjzmTXMbQ/zDVJgfpA+sT0oQtqAp+mRua1Ms62Yf5SiG+Y76zoFXaKMkR9y0e67zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g96wFLie;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6DA606F76D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D6DA606F76D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g96wFLie
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae6fda7a00so1191866a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793395299; x=1794000099; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ceuCOM2fbzBxVJGWrb7TFjcOc/THvEWLPHPqQKuhuMg=;
        b=g96wFLie+enKr17tEAjEtV0JweTKX6BfzxHvqFM7g/OkmEQB0V/g2uTcvEHLrNuk3b
         hzXTgeJqX7zQJICg/im7PPrysdRGaikyxQILlsiovcki4eRHS+kF7ZuU5BxC4ihBnIAD
         Kymuzxiq/jL5+o2Ff20OXQZuQ/v6p+wwCg76Ph/a/pMGS4r/d6vev11+R69EaSyFKbhd
         KUwCQf8G2MSUIfgjendmuO6fowjt1G/DBrx19K0QX80NoiGDtOuOQun1104LZirwHqwm
         XDxSJN/6TzDHt0zUaj/4X3nBBVqg1XOm6qP1eWefYf6I2GPQqNOGHTF3HYYXYIoxJd0+
         5n8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395299; x=1794000099;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ceuCOM2fbzBxVJGWrb7TFjcOc/THvEWLPHPqQKuhuMg=;
        b=RTYedgQLavjlxYLDSAmHAqp//Hiof3BeN9FPaYmh9iL6KaZJrtJY27IQp3yoNnOJgR
         79F7N9r18rHag1BCASh2KDBdrY0NteUj6dnhLRUpVJ2ZBCDzNasSsTks2kMODsaW1YtZ
         C6cBJJD97iTTTx/XwVdQSh320ecXtYPp1WWo5c68LxSN3WQ4jZY29Zphya2m4GDs1lzp
         /73tplkfZJKZN/Fvv1lLgEJlJxjSPlamdGgM0rUjoHh534QQ6yAx8eFOiwWckCoAZBns
         /rTNXfNN8mWTR/CdvLbD/lo0YDNLCG6gQqfY7qDNXhpFNVNbbMypdY/S5qbLTaVxSb1K
         hI4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzfV2LXhTay3HizmQ9w8gZ2kI/0wYHnsS06tHO5QtFtVZiRUJHn7A6UgP6E74Ig8efK8HHeFn4uDvvfpvw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZKugUkuBw6YW9tsLh7psmSdvF8D97t+lB/h3xyfuT7GpTsgsd
	dWfF5ALMa0605jfCTK1ZfYUDhfyPW4fgGtRi8YBIcdMbWxhhtZ3MkW5ZNStHZIq1c3Xx/1wzpmi
	4axhnwg==
X-Received: from pjbgj14.prod.google.com ([2002:a17:90b:108e:b0:3a4:fb9f:4a65])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c07:b0:3ad:a17d:f46c
 with SMTP id 98e67ed59e1d1-3ae8982bcf3mr2740137a91.62.1793395299370; Fri, 30
 Oct 2026 14:21:39 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 30 Oct 2026 14:21:09 -0700
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
Message-ID: <20261030212112.2598640-22-seanjc@google.com>
Subject: [PATCH v4 21/23] KVM: nVMX: Don't switch to vmcs01 when freeing a vCPU
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>, 
	James Houghton <jthoughton@google.com>, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Now that neither free_nested() nor vmx_vcpu_free() relies on vmcs01 being
the active VMCS, don't bother switching to L1 and thus vmcs01 when freeing
nested state.

Temporarily keep the vcpu_{load,put}() pair even though the only reason the
vCPU needed to be loaded was to be able to do vmx_switch_vmcs(), as there
was at least one *known* side effect of doing vcpu_load() that KVM was
subtly relying on (taking the vCPU off the PI wakeup list).  I.e. defer
dropping the superfluous load+put to a separate patch so that there's a
dedicated bisection point if there are more lurking dependencies.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 553915015a75..4a8f57eb3277 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -393,19 +393,9 @@ static void nested_vmx_do_vmxoff(struct kvm_vcpu *vcpu)
 	free_nested(vcpu);
 }
 
-/*
- * Ensure that the current vmcs of the logical processor is the
- * vmcs01 of the vcpu before calling free_nested().
- */
 void nested_vmx_free_vcpu(struct kvm_vcpu *vcpu)
 {
-	struct vcpu_vmx *vmx = to_vmx(vcpu);
-
 	vcpu_load(vcpu);
-	if (is_guest_mode(vcpu)) {
-		leave_guest_mode(vcpu);
-		vmx_switch_vmcs(vcpu, &vmx->vmcs01);
-	}
 	free_nested(vcpu);
 	vcpu_put(vcpu);
 }
-- 
2.56.0.385.gac671c819a-goog

