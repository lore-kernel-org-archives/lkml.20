Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590603;
	b=qVXb9SqjCniGpws5PTB2+HnNWfTrGnGMWyUmf5J1LEvo23JnXlluZWnZfqKWoRM79Krt
	 NXc/Jjo2WWIIjFwe/fe3K5Q43GkUNzlQyPwSwZ3Oba+WT8eot0fb8Z91qHLy7I6SIUBhl
	 HmdeBViFKUAG80jAamiNC/5mDumbWrsIkgx3OCYhnsTxK9zThTTw5rlSoZ+5U+mUwH/gy
	 KzhuJBQ0Fex3Ij9nmyW+uSd5Go5yTVvDl1uSyzMgJJ2IiCkqNiZVs5clcj47XjbaBk6ia
	 VbYsiPoERZFlali2yNBmxdq7n5KqDXheJa87h5eWWhLET+6aLYqnVWy4gmDMRSh3QVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=6p/cpLmwtBMtzqB9Ka32YEX11P0LpkgIf0A/bPbuKMU=;
	b=5EE8Meri3svUqzNAcOfe1aDdqnePBegM62jCpKYCvpe6WZIAtIGdc5LRrABI9iqeJdEt
	 X+vJVEFT7YvglwwdB0tzjyDZOGBsw+f4LJSJEruQEY3EwJ1jBcvn6eeoopddVT8QlV2wO
	 KFlstHA7yIL5yRvTMe2W5chN+Y54wbrMob9ipSSY9f/17UxWkB/gtaEDQxOCaJniSJSv1
	 WRsaHtkhhGU2quprN94f0D4k7DD9uiEUKhPdcCtqyGJ7SMlLJPfOC5akXmUHS5SY2bXVz
	 5HQ1yFZ3Rs2yNYlYhx826W2Dodx+y0StQVcUkFHM3SIu6Qp8IiqokcAJKp90tcjrVWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e48lHNPR;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F03606C0BC
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06F03606C0BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e48lHNPR
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b191f8a9b3so1739206a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794590602; x=1795195402; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6p/cpLmwtBMtzqB9Ka32YEX11P0LpkgIf0A/bPbuKMU=;
        b=e48lHNPROZUMj2wUwF/qjHZ4xPfCPLyxzMu+/mP8MLIzp6v3m0qwW3VGAGjcaJYUtk
         7yaxdPw9t92ib+wUTpuK4FAU+hCt2nEXgxdh9MyyP9Bvymo3dYfgxjlsK1t1eMVHu2eN
         7xuannnYF0BhDsm8m514feGa4gQFAIgRayac5EfdpaoKyquabDCE1aptrU9qEfFaTXKD
         0kiVy6VgZunHxwPVry9+T0MUaswehQmNPiUphCVQQV606XIvIL7HzvNgRoMUEMRR8H5C
         F3yv0L6+9D9//oaGTqRTPuMlMKpMiWp/87S4y4/0zDuLkZoheMWVShiLyXEI2+ow3JRf
         zPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590602; x=1795195402;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6p/cpLmwtBMtzqB9Ka32YEX11P0LpkgIf0A/bPbuKMU=;
        b=V/XfYDAdLKiSMEmCPMbxLg74GRmFj/VwlHOjS0cphvpYtPX6UJdbvb8jDHPza8gS0w
         KzXJBmaU0AvnOooLH+8FLBGgdfFzLVLCZU+8Qx0+NpoSloyi9LPXYWFwVcOQMdL7/rN7
         9Jx8PnQnN6MYzc3sl7xJfS0RCowwKlFq2R5G8iT6GurIDazxSZJnDZ1Vk752otwx3Cgn
         7CKM5Rcsa69LL0evbxkCshpluwTUhnNgfwDn1jQuT6+RLH99srnzQ4PJeuRvXbYeaozK
         Tx/+zHBG7q1v8xdmmJPwXz7rS5jR/XW3N0pGAV7+/O823gsSLt2gcn5hFX6SPtI09HlI
         mBkw==
X-Forwarded-Encrypted: i=1; AL+hErGWpax7rRUVotFwmb5QTjHXLiIQtBtMy7Oz+plsZS3VJfDw1GcDJ8Hv9mUksMKRGCy6RAnR+5Hr8ibOqv4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9twsCPlgryExm3j8LQqc0kFu8rVKK6Qi+flajglBJee6GpKqF1
	qSl4zseyoQVruRvPCEXhhLvDYI2lB49EsbMNxwjm0O4i3HOLxSIOAyMfhbCobo+yFpDNiCdZss6
	qhlXJPg==
X-Received: from pgba10-n1.prod.google.com ([2002:a05:6a02:644a:10b0:cdb:4f65:709a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3bcc:b0:3b0:a1af:e4fa
 with SMTP id 98e67ed59e1d1-3b1b09fca30mr3155571a91.24.1794590602170; Fri, 13
 Nov 2026 09:23:22 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 13 Nov 2026 09:23:18 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113172318.482971-1-seanjc@google.com>
Subject: [PATCH] KVM: x86: Leave nested if vendor specific logic fails on RSM
 to L2
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"

Force the vCPU into L1 before synthesizing SHUTDOWN if RSM to L2 fails due
to vendor specific checks, e.g. because SMRAM was corrupted with illegal
state, and the bad state was detected *after* starting the transition back
to L2.  Architecturally, any fatal error when loading CPU state during RSM
is supposed to send the CPU into SHUTDOWN *before* switching to guest mode,
and leaving the vCPU in L2 is all but guaranteed to effectively corrupt
vCPU state (which doesn't matter for the guest since it's already hosed,
but matters if userspace misbehaves and ignores the SHUTDOWN, i.e. runs the
vCPU even though it's in a bad state).

Fixes: 3f6821aa147b ("KVM: x86: Forcibly leave nested if RSM to L2 hits shutdown")
Cc: stable@vger.kernel.org
Reported-by: Stefan Teodorescu <fane@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/smm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/smm.c b/arch/x86/kvm/smm.c
index 656a38dad7e7..23cb8211ec74 100644
--- a/arch/x86/kvm/smm.c
+++ b/arch/x86/kvm/smm.c
@@ -639,8 +639,10 @@ int emulator_leave_smm(struct x86_emulate_ctxt *ctxt)
 	 * reasons), and so nSVM/nVMX would clobber state that is loaded from
 	 * SMRAM and from the VMCS/VMCB.
 	 */
-	if (kvm_x86_call(leave_smm)(vcpu, &smram))
-		return X86EMUL_UNHANDLEABLE;
+	if (kvm_x86_call(leave_smm)(vcpu, &smram)) {
+		ret = X86EMUL_UNHANDLEABLE;
+		goto out;
+	}
 
 #ifdef CONFIG_X86_64
 	if (guest_cpu_cap_has(vcpu, X86_FEATURE_LM))
@@ -661,6 +663,7 @@ int emulator_leave_smm(struct x86_emulate_ctxt *ctxt)
 	 * the shutdown, so that L1 enters shutdown instead of seeing a VM-Exit
 	 * that architecturally shouldn't be possible.
 	 */
+out:
 	if (ret != X86EMUL_CONTINUE && is_guest_mode(vcpu))
 		kvm_leave_nested(vcpu);
 	return ret;

base-commit: d21eef2084a9af87ac2a783bc7c2b175ba114e4e
-- 
2.56.1.703.gf848ed807c-goog

