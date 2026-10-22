Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792635505;
	b=SF0zh6gF9fy0Ioy0wmbn3ClWX0VOPfeoI64BIRkBDQ0GhW4lZ1981dOYs9hqr7Vhl1qT
	 9ebv+iNcOy0blB9M5tTul6lTTSwg35gfbTdg2mcIIRY7S1Ow1Ykm4LJjWI/qxe0JFYzJZ
	 Q3jyiFc9K5EkPlIeBxdOHI3QmKFvZi9YaSUylHqfVN9eqWx3fhk2CFjSuAxwOTw3yWN1O
	 pDJjJJKlj8ddNP50UtEOngnYAZUol+VSGHZa8jCAs9wL3qHiPTahz51/EKL5f+1sZ4l8v
	 wBX3QAWDHBMQGHIIDCS8igI4OahKFxlz5pA8az5opcI3wbggYx+OIYdkSrj6KzB9k/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792635505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=zKOY3KM6W7cTDdHPqzyzy77JGlYO/MSVD6fvE2c4CzM=;
	b=t6ENLf8rajdvsdgz+gQ2CPZj4m6mvF3LYofHB0PdF1TVQd4a9uG+FlgCoYHm8kIX7BaJ
	 9lusyeYtAbyr7PjGNkYlyollKSf1IHEnkfY40gkUsDXhpzTCGMsW8L3Rm2qs89iVrKtHc
	 5oQ4STc8yAFAzyvtN1At+v0R7VpFP4WmhwFGjEav4JXMUhA2TxR1z71nl99tbnbn//QIJ
	 7uzgLXMDNn+OHRuHMH7Rb+9quTZShSyEjNI1DZi19wigj3UIj7rzX0w2N6J9jp9YlfG6j
	 5CEHriC9J+9AcigS6mWUgKLmHfPaS/M3LFBY58RGCoEouXqJIHEKZCTf2Y2NeP2t6nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=QKVmesTO;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE5D606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDE5D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=QKVmesTO
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so1384002a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792635504; x=1793240304; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zKOY3KM6W7cTDdHPqzyzy77JGlYO/MSVD6fvE2c4CzM=;
        b=QKVmesTO/tg+usxx4kVKRSyM9RPnxeQCvRRGHurKCKkI7MOiaYNY2akdqtUblKap5y
         SmpQeXyiVhNzj/k8yGtId1byXHKARKfTwvof74QU13Ng/Q60bL1qWOIxHwMhzlnQbQNZ
         pjfi/S42kyluBGL5+Nv6Pxw9fr8TUnh+FEgdnSL9MU/1U3XiqvM3zAu0jyIyHUYe+NUY
         ZKjHAixOJ8p4AUTQvwbEqkCOM2TE5dFUDMfCfEOArWCn6U907wADJmsVpIo5yJP0eToU
         J8el525NCZP3nA0PdQhJZPwmaa2UyEWDnuqZFlM47Tx8yASLsG0QBbqXt67uiQMGSOxC
         mdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792635504; x=1793240304;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zKOY3KM6W7cTDdHPqzyzy77JGlYO/MSVD6fvE2c4CzM=;
        b=g/pu2FEhwne6S2Pi33iRMzRQ3Nr00vb7ejMEnSlq0enChPyVOV6PzL8WHT8hGP/rT+
         OJ1vF4kwk4fV6WWfexj7KY9AvOcWl5h4Zwce8nWJbQp6IOoot6rOvuldKrMOeo8eoRX2
         WyV9K35c4CzqwCrNbiJmE1aJzyf1jlXwpWYOEENQYEPFPUHXXKPdRpxwPYhehVeJC9KZ
         mT126AClyq1PHZcnOsl+4wM8kN2zzR+wVJZSJZXVzpmXI73FVnrEQloKcF2IaKk+MHUn
         92e1johZTpt5I3be1idvnI8r2KOMAG6LepQUv97lOUfnHL5bo+cY25BA6CO8g29TJ8Qf
         KECQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjtf9Wr9Oj5P7AqENPz2XaMxPbZLlP+YuoSmQTYAvN53WEcGD4cZxnw5eXlKkRysUC+mmMQnY65mNVxfw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOYrhNa2beC6wD8m3EpsrdRWyeU9GbbaZpJJqnzByF+QXPh1CQ
	KtXD3+OzKDJrfCsCoceJcUMG3ajLpELeyfus6tXxKxpSLfPfQUWm7UwqASo6RnIHxkyBpevzdt3
	4wo7UpA==
X-Received: from pjsa18.prod.google.com ([2002:a17:90a:be12:b0:3ad:4377:79ba])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:224e:b0:3ad:6781:da6b
 with SMTP id 98e67ed59e1d1-3ad86cd6d65mr3204983a91.62.1792635503892; Wed, 21
 Oct 2026 19:18:23 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 21 Oct 2026 19:18:19 -0700
In-Reply-To: <20261022021820.298886-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022021820.298886-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261022021820.298886-2-seanjc@google.com>
Subject: [PATCH 1/2] KVM: nVMX: Save shadow VMCS when getting nested state iff
 L2 is active
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"

When getting nested state, copy the shadow VMCS to the userspace buffer if
and only if the vCPU is in L2, as that is the only scenario where the
shadow VMCS is "active" and thus needs to be explicitly save/restored via
KVM_GET_NESTED_STATE.  If the vCPU is in L1, then the shadow VMCS isn't
active/cached by KVM, i.e. is just a pointer to memory, and doesn't need
to be saved/restored (userspace is responsible for saving/restore guest
memory as needed).

This fixes a bug where KVM would save the shadow VMCS, but not account the
size of the shadow VMCS, as the accounting correctly checks for L2 being
active.  Note, the restore path also consumes the shadow VMCS payload if
and only if L2 is active.

In practice, writing more bytes than are reported is likely benign, as KVM
correctly reports the maximum size for KVM_CAP_NESTED_STATE, and no known
VMM invokes KVM_GET_NESTED_STATE twice on every save to precisely allocate
its buffer, e.g. QEMU and Google's VMM both allocate the maximum size when
the vCPU is first created/allocated.

Fixes: fa58a9fa7497 ("KVM: nVMX: include shadow vmcs12 in nested state")
Reported-by: Josef Bacik <josef@toxicpanda.com>
Cc: Chris Mason <mason@kernel.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 9b0bfa2f854c..c2586bc9ebb5 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -6875,7 +6875,7 @@ static int vmx_get_nested_state(struct kvm_vcpu *vcpu,
 	if (copy_to_user(user_vmx_nested_state->vmcs12, vmcs12, VMCS12_SIZE))
 		return -EFAULT;
 
-	if (nested_cpu_has_shadow_vmcs(vmcs12) &&
+	if (is_guest_mode(vcpu) && nested_cpu_has_shadow_vmcs(vmcs12) &&
 	    vmcs12->vmcs_link_pointer != INVALID_GPA) {
 		if (copy_to_user(user_vmx_nested_state->shadow_vmcs12,
 				 get_shadow_vmcs12(vcpu), VMCS12_SIZE))
-- 
2.56.0.218.g1ec904b173-goog

