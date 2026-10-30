Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793396274;
	b=Y07I/PVtaLARixAmToi7EV9IvpEeBjLX8n8pDUEVugj2v3L5TQ15m7RrfF7ddhAw/5WS
	 rtQP+w893NzYWKsAyTQMNhK8xy65QDKzTL+kYK4u8+oJsA6jVvExWscO1LalinvIvd/pH
	 1foP17zpsLnMI2zVLiBIM5DKwlOMb9HD9w4or5MrMMfRZF2hMcMr8HeXCiB71xs9R5sRd
	 cuF9Ndiey1Ajaeh340AZ00ElS4Usj9B+LOwNxXJkEx94lebJXiJ87D51C4crvx4MjVw8+
	 PDs/JOLoXhTyf8QDh02MvlS2fp4ImFsxRDooeygezZBi1JLM9GK/p8cM87r2fL8xw6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793396274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=nJFBxVgZV9XoDCRLOfNtMREStn7w9nRhV8Ti5t4DrDE=;
	b=2n+mgpPhw2+AzQAY4eVYbAxxjjifGy8gGlFILzXGu096mX5kwWp4pDb6x6lOykVdwaEV
	 s3dCEinUj1y8rX6jftR7NWknpqOvjNpWAU8gp6/2uM4zQ4xEVk86EYJ2dGlC0LDtxREyN
	 md4GrwUHrYJjhPTDsk5WRudTx1sG2z1RhM6GaoNNCg1+wgAX45lbzut1xnKdc+hDSixUO
	 rRbvfJPy9rn9kPrQmGlD3aqhoJWNp/GmmrK/gO8YS/Z9iPpJ8k+qV2cW+yNSwolqkDIsU
	 zE/LDRXdqMyEk4VoMYllqW13rFd3daAnhHKmb+8A+rANfebzbn2OGZI/QBr4zPhPogg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a0bT5Dv4;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96589606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96589606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a0bT5Dv4
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e93e2f72bfso18565925ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793396273; x=1794001073; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nJFBxVgZV9XoDCRLOfNtMREStn7w9nRhV8Ti5t4DrDE=;
        b=a0bT5Dv4tnQJLo+zXr0DZjQeChZehYxal1FAWzrM5nrFjoBDyvDpdHYbg2Ve3BRSpU
         Hyk2rn43LnfIAqmn0qcpaRUbOVOiSLIDQufOLYYHeXmttmB7VuWqmfvtMAHHxcQQrwbu
         gfANODgEbnOzavhYxoaKw9T3g/OMkNmbtxaZl1GQ5e8ECFCct4tuf49aeZyatJR0wMF4
         pw0xrCNCUMFqURY+veRifUco4AaM/McYV5z5i9rDVVGO7DV7MKp09H/hePMzxHyVHowy
         QfMp/Tl00CrqNurOEpxqWBzKEf2NFWMGxAx4/gg+MymFondvF5v9/VdrnA8mtugv7bt6
         Ckqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793396273; x=1794001073;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nJFBxVgZV9XoDCRLOfNtMREStn7w9nRhV8Ti5t4DrDE=;
        b=zcHkGP068cRnMnzIfu/AHQ1rRn9VypOa2lWCDNG1nWR8WQ+/TFnBLPuSrW6d8DEwkO
         eqk7PDLlv92ZuaL62yqgQu4FfuS/GL2puIJVRd/H0Qa6nx2HZmxu5h6+Uo0HTWAg2sUi
         fVxET4d6uoAz0PaJ0Nm34adVY7SQBDNw7sj9H+L+SbGfmbK99NLADsNBcXxDL+81j9ik
         ACPUJfDLSC2BSwESBkr96i8jTi1C3w+FcVY9YzGcDFtpQzEfj/v/IQuQcj3IZOEyVG1a
         X6ke4ToWUVl0MzpBwu7ZBJp5A2MlqgkovR7VUfXe+zpiugKWNY5J+LoBr5ItWwjZRW0R
         +0oQ==
X-Forwarded-Encrypted: i=1; AKwUvBy82pHnw8eMZcTlQ+4ih9JuHoclBAVD769hcEcas7CsG1sD0of5BSOVE1RMOLY9+sGMKW2bxPtj+YlXweg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvDCxy2loMK+KZ1INqgX/+poxCBOvsav32NpiXJZlIMVI/4lMa
	Y1pLjXDYg39JUSD1IfvtdrI3fiOmBSovLslhh9sY4radsqdwEeAzcW89QsF5KMHR2Sd9Q1scB/M
	XhM4KCg==
X-Received: from pllj16.prod.google.com ([2002:a17:902:7590:b0:2e2:ec03:928c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:db01:b0:2e9:a16b:c251
 with SMTP id d9443c01a7336-2eb36415052mr38618865ad.3.1793396272864; Fri, 30
 Oct 2026 14:37:52 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 30 Oct 2026 14:37:45 -0700
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
Message-ID: <20261030213747.2611815-4-seanjc@google.com>
Subject: [PATCH v3 3/5] KVM: nVMX: Synthesize #GP if L2 writes a "bad" CR0
 value via LMSW
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mahmoud Abumandour <ma.mandourr@gmail.com>
Content-Type: text/plain; charset="UTF-8"

From: Mahmoud Abumandour <ma.mandourr@gmail.com>

Synthesize a #GP if writing CR0 when emulating LMSW fails, as it's possible
for LMSW to #GP on a bad value when executed post-VMXON, i.e. if LMSW
attempts to set/clear bits in violation of MSR_IA32_VMX_CR0_FIXED{0,1}.

Outside of VMX operation, LMSW can only arbitrarily modify bits 3:1 and can
only set bit 0 (PE).  I.e. LMSW can't modify any CR0 bits that are
unsupported or are subject to additional checks and thus should never #GP
due to a bad value.

Note, KVM has a virtualization hole where it doesn't enforce must-be-1 CR0
or CR4 bits that KVM doesn't intercepted.  E.g. if userspace marked CR0.TS
as a must-be-1 bit (while post-VMXON), then the guest could clear CR0.TS.
That hole will be plugged shortly.

Note #2, with the virtualization hole plugged, it *should* be impossible
for LMSW to #GP on a bad value.  Unfortunately, KVM's save/restore ioctls
allow userspace to load a CR0 value that violates the must-be-1 masks, i.e.
userspace can make the impossible happen (and plugging *those* holes is all
but guaranteed to be a waste of time).  Ideally, KVM would WARN, but since
userspace could trip the WARN, take the easy route and handle failure
appropriately.

Fixes: eeadf9e7558c ("KVM: nVMX: Handling of CR0 and CR4 modifying instructions")
Signed-off-by: Mahmoud Abumandour <ma.mandourr@gmail.com>
[sean: split to a separate patch]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 2d5feeb8a059..68c1361a92d1 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -5746,9 +5746,8 @@ static int handle_cr(struct kvm_vcpu *vcpu)
 		val |= kvm_read_cr0_bits(vcpu, ~0x0eul);
 
 		trace_kvm_cr_write(cr, val);
-		(void)handle_set_cr0(vcpu, val);
-
-		return kvm_skip_emulated_instruction(vcpu);
+		err = handle_set_cr0(vcpu, val);
+		return kvm_complete_insn_gp(vcpu, err);
 	default:
 		break;
 	}
-- 
2.56.0.385.gac671c819a-goog

