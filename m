Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793905657;
	b=NAptt9hl4BsI3y8/o2BNhI41d1sX9dTzYK2v6ZEQHU8/b+5yxyy7yaS1y8IP2nQrqH5B
	 oVYT3usDdnH2OifMTRvBNe6yHAf0u2pmHYYZnCp7/wPgvbYXXZ5DUp/tJ14HiJ6BY6D/L
	 Cj9kAAgtawHRk4t0zWMvOHFqwWqHiIWQ/AfoF5aAF4FN+bWcMuDOAoVu/7fj1q9XB5ouT
	 TVRmEOZ1gQS5JOTeZVhtNJElE65OZiI2garIDBs5YO3LgEr8uCNXddLH+UPgr7NVWtwdO
	 Hnxzu6T//bwtFdsFeOOy2fLtgJn9X7tl6DGowEzFw7+vqk2DJu3nZHfqYw4Nx1RoIbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793905657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=RImlfGZRhzIDr+NgSiSBCyFCeHOPnTqcBiVWF5DlQGM=;
	b=sk1clsLDTSC47te8e2RMotJdaFurATIxeFttT9zfsFSticJzBja0jbP6E2is0xm+ht/p
	 KYnApnLBlgEnI0CHGMitTYFFZwk9imIIHJXk4R7Us80J8FduFJ7UaEGrEEHIY6M8O+rng
	 Ki/4xeem4786Y0FMVWq/pTGr/4QSvRtbqXNcgEJrwLtb/vyM/WxzZb1MCJDVsPxclAf1F
	 +2WDcrMDKDel9gct++oSn63epb+jM2GD+6doWLtVwCBtgYi/GBU9V3G+NGPAaPtxPs4p6
	 GFUc5OqwqS/m9Duky7vpnRTyU+5Kp/wbT8qzjjTCIqd2L6AVPar4pG7bpj1yF4BhWkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AdJhLm6m;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2A1606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A2A1606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AdJhLm6m
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed2803f863so11263675ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793905657; x=1794510457; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RImlfGZRhzIDr+NgSiSBCyFCeHOPnTqcBiVWF5DlQGM=;
        b=AdJhLm6mql34JAg3z0aFAtzRel/U3sZykYE8DFCd1DuPZmWksgOM7QthliAKD2CEIu
         NPkoeg31Vb1lrbpacwm1oXOL/o/SjnefV72IGayZsF2bYXDqYzrevgG2hXa1u0S991VZ
         hglGSgsGGXiNwyiVTPVae1OUBW36Btf3PQjWLa5UC/9RPaFzS6csnn+OiusgNhX/LSC1
         PXh6q29umyNjwLlm3bGse3rjJ2ei2vy8pkOUgl/tAJ522pXaiQ3XVZzgzYpoNKOd04A4
         mVAx7Ob96gzoCUs1dGpxi8AophvY7lDgJtdk5rxXN6tsMXoyJPJ9jHfxmMVVcyMM8rDk
         JEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793905657; x=1794510457;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RImlfGZRhzIDr+NgSiSBCyFCeHOPnTqcBiVWF5DlQGM=;
        b=EBpEzcwwPMogRfroHvTG/iDhM7oz5kSl/gJQrpAQ7Ddm1gxvi72rff95cVijXYsqHy
         cw5hQZmHkQ+/ADGA92EwBHHmk0by1kd3HsG+tWL7kFYRIngPTFf6LKAX/64wO4LpNGAD
         RXdPaK/EcLVfZkwLFRmBHfux6u9ivVl9yzwRzrIdoeek0UWaj7ibEiasKpjk49XGyxCS
         9PNyf8UfuX7hMoacrASmJTDtplLVWjMLZgw1EZwoZRsg8Pjt2r1RbFA/WYRo9R8A9XXB
         M4JS2pNSZUMkyY2zTdFyWQOzkKo/n4TLrOO/0Glz4LTlevec6ZLf2i/m636Nh92qK7FN
         4ZdA==
X-Forwarded-Encrypted: i=1; AKwUvBwoRhI8rg9Q89OW1KBUl4pRpCXIpsuPMDr/umlKU+Rm1mMdYpf6CsfX2SDxfg60pOacdYGNWUIVGoAyODQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TywEGrv6h8XvySf3q7g6lpSc1HVQAtqKqdX7PjKLD9VG6Pa8D
	z95u/ea+wLl3KZ2o7Nh21b2ouPZOBtiGNyHu0NXK/ANUnQwiGomkgg7ja3Lo9BkysML7qbMbJfe
	l8acX8Q==
X-Received: from plbmf12.prod.google.com ([2002:a17:902:fc8c:b0:2e8:ad52:30e1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:18b:b0:2e8:93b5:c555
 with SMTP id d9443c01a7336-2ed40e29864mr5181435ad.61.1793905656447; Thu, 05
 Nov 2026 11:07:36 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  5 Nov 2026 11:07:32 -0800
In-Reply-To: <20261105190733.3741959-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105190733.3741959-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261105190733.3741959-2-seanjc@google.com>
Subject: [PATCH v2 1/2] KVM: nVMX: Do eVMCS consistency check on secondary
 controls iff they're enable
From: Sean Christopherson <seanjc@google.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Manuel Andreas <manuel.andreas@tum.de>
Content-Type: text/plain; charset="UTF-8"

Check that the secondary execution controls are actually enabled before
performing eVMCS-specific consistency checks, as the secondary controls are
supposed to be completely ignored if they're not enabled.  Per the SDM:

  If the "activate secondary controls" primary processor-based VM-execution
  control is 0 (or if the processor does not support the 1-setting of that
  control), no checks are performed on the secondary processor-based
  VM-execution controls. The logical processor operates as if all the
  secondary processor-based VM-execution controls were 0.

Fixes: a83502314ce3 ("x86/kvm/hyper-v: don't allow to turn on unsupported VMX controls for nested guests")
Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/hyperv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/vmx/hyperv.c b/arch/x86/kvm/vmx/hyperv.c
index fa41d036acd4..2b40ac32ff06 100644
--- a/arch/x86/kvm/vmx/hyperv.c
+++ b/arch/x86/kvm/vmx/hyperv.c
@@ -169,7 +169,8 @@ int nested_evmcs_check_controls(struct vmcs12 *vmcs12)
 					       vmcs12->cpu_based_vm_exec_control)))
 		return -EINVAL;
 
-	if (CC(!nested_evmcs_is_valid_controls(EVMCS_2NDEXEC,
+	if (nested_cpu_has(vmcs12, CPU_BASED_ACTIVATE_SECONDARY_CONTROLS) &&
+	    CC(!nested_evmcs_is_valid_controls(EVMCS_2NDEXEC,
 					       vmcs12->secondary_vm_exec_control)))
 		return -EINVAL;
 
-- 
2.56.0.567.gdb80ae8cd5-goog

