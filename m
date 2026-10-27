Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793139146;
	b=wSASVSWyQKuftLOfTgPWMHkzfGpslA78Ny4CRvTOVfs81AFRKAqYw3y6ngMescmCOtK1
	 09q1gBl2ThHt0wZIhDrUjsG5L7Cpp0ztj6eJYvR82vG2Hk6ttrgj/Ad1O2KNOjy/1dfvp
	 MIf3M/XPDk3pI8RXY2+z0mnPC0ouDV2Dshzal6XwrKoNmb+/6c50IAPJIQUhcFzvpDSwE
	 OwaKmNLC1G55QscNpKqLnDRn+g2YAGmc+jAe/dy3F9Xak9TYyJflSvX0TwrU65ny5m6c3
	 fwt1c5SHsOQL9NbceoyUrJ5WUQIykVF/SlxK3D3hQhNJD8HdJkxKzeBP9LGPI9PfGKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793139146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=7KZPmVSe/mbc0d3PV2oDcK5UvV7diSgsE22iAyaAi38=;
	b=DtWk6nzwLJDa2oFkWlMln0dLIyzaAMQ8L1dkh4thIRsNv4ggSIqh28i1sis3braNz/rh
	 wRb5VPZexVsHml9WnehKBZgEQZM4idsn/kR/GeEDaUo5A7HKe4rlkvrrlMfyCIDWWbx5z
	 zPIGPbTEE24OOVwykN9s5HB3tu3zDifnLIdY5zMolWv54F+BvQ/dX8Pf2IxT3iLYAifKs
	 B7oAWyiUAo6EfkH3hv1kGJ/cd7SuuU8Rb6fMrELp+jPxpBpf9iBDugDKEOf/QUWpOlWUU
	 vb5f3JBRk052eV25Mcaqqed5uC9FZR3ObxcTRYydXa9cXXU/19TyGE4eVknUt/nhwaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kkmWDbDm;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645A7606A332
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:12:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 645A7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kkmWDbDm
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdacb64970bso191808a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793139145; x=1793743945; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7KZPmVSe/mbc0d3PV2oDcK5UvV7diSgsE22iAyaAi38=;
        b=kkmWDbDmV1g5+OtfANslIDK/gT5q34IwIbuvNbVqwBDmbGImb0hw8ZSlXkWcOF0Chv
         Iprt3s7qRlCxHCq0VAr/dYdMKZPN3h4JtzC/GAToUI/qqS24dY3ntjSuLP5VTQMc4MiG
         KQvWJeUglGkUkiXXphaqa0sSemWAaUGl2hTjsMAINMsqlVGGavscR7JCHc/y7BGUEMXw
         aOKaiPq+rib8gK/bsEBrRG6O9x8Oi17EeZZGEhjYsNq7W5LhdcZJx8RMogBCjp8v/REZ
         yB4VFw7+Lz0gN9GLqmXZAddtjBckqeaWWrJj/f3VuiSorrXg/qcNqX5Yd8vabYIsbo/P
         YSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793139145; x=1793743945;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7KZPmVSe/mbc0d3PV2oDcK5UvV7diSgsE22iAyaAi38=;
        b=rSOFp0tsatClWQZDFfSwanlC+yRLPE70iAh/IljQA3PIqyw2TOke8Jjba8nkQsJxbi
         2q2GYSqVkKBbrD/C4s7PPmITIMmxsc5QpU/+K4+ksJYQgNloZsTrwJm8uFns9/gb/dW4
         pN8koKWlaDRr6Wqkoga47rrxrcnaGNBIVrVkYfb8v6coW7PUCXT/WzyVdav0qIznEgd3
         HkFcI6T0wvUqSSPJNax2xpHYipWTHTPDr1DN9miHUOBgsBSLqTemprcclXLROASpk4YF
         BkhpmzilAvAF7tsK9DVRxsTI+CPKBKPbDsb48eQy47lxUMEb9l0f5h/wC1wocWuhFs29
         NCFQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4HWbbhpNNefe+z+iMxVGmSufYDJR5x8GJ8YhWI990q6uLOISVZ1BZvqPYXf2o+w4FEX5YCdQ74p4ANU0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrkYsTrpvEEKNQ+UWo4CLRr5lnsUKYuHOW7oFoY09Pl7Ow339+
	Ewm/X2HwLRT5+XhJgAE6QbJOxFmtLRaKRcIc/BQC2Cc2Gy0pXeYfGjmBlMa8sjFBvesV29GNNte
	ZjzkGTw==
X-Received: from pjbdy8.prod.google.com ([2002:a17:90b:6c8:b0:3ac:2cdc:a8ca])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:fd92:b0:3a0:d265:3647
 with SMTP id 98e67ed59e1d1-3ae57e357e5mr211906a91.8.1793139144546; Tue, 27
 Oct 2026 15:12:24 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 27 Oct 2026 15:12:03 -0700
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
Message-ID: <20261027221209.1560865-11-seanjc@google.com>
Subject: [PATCH v3 10/15] KVM: VMX: Explicility free vmcs01, not the current
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
2.56.0.307.g5fe7bd680c-goog

