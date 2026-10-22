Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792636097;
	b=bHROWkY7DVX1B/k7wOkM62SSW/OQtwa24G+incXYnNwPWGmvSJhDIkp2gCyYEQPzNoFQ
	 qdjTbWxIvDA9GOGxTzODucAvYvq350glSDrD182XL/+Kn+0/rbUuC7EZz28HcsGYIeSwm
	 80Jc9sc3FX9jw9iFtk2cuitXCNonZhsGErSMw436ih/8vGyLu/cJDd3XPKngs/Cijd9qu
	 FWY/ZNlFIRO/IDJLfrmO2wLe4LkyP+eSdroEWtq5fH/Y7B/zYGAHMlGreCVb+PswqkW55
	 uCX/ZPcBRE2hRqW1ooUZzTTlhDqYtl6RZ1PkGh0nQRpJxx6hTb+uMcU5UK30lBIw7Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792636097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=WPfHOvXnP2pKxcZMYBNtzP6lSrkoM1jHg8H216tgeOs=;
	b=0SBMUfnMhw50FFIMc+ETw/TEQIR3xSwwEV2KmLmZ1y++8hmzoE01OqC/ii3OPeSFv1ZJ
	 Ty+zcM7dokl8x89RsKZlfSGehvipr9PO47Uu0iVR6u0oj5xH7xsqMwfY45jyfJfQqe29U
	 zBD3/gu7RrFGC3uYFYwoePBRoMWuNClVFbktqkTIhHGmyKhtfXx6GRhul3ddWWLNxZ/f0
	 2lixyWkKJdBap6miScymEhFst6kZ0/XL0N8NkuZJzLTByzd4GyliWtKaAmiUVRhZZAGRS
	 onVWTuygWKZDt4kDZ7r1S9a93NdEsjWM+k6R+6DZbqVcmmfaH3au5zXuEzL5VQBbK5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jwyrxAbQ;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516B0606A324
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 516B0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jwyrxAbQ
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-88c768885b4so1749003b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792636097; x=1793240897; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WPfHOvXnP2pKxcZMYBNtzP6lSrkoM1jHg8H216tgeOs=;
        b=jwyrxAbQ4bOb1X2JyCnE44KugX9B+o7wIyrOXYBJUdAfBVhufdhhZDaG/Q41E1rDi2
         utJ9Y+sD/IKnafWGI7fWTUCRix9ZLtbAt5E5aXsQLRCeuq5GBoQjbg8zOBlRy54xbpl8
         M1gYYyWhX/VYg8fGvR8RrWkPhmJpfJFrPTtpd04ojR2PXkk/2aU/biU/o1GpBEzHFkNT
         p1aeodPltuaeXdcYNedEUQ4VUPOHKC7OM26D/t9PAOtlVaGQqkvSrPSkVBcVX8tIZmI9
         HFJPtvhA2/48i0nPWZEfwVhAgDyNi3bx/qeQZCga0tOiSK70W+JEqZJpGsBLNg9cM2t9
         8BvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792636097; x=1793240897;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WPfHOvXnP2pKxcZMYBNtzP6lSrkoM1jHg8H216tgeOs=;
        b=c/aLf01XFzBEV7su5JOH/cRatozlSOJLsuU5f9RGRRQ1eg3Z8ZhdFLZSyI/41BFE86
         uqKRqHomj3BwIBbKf8jh6mqcgrrgLFo6zZgMmeVwmzJz/9/1s6ziDKV9w1RBLPDSVuBI
         utQ/tQtYBmJXoBIigd5C35etKo9l36BDWziMxbsmy2kX3YRSvSCRv2/r0XOLvSsr3sC9
         w9L6XKZW2SkRYdFij8jyk1f/ZibUP7/kRNcpesMzoUCCe2N92wbAhEEiCwootbKyCUZQ
         /FhbC5EZtAnZHQF5rV1aftNJ4+xqNb8D6RpHcNsNRcBXPthOH/WoTAUA7U+XNNnRTy4F
         uShg==
X-Forwarded-Encrypted: i=1; AKwUvBz+1Ab4mJ2yIjlR/vaO1rPd6hqzzPQBNWgnf60D8gqsUcRmD/PFwb8r2PwUNnkIqI6ymbhNYtT9dCfmzpg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUd4g24Hjzkfhs90ISbSUsJ0pazpoU31Rob1F2ib/gG78aQbGJ
	J7CcRj/8LJLdYYh5KHMKRGXI5LAHwV7W3RvL+VMa1B97nAuqH7sGrEdduol8SmnzkLryaogvP6R
	3VNc/vg==
X-Received: from pfhh4.prod.google.com ([2002:a05:6a00:2304:b0:88f:2ad7:b21c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:a24b:b0:882:7bed:3b3b
 with SMTP id d2e1a72fcca58-8a089e99514mr3069913b3a.36.1792636096488; Wed, 21
 Oct 2026 19:28:16 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 21 Oct 2026 19:28:12 -0700
In-Reply-To: <20261022022813.303978-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022022813.303978-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261022022813.303978-2-seanjc@google.com>
Subject: [PATCH v2 1/2] KVM: x86: Switch to vmcs01 to update EOI exiting
 bitmap on-demand if L2 is active
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
Content-Type: text/plain; charset="UTF-8"

If KVM needs to update the EOI bitmap while L2 is running, temporarily load
vmcs01 and immediately refresh the bitmap in vmcs01 instead of deferring
the update until the next nested VM-Exit.  I.e. give the EOI bitmap the
same treatment as the many other updates that were previously deferred.

Reported-by: Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
Closes: https://lore.kernel.org/all/20261017093016.32348-2-amirmohammad.eftekhar@cispa.de
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  2 +-
 arch/x86/kvm/regs.h             |  6 ------
 arch/x86/kvm/vmx/vmx.c          |  2 ++
 arch/x86/kvm/x86.c              | 13 -------------
 4 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 0378577d9d8b..f2c53a5f40e3 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -113,7 +113,7 @@
 #define KVM_REQ_HV_RESET		KVM_ARCH_REQ(20)
 #define KVM_REQ_HV_EXIT			KVM_ARCH_REQ(21)
 #define KVM_REQ_HV_STIMER		KVM_ARCH_REQ(22)
-#define KVM_REQ_LOAD_EOI_EXITMAP	KVM_ARCH_REQ(23)
+/*#define FREE!!!  USE ME!!!		KVM_ARCH_REQ(23) */
 #define KVM_REQ_GET_NESTED_STATE_PAGES	KVM_ARCH_REQ(24)
 #define KVM_REQ_APICV_UPDATE \
 	KVM_ARCH_REQ_FLAGS(25, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
diff --git a/arch/x86/kvm/regs.h b/arch/x86/kvm/regs.h
index 97c17b120a57..04d047f46753 100644
--- a/arch/x86/kvm/regs.h
+++ b/arch/x86/kvm/regs.h
@@ -463,12 +463,6 @@ static inline void enter_guest_mode(struct kvm_vcpu *vcpu)
 static inline void leave_guest_mode(struct kvm_vcpu *vcpu)
 {
 	vcpu->arch.hflags &= ~HF_GUEST_MASK;
-
-	if (vcpu->arch.load_eoi_exitmap_pending) {
-		vcpu->arch.load_eoi_exitmap_pending = false;
-		kvm_make_request(KVM_REQ_LOAD_EOI_EXITMAP, vcpu);
-	}
-
 	vcpu->stat.guest_mode = 0;
 }
 
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index b341af4c6057..59b48d959ee0 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7082,6 +7082,8 @@ void vmx_load_eoi_exitmap(struct kvm_vcpu *vcpu, u64 *eoi_exit_bitmap)
 	if (!kvm_vcpu_apicv_active(vcpu))
 		return;
 
+	guard(vmx_vmcs01)(vcpu);
+
 	vmcs_write64(EOI_EXIT_BITMAP0, eoi_exit_bitmap[0]);
 	vmcs_write64(EOI_EXIT_BITMAP1, eoi_exit_bitmap[1]);
 	vmcs_write64(EOI_EXIT_BITMAP2, eoi_exit_bitmap[2]);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 32563a91fba9..0028d57e964a 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8062,17 +8062,6 @@ static void vcpu_scan_ioapic(struct kvm_vcpu *vcpu)
 		kvm_ioapic_scan_entry(vcpu, vcpu->arch.ioapic_handled_vectors);
 #endif
 
-	if (is_guest_mode(vcpu))
-		vcpu->arch.load_eoi_exitmap_pending = true;
-	else
-		kvm_make_request(KVM_REQ_LOAD_EOI_EXITMAP, vcpu);
-}
-
-static void vcpu_load_eoi_exitmap(struct kvm_vcpu *vcpu)
-{
-	if (!kvm_apic_hw_enabled(vcpu->arch.apic))
-		return;
-
 #ifdef CONFIG_KVM_HYPERV
 	if (to_hv_vcpu(vcpu)) {
 		u64 eoi_exit_bitmap[4];
@@ -8240,8 +8229,6 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 		}
 		if (kvm_check_request(KVM_REQ_SCAN_IOAPIC, vcpu))
 			vcpu_scan_ioapic(vcpu);
-		if (kvm_check_request(KVM_REQ_LOAD_EOI_EXITMAP, vcpu))
-			vcpu_load_eoi_exitmap(vcpu);
 		if (kvm_check_request(KVM_REQ_APIC_PAGE_RELOAD, vcpu))
 			kvm_vcpu_reload_apic_access_page(vcpu);
 #ifdef CONFIG_KVM_HYPERV
-- 
2.56.0.218.g1ec904b173-goog

