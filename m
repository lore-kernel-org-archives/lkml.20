Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792697351;
	b=tdJHwgwHIDHHdGqjG2PTapy2wK9sDZ7llbOGBN2LdR42gQX1feSSHD7gsraA+L4z+2HU
	 jd52x3BLIluaq32Ip+0Beie/izve9za2oXq1Xescnj9UsvLbKYQQJHpqzJf6TITminczb
	 7vwdQ5RosjtJzDhs+wyHhPy6I/VeYX5iKapzkGUw7kvWjq4JRFGGVb9xAk92OR/Z9MT1N
	 r2aZd5Lp4dPMPNkOFg2RkXsj7EXqu8lqw7NMpDpsM+kNhRGQOMJxP8hN1vchexC8bWcch
	 /7hCuH2X6xSoRA1hmsRIsHisJ/0bT0RxhDnnvNwTbnLihqwzBvzKJYWW4k+3pYYvhXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Arx6jy0MOgeqv9tTVqXlk/d3btfDuiHwkJcNQqBQPR0=;
	b=C406DCxEP3kmwv2YSvCV8ZMgoUUvZWR4uqHwWm3TBqwwgE1s4TdpWbNHUlhu3zYqc3bm
	 3LWkT4cH5jTbMWIzyAE+bqH8zjkEfnHCGU4IEh1k0uhVYTWmUb6ZUYVUwswOXnseFj7gT
	 AWox/oHpAgkZNoTGU2jJX1P0Da6QGOg17YLIzo9dhYrjAuC7g99buy4AqR1Gm1J6fJtM7
	 EzVEjLAAMBCjGK+dmtIZL9tlnfzxFQFnIct3Oi51RKZGck+3SCgoDOWAMVaHWihtDK8MZ
	 HjI0gD/HNjV0Kw8a/gNLQeU9cN/2tFVp8aZVOM1elQcYhC4Iz0Gq0zgkxH/ubtcA9eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=glfJBT7v;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CCC606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80CCC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=glfJBT7v
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-89fb6a45c48so227165b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792697351; x=1793302151; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Arx6jy0MOgeqv9tTVqXlk/d3btfDuiHwkJcNQqBQPR0=;
        b=glfJBT7v/vB1FELM8qGbuCUF2czjr7b1NMK5MamyEnEJjrgKkL39ExXtm/L3K/IB2r
         aa40Bbhar82iZy8w0SSoGzdIJxOifChE+AN3Y4lYn8TI3l/YhRrvON1zZs7TR/Fr3eZQ
         m+dOpAba07tiuw1d6WuOEKZRPLhQUYTYv7XX9l6CmfnpAF2VabkkXPegP7g/FowdWJUm
         0R8Wxs9QcyBk9z0ZYxMJNlR6z7oYyYlTiCMuq1ONKK19Y4U4+XrotWyjGxTniGXiVD4q
         zbNbkWiU8JY2smC/psRJul+Jgk0XQCyqdNUSYb/4n6cqY5R0F7kpSKpwxgXngpzsGmnM
         hUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792697351; x=1793302151;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Arx6jy0MOgeqv9tTVqXlk/d3btfDuiHwkJcNQqBQPR0=;
        b=fMxz0uoAbKIknEE4kjJAAeRfi+9Z9Khy1oI70oEDK+sQzGD1RYug2jc3Uc+wcj1qn3
         3c35KBRbfV9woj8HsMnGieF7YNnp41j8D0xZVthxsExUJETjhQsLh2r2Q9M6mkT9ayWD
         PvnHHfeg1H8siBg8EwNwNCJuEjmRLYNV+CLWfpRRDuSLvhg0fFxYkrNqDs9RnsciBusu
         Vvd/Uzv4swMrHKA1SI0Jsc8poi12loCoTTTOzLwrwJH5Cm+YN/CTVHVHtx7ydfrKMnnE
         4auhvA26Dsp6yQFw/r6lQgoTeTA+VHIVj2S+4ljtY/lWpjxYeMQEIEU8tE/Ljwx85kpZ
         B1XA==
X-Forwarded-Encrypted: i=1; AKwUvBw1ohsOUthXLYfHQ/9gs6ZWuuryImrAlCn+D96sEfcg5cp+V62V8gXYnDczwrbsTmJkyvMBK+qmzO77dSM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9KejD+1fEoegIe+AZnYWLH8uvPj8rVDqpfrdw4f3RZELoJ2BH
	7/y4oHRJzmMWeNYCeDtWON/boiQtA6vb11YHKyHGpIaW481KIK2vVyHWyRKxfVWIxWfpi/JvLab
	nXNj13g==
X-Received: from pgmt10.prod.google.com ([2002:a63:224a:0:b0:cd6:b0a6:8d94])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d50d:b0:3e1:fcec:c724
 with SMTP id adf61e73a8af0-3e287e6f7bbmr4535725637.31.1792697350460; Thu, 22
 Oct 2026 12:29:10 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 Oct 2026 12:29:08 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022192908.554376-1-seanjc@google.com>
Subject: [PATCH] KVM: nVMX: Clear nested.smm.guest_mode when freeing nested state
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Karthikeyan Bhargavan <karthik@cryspen.com>, Chris Mason <mason@kernel.org>, 
	Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>, Josef Bacik <josef@toxicpanda.com>
Content-Type: text/plain; charset="UTF-8"

From: Josef Bacik <josef@toxicpanda.com>

If an SMI arrives while L2 is active, vmx_enter_smm() forces a VM-Exit
to L1, and records in nested.smm.guest_mode that RSM has to re-enter L2
and in nested.smm.vmxon that the vCPU was post-VMXON.  free_nested()
clears the latter, but not the former.

Userspace can get KVM to free the nested state while the vCPU is in SMM,
with KVM_SET_NESTED_STATE, e.g. with no VMXON region to say that the
vCPU isn't in VMX operation, or by flipping the SMM flag back and forth
with KVM_SET_VCPU_EVENTS.  When the guest then executes RSM,
vmx_leave_smm() tries to re-enter L2 even though there is no vmcs12 any
more, and nested_vmx_check_restored_vmcs12() dereferences the NULL
nested.cached_vmcs12.

Clear nested.smm.guest_mode along with the state that it refers to.

Fixes: 8fcc4b5923af ("kvm: nVMX: Introduce KVM_CAP_NESTED_STATE")
Reported-by: Karthikeyan Bhargavan <karthik@cryspen.com>
Cc: stable@vger.kernel.org
Assisted-by: LLM
Cc: Chris Mason <mason@kernel.org>
Co-developed-by: Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
Signed-off-by: Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 9b0bfa2f854c..66a7b57c9f16 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -349,6 +349,7 @@ static void free_nested(struct kvm_vcpu *vcpu)
 
 	vmx->nested.vmxon = false;
 	vmx->nested.smm.vmxon = false;
+	vmx->nested.smm.guest_mode = false;
 	vmx->nested.vmxon_ptr = INVALID_GPA;
 	free_vpid(vmx->nested.vpid02);
 	vmx->nested.posted_intr_nv = -1;

base-commit: 164405e8e9a0378c7e1aff2254625a6553a291f1
-- 
2.56.0.257.gf7497c7d27-goog

