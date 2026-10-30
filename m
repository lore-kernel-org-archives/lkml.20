Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395649;
	b=geqU2nwEXRQZ6IxYOxXoOwCmYdFdklDjocxTPeiC8he8Q+/qQrEtgBwKI2JqkJxMjbab
	 a8muMSZsCSxamTQ8yuqt+qwZgru5MWwPgSQWqthXlZ/QIOavJT6H1o6gTWwXXAw93+CBY
	 mgnTy5SQBEegOO3S97FpF13UG4Hp8hvY/0QzKHF5BuBtkYpXZUPIDWnBhgaGstinnmq5V
	 vvjIAZrTW40EwcsJjt3L0jhNj6gE+QBJnGjE0C30zzt+HZmh0SGZi2hF9YUfc9QqtDfA7
	 fu6xZluCwE2eeQ9r1oX2tStPblEazP8TxIfRqRemcFde2vEPKG5GGZof8YLcpXGzl6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=160XY00CCxZnuh51+mMuELrjVFZ7rrmLUQxaFTbVPWk=;
	b=2rY+t2Pc6r8eKVMAQALETXapcZyjB/MM17TiKeoz+ke7lYhpM+wKwVcDhy7WEaLegyZh
	 hgDlMExcgnQ7mS6rLBU5nkdwSKxVy6Zp0ni/Ym4RJyKVjDnyuklMSUgNCkViRlYiQug73
	 xF9xLefb6oArQWSsdmUF9i6wYDKjoW8y9C9CZNiE952ELQo8KhGAWZVAFdLHNknnh1aPo
	 ICzrVmf+QEqCuXkqUW9SYAqskHVoqnkb2+iUb66jfh4gkENTTeTNTd5SnOYrFL9P6tVSW
	 WbU9yB1gxprp4wyQ1zJ1LgxCEtZ4NgF9EVWPVzK7SwH2jRH6A1bnjk6OLHkrvk8rNoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Cqco0/4q";
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDF2606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CDF2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Cqco0/4q
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so1623978a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793395649; x=1794000449; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=160XY00CCxZnuh51+mMuELrjVFZ7rrmLUQxaFTbVPWk=;
        b=Cqco0/4qYas9nZEOJqjA2xWoRyomkOUuWX+V1ebVFQefIbEP3MxAjhlwmD4hyLUVcH
         I/uTb5XBz2uveSB17b38BY7HXu7MLKq3HVYlCVJUJ/Xqw8M3fmdOdln7vYIlOfkURMa5
         n8WNVBaBCzNbpbMgeD9u9C/blNvKOVDqJWd5YrqFIJ/50xu1ymwl8TVX4jz+p+m5hEtt
         j2UtCfHrNSt7K89ijkqyALF76FgOE/L3QFa1OIq1pxw7/JnHSar4wPffEX39vvHuVcQp
         2BcjVuvloCQCL+Ab4OJ86NV8l97pCZCshjGIXCD+3odTVGzgms7ETvfZU6UJN1qQmVQ2
         lRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395649; x=1794000449;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=160XY00CCxZnuh51+mMuELrjVFZ7rrmLUQxaFTbVPWk=;
        b=aFqYgv18h33p57jx/DKfJJBM85DsSWCW4peNMixIwSII+7FTcNlNzvOP9An6jKVDDK
         px1WgoZcQt4MxFjD/F5WTnIa8SHqCujxRzBiBZ0YFuFjE4OG90U7JDnwIPcRKndZKQMJ
         jhzUy8cJwcrBFqnUWpT4OKfYvpQro2CZla0R6GgV9Zmj5E6HpMNoimP5btAow/fX8hYO
         RMuzhYBicKBHoGo9MsWqsUYAcAvSjVF5Aluci3BGPcBU6GXV7DMJ5a6p2oVXU5t0iiap
         4QVbW9+tovLlLKbGOc5zux2uQ5sUBysx1jZCXatp9rNqJN+Kwb6BWCVB+X1dY94hmDHk
         84Gg==
X-Forwarded-Encrypted: i=1; AKwUvByhdSBpAWbte+a4LbTd73isyfUkK5VopM1F5g7vPfGYws06rYZ9ZR/SJHIjSAdwa2ssx/W+z5wV4B3p4U4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIh3jAnQNi/yHGTJQnDYFceb3x2g1dARfWslGNuldwjw42J3002
	26I34oDmkK8kb4W16VFxwi3wPdTE7OjDgRt+hG68WG6hSUe/mSufNfCB1O+ZT04735MbSZt9b5m
	EQG2ojw==
X-Received: from pjor2.prod.google.com ([2002:a17:90a:9402:b0:3a6:d839:55d1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:534b:b0:3ab:4f1:4f76
 with SMTP id 98e67ed59e1d1-3ae898127f4mr2812213a91.24.1793395648837; Fri, 30
 Oct 2026 14:27:28 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 30 Oct 2026 14:27:19 -0700
In-Reply-To: <20261030212721.2606393-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030212721.2606393-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261030212721.2606393-6-seanjc@google.com>
Subject: [PATCH v3 5/7] KVM: x86: Recompute EFER.LMA instead of inheriting the
 current value on EFER writes
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Recompute EFER.LMA on bare writes to EFER (via WRMSR or KVM_SET_MSRS)
instead of carrying forward the current EFER.LMA.  While it _should_ be
impossible for EFER.LMA to end up in an inconsistent state on such a write,
KVM has had a rash of exactly those bugs, mostly because SVM is quite lax
when it comes to consistenty checks, which in turn bleeds into KVM's nested
SVM implementation.  Retaining the existing EFER is also rather confusing,
as understanding why keeping EFER.LMA is correct requires a lot of a priori
knowledge of both x86-64 and KVM.

Keep the core concept of the existing logic as a sanity check: WARN if the
computed EFER.LMA would be toggled, because as described above, that
_should_ be impossible.  Don't return an error if the sanity check fails,
e.g. don't inject a #GP, as setting EFER.LMA based on the current state
provides architecturally consistency.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/msrs.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/msrs.c b/arch/x86/kvm/msrs.c
index c3cb1575fe66..c55402970a34 100644
--- a/arch/x86/kvm/msrs.c
+++ b/arch/x86/kvm/msrs.c
@@ -638,8 +638,17 @@ static int set_efer(struct kvm_vcpu *vcpu, u64 efer)
 	    (vcpu->arch.efer & EFER_SVME) && !(efer & EFER_SVME))
 		return 1;
 
-	efer &= ~EFER_LMA;
-	efer |= vcpu->arch.efer & EFER_LMA;
+	if ((efer & EFER_LME) && is_paging(vcpu) && is_pae(vcpu))
+		efer |= EFER_LMA;
+	else
+		efer &= ~EFER_LMA;
+
+	/*
+	 * Toggling EFER.LMA on a bare write to EFER should be impossible, as
+	 * it means KVM allowed architecturally invalid state at some point in
+	 * the past, i.e. allowed EFER.LMA=1 && (!CR0.PG || !CR4.PAE).
+	 */
+	WARN_ON_ONCE((efer & EFER_LMA) != (vcpu->arch.efer & EFER_LMA));
 
 	r = kvm_x86_call(set_efer)(vcpu, efer);
 	if (r) {
-- 
2.56.0.385.gac671c819a-goog

