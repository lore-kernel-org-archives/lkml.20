Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792695935;
	b=nuaoKtVlV+D3zAhFCTym6Ev3FF3e5c8i9hBBbftdHqTbb5ZKcjLqCmSPi4by4VN1tkUQ
	 wnZvmkryBYzeT+wh++X34FJqdUBnVEPcQSsbok25Z+k794dQ5W+OLN7+n/2Ca6xh0gLOQ
	 nh0n94TiThLGyXsg63+72igXjVRGeDaiQ9yTlpdOwvgGgRPPXNarERZme3J1zhvjhcin6
	 W1Qud6J5nzvQfYzktZAYPRzA99JB81SJvGk1C0vIsHa758XzevMqHyXz5EhlWE1w8IhjM
	 Gu7tRGZApgNmgMYnjwxznChQ3Dp/8D2aeXdDMmTGax0lyvr5joWFEQ9XCk8ni2XPtDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=jCmupRclUZjg6uDzOj3iAY4OufXI04zNlbOPQFCZiKo=;
	b=1hUokUymWzwWn+vXvM9PSy4jWK24xG9E2Snxf+tp1AM5YV6VssLNt98j/llBBL5JM1ZH
	 w9uTN8j6Si1Ifwfx8VFPV+P0L+4cYKEF1gFtlK9+1V35TMGwufVPjfU67bLILlfYpgG11
	 JeziyTiYVGEwMLjxkQX6re8wtSbzpXHFY9T2ANEnwfQLkiETwTubGpcdjYb3nO/cCg1ND
	 DWLrBg+ctp+gMdgtljKMVlNnD7TmAVyFenJockueAuC/3IkSb2k+5CTMo40nhN+u/vtBs
	 XBbsgpE8NZaC0c3hQc2aZiGJQT44CPRDY1gPVVYmn7z9reGICQkQm8oW0ZhyUTxGVgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=EDvs309B;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DFA60A2625
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30DFA60A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=EDvs309B
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd68b8579f2so49696a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792695934; x=1793300734; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jCmupRclUZjg6uDzOj3iAY4OufXI04zNlbOPQFCZiKo=;
        b=EDvs309BltviMcC2y+ka57czDeasQX4IUzXK6oQgX8ifsDVBN29tEfKn0MMklz21tJ
         sr+zjBegAoxErhcmxm2ZTTISgL6tbaU1AUAofv/UsboGBj19OSm53AZWL0KPLteKUAfQ
         kmpUePe1oroIMazgkyxKUMQ0lkzbtAIB4jvT6osoBsTm/ntxDdvboy/GWAGbeqjZz7iW
         jZIBlIU+rkN/uK8B72puzwvldylVKSylx97HfLTwmTdds4Ij9oPRzMbTIS8ystgSUuCL
         o7tfULMCDmYADO53U9tji7wi7Rr2avN/wg8Xa2r9Abrve0le826QBOsnoVwQVm5P93MD
         KmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792695934; x=1793300734;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jCmupRclUZjg6uDzOj3iAY4OufXI04zNlbOPQFCZiKo=;
        b=MUgs6NLiZ7JUFQ65IU6eM6qn0eFmhBPAwLAUANjDvGCQy7GI1Ny9PeT3eOQIeF0Lo/
         fG4llpGwAYqNNRq6F3irBjuAAQux8Fjj0mfJQmA66zyq5Beuex5SXDVaQvNkYhSbbrlg
         OmBPiw7yw8OfW4Giyn6jVoHBMZr4tBCd4dIDJvS4/1YRQEZSfied359L07l+OK2aKrfw
         Qeg47Ipzm3J/0O16rc/Uvtx3bR7KGid/xGrseGNCXMT7DY+BQ41Z/A13ZfZg453hNDm5
         zuvVrI7rPsyBw/w0by65wQoCJR52b+2AkrVzMzuH/Jhdf4xAL4NdM4wUHJos7BMYDYVN
         +69g==
X-Forwarded-Encrypted: i=1; AKwUvBzD3ZNqGULmnaUaIs7pbL9srtc04B/zSmcE5Ibc6EyhRQyTHObuZMyROmW7m0uXbP49mw8iXmqlg/B3amo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIf+LZpiN6NFezpyaw0kNI/iGnVr7hG7V2mLdfx12B3HDiBIqWV
	VmrRaMbh5GfuTWRhatA8m7F7d9Xo8gDEkEb/Waop9Td6Fc+kCVzVplFVNZOGOo6dBmwVFe4byaT
	s7k4s5Q==
X-Received: from plbjk4.prod.google.com ([2002:a17:903:3304:b0:2e2:f517:75b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ffcf:b0:2ea:7180:3ab9
 with SMTP id d9443c01a7336-2ea7c18a456mr2829515ad.43.1792695934246; Thu, 22
 Oct 2026 12:05:34 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 Oct 2026 12:05:30 -0700
In-Reply-To: <20261022190530.541789-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022190530.541789-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022190530.541789-3-seanjc@google.com>
Subject: [PATCH 2/2] KVM: VMX: Dedup VM-Enter error handling for VM-Fail and VM-Exit
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, syzbot@google.com
Content-Type: text/plain; charset="UTF-8"

Dedup the error handling code for failed VM-Entry as the only difference
between the VM-Fail and VM-Exit cases is the source of the failure reason.

Other than clearing vmx->fail on a VM-Exit failure, which should be a nop
absent other bugs, no functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 29aa93cea963..a15cdad5c06a 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6741,21 +6741,13 @@ int vmx_handle_exit(struct kvm_vcpu *vcpu, fastpath_t exit_fastpath)
 	if (vmx->vt.emulation_required)
 		return handle_invalid_guest_state(vcpu);
 
-	if (exit_reason.failed_vmentry) {
+	if (exit_reason.failed_vmentry || unlikely(vmx->fail)) {
 		dump_vmcs(vcpu);
 		vcpu->run->exit_reason = KVM_EXIT_FAIL_ENTRY;
-		vcpu->run->fail_entry.hardware_entry_failure_reason
-			= exit_reason.full;
+		vcpu->run->fail_entry.hardware_entry_failure_reason =
+			vmx->fail ? vmcs_read32(VM_INSTRUCTION_ERROR) : exit_reason.full;
 		vcpu->run->fail_entry.cpu = vcpu->arch.last_vmentry_cpu;
-		return 0;
-	}
 
-	if (unlikely(vmx->fail)) {
-		dump_vmcs(vcpu);
-		vcpu->run->exit_reason = KVM_EXIT_FAIL_ENTRY;
-		vcpu->run->fail_entry.hardware_entry_failure_reason
-			= vmcs_read32(VM_INSTRUCTION_ERROR);
-		vcpu->run->fail_entry.cpu = vcpu->arch.last_vmentry_cpu;
 		vmx->fail = 0;
 		return 0;
 	}
-- 
2.56.0.257.gf7497c7d27-goog

