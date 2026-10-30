Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395301;
	b=3KaguNfsqfnFUM60wonn9Gl2znJAuLwc5s5R21u+L5QMCHaLHQCRiH+YdZJcO5SE7qGj
	 qFHfZAPDH2HaHfgBjIm0AdsL8Kg1VhcXwjR4LUwvcWrbl1j+g2HTACKpO/8w63tiYLEVr
	 I3xR/NmyKuq0PUHGxSb7f+l/6P+s9v/kmTj8GvMagM6cUJDT2fMSgBjZ8OEJKAuE7HpEw
	 zBj7NptzA7c1mXS2/frnV8GMBUAixv1+BktUGG3yMRUSlst0xO/NQEMi4z3OfpdDKfUDp
	 v5jNTRkcUI2gtDMjlI2jVPMsg7D06vB8mgi2c9wy/MP37YISs5rzrreKaxtsHFvKVJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=5FKhrgmuBOI6zmiBkedaxKopKidBxwZmFCvEG3c53fo=;
	b=Rmm05HPio6+PoSjeIyVMXKrYgZeO1TbIvS2oN/LUL2dIOdv7Bxm2WqLFHQzwuHxdAUai
	 mOj0QyT1xt0dc/l9SzDRQHhbBfUpKJoZGp283xabfgZiNmGnvza0+/VH67Uwa2jZiut5B
	 V1OyHGlD8M42719QOL83ac9TccDxWee+NlyLbO9F9+mqYH3YtyQPXxqoxjVpX+tk8My2G
	 b1Y/NvrglOxRBsebjcjM0Fp33JxsnZlVMOAFcj6cTcmisZ84/uqkko4XQf/qLT/zfn0rC
	 9F1wnt4U9FCdpr4ShsQxdG5MZBe4BSHMQQvYuOx96rNFELrCqHm7+KP59xOz4bE5QFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="ere2/lcc";
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D6560701D1
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60D6560701D1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ere2/lcc
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so1619090a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793395301; x=1794000101; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5FKhrgmuBOI6zmiBkedaxKopKidBxwZmFCvEG3c53fo=;
        b=ere2/lcc27eNxrxNs+g/wtc7nCAhUB6ExrqPny7khKZ7U9gJDx6jNpKUW45FB9WFiO
         Jns71PT+ZtwZ4wW8G/DUQwRrukq9/6q0Ai/b9Yr6Me/oE7dM97JSajHR1qAdUT6+a5B1
         OIHGmJXlrc6rwa86724IhFutpisdDBZ39YjafvmdGNd5i/D6V50mDPG0wPcd+P1stBzD
         p4lVPQ2XIIDXHXXhp8xfaaY+CCruhAeQiMHKCBD/N5tHFrfoBrDMxjcbg7ALtaHpsNHc
         zq7X+u+fv0nMLRpuyG5pvIyB+gudbNmn3zGoSyGTJUQlr4vn19GAZmMkTHwinTiAhDrT
         gT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395301; x=1794000101;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5FKhrgmuBOI6zmiBkedaxKopKidBxwZmFCvEG3c53fo=;
        b=pneqG6YNuEmFUkDAB6DBpi4wnajRjhJmqjkAyT2zpodWEEIvUuOeyfMQO5OTBqGbIw
         Pvu6FQgQAuujOuEjDv9gv64u6B+AkCcMK8OI51U3xSPO7baBPrDm4j8Onfk5OMIH0qu1
         dQGQ34xXnBBHyXMhR+/JO0+pG+BN+qlNhu7CaclYhtAynmoMlFhHmicFMZWeYJNQY7+y
         801yXyHNLpI8pRaJmVxtkwTYRHecK65Kb7YEmdA10xhaEBcyUXuHOk5QEE+e4NMGSkE+
         tPs36TENAOhImHbk2Z1BsuC6KHOjIXsGtQY+mdH24GlLkxFR5pyanhLJEfoZSNDb5enW
         dE6w==
X-Forwarded-Encrypted: i=1; AKwUvByWWhALP8nxhCq1HdRLIaUYaprAnNpLc3Mc0OFrhzE7ngwV9nWRaz8bPecQbc577Ss3RRYxgUmWyC/pPiM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0YyIM2n7SIv+/zmd0D7TV8ak1GRvsVGnX9w3Rc6xJRIoJrZzW
	v59dnQP750S/lb4jofxsOMtQgMAtqRfnpp7ADBKzPgwXqbfaymXf4IistzWfwpUa6D/YxQE14T9
	B7/v4oQ==
X-Received: from pjbpj10.prod.google.com ([2002:a17:90b:4f4a:b0:3ad:6c5f:feb0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e70c:b0:3ab:2737:3393
 with SMTP id 98e67ed59e1d1-3ae89835d94mr2921939a91.40.1793395300614; Fri, 30
 Oct 2026 14:21:40 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 30 Oct 2026 14:21:10 -0700
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
Message-ID: <20261030212112.2598640-23-seanjc@google.com>
Subject: [PATCH v4 22/23] KVM: nVMX: Don't load+put the vCPU when freeing
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
2.56.0.385.gac671c819a-goog

