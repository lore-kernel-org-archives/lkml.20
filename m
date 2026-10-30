Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793396272;
	b=hLYkbGUqXl8rNWOh/YJBQEIxsDxyCVbKurJgllxmc8pqWhdhi4DgHP4cuTUc83N4pwvT
	 Y6Sp9IXeHDaFLZ9U6jIksBPm0dGlgs9Pj/SLS+UCE1O68bQ7IKHO5Letp67Un+svLfxcG
	 ORwsgkc1z8M9ArAoEMvRzEDzmI+Hyi9Zn6LfpaMqdW1rVx0/SBDAuM/RUHulphA+Y0Yjh
	 11YnqxmzY8vgZOJ/L7OVxuT58EO2333OUu3nw+Bma2on0OaCxzuz8dxP8LFtrtkG9yuDw
	 NEdUBrk/FOF9Fus2t4t+hSJzM8E8ra2QqUje1HfD77WfUyMl8CcuaMtFswe+1Nsf0kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793396272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=UWpoThsKVVH8wpihCZprx9pHZaFu0THdyOfPf9yMXho=;
	b=GGHG3jCUIpPO5r6c0EQlT1ryy/NlG8X9MQriiVjsI/C1sYxdfnTCc/R6t0TbqSk4PbdS
	 g/oiL0ZMYhWVoFuz63duiFJulN+v4svll4WKOBTTw2fcGEdowfBkfeha56JLi0ivwYs/S
	 9EGiZWB3kvS/zqFNhmen4hEWE6CuJ68ehj7AKEJoizTlCJ2Eg7pG2fszO+pym6lS6nck/
	 coUWjZe4NpIdl6wO7C26um6gQ9nUH8G2iHgmOu1MlPVYB6c5H9UtAz7KjY1Ml5dIw0FHm
	 a+yoSHvQ3f2H6dCTIMsRM6zDUZzLQ3daVCeigACJtrJpyFGxto79M9KJueuiAS2anow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="gtryOvc/";
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD16606A336
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CD16606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gtryOvc/
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e93f266d20so18101645ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793396272; x=1794001072; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UWpoThsKVVH8wpihCZprx9pHZaFu0THdyOfPf9yMXho=;
        b=gtryOvc/4zzvrqwQWsgk67IFil5Pi4Bb2Hnu4kdTfu39Vph8zpUlFTNg3rdUGxeEek
         zvoysvJL7nA/khRDZMfZg90RsxjZvr9N+/FXE0xBA3Rve06zI9abzDtwegHO/AwArq3x
         Jxg/a7eEMinVphpSZ7JhgM36DikoLiGPC/7/CX+GlrWoj6rH2jSR/xw6xLDnEr+B94X9
         +3SxxnQXyxwc08si/IW2xJ7X0OhFIZIp+2/45m5lCjFMHc/z4ekWzGYFVwpupceoA30T
         ZtYfnzWUAWmOv53V9gJ/yCgbG+zfN+LcyoXBiZVduiHgRfal9KebHm8feUG+Ss/7iR/U
         a3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793396272; x=1794001072;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UWpoThsKVVH8wpihCZprx9pHZaFu0THdyOfPf9yMXho=;
        b=sdrabjjHvcaQRUccocH8TV9elEfWYqx/fvxPi3/L1llqJbz4RrUebzL1z6KjR1dTF8
         6/Bv5206ZXWqZKcJLdeacE1ca+xJpJhTbwIanI4xT8g8taDyZAFFwTG54kImaQ7qO6R+
         cfF6MdlnPUVkiMtxXt6JdVeTe/IWGYrHNOxEtBEAaFIj1tyIRK1eS/JYdmsv0+QtiRWw
         EaN3Wj3tE4qdZULYDniFtGZTLV6qlJsztTuerQA8I9Vr/dm4He43x+2ptdDbHNTfjMtl
         BQFKCMnF+feSp2XSlIrT3uQc3espIlMPNhf/zWe+IWlZ8CJw/LI/sjPo0HVL+dMIDjjX
         W5Cw==
X-Forwarded-Encrypted: i=1; AKwUvBxYxr4s4gfUpzrpwbIQRtk8mwww9oPcrO+GQyzhGWJiw4sCcuWou1RU1Cs6z8ftxT+skMywg9EdQALpSZI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxwJVzC4sNTjLZ2czvWKzhMZxxUscwgRMaAsuEvqhRAqECdShs
	NJGXDjOpUObg3fAbt3rQY5f7WnjLj0OOoHpMVGbNNcOEHYAUZ6K5o8OqLV2FeZlW8ETMWu77okZ
	EFkvtYw==
X-Received: from plpn9.prod.google.com ([2002:a17:902:9689:b0:2e6:e1e:5217])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:38c3:b0:2e9:5b4e:b8a1
 with SMTP id d9443c01a7336-2eb3650af7dmr38510525ad.55.1793396271705; Fri, 30
 Oct 2026 14:37:51 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 30 Oct 2026 14:37:44 -0700
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
Message-ID: <20261030213747.2611815-3-seanjc@google.com>
Subject: [PATCH v3 2/5] KVM: nVMX: Honor L1-owned CR0 bits when emulating
 intercepted LMSW for L2
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mahmoud Abumandour <ma.mandourr@gmail.com>
Content-Type: text/plain; charset="UTF-8"

From: Mahmoud Abumandour <ma.mandourr@gmail.com>

When emulating an intercepted LMSW on behalf L2, i.e. when LMSW exits to L0
but not to L1, emulate it via handle_set_cr0(), as is done for MOV to CR0,
so that KVM honor's the guest/host mask and read shadow from vmcs12.  This
fixes a bug where so L2 could change L1-owned CR0 bits, e.g. clear TS, and
read their effective values instead of the read shadow.

Drop kvm_lmsw() as it is no longer used, and opportunistically trace the
effectively CR0 value (previously, KVM traced the raw CR0.PE value), e.g.
so that users don't have to piece together that CR0.PE will be preserved if
it was already '1'.

Fixes: eeadf9e7558c ("KVM: nVMX: Handling of CR0 and CR4 modifying instructions")
Signed-off-by: Mahmoud Abumandour <ma.mandourr@gmail.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/regs.c    | 6 ------
 arch/x86/kvm/regs.h    | 1 -
 arch/x86/kvm/vmx/vmx.c | 6 ++++--
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/regs.c b/arch/x86/kvm/regs.c
index 3621f1a47d37..44a88c70b77b 100644
--- a/arch/x86/kvm/regs.c
+++ b/arch/x86/kvm/regs.c
@@ -303,12 +303,6 @@ int kvm_set_cr0(struct kvm_vcpu *vcpu, unsigned long cr0)
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_set_cr0);
 
-void kvm_lmsw(struct kvm_vcpu *vcpu, unsigned long msw)
-{
-	(void)kvm_set_cr0(vcpu, kvm_read_cr0_bits(vcpu, ~0x0eul) | (msw & 0x0f));
-}
-EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_lmsw);
-
 int kvm_set_cr3(struct kvm_vcpu *vcpu, unsigned long cr3)
 {
 	bool skip_tlb_flush = false;
diff --git a/arch/x86/kvm/regs.h b/arch/x86/kvm/regs.h
index 97c17b120a57..c30ac8394271 100644
--- a/arch/x86/kvm/regs.h
+++ b/arch/x86/kvm/regs.h
@@ -62,7 +62,6 @@ int kvm_set_dr(struct kvm_vcpu *vcpu, int dr, unsigned long val);
 unsigned long kvm_get_dr(struct kvm_vcpu *vcpu, int dr);
 unsigned long kvm_get_dr6_fixed_1(struct kvm_vcpu *vcpu);
 unsigned long kvm_get_cr8(struct kvm_vcpu *vcpu);
-void kvm_lmsw(struct kvm_vcpu *vcpu, unsigned long msw);
 int load_pdptrs(struct kvm_vcpu *vcpu, unsigned long cr3);
 
 static inline bool is_long_mode(struct kvm_vcpu *vcpu)
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 544b7840897c..2d5feeb8a059 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -5743,8 +5743,10 @@ static int handle_cr(struct kvm_vcpu *vcpu)
 		break;
 	case 3: /* lmsw */
 		val = (exit_qualification >> LMSW_SOURCE_DATA_SHIFT) & 0x0f;
-		trace_kvm_cr_write(0, (kvm_read_cr0_bits(vcpu, ~0xful) | val));
-		kvm_lmsw(vcpu, val);
+		val |= kvm_read_cr0_bits(vcpu, ~0x0eul);
+
+		trace_kvm_cr_write(cr, val);
+		(void)handle_set_cr0(vcpu, val);
 
 		return kvm_skip_emulated_instruction(vcpu);
 	default:
-- 
2.56.0.385.gac671c819a-goog

