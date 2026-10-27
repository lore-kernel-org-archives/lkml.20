Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793141365;
	b=2vC8rx9Kw3mSWyGWlOSCXYqG6HRHWxRus0wMWlgCGkLQl5hNs9dfxb9ING6Z3iL6XFtf
	 CFyFMPT/tcmejdpW3TJo45k+Tpvgt2k8U4hE41pQL3V0a9d/qjDu3NzIdK/YNCB7DOF67
	 Xb1VjQfqS0N6FsxxS1jNUlo4QTgS32dpspMWfKSKnjfsHHHQ98M0UcdsEz0l/Bc/NYjze
	 Vwg+/BEHVbzaKu6F6OONsm+mC7S3syC755S2brgU4wC0bE1rXcasFwGOror0KS+vRJW6z
	 KOzAKID2ChSB+YCMsl4ww/3v7YN3yTwIq6lyQRrEldLdY5N5+M8uFp2uR1VLoA50C/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793141365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=aSoNBqYVK3VlZ3H2DD3fucLQYFYLFibv+ua6L8aCHtM=;
	b=k98ZoXqvw1a7h6qspnAze//bDsj/QryW6SbtD8VR82TxrpmyfN0J0rfdzsurnqBUvyFy
	 tXrYJMVBp41WTvciirwb9EWXKynnIJ2aWcUjIitUnNo4mqRUtmvfPago90Ef+4ItOgIHp
	 vjRoM2pmxJR19DIkmdsEuVJ6qEi/u7x0DgI7xUmnDl6rw3NJ/EKuiNdhZPyytiNvoESaW
	 CrtAv6rp3f3WOFzmco8EK13cLmcgABCSTx7gCI7r1B2KjRHnbz5805zcWmzDxKC02DfLk
	 2YFEuCW9yO85aiArmKXohS9RTPcUfYL1jA4N10BLInQwidhPRP1oBYhaSGeQ+BY/7tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qHxIIYfa;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1340606A326
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1340606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qHxIIYfa
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e941532594so3000965ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793141364; x=1793746164; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aSoNBqYVK3VlZ3H2DD3fucLQYFYLFibv+ua6L8aCHtM=;
        b=qHxIIYfaNIi2RnJ1zuauvL7UYv09CVn4qtH8jbor3+cYUi4WwQy070dmq59iVNCV0d
         mjG9ShfbsI9nzFaSyIoD+yd/k2e+KHsYWl/kuD1GlOqKZ3cg64HdadgGENF5SgCgExQf
         Vr00U7D1qfPisfn1pbDbluHXT//dA0nr47lzjAmn3VNxNmH+Es0LTyC0qPFWuSihWFgI
         Vl7bZodNVccSAyehxipg2PgkrdvtV+IE8LOT3FFGnLP2lewGuwscnkk7BffmQ9z4wA69
         GwUxVaPYuF/3HCawUIgb5oPO89VsglyowShvT9FbDpdJRbYYbKLNWLgeJIbaGmxbmBPi
         oNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793141364; x=1793746164;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aSoNBqYVK3VlZ3H2DD3fucLQYFYLFibv+ua6L8aCHtM=;
        b=qqyCppbO6r9I6Wlj/tHm9K/R1mchRTBph9GLKp4J21n0aH2XtzEOz/F0/cT7IOZThQ
         aZ5y/qieU5bTEFQqldzKruXdTc9Ar91y20osPGvpYYQtgu1U2FNsxPMYLLIUCv66RFVZ
         Q5j6wN9WOMf3x6e/P4jVgAOBTB75eMmpNnVdgH7813AWDtp0x/ajJEg1G4evXRpgN/Z4
         ubKkRjysNQ/9CxnJ8oZMTPR+FfIWulfSTAwN2+F58yVIaJu+58TJt9ubI3Ll2PFFB9/a
         SSGAyc+Oisx6sKa6sFuvZiTbGroRl9jYjnJCK4qDhjGxIn8Wkoyknk4eioYUr1ZlaNNV
         LjSA==
X-Forwarded-Encrypted: i=1; AKwUvBy6qXgovyJgRQ+QVRMq3Vby3XWk2i/LBdz0AJ/mJj/tSX+SsXexE/7I6zN718AjG6jWDjldjW3un/i10/g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVa6iFUmpyT2ofjbQWpoVA85J5bEj7ryJQVLkfXbtwOm0i0Cia
	+BE/oCRgkz2a4xIX3Iv1FCJJW9RdkFGSpf9mNqgn4dpwpzxe/934hgu35GxkHEw+rmnhAlKlW1x
	rtSVtYg==
X-Received: from plld11.prod.google.com ([2002:a17:902:728b:b0:2e9:5b68:4b7d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d987:b0:2e9:3dd0:c8d
 with SMTP id d9443c01a7336-2eb0051d0damr6542845ad.14.1793141364326; Tue, 27
 Oct 2026 15:49:24 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 27 Oct 2026 15:49:12 -0700
In-Reply-To: <20261027224914.1574319-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261027224914.1574319-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261027224914.1574319-5-seanjc@google.com>
Subject: [PATCH v2 4/6] KVM: x86: Recompute EFER.LMA instead of inheriting the
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
2.56.0.307.g5fe7bd680c-goog

